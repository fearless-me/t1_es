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
-include("gameMap.hrl").
-include("uid_object_type.hrl").

-define(MAP_EXIST_TYPE_NORMAL, 1). %% 普通服的地图
-define(MAP_EXIST_TYPE_CROSS, 2).  %% 跨服地图

%% 0：普通地图
%% 1：副本地图
%% 2：分组地图
%% 3：活动地图
-define(MAP_TYPE_INVALID,   -1).
-define(MAP_TYPE_NORMAL,     1).
-define(MAP_TYPE_COPY,       2).
-define(MAP_TYPE_GROUP,      3).
-define(MAP_TYPE_ACTIVITY,   4).

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
-define(MAP_RUNNING, running).  %% 正常状态
-define(MAP_READY_EXIT, dying). %% 准备结束状态
-define(MAP_EXIT, dead).        %% 立即结束状态

%% 地图线路存在时间
%% @todo 要让地图来配置
-define(LINE_LIFETIME, 10 * 60 * 1000).
%% 地图进程退出状态保护时间，让玩家加退出等等
%% 超过这个时间强杀
-define(DEAD_LINE_PROTECT,  20 * 1000).
%% @doc
%% mgr周期回收掉没有人的地图线路
%% 多长时间回收一次，一次最多回收几条线路
-define(MAP_MGR_RECYCLE_TIME, 3*60*1000).
-define(MAP_MGR_RECYCLE_THR, 1).

%% 地图call调用超时时间
%% 上线、切线、下线
-define(MAP_CALL_TIMEOUT, 15000).
%% 地图初始化超时时间
-define(MAP_INIT_TIMEOUT, 60000).
-define(MAP_TICK_CLEAR_PLAYER_LOCAL, 2*60*1000).
-define(MAP_TICK_CLEAR_PLAYER_CROSS, 5*60*1000).

%% 地图进程心跳（毫秒）
-define(MAP_TICK, 50).
%% 每个心跳复活的怪物数量
-define(MAP_TICK_RESPAWN, 50).

%% 地图线路不存在时的处理策略
%% 直接失败，创建新线， 随便选能进一个
-define(MAP_LINE_RECOVER_ERR, 0).
-define(MAP_LINE_RECOVER_NEW, 1).
-define(MAP_LINE_RECOVER_ANY_NEW, 2).


%% 地图管理器
-record(m_map_mgr, {map_id = 0, mgr, line_ets}).
-define(MAP_MGR_ETS, map_mgr_ets__).

%% 视图
-record(m_vis_tile, {index = 0, player = [], monster = [], npc = [], pet = []}).
%% 地图进程状态
-record(m_map_state, {map_id = 0, line_id = 0, obj_ets, mgr_ets, excl_ets, respawn = [], hook_mod, status = ?MAP_RUNNING, protect_tick = ?DEAD_LINE_PROTECT div ?MAP_TICK}).
%% 地图线路
-record(m_map_line, {map_id = 0, line_id = 0, pid, obj_ets, limits = 150, in = 0, reserve = 10, dead_line = 0, status = ?MAP_RUNNING}).

-endif. %% INC_MAP_HRL


