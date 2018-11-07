%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%      对recon的封装，方便线上调用
%%% @end
%%% Created : 03. 七月 2018 16:31
%%%-------------------------------------------------------------------
-module(dtool).
-author("mawenhong").

%% API
-export([
    %% 进程相关
    info/1, info/2,
    bin_leak/1,
    proc_count/2, proc_unlink/0, proc_statistics/2,

    %% 节点相关
    node_port/1, node_stats/0, node_stats_print/2,
    memory/1, memory/2,

    %% tcp
    tcp/0, inet_count/2, port_info/1, port_info/2,

    %% allocators
    allocators/0, allocators/1,
    alloc_snapshot/0, alloc_snapshot_save/1,
    cache_hit/0, average_block_sizes/1, sbcs_to_mbcs/1,
    fragmentation/1,

    %% schedulers
    scheduler_usage/1, scheduler_statistics/1,

    %% trace
    trace/5, trace_clear/0
]).


info(PidTerm)->
    recon:info(PidTerm).

info(PidTerm, Keys)->
    recon:info(PidTerm, Keys).

%%-------------------------------------------------------------------
proc_count(AttrName, Num) ->
    recon:proc_count(AttrName, Num).


%%-------------------------------------------------------------------
bin_leak(N) ->
    recon:bin_leak(N).

%%-------------------------------------------------------------------
proc_unlink() ->
    [
        {P, misc:registered_name(P)} || P <- processes(),
        [{_, Ls}, {_, Ms}] <- [process_info(P, [links, monitors])],
        [] == Ls, [] == Ms
    ].

%%-------------------------------------------------------------------
proc_statistics(Name, Milliseconds) ->
    sys:statistics(Name, true),
    timer:sleep(Milliseconds),
    Info =
        case sys:statistics(Name, get) of
            {ok, Statistics} ->
                lists:foldl(
                    fun
                        ({Key,{{_,_,_},{_,_,_}} = DataTime}, Acc) ->
                            Acc ++ lists:concat([Key, ":", misc_time:format_datetime(DataTime), "\n"]);
                        ({Key, Val}, Acc) ->
                            Acc ++ lists:concat([Key, ":", Val, "\n"])
                    end, [], Statistics);
            Other ->
                lists:concat([Other])
        end,
    sys:statistics(Name, false),
    io:format
    (
        "~n****** system statistics ******~n"
        "process:~p~n"
        "~s"
        "*********************************~n", [Name, Info]
    ),
    ok.

%%-------------------------------------------------------------------
node_stats() ->
    recon:node_stats_print(1, 1000).

node_stats_print(N, Interval) ->
    recon:node_stats_print(N, Interval).

node_port(Node)->
    {_, Owner}=lists:keyfind(owner, 1, element(2, net_kernel:node_info(Node))),
    hd([P|| P<-erlang:ports(), erlang:port_info(P, connected) == {connected,Owner}]).

%%-------------------------------------------------------------------
allocators()-> recon_alloc:allocators().
allocators(types) -> recon_alloc:allocators(types).

alloc_snapshot() ->
    ensure_recon_unit(),
    case recon_alloc:snapshot_get() of
        undefined -> recon_alloc:snapshot(), recon_alloc:snapshot_get();
        Snap -> Snap
    end.

%%-------------------------------------------------------------------
alloc_snapshot_save(File) ->
    ensure_recon_unit(),
    recon_alloc:snapshot_save(File).

%%-------------------------------------------------------------------
cache_hit() ->
    ensure_recon_unit(),
    recon_alloc:cache_hit_rates().

%%-------------------------------------------------------------------
average_block_sizes(Stage) ->
    ensure_recon_unit(),
    recon_alloc:average_block_sizes(Stage).


%%-------------------------------------------------------------------
memory(Stage) ->
    Ks = [used, allocated, unused, usage, allocated_types, allocated_instances],
    lists:map(fun(Key) -> memory(Key, Stage) end, Ks).

