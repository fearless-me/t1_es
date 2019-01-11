%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十月 2017 11:02
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(CGSINC_HRL).
-define(CGSINC_HRL,1).

-include("type.hrl").

%%活动管理模块进程名
-define(PsNameCSActivityMgr, activityMgrOtp).
-define(PsNameCSActivity, activityOtp).
-define(PsSvrMgrName, csSvrMgr___).
-define(PsSvrIDSyncName, svrIDSyncOtp).
-define(PsNameTeam, globalTeamOtp).
-define(PsNameCSAnswer,centerAnswerOtp ).
-define(PsNameCSNvasion,centerNightNvasionOtp ).

-define(PsNameLBS, lbsOtp).
-define(PsNameLBSGSCache, lbsGSCacheOtp).
-define(PsNameCSFriend, csFriendOtp).
-define(PsNameCGSFriend, cgsFriendOtp).
-define(PsNameArunaMapMgr, arunaMapMgrOtp).
-define(PsNameCSRace, csRaceOtp).
-define(PsNameCGSRace, cacRaceOtp).

%%
-define(SERVER_TYPE_GS, 1).
-define(SERVER_TYPE_CGS, 2).

-define(SEVER_STATUS_INIT, 0).
-define(SEVER_STATUS_READY, 1).
-define(SEVER_STATUS_DONE, 2).

%%
-define(SyncPlayerType_New, 1). %% 更新时机 : 创建新角色
-define(SyncPlayerType_InTime, 2). %% 更新时机 : 每秒
-define(SyncPlayerType_Full, 3). %% 更新时机 : 进入地图


%%%-------------------------------------------------------------------
% 骑宠竞速活动阶段
%% -define(ActivityPhase_Close, 0).	% 关闭状态，大于0表示开启状态 已在activityDef.hrl中定义
-define(ActivityPhase_RaceEmpty,        1).	%% 阶段1：逻辑置空，兼容老设计，保留
-define(ActivityPhase_RacePrepare_2, 	2).	%% 阶段2：预告
-define(ActivityPhase_RacePrepare_3, 	3).	%% 阶段3：预告
-define(ActivityPhase_RacePrepare_4, 	4).	%% 阶段4：预告
-define(ActivityPhase_RaceStart, 	    5).	%% 阶段5：比赛
-type raceActivityPhase() :: 0 .. ?ActivityPhase_RaceStart.

%%%-------------------------------------------------------------------
% 大逃杀活动阶段
-define(ActivityPhase_Sleep, 	1).	%% 沉睡阶段，用于修正活动开始的时间，等价于活动阶段1
-define(ActivityPhase_Announcement5Minutes, 	2).	%%距离活动开始5分钟通知公告
-define(ActivityPhase_Announcement3Minutes, 	3).	%%距离活动开始3分钟通知公告
-define(ActivityPhase_Announcement1Minutes, 	4).	%%距离活动开始1分钟通知公告
-define(ActivityPhase_AlivePrepare_5, 	5).	%% 阶段5：报名

%%

-define(PS_NONE, 0).
-define(PS_DONE, 2).

-define(MAX_ROLE, 1800).

