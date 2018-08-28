%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 10:58
%%%-------------------------------------------------------------------
-module(gs_conf).
-author("mawenhong").

%% API
-export([
    start/1, is_cross/0, get_server_port/0, get_max_connection/0,
    get_area/0,get_sid/0, get_server_name/0, get_server_type/0,
    get_db_conf/0, get_run_no/0, get_center/0,
    set_run_no/1
]).

%%-------------------------------------------------------------------
-define(GS_INI_CONF, gsIniConfig).

%%-------------------------------------------------------------------
start(FileName) ->
    ok = econfig:register_config(?GS_INI_CONF, [FileName]).

%%-------------------------------------------------------------------
set_run_no(RunNo)->
    econfig:set_value(?GS_INI_CONF, server, run_no, RunNo, false),
    ok.

is_cross() ->
    econfig:get_integer(?GS_INI_CONF, server, is_cross, 0) =:= 1.
%%-------------------------------------------------------------------
get_server_port() ->
    econfig:get_integer(?GS_INI_CONF, server, server_port).

get_max_connection() ->
    econfig:get_integer(?GS_INI_CONF, server, max_connection, 2000).

get_db_conf()->
    Conf = econfig:get_value(?GS_INI_CONF, db_conf),
    lists:map(fun({K,V}) -> {erlang:list_to_atom(K),V} end, Conf).

get_area() ->
    econfig:get_integer(?GS_INI_CONF, server, area_id, 1).

get_sid() ->
    econfig:get_integer(?GS_INI_CONF, server, server_id, 1).

get_run_no()->
    econfig:get_integer(?GS_INI_CONF, server, run_no).

get_server_name() ->
    econfig:get_list(?GS_INI_CONF, server, server_name, "unknown").

get_server_type() ->
    econfig:get_integer(?GS_INI_CONF, server, server_type, 1).


get_center() ->
    Center = econfig:get_value(?GS_INI_CONF, center, center, "center@127.0.0.1"),
    misc:to_atom(Center).

