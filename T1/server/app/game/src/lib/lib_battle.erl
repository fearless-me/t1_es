%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2018 17:32
%%%-------------------------------------------------------------------
-module(lib_battle).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([player_vs_player/3]).
-export([player_vs_mon/3]).
-export([mon_vs_player/3]).


player_vs_player(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w",[Aer, Der]),
    ok.

player_vs_mon(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w",[Aer, Der]),
    ok.

mon_vs_player(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w",[Aer, Der]),
    ok.


