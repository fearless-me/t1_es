%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 16:06
%%%-------------------------------------------------------------------
-module(lib_player_netmsg).
-author("mawenhong").
-include("logger.hrl").
-include("netmsg.hrl").
-include("map.hrl").
-include("vector3.hrl").
-include("player_status.hrl").
-include("common_record.hrl").
-include("mem_record.hrl").


%% API
-export([handle/1]).

handle(#pk_U2GS_Login_Normal{
    platformName = PlatName,
    platformAccount = PlatAccount,
    sign = Token
}) ->
    ?DEBUG("mod_login:login_"),
    lib_player_rw:set_status(?PS_VERIFY),
    lib_login:login_(#r_login_req{
        plat_name = PlatName, plat_account_name = PlatAccount,
        access_token = Token, player_pid = self()
    }),
    ok;
handle(#pk_U2GS_RequestCreatePlayer{
    name = Name,
    camp = Camp,
    career = Career,
    race = Race,
    sex = Sex,
    head = Head
}) ->
    BornMid = map_creator:born_map_id(),
    #vector3{x = X, z = Z} = map_creator:born_map_pos(),
    lib_player_priv:create_player_(#r_create_player_req{
       name = Name, camp = Camp, career = Career, race = Race, sex = Sex,
        head = Head, mid = BornMid, x = X, y = Z, sid = gconf:get_sid()
    }),
    ok;
handle(#pk_U2GS_SelPlayerEnterGame{uid = Uid}) ->
    lib_player_priv:select_player(Uid),
    ok;
handle(#pk_GS2U_GotoNewMap{ map_id = DestMapID, x = X, y = Y} = Msg) ->
    ?DEBUG("~p",[Msg]),
    lib_player_map_priv:change_map_call(DestMapID, vector3:new(X, 0, Y)),
    ok;
handle(#pk_U2GS_GetPlayerInitData{}) ->
    lib_player_base:send_init_data(),
    ok;
handle(#pk_U2GS_PlayerWalk{dst_x = DX, dst_y = DY}) ->
    #m_player_map{map_pid = Mpid} = lib_player_rw:get_map(),
    Uid = lib_player_rw:get_uid(),
    Req = #r_player_start_move_req{uid = Uid, tar = vector3:new(DX, 0, DY)},
    lib_player_pub:start_move_(Mpid, Req),
    ?WARN("player ~p mapid ~p move to ~p",
        [lib_player_rw:get_uid(), Mpid, Req#r_player_start_move_req.tar]),
    ok;
handle(#pk_U2GS_PlayerStopWalk{cur_x = X, cur_y = Y}) ->
    #m_player_map{map_pid = Mpid} = lib_player_rw:get_map(),
    Uid = lib_player_rw:get_uid(),
    Req = #r_player_stop_move_req{uid = Uid, pos = vector3:new(X, 0, Y)},
    lib_player_pub:stop_move_(Mpid, Req),
    ?WARN("player ~p mapid ~p stop on ~p",
        [lib_player_rw:get_uid(), Mpid, Req#r_player_stop_move_req.pos]),
    ok;
handle(Msg) ->
    ?DEBUG("~p", [Msg]),
    ok.