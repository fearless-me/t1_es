%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 十二月 2018 15:11
%%%-------------------------------------------------------------------
-module(mod_progress_skill).
-author("tiancheng").
%%
%%-include("map_progress_private.hrl").
%%-include("logger.hrl").
%%-include("cfg_skill.hrl").
%%-include("combat.hrl").
%%
%%%% API
%%-export([
%%    add_skill_progress/4,
%%    break_skill_progress/1,
%%    have_skill_progress/1
%%]).
%%
%%-export([
%%    is_using_skill/1
%%]).
%%
%%add_skill_progress(SrcUid, ObjectUid, SkillID, [NextTime|TimeList] = L) ->
%%    ParamMap = #{skillID => SkillID, attack => SrcUid, target => ObjectUid},
%%
%%    Cb1 = #m_progress_func{
%%        phase = ?PROGRESS_PHASE_BREAK,
%%        func = fun callback_break/2, params = ParamMap
%%    },
%%    Cb2 = #m_progress_func{
%%        phase = ?PROGRESS_PHASE_HIT,
%%        func = fun callback_hit/2, params = ParamMap
%%    },
%%    Cb3 = #m_progress_func{
%%        phase = ?PROGRESS_PHASE_HIT_AND_END,
%%        func = fun callback_hit_end/2, params = ParamMap
%%    },
%%
%%    Progress =
%%        #m_progress_details{
%%            flag_id = mod_progress_core:get_flag_id(), %% 一个随机标识ID
%%            object_uid = ObjectUid,   %% 进度主体
%%            object_param = SkillID,
%%            progress_type = ?PROGRESS_TYPE_SPELL_SKILL,
%%            break_condition = [?PROGRESS_BREAK_CONDITION_MOVE, ?PROGRESS_BREAK_CONDITION_DEAD],
%%            next_node_time = NextTime,
%%            node_time_list = TimeList,
%%            times = 0,  %% 触发次数
%%            all_times = erlang:length(L),
%%            broadcast_client = true,
%%            trigger_list = [Cb1, Cb2, Cb3]
%%        },
%%
%%    mod_progress_core:add_progress(SrcUid, Progress);
%%add_skill_progress(_SrcUid, _ObjectUid, _SkillID, _TimeList) ->
%%    false.
%%
%%break_skill_progress(SrcUid) ->
%%    mod_progress_core:break_progress_by_type(SrcUid, ?PROGRESS_TYPE_SPELL_SKILL).
%%
%%have_skill_progress(SrcUid) ->
%%    mod_progress_core:have_progress_type(SrcUid, ?PROGRESS_TYPE_SPELL_SKILL).
%%
%%%% 只有吟唱技能才会存在正在施放技能。持续技能也是瞬间技能
%%is_using_skill(SrcUid) ->
%%    case mod_progress_core:get_progress_type(SrcUid, ?PROGRESS_TYPE_SPELL_SKILL) of
%%        #m_progress_details{object_param = SkillID} ->
%%            case combat_interface:get_skill_cfg(SkillID) of
%%                #skillCfg{it_type = ?SKILL_SUB_TYPE_IT_SPELL} ->
%%                    true;
%%                _ ->
%%                    false
%%            end;
%%        _ ->
%%            false
%%    end.
%%
%%callback_break(ParamMap, {_Cur, _Max}) ->
%%    ok.
%%
%%callback_hit(ParamMap, {_Cur, _Max}) ->
%%    ok.
%%
%%callback_hit_end(ParamMap, {_Cur, _Max}) ->
%%    ok.