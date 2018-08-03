%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 七月 2018 15:16
%%%-------------------------------------------------------------------
-module(system_monitor).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").

-ifdef(RELEASE).
-define(LARGE_HEAP, 100*1024*1024).
-else.
-define(LARGE_HEAP, 150*1024*1024).
-endif.
-define(MIN_HEAP_SIZE, 1024*1024).
%% API

-export([set_large_heap/1]).
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

set_large_heap(Bytes) ->
    WordSize = erlang:system_info(wordsize),
    SetsWord = Bytes div WordSize,
    MiniWord = ?MIN_HEAP_SIZE div WordSize,
    case MiniWord > SetsWord of
        true -> skip;
        _ -> ?MODULE ! {set_large_heap, SetsWord}
    end,
    ok.

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================
%%
%%'busy_port' |
%%'busy_dist_port' |
%%{'long_gc', non_neg_integer()} |
%%{'long_schedule', non_neg_integer()} |
%%{'large_heap', non_neg_integer()}
mod_init(_Args) ->
     erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    WordSize = erlang:system_info(wordsize),
    {ok, Pid} = fastlog:start_link(monitor_logger, "monitor.sys"),
    erlang:system_monitor(self(),
        [
            busy_port,
            busy_dist_port,
            {long_gc, 500},
            {long_schedule, 500},
            {large_heap, ?LARGE_HEAP div WordSize}
        ]
    ),
    {ok, Pid}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({monitor, GcPid, long_gc, Info}, Logger) ->
    ?WARN_SINK(Logger, "long_gc ~p(~p)  ~w",
        [GcPid, misc:register_name(GcPid), Info]),
    {noreply, Logger};
do_handle_info({monitor, PidOrPort, long_schedule, Info} , Logger) ->
    ?WARN_SINK(Logger, "long_schedule ~p   ~w", [PidOrPort, Info]),
    {noreply, Logger};
do_handle_info({monitor, GcPid, large_heap, Info} , Logger) ->
    ?WARN_SINK(Logger, "large_heap ~p(~p)   ~w",
        [GcPid, misc:register_name(GcPid), Info]),
    {noreply, Logger};
do_handle_info({monitor, SusPid, busy_port, Port} , Logger) ->
    case  misc:register_name(SusPid) of
        user -> skip;
        Name -> ?WARN_SINK(Logger, "busy_port ~p(~p)  ~w", [SusPid, Name, Port])
    end,
    {noreply, Logger};
do_handle_info({monitor, SusPid, busy_dist_port, Port} , Logger) ->
    ?WARN_SINK(Logger, "busy_dist_port ~p(~p)  ~w",
        [SusPid, misc:register_name(SusPid), Port]),
    {noreply, Logger};
do_handle_info({set_large_heap, SetsWord}, State) ->
    {_MonitorPid,Old} = erlang:system_monitor(),
    New = remove_monitor_set(Old, large_heap, []),
    erlang:system_monitor(self(),[{large_heap, SetsWord} | New]),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.


%%--------------------------------------------------------------------
remove_monitor_set([], _Key, Acc) ->
    Acc;
remove_monitor_set([Key | Left], Key, Acc) ->
    [Left | Acc];
remove_monitor_set([{Key, _X} | Left], Key, Acc) ->
   lists:append(Left, Acc);
remove_monitor_set([Conf | Left], Key, Acc) ->
    remove_monitor_set(Left, Key, [Conf | Acc]).