-record(recPlayerInfo,{
	roleID              = 0, % 角色ID
	roleName            = "",% 角色名字
	accountID           = 0, % 帐号ID
	status              = ?PS_NONE,
	pid                 = 0,
	netPid              = 0,
	gsServerID          = 0,
	cgsServerID         = 0,
	race				= 0, % 玩家种族
	career              = 0, % 玩家职业
	sex					= 0, % 性别
	head                = 1, % 头像
	frameID             = 0, % 头像框
	level               = 0, % 玩家等级
	gold                = 0, % 金钱
	reputation 			= 0, % 爵位声望
	playerForce         = 0, % 玩家战力
	petForce            = 0, % 宠物战力
	maxForce			= 0, % 历史最高战斗力（包含骑宠）
	maxForceNoPet		= 0, % 历史最高战斗力（不包含骑宠）
	lastUpdateTime      = 0, % 最后一次更新时间
	vipLv				= 0, % 等级
	offlineTime			= 0, % 离线时间
	actionPoint         = 0, % 体力值 在线更新
	%% 身份证相关扩展数据
	face				= [],% 自定义头像

	% 挂载到角色的LBS数据
	% 角色的在线信息中将包含该部分信息，包含普通服/跨服的#rec_OnlinePlayer{}和中心服的#recPlayerInfo{}
	% 1.由各普通服/跨服维护自己的#rec_OnlinePlayer{}，同步相关数据到中心服的#recPlayerInfo{}
	% 2.中心服角色上线、下线、经纬度发生变化时，通知?PsNameLBS刷新经纬盘
	% 3.?PsNameLBS收到消息后并不立即计算，而是存入计算缓存，等待心跳进行计算
	% 4.因为时间差，可能在一次心跳间隔中，同一角色有多次计算请求。以最后一次计算请求为准
	lat	= 999.0	:: float(),		%% 经度[-180.0,180.0] 单位为角度，负表示西经，正表示东经，初始化为无效值表示不需要计算
	lng	= 999.0	:: float()		%% 纬度[-90.0,90.0] 单位为纬度，负表示南纬，正表示北纬，初始化为无效值表示不需要计算
}).


-record(recPlayerLoginCrossGame,{
	roleID = 0,
	accountID = 0,
	pid = 0,
	netPid = 0,
	srcServerID = 0,
	dstServerID = 0,
	time = 0
}).

-record(recPlayerData,{
	accountID = 0,
	roleID = 0,
	role_list = [],
	gmLevel = 0,
	srcServerID = 0,
	dstServerID = 0,
	funCellInfo = undefined,
	platformAccountID = undefined,
	platformID = undefined,
	roleLevel = 0,
	netPid = 0,
	oldRolePid = 0,
	playerState = 0,
	playerData = undefined,
	exData = undefined
}).


-define(CenterServerKey, 1).
-record(recCenterInfo,{
	id = ?CenterServerKey,
	pid = 0,
	status = ?SEVER_STATUS_INIT
}).

-record(recServerInfo,{
	serverID = 0,
	type = 0,
	node = '',
	name = "",
	status = ?SEVER_STATUS_INIT,
	online = 0,
	maxNum = ?MAX_ROLE,
	srcPid = undefined,
	workerPid = undefined
}).

%% cs -> (c)gs
-record(recAllServerSimInfo,{
	serverID = 0,
	type = 0,
	node = '',
	name = ""
}).
-define(AllServerSimInfoEts, allServerSimInfoEts).


%% 真实dbID映射关系
%%   通过UID可以计算出生成该UID的dbID（详见模块uidMgr）
%%   但合服后会导致不是不是该服产生的UID却归属于该服
%%      例如：2服合至1服，原2服产生的UID计算出dbID为2，但实际上已经归属于1服
%% 注1：该表维护方式如下
%%   1.gs连接center成功，获得来自center的反馈消息
%%   2.gs读取本服db上的merge_log，获得来自db的反馈消息
%%   3.计算出本服的真实dbID映射关系（没有改变ETS）
%%   4.通知center计算结果
%%   5.center汇总计算结果，获得最新最全的数据，广播给所有已连接的gs和cross
%%   6.gs和cross收到数据后重置ETS
%% 注2：gs与center断线重连后会重新走一遍上述流程
%% 注3：cross并没有db作为数据源，因此只能被动地同步ETS
%% 注4：该表用于优化
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-record(recRealDBID, {
	dbID,	%% 根据UID计算得出的dbID
	real,	%% 根据合服日志计算出的归属dbID
	name	%% real对应的服务器名
}).
-define(EtsRealDBID,	recRealDBID).

