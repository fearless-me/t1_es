%% In practice Erlang shouldn't be allowed to grow to more than a half
%% of available memory. The pessimistic scenario is when the Erlang VM
%% has a single process that's consuming all memory. In such a case,
%% during garbage collection, Erlang tries to allocate a huge chunk of
%% continuous memory, which can result in a crash or heavy swapping.
%%
%% This module tries to warn Rabbit before such situations occur, so
%% that it has a higher chance to avoid running out of memory.

-module(vms_monitor).

-behaviour(gen_server).
-include("logger.hrl").
-include("pub_def.hrl").

%%----------------------------------------------------------------------------

-ifdef(use_specs).

-type(vm_memory_high_watermark() :: (float() | {'absolute', integer() | string()})).
-spec(start_link/1 :: (float()) -> pid() | {'error', term()}).
-spec(start_link/3 :: (float(), fun ((any()) -> 'ok'),
    fun ((any()) -> 'ok')) -> pid() | {'error', term()}).
-spec(get_total_memory/0 :: () -> (non_neg_integer() | 'unknown')).
-spec(get_vm_limit/0 :: () -> non_neg_integer()).
-spec(get_check_interval/0 :: () -> non_neg_integer()).
-spec(set_check_interval/1 :: (non_neg_integer()) -> 'ok').
-spec(get_vm_memory_high_watermark/0 :: () -> vm_memory_high_watermark()).
-spec(set_vm_memory_high_watermark/1 :: (vm_memory_high_watermark()) -> 'ok').
-spec(get_memory_limit/0 :: () -> non_neg_integer()).

-endif.

%%----------------------------------------------------------------------------
-export([start_link/1, start_link/3]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
    terminate/2, code_change/3]).

-export([dump_all/0, dump_info/0, dump_monitor/0]).
-export([get_total_memory/0, get_vm_limit/0,
    get_check_interval/0, set_check_interval/1,
    get_vm_memory_high_watermark/0, set_vm_memory_high_watermark/1,
    get_memory_limit/0]).

-export([set_monitor_large_heap/1, clear/0]).
%% for tests
-export([parse_line_linux/1]).


%%----------------------------------------------------------------------------
%%----------------------------------------------------------------------------
-define(DEFAULT_MEMORY_CHECK_INTERVAL, 1000).
-define(ONE_MB, 1048576).
-define(TICK_LOG, 20 * 60 * 1000).

%% For an unknown OS, we assume that we have 1GB of memory. It'll be
%% wrong. Scale by vm_memory_high_watermark in configuration to get a
%% sensible value.
-define(MEMORY_SIZE_FOR_UNKNOWN_OS, 1073741824).
-define(DEFAULT_VM_MEMORY_HIGH_WATERMARK, 0.4).
%% setting: bytes -> words
%% return: All sizes are in words.
-define(LARGE_HEAP, 100 * 1024 * 1024).
-define(LARGE_HEAP_GUARD_MIN, 10 * 1024 * 1024).
%%  milliseconds
-define(LONG_GC, 500).
%% milliseconds
-define(LONG_SCHEDULE, 500).
-define(VM_MONITOR_LOGGER, monitor_logger).
-define(REPORT_CACHE_ETS, system_monitor_ets__).

%%
-record(state, {total_memory, memory_limit, memory_config_limit, timeout, timer, alarmed, alarm_funs}).
-record(monitor_info, {pid_or_port, name, event, info, start, latest, count = 0, need_flush = true}).


%%----------------------------------------------------------------------------
%% Public API
%%----------------------------------------------------------------------------
set_monitor_large_heap(Bytes) ->
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

get_total_memory() ->
    try
        get_total_memory(os:type())
    catch _:Error:ST ->
        ?WARN("Failed to get total system memory: ~n~p~n~p~n", [Error, ST]),
        unknown
    end.

get_vm_limit() -> get_vm_limit(os:type()).

get_check_interval() ->
    gen_server:call(?MODULE, get_check_interval, infinity).

set_check_interval(Fraction) ->
    gen_server:call(?MODULE, {set_check_interval, Fraction}, infinity).

get_vm_memory_high_watermark() ->
    gen_server:call(?MODULE, get_vm_memory_high_watermark, infinity).

set_vm_memory_high_watermark(Fraction) ->
    gen_server:call(?MODULE, {set_vm_memory_high_watermark, Fraction},
        infinity).

get_memory_limit() ->
    gen_server:call(?MODULE, get_memory_limit, infinity).

