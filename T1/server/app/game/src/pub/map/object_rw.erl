%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. 十月 2018 10:59
%%%-------------------------------------------------------------------
-module(object_rw).
-author("mawenhong").
%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
-include("map_core.hrl").

%% API
-export([
    init/1, del/1, get/1,
    set_field/3, set_field_direct/3,
    set_fields/2, set_fields_direct/2,
    get_field/2, get_field/3
]).

%%-------------------------------------------------------------------
init(Uid)when is_number(Uid)-> init(#m_object_rw{uid = Uid});
init(#m_object_rw{}=V) -> misc_ets:write(i_detail_ets(), V).

%%-------------------------------------------------------------------
del(Uid) -> misc_ets:delete(i_detail_ets(), Uid).

%%-------------------------------------------------------------------
get(Uid) ->
    case misc_ets:read(i_detail_ets(), Uid) of
        []  -> undefined;
        [R] -> R
    end.


get_field(Uid, Pos) ->
    misc_ets:read_element(i_detail_ets(), Uid, Pos).

get_field(Uid, Pos, Def) ->
    case misc_ets:read_element(i_detail_ets(), Uid, Pos) of
        undefined -> Def;
        Any -> Any
    end.

%%-------------------------------------------------------------------
set_fields(_Uid,[]) -> ok;
set_fields(Uid,FieldList) ->
    misc_ets:update_element(
        i_detail_ets(), Uid, FieldList),
    i_set_fields(Uid,FieldList),
    ok.

set_fields_direct(_Uid,[]) -> ok;
set_fields_direct(Uid,FieldList) ->
    misc_ets:update_element(
        i_detail_ets(), Uid, FieldList),
    ok.

%%-------------------------------------------------------------------
set_field(Uid, Pos, Value) ->
    misc_ets:update_element(
        i_detail_ets(), Uid, {Pos, Value}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{Pos, Value})).

set_field_direct(Uid, Pos, Value) ->
    misc_ets:update_element(
        i_detail_ets(), Uid, {Pos, Value}),
    ok.

%%-------------------------------------------------------------------
i_set_fields(_Uid,[]) ->
    ok;
i_set_fields(Uid,[Field | FieldList]) ->
    ?TRY_CATCH(hook_map:on_rw_update(Uid, Field)),
    i_set_fields(Uid, FieldList).


i_detail_ets() ->
    map_rw:get_detail_ets().