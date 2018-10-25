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
    proc_info/1, proc_basic_info/1, proc_backtrace/1, proc_statistics/2,
    proc_signal/1, proc_reduction/1, proc_binary/1, proc_memory/1, proc_gc/1,

    proc_top/2, proc_top_memory/1, proc_top_message_queue/1,
    proc_top_bin_leak/1, proc_unlink/0,

    node_port/1,
    node_stats/0, node_stats_print/2,
    node_memory/1, node_memory/2,
    node_allocator_snapshot/0, node_allocator_snapshot_save/1,
    node_cache_hit/0, node_avg_block_size/1, node_sbcs_to_mbcs/1,
    node_fragmentation/1, node_scheduler_usage/1
]).



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
proc_info(PidTerm) ->
    recon:info(PidTerm).

%%-------------------------------------------------------------------
proc_basic_info(PidTerm) ->
    recon:info(PidTerm, meta).

%%-------------------------------------------------------------------
proc_backtrace(PidTerm) ->
    recon:info(PidTerm, location).

%%-------------------------------------------------------------------
proc_signal(PidTerm) ->
    recon:info(PidTerm, signals).

%%-------------------------------------------------------------------
proc_reduction(PidTerm) ->
    recon:info(PidTerm, work).

%%-------------------------------------------------------------------
proc_binary(PidOrTerm) ->
    recon:info(PidOrTerm, binary).

%%-------------------------------------------------------------------
proc_memory(PidTerm) ->
    recon:info(PidTerm, memory_used).

%%-------------------------------------------------------------------
proc_gc(PidTerm) ->
    A = erlang:process_info(recon_lib:term_to_pid(PidTerm), garbage_collection),
    B = erlang:process_info(recon_lib:term_to_pid(PidTerm), garbage_collection_info),
    [A, B].

%%-------------------------------------------------------------------
proc_top(AttrName, Num) ->
    recon:proc_count(AttrName, Num).

%%-------------------------------------------------------------------
proc_top_memory(N) ->
    recon:proc_count(memory, N).

%%-------------------------------------------------------------------
proc_top_message_queue(N) ->
    recon:proc_count(message_queue_len, N).

%%-------------------------------------------------------------------
proc_top_bin_leak(N) ->
    recon:bin_leak(N).

%%-------------------------------------------------------------------
proc_unlink() ->
    [
        {P, misc:registered_name(P)} || P <- processes(),
        [{_, Ls}, {_, Ms}] <- [process_info(P, [links, monitors])],
        [] == Ls, [] == Ms
    ].

%%-------------------------------------------------------------------
node_stats() ->
    recon:node_stats_print(1, 1000).

node_stats_print(N, Interval) ->
    recon:node_stats_print(N, Interval).

node_port(Node)->
    {_, Owner}=lists:keyfind(owner, 1, element(2, net_kernel:node_info(Node))),
    hd([P|| P<-erlang:ports(), erlang:port_info(P, connected) == {connected,Owner}]).

%%-------------------------------------------------------------------
node_allocator_snapshot() ->
    ensure_recon_unit(),
    case recon_alloc:snapshot_get() of
        undefined -> recon_alloc:snapshot();
        Snap -> Snap
    end.

%%-------------------------------------------------------------------
node_allocator_snapshot_save(File) ->
    ensure_recon_unit(),
    recon_alloc:snapshot_save(File).

%%-------------------------------------------------------------------
node_memory(Stage) ->
    Ks = [used, allocated, unused, usage, allocated_types, allocated_instances],
    lists:map(fun(Key) -> node_memory(Key, Stage) end, Ks).

%%-------------------------------------------------------------------
-spec node_memory(Key, Stage) -> any() when
    Key :: used | allocated | unused | usage | allocated_types|allocated_instances,
    Stage :: current | max.
node_memory(usage, Stage) ->
    ensure_recon_unit(),
    {usage, trunc(recon_alloc:memory(usage, Stage) * 10000) / 10000};
node_memory(Key, Stage) ->
    ensure_recon_unit(),
    trans_to_unit_mb(Key, recon_alloc:memory(Key, Stage)).

%%-------------------------------------------------------------------
node_cache_hit() ->
    ensure_recon_unit(),
    recon_alloc:cache_hit_rates().

%%-------------------------------------------------------------------
node_avg_block_size(Stage) ->
    ensure_recon_unit(),
    recon_alloc:average_block_sizes(Stage).


%%-------------------------------------------------------------------
node_sbcs_to_mbcs(Stage) ->
    ["the higher the value,  the worst the condition" |
        recon_alloc:sbcs_to_mbcs(Stage)].
%%-------------------------------------------------------------------
node_fragmentation(Stage) ->
    inet_tcp_dist:module_info(),
    recon_alloc:fragmentation(Stage).

node_scheduler_usage(Interval) ->
    recon:scheduler_usage(Interval).


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




