%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. 十一月 2018 15:49
%%%-------------------------------------------------------------------
-module(mod_combat_filter).
-author("tiancheng").

-include("cfg_skill.hrl").
-include("rec_rw.hrl").
-include("combat.hrl").

%% API
-export([
    filter/3,
    get_targets/1
]).

%% 过滤目标对象
-spec filter(AttackUid::integer(), [integer(), ...], #skillCfg{}) ->
    {#m_object_rw{}, [#m_object_rw{}, ...]} | ErrorCode when ErrorCode :: integer().
filter(_, [], #skillCfg{}) ->
    2;
filter(undefined, _, #skillCfg{}) ->
    2;
filter(#m_object_rw{} = Attacker, [#m_object_rw{}|_] = TargetList, #skillCfg{} = _SkillCfg) ->
    {Attacker, TargetList};
filter(AttackUid, TargetList, #skillCfg{} = SkillCfg) ->
    %% TODO 暂时相信客户端的判断，直接用客户端发上来的所有目标
%%    Pos = object_rw:get_persist_pos(AttackUid),
%%    TargetList = calculate_target_list(AttackUid, TargetList, SkillCfg, Pos),
    filter(object_rw:get(AttackUid), get_targets(TargetList), SkillCfg).

get_targets([]) -> [];
get_targets([0]) -> [];
get_targets(TargetList) ->
    F =
        fun(Der, Acc) ->
            case object_rw:get(Der) of
                undefined ->
                    Acc;
                #m_object_rw{} = Obj ->
                    [Obj | Acc]
            end
        end,
    lists:foldl(F, [], TargetList).

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