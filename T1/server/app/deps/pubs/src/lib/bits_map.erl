%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 九月 2018 11:52
%%%-------------------------------------------------------------------
-module(bits_map).
-author("mawenhong").


-opaque bits_map() :: #{}.
-export_type([bits_map/0]).
-define(UNIT_BITS, 64).

%% API
-export([new/0, set/2, unset/2, test_bit/2, fold/3, seq_first_set/1, seq_first_unset/3]).
-export([test/0]).


%%-------------------------------------------------------------------
new() -> #{}.

%%-------------------------------------------------------------------
set(BL, BitIndex) -> i_set(BL, BitIndex).
%%-------------------------------------------------------------------
unset(BL, BitIndex) -> i_unset(BL, BitIndex).
%%-------------------------------------------------------------------
test_bit(BL, BitIndex) -> i_get(BL, BitIndex).
%%-------------------------------------------------------------------
fold(BL, Init, F) when is_function(F, 3) ->
    maps:fold(
        fun(K, V, Acc) ->
            do_fold(K, V, Acc, F, 0)
        end, Init, BL).
%%-------------------------------------------------------------------

do_fold(_K, 0, Acc, _F, _Index) ->
    Acc;
do_fold(K, V, Acc, F, Index) when V band 1 > 0 ->
    NewAcc = F(K  * ?UNIT_BITS + Index + 1, true, Acc),
    do_fold(K, V bsr 1, NewAcc, F, Index + 1);
do_fold(K, V, Acc, F, Index)  ->
    do_fold(K, V bsr 1, Acc, F, Index + 1).


%%-------------------------------------------------------------------
seq_first_unset(BL, StartBit, MaxBit) ->
    do_seq_first_unset(BL, StartBit, MaxBit, 1).

do_seq_first_unset(_BL, _StartBit, MaxBit, Loop) when Loop > MaxBit ->
    -1;
do_seq_first_unset(BL, StartBit, MaxBit, Loop) when StartBit > MaxBit ->
    case test_bit(BL, StartBit) of
        true -> do_seq_first_unset(BL, 1, MaxBit, Loop + 1);
        _Any -> StartBit
    end;
do_seq_first_unset(BL, StartBit, MaxBit, Loop) ->
    case test_bit(BL, StartBit) of
        true -> do_seq_first_unset(BL, StartBit + 1, MaxBit, Loop + 1);
        _Any -> StartBit
    end.


%%-------------------------------------------------------------------
seq_first_set(BL) ->
    Iterator = maps:iterator(BL),
    case maps:next(Iterator) of
        none -> -1;
        {K, V, _} ->
            io:format("kv={~p,~p}~n",[K,V]),
            K * ?UNIT_BITS + misc:first_set_bit(V)
    end.

%%-------------------------------------------------------------------
to_slot(BitIndex) -> (BitIndex - 1) div ?UNIT_BITS.
to_index(BitIndex) -> (BitIndex - 1) rem ?UNIT_BITS + 1.

%%-------------------------------------------------------------------
i_set(BitsMap, BitIndex) ->
    case test_bit(BitsMap, BitIndex) of
        true -> BitsMap;
        _Any -> i_set(BitsMap, BitIndex, true)
    end.

i_set(BitsMap, BitIndex, V) ->
    Slot = to_slot(BitIndex),
    Index = to_index(BitIndex),
    BitValue1 = maps:get(Slot, BitsMap, 0),
    BitValue2 = i_op(BitValue1, Index, V),
    case BitValue2 == 0 of
        true -> maps:remove(Slot, BitsMap);
        _Any -> BitsMap#{Slot => BitValue2}
    end.

i_unset(BitsMap, BitIndex) ->
    case test_bit(BitsMap, BitIndex) of
        true -> i_set(BitsMap, BitIndex, false);
        _Any -> BitsMap
    end.

i_get(BitsMap, BitIndex) ->
    Slot = to_slot(BitIndex),
    Index = to_index(BitIndex),
    Value = maps:get(Slot, BitsMap, 0),
    misc:test_bit(Value, Index).

%%-------------------------------------------------------------------
i_op(V, Index, true) -> misc:set_bit(V, Index);
i_op(V, Index, _Any) -> misc:unset_bit(V, Index).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
-define(WRAP(F), timer:tc(fun()-> F end)).
test() ->
    BL1 = bits_map:new(),
    io:format("~n*****set*****~n"),
    BL2 = i_test_set(BL1, 1),
    BL3 = i_test_set(BL2, 2),
    BL40 = i_test_set(BL3, 10),
    BL41 = i_test_set(BL40, 64),
    BL42 = i_test_set(BL41, 65),
    BL43 = i_test_set(BL42, 128),
    BL44 = i_test_set(BL43, 65536),
    BL45 = i_test_set(BL44, 10),
    BL4 = i_test_set(BL45, 65536000),
    io:format("~n*****fold*****~n"),
    io:format("first set ~p, first unset ~p~n",[?WRAP(seq_first_set(BL4)), ?WRAP(seq_first_unset(BL4, 789, 65536))]),
    i_test_fold(BL4),
    io:format("~n*****unset*****~n"),
    BL5 = i_test_unset(BL4, 1),
    BL6 = i_test_unset(BL5, 2),
    BL7 = i_test_unset(BL6, 10),
    BL8 = i_test_unset(BL7, 11),
    BL0 = i_test_unset(BL8, 65),
    io:format("~n*****fold*****~n"),
    i_test_fold(BL0),
    
    io:format("first set ~p, first unset ~p~n",[?WRAP(seq_first_set(BL0)), ?WRAP(seq_first_unset(BL0, 1, 1024))]),
    ok.

i_test_fold(BL) ->
    F =
        fun(BitIndex, _True, Acc) ->
            io:format("~p ", [BitIndex]),
            Acc
        end,
    bits_map:fold(BL, 1, F),
    io:format("~n"),
    ok.

i_test_set(BL0, BitIndex) ->
    BL1 = bits_map:set(BL0, BitIndex),
    io:format("~p~n~p~ntest_bit(~p) = ~p~n~n",
        [BL0, BL1, BitIndex, bits_map:test_bit(BL1, BitIndex)]),
    BL1.

i_test_unset(BL0, BitIndex) ->
    BL1 = bits_map:unset(BL0, BitIndex),
    io:format("~p~n~p~ntest_bit(~p) = ~p~n~n",
        [BL0, BL1, BitIndex, bits_map:test_bit(BL1, BitIndex)]),
    BL1.



