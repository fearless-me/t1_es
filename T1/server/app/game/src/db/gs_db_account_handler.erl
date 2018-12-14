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

-define(DB_QUERY_TIMEOUT, 15 * 1000).

%% API
-export([handler/4]).

%%-------------------------------------------------------------------
handler(account_login, Req, _FromPid, PoolId) ->
    ?DEBUG("account_login ~p pool ~p", [Req, PoolId]),
    #r_login_req{plat_name = PlatName, plat_account_name = PlatAccount, player_pid = ToPid} = Req,
    MergeAccount = gs_interface:merge_plat_acc_name(PlatName, PlatAccount),
    AccountCrc = gs_interface:plat_account_crc(PlatName, PlatAccount),

    try
        AccountList = i_select_account(PoolId, gs_db_sql:sql(load_account), [AccountCrc], PlatAccount, PlatName),
        Ack =
            case AccountList of
                [AccountInfo] ->
                    #r_login_ack{account_info = AccountInfo, error = 0};
                [] ->
                    NewAid = i_insert_account(PoolId, MergeAccount, AccountCrc, PlatAccount, PlatName),
                    NewAccountList = i_select_account(PoolId, gs_db_sql:sql(load_account_aid), [NewAid], PlatAccount, PlatName),
                    case NewAccountList of
                        [NewAccountInfo] ->
                            #r_login_ack{account_info = NewAccountInfo, error = 0};
                        _ ->
                            catch ?ERROR("create new account ~ts|~ts|~p|~p", [PlatName, PlatAccount, NewAid, NewAccountList]),
                            #r_login_ack{error = -1}
                    end
            end,

        ps:send(ToPid, login_ack, Ack)
    catch _:Error:_ ->
        catch ?ERROR("create new account exception ~ts|~ts|~p", [PlatName, PlatAccount, Error]),
        ps:send(ToPid, login_ack, #r_login_ack{error = -9999})
    end,
    ok;
handler(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.

%%-------------------------------------------------------------------
i_insert_account(PoolId, MergeAccount, AccountCrc, PlatAcc, PlatName) ->
    NewAid = uid_gen:acc_uid(),
    InsSql = gs_db_sql:sql(insert_acount),
    NowStr = misc_time:localtime_str(),
    Params = [NewAid, MergeAccount, AccountCrc, PlatAcc, PlatName, "", "", "", "", NowStr, misc_time:utc_seconds()],
    ResCreate = db:query(PoolId, InsSql, Params),
    check_res(ResCreate, InsSql, Params),
    NewAid.

i_select_account(PoolId, Sql, Params, PlatAcc, PlatName) ->
    Res = db:query(PoolId, Sql, Params, ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, Params),
    case db:as_record(Res, p_account, record_info(fields, p_account)) of
        AccountList when is_list(AccountList) ->
            lists:filter(
                fun(#p_account{plat_name = PN1, plat_account = PA1}) ->
                    erlang:binary_to_list(PN1) =:= PlatName andalso erlang:binary_to_list(PA1) =:= PlatAcc
                end, AccountList);
        _ -> []
    end.


%%-------------------------------------------------------------------
check_res(Res, Sql, Params) -> check_res_1(db:succeed(Res), Sql, Res, Params).

check_res_1(true, Sql, _Res, _Params) -> ?DEBUG("[success] ~ts", [Sql]);
check_res_1(_, Sql, Res, Params) -> ?ERROR("ret: ~p, sql: ~ts, params: ~p", [Res, Sql, Params]).
