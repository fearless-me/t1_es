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
-include("player_ext_data.hrl").

-define(DB_QUERY_TIMEOUT, 15 * 1000).

%% API
-export([handler/4]).

%%-------------------------------------------------------------------
handler(load_all_role_info, Sid, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_all_role_info_cnt),
    Res = db:query(PoolId, Sql, [Sid], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, [Sid]),
    Load = 100,
    Count = db:scalar(Res),
    SeqNo =
        case Count rem Load of
            0 when Count > Load -> Count div Load;
            _ -> (Count div Load) + 1
        end,
    
    lists:foreach(
        fun(Batch) ->
            Start = (Batch - 1) * Load,
            End = Batch * Load,
            SqlLoad = gs_db_sql:sql(load_all_role_info),
            ResLoad = db:query(PoolId, SqlLoad, [Sid, Start, End], ?DB_QUERY_TIMEOUT * 5),
            check_res(ResLoad, SqlLoad, [Sid, Start, End]),
            ResList0 = db:as_record(ResLoad, p_player, record_info(fields, p_player)),
            ResList1 = [Player#p_player{name = binary_to_list(Player#p_player.name)} || Player <- ResList0, Player#p_player.delete_flag == 0],
            ps:send(FromPid, load_all_role_info_ack, ResList1)
        end, lists:seq(1, SeqNo)),
    
    ps:send(FromPid, load_all_role_info_ack_end),
    ok;
handler(load_player_list, AccId, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_player_list),
    Res = db:query(PoolId, Sql, [AccId], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, [AccId]),
    PL1 = db:as_record(Res, p_player, record_info(fields, p_player)),
    PL2 = [Player#p_player{name = binary_to_list(Player#p_player.name)} || Player <- PL1, Player#p_player.delete_flag == 0],
    ps:send(FromPid, load_player_list_ack, PL2),
    ok;
handler(load_player_data, {_Aid, Uid}, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_player),
    Res = db:query(PoolId, Sql, [Uid], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, [Uid]),
    [#p_player{name = Name, delete_flag = DeleteFlag} = Player] =
        db:as_record(Res, p_player, record_info(fields, p_player)),
    Data = case DeleteFlag of
               0 ->Player#p_player{name = binary_to_list(Name)};
               _ -> undefined
           end,
    ps:send(FromPid, load_player_data_ack, Data),
    ok;
handler(create_player, {AccId, Req}, FromPid, PoolId) ->
    #r_create_player_req
    {
        version = Version,
        sid = Sid, name = Name, camp = Camp, career = Career,
        race = Race, sex = Sex, head = Head, mid = Mid,
        x = X, y = Y, data = Data
    } = Req,
    Uid = uid_gen:player_uid(),
    Sql = gs_db_sql:sql(insert_player),
    Params = [AccId, Uid, Sid, Name, 1, Sex, Camp, Race, Career, Head,
        Mid, 0, X, Y, Mid, 0, X, Y, Data, Version],
    Res = db:query(PoolId, Sql, Params, ?DB_QUERY_TIMEOUT),
    
    check_res(Res, Sql, Params),
    ps:send(
        FromPid,
        create_player_ack,
        #r_create_player_ack
        {
            error = 0,
            uid = Uid, acc_id = AccId, name = Name, camp = Camp,
            race = Race, career = Career, sex = Sex, head = Head
        }
    ),
    ok;
handler(save_player, PlayerExt, _FromPid, PoolId) ->
    #p_player_save
    {
        % 版本信息
        version = Version,
        % 基础信息
        uid = Uid, race = Race, career = Career, level = Lv,
        map_id = Mid, line = Line, pos = Pos,
        old_map_id = OMid, old_line = OLine, old_pos = OPos,
        % 完整数据
        data = Data
    } = PlayerExt,
    Sql = gs_db_sql:sql(save_player),
    Params = [
        Race, Career, Lv,
        Mid, Line, vector3:x(Pos), vector3:z(Pos),
        OMid, OLine, vector3:x(OPos), vector3:z(OPos),
        Data, Version,
        Uid
    ],
    Res = db:query(PoolId, Sql, Params),
    check_res(Res, Sql, Params),
    ok;
handler(delete_player, Msg, FromPid, PoolId) ->
    #r_delete_player_req{aid = Aid, uid = Uid} = Msg,
    Sql = gs_db_sql:sql(delete_player),
    Params = [misc_time:utc_seconds(), Uid, Aid],
    Res = db:query(PoolId, Sql, Params),
    check_res(Res, Sql, Params),
    ps:send(FromPid, delete_player_ack, #r_delete_player_ack{uid = Uid, res = db:succeed(Res)}),
    ok;
handler(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.


%%-------------------------------------------------------------------
check_res(Res, Sql, Params) -> check_res_1(db:succeed(Res), Sql, Res, Params).

check_res_1(true, Sql, _Res, _Params) -> ?DEBUG("[success] ~ts", [Sql]);
check_res_1(_, Sql, Res, Params) -> ?ERROR("ret: ~p, sql: ~ts, params: ~p", [Res, Sql, Params]).