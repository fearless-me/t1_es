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
-export([
    %% encode
    encode_int32/1, encode_uint32/1,
    encode_int64/1, encode_uint64/1,
    encode_integer/1,
    
    %% decode
    decode_int32/1, decode_uint32/1,
    decode_int64/1, decode_uint64/1,
    decode_integer/2,
    
    encode_float/1, decode_float/1,
    
    %% signed integer helper
    encode_zigzag/1, decode_zigzag/1
]).

-export([test/0]).

-define(PRECISION, 100).

%%-------------------------------------------------------------------
-spec decode_uint64(binary()) -> {non_neg_integer(), binary()}.
decode_uint64(Bin) -> decode_integer(Bin, 64).

-spec decode_uint32(binary()) -> {non_neg_integer(), binary()}.
decode_uint32(Bin) -> decode_integer(Bin, 32).

-spec decode_int64(binary()) -> {non_neg_integer(), binary()}.
decode_int64(Bin) ->
    {V, LeftBin} = decode_integer(Bin, 64),
    {decode_zigzag(V), LeftBin}.

-spec decode_int32(binary()) -> {non_neg_integer(), binary()}.
decode_int32(Bin) ->
    {V, LeftBin} = decode_integer(Bin, 32),
    {decode_zigzag(V), LeftBin}.

-spec decode_integer(binary(), pos_integer()) -> {non_neg_integer(), binary()}.
decode_integer(Bin, MaxNumBits) -> de_i(Bin, 0, 0, MaxNumBits).


%%-------------------------------------------------------------------
de_i(<<1:1, X:7, Rest/binary>>, N, Acc, MaxNumBits) when N < (64 - 7) ->
    de_i(Rest, N + 7, X bsl N + Acc, MaxNumBits);
de_i(<<0:1, X:7, Rest/binary>>, N, Acc, MaxNumBits) ->
    Mask = (1 bsl MaxNumBits) - 1,
    {(X bsl N + Acc) band Mask, Rest}.


%%-------------------------------------------------------------------
-spec encode_uint32(integer()) -> binary().
encode_uint32(N) -> encode_integer(N).

-spec encode_uint64(integer()) -> binary().
encode_uint64(N) -> encode_integer(N).

-spec encode_int32(integer()) -> binary().
encode_int32(N) -> encode_integer(encode_zigzag(N)).

-spec encode_int64(integer()) -> binary().
encode_int64(N) -> encode_integer(encode_zigzag(N)).

-spec encode_integer(integer()) -> binary().
encode_integer(N) -> en_i(N).

%%-------------------------------------------------------------------
en_i(N) when N =< 127 -> <<N>>;
en_i(N) when N >= 128 -> <<1:1, (N band 127):7, (en_i(N bsr 7))/binary>>.

%%-------------------------------------------------------------------
decode_zigzag(N) when N band 1 =:= 0 -> N bsr 1;        %% N is even
decode_zigzag(N) when N band 1 =:= 1 -> -((N + 1) bsr 1). %% N is odd

%%-------------------------------------------------------------------
encode_zigzag(N) when N >= 0 -> N * 2;
encode_zigzag(N) when N < 0 -> N * -2 - 1.

%%-------------------------------------------------------------------
encode_float(Float) when is_float(Float) ->
    N = erlang:trunc(Float * ?PRECISION),
    en_fi(N).

en_fi(N) when N > ?INT64_MIN, N < ?INT64_MAX ->
    encode_int64(N).


%%-------------------------------------------------------------------
decode_float(Bin) ->
    {V, LeftBin} = decode_int64(Bin),
    {V / ?PRECISION, LeftBin}.


%%precision_factor(0, N) when N > 1 -> N;
%%precision_factor(Precision, N) -> precision_factor(Precision - 1, 10 * N);
%%precision_factor(_, _) -> 100.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
test() ->
    encode_zigzag_test(),
    decode_zigzag_test(),
    endcode_decode_test(),
    ok.

