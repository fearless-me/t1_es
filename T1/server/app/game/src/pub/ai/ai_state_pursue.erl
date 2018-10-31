%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:23
%%%-------------------------------------------------------------------
-module(ai_state_pursue).
-author("mawenhong").
-include("rec_rw.hrl").

%% API
-export([on_enter/1, on_exit/1, update/1, on_event/2]).

on_enter(Uid) ->
    CurPos = object_rw:get_cur_pos(Uid),
    TarUid = object_rw:get_max_enmity_uid(Uid),
    mod_ai:reset_lock_target_time(Uid),
    object_rw:set_ai_target_uid(Uid, TarUid),
    case TarUid > 0 of
        true -> mod_ai:start_pursue(Uid, TarUid);
        _ ->  object_rw:set_ai_pursue_tar_pos(Uid, CurPos)
    end,
    
    case object_rw:get_ai_enter_combat_time(Uid) > 0 of
        true -> skip;
        _Fls ->
            object_rw:set_fields(Uid,
                [
                    {#m_object_rw.ai_enter_combat_time, misc_time:utc_seconds()},
                    {#m_object_rw.ai_enter_combat_pos, CurPos}
                ]
            )

    end,
    ok.

update(Uid) ->
    mod_ai:count_down_attack_tick(Uid),
    Ret = mod_ai:update_lock_target(Uid),
    Tar = object_rw:get_ai_target_uid(Uid),
    case Tar > 0 of
        true when Ret =:= true -> mod_ai:start_pursue(Uid, Tar);
        true when Ret =:= false -> mod_ai:update_pursue(Uid, Tar);
        _ -> skip
    end,
    ok.

on_exit(_Uid) -> ok.
on_event(_Uid, _Event) -> ok.