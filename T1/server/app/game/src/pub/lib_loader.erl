%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 八月 2018 16:24
%%%-------------------------------------------------------------------
-module(lib_loader).
-author("mawenhong").

%% API
-export([]).

-include("logger.hrl").
-include("mem_record.hrl").

%% API
-export([
    task_list/0,
    start_all_task/0,
    is_task_all_done/0,
    on_info_msg/1
]).

%%-------------------------------------------------------------------

tasks() ->
    [
        %% task_name, sub_task_count, hashkey, sid, db_func
        %% sub_task_count 如果是0，那么将由 db_func 决定任务数量
        {serv_start,         1, 1, gconf:get_sid(), fun lib_db:action_pub_/3},
        {load_all_role_info, 0, 0, gconf:get_sid(), fun lib_db:action_p_all_/2}
    ].

task_list() -> lists:map(fun({Task,_,_,_,_})-> Task end, tasks()).

%%-------------------------------------------------------------------
on_info_msg({serv_start_ack, RunNo}) ->
    try
        gconf:set_run_no(RunNo),
        uid_gen:init(),
        task_done_action(serv_start)
    catch _:Err:ST ->
        gcore:halt("save serv_start failed, error ~p, current stack ~p", [Err, ST])
    end,
    ok;
%%-------------------------------------------------------------------
on_info_msg({load_all_role_info_ack, List}) ->
    lists:foreach(
        fun(Player)-> lib_cache:add_player_pub(Player) end, List),
    ok;
on_info_msg(load_all_role_info_ack_end) ->
    task_done_action(load_all_role_info),
    ok;
%%-------------------------------------------------------------------
on_info_msg(Info) ->
    ?ERROR("undeal info ~w", [Info]).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
start_all_task() ->
    L = tasks(),
    F = fun(Task)-> start_on_task(Task) end,
    lists:foreach(F, L),
    ok.

start_on_task({Task, 0, _Key, Params, F}) ->
    N = F(Task, Params),
    put(Task, {N,N}),
    ok;
start_on_task({Task, X, HashKey, Params, F}) ->
    _ = F(HashKey, Task, Params),
    put(Task, {X,X}),
    ok.
%%-------------------------------------------------------------------
task_done_action(Task) ->
    case misc:get_dict_def(Task, {1,1}) of
        {1,_M} ->
            ps:send(serv_loader, task_done, Task);
        {V,M} ->
            ?WARN("task ~p progress ~p/~p ",[Task, M-V+1, M]),
            put(Task, {V - 1,M})
    end.

%%-------------------------------------------------------------------
is_task_all_done() ->
    gen_server:call(serv_loader, task_all_done).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
