%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% Auto generated, do not edit it
%%% @end
%%% Created : 12. 一月 2018 11:53
%%%-------------------------------------------------------------------
-module(pack_data).
-author("tiancheng").

-include("player.hrl").
-include("pack.hrl").

%% API
-export([
	write_player/1,
	write_r_array_1/1,
	write_r_array_2/1
]).

-export([
	read_player/1,
	read_r_array_1/1,
	read_r_array_2/1
]).

read_player(Bin) ->
	{Data_t_bool, Bin1} = pack_byte:read_bool(Bin),
	{Data_t_byte, Bin2} = pack_byte:read_byte(Bin1),
	{Data_t_short, Bin3} = pack_byte:read_short(Bin2),
	{Data_t_int, Bin4} = pack_byte:read_int(Bin3),
	{Data_t_bigint, Bin5} = pack_byte:read_bigint(Bin4),
	{Data_t_float, Bin6} = pack_byte:read_float(Bin5),
	{Data_t_double, Bin7} = pack_byte:read_double(Bin6),
	{Data_t_string, Bin8} = pack_byte:read_string(Bin7),
	{Data_t_any1, Bin9} = pack_byte:read_any(Bin8),
	{Data_t_any2, Bin10} = pack_byte:read_any(Bin9),
	{Data_t_array, Bin11} = pack_byte:read_array(Bin10, fun(X) -> read_r_array_2(X) end),
	{
		#player{
			t_bool = Data_t_bool,
			t_byte = Data_t_byte,
			t_short = Data_t_short,
			t_int = Data_t_int,
			t_bigint = Data_t_bigint,
			t_float = Data_t_float,
			t_double = Data_t_double,
			t_string = Data_t_string,
			t_any1 = Data_t_any1,
			t_any2 = Data_t_any2,
			t_array = Data_t_array
		},
		Bin11
	}.

read_r_array_1(Bin) ->
	{Data_t_r_int, Bin1} = pack_byte:read_int(Bin),
	{
		#r_array_1{
			t_r_int = Data_t_r_int
		},
		Bin1
	}.

read_r_array_2(Bin) ->
	{Data_t_r_int, Bin1} = pack_byte:read_int(Bin),
	{Data_t_r_array, Bin2} = pack_byte:read_array(Bin1, fun(X) -> read_r_array_1(X) end),
	{
		#r_array_2{
			t_r_int = Data_t_r_int,
			t_r_array = Data_t_r_array
		},
		Bin2
	}.

write_player(#player{} = P_player) ->
	Bin_t_bool = pack_byte:write_bool(P_player#player.t_bool),
	Bin_t_byte = pack_byte:write_byte(P_player#player.t_byte),
	Bin_t_short = pack_byte:write_short(P_player#player.t_short),
	Bin_t_int = pack_byte:write_int(P_player#player.t_int),
	Bin_t_bigint = pack_byte:write_bigint(P_player#player.t_bigint),
	Bin_t_float = pack_byte:write_float(P_player#player.t_float),
	Bin_t_double = pack_byte:write_double(P_player#player.t_double),
	Bin_t_string = pack_byte:write_string(P_player#player.t_string),
	Bin_t_any1 = pack_byte:write_any(P_player#player.t_any1),
	Bin_t_any2 = pack_byte:write_any(P_player#player.t_any2),
	Bin_t_array = pack_byte:write_array(P_player#player.t_array, fun(X) -> write_r_array_2(X) end),
	<<
		Bin_t_bool/binary,
		Bin_t_byte/binary,
		Bin_t_short/binary,
		Bin_t_int/binary,
		Bin_t_bigint/binary,
		Bin_t_float/binary,
		Bin_t_double/binary,
		Bin_t_string/binary,
		Bin_t_any1/binary,
		Bin_t_any2/binary,
		Bin_t_array/binary
	>>.

write_r_array_1(#r_array_1{} = P_r_array_1) ->
	Bin_t_r_int = pack_byte:write_int(P_r_array_1#r_array_1.t_r_int),
	<<
		Bin_t_r_int/binary
	>>.

write_r_array_2(#r_array_2{} = P_r_array_2) ->
	Bin_t_r_int = pack_byte:write_int(P_r_array_2#r_array_2.t_r_int),
	Bin_t_r_array = pack_byte:write_array(P_r_array_2#r_array_2.t_r_array, fun(X) -> write_r_array_1(X) end),
	<<
		Bin_t_r_int/binary,
		Bin_t_r_array/binary
	>>.