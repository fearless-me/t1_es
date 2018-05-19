%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 五月 2018 17:09
%%%-------------------------------------------------------------------
-module(lib_map_rw).
-author("mawenhong").

%% API
-export([player_update/2]).

player_update(Code, Elements)->
    ets:update_element(
        lib_map:get_player_ets(),
        Code, Elements),
    ok.
