%% coding: latin-1
%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 一月 2018 10:18
%%%-------------------------------------------------------------------
-module(log_test).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([
    log_/2
]).

log_(Client, LogNum) ->
    fastlog_sink:start_link("dbs"),
%%    misc:ensure_all_applications_started(poolboy),
    NowMs = os:system_time(milli_seconds),
%%    poolboy:start( [{size, 10}, {max_overflow, 20}]),
    Self = self(),
    _L1 = lists:foldl(
        fun(_X, Acc) ->
            Pid = erlang:spawn(fun() -> catch do1(LogNum, Self) end),
            [Pid | Acc]
        end, [], lists:seq(1, Client)),
    
    loop(Client),
    DiffMs = os:system_time(milli_seconds) - NowMs,
    TotalLog = Client * LogNum * 4,
    io:format("~w clients, write ~w, time ~w, qps ~w ~n",
        [Client, TotalLog, DiffMs, TotalLog / DiffMs * 1000]),
    ok.

loop(0) ->
    ok;
loop(N) ->
    receive
        over ->
            loop(N - 1)
    end.

do1(0, Pid) ->
    Pid ! over;
do1(X, Pid) ->
    ?DEBUG("xxxxxxxxxxxxxxxxxxxxxasdfadsfaasf我是中国人asdfadfadafd", []),
    ?DEBUG("~p,~p,~p,~p,~ts",
        [misc:callstack(), rand:uniform(), ?MODULE, ?LINE, "hello"]),
    ?INFO("~p,~p,~p,~p,~ts",
        [misc:callstack(), rand:uniform(), ?MODULE, ?LINE, "hello"]),
    ?WARN("~p,~p,~p,~p,~ts",
        [misc:callstack(), rand:uniform(), ?MODULE, ?LINE, "hello"]),
    ?ERROR("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", []),
    ?ERROR("~p,~p,~p,~p,~ts",
        [misc:callstack(), rand:uniform(), ?MODULE, ?LINE, "hellosdafdas"]),
    ?FATAL("~p,~p,~p,~p,~ts",
        [misc:callstack(), rand:uniform(), ?MODULE, ?LINE, "hello"]),
    do1(X - 1, Pid).