%%%-------------------------------------------------------------------
% 经纬盘（每个格子在极点附近的格子为三角形，其余为梯形，靠近赤道近似矩形）
% 主数据在中心服，通过各普通服/跨服中的#rec_OnlinePlayer{}对中心服#recPlayerInfo{}数据的同步进行计算
% 1.更新自己的数据
%     以经纬度为参数，通过四分法与精确度查询到格子ID（参考lbsCommon.erl）
%     再以格子ID为参数，更新?EtsLBS中的数据
% 2.查询任一点为圆心，任意长度为半径的数据
%     以经纬度和半径为参数，转换为经纬度为单位的矩形区域
%     再以该矩形区域在?EtsLBS中的查询所需格子ID
%     视发起查询者所在服务为目标服，将不属于目标服的角色信息加载到结果集中
%     同步结果集到目标服，存入该服的相同结构作为缓存
%     （下次查询时优先本地查询，若所需格子皆为有效时间时，不向中心服请求新的数据）
%     请求者所在进程（目前为角色进程）对查询结果进行进一步处理，包括：
%         精确计算目标点与各角色之间的距离
%         筛选排除方格查询到的半径范围外的结果
%         根据配置筛选排除冗余结果
% 3.以运营为单位，每个地区的活跃格子是相对固定的，而且是全部格子中的一小部分，可以简单分为两个ETS存储用于优化查询
-record(recGrid, {												%% 真实格子数据
	id				= 0			:: uint(),						%% 格子ID，便于快速查询，从1开始
	latLT			= 0.0		:: float(),						%% 左上角纬度（正、实）
	lngLT			= 0.0		:: float(),						%% 左上角经度（负、实）
	latRB			= 0.0		:: float(),						%% 右下角纬度（负、虚）
	lngRB			= 0.0		:: float(),						%% 右下角经度（正、虚）
	%% 在中心服是全部为ID，同步至其它服是，若是跨服则全部为角色信息，若是普通服则非本服角色为角色信息
	%% 这样做既可以减少消息量，也可以取到更及时有效的角色信息
	listRoleID		= []		:: [uint64()|#recPlayerInfo{}, ...],	%% 从属于该格子的角色ID或角色信息
	lastUpdateTime	= 0			:: uint32()						%% 最后更新时间（在中心服上无意义）
}).
-define(EtsLBS_Main,		etsLBS_Main).		%% 有角色数据的格子在这里，便于快速查询
-define(EtsLBS_Sub,			etsLBS_Sub).		%% 没有角色数据的格子在这里，很少用于查询
-define(MaxLat,				90.0).				%% 纬度最大(北）值（正、实），适用于=<
-define(MinLat,				-90.0001).			%% 纬度最小（南）值（负、虚），适用于> 多加0.0001保证下边界被囊括
-define(MinLng,				-180.0).			%% 经度最小值（负、实），适用于>=
-define(MaxLng,				180.0001).			%% 经度最大值（正、虚），适用于< 多加0.0001保证右边界被囊括
-define(ACCURACY,			0.5).				%% 经纬盘精准度（角度） 慎改

%%%-------------------------------------------------------------------
% 勇者荣耀/女神禁闭室 每关通关人数内存级汇总
-define(EtsWarriorTrial,	etsWarriorTrial).

%%%-------------------------------------------------------------------
%% 团购相关ETS
-define(EtsGroupBuyGoods,	rec_group_buy_goods).		%% 商品列表
-define(EtsGroupBuyReward,	rec_group_buy_reward).	%% 奖励列表
-define(EtsGroupBuyState,	rec_group_buy_state).		%% 功能状态
%% 活动公告图片展示相关ETS
-define(EtsPictureNotice,	rec_picture_notice).
%% 团购活动状态
-define(GroupBuyState_BEGIN,		0).
-define(GroupBuyState_Close,		0).	%% 关闭
-define(GroupBuyState_Open,			1).	%% 开启，可以购买，可以领奖
-define(GroupBuyState_JustReward,	2).	%% 开启，不能购买，仅可领奖
-define(GroupBuyState_END,			2).
%% 同步数据时机
-define(GroupBuySyncDataState_BEGIN,	0).
-define(GroupBuySyncDataState_Online,	0).	%% 上线推送
-define(GroupBuySyncDataState_Change,	1).	%% GM后台配置改变时推送
-define(GroupBuySyncDataState_Ack,		2).	%% 客户端主动请求时反馈
-define(GroupBuySyncDataState_END,		2).

%%%-------------------------------------------------------------------
%% 韩国naver论坛奖励活动相关ETS
-define(EtsKoreanaverConfig,	rec_koreanaver_Config).		%% 活动配置列表
%% 韩国naver论坛奖励活动状态
-define(KoreanaverState_BEGIN,		  0).
-define(KoreanaverState_OutMoment,	0).  %% 客户端过滤消息失败, 不符合领奖条件的情况(1.不在时间范围内 2.已领取过奖励 3.传过来的论坛版块/帖子ID不符合配置要求)
-define(KoreanaverState_InMoment,		1).  %% 在时间范围内, 可以领奖
-define(KoreanaverState_END,		    1).
%% 同步数据时机
-define(KoreanaverSyncDataState_BEGIN, 1).
-define(KoreanaverSyncDataState_Online, 1). %% 1.当玩家上线时
-define(KoreanaverSyncDataState_Change, 2). %% 2.当活动配置该改变时(版本号不变)
-define(KoreanaverSyncDataState_END, 2).

%%%-------------------------------------------------------------------
%% 集字活动相关ETS
-define(EtsCollectionWordsConfig,	rec_collectionwords_config).  %% 只有活动时间的配置
%% 集字活动状态
-define(CollectionWordsState_BEGIN,		  0).
-define(CollectionWordsState_OutMoment,	0).
-define(CollectionWordsState_InMoment,	1).
-define(CollectionWordsState_END,		    1).


%%%-------------------------------------------------------------------
%% 时装新品折扣活动相关ETS
-define(EtsFashionConfig,	rec_fashion_config).  %% 活动配置列表
%% 时装新品折扣活动状态
-define(FashionState_BEGIN,		  0).
-define(FashionState_OutMoment,	0).
-define(FashionState_InMoment,	1).
-define(FashionState_END,		    1).
%% 同步数据时机
-define(FashionSyncDataState_BEGIN, 1).
-define(FashionSyncDataState_Online, 1). %% 1.当玩家上线时
-define(FashionSyncDataState_Change, 2). %% 2.当活动配置发生改变时
-define(FashionSyncDataState_END, 2).

%%%-------------------------------------------------------------------
%% 限时礼包/直购礼包相关
%% 同步数据时机
-define(DeadlineGift_Send_WhenOnline, 1).     %% 当玩家上线后
-define(DeadlineGift_Send_WhenBuySuccess, 2). %% 当玩家购买成功后
-define(DeadlineGift_Send_WhenBuyError, 3).   %% 当玩家购买失败后
-define(DeadlineGift_Send_WhenStart, 4).      %% 当玩家触发礼包条件后
-define(DeadlineGift_Send_WhenOpen, 5).       %% 当玩家点击图标之后

%% 触发分类
-define(DeadlineGift_Update_WhenLevelUP, 1). %% 当升级后触发
-define(DeadlineGift_Update_WhenRefine, 2). %% 当精炼后触发
-define(DeadlineGift_Update_WhenEquipUpStar, 3). %% 当装备升星后触发
-define(DeadlineGift_Update_WhenPetUpStar, 4). %% 当宠物升星后触发

%%%-------------------------------------------------------------------

%% 玩家充值数ETS
-define(EtsPlayerRechargeCount,	etsPlayerRechargeCount).

%%%-------------------------------------------------------------------
%% 玩家头像框相关
-define(PlayerFrameOwnStateAll, 1).         %% 所有已获取的头像框
-define(PlayerFrameOwnStateNew, 2).         %% 新获取的头像框

-define(PlayerFrameUseStateOn,  3).         %% 装配头像
-define(PlayerFrameUseStateOff, 4).         %% 取下头像

%%%-------------------------------------------------------------------

-endif.   %% CGSINC_HRL