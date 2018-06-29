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

%% API
-export([on_enter/1, on_exit/1, update/1, on_event/2]).

on_enter(Uid) ->
    CurPos = lib_move_rw:get_cur_pos(Uid),
    TarUid = lib_ai_rw:get_max_enmity_uid(Uid),
    lib_ai:reset_lock_target_time(Uid),
    lib_ai_rw:set_target_uid(Uid, TarUid),
    case TarUid > 0 of
        true -> lib_ai:start_pursue(Uid);
        _ -> lib_ai_rw:set_pursue_tar_pos(CurPos)
    end,

    case lib_ai_rw:get_enter_combat_time(Uid) > 0 of
        true -> skip;
        _Fls ->
            lib_ai_rw:get_enter_combat_time(time:utc_seconds()),
            lib_ai_rw:set_enter_combat_pos(Uid, CurPos)
    end,
    ok.

update(Uid) ->
    lib_ai:count_down_attack_tick(Uid),
    Ret = lib_ai:update_lock_target(Uid),
    Tar = lib_ai_rw:get_target_uid(Uid),
    case Tar > 0 of
        true when Ret =:= true -> lib_ai:start_pursue(Uid, Tar);
        true when Ret =:= false-> lib_ai:update_pursue(Uid, Tar);
        _ -> skip
    end,
    ok.

on_exit(_Uid) -> ok.
on_event(_Uid, _Event) -> ok.