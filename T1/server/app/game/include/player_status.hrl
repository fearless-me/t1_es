%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 16:43
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(PLAYER_STATUS_HRL).
-define(PLAYER_STATUS_HRL, true).

-define(PS_ERROR, -1).
-define(PS_INIT, 0).
-define(PS_VERIFY, 1).
-define(PS_WAIT_ROLELIST, 2).
-define(PS_WAIT_CREATE, 3).
-define(PS_WAIT_SELECT, 4).
-define(PS_WAIT_LOAD, 5).
-define(PS_WAIT_ENTER, 6).
-define(PS_GAME, 7).
-define(PS_CHANGEMAP, 8).
-define(PS_OFFLINE, 9).
-define(PS_MAX, 9).

-type player_status() :: ?PS_ERROR .. ?PS_MAX.

-define(PLAYER_STATUS, player_status__).

-endif.
