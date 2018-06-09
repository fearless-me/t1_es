%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%   player 进程调用
%%% @end
%%% Created : 14. 五月 2018 15:20
%%%-------------------------------------------------------------------
-module(lib_player_priv).
-author("mawenhong").

-include("logger.hrl").
-include("netmsg.hrl").
-include("map.hrl").
-include("player_status.hrl").
-include("common_record.hrl").
-include("map_obj.hrl").
-include("db_record.hrl").
-include("mem_record.hrl").
-include("vector3.hrl").
-include("pub_common.hrl").

%% 玩家进程其他模块可调用的接口
-export([shutdown/1]).
-export([stop/1, direct_stop/0, send/1]).
-export([socket/0]).
-export([teleport_/1]).

%% 逻辑层不要调用这些接口
-export([init/0]).
-export([login_ack/1]).
-export([loaded_player_list/1]).
-export([create_player_/1, create_player_ack/1]).
-export([select_player/1]).
-export([loaded_player/1]).
-export([offline/1]).
-export([goto_new_map/2, goto_to_pre_map/0]).
%% 逻辑层调用 teleport_/1, 不要調用teleport_call
-export([teleport_call/1]).

%%-------------------------------------------------------------------
init() ->
    lib_player_rw:set_status(?PS_INIT),
    ok.

%%-------------------------------------------------------------------
-spec shutdown(How) -> ok when
    How :: read | write | read_write.
shutdown(How) -> mod_player:shutdown(socket(), How).
stop(Reason)-> mod_player:active_stop(Reason).
direct_stop()-> mod_player:direct_stop().
%%-------------------------------------------------------------------

-spec send(Msg :: list() | tuple()) -> ok.
send(Msg) -> mod_player:send(Msg).
socket()-> mod_player:socket().

%%-------------------------------------------------------------------
init_on_create() -> ok.




%%-------------------------------------------------------------------
login_ack(#r_login_ack{error = 0, account_info = AccountIfo}) ->
    #p_account{aid = AccId} = AccountIfo,
    Ret = gcore:register_ppid(self(), AccId),
    login_ack_success(Ret, AccountIfo),
    ok;
login_ack(#r_login_ack{error = Error}) ->
    lib_player_priv:send(#pk_GS2U_LoginResult{
        result = Error,
        msg = io_lib:format("ErrorCode:~p", [Error])
    }),
    ok.

%%-------------------------------------------------------------------
login_ack_success(sucess, AccountIfo) ->
    Aid = AccountIfo#p_account.aid,
    lib_player_priv:send(#pk_GS2U_LoginResult{
        aid = Aid,
        identity = "",
        result = 0,
        msg = io_lib:format("ErrorCode:~p", [0])
    }),
    lib_player_rw:set_aid(Aid),
    lib_player_rw:set_status(?PS_WAIT_LIST),
    lib_db:action_p_(Aid, load_player_list, Aid),
    ok;
login_ack_success(Reason, AccountIfo) ->
    #p_account{aid = Aid} = AccountIfo,
    ?WARN("acc ~w register process ~p faild with ~w",
        [Aid, self(), Reason]),
    lib_player_priv:send(#pk_GS2U_LoginResult{
        result = -1,
        msg = io_lib:format("ErrorCode:~p", [Reason])
    }),
    lib_player_rw:set_status(?PS_ERROR),
    mod_player:shutdown(read),
    gcore:kick_account(Aid, Reason),
    ok.

%%-------------------------------------------------------------------
loaded_player_list([]) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    lib_player_priv:send(#pk_GS2U_UserPlayerList{}),
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
        }) ->
            #pk_UserPlayerData{
                uid = Uid, name = Name,
                level = Lv, wingLevel = Wlv,
                camp = Camp, career = Career,
                race = Race, sex = Sex, head = Head,
                mapID = MapId, oldMapID = OldMapId
            }
        end, RoleList),
    lib_player_priv:send(#pk_GS2U_UserPlayerList{info = Info}),
    ok.

%%-------------------------------------------------------------------
create_player_(Req) ->
    Aid = lib_player_rw:get_aid(),
    lib_player_rw:set_status(?PS_CREATING),
    lib_db:action_p_(Aid, create_player, {Aid, Req}),
    ok.

%%-------------------------------------------------------------------
create_player_ack(#r_create_player_ack{error = 0, uid = Uid}) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    hook_player:on_create(Uid),
    lib_player_priv:send(#pk_GS2U_CreatePlayerResult{
        errorCode = 0, uid = Uid
    });
create_player_ack(#r_create_player_ack{error = Err}) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    lib_player_priv:send(#pk_GS2U_CreatePlayerResult{errorCode = Err}).

%%-------------------------------------------------------------------
select_player(Uid) ->
    Aid = lib_player_rw:get_aid(),
    lib_player_rw:set_status(?PS_WAIT_LOAD),
    lib_player_rw:set_uid(Uid),
    lib_db:action_p_(Aid, load_player_data, {Aid, Uid}),
    ok.

%%-------------------------------------------------------------------
loaded_player(undefined) ->
    Aid = lib_player_rw:get_aid(),
    Uid = lib_player_rw:get_uid(),
    ?ERROR("~p load player ~p failed", [Aid, Uid]),
    lib_player_rw:set_uid(0),
    ok;
loaded_player(Player) ->
    #p_player{uid = Uid, aid = Aid} = Player,
    lib_player_base:init(Player),
    lib_player_rw:set_status(?PS_WAIT_ENTER),
    lib_mem:new_player(self(), mod_player:socket(), Player),
    lib_mem:add_sock(Aid, Uid, self(), mod_player:socket()),
    add_to_world(Player),
    hook_player:on_login(),
    ok.

%%-------------------------------------------------------------------
add_to_world(Player) ->
    #p_player{
        uid = Uid, map_id = Mid, x = X, y = Y,
        old_map_id = OldMid, old_line = OldLine, old_x = OX, old_y = OY
    } = Player,
    
    Ack = mod_map_creator:player_online(
        Mid,
        #r_change_map_req{
            uid = Uid,
            pid = self(),
            tar_map_id = Mid,
            tar_pos = vector3:new(X, 0, Y)
        }
    ),

    do_change_map_ack(OldMid, OldLine, vector3:new(OX, 0, OY), Ack),
    ok.

