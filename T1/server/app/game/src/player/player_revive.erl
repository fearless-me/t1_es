%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 十二月 2018 10:00
%%%-------------------------------------------------------------------
-module(player_revive).
-author("tiancheng").

-include("battle_prop.hrl").
-include("logger.hrl").

%% API
-export([
	revive/0
]).

revive() ->
	case player_combat:query_prop(?BP_2_HP_CUR) of
		{_, _, Value} when Value =< 0 ->
			player_pub:request_revive(player_rw:get_uid());
		V ->
			?ERROR("player no dead:~p,~p", [player_rw:get_uid(), V])
	end,
	ok.