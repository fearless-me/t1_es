%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 八月 2018 16:24
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(DEF_GS_DB_POOL_HRL).
-define(DEF_GS_DB_POOL_HRL, true).

%%--------------------------------------------------------------------
-define(PLAYER_DB_POOL_NAME, pdb_pool).
-define(ACCOUNT_DB_POOL_NAME, adb_pool).
-define(PUBLIC_DB_POOL_NAME, pubdb_pool).
-define(INIT_DB_POOL_TIMEOUT, 50 * 1000).

-endif.
