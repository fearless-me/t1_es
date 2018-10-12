%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 11:29
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(CS_PRIV_HRL).
-define(CS_PRIV_HRL, true).


-define(SERVER_MGR_TICK, 100).
-define(ServerAckTime, 60 * 1000).

-define(ETS_CACHE_SERVER_CHECK, m_all_server_check).
-record(m_cache_server_check, {id = 0, time = 0}).

-endif.
