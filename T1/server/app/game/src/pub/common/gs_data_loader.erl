%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 八月 2018 11:34
%%%-------------------------------------------------------------------
-module(gs_data_loader).
-behavior(data_loader).
-author("mawenhong").

-include("logger.hrl").
-include("pub_rec.hrl").
-include("gs_ps_def.hrl").

-export([
    task_list/0,  %% 返回task list
    info/1     %% 处理加载进程发回的消息
]).


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 任务列表
task_list() ->
    IsCross = gs_interface:is_cross(),
    [
        ?LOADER_TASK_GROUP(1, serv_start, ?TASK_SEQ, seq_base_load(IsCross)),
        ?LOADER_TASK_GROUP(2, load_all_role_info, ?TASK_PARALLEL, parallel_load(IsCross))
    ].

seq_base_load(_IsCross) ->
    Sid = gs_interface:get_sid(),
    [
        ?LOADER_TASK(serv_start, {fun gs_db_interface:action_public_/3, [1, serv_start, Sid]})
    ].

parallel_load(true) ->
    [];
parallel_load(_IsCross) ->
    Sid = gs_interface:get_sid(),
    [
        ?LOADER_TASK(load_all_role_info, {fun gs_db_interface:action_data_/3, [1, load_all_role_info, Sid]})
    ].


%%-------------------------------------------------------------------
%% 消息处理
info({serv_start_ack, RunNo}) ->
    try
        gs_econfig:set_run_no(RunNo),
        AreaId = gs_interface:get_area(),
        Sid = gs_interface:get_sid(),
        uid_gen:init(AreaId, Sid, RunNo),
        data_loader:task_over(serv_start)
    catch _:Err:ST ->
        misc:halt("save serv_start failed, error ~p, current stack ~p", [Err, ST])
    end,
    ok;
info({load_all_role_info_ack, List}) ->
    lists:foreach(
        fun(Player) -> gs_cache_interface:add_player_pub(Player) end, List),
    ok;
info(load_all_role_info_ack_end) ->
    data_loader:task_over(load_all_role_info),
    ok;
info(Info) ->
    ?ERROR("undeal info ~w", [Info]).