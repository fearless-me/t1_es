%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%      地图对象状态管理器
%%% @end
%%% Created : 14. 十一月 2018 15:42
%%%-------------------------------------------------------------------
-module(object_state).
-author("Administrator").

-include("combat.hrl").

%% API
-export([set/2, unset/2, test/2, test_some/2]).

-export([in_battle/1]).

%%%-------------------------------------------------------------------
set(Uid, State) ->
    StateAll = object_rw:get_state(Uid),
    case i_test(StateAll, State) of
        true -> skip;
        _Any ->
            StateNew = i_set(StateAll, State),
            object_rw:set_state(Uid, StateNew),
            hook_map:on_set_state(Uid, State)
    end,
    ok.

%%%-------------------------------------------------------------------
test(Uid, State) ->
    StateAll = object_rw:get_state(Uid),
    i_test(StateAll, State).

test_some(_Uid, []) ->
    false;
test_some(Uid, SL) ->
    do_test_some(object_rw:get_state(Uid, 0), SL).

do_test_some(_StateAll, []) ->
    false;
do_test_some(StateAll, [State | SL]) ->
    case i_test(StateAll, State) of
        true -> true;
        _Any -> do_test_some(StateAll, SL)
    end.


%%%-------------------------------------------------------------------
unset(Uid, State) ->
    StateAll = object_rw:get_state(Uid),
    case i_test(StateAll, State) of
        true ->
            StateNew = i_unset(StateAll, State),
            object_rw:set_state(Uid, StateNew),
            hook_map:on_unset_state(Uid, State);
        _Any ->
            skip
    end,
    ok.


%%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
i_set(All, State) ->
    misc:set_bit(All, State).

i_unset(All, State) ->
    misc:unset_bit(All, State).

i_test(All, State) ->
    misc:test_bit(All, State).

in_battle(Uid) ->
    misc_time:milli_seconds() - object_rw:get_battle_in_time(Uid) < ?BATTLE_STATE_CONTINUE_TIME.