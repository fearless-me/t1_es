%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:23
%%%-------------------------------------------------------------------
-module(ai_state_flee).
-author("mawenhong").

%% API
-export([on_enter/1, on_exit/1, update/1, on_event/2]).

on_enter(Uid) ->
    mod_ai:rand_flee_pos(Uid),
    ok.
on_exit(Uid) ->
    object_rw:set_ai_is_arrived_flee_pos(Uid, false),
    ok.

update(Uid) ->
    Tick = mod_ai:count_down_flee_tick(Uid),
    case Tick < 50 of
        true -> skip;
        _Any ->
            IsArrived = object_rw:get_ai_is_arrived_flee_pos_def(Uid, false),
            case IsArrived of
                true ->
                    FleePos = mod_ai:rand_flee_pos(Uid),
                    mod_ai:start_flee(Uid, FleePos);
                _Any ->
                    mod_ai:update_flee(Uid)
            end
    end.

on_event(_Uid, _Event) -> ok.