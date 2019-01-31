%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2019 16:13
%%%-------------------------------------------------------------------
-module(map_mgr_priv).
-author("Administrator").
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_common_rec.hrl").
-include("map_core.hrl").
-include("cfg_map.hrl").

-export([create_new_line/3]).
-export([try_to_select_line/5]).
-export([map_line_recover/1, map_owners/2, map_owner_type/1]).

%% API

%%-------------------------------------------------------------------
-spec map_owners(MapID :: integer(), CreatorUid :: integer()) ->
    {Type :: atom(), Param :: integer(), WaitList :: list()}.
map_owners(MapID, CreatorUid) ->
    Cfg = getCfg:getCfgByArgs(cfg_map, MapID),
    do_map_owners(Cfg, CreatorUid).

%%todo 要根据类型来返回不同的参数
do_map_owners(#mapCfg{type = ?MAP_TYPE_COPY} = Cfg, CreatorUid) ->
    {do_map_owner_type(Cfg), CreatorUid, [CreatorUid]};
do_map_owners(#mapCfg{type = ?MAP_TYPE_COPY}  = Cfg, CreatorUid) ->
    {do_map_owner_type(Cfg), CreatorUid, []};
do_map_owners( Cfg, _CreatorUid) ->
    {do_map_owner_type(Cfg), 0, []}.

map_owner_type(MapID) ->
    Cfg = getCfg:getCfgByArgs(cfg_map, MapID),
    do_map_owner_type(Cfg).

do_map_owner_type(#mapCfg{type = ?MAP_TYPE_COPY}) ->
    ?MAP_OWNER_SINGLE;
do_map_owner_type(#mapCfg{type = ?MAP_TYPE_COPY}) ->
    ?MAP_OWNER_TEAM;
do_map_owner_type(_) ->
    ?MAP_OWNER_ANY.


%%-------------------------------------------------------------------
%%
%% 一般情况切地指定一定要加入某个线路
%% 但是某个线路由于生命周期终止或者出错等等导致
%% 查询不到这个线路时怎么办
%% ?MAP_LINE_RECOVER_*
%%
map_line_recover(MapID) ->
    Cfg = getCfg:getCfgByArgs(cfg_map, MapID),
    do_map_line_recover(Cfg).

do_map_line_recover(#mapCfg{type = ?MAP_TYPE_NORMAL}) ->
    ?MAP_LINE_RECOVER_ANY_NEW;
do_map_line_recover(#mapCfg{type = ?MAP_TYPE_COPY}) ->
    ?MAP_LINE_RECOVER_ERR;
do_map_line_recover(#mapCfg{type = ?MAP_TYPE_GROUP}) ->
    ?MAP_LINE_RECOVER_ERR;
do_map_line_recover(#mapCfg{type = ?MAP_TYPE_ACTIVITY}) ->
    ?MAP_LINE_RECOVER_ERR.

%%-------------------------------------------------------------------
-define(MAP_COND(In, Now, DeadLine, Status),
    In >= 0,
    DeadLine > Now + ?DEAD_LINE_PROTECT,
    Status =:= ?MAP_RUNNING
).

%%-------------------------------------------------------------------
try_to_select_line(Ets, MapId, LineId, Force, Uid)->
    Type = map_mgr_priv:map_owner_type(MapId),
    try_1(Type, Ets, MapId, LineId, Force, Uid).


try_1(?MAP_OWNER_SINGLE, Ets, MapId, LineId, _Force, Uid) ->
    case select_single(Ets, LineId, Uid) of
        #m_map_line{} = Line -> Line;
        _ -> try_ack(Ets, MapId, Uid)
    end;
try_1(?MAP_OWNER_TEAM, Ets, MapId, LineId, Force, _Uid) ->
    Tid = 1111111,
    select_many(Ets, MapId, LineId, Force, ?MAP_OWNER_TEAM, Tid);
try_1(?MAP_OWNER_GUILD, Ets, MapId, LineId, Force, _Uid) ->
    Gid = 1111111,
    select_many(Ets, MapId, LineId, Force, ?MAP_OWNER_GUILD, Gid);
try_1(_, Ets, MapId, LineId, Force, Uid) ->
    case select_any(Ets, MapId, LineId, Force) of
        #m_map_line{} = Line -> Line;
        _ -> try_ack(Ets, MapId, Uid)
    end.

%% todo 这个后期要根据实际情况调整
try_ack(Ets, MapId, Uid) ->
    case catch map_mgr_priv:create_new_line(Ets, MapId, Uid) of
        #m_map_line{} = NewLine -> NewLine;
        Error ->
            ?ERROR("create map ~p new line error ~p", [MapId, Error]),
            #r_join_map_ack{map_id = MapId, error = ?MAP_CHANGE_CREATE_LINE_FAILED}
    end.

%%-------------------------------------------------------------------
select_single(Ets, LineId, Uid) ->
    Now = misc_time:milli_seconds(),
    MS = ets:fun2ms
    (
        fun(#m_map_line{
            line_id = CurLineId, in = In, dead_line = DeadLine, status = Status,
            owner_type = OwnType, owner_id = OwnerId
        } = T)
            when ?MAP_COND(In, Now, DeadLine, Status),
            (LineId == CurLineId orelse (OwnType == ?MAP_OWNER_SINGLE andalso OwnerId == Uid))
            -> T
        end
    ),
    case misc_ets:select(Ets, MS, 1) of
        {[Line1 | _], _Continue} -> Line1;
        EndOfTable -> EndOfTable
    end.

select_many(Ets, _MapId, LineId, Force, Type, TypeParam) ->
    Now = misc_time:milli_seconds(),
    MS = ets:fun2ms
    (
        fun(#m_map_line{
            line_id = CurLineId,
            limits = Limit, in = In, reserve = Reserve,
            dead_line = DeadLine, status = Status,
            owner_type = OwnType, owner_id = OwnerId
        } = T)
            when ?MAP_COND(In, Now, DeadLine, Status),
            (Limit > In orelse (Force andalso Limit + Reserve > In)),
            (CurLineId == LineId orelse (OwnType == Type andalso OwnerId == TypeParam))
            -> T
        end
    ),
    case misc_ets:select(Ets, MS, 1) of
        {[Line1 | _], _Continue} -> Line1;
        EndOfTable -> EndOfTable
    end.

select_any(Ets, MapId, 0, _Force) ->
    Now = misc_time:milli_seconds(),
    Recover = map_mgr_priv:map_line_recover(MapId),
    MS =
        ets:fun2ms
        (
            fun
                (
                    #m_map_line
                    {
                        limits = Limit, in = In,
                        dead_line = DeadLine, status = Status
                    } = T
                ) when ?MAP_COND(In, Now, DeadLine, Status),
                    Recover =:= ?MAP_LINE_RECOVER_ANY_NEW,
                    Limit > In -> T
            end
        ),
    case misc_ets:select(Ets, MS, 1) of
        {[Line1 | _], _Continue} -> Line1;
        EndOfTable -> EndOfTable
    end;
select_any(Ets, MapId, LineId, Force) ->
    Now = misc_time:milli_seconds(),
    case misc_ets:read(Ets, LineId) of
        [
            #m_map_line
            {
                limits = Limit, in = In, reserve = Reserve,
                dead_line = DeadLine, status = Status
            } = T
        ] when ?MAP_COND(In, Now, DeadLine, Status),
            (Limit > In orelse (Force andalso Limit + Reserve > In))
            -> T;
        _ -> select_any(Ets, MapId, 0, Force)
    end.


%%--------------------------------------------------------------------
create_new_line(MgrEts, MapID, CreatorUid) ->
    %% @todo 此处要根据地图类型的不同来采取不同的策略
    %% 比如副本地图不用做任何优化
    %% 但是长时间存在的地图必须要调整内存相关属性，减少GC   1
    LineID = next_line_id(),
    {OwnerType, OwnerParam, WaitList} = map_mgr_priv:map_owners(MapID, CreatorUid),
    CreateParamRec = #r_map_create_params{
        map_id = MapID, line_id = LineID, mgr_ets = MgrEts, mgr_pid = self(),
        creator = CreatorUid, owner_type = OwnerType, owner_params = OwnerParam, wait_list = WaitList
    },

    {ok, Pid} = map_sup:start_child(CreateParamRec),
    [Line] = misc_ets:read(MgrEts, LineID),
    catch ?WARN("map_~p_~p ~p start, mgr ets ~p, creator ~p", [MapID, LineID, Pid, MgrEts, CreatorUid]),
    Line.


next_line_id() ->
    LineID =
        case get('LINE_ID') of
            undefined -> 1;
            V -> V + 1
        end,
    put('LINE_ID', LineID),
    LineID.