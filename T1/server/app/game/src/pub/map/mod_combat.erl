%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%       这仅仅是个例子,这得策划说了算
%%% @end
%%% Created : 22. 五月 2018 17:32
%%%-------------------------------------------------------------------
-module(mod_combat).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("map_core.hrl").
-include("combat.hrl").
-include("rec_rw.hrl").
-include("cfg_skill.hrl").

%% 瞬发技能放完就结束
%% 吟唱技能设置到当前技能
%% 引导技能也设置到当前技能
%% 还有些技能可能释放完就结束，但是会持续作用
%% 吟唱技能多次伤害的技能支持配置每一次计算伤害的时间 #m_combat_rw.cur_dmg_index / operate_time
%% 引导技能要看策划需求，如果每次一样就设置cd

%% API
-export([
    use_skill/4, tick/1, interrupt_skill/1,
    dispatcher/5, can_ai_use_skill/1, is_using_skill/1
]).

use_skill(Aer, Der, SkillId, Serial) ->
    TarUid = ?if_else(Der > 0, Der, Aer),
    NetMsg = #pk_GS2U_UseSkill{
        uid = Aer,
        tar_uid = Der,
        skill_id = SkillId,
        serial = Serial,
        error_code = 0
    },
    map_view:send_net_msg_to_visual(Aer, NetMsg),
    
    %% 触发事件
    ?TRY_CATCH(trigger_before_cast_event(Aer, Der, SkillId)),
    
    %% 根据类型
    SkillOpType = ?SKILL_OP_CHANNEL,
    
    object_rw:set_field(Aer, #m_object_rw.skill_serial, Serial),
    use_skill_dispatcher(SkillOpType, Aer, TarUid, SkillId, Serial),
    ?DEBUG("~p use skill ~p tar ~p", [Aer, Der, SkillId]),
    ok.

use_skill_dispatcher(?SKILL_OP_INSTANT, Aer, Tar, SkillId, Serial) ->
    instant_skill(Aer, Tar, SkillId, Serial);
use_skill_dispatcher(?SKILL_OP_CHANNEL, Aer, Tar, SkillId, Serial) ->
    channel_skill(Aer, Tar, SkillId, Serial);
use_skill_dispatcher(?SKILL_OP_SPELL, Aer, Tar, SkillId, Serial) ->
    spell_skill(Aer, Tar, SkillId, Serial).

%% todo 引导类型技能
channel_skill(Aer, Tar, SkillId, Serial) ->
    active_skill_once(Aer, Tar, object_rw:get_field(Tar, #m_object_rw.cur_pos), SkillId, Serial),
    ok.

%% todo 吟唱技能
spell_skill(_Aer, _Tar, _SkillId, _Serial) ->
    ok.

%% todo 瞬发技能
instant_skill(Aer, Tar, SkillId, Serial) ->
    active_skill_once(Aer, Tar, object_rw:get_field(Tar, #m_object_rw.cur_pos), SkillId, Serial),
    ok.

active_skill_once(Aer, Tar, Pos, SkillId, Serial) ->
    
    ?TRY_CATCH(trigger_before_hit_event(Aer, Tar, SkillId)),
    
    TargetList = calculate_target_list(Aer, SkillId, Pos),
    
    %% todo 是否可以优化，因为这个是视野广播，不用给每个人发一次
    %% todo 一次性广播给所有同样的消息，让客户端呢判断下
    F =
        fun(HitUid) ->
            calculate_dmg(Aer, SkillId, HitUid, Serial)
        end,
    
    lists:foreach(F, TargetList),
    ok.

%%-------------------------------------------------------------------
calculate_dmg(Uid, SkillId, TargetUid, Serial) ->
    
    ?TRY_CATCH(trigger_hit_event(Uid, TargetUid, SkillId)),
    
    HitMsg = #pk_GS2U_HitTarget{
        uid = TargetUid, src_uid = Uid, cause = ?HIT_REASON_SKILL, misc = SkillId, serial = Serial
    },
    map_view:send_net_msg_to_visual(TargetUid, HitMsg),
    
    HpMsg = #pk_GS2U_HPChange{
        uid = TargetUid, src_uid = Uid, cause = ?HP_CHANGE_SKILL, result = ?ESR_CRITICAL, hp_change = -1000,
        misc1 = SkillId, misc2 = 0, serial = Serial
    },
    map_view:send_net_msg_to_visual(TargetUid, HpMsg),
    ok.

%% 选择技能目标
calculate_target_list(Aer, SkillId, Pos) ->
    %%todo  计算暴击、闪避、格挡等等
    calculate_skill_effect(Aer, SkillId, Pos),
    skill_selector:circle(Aer, Pos, 100).

%% 计算暴击、闪避、格挡等等
calculate_skill_effect(_Uid, _SkillId, _TarUid) ->
    ok.

%%-------------------------------------------------------------------
end_use_skill(Uid) ->
    object_rw:set_fields(
        Uid,
        [
            {#m_object_rw.skill_id, 0},
            {#m_object_rw.target_uid, 0},
            {#m_object_rw.skill_serial, 0},
            {#m_object_rw.persist_pos, vector3:new()},
            {#m_object_rw.cur_dmg_index,0},
            {#m_object_rw.operate_time, 0},
            {#m_object_rw.spell_time, 0},
            {#m_object_rw.channel_cd, 0},
            {#m_object_rw.skill_queue, []}
        ]
    ),
    ok.

interrupt_skill(Uid) ->
    end_use_skill(Uid),
    ok.

%%-------------------------------------------------------------------
tick(Obj) ->
    ?TRY_CATCH(tick_cur_skill(Obj), Err1, Stk1),
    ?TRY_CATCH(tick_skill_queue(Obj), Err2, Stk2),
    ok.


%%todo 引导技能、吟唱技能
tick_cur_skill(#m_cache_map_object{uid = Uid}) ->
    CurSkillId = object_rw:get_field(Uid, #m_object_rw.skill_id),
    do_tick_cur_skill(Uid, CurSkillId),
    ok.

do_tick_cur_skill(_Uid, 0) ->
    ok;
do_tick_cur_skill(Uid, SkillId) ->
    ?WARN("uid ~p tick skill ~p", [Uid, SkillId]),
    Serial = object_rw:get_field(Uid, #m_object_rw.skill_serial),
    OpTime0 = object_rw:get_field(Uid, #m_object_rw.operate_time, 0),
    OpTime1 = OpTime0 + ?MAP_TICK,
    object_rw:set_field(Uid, #m_object_rw.operate_time, OpTime1),
    case can_skill_active_tick(Uid, SkillId) of
        true ->
            Pos = object_rw:get_field(Uid, #m_object_rw.persist_pos),
            ?TRY_CATCH(trigger_cast_tick_event(Uid, Uid, SkillId)),
            ?TRY_CATCH(active_skill_once(Uid, Uid, Pos, SkillId, Serial), Err1, Stk1),
            ?TRY_CATCH(check_end_skill_tick(Uid, SkillId), Err2, Stk2),
            ok;
        _ ->
            skip
    end,
    %%
    
    ok.

can_skill_active_tick(_Uid, _SkillId) ->
    true.

check_end_skill_tick(Uid, _SkillId) ->
    _OpTime = object_rw:get_field(Uid, #m_object_rw.operate_time),
    %% todo 到达最大时间? 到达最大次数?
    end_use_skill(Uid).

%%todo 放完就不管的，但是要持续生效的技能
%%todo 创建了一个 OBJ_STATIC
tick_skill_queue(#m_cache_map_object{uid = Uid}) ->
    Queue0 = object_rw:get_field(Uid, #m_object_rw.skill_queue),
    Queue1 = tick_skill_queue(Uid, Queue0, []),
    object_rw:set_field(Uid, #m_object_rw.skill_queue, Queue1),
    ok.

tick_skill_queue(_Uid, [], Acc) -> Acc;
tick_skill_queue(Uid, [Elm | Queue], Acc) ->
    case ?TRY_CATCH_RET(tick_one_skill_queue(Uid, Elm), error) of
        error -> tick_skill_queue(Uid, Queue, Acc);
        NewElm -> tick_skill_queue(Uid, Queue, [NewElm | Acc])
    end.

tick_one_skill_queue(_Uid, Elm) ->
    Elm.

%%-------------------------------------------------------------------
dispatcher(?OBJ_PLAYER, ?OBJ_PLAYER, Aer, Der, SkillId) ->
    player_vs_player(Aer, Der, SkillId);
dispatcher(?OBJ_PLAYER, ?OBJ_MON, Aer, Der, SkillId) ->
    player_vs_mon(Aer, Der, SkillId);
dispatcher(?OBJ_MON, ?OBJ_PLAYER, Aer, Der, SkillId) ->
    mon_vs_player(Aer, Der, SkillId);
dispatcher(AType, DType, Aer, Der, SkillId) ->
    ?WARN("~p(~p) vs ~p(~p) skill", [Aer, AType, Der, DType, SkillId]).


%%-------------------------------------------------------------------
player_vs_player(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.

%%-------------------------------------------------------------------
player_vs_mon(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.

%%-------------------------------------------------------------------
mon_vs_player(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.


can_ai_use_skill(_Aer) ->
    true.


is_using_skill(Aer) ->
    object_rw:get_field(Aer, #m_object_rw.skill_id, 0) > 0.


%%
trigger_before_cast_event(Aer, Der, SkillId) ->
    #skillCfg{beforecast = EventList} = getCfg:getCfgByArgs(cfg_skill, SkillId),
    condition_event:action_all(EventList, [Aer, Der]).

trigger_cast_tick_event(Aer, Der, SkillId) ->
    #skillCfg{castingtick = EventList} = getCfg:getCfgByArgs(cfg_skill, SkillId),
    condition_event:action_all(EventList, [Aer, Der]).

trigger_before_hit_event(Aer, Der, SkillId) ->
    #skillCfg{beforehit = EventList} = getCfg:getCfgByArgs(cfg_skill, SkillId),
    condition_event:action_all(EventList, [Aer, Der]).

trigger_hit_event(Aer, Der, SkillId) ->
    #skillCfg{beforehit = EventList} = getCfg:getCfgByArgs(cfg_skill, SkillId),
    condition_event:action_all(EventList, [Aer, Der]).
