%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 17:44
%%%-------------------------------------------------------------------
-module(test_pack).
-author("tiancheng").

-include("player.hrl").
-include("logger.hrl").

%% API
-export([
	test/1
]).

test(Param) ->
	R1 = [#r_array_1{t_r_int = Param},#r_array_1{t_r_int = Param*2}],
	R2 = [#r_array_2{t_r_int = Param * 2, t_r_array = R1}],
	R = #player{
		t_int = Param * 3,
		t_array = R2,
		t_bool = true,
		t_byte = 8,
		t_short = 1889,
		t_bigint = Param * 10000,
		t_float = erlang:float(Param),
		t_double = erlang:float(Param * 2),
		t_string = "aaafdgffdgdhfdh345retg0dr8g0984305tip3jtoedrgbbb",
		t_any1 = undefined,
		t_any2 = {1,2,3}
	},
	L = pack_data:write_player(R),
	?DEBUG("R:~p", [R]),
	?DEBUG("L:~p", [L]),
	{RR2, Remain} = pack_data:read_player(L),
	?DEBUG("R2:~p,~p", [RR2, Remain]),
	?DEBUG("RR2 =:= R:~p", [R=:=RR2]),
	ok.
