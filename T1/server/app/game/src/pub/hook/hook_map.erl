%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 五月 2018 10:38
%%%-------------------------------------------------------------------
-module(hook_map).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
-include("gs_cache.hrl").
-include("map_core.hrl").
-include("combat.hrl").
-include("combat_buff.hrl").
-include("netmsg.hrl").
-include("cfg_monster.hrl").
-include("cfg_map.hrl").


-export([
    %%------------------------地图-------------------------------------------
    on_map_create/0, on_map_destroy/0,

    %%------------------------通用-------------------------------------------
    on_start_move/1, on_set_state/2, on_unset_state/2,

    %%------------------------玩家-------------------------------------------
    on_player_join/1, on_player_exit/1,

    %%------------------------怪物-------------------------------------------
    on_monster_create/2, on_monster_dead/1,

    %%-------------------------------------------------------------------
    on_rw_update/2
]).

%% 要注意在
%% on_map_create 、  on_player_join  、on_player_exit
%% 这三个接口不要处理过于复杂的逻辑，因为这个是 call调用,如果要处理的逻辑比较耗时
%% 发个消息给相应的进程来异步处理
%%

%%-------------------------------------------------------------------
%% 地图
on_map_create() ->
    ok.

on_map_destroy() ->
    ok.

%%-------------------------------------------------------------------
%% 通用
on_set_state(_Uid, _State) ->
    ok.

on_unset_state(_Uid, _State) ->
    ok.

on_start_move(_Uid) ->
    ok.

%%-------------------------------------------------------------------
%% 玩家
on_player_join(Uid) ->
    ?TRY_CATCH_ONLY(do_on_player_join(map_rw:map_cfg(), Uid)),
    ok.

do_on_player_join(#mapCfg{type = ?MAP_TYPE_COPY}, Uid) ->
    mod_copy:on_player_join(Uid);
do_on_player_join(_, _) ->
    skip.

on_player_exit(Uid) ->
    ?TRY_CATCH_ONLY(object_priv:del_player(Uid)),
    ?TRY_CATCH_ONLY(mod_buff:del_buff(Uid, ?BUFF_REMOVE_LEAVE_MAP)),
    ?TRY_CATCH_ONLY(do_on_player_exit(map_rw:map_cfg(), Uid)),
    ok.

do_on_player_exit(#mapCfg{type = ?MAP_TYPE_COPY}, Uid) ->
    mod_copy:on_player_exit(Uid);
do_on_player_exit(_, _) ->
    skip.
%%-------------------------------------------------------------------
%% 怪物
on_monster_create(Uid, DataId) ->
    case getCfg:getCfgByArgs(cfg_monster, DataId) of
        #monsterCfg{buff_born = []} ->
            ok;
        #monsterCfg{} ->
            ps:send(self(), monster_add_born_buff, {Uid, DataId});
        _ -> skip
    end,
    ok.

on_monster_dead(Uid) ->
    object_priv:del_monster(Uid),
    ok.

%%-------------------------------------------------------------------
%% 不要在调用unit_rw:set_xxx
%%-------------------------------------------------------------------
-define(lock(X), lock_transaction(X)).
-define(unlock(), unlock_transaction()).
on_rw_update(Uid, {Pos, Value}) ->
    on_rw_update(object_rw:get_type(Uid), Uid, Pos, Value).


%%-------------------------------------------------------------------
%% 刷到ets供全局访问
on_rw_update(?UID_TYPE_PLAYER, Uid, #m_object_rw.cur_pos, CurPos) ->
    gs_cache_interface:update_online_player(Uid, {#m_cache_online_player.pos, CurPos});
on_rw_update(?UID_TYPE_PLAYER, Uid, #m_object_rw.hp, Hp) ->
    gs_cache_interface:update_online_player(Uid, {#m_cache_online_player.hp, Hp});
on_rw_update(?UID_TYPE_PLAYER, Uid, #m_object_rw.buff_list, BuffList) ->
    gs_cache_interface:update_online_player(Uid, {#m_cache_online_player.buff_list, BuffList});
on_rw_update(?UID_TYPE_PLAYER, Uid, #m_object_rw.battle_props, BattleProps) ->
    gs_cache_interface:update_online_player(Uid, {#m_cache_online_player.battle_props, BattleProps});
on_rw_update(?UID_TYPE_PLAYER, Uid, #m_object_rw.state, State) ->
    gs_cache_interface:update_online_player(Uid, {#m_cache_online_player.state, State});
on_rw_update(_ObjType, _Uid, _Key, _Value) ->
    ok.


%%-------------------------------------------------------------------
lock_transaction(Key) ->
    case get(map_obj_lock_transaction) of
        Key -> throw("recursive call");
        _ -> put(map_obj_lock_transaction, Key)
    end,
    ok.

unlock_transaction() ->
    erase(map_obj_lock_transaction).

