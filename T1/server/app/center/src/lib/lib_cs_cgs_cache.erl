%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 十月 2017 17:37
%%%-------------------------------------------------------------------
-module(lib_cs_cgs_cache).
-author("mawenhong").

-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_priv.hrl").
%% API
-export([
	init/0, add_to_check/1, del_from_check/1
%%	insertServerInfo/1,
%%	readServerInfo/1,
%%	delServerInfo/1,
%%	updateServerInfo/2
]).



init() ->
	ets:new(?GCS_CK_REG, [public, named_table, {keypos, #recServerCheck.id}, {read_concurrency, true}, {write_concurrency, true}]),
	ets:new(?GS_SELECT_REG, [public, named_table, {keypos, #pub_kv.key}, {read_concurrency, true}, {write_concurrency, true}]),
	init_select_policy(),

	ok.

init_select_policy()->
	ets:insert(?GS_SELECT_REG, #pub_kv{key = ?SelectPolicy_Turn, value = 0}),
	ets:insert(?GS_SELECT_REG, #pub_kv{key = ?SelectPolicy_Full, value = 0}),
	ets:insert(?GS_SELECT_REG, #pub_kv{key = ?SelectPolicy_Rand, value = 0}),
	ok.


%%%-------------------------------------------------------------------
add_to_check(ServerID)->
	ets:insert(?GCS_CK_REG, #recServerCheck{id = ServerID, time = time:milli_seconds()}),
	ok.

del_from_check(ServerID)->
	ets:delete(?GCS_CK_REG, ServerID),
	ok.


%%insertServerInfo(Info) ->
%%	ets:insert(?GLOBAL_GS_ETS, Info),
%%	ok.
%%readServerInfo(ServerID) ->
%%	case myEts:readRecord(?GLOBAL_GS_ETS, ServerID) of
%%		#m_server_info{} = Info ->
%%			Info;
%%		_ ->
%%			undefined
%%	end.

%%delServerInfo(ServerID) ->
%%	ets:delete(?GLOBAL_GS_ETS, ServerID),
%%	ok.

%%updateServerInfo(ServerID, List)->
%%	ets:update_element(?GLOBAL_GS_ETS, ServerID, List),
%%	ok.




