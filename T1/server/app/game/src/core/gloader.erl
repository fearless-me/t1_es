%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 六月 2018 10:37
%%%-------------------------------------------------------------------
-module(gloader).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([task_list/0]).
-export([start_all_task/0]).
-export([task_done/1, is_task_all_done/0]).
-export([on_info_msg/1]).

%%-------------------------------------------------------------------
task_list() ->
    [serv_start].

%%-------------------------------------------------------------------
start_all_task() ->
    lib_db:action_pub_(1, serv_start, gconf:get_sid()).

%%-------------------------------------------------------------------
on_info_msg({serv_start, RunNo}) ->
    try
        gconf:set_run_no(RunNo),
        uid_gen:init(),
        task_done(serv_start)
    catch _ : Err ->
        gcore:halt(io_lib:format("save serv_start failed, error ~p, current stack ~p",
            [Err, misc:stacktrace()]))
    end,
    ok;
on_info_msg({loal_all_role_info, xx}) ->
    ok;
on_info_msg(Info) ->
    ?ERROR("undeal info ~w", [Info]).

%%-------------------------------------------------------------------
task_done(Task) ->
    ps:send(serv_loader, task_done, Task).

%%-------------------------------------------------------------------
is_task_all_done() ->
    gen_server:call(serv_loader, task_all_done).

