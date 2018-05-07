%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 11:22
%%%-------------------------------------------------------------------
-module(mnesia_starter).
-author("mawenhong").
-include("logger.hrl").

-define(MnesiaTabSplit, 10).
-define(MnesiaNameMod, mnesia_mem_name_mod).

%% API
-export([
    start/0, stop/0,
    get_mem_table/1
]).

-export([test/0]).
%%%-------------------------------------------------------------------
get_mem_table(Tab)->
    ?MnesiaNameMod:get(Tab).

%%%-------------------------------------------------------------------
start() ->
    start_mnesia(),

    Tables = tables(),
    start_mnesia_mod(Tables),
    start_create_mnesia_table(Tables),
    ok.

%%%-------------------------------------------------------------------
stop() ->
    ?INFO("starting ~-40s", ["stop mnesia"]),
    ok.

%%%-------------------------------------------------------------------
start_mnesia() ->
    ?INFO("starting ~-40s ...", ["start mnesia"]),
    mnesia_utils:start(),
    ?INFO("done"),
    ok.

start_mnesia_mod(Tables) ->
    ?INFO("starting ~-40s ...", ["start mnesia mod"]),
    ServerID = 1,
    mnesia_dynamic:create_mem_table_mod(ServerID, ?MnesiaNameMod, [Tab || {Tab, _TabDef} <- Tables]),
    check_mem_table_mod(),
    ?INFO("done"),
    ok.

start_create_mnesia_table(Tables) ->
    lists:foreach(
        fun({Tab, TabDef}) ->
            TabNameAtom = ?MnesiaNameMod:get(Tab),
            ?INFO("create mnesia table ~w -> ~w ...", [Tab, TabNameAtom]),
            Ret = mnesia_utils:create_table(TabNameAtom, TabDef),
            ?INFO("done[~w]~n",[Ret])
        end, Tables),
    ok.

%%%-------------------------------------------------------------------
check_mem_table_mod() ->
    ?MnesiaNameMod = ?MnesiaNameMod:module_info(module),
    ok.

%%%-------------------------------------------------------------------
tables() ->
    [
%%        {player_data, [{ram_copies, [node()]}, {attributes, record_info(fields, player_data)}, {local_table, true}]}
    ].

%%%-------------------------------------------------------------------
-record(player_data_test,{id, data, version}).
test() ->
    mnesia_starter:start(),
    Tables = [
        {player_data_test, [{ram_copies, [node()]}, {attributes, record_info(fields, player_data_test)}, {local_content, true}]}
    ],
    start_mnesia_mod(Tables),
    start_create_mnesia_table(Tables),
    ok.