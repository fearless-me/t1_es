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
-include("player_status.hrl").
-include("login.hrl").


%% API
-export([route/1]).

route(Msg) ->
    %%1. hook
    Status = lib_player:get_player_status(),
    case Status of
        ?PS_INIT -> ok;
        ?PS_VERIFY -> ok;
        ?PS_WAIT_ROLELIST -> ok;
        ?PS_WAIT_CREATE -> ok;
        ?PS_WAIT_SELECT -> ok;
        ?PS_WAIT_LOAD -> ok;
        ?PS_WAIT_ENTER -> ok;
        ?PS_GAME -> ok;
        ?PS_CHANGEMAP -> ok;
        _ -> ok
    end,
    %%2. route
    route_1(Msg),
    ok.
route_1(#pk_U2LS_Login_Normal{
    platformAccount = PlatAccount,
    sign = Token

}) ->
    mod_login:login_(#login_req{
        plat_account_name = PlatAccount,
        access_token = Token,
        player_pid = self()
    }),
    ok;
route_1(#pk_GS2U_GoNewMap{tarMapID = DestMapID, fX = X, fY = Y} = Msg) ->
    ?DEBUG("~p",[Msg]),
    lib_player:go_to_new_map(
        DestMapID, #vector3{x = X, y = 0.0, z = Y}),
    ok;
route_1(Msg) ->
    ?DEBUG("~p:~p", [Msg]),
    ok.