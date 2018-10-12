%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(attr_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
    get_max_hp/1, get_max_hp_def/2, set_max_hp/2, % #m_attr_rw.max_hp
    get_speed/1, get_speed_def/2, set_speed/2, % #m_attr_rw.speed
    get_attack/1, get_attack_def/2, set_attack/2, % #m_attr_rw.attack
    % common function
    del/1, to_record/1, set/2, set_fields/2, init_default/1, init_default/2
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_attr_rw.max_hp
get_max_hp(Uid) -> get_max_hp_def(Uid, undefined).

get_max_hp_def(Uid, Def) ->
    case erlang:get({Uid, m_attr_rw}) of
        undefined -> Def;
        V -> V#m_attr_rw.max_hp
    end.

set_max_hp(Uid, V) ->
    R = erlang:get({Uid, m_attr_rw}),
    erlang:put({Uid, m_attr_rw}, R#m_attr_rw{max_hp = V}).

%%-------------------------------------------------------------------
%% #m_attr_rw.speed
get_speed(Uid) -> get_speed_def(Uid, undefined).

get_speed_def(Uid, Def) ->
    case erlang:get({Uid, m_attr_rw}) of
        undefined -> Def;
        V -> V#m_attr_rw.speed
    end.

set_speed(Uid, V) ->
    R = erlang:get({Uid, m_attr_rw}),
    erlang:put({Uid, m_attr_rw}, R#m_attr_rw{speed = V}).

%%-------------------------------------------------------------------
%% #m_attr_rw.attack
get_attack(Uid) -> get_attack_def(Uid, undefined).

get_attack_def(Uid, Def) ->
    case erlang:get({Uid, m_attr_rw}) of
        undefined -> Def;
        V -> V#m_attr_rw.attack
    end.

set_attack(Uid, V) ->
    R = erlang:get({Uid, m_attr_rw}),
    erlang:put({Uid, m_attr_rw}, R#m_attr_rw{attack = V}).

%%-------------------------------------------------------------------
del(Uid) -> erlang:erase({Uid, m_attr_rw}).

%%-------------------------------------------------------------------
to_record(Uid) -> erlang:get({Uid, m_attr_rw}).

%%-------------------------------------------------------------------
set(Uid, #m_attr_rw{} = V) ->
    erlang:put({Uid, m_attr_rw}, V).

%%-------------------------------------------------------------------
init_default(Uid) -> erlang:put({Uid, m_attr_rw}, #m_attr_rw{}).
init_default(Uid, #m_attr_rw{} = V) -> erlang:put({Uid, m_attr_rw}, V).

%%-------------------------------------------------------------------
set_fields(_Uid, []) -> ok;
set_fields(Uid, FieldList) ->
    R1 = erlang:get({Uid, m_attr_rw}),
    R2 = i_set_fields(Uid, FieldList, R1),
    erlang:put({Uid, m_attr_rw}, R2),
    ok.

%%-------------------------------------------------------------------
i_set_fields(_Uid, R, []) ->
    R;
i_set_fields(Uid, R, [H | FieldList]) ->
    i_set_fields(Uid, i_set_field(Uid, R, H), FieldList).

%%#m_attr_rw.max_hp
i_set_field(_Uid, {max_hp, Val}, R) ->
    R#m_attr_rw{max_hp = Val};
i_set_field(_Uid, {max_hp, Val, add}, R) ->
    R#m_attr_rw{max_hp = R#m_attr_rw.max_hp + Val};
i_set_field(_Uid, {max_hp, Val, sub}, R) ->
    R#m_attr_rw{max_hp = R#m_attr_rw.max_hp - Val};
i_set_field(_Uid, {#m_attr_rw.max_hp, Val}, R) ->
    R#m_attr_rw{max_hp = Val};
i_set_field(_Uid, {#m_attr_rw.max_hp, Val, add}, R) ->
    R#m_attr_rw{max_hp = R#m_attr_rw.max_hp + Val};
i_set_field(_Uid, {#m_attr_rw.max_hp, Val, sub}, R) ->
    R#m_attr_rw{max_hp = R#m_attr_rw.max_hp - Val};
%%#m_attr_rw.speed
i_set_field(_Uid, {speed, Val}, R) ->
    R#m_attr_rw{speed = Val};
i_set_field(_Uid, {speed, Val, add}, R) ->
    R#m_attr_rw{speed = R#m_attr_rw.speed + Val};
i_set_field(_Uid, {speed, Val, sub}, R) ->
    R#m_attr_rw{speed = R#m_attr_rw.speed - Val};
i_set_field(_Uid, {#m_attr_rw.speed, Val}, R) ->
    R#m_attr_rw{speed = Val};
i_set_field(_Uid, {#m_attr_rw.speed, Val, add}, R) ->
    R#m_attr_rw{speed = R#m_attr_rw.speed + Val};
i_set_field(_Uid, {#m_attr_rw.speed, Val, sub}, R) ->
    R#m_attr_rw{speed = R#m_attr_rw.speed - Val};
%%#m_attr_rw.attack
i_set_field(_Uid, {attack, Val}, R) ->
    R#m_attr_rw{attack = Val};
i_set_field(_Uid, {attack, Val, add}, R) ->
    R#m_attr_rw{attack = R#m_attr_rw.attack + Val};
i_set_field(_Uid, {attack, Val, sub}, R) ->
    R#m_attr_rw{attack = R#m_attr_rw.attack - Val};
i_set_field(_Uid, {#m_attr_rw.attack, Val}, R) ->
    R#m_attr_rw{attack = Val};
i_set_field(_Uid, {#m_attr_rw.attack, Val, add}, R) ->
    R#m_attr_rw{attack = R#m_attr_rw.attack + Val};
i_set_field(_Uid, {#m_attr_rw.attack, Val, sub}, R) ->
    R#m_attr_rw{attack = R#m_attr_rw.attack - Val};
i_set_field(_Uid, _Elem, R) -> R.

%%-------------------------------------------------------------------
