%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 八月 2018 15:04
%%%-------------------------------------------------------------------
-module(cs_dist_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_ps_def.hrl").

%% API
-export([start_master/1, start_independence/1, start_slave/2]).

%% Helper macro for declaring children of supervisor
-define(Wrap(X), fun() -> X end).

start_master(_SupPid) ->

    watchdog:add_task(
        ?WATCHDOG_TASK(
            fun dist_monitor:is_all_slaves_stared/0,
            "wait start all slave ndoe"
        )
    ),

    %%/////////////////////////////////////////
    
    ?WARN("try to start master node ..."),
    AreaId = cs_conf:get_area(),
    Sid = cs_conf:get_sid(),
    RunNo = cs_conf:get_run_no(),
    Args = lists:concat([" -s dist start  ", " -run_no ", RunNo, " -area_id ", AreaId, " -sid "]),
    gen_server:start({global, pool_master}, pool, [], []),
    start_master_slave('127.0.0.1', center_g, lists:concat([Args, Sid+1])),
%%    start_master_slave('127.0.0.1', center_t, lists:concat([Args, Sid+2])),
%%    start_master_slave('127.0.0.1', center_f, lists:concat([Args, Sid+3])),
    
    %%/////////////////////////////////////////
    watchdog:wait(),
    ?WARN("try to start master node done #"),
    ok.

start_independence(SupPid) ->
    ?WARN("try to start independence mode ..."),
    start_slave(SupPid, allin),
    ?WARN("try to start independence mode done #"),
    ok.

start_master_slave(Host, SlaveName, Args) ->
    Node = misc_dist:start_slave(Host, SlaveName, Args),
    pool:attach(Node),
    register_slave_node(Node),
    ok.

register_slave_node(Node) ->
    ps:send(?DIST_MONITOR_OTP, slave_register, Node),
    ok.

start_slave(SupPid, Mode) ->
    try
        misc:fn_wrapper({"logger", stdio,   ?Wrap(loggerS:start())}),
        misc:fn_wrapper({"error Logger",    ?Wrap(common_error_logger:start(dist_sup, center_dist))}),
        misc:fn_wrapper({"gen rpc app",     ?Wrap(misc:start_all_app(gen_rpc))}),
        misc:fn_wrapper({"config init",     ?Wrap(cs_conf:start("center.ini"))}),
        misc:fn_wrapper({"db window",       ?Wrap(cs_db_starter:start())}),
        misc:fn_wrapper({"start mnesia",    ?Wrap(cs_dist_share:start())}),
        misc:fn_wrapper({"start logic otp", ?Wrap(start_slave_otp(Mode, node(), SupPid))}),
        ok
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,
    slave_send_2_master(),
    ?WARN("###slave ~p start ok###", [node()]),
    ok.

slave_send_2_master()->
    case misc:master_node() of
        undefined -> ok;
        MasterNode -> ps:send({?DIST_MONITOR_OTP, MasterNode}, slave_started, node())
    end,
    ok.

start_slave_otp(dist, 'center_g@127.0.0.1', SupPid)->
    misc:fn_wrapper({"create team_otp",         ?Wrap(misc:start_otp(SupPid, team_otp, worker))}),
    misc:fn_wrapper({"create dist_exam_otp",    ?Wrap(misc:start_otp(SupPid, dist_exam_otp, worker))}),
    misc:fn_wrapper({"create cs_dist_sup",         ?Wrap(misc:start_otp(SupPid, cs_dist_sup, supervisor))}),
    ok;
start_slave_otp(dist, _Node, SupPid) ->
    misc:fn_wrapper({"create cs_dist_sup",         ?Wrap(misc:start_otp(SupPid, cs_dist_sup, supervisor))}),
    ok;
start_slave_otp(allin, _Node, SupPid) ->
    misc:fn_wrapper({"create dist_exam_otp",    ?Wrap(misc:start_otp(SupPid, dist_exam_otp, worker))}),
    misc:fn_wrapper({"create team_otp",         ?Wrap(misc:start_otp(SupPid, team_otp, worker))}),
    ok.
