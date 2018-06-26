%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:19
%%%-------------------------------------------------------------------
-module(ai_state).
-author("mawenhong").

%% API
-export([
    on_enter/2, on_exit/2, update/2, on_event/2
]).

on_enter(_Uid, _Type) -> ok.
on_exit(_Uid, _Type) -> ok.
update(_Uid, _Type) -> ok.
on_event(_Uid, _Type) -> ok.