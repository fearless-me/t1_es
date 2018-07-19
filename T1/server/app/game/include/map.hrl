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

-include("type.hrl").

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
-define(ED_End,9).
-type direction() :: ?ED_Center ..  ?ED_End.

-define(MAP_NORMAL,     1).
-define(MAP_READY_EXIT, 2).
-define(MAP_EXIT,       3).

-define(LINE_LIFETIME, 10 * 60 * 1000).
-define(DEAD_LINE_PROTECT, 60 * 1000).

-define(MAP_CALL_TIMEOUT, 15000).
-define(MAP_INIT_TIMEOUT, 60000).

-define(MAP_TICK, 200).


-record(m_map_mgr, {map_id = 0, mgr = undefined}).
-define(MAP_MGR_ETS, map_mgr_ets__).

%%
-record(m_vis_tile,{index = 0, player = [], monster = [], npc = [], pet = []}).
%%
-record(m_map_state,{map_id = 0, line_id = 0, player, monster,
    npc, pet, respawn = [], hook_mod, status = ?MAP_NORMAL, protect_tick=1000}).
%%
-record(m_map_line,{
    map_id = 0, line_id = 0, pid,
    limits = 50, in = 0, reserve = 10,
    dead_line = 0, status = ?MAP_NORMAL
}).


%地图中的复活点
-define(MapObjRelivePt, 0).
%地图中的触发器
-define(MapObjTrigger, 1).
%地图中的怪物
-define(MapObjMonster, 2).
%地图中的NPC
-define(MapObjNpc, 3).
%路点
-define(MapObjWayPt, 4).
%地图中的采集对象
-define(MapObjCollect, 5).
%地图中的使用物品
-define(MapObjUseItem, 6).

-type map_obj_type() :: 0 .. 6.
%游戏地图配置，主要是从地图文件中读取后生成
-record(recGameMapCfg,
{
    mapID = 0 :: uint16(),                    %地图ID(U16)
    maxPlayerNum = 10 :: uint16(),          %设定本地图最大承载人数
    worldPos = {0, 0, 0},                        %地图开始点所在世界坐标
    colCellNum = 0 :: non_neg_integer(),    %地图中的Cell列数量(U16)
    rowCellNum = 0 :: non_neg_integer(),    %地图中的Cell行数量(U16)
    colGridNum = 0 :: non_neg_integer(),    %地图中的Grid列数量(U16)
    rowGridNum = 0 :: non_neg_integer(),    %地图中的Grid行数量(U16)
    cellSize = 0.0,                         %地图中的Cell格式边长
    initX = 0.0,                            %地图初始点
    initY = 0.0,                            %地图初始点
    block = <<>> :: binary(),                %阻挡信息，二进制块，其中0是阻挡，1是非阻挡
    height = <<>> :: binary(),                %高度信息，二进制块
    dropInfo = [] :: list(),                %掉落信息，recMapDrop列表
    mapRelivePt = [],                        %地图复活点信息
    mapTrigger = [],                        %地图触发器信息
    mapMonster = [],                        %地图怪物信息
    mapNpc = [],                            %地图Npc信息
    mapWayPt = [],                            %地图路点信息
    mapCollect = [],                        %地图中的采集信息
    mapUseItem = []                            %地图中的使用物品
}).


%地图中的物件信息
-record(recMapObjData,
{
    id = 0,                                %ID
    name = "",                             %名字
    mapX = 0.0,                            %地图坐标X
    mapY = 0.0,                            %地图坐标Y
    rotW = 0.0 :: float(),                    %%旋转坐标W
    extData,                               %其它数据
    camp = 0,                              %%所属阵营#recSpawnMonster{}默认为0
    groupID = 0 :: uint32()                   %所属分组ID
}).

-record(recMapTriggerData,
{
    mapX,                          %地图坐标X
    mapY,                          %地图坐标Y
    name,                          %该触发数据的名字
    id,                            %该触发数据的ID
    volumeType,                    %触发器区域形状，可能是box或者是sphere
    inTriggerName,                 %走入触发区域调用的触发器名称
    inTriggerArgFormat,            %走入触发区域调用触发器的参数格式
    outTriggerName,                %走出触发区域调用的触发器名称
    outTriggerArgFormat,           %走出触发区域调用触发器的参数格式
    inDelayTime,                   %走入触发区域调用触发器的延迟时间
    outDelayTime,                  %走出触发区域调用触发器的延迟时间
    totalTriggerCount,             %总共可触发多少次
    inArgs,                        %走入触发区域调用触发器时的参数
    outArgs,                       %走出触发区域调用触发器时的参数
    triggerArea                    %触发区域
}).

-record(recMapTriggerVolumeBox,
{
    centerX,                %地图坐标X
    centerY,                %地图坐标Y
    width,                  %宽度
    height                  %高度
}).

-record(recMapTriggerVolumeSphere,
{
    centerX,                %地图坐标X
    centerY,                %地图坐标Y
    r                       %半径
}).

-record(recMapWayPt,
{
    x,
    y,
    name,
    id,
    neighborCount,
    neighborIds
}).

-endif. %% MAP_HRL


