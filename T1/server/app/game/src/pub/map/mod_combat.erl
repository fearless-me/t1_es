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
    use_skill/4, tick/2, interrupt_skill/1,
    dispatcher/5, can_ai_use_skill/1, is_using_skill/1
]).

use_skill(Aer, Der, SkillId, Serial) ->
    do_use_skill(Aer, Der, get_skill_cfg(SkillId), Serial, SkillId).

do_use_skill(Aer, Der, undefined, Serial, SkillId) ->
    NetMsg = #pk_GS2U_UseSkill{
        uid = Aer,
        tar_uid = Der,
        skill_id = SkillId,
        serial = Serial,
        error_code = -1
    },
    gs_interface:send_net_msg(Aer,NetMsg),
    ok;
do_use_skill(Aer, Der, SkillCfg, Serial, SkillId) ->
    TarUid = ?if_else(Der > 0, Der, Aer),
    NetMsg = #pk_GS2U_UseSkill{
        uid = Aer,
        tar_uid = Der,
        skill_id = SkillId,
        serial = Serial,
        error_code = 0
    },
    mod_view:send_net_msg_to_visual(Aer, NetMsg),
    
    %% 触发事件
    ?TRY_CATCH(trigger_before_cast_event(Aer, Der, SkillCfg)),
    
    %% 根据类型
    object_rw:set_skill_serial(Aer, Serial),
    use_skill_dispatcher(SkillCfg, Aer, TarUid, Serial),
    ?DEBUG("~p use skill ~p to tar ~p", [Aer, SkillId, TarUid]),
    ok.

