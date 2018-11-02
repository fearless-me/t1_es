%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 六月 2018 14:48
%%%-------------------------------------------------------------------
-module(mod_buff).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("combat.hrl").
-include("rec_rw.hrl").

%% API
-export([
    add_buff/4, %% 添加buff
    tick/2,     %% buff 周期触发
    del_buff/2, %% 删除某个id的buff
    del_buff_trigger/2, %% 删除某个事件触发的比如 进出地图、上下线
    del_buff_group/2, %% 删除某个buff组
    del_buff_effect/2,   %% 删除某个效果的buff
    del_debuff/1,  %% 删除debuff
    del_buff_source/2  %% 删除某个来源的buff
]).

-define(BUFF_ADD, 1).
-define(BUFF_REMOVE, 2).
-define(BUFF_FINISH, 3).
-define(BUFF_TICK, 4).
-define(BUFF_WRAP, 5).
-define(BUFF_REPLACE, 6).
-define(BUFF_LEVELUP, 7).

-define(PROP_ADD, 1).
-define(PROP_DEL, 2).

-define(REMOVE_DEATH, 1).
-define(REMOVE_LEAVE_MAP, 2).

%% fixme 临时定义一个 buff的配置表结构，具体什么样子未知
-record(buffCfg, {
    id, group_id, type, debuff, del_trigger,
    del_flag, life_time, tick_time, save_type,
    max_layer, prop_list,
    add_cond_event, tick_cond_event,
    stop_cond_event, break_cond_event
}).

%%-------------------------------------------------------------------
add_buff(Uid, BuffId, Level, SrcUid) ->
    case can_add_buff(Uid, BuffId) of
        true ->
            BuffList1 = i_get_buff_list(Uid),
            BuffExist = find_buff(BuffId, BuffList1),
            case add_buff(BuffExist, Uid, BuffId, Level, SrcUid, BuffList1) of
                keep -> skip;
                BuffList2 -> i_set_buff_list(Uid, BuffList2)
            end;
        _Any -> skip
    end,
    ok.

