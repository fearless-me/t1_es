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

%% 格子缩放比例
-define(TILE_SCALE, 1).

%% 视野范围
%% @todo 这个应该让地图自己配置
-define(VIS_DIST, 16).

%% 九宫格方向
-define(ED_Center, 0). %% 中间
-define(ED_Top, 1).    %% 上
-define(ED_Bottom, 2). %% 下
-define(ED_Left, 3).   %% 左
-define(ED_Right, 4).  %% 右
-define(ED_LeftTop, 5).  %% 左上
-define(ED_LeftBottom, 6). %% 左下
-define(ED_RightTop, 7).  %% 右上
-define(ED_RightBottom, 8). %% 右下
-define(ED_End, 9).

%% 地图进程逻辑状态
-define(MAP_NORMAL, 1).     %% 正常状态
-define(MAP_READY_EXIT, 2). %% 准备结束状态
-define(MAP_EXIT, 3).       %% 立即结束状态

%% 地图线路存在时间
%% @todo 要让地图来配置
-define(LINE_LIFETIME, 5 * 60 * 1000).
%% 地图进程退出状态保护时间，让玩家加退出等等
%% 超过这个时间强杀
-define(DEAD_LINE_PROTECT, 2 * 60 * 1000).

%% 地图call调用超时时间
%% 上线、切线、下线
-define(MAP_CALL_TIMEOUT, 15000).
%% 地图初始化超时时间
-define(MAP_INIT_TIMEOUT, 60000).

%% 地图进程心跳（毫秒）
-define(MAP_TICK, 200).


%% 地图管理器
-record(m_map_mgr, {map_id = 0, mgr, line_ets}).
-define(MAP_MGR_ETS, map_mgr_ets__).

%% 视图
-record(m_vis_tile, {index = 0, player = [], monster = [], npc = [], pet = []}).
%% 地图进程状态
-record(m_map_state, {map_id = 0, line_id = 0, respawn = [], hook_mod, status = ?MAP_NORMAL, protect_tick = ?DEAD_LINE_PROTECT div ?MAP_TICK}).
%% 地图线路
-record(m_map_line, {map_id = 0, line_id = 0, pid, limits = 50, in = 0, reserve = 10, dead_line = 0, status = ?MAP_NORMAL}).


%% 地图单位类型
%% {@link m_cache_map_object}
-define(OBJ_ERR, 0).
-define(OBJ_MIN, 1).
-define(OBJ_MON, 1).
-define(OBJ_STATIC, 2).
-define(OBJ_NPC, 3).
-define(OBJ_PET, 4).
-define(OBJ_PLAYER, 5).
-define(OBJ_MAX, 5).


-endif. %% INC_MAP_HRL


