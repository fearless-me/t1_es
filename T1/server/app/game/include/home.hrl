%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%	家园相关定义
%%% @end
%%% Created : 17. 八月 2017 20:01
%%%-------------------------------------------------------------------
-author(tiancheng).
-ifndef(HHH_Home_hrl_______).
-define(HHH_Home_hrl_______, 1).

-include("cfg_home_plants.hrl").
-include("playerLog.hrl").
-include("cfg_home_furniture.hrl").
-include("cfg_home_sleep.hrl").

%% 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
-define(HomeID_NONE, 16).	%% 这是空位
-define(HomeID_DBID, 10).
-define(HomeID_AREA, 10).
-define(HomeID_ID1, 12).
-define(HomeID_ID2, 16).

%%%%%%%%%%%%%%%%%%%%%%%%%
%%	地址格式 A区 B路 C段 D号
%%	A=游戏中的地图，为玩家可选，区ID对应
%%	B=服务器名（如果是S27这种，则显示数字）
%%	C=服务器按序分配，区间为1~99
%%	D=服务器按序分配，区间为1~9999
-define(HomeID1Max, 99).
-define(HomeID2Max, 9999).
-define(FurniTureLevelMax, 3).

-define(Home_AreaID_Min, 1).
-define(Home_House, 1).			%% 房子
-define(Home_Courtyard, 2).		%% 庭院
-define(Home_BreedArea , 3).	%% 饲养区
-define(Home_Plantation_A, 4).	%% 种植区A
-define(Home_HotSpring, 5).		%% 温泉
-define(Home_Bonfire, 6).		%% 篝火区
-define(Home_WishingWell, 7).	%% 许愿池
-define(Home_Plantation_B, 8).	%% 种植区B
-define(Home_Plantation_C, 9).	%% 种植区C
-define(Home_AreaID_Max, 9).

%%家具类型
-define(FurniTure_Normal,1).
-define(FurniTure_Interaction,2).	%% 交互
-define(FurniTure_Breed,3).			%% 饲养球
-define(FurniTure_Plant,4).			%% 盆栽
-define(FurniTure_Storage,5).		%% 仓库

%% 家园主ETS
-define(HomeEts, rec_home).
%% 家园区域ETS
-define(HomeAreaEts, rec_home_area).
%% 家园地图ETS
-define(HomeMapEts, rec_home_map).
%% 家园拜访记录ETS
-define(HomeVisitEts, rec_home_visit).

%% 家园玩家拥有的家具信息ETS
-define(HomeFurnitrueEts, rec_home_furnitrue).

%% 家园地图表
-record(rec_home_map, {
	homeID = 0,	%% {HomeID, Flag}
	flag = 0,	%% 房屋还是庭院
	mapID = 0,
	mapPID = undefined,
	createTime = 0	%% 创建时间
}).

%% 家园拜访记录
-record(rec_home_visit, {
	homeID = 0,
	opType = 0,
	opParam1 = 0,
	opParam2 = 0,
	opParam3 = 0,
	visitID = 0,	%% 访客ID
	areaID = 0,		%% 区域ID
	timestamp = 0	%% 时间戳
}).

%% 角色身份
-define(HomeRole_BEGIN,		1).
-define(HomeRole_Master,	1).	%% 家园主人
-define(HomeRole_Partner,	2).	%% 同居者
-define(HomeRole_Guest,		3).	%% 未明身份者
-define(HomeRole_END,		3).

-define(HomeRelationType_Self, 0).			%% 拜访身份，自己
-define(HomeRelationType_Friend, 1).		%% 拜访身份，好友
-define(HomeRelationType_PartnerMan, 2).	%% 拜访身份，伴侣男
-define(HomeRelationType_PartnerWoman, 3).	%% 拜访身份，伴侣女
-define(HomeRelationType_Stranger, 4).		%% 拜访身份，陌生人
-define(HomeRelationType_Neighbor, 5).		%% 拜访身份，邻居

-define(HomeOpType_Visit, 1).	%% 操作记录：拜访
-define(HomeOpType_Harvest, 2).	%% 操作记录：收菜
-define(HomeOpType_cooked, 3).	%% 操作记录：菜熟了
-define(HomeOpType_pests, 4).	%% 操作记录：菜长虫了
-define(HomeOpType_unhealthy, 5).	%% 操作记录：健康低于20
-define(HomeOpType_PetExpFull, 6).	%% 操作记录：宠物经验休息满了
-define(HomeOpType_Pethungry, 7).	%% 操作记录：宠物可以喂养了
-define(HomeOpType_HomeCanUpLevel, 8).	%% 操作记录：家园可以升级了
-define(HomeOpType_watering, 9).	%% 操作记录：浇水
-define(HomeOpType_fertilization, 10).	%% 操作记录：施肥
-define(HomeOpType_removeinsect, 11).	%% 操作记录：除虫

-define(FurniTure_scheme_1, 1).	%% 方案1
-define(FurniTure_scheme_2, 2).	%% 方案2
-define(FurniTure_scheme_3, 3).	%% 方案3
-define(FurniTure_scheme_4, 4).	%% 方案4
-define(FurniTure_scheme_5, 5).	%% 方案5

%%%-------------------------------------------------------------------
% 种植区

