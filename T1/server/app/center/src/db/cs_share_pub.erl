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
-include("common_rec.hrl").
-include("common_cross_inc.hrl").
-include("cs_priv.hrl").
-include("common_team_inc.hrl").

%% API
-export([frag_share_tables/0, share_tables/0]).

-define(STORE_ARG,                          {storage_properties, [{ets, [{read_concurrency, true}]}]}).
-define(SHARE_SHARE_TABLE(Node, Rec),       {Rec,  [{ram_copies, [Node]}, {attributes, record_info(fields, Rec)}, ?STORE_ARG]}).
-define(SHARE_SHARE_TABLE(Node, Tab, Rec),  {Tab,  [{ram_copies, [Node]}, {attributes, record_info(fields, Rec)}, ?STORE_ARG]}).
-define(SHARE_LOCAL_TABLE(Node, Rec),       {Rec,  [{local_content, true}, {ram_copies, [Node]}, {attributes, record_info(fields, Rec)}, ?STORE_ARG]}).
-define(SHARE_LOCAL_TABLE(Node, Tab, Rec),  {Tab,  [{local_content, true}, {ram_copies, [Node]}, {attributes, record_info(fields, Rec)}, ?STORE_ARG]}).

frag_share_tables() ->
    _Node = node(),
    [
    ].

share_tables() ->
    Node = node(),
    [
        ?SHARE_SHARE_TABLE(Node, ?ShareServerInfoName,   m_share_server_info),
        ?SHARE_SHARE_TABLE(Node, ?ShareTeamInfoName,     m_share_team_info),
        ?SHARE_SHARE_TABLE(Node, ?ShareUidRefTeamIdName, m_share_uid_ref_tid),
        ?SHARE_LOCAL_TABLE(Node, ?ShareUidTeamMatchName, m_share_team_match),
        ?SHARE_LOCAL_TABLE(Node, ?SharePlayerCrossLock,  m_share_player_cross_lock)
    ].