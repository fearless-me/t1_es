%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 五月 2018 14:34
%%%-------------------------------------------------------------------
-module(gs_db_data_handler).
-author("mawenhong").

-include("logger.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("db_record.hrl").

-define(DB_QUERY_TIMEOUT, 15*1000).

%% API
-export([handler/4]).

%%-------------------------------------------------------------------
handler(load_all_role_info, Sid, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_all_role_info_cnt),
    Res = db:query(PoolId, Sql, [Sid], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, [Sid]),
    Load  = 100,
    Count = db:scalar(Res),
    SeqNo =
        case Count rem Load of
            0 when Count > Load -> Count div Load;
            _ -> (Count div Load) + 1
        end,

    lists:foreach(
        fun(Batch) ->
            Start = (Batch - 1) * Load,
            End   = Batch * Load,
            SqlLoad = gs_db_sql:sql(load_all_role_info),
            ResLoad = db:query(PoolId, SqlLoad, [Sid, Start, End], ?DB_QUERY_TIMEOUT*5),
            check_res(ResLoad, SqlLoad, [Sid, Start, End]),
            ResList0 = db:as_record(ResLoad, p_player, record_info(fields, p_player)),
            ResList1 = [ Player#p_player{name = binary_to_list(Player#p_player.name)} || Player <- ResList0],
            ps:send(FromPid, load_all_role_info_ack, ResList1)
        end, lists:seq(1, SeqNo)),

    ps:send(FromPid, load_all_role_info_ack_end),
    ok;
handler(load_player_list, AccId, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_player_list),
    Res = db:query(PoolId, Sql, [AccId], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, [AccId]),
    PL1 = db:as_record(Res, p_player, record_info(fields, p_player)),
    PL2 = lists:map(
        fun(#p_player{name = Name} = Player) ->
            Player#p_player{name = binary_to_list(Name)}
        end, PL1),
    ps:send(FromPid, load_player_list_ack, PL2),
    ok;
handler(load_player_data, {_Aid, Uid}, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_player),
    Res = db:query(PoolId, Sql, [Uid], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, [Uid]),
    [#p_player{name = Name} = Player] =
        db:as_record(Res, p_player, record_info(fields, p_player)),
    ps:send(FromPid, load_player_data_ack, Player#p_player{name = binary_to_list(Name)}),
    ok;
handler(create_player, {AccId, Req}, FromPid, PoolId) ->
    #r_create_player_req{
        sid = Sid, name = Name, camp = Camp, career = Career,
        race = Race, sex = Sex, head = Head, mid = Mid,
        x = X, y = Y
    } = Req,
    Uid = uid_gen:player_uid(),
    Sql = gs_db_sql:sql(insert_player),
    Params = [AccId, Uid, Sid, Name, 1, Sex, Camp, Race, Career, Head,
        Mid, 0, X, Y, Mid, 0, X, Y, misc_time:milli_seconds()],
    Res = db:query(PoolId, Sql, Params, ?DB_QUERY_TIMEOUT),

    check_res(Res, Sql, Params),
    ps:send(FromPid, create_player_ack,
        #r_create_player_ack{
            error = 0,
            uid = Uid, acc_id = AccId,
            name = Name, camp = Camp,
            career = Career, race = Race,
            sex = Sex, head = Head
        }
    ),
    ok;
handler(save_player, Player, _FromPid, PoolId) ->
    #m_cache_player_pub{
        uid = Uid, career = Career, level = Lv,
        mid = Mid, line = Line, pos = Pos,
        old_mid = OMid, old_line = OLine, old_pos = OPos
    } = Player,
    Sql = gs_db_sql:sql(save_player),
    Params = [Career, Lv, Mid, Line, vector3:x(Pos), vector3:z(Pos),
        OMid, OLine, vector3:x(OPos), vector3:z(OPos), misc_time:milli_seconds(), Uid],
    Res = db:query(PoolId, Sql, Params),
    check_res(Res, Sql, Params),
    ok;
handler(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("undeal msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.


%%-------------------------------------------------------------------
check_res(Res, Sql, Params) -> check_res_1(db:succeed(Res), Sql, Res, Params).

check_res_1(true, Sql, _Res, _Params) -> ?DEBUG("[success] ~ts", [Sql]);
check_res_1(_, Sql, Res, Params) -> ?ERROR("ret: ~p, sql: ~ts, params: ~p", [Res, Sql, Params]).