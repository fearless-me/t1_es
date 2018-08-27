%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 八月 2018 11:06
%%%-------------------------------------------------------------------
-module(cs_share_pub).
-author("mawenhong").

-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_priv.hrl").
-include("team.hrl").

%% API
-export([frag_share_tables/0, share_tables/0]).


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