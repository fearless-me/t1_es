%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:25
%%%-------------------------------------------------------------------
-module(ai_transition_passive).
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
transition(Uid, ?AI_STATE_ATTACK) ->
    attack_transition(Uid);
transition(Uid, ?AI_STATE_RETURN) ->
    return_transition(Uid);
transition(_Uid, CurState) ->
    CurState.

idle_transition(Uid) ->
    Tar = object_rw:get_max_enmity_uid_def(Uid, 0),
    ?if_else(Tar > 0, ?AI_STATE_ATTACK, ?AI_STATE_IDLE).

attack_transition(Uid) ->
    IsUsingSkill = mod_combat:is_using_skill(Uid),
    Tar = object_rw:get_ai_target_uid_def(Uid, 0),
    if
        IsUsingSkill ->
            ?AI_STATE_ATTACK;
        Tar == 0 ->
            ?AI_STATE_RETURN;
        true ->
            IsInAttackDist = mod_ai:is_in_attack_dist(Uid, Tar),
            ?if_else(IsInAttackDist, ok, mod_ai:set_enmity_active(Uid, Tar, false)),
            ?AI_STATE_ATTACK
    end.


return_transition(Uid) ->
    ?if_else
    (
        object_rw:get_ai_arrived_return_pos(Uid),
        ?AI_STATE_IDLE, ?AI_STATE_RETURN
    ).
