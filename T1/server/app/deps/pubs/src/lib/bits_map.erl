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

%% API
-export([new/0, set/2, set/3, unset/2, test_bit/2, fold/3]).
-export([test/0]).

-define(SIZE, 64).

%%-------------------------------------------------------------------
new() -> #{}.

%%-------------------------------------------------------------------
set(BL, BitIndex) -> i_set(BL, BitIndex, true).
set(BL, BitIndex, V) -> i_set(BL, BitIndex, misc:i2b(V)).
unset(BL, BitIndex) -> i_unset(BL, BitIndex, false).
test_bit(BL, BitIndex)  -> i_get(BL, BitIndex).
fold(BL, Init, F) when is_function(F, 3)->
    maps:fold(
        fun(K, V, {N, Acc})->
            {N + 1, F(K, V, Acc)}
        end, {1, Init}, BL).

%%-------------------------------------------------------------------
to_slot(BitIndex)   -> BitIndex div ?SIZE.
to_index(BitIndex)  -> BitIndex rem ?SIZE.

%%-------------------------------------------------------------------
i_set(BitsMap, BitIndex, V) ->
    Slot = to_slot(BitIndex),
    Index = to_index(BitIndex),
    BitValue1 = maps:get(Slot, BitsMap, 0),
    BitValue2 = BitValue1 bor i_gen(Index, V),
    case BitValue2 == 0 of
        true -> maps:remove(Slot, BitsMap);
        _Any -> BitsMap#{Slot => BitValue2}
    end.

i_unset(BitsMap, BitIndex, V) ->
    Slot = to_slot(BitIndex),
    Index = to_index(BitIndex),
    BitValue1 = maps:get(Slot, BitsMap, 0),
    BitValue2 = BitValue1 band i_gen(Index, V),
    case BitValue2 == 0 of
        true -> maps:remove(Slot, BitsMap);
        _Any -> BitsMap#{Slot => BitValue2}
    end.


i_get(BitsMap, BitIndex) ->
    Slot = to_slot(BitIndex),
    Index = to_index(BitIndex),
    Value = maps:get(Slot, BitsMap, 0),
    (Value band i_gen(Index, true)) > 0.

%%-------------------------------------------------------------------
i_gen(Index, true) -> 1 bsl Index;
i_gen(Index, _Any) -> (1 bsl ?SIZE) band (1 bsl Index).


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
test() ->
    BL1 = bits_map:new(),
    BL2 = i_set(BL1, 1),
    BL3 = i_set(BL2, 2),
    BL4 = i_set(BL3, 10),
    BL5 = i_unset(BL4, 1),
    BL6 = i_unset(BL5, 2),
    BL7 = i_unset(BL6, 10),
    _BL = i_unset(BL7, 65),
    ok.

i_set(BL0, BitIndex) ->
    BL1 = bits_map:set(BL0, BitIndex),
    io:format("set ~p ~p  test_bit(~p) = ~p~n",
        [BL0, BL1, BitIndex, bits_map:test_bit(BL1, BitIndex)]),
    BL1.

i_unset(BL0, BitIndex) ->
    BL1 = bits_map:unset(BL0, BitIndex),
    io:format("unset ~p ~p test_bit(~p) = ~p~n",
        [BL0, BL1, BitIndex, bits_map:test_bit(BL1, BitIndex)]),
    BL1.



