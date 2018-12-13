%已经在运行的地图基础信息
-ifndef(gameMap_hrl).
-define(gameMap_hrl, 1).

-include("type.hrl").



%% 地图区域对象信息
-record(recMapArea, {
    areaID = 0,         %% 区域ID
    codeList = []       %% 对象Code列表
}).

-record(recMapRevive,
{
    id = 0 :: uint16(),                    %%玩家的RoleID
    reviveCount = 0 :: uint16()                 %%玩家已经复活的次数
}).

%游戏地图物品掉落
-record(recMapDrop,
{
    itemid,                                    %道具ID
    odd                                        %几率
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
    groupID = 0 :: uint()                   %所属分组ID
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



-endif.
