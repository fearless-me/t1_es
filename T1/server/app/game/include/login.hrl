%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:24
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(LOGIN_HRL).
-define(LOGIN_HRL, true).

-record(login_req,{
    account_id = 0,
    account_name = "",
    player_pid = 0
}).

-record(login_ack,{
   account_id = 0,
   error = 0
}).



-endif.
