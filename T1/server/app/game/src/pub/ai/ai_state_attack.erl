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
    case ai_rw:get_enter_combat_time(Uid) of
        0 ->
            ai_rw:set_enter_combat_time(Uid, misc_time:utc_seconds()),
            ai_rw:set_enter_combat_pos(Uid, object_rw:get_cur_pos(Uid)),
            ok;
        _ -> skip
    end,
    %% todo xx
    mod_ai:on_ai_event(Uid, <<"enter combat">>),
    ok.
on_exit(_Uid) ->
    ok.

update(Uid) ->
    mod_ai:update_lock_target(Uid),
    case mod_combat:can_ai_use_skill(Uid) of
        false ->
            mod_ai:count_down_attack_tick(Uid),
            TarUid = ai_rw:get_target_uid(Uid),
            IsUseSkillNow = ai_rw:get_attack_wait_tick(Uid) =< 0,
            NowSkillId = ai_rw:get_use_skill_id(Uid),
            case TarUid > 0 andalso IsUseSkillNow of
                true ->
                    mod_ai:ai_use_skill(Uid, TarUid, NowSkillId);
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