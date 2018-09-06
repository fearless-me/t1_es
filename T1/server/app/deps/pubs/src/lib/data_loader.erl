%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 八月 2018 9:59
%%%-------------------------------------------------------------------
-module(data_loader).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_rec.hrl").

%% @doc
%%
%% 加载的任务是一个[#loader_task_group{}]
%% 列表会按照优先级 #loader_task_group.priority排序，数值越低，优先级越高
%% 组间执行顺序是按照组的优先级从高到低顺序执行
%% 一个组里的任务可以是并行任务、也可以是顺序执行的任务
%% 
%% @end
%%

%% API
-export([start_link/1, task_run/0, task_over/1, is_group_done/1,  is_all_done/0,  show_todo/0, show_all/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

-export([start_link/2, task_run/1, task_over/2, is_group_done/2, is_all_done/1, show_todo/1, show_all/1]).

%% 启动进程并且指定进程名字
-callback start_link() -> {'ok', pid()} | 'ignore' | {'error', term()}.
%% 返回task list
-callback task_list() -> [#loader_task_group{}].
%% 处理加载进程发回的消息
-callback info(Msg :: term()) -> ok.
%% 用于外部检查任务是否全部完成
-callback is_all_done() -> boolean().
%% 输出进行中的任务列表
-callback show_todo() -> ok.
%% 输出所有任务列表
-callback show_all() -> ok.
%%

-optional_callbacks(
    [start_link/0, task_list/0, is_all_done/0, show_all/0, show_todo/0]).


task_run() ->
    ps:send(?MODULE, run),
    ok.

task_run(PidOrName) ->
    ps:send(PidOrName, run),
    ok.

task_over(TaskRef) ->
    ps:send(?MODULE, {task_over, TaskRef}),
    ok.

task_over(PidOrName, TaskRef) ->
    ps:send(PidOrName, {task_over, TaskRef}),
    ok.

is_all_done() ->
    gen_server:call(?MODULE, task_all_done).

is_all_done(PidOrName) ->
    gen_server:call(PidOrName, task_all_done).


is_group_done(Priority) ->
    gen_server:call(?MODULE, {task_group_done, Priority}).

is_group_done(PidOrName, Priority) ->
    gen_server:call(PidOrName, {task_group_done, Priority}).

show_todo() ->
    ps:send(?MODULE, show_todo),
    ok.

show_todo(PidOrName) ->
    ps:send(PidOrName, show_todo),
    ok.

show_all() ->
    ps:send(?MODULE, show_all),
    ok.

show_all(PidOrName) ->
    ps:send(PidOrName, show_all),
    ok.


%%%===================================================================
%% define
-record(state, {all = [], todo = [], mod}).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Mod) ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, Mod, []).

start_link(Name, Mod) ->
    gen_serverw:start_link({local, Name}, ?MODULE, Mod, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================
mod_init(Mod) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    Tasks = i_init_all_task(Mod),
    data_loader:task_run(self()),
    i_show_task_group(Tasks),
    {ok, #state{all = Tasks, todo = Tasks, mod = Mod}}.

%%--------------------------------------------------------------------
do_handle_call(task_all_done, _From, State) ->
    {reply, i_all_done(State#state.todo), State};
do_handle_call( {task_group_done, Priority}, _From, State) ->
    {reply, i_group_done(State#state.todo, Priority), State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(show_todo, State) ->
    catch i_show_task_group(State#state.todo),
    {noreply, State};
do_handle_info(show_all, State) ->
    catch i_show_task_group(State#state.all),
    {noreply, State};
do_handle_info(run, State) ->
    #state{todo = Tasks} = State,
    {noreply, State#state{todo = i_start_task(Tasks)}};
do_handle_info({task_over, TaskRef}, State) ->
    #state{todo = TaskGroups} = State,
    {noreply, State#state{todo = i_1_task_over(TaskRef, TaskGroups)}};
do_handle_info(Info, #state{mod = Mod} = State) ->
    Mod:info(Info),
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
                #loader_task_group{priority = P1},
                #loader_task_group{priority = P2}
            ) ->
                P1 < P2
        end,
    lists:sort(SortF, Mod:task_list()).

%%
i_start_task([]) ->
    ?WARN("data loader all task done #"),
    [];
i_start_task([TaskGroup | LeftGroups] = GroupList) ->
    case i_start_task_group(TaskGroup) of
        done -> LeftGroups;
        _ -> GroupList
    end.

%%
i_start_task_group(#loader_task_group{task_list = []}) ->
    done;
i_start_task_group(#loader_task_group{mode = ?TASK_SEQ, ref = GRef, task_list = [Task | _]}) ->
    i_start_1_task(GRef, Task);
i_start_task_group(#loader_task_group{mode = ?TASK_PARALLEL, ref = GRef, task_list = TaskList}) ->
    lists:foreach(fun(Task) -> i_start_1_task(GRef, Task) end, TaskList).
%%
i_start_1_task(GRef, #loader_task{ref = TRef, mfa = Mfa} = Task) ->
    ?WARN("\ttask group ~p task ~p ...", [GRef, TRef]),
    case catch misc:apply_fun(Mfa) of
    {'EXIT', Error} -> i_check_apply(Error, Task);
    _ -> skip
    end,
    ok.

i_check_apply(Error, Task) ->
    ?FATAL("check task ~p error ~p", [Task, Error]);
i_check_apply(_, _) -> skip.


i_all_done([]) -> true;
i_all_done(Todos) ->
    #loader_task_group{task_list = TL} = erlang:hd(Todos),
    #loader_task{ref = Ref} = erlang:hd(TL),
    Ref.

i_group_done([], _Priority) ->
    true;
i_group_done(Todos, Priority) ->
    case lists:keyfind(Priority, #loader_task_group.priority, Todos) of
        false -> true;
        #loader_task_group{task_list = []} -> true;
        #loader_task_group{task_list = [#loader_task{ref = Ref} | _]} ->
            Ref
    end.

%%
i_1_task_over(TaskRef, [TaskGroup | _] = GroupList) ->
    #loader_task_group{ref = Ref, task_list = GroupTaskList} = TaskGroup,
    ?WARN("\ttask group ~p task ~p done #", [Ref, TaskRef]),
    GroupTaskLeft = lists:keydelete(TaskRef, #loader_task.ref, GroupTaskList),
    i_on_task_over(GroupTaskLeft, GroupList).

%% 开始下一个任务组
i_on_task_over([], [#loader_task_group{ref = Ref, priority = PR, mode = Mode} | LeftGroups]) ->
    ?WARN("task group ~p priority ~p mode ~p done #", [Ref, PR, Mode]),
    data_loader:task_run(self()),
    LeftGroups;
%% 开始当前组的下一个任务
i_on_task_over(LeftTasks, [#loader_task_group{mode = ?TASK_SEQ} = TaskGroup | LeftGroups]) ->
    data_loader:task_run(self()),
    [TaskGroup#loader_task_group{task_list = LeftTasks} | LeftGroups];
%% 并行任务等待整组完成
i_on_task_over(_, [#loader_task_group{mode = ?TASK_PARALLEL} | _] = TaskGroups) ->
    TaskGroups.


%%
i_show_task_group(Todos) ->
    ?WARN("node ~p data loader task list", [node()]),
    ?WARN("======"),
    i_show_task_group_do(Todos),
    ?WARN("======"),
    ok.

i_show_task_group_do([]) ->
    ok;
i_show_task_group_do([Group | LeftGroup]) ->
    i_show_1_group(Group),
    i_show_task_group_do(LeftGroup).

i_show_1_group(#loader_task_group{
    priority = Pr,
    ref = Ref,
    mode = Mode, task_list = TaskList
}) ->
    ?WARN("group ~p priority ~p mode ~p", [Ref, Pr, Mode]),
    lists:foreach(fun(Task) -> i_show_1_task(Task) end, TaskList),
    ok.

i_show_1_task(#loader_task{ref = TRef}) ->
    ?WARN("\t\t~p", [TRef]),
    ok.