dump_all()->
    dump_info(),
    dump_monitor(),
    ok.

dump_info() ->
    PS_Count = erlang:system_info(process_count),
    RQ = erlang:statistics(run_queue),
    ProcessUsed = erlang:memory(processes_used),
    ProcessTotal = erlang:memory(processes),
    MemInfo = erlang:memory([system, atom, atom_used, binary, code, ets]),

    SystemMem = misc:format_memory_readable(misc:get_value(system, MemInfo)),
    AtomMem = misc:format_memory_readable(misc:get_value(atom, MemInfo)),
    AtomUsedMem = misc:format_memory_readable(misc:get_value(atom_used, MemInfo)),
    BinMem = misc:format_memory_readable(misc:get_value(binary, MemInfo)),
    CodeMem = misc:format_memory_readable(misc:get_value(code, MemInfo)),
    EtsMem = misc:format_memory_readable(misc:get_value(ets, MemInfo)),

    PSList = erlang:processes(),

    ProcessesProplist = [[{pid, erlang:pid_to_list(P)} | process_info_items(P)] || P <- PSList],

    Fun =
        fun(L, AccIn) ->
            try
                Pid = misc:get_value(pid, L),
                RegName = case misc:get_value(registered_name, L) of
                              [] ->
                                  "null";
                              V ->
                                  V
                          end,
                Red = misc:get_value(reductions, L),
                MQL = misc:get_value(message_queue_len, L),
                Mem = misc:get_value(memory, L),
                Heap = misc:get_value(heap_size, L),
                Stack = misc:get_value(stack_size, L),
                TotalHeap = misc:get_value(total_heap_size, L),
                CF = lists:sublist(misc:get_value(current_stacktrace, L), 4),

                [{Pid, RegName, Red, MQL, Mem, TotalHeap, Heap, Stack, cf_parse(CF, "")} | AccIn]
            catch _ : _ : _ ->
                AccIn
            end
        end,
    PPList = lists:foldl(Fun, [], ProcessesProplist),
    Str1 = log_sort_mqueue(PPList),
    Str2 = log_sort_memory(PPList),
    ?INFO_SINK(?VM_MONITOR_LOGGER, "~n~nProcess: total ~p(RQ:~p) using:~s(~s allocated) nodes:~p~n"
    "Memory: Sys ~s, Atom ~s/~s, Bin ~s, Code ~s, Ets ~s~n"
    "SortByMQueue:~n"
    "Row      Pid                 RegName                       Reductions     MQueue(*)      Memory           TotalHeap        Heap             Stack            current_stacktrace~n~ts"
    "SortByMem:~n"
    "Row      Pid                 RegName                       Reductions     MQueue         Memory(*)        TotalHeap        Heap             Stack            current_stacktrace~n~ts",
        [PS_Count, RQ,
            misc:format_memory_readable(ProcessUsed),
            misc:format_memory_readable(ProcessTotal), nodes(), SystemMem, AtomUsedMem, AtomMem, BinMem, CodeMem, EtsMem, Str1, Str2]),
    ok.

-define(MONITOR_FMT_HEAD, "~-18.w~-15.w~-22.w~-22.w~-10.w~w").
-define(MONITOR_FMT_BODY, "~-18.w~-15.w~-22.ts~-22.ts~-10.w~w").
dump_monitor() ->
    ?INFO_SINK(?VM_MONITOR_LOGGER, "system monitor total event ~p:",[ets:info(?REPORT_CACHE_ETS, size)]),
    ?INFO_SINK(?VM_MONITOR_LOGGER, ?MONITOR_FMT_HEAD,[pid_or_port, event, start, latest, count, info]),
    ets:foldl(
        fun(#monitor_info{pid_or_port = PP, event = E, info = I, start = S, latest = L, count = C}, _)->
            ?INFO_SINK(?VM_MONITOR_LOGGER, ?MONITOR_FMT_BODY,[PP, E, S, L, C, I])
        end, 0, ?REPORT_CACHE_ETS),

    ok.

%%----------------------------------------------------------------------------
%% gen_server callbacks
%%----------------------------------------------------------------------------
start_link(MemFraction) ->
    start_link(MemFraction,
        fun alarm_handler:set_alarm/1, fun alarm_handler:clear_alarm/1).

start_link(MemFraction, AlarmSet, AlarmClear) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE,
        [MemFraction, {AlarmSet, AlarmClear}], []).

