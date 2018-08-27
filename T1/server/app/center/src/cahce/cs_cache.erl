%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 十月 2017 17:37
%%%-------------------------------------------------------------------
-module(cs_cache).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_priv.hrl").

%% API
-export([
	init/0, add_to_check/1, del_from_check/1
]).



init() ->
	ets:new(?CS_SERVERS_CHECK_ETS,    [public, named_table, {keypos, #m_all_server_check.id}, ?ETS_WC, ?ETS_RC]),
	ets:new(?CROSS_SELECT_POLICY_ETS, [public, named_table, {keypos, #pub_kv.key}, ?ETS_WC, ?ETS_RC]),
	init_select_policy(),

	ok.



%%%-------------------------------------------------------------------
init_select_policy()->
    ets:insert(?CROSS_SELECT_POLICY_ETS, #pub_kv{key = ?SelectPolicy_Turn, value = 0}),
    ets:insert(?CROSS_SELECT_POLICY_ETS, #pub_kv{key = ?SelectPolicy_Full, value = 0}),
    ets:insert(?CROSS_SELECT_POLICY_ETS, #pub_kv{key = ?SelectPolicy_Rand, value = 0}),
    ok.


add_to_check(ServerID)->
	ets:insert(?CS_SERVERS_CHECK_ETS, #m_all_server_check{id = ServerID, time = misc_time:milli_seconds()}),
	ok.

del_from_check(ServerID)->
	ets:delete(?CS_SERVERS_CHECK_ETS, ServerID),
	ok.



