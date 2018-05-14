%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 十二月 2017 17:12
%%%-------------------------------------------------------------------

-module(background_gc).
-include("logger.hrl").

-behaviour(gen_server2).

-export([start_link/0, run/0]).
-export([gc/0]). %% For run_interval only

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
    terminate/2, code_change/3]).

-define(MAX_RATIO, 0.01).
-define(MAX_INTERVAL, 240000).
%%每30分钟GC一次
-define(IDEAL_INTERVAL, 10 * 60 * 1000).

-record(state, {last_interval}).

%%----------------------------------------------------------------------------

-spec start_link() -> {'ok', pid()} | {'error', any()}.
-spec run() -> 'ok'.
-spec gc() -> 'ok'.

%%----------------------------------------------------------------------------

start_link() -> gen_server2:start_link({local, ?MODULE}, ?MODULE, [],
    [{timeout, infinity}]).

run() -> gen_server2:cast(?MODULE, run).

%%----------------------------------------------------------------------------

init([]) ->
    {ok, interval_gc(#state{last_interval = ?IDEAL_INTERVAL})}.

handle_call(Msg, _From, State) ->
    {stop, {unexpected_call, Msg}, {unexpected_call, Msg}, State}.

handle_cast(run, State) -> gc(), {noreply, State};

handle_cast(Msg, State) -> {stop, {unexpected_cast, Msg}, State}.

handle_info(run, State) -> {noreply, interval_gc(State)};

handle_info(Msg, State) -> {stop, {unexpected_info, Msg}, State}.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

terminate(_Reason, State) -> State.

%%----------------------------------------------------------------------------

interval_gc(State = #state{last_interval = LastInterval}) ->
    {ok, Micros, Interval} = misc:interval_operation(
        {?MODULE, gc, []},
        ?MAX_RATIO, ?MAX_INTERVAL, ?IDEAL_INTERVAL, LastInterval),
    erlang:send_after(Interval, self(), run),
    ?WARN("full gc use time[~p] ms",[Micros/1000]),
    State#state{last_interval = Interval}.

gc() ->

    [garbage_collect(P) || P <- processes(),
        {status, waiting} == process_info(P, status)],
    %% since we will never be waiting...
    garbage_collect(),
    ok.
