%%%此文件包含GS需要包含的头文件
-author(zhongyuanwei).

-ifndef(GSInc_hrl).
-define(GSInc_hrl,1).

-include("common.hrl").
-include("config.hrl").

-include("globalSetup.hrl").
-include("cgsInc.hrl").
-include("cgsInc.hrl").
-include("gsDef.hrl").

-include("gameProtect.hrl").
-include("char.hrl").
-include("db.hrl").
-include("player.hrl").
-include("gameMap.hrl").
-include("skill.hrl").
-include("item.hrl").
-include("task.hrl").
-include("trigger.hrl").
-include("monster.hrl").
-include("npc.hrl").
-include("mail.hrl").
-include("buff.hrl").
-include("pet.hrl").
-include("mount.hrl").
-include("variant.hrl").
-include("logdb.hrl").
-include("team.hrl").
-include("equip.hrl").
-include("table.hrl").
-include("guild.hrl").
-include("achieve.hrl").
-include("wake.hrl").
-include("title.hrl").
-include("gamedata.hrl").
-include("csMemCacheRec.hrl").
-include("logRecord.hrl").
-include("sevendays.hrl").
-include("dataDefine.hrl").
-include("collect.hrl").
-include("home.hrl").
-include("modeOpen.hrl").
-include("answerDefine.hrl").
-include("floatingManual.hrl").
-include("cfg_fashion_Discount.hrl").
-include("cfg_equipment_randomprop_ex.hrl").
-include("playerPropSyncDefine.hrl").

%% 进程启动后，延时处理后续逻辑的时间 deprecate
-define(Dealy_Deal_Msg_Time, 1000).

%% gsOtpAccepter 模块中，监听gs节点连接，保存的已经连接GS的对应PID列表deprecate
-define(GSNodeListEts, gsNodeList).

%% 限制“条件-触发”模块使用的DailyType
-define(DailyTypeForConditionTrigger, [
	{?DailyType_EXP_MAP_EFFECT_TIME},
	{?DailyType_GOBLIN_FREE},
	{?DailyType_TREASURE_FREE},
	{?DailyType_Action_Piont_Buy_Number},
	{?DailyType_GOBLIN_FREE_LAST_SEC},
	{?DailyType_TREASURE_FREE_LAST_SEC}
]).
-define(CheckDailyType(DT), case lists:keyfind(DT, 1, ?DailyTypeForConditionTrigger) of false -> erlang:error(badarg); _ -> ok end).

%% 当角色进程扣除道具或货币后，向公共进程发送操作请求，公共进程因为其它原因拒绝操作，此时需要将扣除的资源补回
%% 此处定义了补回资源的一些数据结构便于重复使用
-define(BackType_BEGIN,	1).
-define(BackType_Coin,	1).	% 需要返还货币
-define(BackType_Item,	2).	% 需要返还道具
-define(BackType_END,	2).
-type argsBack() :: [
{
	?BackType_BEGIN .. ?BackType_END,	%% 资源类型，避免资源ID冲突
	uint(),								%% 资源ID
	uint(),								%% 资源数量
	uint(),								%% PLogTS，参考playerLog.hrl
	uint()								%% 资源变化原因，参考logdb.hrl
},
...
].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 跨服活动报名组（目前仅能本服内组
-record(recCrossApply, {										%% 报名组，大家一起报名就一起进图哈
	applyID			= 0			:: uint64(),					%% 报名组ID
	activityType	= 0			:: uint16(),					%% 活动类型
	leader			= 0			:: uint64(),					%% 队长角色ID
	applicant		= 0			:: uint64(),					%% 报名者角色ID
	members			= []	, 	%% 成员角色跨服信息
	paramEx			= undefined	:: term(),						%% 各活动特殊处理参数
	time			= 0			:: uint32()						%% 报名时间
}).
-record(recCrossApplyHelper, {	%% 用于快速查找角色对应组ID防止同一时间多处报名，也可用于快速统计活动报名角色数量
	roleID			= 0	:: uint64(),	%% 角色ID
	activityType	= 0	:: uint16(),	%% 活动类型
	applyID			= 0	:: uint64()		%% 组ID
}).
-define(EtsCrossApply, recCrossApply).
-define(EtsCrossApplyHelper, recCrossApplyHelper).

%%%-------------------------------------------------------------------
%% 自动匹配模式定义
-define(RaceAutoMatch_BEGIN,    0).
-define(RaceAutoMatch_None,     0). %% 不进行自动匹配
-define(RaceAutoMatch_Auto,     1). %% 可以自动匹配
-define(RaceAutoMatch_Master,   2). %% 主人进行自动匹配时不当乘客
-define(RaceAutoMatch_END,      2).
-type raceAutoMatch() :: ?RaceAutoMatch_BEGIN .. ?RaceAutoMatch_END.

%%%-------------------------------------------------------------------
%% 骑宠竞速中心服、普通服/跨服，共用结构
-record(recRaceRole, {
	id          = 0     :: uint64(),    %% 角色ID
	name        = []    :: string(),    %% 角色ID
	level       = 0     :: uint16(),    %% 等级
	career      = 0     :: uint32(),    %% 职业
	race        = 0     :: uint8(),     %% 种族
	sex         = 0     :: uint8(),     %% 性别
	head        = 0     :: uint32(),    %% 系统头像
	frameID     = 0     :: uint16(),    %% 头像框
	face        = []    :: string(),    %% 自定义头像
	serverID    = 0     :: uint(),      %% 服务ID 用于跨服交互
	pid         = 0     :: pid() | 0,   %% 进程ID 用于跨服交互、角色间交互
	netPid      = 0     :: pid() | 0    %% 网络进程ID 用于简化消息流程
}).
-record(recRaceApply, {                                     %% 报名组
	applyID     = 0     :: uint64(),                        %% 组ID（使用组长ID）
	time        = 0     :: uint32(),                        %% 用于排序的时间戳
	master      = 0     :: #recRaceRole{} | 0,              %% 组长信息
	passenger   = 0     :: #recRaceRole{} | 0,              %% 乘客信息
	petID       = 0     :: uint16(),                        %% 骑宠ID
	petSpeed    = 0.0   :: float(),                         %% 骑宠基本速度（用于优化匹配）
	isDouble    = false :: boolean(),                       %% 是否为双人骑宠
	autoMatch   = ?RaceAutoMatch_BEGIN :: raceAutoMatch()   %% 是否自动匹配
}).
-define(EtsRaceApply,       recRaceApply).          %% 报名ETS
-define(EtsRaceApplyHelper, recRaceApplyHelper).    %% 报名辅助ETS

