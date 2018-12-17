%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 八月 2018 16:49
%%%-------------------------------------------------------------------
-module(watchdog).
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
-export([pause/0, pause_group/1, continue/0, continue_group/1]).
-export([wait_all/0, wait_group/1, status/0, status_/0, ready/1, ready/0]).
-export([start_link/1, is_group_done/1, is_all_done/0, show_todo/0, show_all/0]).
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

%%%===================================================================
%% define
-record(state, {all = [], todo = [], mod, pause=false, tref}).
-define(CHECK_TICK,  5000).

pause() ->
    gen_server:call(?MODULE, pause).

continue() ->
    gen_server:cast(?MODULE, continue).

pause_group(Priority) ->
    gen_server:call(?MODULE, {pause, Priority}).

continue_group(Priority) ->
    gen_server:cast(?MODULE, {continue, Priority}).

wait_all()->
    wait_all_loop( watchdog:is_all_done()),
    status(),
    ok.

wait_group(Priority) ->
    wait_group_loop(watchdog:is_group_done(Priority), Priority),
    ok.


status() ->
    gen_server:call(?MODULE, status).

status_() ->
    ps:send(?MODULE, status).

ready(V) -> application:set_env(?MODULE, ready_now, V).


ready() ->
    V = application:get_env(?MODULE, ready_now, 0),
    misc:i2b(V).

is_all_done() ->
    gen_server:call(?MODULE, task_all_done).

is_group_done(Priority) ->
    gen_server:call(?MODULE, {task_group_done, Priority}).


show_todo() ->
    ps:send(?MODULE, show_todo),
    ok.

show_all() ->
    ps:send(?MODULE, show_all),
    ok.

remove_done() ->
    {_, MQueueLen} = erlang:process_info(whereis(?MODULE), message_queue_len),
    case MQueueLen < 10 of
        true ->
            ps:send(?MODULE, remove_done),
            ok;
        _ -> skip
    end,
    ok.


%%--------------------------------------------------------------------
wait_all_loop(true) ->
    ok;
wait_all_loop(Other) ->
    ?WARN("wait task => ~ts ...", [Other]),
    timer:sleep(?CHECK_TICK),
    wait_all_loop( watchdog:is_all_done()).

%%--------------------------------------------------------------------
wait_group_loop(true, _Priority) ->
    ok;
wait_group_loop(Other, Priority) ->
    ?WARN("wait task => ~ts ...", [Other]),
    timer:sleep(?CHECK_TICK),
    wait_group_loop(watchdog:is_group_done(Priority), Priority).


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
    Tasks = i_init_all_task(Mod),
    i_show_task_group(Tasks),
    Tref = timer:apply_interval(?CHECK_TICK, ?MODULE, remove_done, []),
    {ok, #state{all = Tasks, todo = Tasks, mod = Mod, tref = Tref}}.

%%--------------------------------------------------------------------
do_handle_call(status, _From, State) ->
    i_print_status(),
    {reply, ok, State};
do_handle_call({pause}, _From, State) ->
    {reply, ok, State#state{pause = true}};
do_handle_call({pause, Priority}, _From, State) ->
    {reply, ok, State#state{todo = i_set_group_pause(State#state.todo, Priority, true)}};
do_handle_call(task_all_done, _From, State) ->
    {reply, i_all_done(State#state.todo), State};
do_handle_call( {task_group_done, Priority}, _From, State) ->
    {reply, i_group_done(State#state.todo, Priority), State};
do_handle_call(Request, From, State) ->
    ?ERROR("call ~w from ~w", [Request, From]),
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
    case State#state.pause of
        true -> {noreply, State};
        _Ant -> {noreply, State#state{todo = i_remove_done(State#state.todo)}}
    end;
do_handle_info(Info, State) ->
    ?ERROR("info ~p", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(continue, State) ->
    {noreply, State#state{pause = false}};
do_handle_cast({continue, Priority}, State) ->
    {noreply, State#state{todo = i_set_group_pause(State#state.todo, Priority, false)}};
do_handle_cast(Request, State) ->
    ?ERROR("cast ~w", [Request]),
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

i_all_done([]) -> true;
i_all_done(Todos) ->
    #watchdog_task_group{task_list = TL} = erlang:hd(Todos),
    #watchdog_task{tip = Tips, fun_ret = Ret} = erlang:hd(TL),
    i_format_ret_msg(Tips, Ret).


i_group_done([], _Priority) ->
    true;
i_group_done(Todos, Priority) ->
    case lists:keyfind(Priority, #watchdog_task_group.priority, Todos) of
        false -> true;
        #watchdog_task_group{task_list = []} -> true;
        #watchdog_task_group{task_list = [#watchdog_task{tip = Tips, fun_ret = Ret} | _]} ->
            i_format_ret_msg(Tips, Ret)
    end.

i_format_ret_msg(Tips, Ret) ->
    io_lib:format("~s // ~p",[Tips, Ret]).


i_set_group_pause([], _Priority, _Pause)->
    [];
i_set_group_pause(Todos, Priority, Pause) ->
    case lists:keyfind(Priority, #watchdog_task_group.priority, Todos) of
        false -> Todos;
        Group -> lists:keyreplace(Priority, #watchdog_task_group.priority, Todos, Group#watchdog_task_group{pause = Pause})
    end.



i_remove_done(Todos) ->
    lists:reverse(i_remove_groups(Todos, [])).

i_remove_groups([], Acc) ->
    Acc;
i_remove_groups([#watchdog_task_group{pause = true} = Group | Groups], Acc) ->
    i_remove_groups(Groups, [Group | Acc]);
i_remove_groups([#watchdog_task_group{task_list = TL} = Group | Groups], Acc) ->
    case i_remove_tasks(TL, []) of
        [] -> i_remove_groups(Groups, Acc);
        NTL -> i_remove_groups(Groups,  [Group#watchdog_task_group{task_list = NTL} | Acc])
    end.

i_remove_tasks([], Acc)->
    Acc;
i_remove_tasks([#watchdog_task{mfa =Mfa, tip = Tips} = Task | Left], Acc)->
    case catch misc:apply_fun(Mfa) of
        true ->
            ?WARN("task ~ts done#",[Tips]),
            i_remove_tasks(Left, Acc);
        Else ->
            Ret = i_check_apply(Else, Task),
            i_remove_tasks(Left, [Task#watchdog_task{fun_ret = Ret} | Acc])
    end.

i_check_apply({'EXIT', Error}, Task) ->
    ?WARN("check task ~p error ~p", [Task, Error]),
     error;
i_check_apply(Else, _) -> Else.



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


