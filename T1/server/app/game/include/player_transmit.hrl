%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 20:53
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(PLAYER_HRL).
-define(PLAYER_HRL, true).

-record(player_transmit, {
    player_id = 0,
    lock_pid = 0
}).
-define(PLAYER_TRANSMIT_ETS, player_transmit_ets__).


-endif.  %%PLAYER_HRL
