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

%% API
-export([
    event_damage_sub_prop/9
]).

event_damage_sub_prop(
    #m_object_rw{uid = Aer},
    #m_object_rw{uid = Tar},
    #m_object_rw{battle_props = #m_battleProps{} = BP},
    PropID, Percent, Const, ResultType, BloodPer, Extra) ->
    HaveValue = prop_interface:query_v_pf_bpu(PropID, BP),
    LastValue = HaveValue * Percent / 10000 + Const,
    case ResultType of
        ?EVENT_DAMAGE_RESULT_TYPE_DAMAGE ->
            combat_interface:event_damage(Aer, Tar, LastValue);
        ?EVENT_DAMAGE_RESULT_TYPE_TREAT ->
            combat_interface:event_heal(Aer, Tar, LastValue);
        ?EVENT_DAMAGE_RESULT_TYPE_DEFENSE ->
            ?ERROR("no realize EVENT_DAMAGE_RESULT_TYPE_DEFENSE"),
            ok
    end,

    %% TODO 吸血根据实际伤害来计算最终数据
    %% TODO 伤害事件特殊选项
    ok.