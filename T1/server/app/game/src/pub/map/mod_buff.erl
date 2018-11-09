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
-include("condition_event.hrl").

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
            BuffList1 = i_get_buff_list(Uid),
            BuffExist = find_buff(BuffId, BuffList1),
            case add_buff(BuffExist, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList1) of
                keep -> skip;
                BuffList2 -> i_set_buff_list(Uid, BuffList2)
            end;
        _Any -> skip
    end,
    ok.

%% 新的等级低
add_buff(#m_buff{level = BuffLevel}, _Uid, _BuffId, Level, _SrcUid, _Layer, _LifeTime,  _) when BuffLevel > Level ->
    keep;
%% 新的等级高 %% todo 这种地方要优化属性计算
add_buff(#m_buff{level = BuffLevel} = OldBuff, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList) when BuffLevel < Level ->
    catch trigger_buff_event(?BUFF_REMOVE, Uid, OldBuff),
    catch trigger_buff_prop(?PROP_DEL, Uid, OldBuff),
    Buff = make_buff(Uid, BuffId, Level, SrcUid, Layer, LifeTime),
    on_update_buff(Uid, Buff),
    catch trigger_buff_event(?BUFF_ADD, Uid, Buff),
    catch trigger_buff_prop(?PROP_ADD, Uid, Buff),
    lists:keystore(BuffId, #m_buff.buff_id, BuffList, Buff);
%% 新的等级一样 更新
add_buff(#m_buff{level = Level, wrap = Wrap}, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList) ->
    NewLayer = erlang:max(Wrap, Layer),
    Buff = make_buff(Uid, BuffId, Level, SrcUid, NewLayer, LifeTime),
    lists:keystore(BuffId, #m_buff.buff_id, BuffList, Buff);
%% 没有这个buff， 添加新buff
add_buff(_Any, Uid, BuffId, Level, SrcUid, Layer, LifeTime, BuffList) ->
    Buff = make_buff(Uid, BuffId, Level, SrcUid, Layer, LifeTime),
    on_add_buff(Uid, Buff),
    catch trigger_buff_event(?BUFF_ADD, Uid, Buff),
    catch trigger_buff_prop(?PROP_ADD, Uid, Buff),
    [Buff | BuffList].

%% todo 检查能否添加buff
can_add_buff(_Uid, _BuffId, _SkipImmune) ->
    true.

%% 
make_buff(_Uid, BuffId, Level, SrcUid, Layer, LifeTime) ->
    RealLifeTime = ?if_else(LifeTime == 0, 1000, LifeTime),
    #m_buff{buff_id = BuffId, lifetime = RealLifeTime, level = Level, source = SrcUid, wrap = Layer}.

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
del_all(Uid) -> do_del_all(Uid).
del_buff(Uid, BuffId) -> do_del_buff(Uid, #m_buff.buff_id, BuffId).
del_buff_source(Uid, Source) -> do_del_buff(Uid, #m_buff.source, Source).
del_debuff(Uid) -> do_del_buff_cfg(Uid, #buffCfg.debuff, [1]).
del_enbuff(Uid) -> do_del_buff_cfg(Uid, #buffCfg.debuff, [0]).
del_buff_effect(Uid, Type) -> do_del_buff_cfg(Uid, #buffCfg.effect, [Type]).
del_buff_group(Uid, GroupId) -> do_del_buff_cfg(Uid, #buffCfg.group_id, [GroupId]).
del_buff_trigger(Uid, Trigger) -> do_del_buff_cfg(Uid, #buffCfg.del_trigger, [Trigger]).

%% 事件删除buff
condition_event_del_buff(?BUFF_CHECK_TYPE_ID, Uid, BuffIdList) ->
    do_del_buff_cfg(Uid, #buffCfg.id, BuffIdList);
condition_event_del_buff(?BUFF_CHECK_TYPE_EN_DE, Uid, [_1, _2]) ->
    do_del_all(Uid);
condition_event_del_buff(?BUFF_CHECK_TYPE_EN_DE, Uid, [Type]) ->
    ?if_else(Type == ?BUFF_DEBUFF, del_debuff(Uid), del_enbuff(Uid));
condition_event_del_buff(?BUFF_CHECK_TYPE_EFFECT, Uid, EffectList) ->
    do_del_buff_cfg(Uid, #buffCfg.effect, EffectList);
condition_event_del_buff(?BUFF_CHECK_TYPE_GROUP, Uid, GroupList) ->
    do_del_buff_cfg(Uid, #buffCfg.group_id, GroupList).

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

i_filter_buff_cfg(_BuffId, Pos, KeyList) ->
    BuffCfg = #buffCfg{},
    lists:member(element(Pos, BuffCfg), KeyList).

%%-------------------------------------------------------------------
tick(#m_cache_map_object{uid = Uid}, Now) ->
    tick(Uid, i_get_buff_list(Uid), Now).

tick(_Uid, [], _Now) -> ok;
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