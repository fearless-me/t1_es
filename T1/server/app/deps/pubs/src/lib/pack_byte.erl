%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 15:58
%%%-------------------------------------------------------------------
-module(pack_byte).
-author("tiancheng").

%% API
-export([
	write_bool/1, read_bool/1,
	write_byte/1, read_byte/1,
	write_short/1, read_short/1,
	write_int/1, read_int/1,
	write_bigint/1, read_bigint/1,
	write_float/1, read_float/1,
	write_double/1, read_double/1,
	write_string/1, read_string/1,
	write_array/2, read_array/2,
	write_any/1, read_any/1
]).

write_bool(undefined) -> write_byte(0);
write_bool(1) -> write_byte(1);
write_bool(0) -> write_byte(0);
write_bool(true) -> write_byte(1);
write_bool(false) -> write_byte(0).
read_bool(<<>>) -> {false, <<>>};
read_bool(Bin) when erlang:is_binary(Bin) ->
	case read_byte(Bin) of
		{1, Remain} ->
			{true, Remain};
		{0, Remain} ->
			{false, Remain}
	end.

write_byte(undefined) -> write_byte(0);
write_byte(Data) -> <<Data:8/signed-little-integer>>.
read_byte(<<>>) -> {0, <<>>};
read_byte(Bin) when erlang:is_binary(Bin) ->
	<<Data:8/signed-little-integer, Remain/binary>> = Bin,
	{Data, Remain}.

write_short(undefined) -> write_short(0);
write_short(Data) -> <<Data:16/signed-little-integer>>.
read_short(<<>>) -> {0, <<>>};
read_short(Bin) ->
	<<Data:16/signed-little-integer, Remain/binary>> = Bin,
	{Data, Remain}.

write_int(undefined) -> write_int(0);
write_int(Data) -> <<Data:32/signed-little-integer>>.
read_int(<<>>) -> {0, <<>>};
read_int(Bin) ->
	<<Data:32/signed-little-integer, Remain/binary>> = Bin,
	{Data, Remain}.

write_bigint(undefined) -> write_bigint(0);
write_bigint(Data) -> <<Data:64/signed-little-integer>>.
read_bigint(<<>>) -> {0, <<>>};
read_bigint(Bin) ->
	<<Data:64/signed-little-integer, Remain/binary>> = Bin,
	{Data, Remain}.

write_float(undefined) -> write_float(0.0);
write_float(Data) when erlang:is_integer(Data) -> write_float(erlang:float(Data));
write_float(Data) -> <<Data:32/little-float>>.
read_float(<<>>) -> {0.0, <<>>};
read_float(Bin) ->
	<<Data:32/little-float, Remain/binary>> = Bin,
	{Data, Remain}.

write_double(undefined) -> write_double(0.0);
write_double(Data) when erlang:is_integer(Data) -> write_double(erlang:float(Data));
write_double(Data) -> <<Data:64/little-float>>.
read_double(<<>>) -> {0.0, <<>>};
read_double(Bin) ->
	<<Data:64/little-float, Remain/binary>> = Bin,
	{Data, Remain}.

write_string(undefined) -> write_string(0.0);
write_string(Data) ->
	Bin = erlang:list_to_binary(Data),
	Len = erlang:byte_size(Bin),
	<<Len:16/little, Bin/binary>>.
read_string(<<>>) -> {"", <<>>};
read_string(Bin) when erlang:is_binary(Bin) ->
	<<Len:16/little, Right/binary>> = Bin,
	Size = erlang:byte_size(Right),
	case Len =< Size of
		true ->
			case Len of
				0 ->
					{[], Right};
				_ ->
					{Str, Remain} = erlang:split_binary(Right, Len),
					{erlang:binary_to_list(Str), Remain}
			end;
		_ ->
			{[], Bin}
	end.

write_any(undefined) -> write_any(0);
write_any(Data) ->
	Bin = erlang:term_to_binary(Data),
	Len = erlang:byte_size(Bin),
	<<Len:16/little, Bin/binary>>.
read_any(<<>>) -> {0, <<>>};
read_any(Bin) when erlang:is_binary(Bin) ->
	<<Len:16/little, Right/binary>> = Bin,
	Size = erlang:byte_size(Right),
	case Len =< Size of
		true ->
			case Len of
				0 ->
					{[], Right};
				_ ->
					{Str, Remain} = erlang:split_binary(Right, Len),
					{erlang:binary_to_term(Str), Remain}
			end;
		_ ->
			{[], Bin}
	end.

write_array(undefined, Fun) -> write_array([], Fun);
write_array(Data, Fun) when erlang:is_function(Fun, 1)->
	Len = erlang:length(Data),
	Bin = write_array(Data, Fun, []),
	<<Len:16/little, Bin/binary>>.
read_array(<<>>, _Fun) -> {[], <<>>};
read_array(Bin, Fun) when erlang:is_binary(Bin) andalso erlang:is_function(Fun, 1) ->
	<<Len:16/little, Remain/binary>> = Bin,
	read_array(Len, Remain, Fun, []).

read_array(0, Bin, _, AccList) ->
	{lists:reverse(AccList), Bin};
read_array(N, Bin, Fun, AccList) ->
	{Data, RemainBin} = Fun(Bin),
	read_array(N - 1, RemainBin, Fun, [Data | AccList]).

write_array([], _, AccList) ->
	erlang:list_to_binary(lists:reverse(AccList));
write_array([Data | List], Fun, AccList) ->
	Bin = Fun(Data),
	write_array(List, Fun, [Bin | AccList]).