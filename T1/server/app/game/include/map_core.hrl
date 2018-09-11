%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 10:35
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(GS_MAP_CORE_HRL).
-define(GS_MAP_CORE_HRL, true).

-include("type.hrl").
-include("mapCfgPrivate.hrl").

-define(TILE_SCALE, 1).
-define(VIS_DIST, 16).

-define(ED_Center, 0).
-define(ED_Top, 1).
-define(ED_Bottom, 2).
-define(ED_Left, 3).
-define(ED_Right, 4).
-define(ED_LeftTop, 5).
-define(ED_LeftBottom, 6).
-define(ED_RightTop, 7).
-define(ED_RightBottom, 8).
-define(ED_End, 9).
-type direction() :: ?ED_Center ..  ?ED_End.

-define(MAP_NORMAL, 1).
-define(MAP_READY_EXIT, 2).
-define(MAP_EXIT, 3).

-define(LINE_LIFETIME, 5 * 60 * 1000).
-define(DEAD_LINE_PROTECT, 2 * 60 * 1000).

-define(MAP_CALL_TIMEOUT, 15000).
-define(MAP_INIT_TIMEOUT, 60000).

-define(MAP_TICK, 200).


-record(m_map_mgr, {map_id = 0, mgr, line_ets}).
-define(MAP_MGR_ETS, map_mgr_ets__).

%%
-record(m_vis_tile, {index = 0, player = [], monster = [], npc = [], pet = []}).
%%
-record(m_map_state, {map_id = 0, line_id = 0, respawn = [], hook_mod, status = ?MAP_NORMAL, protect_tick = 1000}).
%%
-record(m_map_line, {map_id = 0, line_id = 0, pid, limits = 50, in = 0, reserve = 10, dead_line = 0, status = ?MAP_NORMAL}).


%%
-define(OBJ_ERR,    0).
-define(OBJ_MIN,    1).
-define(OBJ_MON,    1).
-define(OBJ_STATIC, 2).
-define(OBJ_NPC,    3).
-define(OBJ_PET,    4).
-define(OBJ_USR,    5).
-define(OBJ_MAX,    5).
-type obj_type() :: ?OBJ_MIN .. ?OBJ_MAX.


-endif. %% INC_MAP_HRL