%%-------------------------------------------------------------------
teleport_(NewPos) -> ps:send(self(), teleport, NewPos).

%%-------------------------------------------------------------------
teleport_call(NewPos) ->
    Uid = lib_player_rw:get_uid(),
    #m_player{mpid = MPid} = lib_mem:get_player(Uid),
    do_teleport(MPid, NewPos).

do_teleport(undefined, _NewPos) ->
    ?ERROR("");
do_teleport(MapPid, NewPos) ->
    Uid = lib_player_rw:get_uid(),
    mod_map:player_teleport(
        MapPid,
        #r_teleport_req{uid = Uid, tar_pos = NewPos}
    ),
    ok.

%%-------------------------------------------------------------------
goto_new_map(DestMapID, Pos) ->
    do_goto_new_map(DestMapID, Pos),
    ok.

%%-------------------------------------------------------------------
do_goto_new_map(DestMapID, TarPos) ->
    lib_player_rw:set_status(?PS_CHANGE_MAP),
    Uid = lib_player_rw:get_uid(),
    #m_player{mid = Mid, line = Line, mpid = MPid, pos = Pos} = lib_mem:get_player(Uid),
    Ack = mod_map_creator:player_change_map(
        #r_change_map_req{
            uid = Uid, pid = self(),
            map_id = Mid, line_id = Line, map_pid = MPid,
            tar_map_id = DestMapID, tar_pos = TarPos
        }
    ),

    do_change_map_ack(Mid, Line, Pos, Ack),
    ok.


do_change_map_ack(
    OldMid, OldLineId, OldPos,
    #r_change_map_ack{
        error = 0,
        map_id = Mid, line_id = Line,
        map_pid = MPid , pos = Pos
}) ->
    Uid = lib_player_rw:get_uid(),
    lib_mem:player_update(
        Uid,
        [
            {#m_player.old_mid, OldMid},
            {#m_player.old_line, OldLineId},
            {#m_player.old_pos, OldPos},
            {#m_player.mid, Mid},
            {#m_player.line, Line},
            {#m_player.mpid, MPid},
            {#m_player.pos, Pos}
        ]
    ),
    ?WARN("player ~p enter map ~p line ~p",[Uid, Mid, Line]),
    hook_player:on_change_map(Mid, Mid),

    lib_player_rw:set_status(?PS_GAME),

    mod_map:player_move_(
        MPid,
        #r_player_start_move_req{uid = Uid, tar_pos = vector3:new(400.6, 0, 358.9)}
    ),
    ok;
do_change_map_ack(
    OldMid, OldLineId, _OldPos,
    #r_change_map_ack{error = Err, map_id = Mid}
)->
    ?ERROR("player ~p change from map ~p:~p to map ~p failed with ~p",
        [lib_player_rw:get_uid(), OldMid, OldLineId, Mid, Err]),
    ok.

%%%-------------------------------------------------------------------
goto_to_pre_map() ->
    Uid = lib_player_rw:get_uid(),
    #m_player{mpid = Mid, old_mid = OMid, old_pos = OPos} = lib_mem:get_player(Uid),
    ?DEBUG("player ~p return_to_pre_map from ~p to ~p", [Uid, Mid, OMid]),
    do_goto_new_map(OMid, OPos),
    ok.


%%%-------------------------------------------------------------------
offline(Reason) ->
    ?TRY_CATCH(offline_1(lib_player_rw:get_status()), Err0, St0),
    ?TRY_CATCH(lib_mem:del_sock(lib_player_rw:get_uid()), Err1, St1),
    ?TRY_CATCH(flush_cache(Reason), Err2, St2),
    ok.

offline_1(Status)
    when Status =:= ?PS_GAME; Status =:= ?PS_CHANGE_MAP ->
    lib_player_rw:set_status(?PS_OFFLINE),
    Uid = lib_player_rw:get_uid(),
    #m_player{
        mid = Mid, mpid = MPid, line = LineId
    } = Player = lib_mem:get_player(Uid),
    ?WARN("player ~p exit map ~p line ~p",[Uid, Mid, LineId]),
    hook_player:on_offline(),
    mod_map_creator:player_offline(Uid, Mid, LineId, MPid),
    lib_player_save:save(Player),
    lib_mem:offline(Uid),
    ?INFO("player ~p pid ~p sock ~p player ~w offline status ~p",
        [Uid, self(), socket(), Uid, Status]),
    ok;
offline_1(Status) ->
    Uid = lib_player_rw:get_uid(),
    lib_player_rw:set_status(?PS_OFFLINE),
    ?INFO("player ~p pid ~p sock ~p player ~w offline status ~p",
        [Uid, self(), socket(), Uid, Status]),
    ok.

%%%-------------------------------------------------------------------
flush_cache(transfer_to_cross) -> ok;
flush_cache(_) -> skip.


