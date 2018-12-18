%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 16:06
%%%-------------------------------------------------------------------
-module(player_netmsg).
-author("mawenhong").
-include("logger.hrl").
-include("netmsg.hrl").
-include("map_core.hrl").

-include("player_status.hrl").
-include("gs_common_rec.hrl").
-include("gs_cache.hrl").


%% API
-export([handle/1]).

handle(#pk_U2GS_ExitGame{}) ->
    player_pub:stop(client_req_exit),
    ok;
handle(#pk_U2GS_HearBeat{}) ->
    player_pub:send_net_msg(#pk_GS2U_HearBeat{now = misc_time:localtime_seconds()}),
    ok;
handle(#pk_U2GS_Login_Normal{
    platformName = PlatName,
    platformAccount = PlatAccount,
    sign = Token
}) ->
    player_priv:login(PlatName, PlatAccount, Token),
    ok;
handle(#pk_U2GS_RequestCreatePlayer{
    name = Name, camp = Camp,
    career = Career, race = Race,
    sex = Sex, head = Head
}) ->
    player_priv:create_player(Name, Career, Race, Sex, Head, Camp),
    ok;
handle(#pk_U2GS_RequestDeletePlayer{uid = Uid}) ->
    player_priv:delete_player(Uid),
    ok;
handle(#pk_U2GS_SelPlayerEnterGame{uid = Uid}) ->
    player_priv:select_player(Uid),
    ok;
handle(#pk_U2GS_GetPlayerInitData{}) ->
%%    lib_player_base:send_init_data(),
    ok;
handle(#pk_U2GS_PlayerWalk{dst_x = DX, dst_y = DY, speed = Speed}) ->
    Tar = vector3:new(DX, 0, DY),
    player_base:start_walk(Tar, Speed),
    ok;
handle(#pk_U2GS_PlayerStopWalk{cur_x = X, cur_y = Y}) ->
    Pos = vector3:new(X, 0, Y),
    player_base:stop_move(Pos),
    ok;
handle(#pk_U2GS_UseSkill{tar_uids = Tar, x = X, y = Y, skill_id = SkillId, serial = Serial}) ->
    Pos = vector3:new(X, 0, Y),
    player_combat:use_skill(SkillId, Tar, Pos, Serial),
    ok;
handle(#pk_U2GS_SkillInterrupt{}) ->
    ok;
handle(#pk_U2GS_ChangeMap{map_id = MapId, x = X, y = Y}) ->
    Pos = vector3:new(X, 0, Y),
    ?DEBUG("### client request change to map ~p", [MapId]),
    player_pub:change_map_(MapId, 0, Pos),
    ok;
handle(#pk_U2GS_GetRemoteObjInfo{uids = UidList}) ->
    Uid = player_rw:get_uid(),
    #m_player_map{map_pid = MapPid} = player_rw:get_map(),
    ps:send(MapPid, net_msg_get_remote_obj_info, {Uid, UidList, self()}),
    ok;
handle(#pk_U2GS_Chat{content = Content}) ->
    case player_gm:is_gm(Content) of
        true -> player_gm:on_gm(Content);
        _Any -> skip
    end,
    ok;
handle(#pk_U2GS_Revive{}) ->
    ok;
handle(_Msg) ->
%%    ?DEBUG("~p", [Msg]),
    ok.