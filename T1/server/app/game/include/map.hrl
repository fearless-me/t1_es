%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 10:35
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(MAP_HRL).
-define(MAP_HRL, true).

-define(TILE_SCALE, 50).
-define(VIS_DIST, 96).	%% 可视地砖的大小（64个格子）).
-record(vector3,{
    x,y,z
}).
-type vector3() :: #vector3{}.
-export_type([vector3/0]).

-define(ED_Center, 0).
-define(ED_Top, 1).
-define(ED_Bottom, 2).
-define(ED_Left, 3).
-define(ED_Right, 4).
-define(ED_LeftTop, 5).
-define(ED_LeftBottom, 6).
-define(ED_RightTop, 7).
-define(ED_RightBottom, 8).
-define(ED_End,9).
-type direction() :: ?ED_Center ..  ?ED_End.


-record(visTile,{
    player = [],
    monster = [],
    npc = [],
    pet = []
}).

-record(map_state,{
    map_id = 0,
    player = undefined,
    monster = undefined,
    npc = undefined,
    pet = undefined,
    respawn = [],
    hook_mod = undefined
}).

-record(map_line,{
    map_id = 0,
    line_id = 0,
    pid = undefined,
    limits = 32,
    in = 0,
    dead_line = 0
}).

-define(MAP_LINES, map_line_ets__).


%%
-record(change_map_req,{
    player_id = 0,
    player_pid = undefined,
    map_id = 0,
    pos = undefined,
    map_pid = undefind
}).

-record(change_map_ack,{
    map_id = 0,
    pos = undefined,
    map_pid = undefind,
    error = 0
}).

-endif. %% MAP_HRL