%%-------------------------------------------------------------------
-spec memory(Key, Stage) -> any() when
    Key :: used | allocated | unused | usage | allocated_types|allocated_instances,
    Stage :: current | max.
memory(usage, Stage) ->
    ensure_recon_unit(),
    {usage, trunc(recon_alloc:memory(usage, Stage) * 10000) / 10000};
memory(Key, Stage) ->
    ensure_recon_unit(),
    trans_to_unit_mb(Key, recon_alloc:memory(Key, Stage)).



%%-------------------------------------------------------------------
sbcs_to_mbcs(Stage) ->
    ["the higher the value,  the worst the condition" |
        recon_alloc:sbcs_to_mbcs(Stage)].

%%-------------------------------------------------------------------
fragmentation(Stage) ->
    recon_alloc:fragmentation(Stage).

%%-------------------------------------------------------------------
scheduler_usage(Interval) ->
    recon:scheduler_usage(Interval).


scheduler_statistics(Interval)->
    erlang:system_flag(scheduling_statistics,enable),
    timer:sleep(Interval),
    Res0 = erlang:system_info(scheduling_statistics),
    Res1 = erlang:system_info(total_scheduling_statistics),
    erlang:system_flag(scheduling_statistics,disable),
    {Res0, Res1}.





tcp() -> recon:tcp().
inet_count(Attr, Num) -> recon:inet_count(Attr, Num).

port_info(PortTerm) -> recon:port_info(PortTerm).
port_info(PortTerm, Keys)-> recon:port_info(PortTerm, Keys).

%%-------------------------------------------------------------------
trace(Mod, Fun, Args, Limit, Opts) ->
    recon_trace:calls({Mod, Fun, Args}, Limit, Opts).

trace_clear() ->
    recon_trace:clear().

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
trans_to_unit_mb(Key, {Key, Size}) ->
    {Key, misc:format_memory_readable(Size)};
trans_to_unit_mb(Key, Size) when is_number(Size) ->
    {Key, misc:format_memory_readable(Size)};
trans_to_unit_mb(Key, List) when is_list(List) ->
    F = fun
            ({K, V}) when is_number(V) ->
                {K, misc:format_memory_readable(V)};
            (O) ->
                O
        end,
    {Key, lists:map(F, List)};
trans_to_unit_mb(_Key, Other) ->
    Other.

%%-------------------------------------------------------------------
ensure_recon_unit() ->
    recon_alloc:set_unit(byte).
%%-------------------------------------------------------------------


%% ## cprof 模块调用次数统计
%% ## cover 代码覆盖测试
%% ## profiler
%% ## xref 交叉引用检查，发现缺失函数
%% ## common_test 单元测试
%% ## 代码测试 https://github.com/proper-testing/proper
%% ## dialyzer  静态分析
%%      https://blog.csdn.net/wu545134650/article/details/53005093
%%      https://blog.csdn.net/jq0123/article/details/49795911
%%      https://blog.csdn.net/chen190735341/article/details/38260429

%% dialyzer --build_plt --apps erts kernel stdlib mnesia
%% dialyzer -r ./app/game/ebin -o dialyzer-game.out   --fullpath --dump_callgraph callg.raw  --gui

%% ## Erlang Event Tracer 图形化展示
%% http://www.erlang.org/doc/apps/et/et_intro.html
%% eg.
%% test() ->
%%    {ok, ViewerPid} = et_viewer:start([{title,"Coffee Order"}]),
%%    CollectorPid = et_viewer:get_collector_pid(ViewerPid),
%%    et_collector:report_event(CollectorPid,85,from,to,message,extra_stuff),
%%    et_collector:report_event(CollectorPid,85,from,to,kill,extra_stuff),
%%    et_collector:report_event(CollectorPid,85,from,to,fuck,extra_stuff),
%%    ok.

%% ## dtrace 或者 systemtap (erlang内部dyntrace)
%% ## tsung 压力测试




