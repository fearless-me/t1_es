%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 九月 2018 11:52
%%%-------------------------------------------------------------------
-module(bit_list).
-author("tiancheng").

%% API
-export([]).

-record(bit_list,{ size = 0, default = 0, bits = []}).
-define(SIZE, 64).
%%
%%%%-------------------------------------------------------------------
%%new() -> i_new(?SIZE, 0).
%%
%%new(BitSize) -> i_new(BitSize, 0).
%%
%%new(BitSize, Default) ->
%%	i_new(BitSize, misc:b2i(Default)).
%%
%%%%-------------------------------------------------------------------
%%set(Bit) ->
%%	ok.
%%
%%%%-------------------------------------------------------------------
%%set(Bit, V) -> ok.
%%
%%%%-------------------------------------------------------------------
%%unset(Bit) -> ok.
%%
%%
%%%%-------------------------------------------------------------------
%%bits_to_ints(BitSize) ->
%%	BitSize div ?SIZE + 1.
%%
%%bit_to_slot(Bit) ->
%%	Bit div ?SIZE.
%%
%%bit_to_idx(Bit) ->
%%	Bit rem ?SIZE.
%%
%%i_new(BitSize, 0) ->
%%	IntSize = bits_to_ints(BitSize),
%%	#bit_list{size = BitSize, default = 0, bits = lists:duplicate(IntSize, 0)};
%%i_new(BitSize, _) ->
%%	Default = 1 bsl ?SIZE,
%%	IntSize = bits_to_ints(BitSize),
%%	#bit_list{size = BitSize, default = Default, bits = lists:duplicate(IntSize, Default)}.
%%
%%i_set(#bit_list{size = CurSize, bits = BitList} = BitList, Bit, Value) when CurSize >= Bit ->
%%	Slot = bit_to_slot(Bit),
%%	Idx  = bit_to_idx(Bit),
%%	lists:keyfind(Slot, 1, BitList),
%%	ok;
%%i_set(#bit_list{size = CurSize} = BitList, Bit, Value) ->
%%	ok.




