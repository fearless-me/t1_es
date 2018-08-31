%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 八月 2018 16:49
%%%-------------------------------------------------------------------
-module(watchdog2).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").

%% @doc
%%
%% 加载的任务是一个[#watchdog_task_group{}]
%% 列表会按照优先级 #watchdog_task_group.priority排序，数值越低，优先级越高
%% 组间执行顺序是按照组的优先级从高到低顺序执行
%% 一个组里的任务可以是并行任务、也可以是顺序执行的任务
%%
%% @end
%%

%% API
-export([wait_all/0, wait_group/1, status/0, status_/0, ready/1, ready/0]).
-export([start_link/1, task_group_done/1, task_all_done/0, show_todo/0, show_all/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2, remove_done/0]).

%% 启动进程并且指定进程名字
-callback start_link() -> {'ok', pid()} | 'ignore' | {'error', term()}.
%% 返回task list
-callback task_list() -> [#watchdog_task_group{}].
%% 输出进行中的任务列表
-callback show_todo() -> ok.
%% 输出所有任务列表
-callback show_all() -> ok.
%%

-optional_callbacks([start_link/0, task_list/0, show_all/0, show_todo/0]).

wait_all()->
    i_wait_all(),
    status(),
    ok.

wait_group(Priority) ->
    i_wait_group(Priority),
    ok.


status() ->
    gen_server:call(?MODULE, status, infinity).

status_() ->
    ps:send(?MODULE, status).

ready(V) ->
    ets:insert(?ServerState, #pub_kv{key = 1, value = V}).

ready() ->
    case catch ets:lookup(?ServerState, 1) of
        [#pub_kv{value = V}] -> misc:i2b(V);
        _ -> false
    end.

task_all_done() ->
    gen_server:call(?MODULE, task_all_done).

task_group_done(Priority) ->
    gen_server:call(?MODULE, {task_group_done, Priority}).


show_todo() ->
    ps:send(?MODULE, show_todo),
    ok.

show_all() ->
    ps:send(?MODULE, show_all),
    ok.

remove_done() ->
    ps:send(?MODULE, remove_done),
    ok.

%%%===================================================================
%% define
-record(state, {all = [], todo = [], mod}).
-define(ServerState, serverStateEts_).
%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Mod) ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, Mod, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================
mod_init(Mod) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    ets:new(?ServerState, [public, named_table, {keypos, #pub_kv.key}, ?ETS_RC]),
    Tasks = i_init_all_task(Mod),
    i_show_task_group(Tasks),
    timer:apply_interval(1000, ?MODULE, remove_done, []),
    {ok, #state{all = Tasks, todo = Tasks, mod = Mod}}.

%%--------------------------------------------------------------------
do_handle_call(status, _From, State) ->
    i_print_status(),
    {reply, ok, State};
do_handle_call(task_all_done, _From, State) ->
    {reply, State#state.todo =:= [], State};
do_handle_call( {task_group_done, Priority}, _From, State) ->
    #state{todo = Todos} = State,
    {reply, i_group_done(Todos, Priority), State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(status, State) ->
    i_print_status(),
    {noreply, State};
do_handle_info(show_todo, State) ->
    catch i_show_task_group(State#state.todo),
    {noreply, State};
do_handle_info(show_all, State) ->
    catch i_show_task_group(State#state.all),
    {noreply, State};
do_handle_info(remove_done, State) ->
    {noreply, State#state{todo = i_remove_done(State#state.todo)}};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~p", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
i_init_all_task(Mod) ->
    SortF =
        fun
            (
                #watchdog_task_group{priority = P1},
                #watchdog_task_group{priority = P2}
            ) ->
                P1 < P2
        end,
    lists:sort(SortF, Mod:task_list()).


%%
i_show_task_group(Todos) ->
    ?WARN("node ~p watchdog task list", [node()]),
    ?WARN("======"),
    i_show_task_group_do(Todos),
    ?WARN("======"),
    ok.

i_show_task_group_do([]) ->
    ok;
i_show_task_group_do([Group | LeftGroup]) ->
    i_show_1_group(Group),
    i_show_task_group_do(LeftGroup).

i_show_1_group(#watchdog_task_group{
    priority = Pr,
    ref = Ref, task_list = TaskList
}) ->
    ?WARN("group ~p priority ~p ", [Ref, Pr]),
    lists:foreach(fun(Task) -> i_show_1_task(Task) end, TaskList),
    ok.

i_show_1_task(#watchdog_task{tip = Tip}) ->
    ?WARN("\t\t~ts", [Tip]),
    ok.

%%--------------------------------------------------------------------
i_wait_all() ->
    i_wait_all_do( watchdog2:task_all_done()),
    ok.

i_wait_all_do(true) ->
    ok;
i_wait_all_do(Other) ->
    ?WARN("wait ~ts ...", [Other]),
    timer:sleep(5000),
    i_wait_all_do( watchdog2:task_all_done()).

%%--------------------------------------------------------------------
i_wait_group(Priority) ->
    i_wait_group_do(watchdog2:task_group_done(Priority), Priority),
    ok.

i_wait_group_do(true, _Priority) ->
    ok;
i_wait_group_do(Other, Priority) ->
    ?WARN("wait ~ts ...", [Other]),
    timer:sleep(5000),
    i_wait_all_do(watchdog2:task_group_done(Priority), Priority).

i_group_done([], _Priority) ->
    true;
i_group_done(Todos, Priority) ->
    case lists:keyfind(Priority, #watchdog_task_group.priority, Todos) of
        false -> true;
        #watchdog_task_group{task_list = []} -> true;
        #watchdog_task_group{task_list = [#watchdog_task{tip = Tips}]} ->
            Tips
    end.



i_remove_done(Todos) ->
    ok.

i_check_groups([], Acc) ->
    Acc;
i_check_groups([#watchdog_task_group{task_list = TL} = Group | Groups], Acc) ->
    case i_check_tasks_done(TL, []) of
        [] -> i_check_groups(Groups, Acc);

    end.

i_check_tasks_done([], Acc)->
    Acc;
i_check_tasks_done([#watchdog_task{mfa = {M, F, A}} = Task | Left], Acc)->
    case catch erlang:apply(M, F, A) of
        true -> i_check_tasks_done(Left, Acc);
        _ -> i_check_tasks_done(Left, [Task | Acc])
    end.

%%--------------------------------------------------------------------
i_print_status() ->
    ?DEBUG("status:~n"
    "======================================================================================================~n"
    "auto reload src dirs: ~n\t~ts~n"
    "auto reload inc dirs: ~n\t~ts~n"
    "auto reload opt info: ~n\t~p~n"
    "auto reload interval: ~w(milliseconds)~n"
    "======================================================================================================",
        [
            io_lib:format("~ts", [misc:list_to_string_suffix(fly:info(src_dirs), "\n\t")]),
            io_lib:format("~ts", [misc:list_to_string_suffix(fly:info(inc_dirs), "\n\t")]),
            fly:info(opts),
            fly:info(interval)
        ]
    ),
    misc:system_info(),
    ok.


