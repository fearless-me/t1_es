%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:23
%%%-------------------------------------------------------------------
-module(ai_state_attack).
-author("mawenhong").

%% API
-export([on_enter/1, on_exit/1, update/1, on_event/2]).

on_enter(Uid) ->
    case lib_ai_rw:get_enter_combat_time(Uid) of
        0 ->
            lib_ai_rw:set_enter_combat_time(Uid, misc_time:utc_seconds()),
            lib_ai_rw:set_enter_combat_pos(Uid, lib_move_rw:get_cur_pos(Uid)),
            ok;
        _ -> skip
    end,
    %% todo xx
    lib_ai:on_ai_event(Uid, <<"enter combat">>),
    ok.
on_exit(_Uid) ->
    ok.

update(Uid) ->
    lib_ai:update_lock_target(Uid),
    case lib_combat:can_ai_use_skill(Uid) of
        false ->
            lib_ai:count_down_attack_tick(Uid),
            TarUid = lib_ai_rw:get_target_uid(Uid),
            IsUseSkillNow = lib_ai_rw:get_attack_wait_tick(Uid) =< 0,
            NowSkillId =  lib_ai_rw:get_use_skill_id(Uid),
            case TarUid > 0 andalso IsUseSkillNow of
                true ->
                    lib_ai:ai_use_skill(Uid, TarUid, NowSkillId);
                _ ->
                    skip
            end,
            ok;
        _ ->
            ok
    end,
    ok.

on_event(_Uid, _Event) ->
    ok.