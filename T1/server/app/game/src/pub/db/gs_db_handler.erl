%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 五月 2018 14:34
%%%-------------------------------------------------------------------
-module(gs_db_handler).
-author("mawenhong").

-include("logger.hrl").
-include("mem_record.hrl").
-include("common_record.hrl").
-include("db_record.hrl").


%% API
-export([handler/4]).

%%-------------------------------------------------------------------
handler(serv_start, Sid, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_serv_start),
    Res = db:query(PoolId, Sql, [Sid], infinity),
    check_res(Res, Sql, [Sid]),
    RunNo = db:scalar(Res),
    ps:send(FromPid, serv_start_ack, RunNo),
    ok;
handler(load_all_role_info, Sid, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_all_role_info_cnt),
    Res = db:query(PoolId, Sql, [Sid], infinity),
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
            ResLoad = db:query(PoolId, SqlLoad, [Sid, Start, End], infinity),
            check_res(ResLoad, SqlLoad, [Sid, Start, End]),
            ResList0 = db:as_record(ResLoad, p_player, record_info(fields, p_player)),
            ResList1 = [ Player#p_player{name = binary_to_list(Player#p_player.name)} || Player <- ResList0],
            ps:send(FromPid, load_all_role_info_ack, ResList1)
        end, lists:seq(1, SeqNo)),

    ps:send(FromPid, load_all_role_info_ack_end),
    ok;
handler(account_login, Req, _FromPid, PoolId) ->
    ?DEBUG("account_login ~p pool ~p",[Req, PoolId]),
    #r_login_req{plat_name = PN, plat_account_name = PA, player_pid = ToPid} = Req,
    MergeAccount = gs_interface:merge_plat_acc_name(PN, PA),
    AccountCrc = gs_interface:plat_account_crc(PN, PA),
    Sql = gs_db_sql:sql(load_acount),
    Res = db:query(PoolId, Sql, [AccountCrc], infinity),
    check_res(Res, Sql, [AccountCrc]),

    AccountList = db:as_record(Res, p_account, record_info(fields, p_account)),
    Info =
    case AccountList of
        [] ->
            NewAid = uid_gen:acc_uid(),
            InsSql = gs_db_sql:sql(insert_acount),
            NowStr = time:localtime_str(),
%% aid,account,account_crc, plat_account, plat_name, device, imei, idfa, mac, create_time, version_hash_code
            Params = [NewAid, MergeAccount, AccountCrc, PA, PN, "","","","",NowStr, time:utc_seconds()],
            ResCreate =  db:query(PoolId, InsSql, Params),
            check_res(ResCreate, InsSql, Params),
            Res11 = db:query(PoolId, Sql, [AccountCrc], infinity),
            [AccountInfo] = db:as_record(Res11, p_account, record_info(fields, p_account)),
            AccountInfo;
        [AccountInfo] ->
            AccountInfo;
        List when is_list(List) ->
            [AccountInfo] =
                lists:filter(
                    fun(#p_account{plat_name = PN1, plat_account = PA1}) ->
                        PN1 =:= PN andalso PA1 =:= PA
                    end, AccountList),
            AccountInfo
    end,

    ps:send(ToPid, login_ack, #r_login_ack{account_info = Info}),
    ok;
handler(load_player_list, AccId, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_player_list),
    Res = db:query(PoolId, Sql, [AccId], infinity),
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
    Res = db:query(PoolId, Sql, [Uid], infinity),
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
        Mid, 0, X, Y, Mid, 0, X, Y, time:milli_seconds()],
    Res = db:query(PoolId, Sql, Params, infinity),

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
    #m_player_pub{
        uid = Uid, career = Career, level = Lv,
        mid = Mid, line = Line, pos = Pos,
        old_mid = OMid, old_line = OLine, old_pos = OPos
    } = Player,
    Sql = gs_db_sql:sql(save_player),
    Params = [Career, Lv, Mid, Line, vector3:x(Pos), vector3:z(Pos),
        OMid, OLine, vector3:x(OPos), vector3:z(OPos), time:milli_seconds(), Uid],
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