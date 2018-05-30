%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 10:58
%%%-------------------------------------------------------------------
-module(gconf).
-author("mawenhong").

%% API
-export([start/1]).
-export([get_area/0]).
-export([get_sid/0]).
-export([get_db_conf/0]).

%%-------------------------------------------------------------------
-define(GS_INI_CONF, gsIniConfig).

%%-------------------------------------------------------------------
start(FileName) ->
    ok = econfig:register_config(?GS_INI_CONF, [FileName]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
get_db_conf()->
    Conf = econfig:get_value(?GS_INI_CONF, db_conf),
    lists:map(fun({K,V}) -> {erlang:list_to_atom(K),V} end, Conf).

get_area() ->
    econfig:get_integer(?GS_INI_CONF, server, area_id).

get_sid() ->
    econfig:get_integer(?GS_INI_CONF, server, server_id).


