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
-export([task_list/0]).
-export([start_all_task/0]).
-export([task_done/1, is_task_all_done/0]).
-export([on_info_msg/1]).

%%-------------------------------------------------------------------
task_list() ->
    [serv_start, load_all_role_info].

%%-------------------------------------------------------------------
start_all_task() ->
    lib_db:action_pub_(1, serv_start, gconf:get_sid()),
    lib_db:action_p_(2, load_all_role_info, gconf:get_sid()).

%%-------------------------------------------------------------------
on_info_msg({serv_start, RunNo}) ->
    try
        gconf:set_run_no(RunNo),
        uid_gen:init(),
        task_done(serv_start)
    catch _:Err:ST ->
        gcore:halt("save serv_start failed, error ~p, current stack ~p", [Err, ST])
    end,
    ok;
on_info_msg({load_all_role_info_ack, List}) ->
    lists:foreach(
        fun(Player)-> lib_cache:add_player_pub(Player) end, List),
    ok;
on_info_msg(load_all_role_info_ack_end) ->
    task_done(load_all_role_info),
    ok;
on_info_msg(Info) ->
    ?ERROR("undeal info ~w", [Info]).

%%-------------------------------------------------------------------
task_done(Task) ->
    ps:send(serv_loader, task_done, Task).

%%-------------------------------------------------------------------
is_task_all_done() ->
    gen_server:call(serv_loader, task_all_done).

