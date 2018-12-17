%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十二月 2018 16:39
%%%-------------------------------------------------------------------
-module(cs_db_log_handler).
-author("Administrator").

-include("logger.hrl").
%% API
-export([handler/4]).
handler(dblog, Msg, _FromPid, PoolId) ->
    common_db_log_handler:log(Msg, PoolId);
handler(dblog_month, {YearMoth, Msg}, _FromPid, PoolId) ->
    common_db_log_handler:log_month(Msg, PoolId, YearMoth);
handler(dblog_month_check, {Table, YearMonthList}, FromPid, PoolId) ->
    Res = common_db_log_handler:check(PoolId, Table, YearMonthList),
    ps:send(FromPid, {dblog_month_check_ack,Table, Res});
handler(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.