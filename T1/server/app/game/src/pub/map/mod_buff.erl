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
-include("combat_buff.hrl").
-include("rec_rw.hrl").
-include("condition_event.hrl").
-include("cfg_buff.hrl").
-include("module_process_define.hrl").

%% API
-export([
    add_buff/1, %% 添加buff
    add_buff/7, %% 添加buff
    tick/2,     %% buff 周期触发
    del_all/1,  %%删除所有buff
    del_buff/2, %% 删除某个id的buff
    del_buff_trigger/2, %% 删除某个事件触发的比如 进出地图、上下线
    del_buff_group/2, %% 删除某个buff组
    del_buff_effect/2,   %% 删除某个效果的buff
    del_debuff/1,  %% 删除debuff
    del_enbuff/1,   %% 删除所有增益buff
    del_buff_source/2,  %% 删除某个来源的buff
    condition_event_del_buff/3 %% 条件事件删除buff
]).
-export([is_buff_exist/2]).

-define(BUFF_ADD, add).
-define(BUFF_REMOVE, remove).
-define(BUFF_FINISH, finish).
-define(BUFF_TICK, tick).
-define(BUFF_WRAP, wrap).
-define(BUFF_REPLACE, replace).
-define(BUFF_LEVELUP, levelup).

-define(PROP_ADD, add).
-define(PROP_DEL, del).


%%-------------------------------------------------------------------
add_buff(Req) ->
    #r_player_add_buff_req{
        uid = Uid, src_uid = SrcUid,
        buff_id = BuffId, level = Level,
        skip_immune = SkipImmune,
        layer = Layer, lifetime = LifeTime
    } = Req,
    mod_buff:add_buff(Uid, BuffId, Level, SrcUid, Layer, LifeTime, SkipImmune),
    ok.

add_buff(Uid, BuffId, Level, SrcUid, Layer, LifeTime, SkipImmune) ->
    case can_add_buff(Uid, BuffId, SkipImmune) of
        true ->
            BuffList1 = immune_buff(buff:get_cfg(BuffId), Uid),
            BuffExist = is_buff_exist(BuffId, BuffList1),
            case add_buff(BuffExist, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList1) of
                keep -> skip;
                BuffList2 -> i_set_buff_list(Uid, BuffList2)
            end;
        _Any -> skip
    end,
    ok.

