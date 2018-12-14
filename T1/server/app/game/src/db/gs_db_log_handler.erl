%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 十二月 2018 15:35
%%%-------------------------------------------------------------------
-module(gs_db_log_handler).
-author("Administrator").

-include("logger.hrl").
%% API
-export([handler/4]).
handler(dblog, Msg, _FromPid, PoolId) ->
    common_db_log_handler:log(Msg, PoolId);
handler(dblog_month, {YearMoth, Msg}, _FromPid, PoolId) ->
    common_db_log_handler:log_month(Msg, PoolId, YearMoth);
handler(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("undeal msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.