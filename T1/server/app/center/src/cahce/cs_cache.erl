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
	my_ets:new(?ETS_CACHE_SERVER_CHECK,    [public, named_table, {keypos, #m_cache_server_check.id}, ?ETS_WC, ?ETS_RC]),
	ok.


add_check_server(ServerID)->
	my_ets:write
	(
		?ETS_CACHE_SERVER_CHECK,
		#m_cache_server_check{
			id = ServerID,
			time = misc_time:milli_seconds()
		}
	),
	ok.

del_check_server(ServerID)->
	my_ets:delete
	(
		?ETS_CACHE_SERVER_CHECK,
		ServerID
	),
	ok.



