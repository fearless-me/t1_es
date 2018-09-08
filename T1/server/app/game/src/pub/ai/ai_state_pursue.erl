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
    CurPos = move_rw:get_cur_pos(Uid),
    TarUid = ai_rw:get_max_enmity_uid(Uid),
    ai_mod:reset_lock_target_time(Uid),
    ai_rw:set_target_uid(Uid, TarUid),
    case TarUid > 0 of
        true -> ai_mod:start_pursue(Uid, TarUid);
        _ -> ai_rw:set_pursue_tar_pos(Uid, CurPos)
    end,

    case ai_rw:get_enter_combat_time(Uid) > 0 of
        true -> skip;
        _Fls ->
            ai_rw:get_enter_combat_time(misc_time:utc_seconds()),
            ai_rw:set_enter_combat_pos(Uid, CurPos)
    end,
    ok.

update(Uid) ->
    ai_mod:count_down_attack_tick(Uid),
    Ret = ai_mod:update_lock_target(Uid),
    Tar = ai_rw:get_target_uid(Uid),
    case Tar > 0 of
        true when Ret =:= true -> ai_mod:start_pursue(Uid, Tar);
        true when Ret =:= false-> ai_mod:update_pursue(Uid, Tar);
        _ -> skip
    end,
    ok.

on_exit(_Uid) -> ok.
on_event(_Uid, _Event) -> ok.