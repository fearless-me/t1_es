%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%    玩家提供出来的公共借口可以在***任意进程***调用
%%% @end
%%% Created : 17. 九月 2018 17:32
%%%-------------------------------------------------------------------
-module(player_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_cache.hrl").
-include("combat.hrl").
-include("combat_buff.hrl").
-include("condition_event.hrl").
-include("cfg_buff.hrl").
-include("common_def.hrl").

%% API
-export([
    kick_to_born_map_/1,
    %% 让玩家回之前的普通地图
    change_pre_map_/1,
    %% 给玩家所在地图进程发消息
    send_map_msg_/2, send_map_msg_/3,
    %% 取得玩家属性
    get_attr/2, get_hp/1, get_hp_percent/2,
    %% 玩家地图进程id
    get_map_pid/1,
    get_cur_pos/1, %% 当前坐标
    %% 玩家b是否有某个（种）buff
    has_buff/3,
    %% 获取玩家身上buff的时间(永久buff返回？BUFF_FOREVER_LOGIC )
    get_buff_time/2 ,
    %% 玩家增加buff、删除buff
    add_buff_/2, del_buff_/3
]).


%%-------------------------------------------------------------------
get_attr(_Uid, _AttrId) ->
    100.

%%-------------------------------------------------------------------
get_hp(Uid) ->
    gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.hp).

%%-------------------------------------------------------------------
get_hp_percent(CurHp, MaxHp) ->
    erlang:min(erlang:trunc((CurHp / MaxHp) * ?PERCENT), ?PERCENT).

%%-------------------------------------------------------------------
get_map_pid(Uid) ->
    gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.map_pid).

%%-------------------------------------------------------------------
get_cur_pos(Uid) ->
    gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.pos).

%%-------------------------------------------------------------------
has_buff(Uid, OpType, Param) ->
    BuffList = gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.buff_list),
    i_has_buff(BuffList, OpType, Param).

%%-------------------------------------------------------------------
get_buff_time(Uid, BuffId) ->
    BuffList = gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.buff_list),
    case lists:keyfind(BuffId, #m_buff.buff_id, BuffList) of
        #m_buff{lifetime = LifeTime} ->
            ?if_else(LifeTime == 0, ?BUFF_FOREVER_LOGIC, LifeTime);
        _Any -> 0
    end.

%%-------------------------------------------------------------------
del_buff_(UidPid, OpType, ParamList) ->
    player_interface:send_map_msg_(UidPid, {player_del_buff, OpType, ParamList}).

%%-------------------------------------------------------------------
add_buff_(UidPid, Req) ->
    player_interface:send_map_msg_(UidPid, {player_add_buff, Req}).

%%-------------------------------------------------------------------
kick_to_born_map_(UidPid) ->
    gs_interface:send_msg(UidPid, passive_kick_to_born_map).

%%-------------------------------------------------------------------
change_pre_map_(UidPid) ->
    gs_interface:send_msg(UidPid, return_to_pre_map_req).

%%-------------------------------------------------------------------
send_map_msg_(UidPid, MsgId) ->
    gs_interface:send_msg(UidPid, {msg_transfer_to_map, MsgId}).

%%-------------------------------------------------------------------
send_map_msg_(UidPid, MsgId, Msg) ->
    gs_interface:send_msg(UidPid, {msg_transfer_to_map, MsgId, Msg}).


%%-------------------------------------------------------------------
i_has_buff([], _Type, _Param) ->
    ok;
i_has_buff(BuffList, ?CONDITION_BUFF_HAS_ID, Param) ->
    lists:keyfind(Param, #m_buff.buff_id, BuffList) =/= false;
i_has_buff(BuffList, ?CONDITION_BUFF_HAS_PM, Param) ->
    i_has_buff_1(BuffList, #buffCfg.purpose, Param);
i_has_buff(BuffList, ?CONDITION_BUFF_HAS_EFFECT, Param) ->
    i_has_buff_1(BuffList, #buffCfg.effectType, Param);
i_has_buff(BuffList, ?CONDITION_BUFF_HAS_GROUP, Param) ->
    i_has_buff_1(BuffList, #buffCfg.groupId, Param).

i_has_buff_1([], _Key, _Pos) ->
    false;
i_has_buff_1([#m_buff{buff_id = _BuffId} | BuffList], Key, Pos) ->
    BuffCfg = #buffCfg{},
    case element(Pos, BuffCfg) == Key of
        true -> true;
        _Any -> i_has_buff_1(BuffList, Key, Pos)
    end.
%%-------------------------------------------------------------------

