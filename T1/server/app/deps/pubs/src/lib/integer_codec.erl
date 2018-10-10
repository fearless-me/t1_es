%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 对int32/uint32/int64/uint64 进行编码 ，使用zigzag压缩,
%%% 对于32位压缩后 1-5个字节
%%% 对于64位压缩后 1-10个字节
%%% i_encode:test().
%%% @end
%%% Created : 10. 十月 2018 9:24
%%%-------------------------------------------------------------------
-module(integer_codec).
-author("mawenhong").


-include("type.hrl").

%% API
-export([encode_integer/1, decode_integer/1, decode_integer/2]).
-export([test/0]).


-spec decode_integer(binary()) -> {non_neg_integer(), binary()}.
decode_integer(Bin) -> decode_integer(Bin, 64).

-spec decode_integer(binary(), pos_integer()) -> {non_neg_integer(), binary()}.
decode_integer(Bin, MaxNumBits) -> de_i(Bin, 0, 0, MaxNumBits).

de_i(<<1:1, X:7, Rest/binary>>, N, Acc, MaxNumBits) when N < (64-7) ->
  de_i(Rest, N+7, X bsl N + Acc, MaxNumBits);
de_i(<<0:1, X:7, Rest/binary>>, N, Acc, MaxNumBits) ->
  Mask = (1 bsl MaxNumBits) - 1,
  {(X bsl N + Acc) band Mask, Rest}.

-spec encode_integer(integer()) -> binary().
encode_integer(N) -> en_i(N).

en_i(N) when N =< 127 -> <<N>>;
en_i(N) when N >= 128 -> <<1:1, (N band 127):7, (en_i(N bsr 7))/binary>>.


decode_zigzag(N) when N band 1 =:= 0 -> N bsr 1;        %% N is even
decode_zigzag(N) when N band 1 =:= 1 -> -((N+1) bsr 1). %% N is odd

encode_zigzag(N) when N >= 0 -> N * 2;
encode_zigzag(N) when N <  0 -> N * -2 - 1.




%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
test() ->
  encode_zigzag_test(),
  decode_zigzag_test(),
  endcode_decode_test(),
  ok.

endcode_decode_test() ->
  SignedList = [
    -9223372036854775808,  -2147483648, -32768, -128, -256, -1,
    0, 1, 100, 127, 128, 255, 256,
    16#4000-1, 16#4000, 16#200000 - 1, 16#200000, 16#10000000 - 1,
    16#10000000, 2147483647, 9223372036854775807],

  UnsignedList = [0, 1, 100, 127, 128, 255, 256, 16#4000-1, 16#4000, 16#200000 - 1, 16#200000, 16#10000000 - 1, 16#10000000, 16#ffffffff,16#FFFFFFFFFFFFFFFF],

  lists:foreach(fun(X) -> ed_proc(X) end, SignedList),
  lists:foreach(fun(X) -> ed_proc(X) end, UnsignedList),

  ok.


ed_proc(Original) ->
  {DValue, Bin} = ed_test(Original),
  case Original =:= DValue of
    true ->
      color:info_log("~p == ~p, ~p~n",[Original, DValue, Bin]);
    _Any ->
      color:error_log("~p =/= ~p, ~p~n",[Original, DValue, Bin])
  end.


%% sint32
ed_test(X) when X >= ?INT32_MIN , X =< ?INT32_MAX->
  Bin = encode_integer(encode_zigzag(X)),
  {NV, _T} = decode_integer(Bin, 32),
  {decode_zigzag(NV), Bin};
%% uint32
ed_test(X) when X >= 0, X =< ?UINT32_MAX->
  Bin = encode_integer(X),
  {_N, _Rest} = decode_integer(Bin, 32),
  {_N, Bin};
%% sint64
ed_test(X) when X >= ?INT64_MIN , X =< ?INT64_MAX->
  Bin = encode_integer(encode_zigzag(X)),
  {NV, _T} = decode_integer(Bin, 64),
  {decode_zigzag(NV), Bin};
%% uint64
ed_test(X) when X >= 0 , X =< ?UINT64_MAX->
  Bin = encode_integer(X),
  {_N, _Rest} = decode_integer(Bin, 64),
  {_N, Bin}.

encode_zigzag_test() ->
  0 = encode_zigzag(0),
  1 = encode_zigzag(-1),
  2 = encode_zigzag(1),
  3 = encode_zigzag(-2),
  4294967294 = encode_zigzag(2147483647),
  4294967295 = encode_zigzag(-2147483648).

decode_zigzag_test() ->
  0  = decode_zigzag(0),
  -1 = decode_zigzag(1),
  1  = decode_zigzag(2),
  -2 = decode_zigzag(3),
  2147483647  = decode_zigzag(4294967294),
  -2147483648 = decode_zigzag(4294967295).



