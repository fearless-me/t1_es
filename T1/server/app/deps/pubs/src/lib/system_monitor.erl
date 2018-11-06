%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% @todo 针对系统日志做缓存优化，防止过载
%%% @end
%%% Created : 31. 七月 2018 15:16
%%%-------------------------------------------------------------------
-module(system_monitor).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").


-define(SYSTEM_MONITOR_LOGGER, monitor_logger).
%%
-define(LARGE_HEAP,             100*1024*1024).
-define(LARGE_HEAP_GUARD_MIN,   1*1024*1024).
%% 
-define(LONG_GC,                500).
-define(LONG_SCHEDULE,          500).
%%
-define(REPORT_CACHE_ETS, system_monitor_ets__).
-record(monitor_info,{pid_or_port, event, info, start, latest, count=0, need_flush=true}).

%% API
-export([set_large_heap/1, clear/0]).
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

set_large_heap(Bytes) ->
    WordSize = erlang:system_info(wordsize),
    SetsWord = Bytes div WordSize,
    MiniWord = ?LARGE_HEAP_GUARD_MIN div WordSize,
    case MiniWord > SetsWord of
        true -> skip;
        _ -> ?MODULE ! {set_large_heap, SetsWord}
    end,
    ok.

clear() ->
    erlang:system_monitor(?MODULE, undefined).

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
    ets:new(?REPORT_CACHE_ETS, [protected, named_table, {keypos, #monitor_info.pid_or_port}, ?ETS_RC]),
    WordSize = erlang:system_info(wordsize),
    {ok, Pid} = fastlog:start_link(?SYSTEM_MONITOR_LOGGER, "monitor.sys"),
    true = fastlog:make_init_log(?SYSTEM_MONITOR_LOGGER, "monitor.sys"),
    erlang:system_monitor(self(),
        [
            busy_port,
            busy_dist_port,
            {long_gc, ?LONG_GC},
            {long_schedule, ?LONG_SCHEDULE},
            {large_heap, ?LARGE_HEAP div WordSize}
        ]
    ),
    {ok, Pid}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
%% {monitor, GcPid, long_gc, Info} is sent to MonitorPid.
%% GcPid is the pid that was garbage collected.
%% Info is a list of two-element tuples describing the result of the garbage collection
do_handle_info({monitor, GcPid, long_gc, Info}, Logger) ->
    cache_monitor(GcPid, long_gc, Info),
    {noreply, Logger};
%% {monitor, PidOrPort, long_schedule, Info} is sent to MonitorPid.
%% PidOrPort is the process or port that was running.
%% Info is a list of two-element tuples describing the event.
do_handle_info({monitor, PidOrPort, long_schedule, Info} , Logger) ->
    cache_monitor(PidOrPort, long_schedule, Info),
    {noreply, Logger};
%% {monitor, GcPid, large_heap, Info} is sent to MonitorPid.
%% GcPid and Info are the same as for long_gc earlier,
%% except that the tuple tagged with timeout is not present.
do_handle_info({monitor, GcPid, large_heap, Info} , Logger) ->
    cache_monitor(GcPid, large_heap, Info),
    {noreply, Logger};
%% {monitor, SusPid, busy_port, Port} is sent to MonitorPid.
%% SusPid is the pid that got suspended when sending to Port.
do_handle_info({monitor, SusPid, busy_port, Port} , Logger) ->
    cache_monitor(Port, busy_port, SusPid),
    {noreply, Logger};
%% {monitor, SusPid, busy_dist_port, Port} is sent to MonitorPid.
%% SusPid is the pid that got suspended when sending through the inter-node communication port Port.
do_handle_info({monitor, SusPid, busy_dist_port, Port} , Logger) ->
    cache_monitor(Port, busy_dist_port, SusPid),
    {noreply, Logger};
%%--------------------------------------------------------------------
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
remove_monitor_set([{Key, _X} | Left], Key, Acc) ->
    lists:append(Left, Acc);
remove_monitor_set([Key | Left], Key, Acc) ->
    [Left | Acc];
remove_monitor_set([Conf | Left], Key, Acc) ->
    remove_monitor_set(Left, Key, [Conf | Acc]).

%%--------------------------------------------------------------------
cache_monitor(PidOrPort, Event, Info)->
    Now = misc_time:localtime_str(),
    case ets:lookup(?REPORT_CACHE_ETS, PidOrPort) of
        [] ->
            ets:insert
            (
                ?REPORT_CACHE_ETS,
                #monitor_info{
                    pid_or_port = PidOrPort,
                    event = Event,
                    info = Info,
                    start = Now,
                    latest = Now,
                    count = 1
                }
            );
        [Rec] when (not is_number(Info) ); Rec#monitor_info.info < Info  ->
            ets:update_element
            (
                ?REPORT_CACHE_ETS, PidOrPort,
                [
                    {#monitor_info.need_flush, true},
                    {#monitor_info.info, Info},
                    {#monitor_info.latest, Now},
                    {#monitor_info.count, Rec#monitor_info.count+1}
                ]
            );
        [Rec] ->
            ets:update_element
            (
                ?REPORT_CACHE_ETS, PidOrPort,
                [
                    {#monitor_info.need_flush, true},
                    {#monitor_info.latest, Now},
                    {#monitor_info.count, Rec#monitor_info.count+1}
                ]
            )
    end,
    ok.



