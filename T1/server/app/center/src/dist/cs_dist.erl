%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 八月 2018 15:04
%%%-------------------------------------------------------------------
-module(cs_dist).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([start_master/0, start_slave/1]).

%% Helper macro for declaring children of supervisor
-define(Wrap(X), fun() -> X end).

start_master() ->
    ?WARN("try to start master node ..."),
    gen_server:start({global, pool_master}, pool, [], []),
    start_master_slave('127.0.0.1', center_g, " -s dist start "),
    start_master_slave('127.0.0.1', center_t, " -s dist start "),
    start_master_slave('127.0.0.1', center_f, " -s dist start "),
    ok.

start_master_slave(Host, SlaveName, Args) ->
    Node = misc_dist:start_slave(Host, SlaveName, Args),
    pool:attach(Node),
    lib_cs_share:sync(Node),
    ok.

start_slave(SupPid) ->
    try
        wrapper({"logger", stdio,   ?Wrap(cs_start_fn:start_logs(SupPid))}),
        wrapper({"error Logger",    ?Wrap(cs_start_fn:start_errlog(SupPid))}),
        wrapper({"gen rpc app",     ?Wrap(cs_start_fn:start_rpc(SupPid))}),
        wrapper({"start mnesia",    ?Wrap(start_mnesia(SupPid))}),
        wrapper({"start logic otp", ?Wrap(start_slave_otp(node(), SupPid))}),
        ok
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,
    ?WARN("###slave ~p start ok###", [node()]),
    ok.

start_mnesia(_SupPid) ->
    mne_ex:start(),
    ok.

start_slave_otp('cg@127.0.0.1', SupPid)->
    wrapper({"create dist_exam_otp",    ?Wrap(cs_start_fn:start_slave_otp(SupPid, dist_exam_otp, worker))}),
    wrapper({"create dist_sup",         ?Wrap(cs_start_fn:start_slave_otp(SupPid, cs_dist_sup, supervisor))}),
    ok;
start_slave_otp('ct@127.0.0.1', SupPid)->
    wrapper({"create team_otp",         ?Wrap(cs_start_fn:start_slave_otp(SupPid, team_otp, worker))}),
    wrapper({"create dist_sup",         ?Wrap(cs_start_fn:start_slave_otp(SupPid, cs_dist_sup, supervisor))}),
    ok;
start_slave_otp(_Node, SupPid) ->
    wrapper({"create dist_sup",         ?Wrap(cs_start_fn:start_slave_otp(SupPid, cs_dist_sup, supervisor))}),
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