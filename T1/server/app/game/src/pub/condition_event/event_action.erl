%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 10:26
%%%-------------------------------------------------------------------
-module(event_action).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("condition_event.hrl").
-include("cfg_conditional_event.hrl").

%% API
-export([action/2]).
%%-------------------------------------------------------------------
%% 1.调用目标：1.自己 2.目标
%% 2.属性类型：1.生命值
%% 3.千分比（int）
%% 4.常数（int）
%% 5.伤害类型： 1.伤害 2.治疗
action([?EVENT_DAMAGE, ?EVENT_DAMAGE_SUB_PERCENT, P1, P2, P3, P4, P5], [Aer, Der]) ->
    Tar = ?if_else(P1 == ?TARGET_SELF, Aer, Der),
    Val = player_interface:get_attr(Tar, P2),
    LastValue = Val * P3 / 1000 + P4,
    case P5 of
        1 -> combat_interface:event_damage(Aer, Tar, LastValue);
        2 -> combat_interface:event_heal(Aer, Tar, LastValue)
    end,
    ok;


%%-------------------------------------------------------------------
action(_Event, _Params) ->
    skip.


