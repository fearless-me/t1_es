%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:26
%%%-------------------------------------------------------------------
-module(ai_transition_lamster).
-author("mawenhong").
-include("pub_def.hrl").
-include("ai.hrl").

%% API
-export([transition/1]).

transition(Uid) ->
    AiState = object_rw:get_ai_state(Uid),
    transition(Uid, AiState).


transition(Uid, ?AI_STATE_IDLE) ->
    idle_transition(Uid);
transition(Uid, ?AI_STATE_PURSUE) ->
    pursue_transition(Uid);
transition(Uid, ?AI_STATE_ATTACK) ->
    attack_transition(Uid);
transition(Uid, ?AI_STATE_RETURN) ->
    return_transition(Uid);
transition(Uid, ?AI_STATE_FLEE) ->
    flee_transition(Uid);
transition(_Uid, CurState) ->
    CurState.

idle_transition(Uid) ->
    Tar = object_rw:get_max_enmity_uid_def(Uid, 0),
    ?if_else(Tar > 0, ?AI_STATE_PURSUE, ?AI_STATE_IDLE).

pursue_transition(Uid) ->
    Tar = object_rw:get_max_enmity_uid_def(Uid, 0),
    if
        Tar == 0 -> ?AI_STATE_RETURN;
        true ->
            IsInAttackDist = mod_ai:is_in_attack_dist(Uid, Tar),
            ?if_else(IsInAttackDist, ?AI_STATE_ATTACK, ?AI_STATE_PURSUE)
    end.

attack_transition(Uid) ->
    Tar = object_rw:get_max_enmity_uid_def(Uid, 0),
    IsUsingSkill = mod_combat:is_using_skill(Uid),
    if
        IsUsingSkill -> ?AI_STATE_ATTACK;
        Tar == 0 -> ?AI_STATE_RETURN;
        true ->
            IsInAttackDist = mod_ai:is_in_attack_dist(Uid, Tar),
            case IsInAttackDist of
                true ->
                    %% todo 某种条件下下逃跑
                    case rand_tool:prob(0.2) of
                       true ->
                           object_rw:set_ai_flee_tick(Uid, rand_tool:rand(100, 150)),
                           ?AI_STATE_FLEE;
                       _Any -> ?AI_STATE_ATTACK
                    end;
                _Any -> ?AI_STATE_PURSUE
            end
    end.

return_transition(Uid) ->
    IsArrivedReturnPos = object_rw:get_ai_arrived_return_pos_def(Uid, true),
    ?if_else(IsArrivedReturnPos, ?AI_STATE_IDLE, ?AI_STATE_RETURN).

flee_transition(Uid) ->
    FleeTick = object_rw:get_ai_flee_tick_def(Uid, 0),
    ?if_else(FleeTick =< 0, ?AI_STATE_PURSUE, ?AI_STATE_FLEE).