%% 新的等级低
add_buff(#m_buff{level = BuffLevel}, _Uid, _BuffId, Level, _SrcUid, _) when BuffLevel > Level ->
    keep;
%% 新的等级高 %% todo 这种地方要优化属性计算
add_buff(#m_buff{level = BuffLevel} = OldBuff, Uid, BuffId, Level, SrcUid, BuffList) when BuffLevel < Level ->
    catch trigger_buff_event(?BUFF_REMOVE, Uid, OldBuff),
    catch trigger_buff_prop(?PROP_DEL, Uid, OldBuff),
    Buff = make_buff(Uid, BuffId, Level, SrcUid),
    on_update_buff(Uid, Buff),
    catch trigger_buff_event(?BUFF_ADD, Uid, Buff),
    catch trigger_buff_prop(?PROP_ADD, Uid, Buff),
    lists:keystore(BuffId, #m_buff.buff_id, BuffList, Buff);
%% 新的等级一样 更新
add_buff(#m_buff{level = Level}, Uid, BuffId, Level, SrcUid, BuffList) ->
    Buff = make_buff(Uid, BuffId, Level, SrcUid),
    lists:keystore(BuffId, #m_buff.buff_id, BuffList, Buff);
%% 没有这个buff， 添加新buff
add_buff(_Any, Uid, BuffId, Level, SrcUid, BuffList) ->
    Buff = make_buff(Uid, BuffId, Level, SrcUid),
    on_add_buff(Uid, Buff),
    catch trigger_buff_event(?BUFF_ADD, Uid, Buff),
    catch trigger_buff_prop(?PROP_ADD, Uid, Buff),
    [Buff | BuffList].

%% todo 检查能否添加buff
can_add_buff(_Uid, _BuffId) ->
    true.

%% 
make_buff(_Uid, BuffId, Level, SrcUid) ->
    #m_buff{buff_id = BuffId, lifetime = 1000, level = Level, source = SrcUid}.

%%-------------------------------------------------------------------
find_buff(_BuffId, []) ->
    undefined;
find_buff(BuffId, BuffList) ->
    lists:keyfind(BuffId, #m_buff.buff_id, BuffList).

%%-------------------------------------------------------------------
is_buff_exist(_BuffId, []) ->
    false;
is_buff_exist(BuffId, BuffList) ->
    lists:keymember(BuffId, #m_buff.buff_id, BuffList).

%%-------------------------------------------------------------------
del_buff(Uid, BuffId) -> do_del_buff(Uid, #m_buff.buff_id, BuffId).
del_buff_source(Uid, Source) -> do_del_buff(Uid, #m_buff.source, Source).

%% todo 根据配置表类型筛选buff
del_debuff(Uid) -> do_del_buff_cfg(Uid, #buffCfg.debuff, 1).
del_buff_effect(Uid, Type) -> do_del_buff_cfg(Uid, #buffCfg.type, Type).
del_buff_group(Uid, GroupId) -> do_del_buff_cfg(Uid, #buffCfg.group_id, GroupId).
del_buff_trigger(Uid, Trigger) -> do_del_buff_cfg(Uid, #buffCfg.del_trigger, Trigger).

%%-------------------------------------------------------------------
do_del_buff(Uid, Pos, Key) ->
    BuffList1 = i_get_buff_list(Uid),
    {Matched, Unmatched} = i_filter_buff_list(BuffList1, [], [], Pos, Key),
    i_set_buff_list(Uid, Unmatched),
    on_delete_buff(Uid, Matched, ?BUFF_REMOVE),

    ok.

do_del_buff_cfg(Uid, Pos, Key) ->
    BuffList1 = i_get_buff_list(Uid),
    {Matched, Unmatched} = i_filter_buff_list_cfg(BuffList1, [], [], Pos, Key),
    i_set_buff_list(Uid, Unmatched),
    on_delete_buff(Uid, Matched, ?BUFF_REMOVE),
    ok.

%%-------------------------------------------------------------------
i_filter_buff_list([], Matched, Unmatched, _Pos, _Key) ->
    {Matched, Unmatched};
i_filter_buff_list([Buff | Original], Matched, Unmatched, Pos, Key) when element(Pos, Buff) == Key ->
    i_filter_buff_list(Original, [Buff | Matched], Unmatched, Pos, Key);
i_filter_buff_list([Buff | Original], Matched, Unmatched, Pos, Key) ->
    i_filter_buff_list(Original, Matched, [Buff | Unmatched], Pos, Key).

%%-------------------------------------------------------------------
i_filter_buff_list_cfg([], Matched, Unmatched, _Pos, _Key) ->
    {Matched, Unmatched};
i_filter_buff_list_cfg([Buff | Original], Matched, Unmatched, Pos, Key) ->
    case i_filter_buff_cfg(Buff, Pos, Key) of
        true ->
            i_filter_buff_list_cfg(Original, [Buff | Matched], Unmatched, Pos, Key);
        _Any ->
            i_filter_buff_list_cfg(Original, Matched, [Buff | Unmatched], Pos, Key)
    end.

i_filter_buff_cfg(_BuffId, Pos, Key) ->
    BuffCfg = #buffCfg{},
    element(Pos, BuffCfg) == Key.


%%-------------------------------------------------------------------
tick(#m_cache_map_object{uid = Uid}, Now) ->
    tick(Uid, i_get_buff_list(Uid), Now).

tick(_Uid, [], Now) -> ok;
tick(Uid, BuffList, Now) ->
    {DelBuffList, UpdateBuffList, NewBuffList} = tick_all_buff(BuffList, Uid, [], [], [], Now),
    i_set_buff_list(Uid, NewBuffList),
    %%
    on_delete_buff(Uid, DelBuffList, ?BUFF_FINISH),
    on_update_buff(Uid, UpdateBuffList),
    ok.

tick_all_buff([], _Uid, Delete, Update, Continue, _Now) ->
    {Delete, Update, Continue};
tick_all_buff([Buff | BuffList], Uid, Delete, Update, Continue, Now) ->
    case tick_one_buff(Uid, Buff, Now) of
        delete -> tick_all_buff(BuffList, Uid, [Buff | Delete], Update, Continue, Now);
        {update, NewBuff} -> tick_all_buff(BuffList, Uid, Delete, [NewBuff | Update], Continue, Now);
        NewBuff -> tick_all_buff(BuffList, Uid, Delete, Update, [NewBuff | Continue], Now)
    end.

%% todo 事件触发 要根据buff的最终逻辑来确认是否需要先删除然后在添加（策划说了算）
%% todo 属性改变 要根据buff的最终逻辑来确认是否需要先删除然后在添加（策划说了算）
tick_one_buff(Uid, Buff, Now) ->
    case can_tick_now(Buff, Now) of
        true -> tick_one_buff_action(Uid, Buff, Now);
        _Any -> Buff
    end.

tick_one_buff_action(_Uid, #m_buff{lifetime = LifeTime}, Now) when Now >= LifeTime ->
    delete;
tick_one_buff_action(Uid, Buff, Now) ->
    catch trigger_buff_event(?BUFF_TICK, Uid, Buff),
    buff_effect:active(Uid, Buff),
    {update, Buff#m_buff{latest = Now}}.


can_tick_now(#m_buff{buff_id = BuffId, latest = Latest}, Now) ->
    #buffCfg{tick_time = TickTime} = i_get_cfg(BuffId),
    Now >= Latest + TickTime.

%%-------------------------------------------------------------------
on_add_buff(Uid, Buff) ->
    ViewNetMsg = #pk_GS2U_AddBuff{uid = Uid, buff = i_marshal_buff(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg).

%%-------------------------------------------------------------------
on_update_buff(_Uid, []) ->
    skip;
on_update_buff(Uid, [Buff]) ->
    ViewNetMsg = #pk_GS2U_UpdateBuff{uid = Uid, buff = i_marshal_buff(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
on_update_buff(Uid, BuffList) when is_list(BuffList) ->
    BuffInfoList = [i_marshal_buff(Buff) || Buff <- BuffList],
    ViewNetMsg = #pk_GS2U_UpdateBuffList{uid = Uid, buff_list = BuffInfoList},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
on_update_buff(Uid, Buff) ->
    ViewNetMsg = #pk_GS2U_UpdateBuff{uid = Uid, buff = i_marshal_buff(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg).

%%-------------------------------------------------------------------
on_delete_buff(Uid, BuffList, TriggerCond) ->
    catch trigger_buff_event(TriggerCond, Uid, BuffList),
    catch trigger_buff_prop(?PROP_DEL, Uid, BuffList),
    delete_buff_action(Uid, BuffList).

delete_buff_action(_Uid, []) ->
    skip;
delete_buff_action(Uid, [#m_buff{buff_id = BuffId}]) ->
    ViewNetMsg = #pk_GS2U_DeleteBuff{uid = Uid, buff_id = BuffId},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
delete_buff_action(Uid, BuffList) when is_list(BuffList) ->
    BuffIdList = [BuffId || #m_buff{buff_id = BuffId} <- BuffList],
    ViewNetMsg = #pk_GS2U_DeleteBuffList{uid = Uid, buff_id_list = BuffIdList},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg).


%%------------------------------------------------------------------
i_marshal_buff(#m_buff{
    buff_id = BuffId, lifetime = Lifetime, level = Level, wrap = Wrap
}) ->
    #pk_BuffInfo{buff_id = BuffId, lifetime = Lifetime, level = Level, wrap = Wrap}.


%%------------------------------------------------------------------
i_get_buff_list(Uid) ->
    object_rw:get_buff_list(Uid).

i_set_buff_list(Uid, BuffList) ->
    object_rw:set_buff_list(Uid, BuffList).

i_get_cfg(BuffId) ->
    #buffCfg{id = BuffId}.

%%------------------------------------------------------------------
trigger_buff_event(_TriggerCond, _Uid, []) ->
    ok;
trigger_buff_event(TriggerCond, Uid, [Buff | BuffList]) ->
    trigger_buff_event(TriggerCond, Uid, Buff),
    trigger_buff_event(TriggerCond, Uid, BuffList);
trigger_buff_event(TriggerCond, Uid, #m_buff{source = SrcUid, buff_id = BUffId}) ->
    do_trigger_buff_event(TriggerCond, SrcUid, Uid, i_get_cfg(BUffId)).


do_trigger_buff_event(?BUFF_ADD, SrcUid, TarUid, #buffCfg{add_cond_event = CondEvent}) ->
    condition_event:action_all(CondEvent, [SrcUid, TarUid]);
do_trigger_buff_event(?BUFF_REMOVE, SrcUid, TarUid, #buffCfg{break_cond_event = CondEvent}) ->
    condition_event:action_all(CondEvent, [SrcUid, TarUid]);
do_trigger_buff_event(?BUFF_FINISH, SrcUid, TarUid, #buffCfg{stop_cond_event = CondEvent}) ->
    condition_event:action_all(CondEvent, [SrcUid, TarUid]);
do_trigger_buff_event(?BUFF_TICK, SrcUid, TarUid, #buffCfg{tick_cond_event = CondEvent}) ->
    condition_event:action_all(CondEvent, [SrcUid, TarUid]);
do_trigger_buff_event(?BUFF_WRAP, _SrcUid, _TarUid, _Cfg) ->
    skip;
do_trigger_buff_event(?BUFF_REPLACE, _SrcUid, _TarUid, _Cfg) ->
    skip;
do_trigger_buff_event(?BUFF_LEVELUP, _SrcUid, _TarUid, _Cfg) ->
    skip.

%%------------------------------------------------------------------
trigger_buff_prop(?PROP_ADD, Uid, _Buff) ->
    mod_combat_prop:change_combat_prop(Uid, [], []),
    ok;
trigger_buff_prop(?PROP_DEL, Uid, _Buff) ->
    mod_combat_prop:change_combat_prop(Uid, [], []),
    ok.