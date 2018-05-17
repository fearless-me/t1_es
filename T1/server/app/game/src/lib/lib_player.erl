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
-export([offline/0]).
-export([add_to_world/0, go_to_new_map/2]).
-export([get_player_status/0, set_player_status/1]).
-export([set_code/1, get_code/0]).

%%%-------------------------------------------------------------------
login_ack(#login_ack{error = 0, account_info = AccountIfo}) ->
    mod_player:send(#pk_LS2U_LoginResult{
        accountID = AccountIfo#account_info.account_id,
        identity = "",
        result = 0,
        msg = io_lib:format("ErrorCode:~p", [0])
    }),
    set_code(code_gen:gen(?OBJ_USR)),
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


offline() ->
    mod_map_creator:player_offline(
       get_uid(),
       get_code(),
       get_map_id(),
       get_map_pid()
    ).
%%%-------------------------------------------------------------------
init_from_db(_DataBin) ->
    set_player_status(?PS_WAIT_ENTER),
    add_to_world(),
    ok.

add_to_world() ->
    PlayerID = get_uid(),
    MapID = get_map_id(),
    Pos = get_pos(),
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
    set_map_id(MapID),
    set_map_pid(Ack#change_map_ack.map_pid),
    set_pos(Ack#change_map_ack.pos),
    ok.

go_to_new_map(DestMapID, Pos) ->
    PlayerID = get_uid(),
    MapID = get_map_id(),
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
    
    set_map_id(MapID),
    set_map_pid(Ack#change_map_ack.map_pid),
    set_pos(Ack#change_map_ack.pos),
    ?DEBUG("go_to_new_map(~p, ~w) -> ~w", [DestMapID, Pos, Ack]),
    mod_player:send(#pk_U2GS_ChangeMap{
        newMapID = Ack#change_map_ack.map_id,
        fX = Ack#change_map_ack.pos#vector3.x,
        fY = Ack#change_map_ack.pos#vector3.y
    }),
    ok.


get_uid() -> 99999.

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

make_obj() ->
    #obj{
        type = ?OBJ_USR,
        id   = get_uid(),
        code = get_code(),
        pos  = get_pos(),
        pid  = self()
    }.
