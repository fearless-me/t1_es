%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 八月 2018 11:16
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(CS_DBPOOL_DEF_HRL).
-define(CS_DBPOOL_DEF_HRL, true).

%%--------------------------------------------------------------------
-define(DATA_DB_POOL_NAME, pdb_pool).
-define(ACCOUNT_DB_POOL_NAME, adb_pool).
-define(PUBLIC_DB_POOL_NAME, pubdb_pool).
-define(LOG_DB_POOL_NAME, logdb_pool).
-define(INIT_DB_POOL_TIMEOUT, 50 * 1000).

-endif.
