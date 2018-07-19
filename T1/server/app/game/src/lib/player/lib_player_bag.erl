%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 六月 2018 11:57
%%%-------------------------------------------------------------------
-module(lib_player_bag).
-author("mawenhong").

-include("logger.hrl").
-include("pub_common.hrl").

-record(user_bag, {type = 0, slots = 1, items = #{}}).
-opaque bag() :: #user_bag{}.


-define(BAG_DICT, use_bag).
%% API
-export([
    new/2, reorder/1, add/3, add_instance/3,
    del/2, del/3, del_did/3, reorder/1,
    sum/2, free_slots/1, slots/1, overlapped/2
]).

-record(m_item, {uid = 0, did = 0, num = 1, bind = true}).


%% 加、删、改、合并
%%-------------------------------------------------------------------
new(Type, MaxFreeSlot) when MaxFreeSlot =< 0 ->
    new(Type, 1);
new(Type, MaxFreeSlot) ->
    Type = #user_bag{type = Type, slots = MaxFreeSlot},
    set_bag(Type, Type),
    ok.

%%-------------------------------------------------------------------
add(Type, Did, Num) ->
    NeedSlot = hook_bag:need_slot(Did, Num),
    FreeSlot = free_slots(Type),
    case FreeSlot >= NeedSlot of
        true -> add_action(Type, Did, Num);
        _ ->
            erlang:error(need_more_slot)
    end.

add_action(Type, Did, Num) ->
    Uid = uid_gen:item_uid(),
    Bag0 = get_bag(Type),
    Item = hook_bag:make(Type, Uid, Did, Num),
    Bag1 = Bag0#user_bag{items = maps:put(Uid, Item, Bag0#user_bag.items)},
    set_bag(Type, Bag1),
    hook_bag:on_added(Type, Item, Num),
    ok.

add_instance(Type, Uid, Item) ->
    case free_slots(Type) of
        Free when Free > 0 ->
            add_instance_action(Type, Uid, Item);
        _ ->
            erlang:error(need_more_slot)
    end.


add_instance_action(Type, Uid, Item) when is_tuple(Item) ->
    Bag0 = get_bag(Type),
    Bag1 = Bag0#user_bag{items = maps:put(Uid, Item, Bag0#user_bag.items)},
    set_bag(Type, Bag1),
    hook_bag:on_added(Type, Item, hook_bag:overlap_num(Item)),
    ok;
add_instance_action(Type, _Uid, Item) ->
    ?ERROR("player ~p add ~p to ~p",
        [lib_player_rw:get_uid(), Item, Type]),
    erlang:error(bad_agrs),
    ok.

%%-------------------------------------------------------------------
del(Type, Uid, Num) ->
    Bag = get_bag(Type),
    Res = find_from_bag_uid(Bag, Uid),
    del_action(Type, Bag, Uid, Res, Num).

%%-------------------------------------------------------------------
del(Type, Uid) ->
    Bag = get_bag(Type),
    Res = find_from_bag_uid(Bag, Uid),
    Maps = Bag#user_bag.items,
    Bag1 = Bag#user_bag{items = maps:remove(Uid, Maps)},
    set_bag(Type, Bag1),
    hook_bag:on_deleted(Type, Res, hook_bag:overlap_num(Res)),
    true.

%%-------------------------------------------------------------------
del_did(Type, Did, Num) ->
    Bag = get_bag(Type),
    Res = find_from_bag_did(Bag, Did, Num),
    Map = Bag#user_bag.items,
    lists:foldl(
        fun({Uid, Dec}, Con) ->
            Elm = maps:get(Uid, Con),
            hook_bag:on_deleted(Type, Elm, Dec),
            case hook_bag:del_one_op(Type, Elm, Dec) of
                {ok, New} -> maps:update(Uid, New, Con);
                all -> maps:remove(Uid, Con)
            end
        end, Map, Res),
    ok.

%%-------------------------------------------------------------------
%%del_did_all(Type, Did) -> ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
del_action(_Type, _Bag, _Uid, error, _Num) ->
    false;
del_action(Type, Bag, Uid, Res, Num) ->
    ?TRY_CATCH_RET
    (
        begin
            Maps = Bag#user_bag.items,
            Bag1 =
                case hook_bag:del_one_op(Type, Res, Num) of
                    {ok, New} ->
                        Bag#user_bag{items = maps:update(Uid, New, Maps)};
                    all ->
                        Bag#user_bag{items = maps:remove(Uid, Maps)}
                end,
            set_bag(Type, Bag1),
            hook_bag:on_deleted(Type, Res, Num),
            true
        end,
        false
    ).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
reorder(Type) ->
    Bag = get_bag(Type),
    Map = Bag#user_bag.items,
    New = hook_bag:reorder(Type, Map),
    set_bag(Type, Bag#user_bag{items = New}),
    hook_bag:sync_all(Type, New),
    ok.

%%-------------------------------------------------------------------
sum(Type, Did) ->
    Bag = get_bag(Type),
    Map = Bag#user_bag.items,
    maps:fold(
        fun(_K, V, Sum)->
            case hook_bag:is_did(V, Did) of
                true -> Sum + hook_bag:overlap_num(V);
                _ -> Sum
            end
        end, 0, Map).


overlapped(Type, Uid) ->
    Bag = get_bag(Type),
    case maps:find(Uid, Bag#user_bag.items) of
        {ok, Rs} -> hook_bag:overlap_num(Rs);
        _ -> 0
    end.

slots(Type) ->
    Bag = get_bag(Type),
    Bag#user_bag.slots.

free_slots(Type) ->
    #user_bag{slots = Slot, items = Map} = get_bag(Type),
    Slot - maps:size(Map).


%%-------------------------------------------------------------------
find_from_bag_did(_Bag, Did, Num) when Did =< 0; Num =< 0 ->
    error;
find_from_bag_did(Bag, Did, Num) ->
    Res =
        maps:fold(
            fun
                (_K, _V, {_, 0} = Res) ->
                    Res;
                (K, V, {Acc, Need} = Res) ->
                    case hook_bag:find_check(V, Did, Need) of
                        {full, Dec} ->
                            {[{K, Dec} | Acc], 0};
                        {more, Dec, Left} ->
                            {[{K, Dec} | Acc], Left};
                        _ ->
                            Res
                    end
            end, {[], Num}, Bag#user_bag.items),
    case Res of
        {UidList, 0} -> UidList;
        _ -> error
    end.

find_from_bag_uid(_Bag, Uid) when Uid =< 0 ->
    error;
find_from_bag_uid(Bag, Uid) ->
    case maps:find(Uid, Bag#user_bag.items) of
        {ok, Rs} -> Rs;
        _ -> error
    end.


key(Type) -> {?BAG_DICT, Type}.
get_bag(Type) -> get(key(Type)).
set_bag(Type, Bag) -> put(key(Type), Bag).



