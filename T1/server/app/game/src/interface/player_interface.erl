%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 17:32
%%%-------------------------------------------------------------------
-module(player_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_cache.hrl").
%% API
-export([
    get_attr/2, get_hp/1, get_hp_percent/1, get_map_pid/1, get_cur_pos/1,
    change_pre_map_/1
]).

get_attr(_Uid, _AttrId) ->
    100.

get_hp(Uid) ->
    gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.hp).

get_hp_percent(_Uid) ->
    1.0.

get_map_pid(Uid) ->
    gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.map_pid).

get_cur_pos(Uid) ->
    gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.pos).


%%-------------------------------------------------------------------
change_pre_map_(UidPid) ->
    gs_interface:send_msg(UidPid, return_to_pre_map_req).