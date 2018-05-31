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
-include("common_record.hrl").
-include("map_obj.hrl").
-include("db_record.hrl").
-include("player_record.hrl").
-include("vector3.hrl").

-export([init/0]).
-export([login_ack/1]).
-export([loaded_player_list/1]).
-export([create_player_/1, create_player_ack/1]).
-export([select_player/1]).
-export([loaded_player/1]).
-export([offline/0]).
-export([go_to_new_map/2, return_to_pre_map/0]).
-export([teleport/1, teleport_/1]).

init() ->
    lib_player_rw:set_status(?PS_INIT),
    ok.

%%
init_on_create() ->
    ok.
%%%-------------------------------------------------------------------
unique_register(AccId) ->
    try  misc:register_process(self(), player, [AccId] ) of
         true -> sucess
    catch _ : _  -> repeat_login end.

%%%-------------------------------------------------------------------
login_ack(#r_login_ack{error = 0, account_info = AccountIfo}) ->
    #p_account{ accountID = AccId} = AccountIfo,
    Ret = unique_register(AccId),
    login_ack_success(Ret, AccountIfo),
    ok;
login_ack(#r_login_ack{error = Error}) ->
    mod_player:send(#pk_GS2U_LoginResult{
        result = Error,
        msg = io_lib:format("ErrorCode:~p", [Error])
    }),
    ok.

%%%-------------------------------------------------------------------
login_ack_success(sucess, AccountIfo) ->
    Aid = AccountIfo#p_account.accountID,
    mod_player:send(#pk_GS2U_LoginResult{
        accountID = Aid,
        identity = "",
        result = 0,
        msg = io_lib:format("ErrorCode:~p", [0])
    }),
    lib_player_rw:set_aid(Aid),
    lib_player_rw:set_status(?PS_WAIT_LIST),
    lib_db:action_p_(Aid, load_player_list, Aid),
    ok;
login_ack_success(Reason, AccountIfo) ->
    #p_account{accountID = Aid} = AccountIfo,
    ?WARN("acc ~w register process ~p faild with ~w",
        [Aid, self(), Reason]),
    mod_player:send(#pk_GS2U_LoginResult{
        result = -1,
        msg = io_lib:format("ErrorCode:~p", [Reason])
    }),
    lib_player_rw:set_status(?PS_ERROR),
    mod_player:shutdown(read),
    kick_account(Aid),
    ok.

kick_account(Aid) ->
    Name = misc:create_atom(player, [Aid]),
    ps:send(Name, kick, repeat_login),
    ok.

