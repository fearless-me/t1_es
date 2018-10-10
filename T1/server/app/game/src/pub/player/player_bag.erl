%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 六月 2018 11:57
%%%-------------------------------------------------------------------
-module(player_bag).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").

-record(player_bag, {type = 0, slots = 1, items = #{}}).
-opaque bag() :: #player_bag{}.
-export_type([bag/0]).


-define(BAG_DICT, use_bag).
%% API
-export([
    new/2, find/3, update/3, add/3, add_instance/3,
    bag_valid/1, uid_valid/2,
    del_uid/2, del_uid/3, del_did/3, all_items/1, reorder/1,
    sum/2, remain_slots/1, cur_slots/1, max_slots/1, overlapped/2
]).



%% 加、删、改、合并
%%-------------------------------------------------------------------
new(Type, MaxFreeSlot) when MaxFreeSlot =< 0 ->
    new(Type, 1);
new(Type, MaxFreeSlot) ->
    Bag = #player_bag{type = Type, slots = MaxFreeSlot},
    set_bag(Type, Bag),
    true.

%%-------------------------------------------------------------------
find(Type, Uid, Def) ->
    Bag = get_bag(Type),
    Maps = Bag#player_bag.items,
    maps:get(Uid, Maps, Def).

%%-------------------------------------------------------------------
update(Type, Uid, New) ->
    Bag = get_bag(Type),
    Map0 = Bag#player_bag.items,
    Old = maps:get(Uid, Map0, undefined),
    Map1 = maps:update(Uid, New, Map0),
    set_bag(Type, Bag#player_bag{items = Map1}),
    ?TRY_CATCH(hook_bag:on_update(Type, Uid, Old, New)),
    ok.

%%-------------------------------------------------------------------
add(Type, Did, Num) ->
    CanBagOverlap = hook_bag:bag_can_overlap(Type),
    CanDidOverlap = hook_bag:did_can_overlap(Did),
    add_1( CanBagOverlap andalso CanDidOverlap, Type, Did, Num).


add_1(true, Type, Did, Num) ->
    Bag = get_bag(Type),
    Maps = Bag#player_bag.items,
    case try_to_overlapped(Type, Maps, Did, Num) of
        {make_new, Num} ->
            add_2(Type, Did, Num);
        {make_new, New, NewMaps} ->
            set_bag(Type, Bag#player_bag{items = NewMaps}),
            add_2(Type, Did, New)
    end;
add_1(_No, Type, Did, Num) ->
    add_2(Type, Did, Num).


add_2(_Type, _Did, 0) ->
    true;
add_2(Type, Did, Num) ->
    NeedSlot = hook_bag:need_slot(Did, Num),
    FreeSlot = remain_slots(Type),
    case FreeSlot >= NeedSlot of
        true ->
            do_add(Type, Did, Num);
        _ ->
            erlang:error(need_more_slot)
    end.

do_add(Type, Did, Num) ->
    Uid = uid_gen:item_uid(),
    Bag0 = get_bag(Type),
    Item = hook_bag:make(Type, Uid, Did, Num),
    Bag1 = Bag0#player_bag{items = maps:put(Uid, Item, Bag0#player_bag.items)},
    set_bag(Type, Bag1),
    ?TRY_CATCH(hook_bag:on_added(Type, Item, Num)),
    true.

try_to_overlapped(Type, Maps, Did, Num) ->
    case find_overlap_from_bag_did(Maps, Did, Num) of
        error ->
            {make_new, Num};
        {Rs, New} ->
            {make_new, New, overlap_items(Type, Maps, Rs)}
    end.

overlap_items(_Type, Maps, []) ->
    Maps;
overlap_items(Type, Maps, [{Uid, Added} | Rs]) ->
    Old = maps:get(Uid, Maps),
    New = hook_bag:overlap_op(Old, Added),
    ?TRY_CATCH(hook_bag:on_overlapped(Type, New, 0, Added)),
    overlap_items(Type, maps:update(Uid, New, Maps), Rs).


%%-------------------------------------------------------------------
add_instance(Type, Uid, Item) ->
    case remain_slots(Type) of
        Free when Free > 0 ->
            do_add_instance(Type, Uid, Item);
        _ ->
            erlang:error(need_more_slot)
    end.


do_add_instance(Type, Uid, Item) when is_tuple(Item) ->
    Bag0 = get_bag(Type),
    Bag1 = Bag0#player_bag{items = maps:put(Uid, Item, Bag0#player_bag.items)},
    set_bag(Type, Bag1),
    ?TRY_CATCH(hook_bag:on_added(Type, Item, hook_bag:overlap_num(Item))),
    true;
do_add_instance(Type, _Uid, Item) ->
    ?ERROR("player ~p add ~p to ~p",
        [player_rw:get_uid(), Item, Type]),
    erlang:error(bad_agrs),
    false.

%%-------------------------------------------------------------------
del_uid(Type, Uid, Num) ->
    Bag = get_bag(Type),
    Res = find_from_bag_uid(Bag, Uid),
    do_del_uid(Type, Bag, Uid, Res, Num).

%%-------------------------------------------------------------------
del_uid(Type, Uid) ->
    Bag = get_bag(Type),
    Res = find_from_bag_uid(Bag, Uid),
    Maps = Bag#player_bag.items,
    Bag1 = Bag#player_bag{items = maps:remove(Uid, Maps)},
    set_bag(Type, Bag1),
    ?TRY_CATCH(hook_bag:on_deleted(Type, Res, hook_bag:overlap_num(Res))),
    true.

%%-------------------------------------------------------------------
del_did(Type, Did, Num) ->
    Bag = get_bag(Type),
    Res = find_from_bag_did(Bag, Did, Num),
    Map = Bag#player_bag.items,
    lists:foldl(
        fun({Uid, Dec}, Con) ->
            Elm = maps:get(Uid, Con),
            ?TRY_CATCH(hook_bag:on_deleted(Type, Elm, Dec)),
            case hook_bag:del_one_op(Type, Elm, Dec) of
                {part, New} ->
                    Maps = maps:update(Uid, New, Con),
                    set_bag_items(Type, Maps),
                    Maps;
                all ->
                    Maps = maps:remove(Uid, Con),
                    set_bag_items(Type, Maps),
                    Maps
            end
        end, Map, Res),
    true.

%%-------------------------------------------------------------------
%%del_did_all(Type, Did) -> ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
do_del_uid(_Type, _Bag, _Uid, error, _Num) ->
    false;
do_del_uid(Type, Bag, Uid, Res, Num) ->
    ?TRY_CATCH_RET
    (
        begin
            Maps = Bag#player_bag.items,
            Bag1 =
                case hook_bag:del_one_op(Type, Res, Num) of
                    {part, New} ->
                        Bag#player_bag{items = maps:update(Uid, New, Maps)};
                    all ->
                        Bag#player_bag{items = maps:remove(Uid, Maps)}
                end,
            set_bag(Type, Bag1),
            ?TRY_CATCH(hook_bag:on_deleted(Type, Res, Num), Err1, Stk1),
            true
        end,
        false
    ).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
reorder(Type) ->
    Bag = get_bag(Type),
    Map = Bag#player_bag.items,
    New = hook_bag:reorder(Type, Map),
    set_bag(Type, Bag#player_bag{items = New}),
    hook_bag:sync_all(Type, New),
    ok.

%%-------------------------------------------------------------------
sum(Type, Did) ->
    Bag = get_bag(Type),
    Map = Bag#player_bag.items,
    maps:fold(
        fun(_K, V, Sum)->
            case hook_bag:is_did(V, Did) of
                true -> Sum + hook_bag:overlap_num(V);
                _ -> Sum
            end
        end, 0, Map).

%%-------------------------------------------------------------------
all_items(Type) ->
    Bag = get_bag(Type),
    Bag#player_bag.items.

%%-------------------------------------------------------------------
overlapped(Type, Uid) ->
    Bag = get_bag(Type),
    case maps:find(Uid, Bag#player_bag.items) of
        {ok, Rs} -> hook_bag:overlap_num(Rs);
        _ -> 0
    end.

%%-------------------------------------------------------------------
cur_slots(Type) ->
    Bag = get_bag(Type),
    Bag#player_bag.slots.

%%-------------------------------------------------------------------
remain_slots(Type) ->
    #player_bag{slots = Slot, items = Map} = get_bag(Type),
    Slot - maps:size(Map).

%%-------------------------------------------------------------------
max_slots(Type) ->
    hook_bag:max_slots(Type).


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
                        {all, Dec} ->
                            {[{K, Dec} | Acc], 0};
                        {more, Dec, Left} ->
                            {[{K, Dec} | Acc], Left};
                        _ ->
                            Res
                    end
            end, {[], Num}, Bag#player_bag.items),
    case Res of
        {UidList, 0} -> UidList;
        _ -> error
    end.

find_overlap_from_bag_did(_Maps, Did, Added) when Did =< 0; Added =< 0 ->
    error;
find_overlap_from_bag_did(Maps, Did, Added) ->
    maps:fold(
        fun
            (_K, _V, {_, 0} = Res) ->
                Res;
            (_K, V, {Acc, Left} = AccRes) ->
                case hook_bag:can_be_overlapped(V, Did) of
                    {_Uid, Overlap} = Res when Left >= Overlap ->
                        {[Res | Acc], Left - Overlap};
                    {Uid, Overlap} when Left < Overlap ->
                        {[{Uid, Left} | Acc], 0};
                    _ ->
                        AccRes
                end
        end, {[], Added}, Maps).

%%-------------------------------------------------------------------
find_from_bag_uid(_Bag, Uid) when Uid =< 0 ->
    error;
find_from_bag_uid(Bag, Uid) ->
    case maps:find(Uid, Bag#player_bag.items) of
        {ok, Rs} -> Rs;
        _ -> error
    end.

%%-------------------------------------------------------------------
bag_valid(Type) ->
    case get_bag(Type) of
        undefined -> false;
        _ -> true
    end.

uid_valid(Type, Uid) ->
    Bag = get_bag(Type),
    maps:is_key(Uid, Bag#player_bag.items).


%%-------------------------------------------------------------------
key(Type) -> {?BAG_DICT, Type}.
get_bag(Type) -> get(key(Type)).
set_bag(Type, Bag) -> put(key(Type), Bag).
set_bag_items(Type, Maps)  ->
    Bag = get_bag(Type),
    set_bag(Type, Bag#player_bag{items = Maps}),
    ok.



