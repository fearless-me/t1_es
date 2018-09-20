%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 九月 2018 17:36
%%%-------------------------------------------------------------------
-module(player_attr).
-author("mawenhong").

-include("logger.hrl").
-include("combat.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").

-export([change_attr/2, change_attr/4, online/0]).



%% API
%%-------------------------------------------------------------------
%% @todo 在初始化数据之后需要计算属性
online() ->
    Uid = player_rw:get_uid(),
    case my_ets:read_element(
        ?ETS_CACHE_ONLINE_PLAYER,
        Uid, #m_cache_online_player.attr)
    of
        [] -> calc_attr();
        _  -> ok
    end,
    ok.

%%-------------------------------------------------------------------
change_attr(AddList, MultiList) ->
    change_attr(AddList, MultiList, [], []),
    ok.

change_attr(AddList, MultiList, AddList_Del, MultiList_Del) ->
    Uid = player_rw:get_uid(),
    player_pub:send_map_msg_(player_change_attr, {Uid, AddList, MultiList, AddList_Del, MultiList_Del} ),
    ok.



calc_attr() -> ok.
