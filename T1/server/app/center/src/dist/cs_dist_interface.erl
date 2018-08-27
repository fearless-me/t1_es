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
-include("cs_ps_def.hrl").

%% API
-export([register_slave_node/1, slave_node_started/1]).
-export([start_master/0, start_independence/1, start_slave/2]).

%% Helper macro for declaring children of supervisor
-define(Wrap(X), fun() -> X end).

start_master() ->
    ?WARN("try to start master node ..."),
    AreaId = cs_conf:get_area(),
    Sid = cs_conf:get_sid(),
    RunNo = cs_conf:get_run_no(),
    Args = lists:concat([" -s dist start  ", " -run_no ", RunNo, " -area_id ", AreaId, " -sid "]),
    gen_server:start({global, pool_master}, pool, [], []),
    start_master_slave('127.0.0.1', center_g, lists:concat([Args, Sid+1])),
    start_master_slave('127.0.0.1', center_t, lists:concat([Args, Sid+2])),
    start_master_slave('127.0.0.1', center_f, lists:concat([Args, Sid+3])),
    ok.

start_independence(SupPid) ->
    start_slave(SupPid, independence),
    ok.

start_master_slave(Host, SlaveName, Args) ->
    Node = misc_dist:start_slave(Host, SlaveName, Args),
    pool:attach(Node),
    cs_share:sync(Node),
    ok.

register_slave_node(Node) ->
    ps:send(?CS_DIST_OTP, slave_register, Node),
    ok.

slave_node_started(Node) ->
    ps:send(?CS_DIST_OTP, slave_started, Node),
    ok.

start_slave(SupPid, Mode) ->
    try
        wrapper({"logger", stdio,   ?Wrap(cs_start_fn:start_logs(SupPid))}),
        wrapper({"error Logger",    ?Wrap(cs_start_fn:start_errlog(SupPid))}),
        wrapper({"gen rpc app",     ?Wrap(cs_start_fn:start_rpc(SupPid))}),
        wrapper({"start mnesia",    ?Wrap(mne_ex:start())}),
        wrapper({"start logic otp", ?Wrap(start_slave_otp(Mode, node(), SupPid))}),
        ok
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,
    ?WARN("###slave ~p start ok###", [node()]),
    ok.

start_slave_otp(dist, 'cg@127.0.0.1', SupPid)->
    wrapper({"create dist_exam_otp",    ?Wrap(cs_start_fn:start_otp(SupPid, dist_exam_otp, worker))}),
    wrapper({"create dist_sup",         ?Wrap(cs_start_fn:start_otp(SupPid, dist_sup, supervisor))}),
    ok;
start_slave_otp(dist, 'ct@127.0.0.1', SupPid)->
    wrapper({"create team_otp",         ?Wrap(cs_start_fn:start_otp(SupPid, team_otp, worker))}),
    wrapper({"create dist_sup",         ?Wrap(cs_start_fn:start_otp(SupPid, dist_sup, supervisor))}),
    ok;
start_slave_otp(dist, _Node, SupPid) ->
    wrapper({"create dist_sup",         ?Wrap(cs_start_fn:start_otp(SupPid, dist_sup, supervisor))}),
    ok;
start_slave_otp(dist, _Node, SupPid) ->
    wrapper({"create dist_exam_otp",    ?Wrap(cs_start_fn:start_otp(SupPid, dist_exam_otp, worker))}),
    wrapper({"create team_otp",         ?Wrap(cs_start_fn:start_otp(SupPid, team_otp, worker))}),
    ok.


wrapper({Msg, stdio, Thunk}) ->
    io:format("~s ~n", [Msg]),
    Thunk(),
    ok;
wrapper({Msg, Thunk}) ->
    ?INFO("~s ...", [Msg]),
    try Thunk()
    catch _ : Err : ST ->
        misc:halt("~n## run \'~ts\' failed ##~n ~p ~n ~p", [Msg, Err, ST])
    end,
    ?INFO("~s done #", [Msg]),
    ok.