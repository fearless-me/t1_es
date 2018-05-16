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
-include("login.hrl").
-include("obj.hrl").

-export([init_from_db/1]).
-export([login_ack/1]).
-export([add_to_world/0, go_to_new_map/2]).
-export([get_player_status/0, set_player_status/1]).

%%%-------------------------------------------------------------------
login_ack(#login_ack{error = 0, account_info = AccountIfo}) ->
    mod_player:send(#pk_LS2U_LoginResult{
        accountID = AccountIfo#account_info.account_id,
        identity = "",
        result = 0,
        msg = io_lib:format("ErrorCode:~p", [0])
    }),
    lib_player:set_player_status(?PS_WAIT_ROLELIST),
    ok;
login_ack(#login_ack{error = Error}) ->
    mod_player:send(#pk_LS2U_LoginResult{
        accountID = 0,
        identity = "",
        result = Error,
        msg = io_lib:format("ErrorCode:~p", [Error])
    }),
    ok.

%%%-------------------------------------------------------------------
init_from_db(_DataBin) ->
    set_player_status(?PS_WAIT_ENTER),
    add_to_world(),
    ok.

add_to_world() ->
    PlayerID = get_player_id(),
    MapID = get_player_map_id(),
    Pos = get_player_pos(),
    Ack = mod_map_creator:take_over_player_online(
        MapID,
        #change_map_req{
            player_id = PlayerID,
            player_pid = self(),
            map_id = MapID,
            pos = Pos,
            obj = make_obj()
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
            pos = Pos,
            obj = make_obj()
        }
    ),
    
    ?DEBUG("go_to_new_map(~p, ~w) -> ~w", [DestMapID, Pos, Ack]),
    mod_player:send(#pk_U2GS_ChangeMap{
        newMapID = Ack#change_map_ack.map_id,
        fX = Ack#change_map_ack.pos#vector3.x,
        fY = Ack#change_map_ack.pos#vector3.y
    }),
    ok.


get_player_id() -> 99999.
get_player_map_id() -> 1.
get_player_pos() -> #vector3{x = 199.1, y= 0, z = 1255.3}.

set_player_status(Status) ->
    put(?PLAYER_STATUS, Status),
    ok.

get_player_status() ->
    case get(?PLAYER_STATUS) of
        undefined -> ?PS_ERROR;
        V -> V
    end.

make_obj() ->
    #obj{type = ?OBJ_USR, pos = get_player_pos(), pid = self()}.
