%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:34
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(OBJ_HRL).
-define(OBJ_HRL, true).


-define(OBJ_ERR, 0).
-define(OBJ_MIN, 1).
-define(OBJ_MON, 1).
-define(OBJ_NPC, 2).
-define(OBJ_PET, 3).
-define(OBJ_USR, 4).
-define(OBJ_MAX, 4).

-type obj_type() :: ?OBJ_MIN .. ?OBJ_MAX.

-record(obj, {
    code = 0,
    id = 0,
    type = ?OBJ_ERR :: obj_type(),
    map_id = 0,
    line_id = 0,
    pid = 0,
    map_pid = undefined,
    pos = undefined :: vector3() ,
    com = undefined 
}).

-record(obj_monster, {
    mid,
    attr= [],
    buff_list = [],
    status
}).

-record(obj_npc, {
    nid = 0,
    name = "",
    scene = 0,
    icon = 0,
    npc_type = 0
}).


-endif.