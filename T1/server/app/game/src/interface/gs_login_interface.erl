%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 9:57
%%%-------------------------------------------------------------------
-module(gs_login_interface).
-author("mawenhong").
-include("def_gs_ps.hrl").

-export([login_/1, logout_/1]).

login_(Req)         -> ps:send(?GS_LOGIN_OTP, login_req,Req).
logout_(AccountID)  -> ps:send(?GS_LOGIN_OTP, logout, AccountID).