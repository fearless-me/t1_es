%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 六月 2018 16:50
%%%-------------------------------------------------------------------
-module(llist).
-author("mawenhong").

%% API
-export([
    new/1, add/3, member/4,
    del/4, del_n/4,
    foreach/2, foreach_n/3,
    foldl/3, foldl_n/4,
    partition/1, size/1
]).

-opaque llist() :: {?MODULE, Partition :: non_neg_integer(), Count :: non_neg_integer(), Dict :: dict:dict()}.
-export_type([llist/0]).

-export([test/0]).

new(N) -> {?MODULE, N, 0, #{}}.

partition({?MODULE, N, _EN, _Maps}) -> N.

size({?MODULE,_N, EN, _Maps}) -> EN.

add({?MODULE, N, EN, Maps}, HashKey, Elem) ->
    Idx = hashkey_to_key(N, HashKey),
    List = maps:get(Idx, Maps, []),
    {?MODULE, N, EN + 1, maps:put(Idx, [Elem | List], Maps)}.

del({?MODULE, N, EN, Maps} = LList, HashKey, KeyPos, Key) ->
    Idx = hashkey_to_key(N, HashKey),
    List = maps:get(Idx, Maps, []),
    case List of
        [] -> LList;
        _ ->
            case lists:keyfind(Key, KeyPos, List) of
                false ->
                    LList;
                _ ->
                    New = lists:keydelete(Key, KeyPos, List),
                    {?MODULE, N, EN - 1, maps:put(Idx, New, Maps)}
            end
    end.

del_n({?MODULE, N, EN, Maps} = LList, HashKey, KeyPos, KeyList) ->
    Idx = hashkey_to_key(N, HashKey),
    List = maps:get(Idx, Maps, []),
    case List of
        [] ->
            LList;
        _ ->
            New = lists:foldl(
                fun(Key, Acc) ->
                    lists:keydelete(Key, KeyPos, Acc)
                end, List, KeyList),
            {?MODULE, N, EN - 1, maps:put(Idx, New, Maps)}
    end.

member({?MODULE, N, _EN, Maps} = _LList, HashKey, KeyPos, Key) ->
    Idx = hashkey_to_key(N, HashKey),
    List = maps:get(Idx, Maps, []),
    case List of
        [] -> false;
        _ ->
            lists:keyfind(Key, KeyPos, List) =/= false
    end.


foreach(LList, Fun) ->
    do_foreach(LList, Fun).

do_foreach({?MODULE, 0, _EN, _Maps}, _Fun) -> ok;
do_foreach({?MODULE, _N, 0, _Maps}, _Fun) -> ok;
do_foreach({?MODULE, N, _EN, Maps}, Fun) -> do_foreach_1(1, N, Maps, Fun).

do_foreach_1(X, N, Maps, Fun) when X >= 1, X =< N ->
    List = maps:get(X, Maps),
    lists:foreach(Fun, List),
    do_foreach_1(X + 1, N, Maps, Fun);
do_foreach_1(_X, _N, _Maps, _Fun) ->
    ok.


foreach_n({?MODULE, _N, _EN, Maps}, X, Fun) ->
    List = maps:get(X, Maps, []),
    lists:foreach(Fun, List),
    ok.

foldl(LList, Acc, Fun) ->
    do_foldl(LList, Acc, Fun).

do_foldl({?MODULE, 0, _EN, _Maps}, Acc, _Fun) -> Acc;
do_foldl({?MODULE, _N, 0, _Maps}, Acc, _Fun) -> Acc;
do_foldl({?MODULE, N, _EN, Maps}, Acc, Fun) -> do_foldl_1(1, N, Maps, Acc, Fun).

do_foldl_1(X, N, Maps, Acc, Fun) when X >= 1, X =< N ->
    List = maps:get(X, Maps),
    AccNew = lists:foldl(Fun, Acc, List),
    do_foldl_1(X + 1, N, Maps, AccNew, Fun);
do_foldl_1(_X, _N, _Maps, Acc, _Fun) ->
    Acc.


foldl_n({?MODULE, _N, _EN, Maps}, X, Acc, Fun) ->
    List = maps:get(X, Maps, []),
    lists:foldl(Fun, Acc, List).


hashkey_to_key(N, HashKey) when is_integer(HashKey) ->
    HashKey rem N + 1.




test() ->
    LList0 = llist:new(5),
    LList1 = llist:add(LList0, 1, {1, a}),
    LList2 = llist:add(LList1, 2, {2, b}),
    LList3 = llist:add(LList2, 3, {3, c}),
    LList4 = llist:add(LList3, 4, {4, d}),
    LList5 = llist:add(LList4, 5, {5, e}),
    LList6 = llist:add(LList5, 5, {10, g}),
    io:format("~w~n~n", [LList6]),
    LList7 = llist:add(LList6, 6, {6, f}),
    io:format("~w~n~n", [LList7]),
    LList8 = llist:del(LList7, 6, 1, 6),
    io:format("~w~n~n", [LList8]),

    llist:foreach(
        LList8,
        fun(V) ->
            io:format("~w~n", [V])
        end),
    io:format("~n"),

    llist:foreach_n(
        LList8, 5,
        fun(V) ->
            io:format("~w~n~n", [V])
        end),

    FL =
        llist:foldl_n(LList8, 1, [],
            fun({K, _V}, Acc) ->
                [K | Acc]
            end),
    io:format("~p~n",[FL]),
    
    ok.