%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:23
%%%-------------------------------------------------------------------
-module(ai_state_flee).
-author("mawenhong").

%% API
-export([on_enter/1, on_exit/1, update/1, on_event/2]).

on_enter(_Uid) -> ok.
on_exit(_Uid) -> ok.
update(_Uid) -> ok.
on_event(_Uid, _Event) -> ok.