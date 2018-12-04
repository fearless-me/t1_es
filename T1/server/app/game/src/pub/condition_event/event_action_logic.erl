%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 十一月 2018 17:47
%%%-------------------------------------------------------------------
-module(event_action_logic).
-author("tiancheng").

-include("rec_rw.hrl").
-include("battle_prop.hrl").
-include("condition_event.hrl").
-include("logger.hrl").
-include("combat.hrl").

%% API
-export([
    event_damage_sub_prop/8
]).

event_damage_sub_prop(
    CEParams,
    #m_object_rw{uid = Atr} = Attack,
    #m_object_rw{uid = Tar} = Target,
    #m_object_rw{battle_props = #m_battleProps{} = BP} = _PropSrcTarget,
    PropID, Percent, Const, ResultType) ->
    %% 只能在地图进程中计算
    case condition_event_interface:is_on_map(CEParams) of
        true ->
            #{skillID := SkillId, cause := Cause, serial := Serial} = CEParams,

            HaveValue = prop_interface:query_v_pf_bpu(PropID, BP),
            LastValue = HaveValue * Percent / 10000 + Const,
            Result =
                case ResultType of
                    ?EVENT_DAMAGE_RESULT_TYPE_DAMAGE ->
                        mod_combat_prop:hitAndDamage(Attack, Target, LastValue, SkillId, Serial, Cause);
                    ?EVENT_DAMAGE_RESULT_TYPE_TREAT ->
                        mod_combat_prop:hitAndDamage(Attack, Target, LastValue, SkillId, Serial, Cause)
                end,

            %% TODO 吸血根据实际伤害来计算最终数据
            %% TODO 伤害事件特殊选项
            ok;
        _ ->
            ?ERROR("battle calc not on map"),
            skip
    end.