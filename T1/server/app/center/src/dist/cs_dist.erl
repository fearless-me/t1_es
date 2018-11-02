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
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_ps_def.hrl").

%% API
-export([start_master/1, start_independence/1, slave_start/2]).

%% Helper macro for declaring children of supervisor
-define(Wrap(X), fun() -> X end).


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
start_independence(_SupPid) ->
    ?WARN("try to start independence mode ..."),
    misc:fn_wrapper("start team  srv", fun() -> true = misc:start_app(team) end),
    misc:fn_wrapper("start guild srv", fun() -> true = misc:start_app(guild) end),
    misc:fn_wrapper("start activity srv", fun() -> true = misc:start_app(activity) end),
    ?WARN("try to start independence mode done #"),
    ok.

start_distribution('center_team@192.168.18.52', _SupPid) ->
    misc:fn_wrapper("start team  srv", fun() -> true = misc:start_app(team) end),
    ok;
start_distribution('center_guild@192.168.18.52', _SupPid) ->
    misc:fn_wrapper("start guild srv", fun() -> true = misc:start_app(guild) end),
    ok;
start_distribution('center_activity@192.168.18.52', _SupPid) ->
    misc:fn_wrapper("start activity srv", fun() -> true = misc:start_app(activity) end),
    ok;
start_distribution(_SlaveNode, _SupPid) ->
    misc:fn_wrapper("start team  srv", fun() -> true = misc:start_app(team) end),
    misc:fn_wrapper("start guild srv", fun() -> true = misc:start_app(guild) end),
    misc:fn_wrapper("start activity srv", fun() -> true = misc:start_app(activity) end),
    ok.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
start_master(_SupPid) ->
    %%/////////////////////////////////////////
    ?WARN("try to start distribution mode ..."),
    AreaId = cs_conf:get_area(),
    Sid = cs_conf:get_sid(),
    RunNo = cs_conf:get_run_no(),
    Args = lists:concat([" -s dist start  ", " -run_no ", RunNo, " -area_id ", AreaId, " -sid "]),
    gen_server:start({global, pool_master}, pool, [], []),
    start_master_slave('192.168.18.52', center_team, lists:concat([Args, Sid + 1])),
    start_master_slave('192.168.18.52', center_guild, lists:concat([Args, Sid + 2])),
    start_master_slave('192.168.18.52', center_activity, lists:concat([Args, Sid + 3])),
    
    watchdog:continue_group(2),
    %%/////////////////////////////////////////
    watchdog:wait_group(2),
    ?WARN("try to start distribution mode done #"),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
slave_start(SupPid, _Mode) ->
    [NodeName | _] = string:tokens(atom_to_list(node()), "@"),
    misc:fn_wrapper("config init", ?Wrap(cs_conf:start("center.ini")), stdio),
    misc:fn_wrapper("logger", ?Wrap(loggerS:start(NodeName)), stdio),
    misc:fn_wrapper("error Logger", ?Wrap(common_error_logger:start(dist_sup, center_dist))),
    misc:fn_wrapper("gen rpc app", ?Wrap(misc:start_all_app(gen_rpc))),
    misc:fn_wrapper("db window", ?Wrap(cs_db_starter:start())),
    misc:fn_wrapper("start mnesia", ?Wrap(cs_dist_share:start())),
    misc:fn_wrapper("start distribution", ?Wrap(start_distribution(node(), SupPid))),
    slave_send_2_master(),
    ?WARN("###slave ~p start ok###", [node()]),
    ok.



%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------

start_master_slave(Host, SlaveName, Args) ->
    Node = misc_dist:start_slave(Host, SlaveName, Args),
    pool:attach(Node),
    register_slave_node(Node),
    ok.

register_slave_node(Node) ->
    ps:send(?DIST_MONITOR_OTP, slave_register, Node),
    ok.


slave_send_2_master() ->
    case misc:master_node() of
        undefined -> ok;
        MasterNode -> ps:send({?DIST_MONITOR_OTP, MasterNode}, slave_started, node())
    end,
    ok.

