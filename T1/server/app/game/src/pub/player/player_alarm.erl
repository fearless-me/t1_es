%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 六月 2018 15:34
%%%-------------------------------------------------------------------
-module(player_alarm).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([online/0, save/0]).

%%
online() ->
    ?DEBUG("load player ~p alarm data from ets",
        [player_rw:get_uid()]),
    ok.
%%
save() ->
    ?DEBUG("save player ~p alarm data to ets",
        [player_rw:get_uid()]),
    ok.