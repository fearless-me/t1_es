%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 九月 2018 10:00
%%%-------------------------------------------------------------------
-module(gs_db_account_handler).
-author("mawenhong").

-include("logger.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("db_record.hrl").

-define(DB_QUERY_TIMEOUT, 15*1000).

%% API
-export([handler/4]).

%%-------------------------------------------------------------------
handler(account_login, Req, _FromPid, PoolId) ->
    ?DEBUG("account_login ~p pool ~p",[Req, PoolId]),
    #r_login_req{plat_name = PN, plat_account_name = PA, player_pid = ToPid} = Req,
    MergeAccount = gs_interface:merge_plat_acc_name(PN, PA),
    AccountCrc = gs_interface:plat_account_crc(PN, PA),
    Sql = gs_db_sql:sql(load_acount),
    Res = db:query(PoolId, Sql, [AccountCrc], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, [AccountCrc]),

    AccountList = db:as_record(Res, p_account, record_info(fields, p_account)),
    Info =
        case AccountList of
            [] ->
                NewAid = uid_gen:acc_uid(),
                InsSql = gs_db_sql:sql(insert_acount),
                NowStr = misc_time:localtime_str(),
%% aid,account,account_crc, plat_account, plat_name, device, imei, idfa, mac, create_time, version_hash_code
                Params = [NewAid, MergeAccount, AccountCrc, PA, PN, "","","","",NowStr, misc_time:utc_seconds()],
                ResCreate =  db:query(PoolId, InsSql, Params),
                check_res(ResCreate, InsSql, Params),
                Res11 = db:query(PoolId, Sql, [AccountCrc], ?DB_QUERY_TIMEOUT),
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
handler(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("undeal msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.


%%-------------------------------------------------------------------
check_res(Res, Sql, Params) -> check_res_1(db:succeed(Res), Sql, Res, Params).

check_res_1(true, Sql, _Res, _Params) -> ?DEBUG("[success] ~ts", [Sql]);
check_res_1(_, Sql, Res, Params) -> ?ERROR("ret: ~p, sql: ~ts, params: ~p", [Res, Sql, Params]).
