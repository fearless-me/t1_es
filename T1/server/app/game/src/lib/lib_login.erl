%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 9:57
%%%-------------------------------------------------------------------
-module(lib_login).
-author("mawenhong").

-export([login_/1, logout_/1]).

login_(Req)         -> ps:send(gen_mod_login, login_req,Req).
logout_(AccountID)  -> ps:send(gen_mod_login, logout, AccountID).