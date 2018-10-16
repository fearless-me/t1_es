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
-include("rec_rw.hrl").

%% API
-export([on_enter/1, on_exit/1, update/1, on_event/2]).

on_enter(Uid) ->
    case object_rw:get_field(Uid, #m_object_rw.ai_enter_combat_time) of
        0 ->
            object_rw:set_fields
            (
                Uid,
                [
                    {#m_object_rw.ai_enter_combat_time, misc_time:utc_seconds()},
                    {#m_object_rw.ai_enter_combat_pos, object_rw:get_field(Uid, #m_object_rw.cur_pos)}
                ]
            ),
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
            TarUid = object_rw:get_field(Uid, #m_object_rw.ai_target_uid),
            IsUseSkillNow = object_rw:get_field(Uid, #m_object_rw.ai_attack_wait_tick) =< 0,
            NowSkillId = object_rw:get_field(Uid, #m_object_rw.ai_use_skill_id),
            case TarUid > 0 andalso IsUseSkillNow of
                true -> mod_ai:ai_use_skill(Uid, TarUid, NowSkillId);
                _ -> skip
            end,
            ok;
        _ ->
            ok
    end,
    ok.

on_event(_Uid, _Event) ->
    ok.