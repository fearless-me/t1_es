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
-define(SHARE_TABLE(Node, Rec), {Rec,  [{ram_copies, [Node]}, {attributes, record_info(fields, Rec)}, ?STORE_ARG]}).
-define(SHARE_LOCAL_TABLE(Node, Rec), {Rec,  [{local_content, true}, {ram_copies, [Node]}, {attributes, record_info(fields, Rec)}, ?STORE_ARG]}).

frag_share_tables() ->
    _Node = node(),
    [
    ].

share_tables() ->
    Node = node(),
    [
        ?SHARE_TABLE(Node, m_server_info),
        ?SHARE_TABLE(Node, m_team_info),
        ?SHARE_TABLE(Node, m_uid_ref_tid),
        ?SHARE_TABLE(Node, m_player_match),
        ?SHARE_LOCAL_TABLE(Node, m_player_cross_lock),
        ?SHARE_LOCAL_TABLE(Node, m_player_cross_data)
    ].