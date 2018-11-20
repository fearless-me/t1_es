%%%地图相关进程的私有定义
-ifndef(mapCfgPrivate_hrl).
-define(mapCfgPrivate_hrl, 1).

-include("../../deps/pubs/include/type.hrl").


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

-ifdef(AREA_SYNC_TYPE).
%% 客户端，按照设置的摄像机高度，可以看见30*30格子的范围
%% 服务器按照(30+6)/3=12的方式来设置
%一个Grid行有多少个Cell
-define(MaxGridCellRowNum, 12).
%一个Grid列有多少个Cell
-define(MaxGridCellColNum, 12).
-else.
%一个Grid行有多少个Cell
-define(MaxGridCellRowNum, 30).
%一个Grid列有多少个Cell
-define(MaxGridCellColNum, 30).
-endif.

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


%游戏地图文件二进制结构
-define(GameMapBinFile, <<
    Tag:4/bytes,                            %"PATH"
    Version:?S32,                            %地图版本信息(uint)
    HeaderSize:?S32,                        %文件头大小
    FileSize:?S32,                            %文件大小
    LevelName:64/bytes,                        %地图名（关卡名）
    TotalColCellNum:?S32,                    %地图总列数(int)
    TotalRowCellNum:?S32,                    %地图总行数(int)
    CellSize:?F32,                            %地图Cell大小(float)
    X:?F32,                                    %X坐标
    Y:?F32,                                    %Y坐标
    Z:?F32,                                    %Z坐标
    HeightRangeLimitLow:?F32,                %高度范围，最低值
    HeightRangeLimitHigh:?F32,                %高度范围，最高值
    BlockInfoOffset:?S32,                    %阻挡信息在文件中的偏移(uint)
    HeightInfoOffset:?S32,                    %高度信息在文件中的偏移(uint)
    BakedDataOffset:?S32,                    %%
    UserDataOffset:?S32,                    %%
    WeightMergeDataOffset:?S32,             %%
    BlockInfoLen:?S32,                        %阻挡信息长度，单位：字节(int)
    HeightInfoLen:?S32,                        %高度信息长度，单位：字节(int)
    BakedDataLen:?S32,                        %
    UserDataLen:?S32,                        %
    MergeWeightDataLength:?S32,
    
    RemainData/bytes
>>
).

%游戏地图信息文件二进制结构
-define(GameMapInfoBinFile, <<
    Tag:4/bytes,                            %"SCEN"
    Version:?U32,                            %地图版本信息(uint)
    HeaderSize:?U32,                        %文件头大小
    FileSize:?U32,                            %文件大小
    
    TriggerNum:?U32,                        %触发器数量
    TriggerOffset:?U32,                        %触发器在文件中的偏移
    TriggerDataLen:?U32,                    %单个触发器数据长度
    
    NpcNum:?U32,                            %NPC数量
    NpcOffset:?U32,                            %NPC在文件中的偏移
    NpcDataLen:?U32,                        %单个NPC数据长度
    
    MonsterNum:?U32,                        %怪物数量
    MonsterOffset:?U32,                        %怪物在文件中的偏移
    MonsterDataLen:?U32,                    %单个怪物数据长度
    
    RelivePtNum:?U32,                        %复活点数量
    RelivePtOffset:?U32,                    %复活点在文件中的偏移
    RelivePtDataLen:?U32,                   %单个复活点数据长度
    
    WayPtNum:?U32,                          %路点数量
    WayPtOffset:?U32,                       %路点在文件中的偏移
    WayPtDataLen:?U32,                      %单个路点数据长度
    
    CollectNum:?U32,                        %采集对象数量
    CollectDataOffset:?U32,                    %采集对象在文件中的偏移
    CollectDataLength:?U32,                    %单个采集对象数据长度
    
    UseItemNum:?U32,                        %使用物品数量
    UseItemDataOffset:?U32,                    %使用物品在文件中的偏移
    UseItemDataLength:?U32,                    %单个使用物品数据长度
    
    _Reserved:60/bytes,                        %保留
    
    RemainData/bytes
>>
).

-define(MapTriggerBaseData, <<
    MapX:?F32,                        %地图坐标X
    _MapY:?F32,                    %地图坐标Y
    MapZ:?F32,                    %地图坐标
    
    _RotX:?F32,                    %旋转坐标X
    _RotY:?F32,                    %旋转坐标Y
    _RotZ:?F32,                    %旋转坐标Z
    _RotW:?F32,                    %旋转坐标W
    
    Name:32/bytes,                    %该触发数据的名字
    ID:?U32,                        %该触发数据的ID
    VolumeType:?S32,                %触发器区域形状，可能是box或者是sphere
    InTriggerName:32/bytes,        %走入触发区域调用的触发器名称
    InTriggerArgFormat:32/bytes,    %走入触发区域调用触发器的参数格式
    OutTriggerName:32/bytes,        %走出触发区域调用的触发器名称
    OutTriggerArgFormat:32/bytes,    %走出触发区域调用触发器的参数格式
    InDelayTime:?F32,                %走入触发区域调用触发器的延迟时间
    OutDelayTime:?F32,                %走出触发区域调用触发器的延迟时间
    TotalTriggerCount:?S32,        %总共可触发多少次
    Left/bytes
>>).

-define(MapTriggerVolumeBox, <<
    CenterX:?F32,             %中心坐标X
    _CenterY:?F32,            %中心坐标Y
    CenterZ:?F32,             %中心坐标Z
    SizeX:?F32,               %大小X
    _SizeY:?F32,              %大小Y
    SizeZ:?F32,               %大小Z
    Remain/bytes
>>).

-define(MapTriggerVolumeSphere, <<
    CenterX:?F32,          %中心坐标X
    _CenterY:?F32,         %中心坐标Y
    CenterZ:?F32,          %中心坐标Z
    R:?F32,                %半径
    Remain/bytes
>>).

-define(MapStubData, <<
    MapX:?F32,                        %地图坐标X
    _MapY:?F32,                        %地图坐标Y
    MapZ:?F32,                        %地图坐标Z
    
    _RotX:?U32,                        %旋转坐标X
    _RotY:?U32,                        %旋转坐标Y
    _RotZ:?U32,                        %旋转坐标Z
    RotW:?F32,                        %旋转坐标W
    Name:32/bytes,                    %该触发数据的名字
    ID:?U32,                            %该触发数据的ID，全局唯一
    Left/bytes
>>).

-define(MapWayPtData, <<
    MapX:?F32,                        %地图坐标X
    MapY:?F32,                        %地图坐标Y
    MapZ:?F32,                        %地图坐标Z
    
    RotX:?F32,                        %旋转坐标X
    RotY:?F32,                        %旋转坐标Y
    RotZ:?F32,                        %旋转坐标Z
    RotW:?F32,                        %旋转坐标W
    Name:32/bytes,                    %名字
    ID:?U32,                            %该触发数据的ID，全局唯一
    NeighborCount:?U32,                %相邻点的数量
    Remain/bytes
>>).

-endif.