%%%-------------------------------------------------------------------
loaded_player_list([]) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    mod_player:send(#pk_GS2U_UserPlayerList{}),
    ok;
loaded_player_list(RoleList) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    Info = lists:map(
        fun(#p_player{
            uid = Uid, 
            name = Name,
            level = Lv,
            wing_level = Wlv,
            sex = Sex,
            camp = Camp,
            race = Race,
            career = Career,
            head = Head,
            map_id = MapId,
            old_map_id = OldMapId
        })->
            #pk_UserPlayerData{
                roleID = Uid, name = Name,
                level = Lv, wingLevel = Wlv,
                camp = Camp, career = Career,
                race = Race, sex = Sex, head = Head,
                mapID = MapId, oldMapID = OldMapId
            }
        end, RoleList),
    mod_player:send(#pk_GS2U_UserPlayerList{info = Info}),
    ok.

%%%-------------------------------------------------------------------
create_player_(Req) ->
    Aid = lib_player_rw:get_aid(),
    lib_player_rw:set_status(?PS_CREATING),
    lib_db:action_p_(Aid, create_player, {Aid, Req}),
    ok.

%%%-------------------------------------------------------------------
create_player_ack(#r_create_player_ack{error = 0, uid = Uid}) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    init_on_create(),
    mod_player:send(#pk_GS2U_CreatePlayerResult{
        errorCode = 0, roleID = Uid
    });
create_player_ack(#r_create_player_ack{error = Err}) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    mod_player:send(#pk_GS2U_CreatePlayerResult{errorCode = Err}).

%%%-------------------------------------------------------------------
select_player(Uid) ->
    Aid = lib_player_rw:get_aid(),
    lib_player_rw:set_status(?PS_WAIT_LOAD),
    lib_player_rw:set_uid(Uid),
    lib_db:action_p_(Aid, load_player_data, {Aid, Uid}),
    ok.

%%%-------------------------------------------------------------------
loaded_player(undefined) ->
    Aid = lib_player_rw:get_aid(),
    Uid = lib_player_rw:get_uid(),
    ?ERROR("~p load player ~p failed",[Aid, Uid]),
    lib_player_rw:set_uid(0),
    ok;
loaded_player(Player) ->
    #p_player{uid = Uid, sid = Sid} = Player,
    lib_mem:new_player(Player),
    lib_player_rw:set_uid(Uid),
    lib_player_rw:set_sid(Sid),
    lib_player_rw:set_status(?PS_WAIT_ENTER),
    add_to_world(Player),
    ok.

%%%-------------------------------------------------------------------
add_to_world(Player) ->
    #p_player{uid = Uid, map_id = Mid, x = X, y = Y} = Player,
    Pos = vector3:new(X, 0, Y),
    Ack = mod_map_creator:take_player_online(
        Mid,
        #r_change_map_req{
            uid = Uid,
            player_pid = self(),
            tar_map_id = Mid,
            tar_pos = Pos,
            obj = make_obj(Pos)
        }
    ),
    ?DEBUG("take over online:~w",[Ack]),

    lib_mem:player_update(
        Uid,
        [
            {#m_player.old_mid, Mid},
            {#m_player.mid, Mid},
            {#m_player.mpid, Ack#r_change_map_ack.map_pid},
            {#m_player.pos, Ack#r_change_map_ack.pos}
        ]
    ),
    ok.

%%-------------------------------------------------------------------
teleport_(NewPos) -> ps:send(self(), teleport, NewPos).

%%-------------------------------------------------------------------
teleport(NewPos) ->
    Uid = lib_player_rw:get_uid(),
    #m_player{mpid = MPid} = lib_mem:get_player(Uid),
    teleport_1(MPid, NewPos).

teleport_1(undefined, _NewPos) ->
    ?ERROR("");
teleport_1(MapPid, NewPos) ->
    Uid = lib_player_rw:get_uid(),
    mod_map:player_teleport(
        MapPid,
        #r_teleport_req{ uid = Uid, tar_pos = NewPos }
    ),
    ok.

%%-------------------------------------------------------------------
go_to_new_map(DestMapID, Pos) ->
    go_to_new_map_1(DestMapID, Pos),
    ok.

%%-------------------------------------------------------------------
go_to_new_map_1(DestMapID, TarPos) ->
    lib_player_rw:set_status(?PS_CHANGE_MAP),
    Uid = lib_player_rw:get_uid(),
    #m_player{mid = Mid,line = Line, mpid = MPid, pos = Pos} = lib_mem:get_player(Uid),
    Ack = mod_map_creator:player_change_map(
        #r_change_map_req{
            uid = Uid, player_pid = self(),
            map_id =  Mid, map_pid = MPid,
            tar_map_id = DestMapID, tar_pos = TarPos,
            obj = make_obj(TarPos)
        }
    ),

    #r_change_map_ack{map_id = Mid1, line_id = Line1, map_pid = Mpid1} = Ack,
    lib_mem:player_update(
        Uid,
        [
            {#m_player.old_mid, Mid},
            {#m_player.old_line, Line},
            {#m_player.old_pos, Pos},
            {#m_player.mid, Mid1},
            {#m_player.line, Line1},
            {#m_player.mpid, Mpid1},
            {#m_player.pos, TarPos}
        ]
    ),
    ?DEBUG("go_to_new_map(~p, ~w) -> ~w", [DestMapID, Pos, Ack]),
    
    mod_map:player_move_(
        Mpid1,
        #r_player_start_move_req{uid = Uid, tar_pos = vector3:new(400.6,0,358.9)}
    ),
    ok.

%%%-------------------------------------------------------------------
return_to_pre_map() ->
    Uid = lib_player_rw:get_uid(),
    #m_player{mpid = Mid, old_mid = OMid, old_pos = OPos} = lib_mem:get_player(Uid),
    ?DEBUG("player ~p return_to_pre_map from ~p to ~p", [Uid, Mid, OMid]),
    go_to_new_map_1(OMid, OPos),
    ok.


%%%-------------------------------------------------------------------
offline() ->
    offline_1(lib_player_rw:get_status()),
    ok.

offline_1(Status)
    when Status =:= ?PS_GAME; Status =:= ?PS_CHANGE_MAP ->
    lib_player_rw:set_status(?PS_OFFLINE),
    Uid = lib_player_rw:get_uid(),
    #m_player{mid = Mid, mpid = MPid} = Player = lib_mem:get_player(Uid),
    lib_player_save:save(Player),
    mod_map_creator:player_offline(Uid, Mid, MPid),
    ok;
offline_1(_Status) ->
    lib_player_rw:set_status(?PS_OFFLINE),
    ok.


make_obj(Pos) ->
    Obj = #r_map_obj{
        type = ?OBJ_USR,
        uid = lib_player_rw:get_uid(),
        pid = self()
    },
    lib_move:init(Obj, Pos, vector3:new(0.1, 0, 0.5)).