%%%-------------------------------------------------------------------
%% 骑宠竞速子玩法模式
-define(RaceSubType_BEGIN,			0).
-define(RaceSubType_Normal,			0).	%% 普通模式
-define(RaceSubType_ItemDouble,		1).	%% 双倍道具
-define(RaceSubType_ItemEx,			2).	%% 强化道具
-define(RaceSubType_SpeedUp,		3).	%% 加速模式
-define(RaceSubType_Chaotic,		4).	%% 混乱模式
-define(RaceSubType_END,			4).
-type raceSubType() :: ?RaceSubType_BEGIN .. ?RaceSubType_END.

%%%-------------------------------------------------------------------
%% 骑宠竞速规则
-record(recRaceRule, {
	timeBegin   = 0     :: uint32(),        %% 开始时间
	timeEnd     = 0     :: uint32(),        %% 结束时间
	minApply    = 0     :: uint(),          %% （每个赛场）最少报名组
	maxApply    = 0     :: uint(),          %% （每个赛场）最多报名组
	mods        = []    :: raceSubType(),   %% 可用子模式集，头部为当前子模式
	serverID    = 0     :: uint()           %% 生成该信息的服务ID，用于调试
}).
-type raceRule() :: #recRaceRule{} | undefined.

%%%-------------------------------------------------------------------
%% 可复用检查结果定义
-type errorContent() :: {uint(), list()}.       %% ErrorCode及其所需参数
-type checkResult() :: true | errorContent().   %% true表示检查通过

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 交易行

%% 节点间发送的最大数组
-define(NODE_Max_Send, 1000).

%% 金币交易行
-define(MNESIA_Trade_Gold, mnesia_trade_gold).

%% 钻石交易行
-define(MNESIA_Trade_Diamond, mnesia_trade_diamond).

%% 指定交易行
-define(MNESIA_Trade_Private, mnesia_trade_private).


%% 金币交易表
-record(?MNESIA_Trade_Gold,
{
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	roleID          = 0, % 出售者角色ID
	sellType        = 0, % 出售类型,1金币交易,2钻石交易,3指定交易
	putTime         = 0, % 上架时间
	downTime        = 0, % 下架时间
	silver          = 0, % 银币(金币)
	gold            = 0, % 金币(钻石)
	destRoleID      = 0, % 指定卖给谁
	sellState       = 0, % 出售状态,0待售,1已锁定,2已出售,3已完成交易,4已下架
	relateRoleID    = 0, % 改变当前交易状态的人
	itemID          = 0, % 道具编号ID
	quality         = 0, % 道具品质
	pileNumber      = 0, % 叠加数量
	itemClass       = 0, % 道具分类，1为装备道具equip，2为普通道具item
	itemType        = 0, % 道具主类型
	itemSubType     = 0, % 道具子类型
	itemLevel       = 0, % 道具等级
	itemProfession  = 0  % 道具职业
}).


%% 钻石交易表
-record(?MNESIA_Trade_Diamond,
{
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	roleID          = 0, % 出售者角色ID
	sellType        = 0, % 出售类型,1金币交易,2钻石交易,3指定交易
	putTime         = 0, % 上架时间
	downTime        = 0, % 下架时间
	silver          = 0, % 银币(金币)
	gold            = 0, % 金币(钻石)
	destRoleID      = 0, % 指定卖给谁
	sellState       = 0, % 出售状态,0待售,1已锁定,2已出售,3已完成交易,4已下架
	relateRoleID    = 0, % 改变当前交易状态的人
	itemID          = 0, % 道具编号ID
	quality         = 0, % 道具品质
	pileNumber      = 0, % 叠加数量
	itemClass       = 0, % 道具分类，1为装备道具equip，2为普通道具item
	itemType        = 0, % 道具主类型
	itemSubType     = 0, % 道具子类型
	itemLevel       = 0, % 道具等级
	itemProfession  = 0  % 道具职业
}).


%% 指定交易表
-record(?MNESIA_Trade_Private,
{
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	roleID          = 0, % 出售者角色ID
	sellType        = 0, % 出售类型,1金币交易,2钻石交易,3指定交易
	putTime         = 0, % 上架时间
	downTime        = 0, % 下架时间
	silver          = 0, % 银币(金币)
	gold            = 0, % 金币(钻石)
	destRoleID      = 0, % 指定卖给谁
	sellState       = 0, % 出售状态,0待售,1已锁定,2已出售,3已完成交易,4已下架
	relateRoleID    = 0, % 改变当前交易状态的人
	itemID          = 0, % 道具编号ID
	quality         = 0, % 道具品质
	pileNumber      = 0, % 叠加数量
	itemClass       = 0, % 道具分类，1为装备道具equip，2为普通道具item
	itemType        = 0, % 道具主类型
	itemSubType     = 0, % 道具子类型
	itemLevel       = 0, % 道具等级
	itemProfession  = 0  % 道具职业
}).

-endif.
