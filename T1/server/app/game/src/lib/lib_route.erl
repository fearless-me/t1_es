%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 16:06
%%%-------------------------------------------------------------------
-module(lib_route).
-author("mawenhong").
-include("logger.hrl").
-include("netmsg.hrl").
-include("map.hrl").
-include("vector3.hrl").
-include("player_status.hrl").
-include("common_record.hrl").


%% API
-export([route/1]).

route(Msg) ->
    %%1. hook
    ?DEBUG("route(~p)",[Msg]),
    Status = lib_player_rw:get_status(),
    case Status of
        ?PS_INIT -> ok;
        ?PS_VERIFY -> ok;
        ?PS_WAIT_LIST -> ok;
        ?PS_WAIT_SELECT_CREATE -> ok;
        ?PS_WAIT_LOAD -> ok;
        ?PS_WAIT_ENTER -> ok;
        ?PS_GAME -> ok;
        ?PS_CHANGE_MAP -> ok;
        ?PS_OFFLINE -> ok;
        _ -> ok
    end,
    %%2. route
    route_1(Msg),
    ok.
route_1(#pk_U2GS_Login_Normal{
    platformAccount = PlatAccount,
    sign = Token
}) ->
    ?DEBUG("mod_login:login_"),
    mod_login:login_(#r_login_req{
        plat_account_name = PlatAccount,
        access_token = Token,
        player_pid = self()
    }),
    ok;
route_1(#pk_U2GS_RequestCreatePlayer{
    name = Name,
    camp = Camp,
    career = Career,
    race = Race,
    sex = Sex,
    head = Head
}) ->
    BornMid = mod_map_creator:born_map_id(),
    #vector3{x = X, z = Z} = mod_map_creator:born_map_pos(),
    lib_player:create_player_(#r_create_player_req{
       name = Name, camp = Camp, career = Career, race = Race, sex = Sex,
        head = Head, mid = BornMid, x = X, y = Z, sid = gconf:get_sid()
    }),
    ok;
route_1(#pk_U2GS_SelPlayerEnterGame{roleID = Uid}) ->
    lib_player:select_player(Uid),
    ok;
route_1(#pk_GS2U_GoNewMap{tarMapID = DestMapID, fX = X, fY = Y} = Msg) ->
    ?DEBUG("~p",[Msg]),
    lib_player:goto_new_map(DestMapID, vector3:new(X, 0, Y)),
    ok;
route_1(Msg) ->
    ?DEBUG("~p", [Msg]),
    ok.