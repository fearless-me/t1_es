%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 16:43
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(DEF_PLAYER_STATUS_HRL).
-define(DEF_PLAYER_STATUS_HRL, true).

-define(PS_ERROR,              -1).
-define(PS_INIT,                0).
-define(PS_VERIFY,              1).
-define(PS_WAIT_LIST,           2).
-define(PS_WAIT_SELECT_CREATE,  3).
-define(PS_CREATING,            4).
-define(PS_WAIT_LOAD,           5).
-define(PS_WAIT_ENTER,          6).
-define(PS_GAME,                7).
-define(PS_CHANGE_MAP,          8).
-define(PS_OFFLINE,             9).
-define(PS_MAX,                 9).

-type player_status() :: ?PS_ERROR .. ?PS_MAX.
-export_type([player_status/0]).

-define(PLAYER_STATUS, player_status__).

-endif.
