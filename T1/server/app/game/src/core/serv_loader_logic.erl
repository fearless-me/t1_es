%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 六月 2018 10:37
%%%-------------------------------------------------------------------
-module(serv_loader_logic).
-author("mawenhong").
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
-define(TASK_SINGLE, 1).
-define(TASK_MULTI,  2).
task_list() ->
    lists:map(
        fun({_,Task,_,_,_})->
            Task
        end, task_list_inner()
    ).

task_list_inner() ->
    [
        {?TASK_SINGLE, serv_start,          1, gconf:get_sid(), fun lib_db:action_pub_/3},
        {?TASK_MULTI , load_all_role_info,  0, gconf:get_sid(), fun lib_db:action_p_all_/2}
    ].

%%-------------------------------------------------------------------
start_all_task() ->
    L = task_list_inner(),
    lists:foreach(
        fun(Task)->
            start_on_task(Task)
        end, L),
    ok.

start_on_task({?TASK_MULTI, Task, _Key, Params, F}) ->
    N = F(Task, Params),
    put(Task, N),
    ok;
start_on_task({?TASK_SINGLE, Task, HashKey, Params, F}) ->
    _ = F(HashKey, Task, Params),
    put(Task, 1),
    ok.

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
task_done_action(Task) ->
    case misc:get_pdict(Task, 1) of
        1 ->
            ps:send(serv_loader, task_done, Task);
        V ->
            put(Task, V - 1)
    end.

%%-------------------------------------------------------------------
is_task_all_done() ->
    gen_server:call(serv_loader, task_all_done).

