%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%       这仅仅是个例子,这得策划说了算
%%% @end
%%% Created : 22. 五月 2018 17:32
%%%-------------------------------------------------------------------
-module(lib_combat).
-author("mawenhong").
-include("logger.hrl").
-include("common_record.hrl").
-include("map_unit.hrl").
-include("netmsg.hrl").
-include("combat.hrl").
-include("pub_common.hrl").
-include("map.hrl").
%% 瞬发技能放完就结束
%% 吟唱技能设置到当前技能
%% 引导技能也设置到当前技能
%% 还有些技能可能释放完就结束，但是会持续作用
%% 吟唱技能多次伤害的技能支持配置每一次计算伤害的时间 #m_combat_rw.cur_dmg_index / operate_time
%% 引导技能要看策划需求，如果每次一样就设置cd

%% API
-export([
    use_skill/4, tick/1, interrup_skill/1,
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
    lib_map_view:send_net_msg_to_visual(Aer, NetMsg),

    %% 根据类型
    SkillOpType = ?ESOT_Channel,

    lib_combat_rw:set_skill_serial(Aer, Serial),
    skill_action_dispatcher(SkillOpType, Aer, TarUid, SkillId, Serial),
    ?DEBUG("~p use skill ~p tar ~p", [Aer, Der, SkillId]),
    ok.

skill_action_dispatcher(?ESOT_Instant, Aer, Tar, SkillId, Serial) ->
    instant_skill_action(Aer, Tar, SkillId, Serial);
skill_action_dispatcher(?ESOT_Channel, Aer, Tar, SkillId, Serial) ->
    channel_skill_action(Aer, Tar, SkillId, Serial);
skill_action_dispatcher(?ESOT_Spell, Aer, Tar, SkillId, Serial) ->
    spell_skill_action(Aer, Tar, SkillId, Serial).

%% todo 引导类型技能
channel_skill_action(Aer, Tar, SkillId, Serial) ->
    active_skill_once(Aer, lib_move_rw:get_cur_pos(Tar), SkillId, Serial),
    ok.

%% todo 吟唱技能
spell_skill_action(_Aer, _Tar, _SkillId, _Serial) ->
    ok.

%% todo 瞬发技能
instant_skill_action(Aer, Tar, SkillId, Serial) ->
    active_skill_once(Aer, lib_move_rw:get_cur_pos(Tar), SkillId, Serial),
    ok.

active_skill_once(Aer, Pos, SkillId, Serial)->
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
    HitMsg = #pk_GS2U_HitTarget{
        uid = TargetUid, src_uid = Uid, cause = ?EHTC_Skill, misc = SkillId, serial = Serial
    },
    lib_map_view:send_net_msg_to_visual(TargetUid, HitMsg),

    HpMsg = #pk_GS2U_HPChange{
        uid = TargetUid, src_uid = Uid, cause = ?RHPCC_SkillDamage, result = ?ESR_Critical, hp_change = -1000,
        misc1 = SkillId, misc2 = 0, serial = Serial
    },
    lib_map_view:send_net_msg_to_visual(TargetUid, HpMsg),
    ok.

%% 选择技能目标
calculate_target_list(Aer, SkillId, Pos) ->
    %%todo  计算暴击、闪避、格挡等等
    calculate_skill_effect(Aer, SkillId, Pos),
    lib_skill_selector:circle(Aer, Pos, 100).

%% 计算暴击、闪避、格挡等等
calculate_skill_effect(_Uid, _SkillId, _TarUid) ->
    ok.

%%-------------------------------------------------------------------
end_use_skill(Uid) ->
    lib_combat_rw:init_default(Uid),
    ok.

interrup_skill(Uid) ->
    end_use_skill(Uid),
    ok.

%%-------------------------------------------------------------------
tick(Unit) ->
    ?TRY_CATCH(tick_cur_skill(Unit), Err1, Stk1),
    ?TRY_CATCH(tick_skill_queue(Unit), Err2, Stk2),
    ok.


%%todo 引导技能、吟唱技能
tick_cur_skill(#m_map_unit{uid = Uid}) ->
    CurSkillId = lib_combat_rw:get_skill_id(Uid),
    tick_cur_skill_action(Uid, CurSkillId),
    ok.

tick_cur_skill_action(_Uid, 0) ->
    ok;
tick_cur_skill_action(Uid, SkillId) ->
    Serial  = lib_combat_rw:get_skill_serial(Uid),
    OpTime0 = lib_combat_rw:get_operate_time_def(Uid, 0),
    OpTime1 = OpTime0 + ?MAP_TICK,
    lib_combat_rw:set_operate_time(Uid, OpTime1),
    case can_skill_active_tick(Uid, SkillId) of
        true ->
            Pos = lib_combat_rw:get_persist_pos(Uid),
            ?TRY_CATCH(active_skill_once(Uid, Pos, SkillId,  Serial), Err1, Stk1),
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
    _OpTime = lib_combat_rw:get_operate_time(Uid),
    %% todo 到达最大时间? 到达最大次数?
    end_use_skill(Uid).

%%todo 放完就不管的，但是要持续生效的技能
%%todo 创建了一个 OBJ_STATIC
tick_skill_queue(#m_map_unit{uid = Uid}) ->
    Queue0 = lib_combat_rw:get_skill_queue(Uid),
    Queue1 = tick_skill_queue(Uid, Queue0, []),
    lib_combat_rw:set_skill_queue(Uid, Queue1),
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
dispatcher(?OBJ_USR, ?OBJ_USR, Aer, Der, SkillId) ->
    player_vs_player(Aer, Der, SkillId);
dispatcher(?OBJ_USR, ?OBJ_MON, Aer, Der, SkillId) ->
    player_vs_mon(Aer, Der, SkillId);
dispatcher(?OBJ_MON, ?OBJ_USR, Aer, Der, SkillId) ->
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
    lib_combat_rw:get_skill_id(Aer) > 0.