%% 针对作物的操作
-define(HomePlant_BEGIN,		1).
-define(HomePlant_Plant,		1).	%% 种植
-define(HomePlant_Grubbing,		2).	%% 清除
-define(HomePlant_Harvest,		3).	%% 收获
-define(HomePlant_Watering,		4).	%% 浇水
-define(HomePlant_Compost,		5).	%% 施肥
-define(HomePlant_ClearPestis,	6).	%% 除虫
-define(HomePlant_END,			6).

%% 作物数据内存管理
-define(HomePlantPosMax,		8).	%% 每个种植区最大有8个种植点
-record(recHomePlant, {
	key			= {0, 0, 0} 	:: {uint64(), uint8(), uint64()},	%% {家园ID, 区域ID, 种植在对应家具上的UID}
	id			= 0				:: uint16(),						%% 作物ID，对应plant.id
	time		= 0				:: uint32(),						%% 种植时间，misc_time:localtime_seconds/0
	health		= 0				:: uint8(),							%% 健康值【访问数据时需要刷新】
	watering	= []			:: [uint32(), ...],					%% 浇水时间点记录
	compost		= []			:: [uint32(), ...],					%% 施肥时间点记录
	isRipe      = false			:: boolean(),						%% 成熟标记 LUNA-3975 【家园种植】成熟后植物的健康值不会再发生变化
	pestis		= {false, 0, 0}	:: {boolean(), uint8(), uint32()}	%% {当前是否是虫害状态, 虫害次数, 虫害时间点}【访问数据时需要刷新】
	% 【虫害时间点】解释：
	% 1.如果不在虫害状态，虫害时间点为下次发生虫害的时间点
	% 2.如果在虫害状态，虫害时间点为刷新虫害的时间
	%    每次刷新时，从虫害时间点向当前时间，按小时为刻度进行推进，不足1小时的则不推进
	%    例如2017-08-24 10:07:00发生虫害，现在时间2017-08-24 12:00:00，距离虫害时间点仅有不到2个小时
	%    那么取1小时刷新虫害导致的健康值变化，虫害时间点更新至2017-08-24 11:07:00
}).
-define(EtsHomePlant, recHomePlant).


-record(hasFurnitureInfo, {
	uid         = 0                 :: uint64(),    	            %%家具唯一ID
	time		= 0				    :: uint64() ,					%% 购买时间
	itemID      = 0                 :: uint16()                    %%itemID
}).

-record(recHomeFurniMessage, {
	roleID      = 0,
	name        = ""	            ::string(),    	                %% 留言名字
	time		= 0				    :: uint64(),					%% 留言时间
	content     = ""                ::string()                    %% 留言内容
}).

-record(recHomeLayoutInfo, {
	uid         = 0	                :: uint64(),    	            %%家具唯一ID
	itemID      = 0                 :: uint16(),
	roleID      = 0                 :: uint64(),
	gridID      = 0,
	rotationY           = 0,
	type                = 0         ::uint8()    %%1为普通家具，2可多人交互，3为精灵球可养殖，4位种植，5，家具仓库
}).

%%-record(betweenExampleInfo, {
%%	id          =0 ,	%% 样板间ID，最多五个样板间
%%	time        =0   :: uint64(), %% 保存的时间
%%	name        = "",   %% 样板间名字
%%	recHomeLayoutData  = []      :: [#recHomeLayoutInfo{},...]   %%样板间数据
%%}).


%% 玩家状态
-record(furniTruePlayerInfo, {
	roleID = 0,
	seatID = 0, %%位置
	startSleepTime =0  %%在一起睡觉的初始时间
}).
%% 可交互的家具数据
-record(furniInteractTrueData, {

	itemUID = 0, %% 道具UID
	playerList = [],	%% 乘坐玩家
	roleID = 0	%% 拥有者

}).

%% 家具里面摆放的家具种类数量
-record(furniTrueItemNum, {

	itemID = 0, %%
	num =0

}).
-record(recHomeFurniTrue, {
	homeID = 0,
	greetings         = "",           %%问候语
	furniTrueLevel    =  0,           %%小屋等级
	extendLevel       = 0,            %%扩展等级
	wallID            = 0,             %%墙板ID
	floorID           = 0,             %%地板ID
	isdecorate        = false,         %%是否处于建造中
	sytlish           = 0,             %%当前小屋家具累计的华丽度，不属于正式显示出来的华丽度，这个只用于计算
	betweenExampleData     = []      :: [#recHomeLayoutInfo{},...] ,   %%建造方案家具数据列表
	interactFurnitTrueList   =[]   :: [#furniInteractTrueData{},...],%%可交互的家具列表
	furniTrueItemNumList   =[]:: [#furniTrueItemNum{},...]%%记录每个家具在家中摆放的数量
}).
-define(EtsHomeFurniTrue, recHomeFurniTrue).

%%%-------------------------------------------------------------------
% 饲养区

%%饲养区数据
-record(recHomeFrarming, {
	key         ={0,0}          ::{uint64(), uint16()},      %%  {家园ID,petid}
	time		=0				:: uint32()						%% 放入养殖区时间，misc_time:localtime_seconds/0
}).

%%家园BOSS数据
-record(recLetter,{
	itemUID = 0,				%% bigint(20) unsigned
	itemID = 0,				%% int(10) unsigned
	overTime = 0             %% bigint(20) unsigned
}).


-endif.