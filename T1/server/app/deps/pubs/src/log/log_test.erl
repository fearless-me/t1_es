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

%% API
-export([
    log_/2
]).

log_(Client, LogNum) ->
    fastlog:start_link("dbs"),
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
        [Client, TotalLog, DiffMs, TotalLog / DiffMs * 1000 ]),
    ok.

loop(0)->
    ok;
loop(N)->
    receive
        over ->
            loop(N - 1)
    end.

do1(0, Pid) ->
    Pid ! over;
do1(X, Pid) ->
    fastlog:debug("xxxxxxxxxxxxxxxxxxxxxasdfadsfaasf我是中国人asdfadfadafd",[]),
    fastlog:debug("~w,~p,~p,~p,~ts",
        [misc:stacktraceE(),rand:uniform(), ?MODULE, ?LINE, "hello"]),
    fastlog:info("~w,~p,~p,~p,~ts",
        [misc:stacktraceE(),rand:uniform(), ?MODULE, ?LINE, "hello"]),
    fastlog:warn("~w,~p,~p,~p,~ts",
        [misc:stacktraceE(),rand:uniform(), ?MODULE, ?LINE, "hello"]),
    fastlog:error("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", []),
    fastlog:error("~w,~p,~p,~p,~ts",
        [misc:stacktraceE(),rand:uniform(), ?MODULE, ?LINE, "hellosdafdas"]),
    fastlog:fatal("~w,~p,~p,~p,~ts",
        [misc:stacktraceE(),rand:uniform(), ?MODULE, ?LINE, "hello"]),
    do1(X - 1, Pid).