immune_buff(#buffCfg{immune = Immune}, Uid) when is_number(Immune), Immune > 0 ->
    do_del_buff_cfg(Uid, #buffCfg.effectType, [Immune]),
    i_get_buff_list(Uid);
immune_buff(#buffCfg{immune = ImmuneList}, Uid) when is_list(ImmuneList) ->
    do_del_buff_cfg(Uid, #buffCfg.effectType, ImmuneList),
    i_get_buff_list(Uid);
immune_buff(_Any, Uid) ->
    i_get_buff_list(Uid).
%%
%%%% 新的等级低
%%add_buff(#m_buff{level = BuffLevel}, _Uid, _BuffId, Level, _SrcUid, _Layer, _LifeTime,  _) when BuffLevel > Level ->
%%    keep;
%%%% 新的等级高 %% todo 这种地方要优化属性计算
%%add_buff(#m_buff{level = BuffLevel} = OldBuff, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList) when BuffLevel < Level ->
%%    catch trigger_buff_event(?BUFF_REMOVE, Uid, OldBuff),
%%    catch trigger_buff_prop(?PROP_DEL, Uid, OldBuff),
%%    Buff = buff:make_buff(Uid, BuffId, Level, SrcUid, Layer, LifeTime),
%%    on_update_buff(Uid, Buff),
%%    catch trigger_buff_event(?BUFF_ADD, Uid, Buff),
%%    catch trigger_buff_prop(?PROP_ADD, Uid, Buff),
%%    lists:keystore(BuffId, #m_buff.buff_id, BuffList, Buff);
%%%% 新的等级一样 更新
%%add_buff(#m_buff{level = Level, wrap = Wrap, source = OldSrc} = Buff, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList) ->
%%    NewLayer = erlang:max(Wrap, Layer),
%%    #buffCfg{sourceConflict = Conflict} = i_get_cfg(BuffId),
%%    case Conflict of
%%        ?BUFF_SOURCE_COEXIST ->
%%    end,
%%    Buff = Buff#m_buff{},%% buff:make_buff(Uid, BuffId, Level, SrcUid, NewLayer, LifeTime),
%%    lists:keystore(BuffId, #m_buff.buff_id, BuffList, Buff);
add_buff(true, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList) ->
    {Matched_1, Unmatched_1} = i_filter_buff_list(BuffList, [], [], #m_buff.buff_id, BuffId),
    {Matched_2, Unmatched_2} = i_filter_buff_list(Matched_1, [], [], #m_buff.source, SrcUid),
    case Matched_2 of
        [] ->
            %% 不是我的,检查conflict
            case buff:get_cfg(BuffId) of
                %% 共存
               #buffCfg{sourceConflict = ?BUFF_SOURCE_COEXIST} ->
                   add_buff(false, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList);
                %% 替换
                #buffCfg{sourceConflict = ?BUFF_SOURCE_REPLACE} ->
                    on_delete_buff(Uid, Matched_1, ?BUFF_REMOVE),
                    add_buff(false, Uid, BuffId, Level, SrcUid, Layer, LifeTime, Unmatched_1);
                _ ->
                    BuffList
            end;
        _X ->
            %% 如果是我的
            on_delete_buff(Uid, Matched_2, ?BUFF_REMOVE),
            add_buff(false, Uid, BuffId, Level, SrcUid, Layer, LifeTime, lists:append(Unmatched_2, Unmatched_1))
    end;
%% 没有这个buff， 添加新buff
add_buff(_Any, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList) ->
    Buff = buff:new(Uid, BuffId, Level, SrcUid, Layer, LifeTime),
    on_add_buff(Uid, Buff),
    catch trigger_buff_event(?BUFF_ADD, Uid, Buff),
    catch trigger_buff_prop(?PROP_ADD, Uid, Buff),
    [Buff | BuffList].


%% 检查能否添加buff（目标对象等等）
can_add_buff(_Uid, _BuffId, true) ->
    true;
can_add_buff(Uid, BuffId, true) ->
    case buff:get_cfg(BuffId) of
        #buffCfg{immune = 0} ->
            not object_state:test(Uid, ?STATE_DEAD);
        #buffCfg{immune = Immune} ->
            not object_state:test_some(Uid, [Immune, ?STATE_DEAD]);
        _ -> false
    end.

%%-------------------------------------------------------------------
is_buff_exist(_BuffId, []) ->
    false;
is_buff_exist(BuffId, BuffList) ->
    lists:keymember(BuffId, #m_buff.buff_id, BuffList).

%%-------------------------------------------------------------------
del_all(Uid) -> do_del_all(Uid).
del_buff(Uid, BuffId) -> do_del_buff(Uid, #m_buff.buff_id, BuffId).
del_buff_source(Uid, Source) -> do_del_buff(Uid, #m_buff.source, Source).
del_debuff(Uid) -> do_del_buff_cfg(Uid, #buffCfg.purpose, [?BUFF_DEBUFF]).
del_enbuff(Uid) -> do_del_buff_cfg(Uid, #buffCfg.purpose, [?BUFF_ENBUFF]).
del_buff_effect(Uid, Type) -> do_del_buff_cfg(Uid, #buffCfg.effectType, [Type]).
del_buff_group(Uid, GroupId) -> do_del_buff_cfg(Uid, #buffCfg.groupId, [GroupId]).
del_buff_trigger(Uid, ?BUFF_REMOVE_DEATH) -> do_del_buff_cfg(Uid, #buffCfg.deathRemove, [1]);
del_buff_trigger(Uid, ?BUFF_REMOVE_LEAVE_MAP) -> do_del_buff_cfg(Uid, #buffCfg.mapRemove, [1]).

%% 事件删除buff
condition_event_del_buff(?CONDITION_BUFF_HAS_ID, Uid, BuffIdList) ->
    do_del_buff_cfg(Uid, #buffCfg.id, BuffIdList);
condition_event_del_buff(?CONDITION_BUFF_HAS_PM, Uid, [_1, _2]) ->
    do_del_all(Uid);
condition_event_del_buff(?CONDITION_BUFF_HAS_PM, Uid, [Type]) ->
    ?if_else(Type == ?BUFF_DEBUFF, del_debuff(Uid), del_enbuff(Uid));
condition_event_del_buff(?CONDITION_BUFF_HAS_EFFECT, Uid, EffectList) ->
    do_del_buff_cfg(Uid, #buffCfg.effectType, EffectList);
condition_event_del_buff(?CONDITION_BUFF_HAS_GROUP, Uid, GroupList) ->
    do_del_buff_cfg(Uid, #buffCfg.groupId, GroupList).

%%-------------------------------------------------------------------
do_del_all(Uid) ->
    BuffList1 = i_get_buff_list(Uid),
    i_set_buff_list(Uid, []),
    on_delete_buff(Uid, BuffList1, ?BUFF_REMOVE),
    ok.

%%-------------------------------------------------------------------
do_del_buff(Uid, Pos, Key) ->
    BuffList1 = i_get_buff_list(Uid),
    {Matched, Unmatched} = i_filter_buff_list(BuffList1, [], [], Pos, Key),
    i_set_buff_list(Uid, Unmatched),
    on_delete_buff(Uid, Matched, ?BUFF_REMOVE),
    ok.

do_del_buff_cfg(Uid, Pos, KeyList) ->
    BuffList1 = i_get_buff_list(Uid),
    {Matched, Unmatched} = i_filter_buff_list_cfg(BuffList1, [], [], Pos, KeyList),
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
i_filter_buff_list_cfg([], Matched, Unmatched, _Pos, _KeyList) ->
    {Matched, Unmatched};
i_filter_buff_list_cfg([Buff | Original], Matched, Unmatched, Pos, KeyList) ->
    case i_filter_buff_cfg(Buff, Pos, KeyList) of
        true ->
            i_filter_buff_list_cfg(Original, [Buff | Matched], Unmatched, Pos, KeyList);
        _Any ->
            i_filter_buff_list_cfg(Original, Matched, [Buff | Unmatched], Pos, KeyList)
    end.

i_filter_buff_cfg(BuffId, Pos, KeyList) ->
    BuffCfg = buff:get_cfg(BuffId),
    lists:member(element(Pos, BuffCfg), KeyList).

%%-------------------------------------------------------------------
tick(#m_cache_map_object_priv{uid = Uid}, Now) ->
    tick(Uid, i_get_buff_list(Uid), Now).

tick(_Uid, [], _Now) -> ok;
tick(Uid, BuffList, Now) ->
    {DelBuffList, _UpdateBuffList, NewBuffList} = tick_all_buff(BuffList, Uid, [], [], [], Now),
    i_set_buff_list(Uid, NewBuffList),
    %%
    on_delete_buff(Uid, DelBuffList, ?BUFF_FINISH),
%%    on_update_buff(Uid, UpdateBuffList),
    ok.

tick_all_buff([], _Uid, Delete, Update, Continue, _Now) ->
    {Delete, Update, Continue};
tick_all_buff([Buff | BuffList], Uid, Delete, Update, Continue, Now) ->
    case tick_one_buff(Uid, Buff, Now) of
        delete -> tick_all_buff(BuffList, Uid, [Buff | Delete], Update, Continue, Now);
        {update, NewBuff} -> tick_all_buff(BuffList, Uid, Delete, [NewBuff | Update], [NewBuff | Continue], Now);
        NewBuff -> tick_all_buff(BuffList, Uid, Delete, Update, [NewBuff | Continue], Now)
    end.

%% tick buff
tick_one_buff(Uid, Buff, Now) ->
    case can_tick_now(Buff, Now) of
        true -> tick_one_buff_action(Uid, Buff, Now);
        _Any -> Buff
    end.

tick_one_buff_action(Uid, #m_buff{buff_id = BuffId, lifetime = LifeTime}, Now) when LifeTime > 0, Now >= LifeTime ->
    ?DEBUG("object ~p delete buff ~p ",[Uid, BuffId]),
    delete;
tick_one_buff_action(Uid, Buff, Now) ->
    ?DEBUG("object ~p tick buff ~p, now ~p ",[Uid, Buff#m_buff.buff_id, Now]),
    catch trigger_buff_event(?BUFF_TICK, Uid, Buff),
    buff_effect:active(Uid, Buff),
    {update, Buff#m_buff{latest = Now}}.


can_tick_now(#m_buff{buff_id = BuffId, latest = Latest}, Now) ->
    #buffCfg{tickTime = TickTime} = buff:get_cfg(BuffId),
    Now >= Latest + TickTime.

%%-------------------------------------------------------------------
on_add_buff(Uid, Buff) ->
    ?DEBUG("object ~p add buff ~p",[Uid, Buff]),
    ViewNetMsg = #pk_GS2U_AddBuff{uid = Uid, buff = buff:marshal(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg).

%%-------------------------------------------------------------------
on_update_buff(_Uid, []) ->
    skip;
on_update_buff(Uid, [Buff]) ->
    ViewNetMsg = #pk_GS2U_UpdateBuff{uid = Uid, buff = buff:marshal(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
on_update_buff(Uid, BuffList) when is_list(BuffList) ->
    BuffInfoList = [buff:marshal(Buff) || Buff <- BuffList],
    ViewNetMsg = #pk_GS2U_UpdateBuffList{uid = Uid, buff_list = BuffInfoList},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
on_update_buff(Uid, Buff) ->
    ViewNetMsg = #pk_GS2U_UpdateBuff{uid = Uid, buff = buff:marshal(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg).

%%-------------------------------------------------------------------
on_delete_buff(_Uid, [], _TriggerCond) -> skip;
on_delete_buff(Uid, BuffList, TriggerCond) ->
    ?DEBUG("on_delete_buff(~p, *, ~p)",[Uid, TriggerCond]),
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
i_get_buff_list(Uid) ->
    object_rw:get_buff_list(Uid).

i_set_buff_list(Uid, BuffList) ->
    object_rw:set_buff_list(Uid, BuffList).

%%------------------------------------------------------------------
trigger_buff_event(_TriggerCond, _Uid, []) ->
    ok;
trigger_buff_event(TriggerCond, Uid, [Buff | BuffList]) ->
    trigger_buff_event(TriggerCond, Uid, Buff),
    trigger_buff_event(TriggerCond, Uid, BuffList);
trigger_buff_event(TriggerCond, Uid, #m_buff{source = SrcUid, buff_id = BUffId}) ->
    do_trigger_buff_event(TriggerCond, SrcUid, Uid, buff:get_cfg(BUffId)).


do_trigger_buff_event(?BUFF_ADD, SrcUid, TarUid, #buffCfg{onAdd = CondEvent}) ->
    condition_event:action_all(CondEvent, [SrcUid, TarUid],
        condition_event_interface:init_self_ce_param(?MODULE_MAP_PROCESS));
do_trigger_buff_event(?BUFF_REMOVE, SrcUid, TarUid, #buffCfg{onStop = CondEvent}) ->
    condition_event:action_all(CondEvent, [SrcUid, TarUid],
        condition_event_interface:init_self_ce_param(?MODULE_MAP_PROCESS));
do_trigger_buff_event(?BUFF_FINISH, SrcUid, TarUid, #buffCfg{onEnd = CondEvent}) ->
    condition_event:action_all(CondEvent, [SrcUid, TarUid],
        condition_event_interface:init_self_ce_param(?MODULE_MAP_PROCESS));
do_trigger_buff_event(?BUFF_TICK, SrcUid, TarUid, #buffCfg{onTick = CondEvent}) ->
    condition_event:action_all(CondEvent, [SrcUid, TarUid],
        condition_event_interface:init_self_ce_param(?MODULE_MAP_PROCESS));
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