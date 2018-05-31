%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 暂时先放在这里，将来可能会被替换掉
%%% @end
%%% Created : 18. 五月 2018 11:28
%%%-------------------------------------------------------------------
-module(lib_player_rw).
-author("mawenhong").
-include("player_status.hrl").
-include("map.hrl").
-include("vector3.hrl").

%% API
-export([set_uid/1, get_uid/0]).
-export([set_aid/1, get_aid/0]).
-export([set_sid/1, get_sid/0]).
-export([get_status/0, set_status/1]).

%%%-------------------------------------------------------------------
get_aid()           -> get('ACC_UID').
set_aid(AccId)      -> put('ACC_UID', AccId).
%%%-------------------------------------------------------------------
get_uid()           -> get('UID').
set_uid(Uid)        -> put('UID', Uid).
%%%-------------------------------------------------------------------
get_sid()           -> get('SID').
set_sid(Uid)        -> put('SID', Uid).
%%%-------------------------------------------------------------------
set_status(Status)  -> put(?PLAYER_STATUS, Status).
get_status()        -> case get(?PLAYER_STATUS) of undefined -> ?PS_ERROR; V -> V end.