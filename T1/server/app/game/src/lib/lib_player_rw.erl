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
-include("obj.hrl").

%% API
-export([get_player_status/0, set_player_status/1]).
-export([set_code/1, get_code/0]).
-export([get_uid/0]).
-export([set_pos/1, get_pos/0]).
-export([set_map_pid/1, get_map_pid/0]).
-export([set_map_id/1, get_map_id/0]).
-export([set_pre_map_id/1, get_pre_map_id/0]).



get_uid() ->
    case get('UID') of
        undefined ->
            Uid = code_gen:gen(?OBJ_USR),
            set_uid(Uid),
            Uid;
        V -> V
    end.

set_uid(Uid) -> put('UID', Uid).

set_pre_map_id(MapId) ->
    put('PRE_MAP_ID', MapId).

get_pre_map_id() ->
    case get('PRE_MAP_ID') of
        undefined -> 1;
        MapId -> MapId
    end.

get_map_id() ->
    case get('MAP_ID') of
        undefined -> 1;
        MapId -> MapId
    end.

set_map_id(MapId) -> put('MAP_ID', MapId).

get_map_pid() -> get('MAP_PID').
set_map_pid(Pid) -> put('MAP_PID', Pid).

set_pos(Pos) -> put('POSITION', Pos).
get_pos()    ->
    case get('POSITION') of
        undefined -> #vector3{x = 199.1, y= 0, z = 1255.3};
        Position  -> Position
    end.

get_code()     -> get('CODE').
set_code(Code) -> put('CODE', Code).

set_player_status(Status) ->
    put(?PLAYER_STATUS, Status),
    ok.

get_player_status() ->
    case get(?PLAYER_STATUS) of
        undefined -> ?PS_ERROR;
        V -> V
    end.