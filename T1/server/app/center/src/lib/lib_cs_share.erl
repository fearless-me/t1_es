%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 八月 2018 11:47
%%%-------------------------------------------------------------------
-module(lib_cs_share).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_priv.hrl").
-include("team.hrl").

%% API
-export([start/0, sync/1]).
-define(STORE_ARG, {storage_properties, [{ets, [{read_concurrency, true}, {write_concurrency, true}]}]}).


frag_share_tables() ->
    _Node = node(),
    [
    ].

share_tables() ->
    Node = node(),
    [
        {m_server_info,  [{ram_copies, [Node]}, {attributes, record_info(fields, m_server_info)}, ?STORE_ARG]},
        {m_team_info,    [{ram_copies, [Node]}, {attributes, record_info(fields, m_team_info)}, ?STORE_ARG]},
        {m_uid_ref_tid,  [{ram_copies, [Node]}, {attributes, record_info(fields, m_uid_ref_tid)}, ?STORE_ARG]},
        {m_player_match, [{ram_copies, [Node]}, {attributes, record_info(fields, m_player_match)}, ?STORE_ARG]}
    ].

start() ->
    db_share:start(),
    db_share:add_share(share_tables()),
    db_share:add_frag_share(frag_share_tables(), 1),
    ok.

sync(Node) ->
    ?INFO("start sync mnesia to ~p ... ", [Node]),
    true = mne_ex:sync(Node),
    lists:foreach(
        fun({Tab, _Arg}) ->
            ?INFO("\tadd table copy ~-20w to ~p ...", [Tab, Node]),
            mne_ex:add_table_copy(Tab, Node, ram_copies)
        end, share_tables()),
    mne_ex:wait_for_tables(),
    ?INFO("start sync mnesia to ~p done #", [Node]),
    ok.


