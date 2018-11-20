%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 八月 2018 14:54
%%%-------------------------------------------------------------------
-module(cs_data_loader).
-behavior(data_loader).
-author("mawenhong").

-include("logger.hrl").
-include("pub_rec.hrl").
-include("cs_ps_def.hrl").


%% API
-export([
    task_list/0,  %% 返回task list
    info/1    %% 处理加载进程发回的消息
]).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 任务列表
task_list() ->
    [
        ?LOADER_TASK_GROUP(1, serv_start, ?TASK_SEQ, seq_base_load()),
        ?LOADER_TASK_GROUP(2, parallel_load, ?TASK_PARALLEL, parallel_load())
    ].

seq_base_load() ->
    Sid = cs_conf:get_sid(),
    [
        ?LOADER_TASK(serv_start, {fun cs_db_interface:action_public_/3, [1, serv_start, Sid]})
    ].

parallel_load() -> [].

%%-------------------------------------------------------------------
%% 消息处理
info({serv_start_ack, RunNo}) ->
    try
        cs_conf:set_run_no(RunNo),
%%        AreaId = cs_conf:get_area(),
        Sid = cs_conf:get_sid(),
        uid_gen:init(Sid, RunNo),
        data_loader:task_over(serv_start)
    catch _:Err:ST ->
        misc:halt("save serv_start failed, error ~p, current stack ~p", [Err, ST])
    end,
    ok;
info(Info) ->
    ?ERROR("undeal info ~w", [Info]).