endcode_decode_test() ->
    Int32List = [-2147483648, -32768, -128, -256, -1,
        0, 1, 100, 127, 128, 255, 256,
        16#4000 - 1, 16#4000, 16#200000 - 1, 16#200000, 16#10000000 - 1,
        16#10000000, 2147483647],
    Int64List = [-9223372036854775808, -2147483648, -32768, -128, -256, -1,
        0, 1, 100, 127, 128, 255, 256,
        16#4000 - 1, 16#4000, 16#200000 - 1, 16#200000, 16#10000000 - 1,
        16#10000000, 2147483647, 9223372036854775807],
    
    Uint32List = [0, 1, 100, 127, 128, 255, 256, 16#4000 - 1, 16#4000, 16#200000 - 1, 16#200000, 16#10000000 - 1, 16#10000000, 16#ffffffff],
    Uint64List = [0, 1, 100, 127, 128, 255, 256, 16#4000 - 1, 16#4000, 16#200000 - 1, 16#200000, 16#10000000 - 1, 16#10000000, 16#ffffffff, 16#FFFFFFFFFFFFFFFF],
    
    FloatList =
        [
            92233720368547751.9,
            92233720368.54775807, 9999999999.99, 1111.11111,
            100.0098, 3.1415927, 1.1, 1.0, 0.0, -1.1, -3.1415927, -1111.11111, -92233720368.54775807, -92233720368547751.08
        ],
    
    color:warn_log("~n****int32 encode****~n"),
    lists:foreach(fun(X) -> ed_proc(X, fun encode_int32/1, fun decode_int32/1, fun check_integer/2) end, Int32List),
    
    color:warn_log("~n****int64 encode****~n"),
    lists:foreach(fun(X) -> ed_proc(X, fun encode_int64/1, fun decode_int64/1, fun check_integer/2) end, Int64List),
    
    color:warn_log("~n****uint32 encode****~n"),
    lists:foreach(fun(X) -> ed_proc(X, fun encode_uint32/1, fun decode_uint32/1, fun check_integer/2) end, Uint32List),
    
    color:warn_log("~n****uint64 encode****~n"),
    lists:foreach(fun(X) -> ed_proc(X, fun encode_uint64/1, fun decode_uint64/1, fun check_integer/2) end, Uint64List),
    
    color:warn_log("~n****float encode****~n"),
    lists:foreach(
        fun(Original) ->
            ed_proc(Original, fun encode_float/1, fun decode_float/1, fun check_float/2)
        end, FloatList),
    ok.


ed_proc(Original, EncodeFunc, DecodeFun, CheckFun) ->
    Bin = EncodeFunc(Original),
    {DValue, _} = DecodeFun(Bin),
    case CheckFun(Original,DValue) of
        true ->
            color:info_log("~p == ~p, ~w~n", [Original, DValue, Bin]);
        _Any ->
            color:error_log("~p =/= ~p, ~w~n", [Original, DValue, Bin])
    end.

check_integer(Original,DecodeValue) ->
    Original =:=  DecodeValue.

check_float(Original, DecodeValue) ->
    EValue = erlang:trunc(Original * ?PRECISION) / ?PRECISION,
    EValue =:= DecodeValue.

encode_zigzag_test() ->
    0 = encode_zigzag(0),
    1 = encode_zigzag(-1),
    2 = encode_zigzag(1),
    3 = encode_zigzag(-2),
    4294967294 = encode_zigzag(2147483647),
    4294967295 = encode_zigzag(-2147483648).

decode_zigzag_test() ->
    +0 = decode_zigzag(0),
    -1 = decode_zigzag(1),
    +1 = decode_zigzag(2),
    -2 = decode_zigzag(3),
    +2147483647 = decode_zigzag(4294967294),
    -2147483648 = decode_zigzag(4294967295).



