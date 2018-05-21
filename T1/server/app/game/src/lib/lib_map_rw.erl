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
-include("obj.hrl").

%% API
-export([player_update/2]).
-export([add_obj_to_ets/1]).

player_update(Code, Elements)->
    ets:update_element(
        lib_map:get_player_ets(),
        Code, Elements),
    ok.


%%%-------------------------------------------------------------------
add_obj_to_ets(#r_obj{type = ?OBJ_MON} = Obj) ->
    ets:insert(lib_map:get_monster_ets(), Obj);
add_obj_to_ets(#r_obj{type = ?OBJ_USR} = Obj) ->
    ets:insert(lib_map:get_player_ets(), Obj);
add_obj_to_ets(_) ->
    ok.
