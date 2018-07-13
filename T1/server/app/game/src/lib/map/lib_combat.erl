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
%% 瞬发技能放完就结束
%% 吟唱技能设置到当前技能
%% 引导技能也设置到当前技能
%% 还有些技能可能释放完就结束，但是会持续作用
%% 吟唱技能多次伤害的技能支持配置每一次计算伤害的时间 #m_combat_rw.cur_dmg_index / operate_time
%% 引导技能要看策划需求，如果每次一样就设置cd

%% API
-export([
    use_skill/4, tick/1, interrup_skill/1,
    dispatcher/5, can_ai_use_skill/1
]).

use_skill(Aer, Der, SkillId, Serial) ->
    lib_ai_rw:set_skill_serial(Aer, Serial),
    TarUid = case Der > 0 of
                 true -> Der;
                 _ -> Aer
             end,


    TargetList = calculate_target_list(Aer, SkillId, lib_move_rw:get_cur_pos(TarUid)),
    
    %% todo 是否可以优化，因为这个是视野广播，不用给每个人发一次
    %% todo 一次性广播给所有同样的消息，让客户端呢判断下
    F =
        fun(HitUid)->
            calculate_dmg(Aer, SkillId, HitUid, Serial)
        end,

    lists:foreach(F, TargetList),


    NetMsg = #pk_GS2U_UseSkill{
        uid = Aer,
        tar_uid = Der,
        skill_id = SkillId,
        serial = Serial,
        error_code = 0
    },
    lib_map_view:send_net_msg_to_visual(Aer, NetMsg),
    ?DEBUG("~p use skill ~p tar ~p", [Aer, Der, SkillId]),
    ok.

%% todo 引导类型技能
channel_skill_action() ->
    ok.

%% todo 吟唱技能
spell_skill_action() ->
    ok.

%% todo 瞬发技能
instant_skill_action() ->
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
end_use_skill(_Uid) ->
    ok.

interrup_skill(Uid) ->
    end_use_skill(Uid),
    ok.

%%-------------------------------------------------------------------
tick(Unit) ->
    ?TRY_CATCH(tick_skill_queue(Unit), Err1, Stk1),
    ok.



tick_skill_queue(_Unit) -> ok.




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
