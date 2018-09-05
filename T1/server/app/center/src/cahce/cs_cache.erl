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
	init/0, add_check_server/1, del_check_server/1
]).



init() ->
	ets:new(?CS_SERVERS_CHECK_ETS,    [public, named_table, {keypos, #m_all_server_check.id}, ?ETS_WC, ?ETS_RC]),
	ok.


add_check_server(ServerID)->
	ets:insert
	(
		?CS_SERVERS_CHECK_ETS,
		#m_all_server_check{
			id = ServerID,
			time = misc_time:milli_seconds()
		}
	),
	ok.

del_check_server(ServerID)->
	ets:delete
	(
		?CS_SERVERS_CHECK_ETS,
		ServerID
	),
	ok.