init([MemFraction, AlarmFuns]) ->
    TRef = start_timer(?DEFAULT_MEMORY_CHECK_INTERVAL),
    start_portprogram(os:type()),

    ets:new(?REPORT_CACHE_ETS, [protected, named_table, {keypos, #monitor_info.pid_or_port}, ?ETS_RC]),
    WordSize = erlang:system_info(wordsize),
    erlang:system_monitor(self(),
        [
            busy_port,
            busy_dist_port,
            {long_gc, ?LONG_GC},
            {long_schedule, ?LONG_SCHEDULE},
            {large_heap, ?LARGE_HEAP div WordSize}
        ]
    ),
    
    true = fastlog:start_sink(?VM_MONITOR_LOGGER, "monitor.sys.vm"),
    State = #state{timeout = ?DEFAULT_MEMORY_CHECK_INTERVAL,
        timer = TRef,
        alarmed = false,
        alarm_funs = AlarmFuns
    },
    timer:send_interval(?TICK_LOG, tick),
    {ok, set_mem_limits(State, MemFraction)}.

handle_call(get_vm_memory_high_watermark, _From,
    #state{memory_config_limit = MemLimit} = State) ->
    {reply, MemLimit, State};

handle_call({set_vm_memory_high_watermark, MemLimit}, _From, State) ->
    {reply, ok, set_mem_limits(State, MemLimit)};

handle_call(get_check_interval, _From, State) ->
    {reply, State#state.timeout, State};

handle_call({set_check_interval, Timeout}, _From, State) ->
    {ok, cancel} = timer:cancel(State#state.timer),
    {reply, ok, State#state{timeout = Timeout, timer = start_timer(Timeout)}};

handle_call(get_memory_limit, _From, State) ->
    {reply, State#state.memory_limit, State};

handle_call(_Request, _From, State) ->
    {noreply, State}.

handle_cast(_Request, State) ->
    {noreply, State}.


%%--------------------------------------------------------------------
%% {monitor, GcPid, long_gc, Info} is sent to MonitorPid.
%% GcPid is the pid that was garbage collected.
%% Info is a list of two-element tuples describing the result of the garbage collection
handle_info({monitor, GcPid, long_gc, Info}, Logger) ->
    cache_monitor(GcPid, long_gc, Info),
    {noreply, Logger};
%% {monitor, PidOrPort, long_schedule, Info} is sent to MonitorPid.
%% PidOrPort is the process or port that was running.
%% Info is a list of two-element tuples describing the event.
handle_info({monitor, PidOrPort, long_schedule, Info}, Logger) ->
    cache_monitor(PidOrPort, long_schedule, Info),
    {noreply, Logger};
%% {monitor, GcPid, large_heap, Info} is sent to MonitorPid.
%% GcPid and Info are the same as for long_gc earlier,
%% except that the tuple tagged with timeout is not present.
handle_info({monitor, GcPid, large_heap, Info}, Logger) ->
    cache_monitor(GcPid, large_heap, Info),
    catch erlang:spawn(fun()-> erlang:garbage_collect(GcPid) end),
    {noreply, Logger};
%% {monitor, SusPid, busy_port, Port} is sent to MonitorPid.
%% SusPid is the pid that got suspended when sending to Port.
handle_info({monitor, SusPid, busy_port, Port}, Logger) ->
    cache_monitor(Port, busy_port, SusPid),
    {noreply, Logger};
%% {monitor, SusPid, busy_dist_port, Port} is sent to MonitorPid.
%% SusPid is the pid that got suspended when sending through the inter-node communication port Port.
handle_info({monitor, SusPid, busy_dist_port, Port}, Logger) ->
    cache_monitor(Port, busy_dist_port, SusPid),
    {noreply, Logger};
%%--------------------------------------------------------------------
handle_info({set_large_heap, SetsWord}, State) ->
    {_MonitorPid, Old} = erlang:system_monitor(),
    New = remove_monitor_set(Old, large_heap, []),
    erlang:system_monitor(self(), [{large_heap, SetsWord} | New]),
    {noreply, State};
%%--------------------------------------------------------------------
handle_info(update, State) ->
    {noreply, internal_update(State)};
handle_info(tick, State) ->
    Self = self(),
    erlang:spawn
    (
        fun() ->
            vms_monitor:dump_all(),
            garbage_collect(Self)
        end
    ),
    {noreply, State};
handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%----------------------------------------------------------------------------
%% Server Internals
%%----------------------------------------------------------------------------
start_portprogram({win32, _OSname}) ->
    {ok, _} = os_mon_sysinfo:start_link(),
    ok;
start_portprogram(_Any) -> ok.


set_mem_limits(State, MemLimit) ->
    case erlang:system_info(wordsize) of
        4 ->
            ?WARN(
                "You are using a 32-bit version of Erlang: you may run into "
                "memory address~n"
                "space exhaustion or statistic counters overflow.~n");
        _ ->
            ok
    end,
    TotalMemory =
        case get_total_memory() of
            unknown ->
                case State of
                    #state{total_memory = undefined,
                        memory_limit = undefined} ->
                        ?WARN(
                            "Unknown total memory size for your OS ~p. "
                            "Assuming memory size is ~pMB.~n",
                            [os:type(),
                                trunc(?MEMORY_SIZE_FOR_UNKNOWN_OS / ?ONE_MB)]);
                    _ ->
                        ok
                end,
                ?MEMORY_SIZE_FOR_UNKNOWN_OS;
            M -> M
        end,
    UsableMemory =
        case get_vm_limit() of
            Limit when Limit < TotalMemory ->
                ?WARN(
                    "Only ~pMB of ~pMB memory usable due to "
                    "limited address space.~n"
                    "Crashes due to memory exhaustion are possible",
                    [trunc(V / ?ONE_MB) || V <- [Limit, TotalMemory]]),
                Limit;
            _ ->
                TotalMemory
        end,
    MemLim = interpret_limit(parse_mem_limit(MemLimit), UsableMemory),
    ?INFO("Memory limit set to ~pMB of ~pMB total.",
        [trunc(MemLim / ?ONE_MB), trunc(TotalMemory / ?ONE_MB)]),
    internal_update(State#state{total_memory = TotalMemory,
        memory_limit = MemLim,
        memory_config_limit = MemLimit}).

interpret_limit({'absolute', MemLim}, UsableMemory) ->
    erlang:min(MemLim, UsableMemory);
interpret_limit(MemFraction, UsableMemory) ->
    trunc(MemFraction * UsableMemory).


parse_mem_limit({absolute, Limit}) ->
    case misc:parse_information_unit(Limit) of
        {ok, ParsedLimit} -> {absolute, ParsedLimit};
        {error, parse_error} ->
            ?ERROR("Unable to parse vm_memory_high_watermark value ~p", [Limit]),
            ?DEFAULT_VM_MEMORY_HIGH_WATERMARK
    end;
parse_mem_limit(Relative) when is_float(Relative), Relative < 1 ->
    Relative;
parse_mem_limit(_) ->
    ?DEFAULT_VM_MEMORY_HIGH_WATERMARK.


internal_update(State = #state{memory_limit = MemLimit,
    alarmed = Alarmed,
    alarm_funs = {AlarmSet, AlarmClear}}) ->
    MemUsed = erlang:memory(total),
    NewAlarmed = MemUsed > MemLimit,
    case {Alarmed, NewAlarmed} of
        {false, true} -> emit_update_info(set, MemUsed, MemLimit),
            AlarmSet({{resource_limit, memory, node()}, []});
        {true, false} -> emit_update_info(clear, MemUsed, MemLimit),
            AlarmClear({resource_limit, memory, node()});
        _ -> ok
    end,
    State#state{alarmed = NewAlarmed}.

emit_update_info(AlarmState, MemUsed, MemLimit) ->
    ?INFO_SINK(?VM_MONITOR_LOGGER,
        "vm_memory_high_watermark ~p. Memory used:~p allowed:~p~n",
        [AlarmState, MemUsed, MemLimit]).

start_timer(Timeout) ->
    {ok, TRef} = timer:send_interval(Timeout, update),
    TRef.

%% According to http://msdn.microsoft.com/en-us/library/aa366778(VS.85).aspx
%% Windows has 2GB and 8TB of address space for 32 and 64 bit accordingly.
get_vm_limit({win32, _OSname}) ->
    case erlang:system_info(wordsize) of
        4 -> 2 * 1024 * 1024 * 1024;          %% 2 GB for 32 bits  2^31
        8 -> 8 * 1024 * 1024 * 1024 * 1024      %% 8 TB for 64 bits  2^42
    end;

%% On a 32-bit machine, if you're using more than 2 gigs of RAM you're
%% in big trouble anyway.
get_vm_limit(_OsType) ->
    case erlang:system_info(wordsize) of
        4 -> 2 * 1024 * 1024 * 1024;          %% 2 GB for 32 bits  2^31
        8 -> 256 * 1024 * 1024 * 1024 * 1024    %% 256 TB for 64 bits 2^48
        %%http://en.wikipedia.org/wiki/X86-64#Virtual_address_space_details
    end.

%%----------------------------------------------------------------------------
%% Internal Helpers
%%----------------------------------------------------------------------------
cmd(Command) ->
    Exec = hd(string:tokens(Command, " ")),
    case os:find_executable(Exec) of
        false -> throw({command_not_found, Exec});
        _ -> os:cmd(Command)
    end.

%% get_total_memory(OS) -> Total
%% Windows and Freebsd code based on: memsup:get_memory_usage/1
%% Original code was part of OTP and released under "Erlang Public License".

get_total_memory({unix, darwin}) ->
    File = cmd("/usr/bin/vm_stat"),
    Lines = string:tokens(File, "\n"),
    Dict = dict:from_list(lists:map(fun parse_line_mach/1, Lines)),
    [PageSize, Inactive, Active, Free, Wired] =
        [dict:fetch(Key, Dict) ||
            Key <- [page_size, 'Pages inactive', 'Pages active', 'Pages free',
                'Pages wired down']],
    PageSize * (Inactive + Active + Free + Wired);

get_total_memory({unix, freebsd}) ->
    PageSize = sysctl("vm.stats.vm.v_page_size"),
    PageCount = sysctl("vm.stats.vm.v_page_count"),
    PageCount * PageSize;

get_total_memory({unix, openbsd}) ->
    sysctl("hw.usermem");

get_total_memory({win32, _OSname}) ->
    [Result | _] = os_mon_sysinfo:get_mem_info(),
    {ok, [_MemLoad, TotPhys, _AvailPhys, _TotPage, _AvailPage, _TotV, _AvailV],
        _RestStr} =
        io_lib:fread("~d~d~d~d~d~d~d", Result),
    TotPhys;

get_total_memory({unix, linux}) ->
    File = read_proc_file("/proc/meminfo"),
    Lines = string:tokens(File, "\n"),
    Dict = dict:from_list(lists:map(fun parse_line_linux/1, Lines)),
    dict:fetch('MemTotal', Dict);

get_total_memory({unix, sunos}) ->
    File = cmd("/usr/sbin/prtconf"),
    Lines = string:tokens(File, "\n"),
    Dict = dict:from_list(lists:map(fun parse_line_sunos/1, Lines)),
    dict:fetch('Memory size', Dict);

get_total_memory({unix, aix}) ->
    File = cmd("/usr/bin/vmstat -v"),
    Lines = string:tokens(File, "\n"),
    Dict = dict:from_list(lists:map(fun parse_line_aix/1, Lines)),
    dict:fetch('memory pages', Dict) * 4096;

get_total_memory(_OsType) ->
    unknown.

%% A line looks like "Foo bar: 123456."
parse_line_mach(Line) ->
    [Name, RHS | _Rest] = string:tokens(Line, ":"),
    case Name of
        "Mach Virtual Memory Statistics" ->
            ["(page", "size", "of", PageSize, "bytes)"] =
                string:tokens(RHS, " "),
            {page_size, list_to_integer(PageSize)};
        _ ->
            [Value | _Rest1] = string:tokens(RHS, " ."),
            {list_to_atom(Name), list_to_integer(Value)}
    end.

%% A line looks like "MemTotal:         502968 kB"
%% or (with broken OS/modules) "Readahead      123456 kB"
parse_line_linux(Line) ->
    {Name, Value, UnitRest} =
        case string:tokens(Line, ":") of
            %% no colon in the line
            [S] ->
                [K, RHS] = re:split(S, "\s", [{parts, 2}, {return, list}]),
                [V | Unit] = string:tokens(RHS, " "),
                {K, V, Unit};
            [K, RHS | _Rest] ->
                [V | Unit] = string:tokens(RHS, " "),
                {K, V, Unit}
        end,
    Value1 = case UnitRest of
                 [] -> list_to_integer(Value); %% no units
                 ["kB"] -> list_to_integer(Value) * 1024
             end,
    {list_to_atom(Name), Value1}.

%% A line looks like "Memory size: 1024 Megabytes"
parse_line_sunos(Line) ->
    case string:tokens(Line, ":") of
        [Name, RHS | _Rest] ->
            [Value1 | UnitsRest] = string:tokens(RHS, " "),
            Value2 = case UnitsRest of
                         ["Gigabytes"] ->
                             list_to_integer(Value1) * ?ONE_MB * 1024;
                         ["Megabytes"] ->
                             list_to_integer(Value1) * ?ONE_MB;
                         ["Kilobytes"] ->
                             list_to_integer(Value1) * 1024;
                         _ ->
                             Value1 ++ UnitsRest %% no known units
                     end,
            {list_to_atom(Name), Value2};
        [Name] -> {list_to_atom(Name), none}
    end.

%% Lines look like " 12345 memory pages"
%% or              "  80.1 maxpin percentage"
parse_line_aix(Line) ->
    [Value | NameWords] = string:tokens(Line, " "),
    Name = string:join(NameWords, " "),
    {list_to_atom(Name),
        case lists:member($., Value) of
            true -> trunc(list_to_float(Value));
            false -> list_to_integer(Value)
        end}.

sysctl(Def) ->
    list_to_integer(cmd("/sbin/sysctl -n " ++ Def) -- "\n").

%% file:read_file does not work on files in /proc as it seems to get
%% the size of the file first and then read that many bytes. But files
%% in /proc always have length 0, we just have to read until we get
%% eof.
read_proc_file(File) ->
    {ok, IoDevice} = file:open(File, [read, raw]),
    Res = read_proc_file(IoDevice, []),
    _ = file:close(IoDevice),
    lists:flatten(lists:reverse(Res)).

-define(BUFFER_SIZE, 1024).
read_proc_file(IoDevice, Acc) ->
    case file:read(IoDevice, ?BUFFER_SIZE) of
        {ok, Res} -> read_proc_file(IoDevice, [Res | Acc]);
        eof -> Acc
    end.



cf_parse([], Acc) ->
    Acc;
cf_parse([{_M, F, Arti, [{_, File}, {_, _Line} | _]} | Left], Acc) ->
    NewAcc = Acc ++ io_lib:format("~ts:~p/~p|", [filename:basename(File, ".erl"), F, Arti]),
    cf_parse(Left, NewAcc).

log_sort_mqueue(PPList) ->
    List = lists:reverse(lists:keysort(4, PPList)),
    log_sort_format(List).

log_sort_memory(PPList) ->
    List = lists:reverse(lists:keysort(5, PPList)),
    log_sort_format(List).

log_sort_format(List) ->
    List2 = lists:reverse(lists:sublist(List, 15)),
    {_, Str} = lists:foldl(
        fun({Pid, RegName, Red, MQL, Mem, TotalHeap, Heap, Stack, ST}, {N, AccIn}) ->
            {N - 1, io_lib:format("~-9w~-20ts~-30ts~-15w~-15w~-17ts~-17ts~-17ts~-17ts~ts~n",
                [N, Pid, RegName, Red, MQL,
                    misc:format_memory_readable(Mem),
                    misc:format_memory_readable(TotalHeap),
                    misc:format_memory_readable(Heap),
                    misc:format_memory_readable(Stack), ST]) ++ AccIn}
        end, {15, ""}, List2),
    Str.

process_info_items(P) ->
    erlang:process_info(P,
        [
            registered_name,
            reductions,
            message_queue_len,
            memory,
            heap_size,
            stack_size,
            total_heap_size,
            current_stacktrace
        ]).


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
cache_monitor(PidOrPort, Event, Info) ->
    Now = misc_time:localtime_str(),
    case ets:lookup(?REPORT_CACHE_ETS, PidOrPort) of
        [] ->
            ets:insert
            (
                ?REPORT_CACHE_ETS,
                #monitor_info{
                    pid_or_port = PidOrPort,
                    name = register_name(PidOrPort),
                    event = Event,
                    info = Info,
                    start = Now,
                    latest = Now,
                    count = 1
                }
            );
        [Rec] when (not is_number(Info)); Rec#monitor_info.info < Info ->
            ets:update_element
            (
                ?REPORT_CACHE_ETS, PidOrPort,
                [
                    {#monitor_info.need_flush, true},
                    {#monitor_info.info, Info},
                    {#monitor_info.latest, Now},
                    {#monitor_info.count, Rec#monitor_info.count + 1}
                ]
            );
        [Rec] ->
            ets:update_element
            (
                ?REPORT_CACHE_ETS, PidOrPort,
                [
                    {#monitor_info.need_flush, true},
                    {#monitor_info.latest, Now},
                    {#monitor_info.count, Rec#monitor_info.count + 1}
                ]
            )
    end,
    ok.

register_name(Pid) when is_pid(Pid) ->
    misc:registered_name(Pid);
register_name(_) -> is_port.


