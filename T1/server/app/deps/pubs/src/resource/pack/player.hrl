%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% Auto generated, do not edit it
%%% @end
%%% Created : 12. 一月 2018 18:18
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(player_hrl).
-define(player_hrl, 1).

-record(r_array_1, {
	t_r_int = 0
}).

-record(r_array_2, {
	t_r_int = 0,
	t_r_array = [] :: [#r_array_1{},...]
}).

-record(player, {
	n_save_int = 0,
	t_bool = false,
	t_byte = 0,
	t_short = 0,
	t_int = 0,
	t_bigint = 0,
	t_float = 0.0,
	t_double = 0.0,
	t_string = "",
	t_any1 = {},
	t_any2 = undefined,
	t_array = [] :: [#r_array_2{},...]
}).

-endif.