use_skill_dispatcher(#skillCfg{casttype = ?SKILL_OP_INSTANT} = SkillCfg, Aer, Tar, Serial) ->
    instant_skill(Aer, Tar, SkillCfg, Serial);
use_skill_dispatcher(#skillCfg{casttype = ?SKILL_OP_CHANNEL} = SkillCfg, Aer, Tar, Serial) ->
    channel_skill(Aer, Tar, SkillCfg, Serial);
use_skill_dispatcher(#skillCfg{casttype = ?SKILL_OP_SPELL} = SkillCfg , Aer, Tar, Serial) ->
    spell_skill(Aer, Tar, SkillCfg, Serial).

%% todo 引导类型技能
channel_skill(Aer, Tar, SkillCfg, Serial) ->
    active_skill_once(Aer, Tar, object_rw:get_cur_pos(Tar), SkillCfg, Serial),
    ok.

%% todo 吟唱技能
spell_skill(_Aer, _Tar, _SkillCfg, _Serial) ->
    ok.

%% todo 瞬发技能
instant_skill(Aer, Tar, SkillCfg, Serial) ->
    active_skill_once(Aer, Tar, object_rw:get_cur_pos(Tar), SkillCfg, Serial),
    ok.

active_skill_once(_Aer, _Tar, undefined, _SkillCfg, _Serial) ->
    ok;
active_skill_once(Aer, Tar, Pos, SkillCfg, Serial) ->
    
    ?TRY_CATCH(trigger_before_hit_event(Aer, Tar, SkillCfg)),
    
    TargetList = calculate_target_list(Aer, Tar, SkillCfg, Pos),
    
    %% todo 是否可以优化，因为这个是视野广播，不用给每个人发一次
    %% todo 一次性广播给所有同样的消息，让客户端呢判断下
    F =
        fun(HitUid) ->
            calculate_dmg(Aer, SkillCfg, HitUid, Serial)
        end,
    
    lists:foreach(F, TargetList),
    ok.

%%-------------------------------------------------------------------
calculate_dmg(Uid, #skillCfg{id = SkillId} = SkillCfg, TargetUid, Serial) ->
    
    ?TRY_CATCH(trigger_hit_event(Uid, TargetUid, SkillCfg)),
    
    HitMsg = #pk_GS2U_HitTarget{
        uid = TargetUid, src_uid = Uid, cause = ?HIT_REASON_SKILL, misc = SkillId, serial = Serial
    },
    mod_view:send_net_msg_to_visual(TargetUid, HitMsg),
    
    HpMsg = #pk_GS2U_HPChange{
        uid = TargetUid, src_uid = Uid, cause = ?HP_CHANGE_SKILL, result = ?ESR_CRITICAL, hp_change = -1000,
        misc1 = SkillId, misc2 = 0, serial = Serial
    },
    mod_view:send_net_msg_to_visual(TargetUid, HpMsg),
    ok.

%% 选择技能目标
calculate_target_list(Aer, Tar, SkillCfg, Pos) ->
    %%todo  计算暴击、闪避、格挡等等
    calculate_skill_effect(Aer, SkillCfg, Pos),
    target_selector(Aer, Tar, Pos, SkillCfg).

%% 根据目标选择
target_selector(_Aer, Tar, _Pos, #skillCfg{casttarget = ?SKILL_CAST_TARGET_SINGLE}) ->
    [Tar];
target_selector(Aer, Tar, Pos, #skillCfg{casttarget = ?SKILL_CAST_TARGET_DIRECTION} = SkillCfg) ->
    target_selector_area(Aer, Tar, Pos, SkillCfg);
target_selector(Aer, Tar, Pos, #skillCfg{casttarget = ?SKILL_CAST_TARGET_POSITION} = SkillCfg) ->
    target_selector_area(Aer, Tar, Pos, SkillCfg);
target_selector(Aer, Tar, Pos, #skillCfg{casttarget = ?SKILL_CAST_TARGET_FACE_DIR} = SkillCfg) ->
    target_selector_area(Aer, Tar, Pos, SkillCfg).

%% 根据范围选择
target_selector_area(_Aer, Tar, _Pos, #skillCfg{areatype = ?SKILL_AREA_TYPE_SINGLE})->
    [Tar];
target_selector_area(Aer, _Tar, Pos, #skillCfg{areatype = ?SKILL_AREA_TYPE_LINE, radius = Radius, target = SkillTarget})->
    FaceDir = object_rw:get_dir(Aer),
    skill_selector:rectangle(Aer, Pos, FaceDir, Radius, Radius, SkillTarget);
target_selector_area(Aer, _Tar, Pos, #skillCfg{areatype = ?SKILL_AREA_TYPE_CIRCLE, radius = Radius, target = SkillTarget})->
    skill_selector:circle(Aer, Pos, Radius, SkillTarget).

%% 计算暴击、闪避、格挡等等
calculate_skill_effect(_Uid, _SkillCfg, _TarUid) ->
    ok.

%%-------------------------------------------------------------------
interrupt_skill(Uid) ->
    SkillId = object_rw:get_skill_id(Uid),
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
    Msg = #pk_GS2U_SkillInterrupt{uid = Uid, skill_id = SkillId},
    mod_view:send_net_msg_to_visual(Uid, Msg),
    ok.


%%-------------------------------------------------------------------
tick(Obj, Now) ->
    ?TRY_CATCH(tick_cur_skill(Obj), Err1, Stk1),
    ?TRY_CATCH(tick_skill_queue(Obj), Err2, Stk2),
    ok.


%%todo 引导技能、吟唱技能
tick_cur_skill(#m_cache_map_object_priv{uid = Uid}) ->
    CurSkillId = object_rw:get_skill_id(Uid),
    do_tick_cur_skill(Uid, get_skill_cfg(CurSkillId)),
    ok.


do_tick_cur_skill(Uid, #skillCfg{id = SkillId} = SkillCfg) ->
    ?WARN("uid ~p tick skill ~p", [Uid, SkillId]),
    Serial = object_rw:get_skill_serial(Uid),
    OpTime0 = object_rw:get_operate_time(Uid, 0),
    OpTime1 = OpTime0 + ?MAP_TICK,
    object_rw:set_operate_time(Uid, OpTime1),
    case can_skill_active_tick(Uid, SkillCfg) of
        true ->
            Pos = object_rw:get_persist_pos(Uid),
            ?TRY_CATCH(trigger_cast_tick_event(Uid, Uid, SkillCfg)),
            ?TRY_CATCH(active_skill_once(Uid, Uid, Pos, SkillCfg, Serial), Err1, Stk1),
            ?TRY_CATCH(check_end_skill_tick(Uid, SkillCfg), Err2, Stk2),
            ok;
        _ ->
            skip
    end,
    %%
    
    ok;
do_tick_cur_skill(_Uid, undefined) ->
    ok.

can_skill_active_tick(_Uid, _SkillCfg) ->
    true.

check_end_skill_tick(Uid, _SkillCfg) ->
    _OpTime = object_rw:get_operate_time(Uid),
    %% todo 到达最大时间? 到达最大次数?
    interrupt_skill(Uid).

%%todo 放完就不管的，但是要持续生效的技能
%%todo 创建了一个 OBJ_STATIC
tick_skill_queue(#m_cache_map_object_priv{uid = Uid}) ->
    Queue0 = object_rw:get_skill_queue(Uid),
    Queue1 = tick_skill_queue(Uid, Queue0, []),
    object_rw:set_skill_queue(Uid, Queue1),
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
    object_rw:get_skill_id(Aer, 0) > 0.


%%
trigger_before_cast_event(Aer, Der, #skillCfg{beforecast = EventList}) ->
    condition_event:action_all(EventList, [Aer, Der]).

trigger_cast_tick_event(Aer, Der,  #skillCfg{castingtick = EventList}) ->
    condition_event:action_all(EventList, [Aer, Der]).

trigger_before_hit_event(Aer, Der, #skillCfg{beforecast = EventList}) ->
    condition_event:action_all(EventList, [Aer, Der]).

trigger_hit_event(Aer, Der,  #skillCfg{beforehit = EventList}) ->
    condition_event:action_all(EventList, [Aer, Der]).

get_skill_cfg(0) -> undefined;
get_skill_cfg(SkillId) ->
    case getCfg:getCfgByArgs(cfg_skill, SkillId) of
        #skillCfg{} = Cfg -> Cfg;
        _Any -> undefined
    end.