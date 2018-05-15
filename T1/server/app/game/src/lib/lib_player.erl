%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%   player 进程调用
%%% @end
%%% Created : 14. 五月 2018 15:20
%%%-------------------------------------------------------------------
-module(lib_player).
-author("mawenhong").

-include("logger.hrl").
-include("netmsg.hrl").
-include("map.hrl").
-include("player_status.hrl").

-export([init_from_db/1]).
-export([add_to_world/0, go_to_new_map/2]).
-export([get_player_status/0, set_player_status/1]).

init_from_db(_DataBin) ->
    set_player_status(?PS_WAIT_ENTER),
    add_to_world(),
    ok.

add_to_world() ->
    PlayerID = get_player_id(),
    MapID = get_player_map_id(),
    Pos =  get_player_pos(),
    Ack = mod_map_creator:take_over_player_online(
        MapID,
        #change_map_req{
            player_id = PlayerID,
            player_pid = self(),
            map_id = MapID,
            pos = Pos
        }
    ),
    ok.

go_to_new_map(DestMapID, Pos) ->
    PlayerID = get_player_id(),
    MapID = get_player_map_id(),
    set_player_status(?PS_CHANGEMAP),
    Ack = mod_map_creator:player_change_map(
        PlayerID,
        MapID,
        #change_map_req{
            player_id = PlayerID,
            player_pid = self(),
            map_id = DestMapID,
            pos = Pos
        }
    ),
    ok.


get_player_id() -> 0.
get_player_map_id() -> 0.
get_player_pos() -> 0.

set_player_status(Status) ->
    put(?PLAYER_STATUS, Status),
    ok.

get_player_status()->
    case get(?PLAYER_STATUS) of
        undefined -> ?PS_ERROR;
        V -> V
    end.
