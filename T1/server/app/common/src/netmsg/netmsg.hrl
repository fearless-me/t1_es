%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-ifndef(netmsg).
-define(netmsg,1).

-define(ProtoVersion,999).

-record(pk_DateMonsterPos,{
	%% UInt64  CODE
	code = 0,
	%% Single 移动X
	x = 0.0,
	%% Single 移动Z
	z = 0.0
}).

%% 
%% //------------x寻找宝箱-----------------------
%% // 角色在任意时间进入地图时收到的初始化消息
-define(GS2U_DateFindTreasure_Welcome_Sync,63205).
-record(pk_GS2U_DateFindTreasure_Welcome_Sync,{
	%% UInt16 游戏前等待时间
	timeForBegin = 0,
	%% UInt16 游戏中进行时间
	timeForEnd = 0,
	%% UInt16 当前游戏积分
	score = 0
}).

%% 
%% // 积累连击产生的正面效果 之 立即增加分值
-define(GS2U_DateLink_BuffAddScore_Sync,2235).
-record(pk_GS2U_DateLink_BuffAddScore_Sync,{
	%% UInt16 立即获得的分值
	score = 0,
	%% UInt16 获得分值后积分总值
	scoreAll = 0
}).

%% 
%% // 积累连击产生的正面效果 之 增加游戏时间
-define(GS2U_DateLink_BuffAddTime_Sync,43534).
-record(pk_GS2U_DateLink_BuffAddTime_Sync,{
	%% UInt16 增加的时间（秒）
	timeAdd = 0,
	%% UInt16 剩余的游戏时间（秒）
	timeRemainder = 0
}).

%% 
%% // 积累连击产生的正面效果 之 增加移动速度等直接附加到角色身上的BUFF
-define(GS2U_DateLink_BuffBuff_Sync,43889).
-record(pk_GS2U_DateLink_BuffBuff_Sync,{
	%% UInt16 这是直接附加到角色身上的buffid
	buffID = 0
}).

%% 
%% // 积累连击产生的正面效果 之 持续时间内连接获得分值多倍
-define(GS2U_DateLink_BuffPower_Sync,8307).
-record(pk_GS2U_DateLink_BuffPower_Sync,{
	%% Byte 持续时间（秒）
	time = 0,
	%% Byte 倍率
	power = 0
}).

%% 
%% // 错误连接产生的负面效果 之 减少移动就那个速度等直接附加到角色身上的BUFF
-define(GS2U_DateLink_DeduffBuff_Sync,54474).
-record(pk_GS2U_DateLink_DeduffBuff_Sync,{
	%% UInt16 这是直接附加到角色身上的buffid
	buffID = 0
}).

%% 
%% // 游戏结束后同步的结算消息
-define(GS2U_DateLink_GameEnd_Sync,26792).
-record(pk_GS2U_DateLink_GameEnd_Sync,{
	%% Byte 0分值达到上限；1时间结束；2玩家主动放弃
	reason = 0,
	%% Byte 该时间（秒）后销毁地图
	time = 0,
	%% UInt16 最终得分
	score = 0,
	%% Byte 玩法ID
	id = 0,
	%% Boolean 是否助战
	isAssist = false
}).

%% 
%% // 发生连接的同步消息
-define(GS2U_DateLink_Link_Sync,13021).
-record(pk_GS2U_DateLink_Link_Sync,{
	%% Byte 目标宝石A的序号
	indexA = 0,
	%% Single 目标宝石A的坐标X
	xA = 0.0,
	%% Single 目标宝石A的坐标Y
	yA = 0.0,
	%% Byte 目标宝石B的序号
	indexB = 0,
	%% Single 目标宝石B的坐标X
	xB = 0.0,
	%% Single 目标宝石B的坐标Y
	yB = 0.0,
	%% Byte 当前连击计数（如果为0表示当前连接错误，大于0则为正确）
	combo = 0,
	%% Byte 最大连击计数
	comboMax = 0,
	%% UInt16 本次连接产生的分值
	score = 0,
	%% UInt16 本次连接后积分总值
	scoreAll = 0,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix = []
}).

%% 
%% // 同步主游戏阶段剩余时间，以修正因各种原因导致的界面倒计时与实际不符的情况
-define(GS2U_DateLink_MainTime_Sync,39789).
-record(pk_GS2U_DateLink_MainTime_Sync,{
	%% UInt16 剩余的游戏时间（秒）
	timeRemainder = 0
}).

%% 
%% // 重置宝石阵的同步消息（会重置玩家坐标到初始点）
%% //     该消息可能在游戏正式开始时创建宝石阵时收到
%% //         也可能在所有宝石被消除后创建新的宝石阵时收到
%% //         也可能在手动重置宝石阵成功时收到
-define(GS2U_DateLink_ResetGem_Sync,38607).
-record(pk_GS2U_DateLink_ResetGem_Sync,{
	%% UInt16 宝石的NpcID列表
	listGem = [],
	%% Byte 手动重置宝石阵剩余次数
	resetCount = 0,
	%% Byte 手动重置宝石阵的剩余时间
	resetCD = 0,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix = []
}).

%% 
%% // 宝石的选中与取消反馈
-define(GS2U_DateLink_Select_Ack,25929).
-record(pk_GS2U_DateLink_Select_Ack,{
	%% UInt64 操作者角色ID
	roleID = 0,
	%% Byte 目标宝石序号，从1开始到36
	index = 0,
	%% Single 目标宝石中心坐标X
	x = 0.0,
	%% Single 目标宝石中心坐标Y
	y = 0.0,
	%% Boolean 选中还是取消
	isSelect = false,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix = []
}).

%% 
%% // 1.夺秒消除玩法特有协议
%% ////////////////////////////////////////////////////////////////////
%% // 角色在任意时间进入地图时收到的初始化消息
-define(GS2U_DateLink_Welcome_Sync,4915).
-record(pk_GS2U_DateLink_Welcome_Sync,{
	%% UInt16 游戏前等待时间
	timeForBegin = 0,
	%% UInt16 游戏中进行时间
	timeForEnd = 0,
	%% Byte 多倍BUFF的持续时间（秒）
	timePower = 0,
	%% UInt16 宝石的NpcID列表
	listGem = [],
	%% UInt16 当前游戏积分
	score = 0,
	%% Byte 当前玩家A选中的宝石序号
	indexA = 0,
	%% Byte 当前玩家B选中的宝石序号
	indexB = 0,
	%% Byte 当前获得积分的倍率
	power = 0,
	%% Byte 手动重置宝石阵剩余次数
	resetCount = 0,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix = [],
	%% Byte 手动重置宝石阵的剩余时间
	resetCD = 0
}).

%% 
%% //------------泳池派对协议-----------------------
%% // 角色在任意时间进入地图时收到的初始化消息
-define(GS2U_DatePoolShooting_Welcome_Sync,17426).
-record(pk_GS2U_DatePoolShooting_Welcome_Sync,{
	%% UInt16 游戏前等待时间
	timeForBegin = 0,
	%% UInt16 游戏中进行时间
	timeForEnd = 0,
	%% UInt16 当前游戏积分
	score = 0
}).

%% 
%% // 角色在任意时间进入地图时收到的初始化消息
-define(GS2U_DatePushBox_GreateNPC_Sync,45541).
-record(pk_GS2U_DatePushBox_GreateNPC_Sync,{
	%% UInt64 箱子 CODE
	code = 0,
	%% Single 箱子移动X
	x = 0.0,
	%% Single 箱子移动Z
	z = 0.0
}).

%% 
%% // 移动箱子是否成功的返回消息
-define(GS2U_DatePushBox_Succeed_Sync,3160).
-record(pk_GS2U_DatePushBox_Succeed_Sync,{
	%% Boolean 是否移动成功
	isSucceed = false,
	%% Boolean箱子是否移动到指定目标 后被删除
	isDelete = false,
	%% UInt64 箱子 CODE
	code = 0,
	%% Single 箱子移动X
	x = 0.0,
	%% Single 箱子移动Z
	z = 0.0,
	%% UInt16 立即获得的分值
	score = 0
}).

%% 
%% // 角色在任意时间进入地图时收到的初始化消息
-define(GS2U_DatePushBox_Welcome_Sync,17240).
-record(pk_GS2U_DatePushBox_Welcome_Sync,{
	%% UInt16 游戏前等待时间
	timeForBegin = 0,
	%% UInt16 游戏中进行时间
	timeForEnd = 0,
	%% UInt16 当前游戏积分
	score = 0,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix = []
}).

%% 
-define(GS2U_Date_FindTreasure_Sync,11997).
-record(pk_GS2U_Date_FindTreasure_Sync,{
	%% UInt16 立即获得的分值
	score = 0
}).

%% 
%% // 播放动作
-define(GS2U_Date_PlayerAnimation_Sync,52140).
-record(pk_GS2U_Date_PlayerAnimation_Sync,{
}).

%% 
-define(GS2U_Date_RefreshSocre_Sync,54446).
-record(pk_GS2U_Date_RefreshSocre_Sync,{
	%% UInt16 立即获得的分值
	score = 0,
	%% Boolean 玩家A是否被击中  0，未被击中>0击中
	hitA = false,
	%% Boolean 玩家A是否被击中  0，未被击中>0击中
	hitB = false
}).

%% 
%% // 重置箱子阵的同步消息（会重置玩家坐标到初始点）
%% //     该消息可能在游戏正式开始时创建宝石阵时收到
%% //         也可能在所有宝石被消除后创建新的宝石阵时收到
%% //         也可能在手动重置宝石阵成功时收到
-define(GS2U_Date_ResetBox_Sync,20161).
-record(pk_GS2U_Date_ResetBox_Sync,{
	%% UInt32重置箱子的次数
	refreshNum = 0
}).

%% 
%% // 刷新monster
-define(GS2U_Date_ResetFindTreasure_Sync,52220).
-record(pk_GS2U_Date_ResetFindTreasure_Sync,{
}).

%% 
-define(GS2U_Date_ResetPoolShooting_Sync,54665).
-record(pk_GS2U_Date_ResetPoolShooting_Sync,{
	%% Byte 刷新水枪的 索引列表
	listPoolShootingPosIndex = []
}).

%% 
%% // Monster瞬移
-define(GS2U_MonsterMoveSync,15746).
-record(pk_GS2U_MonsterMoveSync,{
	%% DateMonsterPos 所有MONSTER坐标
	monsterPosList = []
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% // 不推荐使用 <->
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // _Request 表示客户端向服务端进行请求
%% // _Ack			表示服务端对客户端请求的反馈
%% // _Ask			表示服务端向客户端询问
%% // _Reply		表示客户端对服务端询问的反馈
%% // _Sync		表示即便客户端没有向服务端进行请求，服务端也可能主动发送该消息以同步信息
%% // 0.多玩法公共协议
%% ////////////////////////////////////////////////////////////////////
%% // 进入约会地下城
-define(U2GS_DateEnter_Request,59172).
-record(pk_U2GS_DateEnter_Request,{
	%% Byte 玩法ID：1夺秒消除
	id = 0
}).

%% 
%% // 玩家主动放弃游戏
%% //     放弃成功时直接进入结算阶段
-define(U2GS_DateLink_Giveup_Requset,21873).
-record(pk_U2GS_DateLink_Giveup_Requset,{
}).

%% 
%% // 手动重置宝石阵请求
%% // 使用消息GS2U_DateLink_ResetGem_Sync进行反馈
-define(U2GS_DateLink_ResetGem_Request,12817).
-record(pk_U2GS_DateLink_ResetGem_Request,{
}).

%% 
%% // 宝石的选中与取消请求
-define(U2GS_DateLink_Select_Request,941).
-record(pk_U2GS_DateLink_Select_Request,{
	%% Single 客户端获取的角色坐标X
	x = 0.0,
	%% Single 客户端获取的角色坐标Y
	y = 0.0,
	%% Byte 目标宝石序号，从1开始到36
	index = 0,
	%% Boolean 选中还是取消
	isSelect = false
}).

%% 
%% //------------推箱子协议-----------------------
%% // 与箱子发生碰撞协议
-define(U2GS_DatePushBox_Request,46621).
-record(pk_U2GS_DatePushBox_Request,{
	%% UInt64 箱子 CODE
	code = 0,
	%% Single 箱子移动X
	x = 0.0,
	%% Single 箱子移动Z
	z = 0.0,
	%% Boolean箱子是否移动到指定目标 后被删除
	isDelete = false
}).

%% 
%% //     向服务器发送射击完的消息
-define(U2GS_DateShooting_Over,2028).
-record(pk_U2GS_DateShooting_Over,{
}).

%% 
%% //gs在用GameServerInfo
-define(GS2U_ChangeLineResponse,15641).
-record(pk_GS2U_ChangeLineResponse,{
	%% GameServerInfo线路列表
	gameServers = [],
	%% String验证码
	identity = ""
}).

-record(pk_GameServerInfo,{
	%% Int16
	lineid = 0,
	%% String
	name = "",
	%% String
	ip = "",
	%% Int16
	port = 0,
	%% SByte
	state = 0
}).

%% 
%% //#define GameServer_State_UnCheckPass			0		//正常
%% //#define GameServer_State_CheckPass				1		//火爆
%% //#define GameServer_State_Running					2		//爆满
%% //#define GameServer_State_ForbidLogin			3		//维护
%% //#define GameServer_State_Closed					4		//维护
%% //#define GameServer_State_SpecCanVisable			5	//测试人员可见
-define(LS2U_GameLineServerList,17992).
-record(pk_LS2U_GameLineServerList,{
	%% GameServerInfo
	gameServers = []
}).

%% 
-define(LS2U_LoginQue,25241).
-record(pk_LS2U_LoginQue,{
	%% UInt64自己在队列中的序号
	currentNumber = 0
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% //<-发出去     ;      ->收消息
%% /////////////////////////////////////////////////////////////////////////
%% // LoginServer 2 User
-define(LS2U_LoginResult,4461).
-record(pk_LS2U_LoginResult,{
	%% SByte 0为登录成功，非0为登录失败原因
	result = 0,
	%% UInt64
	accountID = 0,
	%% String
	identity = "",
	%% String不为空，手机必须展示
	msg = ""
}).

%% 
%% // funcell 回复web消息
-define(LS2Web_CryptoAck,1690).
-record(pk_LS2Web_CryptoAck,{
	%% String 加密消息体
	bodyJsonStr = ""
}).

%% 
%% // funcell 回复web消息
-define(LS2Web_NormalAck,1056).
-record(pk_LS2Web_NormalAck,{
	%% String 未加密消息体
	bodyJsonStr = ""
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% // User 2 LoginServer
-define(U2LS_Login_Normal,41532).
-record(pk_U2LS_Login_Normal,{
	%% String 平台帐号（游戏内帐号用平台id来绑定创建）
	platformAccount = "",
	%% String 平台名
	platformName = "",
	%% String 平台昵称，没有就填空串
	platformNickName = "",
	%% Int64
	time = 0,
	%% String
	sign = "",
	%% String 程序生成，每个设备不能重复
	deviceId = "",
	%% String 手机串号
	imei = "",
	%% String 苹果推号
	idfa = "",
	%% String 网卡号
	mac = "",
	%% String 扩展参数串
	extParam = "",
	%% Int32 资源版本
	versionRes = 0,
	%% Int32 执行程序版本
	versionExe = 0,
	%% Int32 游戏版本？？
	versionGame = 0,
	%% Int32 协议版本
	versionPro = 0,
	%% Int32 包版本HashCode
	versionPackageHash = 0
}).

%% 
%% //请求线路列表
-define(U2LS_RequestGSLine,39508).
-record(pk_U2LS_RequestGSLine,{
}).

%% 
%% // funcell web消息
-define(Web2LS_Crypto,1767).
-record(pk_Web2LS_Crypto,{
	%% String 加密消息体
	bodyJsonStr = ""
}).

%% 
%% // funcell web消息
-define(Web2LS_Normal,889).
-record(pk_Web2LS_Normal,{
	%% String 未加密消息体
	bodyJsonStr = ""
}).

-record(pk_AchieveSchedule,{
	%% UInt16成就ID
	achieveID = 0,
	%% Byte成就当前领取的进度阶段编号
	scheduleRewardID = 0,
	%% UInt32成就当前进度数量
	scheduleCompleteNum = 0,
	%% Byte成就当前完成的进度阶段编号
	scheduleCompleteID = 0
}).

-record(pk_BadgeInfo,{
	%% UInt16MapID
	mapID = 0,
	%% UInt32收集物品列表
	itemList = []
}).

-record(pk_DailyActiveInfo,{
	%% Byte日常活动ID
	dailyID = 0,
	%% Byte完成的当前次数
	curTimes = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 成就进度
-define(GS2U_AchieveSchedule,33796).
-record(pk_GS2U_AchieveSchedule,{
	%% UInt16成就ID
	achieveID = 0,
	%% Byte成就当前领取的进度阶段编号
	scheduleRewardID = 0,
	%% UInt32成就当前进度数量
	scheduleCompleteNum = 0,
	%% Byte成就当前完成的进度阶段编号
	scheduleCompleteID = 0
}).

%% 
%% // 成就进度列表
-define(GS2U_AchieveScheduleList,4174).
-record(pk_GS2U_AchieveScheduleList,{
	%% AchieveSchedule
	scheduleList = []
}).

%% 
%% // 新增已获得的称号
-define(GS2U_AddTitle,22187).
-record(pk_GS2U_AddTitle,{
	%% UInt16称号ID
	titleID = 0,
	%% UInt32结束时间（0表示永久， 时间为服务器绝对时间）
	endTime = 0
}).

%% 
-define(GS2U_BadgeInfo,55665).
-record(pk_GS2U_BadgeInfo,{
	%% UInt16MapID
	mapID = 0,
	%% UInt32收集物品列表
	itemID = 0
}).

%% 
%% // 徽章信息列表
-define(GS2U_BadgeInfoList,42763).
-record(pk_GS2U_BadgeInfoList,{
	%% BadgeInfo
	badgeInfoList = []
}).

%% 
%% // 删除已获得的称号
-define(GS2U_DelTitle,64357).
-record(pk_GS2U_DelTitle,{
	%% UInt16称号ID
	titleID = 0
}).

%% 
%% // 初始化日常活动
-define(GS2U_InitDailyActiveInfo,60581).
-record(pk_GS2U_InitDailyActiveInfo,{
	%% DailyActiveInfo初始化日常活动列表
	dailyActiveInfoList = [],
	%% UInt16初始化领取奖励列表
	receivedAwardList = []
}).

%% 
%% // 已拥有称号信息列表
-define(GS2U_OwnTitleList,27692).
-record(pk_GS2U_OwnTitleList,{
	%% TitleInfo
	titleInfoList = []
}).

%% 
%% // 领取奖励结果
-define(GS2U_ReceiveDailyActiveAwardResult,46506).
-record(pk_GS2U_ReceiveDailyActiveAwardResult,{
	%% UInt16领取奖励的活跃度
	dailyActivityValue = 0
}).

%% 
%% // 更新日常活动
-define(GS2U_UpdateDailyActiveInfo,6880).
-record(pk_GS2U_UpdateDailyActiveInfo,{
	%% DailyActiveInfo更新日常活动
	dailyActiveInfo
}).

-record(pk_TitleInfo,{
	%% UInt16称号ID
	titleID = 0,
	%% UInt32结束时间（0表示永久， 时间为服务器绝对时间）
	endTime = 0
}).

%% 
%% // 改变称号装配状态的消息
-define(U2GS_ChangeCustomTitleText,41498).
-record(pk_U2GS_ChangeCustomTitleText,{
	%% UInt16称号ID 唯一类型的称号用不到 唯一类型用type 如婚姻称号 这个就用默认值0 type为婚姻称号的type
	titleID = 0,
	%% UInt16称号类型
	type = 0,
	%% String内容
	text = ""
}).

%% 
%% // 改变称号装配状态的消息
-define(U2GS_ChangeLimiteTitleState,64069).
-record(pk_U2GS_ChangeLimiteTitleState,{
	%% UInt16称号ID
	titleID = 0
}).

%% 
%% // 改变称号装配状态的消息（存放对应槽位装的配称号ID，没有装配存为0）
-define(U2GS_ChangeTitleState,61023).
-record(pk_U2GS_ChangeTitleState,{
	%% UInt16称号槽位1
	titleSlot1 = 0,
	%% UInt16称号槽位2
	titleSlot2 = 0,
	%% UInt16称号槽位3
	titleSlot3 = 0,
	%% UInt16颜色效果槽位
	colorSlot = 0,
	%% UInt16底图效果槽位
	floorSlot = 0
}).

%% 
%% // 领取成就点数
-define(U2GS_ReceiveAchieveValue,53673).
-record(pk_U2GS_ReceiveAchieveValue,{
	%% UInt16成就ID
	achieveID = 0
}).

%% 
%% // 领取奖励
-define(U2GS_ReceiveDailyActiveAward,60891).
-record(pk_U2GS_ReceiveDailyActiveAward,{
	%% UInt16领取奖励的活跃度
	dailyActivityValue = 0
}).

-record(pk_ActivityAnswerRankData,{
	%% String 角色名
	name = "",
	%% UInt32积分
	value = 0
}).

-record(pk_ActivityState,{
	%% UInt16活动配置表的id
	activityID = 0,
	%% Int16所处阶段,这个是策划配置的	
	state = 0
}).

-record(pk_AngelInvestmentData,{
	%% Boolean 今天能否领取
	isCanGet = false,
	%% Byte 可能领次数
	leftNumber = 0,
	%% UInt16 商品ID
	id = 0
}).

-record(pk_ArenaBattle,{
	%% UInt64玩家ID
	id = 0,
	%% Byte玩家阵营
	camp = 0,
	%% String玩家名称
	name = "",
	%% String服务器名称
	servername = "",
	%% Byte击杀数量
	killnum = 0,
	%% UInt64战斗力
	force = 0,
	%% UInt64伤害
	hurt = 0,
	%% UInt32 竞技场战力
	arenaVal = 0
}).

-record(pk_ArenaRole,{
	%% String服务器名字
	servername = "",
	%% String角色名字
	name = "",
	%% UInt64角色ID
	id = 0,
	%% Byte阵营
	camp = 0
}).

-record(pk_ArenaTeamMemberInfo,{
	%% UInt64 玩家id
	id = 0,
	%% UInt64 玩家Code
	code = 0,
	%% String 玩家名字
	name = "",
	%% Boolean 队长标志
	isLeader = false,
	%% Boolean 是否准备
	isPrepare = false,
	%% Byte 玩家等级
	level = 0,
	%% UInt32 玩家职业
	career = 0,
	%% UInt64 玩家战力
	force = 0,
	%% UInt32 竞技场战力
	arenaVal = 0
}).

%% 
%% //准备状态
-define(ArenaTeamMemberPrepare,9837).
-record(pk_ArenaTeamMemberPrepare,{
	%% UInt64
	id = 0,
	%% Boolean
	isPrepare = false
}).

-record(pk_ChargeOrUseRuleInfo,{
	%% Byte活动中的档位id
	ruleID = 0,
	%% UInt32非绑定钻石条件
	diamon = 0,
	%% String奖励物品json
	itemJson = "",
	%% Boolean是否已经领取
	hasTake = false
}).

-record(pk_CrosArenaBattleHighRank,{
	%% UInt32玩家职业
	career = 0,
	%% UInt64玩家roleID
	roleID = 0,
	%% String玩家名称
	name = "",
	%% String玩家线路名称
	servername = "",
	%% UInt32玩家战斗力
	force = 0,
	%% UInt32竞技场积分
	arenaVal = 0,
	%% UInt32胜利次数
	win = 0,
	%% UInt32失败次数
	fail = 0,
	%% UInt64
	time = 0
}).

-record(pk_CrosArenaBattleRank,{
	%% Byte排行榜名次
	rankID = 0,
	%% UInt32玩家职业
	career = 0,
	%% UInt64玩家roleID
	roleID = 0,
	%% String玩家名称
	name = "",
	%% String玩家线路名称
	servername = "",
	%% UInt32玩家战斗力
	force = 0,
	%% UInt32竞技场积分
	arenaVal = 0,
	%% UInt32胜利次数
	win = 0,
	%% UInt32失败次数
	fail = 0
}).

%% 
-define(CrosArenaMatch,47633).
-record(pk_CrosArenaMatch,{
	%% Boolean
	isMatch = false
}).

-record(pk_CrosBattleExploit,{
	%% Byte排行榜名次
	rankID = 0,
	%% UInt32玩家职业
	career = 0,
	%% UInt64玩家roleID
	roleID = 0,
	%% String玩家名称
	name = "",
	%% String玩家线路名称
	servername = "",
	%% UInt32玩家战斗力
	force = 0,
	%% UInt32玩家功勋
	exploit = 0
}).

-record(pk_DarknessPlayerRank,{
	%% UInt32 排名
	rank = 0,
	%% Byte 阵营:1正义联盟，2邪恶部落
	camp = 0,
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% UInt32
	roleLevel = 0,
	%% UInt32 黑暗之地积分
	integral = 0,
	%% Byte 黑暗之地当前位置，0为准备间，1~5对应多少层
	mapPos = 0
}).

-record(pk_DarknessState,{
	%% UInt32 剩余时间，单位秒
	remainTime = 0
}).

-record(pk_DeadlineGift,{
	%% UInt16(已触发)礼包ID
	id = 0,
	%% UInt32首次触发时间(UTC秒)
	startTime = 0,
	%% UInt32持续时间(UTC秒)
	remainTime = 0,
	%% String左侧页签文本
	tabString = "",
	%% UInt16道具1ID
	itemID1 = 0,
	%% UInt16道具2ID
	itemID2 = 0,
	%% UInt16道具3ID
	itemID3 = 0,
	%% UInt16道具1限购数量
	itemNum1 = 0,
	%% UInt16道具2限购数量
	itemNum2 = 0,
	%% UInt16道具3限购数量
	itemNum3 = 0,
	%% UInt16道具1已购数量
	itemBuyNum1 = 0,
	%% UInt16道具2已购数量
	itemBuyNum2 = 0,
	%% UInt16道具3已购数量
	itemBuyNum3 = 0,
	%% String道具1折扣显示
	itemDiscount1 = "",
	%% String道具2折扣显示
	itemDiscount2 = "",
	%% String道具3折扣显示
	itemDiscount3 = "",
	%% UInt16道具1货币类型
	itemCoinType1 = 0,
	%% UInt16道具2货币类型
	itemCoinType2 = 0,
	%% UInt16道具3货币类型
	itemCoinType3 = 0,
	%% UInt16道具1原货币数量
	itemCoinNum1 = 0,
	%% UInt16道具2原货币数量
	itemCoinNum2 = 0,
	%% UInt16道具3原货币数量
	itemCoinNum3 = 0,
	%% UInt16道具1真实货币数量
	itemRealCoinNum1 = 0,
	%% UInt16道具2真实货币数量
	itemRealCoinNum2 = 0,
	%% UInt16道具3真实货币数量
	itemRealCoinNum3 = 0,
	%% String背景图
	image = "",
	%% String道具1名称
	itemName1 = "",
	%% String道具2名称
	itemName2 = "",
	%% String道具3名称
	itemName3 = "",
	%% UInt16道具1数量
	itemCounts1 = 0,
	%% UInt16道具2数量
	itemCounts2 = 0,
	%% UInt16道具3数量
	itemCounts3 = 0,
	%% UInt16礼包1序号
	gift1 = 0,
	%% UInt16礼包2序号
	gift2 = 0,
	%% UInt16礼包3序号
	gift3 = 0
}).

%% 
%% //删除
-define(DeleteArenaTeamMember,61899).
-record(pk_DeleteArenaTeamMember,{
	%% Boolean
	isMyself = false,
	%% UInt64
	id = 0
}).

-record(pk_EscortPlunderMoney,{
	%% String 角色名字，怪物名字
	roleName = "",
	%% Int64 多人劫掠收益，单人怪物伤害收益
	plunderMoney = 0
}).

-record(pk_EscortResultReward,{
	%% Byte 金钱类型
	moneyType = 0,
	%% UInt32 值
	money = 0,
	%% UInt32 彩蛋收益
	perValue = 0
}).

-record(pk_EscortTeam,{
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% UInt16 开启序列
	sequenceNumber = 0,
	%% UInt16
	cur_RobNumber = 0,
	%% UInt16
	max_RobNumber = 0
}).

-record(pk_GBMapLineInfo,{
	%% UInt32 线路ID
	lineID = 0,
	%% UInt16 当前线路人数
	number = 0
}).

%% 
%% // 下一波怪将在多少秒后到来
-define(GS2U_ACCityMonsterSurplusTime,49114).
-record(pk_GS2U_ACCityMonsterSurplusTime,{
	%% Int32 剩余多少秒
	surplusTime = 0
}).

%% 
%% // 告诉客户端当前随机舞蹈列表
-define(GS2U_ActionList,55352).
-record(pk_GS2U_ActionList,{
	%% UInt32 正确ID
	correctID = 0,
	%% UInt32 动作列表
	danceIDs = []
}).

%% 
%% //活动结束
-define(GS2U_ActivityEnd,53764).
-record(pk_GS2U_ActivityEnd,{
}).

%% 
%% //活动表中的活动状态
-define(GS2U_ActivityState,62178).
-record(pk_GS2U_ActivityState,{
	%% UInt16活动配置表的id
	activityID = 0,
	%% UInt32活动地图id
	mapID = 0,
	%% Int16所处阶段
	phase = 0
}).

%% 
%% // 单个活动的状态
-define(GS2U_ActivityStateInfo,39932).
-record(pk_GS2U_ActivityStateInfo,{
	%% ActivityState
	infos
}).

%% 
%% //活动表中的所有活动状态
-define(GS2U_ActivityStateInit,60994).
-record(pk_GS2U_ActivityStateInit,{
	%% ActivityState
	infos = []
}).

%% 
%% //通知客服端XX的邀请
-define(GS2U_AddArenaTeamMemberRequest,38390).
-record(pk_GS2U_AddArenaTeamMemberRequest,{
	%% UInt64邀请者ID
	roleID = 0,
	%% String邀请者名字
	name = ""
}).

%% 
%% //答题题目ID
-define(GS2U_AllAnswerQuestion,63577).
-record(pk_GS2U_AllAnswerQuestion,{
	%% UInt32ID
	questionID = 0,
	%% UInt64开始时间
	startTime = 0,
	%% UInt32当前题目
	currentAnswer = 0
}).

%% 
%% // 天使投资购买
-define(GS2U_AngelInvestmentList,8750).
-record(pk_GS2U_AngelInvestmentList,{
	%% AngelInvestmentData
	lists = []
}).

%% 
%% //第一全对和幸运玩家
-define(GS2U_AnswerFirstAndLuckyPlayer,11460).
-record(pk_GS2U_AnswerFirstAndLuckyPlayer,{
	%% String玩家名字
	playerName = []
}).

%% 
%% //答题活动开始
-define(GS2U_AnswerQuestion,24716).
-record(pk_GS2U_AnswerQuestion,{
	%% UInt64开始时间
	startTime = 0,
	%% Byte答题次数
	answerNum = 0,
	%% Question题目列表
	questionList = []
}).

%% 
%% // 积分排名
-define(GS2U_AnswerRank,37510).
-record(pk_GS2U_AnswerRank,{
	%% ActivityAnswerRankData数据列表
	data = [],
	%% Boolean是否结束活动
	isover = false
}).

%% 
%% // 报名反馈
-define(GS2U_ApplyAnswerResult,34469).
-record(pk_GS2U_ApplyAnswerResult,{
	%% Byte 报名结果1成功，2失败，3已报名
	result = 0,
	%% UInt64剩余开始时间
	endTime = 0,
	%% UInt32房间ID号
	roomID = 0
}).

%% 
%% //战斗结算
-define(GS2U_ArenaBattleList,39837).
-record(pk_GS2U_ArenaBattleList,{
	%% Byte
	res = 0,
	%% ArenaBattle
	bList = []
}).

%% 
%% //角色死亡消息
-define(GS2U_ArenaRoleDead,41305).
-record(pk_GS2U_ArenaRoleDead,{
	%% UInt64
	id = 0
}).

%% 
%% //角色列表
-define(GS2U_ArenaRoleList,2003).
-record(pk_GS2U_ArenaRoleList,{
	%% UInt16竞技时间
	time = 0,
	%% ArenaRole角色列表
	roleList = []
}).

%% 
-define(GS2U_AttackerDefenderQuotaNumberAck,17236).
-record(pk_GS2U_AttackerDefenderQuotaNumberAck,{
	%% UInt16活动配置表的id
	activityID = 0,
	%% UInt32活动地图id
	mapID = 0,
	%% UInt16进攻方可用人数
	acctackerQuotaNum = 0
}).

%% 
%% // 目标打断舞蹈
-define(GS2U_BreakDance,32524).
-record(pk_GS2U_BreakDance,{
	%% UInt64
	roleID = 0
}).

%% 
%% //王者守护宣言修改成功
-define(GS2U_ChangeGuardianDeclaration,17201).
-record(pk_GS2U_ChangeGuardianDeclaration,{
	%% Boolean守护宣言修改结果
	isChange = false
}).

%% 
%% // 集字活动_同步配置数据
%% // 该协议通常在角色上线时推送给客户端
%% // 考虑到可能热更配置，因此在角色心跳中检测版本号变化后，推送给客户端
%% // 注1：推送该消息前可能会有每日计数type:116,id:n的同步消息，该计数器表示奖励兑换次数，默认为0，id对应为collectionWords_RewardCfg.id
%% // 注2：推送该消息前可能会有每日计数type:118,id:n的同步消息，该计数器表示字样获得次数，默认为0，id对应为item.id
-define(GS2U_CollectionWords_Sync,36931).
-record(pk_GS2U_CollectionWords_Sync,{
	%% collectionWords_State
	state,
	%% collectionWords_RewardCfg
	listRewardCfg = []
}).

%% 
-define(GS2U_CrosArenaBattleHighRanks,51053).
-record(pk_GS2U_CrosArenaBattleHighRanks,{
	%% CrosArenaBattleHighRank
	ranks = []
}).

%% 
-define(GS2U_CrosArenaBattleRanks,39892).
-record(pk_GS2U_CrosArenaBattleRanks,{
	%% CrosArenaBattleRank角色列表
	ranks = []
}).

%% 
-define(GS2U_CrosBattleExploits,11911).
-record(pk_GS2U_CrosBattleExploits,{
	%% CrosBattleExploit
	ranks = []
}).

%% 
%% // 当前护送类型
-define(GS2U_CurEscortType,38930).
-record(pk_GS2U_CurEscortType,{
	%% UInt16 1单人护送，2多人护送，3劫掠
	escortType = 0
}).

%% 
%% // 告诉客户端自己的阵营
-define(GS2U_DarknessCamp,59018).
-record(pk_GS2U_DarknessCamp,{
	%% Byte 阵营:1正义联盟，2邪恶部落
	camp = 0,
	%% UInt32 黑暗之地积分
	integral = 0
}).

%% 
%% // 返回黑暗之地初始信息
-define(GS2U_DarknessInfo,42279).
-record(pk_GS2U_DarknessInfo,{
	%% DarknessState
	state,
	%% Byte 购买时间，需要的金钱类型
	buyMoneyType = 0,
	%% Int32 购买时间，需要的金钱数量，-1表示不能再购买，如果为0则表示无消耗
	buyMoney = 0
}).

%% 
%% // 被击杀或者击杀水晶变化情况
-define(GS2U_DarknessKillOrBeKill,51195).
-record(pk_GS2U_DarknessKillOrBeKill,{
	%% String
	targetName = "",
	%% Boolean 自己胜利为true,自己失败为false
	isSuccess = false,
	%% Int32 变化的水晶数量
	changePebble = 0
}).

%% 
%% // 黑暗之地的排队情况
-define(GS2U_DarknessQuenenState,57194).
-record(pk_GS2U_DarknessQuenenState,{
	%% Byte 入口编号(这个值不用管)
	entrance = 0,
	%% Byte 第几层(0为没排队)
	floor = 0
}).

%% 
%% // 返回黑暗之地排行榜(排行榜末尾包含自己)
-define(GS2U_DarknessRank,26625).
-record(pk_GS2U_DarknessRank,{
	%% DarknessPlayerRank 阵营1：正义联盟
	camp1 = [],
	%% DarknessPlayerRank 阵营2：邪恶部落
	camp2 = []
}).

%% 
%% // 时间
-define(GS2U_DarknessState,59020).
-record(pk_GS2U_DarknessState,{
	%% DarknessState
	state
}).

%% 
%% // 推送礼包内容
%% // 消息推送Code
%% // 当玩家上线后           1     只有此时才关注  DeadlineGift 中的  image字段
%% // 当玩家购买成功后        2
%% // 当玩家购买失败后        3     此时 msg字段为空不用管
%% // 当玩家触发礼包条件后     4
%% // 当玩家点击图标之后       5
-define(GS2U_DeadLineGiftList,44602).
-record(pk_GS2U_DeadLineGiftList,{
	%% UInt16直购礼包/限时礼包 消息推送Code
	code = 0,
	%% DeadlineGift直购礼包/限时礼包 玩家相关内容
	msg = []
}).

%% 
%% // 命运主星列表
-define(GS2U_DestinyStar,56056).
-record(pk_GS2U_DestinyStar,{
	%% LotteryItem
	stars = []
}).

%% 
%% // 返回入口列表
-define(GS2U_EnterDarkness,63153).
-record(pk_GS2U_EnterDarkness,{
	%% Byte 入口列表
	entrances = []
}).

%% 
%% // 护送劫掠结果
-define(GS2U_EscortResult,56809).
-record(pk_GS2U_EscortResult,{
	%% UInt16 1单人护送，2多人护送，3劫掠
	escortType = 0,
	%% Byte 结束原因，1马车到达终点，2马车死亡，3时间到
	endReason = 0,
	%% Boolean true成功
	isSuccess = false,
	%% EscortResultReward
	rewards = [],
	%% EscortPlunderMoney
	plunder = []
}).

%% 
%% // 返回入口信息
-define(GS2U_GBList,43821).
-record(pk_GS2U_GBList,{
	%% UInt16
	mapID = 0,
	%% GBMapLineInfo
	lineList = [],
	%% PlayerGBInfo
	info
}).

%% 
-define(GS2U_GetChargeOrUseGiftAck,5311).
-record(pk_GS2U_GetChargeOrUseGiftAck,{
	%% Byte活动类型
	type = 0,
	%% Byte活动中的档位id
	ruleID = 0,
	%% Boolean是否领成功
	success = false
}).

%% 
%% // 哥布林玩法开启状态
-define(GS2U_Goblin_Open_State,3340).
-record(pk_GS2U_Goblin_Open_State,{
	%% Boolean 是否开启
	isOpen = false,
	%% UInt32 开启的地图ID
	mapID = 0
}).

%% 
%% //跨服混沌战场倒计时
-define(GS2U_HDBattleCD,48653).
-record(pk_GS2U_HDBattleCD,{
	%% UInt16
	time = 0
}).

%% 
-define(GS2U_HDBattleExploits,56852).
-record(pk_GS2U_HDBattleExploits,{
	%% Byte1:战功 2:结算
	type = 0,
	%% HDBattleExploit
	exploits = []
}).

%% 
%% // 多少秒后，门将打开
-define(GS2U_HDBattleOpenSurplusTime,35345).
-record(pk_GS2U_HDBattleOpenSurplusTime,{
	%% Int16 剩余多少秒
	surplusTime = 0
}).

%% 
%% //跨服混沌战场
%% //跨服混沌战场阶段
-define(GS2U_HDBattlePhase,18287).
-record(pk_GS2U_HDBattlePhase,{
	%% Byte活动阶段
	phase = 0,
	%% UInt16活动参数
	param1 = 0,
	%% UInt16活动参数
	param2 = 0
}).

%% 
%% // 采集成功一件东西
-define(GS2U_HDGatherSuccess,28188).
-record(pk_GS2U_HDGatherSuccess,{
	%% UInt32
	gatherID = 0
}).

%% 
%% //点亮主面板的icon
-define(GS2U_IconLight,37401).
-record(pk_GS2U_IconLight,{
	%% Byteicon编号(1为充值
	id = 0,
	%% Boolean是否领成功
	light = false
}).

%% 
%% //初始化野外boss信息
-define(GS2U_InitWildBossInfo,29701).
-record(pk_GS2U_InitWildBossInfo,{
	%% WildBossInfo
	infos = []
}).

%% 
%% // 已经报名成功，且分配战场成功，通知玩家可以进入战场
-define(GS2U_JoinHDBattle,55946).
-record(pk_GS2U_JoinHDBattle,{
}).

%% 
%% // 物品获得，
-define(GS2U_KillMonsterReward,3675).
-record(pk_GS2U_KillMonsterReward,{
	%% RewardItem 奖励列表
	rewardItemList = []
}).

%% 
%% // 自己的击杀数量
-define(GS2U_KillPlayerNumber,22196).
-record(pk_GS2U_KillPlayerNumber,{
	%% UInt32 排名
	sortNumber = 0,
	%% UInt32 击杀数
	killNumber = 0,
	%% UInt32 当前连杀数
	lxKillNumber = 0,
	%% UInt32 需要击杀数
	needKill = 0,
	%% UInt32 本次活动剩余秒数
	remainSecond = 0,
	%% UInt32 当前采集次数
	gatherNumber = 0,
	%% UInt32 需要采集次数
	needGatherNumber = 0
}).

%% 
%% // 返回击杀排行榜
-define(GS2U_KillRank,9310).
-record(pk_GS2U_KillRank,{
	%% KillRank
	rank = []
}).

%% 
%% //王者守护  服务器下发下来的守护方信息
-define(GS2U_KingBattleBuffInfo,64360).
-record(pk_GS2U_KingBattleBuffInfo,{
	%% UInt64
	mirrorBuffcfgID = 0,
	%% UInt64
	defenderBuffcfgID = 0,
	%% UInt64
	attackerBuffcfgID = 0
}).

%% 
%% //王者守护  服务器下发下来的守护方信息
-define(GS2U_KingBattleRepairMirror,36559).
-record(pk_GS2U_KingBattleRepairMirror,{
	%% UInt64
	mirrorMaxHp = 0,
	%% UInt64
	mirrorCurrentHp = 0
}).

%% 
%% //王者守护  守护者结算面板
-define(GS2U_KingBattleResult,39124).
-record(pk_GS2U_KingBattleResult,{
	%% Boolean是否守护者
	isKing = false,
	%% Boolean是否新守护者
	isNewKing = false,
	%% UInt64守护成功则为击杀人数，新守护者则是伤害
	killNumOrHurt = 0,
	%% Byte守护好多天
	days = 0,
	%% String守护宣言
	declaration = "",
	%% String名字
	name = "",
	%% UInt64 角色ID
	roleID = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32
	head = 0,
	%% Int32翅膀等级
	wingLevel = 0,
	%% Int32 时装ID列表
	fashionIDs = [],
	%% PlayerKingBattleEquip 装备ID列表
	equipIDList = [],
	%% PlayerKingBattleEquipLevel装备等级列表
	equipLevelList = []
}).

%% 
%% // 奖池金额与抽奖消耗
-define(GS2U_LotteryMoney,34899).
-record(pk_GS2U_LotteryMoney,{
	%% UInt64 金币奖池
	pondGold = 0,
	%% UInt64 钻石奖池
	pondDiamond = 0
}).

%% 
-define(GS2U_LotteryNote,56467).
-record(pk_GS2U_LotteryNote,{
	%% LotteryNote
	notes = []
}).

%% 
%% // 重置时间
-define(GS2U_LotteryResetTime,9419).
-record(pk_GS2U_LotteryResetTime,{
	%% UInt64 免费金币抽取CD剩余秒数
	goldFreeRstTime = 0,
	%% UInt64 免费钻石抽取CD剩余秒数
	diamondFreeRstTime = 0
}).

%% 
%% // 抽中结果
-define(GS2U_LotteryResult,50206).
-record(pk_GS2U_LotteryResult,{
	%% LotteryItem
	item = []
}).

%% 
-define(GS2U_MapBossInfo,4111).
-record(pk_GS2U_MapBossInfo,{
	%% UInt32刷boss的地图ID
	mapID = 0,
	%% UInt32刷bossID
	bossID = 0,
	%% String目标名字（如果拥有队伍则是队长名而不是Code对应角色）
	name = "",
	%% Boolean 目标是否拥有队伍
	isTeam = false,
	%% UInt64
	refreshTime = 0,
	%% UInt64 刷BOSS的Code
	code = 0
}).

%% 
%% //王者雕像数据
-define(GS2U_MarrorInfoAck,10464).
-record(pk_GS2U_MarrorInfoAck,{
	%% String昵称
	nickName = "",
	%% UInt16等级
	playerLevel = 0,
	%% UInt32战斗力
	playerForce = 0,
	%% UInt64 角色ID
	roleID = 0,
	%% UInt64 玩家流水号
	playerCode = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32
	head = 0,
	%% Int32翅膀等级
	wingLevel = 0,
	%% String军团名
	clique = "",
	%% UInt32成功防守天数
	defendDays = 0,
	%% UInt64防守镜像最大生命值
	mirrorMaxHp = 0,
	%% UInt64防守镜像剩余生命值
	mirrorLastHp = 0,
	%% Int32 时装ID列表
	fashionIDs = [],
	%% PlayerKingBattleEquip 装备ID列表
	equipIDList = [],
	%% PlayerKingBattleEquipLevel装备等级列表
	equipLevelList = [],
	%% String守护宣言
	declaration = ""
}).

%% 
%% //自己的积排名
-define(GS2U_MyAnswerRank,56278).
-record(pk_GS2U_MyAnswerRank,{
	%% UInt16我的名次（进攻方）
	ranking = 0,
	%% UInt32积分
	value = 0
}).

%% 
%% //通知客户端boss死亡
-define(GS2U_NoticeWildBossDead,44223).
-record(pk_GS2U_NoticeWildBossDead,{
	%% WildBossInfo
	info
}).

%% 
%% //通知客户端boss仇恨目标，和显示界面与否
-define(GS2U_NoticeWildBossTarget,49672).
-record(pk_GS2U_NoticeWildBossTarget,{
	%% UInt64 目标Code
	targetCode = 0,
	%% String 目标名字（如果拥有队伍则是队长名而不是Code对应角色）
	name = "",
	%% Boolean 目标是否拥有队伍
	isTeam = false,
	%% Boolean 是否显示
	isShow = false
}).

%% 
%% //运营活动的兑换
-define(GS2U_OperateAct_Exchange,23160).
-record(pk_GS2U_OperateAct_Exchange,{
	%% UInt32兑换ID
	exchangeID = 0,
	%% Byte兑换的类型，1为道具，2为货币，3为自定义
	exchangeType = 0,
	%% Byte本角色已经兑换的次数
	roleExchangedNum = 0,
	%% Byte本角色最大可以兑换的次数
	roleMaxExchangeNum = 0,
	%% UInt16兑换的参数，如果兑换的是道具，则为道具ID；如果是货币则为货币类型
	exchangeArg = 0,
	%% UInt16兑换的数量
	exchangeNum = 0,
	%% UInt32兑换开始时间
	startTime = 0,
	%% UInt32兑换结束时间
	endTime = 0,
	%% String兑换活动名字
	name = "",
	%% String兑换标题
	title = "",
	%% String内容描述
	content = "",
	%% OperateActExchangeRequire兑换所需要的道具列表
	requireList = []
}).

%% 
-define(GS2U_OperateExchangeAck,15234).
-record(pk_GS2U_OperateExchangeAck,{
	%% UInt32兑换ID
	exchangeID = 0
}).

%% 
%% //返回玩家答题
-define(GS2U_PlayerAnswer,8335).
-record(pk_GS2U_PlayerAnswer,{
	%% UInt64玩家roleID
	roleID = 0,
	%% UInt32题目ID
	questionID = 0,
	%% Boolean是否正取
	isright = false,
	%% String答案
	answers = "",
	%% UInt321,第一个答对，2，第二个答对，其他0；
	isFirstAnser = 0,
	%% String玩家名字
	roleName = "",
	%% Byte等级
	level = 0,
	%% UInt32职业
	career = 0,
	%% Byte性别
	sex = 0,
	%% Byte种族
	race = 0,
	%% Int32头像
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% Boolean是否语音
	isVoice = false
}).

%% 
%% //答题信息
-define(GS2U_PlayerAnswerInfo,44793).
-record(pk_GS2U_PlayerAnswerInfo,{
	%% UInt32答题正确个数
	trueNum = 0,
	%% UInt32累计经验
	totalExp = 0,
	%% UInt32累计金币
	totalCoin = 0
}).

%% 
%% //答题结果
-define(GS2U_PlayerAnswerResult,19380).
-record(pk_GS2U_PlayerAnswerResult,{
	%% Int32答题结果0答错1答对
	result = 0,
	%% Byte正确答案
	trueAnswer = 0
}).

%% 
%% // 客户端收到当前排队人数
-define(GS2U_QueueNumber,64834).
-record(pk_GS2U_QueueNumber,{
	%% UInt32 当前队列中的人数
	queueNumber = 0,
	%% Boolean 活动是否开始，true 是
	isStart = false,
	%% Boolean 我是否在排队中，true 是
	isIMApply = false
}).

%% 
-define(GS2U_RequestChargeOrUseListAck,46710).
-record(pk_GS2U_RequestChargeOrUseListAck,{
	%% Byte活动类型
	type = 0,
	%% String活动名字
	activityName = "",
	%% String活动文字描述
	activityDesc = "",
	%% UInt32
	beginTime = 0,
	%% UInt32
	endTime = 0,
	%% UInt32活动期间累充消费、充值的非绑定钻石数
	amountInTime = 0,
	%% ChargeOrUseRuleInfo
	ruleInfoList = []
}).

%% 
%% // 集字活动玩家请求领奖反馈
-define(GS2U_RequestCollectionWordsAwardAck,45124).
-record(pk_GS2U_RequestCollectionWordsAwardAck,{
	%% UInt32 奖项ID
	requestAwardID = 0,
	%% Boolean	是否成功
	isSuccess = false
}).

%% 
%% // 游戏图片链接公告反馈
-define(GS2U_RequestPictureNoticeAck,40770).
-record(pk_GS2U_RequestPictureNoticeAck,{
	%% Picture_notice数据列表(总数为1~7固定不变)
	data = []
}).

%% 
%% // 返回多人护送列表
-define(GS2U_ReturnEscortList,22622).
-record(pk_GS2U_ReturnEscortList,{
	%% EscortTeam 多人护送列表
	etlist = []
}).

%% 
-define(GS2U_RobitAutoAnswer,44169).
-record(pk_GS2U_RobitAutoAnswer,{
	%% RobitAnswer
	answerList = []
}).

%% 
%% // 返回势力选择
-define(GS2U_SelectCamp,29521).
-record(pk_GS2U_SelectCamp,{
	%% DarknessPlayerRank 阵营1：正义联盟
	camp1 = [],
	%% UInt32
	cam1Num = 0,
	%% DarknessPlayerRank 阵营2：邪恶部落
	camp2 = [],
	%% UInt32
	cam2Num = 0
}).

%% 
%% // 选择的舞蹈结果
-define(GS2U_SelectDanceID,18854).
-record(pk_GS2U_SelectDanceID,{
	%% UInt32
	danceID = 0,
	%% Boolean 选择结果
	correct = false
}).

%% 
%% // 返回自己的信息
-define(GS2U_SelfDarkness,61253).
-record(pk_GS2U_SelfDarkness,{
	%% DarknessPlayerRank
	self,
	%% Boolean 是否需要选择阵营,true需要，false不需要
	isNeedSelectCamp = false,
	%% UInt32
	bossID = 0,
	%% UInt32 剩余时间
	syFreshTime = 0
}).

%% 
%% // 发送面板需要展示的数据
-define(GS2U_SendAnswerData,50072).
-record(pk_GS2U_SendAnswerData,{
	%% UInt32ID
	questionID = 0,
	%% UInt64开始时间
	endTime = 0,
	%% UInt32当前题目
	currentAnswer = 0,
	%% ActivityAnswerRankData数据列表
	data = []
}).

%% 
%% // 七日任务列表
-define(GS2U_SevenMissionDataList,56079).
-record(pk_GS2U_SevenMissionDataList,{
	%% Byte第几天
	days = 0,
	%% UInt32剩余时间 
	timeoutSeconds = 0,
	%% SevenDayMissionData
	lists = []
}).

%% 
%% // 七日任务列表
-define(GS2U_SevenMissionDataUpdate,31054).
-record(pk_GS2U_SevenMissionDataUpdate,{
	%% Boolean条件满足时，是否领取过奖励
	isFinish = false,
	%% UInt16 已经完成次数
	number = 0,
	%% UInt16 最大次数
	max = 0,
	%% UInt16 id
	missionid = 0
}).

%% 
%% // 准备切换舞蹈
-define(GS2U_SwitchDance,26463).
-record(pk_GS2U_SwitchDance,{
	%% Byte 多少秒后切换舞蹈
	second = 0
}).

%% 
%% // 同步个人信息，
-define(GS2U_SyncGBInfo,32568).
-record(pk_GS2U_SyncGBInfo,{
	%% PlayerGBInfo
	info
}).

%% 
%% // 触发了一个事件(服务器通知客户端触发一个事件，客户端响应则回复同样的协议)
-define(GS2U_TriggerEvent,17922).
-record(pk_GS2U_TriggerEvent,{
}).

%% 
%% // 事件结果
-define(GS2U_TriggerEventResult,63567).
-record(pk_GS2U_TriggerEventResult,{
	%% UInt16
	eventID = 0
}).

%% 
%% // 通知玩家离开地图
-define(GS2U_UneedleaveOutMap,13350).
-record(pk_GS2U_UneedleaveOutMap,{
	%% UInt321 被杀，2时间到
	type = 0
}).

%% 
%% //更新跨服竞技场队伍信息（添加和改变）
-define(GS2U_UpdateArenaTeamMember,28161).
-record(pk_GS2U_UpdateArenaTeamMember,{
	%% ArenaTeamMemberInfo
	teamMemberInfos = []
}).

%% 
-define(GS2U_WorldLevel,11926).
-record(pk_GS2U_WorldLevel,{
	%% Byte
	worldLevel = 0
}).

-record(pk_HDBattleExploit,{
	%% Byte排行榜名次
	rankID = 0,
	%% Byte
	camp = 0,
	%% UInt64玩家roleID
	roleID = 0,
	%% String玩家名称
	name = "",
	%% String玩家线路名称
	servername = "",
	%% UInt16玩家击杀数量
	killNum = 0,
	%% UInt16玩家助攻击杀数量
	asKillNum = 0,
	%% UInt32玩家功勋
	exploit = 0
}).

-record(pk_KillRank,{
	%% UInt32 排名
	sortNumber = 0,
	%% UInt32 击杀数
	killNumber = 0,
	%% String 玩家名
	playerName = ""
}).

-record(pk_LotteryItem,{
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% UInt32 奖池ID
	pondID = 0,
	%% UInt32 ID
	onlyID = 0,
	%% UInt32
	itemId = 0,
	%% UInt32
	itemNumber = 0,
	%% Byte 0非绑定，1绑定
	isBind = 0
}).

-record(pk_LotteryNote,{
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% UInt32
	itemID = 0,
	%% UInt32
	itemNumber = 0,
	%% Byte 0非绑定，1绑定
	isBind = 0,
	%% Byte 是否添加到全服占卜，0不添加，1添加
	isServerNote = 0,
	%% UInt64 占卜时间
	zbTime = 0
}).

-record(pk_OperateActExchangeRequire,{
	%% UInt16 兑换需要的道具ID
	itemID = 0,
	%% UInt16 兑换需要的道具数量
	itemNum = 0
}).

-record(pk_Picture_notice,{
	%% SByte 图片位置
	site = 0,
	%% Int32 图片版本
	ver = 0,
	%% String 图片资源链接
	source = "",
	%% String 图片指向链接(为空则该图片仅展示无法点击)
	target = ""
}).

-record(pk_PlayerGBInfo,{
	%% UInt32 剩余时间，单位秒
	remainSecond = 0,
	%% UInt32 持有晶体
	gatherPoint = 0,
	%% Byte 当前状态，0无收益，1正常，2双倍
	status = 0
}).

-record(pk_PlayerKingBattleEquip,{
	%% UInt32 装备ID
	equipID = 0,
	%% Byte 品质
	quality = 0
}).

-record(pk_PlayerKingBattleEquipLevel,{
	%% Byte
	type = 0,
	%% Byte
	level = 0
}).

-record(pk_Question,{
	%% UInt32题目ID
	questionID = 0,
	%% Byte题目答案
	answers = []
}).

-record(pk_RewardItem,{
	%% UInt16 ID
	itemID = 0,
	%% UInt32 数量
	number = 0
}).

-record(pk_RobitAnswer,{
	%% UInt64开始时间
	startTime = 0,
	%% UInt32间隔时间
	intervalTime = 0
}).

-record(pk_SevenDayMissionData,{
	%% Boolean条件满足时，是否领取过奖励
	isFinish = false,
	%% UInt16 已经完成次数
	number = 0,
	%% UInt16 最大次数
	max = 0,
	%% UInt16 id
	missionid = 0
}).

%% 
%% //邀请
-define(U2GS_AddArenaTeamMember,6431).
-record(pk_U2GS_AddArenaTeamMember,{
	%% UInt64
	id = 0
}).

%% 
%% //反馈邀请
-define(U2GS_AddArenaTeamMemberAck,254).
-record(pk_U2GS_AddArenaTeamMemberAck,{
	%% UInt64邀请者ID
	roleID = 0,
	%% Byte0:拒绝 1:接受
	result = 0
}).

%% 
%% // 天使投资购买
-define(U2GS_AngelInvestment,39626).
-record(pk_U2GS_AngelInvestment,{
	%% UInt16商品ID、0表示所有
	id = 0
}).

%% 
%% // 天使投资领取
-define(U2GS_AngelInvestmentGet,13560).
-record(pk_U2GS_AngelInvestmentGet,{
	%% UInt16
	id = 0
}).

%% 
%% //----------全名答题--------
%% // 全名答题报名
-define(U2GS_ApplyAnswer,52878).
-record(pk_U2GS_ApplyAnswer,{
	%% Byte 1当前在区域中，2不在区域
	type = 0
}).

%% 
%% // 报名广场舞
-define(U2GS_ApplyDance,8651).
-record(pk_U2GS_ApplyDance,{
	%% Byte 1当前在区域中，2不在区域
	type = 0
}).

%% 
%% //王者战天下 请求当前进攻方、防守方可用人数
-define(U2GS_AttackDefenderQuotaNumber,32440).
-record(pk_U2GS_AttackDefenderQuotaNumber,{
	%% UInt16活动配置表的id
	activityID = 0,
	%% UInt32活动地图id
	mapID = 0
}).

%% 
%% // 打断舞蹈
-define(U2GS_BreakDance,65134).
-record(pk_U2GS_BreakDance,{
}).

%% 
%% // 购买时间
-define(U2GS_BuyTime,31541).
-record(pk_U2GS_BuyTime,{
	%% UInt32
	id = 0
}).

%% 
%% // 请求离开报名混沌战场
-define(U2GS_CancelApply,474).
-record(pk_U2GS_CancelApply,{
}).

%% 
%% // 广场舞区域
-define(U2GS_DanceArea,26150).
-record(pk_U2GS_DanceArea,{
	%% Byte 1进入，2离开
	type = 0
}).

%% 
%% // 请求黑暗之地排行榜
-define(U2GS_DarknessRank,48307).
-record(pk_U2GS_DarknessRank,{
}).

%% 
%% // 购买某个礼包内商品
-define(U2GS_DeadLineGiftBuy,6984).
-record(pk_U2GS_DeadLineGiftBuy,{
	%% UInt16(已触发)礼包ID
	id = 0,
	%% UInt16礼包序号ID
	giftID = 0,
	%% UInt16道具购买数量
	itemBuyNum = 0
}).

%% 
%% // 打开直购礼包界面
-define(U2GS_DeadLineGiftOpen,17692).
-record(pk_U2GS_DeadLineGiftOpen,{
}).

%% 
%% // 离开范围（服务器解除采集物锁定）
-define(U2GS_GBLeaveRange,4451).
-record(pk_U2GS_GBLeaveRange,{
}).

%% 
%% // ----------------直购礼包/限时礼包 结束---------------
%% // 跨服采集资源争夺战 start----------------------------------------------------------
%% // 锁定采集物，锁定成功设置广播属性，失败直接提示errorcode
-define(U2GS_GBLockGather,44967).
-record(pk_U2GS_GBLockGather,{
	%% UInt64 采集物Code
	gatherCode = 0
}).

%% 
%% // 请求进入指定的地图线路
-define(U2GS_GBRequestEnterMapLine,62774).
-record(pk_U2GS_GBRequestEnterMapLine,{
	%% UInt16
	mapID = 0,
	%% UInt32 线路ID，传0表示随机分配
	lineID = 0
}).

%% 
%% //玩家主动申请 答题数据
-define(U2GS_GetAnswerScore,34500).
-record(pk_U2GS_GetAnswerScore,{
}).

%% 
%% //领取充值、消费奖励(只能在活动期间领取）
-define(U2GS_GetChargeOrUseGift,40452).
-record(pk_U2GS_GetChargeOrUseGift,{
	%% Byte活动类型
	type = 0,
	%% Byte活动中的档位id
	ruleID = 0
}).

%% 
%% //王者雕像点赞
-define(U2GS_GiveMarrorFlower,24589).
-record(pk_U2GS_GiveMarrorFlower,{
}).

%% 
%% //王者守护宣言
-define(U2GS_GuardianDeclaration,45851).
-record(pk_U2GS_GuardianDeclaration,{
	%% String守护宣言
	declaration = ""
}).

%% 
%% // 请求击杀排行榜
-define(U2GS_KillRank,16112).
-record(pk_U2GS_KillRank,{
}).

%% 
%% //王者守护 购买进攻方buff
-define(U2GS_KingBattleBuyAttackerBuff,15321).
-record(pk_U2GS_KingBattleBuyAttackerBuff,{
}).

%% 
%% //王者守护 一键购买进攻方buff
-define(U2GS_KingBattleBuyAttackerBuffOneKey,10874).
-record(pk_U2GS_KingBattleBuyAttackerBuffOneKey,{
}).

%% 
%% //王者守护 购买守护者buff
-define(U2GS_KingBattleBuyDeffenderBuff,22897).
-record(pk_U2GS_KingBattleBuyDeffenderBuff,{
}).

%% 
%% //王者守护 一键购买守护者buff
-define(U2GS_KingBattleBuyDeffenderBuffOneKey,29010).
-record(pk_U2GS_KingBattleBuyDeffenderBuffOneKey,{
}).

%% 
%% //王者守护 购买镜像buff
-define(U2GS_KingBattleBuyMirrorBuff,27423).
-record(pk_U2GS_KingBattleBuyMirrorBuff,{
}).

%% 
%% //王者守护 一键购买镜像buff
-define(U2GS_KingBattleBuyMirrorBuffOneKey,7440).
-record(pk_U2GS_KingBattleBuyMirrorBuffOneKey,{
}).

%% 
%% //王者守护 客户端获取防守方信息
-define(U2GS_KingBattleGetBuffInfo,13534).
-record(pk_U2GS_KingBattleGetBuffInfo,{
}).

%% 
%% //王者守护 修复镜像
-define(U2GS_KingBattleRepairMirror,49553).
-record(pk_U2GS_KingBattleRepairMirror,{
	%% Boolean 是否一键修复
	isRepairAll = false
}).

%% 
%% // 打开占卜界面
-define(U2GS_OpenLotteryForm,36633).
-record(pk_U2GS_OpenLotteryForm,{
}).

%% 
%% // 请求打开势力选择界面
-define(U2GS_OpenSelectCamp,48829).
-record(pk_U2GS_OpenSelectCamp,{
}).

%% 
%% //兑换运营搞的兑换活动
-define(U2GS_OperateExchange,9105).
-record(pk_U2GS_OperateExchange,{
	%% UInt32兑换ID
	exchangeID = 0
}).

%% 
%% //刷新运营兑换活动面板
-define(U2GS_OperateExchangeRefresh,27754).
-record(pk_U2GS_OperateExchangeRefresh,{
}).

%% 
%% //玩家答题
-define(U2GS_PlayerAnswer,30017).
-record(pk_U2GS_PlayerAnswer,{
	%% UInt32题目ID
	questionID = 0,
	%% Boolean是否正取
	isright = false,
	%% Boolean是否语音
	isVoice = false,
	%% String答案
	answers = ""
}).

%% 
%% //玩家答题
-define(U2GS_PlayerAnswerQuestion,3611).
-record(pk_U2GS_PlayerAnswerQuestion,{
	%% UInt32题目ID
	questionID = 0,
	%% Byte答案
	answers = 0
}).

%% 
%% // 注重查询活动的状态
-define(U2GS_QueryActivityState,5840).
-record(pk_U2GS_QueryActivityState,{
	%% UInt16活动配置表的id， 0表示所有
	activityID = 0
}).

%% 
%% // 请求天使投资数据
-define(U2GS_QueryAngelInvestment,60162).
-record(pk_U2GS_QueryAngelInvestment,{
}).

%% 
-define(U2GS_QueryMapBossInfo,30797).
-record(pk_U2GS_QueryMapBossInfo,{
	%% UInt64 目标Code
	targetCode = 0
}).

%% 
%% // 请求七日任务列表
-define(U2GS_QuerySevenMissionData,40751).
-record(pk_U2GS_QuerySevenMissionData,{
}).

%% 
%% //准备匹配
-define(U2GS_ReadyArena,2366).
-record(pk_U2GS_ReadyArena,{
}).

%% 
%% //玩家请求集字领奖
-define(U2GS_RequestCollectionWordsAward,13303).
-record(pk_U2GS_RequestCollectionWordsAward,{
	%% UInt32 奖项ID
	requestAwardID = 0
}).

%% 
%% //请求跨服排行榜
-define(U2GS_RequestCrosArenaRanks,35544).
-record(pk_U2GS_RequestCrosArenaRanks,{
	%% Byte 0:临时排行榜 1:永久排行榜
	type = 0
}).

%% 
%% //请求跨服排行榜
-define(U2GS_RequestCrosRanks,40839).
-record(pk_U2GS_RequestCrosRanks,{
}).

%% 
%% // 请求黑暗之地初始信息(打开界面)
-define(U2GS_RequestDarknessInfo,13748).
-record(pk_U2GS_RequestDarknessInfo,{
}).

%% 
%% // 进入黑暗之地(进入失败，自动加入排队)
-define(U2GS_RequestEnterDarkness,46152).
-record(pk_U2GS_RequestEnterDarkness,{
	%% Byte 入口编号
	entrance = 0
}).

%% 
%% // 跨服采集资源争夺战 end----------------------------------------------------------
%% // 暗夜侵袭 start----------------------------------------------------------
%% // 请求进入指定的地图线路
-define(U2GS_RequestEnterNvasionMap,47605).
-record(pk_U2GS_RequestEnterNvasionMap,{
	%% UInt16
	mapID = 0
}).

%% 
%% // 请求入口列表
-define(U2GS_RequestEntrance,36679).
-record(pk_U2GS_RequestEntrance,{
}).

%% 
%% // 请求多人护送列表
-define(U2GS_RequestEscortList,22011).
-record(pk_U2GS_RequestEscortList,{
}).

%% 
%% // 申请劫掠
-define(U2GS_RequestEscortRob,49816).
-record(pk_U2GS_RequestEscortRob,{
	%% UInt16 开启序列
	sequenceNumber = 0
}).

%% 
%% // 申请单人护送
-define(U2GS_RequestEscortSolo,35456).
-record(pk_U2GS_RequestEscortSolo,{
}).

%% 
%% // 申请多人护送
-define(U2GS_RequestEscortTeam,57606).
-record(pk_U2GS_RequestEscortTeam,{
}).

%% 
%% // 请求争夺战入口
-define(U2GS_RequestGBList,3106).
-record(pk_U2GS_RequestGBList,{
}).

%% 
%% //请求进入跨服混沌战场
-define(U2GS_RequestHDBattle,22289).
-record(pk_U2GS_RequestHDBattle,{
}).

%% 
%% //请求混沌战场倒计时（目的为了同步一下时间）
-define(U2GS_RequestHDBattleCD,64722).
-record(pk_U2GS_RequestHDBattleCD,{
}).

%% 
%% //请求跨服混沌战场战功列表
-define(U2GS_RequestHDBattleExploits,29169).
-record(pk_U2GS_RequestHDBattleExploits,{
}).

%% 
%% //王者战天下 请求进入活动
-define(U2GS_RequestInActivity,10617).
-record(pk_U2GS_RequestInActivity,{
	%% UInt16活动配置表的id
	activityID = 0,
	%% UInt32活动地图id
	mapID = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 请求加入混沌战场
-define(U2GS_RequestJoinHDBattle,27415).
-record(pk_U2GS_RequestJoinHDBattle,{
}).

%% 
%% // 抽奖
-define(U2GS_RequestLottery,33432).
-record(pk_U2GS_RequestLottery,{
	%% Boolean 是否是金币抽奖
	isGold = false,
	%% Boolean 是否是免费
	isFree = false,
	%% Byte 抽多少次，1 或者 10
	number = 0
}).

%% 
%% // 请求重置时间
-define(U2GS_RequestLotteryResetTime,47272).
-record(pk_U2GS_RequestLotteryResetTime,{
}).

%% 
%% //请求王者雕像数据
-define(U2GS_RequestMarrorInfo,25482).
-record(pk_U2GS_RequestMarrorInfo,{
}).

%% 
%% //请求活动配置表
-define(U2GS_RequestOPActivityConfList,39583).
-record(pk_U2GS_RequestOPActivityConfList,{
	%% Byte活动类型
	type = 0
}).

%% 
%% // 客户端请求当前活动状态
-define(U2GS_RequestQueueNumber,37889).
-record(pk_U2GS_RequestQueueNumber,{
}).

%% 
%% // 选择势力
-define(U2GS_SelectCamp,62131).
-record(pk_U2GS_SelectCamp,{
	%% Byte 阵营:1正义联盟，2邪恶部落
	camp = 0
}).

%% 
%% // 选择一种舞蹈
-define(U2GS_SelectDanceID,32796).
-record(pk_U2GS_SelectDanceID,{
	%% UInt32
	danceID = 0
}).

%% 
%% // 请求自己的信息
-define(U2GS_SelfDarkness,17399).
-record(pk_U2GS_SelfDarkness,{
}).

%% 
%% // 七日任务完成
-define(U2GS_SevenMissionCompletion,32637).
-record(pk_U2GS_SevenMissionCompletion,{
	%% UInt16完成任务ID
	missionid = 0
}).

%% 
%% //开始匹配
-define(U2GS_StartArena,40411).
-record(pk_U2GS_StartArena,{
}).

-record(pk_WildBossInfo,{
	%% UInt32刷boss的地图ID
	mapID = 0,
	%% UInt32刷bossID
	bossID = 0,
	%% UInt64下次刷新时间，0为已经刷新
	refreshTime = 0
}).

-record(pk_collectionWords_RewardCfg,{
	%% UInt16 配置ID，用于逻辑运算
	id = 0,
	%% UInt16 配置组ID（扩展用
	group = 0,
	%% UInt32 每日兑换奖励限制次数
	collect_num = 0,
	%% itemIdAndCount 每次兑换所需道具及数量
	listNeed = [],
	%% itemIdAndCount 每次兑换获得道具及数量
	listReward = []
}).

-record(pk_collectionWords_State,{
	%% UInt16 配置组ID（扩展用
	group = 0,
	%% UInt32 版本号（与缓存版本不同时，表示新的活动配置
	ver = 0,
	%% String 活动界面图 示例为"Textures/UI/Base_Bg_90" 将来可能为下载资源链接
	image = "",
	%% String 活动时间描述 示例为"活动时间:{0}-{1}"
	info_1 = "",
	%% String 活动规则描述 示例为"活动规则:活动期间可以从野外怪物获得道具"
	info_2 = "",
	%% UInt32 活动开始时间 示例为[2018,04,31]
	open_y_m_d = [],
	%% UInt32 活动持续时间 单位秒
	limit_time = 0,
	%% UInt32 每日字样掉落上限
	word_limit = 0
}).

-record(pk_itemIdAndCount,{
	%% UInt16
	itemID = 0,
	%% UInt32
	count = 0
}).

%% 
%% // 返回对战记录
-define(GS2U_BattleNotes,26077).
-record(pk_GS2U_BattleNotes,{
	%% LadderLS
	lsInfo = [],
	%% LadderMatchInfo
	selfInfo = []
}).

%% 
%% // 比赛开始，倒计时秒
-define(GS2U_BattleStartSec,20351).
-record(pk_GS2U_BattleStartSec,{
	%% UInt32 战斗剩余秒数
	second = 0
}).

%% 
%% // 战斗结果
-define(GS2U_Ladder1v1BattleEnd,34585).
-record(pk_GS2U_Ladder1v1BattleEnd,{
	%% Byte 0失败，1胜利
	result = 0,
	%% UInt32 累积功勋
	exploit = 0,
	%% UInt32 最新排名
	rank = 0
}).

%% 
%% // 返回筛选的对手
-define(GS2U_LadderTargetList,45601).
-record(pk_GS2U_LadderTargetList,{
	%% LadderTargetInfo 对手列表，注意：size =< 6
	targets = [],
	%% SelfBattleInfo 自己的信息
	selfInfo
}).

%% 
%% // 准备开始，倒计时秒
-define(GS2U_PrepareSec,50114).
-record(pk_GS2U_PrepareSec,{
	%% Byte 剩余秒数，客户端自行倒计时
	second = 0
}).

%% 
%% // 返回王者列表
-define(GS2U_ReturnKingList,9433).
-record(pk_GS2U_ReturnKingList,{
	%% KingRole 王者列表
	kings = []
}).

-record(pk_KingRole,{
	%% UInt64 roleID
	roleID = 0,
	%% UInt32 当前排名
	ranksort = 0,
	%% UInt32 职业
	career = 0,
	%% String
	roleName = "",
	%% UInt32 被膜拜次数
	worshipTimes = 0
}).

-record(pk_LadderLS,{
	%% UInt64 胜利者
	roleID = 0,
	%% String
	roleName = "",
	%% Boolean 是否是终结者，true表示终结对象
	isTerminator = false,
	%% UInt16 连胜次数
	ls_times = 0,
	%% UInt64 失败者，目标
	targetID = 0,
	%% String
	targetName = ""
}).

-record(pk_LadderMatchInfo,{
	%% UInt64 自己
	roleID = 0,
	%% String
	roleName = "",
	%% Boolean true挑战者,false被挑战者
	isChallenge = false,
	%% Boolean true胜利,false失败
	isWin = false,
	%% UInt64 目标
	targetID = 0,
	%% String
	targetName = "",
	%% UInt32 挑战前排名
	rank1 = 0,
	%% UInt32 挑战后排名
	rank2 = 0
}).

-record(pk_LadderTargetInfo,{
	%% UInt64
	roleID = 0,
	%% String
	name = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% UInt32 当前排名
	ranksort = 0,
	%% UInt32 战斗力
	fightingCapacity = 0,
	%% SByte 性别
	sex = 0,
	%% SByte 种族
	race = 0
}).

-record(pk_SelfBattleInfo,{
	%% UInt32 当前排名
	ranksort = 0,
	%% UInt32 战斗力
	fightingCapacity = 0,
	%% UInt32 累积功勋
	exploit = 0,
	%% UInt16 当前完成的挑战次数
	cur_ChallengeTimes = 0,
	%% UInt16 今日最大的挑战次数
	max_ChallengeTimes = 0,
	%% Byte 本次挑战需要消耗的金钱类型
	moneyType = 0,
	%% UInt32 本次挑战需要消耗的金钱(每日超过5次挑战要收费)
	money = 0,
	%% UInt16 当前连胜次数
	cur_win = 0,
	%% UInt16 最高连胜次数
	max_win = 0,
	%% UInt32 累积胜利次数
	win_times = 0,
	%% UInt32 发奖剩余秒数
	surplusSec = 0,
	%% UInt32 本次预计可领功勋
	exploitValue = 0
}).

%% 
%% // 针对小号不用完成任务也可以提交aruna经验任务
-define(U2GS_AtuoSubmitTask,9064).
-record(pk_U2GS_AtuoSubmitTask,{
}).

%% 
%% // 按排名挑战对手
-define(U2GS_ChallengeTargetByRank,42789).
-record(pk_U2GS_ChallengeTargetByRank,{
	%% UInt32 当前排名
	ranksort = 0,
	%% String目标名字
	name = ""
}).

%% 
%% // 按对象挑战对手
-define(U2GS_ChallengeTargetByRoleID,47690).
-record(pk_U2GS_ChallengeTargetByRoleID,{
	%% UInt64 对手roleID
	roleID = 0
}).

%% 
%% // 刷新对手(返回 GS2U_LadderTargetList)
-define(U2GS_FreshLadderTargetList,45193).
-record(pk_U2GS_FreshLadderTargetList,{
}).

%% 
%% // 放弃挑战
-define(U2GS_GiveUpChallenge,39273).
-record(pk_U2GS_GiveUpChallenge,{
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 打开天梯1v1界面
-define(U2GS_OpenLadder1v1,51570).
-record(pk_U2GS_OpenLadder1v1,{
}).

%% 
%% // 请求对战记录
-define(U2GS_RequestBattleNotes,64668).
-record(pk_U2GS_RequestBattleNotes,{
}).

%% 
%% // 请求王者列表
-define(U2GS_RequestKingList,23086).
-record(pk_U2GS_RequestKingList,{
}).

%% 
%% // 获取对象的模型相关信息(返回rank.h GS2U_SendPropList 这个协议)
-define(U2GS_RequestPlayerInfo,28940).
-record(pk_U2GS_RequestPlayerInfo,{
	%% UInt64 roleID
	roleID = 0
}).

%% 
%% // 膜拜王者
-define(U2GS_WorshipTarget,15929).
-record(pk_U2GS_WorshipTarget,{
	%% UInt64 roleID
	roleID = 0,
	%% String
	roleName = ""
}).

%% 
%% // 刷新主界面动态数据
-define(GS2U_FreshWWFormData,51676).
-record(pk_GS2U_FreshWWFormData,{
	%% WWFormData 动态数据
	data
}).

%% 
%% // 护送结果
-define(GS2U_WWEscortResult,51365).
-record(pk_GS2U_WWEscortResult,{
	%% UInt16 旧世界阶段
	old_phase = 0,
	%% UInt32 旧阶段累积值
	old_schedule = 0,
	%% UInt16 新世界阶段
	new_phase = 0,
	%% UInt32 新阶段累积值
	new_schedule = 0,
	%% UInt32 增加的样本值
	sample_point = 0,
	%% Boolean 成功或失败
	success = false
}).

%% 
%% // 返回主界面数据
-define(GS2U_WWFormData,11034).
-record(pk_GS2U_WWFormData,{
	%% Boolean 是否刷新排行榜,如果为false,rankList=[]
	isFreshRank = false,
	%% Boolean 是否上线初始化
	isInit = false,
	%% WWRank 排行榜列表,isFreshRank=true,本项才有值
	rankList = [],
	%% WWFormData 动态数据
	data
}).

%% 
%% // 返回入口信息
-define(GS2U_WWList,12254).
-record(pk_GS2U_WWList,{
	%% WWMapLineInfo
	lineList = []
}).

%% 
%% // 返回个人信息，
-define(GS2U_WWPlayerInfo,19107).
-record(pk_GS2U_WWPlayerInfo,{
	%% UInt32 个人贡献值
	contribution = 0,
	%% UInt32 样本值
	sample_point = 0
}).

%% 
%% // =========以下为活动相关协议===================================================
%% // 地图同步信息
-define(GS2U_WWSyncMapInfo,10735).
-record(pk_GS2U_WWSyncMapInfo,{
	%% UInt16 世界阶段
	phase = 0,
	%% UInt32 阶段累积值
	schedule = 0,
	%% Byte 当前地图的活动阶段
	acPhase = 0,
	%% UInt32 提升的倍数
	upper = 0
}).

%% 
%% // 第一个阶段
-define(GS2U_WWSyncMapInfoOne,52195).
-record(pk_GS2U_WWSyncMapInfoOne,{
	%% UInt32 剩余时间，秒
	residueSec = 0
}).

%% 
%% // 第三个阶段
-define(GS2U_WWSyncMapInfoThree,61143).
-record(pk_GS2U_WWSyncMapInfoThree,{
	%% String
	selfServerName = "",
	%% UInt32
	selfPoint = 0,
	%% String
	targetServerName = "",
	%% UInt32
	targetPoint = 0,
	%% UInt32 剩余距离
	distance = 0
}).

%% 
%% // 第二个阶段
-define(GS2U_WWSyncMapInfoTwo,9437).
-record(pk_GS2U_WWSyncMapInfoTwo,{
	%% Byte 当前波数
	curTimes = 0,
	%% Byte 总波数
	maxTimes = 0,
	%% WWSyncMapPhaseTwo 目标
	targets = []
}).

%% 
%% // 领取上周的排行榜奖励
-define(U2GS_GetLastReward,37977).
-record(pk_U2GS_GetLastReward,{
}).

%% 
%% // 领取世界阶段奖励
-define(U2GS_GetPhaseReward,49362).
-record(pk_U2GS_GetPhaseReward,{
}).

%% 
%% // 打开主界面
-define(U2GS_RequestWWForm,46085).
-record(pk_U2GS_RequestWWForm,{
	%% Boolean 是否刷新排行榜,false不刷新，客户端用自己的缓存数据
	isFreshRank = false
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 请求Aruna线路入口
-define(U2GS_RequestWWLineList,29239).
-record(pk_U2GS_RequestWWLineList,{
}).

%% 
%% // 请求个人信息
-define(U2GS_RequestWWPlayerInfo,56112).
-record(pk_U2GS_RequestWWPlayerInfo,{
}).

%% 
%% // 提交样本
-define(U2GS_SubmitSamplePoint,43112).
-record(pk_U2GS_SubmitSamplePoint,{
	%% UInt16 样本ID
	configID = 0
}).

%% 
%% // 请求进入指定的地图线路
-define(U2GS_WWRequestEnterMapLine,57345).
-record(pk_U2GS_WWRequestEnterMapLine,{
	%% UInt16
	mapID = 0,
	%% UInt32 线路ID，传0表示随机分配
	lineID = 0
}).

-record(pk_WWFormData,{
	%% WWRank 自己的当前信息
	selfRank,
	%% WWRank 自己的上周信息
	selfLastRank,
	%% Boolean 是否已经领取上周奖励
	isGetLastReward = false,
	%% UInt16 世界阶段
	phase = 0,
	%% UInt32 阶段累积值
	schedule = 0,
	%% UInt16 自己领取的世界奖励阶段
	selfPhase = 0,
	%% UInt32 提升的倍数
	upper = 0
}).

-record(pk_WWMapLineInfo,{
	%% UInt16
	mapID = 0,
	%% UInt32 线路ID
	lineID = 0,
	%% UInt16 当前线路人数
	number = 0
}).

-record(pk_WWRank,{
	%% UInt16 排名
	rankIndex = 0,
	%% UInt64 角色ID
	roleID = 0,
	%% String
	roleName = "",
	%% String
	guildName = "",
	%% UInt32 贡献值
	contribution = 0
}).

-record(pk_WWSyncMapPhaseTwo,{
	%% UInt32
	monsterID = 0,
	%% UInt32 当前击杀数量
	curNumber = 0,
	%% UInt32 需要击杀数量
	maxNumber = 0
}).

-record(pk_BagSlot,{
	%% Byte最大格子数
	max = 0,
	%% Byte已开启格子数
	used = 0
}).

%% 
%% // 自己删除别人印象
-define(DelImpression,51952).
-record(pk_DelImpression,{
	%% UInt16
	uid = 0
}).

%% 
%% // 删除标签
-define(DelTag,42903).
-record(pk_DelTag,{
	%% Byte
	index = 0
}).

-record(pk_EquipEnhancedProp,{
	%% Byte属性标识主键  对应propType 如propType = 1时，propKey为属性ID
	propKey = 0,
	%% Single属性值  对应propKey 有符号整数 可以为正负数
	propValue = 0.0
}).

-record(pk_EquipGemInfo,{
	%% UInt16 装备部位
	equipPos = 0,
	%% GemEmbedInfo
	gemList = []
}).

-record(pk_EquipItemInfo,{
	%% UInt32物品ID
	itemID = 0,
	%% UInt64物品UID
	itemUID = 0,
	%% UInt16重铸次数
	recastNum = 0,
	%% Byte品质  0 白色装备 1绿色装备 2蓝色装备 3紫色装备 4橙色装备 5红色装备
	quality = 0,
	%% Boolean是否绑定
	isBind = false,
	%% Boolean是否锁定
	isLocked = false,
	%% UInt32过期时间
	expiredTime = 0,
	%% EquipPropInfo装备属性列表
	equipProps = []
}).

-record(pk_EquipPropInfo,{
	%% Byte装备属性类型  1:基础属性, 2:附加属性(未重铸)  3:附加属性(不可重铸) 4.附加属性(已重铸) 
	propType = 0,
	%% Byte属性标识主键  对应propType 如propType = 1时，propKey为属性ID
	propKey = 0,
	%% UInt16属性词缀
	propAffix = 0,
	%% Boolean属性计算类型  false加法  true乘法
	calcType = false,
	%% Single属性值
	propValue = 0.0
}).

-record(pk_EquipRefineLevel,{
	%% Byte装备部位
	type = 0,
	%% UInt16部位精炼祝福值
	bless = 0,
	%% Byte精炼等级
	level = 0
}).

-record(pk_EquipStarLevel,{
	%% Byte装备部位
	type = 0,
	%% Byte升星等级
	level = 0
}).

-record(pk_EquipUpStarInfo,{
	%% Byte装备部位
	pos = 0,
	%% Byte星星等级
	level = 0,
	%% Byte部位冲星进度
	prog = 0,
	%% UInt16部位冲星祝福值
	bless = 0
}).

-record(pk_ExchangeResource,{
	%% UInt32兑换列表ID
	id = 0,
	%% Byte组ID
	groupID = 0,
	%% UInt32道具ID
	itemID = 0,
	%% PayItemOfExchange支付物品
	payItem = [],
	%% Byte需要玩家级别
	playerLevel = 0,
	%% UInt16兑换上限
	limit = 0
}).

%% 
%% //增加装备
-define(GS2U_AddEquipItemToBag,22995).
-record(pk_GS2U_AddEquipItemToBag,{
	%% Byte背包类型
	type = 0,
	%% UInt64怪物Code
	code = 0,
	%% EquipItemInfo增加装备的具体信息
	items = []
}).

%% 
%% // 给其他玩家添加印象结果
-define(GS2U_AddImpressionResult,21079).
-record(pk_GS2U_AddImpressionResult,{
	%% Boolean
	result = false
}).

%% 
%% //增加道具
-define(GS2U_AddNormalItemToBag,26330).
-record(pk_GS2U_AddNormalItemToBag,{
	%% Byte背包类型
	type = 0,
	%% UInt64怪物Code
	code = 0,
	%% UInt32实际增加数量
	addNum = 0,
	%% NormalItemInfo增加道具的具体信息
	items = []
}).

%% 
%% // 点赞其他玩家成功
-define(GS2U_AddPraise,3297).
-record(pk_GS2U_AddPraise,{
}).

%% 
%% // 加标签结果
-define(GS2U_AddTagResult,1210).
-record(pk_GS2U_AddTagResult,{
	%% Boolean
	result = false
}).

%% 
%% // 删除物品
-define(GS2U_DeleteGoods,3911).
-record(pk_GS2U_DeleteGoods,{
	%% Byte背包类型
	type = 0,
	%% UInt64物品UID列表
	goodsUIDs = []
}).

%% 
%% //强化计算
-define(GS2U_EquipEnhancedProp,29649).
-record(pk_GS2U_EquipEnhancedProp,{
	%% UInt64装备UID
	equipUID = 0,
	%% EquipEnhancedProp强化后基础属性
	enProps = [],
	%% UInt32强化费用
	price = 0
}).

%% 
-define(GS2U_EquipGemInfoUpdate,38946).
-record(pk_GS2U_EquipGemInfoUpdate,{
	%% EquipGemInfo
	equipGemInfo
}).

%% 
%% //宝石数据初始化
-define(GS2U_EquipGemInfos,10850).
-record(pk_GS2U_EquipGemInfos,{
	%% EquipGemInfo
	equipGemInfos = []
}).

%% 
%% // 更新一个装备位的重铸属性
-define(GS2U_EquipRecastInfo,6004).
-record(pk_GS2U_EquipRecastInfo,{
	%% UInt16 1.属性重铸 2.符石重铸
	recastType = 0,
	%% UInt16 本次重铸评分
	score = 0,
	%% RecastPosInfo
	recastInfo
}).

%% 
%% // 重铸初始化,上线时初始化,升级时的变化
-define(GS2U_EquipRecastInfoInit,60660).
-record(pk_GS2U_EquipRecastInfoInit,{
	%% RecastPosInfo
	recastInfoList = []
}).

%% 
%% //装备部位精炼等级
-define(GS2U_EquipRefineLevel,3311).
-record(pk_GS2U_EquipRefineLevel,{
	%% EquipRefineLevel
	equipRefines = []
}).

%% 
%% //装备精炼
-define(GS2U_EquipRefineResult,15630).
-record(pk_GS2U_EquipRefineResult,{
	%% UInt64
	code = 0,
	%% Byte装备部位
	type = 0,
	%% UInt16部位精炼祝福值
	bless = 0,
	%% Byte精炼等级
	level = 0
}).

%% 
-define(GS2U_EquipRefineResultOneKey,59719).
-record(pk_GS2U_EquipRefineResultOneKey,{
	%% UInt64
	code = 0,
	%% Byte
	levelOld = 0,
	%% Byte
	levelNew = 0,
	%% Byte
	typeList = []
}).

%% 
%% //初始化装备星级列表
-define(GS2U_EquipUpStarInfoList,39417).
-record(pk_GS2U_EquipUpStarInfoList,{
	%% EquipUpStarInfo
	equipUpStars = []
}).

%% 
%% //装备冲星结果
-define(GS2U_EquipUpStarRes,57099).
-record(pk_GS2U_EquipUpStarRes,{
	%% EquipUpStarInfo
	equipUpStarInfo,
	%% Byte冲星类型0:单次冲星 1:一键冲星
	type = 0,
	%% UInt16冲星次数
	index = 0,
	%% starCostItem
	costList = [],
	%% UInt32冲星消耗金币
	coin = 0,
	%% Byte冲星结果(0:材料不够,失败1:金币不够,失败2:冲星当前进度成功3:冲星等级成功4:冲星失败)
	res = 0
}).

%% 
%% //装备合成ACK
-define(GS2U_EqupmentCombinAck,48238).
-record(pk_GS2U_EqupmentCombinAck,{
	%% UInt32
	combinID = 0,
	%% Boolean
	success = false,
	%% EquipItemInfo增加装备的具体信息
	items = []
}).

%% 
%% //兑换成功时发送，失败时发错误码
-define(GS2U_ExchangeResult,26628).
-record(pk_GS2U_ExchangeResult,{
	%% UInt32ID(兑换列表中的Id编号）
	id = 0,
	%% UInt16兑换物品剩下数量
	itemCount = 0
}).

%% 
%% // 玩家被禁止传照片
-define(GS2U_Forbidden_Load_Photo,26639).
-record(pk_GS2U_Forbidden_Load_Photo,{
	%% UInt64
	forbiddenTime = 0
}).

%% 
%% // 玩家获得点赞
-define(GS2U_GainPraise,26975).
-record(pk_GS2U_GainPraise,{
}).

%% 
%% //宝石增加
-define(GS2U_GemEmbedAdd,1331).
-record(pk_GS2U_GemEmbedAdd,{
	%% GemEmbedInfo宝石信息
	gemEmbedInfo
}).

%% 
%% //宝石卸载结果
-define(GS2U_GemEmbedDelete,29137).
-record(pk_GS2U_GemEmbedDelete,{
	%% UInt64宝石UID
	gemUIDs = []
}).

%% 
%% //宝石镶嵌背包初始
-define(GS2U_GemEmbedInit,43498).
-record(pk_GS2U_GemEmbedInit,{
	%% GemEmbedInfo宝石镶嵌数据全量初始化
	gemEmbedInfos = []
}).

%% 
%% //宝石合成结果
-define(GS2U_GemEmbedMakeResult,6557).
-record(pk_GS2U_GemEmbedMakeResult,{
	%% UInt64宝石UID
	gemUID = 0
}).

%% 
%% //分解装备返回得到的精华总数
-define(GS2U_GetEssenceNum,34792).
-record(pk_GS2U_GetEssenceNum,{
	%% UInt32
	purpleEssence = 0,
	%% UInt32
	goldenEssence = 0,
	%% washReturnItemInfo
	itemList = []
}).

%% 
%% //初始化装备
-define(GS2U_InitEquip,56720).
-record(pk_GS2U_InitEquip,{
	%% Byte背包类型
	type = 0,
	%% EquipItemInfo整理后的装备信息
	items = []
}).

%% 
%% //初始化普通道具
-define(GS2U_InitItem,33727).
-record(pk_GS2U_InitItem,{
	%% Byte背包类型
	type = 0,
	%% NormalItemInfo整理后的道具信息
	items = []
}).

%% 
-define(GS2U_InitRecycle,20967).
-record(pk_GS2U_InitRecycle,{
	%% RecycleItem
	items = [],
	%% RecycleEquip
	equips = []
}).

%% 
%% //初始化背包和仓库的格子
-define(GS2U_InitSlot,21902).
-record(pk_GS2U_InitSlot,{
	%% BagSlot列表的顺序:普通背包、普通仓库 、装备背包、装备仓库、回收站、玩家身上的装备背包、宝石背包、宝石仓库、镶嵌宝石背包
	slots = []
}).

%% 
%% // 锁定物品的返回消息
-define(GS2U_LockGoods,39307).
-record(pk_GS2U_LockGoods,{
	%% UInt64
	goodsUID = 0,
	%% Byte 背包类型
	bagType = 0,
	%% Boolean true为锁定，false为非锁定
	isLocked = false
}).

%% 
%% //远程玩家信息查看结果，时装
-define(GS2U_LookRPInfo_Fashion,29456).
-record(pk_GS2U_LookRPInfo_Fashion,{
	%% UInt64角色ID
	roleID = 0,
	%% RPView_FashionInfo 返回时装列表
	datas = [],
	%% UInt32 已经激活的套装列表
	activeFashionSuitList = []
}).

%% 
%% //远程玩家信息查看结果，婚姻
-define(GS2U_LookRPInfo_Marriage,14014).
-record(pk_GS2U_LookRPInfo_Marriage,{
	%% UInt64 角色ID
	roleID = 0,
	%% UInt64 配偶角色ID（无配偶时为0）
	id = 0,
	%% String 配偶角色姓名
	name = "",
	%% Byte 配偶性别
	sex = 0,
	%% UInt32 结婚时间（服务器同步时间，自1970-01-01至今的秒数）
	weddingDay = 0,
	%% UInt32 亲密度
	closeness = 0
}).

%% 
%% //远程玩家信息查看结果，宠物
-define(GS2U_LookRPInfo_Pet,11943).
-record(pk_GS2U_LookRPInfo_Pet,{
	%% UInt64角色ID
	roleID = 0,
	%% RPView_PetBaseInfo 助战及上的所有宠物
	petInfoList = [],
	%% RPView_AssistBattleInfo 助战信息
	infoList = []
}).

%% 
%% //远程玩家信息查看结果，角色
-define(GS2U_LookRPInfo_Result,3869).
-record(pk_GS2U_LookRPInfo_Result,{
	%% UInt64角色ID
	roleID = 0,
	%% String角色名
	roleName = "",
	%% UInt32角色职业
	career = 0,
	%% SByte种族
	race = 0,
	%% SByte性别
	sex = 0,
	%% UInt32
	head = 0,
	%% UInt16头像框
	frameID = 0,
	%% Byte玩家等级
	level = 0,
	%% UInt32玩家战斗力
	roleForce = 0,
	%% Byte荣誉装备等级
	equipHonorLevel = 0,
	%% String家族名
	guildName = "",
	%% Int32玩家杀戮值	
	playerKillValue = 0,
	%% Int32翅膀等级
	wingLevel = 0,
	%% Single战斗属性列表
	propValues = [],
	%% EquipItemInfo装备信息
	equips = [],
	%% UInt32穿在身上的时装
	fashionList = [],
	%% EquipRefineLevel玩家部位强化等级
	equipRefines = [],
	%% EquipStarLevel玩家装备升星等级
	equipStar = [],
	%% EquipGemInfo玩家镶嵌信息
	equipGemInfos = [],
	%% RecastPosInfo玩家附魔属性
	recastInfoList = []
}).

%% 
%% // 保存玩家扩展信息成功
-define(GS2U_PlayerExtenInfo,807).
-record(pk_GS2U_PlayerExtenInfo,{
	%% Byte信息类型1:生日;2:地址;3:星座;4:签名
	type = 0
}).

%% 
%% //查看装备的结果
-define(GS2U_QueryEquipResult,38681).
-record(pk_GS2U_QueryEquipResult,{
	%% EquipItemInfo装备详细信息
	equipInfo
}).

%% 
%% //查看普通道具的结果
-define(GS2U_QueryItemResult,63112).
-record(pk_GS2U_QueryItemResult,{
	%% NormalItemInfo道具详细信息
	itemInfo
}).

%% 
%% // 举报其他玩家成功
-define(GS2U_Report,7316).
-record(pk_GS2U_Report,{
}).

%% 
%% // 举报次数到上限
-define(GS2U_Report_Max,41093).
-record(pk_GS2U_Report_Max,{
}).

%% 
-define(GS2U_RequesBuyIDAck,60777).
-record(pk_GS2U_RequesBuyIDAck,{
	%% Byte
	type = 0,
	%% UInt32
	id = 0,
	%% Boolean是否成功
	succ = false
}).

%% 
-define(GS2U_RequestExchangeResourceForeverLimitIDAck,27150).
-record(pk_GS2U_RequestExchangeResourceForeverLimitIDAck,{
	%% UInt16资源配置id列表
	iDList = []
}).

%% 
-define(GS2U_RequestForeverLimitIDAck,2011).
-record(pk_GS2U_RequestForeverLimitIDAck,{
	%% Byte
	type = 0,
	%% UInt16资源配置id列表
	iDList = []
}).

%% 
%% //初始化资源兑换列表
-define(GS2U_ResourceExchangeList,42259).
-record(pk_GS2U_ResourceExchangeList,{
	%% ExchangeResource资源列表
	resources = []
}).

%% 
%% // 上传照片结果
-define(GS2U_UpLoadingPhotoResult,3498).
-record(pk_GS2U_UpLoadingPhotoResult,{
	%% Boolean
	result = false
}).

%% 
%% //更新装备
-define(GS2U_UpdateEquipItem,24074).
-record(pk_GS2U_UpdateEquipItem,{
	%% Byte背包类型
	type = 0,
	%% Byte1:强化2:重铸3:附魔
	operate = 0,
	%% EquipItemInfo整理后的物品信息
	items = []
}).

%% 
-define(GS2U_UpdateFurnitureStorageSlot,14780).
-record(pk_GS2U_UpdateFurnitureStorageSlot,{
	%% Byte
	slotNum = 0
}).

%% 
%% //更新普通道具
-define(GS2U_UpdateNormalItem,11295).
-record(pk_GS2U_UpdateNormalItem,{
	%% Byte背包类型
	type = 0,
	%% NormalItemInfo整理后的物品信息
	items = []
}).

%% 
%% //使用烟花道具后广播使用者给其他人
-define(GS2U_UseItemFireWorksNotice,11434).
-record(pk_GS2U_UseItemFireWorksNotice,{
	%% UInt64使用者ID
	roleID = 0
}).

%% 
-define(GS2U_WashEquip,13489).
-record(pk_GS2U_WashEquip,{
	%% UInt16 
	equipPos = 0,
	%% UInt16
	index = 0,
	%% EquipPropInfo
	propInfo
}).

%% 
%% // 已获取头像框
-define(GS2u_OwnPortraitFrame,54772).
-record(pk_GS2u_OwnPortraitFrame,{
	%% Byte状态 1.所有已获取的头像框列表 2.新获取的头像框列表
	state = 0,
	%% PortraitFrame头像框列表
	portraitFrameList = []
}).

-record(pk_GemEmbedInfo,{
	%% UInt64宝石ID
	gemID = 0,
	%% Byte宝石镶嵌部位编号
	slot = 0
}).

-record(pk_LookGemInfo,{
	%% UInt16宝石ID
	gemID = 0,
	%% Byte宝石孔位
	slot = 0
}).

-record(pk_LookGodWeaponInfo,{
	%% Byte神器ID
	weaponID = 0,
	%% UInt16神器等级
	weaponLevel = 0,
	%% UInt16神器技能等级
	skillLevel = 0
}).

-record(pk_LookPetEquipInfo,{
	%% Byte宠物装备ID
	equipID = 0,
	%% Byte宠物装备等级
	equipLv = 0
}).

-record(pk_LookPetInfo,{
	%% UInt16宠物ID
	petID = 0,
	%% Byte宠物星阶
	petStar = 0,
	%% String宠物名字
	petname = "",
	%% UInt32宠物战斗力
	petForce = 0,
	%% UInt16宠物收集数
	petColNum = 0,
	%% Byte宠物转生
	petRaw = 0,
	%% LookPetSkill宠物技能
	petSkill = [],
	%% LookPetEquipInfo宠物装备
	equalInfo = [],
	%% Single宠物战斗属性
	petPropValues = []
}).

-record(pk_LookPetSkill,{
	%% UInt16宠物技能ID
	petSkillId = 0,
	%% Byte宠物技能等级
	petSkillLv = 0,
	%% Byte宠物技能Type 0:天赋技能 1:通用技能 2:基础技能
	petSkillType = 0
}).

-record(pk_LookWakeInfo,{
	%% Byte女神卡片ID
	cardID = 0,
	%% Byte觉醒等级
	level = 0
}).

%% 
%% //移动物品
-define(MoveGoods,645).
-record(pk_MoveGoods,{
	%% UInt64
	itemUID = 0,
	%% Byte
	source = 0,
	%% Bytesource target 取值 0:普通背包 1:普通仓库  2： 装备背包  3：装备仓库  4：回收站 5:玩家身上的装备背包 6:宝石背包 7：宝石仓库 8：镶嵌宝石背包
	target = 0
}).

-record(pk_NormalItemInfo,{
	%% UInt32物品ID
	itemID = 0,
	%% UInt64物品UID
	itemUID = 0,
	%% UInt16物品数量
	itemSum = 0,
	%% Boolean是否绑定
	isBind = false,
	%% Boolean是否锁定
	isLocked = false,
	%% UInt32过期时间
	expiredTime = 0
}).

%% 
%% //开启空格子
-define(OpenNewBagSlot,22696).
-record(pk_OpenNewBagSlot,{
	%% Byte 背包类型
	bagType = 0,
	%% Byte 开启数量
	openNum = 0
}).

-record(pk_PayItemOfExchange,{
	%% Int32-1:使用紫色精华;-2:使用金色精华,正数为item表中的物品id
	item = 0,
	%% UInt16数量
	number = 0
}).

-record(pk_PortraitFrame,{
	%% UInt16头像框ID
	id = 0,
	%% UInt32结束时间  到期时间 UTC秒 0表示永久
	endTime = 0
}).

-record(pk_RPView_AddProp,{
	%% Byte
	prop = 0,
	%% Single
	value = 0.0
}).

-record(pk_RPView_AssistBattleInfo,{
	%% UInt16宠物ID
	petID = 0,
	%% Byte位置
	slot = 0
}).

-record(pk_RPView_FashionInfo,{
	%% UInt32 时装ID
	fashionID = 0,
	%% UInt32 剩余时间 小于等于0：过期 大于0：对应的秒数
	time = 0
}).

-record(pk_RPView_PetBaseInfo,{
	%% UInt16宠物ID
	petID = 0,
	%% Byte宠物星阶
	petStar = 0,
	%% Byte宠物是否出战 0:休息(非助战) 1:休息(助战)2:出战（非召唤）3:出战（召唤）
	status = 0,
	%% String宠物名字
	petName = "",
	%% Byte宠物转生
	petRaw = 0,
	%% RPView_AddProp宠物属性
	petProps = [],
	%% UInt64宠物战斗力
	petForce = 0,
	%% UInt32宠物提升次数
	upCount = 0,
	%% UInt32宠物等级
	petLevel = 0,
	%% UInt32宠物经验
	petExp = 0
}).

-record(pk_RecastPosInfo,{
	%% UInt16 重铸部位
	equipPos = 0,
	%% UInt32 精炼值
	recastVal = 0,
	%% RecastPropInfo 属性重铸
	recastInfo = [],
	%% RecastPropInfo 符石重铸
	recastInfo_ext = []
}).

-record(pk_RecastPropInfo,{
	%% UInt16第几条属性
	pos = 0,
	%% UInt32属性id
	propIndex = 0,
	%% Single属性值
	propValue = 0.0,
	%% Single最大值（可以忽略）
	propValMax = 0.0
}).

-record(pk_RecycleEquip,{
	%% Byte
	slot = 0,
	%% EquipItemInfo
	equip
}).

-record(pk_RecycleItem,{
	%% Byte
	slot = 0,
	%% NormalItemInfo
	item
}).

%% 
%% // 给其他玩家添加印象
-define(U2GS_AddImpression,34496).
-record(pk_U2GS_AddImpression,{
	%% UInt64角色ID
	roleID = 0,
	%% String添加印象
	impression = ""
}).

%% 
%% // 点赞其他玩家
-define(U2GS_AddPraise,48887).
-record(pk_U2GS_AddPraise,{
	%% UInt64角色ID
	roleID = 0
}).

%% 
%% // 加标签
-define(U2GS_AddTag,48135).
-record(pk_U2GS_AddTag,{
	%% String标签
	tag = ""
}).

%% 
%% //装备强化
-define(U2GS_EquipEnhanced,9940).
-record(pk_U2GS_EquipEnhanced,{
	%% Byte1：强化计算(属性值,以及费用) 2：确认强化
	type = 0,
	%% UInt64装备UID
	equipUID = 0
}).

%% 
%% //装备重铸
-define(U2GS_EquipRecast,29280).
-record(pk_U2GS_EquipRecast,{
	%% UInt16 重铸部位
	equipPos = 0
}).

%% 
%% //符石重铸
-define(U2GS_EquipRecastAdvance,41850).
-record(pk_U2GS_EquipRecastAdvance,{
	%% UInt16 重铸部位
	equipPos = 0,
	%% UInt16 第几条属性
	pos = 0
}).

%% 
%% //装备精炼
-define(U2GS_EquipRefine,5183).
-record(pk_U2GS_EquipRefine,{
	%% Byte装备部位类型
	type = 0,
	%% UInt16幸运符ID
	goodluckCharmId = 0
}).

%% 
%% //装备一键精炼
-define(U2GS_EquipRefineOneKey,1328).
-record(pk_U2GS_EquipRefineOneKey,{
}).

%% 
%% //装备分解
-define(U2GS_EquipResolve,50942).
-record(pk_U2GS_EquipResolve,{
	%% UInt64要分解装备的UID
	equipUIDs = []
}).

%% 
%% //装备冲星
-define(U2GS_EquipUpStar,32827).
-record(pk_U2GS_EquipUpStar,{
	%% Byte装备部位
	pos = 0,
	%% Byte0:单次冲星 1:一键冲星
	type = 0
}).

%% 
%% //装备全部位升星
-define(U2GS_EquipUpStarOneKey,51276).
-record(pk_U2GS_EquipUpStarOneKey,{
}).

%% 
%% //宝石合成
-define(U2GS_GemEmbedMake,36466).
-record(pk_U2GS_GemEmbedMake,{
	%% UInt32 宝石ID
	id = 0,
	%% UInt32 合成个数
	count = 0,
	%% Byte 是否只消耗非绑定钻石来合成非绑定宝石
	flag = 0
}).

%% 
%% //宝石合成
-define(U2GS_GemEmbedMakeOnce,9407).
-record(pk_U2GS_GemEmbedMakeOnce,{
	%% UInt32 宝石ID
	id = 0,
	%% UInt32 绑定宝石个数
	bindCount = 0,
	%% UInt32 非绑定宝石个数
	unBindCount = 0
}).

%% 
%% //宝石拆卸
-define(U2GS_GemEmbedOff,8935).
-record(pk_U2GS_GemEmbedOff,{
	%% UInt64宝石UID
	gemUIDs = []
}).

%% 
%% //宝石镶嵌
-define(U2GS_GemEmbedOn,18955).
-record(pk_U2GS_GemEmbedOn,{
	%% GemEmbedInfo要镶嵌的宝石数据
	gemEmbedInfoList = []
}).

%% 
%% //宝石拆卸
-define(U2GS_GemOperate,26795).
-record(pk_U2GS_GemOperate,{
	%% UInt16 1 : 宝石升级 ； 2： 宝石镶嵌 ； 3：宝石卸载
	opType = 0,
	%% UInt16 装备部位
	equipPos = 0,
	%% Byte 宝石孔位
	gemPos = 0,
	%% UInt64 参数 目前就opType = 2 使用，镶嵌宝石的GUID
	params = 0
}).

%% 
%% // 获取所有头像框
-define(U2GS_GetPortraitFrameList,2024).
-record(pk_U2GS_GetPortraitFrameList,{
}).

%% 
%% //成长装备(荣誉等级)
-define(U2GS_HonorLevel,45460).
-record(pk_U2GS_HonorLevel,{
}).

%% 
%% //锁定物品
-define(U2GS_LockGoods,19361).
-record(pk_U2GS_LockGoods,{
	%% UInt64
	goodsUID = 0,
	%% Byte 背包类型
	bagType = 0
}).

%% 
%% //远程玩家信息查看请求
-define(U2GS_LookRPInfo_Request,11113).
-record(pk_U2GS_LookRPInfo_Request,{
	%% UInt64角色ID
	roleID = 0,
	%% Byte查看远程类型:1角色，2时装，3宠物，4婚姻，5身份证;查看身份证返回GS2U_Identity_Ack
	view_type = 0
}).

%% 
%% // 操作某个头像
-define(U2GS_OperatePortraitFrame,49172).
-record(pk_U2GS_OperatePortraitFrame,{
	%% Byte状态 3.装配 4.取下
	state = 0,
	%% UInt16头像框ID
	id = 0
}).

%% 
%% //玩家扩展信息
-define(U2GS_PlayerExtenInfo,46605).
-record(pk_U2GS_PlayerExtenInfo,{
	%% Byte信息类型1:生日;2:地址;3:星座;4:签名
	type = 0,
	%% String信息
	info = ""
}).

%% 
%% //查看装备信息
-define(U2GS_QueryEquipByUID,49287).
-record(pk_U2GS_QueryEquipByUID,{
	%% UInt64 来源UID
	roleID = 0,
	%% UInt64 装备UID
	equipUID = 0
}).

%% 
%% // 举报其他玩家
-define(U2GS_Report,20182).
-record(pk_U2GS_Report,{
	%% UInt64角色ID
	roleID = 0
}).

%% 
%% //购买某个配置id中的物品
-define(U2GS_RequesBuyID,35814).
-record(pk_U2GS_RequesBuyID,{
	%% Byte
	type = 0,
	%% UInt32
	id = 0
}).

%% 
%% //请求限制标志的配置id
-define(U2GS_RequesForeverLimitID,36018).
-record(pk_U2GS_RequesForeverLimitID,{
	%% Byte
	type = 0
}).

%% 
%% //玩家第一次请求可以兑换的资源，只请求一次，客户端缓存
-define(U2GS_RequestExchangeResource,65142).
-record(pk_U2GS_RequestExchangeResource,{
}).

%% 
%% //请求资源交换中，玩家已经兑换过的终身限兑的配置id
-define(U2GS_RequestExchangeResourceForeverLimitID,37637).
-record(pk_U2GS_RequestExchangeResourceForeverLimitID,{
}).

%% 
%% //资源兑换，只限于装备分解得到的精华值来兑换物品
-define(U2GS_ResourceExchange,39883).
-record(pk_U2GS_ResourceExchange,{
	%% UInt32ID(兑换列表中的Id编号）
	id = 0,
	%% UInt16兑换物品数量
	itemCount = 0,
	%% UInt160为原来的，找回1
	opType = 0
}).

%% 
%% //一键出售装备
-define(U2GS_SellAllEquip,727).
-record(pk_U2GS_SellAllEquip,{
}).

%% 
%% //插入共享装备,支持批量
-define(U2GS_SharedEquip,63085).
-record(pk_U2GS_SharedEquip,{
	%% UInt64装备UID
	equipUIDs = []
}).

%% 
%% //移动物品只能在相应的背包和仓库之间移动，0<=>1, 2<=>3, 0<=>4, 2<=>4, 2<=5
%% //整理物品
-define(U2GS_SortItem,52715).
-record(pk_U2GS_SortItem,{
	%% Byte背包类型
	type = 0
}).

%% 
%% //使用物品
-define(U2GS_UseItem,48980).
-record(pk_U2GS_UseItem,{
	%% UInt64物品UID
	itemUID = 0,
	%% UInt16本次使用个数
	useNum = 0
}).

%% 
%% //使用增加婚姻title的道具
-define(U2GS_UseMarriageTitleItem,51884).
-record(pk_U2GS_UseMarriageTitleItem,{
	%% UInt64物品UID
	itemUID = 0,
	%% UInt16本次使用个数
	useNum = 0,
	%% String附带参数
	text = ""
}).

%% 
-define(U2GS_WashEquip,59079).
-record(pk_U2GS_WashEquip,{
	%% UInt16  
	equipPos = 0,
	%% UInt16 洗的属性
	propID = 0,
	%% Single属性值
	propValue = 0.0,
	%% UInt16
	index = 0
}).

%% 
%% // U2GS上传玩家照片,GS2U初始化玩家照片（约定最大是1w个byte，每个消息里m_data最大是3500个byte)
-define(UpLoadingPhoto,34013).
-record(pk_UpLoadingPhoto,{
	%% Byte类型
	type = 0,
	%% UInt64发给的玩家ID
	roleID = 0,
	%% Byte总段数
	sectionNum = 0,
	%% Byte段的编号
	sectionIndex = 0,
	%% Byte照片数据
	data = []
}).

-record(pk_starCostItem,{
	%% UInt16冲星消耗材料ID
	itemID = 0,
	%% UInt16冲星消耗材料数量	
	itemNum = 0
}).

-record(pk_washReturnItemInfo,{
	%% UInt16商品ID
	itemID = 0,
	%% UInt16
	itemNum = 0
}).

-record(pk_AttackResultList,{
	%% Byte1:击中回血 2:反弹伤害
	type = 0,
	%% UInt32
	value = 0
}).

-record(pk_BeAttack,{
	%% Byte
	camp = 0,
	%% Byte
	pos = 0,
	%% Int32
	hp = 0
}).

%% 
-define(C2S_PlayerUseShiftSkill,36467).
-record(pk_C2S_PlayerUseShiftSkill,{
	%% UInt64
	code = 0,
	%% UInt32
	skillId = 0,
	%% UInt32
	serial = 0,
	%% UInt64
	targetCodeList = [],
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
-define(C2S_PlayerUseSkill,38338).
-record(pk_C2S_PlayerUseSkill,{
	%% UInt64
	code = 0,
	%% UInt64
	skillId = 0,
	%% UInt32
	serial = 0,
	%% UInt64
	targetCodeList = []
}).

%% 
%% //攻击结果技能效果(位移相关效果)
-define(GS2U_AttackOffsetEffect,10740).
-record(pk_GS2U_AttackOffsetEffect,{
	%% UInt64
	userCode = 0,
	%% UInt64
	targetCode = 0,
	%% UInt32
	skillId = 0,
	%% UInt32
	serial = 0,
	%% UInt64
	code = 0,
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
%% //攻击结果消息
-define(GS2U_AttackResult,17141).
-record(pk_GS2U_AttackResult,{
	%% UInt64
	userCode = 0,
	%% UInt64
	targetCode = 0,
	%% UInt32
	skillId = 0,
	%% UInt32
	serial = 0,
	%% UInt32
	result = [],
	%% Byte
	bhp_per = 0,
	%% Byte
	ahp_per = 0,
	%% Int32
	diffHp = 0,
	%% Int32
	damageHp = [],
	%% AttackResultList
	arList = []
}).

%% 
%% // 通知某怪物的攻击速度
-define(GS2U_AttackSpeed,18191).
-record(pk_GS2U_AttackSpeed,{
	%% UInt64怪物的流水号
	code = 0,
	%% Single怪物的攻击速度
	speed = 0.0
}).

%% 
%% // 通知客服端XX请求切磋
-define(GS2U_BattleLearnRequest,17503).
-record(pk_GS2U_BattleLearnRequest,{
	%% UInt64请求切磋玩家Code
	code = 0,
	%% String请求切磋玩家名称
	name = ""
}).

%% 
%% // 通知客服端切磋结果
-define(GS2U_BattleLearnResult,26661).
-record(pk_GS2U_BattleLearnResult,{
	%% UInt64请求切磋玩家Code
	code = 0,
	%% UInt64接受请求切磋玩家Code
	targetCode = 0,
	%% String请求切磋玩家名称
	name = "",
	%% String接受请求切磋玩家名称
	targetName = "",
	%% Byte0:失败 1:胜利 2:平局
	result = 0
}).

%% 
%% // 中断使用技能
-define(GS2U_BreakSkill,51286).
-record(pk_GS2U_BreakSkill,{
	%% UInt64
	userCode = 0,
	%% UInt32
	skillId = 0,
	%% UInt32
	serial = 0
}).

%% 
%% // buff调用技能
-define(GS2U_CallSkill,20695).
-record(pk_GS2U_CallSkill,{
	%% UInt64
	userCode = 0,
	%% UInt32
	skillId = 0
}).

%% 
%% // 载体使用技能
-define(GS2U_CarrierUseSkillToObject,8568).
-record(pk_GS2U_CarrierUseSkillToObject,{
	%% UInt64
	userCode = 0,
	%% UInt32
	skillId = 0,
	%% UInt32
	serial = 0,
	%% UInt64
	targetCodeList = [],
	%% UInt32
	time = 0
}).

%% 
%% //	对象死亡消息
%% // 关于攻击者名字
%% // 优先使用monsterID判断，不为0时读配置表monster
%% // 其次使用serverstringID判断，不为0时读配置表serverstrings
%% // 最后直接使用killerName进行显示
-define(GS2U_Dead,24104).
-record(pk_GS2U_Dead,{
	%% UInt64
	deadActorCode = 0,
	%% UInt64
	killerCode = 0,
	%% String
	killerName = "",
	%% UInt32
	skillID = 0,
	%% UInt16
	monsterID = 0,
	%% UInt32
	serverstringsID = 0
}).

%% 
%% // 关于攻击者名字
%% // 优先使用monsterID判断，不为0时读配置表monster
%% // 其次使用serverstringID判断，不为0时读配置表serverstrings
%% // 最后直接使用killerName进行显示
-define(GS2U_DeadToTeam,14332).
-record(pk_GS2U_DeadToTeam,{
	%% UInt64
	roleID = 0,
	%% UInt64
	killerCode = 0,
	%% String
	killerName = "",
	%% UInt16
	monsterID = 0,
	%% UInt32
	serverstringsID = 0
}).

%% 
%% //	强制对象立即死亡消息
%% // 关于攻击者名字
%% // 优先使用monsterID判断，不为0时读配置表monster
%% // 其次使用serverstringID判断，不为0时读配置表serverstrings
%% // 最后直接使用killerName进行显示
-define(GS2U_ForceDeadNow,52551).
-record(pk_GS2U_ForceDeadNow,{
	%% UInt64
	deadActorCode = 0,
	%% UInt64
	killerCode = 0,
	%% String
	killerName = "",
	%% UInt32
	skillID = 0,
	%% UInt16
	monsterID = 0,
	%% UInt32
	serverstringsID = 0
}).

%% 
%% // 通知客服端是否触发倒计时
-define(GS2U_IsTriggerCountDown,36963).
-record(pk_GS2U_IsTriggerCountDown,{
	%% Byte0:begin 1:end
	flag = 0,
	%% Byte0:结束倒计时 1:触发倒计时
	isTrigger = 0
}).

%% 
%% // 通知某怪物的速度状态
-define(GS2U_MonsterSpeed,37689).
-record(pk_GS2U_MonsterSpeed,{
	%% UInt64怪物的流水号
	code = 0,
	%% Single怪物的移动速度
	speed = 0.0,
	%% Byte怪物的状态：走为0，跑为1
	moveStatus = 0
}).

%% 
%% //战斗结束包
-define(GS2U_ResponseBattleAck,47484).
-record(pk_GS2U_ResponseBattleAck,{
}).

%% 
%% // 服务器响应玩家请求转换PK状态
-define(GS2U_ResponseChangePKMode,31391).
-record(pk_GS2U_ResponseChangePKMode,{
	%% UInt64 收到服务器响应转换PK模式的玩家
	code = 0,
	%% Int32 收到服务器响应的PK模式 -1为错误信息
	pkMode = 0
}).

%% 
%% // 触发技能
-define(GS2U_TriggerSkill,34737).
-record(pk_GS2U_TriggerSkill,{
	%% UInt64
	userCode = 0,
	%% UInt32
	skillId = 0,
	%% UInt64
	targetCode = 0
}).

%% 
-define(GS2U_TrunBattleInitList,20153).
-record(pk_GS2U_TrunBattleInitList,{
	%% TurnBattleInit
	il = []
}).

%% 
-define(GS2U_TrunBattleResultList,28414).
-record(pk_GS2U_TrunBattleResultList,{
	%% TrunBattleResult
	rl = []
}).

%% 
%% // 向对象使用技能
-define(GS2U_UseSkillToObject,48800).
-record(pk_GS2U_UseSkillToObject,{
	%% UInt64
	userCode = 0,
	%% UInt32
	skillId = 0,
	%% UInt32
	serial = 0,
	%% UInt64
	targetCodeList = [],
	%% UInt32
	time = 0
}).

%% 
%% // 向对象使用技能
-define(GS2U_UseSkillToPos,29375).
-record(pk_GS2U_UseSkillToPos,{
	%% UInt64
	userCode = 0,
	%% UInt32
	skillId = 0,
	%% UInt32
	serial = 0,
	%% UInt64
	targetCodeList = [],
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

-record(pk_TrunBattleResult,{
	%% Byte
	camp = 0,
	%% Byte攻击者位置
	pos = 0,
	%% UInt16攻击者技能ID
	id = 0,
	%% Byte攻击回合数
	turn = 0,
	%% BeAttack被攻击者列表	 
	bl = []
}).

-record(pk_TurnBattleInit,{
	%% UInt64战斗角色ID
	id = 0,
	%% Byte战斗角色类型(0:人物,1:宠物,2:怪物)
	type = 0,
	%% Byte战斗阵营(1:友方,左边, 0:敌方,右边)
	camp = 0,
	%% Byte战斗位置(1-6)
	pos = 0,
	%% UInt32战斗血量最大值
	hp = 0
}).

%% 
%% //玩家切磋相关协议
%% // 发送切磋请求
-define(U2GS_BattleLearn,48142).
-record(pk_U2GS_BattleLearn,{
	%% UInt64切磋对象
	code = 0
}).

%% 
%% // 反馈切磋请求结果
-define(U2GS_BattleLearnAck,18083).
-record(pk_U2GS_BattleLearnAck,{
	%% UInt64发送切磋请求对象
	code = 0,
	%% Byte0:拒绝 1：接受
	result = 0
}).

%% 
%% //战斗请求发包
-define(U2GS_RequestBattleAck,64584).
-record(pk_U2GS_RequestBattleAck,{
	%% Byte包数量
	num = 0
}).

%% 
%% //客服端请求结束战斗(发送结算)
-define(U2GS_RequestBattleEnd,30974).
-record(pk_U2GS_RequestBattleEnd,{
	%% Byte0:pve 1:pvp
	type = 0
}).

%% 
%% // 玩家请求转换PK状态
-define(U2GS_RequestChangePKMode,55523).
-record(pk_U2GS_RequestChangePKMode,{
	%% Int32 请求要转换的PK模式
	pkMode = 0
}).

%% 
-define(GS2U_BuffHurt,62410).
-record(pk_GS2U_BuffHurt,{
	%% UInt64目标Code
	code = 0,
	%% UInt64Buff唯一标识符
	buffUID = 0,
	%% UInt32BuffID
	buffID = 0,
	%% Int32Buff伤害血量
	damageHp = 0,
	%% Byte当前血量百分比
	hp_per = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
-define(GS2U_BuffInfo,43249).
-record(pk_GS2U_BuffInfo,{
	%% UInt64目标Code
	code = 0,
	%% UInt64Buff唯一标识符
	buffUID = 0,
	%% UInt32BuffID
	buffID = 0,
	%% UInt32技能ID
	skillID = 0,
	%% UInt32等级
	level = 0,
	%% Byte标记字段 flag = 0 增加 flag = 1 删除 flgo = 2 替换
	flag = 0,
	%% UInt32序列号
	serial = 0,
	%% Int32剩余时间
	endTime = 0
}).

%% 
%% // 购买成功，失败提示code
-define(GS2U_BuyBuffSuccess,5950).
-record(pk_GS2U_BuyBuffSuccess,{
	%% UInt32
	id = 0
}).

%% 
%% // 购买BUFF
-define(U2GS_BuyBuff,15759).
-record(pk_U2GS_BuyBuff,{
	%% UInt32
	id = 0
}).

%% 
-define(U2GS_DelBuff,58064).
-record(pk_U2GS_DelBuff,{
	%% UInt64目标Code
	code = 0,
	%% UInt32BuffID
	buffID = 0
}).

-record(pk_ActivityNum,{
	%% UInt32 '活动ID',
	id = 0,
	%% UInt32 '购买次数',
	claimNum = 0
}).

-record(pk_ActivitySuccessItem,{
	%% Byte 编号
	index = 0,
	%% UInt32 '奖励道具ID',
	itemID = 0,
	%% UInt32 '奖励道具个数',
	num = 0
}).

-record(pk_Business,{
	%% UInt32 '活动ID',
	id = 0,
	%% String平台订单映射ID
	platformItemID = "",
	%% String '活动内容',
	name = "",
	%% String '活动描述',
	des = "",
	%% String '图片MD5',
	pic = "",
	%% Byte '0默认图片，1上传图片',
	picType = 0,
	%% Byte '活动类型，1首冲，2成长基金激活，3成长基金领取，4累冲，5消费返利，6现金礼包，7每日充值，8首登现金特卖',
	activityType = 0,
	%% Byte是否单独计充值 0可被自己、其它0、其它1计入，可计入其它0；1可被自己计入，可计入其它0；2可被自己计入，不可计入其它0
	isAlonePay = 0,
	%% Byte '重置次数，1按天重置，2按周重置，3按月重置',
	resetClaimNumType = 0,
	%% Byte '标签，1稀有，2热卖',
	label = 0,
	%% Single '需要真实货币',
	claimMoney = 0.0,
	%% UInt32 '需要钻石',
	claimGold = 0,
	%% Byte '消费金额类型，限定3和6，即只记录绑定钻石或者钻石',
	claimConsumeType = 0,
	%% UInt32 '消费金额',
	claimConsume = 0,
	%% UInt32 '购买次数限制',
	claimNum = 0,
	%% Byte  '开服基金是否购买',
	claimIsBuy = 0,
	%% Byte  '特权卡限制',
	claimVip = 0,
	%% UInt16 '等级需求',
	claimLevel = 0,
	%% Byte '奖励货币类型',
	rewardCoinType = 0,
	%% UInt32 '奖励货币数量',
	rewardCoinNum = 0,
	%% UInt32 '奖励',
	rewardPackageID = 0,
	%% UInt32 '奖励道具ID',
	item1 = 0,
	%% UInt32 '奖励道具个数',
	num1 = 0,
	%% UInt32 '奖励道具ID',
	item2 = 0,
	%% UInt32 '奖励道具个数',
	num2 = 0,
	%% UInt32 '奖励道具ID',
	item3 = 0,
	%% UInt32 '奖励道具个数',
	num3 = 0,
	%% UInt32 '奖励道具ID',
	item4 = 0,
	%% UInt32 '奖励道具个数',
	num4 = 0,
	%% UInt32 '奖励道具ID',
	item5 = 0,
	%% UInt32 '奖励道具个数',
	num5 = 0,
	%% UInt32 '奖励道具ID',
	item6 = 0,
	%% UInt32 '奖励道具个数',
	num6 = 0,
	%% UInt32 '奖励道具ID',
	item7 = 0,
	%% UInt32 '奖励道具个数',
	num7 = 0,
	%% UInt32 '奖励道具ID',
	item8 = 0,
	%% UInt32 '奖励道具个数',
	num8 = 0,
	%% UInt32 '奖励道具ID',
	item9 = 0,
	%% UInt32 '奖励道具个数',
	num9 = 0,
	%% UInt32 '奖励道具ID',
	item10 = 0,
	%% UInt32 '奖励道具个数',
	num10 = 0,
	%% UInt32 '开始时间',
	startTime = 0,
	%% UInt32 '结束时间',
	endTime = 0,
	%% UInt32 '额外赠送的钻石数',
	giveGold = 0,
	%% Byte '是否计入需要钻石,0:不计入   1:计入',
	isAddClaimGold = 0
}).

-record(pk_BusinessCAInfo,{
	%% UInt32累计连续充值ID
	businessID = 0,
	%% Byte 是否完成,1完成
	isComplete = 0,
	%% Byte 是否领奖,1已领
	isReward = 0,
	%% UInt32 累计充值钻石数量
	rechargeDiamondCount = 0
}).

-record(pk_CoinConsume,{
	%% Byte 货币类型
	coinType = 0,
	%% UInt32 货币值
	value = 0
}).

-record(pk_DialCost,{
	%% UInt32 消耗ID
	id = 0,
	%% String
	des = "",
	%% Byte
	boxType = 0,
	%% Byte
	coinType = 0,
	%% UInt32
	coinNum = 0,
	%% UInt16 抽取次数
	times = 0,
	%% UInt16 增加的幸运值
	addLuckValue = 0,
	%% UInt16
	maxLuck = 0
}).

-record(pk_DialItem,{
	%% Byte转盘类型
	boxType = 0,
	%% Byte格子编号
	index = 0,
	%% UInt32 '奖励道具ID',
	itemID = 0,
	%% UInt32 '奖励道具个数',
	num = 0
}).

-record(pk_DialReward,{
	%% Byte转盘类型
	boxType = 0,
	%% UInt16转动次数
	needTimes = 0,
	%% UInt32奖励道具ID
	itemID1 = 0,
	%% UInt32 奖励道具个数
	num1 = 0,
	%% UInt32奖励道具ID
	itemID2 = 0,
	%% UInt32 奖励道具个数
	num2 = 0,
	%% UInt32奖励道具ID
	itemID3 = 0,
	%% UInt32 奖励道具个数
	num3 = 0
}).

%% 
%% // 累计连续充值情况
-define(GS2U_BusinessCAInfo,48860).
-record(pk_GS2U_BusinessCAInfo,{
	%% BusinessCAInfo
	cas = []
}).

%% 
%% // 商业化内容（上线同步）
-define(GS2U_BusinessInfo,47786).
-record(pk_GS2U_BusinessInfo,{
	%% Business
	lists = []
}).

%% 
%% // 玩家的充值与购买情况（每次请求）
-define(GS2U_BusinessPlayerInfo,42399).
-record(pk_GS2U_BusinessPlayerInfo,{
	%% Byte
	activityType = 0,
	%% Single '充值的真实货币',
	claimMoney = 0.0,
	%% UInt32 '充值的钻石',
	claimGold = 0,
	%% Byte 开服基金是否购买
	claimIsBuy = 0,
	%% CoinConsume '消费金额类型，限定3和6，即只记录绑定钻石或者钻石',
	claimConsume = [],
	%% ActivityNum 活动的购买次数
	claimNum = []
}).

%% 
-define(GS2U_DialCostList,6463).
-record(pk_GS2U_DialCostList,{
	%% DialCost
	costs = []
}).

%% 
-define(GS2U_DialItemList,31813).
-record(pk_GS2U_DialItemList,{
	%% DialItem
	items = []
}).

%% 
-define(GS2U_DialRewardList,55533).
-record(pk_GS2U_DialRewardList,{
	%% DialReward
	rewards = []
}).

%% 
%% // 返回抽奖结果,(U2GS_RequestJqueryrotate与U2GS_RequestGetBox均返回本协议)
-define(GS2U_JqueryrotateResult,49142).
-record(pk_GS2U_JqueryrotateResult,{
	%% Byte 1表示转盘结果，2表示领取宝箱结果
	type = 0,
	%% SelfDialInfo 抽奖后的信息
	info,
	%% DialItem 奖品
	results = []
}).

%% 
%% // 充值成功表现
-define(GS2U_RechargeSuccess,13608).
-record(pk_GS2U_RechargeSuccess,{
	%% UInt32 '活动ID',
	id = 0,
	%% Byte
	activityType = 0,
	%% UInt32 '充值的钻石',
	claimGold = 0,
	%% Single '充值的真实货币',
	claimMoney = 0.0,
	%% CoinConsume 获得的货币奖励
	coins = [],
	%% ActivitySuccessItem 获得的道具奖励
	items = []
}).

%% 
%% // 个人信息
-define(GS2U_SelfDialInfo,774).
-record(pk_GS2U_SelfDialInfo,{
	%% SelfDialInfo
	infos = []
}).

-record(pk_SelfDialInfo,{
	%% Byte转盘类型
	boxType = 0,
	%% UInt16转动次数
	haveTimes = 0,
	%% UInt16领取到的次数
	getTimes = [],
	%% UInt16拥有幸运值
	haveLuck = 0
}).

%% 
%% // 请求商业化内容
-define(U2GS_RequestBusinessInfo,19255).
-record(pk_U2GS_RequestBusinessInfo,{
	%% Byte
	activityType = 0
}).

%% 
%% // 请求领宝箱
-define(U2GS_RequestGetBox,54102).
-record(pk_U2GS_RequestGetBox,{
	%% Byte转盘类型
	boxType = 0,
	%% UInt16领取哪个次数对应的宝箱
	getTimes = 0
}).

%% 
%% // 请求领取
-define(U2GS_RequestGetGift,10549).
-record(pk_U2GS_RequestGetGift,{
	%% UInt32 '活动ID',
	id = 0
}).

%% 
%% // 请求转转转
-define(U2GS_RequestJqueryrotate,49006).
-record(pk_U2GS_RequestJqueryrotate,{
	%% Byte转盘类型
	boxType = 0,
	%% UInt32 消耗ID
	id = 0
}).

%% 
%% // 请求自己的转盘信息(打开转盘)
-define(U2GS_RequestSelfDialInfo,37779).
-record(pk_U2GS_RequestSelfDialInfo,{
}).

-record(pk_CompanionMember,{
	%% UInt64 角色唯一ID
	roleid = 0,
	%% String 姓名
	name = "",
	%% UInt16 等级
	lvl = 0,
	%% Byte 关系，0目标，1自己，9队长
	relation = 0,
	%% UInt32 今日当前活跃
	cur_lively = 0,
	%% UInt32 今日最大活跃
	max_lively = 0,
	%% UInt32 本周累计活跃
	all_lively = 0,
	%% UInt64 离线时间（秒），为0表示在线
	offlinetime = 0,
	%% Boolean是否达到在线时长
	onlineTimeEnough = false,
	%% Byte姿势
	styleID = 0,
	%% UInt16所在地图id
	mapID = 0,
	%% UInt32职业
	career = 0,
	%% Byte种族
	race = 0,
	%% Byte性别
	sex = 0,
	%% UInt32
	head = 0
}).

%% 
%% // 邀请灵魂到这身边（我广播给我的伙伴）
-define(GS2U_InviteFriendToMe,31926).
-record(pk_GS2U_InviteFriendToMe,{
	%% UInt64 传送到目标的roleid
	inviteRoleID = 0,
	%% String邀请者name
	inviteName = "",
	%% UInt32
	mapID = 0,
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
%% // 接收到某灵魂队长的邀请
-define(GS2U_RecvInviteFriend,21357).
-record(pk_GS2U_RecvInviteFriend,{
	%% String 邀请者的姓名
	name = "",
	%% UInt64 邀请者的灵魂团队唯一ID
	companionID = 0
}).

%% 
%% // 返回灵魂成员信息
-define(GS2U_RequestCompanion,17921).
-record(pk_GS2U_RequestCompanion,{
	%% CompanionMember 成员列表（为空则表示该玩家还没有灵魂伙伴团队）
	members = [],
	%% UInt16 最大成员数量
	max_member = 0,
	%% UInt16增益效果等级
	profileLevel = 0
}).

%% 
%% // 请求传到角色身边
-define(GS2U_ToTargetFriendAck,28279).
-record(pk_GS2U_ToTargetFriendAck,{
	%% UInt32
	mapID = 0,
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
%% // 处理被邀请的消息
-define(U2GS_AgreeInvite,27243).
-record(pk_U2GS_AgreeInvite,{
	%% UInt64 邀请者的灵魂团队唯一ID
	companionID = 0,
	%% Boolean 是否同意，true同意，false拒绝
	isAgree = false
}).

%% 
%% // 切换姿势
-define(U2GS_ChangePoseID,43114).
-record(pk_U2GS_ChangePoseID,{
	%% UInt16姿势id
	poseID = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 请求创建灵魂队伍
-define(U2GS_CreateCompanion,3702).
-record(pk_U2GS_CreateCompanion,{
}).

%% 
%% // 退出或解散灵魂伙伴（成员为退出，队长为解散）
-define(U2GS_ExitCompanion,65476).
-record(pk_U2GS_ExitCompanion,{
}).

%% 
%% // 邀请在线好友进入我的灵魂团队（邀请成功，会重新发一遍所有灵魂成员信息给你）
-define(U2GS_InviteFriend,8261).
-record(pk_U2GS_InviteFriend,{
	%% UInt64 邀请目标的roleid
	target_roleid = 0
}).

%% 
%% //邀请灵魂到我身边
-define(U2GS_InviteToMe,9254).
-record(pk_U2GS_InviteToMe,{
}).

%% 
%% // 驱逐伙伴（驱逐成功，会重新发一遍所有灵魂成员信息给你）
-define(U2GS_KickCompanion,1636).
-record(pk_U2GS_KickCompanion,{
	%% UInt64 角色唯一ID
	target_roleid = 0
}).

%% 
%% // 请求灵魂团队信息
-define(U2GS_RequestCompanion,1747).
-record(pk_U2GS_RequestCompanion,{
}).

%% 
%% // 请求传到角色身边
-define(U2GS_ToTargetFriend,43532).
-record(pk_U2GS_ToTargetFriend,{
	%% UInt64 传送到目标的roleid
	target_roleid = 0
}).

%% 
%% // 伙伴对我的邀请结果
-define(U2GS_ToTargetFriendResult,29321).
-record(pk_U2GS_ToTargetFriendResult,{
	%% UInt64 传送到目标的roleid
	inviteRoleID = 0,
	%% Boolean是否赶来
	comming = false
}).

%% 
%% // 激活军团副本
-define(ActiveGuildCopy,35198).
-record(pk_ActiveGuildCopy,{
	%% UInt32 激活哪个副本
	mapID = 0
}).

-record(pk_BossRankInfo,{
	%% String 名称
	name = "",
	%% UInt64 伤害值
	hurt = 0
}).

-record(pk_CopyMapRankInfo,{
	%% UInt32
	copyMapID = 0,
	%% UInt16
	star = 0,
	%% CopyRankTeamInfo
	teamList = []
}).

-record(pk_CopyRankTeamInfo,{
	%% Single
	diffTime = 0.0,
	%% UInt32
	time = 0,
	%% Int16
	rankPos = 0,
	%% CopyRankTeamMemberInfo
	leader,
	%% CopyRankTeamMemberInfo
	membersList = []
}).

-record(pk_CopyRankTeamMemberInfo,{
	%% UInt64
	roleID = 0,
	%% String
	roleName = ""
}).

-record(pk_DevilCopyMapStarInfo,{
	%% UInt32配置表中的instance_group
	instanceGroup = 0,
	%% UInt16
	star = 0
}).

%% 
%% // BOSS战排行结果
-define(GS2U_BossBattleRankResult,11166).
-record(pk_GS2U_BossBattleRankResult,{
	%% UInt32 当前BOSSID
	curBossID = 0,
	%% UInt32 当前个人领取该boss奖励剩余次数
	curPLeftTime = 0,
	%% UInt32 当前公会领取该boss奖励剩余次数
	curGLeftTime = 0,
	%% UInt32 当前排名
	curRankNum = 0,
	%% UInt32 当前排名
	curGuildRankNum = 0,
	%% BossRankInfo
	rankList = [],
	%% BossRankInfo
	guildrankList = []
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // BOSS战开启或关闭
-define(GS2U_BossBattleState,34660).
-record(pk_GS2U_BossBattleState,{
	%% Byte 0: 关闭 1: 开始
	flag = 0,
	%% UInt32 地图id
	mapID = 0
}).

%% 
-define(GS2U_ChapterInfo,14311).
-record(pk_GS2U_ChapterInfo,{
	%% chapterInfo 关卡
	chapter
}).

%% 
%% // 副本剩余时间
-define(GS2U_CopyMapLeftTime,19024).
-record(pk_GS2U_CopyMapLeftTime,{
	%% UInt16地图ID
	mapID = 0,
	%% UInt32剩余时间(毫秒)
	leftTimeMs = 0
}).

%% 
%% //  播放动画
-define(GS2U_CopyMapSchedulePlayAnimation,29214).
-record(pk_GS2U_CopyMapSchedulePlayAnimation,{
	%% UInt16地图ID
	mapID = 0,
	%% UInt32进度
	schedule = 0,
	%% UInt32动画ID 
	animationID = 0
}).

%% 
%% //  播放字幕
-define(GS2U_CopyMapSchedulePlayCharacter,21999).
-record(pk_GS2U_CopyMapSchedulePlayCharacter,{
	%% UInt16地图ID
	mapID = 0,
	%% UInt32进度
	schedule = 0,
	%% UInt32字幕ID列表
	characterIDs = []
}).

%% 
%% // 特殊关卡
-define(GS2U_CopySpecialSchedule,62371).
-record(pk_GS2U_CopySpecialSchedule,{
	%% UInt16
	mapID = 0,
	%% UInt16
	schedule = 0,
	%% UInt64
	code = 0
}).

%% 
%% //  挑战副本排行榜
-define(GS2U_DevilCopyMapRankList,40789).
-record(pk_GS2U_DevilCopyMapRankList,{
	%% UInt32配置表中的instance_group
	instanceGroup = 0,
	%% CopyMapRankInfo
	rankList = []
}).

%% 
%% //  挑战副本星级列表
-define(GS2U_DevilCopyMapStarList,48227).
-record(pk_GS2U_DevilCopyMapStarList,{
	%% DevilCopyMapStarInfo
	starList = []
}).

%% 
%% // 服务器同步节日副本的时间信息
-define(GS2U_FestivalTimeInfo,55483).
-record(pk_GS2U_FestivalTimeInfo,{
	%% OneFestivalTimeInfo
	timeinfo = []
}).

%% 
%% // 军团副本是开启还是关闭的
-define(GS2U_IsGuildCopyOpen,2956).
-record(pk_GS2U_IsGuildCopyOpen,{
	%% Boolean true: 开启，false: 关闭
	flag = false,
	%% UInt64 军团副本最晚结束时间
	time = 0
}).

%% 
-define(GS2U_MaterialInfo,30421).
-record(pk_GS2U_MaterialInfo,{
	%% UInt16哪个副本
	mapID = 0,
	%% UInt32结束时间
	leftSeconds = 0,
	%% chapterInfo 关卡
	chapter,
	%% towerInfo 塔的数据	
	towerList = []
}).

%% 
%% // 金币副本同步信息
-define(GS2U_MoneyDungeonInfo,44024).
-record(pk_GS2U_MoneyDungeonInfo,{
	%% UInt32 结束时间(秒)
	leftSeconds = 0,
	%% UInt16 最大关卡
	maxChapter = 0,
	%% UInt16 当前关卡（从1开始）
	curChapter = 0,
	%% UInt16 当前关卡的怪物种类
	listMonsterID = [],
	%% Byte 对应listMonsterID的最大数量
	listMonsterCountMax = [],
	%% Byte 对应listMonsterID的已杀掉的数量
	listMonsterCountKill = [],
	%% Byte 当前关卡还有多少怪没刷出来
	curLeftCount = 0
}).

%% 
%% // 同步上一次军团副本结束时间
-define(GS2U_SendGuildCopyOpenTime,1091).
-record(pk_GS2U_SendGuildCopyOpenTime,{
	%% UInt64 绝对时间
	time = 0
}).

%% 
%% // 灵界活动心跳
-define(GS2U_SpiritArea_Tick_Sync,4640).
-record(pk_GS2U_SpiritArea_Tick_Sync,{
	%% UInt32 当前状态剩余时间
	time = 0,
	%% UInt32 活动剩余总时间
	timeAll = 0,
	%% Byte 当前波次，为0时表示开始前等待
	wave = 0,
	%% Byte 0波次间隔等待；1波次进行中
	state = 0,
	%% Boolean 是否处于助战状态
	isAssist = false
}).

%% 
%% // 灵界活动（器灵材料副本、原初灵界）通知客户端调用觉醒技能
%% // 不能服务端直接调用，因为需要客户端额外表现
-define(GS2U_SpiritArea_Wake_Sync,46157).
-record(pk_GS2U_SpiritArea_Wake_Sync,{
	%% UInt32
	skillID = 0
}).

%% 
-define(GS2U_TowerInfo,5047).
-record(pk_GS2U_TowerInfo,{
	%% towerInfo
	info
}).

%% 
%% // 更新某个挑战副本的星级
-define(GS2U_UpdateDevilCopyMapStar,34634).
-record(pk_GS2U_UpdateDevilCopyMapStar,{
	%% DevilCopyMapStarInfo
	starInfo
}).

-record(pk_OneFestivalTimeInfo,{
	%% UInt32 活动ID
	festivalID = 0,
	%% UInt32 活动开始时间
	startTime = 0,
	%% UInt32 活动结束时间
	endTime = 0
}).

%% 
%% // 购买副本多倍奖励
-define(U2GS2U_BuyCopyReward,56771).
-record(pk_U2GS2U_BuyCopyReward,{
	%% UInt32 挑战本是9
	mapSubType = 0
}).

%% 
%% // 副本进度之对话进度（show2）
%% // 客户端在对话完成后主动请求完成进度
%% // 服务端在收到客户端请求验证通过后，或者已存在的show2事件超时后，对地图内所有玩家推送该消息
-define(U2GS2U_CopyMapScheduleShow2,12790).
-record(pk_U2GS2U_CopyMapScheduleShow2,{
	%% UInt16 所在地图ID
	mapID = 0,
	%% UInt16 对应show2ID
	show2ID = 0,
	%% UInt64 所在分组ID
	groupID = 0,
	%% UInt32 所处进度ID（对应配置copymapScheduleInit或copymapScheduleSettle的id）
	scheduleID = 0,
	%% Boolean true对应copymapScheduleInit;false对应copymapScheduleSettle
	isInit = false
}).

%% 
%% // 购买节日礼包
-define(U2GS_BuyFestivalPacket,28).
-record(pk_U2GS_BuyFestivalPacket,{
	%% UInt32
	festivalID = 0,
	%% UInt32 礼包ID
	packetID = 0,
	%% UInt32 购买的数量
	buynum = 0
}).

%% 
%% // 动画播放结束
-define(U2GS_CopyMapSchedulePlayAnimationOver,13404).
-record(pk_U2GS_CopyMapSchedulePlayAnimationOver,{
	%% UInt32动画ID 
	animationID = 0
}).

%% 
%% // 字幕播放结束
-define(U2GS_CopyMapSchedulePlayCharacterOver,445).
-record(pk_U2GS_CopyMapSchedulePlayCharacterOver,{
	%% UInt32进度
	schedule = 0
}).

%% 
%% // 请求进入BOSS战位面
-define(U2GS_EnterBossBattle,17919).
-record(pk_U2GS_EnterBossBattle,{
}).

%% 
%% // 选择进入节日副本
-define(U2GS_EnterFestivalCopy,35907).
-record(pk_U2GS_EnterFestivalCopy,{
	%% UInt32 活动ID
	festivalID = 0,
	%% Byte 1表示进普通副本 2表示进boss副本
	type = 0
}).

%% 
%% // 进入军团副本
-define(U2GS_EnterGuildCopy,29950).
-record(pk_U2GS_EnterGuildCopy,{
	%% UInt32 进入哪个副本
	mapID = 0
}).

%% 
%% // 继续循环刷本，队长才有效
-define(U2GS_GoonCopyMap,38214).
-record(pk_U2GS_GoonCopyMap,{
	%% UInt16
	mapID = 0
}).

%% 
%% // 金币副本放弃游戏请求
-define(U2GS_MoneyDungeonGiveup,30988).
-record(pk_U2GS_MoneyDungeonGiveup,{
}).

%% 
%% // 金币副本手动刷下一波的请求
-define(U2GS_MoneyDungeonNext,41847).
-record(pk_U2GS_MoneyDungeonNext,{
}).

%% 
%% // 查询副本排行榜
-define(U2GS_QueryDevilCopyMapRankList,25584).
-record(pk_U2GS_QueryDevilCopyMapRankList,{
	%% UInt32配置表中的instance_group
	instanceGroup = 0
}).

%% 
%% // 查询挑战副本星级
-define(U2GS_QueryDevilCopyMapStarList,33021).
-record(pk_U2GS_QueryDevilCopyMapStarList,{
}).

%% 
%% // 低级副本扫荡（请求扫荡）
-define(U2GS_RequestAutoDeal,37044).
-record(pk_U2GS_RequestAutoDeal,{
	%% UInt16 扫哪个副本
	mapID = 0
}).

%% 
%% // 基础信息
-define(U2GS_RequestMaterialInfo,1890).
-record(pk_U2GS_RequestMaterialInfo,{
	%% UInt16哪个副本
	mapID = 0
}).

%% 
-define(U2GS_UpTower,33676).
-record(pk_U2GS_UpTower,{
	%% UInt32 ID
	dataID = 0,
	%% UInt32 类型
	type = 0
}).

%% 
-define(U2GS_startNextChapter,5738).
-record(pk_U2GS_startNextChapter,{
}).

%% 
%% // 同步家族对boss的伤害
-define(UpdataGuildHurtToBoss,9953).
-record(pk_UpdataGuildHurtToBoss,{
	%% UInt64 伤害值
	hurt = 0
}).

%% 
%% // 同步自己对boss的伤害
-define(UpdataHurtToBoss,51188).
-record(pk_UpdataHurtToBoss,{
	%% UInt64 伤害值
	hurt = 0
}).

-record(pk_chapterInfo,{
	%% UInt32下一局自动开始时间
	nextChapterSeconds = 0,
	%% UInt16hc
	headCount = 0,
	%% UInt16最大关卡
	maxChapter = 0,
	%% UInt16当前关卡
	curChapter = 0,
	%% UInt16怪物总数
	curChapterMonsterMax = 0,
	%% UInt16怪物击杀数+到达终点的数量
	curChapterMonsterKilled = 0,
	%% UInt16地图怪物总数
	mapMonterMax = 0,
	%% UInt32魔力值
	materialVal = 0
}).

-record(pk_towerInfo,{
	%% UInt32 id
	dataID = 0,
	%% UInt32 类型
	type = 0,
	%% UInt32 等级
	level = 0
}).

-record(pk_FashionInfo,{
	%% UInt32 时装ID
	fashionID = 0,
	%% UInt32 剩余时间 小于等于0：过期 大于0：对应的秒数
	time = 0
}).

%% 
%% // 激活套装列表
-define(GS2U_ActiveFashionSuitList,27729).
-record(pk_GS2U_ActiveFashionSuitList,{
	%% UInt32 已经激活的套装列表
	activeFashionSuitList = []
}).

%% 
-define(GS2U_FashionGiftAck,61261).
-record(pk_GS2U_FashionGiftAck,{
	%% getFashionGiftAck
	getFashionGiftAckList = []
}).

%% 
%% // 返回时装列表
-define(GS2U_FashionList,27234).
-record(pk_GS2U_FashionList,{
	%% FashionInfo
	datas = []
}).

%% 
%% // 时装操作结果
-define(GS2U_FashionResult,58357).
-record(pk_GS2U_FashionResult,{
	%% UInt32 时装ID
	fashionID = 0,
	%% Byte 0: 购买 1：穿戴 2：卸载
	type = 0,
	%% UInt32 0: 失败 非0: 成功 购买成功则为对应的购买时间
	value = 0
}).

%% 
%% // 衣帽间升级成功
-define(GS2U_FashionRoomLevelUp,62056).
-record(pk_GS2U_FashionRoomLevelUp,{
	%% UInt32
	roomLevel = 0
}).

%% 
%% // 激活套装
-define(U2GS_ActiveFashionSuit,1581).
-record(pk_U2GS_ActiveFashionSuit,{
	%% Boolean 0:卸载   非0：穿戴
	flag = false,
	%% UInt32 激活套装ID
	fashionSuitID = 0
}).

%% 
%% // 购买时装
-define(U2GS_BuyFashion,46000).
-record(pk_U2GS_BuyFashion,{
	%% UInt16 道具ID
	itemID = 0,
	%% UInt32 时装ID
	fashionID = 0,
	%% UInt32 购买时间, 0: 永久 > 0：时限时装 单位：秒
	time = 0,
	%% Byte（废弃）
	type = 0
}).

%% 
%% //时装购买/赠送请求
-define(U2GS_FashionBuyRequest,9628).
-record(pk_U2GS_FashionBuyRequest,{
	%% Int32活动的ID
	id = 0,
	%% Int32性别
	sex = 0,
	%% UInt32道具ID
	itemid = 0,
	%% UInt640,给自己， 否则给其他人买
	tarRoleID = 0,
	%% String赠送语
	give = ""
}).

%% 
%% // 衣帽间升级
-define(U2GS_FashionRoomLevelUp,53770).
-record(pk_U2GS_FashionRoomLevelUp,{
}).

%% 
%% //致谢赠送者
-define(U2GS_FashionThanksMail,61470).
-record(pk_U2GS_FashionThanksMail,{
	%% String被赠送者角色名
	beGiveName = "",
	%% String赠送者的角色名
	giveName = "",
	%% UInt64赠送者的角色ID
	giveRole = 0
}).

%% 
%% // 时装可是标示， 用二进制标示 第一位：衣服 第二位：副手 最后一位：衣服
-define(U2GS_IsDisplayFashion,13094).
-record(pk_U2GS_IsDisplayFashion,{
	%% SByte 0: 不显示  1：显示
	flag = 0
}).

%% 
%% // 穿卸时装
-define(U2GS_OperateFashion,26846).
-record(pk_U2GS_OperateFashion,{
	%% UInt32 时装ID
	fashionID = 0,
	%% Boolean 0:卸载   非0：穿戴
	flag = false
}).

-record(pk_getFashionGiftAck,{
	%% UInt32时装ID
	fashionID = 0,
	%% UInt32道具ID
	itemid = 0,
	%% UInt64赠送者的角色ID
	giveRole = 0,
	%% String赠送者的角色名
	giveName = "",
	%% String赠送语
	give = ""
}).

-record(pk_Conditions,{
	%% UInt32线索ID
	cluesID = 0,
	%% Boolean是否完成
	condComplete = false
}).

-record(pk_FloatingAward,{
	%% UInt32碎片ID
	pieceID = 0,
	%% Boolean是否领取
	isGeted = false
}).

%% 
%% // 奖励列表   登录会发，完成一个碎片会发
-define(GS2U_FloatingAward,48971).
-record(pk_GS2U_FloatingAward,{
	%% FloatingAward奖励列表
	rewardList = []
}).

%% 
%% // 漂浮进度  登录发，完成一个线索会发
-define(GS2U_FloatingSchedule,37961).
-record(pk_GS2U_FloatingSchedule,{
	%% UInt32最后一个线索ID
	lastcluesID = 0,
	%% Boolean是否登录初始化
	isInit = false,
	%% Conditions每个线索的条件列表
	condList = []
}).

%% 
%% // 领取奖励结果
-define(GS2U_ReceiveFloatingAward,33120).
-record(pk_GS2U_ReceiveFloatingAward,{
	%% Boolean是否领取成功
	isSuccss = false,
	%% FloatingAward奖励
	reward
}).

%% 
%% // 领取奖励
-define(U2GS_RequestFloatingAward,31970).
-record(pk_U2GS_RequestFloatingAward,{
	%% UInt32碎片ID
	pieceID = 0
}).

-record(pk_Friend2GetBackInfo,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt64 战力值
	force = 0,
	%% Byte 自定义头像MD5(16byte)
	face = []
}).

-record(pk_Friend2InfoBase,{
	%% Friend2InfoSimple
	simple,
	%% UInt64 对象唯一码，不在线时为0
	code = 0,
	%% Byte 自定义头像MD5(16byte)
	face = [],
	%% Byte VIP等级
	vipLv = 0,
	%% String 家族名
	familyName = "",
	%% UInt64 战力值
	force = 0,
	%% UInt32 达成指定关系的时间
	timeRelation = 0,
	%% UInt32 最后一次在线的时间
	timeLastOnline = 0,
	%% UInt32 最后一次交互的时间
	timeLastInteractive = 0,
	%% UInt32 赞
	like = 0,
	%% UInt32 魅力
	charm = 0,
	%% Boolean 当日是否向该好友点赞
	isGiveLike = false,
	%% Boolean 当日该好友是否给我点赞
	isBeGiveLike = false,
	%% Boolean 是否已婚
	isMarried = false,
	%% Single 距离
	distance = 0.0
}).

-record(pk_Friend2InfoCross,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = "",
	%% String 所在服名
	server = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% Byte 自定义头像MD5(16byte)
	face = [],
	%% UInt32 达成指定关系的时间
	timeRelation = 0,
	%% UInt32 最后一次在线的时间
	timeLastOnline = 0,
	%% UInt32 最后一次交互的时间
	timeLastInteractive = 0,
	%% Byte 0不在线 1在普通服 2在跨服
	whereis = 0
}).

-record(pk_Friend2InfoFormal,{
	%% Friend2InfoBase 基础信息
	base,
	%% UInt32 亲密度（友好度）
	closeness = 0,
	%% Boolean 当日是否向该好友赠送了行动点（体力值）
	isGiveAP = false,
	%% Boolean 当日是否从该好友接受了行动点（体力值）
	isGainAP = false,
	%% Boolean 当日该好友是否赠送给我了行动点（体力值）
	isBeGiveAP = false,
	%% Boolean 当日该好友是否接受了我的行动点（体力值）
	isBeGainAP = false
}).

-record(pk_Friend2InfoSimple,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0
}).

%% 
%% // 需要添加的好友在黑名单中
%% // 服务端询问客户端是否要将该角色从黑名单移除
-define(GS2U_Friend2AddFromBlack_Ask,4034).
-record(pk_GS2U_Friend2AddFromBlack_Ask,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = ""
}).

%% 
%% // 同步好友申请列表_重置
-define(GS2U_Friend2ApplicantReset_Sync,5669).
-record(pk_GS2U_Friend2ApplicantReset_Sync,{
	%% UInt16 申请者总量
	count = 0,
	%% Byte 当前信息页码
	page = 0,
	%% Friend2InfoBase 当前页信息列表
	listInfo = []
}).

%% 
%% // 将要加入黑名单的人是好友
%% // 服务端询问客户端是否要将与该好友解除关系
-define(GS2U_Friend2BanFromFormal_Ask,3598).
-record(pk_GS2U_Friend2BanFromFormal_Ask,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = ""
}).

%% 
%% // 服务端询问客户端是否将最早的黑名单移除，并与指定角色解除好友关系再将其拉黑
%% // 黑名单满的情况下拉黑好友
-define(GS2U_Friend2BanWithUnbanAndDel_Ask,9003).
-record(pk_GS2U_Friend2BanWithUnbanAndDel_Ask,{
	%% UInt64 角色ID 需要移除黑名单
	idUnban = 0,
	%% String 姓名   需要移除黑名单
	nameUnban = "",
	%% UInt64 角色ID 需要删除并拉黑的好友
	idDel = 0,
	%% String 姓名   需要删除并拉黑的好友
	nameDel = ""
}).

%% 
%% // 黑名单已达上限
%% // 服务端询问客户端是否要将最早的黑名单移除
-define(GS2U_Friend2BanWithUnban_Ask,34263).
-record(pk_GS2U_Friend2BanWithUnban_Ask,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = ""
}).

%% 
%% // 同步黑名单列表_重置
-define(GS2U_Friend2BlackReset_Sync,23862).
-record(pk_GS2U_Friend2BlackReset_Sync,{
	%% UInt16 黑名单总量
	count = 0,
	%% Byte 当前信息页码
	page = 0,
	%% Friend2InfoBase 当前页信息列表
	listInfo = []
}).

%% 
%% // 友好度变动提示
-define(GS2U_Friend2ClosenessChange_Sync,26867).
-record(pk_GS2U_Friend2ClosenessChange_Sync,{
	%% UInt64 角色ID
	id = 0,
	%% UInt32 当前友好度
	closeness = 0
}).

%% 
%% // 拒绝跨服好友申请，或同意跨服好友申请却失败时，仅向B反馈跨服申请者列表变化
-define(GS2U_Friend2CrossAdd2Failed_Ack,35704).
-record(pk_GS2U_Friend2CrossAdd2Failed_Ack,{
	%% UInt32 6130拒绝成功 6127已经是好友 6131好友列表满 6132对方好友列表满 6133同步数据校正
	reason = 0,
	%% UInt64
	listDel = []
}).

%% 
%% // 同意跨服好友申请并成功时，向双方反馈跨服好友列表变化（B需要自行处理跨服申请者列表变化）
-define(GS2U_Friend2CrossAdd2_Ack,46911).
-record(pk_GS2U_Friend2CrossAdd2_Ack,{
	%% Friend2InfoCross A会收到B的信息，B会收到A的信息
	info
}).

%% 
%% // ErrorCode反馈A申请成功
%% // 向B推送跨服申请者列表变化
-define(GS2U_Friend2CrossAdd_Sync,12497).
-record(pk_GS2U_Friend2CrossAdd_Sync,{
	%% Friend2InfoCross 新的申请者信息
	info,
	%% UInt64 因为列表长度限制需要删除的申请者ID
	listDel = []
}).

%% 
%% // 反馈完整的列表
-define(GS2U_Friend2CrossAll_Sync,15409).
-record(pk_GS2U_Friend2CrossAll_Sync,{
	%% Byte 0跨服好友列表 1跨服申请者列表
	type = 0,
	%% Friend2InfoCross 全列表
	listAll = []
}).

%% 
%% // 反馈删除成功
-define(GS2U_Friend2CrossDel_Ack,25297).
-record(pk_GS2U_Friend2CrossDel_Ack,{
	%% UInt64 角色ID
	id = 0,
	%% Boolean 是否是数据同步校正（非用户主动操作）
	isFix = false
}).

%% 
%% // 上线（登录跨服或登录普通服）时同步跨服好友列表与跨服申请者列表
-define(GS2U_Friend2CrossInit_Sync,46970).
-record(pk_GS2U_Friend2CrossInit_Sync,{
	%% Friend2InfoCross 跨服好友列表
	listCross = [],
	%% Friend2InfoCross 跨服申请者列表
	listApply = []
}).

%% 
%% // 查看信息面板辅助信息反馈
-define(GS2U_Friend2ForLook_Ack,40418).
-record(pk_GS2U_Friend2ForLook_Ack,{
	%% UInt64 角色ID
	id = 0,
	%% String 角色名
	name = "",
	%% Byte 0正式好友1临时好友2黑名单3申请列表4陌生人5跨服好友
	relation = 0,
	%% UInt32 收到的赞
	like = 0,
	%% Boolean 是否已点赞
	isGiveLike = false,
	%% UInt16 等级
	level = 0,
	%% UInt32 魅力值
	charm = 0
}).

%% 
%% // 好友语音反馈给接收方（S2C）
-define(GS2U_Friend2FormalChatVoice_AckR,3301).
-record(pk_GS2U_Friend2FormalChatVoice_AckR,{
	%% UInt64 发送者角色ID
	senderID = 0,
	%% UInt64 接受者角色ID
	receiverID = 0,
	%% UInt32 时间戳
	time = 0,
	%% Single 音频总时长
	duration = 0.0,
	%% Byte 消息段数
	count = 0,
	%% Byte 分段索引
	index = 0,
	%% Byte 音频数据
	data = [],
	%% Byte 双方关系
	relation = 0
}).

%% 
%% // 好友语音反馈给发送方（S2C）
-define(GS2U_Friend2FormalChatVoice_AckS,5138).
-record(pk_GS2U_Friend2FormalChatVoice_AckS,{
	%% UInt64 发送者角色ID
	senderID = 0,
	%% UInt64 接受者角色ID
	receiverID = 0,
	%% UInt32 时间戳
	time = 0
}).

%% 
%% // 好友消息反馈（S2C） <-
-define(GS2U_Friend2FormalChat_Ack,20057).
-record(pk_GS2U_Friend2FormalChat_Ack,{
	%% UInt64 发送者角色ID
	senderID = 0,
	%% UInt64 接受者角色ID
	receiverID = 0,
	%% UInt32 时间戳
	time = 0,
	%% String 内容
	content = "",
	%% Byte 双方关系
	relation = 0
}).

%% 
%% // 同步好友列表（按求婚界面要求排序）
-define(GS2U_Friend2FormalForMarriage_Sync,16418).
-record(pk_GS2U_Friend2FormalForMarriage_Sync,{
	%% UInt16 好友总量
	count = 0,
	%% Boolean 是否有未领取的行动点（体力值）
	hasAP = false,
	%% Byte 当前信息页码
	page = 0,
	%% Friend2InfoFormal 当前页信息列表
	listInfo = []
}).

%% 
%% // 同步好友列表_重置
-define(GS2U_Friend2FormalReset_Sync,35374).
-record(pk_GS2U_Friend2FormalReset_Sync,{
	%% UInt16 好友总量
	count = 0,
	%% Boolean 是否有未领取的行动点（体力值）
	hasAP = false,
	%% Byte 当前信息页码
	page = 0,
	%% Friend2InfoFormal 当前页信息列表
	listInfo = []
}).

%% 
%% // 添加一个好友返回
-define(GS2U_Friend2GetBack_AddRet,54190).
-record(pk_GS2U_Friend2GetBack_AddRet,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% // 忽略该好友返回
-define(GS2U_Friend2GetBack_IgnoreRet,39877).
-record(pk_GS2U_Friend2GetBack_IgnoreRet,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% // 进游戏的时候会发 U2GS_Friend2GetBack_OneKeyToAdd后也会发
-define(GS2U_Friend2GetBack_SyncInfo,17555).
-record(pk_GS2U_Friend2GetBack_SyncInfo,{
	%% Friend2GetBackInfo
	getBackList = []
}).

%% 
%% // 双方结为好友的专用协议
-define(GS2U_Friend2MakeFormal_Sync,34421).
-record(pk_GS2U_Friend2MakeFormal_Sync,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% // 反馈推荐好友
-define(GS2U_Friend2Recommend_Ack,59890).
-record(pk_GS2U_Friend2Recommend_Ack,{
	%% Friend2InfoBase 推荐名单
	listInfo = [],
	%% Boolean 是否是定时推送推荐好友
	isPush = false
}).

%% 
%% // 反馈搜索好友
-define(GS2U_Friend2Search_Ack,487).
-record(pk_GS2U_Friend2Search_Ack,{
	%% Friend2InfoBase 搜索结果
	listInfo = []
}).

%% 
%% // 反馈精简的角色信息列表
-define(GS2U_Friend2SimpleList_Ack,758).
-record(pk_GS2U_Friend2SimpleList_Ack,{
	%% Byte 0正式好友1临时好友2黑名单3申请列表
	type = 0,
	%% UInt16 信息总量
	count = 0,
	%% UInt16 当前消息包索引号
	index = 0,
	%% Friend2InfoSimple 信息
	listInfo = []
}).

%% 
%% // 同步临时好友列表_重置
-define(GS2U_Friend2TempReset_Sync,15095).
-record(pk_GS2U_Friend2TempReset_Sync,{
	%% UInt16 临时好友总量
	count = 0,
	%% Byte 当前信息页码
	page = 0,
	%% Friend2InfoBase 当前页信息列表
	listInfo = []
}).

%% 
%% // 反馈希望聊天
-define(GS2U_Friend2WantChat_Ack,20478).
-record(pk_GS2U_Friend2WantChat_Ack,{
	%% UInt64 角色ID
	id = 0,
	%% Friend2InfoBase 仅当目标角色为陌生人时有效
	info,
	%% Byte 0正式好友1临时好友2黑名单4陌生人5跨服好友
	relation = 0,
	%% UInt16 总量，相关列表总长度
	count = 0,
	%% Boolean 是否有未领取的行动点（体力值），仅对正式好友列表有效，默认false
	hasAP = false,
	%% Byte 当前信息页码
	page = 0,
	%% Friend2InfoFormal 当前页信息列表
	listInfo = []
}).

%% 
%% // 点赞成功回执
-define(GS2u_Friend2Like_Ack,48537).
-record(pk_GS2u_Friend2Like_Ack,{
	%% UInt64 角色ID
	id = 0,
	%% String 角色名
	name = "",
	%% UInt32 当前赞值
	like = 0
}).

%% 
%% // 反馈是否将黑名单中的角色移除并添加好友
-define(U2GS_Friend2AddFromBlack_Reply,40357).
-record(pk_U2GS_Friend2AddFromBlack_Reply,{
	%% UInt64 角色ID
	id = 0,
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 添加好友请求
-define(U2GS_Friend2Add_Request,60911).
-record(pk_U2GS_Friend2Add_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% // 一键处理好友申请请求
-define(U2GS_Friend2ApplicantUseOneKey_Request,2984).
-record(pk_U2GS_Friend2ApplicantUseOneKey_Request,{
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 处理好友申请请求
-define(U2GS_Friend2ApplicantUse_Request,42263).
-record(pk_U2GS_Friend2ApplicantUse_Request,{
	%% UInt64 角色ID
	id = 0,
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询好友申请列表请求
-define(U2GS_Friend2Applicant_Request,28136).
-record(pk_U2GS_Friend2Applicant_Request,{
	%% Byte 页码
	page = 0
}).

%% 
%% // 反馈是否将指定角色从好友移除并加入到黑名单
-define(U2GS_Friend2BanWithDel_Reply,29035).
-record(pk_U2GS_Friend2BanWithDel_Reply,{
	%% UInt64 角色ID
	id = 0,
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% // 反馈是否将最早的黑名单移除，并与指定角色解除好友关系再将其拉黑
%% // 黑名单满的情况下拉黑好友
-define(U2GS_Friend2BanWithUnbanAndDel_Reply,60742).
-record(pk_U2GS_Friend2BanWithUnbanAndDel_Reply,{
	%% UInt64 角色ID 需要移除黑名单
	idUnban = 0,
	%% UInt64 角色ID 需要删除并拉黑的好友
	idDel = 0,
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% // 反馈是否将最早的黑名单移除并继续拉黑指定角色
-define(U2GS_Friend2BanWithUnban_Reply,14850).
-record(pk_U2GS_Friend2BanWithUnban_Reply,{
	%% UInt64 需要移除黑名单的角色ID
	idUnban = 0,
	%% UInt64 需要加入黑名单的角色ID
	idBan = 0,
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 加入黑名单请求
-define(U2GS_Friend2Ban_Request,11969).
-record(pk_U2GS_Friend2Ban_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询黑名单列表请求
-define(U2GS_Friend2Black_Request,25457).
-record(pk_U2GS_Friend2Black_Request,{
	%% Byte 页码
	page = 0
}).

%% 
%% // B同意或拒绝跨服好友申请
%% // 另：若此时B使用U2GS_Friend2CrossAdd_Request请求添加A为好友，则等价于同意
-define(U2GS_Friend2CrossAdd2_Request,2927).
-record(pk_U2GS_Friend2CrossAdd2_Request,{
	%% UInt64 角色ID，该值为0表示一键拒绝所有
	id = 0,
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 添加好友
%% // A向B请求添加好友
-define(U2GS_Friend2CrossAdd_Request,5495).
-record(pk_U2GS_Friend2CrossAdd_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% // 请求完整的列表
-define(U2GS_Friend2CrossAll_Request,44695).
-record(pk_U2GS_Friend2CrossAll_Request,{
	%% Byte 0跨服好友列表 1跨服申请者列表
	type = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 删除好友
%% // A请求删除好友B
%% // 等价于A删除角色
-define(U2GS_Friend2CrossDel_Request,48565).
-record(pk_U2GS_Friend2CrossDel_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 删除好友请求
-define(U2GS_Friend2Del_Request,38445).
-record(pk_U2GS_Friend2Del_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查看信息面板辅助信息请求
-define(U2GS_Friend2ForLook_Request,15730).
-record(pk_U2GS_Friend2ForLook_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 好友语音（C2S）
-define(U2GS_Friend2FormalChatVoice_Request,38617).
-record(pk_U2GS_Friend2FormalChatVoice_Request,{
	%% UInt64 接受者角色ID
	receiverID = 0,
	%% UInt32 时间戳
	time = 0,
	%% Single 音频总时长
	duration = 0.0,
	%% Byte 消息段数
	count = 0,
	%% Byte 分段索引
	index = 0,
	%% Byte 音频数据
	data = []
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 好友消息（C2S）
-define(U2GS_Friend2FormalChat_Request,25005).
-record(pk_U2GS_Friend2FormalChat_Request,{
	%% UInt64 接受者角色ID
	receiverID = 0,
	%% String 内容
	content = "",
	%% UInt32 时间戳
	time = 0
}).

%% 
%% // 反馈数据4，若relation=5，客户端本地必然有缓存的跨服好友数据，不需要额外的数据发放
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询好友列表请求（求婚界面）
-define(U2GS_Friend2FormalForMarriage_Request,55870).
-record(pk_U2GS_Friend2FormalForMarriage_Request,{
	%% Byte 页码
	page = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 好友周边功能
%% // 点赞0;赠送AP1;接受AP2;传送3
-define(U2GS_Friend2FormalOP_Request,45726).
-record(pk_U2GS_Friend2FormalOP_Request,{
	%% UInt64 角色ID
	id = 0,
	%% Byte 操作类型
	opType = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询好友列表请求
-define(U2GS_Friend2Formal_Request,41453).
-record(pk_U2GS_Friend2Formal_Request,{
	%% Byte 页码
	page = 0
}).

%% 
%% // 添加一个好友
-define(U2GS_Friend2GetBack_Add,9401).
-record(pk_U2GS_Friend2GetBack_Add,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% // 忽略该好友 
-define(U2GS_Friend2GetBack_Ignore,9362).
-record(pk_U2GS_Friend2GetBack_Ignore,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% // 这个消息 处理后 服务器下发:GS2U_Friend2GetBack_SyncInfo
%% // 一键添加
-define(U2GS_Friend2GetBack_OneKeyToAdd,20121).
-record(pk_U2GS_Friend2GetBack_OneKeyToAdd,{
}).

%% 
%% // 带有限制的搜索好友请求
-define(U2GS_Friend2LimitSearch_Request,32837).
-record(pk_U2GS_Friend2LimitSearch_Request,{
	%% String 姓名
	name = ""
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 推荐好友请求
-define(U2GS_Friend2Recommend_Request,3794).
-record(pk_U2GS_Friend2Recommend_Request,{
	%% Byte 指定具体性别
	sex = 0,
	%% Boolean 是否按照就近距离进行排序
	isNear = false,
	%% Boolean 是否是定时推送推荐好友，是否的区别在于反馈的数量不同
	isPush = false
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 搜索好友请求
-define(U2GS_Friend2Search_Request,16938).
-record(pk_U2GS_Friend2Search_Request,{
	%% String 姓名
	name = ""
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 请求精简的角色信息列表
-define(U2GS_Friend2SimpleList_Requets,43748).
-record(pk_U2GS_Friend2SimpleList_Requets,{
	%% Byte 0正式好友1临时好友2黑名单3申请列表
	type = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询临时好友列表请求
-define(U2GS_Friend2Temp_Request,7582).
-record(pk_U2GS_Friend2Temp_Request,{
	%% Byte 页码
	page = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 移除黑名单请求
-define(U2GS_Friend2Unban_Request,64260).
-record(pk_U2GS_Friend2Unban_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 希望向某人发起好友聊天
-define(U2GS_Friend2WantChat_Request,18482).
-record(pk_U2GS_Friend2WantChat_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% //初始化
-define(GS2U_InitGodWeapon,59144).
-record(pk_GS2U_InitGodWeapon,{
	%% GodWeaponInfo
	infos = []
}).

%% 
%% //神器升级结果
-define(GS2U_LevelUpGodWeaponResult,21218).
-record(pk_GS2U_LevelUpGodWeaponResult,{
	%% Byte
	weaponID = 0,
	%% UInt16
	weaponLevel = 0,
	%% UInt32
	exp = 0,
	%% UInt16
	wakeSkillLv = 0
}).

%% 
%% //技能升级结果
-define(GS2U_LevelUpGodWeaponSkillResult,14589).
-record(pk_GS2U_LevelUpGodWeaponSkillResult,{
	%% Byte
	weaponID = 0,
	%% UInt16
	skillLevel = 0
}).

-record(pk_GodWeaponInfo,{
	%% Byte
	weaponID = 0,
	%% UInt16
	weaponLevel = 0,
	%% UInt16
	skillLevel = 0
}).

%% 
%% //神器升级
-define(U2GS_LevelUpGodWeapon,27135).
-record(pk_U2GS_LevelUpGodWeapon,{
	%% Byte
	weaponID = 0
}).

%% 
%% //技能升级
-define(U2GS_LevelUpGodWeaponSkill,21847).
-record(pk_U2GS_LevelUpGodWeaponSkill,{
	%% Byte
	weaponID = 0
}).

-record(pk_BiddingGuild,{
	%% UInt64
	guildID = 0,
	%% String
	guildName = "",
	%% UInt32 当前竞价出资
	biddingMoney = 0,
	%% Byte
	denoter = 0
}).

-record(pk_CannonState,{
	%% UInt32
	collectID = 0,
	%% UInt32 重置剩余时间
	resetTime = 0
}).

-record(pk_ExpeditionFinalInfo,{
	%% UInt32 地图iD
	mapid = 0,
	%% ExpeditionGuildBattleInfo
	topGuildInfoList = []
}).

-record(pk_ExpeditionGlobalMapInfo,{
	%% UInt32 地图iD
	mapid = 0,
	%% UInt16 进入人数
	onlineNumber = 0,
	%% UInt16 排队人数
	queueNumber = 0
}).

-record(pk_ExpeditionGuildBattleInfo,{
	%% UInt64 公会唯一ID
	guildID = 0,
	%% String 公会名
	guildName = "",
	%% UInt64 工会分数
	guildScore = 0
}).

-record(pk_ExpeditionMapInfo,{
	%% UInt32 公会唯一ID
	mapid = 0,
	%% UInt64 公会唯一ID
	guildID = 0,
	%% String 公会名
	guildName = "",
	%% UInt16 进入人数
	onlineNumber = 0,
	%% UInt16 排队人数
	queueNumber = 0,
	%% Byte 是否可以领奖， 非0可以， 0不可以
	isGetReward = 0
}).

-record(pk_ExpeditionPointInfo,{
	%% UInt16  1-3，代表据点A-C
	pointIndex = 0,
	%% UInt64 公会唯一ID
	guildID = 0,
	%% String 公会名
	guildName = ""
}).

%% 
-define(GS2U_BiddingGuildMsg,53493).
-record(pk_GS2U_BiddingGuildMsg,{
	%% BiddingGuild
	list = [],
	%% UInt32 自己家族当前物资
	resorce = 0
}).

%% 
%% // 返回修改结果，失败只提示ErrorCode
-define(GS2U_ChangeDenoter,22996).
-record(pk_GS2U_ChangeDenoter,{
	%% UInt64
	guildID = 0,
	%% Byte
	denoter = 0
}).

%% 
%% // 修改公会名成功(失败只提示ErrorCode)
-define(GS2U_ChangeGuildName,61842).
-record(pk_GS2U_ChangeGuildName,{
	%% String
	newGuildName = ""
}).

%% 
%% // 修改公告结果(成功返回这个结果，失败不会返回)
-define(GS2U_ChangeNotice,46512).
-record(pk_GS2U_ChangeNotice,{
	%% String 公告
	guildNotice = ""
}).

%% 
%% // 捐献成功家族改变，只发给捐献者
-define(GS2U_DonateSuccess,18308).
-record(pk_GS2U_DonateSuccess,{
	%% UInt64 公会唯一ID
	guildID = 0,
	%% Byte 公会等级
	guildLevel = 0,
	%% UInt32 当前经验值
	nowExp = 0,
	%% UInt64 捐献者角色ID
	roleID = 0,
	%% UInt32 捐献者最新贡献点
	contribute = 0
}).

%% 
%% // 通知本地图帮会成员位置信息
-define(GS2U_ExpeditionBroadcastPos,4888).
-record(pk_GS2U_ExpeditionBroadcastPos,{
	%% UInt160, 团长自己(x,y有效)， 1-3，代表据点A-C(x,y无效)
	type = 0,
	%% String 广播者名称
	broadcasterName = "",
	%% Single目标X坐标	
	x = 0.0,
	%% Single目标Y坐标
	y = 0.0
}).

%% 
%% // 通知本地图帮会成员位置信息
-define(GS2U_ExpeditionFinalInfo,29191).
-record(pk_GS2U_ExpeditionFinalInfo,{
	%% UInt64 本次活动所得总分
	selfTotalScore = 0,
	%% ExpeditionFinalInfo
	finalInfoList = []
}).

%% 
%% // 返回全局信息
-define(GS2U_ExpeditionGlobalMapInfoList,788).
-record(pk_GS2U_ExpeditionGlobalMapInfoList,{
	%% UInt32活动剩余时间(活动未开启时：0)
	leftSeconds = 0,
	%% ExpeditionGlobalMapInfo
	mapInfoList = []
}).

%% 
%% // 返回远征地图战斗信息
-define(GS2U_ExpeditionMapBattleInfoList,10027).
-record(pk_GS2U_ExpeditionMapBattleInfoList,{
	%% UInt32 地图iD
	mapid = 0,
	%% UInt64 当前地图得分
	selfScore = 0,
	%% ExpeditionGuildBattleInfo
	selfGuildBattleInfo,
	%% ExpeditionPointInfo
	pointInfoList = [],
	%% ExpeditionGuildBattleInfo
	topGuildInfoList = []
}).

%% 
%% // 返回远征地图信息
-define(GS2U_ExpeditionMapInfoList,59443).
-record(pk_GS2U_ExpeditionMapInfoList,{
	%% ExpeditionMapInfo
	mapInfoList = []
}).

%% 
%% // 排队状态
-define(GS2U_ExpeditionQuenenState,57282).
-record(pk_GS2U_ExpeditionQuenenState,{
	%% UInt32 地图iD
	mapid = 0
}).

%% 
%% // 赋予权力Ack，成功才返回给客户端
-define(GS2U_GivePower,32732).
-record(pk_GS2U_GivePower,{
	%% UInt64 目标角色ID
	targetRoleID = 0,
	%% Byte 权限:0请求加入，1普通成员，2管理员，3副家族长，9家族长
	guileLevel = 0
}).

%% 
%% // 报名信息
-define(GS2U_GuildBattleApply,11671).
-record(pk_GS2U_GuildBattleApply,{
	%% GuildBattleInfo
	list = [],
	%% UInt64
	selfGuildID = 0,
	%% UInt64
	targetGuildID = 0
}).

%% 
%% // 比赛结果(有对手且参与比赛了，才有结果)
-define(GS2U_GuildBattleResult,55408).
-record(pk_GS2U_GuildBattleResult,{
	%% Byte 1未开始，2比赛中，3结束
	isEnd = 0,
	%% GuildBattleResultInfo
	win,
	%% GuildBattleResultInfo
	lose
}).

%% 
%% // 家族战斗中的伤害  进入地图后我会发这个消息给你
-define(GS2U_GuildBossRank,22236).
-record(pk_GS2U_GuildBossRank,{
	%% Bytebuff层数   0-9
	buffLevel = 0,
	%% GuildHurtList 伤害排行
	listHurtList = []
}).

%% 
%% // 家族BOSS结算
-define(GS2U_GuildBossResoult,54542).
-record(pk_GS2U_GuildBossResoult,{
	%% Boolean是否挑战成功
	isChallengeSucceeds = false,
	%% Byte家族BOSS阶级
	guildBosslevel = 0,
	%% Boolean是否自己首杀
	isMyFirstKill = false,
	%% Boolean是否自己击杀
	isMyKill = false
}).

%% 
%% // 今日已经购买的BUFF列表
-define(GS2U_GuildBuff,46706).
-record(pk_GS2U_GuildBuff,{
	%% GuildBuff 今日购买的BUFF列表
	buff = []
}).

%% 
-define(GS2U_GuildBuffRole,10832).
-record(pk_GS2U_GuildBuffRole,{
	%% GuildBuffRole
	bgrs = []
}).

%% 
%% // 当前场景参战的家族列表
-define(GS2U_GuildIDList,17944).
-record(pk_GS2U_GuildIDList,{
	%% GuildIDList
	list = []
}).

%% 
%% // 返回公会招募榜
-define(GS2U_GuildList,58381).
-record(pk_GS2U_GuildList,{
	%% UInt32 当前页数
	nowPage = 0,
	%% UInt32 总页数
	maxPage = 0,
	%% GuildInfo 当前页列表
	guildInfoList = []
}).

%% 
%% // 反馈捐赠结果（反馈捐赠方）
-define(GS2U_GuildLoopTask_Give_Ack,57742).
-record(pk_GS2U_GuildLoopTask_Give_Ack,{
	%% Byte 0成功；1自己不在家族；2对方与自家家族不同；3对方M值满；4自己物品不足（id错误）；5自己物品不足（数量不足）；6自己物品不足（协议传参为0）；7捐赠数量溢出（并发冲突）;8捐赠对象是自己；9已经捐过了
	type = 0,
	%% UInt64 如果需要删除条目，则根据该RoleID进行删除
	roleID = 0,
	%% UInt16 成功时可能需要使用该字段展示奖励，目前是用task.grouid和task.task_star查找表guildDonation_reward
	taskID = 0,
	%% GuildLoopTask_Get 为空时需要删除，否则需要刷新
	listData = [],
	%% UInt32 捐赠成功后对应的数量
	count = 0
}).

%% 
-define(GS2U_GuildLoopTask_History_Ack,59667).
-record(pk_GS2U_GuildLoopTask_History_Ack,{
	%% GuildLoopTaskGiveHistory2 多条记录
	listHistory = [],
	%% NameTable2 名称表
	nameTables = []
}).

%% 
%% // 上线或请求时反馈，同步自己当前的索取条目
%% // PlayerDailyCount.dailyType=29且PlayerDailyCount.dailyID=5时
%% // PlayerDailyCount.dailyValue表示当日已经索取次数
-define(GS2U_GuildLoopTask_MyGet_Sync,8415).
-record(pk_GS2U_GuildLoopTask_MyGet_Sync,{
	%% Byte
	state = 0,
	%% GuildLoopTask_Get
	myGet = []
}).

%% 
%% // 打开捐赠界面数据反馈
-define(GS2U_GuildLoopTask_OpenUI_Ack,65431).
-record(pk_GS2U_GuildLoopTask_OpenUI_Ack,{
	%% GuildLoopTask_Get
	listData = []
}).

%% 
-define(GS2U_GuildLoopTask_WantGive_Ack,25714).
-record(pk_GS2U_GuildLoopTask_WantGive_Ack,{
	%% Byte 如同GS2U_GuildLoopTask_Give_Ack.type
	type = 0,
	%% UInt64 如果需要删除条目，则根据该RoleID进行删除
	roleID = 0,
	%% GuildLoopTask_Get 为空时需要删除，否则需要刷新
	listData = []
}).

%% 
%% // 公会操作结果
-define(GS2U_GuildOpResult,45041).
-record(pk_GS2U_GuildOpResult,{
	%% UInt64
	roleCode = 0,
	%% Byte 1创建家族
	opType = 0,
	%% Boolean
	opResult = false
}).

%% 
%% // 返回家族技能结果
-define(GS2U_GuildSkill,13522).
-record(pk_GS2U_GuildSkill,{
	%% GuildSkill 当前已经研究出来的家族列表
	skill = [],
	%% GuildSkill 自己已经学习的家族技能列表
	selfskill = []
}).

%% 
%% // 家族任务列表
-define(GS2U_GuildTask,29256).
-record(pk_GS2U_GuildTask,{
	%% GuildTask 包含刺探与巡逻任务
	tasks = []
}).

%% 
%% // 返回比赛对战列表
-define(GS2U_GuildWar,62357).
-record(pk_GS2U_GuildWar,{
	%% GuildWar
	list = []
}).

%% 
%% // 被大炮击中玩家信息列表
-define(GS2U_GuildWarCannonHit,11517).
-record(pk_GS2U_GuildWarCannonHit,{
	%% UInt64
	hits = []
}).

%% 
%% // 战斗过程中刷新数据
-define(GS2U_GuildWarData,43631).
-record(pk_GS2U_GuildWarData,{
	%% GuildWarRank
	ranks = [],
	%% PebbleState
	pebbles = [],
	%% CannonState
	cannons = [],
	%% GuildWarInfo
	infos = [],
	%% UInt32 剩余时间
	syTime = 0
}).

%% 
%% // 终场结算
-define(GS2U_GuildWarEnd,51846).
-record(pk_GS2U_GuildWarEnd,{
	%% Boolean是否晋级 
	isGradeToJS = false,
	%% GuildWarInfo
	infos = [],
	%% GuildWarReward_item
	items = [],
	%% GuildWarReward_coin
	coins = []
}).

%% 
%% // 玩家登陆时判断HUD 或者活动结束时 开始时推送此小时
-define(GS2U_GuildWarRankForHud,41883).
-record(pk_GS2U_GuildWarRankForHud,{
	%% GuildWarRankInfo
	ranks = []
}).

%% 
%% // 同步已兑换的属性
%% // 玩家上线时推送，成功兑换时推送
-define(GS2U_Guild_ExchangeAll_Sync,2440).
-record(pk_GS2U_Guild_ExchangeAll_Sync,{
	%% UInt32 配置ID组
	listID = [],
	%% UInt32 配置等级组，与ID组一一匹配 （已学得最大等级）
	listLevel = [],
	%% UInt32 配置等级组，与ID组一一匹配 （受guildexchange.guildlevel限制后生效的等级）
	listLevelCur = []
}).

%% 
%% // 兑换反馈，用于客户端得到一个明确的消息以刷新界面
-define(GS2U_Guild_Exchange_Ack,7693).
-record(pk_GS2U_Guild_Exchange_Ack,{
	%% UInt32 配置ID
	id = 0,
	%% UInt32 配置等级
	level = 0,
	%% UInt32 为0时表示成功，否则需要客户端显示ErrorCode
	errorCode = 0
}).

%% 
-define(GS2U_Guild_FairgroundEnter_Ack,39163).
-record(pk_GS2U_Guild_FairgroundEnter_Ack,{
	%% UInt64 家族ID（注意！这里是角色所处游乐场对应的家族ID，不一定是角色所在的家族ID）
	guildID = 0,
	%% Ride 设备列表
	listRide = [],
	%% RideRole 正在使用设备的玩家列表
	listRole = []
}).

%% 
%% // 反馈/同步设备使用情况
%% // 操作类型1和2仅反馈给地图上的角色
%% // 操作类型3仅反馈操作者和被操作家族游乐场地图上的角色
-define(GS2U_Guild_FairgroundRide_Sync,42475).
-record(pk_GS2U_Guild_FairgroundRide_Sync,{
	%% Ride 刷新设备情况（操作对象设施）
	ride,
	%% RideRole 刷新角色情况（操作对象角色）
	role,
	%% Byte 操作类型 1乘坐;2取消乘坐;3升级（需要对应权限）
	type = 0
}).

%% 
%% // 反馈成功的快速加入请求
-define(GS2U_Guild_FastJoin_Ack,14772).
-record(pk_GS2U_Guild_FastJoin_Ack,{
	%% UInt64
	guildID = 0
}).

%% 
%% // 反馈查询允许快速加入的战力条件
-define(GS2U_Guild_FastJoin_Get_Ack,2591).
-record(pk_GS2U_Guild_FastJoin_Get_Ack,{
	%% UInt64
	guildID = 0,
	%% UInt64 快速加入的战力限制，默认值为0，表示无限制；极大值0x7FFFFFFFFFFFFFFF表示关闭快速加入；暂不考虑超过极大值的情况，其余情况视为有战力限制
	force = 0
}).

%% 
%% // 反馈设置允许快速加入的战力条件
%% // 虽然和GS2U_Guild_FastJoin_Get_Ack很像，但这个用来表达设置成功
-define(GS2U_Guild_FastJoin_Set_Ack,11867).
-record(pk_GS2U_Guild_FastJoin_Set_Ack,{
	%% UInt64
	guildID = 0,
	%% UInt64 快速加入的战力限制，默认值为0，表示无限制；极大值0x7FFFFFFFFFFFFFFF表示关闭快速加入；暂不考虑超过极大值的情况，其余情况视为有战力限制
	force = 0
}).

%% 
%% // 祈福请求成功反馈
%% //    仅祈福成功时使用该消息刷新界面
%% //    其它情况使用每日计数7获取当日已祈福次数，使用同步属性10006获取上次成功祈福的时间
-define(GS2U_Guild_GodBless_Ack,51273).
-record(pk_GS2U_Guild_GodBless_Ack,{
	%% UInt32 本次成功祈福的时间 参考GS2U_SyncServerTime
	time = 0,
	%% Byte 当日已祈福次数
	count = 0
}).

%% 
%% // 成功领取祈福进度奖励，失败时发送ErrorCode
-define(GS2U_Guild_GodBless_Schedule_Reward_Ack,54441).
-record(pk_GS2U_Guild_GodBless_Schedule_Reward_Ack,{
	%% UInt32 参考guildbless_schedule.id
	id = 0
}).

%% 
%% // 同步/反馈祈福进度
-define(GS2U_Guild_GodBless_Schedule_Sync,10595).
-record(pk_GS2U_Guild_GodBless_Schedule_Sync,{
	%% UInt32
	schedule = 0,
	%% UInt32 已领取的进度奖励，参考guildbless_schedule.id
	listID = []
}).

%% 
%% // 反馈祈愿界面请求列表（未加入家族时忽略）
-define(GS2U_Guild_OpenSupplication_Ack,33889).
-record(pk_GS2U_Guild_OpenSupplication_Ack,{
	%% Supplication
	listInfo = []
}).

%% 
%% // 购买反馈，用于客户端得到一个明确的消息以刷新界面
-define(GS2U_Guild_ShopBuy_Ack,58426).
-record(pk_GS2U_Guild_ShopBuy_Ack,{
	%% UInt32 配置ID
	id = 0,
	%% UInt32 数量
	count = 0,
	%% UInt32 为0时表示成功，否则需要客户端显示ErrorCode
	errorCode = 0
}).

%% 
%% // 活动地图合并同步数据
%% //    进入场景初始化
%% //    反馈请求U2GS_Guild_SnowmanDonate_Request
-define(GS2U_Guild_SnowmanAll_Sync,46692).
-record(pk_GS2U_Guild_SnowmanAll_Sync,{
	%% UInt32 已完成的数量
	count = 0,
	%% UInt32 最大数量
	countMax = 0,
	%% UInt32 子状态，对应guildsnowman.id
	subState = 0,
	%% UInt32 正在制作的雪人已有的材料数量，下标参考配置表guildsnowman.id-1
	listResSnowman = [],
	%% UInt32 当前玩家已有的材料数量，下标参考配置表guildsnowman.id-1
	listResPlayer = []
}).

%% 
%% // 活动开始提示
%% // 只提示在线的、已加入家族的角色
-define(GS2U_Guild_SnowmanBegin_Sync,52004).
-record(pk_GS2U_Guild_SnowmanBegin_Sync,{
}).

%% 
%% /// 家族驻地
%% // 初始化已完成的雪人数量以及已领取的礼盒标记
%% //    角色上线或进入家族驻地时
%% //    反馈请求U2GS_Guild_SnowmanReward_Request
-define(GS2U_Guild_SnowmanCompleteCount_Sync,14295).
-record(pk_GS2U_Guild_SnowmanCompleteCount_Sync,{
	%% UInt32 数量
	count = 0,
	%% Boolean true已领取；false未领取
	listMark = []
}).

%% 
%% // 每完成一个雪人的一种材料收集，通知客户端剩余材料数量，以展示剩余材料可以兑换的奖励
-define(GS2U_Guild_SnowmanExtraRes_Sync,16743).
-record(pk_GS2U_Guild_SnowmanExtraRes_Sync,{
	%% UInt32 数量
	count = 0
}).

%% 
%% // 活动地图同步玩家数据
%% //    打怪、采集时发生变化则同步
-define(GS2U_Guild_SnowmanPlayer_Sync,62266).
-record(pk_GS2U_Guild_SnowmanPlayer_Sync,{
	%% UInt32 当前玩家已有的材料数量，下标参考配置表guildsnowman.id-1
	listResPlayer = []
}).

%% 
%% // 结算消息
%% //    活动结束时推送
-define(GS2U_Guild_SnowmanSettle_Sync,26620).
-record(pk_GS2U_Guild_SnowmanSettle_Sync,{
	%% UInt32 完成雪人数量 参考配置表guildsnowman_settle.id
	count = 0,
	%% UInt32 开展活动时的家族等级（家族可能在活动期间升级）
	level = 0,
	%% String 家族名
	guildName = ""
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 堆雪人（名为堆雪人，但实际上可能是堆其它东西，反正就是用材料堆个NPC领奖的活动）
%% /// 活动场景
%% // 活动地图同步雪人数据
%% //    反馈请求U2GS_Guild_SnowmanCheck_Request
-define(GS2U_Guild_SnowmanSnowman_Sync,33606).
-record(pk_GS2U_Guild_SnowmanSnowman_Sync,{
	%% UInt32 已完成的数量
	count = 0,
	%% UInt32 最大数量
	countMax = 0,
	%% UInt32 子状态，对应guildsnowman.id
	subState = 0,
	%% UInt32 正在制作的雪人已有的材料数量，下标参考配置表guildsnowman.id-1
	listResSnowman = []
}).

%% 
%% // 赠送碎片失败
%% // 特别用于客户端刷新界面
-define(GS2U_Guild_SupplicateGiveF_Ack,24617).
-record(pk_GS2U_Guild_SupplicateGiveF_Ack,{
	%% Byte 1自己不在家族；2对方与自家家族不同；3对方M值满
	type = 0,
	%% UInt64 对方角色ID
	tarRoleID = 0
}).

%% 
-define(GS2U_Guild_SupplicateGive_Ack,6325).
-record(pk_GS2U_Guild_SupplicateGive_Ack,{
	%% SuppHistory2 单条记录
	history,
	%% NameTable2 名称表
	nameTables = []
}).

%% 
%% // 上线时同步赠送碎片记录
-define(GS2U_Guild_SupplicateGive_Sync,32759).
-record(pk_GS2U_Guild_SupplicateGive_Sync,{
	%% SuppHistory2 多条记录
	listHistory = [],
	%% NameTable2 名称表
	nameTables = []
}).

%% 
%% // 发布祈愿成功（失败时返回ErrorCode）
-define(GS2U_Guild_Supplicate_Ack,38660).
-record(pk_GS2U_Guild_Supplicate_Ack,{
	%% UInt16
	itemID = 0
}).

%% 
%% // 玩家登陆时判断能否竞价信息 或者开启时竞价时推送这个消息
-define(GS2U_ISInApplyInfo,9849).
-record(pk_GS2U_ISInApplyInfo,{
	%% Boolean是否在竞价解
	isInApply = false,
	%% Boolean对战列表
	isInBattleList = false,
	%% UInt32倒计时
	leftTime = 0
}).

%% 
%% // 弹劾信息
-define(GS2U_ImpeachInfo,63767).
-record(pk_GS2U_ImpeachInfo,{
	%% Byte 能否发起弹劾	
	canImpeach = 0,
	%% Byte支持者数量
	supportNumber = 0,
	%% UInt64发起弹劾者ID
	impeacherID = 0,
	%% String 发起弹劾这名字
	impeacherName = "",
	%% UInt64弹劾过期时间(秒)
	impeacheLeftTime = 0
}).

%% 
%% // 加入公会成功
%% // 申请被同意/同意招募 导致的加入公会成功
%% // 客户端需要一个明确的消息（非ERRORCODE）来刷新界面
-define(GS2U_JoinGuild_Sync,3861).
-record(pk_GS2U_JoinGuild_Sync,{
	%% UInt64
	guildID = 0
}).

%% 
%% // 返回当前自己伤害
-define(GS2U_MyGuildBossRank,20300).
-record(pk_GS2U_MyGuildBossRank,{
	%% UInt16自己当前排行
	rank = 0,
	%% UInt64角色伤害
	myhurt = 0
}).

%% 
%% // 返回当前自己家族排名，用时时间
-define(GS2U_MyGuildKillBossRank,59022).
-record(pk_GS2U_MyGuildKillBossRank,{
	%% UInt16自己家族击杀排行
	rank = 0,
	%% UInt16用时时间
	ustime = 0,
	%% GuildFastrecord 当前阶级排名前十的家族
	listTopTenGuildList = []
}).

%% 
%% // 战场相关信息发生改变
-define(GS2U_OccupyOwnerChange,27260).
-record(pk_GS2U_OccupyOwnerChange,{
	%% Byte 1旗帜改变，2定时TICK
	type = 0,
	%% UInt32 剩余时间，秒
	remainSec = 0,
	%% OccupyGuildInfo
	owner,
	%% OccupyGuildInfo
	target,
	%% GuildBattlePlayerInfo 只发一部分和玩家自己
	playerInfos = []
}).

%% 
%% // 发布招募反馈
-define(GS2U_OneKeyRecruit_Ack,41203).
-record(pk_GS2U_OneKeyRecruit_Ack,{
	%% UInt32 需要冷去的时间（秒）
	cd = 0,
	%% UInt32 0成功，非0为errorcode，需要带入cd作为参数
	ret = 0
}).

%% 
%% // 打开公会界面返回的消息
-define(GS2U_OpenGuildForm,57773).
-record(pk_GS2U_OpenGuildForm,{
	%% UInt64 公会唯一ID
	guildID = 0,
	%% String 公会名
	guildName = "",
	%% Byte 公会等级
	guildLevel = 0,
	%% UInt32 家族总战力
	fightForce = 0,
	%% UInt32 公会成员个数
	memberNumber = 0,
	%% UInt32 公会成员最大个数
	maxMemberNumber = 0,
	%% UInt32 公会物资
	resource = 0,
	%% UInt32 公会活跃
	liveness = 0,
	%% String 公告
	notice = "",
	%% Byte 家族标志
	denoter = 0,
	%% Byte 家族商店等级
	shopLevel = 0,
	%% UInt32 申请列表(官员以上才能查看)
	requestJoinNum = 0,
	%% UInt32 个人贡献点
	selfContribute = 0,
	%% Byte 个人在公会中的职位
	selfGuildLevel = 0,
	%% UInt32 发布招募需要冷去的时间（秒）
	cd = 0,
	%% Boolean 是否可以修改名字
	canRename = false,
	%% Boolean 上线需要推送家族信息，以支持一些杂七杂八的显示
	isInit = false
}).

%% 
-define(GS2U_QueryGuildInfoByRoleID_Ack,4287).
-record(pk_GS2U_QueryGuildInfoByRoleID_Ack,{
	%% GuildInfo
	guildInfo
}).

%% 
%% // 查询弹劾信息
-define(GS2U_QueryImpeachInfo,41091).
-record(pk_GS2U_QueryImpeachInfo,{
}).

%% 
%% // 被招募的人接收到的招募消息
-define(GS2U_Recruit,14390).
-record(pk_GS2U_Recruit,{
	%% UInt64 招募者的角色ID
	roleID = 0,
	%% String 招募者的角色名
	roleName = "",
	%% GuildInfo 公会Info
	guildInfo
}).

%% 
%% // 刷新家族属性
-define(GS2U_RefreshGuildProp,40691).
-record(pk_GS2U_RefreshGuildProp,{
	%% UInt64 公会唯一ID
	guildID = 0,
	%% UInt32 公会物资
	resource = 0,
	%% UInt32 公会活跃
	liveness = 0,
	%% UInt64 个人贡献点
	selfContribute = 0,
	%% UInt32 个人活跃（加入家族后累计获得的个人贡献，在成员列表中显示为家族贡献）
	selfLiveness = 0
}).

%% 
%% // 返回家族面板信息
-define(GS2U_RequestGuildBossInfo_Sync,11371).
-record(pk_GS2U_RequestGuildBossInfo_Sync,{
	%% Byte家族BOSS等级   0-9
	guildBosslevel = 0,
	%% Byte伤害排行对应的介数 1-10
	hurtBosslevel = 0,
	%% Byte当前进行阶级 1-10
	curGuilBosslevel = 0,
	%% GuildHurtList 伤害排行 
	listHurtList = [],
	%% GuildFastrecord 最快击杀排行
	listFastrecord = []
}).

%% 
%% // 打开申请成员界面
-define(GS2U_RequestJoinGuildList,33524).
-record(pk_GS2U_RequestJoinGuildList,{
	%% GuildApplyMemberInfo 申请列表
	requestList = [],
	%% UInt64 快速加入的战力限制，默认值为0，表示无限制；极大值0x7FFFFFFFFFFFFFFF表示关闭快速加入；暂不考虑超过极大值的情况，其余情况视为有战力限制
	force = 0
}).

%% 
%% // 申请加入公会成功
-define(GS2U_RequestJoinGuild_Ack,7364).
-record(pk_GS2U_RequestJoinGuild_Ack,{
	%% UInt64
	guildID = 0,
	%% UInt64
	cancelID = 0
}).

%% 
%% // 请求查看成员列表
-define(GS2U_RequestLookMemberList,32102).
-record(pk_GS2U_RequestLookMemberList,{
	%% UInt32 当前页数
	nowPage = 0,
	%% UInt32 总页数
	maxPage = 0,
	%% GuildMemberInfo 当前查看页的成员列表
	memberList = []
}).

%% 
%% // 返回捐献剩余次数
-define(GS2U_ReturnDonateTimes,42575).
-record(pk_GS2U_ReturnDonateTimes,{
	%% Byte 金钱类型,1(非绑金币),3(非绑钻石)
	moneyType = 0,
	%% UInt16 今日剩余次数
	times = 0
}).

%% 
%% // 家族商店升级
-define(GS2U_ShopUpgrade,8934).
-record(pk_GS2U_ShopUpgrade,{
	%% UInt64
	guildID = 0,
	%% Byte 家族商店升级
	shopLevel = 0
}).

%% 
%% // 家族升级反馈
-define(GS2U_Upgrade_Ack,41766).
-record(pk_GS2U_Upgrade_Ack,{
	%% UInt64
	guildID = 0,
	%% UInt32
	level = 0
}).

-record(pk_GuildApplyMemberInfo,{
	%% UInt64 角色唯一ID
	roleID = 0,
	%% UInt64 角色Code，如果不在线，code为0
	roleCode = 0,
	%% String 角色名
	roleName = "",
	%% UInt32 战力
	combatNum = 0,
	%% Byte Vip等级
	vipLevel = 0,
	%% UInt16 玩家等级
	playerLevel = 0,
	%% UInt64 申请时间
	applyTime = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0
}).

-record(pk_GuildBattleInfo,{
	%% UInt64 公会唯一ID
	guildID = 0,
	%% String 公会名
	guildName = "",
	%% Byte 公会等级
	guildLevel = 0,
	%% UInt32 家族总战力
	fightForce = 0,
	%% String 会长姓名
	leaderName = "",
	%% UInt64 会长id
	leaderRoleID = 0,
	%% Byte 家族标志
	denoter = 0
}).

-record(pk_GuildBattlePlayerInfo,{
	%% UInt64
	guildID = 0,
	%% Byte 名次
	rank = 0,
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% UInt32 玩家总分
	point = 0
}).

-record(pk_GuildBattleResultInfo,{
	%% UInt64
	guildID = 0,
	%% String
	guildName = "",
	%% UInt32 总积分
	point = 0,
	%% GuildBattlePlayerInfo 只发一部分和玩家自己
	playerInfos = []
}).

-record(pk_GuildBuff,{
	%% UInt32 配置ID
	confId = 0,
	%% UInt32 BuffID
	buffID = 0,
	%% Byte 今日自己是否已经领取这个BUFF，0未领取，1已领取
	getFlag = 0
}).

-record(pk_GuildBuffRole,{
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% UInt64 购买时间，绝对时间，不是UTC时间
	buyTime = 0,
	%% UInt32 配置ID
	confId = 0,
	%% UInt32 BuffID
	buffID = 0
}).

-record(pk_GuildFastrecord,{
	%% String 军团名字
	guildname = "",
	%% UInt64使用时间，秒为单位
	useTime = 0
}).

-record(pk_GuildHurtList,{
	%% String 角色名
	name = "",
	%% UInt64角色伤害
	hurt = 0
}).

-record(pk_GuildIDList,{
	%% UInt64
	guildID = 0,
	%% String
	guildName = "",
	%% Byte
	denoter = 0
}).

-record(pk_GuildInfo,{
	%% UInt64 公会唯一ID
	guildID = 0,
	%% String 公会名
	guildName = "",
	%% Byte 公会等级
	guildLevel = 0,
	%% Byte 家族标志
	denoter = 0,
	%% UInt32 家族总战力
	fightForce = 0,
	%% UInt32 公会成员个数
	memberNumber = 0,
	%% UInt32 公会成员最大个数
	maxMemberNumber = 0,
	%% String 会长姓名
	leaderName = "",
	%% UInt64 会长id
	leaderRoleID = 0,
	%% Byte 是否申请加入，1是，0否
	isRequest = 0
}).

-record(pk_GuildLoopTaskGiveHistory,{
	%% UInt32 时间戳
	time = 0,
	%% UInt64 赠送者角色ID
	roleID = 0,
	%% UInt64 被赠送目标角色ID
	tarRoleID = 0,
	%% UInt16 相关任务ID
	taskID = 0,
	%% UInt16 赠送道具ID
	itemID = 0,
	%% UInt16 最新M值
	itemM = 0,
	%% UInt16 相关N值
	itemN = 0
}).

-record(pk_GuildLoopTaskGiveHistory2,{
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32 系统头像（自定义头像使用其它接口获取）
	head = 0,
	%% Int32 角色等级
	level = 0,
	%% GuildLoopTaskGiveHistory 记录1
	history
}).

-record(pk_GuildLoopTask_Get,{
	%% UInt64 角色唯一ID
	roleID = 0,
	%% UInt64 角色Code，如果不在线，code为0
	roleCode = 0,
	%% String 角色名
	roleName = "",
	%% Byte 角色在公会中的职位
	roleGuildLevel = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32 系统头像（自定义头像使用其它接口获取）
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% Int32 角色等级
	level = 0,
	%% UInt16 相关任务ID
	taskID = 0,
	%% UInt16 索取道具ID
	itemID = 0,
	%% UInt16 索取道具M值：玩家本次索取获得的道具量
	itemM = 0,
	%% UInt16 索取道具N值：玩家发起索取时需要的道具量
	itemN = 0,
	%% Boolean 是否已经捐赠过了（如果是自己则恒为true）
	isGive = false,
	%% UInt32 发起索取的时间
	timeWantGet = 0
}).

-record(pk_GuildMemberInfo,{
	%% UInt64 角色唯一ID
	roleID = 0,
	%% UInt64 角色Code，如果不在线，code为0
	roleCode = 0,
	%% String 角色名
	roleName = "",
	%% Byte 角色在公会中的职位
	roleGuildLevel = 0,
	%% UInt32 活跃度
	liveness = 0,
	%% UInt32 战力
	combatNum = 0,
	%% UInt64 下线时长
	offlineTime = 0,
	%% Byte Vip等级
	vipLevel = 0,
	%% UInt16 玩家等级
	playerLevel = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16头像框
	frameID = 0
}).

-record(pk_GuildSkill,{
	%% UInt32 配置ID
	confId = 0,
	%% UInt32 技能ID
	skillID = 0,
	%% UInt16 技能等级
	skillLvl = 0,
	%% UInt32 本技能下一等级的配置ID，如果已经学完，本值为0
	next_confID = 0
}).

-record(pk_GuildTask,{
	%% Byte 1刺探，2巡逻
	taskType = 0,
	%% Byte 任务状态，1未接取，2进行中，3已完成
	taskState = 0,
	%% UInt16 完成次数
	curTimes = 0,
	%% UInt16 最大次数
	maxTimes = 0,
	%% UInt32 接取任务的CD时间（还剩这么多秒才能接取任务）
	accCDTime = 0,
	%% UInt16 这个ID为零表示没接任务
	taskID = 0,
	%% UInt64
	targetGuildID = 0,
	%% String
	targetGuildName = "",
	%% UInt64
	targetPlayerRoleID = 0,
	%% String
	targetPLayerName = "",
	%% UInt32 完成参数1
	number1 = 0,
	%% UInt32 完成参数2
	number2 = 0,
	%% UInt32 完成参数3
	number3 = 0
}).

-record(pk_GuildWar,{
	%% Byte 第几场（1初赛，2决赛）
	stage = 0,
	%% Byte 第几组（1，2）
	group = 0,
	%% UInt64
	guildID1 = 0,
	%% String
	guildName1 = "",
	%% Byte
	denoter1 = 0,
	%% UInt64
	guildID2 = 0,
	%% String
	guildName2 = "",
	%% Byte
	denoter2 = 0,
	%% UInt64
	guildID3 = 0,
	%% String
	guildName3 = "",
	%% Byte
	denoter3 = 0,
	%% UInt64
	winguildID = 0,
	%% String
	winguildName = "",
	%% Byte
	windenoter = 0
}).

-record(pk_GuildWarInfo,{
	%% UInt64
	guildID = 0,
	%% String
	guildName = "",
	%% Byte
	denoter = 0,
	%% Byte哪个地图
	key = 0,
	%% Byte阶段
	stage = 0,
	%% UInt32 总积分
	all_integral = 0,
	%% GuildWarInfoIntegral 积分列表
	integrals = []
}).

-record(pk_GuildWarInfoIntegral,{
	%% Byte 积分类型:1占领水晶,2争夺炮台,3参战人员,4累积击杀,5累积助攻
	type = 0,
	%% UInt16 数量
	number = 0,
	%% UInt32 积分
	integral = 0
}).

-record(pk_GuildWarRank,{
	%% UInt16
	rank = 0,
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% UInt32
	killPlayer = 0,
	%% UInt32
	secondAttack = 0
}).

-record(pk_GuildWarRankInfo,{
	%% UInt64
	guildID = 0,
	%% UInt32
	rank = 0
}).

-record(pk_GuildWarReward_coin,{
	%% Byte 货币类型
	cointype = 0,
	%% UInt32
	number = 0
}).

-record(pk_GuildWarReward_item,{
	%% Byte 1绑定，0非绑定
	isBind = 0,
	%% UInt32
	itemID = 0,
	%% UInt32
	itemNumber = 0
}).

-record(pk_NameTable2,{
	%% UInt64 角色ID
	id = 0,
	%% String 角色名
	name = ""
}).

-record(pk_OccupyGuildInfo,{
	%% UInt64
	guildID = 0,
	%% String
	guildName = "",
	%% UInt32 拥有的旗帜ID列表，及采集物ID列表
	occupyIDs = [],
	%% UInt32 总积分
	allPoint = 0,
	%% Byte 家族标志
	denoter = 0
}).

-record(pk_PebbleState,{
	%% UInt32
	monsterID = 0,
	%% UInt32
	curHP = 0,
	%% UInt32
	maxHP = 0,
	%% UInt32 重置剩余时间
	resetTime = 0
}).

-record(pk_Ride,{
	%% UInt32 设备ID
	id = 0,
	%% UInt32 设备等级
	level = 0,
	%% Byte 设备状态 0维护中;1未到开放时间;2正常开放
	state = 0
}).

-record(pk_RideRole,{
	%% UInt64 角色ID
	roleID = 0,
	%% UInt64 家族ID（注意！这里是角色所处游乐场对应的家族ID，不一定是角色所在的家族ID）
	guildID = 0,
	%% UInt32 设备ID
	rideID = 0,
	%% UInt32 座位ID
	seatID = 0,
	%% UInt32 开始使用的时间 （本地时间戳，从1970年1月1日起，秒）
	time = 0
}).

-record(pk_SuppHistory,{
	%% UInt32 时间戳
	time = 0,
	%% UInt64 赠送者角色ID
	roleID = 0,
	%% UInt64 被赠送目标角色ID
	tarRoleID = 0,
	%% UInt16 赠送道具ID
	itemID = 0,
	%% UInt16 最新M值
	itemM = 0
}).

-record(pk_SuppHistory2,{
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32 系统头像（自定义头像使用其它接口获取）
	head = 0,
	%% Int32 角色等级
	level = 0,
	%% SuppHistory 记录1
	history
}).

-record(pk_Supplication,{
	%% UInt64 角色唯一ID
	roleID = 0,
	%% UInt64 角色Code，如果不在线，code为0
	roleCode = 0,
	%% String 角色名
	roleName = "",
	%% Byte 角色在公会中的职位
	roleGuildLevel = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32 系统头像（自定义头像使用其它接口获取）
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% Int32 角色等级
	level = 0,
	%% UInt16 祈愿道具ID
	itemID = 0,
	%% UInt16 祈愿道具M值：玩家本次祈福获得的碎片量
	itemM = 0,
	%% Boolean 当日是否已经赠送过了（如果是自己则恒为true）
	isGive = false
}).

%% 
%% // 接取家族驻地任务
%% // 待废弃
-define(U2GS_AcceptGuildTask,39014).
-record(pk_U2GS_AcceptGuildTask,{
	%% Byte 1刺探，2巡逻
	taskType = 0
}).

%% 
%% // 同意招募
-define(U2GS_AgreeRecruit,27924).
-record(pk_U2GS_AgreeRecruit,{
	%% UInt64
	guildID = 0,
	%% UInt64 招募者的角色唯一ID
	roleID = 0,
	%% Byte 1同意，0拒绝
	agree = 0
}).

%% 
%% // 出价，出价错误返回errorcode，成功返回GS2U_BiddingGuildMsg
-define(U2GS_Bidding,16097).
-record(pk_U2GS_Bidding,{
	%% UInt64 目标家族ID，如果位置没有被占领，则为自己家族
	guildID = 0
}).

%% 
%% // 购买BUFF
-define(U2GS_BuyGuildBuff,56586).
-record(pk_U2GS_BuyGuildBuff,{
	%% UInt32 配置ID
	confId = 0
}).

%% 
%% // 修改标志
-define(U2GS_ChangeDenoter,36937).
-record(pk_U2GS_ChangeDenoter,{
	%% UInt64
	guildID = 0,
	%% Byte
	denoter = 0
}).

%% 
%% // 修改公会名
-define(U2GS_ChangeGuildName,42104).
-record(pk_U2GS_ChangeGuildName,{
	%% String
	newGuildName = ""
}).

%% 
%% // 团长移交
-define(U2GS_ChangeLeader,5315).
-record(pk_U2GS_ChangeLeader,{
	%% UInt64 目标角色ID
	targetRoleID = 0
}).

%% 
%% // 修改公告
-define(U2GS_ChangeNotice,2658).
-record(pk_U2GS_ChangeNotice,{
	%% String 公告
	guildNotice = ""
}).

%% 
%% // 创建公会
-define(U2GS_CreateGuild,8957).
-record(pk_U2GS_CreateGuild,{
	%% String 公会名(guild_name_max_length)
	guildName = "",
	%% Byte 家族标志
	denoter = 0,
	%% String 家族公告
	guildNotice = ""
}).

%% 
%% // 同意或者拒绝申请人加入
-define(U2GS_DealRequestJoin,55171).
-record(pk_U2GS_DealRequestJoin,{
	%% UInt64
	guildID = 0,
	%% UInt64 申请者的roleid列表
	roleIDs = [],
	%% Byte 1同意，0拒绝
	agree = 0
}).

%% 
%% // 解散公会(只有会长才有权力)
-define(U2GS_DeleteGuild,39422).
-record(pk_U2GS_DeleteGuild,{
}).

%% 
%% // 家族捐献(金钱)
-define(U2GS_DonateMoney,52751).
-record(pk_U2GS_DonateMoney,{
	%% Byte 金钱类型,1(非绑金币),3(非绑钻石)
	moneyType = 0,
	%% UInt32 金钱数量
	moneyNumber = 0
}).

%% 
%% // 进入家族战
-define(U2GS_EnterGuildBattle,53913).
-record(pk_U2GS_EnterGuildBattle,{
}).

%% 
%% // 进入家族驻地
%% // 待废弃
-define(U2GS_EnterGuildHome,15968).
-record(pk_U2GS_EnterGuildHome,{
	%% UInt64
	targetGuildID = 0
}).

%% 
%% // 退出工会
-define(U2GS_ExitGuild,61035).
-record(pk_U2GS_ExitGuild,{
}).

%% 
%% // 通知本地图帮会成员位置信息
-define(U2GS_ExpeditionBroadcastPos,17882).
-record(pk_U2GS_ExpeditionBroadcastPos,{
	%% UInt160, 团长自己， 1-3，代表据点A-C
	type = 0
}).

%% 
%% // 领取奖励
%% // 待废弃
-define(U2GS_GetGuildHomeReward,14913).
-record(pk_U2GS_GetGuildHomeReward,{
	%% Byte 1刺探，2巡逻
	taskType = 0
}).

%% 
%% // 领取家族津贴
-define(U2GS_GetGuildPrize,44491).
-record(pk_U2GS_GetGuildPrize,{
}).

%% 
%% // 请求领取每日奖励
-define(U2GS_GiveMeExpeditionRewardEverDay,64755).
-record(pk_U2GS_GiveMeExpeditionRewardEverDay,{
	%% UInt32 地图iD
	mapid = 0
}).

%% 
%% // 赋予权力
-define(U2GS_GivePower,12786).
-record(pk_U2GS_GivePower,{
	%% UInt64 目标角色ID
	targetRoleID = 0,
	%% Byte 权限:0请求加入，1普通成员，2管理员，3副家族长，9家族长
	guileLevel = 0
}).

%% 
%% // 放弃任务
%% // 待废弃
-define(U2GS_GiveUpGuildTask,56130).
-record(pk_U2GS_GiveUpGuildTask,{
	%% Byte 1刺探，2巡逻
	taskType = 0
}).

%% 
%% // 打家族战报名界面
-define(U2GS_GuildBattleApply,61033).
-record(pk_U2GS_GuildBattleApply,{
}).

%% 
%% // 请求购买加成BUFF
-define(U2GS_GuildBossBuyBuff,25611).
-record(pk_U2GS_GuildBossBuyBuff,{
	%% UInt32buffID
	buffID = 0
}).

%% 
%% // 公会招募榜
-define(U2GS_GuildList,38435).
-record(pk_U2GS_GuildList,{
	%% UInt32 请求第几页(打开界面请设置为1，表示请求查看第一页)
	requestPageNumber = 0
}).

%% 
%% // 发起捐赠
-define(U2GS_GuildLoopTask_Give_Request,55038).
-record(pk_U2GS_GuildLoopTask_Give_Request,{
	%% UInt64
	roleID = 0,
	%% UInt16
	itemID = 0,
	%% UInt32
	count = 0
}).

%% 
%% // 打开记录面板时请求自己相关的历史记录
-define(U2GS_GuildLoopTask_History_Request,35175).
-record(pk_U2GS_GuildLoopTask_History_Request,{
}).

%% 
%% // 打开捐赠界面请求数据
-define(U2GS_GuildLoopTask_OpenUI_Request,10087).
-record(pk_U2GS_GuildLoopTask_OpenUI_Request,{
}).

%% 
%% // 发起索取，反馈GS2U_GuildLoopTask_MyGet_Sync
%% // 可能伴随ErrorCode
-define(U2GS_GuildLoopTask_WantGet_Request,18837).
-record(pk_U2GS_GuildLoopTask_WantGet_Request,{
	%% UInt16 相关任务ID
	taskID = 0
}).

%% 
%% // 请求指定目标的捐赠信息（用于绕过U2GS_GuildLoopTask_OpenUI_Request的针对性捐赠的显示数据支持）
-define(U2GS_GuildLoopTask_WantGive_Request,33090).
-record(pk_U2GS_GuildLoopTask_WantGive_Request,{
	%% UInt64
	roleID = 0,
	%% UInt32 用于同步的时间戳(索取发起的时间)
	time = 0
}).

%% 
%% // 领取家族工资
%% // 待废弃
-define(U2GS_GuildReward,2800).
-record(pk_U2GS_GuildReward,{
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 兑换功能
%% // 兑换请求
-define(U2GS_Guild_Exchange_Request,461).
-record(pk_U2GS_Guild_Exchange_Request,{
	%% UInt32 配置ID
	id = 0,
	%% UInt32 配置等级
	level = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 游乐场（取代旧有的家族驻地）
%% // 进入游乐场请求
-define(U2GS_Guild_FairgroundEnter_Request,52175).
-record(pk_U2GS_Guild_FairgroundEnter_Request,{
	%% UInt64
	targetGuildID = 0
}).

%% 
%% // 使用设备请求
%% // 操作类型0和1仅能在游乐场中使用
%% // 操作类型2可以不在游乐场中使用，但需要对应权限
-define(U2GS_Guild_FairgroundRide_Request,29537).
-record(pk_U2GS_Guild_FairgroundRide_Request,{
	%% UInt32 设备ID
	id = 0,
	%% Byte 操作类型 1乘坐;2取消乘坐;3升级
	type = 0
}).

%% 
%% // tiancheng
%% //////////////////////////////////////////////////////////////////////
%% // 快速加入相关协议支持 begin
%% // 查询允许快速加入的战力条件
-define(U2GS_Guild_FastJoin_Get_Request,38175).
-record(pk_U2GS_Guild_FastJoin_Get_Request,{
	%% UInt64
	guildID = 0
}).

%% 
%% // 快速加入请求
%% // 加入成功则走普通加入
-define(U2GS_Guild_FastJoin_Request,51044).
-record(pk_U2GS_Guild_FastJoin_Request,{
}).

%% 
%% // 设置允许快速加入的战力条件
-define(U2GS_Guild_FastJoin_Set_Request,2843).
-record(pk_U2GS_Guild_FastJoin_Set_Request,{
	%% UInt64
	guildID = 0,
	%% UInt64 快速加入的战力限制，默认值为0，表示无限制；极大值0x7FFFFFFFFFFFFFFF表示关闭快速加入；暂不考虑超过极大值的情况，其余情况视为有战力限制
	force = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 女神祈福
%% // 祈福请求
-define(U2GS_Guild_GodBless_Request,24009).
-record(pk_U2GS_Guild_GodBless_Request,{
	%% Byte 参考guildbless.typ
	type = 0
}).

%% 
%% // 请求查询祈福进度
-define(U2GS_Guild_GodBless_Schedule_Request,4029).
-record(pk_U2GS_Guild_GodBless_Schedule_Request,{
}).

%% 
%% // 请求领取祈福进度奖励
-define(U2GS_Guild_GodBless_Schedule_Reward_Request,169).
-record(pk_U2GS_Guild_GodBless_Schedule_Reward_Request,{
	%% UInt32 参考guildbless_schedule.id
	id = 0
}).

%% 
%% // 打开祈愿界面请求列表
-define(U2GS_Guild_OpenSupplication_Request,54177).
-record(pk_U2GS_Guild_OpenSupplication_Request,{
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 家族商店
%% // 购买请求
-define(U2GS_Guild_ShopBuy_Request,50110).
-record(pk_U2GS_Guild_ShopBuy_Request,{
	%% UInt32 配置ID
	id = 0,
	%% UInt32 数量
	count = 0
}).

%% 
%% // 查看当前雪人进度请求
%% //    反馈消息GS2U_Guild_SnowmanSnowman_Sync
-define(U2GS_Guild_SnowmanCheck_Request,31731).
-record(pk_U2GS_Guild_SnowmanCheck_Request,{
}).

%% 
%% // 捐献材料请求
%% //    反馈消息GS2U_Guild_SnowmanAll_Sync
-define(U2GS_Guild_SnowmanDonate_Request,42200).
-record(pk_U2GS_Guild_SnowmanDonate_Request,{
	%% UInt32 材料类型，参考配置表guildsnowman.id，全部捐献则填0
	id = 0,
	%% UInt32 想要捐献给第几个雪人？从1开始
	snowmanID = 0
}).

%% 
%% // 废弃，领取奖励已改为活动结算时邮件发放
%% // 领取雪人礼盒请求
%% //    反馈消息GS2U_Guild_SnowmanCompleteCount_Sync
-define(U2GS_Guild_SnowmanReward_Request,11396).
-record(pk_U2GS_Guild_SnowmanReward_Request,{
	%% UInt32 领取第几个雪人的奖励？从1开始
	id = 0
}).

%% 
%% // 赠送碎片
-define(U2GS_Guild_SupplicateGive_Request,55653).
-record(pk_U2GS_Guild_SupplicateGive_Request,{
	%% UInt64
	roleID = 0,
	%% UInt16
	itemID = 0
}).

%% 
%% // 发布祈愿
-define(U2GS_Guild_Supplicate_Request,24068).
-record(pk_U2GS_Guild_Supplicate_Request,{
	%% UInt16
	itemID = 0
}).

%% 
%% // 弹劾团长
-define(U2GS_ImpeachCreater,33039).
-record(pk_U2GS_ImpeachCreater,{
}).

%% 
%% // 踢出工会
-define(U2GS_KickGuild,23307).
-record(pk_U2GS_KickGuild,{
	%% UInt64 目标角色ID
	targetRoleID = 0
}).

%% 
%% // 请求自己家族当前阶 击杀BOSS排名
-define(U2GS_MyGuildKllBossRank,19139).
-record(pk_U2GS_MyGuildKllBossRank,{
	%% UInt32buffID
	guildLevel = 0
}).

%% 
%% // 快速加入相关协议支持 end
%% //////////////////////////////////////////////////////////////////////
%% // 发布招募
-define(U2GS_OneKeyRecruit_Request,3207).
-record(pk_U2GS_OneKeyRecruit_Request,{
}).

%% 
%% // 打开公会界面(服务器会下发公会基本信息和第一页成员两条消息)
-define(U2GS_OpenGuildForm,6179).
-record(pk_U2GS_OpenGuildForm,{
}).

%% 
%% // 打开家族商店
-define(U2GS_OpenGuildShop,54933).
-record(pk_U2GS_OpenGuildShop,{
}).

%% 
%% // 查询战报()
-define(U2GS_QueryExpeditionFinalInfo,44549).
-record(pk_U2GS_QueryExpeditionFinalInfo,{
}).

%% 
%% // 查询全局信息
-define(U2GS_QueryExpeditionGlobalMapInfo,2120).
-record(pk_U2GS_QueryExpeditionGlobalMapInfo,{
}).

%% 
%% // 查询远征地图战斗信息
-define(U2GS_QueryExpeditionMapBattleInfo,55919).
-record(pk_U2GS_QueryExpeditionMapBattleInfo,{
	%% UInt32 地图iD
	mapid = 0
}).

%% 
%% // 查询远征地图信息
-define(U2GS_QueryExpeditionMapInfo,3559).
-record(pk_U2GS_QueryExpeditionMapInfo,{
}).

%% 
%% // 查询指定角色的家族信息
-define(U2GS_QueryGuildInfoByRoleID_Request,52447).
-record(pk_U2GS_QueryGuildInfoByRoleID_Request,{
	%% UInt64
	roleID = 0
}).

%% 
%% // 招募成员
-define(U2GS_Recruit,19036).
-record(pk_U2GS_Recruit,{
	%% UInt64 招募目标Code
	targetCode = 0
}).

%% 
%% // 请求捐献剩余次数
-define(U2GS_RequestDonateTimes,5654).
-record(pk_U2GS_RequestDonateTimes,{
	%% Byte 金钱类型,1(非绑金币),3(非绑钻石)
	moneyType = 0
}).

%% 
%% // 请求进入战斗
-define(U2GS_RequestEnterGuildBoss,53337).
-record(pk_U2GS_RequestEnterGuildBoss,{
	%% Byte挑战几阶BOSS  1-10在我给你发的最高等级 在+1
	rquestBosslevel = 0
}).

%% 
%% // 中途请求家族战比赛信息
-define(U2GS_RequestGuildBattleResult,5879).
-record(pk_U2GS_RequestGuildBattleResult,{
}).

%% 
%% //------家族BOSS战斗-------------------------
%% // 请求家族面板展示信息
-define(U2GS_RequestGuildBossInfo,20889).
-record(pk_U2GS_RequestGuildBossInfo,{
}).

%% 
%% // 打开家族福利BUFF界面
-define(U2GS_RequestGuildBuff,18969).
-record(pk_U2GS_RequestGuildBuff,{
}).

%% 
%% // 请求指定公会信息
%% // 反馈GS2U_OpenGuildForm
-define(U2GS_RequestGuildInfo_Request,55372).
-record(pk_U2GS_RequestGuildInfo_Request,{
	%% UInt64
	guildID = 0
}).

%% 
%% // 请求伤害排行
-define(U2GS_RequestGuildRank,33406).
-record(pk_U2GS_RequestGuildRank,{
}).

%% 
%% // 打开家族技能界面
-define(U2GS_RequestGuildSkill,29591).
-record(pk_U2GS_RequestGuildSkill,{
}).

%% 
%% // 打开家族任务界面，请求家族任务列表，返回GS2U_GuildTask
%% // 待废弃
-define(U2GS_RequestGuildTask,1519).
-record(pk_U2GS_RequestGuildTask,{
}).

%% 
%% // ----------------------------------------------家族精英联赛----------------------------------------------
%% // 请求竞价家族列表与自己家族信息和分组信息
-define(U2GS_RequestGuildWar,19922).
-record(pk_U2GS_RequestGuildWar,{
}).

%% 
%% // 申请加入工会
-define(U2GS_RequestJoinGuild,51228).
-record(pk_U2GS_RequestJoinGuild,{
	%% UInt64 公会唯一ID
	guildID = 0
}).

%% 
%% // 打开申请成员界面
-define(U2GS_RequestJoinGuildList,486).
-record(pk_U2GS_RequestJoinGuildList,{
}).

%% 
%% // 请求查看成员列表
-define(U2GS_RequestLookMemberList,65180).
-record(pk_U2GS_RequestLookMemberList,{
	%% UInt32 查看第几页成员
	requestPageNumber = 0
}).

%% 
%% // 研究技能
-define(U2GS_ResearchGuildSkill,8607).
-record(pk_U2GS_ResearchGuildSkill,{
	%% UInt32 配置ID
	confId = 0
}).

%% 
%% // 家族商店升级
-define(U2GS_ShopUpgrade,620).
-record(pk_U2GS_ShopUpgrade,{
	%% UInt64
	guildID = 0
}).

%% 
%% // 学习技能
-define(U2GS_StudyGuildSkill,36701).
-record(pk_U2GS_StudyGuildSkill,{
	%% UInt32 配置ID
	confId = 0
}).

%% 
%% // 召唤幻象(刺探专有)
%% // 待废弃
-define(U2GS_SummonHX,3691).
-record(pk_U2GS_SummonHX,{
}).

%% 
%% // 召唤神兽
%% // 待废弃
-define(U2GS_SummonMonster,13103).
-record(pk_U2GS_SummonMonster,{
}).

%% 
%% // 支持弹劾团长
-define(U2GS_SupportImpeachCreater,28458).
-record(pk_U2GS_SupportImpeachCreater,{
}).

%% 
%% // 家族升级
-define(U2GS_Upgrade,25266).
-record(pk_U2GS_Upgrade,{
	%% UInt64
	guildID = 0
}).

%% 
%% // 使用大炮
-define(U2GS_UseCannon,58222).
-record(pk_U2GS_UseCannon,{
	%% UInt64
	targetGuildID = 0,
	%% UInt64
	selectCode = 0
}).

%% 
%% // 领取BUFF
-define(U2GS_getGuildBuff,18066).
-record(pk_U2GS_getGuildBuff,{
	%% UInt32 配置ID
	confId = 0
}).

-record(pk_FarmingPet,{
	%% UInt64 饲养在家具上的UID
	itemUid = 0,
	%% UInt16
	petID = 0,
	%% UInt16 累计时间  分
	deltaTime = 0,
	%% UInt64当前服务器时间 1970 年 秒
	time = 0,
	%% UInt16最后一次放入时长
	lastdeltaTime = 0,
	%% UInt16喂养后增加的时间
	addTime = 0
}).

-record(pk_FurniInteractTrueData,{
	%% UInt64 道具UID
	itemUID = 0,
	%% FurniTruePlayerInfo 乘坐玩家
	playerList = [],
	%% UInt64 拥有者
	roleID = 0
}).

-record(pk_FurniTruePlayerInfo,{
	%% UInt64
	roleID = 0,
	%% Byte位置
	seatID = 0
}).

%% 
%% //切换 装修模式 结果
-define(GS2U_ChangedecorateModelResult,23269).
-record(pk_GS2U_ChangedecorateModelResult,{
	%% Boolean是否成功
	isSucc = false
}).

%% 
%% //返回删除结果
-define(GS2U_DelSenceTheFurniTrueResult,50663).
-record(pk_GS2U_DelSenceTheFurniTrueResult,{
	%% Boolean是否成功
	isSucc = false,
	%% UInt64
	uid = 0
}).

%% 
%% // 当前所处家园的归属
-define(GS2U_EnterHome,22475).
-record(pk_GS2U_EnterHome,{
	%% UInt64 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
	homeID = 0,
	%% UInt64 家园拥有者ID
	ownerID = 0,
	%% UInt16 当前地图ID
	mapID = 0
}).

%% 
-define(GS2U_ExtendAreaResult_Sync,34234).
-record(pk_GS2U_ExtendAreaResult_Sync,{
	%% Boolean扩展是否成功
	isSuccuss = false,
	%% Byte扩展等级	
	extendLevel = 0
}).

%% 
%% // 单独刷新区域信息
-define(GS2U_FreshHomeAreaInfo,2716).
-record(pk_GS2U_FreshHomeAreaInfo,{
	%% UInt64
	homeID = 0,
	%% HomeArea 开放的区域
	areas = []
}).

%% 
%% // 单独刷新家园易变信息
-define(GS2U_FreshHomeInfo,36627).
-record(pk_GS2U_FreshHomeInfo,{
	%% UInt64
	homeID = 0,
	%% String
	homeName = "",
	%% UInt32 华丽度
	stylish = 0,
	%% UInt32 舒适度
	comfort = 0,
	%% UInt32 家园等级
	homeLvl = 0,
	%% UInt32 人气值
	popularity = 0,
	%% UInt64家园升级到期时间
	upgredeHomeCd = 0
}).

%% 
%% // 进食结果
-define(GS2U_GetPetFoodResults_Sync,24863).
-record(pk_GS2U_GetPetFoodResults_Sync,{
	%% UInt64 要喂在哪个家具上
	itemUid = 0,
	%% Byte 1，成功，2次数已满，3资源数量不足
	result = 0,
	%% UInt16
	petID = 0,
	%% UInt16增加的时间
	addTime = 0
}).

%% 
%% //赠送家具给伴侣的返回结果
-define(GS2U_GivingFurniTrueForPartnerResult,47787).
-record(pk_GS2U_GivingFurniTrueForPartnerResult,{
	%% Boolean是否成功
	isSucc = false,
	%% UInt16赠送的家具ID
	itemID = 0,
	%% UInt16
	num = 0
}).

%% 
%% //家园位面 结算
-define(GS2U_HomeBitResult,34087).
-record(pk_GS2U_HomeBitResult,{
	%% UInt64主人的家园ID
	homeID = 0,
	%% Byte家园等级
	level = 0,
	%% Byte家园进度
	phase = 0
}).

%% 
%% // 饲养区宠物ID
-define(GS2U_HomeFarming_Sync,8353).
-record(pk_GS2U_HomeFarming_Sync,{
	%% FarmingPet
	petList = []
}).

%% 
%% // 家园信息
-define(GS2U_HomeInfo,33825).
-record(pk_GS2U_HomeInfo,{
	%% UInt64 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
	homeID = 0,
	%% String 为空则表示默认名字，由客户端自行拼接
	homeName = "",
	%% String 服务器名字
	serverName = "",
	%% UInt64 家园拥有者ID
	ownerID = 0,
	%% String 名字
	ownerName = "",
	%% UInt64 同居者，配偶ID
	mateID = 0,
	%% String 配偶名字
	mateName = "",
	%% UInt32 华丽度
	stylish = 0,
	%% UInt32 舒适度
	comfort = 0,
	%% UInt32 家园等级
	homeLvl = 0,
	%% UInt32 人气值
	popularity = 0,
	%% UInt64 左邻ID
	leftID = 0,
	%% String 名字
	leftName = "",
	%% UInt64 右舍ID
	rightID = 0,
	%% String 名字
	rightName = "",
	%% HomeArea 开放的区域
	areas = [],
	%% UInt64家园升级到期时间
	homeUpCd = 0
}).

%% 
-define(GS2U_HomePlantOperate_Ack,44514).
-record(pk_GS2U_HomePlantOperate_Ack,{
	%% UInt64 操作者角色ID
	roleID = 0,
	%% Byte 操作类型
	operateType = 0,
	%% UInt32 操作成功时为0，否则是ErrorCode
	reason = 0,
	%% Plant 刷新作物属性
	plant
}).

%% 
-define(GS2U_HomePlant_Sync,61986).
-record(pk_GS2U_HomePlant_Sync,{
	%% Plant
	listPlant = []
}).

%% 
%% // 返回家园可拜访列表
-define(GS2U_HomeVisitList,59190).
-record(pk_GS2U_HomeVisitList,{
	%% UInt16 总条数
	allnumber = 0,
	%% Byte 当前页数
	paga = 0,
	%% HomeVisit列表
	visits = []
}).

%% 
%% //好友收到邀请
-define(GS2U_Invitefriendstobed,4566).
-record(pk_GS2U_Invitefriendstobed,{
	%% UInt64 邀请人的ID
	roleID = 0,
	%% UInt64邀请好友要进的家园ID
	homeID = 0,
	%% Byte 家具区域1	
	areaType = 0,
	%% UInt64家具唯一ID
	itemUID = 0
}).

%% 
%% //加载小屋数据结果
-define(GS2U_LoadFurniTrueResult_Sync,63051).
-record(pk_GS2U_LoadFurniTrueResult_Sync,{
	%% Boolean是否成功
	isSucc = false
}).

%% 
%% // 取出结果
-define(GS2U_PutOutPetFarmingResults_Sync,15080).
-record(pk_GS2U_PutOutPetFarmingResults_Sync,{
	%% UInt64 要取哪个家具上
	itemUid = 0,
	%% Byte 1，成功，2失败
	result = 0,
	%% UInt16
	petID = 0,
	%% UInt16获得经验
	exp = 0,
	%% UInt16放置了的时间，分钟为单位
	minutes = 0
}).

%% 
%% // 饲养区放置宠物的结果
-define(GS2U_PutPetInFarmingResults_Sync,25191).
-record(pk_GS2U_PutPetInFarmingResults_Sync,{
	%% Byte 1，成功，2超过当前最大放置数量
	result = 0,
	%% FarmingPet
	petFarming
}).

%% 
%% //返回保存结果
-define(GS2U_SaveFurniTrueResult_Sync,60462).
-record(pk_GS2U_SaveFurniTrueResult_Sync,{
	%% Boolean是否成功
	isSucc = false,
	%% UInt16墙的道具ID
	change_wallID = 0,
	%% UInt16地板的道具ID
	chang_floorID = 0,
	%% HomeLayoutInfo添加的家具
	add_furnitrueData = [],
	%% HomeLayoutInfo修改的家具
	change_furnitrueData = []
}).

%% 
%% //进入家园 初始化 所有家具数据
-define(GS2U_SendAllFurniInfo_Sync,12587).
-record(pk_GS2U_SendAllFurniInfo_Sync,{
	%% String问候语
	greetings = "",
	%% Byte小屋等级
	furniTrueLevel = 0,
	%% Byte小屋面积扩展等级
	extendLevel = 0,
	%% UInt16墙的道具ID
	wallID = 0,
	%% UInt16地板的道具ID
	floorID = 0,
	%% Boolean装修模式
	isdecorate = false,
	%% HomeLayoutInfo家园
	betweenExampleData = [],
	%% FurniInteractTrueData家具交互数据
	interactList = []
}).

%% 
%% //发送预告函  登录有就发，没有就不发  在线时间到会发
-define(GS2U_SendHomeLetter,34509).
-record(pk_GS2U_SendHomeLetter,{
	%% HomeLetter背包里面的预告函对应的数据
	letter
}).

%% 
-define(GS2U_SetGreetingsResult_Sync,17845).
-record(pk_GS2U_SetGreetingsResult_Sync,{
	%% Boolean是否成功
	isSuccuss = false,
	%% String主人写的问候语
	greetings = ""
}).

%% 
%% //使用结果
-define(GS2U_UseFurnitrueResult,9902).
-record(pk_GS2U_UseFurnitrueResult,{
	%% Boolean是否上下
	isUp = false,
	%% UInt64操作人
	roleID = 0,
	%% UInt64家具唯一ID
	itemUID = 0,
	%% Byte 位置	
	seatID = 0,
	%% Boolean是否双人睡觉、true开始 计算经验，false停止，如果没有的则不管
	isdoubleSleep = false
}).

%% 
%% // 返回拜访记录
-define(GS2U_VisitRecord,29792).
-record(pk_GS2U_VisitRecord,{
	%% VisitRecord 拜访记录
	lists = []
}).

-record(pk_GivingFurniTrue,{
	%% UInt16
	itemID = 0,
	%% UInt16
	num = 0
}).

-record(pk_HomeArea,{
	%% UInt64
	homeID = 0,
	%% UInt32 房屋区域ID，1居所，2庭院，3饲养区，4种植区A，5温泉，6篝火区，7许愿池，8种植区B，9种植区C
	areaID = 0,
	%% UInt32 区域等级
	areaLvl = 0
}).

-record(pk_HomeLayoutInfo,{
	%% UInt64家具唯一ID
	uid = 0,
	%% UInt64拥有者ID
	roleID = 0,
	%% UInt16
	itemID = 0,
	%% Int32格子ID
	gridID = 0,
	%% Int32旋转
	rotationY = 0,
	%% Byte家具类型:1为普通家具，2可多人交互，3为精灵球可养殖，4位种植，5，家具仓库
	type = 0
}).

-record(pk_HomeLetter,{
	%% UInt64唯一ID
	itemUID = 0,
	%% UInt64结束时间
	overTime = 0
}).

-record(pk_HomeVisit,{
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% UInt32 玩家等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% UInt64
	homeID = 0,
	%% Int32 亲密度，非好友为-1
	closeness = 0,
	%% Byte 自定义头像MD5(16byte)
	face = [],
	%% Int32华丽度
	stylish = 0,
	%% Boolean是否可以摘菜
	isCanPick = false,
	%% Boolean是否装修模式,true 是 else 不是
	isdecorate = false
}).

-record(pk_Plant,{
	%% UInt64
	homeID = 0,
	%% Byte 4种植区A，8种植区B，9种植区C
	areaType = 0,
	%% UInt64 种植在家具上的ITEMUID点（）
	itemUid = 0,
	%% UInt16 作物ID，对应配置表plant.id
	id = 0,
	%% UInt32 种植时间
	time = 0,
	%% Byte 健康值
	health = 0,
	%% Byte 当日浇水次数
	wateringCount = 0,
	%% UInt32 最后浇水时间
	wateringTime = 0,
	%% Byte 当日施肥次数
	compostCount = 0,
	%% Byte 最后施肥时间
	compostTime = 0,
	%% Boolean 是否处于虫害状态
	isPestis = false
}).

%% 
%% // 修改家园名字
-define(U2GS_ChangeHomeName,33104).
-record(pk_U2GS_ChangeHomeName,{
	%% UInt64
	homeID = 0,
	%% String
	homeName = ""
}).

%% 
%% //切换 装修模式
-define(U2GS_ChangedecorateModel,20878).
-record(pk_U2GS_ChangedecorateModel,{
	%% UInt64
	homeID = 0,
	%% Byte 家具区域1	
	areaType = 0,
	%% Boolean是否装修，选择装修 传TRUE,装修完了，取消装修，退出，下线，发FLASE
	isDecorate = false
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 请求创建家园，创建成功，返回GS2U_HomeInfo
-define(U2GS_CreateHome,45029).
-record(pk_U2GS_CreateHome,{
	%% UInt32 玩家选择的区域ID，home.xlsx中的id
	adminAreaID = 0,
	%% String 创建家园时，名字
	homeName = ""
}).

%% 
%% //删除场景里面的家具
-define(U2GS_DelSenceTheFurniTrue,40780).
-record(pk_U2GS_DelSenceTheFurniTrue,{
	%% UInt64
	homeID = 0,
	%% Byte 家具区域1	
	areaType = 0,
	%% UInt64家具唯一ID
	uid = 0
}).

%% 
%% //请求进入家园位面
-define(U2GS_EnterBitHome,40930).
-record(pk_U2GS_EnterBitHome,{
	%% UInt64唯一ID
	itemUID = 0
}).

%% 
%% // 请求进入家园
-define(U2GS_EnterHome,2529).
-record(pk_U2GS_EnterHome,{
	%% UInt64 进入家园
	roleID = 0,
	%% Byte 进入标志，1进入居所，2进入庭院
	flag = 0
}).

%% 
%% //扩展面积高度
-define(U2GS_ExtendArea,63689).
-record(pk_U2GS_ExtendArea,{
	%% UInt64
	homeID = 0,
	%% Byte 家具区域1
	areaType = 0
}).

%% 
%% // 进食！
-define(U2GS_GetPetFood,8929).
-record(pk_U2GS_GetPetFood,{
	%% UInt64 要喂在哪个家具上
	itemUid = 0,
	%% UInt64
	homeID = 0,
	%% UInt16
	petID = 0,
	%% UInt16 可能消耗的道具ID
	itemID = 0,
	%% Byte 3饲养区	
	areaType = 0
}).

%% 
%% //赠送家具给伴侣
-define(U2GS_GivingFurniTrueForPartner,14027).
-record(pk_U2GS_GivingFurniTrueForPartner,{
	%% UInt64伴侣的RoleID
	partherRoleID = 0,
	%% UInt64
	homeID = 0,
	%% Byte 家具区域1	
	areaType = 0,
	%% UInt16赠送的家具ID
	itemID = 0,
	%% UInt16
	num = 0
}).

%% 
%% // 种植区_各种操作
%% // 操作类型：
%% // 1.种植，需要消耗道具；
%% // 2.清除；
%% // 3.收获；
%% // 4.浇水；
%% // 5.施肥，需要消耗道具；
%% // 6.除虫
-define(U2GS_HomePlantOperate_Request,51650).
-record(pk_U2GS_HomePlantOperate_Request,{
	%% UInt64
	homeID = 0,
	%% Byte 4种植区A，8种植区B，9种植区C
	areaType = 0,
	%% UInt64 种植在家具上的UID
	itemUid = 0,
	%% Byte 操作类型
	operateType = 0,
	%% UInt16 可能消耗的道具ID
	itemID = 0
}).

%% 
%% // 请求家园可拜访列表
-define(U2GS_HomeVisit,29314).
-record(pk_U2GS_HomeVisit,{
	%% Byte 请求好友的页数，为0表示请求邻居
	paga = 0
}).

%% 
%% //邀请好友上床
-define(U2GS_Invitefriendstobed,61816).
-record(pk_U2GS_Invitefriendstobed,{
	%% UInt64 邀请目标的ID
	roleID = 0,
	%% UInt64邀请好友要进的家园ID
	homeID = 0,
	%% Byte 家具区域1	
	areaType = 0,
	%% UInt64家具唯一ID
	itemUID = 0
}).

%% 
%% //加载小屋数据
-define(U2GS_LoadFurniTrueScheme,49113).
-record(pk_U2GS_LoadFurniTrueScheme,{
	%% UInt64
	homeID = 0,
	%% Byte 家具区域1	
	areaType = 0
}).

%% 
%% // 取出宠物
-define(U2GS_PutOutPetFarming,50410).
-record(pk_U2GS_PutOutPetFarming,{
	%% UInt64 要取哪个家具上
	itemUid = 0,
	%% UInt64
	homeID = 0,
	%% UInt16
	petID = 0,
	%% Byte 3饲养区	
	areaType = 0
}).

%% 
%% // 放置宠物进饲养区
-define(U2GS_PutPetInFarming,32301).
-record(pk_U2GS_PutPetInFarming,{
	%% UInt64
	homeID = 0,
	%% UInt16
	petID = 0,
	%% Byte 3饲养区
	areaType = 0,
	%% UInt64 要饲养哪个家具上
	itemUid = 0
}).

%% 
%% // 请求家园信息
-define(U2GS_RequestHomeInfo,56926).
-record(pk_U2GS_RequestHomeInfo,{
	%% UInt64 主人ID
	roleID = 0,
	%% Boolean是否给出错误提示
	isShowErrCode = false
}).

%% 
%% // 请求拜访记录
-define(U2GS_RequestVisitRecord,2847).
-record(pk_U2GS_RequestVisitRecord,{
	%% UInt64
	roleID = 0
}).

%% 
%% //保存设计的小屋方案
-define(U2GS_SaveFurniTrueScheme,17498).
-record(pk_U2GS_SaveFurniTrueScheme,{
	%% UInt64
	homeID = 0,
	%% Byte 家具区域1	
	areaType = 0,
	%% UInt16墙的道具ID,没有改变发0过来
	change_wallID = 0,
	%% UInt16地板的道具ID，没有改变发0过来
	chang_floorID = 0,
	%% HomeLayoutInfo添加的家具
	add_furnitrueData = [],
	%% HomeLayoutInfo修改的家具
	change_furnitrueData = []
}).

%% 
%% //主人问候
-define(U2GS_SetGreetings,18410).
-record(pk_U2GS_SetGreetings,{
	%% UInt64
	homeID = 0,
	%% Byte 家具区域1
	areaType = 0,
	%% String主人写的问候语
	greetings = ""
}).

%% 
%% // 升级家园
-define(U2GS_UpgradeHome,47985).
-record(pk_U2GS_UpgradeHome,{
	%% UpgradeHomeData
	upgredeDataList = []
}).

%% 
%% // 升级房屋
-define(U2GS_UpgradeHomeArea,43370).
-record(pk_U2GS_UpgradeHomeArea,{
	%% UInt64
	homeID = 0,
	%% Byte 房屋区域ID，1居所，2庭院，3饲养区，4种植区A，5温泉，6篝火区，7许愿池，8种植区B，9种植区C
	areaID = 0
}).

%% 
%% //使用家具，比如睡觉，坐沙发
-define(U2GS_UseFurnitrue,16395).
-record(pk_U2GS_UseFurnitrue,{
	%% UInt64
	homeID = 0,
	%% Byte 家具区域1	
	areaType = 0,
	%% UInt64家具唯一ID
	itemUID = 0,
	%% Boolean 坐上 true,下来 FALSE
	isUp = false
}).

-record(pk_UpgradeHomeData,{
	%% UInt16
	itemID = 0,
	%% UInt16
	num = 0
}).

-record(pk_VisitRecord,{
	%% UInt64
	roleID = 0,
	%% String
	roleName = "",
	%% Byte 关系类型：1好友，2伴侣男，3伴侣女，4陌生人
	relationType = 0,
	%% Byte 操作记录：1拜访，2收菜，3菜熟了，4菜长虫了，5健康低于20，6 宠物经验休息满了，7宠物可以喂养了，7家园可以升级了
	opType = 0,
	%% UInt32
	opParam1 = 0,
	%% UInt32
	opParam2 = 0,
	%% UInt32产物ID 
	opParam3 = 0,
	%% UInt64 时间戳
	timestamp = 0
}).

%% 
%% // 上线同步最近的赠礼记录
-define(GS2U_GiftHistory_Sync,14570).
-record(pk_GS2U_GiftHistory_Sync,{
	%% GiftHistory 多条记录
	listHistory = [],
	%% NameTable 名称表
	nameTables = [],
	%% UInt16 已收到的道具ID组
	listItemID = [],
	%% UInt16 道具ID组对应的道具数量
	listItemCount = []
}).

%% 
-define(GS2U_Gift_Ack,58086).
-record(pk_GS2U_Gift_Ack,{
	%% GiftHistory 单条记录
	history,
	%% NameTable 名称表
	nameTables = []
}).

%% 
%% // 同步魅力值变化
-define(GS2U_IdentityCharm_Sync,24221).
-record(pk_GS2U_IdentityCharm_Sync,{
	%% UInt64 操作者
	roleID = 0,
	%% UInt64 被操作者
	tarRoleID = 0,
	%% UInt32 变化值
	valueUpdate = 0,
	%% UInt32 新值
	valueNew = 0
}).

%% 
%% // 反馈编辑相册信息
-define(GS2U_IdentityEditPic_Ack,50360).
-record(pk_GS2U_IdentityEditPic_Ack,{
	%% MD5 相册信息集，其元素为多个MD5(16byte)
	idi_listPic = []
}).

%% 
%% // 反馈编辑标签结果
-define(GS2U_IdentityEditTag_Ack,61320).
-record(pk_GS2U_IdentityEditTag_Ack,{
	%% Byte 标签信息集，其元素值参考identity_tag.id
	idi_listTag = []
}).

%% 
%% // 同步点赞值变化
-define(GS2U_IdentityLike_Sync,38117).
-record(pk_GS2U_IdentityLike_Sync,{
	%% UInt64 操作者
	roleID = 0,
	%% UInt64 被操作者
	tarRoleID = 0,
	%% UInt32 变化值
	valueUpdate = 0,
	%% UInt32 新值
	valueNew = 0
}).

%% 
%% // 反馈下载图片请求_数据
-define(GS2U_IdentityPicDownloadData_Ack,15156).
-record(pk_GS2U_IdentityPicDownloadData_Ack,{
	%% Byte 图片MD5(16byte)
	md5 = [],
	%% UInt32 数据尺寸（单位字节）
	size = 0,
	%% UInt16 数据划分段数
	count = 0,
	%% UInt16 数据段索引
	index = 0,
	%% Byte 数据
	data = []
}).

%% 
%% // 推送图片数据
-define(GS2U_IdentityPicDownloadData_Sync,1988).
-record(pk_GS2U_IdentityPicDownloadData_Sync,{
	%% Byte 图片MD5(16byte)
	md5 = [],
	%% UInt32 数据尺寸（单位字节）
	size = 0,
	%% UInt16 数据划分段数
	count = 0,
	%% UInt16 数据段索引
	index = 0,
	%% Byte 数据
	data = []
}).

%% 
%% // 反馈下载图片请求
-define(GS2U_IdentityPicDownloadError_Ack,38726).
-record(pk_GS2U_IdentityPicDownloadError_Ack,{
	%% Byte 图片MD5(16byte)
	md5 = [],
	%% Byte 无法下载的错误类型（0照片不存在1等待过审）
	error = 0
}).

%% 
%% // 反馈上传图片请求
-define(GS2U_IdentityPicUpload_Ack,3071).
-record(pk_GS2U_IdentityPicUpload_Ack,{
	%% Byte 图片MD5(16byte)
	md5 = [],
	%% Boolean true上传完毕或已经存在；false需要继续上传
	isComplete = false
}).

%% 
%% // 反馈身份证信息
-define(GS2U_Identity_Ack,14736).
-record(pk_GS2U_Identity_Ack,{
	%% UInt64 角色ID
	id = 0,
	%% UInt64 对象唯一码，不在线时为0
	code = 0,
	%% String 姓名
	name = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Byte VIP等级
	vipLv = 0,
	%% UInt32 赞
	like = 0,
	%% UInt32 魅力值
	charm = 0,
	%% Boolean 当日是否向该角色点赞
	isGiveLike = false,
	%% String 家族名
	familyName = "",
	%% Byte 年龄，默认值255表示未设置。取值参考globalsetup.identity_age_limit
	idi_age = 0,
	%% Byte 出生月，默认值0表示未设置
	idi_birthmonth = 0,
	%% Byte 出生日，默认值0表示未设置
	idi_birthday = 0,
	%% Byte 星座，默认值0表示未设置。
	idi_zodiac = 0,
	%% Byte 血型，默认值0表示未设置。
	idi_bloodType = 0,
	%% Byte 故乡信息1，默认值0表示未设置。取值参考identity_area.id1
	idi_hometown1 = 0,
	%% Byte 故乡信息2，默认值0表示未设置。取值参考identity_area.id2
	idi_hometown2 = 0,
	%% Byte 所在地信息1，默认值0表示未设置。取值参考identity_area.id1
	idi_location1 = 0,
	%% Byte 所在地信息2，默认值0表示未设置。取值参考identity_area.id2
	idi_location2 = 0,
	%% String 自定义签名，长度参考globalsetup.identity_sign_count
	idi_sign = "",
	%% Byte 自定义头像MD5(16byte)
	idi_face = [],
	%% Byte 标签信息集，其元素值参考identity_tag.id
	idi_listTag = [],
	%% MD5 相册信息集，其元素为多个MD5(16byte)
	idi_listPic = []
}).

%% 
-define(GS2U_Report_Ack,21422).
-record(pk_GS2U_Report_Ack,{
	%% UInt64 举报目标角色ID
	tarRoleID = 0
}).

-record(pk_GiftHistory,{
	%% UInt64 内部算法使用序号，为了使用统一的数据结构就放在这里，客户端可使用该序号作为排序
	index = 0,
	%% UInt32 时间戳
	time = 0,
	%% UInt64 赠送者角色ID
	roleID = 0,
	%% UInt64 赠送目标角色ID
	tarRoleID = 0,
	%% UInt16 赠送道具ID
	itemID = 0,
	%% UInt16 赠送道具数量
	itemCount = 0,
	%% UInt32 魅力值变化量
	charmUpdate = 0
}).

-record(pk_MD5,{
	%% Byte
	md5 = []
}).

-record(pk_NameTable,{
	%% UInt64 角色ID
	id = 0,
	%% String 角色名
	name = ""
}).

-record(pk_RoleHeadPic,{
	%% UInt64
	roleID = 0,
	%% Byte 图片MD5(16byte)
	md5 = []
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 编辑身份证信息_年龄
-define(U2GS2U_IdentityEditAge,44844).
-record(pk_U2GS2U_IdentityEditAge,{
	%% Byte 年龄，默认值255表示未设置。取值参考globalsetup.identity_age_limit
	idi_age = 0
}).

%% 
%% // 编辑身份证信息_生日
-define(U2GS2U_IdentityEditBirth,47244).
-record(pk_U2GS2U_IdentityEditBirth,{
	%% Byte 出生月，默认值0表示未设置
	idi_birthmonth = 0,
	%% Byte 出生日，默认值0表示未设置
	idi_birthday = 0
}).

%% 
%% // 从1到12依次为：白羊金牛双子巨蟹狮子处女天秤天蝎射手摩羯水瓶双鱼
%% // 编辑身份证信息_血型
-define(U2GS2U_IdentityEditBloodType,16013).
-record(pk_U2GS2U_IdentityEditBloodType,{
	%% Byte 血型，默认值0表示未设置。
	idi_bloodType = 0
}).

%% 
%% // 编辑头像信息
-define(U2GS2U_IdentityEditFace,42405).
-record(pk_U2GS2U_IdentityEditFace,{
	%% Byte 自定义头像MD5(16byte)
	idi_face = []
}).

%% 
%% // 从1到4依次为：A、B、AB、O
%% // 编辑身份证信息_故乡
-define(U2GS2U_IdentityEditHometown,27036).
-record(pk_U2GS2U_IdentityEditHometown,{
	%% Byte 故乡信息1，默认值0表示未设置。取值参考identity_area.id1
	idi_hometown1 = 0,
	%% Byte 故乡信息2，默认值0表示未设置。取值参考identity_area.id2
	idi_hometown2 = 0
}).

%% 
%% // 编辑身份证信息_所在地
-define(U2GS2U_IdentityEditLocation,58024).
-record(pk_U2GS2U_IdentityEditLocation,{
	%% Byte 所在地信息1，默认值0表示未设置。取值参考identity_area.id1
	idi_location1 = 0,
	%% Byte 所在地信息2，默认值0表示未设置。取值参考identity_area.id2
	idi_location2 = 0
}).

%% 
%% // 编辑签名信息
-define(U2GS2U_IdentityEditSign,36224).
-record(pk_U2GS2U_IdentityEditSign,{
	%% String 自定义签名，长度参考globalsetup.identity_sign_count
	idi_sign = ""
}).

%% 
%% // 编辑身份证信息_星座
-define(U2GS2U_IdentityEditZodiac,25735).
-record(pk_U2GS2U_IdentityEditZodiac,{
	%% Byte 星座，默认值0表示未设置。
	idi_zodiac = 0
}).

%% 
%% // 请求角色的头像数据
-define(U2GS2U_RequestRoleHeadPic,30552).
-record(pk_U2GS2U_RequestRoleHeadPic,{
	%% RoleHeadPic
	heads = []
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 赠礼
-define(U2GS_Gift_Request,34470).
-record(pk_U2GS_Gift_Request,{
	%% UInt64 赠送目标角色ID
	tarRoleID = 0,
	%% UInt16 赠送道具ID
	itemID = 0,
	%% UInt16 赠送道具数量
	itemCount = 0,
	%% String 祝福语（为空时使用默认祝福语）（赠送数量不足的话是无法发送走马灯的）
	content = ""
}).

%% 
%% // 添加标签
-define(U2GS_IdentityEditTagAdd_Request,45833).
-record(pk_U2GS_IdentityEditTagAdd_Request,{
	%% Byte 新增的标签信息集，其元素值参考identity_tag.id
	idi_listTag = []
}).

%% 
%% // 删除标签
-define(U2GS_IdentityEditTagDel_Request,23367).
-record(pk_U2GS_IdentityEditTagDel_Request,{
	%% Byte 标签信息，取值参考identity_tag.id
	idi_tag = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 下载图片请求_开始
-define(U2GS_IdentityPicDownloadBegin_Request,59335).
-record(pk_U2GS_IdentityPicDownloadBegin_Request,{
	%% Byte 图片MD5(16byte)
	md5 = [],
	%% UInt64 如果目标图片是跨服数据，则需要传递目标图片相关的角色ID，否则置为0
	id = 0
}).

%% 
%% // 下载图片请求_继续
-define(U2GS_IdentityPicDownloadContinue_Request,38621).
-record(pk_U2GS_IdentityPicDownloadContinue_Request,{
	%% Byte 图片MD5(16byte)
	md5 = []
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 上传图片请求_开始
-define(U2GS_IdentityPicUploadBegin_Request,38438).
-record(pk_U2GS_IdentityPicUploadBegin_Request,{
	%% Byte 图片MD5(16byte)
	md5 = [],
	%% UInt32 数据尺寸（单位字节）
	size = 0,
	%% Boolean 0删除；1新增
	opType = false,
	%% Byte 在相册中的位置，从0开始，目前最大为2
	pos = 0
}).

%% 
%% // 上传图片请求_数据
-define(U2GS_IdentityPicUploadData_Request,9005).
-record(pk_U2GS_IdentityPicUploadData_Request,{
	%% Byte 图片MD5(16byte)
	md5 = [],
	%% UInt16 数据划分段数
	count = 0,
	%% UInt16 数据段索引
	index = 0,
	%% Byte 数据
	data = []
}).

%% 
%% // 查询身份证信息
-define(U2GS_Identity_Request,45328).
-record(pk_U2GS_Identity_Request,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% //举报
-define(U2GS_Report_Request,57790).
-record(pk_U2GS_Report_Request,{
	%% UInt64 举报目标角色ID
	tarRoleID = 0
}).

%% 
%% // 购买商品成功后返回当日剩余可购次数
-define(GS2U_BuyItemQuotaNumber,56276).
-record(pk_GS2U_BuyItemQuotaNumber,{
	%% UInt16 商品ID
	itemid = 0,
	%% Int32 本商品当日剩余可购次数
	quotaNumber = 0
}).

%% 
-define(GS2U_LookInfoItemListAtMall,18589).
-record(pk_GS2U_LookInfoItemListAtMall,{
	%% LookInfoItemAtMall
	item_list = []
}).

%% 
-define(GS2U_LookInfoItemListAtNpcStore,4201).
-record(pk_GS2U_LookInfoItemListAtNpcStore,{
	%% UInt16商店类型
	storeType = 0,
	%% LookInfoItem
	item_list = []
}).

%% 
%% // 返回神秘商店物品列表
-define(GS2U_MysteriousShop,60944).
-record(pk_GS2U_MysteriousShop,{
	%% UInt32 等级阶段
	lvlPhase = 0,
	%% UInt32 下次刷新剩余秒数
	residueTime = 0,
	%% MysteriousShopItem 物品列表
	items = [],
	%% Int32 刷新神秘商店需要消耗的非绑定钻石，0不消耗，-1不能刷新，>0需要消耗多少非绑定钻石
	freshMSShopDaimond = 0
}).

%% 
%% //通用展示某功能获得的物品金币消息
-define(GS2U_ShowGainGoodsOrCoinsInfo,43635).
-record(pk_GS2U_ShowGainGoodsOrCoinsInfo,{
	%% String获得的途径或者来源 可以有可以没有
	gainReason = "",
	%% OneGoodsInfo得到的物品列表
	listGoods = [],
	%% OneCoinInfo得到的金币列表
	listcoins = []
}).

%% 
-define(GS2U_SingleUseItem,63098).
-record(pk_GS2U_SingleUseItem,{
	%% UInt16 道具ID
	itemID = 0
}).

%% 
-define(GS2U_UseItem,44334).
-record(pk_GS2U_UseItem,{
	%% UseItemCD 道具的CD信息
	vctUseItem = []
}).

%% 
-define(GS2U_UseItemExpInDanResult,32766).
-record(pk_GS2U_UseItemExpInDanResult,{
	%% UInt32 经验丹类型
	expInDanType = 0,
	%% UInt32 经验丹剩余时间
	remainTime = 0
}).

%% 
-define(GS2U_UseItemGainGoodsTips,28109).
-record(pk_GS2U_UseItemGainGoodsTips,{
	%% UseItemGainGoodsTips
	listTips = [],
	%% UseItemGainCoinTips
	coinTips = []
}).

%% 
-define(GS2U_UseItemResult,2331).
-record(pk_GS2U_UseItemResult,{
	%% UInt16 道具ID
	itemID = 0,
	%% UInt16 道具数量
	itemNum = 0,
	%% Int32
	result = 0
}).

-record(pk_GiftItemInfo,{
	%% UInt16
	itemid = 0,
	%% UInt16
	number = 0
}).

-record(pk_LookInfoItem,{
	%% UInt16商品ID
	itemid = 0,
	%% UInt32排序编号
	sortid = 0,
	%% Byte货币类型
	type = 0,
	%% UInt32价格
	value = 0,
	%% Byte品质
	quality = 0,
	%% UInt16使用等级
	useLevel = 0,
	%% Int32 本商品当日剩余可购次数
	quotaNumber = 0
}).

-record(pk_LookInfoItemAtMall,{
	%% UInt16商品ID
	itemid = 0,
	%% Byte排序编号
	sortid = 0,
	%% Byte货币类型
	type = 0,
	%% UInt32价格
	value = 0,
	%% UInt16余量
	stockCount = 0,
	%% UInt16前多少销量送礼
	stockGiftCount = 0,
	%% GiftItemInfo礼品列表
	gifts = [],
	%% UInt32开始时间
	saleStartTime = 0,
	%% UInt32结束时间
	saleEndTime = 0,
	%% Byte限购个数
	quotaNum = 0
}).

-record(pk_MysteriousShopItem,{
	%% UInt32商品唯一ID标示
	only_id = 0,
	%% UInt16商品ID
	itemid = 0,
	%% Byte货币类型
	money_type = 0,
	%% UInt32单价
	money = 0,
	%% Int32允许购买个数，0不允许购买，-1无限购买，>0可购买指定个数
	number = 0
}).

-record(pk_OneCoinInfo,{
	%% Byte 货币类型
	coinType = 0,
	%% UInt32 货币值
	value = 0
}).

-record(pk_OneGoodsInfo,{
	%% UInt32道具,装备,符文的ID
	itemID = 0,
	%% UInt16道具,装备,符文的数量
	itemNum = 0,
	%% Byte道具,装备,符文的品质 理论上是从配置表获取显示 
	quality = 0,
	%% Byte是否绑定
	isBind = 0
}).

-record(pk_RefindResInfo,{
	%% UInt32 
	id = 0,
	%% Int32 未完成次数
	number = 0
}).

%% 
%% // 请求和返回资源找回列表， 请求时参数传NULL
-define(RefindResList,56898).
-record(pk_RefindResList,{
	%% RefindResInfo
	resList = []
}).

%% 
%% // 购买军团商品
-define(U2GS_BuyItemAtGuildShopRequest,61972).
-record(pk_U2GS_BuyItemAtGuildShopRequest,{
	%% UInt16商品ID
	itemid = 0,
	%% UInt16购买数量
	number = 0
}).

%% 
-define(U2GS_BuyItemAtMallRequest,18590).
-record(pk_U2GS_BuyItemAtMallRequest,{
	%% UInt16商品ID
	itemid = 0,
	%% UInt16购买数量
	number = 0
}).

%% 
-define(U2GS_BuyItemAtNpcStoreRequest,26641).
-record(pk_U2GS_BuyItemAtNpcStoreRequest,{
	%% UInt64Npc流水号
	npccode = 0,
	%% UInt16商品ID
	itemid = 0,
	%% UInt16购买数量
	number = 0
}).

%% 
%% // 某商店并入玩家背包，故基于协议U2GS_BuyItemAtNpcStoreRequest
-define(U2GS_BuyItemAtShopIDRequest,18512).
-record(pk_U2GS_BuyItemAtShopIDRequest,{
	%% UInt64 商店ID
	shopID = 0,
	%% UInt16商品ID
	itemid = 0,
	%% UInt16购买数量
	number = 0
}).

%% 
%% // 请求购买神秘商店商品
-define(U2GS_BuyMysteriousShopItem,65471).
-record(pk_U2GS_BuyMysteriousShopItem,{
	%% UInt32 等级阶段
	lvlPhase = 0,
	%% UInt32 购买个数
	buynumber = 0,
	%% UInt32 商品唯一ID标示
	only_id = 0,
	%% UInt16 商品ID
	itemid = 0
}).

%% 
-define(U2GS_ConvenientBuyItem,14404).
-record(pk_U2GS_ConvenientBuyItem,{
	%% UInt32 物品ID
	itemid = 0,
	%% UInt32 购买个数
	buynumber = 0
}).

%% 
%% // 请求手动立即刷新神秘商店
-define(U2GS_FreshMSShop,15024).
-record(pk_U2GS_FreshMSShop,{
}).

%% 
-define(U2GS_LookInfoItemListAtMall,31583).
-record(pk_U2GS_LookInfoItemListAtMall,{
}).

%% 
-define(U2GS_LookInfoItemListAtNpcStore,55371).
-record(pk_U2GS_LookInfoItemListAtNpcStore,{
	%% UInt64Npc流水号
	npccode = 0
}).

%% 
%% // 某商店并入玩家背包，故基于协议U2GS_LookInfoItemListAtNpcStore修改
-define(U2GS_LookInfoItemListAtShopID,63472).
-record(pk_U2GS_LookInfoItemListAtShopID,{
	%% UInt64 商店ID
	shopID = 0
}).

%% 
%% // 一键找回资源
-define(U2GS_RefindResAll,11479).
-record(pk_U2GS_RefindResAll,{
	%% Byte 0: 免费找回 1：钻石找回
	type = 0
}).

%% 
%% // 找回单个资源
-define(U2GS_RefindResOne,10864).
-record(pk_U2GS_RefindResOne,{
	%% UInt32
	id = 0,
	%% Byte 0: 免费找回 1：钻石找回
	type = 0
}).

%% 
%% // 请求神秘商店商品列表
-define(U2GS_RequestMysteriousShop,4005).
-record(pk_U2GS_RequestMysteriousShop,{
}).

%% 
%% //使用物品
-define(U2GS_UseStarMoonBox,23711).
-record(pk_U2GS_UseStarMoonBox,{
	%% UInt64物品UID
	itemUID = 0,
	%% UInt16本次使用个数
	useNum = 0
}).

-record(pk_UseItemCD,{
	%% UInt16 道具组ID
	itemGroupID = 0,
	%% UInt32 道具组剩余CD时间，单位：毫秒
	remainCDTime = 0
}).

-record(pk_UseItemGainCoinTips,{
	%% Byte 货币类型
	coinType = 0,
	%% UInt32 货币值
	value = 0
}).

-record(pk_UseItemGainGoodsTips,{
	%% UInt32道具或者装备的ID
	itemID = 0,
	%% UInt16道具或者装备的数量
	itemNum = 0,
	%% Byte道具或者装备的品质
	quality = 0,
	%% Byte是否绑定
	isBind = 0
}).

%% 
%% //受赠获得幸运币
-define(GS2U_GainLuckyCoin,48806).
-record(pk_GS2U_GainLuckyCoin,{
	%% GainLuckyCoinInfo获得幸运币的信息
	gainLuckyCoinInfo,
	%% Int32目前幸运币数量
	count = 0,
	%% UInt64
	time = 0
}).

%% 
%% //赠送幸运币结果
-define(GS2U_GiveLuckyCoinResult,23997).
-record(pk_GS2U_GiveLuckyCoinResult,{
	%% UInt64赠予的朋友的id
	friendID = 0,
	%% Byte0：赠送失败1：赠送成功2：对方今日幸运币满了
	result = 0
}).

%% 
%% //进游戏时初始化受赠信息
-define(GS2U_InitGainLuckyCoinInfo,36672).
-record(pk_GS2U_InitGainLuckyCoinInfo,{
	%% GainLuckyCoinInfo
	gainLuckyCoinInfoList = [],
	%% Int32目前幸运币数量
	count = 0,
	%% UInt64
	time = 0
}).

%% 
%% //抽奖结果
-define(GS2U_LuckyDrawResult,38517).
-record(pk_GS2U_LuckyDrawResult,{
	%% Int32物品ID（道具ID是0默认失败，非0则是成功的）
	itemID = 0,
	%% Int32目前幸运币数量
	count = 0,
	%% UInt64
	time = 0
}).

-record(pk_GainLuckyCoinInfo,{
	%% UInt32赠送的时间多少分钟
	time = 0,
	%% UInt64赠送者
	friendID = 0
}).

%% 
%% //赠送幸运币
-define(U2GS_GiveLuckyCoin,21846).
-record(pk_U2GS_GiveLuckyCoin,{
	%% UInt64赠予的朋友的id
	friendID = 0
}).

%% 
%% //抽奖
-define(U2GS_LuckyDraw,61294).
-record(pk_U2GS_LuckyDraw,{
}).

%% 
%% //抽奖动画完
-define(U2GS_LuckyDrawEnd,5241).
-record(pk_U2GS_LuckyDrawEnd,{
}).

%% 
%% //一键赠送所有在线好友幸运币
-define(U2GS_OneKeyGiveLucky,25556).
-record(pk_U2GS_OneKeyGiveLucky,{
}).

%% 
%% // 服务器反馈获取邮件货币
-define(GS2U_DelMailCoin,50315).
-record(pk_GS2U_DelMailCoin,{
	%% UInt64 邮件ID
	mailID = 0
}).

%% 
%% // 服务器反馈获取邮件附件
-define(GS2U_DelMailItem,42981).
-record(pk_GS2U_DelMailItem,{
	%% UInt64 邮件ID
	mailID = 0,
	%% UInt64 附件中的道具UID
	itemUID = 0
}).

%% 
%% // 服务回复删除邮件的ID
-define(GS2U_DeleteMail,14274).
-record(pk_GS2U_DeleteMail,{
	%% UInt64
	mailID = 0
}).

%% 
%% // 一健提取返回结果
-define(GS2U_GetMailItemAll,19689).
-record(pk_GS2U_GetMailItemAll,{
	%% UInt64
	mailIDs = [],
	%% UInt16 成功一次性提取的邮件封数
	number = 0,
	%% MailItemAll
	items = [],
	%% MailCoin
	coins = []
}).

%% 
%% // 服务器回复锁定邮件
-define(GS2U_LockMail,8814).
-record(pk_GS2U_LockMail,{
	%% retMailOpt
	ret
}).

%% 
%% //邮件详细信息
-define(GS2U_Mail,507).
-record(pk_GS2U_Mail,{
	%% MailDetail
	detail
}).

%% 
%% // 服务器发送给客户端的邮件信息列表
-define(GS2U_MailInfo,3365).
-record(pk_GS2U_MailInfo,{
	%% MailInfo
	mailInfoList = []
}).

%% 
%% // 客户端发送或者回复邮件，服务器的反馈信息
-define(GS2U_SendMailAck,10374).
-record(pk_GS2U_SendMailAck,{
	%% String发送时的目标名字
	toRoleName = "",
	%% Boolean成功为1，失败为0
	isOK = false
}).

%% 
%% // 服务器回复解除锁定邮件
-define(GS2U_UnlockMail,47879).
-record(pk_GS2U_UnlockMail,{
	%% retMailOpt
	ret
}).

-record(pk_MailCoin,{
	%% Byte 货币类型：1.金币，2.绑定金币，3.钻石，4.声望，5.荣誉，6.点券，7.紫色精华，8.金色精华
	coinType = 0,
	%% UInt32 货币数量
	coinNum = 0
}).

-record(pk_MailDetail,{
	%% UInt64 邮件ID
	mailID = 0,
	%% UInt64 发送人的ID，系统邮件为0
	sendRoleID = 0,
	%% Boolean 是否锁定
	isLocked = false,
	%% Byte 邮件还可以保留的天数
	remainDay = 0,
	%% String 发送人的名字，系统邮件为空
	sendPlayerName = "",
	%% String 邮件标题
	mailTitle = "",
	%% String 邮件内容
	mailContent = "",
	%% MailItem 邮件的道具附件
	itemList = [],
	%% MailCoin 邮件的货币附件
	coinList = []
}).

-record(pk_MailInfo,{
	%% UInt64 邮件ID
	mailID = 0,
	%% String 邮件标题
	mailTitle = "",
	%% UInt64 阅读时间
	mailReadTime = 0,
	%% UInt64 发送时间
	mailSendTime = 0,
	%% Boolean true 有附件，false无附件
	ishaveAttach = false,
	%% String 发送者名字，如果是系统邮件则为空
	senderName = ""
}).

-record(pk_MailItem,{
	%% UInt64物品uid
	itemUID = 0,
	%% UInt32道具编号ID
	itemID = 0,
	%% UInt32堆叠个数
	itemNumber = 0,
	%% Byte品质
	quality = 0,
	%% Boolean 是否绑定
	isBind = false
}).

-record(pk_MailItemAll,{
	%% UInt32道具编号ID
	itemID = 0,
	%% UInt32堆叠个数
	itemNumber = 0
}).

%% 
%% // 客户端删除所有已读且无附件的邮件
-define(U2GS_DeleteAllReadMail,23877).
-record(pk_U2GS_DeleteAllReadMail,{
}).

%% 
%% // 客户端删除邮件
-define(U2GS_DeleteMail,46884).
-record(pk_U2GS_DeleteMail,{
	%% UInt64 邮件ID
	mailID = 0
}).

%% 
%% // 获取客户端传过来的需要删除的邮件列表
-define(U2GS_GetDeleteMails,28701).
-record(pk_U2GS_GetDeleteMails,{
	%% UInt64 邮件ID列表
	mailIDs = []
}).

%% 
%% // 客户端获取邮件货币
-define(U2GS_GetMailCoin,63480).
-record(pk_U2GS_GetMailCoin,{
	%% UInt64 邮件ID
	mailID = 0
}).

%% 
%% // 客户端获取邮件附件
-define(U2GS_GetMailItem,56146).
-record(pk_U2GS_GetMailItem,{
	%% UInt64 邮件ID
	mailID = 0,
	%% UInt64 附件中的道具UID
	itemUID = 0
}).

%% 
%% // 一健提取
-define(U2GS_GetMailItemAll,64363).
-record(pk_U2GS_GetMailItemAll,{
}).

%% 
%% // 客户端锁定邮件
-define(U2GS_LockMail,15616).
-record(pk_U2GS_LockMail,{
	%% UInt64 邮件ID
	mailID = 0
}).

%% 
%% // 客户端阅读邮件
-define(U2GS_ReadMail,24463).
-record(pk_U2GS_ReadMail,{
	%% UInt64 邮件ID
	mailID = 0
}).

%% 
%% // 客户端发送新邮件
-define(U2GS_SendMail,64073).
-record(pk_U2GS_SendMail,{
	%% String 收信人名字
	toRoleName = "",
	%% String 邮件标题
	mailTitle = "",
	%% String 邮件内容
	mailContent = ""
}).

%% 
%% // 客户端解除锁定邮件
-define(U2GS_UnlockMail,14953).
-record(pk_U2GS_UnlockMail,{
	%% UInt64 邮件ID
	mailID = 0
}).

-record(pk_retMailOpt,{
	%% UInt64 邮件ID
	mailID = 0,
	%% Boolean 是否成功
	result = false
}).

-record(pk_FashionConfigInfo,{
	%% Int32活动ID
	id = 0,
	%% Int32批次号
	batch = 0,
	%% fashionIDCob时装ID(区分男女,1男,0女)
	fashionID = [],
	%% itemIDCob道具盒ID(区分男女)
	itemID = [],
	%% Single折扣率
	discount = 0.0,
	%% Int32货币类型
	cointype = 0,
	%% UInt64原价
	original_price = 0,
	%% UInt64现价
	price = 0,
	%% UInt64开启时间时间戳
	start_time = 0,
	%% UInt64持续时间(小时))
	time = 0,
	%% String原画资源
	resources_bg = "",
	%% Int32时装可见性,1可见,0不可见
	fashion_show = 0
}).

%% 
-define(GS2U_FashionConfigInfo,42580).
-record(pk_GS2U_FashionConfigInfo,{
	%% Int321.当玩家上线时/2.当活动配置该改变时
	state = 0,
	%% FashionConfigInfo活动信息列表(目前只需要一个)
	configInfoList = []
}).

%% 
%% //团购积分奖励领取返回结果
%% //红点：
%% // 根据积分新值与GS2U_GroupBuyWhenOpen.rewardListInfo、GS2U_GroupBuyWhenOpen.rewardListInfo进行判定
-define(GS2U_GroupBuyGoodsBuyAck,47350).
-record(pk_GS2U_GroupBuyGoodsBuyAck,{
	%% Int320购买失败 1成功 其他待定
	buyCode = 0,
	%% Int32商品id
	id = 0,
	%% UInt16购买数量
	goodsNum = 0,
	%% UInt64 积分变化
	scoreAdd = 0,
	%% UInt64 积分新值
	scoreNew = 0,
	%% UInt64 冻结的钻石数量
	lockDiamond = 0,
	%% idAndCount 全体商品对应购买数量（能量值）
	goodsBuyCountListInfo = []
}).

%% 
%% //存在可领取奖励(积分变化达到兑换要求后主动推送)
-define(GS2U_GroupBuyRewardBuyAck,53069).
-record(pk_GS2U_GroupBuyRewardBuyAck,{
	%% Int320兑奖失败 1成功 其他待定
	buyCode = 0,
	%% Int32奖励id
	id = 0,
	%% idAndCount 全体商品对应购买数量（能量值）
	goodsBuyCountListInfo = []
}).

%% 
-define(GS2U_GroupBuyWhenOpen,62395).
-record(pk_GS2U_GroupBuyWhenOpen,{
	%% Byte0上线推送；1后台配置改变时推送；2请求打开面板时反馈
	state = 0,
	%% UInt32活动开始时间 格式如同协议GS2U_SyncServerTime UTC时间（相对于1970年第0秒），单位秒
	open_time = 0,
	%% UInt16持续时间(小时)
	limit_time = 0,
	%% UInt16积分领取延后时间(小时)
	score_add_time = 0,
	%% String 活动背景图
	image = "",
	%% GroupBuyGoodsInfo团购商品列表
	goodsListInfo = [],
	%% GroupBuyRewardInfo积分奖励列表
	rewardListInfo = [],
	%% UInt64个人积分
	personalScore = 0,
	%% Int32 个人积分奖励已领取
	rewardPersonalListInfo = [],
	%% idAndCount 个人商品对应购买数量（限购）
	goodsPersonalListInfo = []
}).

%% 
%% // 1.当玩家上线时/2.当活动配置该改变时(版本号不变)/3.当活动领取记录重置时(版本号改变) 推送的活动信息和玩家已领取奖励信息
%% // state=1 需要关注所有参数
%% // state=2 需要关注configInfoList
-define(GS2U_KoreaNaverConfigInfo,46562).
-record(pk_GS2U_KoreaNaverConfigInfo,{
	%% Int321.当玩家上线时/2.当活动配置该改变时
	state = 0,
	%% KoreaNaverConfigInfo活动信息列表(有且只有3个)
	configInfoList = [],
	%% KoreaNaverIdAndVer玩家已领取奖励(含版本号)
	rewardGetList = []
}).

%% 
%% // 客户端请求领奖后反馈
-define(GS2U_KoreaNaverRewardGetAck,61764).
-record(pk_GS2U_KoreaNaverRewardGetAck,{
	%% Int320兑奖失败 1成功 其他待定
	getCode = 0,
	%% Int32发起领奖请求时对应活动ID
	id = 0,
	%% Int32发起领奖请求时活动版本号
	ver = 0,
	%% KoreaNaverIdAndVer玩家已领取奖励(含版本号)
	rewardGetList = []
}).

%% 
%% //商城购买返回结果
-define(GS2U_MallBuyResult,2111).
-record(pk_GS2U_MallBuyResult,{
	%% UInt32
	db_id = 0,
	%% UInt320购买失败
	buyCount = 0
}).

%% 
%% //商城购买返回结果
-define(GS2U_MallBuyResult2,54231).
-record(pk_GS2U_MallBuyResult2,{
	%% UInt32
	db_id = 0,
	%% UInt320购买失败
	buyCount = 0
}).

%% 
%% //商城列表
-define(GS2U_MallInfoList,48388).
-record(pk_GS2U_MallInfoList,{
	%% Int32
	seed = 0,
	%% MallInfo
	mallinfolist = []
}).

%% 
%% //商城列表
-define(GS2U_MallInfoList2,60566).
-record(pk_GS2U_MallInfoList2,{
	%% Int32
	seed = 0,
	%% MallInfo
	mallinfolist = []
}).

%% 
%% //商城优惠列表
-define(GS2U_MallPriceList,23547).
-record(pk_GS2U_MallPriceList,{
	%% MallInfo
	mallinfolist = []
}).

%% 
%% //杨传龙不同意修改消息，此处作冗余处理
%% //商城优惠列表
-define(GS2U_MallPriceList2,17483).
-record(pk_GS2U_MallPriceList2,{
	%% MallInfo
	mallinfolist = []
}).

-record(pk_GroupBuyGoodsInfo,{
	%% Int32商品id
	id = 0,
	%% Int32限购数
	collect_num = 0,
	%% String商品的名称
	product_name = "",
	%% String配置ICON路径
	product_icon = "",
	%% Int32品质框
	product_quality = 0,
	%% UInt64原价,仅显示
	price = 0,
	%% UInt64实际默认价格
	true_price = 0,
	%% UInt64打折需要数量1
	rebate1_num = 0,
	%% UInt64第1次折扣
	rebate1_price = 0,
	%% UInt64打折需要数量2
	rebate2_num = 0,
	%% UInt64第2次折扣	
	rebate2_price = 0,
	%% UInt64打折需要数量3	
	rebate3_num = 0,
	%% UInt64第3次折扣	
	rebate3_price = 0,
	%% UInt64打折需要数量4	
	rebate4_num = 0,
	%% UInt64第4次折扣	
	rebate4_price = 0,
	%% UInt64打折需要数量5
	rebate5_num = 0,
	%% UInt64第5次折扣
	rebate5_price = 0,
	%% UInt16道具1的id	
	item1_id = 0,
	%% UInt16道具1数量	
	item1_num = 0,
	%% UInt16道具2的id	
	item2_id = 0,
	%% UInt16道具2数量	
	item2_num = 0,
	%% UInt16道具3的id	
	item3_id = 0,
	%% UInt16道具3数量	
	item3_num = 0,
	%% UInt16道具4的id	
	item4_id = 0,
	%% UInt16道具4数量	
	item4_num = 0,
	%% UInt16道具5的id	
	item5_id = 0,
	%% UInt16道具5数量	
	item5_num = 0,
	%% UInt64购买商品可累计的积分
	score = 0,
	%% UInt64 购买总量（能量值）
	buy_count = 0
}).

-record(pk_GroupBuyRewardInfo,{
	%% Int32奖励id
	id = 0,
	%% UInt64积分对应
	score = 0,
	%% UInt16奖励道具1id
	reward1_id = 0,
	%% UInt16道具1的数量
	reward1_num = 0,
	%% UInt16奖励道具2id
	reward2_id = 0,
	%% UInt16道具2的数量
	reward2_num = 0,
	%% UInt16奖励道具3id
	reward3_id = 0,
	%% UInt16道具3的数量
	reward3_num = 0,
	%% UInt16奖励道具4id
	reward4_id = 0,
	%% UInt16道具4的数量
	reward4_num = 0,
	%% UInt16奖励道具5id
	reward5_id = 0,
	%% UInt16道具5的数量
	reward5_num = 0
}).

-record(pk_KoreaNaverConfigInfo,{
	%% Int32活动ID(只有1/2/3 三种)
	id = 0,
	%% String活动名
	name = "",
	%% Int32活动开始时间
	beginTime = 0,
	%% Int32活动结束时间
	endTime = 0,
	%% Int32奖励道具ID
	itemID = 0,
	%% Int32奖励道具数量
	itemCount = 0,
	%% String活动参数(只有OnJoined/OnPostedArticle/OnPostedComment三种)
	param = "",
	%% Int32版本号(仅当活动领取记录重置时改变(+1))
	ver = 0,
	%% Int32活动序号(修改活动内容之后原活动不会删除, 只会新增一个活动需要+1的活动, 客户端不需要关注此参数, 每次只会把最新的活动内容发给客户端)
	id_num = 0,
	%% Int32论坛板块ID(当论坛调用OnPostedArticleListener接口时需要判断是否符合, 用来过滤多余请求)
	menuID = 0,
	%% Int32留言板ID(当论坛调用OnPostedCommentListener接口时需要判断是否符合, 用来过滤多余请求)
	articleID = 0
}).

-record(pk_KoreaNaverIdAndVer,{
	%% Int32活动ID
	id = 0,
	%% Int32活动版本号
	ver = 0
}).

-record(pk_MallInfo,{
	%% UInt32商品唯一标识码 itemid+type+submenu
	db_id = 0,
	%% UInt32
	itemid = 0,
	%% UInt16默认购买数量
	buyNumDefalut = 0,
	%% SByte主菜单 物品类型	优惠:1|成长:2|时装:3|积分:4
	mainmenu = 0,
	%% SByte子菜单，每个type下面的分类选项
	submenu = 0,
	%% Int32非绑定钻石售价  非绑定钻石:3
	gold = 0,
	%% Int32绑定钻石	 	绑定钻石:6
	bind_gold = 0,
	%% Int32积分购买
	use_integral = 0,
	%% Int32可以获得的积分
	get_integral = 0,
	%% Int32购买结束倒计时	单位:s
	lefttime = 0,
	%% Int32限购剩余数
	leftcount = 0,
	%% Int32限购数
	leftcountMax = 0,
	%% Int32排序号
	sortNumber = 0,
	%% SByte打折				default:100
	rebate = 0,
	%% SByte显示状态
	showtype = 0,
	%% SByte限制类型 0为不限购 1为玩家角色限购 2全服务器限购 3为玩家角色每日限购
	limitType = 0,
	%% Byte是否可以赠送，0不可以赠送
	present = 0
}).

%% 
%% //团购活动购买
-define(U2GS_GroupBuyGoodsBuyRequest,40106).
-record(pk_U2GS_GroupBuyGoodsBuyRequest,{
	%% Int32商品id
	id = 0,
	%% UInt16购买数量
	goodsNum = 0
}).

%% 
%% //积分领取奖励
-define(U2GS_GroupBuyRewardBuyRequest,58205).
-record(pk_U2GS_GroupBuyRewardBuyRequest,{
	%% Int32奖励id
	id = 0
}).

%% 
%% // 打开团购页面
-define(U2GS_GroupBuyWhenOpen,46221).
-record(pk_U2GS_GroupBuyWhenOpen,{
}).

%% 
%% //购买请求   同一页面不能有同一种ID的道具
-define(U2GS_ItemBuyRequest,57190).
-record(pk_U2GS_ItemBuyRequest,{
	%% UInt32
	db_id = 0,
	%% UInt32
	itemid = 0,
	%% Int32
	itemnum = 0,
	%% SByte金钱类型，
	moneytype = 0,
	%% UInt640,给自己， 否则给其他人买
	tarRoleID = 0
}).

%% 
%% //购买请求   同一页面不能有同一种ID的道具
-define(U2GS_ItemBuyRequest2,50460).
-record(pk_U2GS_ItemBuyRequest2,{
	%% UInt32
	db_id = 0,
	%% UInt32
	itemid = 0,
	%% Int32
	itemnum = 0,
	%% SByte金钱类型，
	moneytype = 0
}).

%% 
%% // 客户端请求领奖
-define(U2GS_KoreaNaverRewardGetRequest,38164).
-record(pk_U2GS_KoreaNaverRewardGetRequest,{
	%% Int32对应活动ID
	id = 0,
	%% Int32活动版本号
	ver = 0,
	%% String 论坛账号 新增,用于记录日志
	naverAccountID = "",
	%% Int32论坛板块ID
	menuID = 0,
	%% Int32留言板ID
	articleID = 0
}).

%% 
%% //打开请求
-define(U2GS_MallInfo,33516).
-record(pk_U2GS_MallInfo,{
	%% Int32第一次请求上传0
	seed = 0
}).

%% 
%% //打开请求
-define(U2GS_MallInfo2,9678).
-record(pk_U2GS_MallInfo2,{
	%% Int32第一次请求上传0
	seed = 0
}).

-record(pk_fashionIDCob,{
	%% Int32
	sex = 0,
	%% Int32
	fashionID = 0
}).

-record(pk_idAndCount,{
	%% Int32
	id = 0,
	%% Int32
	count = 0
}).

-record(pk_itemIDCob,{
	%% Int32
	itemID = 0,
	%% Int32
	count = 0
}).

%% 
-define(GS2U_AppointmentWeddingResult,1590).
-record(pk_GS2U_AppointmentWeddingResult,{
	%% Boolean 是否成功
	result = false
}).

%% 
%% //购买福袋返回
-define(GS2U_BuyLuckyBagResult,40459).
-record(pk_GS2U_BuyLuckyBagResult,{
	%% Byte档次
	level = 0,
	%% UInt32非绑
	givegifts = 0,
	%% UInt32绑钻
	bindGivegifts = 0,
	%% String
	roleName = "",
	%% UInt32奖励ID
	rewardItemID = 0,
	%% UInt16
	num = 0
}).

%% 
%% //在线同步收到的请帖
-define(GS2U_GivegifsResult,1005).
-record(pk_GS2U_GivegifsResult,{
	%% UInt64赠送ID	
	sendRoleID = 0,
	%% Boolean 是否成功
	result = false,
	%% UInt32非绑
	givegifts = 0,
	%% UInt32绑钻
	bindGivegifts = 0,
	%% UInt32彩礼ID
	giveGiftsID = 0,
	%% InvitedPlayerData 主人才有，客人为空
	givegiftsData
}).

%% 
-define(GS2U_InvitedPersonResult,40441).
-record(pk_GS2U_InvitedPersonResult,{
	%% Boolean 是否成功
	result = false,
	%% InvitedPlayerData
	data
}).

%% 
%% //上线登录发所有请帖
-define(GS2U_LoginInitWeddingKetubba,5603).
-record(pk_GS2U_LoginInitWeddingKetubba,{
	%% KetubbaData登录时候发送婚书请帖对应道具数据
	ketubbaList = []
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% // 不推荐使用 <->
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // _Request 表示客户端向服务端进行请求
%% // _Ack			表示服务端对客户端请求的反馈
%% // _Ask			表示服务端向客户端询问
%% // _Reply		表示客户端对服务端询问的反馈
%% // _Sync		表示即便客户端没有向服务端进行请求，服务端也可能主动发送该消息以同步信息
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 同步姻缘基本信息（上线后会同步，后面会在变化时同步）
-define(GS2U_MarriageBaseInfo_Sync,14801).
-record(pk_GS2U_MarriageBaseInfo_Sync,{
	%% UInt64 配偶角色ID（无配偶时为0）
	id = 0,
	%% String 配偶角色姓名
	name = "",
	%% Byte 配偶性别
	sex = 0,
	%% UInt32 结婚时间（服务器同步时间，自1970-01-01至今的秒数）
	weddingDay = 0,
	%% UInt32 亲密度
	closeness = 0
}).

%% 
%% // 申请（或确认）离婚反馈
-define(GS2U_MarriageBreak_Ack,40356).
-record(pk_GS2U_MarriageBreak_Ack,{
	%% UInt64 对方角色ID
	id = 0,
	%% String 对方角色姓名
	name = ""
}).

%% 
%% // 成功发送求婚请求的反馈，用于客户端刷新界面
-define(GS2U_MarriageProposeRefresh_Ack,44645).
-record(pk_GS2U_MarriageProposeRefresh_Ack,{
}).

%% 
%% // 反馈求婚结果（成功时反馈双方，失败时仅反馈求婚者）
-define(GS2U_MarriagePropose_Ack,25550).
-record(pk_GS2U_MarriagePropose_Ack,{
	%% UInt64 求婚者（或被求婚者）角色ID
	id = 0,
	%% String 求婚者（或被求婚者）角色姓名
	name = "",
	%% UInt32 求婚者使用道具ID
	item = 0,
	%% Boolean 是否成功
	isS = false
}).

%% 
%% // 询问目标是否接受求婚请求
-define(GS2U_MarriagePropose_Ask,23358).
-record(pk_GS2U_MarriagePropose_Ask,{
	%% UInt64 求婚者角色ID
	id = 0,
	%% String 求婚者角色姓名
	name = "",
	%% UInt32 求婚者使用道具ID
	item = 0,
	%% String 求婚宣言
	manifesto = ""
}).

%% 
%% // 伴侣的婚戒升级及突破同步（上线后会同步，后面会在变化时同步）
%% // 为避免显示混乱，不在客户端显示伴侣婚戒加成的具体属性
%% // 该协议已废弃
-define(GS2U_MarriageRingUpPartner_Sync,42904).
-record(pk_GS2U_MarriageRingUpPartner_Sync,{
	%% UInt32 旧有突破次数
	topOld = 0,
	%% UInt32 旧有婚戒经验
	expOld = 0,
	%% UInt32 旧有婚戒等级
	lvOld = 0,
	%% UInt32 新的突破次数
	topNew = 0,
	%% UInt32 新的婚戒经验
	expNew = 0,
	%% UInt32 新的婚戒等级
	lvNew = 0
}).

%% 
%% // 婚戒升级及突破同步（上线后会同步，后面会在变化时同步）
-define(GS2U_MarriageRingUp_Sync,24857).
-record(pk_GS2U_MarriageRingUp_Sync,{
	%% UInt32 旧有突破次数
	topOld = 0,
	%% UInt32 旧有婚戒经验
	expOld = 0,
	%% UInt32 旧有婚戒等级
	lvOld = 0,
	%% UInt32 新的突破次数
	topNew = 0,
	%% UInt32 新的婚戒经验
	expNew = 0,
	%% UInt32 新的婚戒等级
	lvNew = 0
}).

%% 
-define(GS2U_MarriageSkillUp_Ack,37984).
-record(pk_GS2U_MarriageSkillUp_Ack,{
	%% SkillInfoForMarraige
	skill,
	%% UInt32 旧有等级
	lvOld = 0,
	%% UInt32 新的等级
	lvNew = 0,
	%% UInt32 旧有经验
	expOld = 0
}).

%% 
%% // 同步夫妻技能信息
-define(GS2U_MarriageSkill_Sync,46119).
-record(pk_GS2U_MarriageSkill_Sync,{
	%% SkillInfoForMarraige
	listSkill = []
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 交接情缘任务时，可能需要提示队长是否要拉队员到附近
%% // 发动条件：其余条件皆满足，同地图ID但不同线路
%% // 询问队长是否要召唤队员
-define(GS2U_MarriageTask_Together_Ask1,57013).
-record(pk_GS2U_MarriageTask_Together_Ask1,{
	%% UInt64 伴侣ID
	roleID = 0,
	%% String 伴侣名
	roleName = ""
}).

%% 
%% // 队长如果同意就要去问队员是否同意
-define(GS2U_MarriageTask_Together_Ask2,58850).
-record(pk_GS2U_MarriageTask_Together_Ask2,{
	%% UInt64 伴侣ID
	roleID = 0,
	%% String 伴侣名
	roleName = ""
}).

%% 
%% //打开返回
-define(GS2U_OpenInvitePanelResult,36906).
-record(pk_GS2U_OpenInvitePanelResult,{
	%% InvitedPlayerData已经邀请的数据
	invitedPlayerList = []
}).

%% 
%% //在线同步收到的请帖
-define(GS2U_OpenketubbaResult,27681).
-record(pk_GS2U_OpenketubbaResult,{
	%% UInt64 目标ID
	roleId = 0,
	%% Byte1客人，2主人{包括对象也算}
	type = 0,
	%% UInt32非绑
	givegifts = 0,
	%% UInt32绑钻
	bindGivegifts = 0,
	%% InvitedPlayerData彩礼信息，主人才有，客人发[]空
	givegiftsList = [],
	%% Boolean0 没送 1送了
	isGivegifs = false,
	%% Byte婚礼档次
	level = 0
}).

%% 
%% //婚礼新人删除角色，切婚礼正在进行中
-define(GS2U_PlayerDeletRoleInWedding,15068).
-record(pk_GS2U_PlayerDeletRoleInWedding,{
}).

%% 
%% //玩家进入场景
-define(GS2U_PlayerEnterMapSucc,28019).
-record(pk_GS2U_PlayerEnterMapSucc,{
	%% SitNpcData进入场景发送交互的数据
	sitNpcDataList = [],
	%% UInt64新人ID
	weddingRoleID = 0,
	%% UInt32婚礼剩余时间，秒为单位
	lastTime = 0
}).

%% 
%% //抢红包返回
-define(GS2U_RobWeddingRedResult,38571).
-record(pk_GS2U_RobWeddingRedResult,{
	%% UInt321抢成功,2已经抢过了,3已经抢完了
	result = 0,
	%% UInt64新人ID
	roleID = 0,
	%% UInt16自己抢了好多钱新月币
	robNum = 0,
	%% RobRedData抢了红包的所有数据
	listRobRedData = []
}).

%% 
%% //婚礼进行中地图的阶段
-define(GS2U_UseNpcInteractiveReuslt,28969).
-record(pk_GS2U_UseNpcInteractiveReuslt,{
	%% Booleantrue坐上，false下车
	isUp = false,
	%% SitNpcData交互
	npcSitData
}).

%% 
%% //抽奖返回 
-define(GS2U_WeddingLotteryResult,43118).
-record(pk_GS2U_WeddingLotteryResult,{
	%% Byte抽中的下标索引
	lotteryIndex = 0,
	%% Byte消费类型
	costType = 0,
	%% UInt32非绑
	givegifts = 0,
	%% UInt32绑钻
	bindGivegifts = 0,
	%% String
	roleName = "",
	%% UInt32奖励ID
	rewardItemID = 0,
	%% UInt16
	num = 0
}).

%% 
%% //婚礼进行中地图的阶段
-define(GS2U_WeddingMapPhase,20515).
-record(pk_GS2U_WeddingMapPhase,{
	%% Byte阶段1自由活动，阶段2婚礼仪式，不准骚操作，阶段3自由活动，阶段4婚礼结束倒计时提前20秒给客服端发消息弹结束界面，5销毁地图
	phase = 0,
	%% UInt32每个阶段时间
	phase1Time = 0,
	%% Byte性别
	sex_1 = 0,
	%% Byte性别
	sex_2 = 0,
	%% Byte婚礼档次
	weddingLevel = 0,
	%% String
	name_1 = "",
	%% String
	name_2 = ""
}).

%% 
%% //婚礼红包状态
-define(GS2U_WeddingRedState,24192).
-record(pk_GS2U_WeddingRedState,{
	%% Boolean收到true 可以抢红包，把红包按钮显示出来，false结束或者没开始隐藏按钮
	isCanRobRed = false,
	%% UInt64新人ID
	roleID = 0
}).

%% 
%% //婚礼时间到邀请所有人进入场景
-define(GS2U_WeddingStartInviteAll,27662).
-record(pk_GS2U_WeddingStartInviteAll,{
	%% UInt64目标ID
	targetRoleID = 0,
	%% String
	name = "",
	%% String
	partnerName = ""
}).

%% 
%% //在线同步收到的请帖
-define(GS2U_receivedInvitationCard,45850).
-record(pk_GS2U_receivedInvitationCard,{
	%% KetubbaData登录时候发送婚书请帖对应道具数据
	ketubba
}).

-record(pk_InvitedPlayerData,{
	%% UInt64 角色ID
	roleId = 0,
	%% String 姓名
	name = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt32彩礼ID
	giveGiftsID = 0
}).

-record(pk_KetubbaData,{
	%% UInt64婚礼预约人
	roleId = 0,
	%% UInt64伴侣
	partnerRoleId = 0,
	%% UInt64相对于1970年的绝对时间哈
	startTime = 0,
	%% UInt64对应背包里面 请帖UID
	itemUID = 0,
	%% Byte type =1 客人，type =2婚礼主人
	type = 0,
	%% String
	name = "",
	%% String
	partnerName = "",
	%% Byte婚礼状态,1预约，2进行中，3已结束
	weddingState = 0
}).

-record(pk_RobRedData,{
	%% UInt64 角色ID
	roleId = 0,
	%% String 姓名
	name = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16抢了好多钱 新月币
	robNum = 0,
	%% UInt16 抢红包的时间，最短最快
	useTime = 0
}).

-record(pk_SitNpcData,{
	%% UInt64交互的CODE
	npcCode = 0,
	%% UInt64坐上的玩家  >0 有人，否则 没人
	sitRoleID = 0,
	%% Single
	npcX = 0.0,
	%% Single
	npcY = 0.0
}).

-record(pk_SkillInfoForMarraige,{
	%% UInt32 技能槽位ID
	id = 0,
	%% UInt32 技能槽位经验
	exp = 0
}).

%% 
%% //购买福袋
-define(U2GS_BuyLuckyBag,2340).
-record(pk_U2GS_BuyLuckyBag,{
	%% UInt64新人ID
	roleID = 0,
	%% Byte档次
	level = 0
}).

%% 
%% // 进入婚礼地图
-define(U2GS_EnterWeddingMap,55658).
-record(pk_U2GS_EnterWeddingMap,{
	%% UInt64目标ID
	targetRoleID = 0
}).

%% 
%% // 送彩礼
-define(U2GS_Givegifs,20770).
-record(pk_U2GS_Givegifs,{
	%% UInt64 目标ID
	roleId = 0,
	%% UInt16彩礼
	gifts = 0
}).

%% 
%% // 邀请
-define(U2GS_InvitedPerson,42866).
-record(pk_U2GS_InvitedPerson,{
	%% UInt64邀请人ID
	invitedPerson = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 接受情缘任务（任务ID由系统自动分配）
-define(U2GS_MarriageAcceptTask_Request,29341).
-record(pk_U2GS_MarriageAcceptTask_Request,{
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 申请（或确认）离婚请求
-define(U2GS_MarriageBreak_Request,60471).
-record(pk_U2GS_MarriageBreak_Request,{
	%% Boolean 是否为协议离婚
	isTeam = false
}).

%% 
%% // 目标反馈是否接受求婚请求
-define(U2GS_MarriagePropose_Reply,4641).
-record(pk_U2GS_MarriagePropose_Reply,{
	%% UInt64 求婚者角色ID
	id = 0,
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 求婚请求
-define(U2GS_MarriagePropose_Request,49410).
-record(pk_U2GS_MarriagePropose_Request,{
	%% UInt64 对方角色ID
	id = 0,
	%% UInt32 求婚者使用道具ID
	item = 0,
	%% String 求婚宣言
	manifesto = ""
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 婚戒升级及突破请求
-define(U2GS_MarriageRingUp_Request,7339).
-record(pk_U2GS_MarriageRingUp_Request,{
	%% UInt32 消耗亲密度（为0时突破）
	cost = 0
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 夫妻技能升级请求
-define(U2GS_MarriageSkillUp_Request,35764).
-record(pk_U2GS_MarriageSkillUp_Request,{
	%% UInt32 消耗亲密度
	cost = 0,
	%% UInt32 升级的目标技能槽位
	id = 0
}).

%% 
%% // 提交情缘任务（任务ID由系统自己找）
-define(U2GS_MarriageSubmitTask_Request,19197).
-record(pk_U2GS_MarriageSubmitTask_Request,{
}).

%% 
%% // 队长回复是否同意（可能失败，对队长有CD的ErrorCode）
-define(U2GS_MarriageTask_Together_Reply1,29326).
-record(pk_U2GS_MarriageTask_Together_Reply1,{
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% // 队员回复是否同意（可能失败，对队员有超时的ErrorCode）
-define(U2GS_MarriageTask_Together_Reply2,31163).
-record(pk_U2GS_MarriageTask_Together_Reply2,{
	%% Boolean 是否同意
	isAgreed = false
}).

%% 
%% // 打开邀请面板
-define(U2GS_OpenInvitePanel,25499).
-record(pk_U2GS_OpenInvitePanel,{
}).

%% 
%% // 打开婚书或者请帖
-define(U2GS_Openketubba,61418).
-record(pk_U2GS_Openketubba,{
	%% UInt64 目标ID
	itemUID = 0,
	%% Byte1客人，2主人{包括对象也算}
	type = 0
}).

%% 
%% //抢红包
-define(U2GS_RobWeddingRed,40372).
-record(pk_U2GS_RobWeddingRed,{
	%% UInt64新人ID
	roleID = 0
}).

%% 
%% //使用NPC交互
-define(U2GS_UseNpcInteractive,52526).
-record(pk_U2GS_UseNpcInteractive,{
	%% Booleantrue坐上，false下车
	isUp = false,
	%% UInt64交互的CODE
	npcCode = 0
}).

%% 
%% //婚礼抽奖
-define(U2GS_WeddingLottery,10651).
-record(pk_U2GS_WeddingLottery,{
	%% UInt64新人ID
	roleID = 0,
	%% Byte消耗类型,1,和2
	level = 0
}).

%% 
%% // 预约婚礼
-define(U2GS_appointmentWedding,11683).
-record(pk_U2GS_appointmentWedding,{
	%% UInt64相对于1970年的绝对时间哈
	startTime = 0,
	%% Byte预约档次
	level = 0
}).

%% 
%% //坐骑
-define(GS2U_LookMountInfo,39712).
-record(pk_GS2U_LookMountInfo,{
	%% MountInfo坐骑信息列表
	mountInfo
}).

%% 
%% //服务器返回坐骑系列操作结果（广播给其它玩家）
-define(GS2U_MountAck,46932).
-record(pk_GS2U_MountAck,{
	%% UInt64主人CODE
	code = 0,
	%% UInt16坐骑ID
	shape_id = 0,
	%% UInt321:上坐骑2:下坐骑
	opreate = 0
}).

%% 
%% //坐骑的外观列表(玩家获取的外观，包括购买的和升级获得的)
-define(GS2U_MountShapeList,57298).
-record(pk_GS2U_MountShapeList,{
	%% UInt16
	shape_list = []
}).

%% 
%% // 玩家获得新的坐骑外观
-define(GS2U_NewMountShape,476).
-record(pk_GS2U_NewMountShape,{
	%% UInt16
	new_shape_id = 0
}).

-record(pk_MountInfo,{
	%% Byte 坐骑等级
	level = 0,
	%% Byte 坐骑状态0:休息1:召唤
	state = 0,
	%% UInt32 坐骑当前进度
	curProcess = 0,
	%% UInt16 坐骑外观（升级之后可能改变）
	shape_id = 0
}).

%% 
%% // 坐骑易容
-define(MountShapeShift,10618).
-record(pk_MountShapeShift,{
	%% UInt16新的外观ID
	new_shape_id = 0
}).

%% 
%% // 坐骑喂养
-define(U2GS_FeedMount,44309).
-record(pk_U2GS_FeedMount,{
	%% UInt16喂养数量
	feedNum = 0
}).

%% 
%% //下坐骑
-define(U2GS_OffMount,23484).
-record(pk_U2GS_OffMount,{
}).

%% 
%% //上坐骑
-define(U2GS_OnMount,60500).
-record(pk_U2GS_OnMount,{
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // npc瞬间移动消息
-define(GS2U_NpcMomentMove,46886).
-record(pk_GS2U_NpcMomentMove,{
	%% UInt64 npcCode
	npcCode = 0,
	%% UInt32 npcid
	npcID = 0,
	%% Single 目标X
	tX = 0.0,
	%% Single 目标Y
	tY = 0.0
}).

%% 
%% // npc同步称号改变
-define(GS2U_NpcTitleChange,25583).
-record(pk_GS2U_NpcTitleChange,{
	%% NpcTitle
	npclists = []
}).

%% 
%% // 返回时空裂痕npc的信息
-define(GS2U_RequestRiftNpcInfo,26415).
-record(pk_GS2U_RequestRiftNpcInfo,{
	%% UInt64
	npcCode = 0,
	%% UInt32
	npcID = 0,
	%% UInt32 时空裂痕今日剩余可领奖次数
	surplusTimes = 0,
	%% UInt32 时空裂痕npc消失剩余时间(秒s)
	disappearTime = 0,
	%% UInt64 时空分组ID
	groupID = 0,
	%% UInt32 时空的位面ID
	bitplaneMapID = 0
}).

-record(pk_NpcTitle,{
	%% UInt64 npccode
	npccode = 0,
	%% String npc新称号
	new_title = ""
}).

%% 
%% // 请求进入时空裂痕
-define(U2GS_RequestEnterRift,61996).
-record(pk_U2GS_RequestEnterRift,{
	%% UInt64 时空分组ID
	groupID = 0,
	%% UInt32 时空的位面ID
	bitplaneMapID = 0
}).

%% 
%% // 请求时空裂痕npc的信息
-define(U2GS_RequestRiftNpcInfo,18129).
-record(pk_U2GS_RequestRiftNpcInfo,{
	%% UInt64 npcCode
	npcCode = 0
}).

-record(pk_AddProp,{
	%% Byte
	prop = 0,
	%% Single
	value = 0.0
}).

-record(pk_AssistBattleInfo,{
	%% UInt16宠物ID
	petID = 0,
	%% Byte位置
	slot = 0
}).

-record(pk_CatalogNode,{
	%% UInt16 章节ID 参考petWar表
	id = 0,
	%% Byte 星级	
	starLevel = 0
}).

%% 
%% // 同步当前奖励的级别	触发时机：1 登陆 2 领取奖励成功
-define(GS2U_AckRewardLevel,34380).
-record(pk_GS2U_AckRewardLevel,{
	%% Byte 奖励级别
	rewardLevel = 0
}).

%% 
%% // 响应排位
-define(GS2U_AckStandSort,24891).
-record(pk_GS2U_AckStandSort,{
	%% UInt16
	petList = []
}).

%% 
%% // 获得临时骑宠
-define(GS2U_AddTempPet,17046).
-record(pk_GS2U_AddTempPet,{
	%% UInt16宠物ID
	petID = 0
}).

%% 
%% // 购买体力信息			触发时机: 每次请求购买时
-define(GS2U_BuyPowerInfo,60009).
-record(pk_GS2U_BuyPowerInfo,{
	%% Int32 本次购买的费用
	money = 0,
	%% SByte 可购买总数
	allCount = 0,
	%% SByte 当前可购买数
	curCount = 0
}).

%% 
%% // 删除宠物
-define(GS2U_DeletePet,22924).
-record(pk_GS2U_DeletePet,{
	%% UInt16
	petID = 0
}).

%% 
%% // 双人坐骑邀请
-define(GS2U_DoublePetMountInvite,59136).
-record(pk_GS2U_DoublePetMountInvite,{
	%% UInt16
	petID = 0,
	%% String
	srcName = "",
	%% UInt64
	srcRoleID = 0
}).

%% 
-define(GS2U_FindTerritoryFailed_Ack,10728).
-record(pk_GS2U_FindTerritoryFailed_Ack,{
	%% UInt32 错误码
	errorCode = 0
}).

%% 
-define(GS2U_FindTerritory_Ack,35119).
-record(pk_GS2U_FindTerritory_Ack,{
	%% TerritoryInfo 领地信息
	info,
	%% PetTerritoryInfo 驻守骑宠信息
	listInfo = [],
	%% UInt64 角色ID
	roleID = 0,
	%% String 角色姓名
	roleName = "",
	%% UInt32 当日已搜索次数
	count = 0
}).

%% 
%% //服务器返回坐骑系列操作结果（广播给其它玩家）
%% //需要广播给主人周围的玩家
-define(GS2U_OffMountPetAck,34800).
-record(pk_GS2U_OffMountPetAck,{
	%% UInt64主人CODE
	code = 0,
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
%% //服务器返回坐骑系列操作结果（广播给其它玩家）
%% //既要广播要主人周围的玩家也需要广播给宠物周围的玩家
-define(GS2U_OnMountPetAck,57812).
-record(pk_GS2U_OnMountPetAck,{
	%% UInt64主人CODE
	ownerCode = 0,
	%% UInt64宠物Code
	petCode = 0,
	%% UInt16宠物ID
	petId = 0,
	%% UInt64客人code
	guestCode = 0
}).

%% 
-define(GS2U_PVEBattleResult,35792).
-record(pk_GS2U_PVEBattleResult,{
	%% SByte 战斗结果 0：胜利 1:失败
	res = 0,
	%% Int32 奖励金钱
	coin = 0,
	%% Int32 奖励经验
	exp = 0,
	%% SByte 通关评分
	score = 0,
	%% PveItem 物品列表
	itemList = []
}).

%% 
%% //宠物属性提升结果
-define(GS2U_PetAddAttaRes,47446).
-record(pk_GS2U_PetAddAttaRes,{
	%% UInt16
	petID = 0,
	%% AddProp
	propList = []
}).

%% 
%% // 助战信息
-define(GS2U_PetAssistInit,34712).
-record(pk_GS2U_PetAssistInit,{
	%% AssistBattleInfo
	infoList = []
}).

%% 
%% //更新孔位
-define(GS2U_PetAssistUpdateSlot,21727).
-record(pk_GS2U_PetAssistUpdateSlot,{
	%% Byte位置
	slot = 0,
	%% UInt16宠物ID
	petID = 0
}).

%% 
%% //宠物属性保存结果
-define(GS2U_PetAttaSaveRes,47132).
-record(pk_GS2U_PetAttaSaveRes,{
	%% UInt16
	petID = 0,
	%% AddProp
	propList = []
}).

%% 
%% // 更新单个宠物
-define(GS2U_PetBaseInfo,53506).
-record(pk_GS2U_PetBaseInfo,{
	%% PetBaseInfo
	info
}).

%% 
%% // 宠物装备信息列表
-define(GS2U_PetEquipInfoList,28857).
-record(pk_GS2U_PetEquipInfoList,{
	%% PetEquipInfo
	petEquipInfoList = []
}).

%% 
%% // 宠物精灵信息
-define(GS2U_PetFairyInfo,17380).
-record(pk_GS2U_PetFairyInfo,{
	%% Int32
	point = 0,
	%% Int16
	level = 0
}).

%% 
%% // 更新所有宠物
-define(GS2U_PetInfoList,48755).
-record(pk_GS2U_PetInfoList,{
	%% PetBaseInfo
	petInfoList = []
}).

%% 
%% // 宠物升级成功
-define(GS2U_PetLevelUp,40620).
-record(pk_GS2U_PetLevelUp,{
	%% UInt16
	petID = 0,
	%% UInt16
	petLevel = 0,
	%% UInt32
	petExp = 0
}).

%% 
%% //扫荡结果
-define(GS2U_PetPveSweepAck,17437).
-record(pk_GS2U_PetPveSweepAck,{
	%% PveSweep
	sweepList = []
}).

%% 
%% //广播玩家宠物改名
-define(GS2U_PetReName,21657).
-record(pk_GS2U_PetReName,{
	%% UInt64
	code = 0,
	%% String
	name = ""
}).

%% 
%% // 洗练宠物技能结果
-define(GS2U_PetSkillCastResult,30326).
-record(pk_GS2U_PetSkillCastResult,{
	%% UInt16
	petID = 0,
	%% PetSkillCastResult
	skillList = []
}).

%% 
%% //宠物睡眠，需要广播给宠物周围的玩家以及主人本人
-define(GS2U_PetSleep,1492).
-record(pk_GS2U_PetSleep,{
	%% UInt64宠物
	code = 0
}).

%% 
%% //宠物强化结果
-define(GS2U_PetStrAck,44599).
-record(pk_GS2U_PetStrAck,{
	%% PetEquipInfo
	petEquipInfo
}).

%% 
%% //获取骑宠Pvp信息结果
-define(GS2U_PvpBattleInfoRes,51608).
-record(pk_GS2U_PvpBattleInfoRes,{
	%% Byte抢夺令
	reel = 0,
	%% UInt16宠物列表
	pl = [],
	%% UInt16积分
	point = 0,
	%% PvPCityInfo城池列表
	cl = [],
	%% PvpBattleReportInfo战报列表
	bpl = []
}).

%% 
%% // 战报提示
-define(GS2U_PvpBattleReportTip,13533).
-record(pk_GS2U_PvpBattleReportTip,{
}).

%% 
%% //  战斗结果
-define(GS2U_PvpBattleResult,31631).
-record(pk_GS2U_PvpBattleResult,{
	%% SByte 战斗结果 0：胜利 1:失败
	res = 0,
	%% Int32 奖励金钱
	coin = 0,
	%% Int32 奖励经验
	exp = 0,
	%% PvPCityInfo 战斗结果城池信息
	pi
}).

%% 
%% // 更新战报
-define(GS2U_PvpBattleUpdateReport,64919).
-record(pk_GS2U_PvpBattleUpdateReport,{
	%% PvpBattleReportInfo
	br
}).

%% 
%% // 宠物位置保存结果
-define(GS2U_PvpPosSaveAck,36170).
-record(pk_GS2U_PvpPosSaveAck,{
	%% UInt16
	petList = []
}).

%% 
-define(GS2U_QueryTerritoryHistory_Ack,48208).
-record(pk_GS2U_QueryTerritoryHistory_Ack,{
	%% Boolean true掠夺记录；false防守记录
	attackOrDefense = false,
	%% UInt32 攻防次数
	fightCount = 0,
	%% TerritoryHistoryCell 战胜（战败）记录
	listInfo = []
}).

%% 
-define(GS2U_QueryTerritoryInfo_Ack,37326).
-record(pk_GS2U_QueryTerritoryInfo_Ack,{
	%% TerritoryInfo 领地列表
	listTerritory = [],
	%% PetTerritoryInfo 骑宠列表
	listPet = [],
	%% Boolean请求数据，是否需要打开面板
	isOpenPanel = false
}).

%% 
%% // 宠物转生成功
-define(GS2U_RawPetResult,17816).
-record(pk_GS2U_RawPetResult,{
	%% UInt16
	petID = 0,
	%% Byte当前转生等级
	curRaw = 0
}).

%% 
%% // 重置宠物ACK
-define(GS2U_ResetPetAck,24481).
-record(pk_GS2U_ResetPetAck,{
	%% UInt16宠物ID
	petID = 0
}).

%% 
%% // 20170324需求补充及变更
%% // 领地战斗心跳
-define(GS2U_TerritoryBattle_Tick_Sync,48052).
-record(pk_GS2U_TerritoryBattle_Tick_Sync,{
	%% UInt32 当前状态剩余时间
	time = 0,
	%% UInt32 活动剩余总时间
	timeAll = 0,
	%% Byte 2战斗前等待；3战斗；4结算
	state = 0
}).

%% 
%% // 20170323需求变更
%% // 服务端需要通知客户端是否存在开采结束的领地
-define(GS2U_TerritoryExploitEnd_Sync,21088).
-record(pk_GS2U_TerritoryExploitEnd_Sync,{
}).

%% 
-define(GS2U_TerritoryExploit_Ack,62071).
-record(pk_GS2U_TerritoryExploit_Ack,{
	%% TerritoryInfo 刷新该领地数据
	info,
	%% PetTerritoryInfo 刷新部分骑宠数据
	listInfo = []
}).

%% 
-define(GS2U_TerritoryPlunder_Ack,24508).
-record(pk_GS2U_TerritoryPlunder_Ack,{
	%% UInt32 等级段配置，对应pet_territory_reward.id
	cfgReward = 0,
	%% UInt32 掠夺数量1 注：如count1和count2都为0，则掠夺失败
	count1 = 0,
	%% UInt32 掠夺数量2
	count2 = 0
}).

%% 
-define(GS2U_TerritoryVigor_Ack,28079).
-record(pk_GS2U_TerritoryVigor_Ack,{
	%% UInt32
	vigor = 0
}).

%% 
%% // 宠物升星成功
-define(GS2U_UpStartPetResult,37149).
-record(pk_GS2U_UpStartPetResult,{
	%% UInt16
	petID = 0,
	%% Byte当前星级
	curStar = 0,
	%% UInt16宠物技能ID
	petSkillID = 0
}).

%% 
%% // 同步章节目录			触发时机：1 登陆
-define(GS2U_UpdateCatalogList,34854).
-record(pk_GS2U_UpdateCatalogList,{
	%% CatalogNode 章节列表
	catalogList = []
}).

%% 
%% // 刷新宠物技能数据
-define(GS2U_UpdatePetSkill,51975).
-record(pk_GS2U_UpdatePetSkill,{
	%% UInt16宠物ID
	petID = 0,
	%% PetSkillBaseInfo
	skillInfo
}).

%% 
%% //更新宠物状态
-define(GS2U_UpdatePetStatus,62688).
-record(pk_GS2U_UpdatePetStatus,{
	%% UInt16宠物ID
	petID = 0,
	%% Byte宠物状态
	status = 0
}).

%% 
%% // 同步体力				触发时机: 1 周期性同步，时间周期待定 2 购买体力时同步
-define(GS2U_UpdatePower,23580).
-record(pk_GS2U_UpdatePower,{
	%% Int32 体力
	power = 0
}).

%% 
%% // 同步抢夺令(自动回复和购买)				
-define(GS2U_UpdateReel,19087).
-record(pk_GS2U_UpdateReel,{
	%% SByte 抢夺令
	reel = 0
}).

%% 
%% // 使用宠物技能书
-define(GS2U_UsePetSkillBook,46038).
-record(pk_GS2U_UsePetSkillBook,{
	%% UInt16宠物ID
	petID = 0,
	%% UInt16宠物技能ID
	oldSkillId = 0,
	%% UInt16宠物技能ID
	newSkillId = 0,
	%% UInt16宠物技能等级
	newSkillLevel = 0
}).

-record(pk_PetBaseInfo,{
	%% UInt16宠物ID
	petID = 0,
	%% Byte宠物星阶
	petStar = 0,
	%% Byte宠物是否出战 0:休息(非助战) 1:休息(助战)2:出战（非召唤）3:出战（召唤）
	status = 0,
	%% PetSkillBaseInfo
	skillList = [],
	%% String宠物名字
	petName = "",
	%% Byte宠物转生
	petRaw = 0,
	%% UInt64宠物到期时间
	petTime = 0,
	%% AddProp宠物属性
	petProps = [],
	%% UInt64宠物战斗力
	petForce = 0,
	%% UInt32宠物提升次数
	upCount = 0,
	%% UInt32宠物等级
	petLevel = 0,
	%% UInt32宠物经验
	petExp = 0
}).

-record(pk_PetEquipInfo,{
	%% Byte宠物装备ID
	equipID = 0,
	%% Byte宠物装备等级
	equipLv = 0
}).

%% 
%% //宠物改名
-define(PetReName,31697).
-record(pk_PetReName,{
	%% UInt16宠物ID
	petID = 0,
	%% String宠物名字
	name = ""
}).

-record(pk_PetSkillBaseInfo,{
	%% Byte宠物技能序号
	petSkillIndex = 0,
	%% UInt16宠物技能ID
	petSkillId = 0,
	%% UInt16宠物技能Cd
	petSkillCd = 0,
	%% Byte宠物技能Type 0:天赋技能 1:通用技能 2:基础技能
	petSkillType = 0,
	%% Byte宠物技能等级
	petSkillLv = 0,
	%% Byte宠物技能是否解锁
	petSkillIsUnlock = 0
}).

-record(pk_PetSkillCastResult,{
	%% UInt16
	oldSkillID = 0,
	%% UInt16
	newSkillID = 0,
	%% UInt16
	newSkillLevel = 0
}).

%% 
%% // 替换宠物技能
-define(PetSkillReplace,62742).
-record(pk_PetSkillReplace,{
	%% UInt16
	petID = 0
}).

%% 
%% // 切换宠物
-define(PetSwitch,22375).
-record(pk_PetSwitch,{
	%% UInt16宠物ID
	petId = 0
}).

-record(pk_PetTerritoryInfo,{
	%% UInt16 骑宠ID
	petID = 0,
	%% UInt16 骑宠等级
	petLevel = 0,
	%% UInt64 骑宠战力
	petForce = 0,
	%% UInt32 驻派领地ID（为0时表示未驻派）
	territoryID = 0,
	%% Byte 星级
	star = 0,
	%% Byte 转生
	raw = 0
}).

-record(pk_PvPCityInfo,{
	%% Byte城池ID
	cityID = 0,
	%% UInt64城池占领时间
	cityTime = 0,
	%% UInt64占领者ID
	roleID = 0,
	%% UInt32城池护盾值
	cityHp = 0,
	%% UInt32城池最大值
	cityMax = 0,
	%% UInt32战斗力
	force = 0,
	%% String占领者名字
	roleName = "",
	%% UInt16占领者宠物ID
	petList = []
}).

-record(pk_PveItem,{
	%% Int16
	id = 0,
	%% Int16
	num = 0
}).

-record(pk_PveSweep,{
	%% Byte扫荡次数
	num = 0,
	%% Int32 奖励金钱
	coin = 0,
	%% Int32 奖励经验
	exp = 0,
	%% PveItem 物品列表
	itemList = []
}).

-record(pk_PvpBattleReportInfo,{
	%% UInt64战报时间
	time = 0,
	%% Byte1:占领空城 2:收益 3:防守失败 4:攻城失败 5:防守胜利 6:攻城胜利
	type = 0,
	%% Byte城池ID
	cityID = 0,
	%% UInt64占领者ID
	roleID = 0,
	%% String占领者名字
	roleName = ""
}).

-record(pk_TerritoryHistoryCell,{
	%% UInt32 攻防时间
	time = 0,
	%% String 角色姓名
	roleName = "",
	%% UInt64 角色ID
	roleID = 0,
	%% UInt32 领地ID
	territoryID = 0,
	%% UInt32 等级段配置，对应pet_territory_reward.id
	cfgReward = 0,
	%% UInt32 掠夺数量1，对应pet_territory_reward.reward
	count1 = 0,
	%% UInt32 掠夺数量2，对应pet_territory_reward.reward
	count2 = 0
}).

-record(pk_TerritoryInfo,{
	%% UInt32 领地ID
	territoryID = 0,
	%% UInt32 等级段配置，对应pet_territory_reward.id
	cfgReward = 0,
	%% UInt32 开采时间配置，对应pet_territory_time.id
	cfgTime = 0,
	%% UInt32 领地等级配置，对应pet_territory_level.id
	cfgLevel = 0,
	%% UInt32 战力等级段配置，对应pet_territory_force.id
	cfgForce = 0,
	%% UInt32 领地最近的刷新时间，用以计算奖励
	timeFresh = 0,
	%% UInt32 开采结束时间
	timeEnd = 0,
	%% UInt32 奖励数量1，对应pet_territory_reward.reward
	rewardCount1 = 0,
	%% UInt32 奖励数量2，对应pet_territory_reward.reward
	rewardCount2 = 0,
	%% UInt32 安全保护时间
	timeSafe = 0,
	%% UInt32 搜索保护时间
	timeSearch = 0
}).

%% 
%% // 购买体力
-define(U2GS_BuyPower,46993).
-record(pk_U2GS_BuyPower,{
}).

%% 
%% // 购买抢夺令
-define(U2GS_BuyReel,63174).
-record(pk_U2GS_BuyReel,{
}).

%% 
%% // 双人坐骑邀请
-define(U2GS_DoublePetMountInvite,26098).
-record(pk_U2GS_DoublePetMountInvite,{
	%% UInt64
	tarRoleID = 0
}).

%% 
%% // 回应双人坐骑
-define(U2GS_DoublePetMountInviteAck,495).
-record(pk_U2GS_DoublePetMountInviteAck,{
	%% SByte
	agree = 0,
	%% UInt64
	srcRoleID = 0
}).

%% 
%% // 搜索别人的领地
-define(U2GS_FindTerritory_Request,34435).
-record(pk_U2GS_FindTerritory_Request,{
	%% UInt64 角色ID，为0时执行普通搜索，消费参考pet_territory_search，当日已搜索次数参考每日计数8；不为0时针对性反掠夺搜索
	roleID = 0
}).

%% 
%% //隐藏宠物
-define(U2GS_HideMountPet,49046).
-record(pk_U2GS_HideMountPet,{
}).

%% 
%% //下骑宠
-define(U2GS_OffMountPet,49531).
-record(pk_U2GS_OffMountPet,{
}).

%% 
%% //上骑宠
-define(U2GS_OnMountPet,55043).
-record(pk_U2GS_OnMountPet,{
}).

%% 
%% //宠物属性提升
-define(U2GS_PetAddAtta,15608).
-record(pk_U2GS_PetAddAtta,{
	%% UInt16宠物ID
	petID = 0,
	%% Byte宠物属性提升次数
	num = 0
}).

%% 
%% //宠物助战
-define(U2GS_PetAssistBattle,51118).
-record(pk_U2GS_PetAssistBattle,{
	%% UInt16宠物ID
	petID = 0,
	%% Byte位置
	slot = 0,
	%% Byte0取消助战 1助战
	status = 0
}).

%% 
%% //宠物属性保存
-define(U2GS_PetAttaSave,38254).
-record(pk_U2GS_PetAttaSave,{
	%% UInt16
	petID = 0
}).

%% 
%% //防止野生宠物 强制消失野生宠物
-define(U2GS_PetDisapear,12890).
-record(pk_U2GS_PetDisapear,{
	%% UInt64
	code = 0
}).

%% 
%% // 宠物升级
-define(U2GS_PetLevelUp,7694).
-record(pk_U2GS_PetLevelUp,{
	%% UInt16
	petID = 0,
	%% UInt64物品UID
	itemUID = 0,
	%% UInt16本次使用个数
	useNum = 0
}).

%% 
%% // 扫荡
-define(U2GS_PetPveSweep,6146).
-record(pk_U2GS_PetPveSweep,{
	%% UInt16副本ID
	id = 0
}).

%% 
%% // 洗炼宠物技能
-define(U2GS_PetSkillCast,60947).
-record(pk_U2GS_PetSkillCast,{
	%% UInt16
	petID = 0,
	%% UInt16技能ID列表
	skillIDs = []
}).

%% 
%% // 宠物技能升级或者解锁
-define(U2GS_PetSkillOperate,31172).
-record(pk_U2GS_PetSkillOperate,{
	%% UInt16 1解锁；2升级
	operationType = 0,
	%% UInt16宠物ID
	petID = 0,
	%% UInt16宠物技能ID
	petSkillId = 0
}).

%% 
%% //宠物强化
-define(U2GS_PetStr,27916).
-record(pk_U2GS_PetStr,{
	%% Byte装备ID
	equipID = 0,
	%% Byte0:普通强化 1:一键强化
	type = 0
}).

%% 
%% //获取骑宠Pvp信息
-define(U2GS_PvpBattleInfo,30930).
-record(pk_U2GS_PvpBattleInfo,{
}).

%% 
%% // 宠物位置保存
-define(U2GS_PvpPosSave,46437).
-record(pk_U2GS_PvpPosSave,{
	%% UInt16
	petList = []
}).

%% 
%% // 查询宠物精灵信息
-define(U2GS_QueryPetFairyInfo,47422).
-record(pk_U2GS_QueryPetFairyInfo,{
}).

%% 
-define(U2GS_QueryTerritoryHistory_Request,41716).
-record(pk_U2GS_QueryTerritoryHistory_Request,{
	%% Boolean true掠夺记录；false防守记录
	attackOrDefense = false
}).

%% 
-define(U2GS_QueryTerritoryInfo_Request,43838).
-record(pk_U2GS_QueryTerritoryInfo_Request,{
	%% Boolean请求数据，是否需要打开面板
	isOpenPanel = false
}).

%% 
%% // 宠物转生
-define(U2GS_RawPet,35797).
-record(pk_U2GS_RawPet,{
	%% UInt16
	petID = 0
}).

%% 
%% // 请求战斗
-define(U2GS_RequestBattle,44797).
-record(pk_U2GS_RequestBattle,{
	%% Int32
	id = 0
}).

%% 
%% // 请求Pvp战斗
-define(U2GS_RequestPvpBattle,30441).
-record(pk_U2GS_RequestPvpBattle,{
	%% Byte
	cityID = 0,
	%% UInt64
	roleID = 0
}).

%% 
%% // 领取奖励 
-define(U2GS_RequstReward,62009).
-record(pk_U2GS_RequstReward,{
}).

%% 
%% // 重置宠物
-define(U2GS_ResetPet,19867).
-record(pk_U2GS_ResetPet,{
	%% UInt16宠物ID
	petID = 0
}).

%% 
%% //显示宠物
-define(U2GS_ShowMountPet,57389).
-record(pk_U2GS_ShowMountPet,{
}).

%% 
%% // 排位
-define(U2GS_StandSort,21014).
-record(pk_U2GS_StandSort,{
	%% UInt16 位置上的骑宠ID列表。数组下标表示位置，从0开始编号 
	petList = []
}).

%% 
%% // 开采请求
-define(U2GS_TerritoryExploit_Request,30247).
-record(pk_U2GS_TerritoryExploit_Request,{
	%% UInt32 领地ID
	territoryID = 0,
	%% UInt32 派遣骑宠
	listPetID = [],
	%% UInt32 开采时间配置，对应pet_territory_time.id
	cfgTime = 0,
	%% UInt32 领地等级配置，对应pet_territory_level.id
	cfgLevel = 0
}).

%% 
%% // 掠夺请求
-define(U2GS_TerritoryPlunder_Request,60988).
-record(pk_U2GS_TerritoryPlunder_Request,{
	%% UInt64 角色ID
	roleID = 0,
	%% UInt32 领地ID
	territoryID = 0,
	%% UInt32 派遣骑宠
	listPetID = []
}).

%% 
%% // 精力查询请求
-define(U2GS_TerritoryVigor_Request,42127).
-record(pk_U2GS_TerritoryVigor_Request,{
}).

%% 
%% // 升星宠物
-define(U2GS_UpStartPet,60578).
-record(pk_U2GS_UpStartPet,{
	%% UInt16
	petID = 0
}).

%% 
%% // 使用宠物技能书
-define(U2GS_UsePetSkillBook,26300).
-record(pk_U2GS_UsePetSkillBook,{
	%% UInt16宠物ID
	petID = 0,
	%% UInt16宠物技能ID
	petSkillId = 0,
	%% UInt16商品ID
	itemid = 0
}).

-record(pk_AliveRole,{
	%% UInt64 角色ID，等价于role.id，此处便于算法查询
	roleID = 0,
	%% CrossRoleBase 基本信息
	role,
	%% UInt16 虚拟装备集，依次为[武器,头盔,铠甲,鞋子]，没有时用0填充
	listVE = [],
	%% UInt16 击杀次数
	countKill = 0,
	%% UInt16 死亡次数
	countDead = 0,
	%% Boolean 是否弃赛
	isGiveUp = false,
	%% Byte 结算时排名（可能并列，已弃赛时无效）
	rankID = 0,
	%% UInt64最后死亡时间
	timeDead = 0,
	%% Boolean是否还有复活次数
	isRevive = false,
	%% UInt16死到没有次数的顺序
	deadRank = 0
}).

-record(pk_AliveRolePos,{
	%% UInt64 角色ID
	id = 0,
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% Single X坐标
	x = 0.0,
	%% Single Y坐标（对应客户端Z）
	y = 0.0
}).

%% 
-define(Any_ChangeMap,51801).
-record(pk_Any_ChangeMap,{
	%% UInt32
	mapId = 0,
	%% UInt32 线路ID	
	lineID = 0,
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
-define(Any_PlayerLogout,1702).
-record(pk_Any_PlayerLogout,{
	%% UInt64
	code = 0,
	%% Byte 退出的原因码
	reason = 0
}).

-record(pk_BattleProp,{
	%% Byte 战斗属性号
	index = 0,
	%% Single 战斗属性值
	value = 0.0
}).

-record(pk_BlockStatusChange,{
	%% String 阻挡Name
	blockName = "",
	%% UInt32 阻挡的动作状态
	blockStatus = 0
}).

-record(pk_BuffBaseInfo,{
	%% UInt64Buff唯一标识符
	buffUID = 0,
	%% UInt32BuffID
	buffID = 0,
	%% UInt32Buff持续时长
	time = 0
}).

%% 
-define(C2S_ChangeMap,45297).
-record(pk_C2S_ChangeMap,{
	%% UInt32
	mapId = 0,
	%% String
	waypointName = ""
}).

-record(pk_CoinData,{
	%% Byte 货币类型
	coinType = 0,
	%% UInt32 货币值
	value = 0
}).

-record(pk_CopyMapDropItem,{
	%% UInt64 物品UID
	itemUID = 0,
	%% UInt16 物品ID
	itemID = 0,
	%% UInt16 堆叠数量
	number = 0,
	%% Byte 品质
	quality = 0,
	%% Boolean 是否绑定
	isBind = false
}).

-record(pk_CopyMapStatHurt,{
	%% UInt64玩家ID
	roleID = 0,
	%% UInt32玩家受到的伤害
	beHurt = 0,
	%% UInt32玩家攻击的伤害
	playerHurt = 0,
	%% UInt32宠物攻击的伤害
	petHurt = 0
}).

-record(pk_CopyObj,{
	%% UInt16 目标ID
	targetID = 0,
	%% Byte 目标类型，1怪 or 2采集物
	targetType = 0,
	%% UInt16 当前完成的个数
	curNumber = 0,
	%% UInt16 总的需要完成的个数
	allNumber = 0
}).

-record(pk_CrossRoleBase,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = "",
	%% String 所在服名
	server = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% Byte 自定义头像MD5(16byte)
	face = [],
	%% UInt64 历史最大战力（包含骑宠），用于战力匹配
	maxForce = 0,
	%% UInt64 历史最大战力（不含骑宠），用于战力匹配
	maxForceNoPet = 0
}).

-record(pk_Error,{
	%% UInt32 错误号
	errorCode = 0,
	%% String ErrorCode附加的参数，可能为空
	params = []
}).

%% 
-define(GS2S_UseTheAwakeBuffRet,34885).
-record(pk_GS2S_UseTheAwakeBuffRet,{
}).

%% 
-define(GS2U_AcceptHolidayTaskSucc,35611).
-record(pk_GS2U_AcceptHolidayTaskSucc,{
	%% Byte
	result = 0
}).

%% 
%% // 报名成功反馈
%% // 所有相关角色会收到该消息
-define(GS2U_AliveApply_Ack,61779).
-record(pk_GS2U_AliveApply_Ack,{
	%% UInt64 报名组ID
	applyID = 0,
	%% UInt64 报名组队长角色ID
	leaderID = 0,
	%% CrossRoleBase 成员角色信息
	members = []
}).

%% 
%% // 取消报名成功反馈
%% // 所有相关角色会收到该消息
-define(GS2U_AliveCancel_Ack,5029).
-record(pk_GS2U_AliveCancel_Ack,{
	%% CrossRoleBase 取消者信息
	role
}).

%% 
%% // 活动地图内广播：解除DEBUFF的载体刷新点
-define(GS2U_AliveCarrier_Sync,33903).
-record(pk_GS2U_AliveCarrier_Sync,{
	%% Single 刷新点X
	x = 0.0,
	%% Single 刷新点Y
	y = 0.0,
	%% UInt32 剩余生命周期（秒）
	time = 0
}).

%% 
%% // 服务端反馈客户端消除DEBUFF
%% // 可能是U2GS_AliveEnterSafeArea_Request的反馈
%% // 也可能是心跳触发
-define(GS2U_AliveEnterSafeArea_Ack,5239).
-record(pk_GS2U_AliveEnterSafeArea_Ack,{
}).

%% 
%% // 活动地图内广播：阶段切换
-define(GS2U_AliveMapState_Sync,58944).
-record(pk_GS2U_AliveMapState_Sync,{
	%% Byte 1准备倒计时 2比赛中 3结算倒计时
	state = 0,
	%% UInt16 本阶段剩余时间
	sec = 0,
	%% AliveRole 全部角色信息
	listRole = [],
	%% Boolean 是否无效，仅false时正常结算
	isInvalid = false
}).

%% 
-define(GS2U_AliveRolePos_Sync,2261).
-record(pk_GS2U_AliveRolePos_Sync,{
	%% AliveRolePos
	listPos = []
}).

%% 
%% // 活动地图内广播：角色信息刷新
%% // 虚拟道具变化或者击杀、死亡数变化时刷新
-define(GS2U_AliveRole_Sync,42867).
-record(pk_GS2U_AliveRole_Sync,{
	%% AliveRole
	role
}).

%% 
%% // 更新所有战斗属性
-define(GS2U_AllBattleProp,46744).
-record(pk_GS2U_AllBattleProp,{
	%% UInt64
	code = 0,
	%% Single 战斗属性值，下标依次为有效属性索引
	battlePropInfo = []
}).

%% 
%% // 更新某项战斗属性
-define(GS2U_BattlePropList,28245).
-record(pk_GS2U_BattlePropList,{
	%% UInt64
	code = 0,
	%% UInt16
	id = 0,
	%% BattleProp
	battleProp = []
}).

%% 
%% //玩家被举报次数
-define(GS2U_BeReportNum,31499).
-record(pk_GS2U_BeReportNum,{
	%% Byte
	num = 0
}).

%% 
%% // 阻档状态改变
-define(GS2U_BlockStatusChange,4623).
-record(pk_GS2U_BlockStatusChange,{
	%% BlockStatusChange
	changes = []
}).

%% 
%% // 广播物件消失
-define(GS2U_BroadcastDisapear,45334).
-record(pk_GS2U_BroadcastDisapear,{
	%% UInt64
	code = []
}).

%% 
%% // 广播物件消失(客户端将处理为立即消失，而不是在队列里等待tick处理)
-define(GS2U_BroadcastDisapearFast,13182).
-record(pk_GS2U_BroadcastDisapearFast,{
	%% UInt64
	code = []
}).

%% 
%% // 同步玩家的当前血量百分比（非战斗状态发送给周围玩家，不包括自己）
-define(GS2U_BroadcastPlayerHpPC,54157).
-record(pk_GS2U_BroadcastPlayerHpPC,{
	%% UInt64 玩家流水号
	code = 0,
	%% Byte 玩家的血量百分比
	hpPC = 0
}).

%% 
%% // 广播给复活玩家的周围（不包括复活玩家自己）的复活消息
-define(GS2U_BroadcastPlayerRevive,17135).
-record(pk_GS2U_BroadcastPlayerRevive,{
	%% UInt64角色Code
	code = 0,
	%% UInt16地图ID
	mapId = 0,
	%% Single坐标X
	x = 0.0,
	%% Single坐标Y
	y = 0.0,
	%% Byte血量百分比
	hpPC = 0
}).

%% 
%% // 广播给复活玩家的队友复活消息
-define(GS2U_BroadcastTeamRevive,8439).
-record(pk_GS2U_BroadcastTeamRevive,{
	%% UInt64角色ID
	roleID = 0,
	%% UInt16地图ID
	mapId = 0,
	%% Single坐标X
	x = 0.0,
	%% Single坐标Y
	y = 0.0,
	%% Byte血量百分比
	hpPC = 0
}).

%% 
%% //卸装备时广播给周围玩家
-define(GS2U_BroadcastVisibleEquipOff,46672).
-record(pk_GS2U_BroadcastVisibleEquipOff,{
	%% UInt64流水号
	code = 0,
	%% UInt32卸下装备type, 部位
	type = 0
}).

%% 
%% //穿装备时广播给周围玩家
-define(GS2U_BroadcastVisibleEquipOn,42110).
-record(pk_GS2U_BroadcastVisibleEquipOn,{
	%% UInt64流水号
	code = 0,
	%% visibleEquip穿上的可见装备
	equip
}).

%% 
%% // 仅领取每日现金礼包奖励成功时反馈
-define(GS2U_BusinessCashDailyGift_Ack,51860).
-record(pk_GS2U_BusinessCashDailyGift_Ack,{
}).

%% 
%% // 仅成功时反馈
-define(GS2U_BusinessSupperGift_Ack,30113).
-record(pk_GS2U_BusinessSupperGift_Ack,{
}).

%% 
-define(GS2U_BuyLimitedResult,44641).
-record(pk_GS2U_BuyLimitedResult,{
	%% Byte0 购买成功；1 货币不足，3 最大购买限制次数
	result = 0
}).

%% 
%% //玩家阵营改变通知客服端
-define(GS2U_ChangeCamp,20809).
-record(pk_GS2U_ChangeCamp,{
	%% UInt64玩家code
	code = 0,
	%% UInt32阵营ID
	camp = 0
}).

%% 
%% // 转职
-define(GS2U_ChangeCarrer,31075).
-record(pk_GS2U_ChangeCarrer,{
	%% Boolean是否转职成功
	result = false,
	%% UInt32新职业
	newCareer = 0
}).

%% 
%% //改名结果
-define(GS2U_ChangeNameResult,47012).
-record(pk_GS2U_ChangeNameResult,{
	%% UInt64
	roleID = 0,
	%% String
	name = "",
	%% UInt320为成功，其他为失败
	errorCode = 0
}).

%% 
%% //返回聊天错误原因
-define(GS2U_ChatErrorResult,21361).
-record(pk_GS2U_ChatErrorResult,{
	%% Int32
	reason = 0
}).

%% 
%% // 聊天消息(服务端发送)
-define(GS2U_Chatinfo,39394).
-record(pk_GS2U_Chatinfo,{
	%% SByte频道
	channel = 0,
	%% UInt64发送者ID
	senderID = 0,
	%% UInt64发送者Code
	senderCode = 0,
	%% String发送者Name
	senderName = "",
	%% SByte种族
	senderRace = 0,
	%% UInt32职业
	senderCareer = 0,
	%% SByte性别
	senderSex = 0,
	%% Int32头
	senderHead = 0,
	%% UInt16头像框
	frameID = 0,
	%% Int16当前等级
	senderLevel = 0,
	%% SByte发送者vip等级
	senderVip = 0,
	%% String内容
	content = ""
}).

%% 
%% //清除反击对象
-define(GS2U_ClearFightObject,46702).
-record(pk_GS2U_ClearFightObject,{
	%% UInt32 反击对象列表
	objs = []
}).

%% 
%% // 当前副本进行进度
-define(GS2U_CopyMapProcess,39720).
-record(pk_GS2U_CopyMapProcess,{
	%% Byte 进度
	curSchedule = 0,
	%% Byte 总进度
	allSchedule = 0,
	%% CopyObj 进度列表
	scheduleList = []
}).

%% 
%% // 副本扩展（地宫当前进度状态）
-define(GS2U_CopyMapProcessCurrentScheduleStatus,16294).
-record(pk_GS2U_CopyMapProcessCurrentScheduleStatus,{
	%% Byte 进度
	curSchedule = 0,
	%% Byte 进度状态（0成功/1失败）
	status = 0
}).

%% 
%% // 副本扩展（地宫当前进度剩余时间，仅作显示用）
-define(GS2U_CopyMapProcessCurrentScheduleSurplusSecond,35062).
-record(pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond,{
	%% Byte 进度
	curSchedule = 0,
	%% Byte 1为准备；2为战斗
	type = 0,
	%% UInt64 进度剩余时间
	surplusSecond = 0
}).

%% 
%% // 副本通关结果和物品奖励
-define(GS2U_CopyMapResult,17828).
-record(pk_GS2U_CopyMapResult,{
	%% UInt16 副本地图ID
	copyMapID = 0,
	%% UInt16 通关时间
	second = 0,
	%% UInt32 金币奖励
	goldReward = 0,
	%% UInt32 经验奖励
	expReward = 0,
	%% Boolean 是否助战
	isAssist = false,
	%% CopyMapDropItem 掉落列表
	dropItems = [],
	%% CopyMapDropItem 节日活动掉落
	festivalDrop = []
}).

%% 
-define(GS2U_CopyMapStatHurtList,5304).
-record(pk_GS2U_CopyMapStatHurtList,{
	%% CopyMapStatHurt
	statList = []
}).

%% 
%% // 副本
-define(GS2U_CopymapFailed,10232).
-record(pk_GS2U_CopymapFailed,{
	%% UInt16 副本地图ID
	copyMapID = 0
}).

%% 
-define(GS2U_CreatePlayerResult,45054).
-record(pk_GS2U_CreatePlayerResult,{
	%% Int32
	errorCode = 0,
	%% UInt64
	roleID = 0
}).

%% 
%% //跨服后，玩家变了code
-define(GS2U_CrossNewPlayerCode,20154).
-record(pk_GS2U_CrossNewPlayerCode,{
	%% UInt32
	uint64 = 0
}).

%% 
%% //跨服状态
-define(GS2U_CrossStep,64024).
-record(pk_GS2U_CrossStep,{
	%% Byte为2表示从跨服回到GS
	index = 0
}).

%% 
-define(GS2U_DashTo,13797).
-record(pk_GS2U_DashTo,{
	%% UInt64 接收远程玩家信息      
	code = 0,
	%% Single 冲刺所到的目标点
	posX = 0.0,
	%% Single 冲刺所到的目标点
	posY = 0.0
}).

%% 
-define(GS2U_DeletePlayerResult,39385).
-record(pk_GS2U_DeletePlayerResult,{
	%% UInt64
	roleID = 0,
	%% Int32
	errorCode = 0
}).

%% 
%% // 进入地图失败，用于通知客户端解除禁止玩家操作
-define(GS2U_EnterMapFailed,36237).
-record(pk_GS2U_EnterMapFailed,{
}).

%% 
-define(GS2U_Error,33508).
-record(pk_GS2U_Error,{
	%% UInt32错误号
	errorCode = 0,
	%% StringErrorCode附加的参数，可能为空
	params = []
}).

%% 
%% // 返回领取体力是否成功
-define(GS2U_EveryDayGetPower_Sync,30914).
-record(pk_GS2U_EveryDayGetPower_Sync,{
	%% Boolean是否领取成功
	isGetSuc = false
}).

%% 
%% //是否领取更新资源奖励
-define(GS2U_GetRewardUpdateResource,196).
-record(pk_GS2U_GetRewardUpdateResource,{
	%% RewardUpdateResource
	resultList = []
}).

%% 
%% // 送花触发特效
-define(GS2U_GiveGiftEfects,39251).
-record(pk_GS2U_GiveGiftEfects,{
	%% UInt32 送花ID
	itemID = 0,
	%% UInt32 送花数量
	itemCount = 0
}).

%% 
%% //玩家仇恨
-define(GS2U_HateInfo,11948).
-record(pk_GS2U_HateInfo,{
	%% UInt64
	code = 0,
	%% UInt64仇恨目标code
	hateCode = 0,
	%% SByte1：新增  2:删除
	opreate = 0
}).

%% 
%% // 已经获得的收费表情与动作列表(上线发给客户端，或者新增某一个时单独发给客户端)
-define(GS2U_HaveIconAndActionList,15362).
-record(pk_GS2U_HaveIconAndActionList,{
	%% UInt32 表情列表
	icons = [],
	%% UInt32 动作列表
	actions = []
}).

%% 
%% //心跳包返回，用于网络延迟(这个只用于检测外挂)
-define(GS2U_HeartBeatAck,30981).
-record(pk_GS2U_HeartBeatAck,{
	%% UInt32 同步给客户端的CD
	time = 0,
	%% UInt32 服务器告诉客户端当前版本号
	version = 0
}).

%% 
-define(GS2U_HisoryForce_Ack,11017).
-record(pk_GS2U_HisoryForce_Ack,{
	%% UInt64 包含骑宠
	maxAll = 0,
	%% UInt64 不包含骑宠
	maxNotPet = 0
}).

%% 
%% //邀请队员进入副本
-define(GS2U_InvateEnterCopyMap,6284).
-record(pk_GS2U_InvateEnterCopyMap,{
	%% UInt16副本地图ID
	copyMapID = 0
}).

%% 
%% // gs踢人通知手机的消息
-define(GS2U_KickOutTip,38711).
-record(pk_GS2U_KickOutTip,{
	%% SByte 踢人类型（1为抢登录情况；2为GM类型）
	type = 0
}).

%% 
%% //可杀戮Code
-define(GS2U_KillPlayerResponse,41656).
-record(pk_GS2U_KillPlayerResponse,{
	%% UInt64
	code = 0
}).

%% 
%% //返回杀戮值
-define(GS2U_KillValueResponse,8228).
-record(pk_GS2U_KillValueResponse,{
	%% UInt16
	killValue = 0
}).

%% 
-define(GS2U_LBS_BesideRole_Ack,3100).
-record(pk_GS2U_LBS_BesideRole_Ack,{
	%% Single 纬度 [-90.0, +90.0] 角度 负值是南纬，正值是北纬，-90.0不等价于+90.0，分属两极
	lat = 0.0,
	%% Single 经度 [-180.0, +180.0] 角度 负值是西经，正值是东经，-180.0等价于+180.0
	lng = 0.0,
	%% Single 距离 [100.0, 5000.0] 米 超过取值返回时返回空集
	dist = 0.0,
	%% LBSRole 角色列表
	listRole = []
}).

%% 
-define(GS2U_LoginResult,22162).
-record(pk_GS2U_LoginResult,{
	%% Int32
	result = 0
}).

%% 
%% // 玩家外观信息
-define(GS2U_LookInfoPlayer,18166).
-record(pk_GS2U_LookInfoPlayer,{
	%% UInt64流水号
	code = 0,
	%% UInt64角色ID
	roleID = 0,
	%% String名字
	name = "",
	%% Single坐标X
	x = 0.0,
	%% Single坐标Y
	y = 0.0,
	%% SByte 种族
	race = 0,
	%% UInt32职业
	career = 0,
	%% SByte 性别
	sex = 0,
	%% SByte阵营
	camp = 0,
	%% Int32头
	head = 0,
	%% Single移动速度
	move_speed = 0.0,
	%% Int16当前等级	
	level = 0,
	%% Byte当前血量百分比
	hp_per = 0,
	%% UInt16坐骑外观ID （0 表示没有坐骑或者下马状态）
	petID = 0,
	%% UInt64双人坐骑对方的Code （0 表示没有）	
	otherCode = 0,
	%% String 当前服名
	servername = "",
	%% String 归属服名
	myServerName = "",
	%% Boolean 是否在跨服
	isInCross = false,
	%% Byte玩家Pk状态
	pkMode = 0,
	%% UInt64玩家召唤的宠物code列表
	pet_list = [],
	%% PosInfo移动目标点列表
	move_list = [],
	%% BuffBaseInfo当前buff列表
	buffs = [],
	%% visibleEquip别的玩家可见的装备
	visible_equips = [],
	%% refineLevel精炼等级（装备部位强化等级）
	refine_levels = []
}).

%% 
%% //金宝塔结束和开始时间
-define(GS2U_LotteryForTowerBeginTimeEndTime,38347).
-record(pk_GS2U_LotteryForTowerBeginTimeEndTime,{
	%% UInt32
	beginTime = 0,
	%% UInt32
	endTime = 0
}).

%% 
-define(GS2U_LotteryForTowerInfo,20699).
-record(pk_GS2U_LotteryForTowerInfo,{
	%% Int16
	current_cfg_id = 0,
	%% UInt32
	endTime = 0,
	%% UInt32
	oneTimeCost = 0,
	%% UInt32
	tenTimeCost = 0,
	%% UInt32
	fiftyTimeCost = 0,
	%% lotteryForToweItem
	itemList = [],
	%% lotteryForTowerNotice
	noticeList = []
}).

%% 
%% //抽奖结果发给客户端
-define(GS2U_LotteryForTowerRandonAward,47144).
-record(pk_GS2U_LotteryForTowerRandonAward,{
	%% Int16
	current_cfg_id = 0,
	%% lotteryForTowerNotice
	noticeList = [],
	%% Int16
	reward_cfg_id_list = []
}).

%% 
-define(GS2U_MapLevel,11428).
-record(pk_GS2U_MapLevel,{
	%% UInt32等级值
	level = 0
}).

%% 
%% // 返回线路列表
-define(GS2U_MapLineList,64030).
-record(pk_GS2U_MapLineList,{
	%% UInt16
	mapID = 0,
	%% MapLineInfo
	lineList = []
}).

%% 
%% // 副本通关结果和物品奖励
-define(GS2U_MaterialCopyMapResult,40093).
-record(pk_GS2U_MaterialCopyMapResult,{
	%% UInt16 副本地图ID
	copyMapID = 0,
	%% UInt16 通关分数 0 表示失败
	score = 0,
	%% UInt16 0 通关， 1 超时， 2 失败
	state = 0,
	%% UInt32 金币奖励
	goldReward = 0,
	%% UInt32 经验奖励
	expReward = 0,
	%% UInt16 最大关卡
	maxChapter = 0,
	%% UInt16 完成关卡
	finishChapter = 0,
	%% Boolean 是否助战
	isAssist = false,
	%% CopyMapDropItem 掉落列表
	dropItems = [],
	%% CopyMapDropItem 节日活动掉落
	festivalDrop = []
}).

%% 
-define(GS2U_MissionObjectList,59133).
-record(pk_GS2U_MissionObjectList,{
	%% MissionObjectInfo 视野范围内 采集对象 列表
	missionObj_list = []
}).

%% 
-define(GS2U_MoneyChanges,53651).
-record(pk_GS2U_MoneyChanges,{
	%% MoneyChanges
	changes = []
}).

%% 
%% // 金币副本通关结算
-define(GS2U_MoneyDungeonCopyMapResult,33334).
-record(pk_GS2U_MoneyDungeonCopyMapResult,{
	%% UInt16 副本地图ID
	copyMapID = 0,
	%% UInt16 通关分数 0 表示失败
	score = 0,
	%% UInt16 最大关卡
	maxChapter = 0,
	%% UInt16 完成关卡
	finishChapter = 0,
	%% UInt16 当前关卡的怪物种类
	listMonsterID = [],
	%% Byte 对应listMonsterID的已杀掉的数量
	listMonsterCountKill = []
}).

%% 
%% // 点金手
-define(GS2U_MoneyTreeAck,19751).
-record(pk_GS2U_MoneyTreeAck,{
	%% UInt32金币总数
	totalMoney = 0,
	%% UInt32宝箱金币
	boxMoney = 0,
	%% UInt16倍数
	rate = 0
}).

%% 
%% // 点金手宝箱
-define(GS2U_MoneyTreeBox,58681).
-record(pk_GS2U_MoneyTreeBox,{
	%% UInt32金币总数
	totalMoney = 0,
	%% UInt16倍数
	rate = 0
}).

%% 
%% // 客户端需求：进入所需新图时明确通知客户端
-define(GS2U_MonsterBookEnterNewMap_Sync,65173).
-record(pk_GS2U_MonsterBookEnterNewMap_Sync,{
	%% UInt16
	mapid = 0
}).

%% 
%% // 拍照、击杀怪物，导致可以解锁、领奖
%% // 此时服务端通知客户端，以便红点显示
%% // 通知的时机有2种：1.角色上线时（没有则不发送）；2.条件刚刚达成时
-define(GS2U_MonsterBookNeed_Sync,27745).
-record(pk_GS2U_MonsterBookNeed_Sync,{
	%% UInt16 可以解锁的怪物ID集
	listUnlockID = [],
	%% UInt16 可以领奖的怪物ID集
	listRewardID = []
}).

%% 
-define(GS2U_MonsterBookReward_Ack,46584).
-record(pk_GS2U_MonsterBookReward_Ack,{
	%% UInt16 怪物ID
	id = 0
}).

%% 
-define(GS2U_MonsterBookSnap_Ack,19083).
-record(pk_GS2U_MonsterBookSnap_Ack,{
	%% UInt16 怪物ID
	id = 0
}).

%% 
-define(GS2U_MonsterBookUnlock_Ack,32613).
-record(pk_GS2U_MonsterBookUnlock_Ack,{
	%% UInt16 怪物ID
	id = 0
}).

%% 
-define(GS2U_MonsterBook_Ack,59793).
-record(pk_GS2U_MonsterBook_Ack,{
	%% UInt16 已经去过的普通地图
	listMapID = [],
	%% MonsterBook 图鉴数据
	listMonster = []
}).

%% 
-define(GS2U_MonsterList,32656).
-record(pk_GS2U_MonsterList,{
	%% LookInfoMonster 视野范围内怪物列表
	monster_list = []
}).

%% 
%% //月卡到期提醒
-define(GS2U_MonthCardEndTips,61679).
-record(pk_GS2U_MonthCardEndTips,{
	%% Byte剩余天数
	remainDays = 0
}).

%% 
-define(GS2U_MoveInfo,58171).
-record(pk_GS2U_MoveInfo,{
	%% UInt64
	code = 0,
	%% Single移动的目标点X
	posX = 0.0,
	%% Single移动的目标点Y
	posY = 0.0,
	%% PosInfo包括起点和终点在内的所有路径点
	posInfos = []
}).

%% 
%% // 在GS中换线或登录时，如果有失败性错误，就给手机发该消息
-define(GS2U_MsgBoxTips,18862).
-record(pk_GS2U_MsgBoxTips,{
	%% Int32
	code = 0,
	%% String
	msg = ""
}).

%% 
%% //增加公告，gs发给client(为了用上面的公告消息列表）
-define(GS2U_NoticeAdd,22937).
-record(pk_GS2U_NoticeAdd,{
	%% NoticeInfo
	notice = []
}).

%% 
%% //删除公告，gs发给client(为了用上面的公告消息列表）
-define(GS2U_NoticeDel,9751).
-record(pk_GS2U_NoticeDel,{
	%% Int64要删除的公告id
	id = []
}).

%% 
%% //公告消息列表（登录时）
-define(GS2U_NoticeResponse,61141).
-record(pk_GS2U_NoticeResponse,{
	%% SByte0客户端与服务器一致，不用修改/1客户端与服务器不一致，需要用下面的noticeList覆盖
	result = 0,
	%% NoticeInfo登录时，LS给玩家发的有效公告
	noticeList = []
}).

%% 
-define(GS2U_NpcList,639).
-record(pk_GS2U_NpcList,{
	%% LookInfoNpc 视野范围内 Npc 列表
	npc_list = []
}).

%% 
%% // npc的动作状态改变
-define(GS2U_NpcStatusChange,38415).
-record(pk_GS2U_NpcStatusChange,{
	%% UInt64
	code = 0,
	%% UInt32 npc的动作状态
	actionStatus = 0
}).

%% 
-define(GS2U_ObjBrief,4191).
-record(pk_GS2U_ObjBrief,{
	%% SByte 对象类型
	obj_type = 0,
	%% ObjBrief 对象列表
	objs = []
}).

%% 
-define(GS2U_PetList,18025).
-record(pk_GS2U_PetList,{
	%% LookInfoPet 视野范围内宠物列表
	pet_list = []
}).

%% 
%% // 出战宠物的等级变化
-define(GS2U_PetLvlChange,47891).
-record(pk_GS2U_PetLvlChange,{
	%% UInt64
	code = 0,
	%% UInt16 宠物等级
	level = 0
}).

%% 
%% // 出战宠物的转生等级变化
-define(GS2U_PetRawLvlChange,18249).
-record(pk_GS2U_PetRawLvlChange,{
	%% UInt64
	code = 0,
	%% Byte 宠物转生等级
	rawLvl = 0
}).

%% 
-define(GS2U_PlayerAddExp,47341).
-record(pk_GS2U_PlayerAddExp,{
	%% UInt32当前经验，客户端自己使用发送的当前经验与之前的经验差作为增加经验
	curExp = 0,
	%% Int32增加经验
	addExp = 0,
	%% Int32杀怪经验相关加成百分点
	addPercent = 0
}).

%% 
%% //使用道具后返回信息
-define(GS2U_PlayerAwakenInfo,38672).
-record(pk_GS2U_PlayerAwakenInfo,{
	%% SByte0表示进入游戏  1表示后续升级
	type = 0,
	%% SByte觉醒等级
	awakenLevel = 0,
	%% UInt16吃了多少个
	itemNum = 0
}).

%% 
-define(GS2U_PlayerBaseInfo,25296).
-record(pk_GS2U_PlayerBaseInfo,{
	%% RoleBaseInfo
	baseInfo
}).

%% 
-define(GS2U_PlayerBlood,52109).
-record(pk_GS2U_PlayerBlood,{
	%% UInt32
	blood = 0
}).

%% 
-define(GS2U_PlayerChangedWealth,15512).
-record(pk_GS2U_PlayerChangedWealth,{
	%% UInt32财富类型
	type = 0,
	%% UInt32财富值
	wealth = 0,
	%% UInt16原因码
	reason = 0
}).

%% 
%% //同步玩家怒气值
-define(GS2U_PlayerCour,3746).
-record(pk_GS2U_PlayerCour,{
	%% UInt32玩家怒气值
	cour = 0
}).

%% 
%% // 角色死亡(自己死亡，不广播)
-define(GS2U_PlayerDead,33757).
-record(pk_GS2U_PlayerDead,{
	%% UInt64 角色死亡时服务器时间，单位秒
	deadTime = 0,
	%% UInt64 角色Code
	code = 0,
	%% UInt32 营地普通复活CD时间，单位秒
	normalReviveCDTime = 0,
	%% MoneyInit 立即原地复活消耗
	reviveCost,
	%% UInt64 攻击者Code
	attackCode = 0,
	%% String 攻击者名字
	attackName = "",
	%% MoneyInit 丢失金钱列表
	lostMoney = [],
	%% UInt32 复活类型,0：死亡后不弹复活界面，实际为营地复活;1：营地复活;2：自动复活倒计时;4：原地复活;多项复活类型，则相加。
	reviveType = 0,
	%% UInt32 角色已经复活次数
	reviveCount = 0
}).

%% 
%% // 同步玩家的当前血量（非战斗状态只发送给自己）
-define(GS2U_PlayerHp,38317).
-record(pk_GS2U_PlayerHp,{
	%% UInt64 玩家Code
	code = 0,
	%% UInt32 玩家的血量
	hp = 0
}).

%% 
%% //玩家登陆初始化结束消息
-define(GS2U_PlayerInitEnd,8238).
-record(pk_GS2U_PlayerInitEnd,{
}).

%% 
-define(GS2U_PlayerLevelUp,65190).
-record(pk_GS2U_PlayerLevelUp,{
	%% UInt64玩家流水号
	code = 0,
	%% UInt32当前经验
	curExp = 0,
	%% UInt32最大经验
	maxExp = 0,
	%% UInt32增加经验
	addExp = 0,
	%% Int32杀怪经验相关加成百分点
	addPercent = 0,
	%% Byte等级
	level = 0
}).

%% 
%% // 同步玩家体力值
-define(GS2U_PlayerPhys,11003).
-record(pk_GS2U_PlayerPhys,{
	%% UInt32玩家体力值
	phys = 0
}).

%% 
%% // 发送给复活玩家自己的消息
-define(GS2U_PlayerRevive,42726).
-record(pk_GS2U_PlayerRevive,{
	%% UInt16地图ID
	mapId = 0,
	%% Single坐标X
	x = 0.0,
	%% Single坐标Y
	y = 0.0,
	%% UInt32当前血量
	curHp = 0,
	%% UInt32最大血量
	maxHp = 0,
	%% UInt32当前能量
	curPower = 0,
	%% UInt32当前体力
	curPhys = 0
}).

%% 
%% // 同步玩家的职业相关的特殊属性（能量）（非战斗状态只发送给自己，具体值）
-define(GS2U_PlayerSp,16330).
-record(pk_GS2U_PlayerSp,{
	%% UInt32 玩家的能量值
	sp = 0
}).

%% 
%% //通知玩家剧情对话
-define(GS2U_PlotDialogue,18245).
-record(pk_GS2U_PlotDialogue,{
	%% UInt32剧情对话配置表ID
	id = 0
}).

%% 
%% // 属性同步
-define(GS2U_PropSync,30926).
-record(pk_GS2U_PropSync,{
	%% UInt64 属性改变的角色流水号
	code = 0,
	%% PropInt 整形属性集合
	ints = [],
	%% PropInt64 64位整形属性集合
	int64s = [],
	%% PropFloat 浮点属性集合
	floats = [],
	%% PropString 字符串属性集合
	strs = []
}).

%% 
-define(GS2U_PushInfo,38424).
-record(pk_GS2U_PushInfo,{
	%% pushItem
	items = [],
	%% UInt32
	startTime = 0,
	%% UInt32
	endTime = 0
}).

%% 
%% // 上线初始化报名状态（没有报名则没有这个消息
-define(GS2U_RaceApplyInfo_Sync,61535).
-record(pk_GS2U_RaceApplyInfo_Sync,{
	%% RaceTeamBase
	info
}).

%% 
%% // 骑宠竞速 报名状态同步
%% // 邀请、被邀请、报名、取消报名等行为会造成该状态的同步
-define(GS2U_RaceApplyState,58816).
-record(pk_GS2U_RaceApplyState,{
	%% Int32 逻辑上的返回值，前后端商议具体内容，用于处理界面逻辑
	retInfo = 0,
	%% Error 需要提示的错误信息，可能为空，其中ErrorCode为0时表示不提示
	errorInfo = [],
	%% RaceCanBeInvite 邀请人信息（必定存在，自己不是乘客时这里是自己，自己是乘客时必定有邀请人）
	master,
	%% RaceCanBeInvite 已邀请的角色信息（可能为空）
	passenger = [],
	%% UInt16 邀请人使用骑宠，邀请人信息为空时无效
	petID = 0,
	%% Byte 0你是邀请人 1你是被邀请人
	type = 0,
	%% Boolean 是否已报名
	isApply = false,
	%% Byte 是否自动匹配 0不进行自动匹配 1进行自动匹配 2主人自动匹配时不当乘客 注：这里是队伍属性而不是自己的属性
	autoMatch = 0
}).

%% 
%% // 报名成功反馈
%% // 所有相关角色会收到该消息
-define(GS2U_RaceApply_Ack,8451).
-record(pk_GS2U_RaceApply_Ack,{
	%% RaceTeamBase
	info
}).

%% 
%% // 取消报名成功反馈
%% // 所有相关角色会收到该消息
-define(GS2U_RaceCancel_Ack,15285).
-record(pk_GS2U_RaceCancel_Ack,{
	%% CrossRoleBase 取消者信息
	role
}).

%% 
%% //////////////////////////////////////////////////////////////
%% // 跨服骑宠竞速 begin
%% // 骑宠竞速 初始化
%% // 仅普通服执行
%% // 上线时、子模式改变时触发该消息
-define(GS2U_RaceInit,5905).
-record(pk_GS2U_RaceInit,{
	%% Byte 0普通模式 1双倍道具 2强化道具 3加速模式 4混乱模式
	type = 0,
	%% UInt16 最近选择的骑宠ID，可用于默认的骑宠选择
	petID = 0,
	%% Byte 0不进行自动匹配 1进行自动匹配 2主人自动匹配时不当乘客
	autoMatch = 0
}).

%% 
%% // 骑宠竞速 返回查询可邀请人列表的结果
-define(GS2U_RaceInviteList,17164).
-record(pk_GS2U_RaceInviteList,{
	%% Int32 逻辑上的返回值，前后端商议具体内容，用于处理界面逻辑
	retInfo = 0,
	%% Error 需要提示的错误信息，可能为空，其中ErrorCode为0时表示不提示
	errorInfo = [],
	%% RaceCanBeInvite 已排序的列表
	listInfo = []
}).

%% 
%% // 骑宠竞速 通知被邀请信息
-define(GS2U_RaceInvite_S2B,54938).
-record(pk_GS2U_RaceInvite_S2B,{
	%% RaceCanBeInvite 邀请人信息
	master,
	%% UInt16 使用骑宠
	petID = 0,
	%% UInt32 超时点（从1970年开始的本地时间，秒）
	timeout = 0
}).

%% 
%% // 角色弃赛时通知队友
-define(GS2U_RaceMapGiveUp_Sync,56427).
-record(pk_GS2U_RaceMapGiveUp_Sync,{
	%% Boolean 是否已经冲过终点
	isComplete = false,
	%% Byte 弃赛原因：0没有入场；1离开地图；2掉线；3下马
	reason = 0,
	%% CrossRoleBase 弃赛者信息
	role
}).

%% 
%% // 活动地图内广播：刷新道具情况
-define(GS2U_RaceMapItem_Sync,22340).
-record(pk_GS2U_RaceMapItem_Sync,{
	%% UInt64 报名组ID
	applyID = 0,
	%% UInt64 谁
	roleID = 0,
	%% Boolean 获得还是使用
	getOrUse = false,
	%% Byte 虚拟道具ID 对应配置race_item.id
	itemID = 0,
	%% RaceTeamItem 刷新最新道具情况
	item
}).

%% 
%% // 活动地图内广播：刷新里程碑变动
-define(GS2U_RaceMapMilestone_Sync,42481).
-record(pk_GS2U_RaceMapMilestone_Sync,{
	%% UInt64 报名组ID
	applyID = 0,
	%% RaceTeamSort
	sort
}).

%% 
%% // 活动地图内广播：阶段切换
-define(GS2U_RaceMapState_Sync,43248).
-record(pk_GS2U_RaceMapState_Sync,{
	%% Byte 0普通模式 1双倍道具 2强化道具 3加速模式 4混乱模式
	type = 0,
	%% Byte 1准备倒计时 2比赛中 3已有角色冲过终点 4结算倒计时
	state = 0,
	%% UInt16 本阶段剩余时间
	sec = 0,
	%% UInt32 开始比赛时间，用于结算时计算角色耗时
	timeBegin = 0,
	%% RaceTeamEx 全信息更新
	info = []
}).

%% 
%% // 骑宠竞速 返回选择骑宠的结果
-define(GS2U_RaceSeletPet,10751).
-record(pk_GS2U_RaceSeletPet,{
	%% Int32 逻辑上的返回值，前后端商议具体内容，用于处理界面逻辑
	retInfo = 0,
	%% Error 需要提示的错误信息，可能为空，其中ErrorCode为0时表示不提示
	errorInfo = [],
	%% UInt16 最新的已选择骑宠，为0时表示未选择
	petID = 0
}).

%% 
%% // 下次活动模式
%% // 角色上线时同步，活动结束后可能同步
-define(GS2U_RaceType_Sync,64455).
-record(pk_GS2U_RaceType_Sync,{
	%% Byte 0普通模式 1双倍道具 2强化道具 3加速模式 4混乱模式
	type = 0
}).

%% 
-define(GS2U_ReceivePlayerLevelRewardResult,34012).
-record(pk_GS2U_ReceivePlayerLevelRewardResult,{
	%% Byte当领取成了就发送 此消息，其余的均发送error_code【1等级不够、2已经领取 走error code】
	level = 0
}).

%% 
%% // 断线重连  申请进入目标gs失败，客户端重新登录
-define(GS2U_ReconnectLoginRequestFail,51511).
-record(pk_GS2U_ReconnectLoginRequestFail,{
}).

%% 
%% // 低级副本扫荡（请求扫荡反馈，为了共用结构）
-define(GS2U_RequestAutoDealAck,53731).
-record(pk_GS2U_RequestAutoDealAck,{
	%% Boolean	是否成功
	isSuccess = false,
	%% UInt16 副本地图ID
	copyMapID = 0,
	%% CoinData 货币奖励
	coinReward = [],
	%% UInt64 经验奖励
	expReward = 0,
	%% CopyMapDropItem 掉落列表
	dropItems = []
}).

%% 
%% //返回女神的code
-define(GS2U_RequestGoddessCodeAck,30210).
-record(pk_GS2U_RequestGoddessCodeAck,{
	%% UInt64	女神code
	goddessCode = 0
}).

%% 
-define(GS2U_RequestOneKeyDealAck,61681).
-record(pk_GS2U_RequestOneKeyDealAck,{
	%% RequestAutoDeal
	listResult = []
}).

%% 
%% //玩家充值请求ACK,订单处理成功了才发给client
-define(GS2U_RequestRechargeAck,39891).
-record(pk_GS2U_RequestRechargeAck,{
	%% Stringfuncell的订单号，服务器以些为准，会去重
	funcellOrderID = "",
	%% Single金额
	moneyNun = 0.0
}).

%% 
-define(GS2U_RequestRechargeHasGiftIDListAck,2244).
-record(pk_GS2U_RequestRechargeHasGiftIDListAck,{
	%% UInt32本玩家已经领过的id
	takenIDList = [],
	%% RechargeDoubleConf双倍的配置列表
	confIDList = []
}).

%% 
%% // 返回目标副本的最高分数
-define(GS2U_RequestTargetCopyMapScore,41707).
-record(pk_GS2U_RequestTargetCopyMapScore,{
	%% UInt32 目标副本ID
	targetCopyMapID = 0,
	%% UInt32 最高分数
	highestScore = 0
}).

%% 
%% //重置副本成功的消息，失败则统一使用系统错误号
-define(GS2U_ResetCopyMap,9512).
-record(pk_GS2U_ResetCopyMap,{
	%% UInt16副本地图ID
	copyMapID = 0
}).

%% 
%% // 下载语音数据
-define(GS2U_RespChatVoice,2670).
-record(pk_GS2U_RespChatVoice,{
	%% Byte一条消息总段数
	count = 0,
	%% Byte分段索引
	index = 0,
	%% UInt64 playercode + timesec
	playerID = 0,
	%% UInt32
	key = 0,
	%% Byte 音频数据
	data = []
}).

%% 
%% // 下载语音数据
-define(GS2U_RespChatVoiceError,2854).
-record(pk_GS2U_RespChatVoiceError,{
	%% UInt64 playercode + timesec
	playerID = 0,
	%% UInt32
	key = 0,
	%% Byte 错误码
	errorCode = 0
}).

%% 
%% // 当前觉醒信息
-define(GS2U_RoleAwakeInof,8784).
-record(pk_GS2U_RoleAwakeInof,{
	%% Byte 当前阶
	curStage = 0,
	%% Byte 当前激活的漂浮之石
	curStone = 0,
	%% OneAwakeinfo已经激活的属性选择
	allAwakeInfo = []
}).

%% 
%% // 激活某个漂浮之石返回
-define(GS2U_RoleAwakeingRet,15938).
-record(pk_GS2U_RoleAwakeingRet,{
	%% Byte
	stage = 0,
	%% Byte
	stone = 0,
	%% UInt32stage 的 激活 stone 激活的属性选项
	param = 0
}).

%% 
-define(GS2U_SelPlayerResult,42464).
-record(pk_GS2U_SelPlayerResult,{
	%% Int32
	result = 0
}).

%% 
%% //通知玩家发了奖励物品
-define(GS2U_SendGiftNotice,55980).
-record(pk_GS2U_SendGiftNotice,{
	%% UInt64 1为宝箱
	ids = []
}).

%% 
-define(GS2U_SendPlayerDailyCountList,27517).
-record(pk_GS2U_SendPlayerDailyCountList,{
	%% PlayerDailyCount
	playerDailyCountList = []
}).

%% 
%% //将服务器类型发送给客户端
-define(GS2U_SendServerType,38589).
-record(pk_GS2U_SendServerType,{
	%% UInt32
	serverType = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
-define(GS2U_SessionKey,40925).
-record(pk_GS2U_SessionKey,{
	%% String
	key = ""
}).

%% 
%% // 30日登录大奖 end
%% ////////////////////////////////////////////////////////////
%% // 实时语音 女主播 begin
%% ////////////////////////////////////////////////////////////
-define(GS2U_SetUpAnchor,54142).
-record(pk_GS2U_SetUpAnchor,{
	%% Int64 主播ID
	args = []
}).

%% 
%% // 领取奖励成功的反馈消息，用于刷新界面
-define(GS2U_SevenDayAimReward_Ack,8783).
-record(pk_GS2U_SevenDayAimReward_Ack,{
	%% UInt16 如同配置表seven_day_aim.id
	id = 0
}).

%% 
%% // 上线推送七日目标状态
-define(GS2U_SevenDayAimState_Sync,5899).
-record(pk_GS2U_SevenDayAimState_Sync,{
	%% UInt32 活动开始时间（从1970年1月1日至今的秒数，活动持续7*24小时）
	timeBegin = 0,
	%% SevenDayAimUpdate 条件集（活动不在有效期内时为空）
	conditions = [],
	%% UInt16 已经领取的奖励对应配置ID集，参考seven_day_aim.id
	alreadyReward = []
}).

%% 
-define(GS2U_SevenDayAimUpdate_Sync,34075).
-record(pk_GS2U_SevenDayAimUpdate_Sync,{
	%% Int32 条件类型
	type = 0,
	%% Int64 条件参数
	args = []
}).

%% 
-define(GS2U_ShiftTo,33489).
-record(pk_GS2U_ShiftTo,{
	%% UInt64瞬移目标Code
	code = 0,
	%% Single瞬移的目标点X
	posX = 0.0,
	%% Single瞬移的目标点Y
	posY = 0.0
}).

%% 
%% // 显示动作
-define(GS2U_ShowAction,18095).
-record(pk_GS2U_ShowAction,{
	%% UInt64
	playerCode = 0,
	%% UInt32 符号索引
	actionIndex = 0
}).

%% 
%% // 副本触发特殊事件
-define(GS2U_SpecificEvent_Sync,30574).
-record(pk_GS2U_SpecificEvent_Sync,{
	%% UInt32 事件ID
	eventID = 0,
	%% Boolean 表示对应表copymapScheduleInit或表copymapScheduleSettle
	initOrSettle = false,
	%% UInt32 表示表copymapScheduleInit或表copymapScheduleSettle对应的ID
	scheduleID = 0
}).

%% 
-define(GS2U_StopMove,35067).
-record(pk_GS2U_StopMove,{
	%% UInt64 停止      
	code = 0,
	%% Single 停止到的位置X
	posX = 0.0,
	%% Single 停止到的位置Y
	posY = 0.0
}).

%% 
-define(GS2U_StopTheAwakeBuffRet,47884).
-record(pk_GS2U_StopTheAwakeBuffRet,{
}).

%% 
%% //同步服务器时间
-define(GS2U_SyncServerTime,1399).
-record(pk_GS2U_SyncServerTime,{
	%% UInt32UTC时间（相对于1970年第0秒），单位秒
	time = 0
}).

%% 
-define(GS2U_TaskUseItemList,7311).
-record(pk_GS2U_TaskUseItemList,{
	%% TaskUseItem 视野范围内 使用物品 列表
	useItemlist = []
}).

%% 
%% // 觉醒buff信息
-define(GS2U_TheAwakeBuffInfo,46737).
-record(pk_GS2U_TheAwakeBuffInfo,{
	%% UInt32buffID
	buffID = 0,
	%% Byte当前转态	0 未使用 1 正在使用
	curstatus = 0,
	%% UInt32剩余时间
	lefttime = 0
}).

%% 
%% // 七日目标 end
%% ////////////////////////////////////////////////////////////
%% ////////////////////////////////////////////////////////////
%% // 30日登录大奖 begin
%% // 上线推送状态
-define(GS2U_ThirtyDayLoginGiftState_Sync,38996).
-record(pk_GS2U_ThirtyDayLoginGiftState_Sync,{
	%% UInt32 活动开始时间（从1970年1月1日至今的秒数，活动持续30*24小时）
	timeBegin = 0,
	%% UInt16 领取到的奖励ID，对应配置表thirty_day_login_gift.id，奖励只能按升序领取
	alreadyReward = 0
}).

%% 
%% // 领取奖励成功的反馈消息，用于刷新界面
-define(GS2U_ThirtyDayLoginGift_Ack,50225).
-record(pk_GS2U_ThirtyDayLoginGift_Ack,{
	%% UInt16 如同配置表thirty_day_login_gift.id
	id = 0
}).

%% 
-define(GS2U_TipsError,48180).
-record(pk_GS2U_TipsError,{
	%% UInt32
	errorCode = 0
}).

%% 
%% //提示消息
-define(GS2U_TipsString,5369).
-record(pk_GS2U_TipsString,{
	%% Byte提示显示类型：0=tips，1=聊天-系统，2=跑马灯，3=喇叭消息，4=messagebox
	type = 0,
	%% String提示的字符串
	tips = "",
	%% String附带的参数
	params = []
}).

%% 
-define(GS2U_TransferNewPos,22727).
-record(pk_GS2U_TransferNewPos,{
	%% UInt64
	code = 0,
	%% PosInfo
	pos
}).

%% 
-define(GS2U_UserPlayerList,18582).
-record(pk_GS2U_UserPlayerList,{
	%% Int32是否解锁新种族
	unlockNewRace = 0,
	%% UserPlayerData
	info = []
}).

%% 
%% //翅膀升级消息
-define(GS2U_WingRise,61596).
-record(pk_GS2U_WingRise,{
	%% UInt32
	itemID = 0,
	%% Int32
	expChange = 0
}).

%% 
%% //首领入侵 鼓舞伤害加成
-define(GS2U_WorldBossBuyBuff,49866).
-record(pk_GS2U_WorldBossBuyBuff,{
	%% Byte货币使用类型
	type = 0
}).

%% 
%% // 返回结果
-define(GS2U_XmlNoticeResponse,64460).
-record(pk_GS2U_XmlNoticeResponse,{
	%% Byte1更新公告;2活动公告
	type = 0,
	%% Byte0用content修改；1不用修改；2没有内容
	ret = 0,
	%% String公告内容,json串
	content = "",
	%% String小写md5(content)
	sign = ""
}).

%% 
%% //服务器下发给客户端的体力值信息
-define(GS2U_action_point_info,27166).
-record(pk_GS2U_action_point_info,{
	%% UInt32
	value = 0,
	%% UInt32
	lastUpdateUtcTime = 0
}).

%% 
%% //将服务器副本销毁时间同步给客户端
-define(GS2U_copy_map_destory_time,11581).
-record(pk_GS2U_copy_map_destory_time,{
	%% UInt32副本id
	copyMapID = 0,
	%% UInt64活动销毁时间
	destoryTime = 0,
	%% UInt64
	waitTime = 0
}).

%% 
%% //服务器将玩家抽到的奖励发给客户端
-define(GS2U_lottery_award_items,21812).
-record(pk_GS2U_lottery_award_items,{
	%% lottery_award_item_info
	award_item_list = [],
	%% lottery_award_item_info
	award_item_list_sp = []
}).

%% 
%% //服务器返回宝藏系统信息给客户端
-define(GS2U_lottery_sys_info,37194).
-record(pk_GS2U_lottery_sys_info,{
	%% Int16
	goblin_lottery_last_free_times = 0,
	%% UInt32
	goblin_lottery_free_cd = 0,
	%% UInt32
	treasure_lottery_last_free_times = 0,
	%% UInt32
	treasure_lottery_free_cd = 0
}).

%% 
-define(GS2U_lsbattlefield_award_list,9612).
-record(pk_GS2U_lsbattlefield_award_list,{
	%% UInt32名次
	index = 0,
	%% lsbattlefield_award奖励的道具列表
	award_list = [],
	%% UInt32货币类型
	coinType = 0,
	%% UInt32货币个数
	coinValue = 0
}).

%% 
%% //服务器下发给客户端的战斗排行列表
-define(GS2U_lsbattlefield_rank_list,17121).
-record(pk_GS2U_lsbattlefield_rank_list,{
	%% lsbattlefield_rank
	rank_list = []
}).

%% 
%% //怪物数变化
-define(GS2U_monsterChange,60138).
-record(pk_GS2U_monsterChange,{
	%% UInt32 本地图当前怪物数
	number = 0
}).

%% 
%% //返回好友坐标
-define(GS2U_returnFriendPos,20446).
-record(pk_GS2U_returnFriendPos,{
	%% UInt32地图ID
	mapID = 0,
	%% Single新的坐标
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
%% //同步服务器乱世为王活动状态给客户端
-define(GS2U_synch_lsbattlefield_state,52959).
-record(pk_GS2U_synch_lsbattlefield_state,{
	%% UInt32活动状态
	state = 0
}).

%% 
%% // 获取获取在线奖励
-define(GetPlayerOnlineReward,12473).
-record(pk_GetPlayerOnlineReward,{
	%% UInt32当领取成了就发送此消息，其余的走error code
	timeID = 0
}).

-record(pk_LBSRole,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = "",
	%% String 归属服名
	server = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% Byte 自定义头像MD5(16byte)
	face = [],
	%% UInt64 历史最大战力（包含骑宠）
	maxForceAll = 0,
	%% Byte 是自己的什么好友 0本地正式好友 1本地临时好友 2本地黑名单 3本地申请者 4本地陌生人 5跨服好友 6跨服申请者 7自己 8跨服陌生人
	frt = 0,
	%% UInt64 家园ID（目前仅限于同服拜访，跨服或没有时为0）
	homeID = 0,
	%% Single 纬度
	lat = 0.0,
	%% Single 经度
	lng = 0.0,
	%% Single 与自己的距离 100.0时需要处理为小于100 超过5000时需显示太远
	dist = 0.0
}).

-record(pk_LookInfoMonster,{
	%% UInt64
	code = 0,
	%% UInt32 怪物 ID	
	id = 0,
	%% Single 怪物坐标
	x = 0.0,
	%% Single
	y = 0.0,
	%% Single旋转坐标W
	rotW = 0.0,
	%% Single 怪物移动的目标点X
	targetX = 0.0,
	%% Single 怪物移动的目标点Y
	targetY = 0.0,
	%% Single 怪物移动速度
	move_speed = 0.0,
	%% Single 怪物攻击速度
	attack_speed = 0.0,
	%% Byte 怪物现在是在走还是在跑（客户端用于播放动画）
	moveStatus = 0,
	%% Byte 类型 0:普通怪 1:载体怪
	type = 0,
	%% Byte 当前血量百分比
	hp_per = 0,
	%% SByte 阵营
	camp = 0,
	%% UInt64 归宿code
	usercode = 0,
	%% UInt64 怪物所属分组ID
	groupID = 0,
	%% UInt64 怪物所属军团ID
	guildID = 0,
	%% BuffBaseInfo当前buff列表
	buffs = [],
	%% String 名字
	name = "",
	%% UInt16怪物等级
	level = 0
}).

-record(pk_LookInfoNpc,{
	%% UInt64
	code = 0,
	%% UInt32 Npc ID
	id = 0,
	%% Single Npc 坐标
	x = 0.0,
	%% Single
	y = 0.0,
	%% Single旋转坐标W
	rotW = 0.0,
	%% String 名称
	name = "",
	%% UInt32 npc的动作状态
	actionStatus = 0,
	%% String npc称号(如果为空，则客户端自己取配置中的称号)
	title = ""
}).

-record(pk_LookInfoPet,{
	%% UInt64 宠物 Code
	code = 0,
	%% UInt32 宠物 ID
	id = 0,
	%% String 名字
	name = "",
	%% UInt16 宠物等级
	level = 0,
	%% UInt64 主人 Code
	playerCode = 0,
	%% Single 宠物坐标
	x = 0.0,
	%% Single
	y = 0.0,
	%% Single 宠物移动的目标点X
	targetX = 0.0,
	%% Single 宠物移动的目标点Y
	targetY = 0.0,
	%% Single 宠物移动速度
	move_speed = 0.0,
	%% Byte 当前血量百分比
	hp_per = 0,
	%% SByte 宠物状态 7:隐身状态
	status = 0,
	%% SByte 阵营
	camp = 0,
	%% Byte 玩家Pk状态  
	pkMode = 0,
	%% Byte 宠物转生等级
	rawLvl = 0,
	%% BuffBaseInfo 当前buff列表
	buffs = []
}).

-record(pk_MapLineInfo,{
	%% UInt32 线路ID
	lineID = 0,
	%% UInt16 当前线路人数
	number = 0,
	%% Byte 当前是否在本线路，1在该线路
	inStates = 0
}).

-record(pk_MissionObjectInfo,{
	%% UInt64
	code = 0,
	%% UInt32 采集对象 ID
	id = 0,
	%% Single 采集对象 坐标
	x = 0.0,
	%% Single
	y = 0.0,
	%% Single旋转坐标W
	rotW = 0.0
}).

-record(pk_MoneyChanges,{
	%% UInt64
	code = 0,
	%% MoneyInit货币变化列表
	moneys = []
}).

-record(pk_MoneyInit,{
	%% Byte
	moneyType = 0,
	%% UInt32
	value = 0
}).

-record(pk_MonsterBook,{
	%% UInt16 怪物ID
	id = 0,
	%% UInt32 击杀数量
	kill = 0,
	%% Boolean 是否拍照
	isSnap = false,
	%% Boolean 是否解锁
	isUnlock = false,
	%% Boolean 是否领奖
	isReward = false
}).

-record(pk_NoticeInfo,{
	%% Int64公告id
	id = 0,
	%% SByte0即时，1定时，2轮播
	type = 0,
	%% SByte0跑马灯/1登陆界面的公告板/2游戏内的公告板
	pos = 0,
	%% String内容
	content = "",
	%% Int320xffffff rgb值
	color = 0,
	%% Int64多少秒后开始
	afterSecondStart = 0,
	%% Int64从开始时间持续多少秒	
	duration = 0,
	%% Int32间隔时间秒
	interval = 0
}).

-record(pk_ObjBrief,{
	%% UInt64
	code = 0,
	%% String名字
	name = "",
	%% Single坐标X
	x = 0.0,
	%% Single坐标Y
	y = 0.0
}).

-record(pk_OneAwakeinfo,{
	%% Byte
	stage = 0,
	%% Byte
	stone = 0,
	%% UInt32stage 的 激活 stone 激活的属性选项
	param = 0
}).

-record(pk_PlayerDailyCount,{
	%% UInt32
	dailyType = 0,
	%% UInt32
	dailyID = 0,
	%% UInt32
	dailyValue = 0
}).

%% 
%% //获取等级礼包协议
-define(PlayerLevelReward,32586).
-record(pk_PlayerLevelReward,{
	%% Byte已领取奖励的等级
	receiveRewardLevel = []
}).

-record(pk_PosInfo,{
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

-record(pk_PropFloat,{
	%% UInt16 属性索引
	index = 0,
	%% Single 属性值
	value = 0.0
}).

-record(pk_PropInt,{
	%% UInt16 属性索引
	index = 0,
	%% Int32 属性值
	value = 0
}).

-record(pk_PropInt64,{
	%% UInt16 属性索引
	index = 0,
	%% UInt64 属性值
	value = 0
}).

-record(pk_PropString,{
	%% UInt16 属性索引
	index = 0,
	%% String 属性值
	value = ""
}).

-record(pk_RaceCanBeInvite,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% Byte 自定义头像MD5(16byte)
	face = [],
	%% UInt64 最高战力
	maxForce = 0,
	%% Boolean 是否是伴侣
	isCouple = false,
	%% Boolean 是否是本地正式好友
	isFriend = false,
	%% Boolean 是否是家族成员
	isGuildMember = false,
	%% UInt32 友好度
	friendliness = 0,
	%% UInt32 家族活跃度（进入家族后累计获得的贡献值）
	liveness = 0
}).

-record(pk_RaceTeamBase,{
	%% UInt64 报名组ID
	applyID = 0,
	%% UInt64 报名组队长角色ID
	leaderID = 0,
	%% CrossRoleBase 成员角色信息
	members = [],
	%% UInt16 骑宠ID
	petID = 0
}).

-record(pk_RaceTeamEx,{
	%% UInt64 等价于base.applyID，此处方便算法上查找
	applyID = 0,
	%% RaceTeamBase
	base,
	%% RaceTeamItem
	item,
	%% RaceTeamSort
	sort,
	%% UInt64 弃赛者角色ID（为0时表示尚未弃赛
	giveUpID = 0
}).

-record(pk_RaceTeamItem,{
	%% Byte 1号角色的道具
	listItemIDA = [],
	%% Byte 2号角色的道具
	listItemIDB = []
}).

-record(pk_RaceTeamSort,{
	%% Byte 完成圈数
	laps = 0,
	%% Byte 最后碰触到的有效里程碑
	milestone = 0,
	%% UInt64 最后碰触到有效里程碑的时间（从1970-01-01开始计算的本地时间，单位毫秒
	time = 0
}).

-record(pk_RechargeDoubleConf,{
	%% UInt32
	id = 0,
	%% Single
	payMoney = 0.0
}).

-record(pk_RequestAutoDeal,{
	%% Boolean	是否成功
	isSuccess = false,
	%% UInt16 副本地图ID
	copyMapID = 0,
	%% CoinData 货币奖励
	coinReward = [],
	%% UInt64 经验奖励
	expReward = 0,
	%% CopyMapDropItem 掉落列表
	dropItems = []
}).

-record(pk_RewardUpdateResource,{
	%% Byte第几次
	count = 0,
	%% Boolean是否领取
	flag = false,
	%% UpdateReward奖励列表
	rewardList = []
}).

-record(pk_RoleBaseInfo,{
	%% UInt64
	code = 0,
	%% UInt64
	roleID = 0,
	%% String
	name = "",
	%% String 当前服名
	servername = "",
	%% String 归属服名
	myServerName = "",
	%% Boolean 是否在跨服
	isInCross = false,
	%% Single
	x = 0.0,
	%% Single
	y = 0.0,
	%% UInt32头
	head = 0,
	%% Int16等级
	level = 0,
	%% SByte阵营
	camp = 0,
	%% UInt32职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% SByteVIP
	vip = 0,
	%% Byte当前血量百分比
	hp_per = 0,
	%% UInt32当前经验
	exp = 0,
	%% UInt32当前等级最大经验
	maxExp = 0,
	%% UInt32当前血量
	cur_hp = 0,
	%% UInt32血量最大值
	max_hp = 0,
	%% UInt32当前魔法值
	mp = 0,
	%% UInt16坐骑外观ID （0 表示没有坐骑或者下马状态）
	mountID = 0,
	%% UInt64双人坐骑对方的Code （0 表示没有）	
	otherCode = 0,
	%% Byte玩家Pk状态
	pkMode = 0,
	%% UInt16最大怒气
	maxCourage = 0,
	%% MoneyInit货币初始化
	moneys = [],
	%% visibleEquip玩家可见的装备
	visible_equips = [],
	%% refineLevel装备精炼等级（装备部位强化等级)
	refine_levels = []
}).

-record(pk_SevenDayAimUpdate,{
	%% Int32 条件类型
	type = 0,
	%% Int64 条件参数
	args = []
}).

-record(pk_TaskUseItem,{
	%% UInt64
	code = 0,
	%% UInt32 使用物品 ID
	id = 0,
	%% Single 使用物品 坐标
	x = 0.0,
	%% Single
	y = 0.0,
	%% Single旋转坐标W
	rotW = 0.0
}).

%% 
%% // 骑宠竞速 设置自动匹配
%% // 仅普通服执行，忽略异常值
%% // 反馈相同协议表示成功
-define(U2GS2U_RaceAutoMatch,54278).
-record(pk_U2GS2U_RaceAutoMatch,{
	%% Byte 0不进行自动匹配 1进行自动匹配 2主人自动匹配时不当乘客
	autoMatch = 0
}).

%% 
%% //初始化今日活动任务
-define(U2GS_AcceptHolidayTask,58975).
-record(pk_U2GS_AcceptHolidayTask,{
}).

%% 
%% // 激活码领取请求
-define(U2GS_ActiveCodeRequest,24642).
-record(pk_U2GS_ActiveCodeRequest,{
	%% String 激活码
	code = ""
}).

%% 
%% // 报名请求
%% // 组队时仅队长可发起该请求
-define(U2GS_AliveApply_Request,29011).
-record(pk_U2GS_AliveApply_Request,{
}).

%% 
%% // 取消报名请求
%% // 组队时仅队长可发起该请求
%% // 其它情况服务端自动处理
-define(U2GS_AliveCancel_Request,13929).
-record(pk_U2GS_AliveCancel_Request,{
}).

%% 
%% // 客户端通知服务端进入安全区
-define(U2GS_AliveEnterSafeArea_Request,53495).
-record(pk_U2GS_AliveEnterSafeArea_Request,{
}).

%% 
%% // 请求领取每日现金礼包奖励
-define(U2GS_BusinessCashDailyGift_Request,51064).
-record(pk_U2GS_BusinessCashDailyGift_Request,{
}).

%% 
%% // LBS系统 end
%% ////////////////////////////////////////////////////////////
%% // 假装是商业化内容的签到奖励
%% // dailyType:84,dailyID:0为0时可以领奖
-define(U2GS_BusinessSupperGift_Request,33217).
-record(pk_U2GS_BusinessSupperGift_Request,{
}).

%% 
%% //系统内部购买
-define(U2GS_Buy4System,33723).
-record(pk_U2GS_Buy4System,{
	%% UInt32cost配置表示的id，用以确定购买的item及配置
	costID = 0,
	%% UInt32购买数量
	number = 0
}).

%% 
-define(U2GS_BuyLimitSales,25489).
-record(pk_U2GS_BuyLimitSales,{
	%% UInt32
	sku = 0
}).

%% 
%% // 转职
-define(U2GS_ChangeCarrer,52757).
-record(pk_U2GS_ChangeCarrer,{
	%% UInt32新职业
	newCareer = 0
}).

%% 
%% // 换线  申请进入目标gs
-define(U2GS_ChangeLineLoginRequest,2496).
-record(pk_U2GS_ChangeLineLoginRequest,{
	%% UInt64账号ID
	accountID = 0,
	%% UInt64角色ID
	roleID = 0,
	%% String随机Key
	key = "",
	%% Int32协议版本号
	protocolVer = 0
}).

%% 
-define(U2GS_ChangeLineRequest,16861).
-record(pk_U2GS_ChangeLineRequest,{
	%% Byte 类型，1为换线
	type = 0
}).

%% 
%% // 确认换线(老服)
-define(U2GS_ChangeLineRequestAck,6120).
-record(pk_U2GS_ChangeLineRequestAck,{
	%% Byte 0为确定换线；1为取消
	yes = 0
}).

%% 
%% //客户端请求修改名字
-define(U2GS_ChangeName,43873).
-record(pk_U2GS_ChangeName,{
	%% UInt64
	roleID = 0,
	%% String
	name = ""
}).

%% 
%% //客户端设置翅膀等级
-define(U2GS_ChangeWingLevel,8423).
-record(pk_U2GS_ChangeWingLevel,{
	%% UInt32
	level = 0
}).

%% 
%% // 聊天消息(客户端发送)
-define(U2GS_ChatInfo,21140).
-record(pk_U2GS_ChatInfo,{
	%% SByte频道
	channel = 0,
	%% UInt64接收者ID
	receiverID = 0,
	%% String接收者Name
	receiverName = "",
	%% String内容
	content = ""
}).

%% 
%% // 上传语音数据
-define(U2GS_ChatVoice,15792).
-record(pk_U2GS_ChatVoice,{
	%% Byte一条消息总段数
	count = 0,
	%% Byte分段索引
	index = 0,
	%% UInt64
	playerID = 0,
	%% UInt32 playercode + timesec
	key = 0,
	%% SByte频道
	channel = 0,
	%% Byte 音频数据
	data = []
}).

%% 
-define(U2GS_CommonditiesPush,2855).
-record(pk_U2GS_CommonditiesPush,{
}).

%% 
-define(U2GS_CopyChat,13095).
-record(pk_U2GS_CopyChat,{
}).

%% 
-define(U2GS_DashTo,26663).
-record(pk_U2GS_DashTo,{
	%% Single 冲刺所到的目标点
	posX = 0.0,
	%% Single 冲刺所到的目标点
	posY = 0.0
}).

%% 
-define(U2GS_DigTransferMap,61093).
-record(pk_U2GS_DigTransferMap,{
	%% UInt32
	mapId = 0,
	%% String
	waypointName = ""
}).

%% 
%% // 进入活动或者玩法
-define(U2GS_EnterActiveMap,17012).
-record(pk_U2GS_EnterActiveMap,{
	%% UInt64Npc Code
	npcCode = 0,
	%% UInt16活动ID
	activeID = 0
}).

%% 
%% //进入副本
-define(U2GS_EnterCopyMap,24973).
-record(pk_U2GS_EnterCopyMap,{
	%% UInt16副本地图ID
	copyMapID = 0
}).

%% 
%% // 客户端加载资源完成，可以接收服务器玩家数据
-define(U2GS_EnteredMap,30475).
-record(pk_U2GS_EnteredMap,{
}).

%% 
%% //装备合成
-define(U2GS_EqupmentCombin,23025).
-record(pk_U2GS_EqupmentCombin,{
	%% UInt32
	combinID = 0,
	%% UInt32
	combinNum = 0,
	%% UInt64
	equpmentUIDList = []
}).

%% 
%% // 跨服活动-大逃杀 end
%% ////////////////////////////////////////////////////////////
%% // 每日领取体力
-define(U2GS_EveryDayGetPower,32758).
-record(pk_U2GS_EveryDayGetPower,{
	%% Byte1,中午，2晚上
	getPowerNoonOrNight = 0
}).

%% 
%% // 经验值兑换元气
-define(U2GS_ExpToVigour,55190).
-record(pk_U2GS_ExpToVigour,{
	%% UInt32使用的经验值
	useExpValue = 0
}).

%% 
%% // 获取经验
-define(U2GS_GetLeavedExp,17228).
-record(pk_U2GS_GetLeavedExp,{
	%% Byte获取经验（0：免费获取； 1：金币获取  2：钻石获取）	
	getType = 0
}).

%% 
%% //请求等级值
-define(U2GS_GetMapLevel,4452).
-record(pk_U2GS_GetMapLevel,{
}).

%% 
%% // 问卷调查领奖
-define(U2GS_GetQuestionnaireSurveyAward,3688).
-record(pk_U2GS_GetQuestionnaireSurveyAward,{
}).

%% 
%% //领取更新资源奖励
-define(U2GS_GetUpdateReward,54528).
-record(pk_U2GS_GetUpdateReward,{
	%% Byte领取更新资源奖励第几次
	count = 0
}).

%% 
%% // 领取爵位等级奖励
-define(U2GS_GetVipReward,52508).
-record(pk_U2GS_GetVipReward,{
	%% Int16爵位等级
	vipLevel = 0
}).

%% 
%% //进入经验地图
-define(U2GS_GoToExpMap,36536).
-record(pk_U2GS_GoToExpMap,{
}).

%% 
%% //心跳包(这个只用于检测外挂)
-define(U2GS_HeartBeat,39242).
-record(pk_U2GS_HeartBeat,{
	%% UInt32 客户端自行维护的当前时间
	time = 0,
	%% UInt32 版本号，客户端上传的版本号必须是服务器下发的，否则抛弃
	version = 0
}).

%% 
%% //客户端真正的心跳包，只是客户端定时发给客户端
-define(U2GS_HeartBeatReal,33460).
-record(pk_U2GS_HeartBeatReal,{
	%% UInt32 客户端自行维护的当前时间
	time = 0
}).

%% 
%% // 请求自己的历史最大战力
-define(U2GS_HisoryForce_Request,1549).
-record(pk_U2GS_HisoryForce_Request,{
}).

%% 
-define(U2GS_Join_lsbattlefield,17864).
-record(pk_U2GS_Join_lsbattlefield,{
}).

%% 
%% //请求杀戮值
-define(U2GS_KillValueRequest,11554).
-record(pk_U2GS_KillValueRequest,{
}).

%% 
%% // 请求角色列表
-define(U2GS_LBS_BesideRole_Request,37964).
-record(pk_U2GS_LBS_BesideRole_Request,{
	%% Single 纬度 [-90.0, +90.0] 角度 负值是南纬，正值是北纬，-90.0不等价于+90.0，分属两极
	lat = 0.0,
	%% Single 经度 [-180.0, +180.0] 角度 负值是西经，正值是东经，-180.0等价于+180.0
	lng = 0.0,
	%% Single 距离 [100.0, 5000.0] 米 超过取值返回时返回空集
	dist = 0.0
}).

%% 
%% ////////////////////////////////////////////////////////////
%% // LBS系统 begin
%% // 更新自己的坐标信息
-define(U2GS_LBS_Request,37335).
-record(pk_U2GS_LBS_Request,{
	%% Single 纬度 [-90.0, +90.0] 角度 负值是南纬，正值是北纬，-90.0不等价于+90.0，分属两极
	lat = 0.0,
	%% Single 经度 [-180.0, +180.0] 角度 负值是西经，正值是东经，-180.0等价于+180.0
	lng = 0.0
}).

%% 
%% //离开副本
-define(U2GS_LeaveCopyMap,15694).
-record(pk_U2GS_LeaveCopyMap,{
	%% UInt16 1 主动点击退出按钮
	type = 0
}).

%% 
%% // 数据加载完成，玩家进入到地图，可以接收其它玩家消息
-define(U2GS_LoadedMap,57553).
-record(pk_U2GS_LoadedMap,{
}).

%% 
-define(U2GS_LotteryForTowerInfo,15649).
-record(pk_U2GS_LotteryForTowerInfo,{
}).

%% 
-define(U2GS_LotteryForTowerRandonAward,32778).
-record(pk_U2GS_LotteryForTowerRandonAward,{
	%% UInt32
	randomNumber = 0,
	%% Boolean是否显示道具奖励面板
	isShowPanel = false
}).

%% 
%% // 点金手
-define(U2GS_MoneyTree,10672).
-record(pk_U2GS_MoneyTree,{
}).

%% 
%% // 怪物图鉴_领奖（失败时返回ErrorCode）
-define(U2GS_MonsterBookReward_Request,3772).
-record(pk_U2GS_MonsterBookReward_Request,{
	%% UInt16 怪物ID
	id = 0
}).

%% 
%% // 怪物图鉴_拍照（失败时返回ErrorCode）
-define(U2GS_MonsterBookSnap_Request,58895).
-record(pk_U2GS_MonsterBookSnap_Request,{
	%% UInt16 怪物ID
	id = 0
}).

%% 
%% // 怪物图鉴_解锁（失败时返回ErrorCode）
-define(U2GS_MonsterBookUnlock_Request,22905).
-record(pk_U2GS_MonsterBookUnlock_Request,{
	%% UInt16 怪物ID
	id = 0
}).

%% 
%% // 实时语音 女主播 end
%% ////////////////////////////////////////////////////////////
%% ////////////////////////////////////////////////////////////
%% // 怪物图鉴 begin
%% // 请求怪物图鉴数据
-define(U2GS_MonsterBook_Request,4373).
-record(pk_U2GS_MonsterBook_Request,{
}).

%% 
%% //月卡 领取礼品事件
-define(U2GS_MonthCardGettingEvent,23872).
-record(pk_U2GS_MonthCardGettingEvent,{
	%% UInt323为月卡礼品领取
	type = 0
}).

%% 
-define(U2GS_MoveTo,1578).
-record(pk_U2GS_MoveTo,{
	%% UInt64移动的目标Code
	code = 0,
	%% Single移动的目标点X
	posX = 0.0,
	%% Single移动的目标点Y
	posY = 0.0,
	%% PosInfo包括起点和目标点在内所有路径点
	posInfos = []
}).

%% 
%% //请求公告列表，
-define(U2GS_NoticeRequest,45265).
-record(pk_U2GS_NoticeRequest,{
	%% Stringclient端已有公告id号升序后字符串md5。如md5("1,2,3")不要逗号
	md5 = ""
}).

%% 
%% //觉醒用道具
-define(U2GS_PlayerAwakenUseItem,64414).
-record(pk_U2GS_PlayerAwakenUseItem,{
	%% UInt16 本次请求使用个数
	num = 0
}).

%% 
%% // 玩家对游戏的反馈
-define(U2GS_PlayerCoupleBack,41830).
-record(pk_U2GS_PlayerCoupleBack,{
	%% UInt32 反馈类型
	cbType = 0,
	%% String 反馈内容
	cbContent = ""
}).

%% 
%% // 玩家剧情对话结束
-define(U2GS_PlotDialogueEnd,25596).
-record(pk_U2GS_PlotDialogueEnd,{
}).

%% 
%% // 查询对象
-define(U2GS_QueryTargetObject,34006).
-record(pk_U2GS_QueryTargetObject,{
	%% UInt64 目标code
	targetCode = 0
}).

%% 
%% // 骑宠竞速 报名
%% // 仅普通服执行，检查内容有点多……
%% // 由于之前的操作已经设定了报名所需全部参数
%% // 因此这里仅提供空结构用于报名
-define(U2GS_RaceApply,56623).
-record(pk_U2GS_RaceApply,{
}).

%% 
%% // 报名请求
%% // 客户端主动请求
%% // 对于双人坐骑主人已在马上报名，邀请乘客上马后，乘客自动发起请求
-define(U2GS_RaceApply_Request,1335).
-record(pk_U2GS_RaceApply_Request,{
}).

%% 
%% // 骑宠竞速 取消报名
%% // 取消报名后，乘客脱离
-define(U2GS_RaceCancel,11021).
-record(pk_U2GS_RaceCancel,{
}).

%% 
%% // 取消报名请求
-define(U2GS_RaceCancel_Request,6869).
-record(pk_U2GS_RaceCancel_Request,{
}).

%% 
%% // 骑宠竞速 查询可邀请人列表
%% // 仅普通服执行，限定可报名状态下
-define(U2GS_RaceInviteList,61838).
-record(pk_U2GS_RaceInviteList,{
}).

%% 
%% // 骑宠竞速 邀请乘客
%% // 仅普通服执行，限定可报名等状态下
%% // 反馈GS2U_RaceApplyState
-define(U2GS_RaceInvite_A2S,59743).
-record(pk_U2GS_RaceInvite_A2S,{
	%% UInt64 角色ID
	id = 0
}).

%% 
%% // 骑宠竞速 处理邀请信息
%% // 仅普通服执行，限定可报名等状态下
%% // 反馈GS2U_RaceApplyState
-define(U2GS_RaceInvite_B2S,27284).
-record(pk_U2GS_RaceInvite_B2S,{
	%% Boolean 是否同意邀请
	isAgree = false,
	%% UInt64 邀请人ID
	id = 0,
	%% UInt16 邀请人使用骑宠
	petID = 0
}).

%% 
%% // 活动地图内广播：使用道具请求
-define(U2GS_RaceMapItem_Request,29928).
-record(pk_U2GS_RaceMapItem_Request,{
	%% Byte 对应配置race_item.id
	itemID = 0
}).

%% 
%% // 骑宠竞速 选择骑宠
%% // 仅普通服执行，仅检查骑宠是否存在
%% // 用于指定参赛骑宠
%% // 执行成功后，如果是已报名状态且是主人，则自动执行一次报名
-define(U2GS_RaceSelectPet,32164).
-record(pk_U2GS_RaceSelectPet,{
	%% UInt16 骑宠ID
	petID = 0
}).

%% 
%% //保存客户端需要server保存的自定义事件
-define(U2GS_RecClientEvent,40949).
-record(pk_U2GS_RecClientEvent,{
	%% UInt32事件id(由server来分配维护)
	eventID = 0,
	%% UInt32事件发生时间
	eventTime = 0,
	%% String事件需要记录的扩展信息，建议k,v式的json
	eventArgs = ""
}).

%% 
-define(U2GS_ReceivePlayerLevelReward,12809).
-record(pk_U2GS_ReceivePlayerLevelReward,{
	%% Byte
	level = 0
}).

%% 
%% // 7日首充，累充 领取礼品事件
-define(U2GS_RechargeGettingEvent,57955).
-record(pk_U2GS_RechargeGettingEvent,{
	%% UInt321为7日累充，2为普通累充
	type = 0,
	%% UInt32要领取的档次
	grade = 0
}).

%% 
%% // 断线重连  申请进入目标gs
-define(U2GS_ReconnectLoginRequest,1827).
-record(pk_U2GS_ReconnectLoginRequest,{
	%% UInt64账号ID
	accountID = 0,
	%% UInt64角色ID
	roleID = 0,
	%% String随机Key
	key = "",
	%% Int32协议版本号
	protocolVer = 0
}).

%% 
%% // 重新转职
-define(U2GS_RenewChangeCarrer,55602).
-record(pk_U2GS_RenewChangeCarrer,{
	%% UInt32新职业
	newCareer = 0
}).

%% 
%% // 请求语音数据
-define(U2GS_ReqChatVoice,41242).
-record(pk_U2GS_ReqChatVoice,{
	%% UInt64 playercode + timesec
	playerID = 0,
	%% UInt32
	key = 0
}).

%% 
-define(U2GS_RequestCreatePlayer,4022).
-record(pk_U2GS_RequestCreatePlayer,{
	%% String 名字
	name = "",
	%% SByte 阵营
	camp = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32 头
	head = 0
}).

%% 
-define(U2GS_RequestDeletePlayer,23657).
-record(pk_U2GS_RequestDeletePlayer,{
	%% UInt64
	roleID = 0
}).

%% 
%% // 请求进入指定的地图线路
-define(U2GS_RequestEnterMapLine,60477).
-record(pk_U2GS_RequestEnterMapLine,{
	%% UInt16
	mapID = 0,
	%% UInt32 线路ID
	lineID = 0
}).

%% 
%% //请求查询女神的code
-define(U2GS_RequestGoddessCode,65485).
-record(pk_U2GS_RequestGoddessCode,{
}).

%% 
-define(U2GS_RequestLogin,56084).
-record(pk_U2GS_RequestLogin,{
	%% UInt64账号ID
	accountID = 0,
	%% String随机Key
	key = "",
	%% Int32协议版本号
	protocolVer = 0
}).

%% 
%% // 请求地图线路列表
-define(U2GS_RequestMapLineList,37085).
-record(pk_U2GS_RequestMapLineList,{
	%% UInt16
	mapID = 0
}).

%% 
%% // 获取对象的详细信息，返回按其它常规协议
-define(U2GS_RequestObjInfo,53644).
-record(pk_U2GS_RequestObjInfo,{
	%% SByte 对象类型
	obj_type = 0,
	%% UInt64 对象列表
	codes = []
}).

%% 
%% //玩家充值请求
-define(U2GS_RequestRecharge,20100).
-record(pk_U2GS_RequestRecharge,{
	%% String账号accessToken很长一串
	funcellAccessToken = "",
	%% String如173:18072:1.1.2:xiaomi
	funcellCilentID = "",
	%% Stringfuncell的订单号，服务器以些为准，会去重
	funcellOrderID = "",
	%% String扩展参数，如果有，就组装成json
	extArgs = ""
}).

%% 
%% //打开充值面板时，取出玩家已经参加了的充值项id
-define(U2GS_RequestRechargeHasGiftIDList,40355).
-record(pk_U2GS_RequestRechargeHasGiftIDList,{
}).

%% 
%% // 客户端请求复活
-define(U2GS_RequestRevive,60126).
-record(pk_U2GS_RequestRevive,{
	%% UInt32 1：普通复活；2：收费复活；3：自动复活
	reviveType = 0
}).

%% 
%% // 请求目标副本的最高分数
-define(U2GS_RequestTargetCopyMapScore,43649).
-record(pk_U2GS_RequestTargetCopyMapScore,{
	%% UInt32 目标副本ID
	targetCopyMapID = 0
}).

%% 
%% //重置副本进度
-define(U2GS_ResetCopyMap,31194).
-record(pk_U2GS_ResetCopyMap,{
	%% UInt16副本地图ID
	copyMapID = 0
}).

%% 
%% // 重置玩家坐标到本地图的复活点
-define(U2GS_ResetPosToRevivePt,8871).
-record(pk_U2GS_ResetPosToRevivePt,{
}).

%% 
%% // 重置觉醒
-define(U2GS_ResetRoleAwake,53918).
-record(pk_U2GS_ResetRoleAwake,{
}).

%% 
%% // 激活某个漂浮之石
-define(U2GS_RoleAwakeing,8581).
-record(pk_U2GS_RoleAwakeing,{
	%% Byte
	stage = 0,
	%% Byte
	stone = 0,
	%% UInt32激活的属性ID
	awakeParam = 0
}).

%% 
-define(U2GS_SelPlayerEnterGame,56497).
-record(pk_U2GS_SelPlayerEnterGame,{
	%% UInt64
	roleID = 0
}).

%% 
%% // 选中目标
-define(U2GS_SelectTarget,65351).
-record(pk_U2GS_SelectTarget,{
	%% UInt64
	code = 0
}).

%% 
-define(U2GS_SessionKeyAck,6238).
-record(pk_U2GS_SessionKeyAck,{
	%% String
	oldKey = "",
	%% String
	newKey = ""
}).

%% 
%% // 领取奖励
-define(U2GS_SevenDayAimReward_Request,18435).
-record(pk_U2GS_SevenDayAimReward_Request,{
	%% UInt16 如同配置表seven_day_aim.id
	id = 0
}).

%% 
%% // 显示动作
-define(U2GS_ShowAction,50705).
-record(pk_U2GS_ShowAction,{
	%% UInt32 符号索引
	actionIndex = 0
}).

%% 
%% // 显示头顶表情符号
-define(U2GS_ShowHeadEmoticonIcon,42898).
-record(pk_U2GS_ShowHeadEmoticonIcon,{
	%% UInt32 符号索引
	iconIndex = 0
}).

%% 
%% // 开始灵力冥想
-define(U2GS_StartMeditation,55614).
-record(pk_U2GS_StartMeditation,{
	%% Boolean true start and false end
	istart = false
}).

%% 
-define(U2GS_StopMove,41869).
-record(pk_U2GS_StopMove,{
	%% UInt64移动的目标Code
	code = 0,
	%% Single停止时的坐标点X
	posX = 0.0,
	%% Single停止时的坐标点Y
	posY = 0.0
}).

%% 
%% // 停止觉醒buff
-define(U2GS_StopTheAwakeBuff,43011).
-record(pk_U2GS_StopTheAwakeBuff,{
}).

%% 
%% //瞬间移动，成功返回pk_GS2U_TransferNewPos
-define(U2GS_Telesport,19472).
-record(pk_U2GS_Telesport,{
	%% Single新的坐标
	x = 0.0,
	%% Single新的坐标
	y = 0.0
}).

%% 
%% // 领取奖励
-define(U2GS_ThirtyDayLoginGift_Request,16721).
-record(pk_U2GS_ThirtyDayLoginGift_Request,{
	%% UInt16 如同配置表thirty_day_login_gift.id
	id = 0
}).

%% 
-define(U2GS_Transfer2NewPos,15277).
-record(pk_U2GS_Transfer2NewPos,{
	%% UInt32地图ID
	mapID = 0,
	%% Single新的坐标
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
-define(U2GS_TransferMap,13167).
-record(pk_U2GS_TransferMap,{
	%% UInt32
	mapId = 0,
	%% String
	waypointName = ""
}).

%% 
%% // 使用觉醒buff
-define(U2GS_UseTheAwakeBuff,28828).
-record(pk_U2GS_UseTheAwakeBuff,{
}).

%% 
%% //翅膀升级消息
-define(U2GS_WingRise,2862).
-record(pk_U2GS_WingRise,{
	%% UInt32
	itemID = 0,
	%% UInt32物品个数，0为所有
	itemNum = 0,
	%% Byte0: 绑定和非绑并用； 1：只使用绑定
	firstBind = 0
}).

%% 
%% //翅膀一键升级
-define(U2GS_WingRiseOneTouch,55027).
-record(pk_U2GS_WingRiseOneTouch,{
}).

%% 
%% // xml公告请求
-define(U2GS_XmlNoticeRequest,36570).
-record(pk_U2GS_XmlNoticeRequest,{
	%% Byte1更新公告;2活动公告
	type = 0,
	%% String小写md5(已有content/否则空串)
	sign = ""
}).

%% 
%% //客户端请购买进入副本次数
-define(U2GS_buy_action_count,45177).
-record(pk_U2GS_buy_action_count,{
	%% UInt16副本地图ID
	copyMapID = 0
}).

%% 
%% //客户端请购买力值
-define(U2GS_buy_action_point,7254).
-record(pk_U2GS_buy_action_point,{
}).

%% 
%% //获取好友坐标
-define(U2GS_getFriendPos,34086).
-record(pk_U2GS_getFriendPos,{
	%% UInt64好友ID
	friendID = 0
}).

%% 
%% //客户端请求获取体力值
-define(U2GS_get_action_point_info,20727).
-record(pk_U2GS_get_action_point_info,{
}).

%% 
%% //客户端请求获取副本销毁时间
-define(U2GS_get_copy_map_destory_time,53798).
-record(pk_U2GS_get_copy_map_destory_time,{
}).

%% 
%% //向服务器请求宝藏系统信息
-define(U2GS_get_lottery_sys_info,37517).
-record(pk_U2GS_get_lottery_sys_info,{
}).

%% 
%% //客户端请求抽奖操作
-define(U2GS_lottery_start,26618).
-record(pk_U2GS_lottery_start,{
	%% UInt32
	type = 0
}).

%% 
%% // 跨服骑宠竞速 end
%% //////////////////////////////////////////////////////////////
%% // 保存新手引导进度
-define(U2GS_save_current_guide_id,39509).
-record(pk_U2GS_save_current_guide_id,{
	%% UInt16当前的引导ID
	guideID = 0
}).

-record(pk_UpdateReward,{
	%% UInt16道具ID
	itemid = 0,
	%% UInt16奖励个数
	number = 0
}).

-record(pk_UserPlayerData,{
	%% UInt64 角色ID
	roleID = 0,
	%% String 角色名
	name = "",
	%% Int32 等级
	level = 0,
	%% Int32 翅膀等级
	wingLevel = 0,
	%% SByte 阵营
	camp = 0,
	%% SByte 种族
	race = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 角色所在当前地图ID
	mapID = 0,
	%% UInt16 角色之前所在地图ID
	oldMapID = 0,
	%% Boolean 是否可以修改名字
	canRename = false,
	%% visibleEquip可见的装备
	visible_equips = [],
	%% UInt16身上时装列表
	fashionList = [],
	%% refineLevel装备精炼等级
	refine_levels = []
}).

-record(pk_lotteryForToweItem,{
	%% UInt32
	pool_id = 0,
	%% UInt32
	cfg_id = 0,
	%% UInt32
	itemID = 0,
	%% UInt32
	itemNumber = 0,
	%% UInt32
	isBind = 0,
	%% Int16
	isWin = 0
}).

-record(pk_lotteryForTowerNotice,{
	%% String
	roleName = "",
	%% UInt32
	itemID = 0,
	%% UInt32
	itemNumber = 0
}).

-record(pk_lottery_award_item_info,{
	%% UInt32
	itemID = 0,
	%% UInt32
	itemNumber = 0
}).

-record(pk_lsbattlefield_award,{
	%% UInt16道具ID
	itemid = 0,
	%% UInt16奖励个数
	number = 0,
	%% UInt32是否绑定
	isBind = 0
}).

-record(pk_lsbattlefield_rank,{
	%% UInt16名次
	index = 0,
	%% UInt16
	score = 0,
	%% String
	roleName = ""
}).

-record(pk_pushItem,{
	%% UInt32
	sku = 0,
	%% UInt32
	itemID = 0,
	%% UInt16
	num = 0,
	%% Byte0 非绑，1 绑定				
	isBinded = 0,
	%% UInt32
	price = 0,
	%% Byte
	rebate = 0,
	%% Byte1 砖石，2 非绑砖石
	coinType = 0,
	%% Byte购买限制次数
	limited = 0
}).

-record(pk_refineLevel,{
	%% Byte
	type = 0,
	%% Byte
	level = 0
}).

-record(pk_visibleEquip,{
	%% UInt32装备ID
	equipID = 0,
	%% Byte当前品质值
	quality = 0
}).

%% 
%% // 初始化数据发送完毕
-define(GS2U_GetPlayerInitDataEnd,11674).
-record(pk_GS2U_GetPlayerInitDataEnd,{
}).

%% 
%% // 进入地图信息
-define(GS2U_GotoNewMap,47351).
-record(pk_GS2U_GotoNewMap,{
	%% UInt16 角色所在当前地图ID
	map_id = 0,
	%% Single坐标X
	x = 0.0,
	%% Single坐标Y
	y = 0.0
}).

%% 
-define(GS2U_HearBeat,444).
-record(pk_GS2U_HearBeat,{
	%% UInt32
	now = 0
}).

%% 
-define(GS2U_KickByServer,17208).
-record(pk_GS2U_KickByServer,{
	%% String 1 心跳超时 (后面换成ErrorCode)
	reason = ""
}).

%% 
%% // 测试用
-define(GS2U_PlayerInitBase,32262).
-record(pk_GS2U_PlayerInitBase,{
	%% UInt64 角色ID
	uid = 0,
	%% String 角色名
	name = "",
	%% Int32 等级
	level = 0,
	%% Int32 阵营
	camp = 0,
	%% Int32 种族
	race = 0,
	%% UInt32 职业
	career = 0,
	%% Int32 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt32 角色所在当前地图ID
	mapID = 0,
	%% Int32
	combat_props = [],
	%% SkillInfo
	skill_list = []
}).

%% 
-define(GS2U_RemoteMonster,57060).
-record(pk_GS2U_RemoteMonster,{
	%% UInt64唯一ID
	uid = 0,
	%% UInt32配置表ID
	did = 0,
	%% Int32等级	
	level = 0,
	%% Int32当前百分比
	hp_percent = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
-define(GS2U_RemoteNpc,43395).
-record(pk_GS2U_RemoteNpc,{
	%% UInt64唯一ID
	uid = 0,
	%% UInt32配置表ID
	did = 0,
	%% Int32等级
	level = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
-define(GS2U_RemotePet,31694).
-record(pk_GS2U_RemotePet,{
	%% UInt64唯一ID
	uid = 0,
	%% UInt64主人
	owner = 0,
	%% UInt32配置表ID
	did = 0,
	%% Int32等级
	level = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
-define(GS2U_RemotePlayer,15687).
-record(pk_GS2U_RemotePlayer,{
	%% UInt64唯一ID
	uid = 0,
	%% Int32等级
	level = 0,
	%% String名字
	name = "",
	%% Int32职业
	career = 0,
	%% Int32种族
	race = 0,
	%% Int32当前百分比
	hp_percent = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
%% //
-define(GS2U_RemoveRemote,31994).
-record(pk_GS2U_RemoveRemote,{
	%% UInt64
	uid_list = []
}).

%% 
%% // 标准
-define(GS2U_SyncStand,30047).
-record(pk_GS2U_SyncStand,{
	%% UInt64唯一ID
	uid = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
%% // 移动
-define(GS2U_SyncWalk,3436).
-record(pk_GS2U_SyncWalk,{
	%% UInt64 唯一ID
	uid = 0,
	%% Single坐标X
	src_x = 0.0,
	%% Single坐标Y
	src_y = 0.0,
	%% Single坐标X
	dst_x = 0.0,
	%% Single坐标Y
	dst_y = 0.0,
	%% Int32移动时间（毫秒）  
	move_time = 0,
	%% Single移动速度
	speed = 0.0
}).

%% 
%% // 切地图
-define(U2GS_ChangeMap,4914).
-record(pk_U2GS_ChangeMap,{
	%% UInt32
	map_id = 0,
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
-define(U2GS_ExitGame,62411).
-record(pk_U2GS_ExitGame,{
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% //<-发出去     ;      ->收消息
%% //不用使用int uint long 
%% // 支持使用 string float int32 uint32 int64 uint64
%% /////////////////////////////////////////////////////////////////////////
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long
%% // 请求发送初始化数据
-define(U2GS_GetPlayerInitData,5543).
-record(pk_U2GS_GetPlayerInitData,{
}).

%% 
%% // 获取远程对象
-define(U2GS_GetRemoteObjInfo,16443).
-record(pk_U2GS_GetRemoteObjInfo,{
	%% UInt64 唯一ID列表
	uids = []
}).

%% 
-define(U2GS_HearBeat,7246).
-record(pk_U2GS_HearBeat,{
}).

%% 
-define(U2GS_PlayerStopWalk,29978).
-record(pk_U2GS_PlayerStopWalk,{
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
%% // 移动到目标点，包含请求的移动速度
-define(U2GS_PlayerWalk,56544).
-record(pk_U2GS_PlayerWalk,{
	%% Single坐标X
	dst_x = 0.0,
	%% Single坐标Y
	dst_y = 0.0,
	%% Single移动速度
	speed = 0.0
}).

-record(pk_ActivityMapRankData,{
	%% String 角色名
	name = "",
	%% UInt64值
	value = 0
}).

%% 
%% // 到点刷新，通知所有在线玩家
-define(GS2U_ActivityMapRankData,40315).
-record(pk_GS2U_ActivityMapRankData,{
	%% Byte 排行榜类型
	type = 0,
	%% ActivityMapRankData数据列表
	data = []
}).

%% 
-define(GS2U_MyKillNumber,62615).
-record(pk_GS2U_MyKillNumber,{
	%% Byte 排行榜类型
	type = 0,
	%% UInt16我杀的人数（防守方）
	killNumber = 0
}).

%% 
%% //扩展数据
-define(GS2U_MyRankingAndDamage,36976).
-record(pk_GS2U_MyRankingAndDamage,{
	%% Byte 排行榜类型
	type = 0,
	%% UInt16我的名次（进攻方）
	ranking = 0,
	%% UInt64伤害值
	damage = 0
}).

%% 
%% // 到点刷新，通知所有在线玩家
-define(GS2U_RefreshRank,31147).
-record(pk_GS2U_RefreshRank,{
	%% Byte 排行榜类型
	type = 0
}).

%% 
-define(GS2U_SendCharmRankFirstData,64931).
-record(pk_GS2U_SendCharmRankFirstData,{
	%% UInt64 角色ID
	roleID = 0,
	%% SByte 排名展示的类型
	sb_type = 0,
	%% String 角色名
	name = "",
	%% UInt64战力
	playerForce = 0,
	%% Int32等级
	level = 0,
	%% UInt32魅力
	charm = 0,
	%% String签名
	sign = "",
	%% String家族名字
	guildName = ""
}).

%% 
%% // 返回该类型排行榜上这个玩家的roleinfo
-define(GS2U_SendPropList,63201).
-record(pk_GS2U_SendPropList,{
	%% UInt64 角色ID
	roleID = 0,
	%% UInt64 玩家流水号
	playerCode = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32
	head = 0,
	%% Int32 翅膀等级
	wingLevel = 0,
	%% Int32 时装ID列表
	fashionIDs = [],
	%% PlayerEquip 装备ID列表
	equipIDList = [],
	%% PlayerEquipLevel装备等级列表
	equipLevelList = []
}).

%% 
%% // 返回该类型的排行榜数据
-define(GS2U_SendRank,44328).
-record(pk_GS2U_SendRank,{
	%% Byte 排行榜类型
	type = 0,
	%% RankInfo
	datas = []
}).

%% 
%% //排名靠前的一些玩家 需要展示 雕像
-define(GS2U_SendRankModelData,50703).
-record(pk_GS2U_SendRankModelData,{
	%% RankModelData 策划指定的一些特定排名展示模型列表
	playerRankMoldelList = []
}).

-record(pk_PlayerEquip,{
	%% UInt32 装备ID
	equipID = 0,
	%% Byte 品质
	quality = 0
}).

-record(pk_PlayerEquipLevel,{
	%% Byte
	type = 0,
	%% Byte
	level = 0
}).

-record(pk_RankInfo,{
	%% Byte 排行榜名次
	rankSort = 0,
	%% SByte 排行榜名次变化，正数为上升，负数为下降
	rankSortC = 0,
	%% UInt64 角色ID
	roleID = 0,
	%% String 角色名
	name = "",
	%% Int32 翅膀等级
	wingLevel = 0,
	%% Int64 排行榜数值1
	rankValue1 = 0,
	%% Int64 排行榜数值2(如果排行榜类型为5(宠物榜)，则此项保存的是上榜的宠物ID，右侧显示对应的宠物)
	rankValue2 = 0,
	%% Int64 排行榜数值3
	rankValue3 = 0,
	%% TitleData 排行榜中玩家的称号
	title,
	%% UInt16 排行榜中玩家头像框
	frameID = 0,
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32 系统头像（自定义头像使用其它接口获取）
	head = 0,
	%% Int32 角色等级
	level = 0
}).

-record(pk_RankModelData,{
	%% UInt64 角色ID
	roleID = 0,
	%% SByte 排名展示的类型
	sb_type = 0,
	%% String 角色名
	name = "",
	%% UInt32 职业
	career = 0,
	%% SByte 种族
	race = 0,
	%% SByte 性别
	sex = 0,
	%% Int32
	head = 0,
	%% Int32 翅膀等级
	wingLevel = 0,
	%% Int32 时装ID列表
	fashionIDs = [],
	%% PlayerEquip 装备ID列表
	equipIDList = []
}).

-record(pk_TitleData,{
	%% UInt32
	title1 = 0,
	%% UInt32
	title2 = 0,
	%% UInt32
	title3 = 0,
	%% UInt32
	color = 0,
	%% UInt32
	background = 0,
	%% String自定义title的内容
	customTitle = ""
}).

%% 
%% //请求活动地图中的榜单
-define(U2GS_RequestActivityMapRank,59920).
-record(pk_U2GS_RequestActivityMapRank,{
	%% Byte 排行榜类型
	type = 0
}).

%% 
%% // 请求该类型排行榜上这个玩家的roleinfo
-define(U2GS_RequestPropList,51618).
-record(pk_U2GS_RequestPropList,{
	%% Byte 排行榜类型
	type = 0,
	%% UInt64 角色ID
	roleID = 0
}).

%% 
%% // 请求该类型的排行榜数据
-define(U2GS_RequestRank,28761).
-record(pk_U2GS_RequestRank,{
	%% Byte 排行榜类型
	type = 0
}).

%% 
%% // 按排行榜名次领奖(每次重新发榜均可再次领奖)
-define(U2GS_RequestRankAward,1992).
-record(pk_U2GS_RequestRankAward,{
	%% Byte 排行榜类型
	type = 0
}).

%% 
%% //红包日志数据
-define(GS2U_RedEnvelopeHistoryAck,43886).
-record(pk_GS2U_RedEnvelopeHistoryAck,{
	%% redEnvelopeHistory
	historyList = []
}).

%% 
%% //根据红包id取红包信息Ack  查看详情
-define(GS2U_RedEnvelopeInfoAck,3550).
-record(pk_GS2U_RedEnvelopeInfoAck,{
	%% redEnvelopeInfo红包信息
	red
}).

%% 
%% //请求可抢红包
-define(GS2U_RedEnvelopeQuery,61011).
-record(pk_GS2U_RedEnvelopeQuery,{
	%% redEnvelopeBaseInfo
	redEnvelopeList = []
}).

%% 
%% //抢红包Ack
-define(GS2U_RobRedEnvelopeAck,33445).
-record(pk_GS2U_RobRedEnvelopeAck,{
	%% UInt32抢到的数额
	robAmount = 0,
	%% redEnvelopeInfo
	red
}).

%% 
%% //玩家放弃抢本轮红包
-define(U2GS_GiveUpRedEnvelope,5631).
-record(pk_U2GS_GiveUpRedEnvelope,{
}).

%% 
%% //红包日志
-define(U2GS_RedEnvelopeHistory,22545).
-record(pk_U2GS_RedEnvelopeHistory,{
}).

%% 
%% //根据红包id取红包信息
-define(U2GS_RedEnvelopeInfo,45733).
-record(pk_U2GS_RedEnvelopeInfo,{
	%% UInt64红包id
	redUID = 0
}).

%% 
%% //请求可抢红包
-define(U2GS_RedEnvelopeQuery,44837).
-record(pk_U2GS_RedEnvelopeQuery,{
	%% Byte1世界，2军团，3结婚，4地图,5为指定玩家红包
	targetType = 0
}).

%% 
%% //抢红包
-define(U2GS_RobRedEnvelope,62102).
-record(pk_U2GS_RobRedEnvelope,{
	%% UInt64红包id,
	redUID = 0
}).

%% 
%% //发红包
-define(U2GS_SendRedEnvelope,8879).
-record(pk_U2GS_SendRedEnvelope,{
	%% Byte	红包类型:1定额，2随机
	type = 0,
	%% Byte1世界，2军团，3结婚，4地图,5为指定玩家红包
	targetType = 0,
	%% UInt64指定对象UID，玩家ID/0表示不指定玩家，军团ID，地图ID
	targetUID = 0,
	%% UInt32目标人数：0不限制
	allNumber = 0,
	%% UInt32
	allMoney = 0,
	%% String祝福语
	luckContent = ""
}).

-record(pk_redEnvelopeBaseInfo,{
	%% UInt64红包id,
	redUID = 0,
	%% UInt64
	creatorRoleID = 0,
	%% UInt64指定对象UID，玩家ID/0表示不指定玩家，军团ID，地图ID
	targetUID = 0,
	%% String祝福语
	luckContent = "",
	%% String发红包的玩家名
	creatorName = "",
	%% UInt32
	creatorLevel = 0,
	%% Byte	红包类型:1定额，2随机
	type = 0,
	%% Byte	红包类型:1世界，2军团，3结婚，4地图
	targetType = 0,
	%% UInt32发红包玩家的职业id
	creatorCareer = 0,
	%% Byte发红包玩家的种族
	creatorRace = 0,
	%% Byte发红包玩家的性别
	creatorSex = 0,
	%% Int32发红包玩家的头
	creatorHead = 0,
	%% UInt32
	allMoney = 0,
	%% UInt32红包发的总个数
	allNumber = 0,
	%% UInt32红包已经领取钱
	takenMoney = 0,
	%% UInt32红包已经领取个数
	takenNumber = 0
}).

-record(pk_redEnvelopeHistory,{
	%% UInt64红包id,
	redUID = 0,
	%% UInt64
	creatorRoleID = 0,
	%% String发红包的玩家名
	creatorName = "",
	%% UInt32发红包的时间
	createTime = 0,
	%% Byte1世界，2军团，3结婚，4地图
	targetType = 0,
	%% Int32抢到的钱或发的红包总额
	moneyNumber = 0
}).

-record(pk_redEnvelopeInfo,{
	%% redEnvelopeBaseInfo
	baseInfo,
	%% takeHistory已经领取的记录
	takenList = []
}).

-record(pk_takeHistory,{
	%% UInt64
	takeRoleID = 0,
	%% String
	takeName = "",
	%% UInt32
	takeTime = 0,
	%% UInt32
	takeMoney = 0
}).

%% 
%% // 回收游乐设施
-define(DeleteRide,48463).
-record(pk_DeleteRide,{
	%% UInt64
	npcCode = 0
}).

%% 
%% // 请求离开游乐设施
-define(RequestDownRide,14381).
-record(pk_RequestDownRide,{
}).

%% 
%% // 回收游乐设施
-define(RequestRecycle,11548).
-record(pk_RequestRecycle,{
	%% UInt64
	itemUID = 0
}).

%% 
%% // 请求使用游乐设施
-define(RequestUpRide,13114).
-record(pk_RequestUpRide,{
	%% UInt64 npcCode
	npcCode = 0
}).

%% 
%% // 使用游乐设施
-define(RequestUse,13948).
-record(pk_RequestUse,{
	%% UInt64
	itemUID = 0,
	%% Byte 1所有人，2好友和家族成员，3仅自己
	useLimit = 0
}).

-record(pk_RideInfo,{
	%% UInt64
	npcCode = 0,
	%% UInt32
	itemID = 0,
	%% UInt64
	ownerID = 0,
	%% String
	ownerName = "",
	%% RidePlayerInfo
	players = [],
	%% UInt32 剩余可用次数
	number = 0
}).

-record(pk_RideItem,{
	%% UInt64
	itemUID = 0,
	%% UInt32 剩余可用次数
	number = 0,
	%% Byte 当前状态，1空闲，2使用中
	state = 0
}).

-record(pk_RidePlayerInfo,{
	%% UInt64
	roleID = 0,
	%% UInt32 座位ID
	seatID = 0
}).

%% 
%% // 玩家改变时的状态广播
-define(SyncPlayerInfo,58427).
-record(pk_SyncPlayerInfo,{
	%% UInt64
	npcCode = 0,
	%% RidePlayerInfo
	info,
	%% Byte 当前状态，1空闲，2使用中
	state = 0
}).

%% 
%% // 当前地图的游乐设施状态
-define(SyncRideInfo,47893).
-record(pk_SyncRideInfo,{
	%% RideInfo
	infos = []
}).

%% 
%% // 玩家拥有的游乐道具同步信息
-define(SyncRideItem,42114).
-record(pk_SyncRideItem,{
	%% RideItem
	items = []
}).

%% 
%% //删除符文
-define(DeleteRunes,314).
-record(pk_DeleteRunes,{
	%% UInt64
	runeUIDS = []
}).

%% 
-define(GS2U_QueryRuneTipsAck,32828).
-record(pk_GS2U_QueryRuneTipsAck,{
	%% RuneInfo
	info
}).

%% 
%% //远程玩家的符文列表，供查看远程玩家使用
-define(GS2U_RPRuneInfoList,39668).
-record(pk_GS2U_RPRuneInfoList,{
	%% UInt64
	targetRoleID = 0,
	%% RuneInfo
	runeList = []
}).

%% 
%% //符文成功洗练结果，失败提示errorcode
-define(GS2U_RuneCastAck,6856).
-record(pk_GS2U_RuneCastAck,{
	%% RuneInfo
	runeInfo,
	%% UInt64删除的符文UID列表
	runeUIDS = []
}).

%% 
%% //符文洗练出的属性
-define(GS2U_RuneCastProp,15200).
-record(pk_GS2U_RuneCastProp,{
	%% UInt64 标识
	flagID = 0,
	%% RuneBaseProp 老的属性
	oldprop,
	%% RuneBaseProp 洗练出的属性
	newprop
}).

%% 
%% //圣物合成结果
-define(GS2U_RuneCompoundAck,2048).
-record(pk_GS2U_RuneCompoundAck,{
	%% RuneInfo
	runeList = [],
	%% Boolean是否一键合成
	isOneKeyCompound = false
}).

%% 
-define(GS2U_RuneEmbedOffAck,33645).
-record(pk_GS2U_RuneEmbedOffAck,{
	%% RuneInfo
	runeList = []
}).

%% 
-define(GS2U_RuneEmbedOnAck,12783).
-record(pk_GS2U_RuneEmbedOnAck,{
	%% UInt32镶嵌到玩家身上为1，镶嵌到宠物身上为宠物ID
	targetID = 0,
	%% RuneInfo
	runeList = []
}).

%% 
%% //圣物融合结果
-define(GS2U_RuneFuseAck,28162).
-record(pk_GS2U_RuneFuseAck,{
	%% RuneInfo
	runeInfo,
	%% UInt64删除的符文UID列表
	runeUIDS = []
}).

%% 
%% //符文格子数量
-define(GS2U_RuneGrid,64968).
-record(pk_GS2U_RuneGrid,{
	%% Byte 1表示玩家，2表示宠物的符文
	ownerID = 0,
	%% UInt16
	cur = 0,
	%% UInt16
	max = 0
}).

%% 
%% //符文列表
-define(GS2U_RuneInfoList,49510).
-record(pk_GS2U_RuneInfoList,{
	%% RuneInfo
	runeList = []
}).

%% 
%% //熔炼成功结果，失败不返回结果，只提示
-define(GS2U_RuneMeltAck,54059).
-record(pk_GS2U_RuneMeltAck,{
	%% RuneInfo
	runeInfo
}).

%% 
%% // 通过GM指令打开符文面板
-define(GS2U_RuneOpenBorad,30388).
-record(pk_GS2U_RuneOpenBorad,{
	%% Int32
	code = 0
}).

%% 
%% //符文卸载和镶嵌的时候，下发操作的单个套装属性
-define(GS2U_RuneSuitPropList,920).
-record(pk_GS2U_RuneSuitPropList,{
	%% RuneSuitProp
	suitProps = []
}).

%% 
%% //圣物套装部位改变结果
-define(GS2U_RuneTurnPosAck,25452).
-record(pk_GS2U_RuneTurnPosAck,{
	%% RuneInfo
	runeInfo
}).

-record(pk_RuneBaseProp,{
	%% Int32这个是 相对应的属性ID，或者技能ID
	prop = 0,
	%% Byte 属性计算方式：0加法，1乘法
	calcType = 0,
	%% Single
	value = 0.0
}).

%% 
%% //符文镶嵌
-define(RuneEmbedOn,50666).
-record(pk_RuneEmbedOn,{
	%% UInt64符文UID
	runeUIDs = [],
	%% UInt32镶嵌到玩家身上为1，镶嵌到宠物身上为宠物ID
	targetID = 0
}).

-record(pk_RuneInfo,{
	%% UInt64
	runeUID = 0,
	%% UInt32 0为背包，1为玩家穿戴中，其它为某个宠物ID穿戴中
	pos = 0,
	%% UInt32
	runeID = 0,
	%% Byte 品阶
	level = 0,
	%% UInt32
	exp = 0,
	%% Boolean
	isBind = false,
	%% UInt32 剩余有效时间，单位秒，为0表示永久有效
	validSecond = 0,
	%% Byte 部位
	subType = 0,
	%% Byte 转换部位次数
	turnPosNum = 0,
	%% RuneBaseProp基础属性
	baseProps = [],
	%% RuneRandProp随机属性
	randProps = [],
	%% RuneRandProp技能附加属性
	skillProps = []
}).

-record(pk_RuneRandProp,{
	%% RuneBaseProp
	prop,
	%% UInt32 序号
	indexNumber = 0
}).

-record(pk_RuneSuitProp,{
	%% RuneBaseProp
	props = [],
	%% UInt32 套装ID
	suitID = 0,
	%% Byte 套装件数
	suitNum = 0,
	%% UInt32 1表示玩家自身，其它ID表示对应宠物
	ownerID = 0
}).

%% 
%% //开启格子
-define(U2GS_OpenRuneGrid,63316).
-record(pk_U2GS_OpenRuneGrid,{
	%% Byte 1表示玩家，2表示宠物的符文
	ownerID = 0,
	%% UInt16
	openNumber = 0
}).

%% 
%% // 设置相关协议
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% //查看符文tips
-define(U2GS_QueryRuneTips,36684).
-record(pk_U2GS_QueryRuneTips,{
	%% UInt64
	runeUID = 0
}).

%% 
%% //请求符文的套装属性
-define(U2GS_RequestSuitProp,31041).
-record(pk_U2GS_RequestSuitProp,{
	%% UInt32 1表示玩家自身，其它ID表示对应宠物
	ownerID = 0
}).

%% 
%% //符文洗练
-define(U2GS_RuneCast,9487).
-record(pk_U2GS_RuneCast,{
	%% UInt64目标
	targetUID = 0,
	%% UInt32目标随机属性序号
	indexNumber = 0,
	%% UInt64材料
	materialUID = 0
}).

%% 
%% //确认或者放弃
-define(U2GS_RuneCastAffirm,18474).
-record(pk_U2GS_RuneCastAffirm,{
	%% UInt64 标识
	flagID = 0,
	%% Boolean true确认，false放弃
	isAffirm = false
}).

%% 
%% //圣物合成
-define(U2GS_RuneCompound,22231).
-record(pk_U2GS_RuneCompound,{
	%% Byte一件合成品质，>0代表就是一键合成else 用下面单个合成
	quality = 0,
	%% Byte一件合成等级，其他合成0
	level = 0,
	%% UInt64合成材料，必须是同等级，同品质圣物
	materialUIDS = []
}).

%% 
%% //符文拆卸
-define(U2GS_RuneEmbedOff,27422).
-record(pk_U2GS_RuneEmbedOff,{
	%% UInt64符文UID
	runeUIDs = []
}).

%% 
%% //圣物融合
-define(U2GS_RuneFuse,8893).
-record(pk_U2GS_RuneFuse,{
	%% UInt64 目标圣物UID
	targetRuneUID = 0,
	%% UInt64副圣物材料
	materialUID = 0,
	%% Byte融合类型1普通，2铸造融合
	fuseType = 0,
	%% UInt64替换主圣物指定的技能ID
	targetPropKey = 0,
	%% UInt64指定一个副圣物技能 替换主圣物技能，只有铸造融合才行,普通融合 这个发0过来
	materialPropKey = 0,
	%% Boolean是否使用 融合石，增加成功率
	isUseFuseStone = false
}).

%% 
%% //符文熔炼
-define(U2GS_RuneMelt,52280).
-record(pk_U2GS_RuneMelt,{
	%% UInt64 目标符文UID
	targetRuneUID = 0
}).

%% 
%% //是否保留熔炼结果
-define(U2GS_RuneReserve,16704).
-record(pk_U2GS_RuneReserve,{
	%% Booleantrue 保留，false放弃
	isReserve = false
}).

%% 
%% //圣物套装部位改变
-define(U2GS_RuneTurnPos,44015).
-record(pk_U2GS_RuneTurnPos,{
	%% UInt64 目标符文UID
	targetRuneUID = 0
}).

%% 
%% //出售圣物   
-define(U2GS_SellRune,39914).
-record(pk_U2GS_SellRune,{
	%% UInt64 目标UID
	targetRuneUID = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 测试相关的协议
%% // 
-define(GS2U_GridPlayerRotw,323).
-record(pk_GS2U_GridPlayerRotw,{
	%% Int32 角度
	rotw = 0,
	%% UInt64 目标玩家列表
	codes = []
}).

%% 
-define(Any_UpdateBitVariant,61248).
-record(pk_Any_UpdateBitVariant,{
	%% SwitchVariantInfo 更新开关变量
	updateVariantList = []
}).

%% 
-define(Any_UpdateVariant,58193).
-record(pk_Any_UpdateVariant,{
	%% VariantInfo
	updateVariantList = []
}).

%% 
-define(GS2U_VariantInfo,33971).
-record(pk_GS2U_VariantInfo,{
	%% VariantInfo
	variantList = []
}).

-record(pk_SwitchVariantInfo,{
	%% UInt32 位索引
	bitIndex = 0,
	%% Boolean 位值
	bitValue = false
}).

%% 
%% // 设置相关协议
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
-define(U2GS_AllTeamInvitationSetting,835).
-record(pk_U2GS_AllTeamInvitationSetting,{
	%% Byte 1.开；2.关
	onOrOff = 0
}).

-record(pk_VariantInfo,{
	%% UInt16需要修改设置项的下标
	index = 0,
	%% UInt32设置的值（考虑到以后的数值类设置）
	value = 0
}).

%% 
%% //领取绑定手机奖励
-define(BindPhoneAwardGet,44962).
-record(pk_BindPhoneAwardGet,{
}).

%% 
%% //每日签到
-define(EveryDaySignIn,17267).
-record(pk_EveryDaySignIn,{
}).

%% 
-define(GS2U_BindPhoneResult,7478).
-record(pk_GS2U_BindPhoneResult,{
	%% Boolean
	isSuccess = false
}).

%% 
%% //签到初始信息
-define(GS2U_SignIn,13078).
-record(pk_GS2U_SignIn,{
	%% SignInInfo
	info_list = [],
	%% UInt64UTC时间（相对于1970年第0秒），单位秒
	time = 0
}).

%% 
%% //七日签到
-define(SevenDaySignIn,65465).
-record(pk_SevenDaySignIn,{
	%% Byte签到的天数
	dayCount = 0
}).

-record(pk_SignInInfo,{
	%% Byte签到类型，0：每日签到，1:七日签到
	signType = 0,
	%% SignItem签到奖励道具列表
	itemList = [],
	%% Byte签到状态，0：未签，1：已签，2:不能签
	signState = 0
}).

-record(pk_SignItem,{
	%% UInt16道具编号ID
	itemID = 0,
	%% UInt16堆叠个数
	itemNumber = 0
}).

%% 
%% //累计奖励
-define(U2GS_AccuReward,39405).
-record(pk_U2GS_AccuReward,{
	%% Byte
	id = 0
}).

%% 
-define(U2GS_BindPhone,10295).
-record(pk_U2GS_BindPhone,{
	%% String
	funcellCilentID = "",
	%% String
	accessToken = "",
	%% UInt64手机号码
	phoneNum = 0,
	%% String验证流水号
	verifyid = "",
	%% String玩家填的验证码
	content = ""
}).

%% 
%% //新版本  
%% //每日签到
-define(U2GS_SignIn,25944).
-record(pk_U2GS_SignIn,{
}).

%% 
-define(GS2U_BreakLifeSkill,51002).
-record(pk_GS2U_BreakLifeSkill,{
	%% Int16
	type = 0
}).

%% 
%% //技能改变处理结果
-define(GS2U_ChangeSkillSlotResult,13768).
-record(pk_GS2U_ChangeSkillSlotResult,{
	%% UInt32改变类型（添加 or 移除 0是添加，1是移除，出错为2）
	changeType = 0,
	%% SByte技能类型（主动技能或被动技能）
	skillType = 0,
	%% UInt32技能 以前的下标（默认为 0，表示以前没有添加此技能）
	oldIndex = 0,
	%% SkillSlotInfo改变后的技能槽信息
	newSkillInfo
}).

%% 
-define(GS2U_GiveRewardAck,40905).
-record(pk_GS2U_GiveRewardAck,{
	%% Int16
	type = 0,
	%% itemInfo
	infos = []
}).

%% 
%% //初始化生活技能列表
-define(GS2U_InitLifeSkillList,59951).
-record(pk_GS2U_InitLifeSkillList,{
	%% LifeSkillInfo
	infos = []
}).

%% 
%% //主动技能信息列表（玩家上线发送）
-define(GS2U_InitiativeSkillSlotInfoList,57483).
-record(pk_GS2U_InitiativeSkillSlotInfoList,{
	%% SkillSlotInfo技能槽技能信息列表
	skillSlotList = []
}).

%% 
-define(GS2U_LifeSkillCanUseCount,7095).
-record(pk_GS2U_LifeSkillCanUseCount,{
	%% lifeSkillCanUseCount
	listNew = []
}).

%% 
%% //技能开放
-define(GS2U_OpenSkill,53903).
-record(pk_GS2U_OpenSkill,{
	%% UInt32技能ID
	skillId = 0,
	%% UInt32角色最新等级（该消息可能在升级过程中发送，因此需要用该字段作为最新等级使用）
	level = 0
}).

%% 
%% //技能槽开放
-define(GS2U_OpenSlot,41992).
-record(pk_GS2U_OpenSlot,{
	%% OpenSlot技能槽类型 1:主动技能槽 2:被动技能槽 3:变身技能
	openSlot
}).

%% 
%% //开放的技能槽列表
-define(GS2U_OpenSlotList,17042).
-record(pk_GS2U_OpenSlotList,{
	%% OpenSlot技能槽列表 
	slotList = []
}).

%% 
%% //被动技能升级结果
-define(GS2U_PassiveSkillInfo,50820).
-record(pk_GS2U_PassiveSkillInfo,{
	%% UInt32技能ID
	id = 0,
	%% UInt32技能等级
	level = 0
}).

%% 
%% //被动技能信息列表
-define(GS2U_PassiveSkillInfoList,47822).
-record(pk_GS2U_PassiveSkillInfoList,{
	%% PassiveSkillInfo
	skillList = []
}).

%% 
%% //被动技能信息列表（玩家上线发送）
-define(GS2U_PassiveSkillSlotInfoList,64100).
-record(pk_GS2U_PassiveSkillSlotInfoList,{
	%% SkillSlotInfo技能槽技能信息列表
	skillSlotList = []
}).

%% 
%% //技能减少CD时间
-define(GS2U_ReduceCD,6635).
-record(pk_GS2U_ReduceCD,{
	%% UInt32技能ID
	skillId = 0,
	%% UInt32技能减少后CD
	cd = 0
}).

%% 
%% //升级结果
-define(GS2U_SkillInfo,42635).
-record(pk_GS2U_SkillInfo,{
	%% UInt32技能ID
	id = 0,
	%% UInt32技能等级
	level = 0
}).

%% 
%% //技能信息列表
-define(GS2U_SkillInfoList,15045).
-record(pk_GS2U_SkillInfoList,{
	%% UInt64
	code = 0,
	%% SkillInfo
	skillInfoList = []
}).

%% 
%% //变身技能信息列表（玩家上线发送）
-define(GS2U_TransformSkillSlotInfoList,19023).
-record(pk_GS2U_TransformSkillSlotInfoList,{
	%% SkillSlotInfo技能槽技能信息列表
	skillSlotList = []
}).

%% 
%% //被动技能触发后飘字
-define(GS2U_TriggerPassiveSkill,3194).
-record(pk_GS2U_TriggerPassiveSkill,{
	%% UInt32技能ID
	id = 0,
	%% UInt32技能等级
	level = 0,
	%% UInt64飘字列表
	codelist = []
}).

%% 
-define(GS2U_UpdateLifeSkill,8296).
-record(pk_GS2U_UpdateLifeSkill,{
	%% LifeSkillInfo
	info
}).

%% 
%% //技能升级（学习）结果
-define(GS2U_UpgradeSkill_Result,31943).
-record(pk_GS2U_UpgradeSkill_Result,{
	%% UInt32 技能升级结果(等级不足,钱币不足,最大等级,声望不足,能量不足,装备要求)
	resultCode = 0,
	%% SkillInfo
	skillinfo
}).

-record(pk_LifeSkillInfo,{
	%% Int16
	type = 0,
	%% Int16
	level = 0,
	%% Int32
	exp = 0
}).

-record(pk_OpenSlot,{
	%% Byte技能槽编号
	slot = 0,
	%% Byte技能槽类型 1:主动技能槽 2:被动技能槽 3:变身技能
	type = 0
}).

-record(pk_PassiveSkillInfo,{
	%% UInt32技能ID
	id = 0,
	%% UInt32技能等级
	level = 0
}).

-record(pk_SkillInfo,{
	%% UInt32技能ID
	id = 0,
	%% UInt32技能等级
	level = 0,
	%% UInt32技能剩余CD时间，单位（毫秒）
	remainCD = 0
}).

-record(pk_SkillSlotInfo,{
	%% UInt32技能在卡槽的位置
	index = 0,
	%% UInt32技能ID
	skillID = 0
}).

%% 
-define(U2GS_BuySpirit,52009).
-record(pk_U2GS_BuySpirit,{
}).

%% 
%% //技能改变
-define(U2GS_ChangeSkillSlotRequest,58650).
-record(pk_U2GS_ChangeSkillSlotRequest,{
	%% UInt32改变类型（添加 or 移除 0是添加，1是移除）
	changeType = 0,
	%% SByte技能类型（主动技能或被动技能）
	skillType = 0,
	%% SkillSlotInfo将要改变的技能槽信息
	changeSkillInfo
}).

%% 
-define(U2GS_FinishLifeSkill,15740).
-record(pk_U2GS_FinishLifeSkill,{
	%% Int16
	type = 0
}).

%% 
-define(U2GS_GiveReward,738).
-record(pk_U2GS_GiveReward,{
	%% Int16
	type = 0,
	%% Int64钓鱼和采矿需要，其他的填0
	npcCode = 0,
	%% Int64
	param = 0
}).

%% 
-define(U2GS_LifeSkillBuyCount,59960).
-record(pk_U2GS_LifeSkillBuyCount,{
	%% Int16
	type = 0,
	%% Int16
	count = 0
}).

%% 
%% //被动技能升级
-define(U2GS_PassiveUpSkill,31693).
-record(pk_U2GS_PassiveUpSkill,{
	%% UInt32
	id = 0
}).

%% 
%% //重置技能
-define(U2GS_ResetSkill,21348).
-record(pk_U2GS_ResetSkill,{
}).

%% 
%% //升级技能
-define(U2GS_UpSkill,800).
-record(pk_U2GS_UpSkill,{
	%% UInt32
	id = 0,
	%% UInt3211：一键升级; 其他值 升一级
	type = 0
}).

%% 
%% //技能升级（学习）请求
-define(U2GS_UpgradeSkill_Request,48791).
-record(pk_U2GS_UpgradeSkill_Request,{
	%% UInt32	技能 ID
	skillId = 0
}).

%% 
-define(U2GS_UseLifeSkill,3828).
-record(pk_U2GS_UseLifeSkill,{
	%% Int16
	type = 0,
	%% Int64钓鱼和采矿需要，其他的填0
	npcCode = 0,
	%% Int64
	param = 0,
	%% Int16倍数，制作、烹饪需要的，其他的服务器默认为1
	times = 0
}).

-record(pk_itemInfo,{
	%% UInt16商品ID
	itemID = 0,
	%% UInt16
	itemNum = 0
}).

-record(pk_lifeSkillCanUseCount,{
	%% Int16
	type = 0,
	%% UInt32
	count = 0
}).

%% 
%% //初始化所有属性的等级
-define(GS2U_TalentInitAck,17717).
-record(pk_GS2U_TalentInitAck,{
	%% TalentInfo
	talentInfos = []
}).

%% 
-define(GS2U_TalentLevelUpSuccess,33052).
-record(pk_GS2U_TalentLevelUpSuccess,{
	%% TalentInfo
	talentInfo
}).

-record(pk_TalentInfo,{
	%% Byte天赋id
	id = 0,
	%% Byte天赋等级
	level = 0,
	%% UInt64下一级需要的天赋经验
	nextlevelexp = 0
}).

%% 
-define(U2GS_TalentInit,43814).
-record(pk_U2GS_TalentInit,{
}).

%% 
-define(U2GS_TalentLevelUp,55001).
-record(pk_U2GS_TalentLevelUp,{
	%% Byte
	id = 0
}).

%% 
%% //增加任务
-define(GS2U_AcceptTask,3141).
-record(pk_GS2U_AcceptTask,{
	%% taskInfo
	info
}).

%% 
%% //接受任务列表(废弃)
-define(GS2U_AcceptTaskList,49439).
-record(pk_GS2U_AcceptTaskList,{
	%% acceptedBaseTask
	list = []
}).

%% 
%% //增加新接受任务(废弃)
-define(GS2U_AddNewAcceptTask,39928).
-record(pk_GS2U_AddNewAcceptTask,{
	%% Int32
	taskID = 0,
	%% Int32
	result = 0
}).

%% 
%% //通知客户端校增加新完成任务(废弃)
-define(GS2U_AddNewCompleteTask,20405).
-record(pk_GS2U_AddNewCompleteTask,{
	%% Int32
	result = 0,
	%% Int32
	taskID = 0
}).

%% 
%% // 采集对象失败（客户端需要重置采集物状态以避免死锁）
-define(GS2U_CollectObj_Failed,56775).
-record(pk_GS2U_CollectObj_Failed,{
	%% UInt64采集对象code
	code = 0
}).

%% 
%% //提交的任务占位列表，每一个uint64表示64个任务ID（按位表示），
%% //具体是多少依据占列表中的索引号来计算
-define(GS2U_CompleteTaskList,57012).
-record(pk_GS2U_CompleteTaskList,{
	%% SubmittedTaskInfo
	list = []
}).

%% 
%% //删除任务
-define(GS2U_DeleteAcceptTask,17300).
-record(pk_GS2U_DeleteAcceptTask,{
	%% Int32
	taskID = 0,
	%% Int32
	result = 0
}).

%% 
-define(GS2U_SyncStateLoopTask,38547).
-record(pk_GS2U_SyncStateLoopTask,{
	%% LoopTaskState 当前轮任务状态 时间降序
	list = [],
	%% Byte 同步时机 0上线同步 1每日重置（可能是GM） 2领取任务 3完成任务 4放弃任务 5免费刷新 6付费刷新 7单次五星 8一键五星 9完成当前轮，并完成所有环任务（有奖） 10完成当前轮，但仅有部分环任务（没奖）
	state = 0,
	%% Byte 当前轮是否是一键五星状态
	allFive = 0
}).

%% 
%% //NPC对话任务结果
-define(GS2U_TalkToNpcResult,30499).
-record(pk_GS2U_TalkToNpcResult,{
	%% Int32
	result = 0,
	%% UInt64
	code = 0
}).

%% 
%% // 任务列表
-define(GS2U_TaskList,7479).
-record(pk_GS2U_TaskList,{
	%% taskInfo
	list = []
}).

%% 
%% //更新已接受任务信息(废弃)
-define(GS2U_UpdateAcceptTask,14926).
-record(pk_GS2U_UpdateAcceptTask,{
	%% Int32
	result = 0,
	%% acceptedBaseTask
	acceptTaskInfo
}).

%% 
%% //更新任务信息
-define(GS2U_UpdateTask,19758).
-record(pk_GS2U_UpdateTask,{
	%% taskInfo
	info
}).

-record(pk_LoopTaskState,{
	%% UInt16 任务ID
	taskID = 0,
	%% Byte 任务状态 0进行中 1已完成 2已放弃
	state = 0,
	%% taskInfo 任务数据（由于客户端没有区分任务类型来解析任务数据，故统一由服务端指定）
	task
}).

-record(pk_SubmittedTaskInfo,{
	%% UInt16
	slot = 0,
	%% UInt64
	value = 0
}).

%% 
%% //接取任务
-define(U2GS_AcceptTask,35751).
-record(pk_U2GS_AcceptTask,{
	%% Int32任务ID
	taskID = 0,
	%% UInt64NPC编码
	npcCode = 0
}).

%% 
%% //采集对象请求
-define(U2GS_CollectObj,43491).
-record(pk_U2GS_CollectObj,{
	%% UInt64采集对象code
	code = 0
}).

%% 
%% //放弃任务
-define(U2GS_DropTask,24126).
-record(pk_U2GS_DropTask,{
	%% Int32
	taskID = 0
}).

%% 
%% // 请求接取家族/环任务
-define(U2GS_RequestAcceptLoopTask,64530).
-record(pk_U2GS_RequestAcceptLoopTask,{
}).

%% 
%% //请求接取任务(废弃)
-define(U2GS_RequestAcceptTask,19210).
-record(pk_U2GS_RequestAcceptTask,{
	%% Int32任务ID
	taskID = 0,
	%% UInt64NPC编码
	code = 0
}).

%% 
%% // 上交物品任务，请求上交物品
-define(U2GS_RequestHandIn,54029).
-record(pk_U2GS_RequestHandIn,{
	%% UInt16 任务ID
	taskID = 0,
	%% UInt16 道具ID
	itemID = 0,
	%% UInt32 道具数量
	itemCount = 0,
	%% UInt64 NpcCode
	npcCode = 0
}).

%% 
%% // 请求一键完成家族/环任务
-define(U2GS_RequestOneKeyLoopTask,29107).
-record(pk_U2GS_RequestOneKeyLoopTask,{
	%% UInt32 想要一键完成多少个？0表示有多少完成多少
	count = 0
}).

%% 
%% // 操作当前正在进行的家族/环任务
-define(U2GS_RequestOperateLoopTask,42512).
-record(pk_U2GS_RequestOperateLoopTask,{
	%% UInt16 任务ID
	taskID = 0,
	%% Byte 操作码 0放弃 1免费刷新 2付费刷新 3单次五星 4一键五星 
	opType = 0
}).

%% 
%% //任务重置
-define(U2GS_ResetTask,28782).
-record(pk_U2GS_ResetTask,{
	%% Int32
	taskID = 0
}).

%% 
%% //归还任务
-define(U2GS_SumbitTask,8517).
-record(pk_U2GS_SumbitTask,{
	%% Int32
	taskID = 0,
	%% UInt64
	code = 0
}).

%% 
%% //NPC对话任务请求
-define(U2GS_TalkToNpc,7564).
-record(pk_U2GS_TalkToNpc,{
	%% UInt64
	code = 0
}).

%% 
%% //触发任务buff
-define(U2GS_TriggerTaskBuff,25874).
-record(pk_U2GS_TriggerTaskBuff,{
	%% Int32
	taskID = 0
}).

%% 
%% //使用物品请求
-define(U2GS_UseItemObj,53415).
-record(pk_U2GS_UseItemObj,{
	%% UInt64使用物品code
	code = 0
}).

-record(pk_acceptedAimTask,{
	%% Int32子任务类型，如杀怪，采集等等
	aimType = 0,
	%% Int32具体子任务类型下的数据，如：杀怪子任务为怪物ID，采集子任务为采集物ID
	aimIndex = 0,
	%% Int32数量，如：杀怪子任务为杀怪数量，采集子任务为采集数量
	aimCurCount = 0
}).

-record(pk_acceptedBaseTask,{
	%% Int32
	taskID = 0,
	%% acceptedAimTask
	taskProcess = []
}).

-record(pk_taskInfo,{
	%% Int32
	taskID = 0,
	%% Int32
	target = 0,
	%% Int32
	curNumber = 0,
	%% Int32
	maxNumber = 0
}).

-record(pk_FightingCapacityInfo,{
	%% UInt64
	roleID = 0,
	%% UInt64 战斗力
	fightingCapacity = 0
}).

%% 
%% //添加队友信息
-define(GS2U_AddTeamMemberInfo,40018).
-record(pk_GS2U_AddTeamMemberInfo,{
	%% Byte队伍类型
	teamType = 0,
	%% TeamMemberInfo
	memberInfo
}).

%% 
%% //询问，有人邀请你
-define(GS2U_BeenInviteTeam,28790).
-record(pk_GS2U_BeenInviteTeam,{
	%% Byte队伍类型
	teamType = 0,
	%% Byte邀请类型(1.邀请加入;2.申请入队)
	inviteType = 0,
	%% UInt64邀请玩家ID
	inviterPlayerID = 0,
	%% String邀请玩家姓名
	inviterPlayerName = ""
}).

%% 
%% //移除队友信息
-define(GS2U_DelTeammateInfo,24383).
-record(pk_GS2U_DelTeammateInfo,{
	%% Byte队伍类型
	teamType = 0,
	%% UInt64
	teammateID = 0
}).

%% 
-define(GS2U_FastTeamAck,53040).
-record(pk_GS2U_FastTeamAck,{
}).

%% 
-define(GS2U_FastTeamSucc,30215).
-record(pk_GS2U_FastTeamSucc,{
	%% UInt16进入副本倒计时 单位 秒
	time = 0
}).

%% 
%% //询问，有人邀请你
-define(GS2U_InviteUJoinTeam,44111).
-record(pk_GS2U_InviteUJoinTeam,{
	%% Int32
	copyMapID = 0,
	%% UInt64邀请玩家ID
	inviterPlayerID = 0,
	%% String邀请玩家姓名
	inviterPlayerName = "",
	%% UInt64 帮会ID
	guildID = 0,
	%% String 角色名字
	guildName = "",
	%% Byte 是否是好友(1是)
	friendState = 0
}).

%% 
%% // 被T
-define(GS2U_KickOutByLeader,57308).
-record(pk_GS2U_KickOutByLeader,{
	%% Byte队伍类型
	teamType = 0
}).

%% 
%% //队伍信息
-define(GS2U_MyTeamInfo,36807).
-record(pk_GS2U_MyTeamInfo,{
	%% TeamBaseInfo
	base,
	%% TeamMemberInfo
	infos = []
}).

%% 
-define(GS2U_NearTeamInfo,13971).
-record(pk_GS2U_NearTeamInfo,{
	%% Byte队伍类型
	teamType = 0,
	%% NearTeamInfo
	teamInfoList = []
}).

%% 
-define(GS2U_NearbyPlayer_Ack,57966).
-record(pk_GS2U_NearbyPlayer_Ack,{
	%% NotTeamMemberInfo
	list = []
}).

%% 
%% //新增队员信息
-define(GS2U_NewMemberJoin,10808).
-record(pk_GS2U_NewMemberJoin,{
	%% TeamMemberInfo
	info
}).

%% 
%% //查询玩家列表
-define(GS2U_QueryRoleListAck,55541).
-record(pk_GS2U_QueryRoleListAck,{
	%% Int32
	queryType = 0,
	%% OnlineMemberSnapshot
	playerList = []
}).

%% 
%% //查询队伍列表
-define(GS2U_QueryTeamListAck,60002).
-record(pk_GS2U_QueryTeamListAck,{
	%% TeamSnapshot
	teamSnapshot = []
}).

%% 
%% //查询队伍列表
-define(GS2U_QueryTeamListThisLineAck,1340).
-record(pk_GS2U_QueryTeamListThisLineAck,{
	%% TeamSnapshot
	teamSnapshot = []
}).

%% 
%% //操作结果
-define(GS2U_QuickTeamMatchAck,546).
-record(pk_GS2U_QuickTeamMatchAck,{
	%% Int32
	result = 0,
	%% UInt64
	startTime = 0
}).

%% 
%% //队长收到提醒
-define(GS2U_ReceiveNotice,47371).
-record(pk_GS2U_ReceiveNotice,{
	%% String 提醒者名字
	sendRoleName = "",
	%% UInt16 目标地图ID
	mapID = 0
}).

%% 
%% //发送队伍队员战斗力到客户端
-define(GS2U_RequestFightingCapacity,28959).
-record(pk_GS2U_RequestFightingCapacity,{
	%% FightingCapacityInfo
	fightingCapacityInfos = []
}).

%% 
%% //队长切换
-define(GS2U_TeamChangeLeader,55574).
-record(pk_GS2U_TeamChangeLeader,{
	%% Byte队伍类型
	teamType = 0,
	%% UInt64新的队长ID
	newLeaderID = 0
}).

%% 
%% // 队伍解散
-define(GS2U_TeamDisbanded,12825).
-record(pk_GS2U_TeamDisbanded,{
	%% Byte队伍类型
	teamType = 0
}).

%% 
%% //队伍信息
-define(GS2U_TeamInfo,55031).
-record(pk_GS2U_TeamInfo,{
	%% Byte
	teamType = 0,
	%% Int64
	teamID = 0,
	%% UInt64
	leaderID = 0,
	%% TeamMemberInfo
	info_list = [],
	%% String 扩展属性
	customProp = ""
}).

%% 
%% //队长点击开始副本
-define(GS2U_TeamLeaderStartCopymap,47759).
-record(pk_GS2U_TeamLeaderStartCopymap,{
	%% Int32
	copyMapID = 0
}).

%% 
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //队员额外信息（实时性比较强的信息）
-define(GS2U_TeamMemberExtInfo,23416).
-record(pk_GS2U_TeamMemberExtInfo,{
	%% UInt64 角色ID
	roleID = 0,
	%% UInt16 等级
	level = 0,
	%% Byte 血量百分比
	hpPC = 0,
	%% UInt16 所在的地图
	mapID = 0
}).

%% 
-define(GS2U_TeamMemberOffline,63632).
-record(pk_GS2U_TeamMemberOffline,{
	%% Byte 队伍类型
	teamType = 0,
	%% UInt64
	playerID = 0
}).

%% 
-define(GS2U_TeamMemberOnline,17622).
-record(pk_GS2U_TeamMemberOnline,{
	%% Byte 队伍类型
	teamType = 0,
	%% UInt64
	playerID = 0,
	%% UInt64 角色流水号	
	code = 0,
	%% UInt16
	level = 0
}).

%% 
%% //队员上下线
-define(GS2U_TeamMemberOnlineState,45527).
-record(pk_GS2U_TeamMemberOnlineState,{
	%% UInt64
	playerID = 0,
	%% Int32 1 上线； 0 离线
	state = 0
}).

%% 
%% // 队伍重置，包括，被踢，离开队伍，解散队伍
%% // 相关的提示将会通过errorcode来提示
-define(GS2U_TeamReset,10754).
-record(pk_GS2U_TeamReset,{
	%% Int32 0 初始化, 1 T;2退队
	reason = 0
}).

%% 
%% // 队友离队
-define(GS2U_TeammateLeave,39901).
-record(pk_GS2U_TeammateLeave,{
	%% UInt64
	teammateID = 0
}).

%% 
%% // 队友离队
-define(GS2U_TeammateLeaveAwayTeam,51520).
-record(pk_GS2U_TeammateLeaveAwayTeam,{
	%% Byte队伍类型
	teamType = 0,
	%% UInt64
	teammateID = 0
}).

%% 
%% //给玩家同步队友位置信息
-define(GS2U_TeammateLocation,34795).
-record(pk_GS2U_TeammateLocation,{
	%% TeamMemberLocation
	teammateLocations = []
}).

%% 
%% //队员回复进副本
-define(GS2U_TeammateStartCopymapAck,6678).
-record(pk_GS2U_TeammateStartCopymapAck,{
	%% UInt64 角色ID
	playerID = 0,
	%% Byte 0.拒绝;1.同意;
	isAgree = 0
}).

%% 
%% //队员额外信息（实时性比较强的信息）
-define(GS2U_UpdateMemberExInfo,34340).
-record(pk_GS2U_UpdateMemberExInfo,{
	%% TeamMemberInfoEx
	infoEx
}).

%% 
%% //队伍信息变化，主要是切换副本，或者换队长
-define(GS2U_UpdateTeamInfo,25304).
-record(pk_GS2U_UpdateTeamInfo,{
	%% TeamBaseInfo
	base
}).

-record(pk_NearTeamInfo,{
	%% Int64
	teamID = 0,
	%% UInt64
	leaderID = 0,
	%% String队长名字
	leaderName = "",
	%% Int16队长等级
	leaderLevel = 0,
	%% Byte队伍人数
	numberOfTeam = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0
}).

-record(pk_NotTeamMemberInfo,{
	%% UInt64 角色ID
	id = 0,
	%% String 姓名
	name = "",
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt32
	serverID = 0
}).

-record(pk_OnlineMemberSnapshot,{
	%% UInt64 角色ID
	playerID = 0,
	%% UInt64 角色流水号
	code = 0,
	%% UInt64 帮会ID
	guildID = 0,
	%% String 角色名字
	playerName = "",
	%% String 帮会名字
	guildName = "",
	%% UInt32 职业
	career = 0,
	%% UInt16 等级
	level = 0,
	%% Byte 是否是好友(1是)
	friendState = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% UInt32
	force = 0
}).

-record(pk_TeamBaseInfo,{
	%% UInt64
	teamID = 0,
	%% UInt64
	leaderID = 0,
	%% Int32
	copyMapID = 0,
	%% Int32
	canBeSearched = 0,
	%% UInt64
	searchStartTime = 0
}).

-record(pk_TeamMemberInfo,{
	%% UInt64 角色ID
	playerID = 0,
	%% UInt64 角色流水号
	code = 0,
	%% String 角色名字
	playerName = "",
	%% UInt64 帮会ID
	guildID = 0,
	%% String 帮会名字
	guildName = "",
	%% UInt64 战力
	force = 0,
	%% UInt16 等级
	level = 0,
	%% UInt32 职业
	career = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% Byte 血量百分比[0,100]
	hpPercent = 0,
	%% UInt16 所在的地图
	mapID = 0,
	%% UInt32 组ID
	groupID = 0,
	%% UInt64 线ID
	mapInstanceID = 0,
	%% UInt16 助战地图ID
	assistMapID = 0,
	%% Single x坐标
	x = 0.0,
	%% Single y坐标
	y = 0.0,
	%% String 扩展信息
	customInfo = "",
	%% UInt16 副本剩余次数
	copyMapLeftCount = 0,
	%% UInt32 体力值
	actionPoint = 0,
	%% UInt32
	serverID = 0,
	%% UInt16 
	copyMapStar = 0
}).

-record(pk_TeamMemberInfoEx,{
	%% UInt64 角色ID
	playerID = 0,
	%% UInt64 角色流水号
	code = 0,
	%% UInt16 等级
	level = 0,
	%% UInt16 血量百分比
	hpPercent = 0,
	%% UInt16 所在的地图
	mapID = 0,
	%% UInt32 组ID
	groupID = 0,
	%% UInt64 线ID
	mapInstanceID = 0,
	%% UInt16 副本剩余次数
	copyMapLeftCount = 0,
	%% UInt32 体力值
	actionPoint = 0,
	%% UInt64
	force = 0,
	%% UInt16 助战地图ID
	assistMapID = 0,
	%% Single x坐标
	x = 0.0,
	%% Single y坐标
	y = 0.0,
	%% UInt32
	serverID = 0,
	%% UInt16 
	copyMapStar = 0
}).

-record(pk_TeamMemberLocation,{
	%% UInt64队友ID
	playerID = 0,
	%% Single队友所在x坐标
	x = 0.0,
	%% Single队友所在y坐标
	y = 0.0
}).

-record(pk_TeamMemberSnapshot,{
	%% UInt64 角色ID
	playerID = 0,
	%% UInt64 角色流水号
	code = 0,
	%% String 角色名字
	playerName = "",
	%% UInt32 职业
	career = 0,
	%% UInt16 等级
	level = 0,
	%% Byte 种族
	race = 0,
	%% Byte 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt16 头像框
	frameID = 0,
	%% UInt64
	force = 0,
	%% UInt64 帮会ID
	guildID = 0
}).

-record(pk_TeamSnapshot,{
	%% TeamBaseInfo
	base,
	%% TeamMemberSnapshot
	members = []
}).

%% 
%% //回复，队伍邀请结果
-define(U2GS_AckInviteJoinTeam,7027).
-record(pk_U2GS_AckInviteJoinTeam,{
	%% Byte 0.拒绝;1.同意;
	isAgree = 0,
	%% UInt64 邀请玩家ID
	inviterPlayerID = 0
}).

%% 
%% //回复，队伍邀请结果
-define(U2GS_AckInviteTeam,42781).
-record(pk_U2GS_AckInviteTeam,{
	%% Byte 队伍类型
	teamType = 0,
	%% Byte 0.拒绝;1.同意;
	isAgree = 0,
	%% Byte 邀请类型(1.邀请加入;2.申请入队)
	inviteType = 0,
	%% UInt64 邀请玩家ID
	inviterPlayerID = 0
}).

%% 
-define(U2GS_CancelFastTeam,63209).
-record(pk_U2GS_CancelFastTeam,{
}).

%% 
%% //玩家打开关闭地图面板
-define(U2GS_IsOpenMapPanel,57366).
-record(pk_U2GS_IsOpenMapPanel,{
	%% Boolean
	isOpen = false
}).

%% 
%% // 离队
-define(U2GS_LeaveAwayTeam,63768).
-record(pk_U2GS_LeaveAwayTeam,{
	%% Byte队伍类型
	teamType = 0,
	%% Byte没用的数据，随便填一个，以后会删掉
	id = 0
}).

%% 
-define(U2GS_NearbyPlayer_Request,36078).
-record(pk_U2GS_NearbyPlayer_Request,{
}).

%% 
%% //提醒队长
-define(U2GS_NoticeLeader,17491).
-record(pk_U2GS_NoticeLeader,{
}).

%% 
%% //队伍操作
-define(U2GS_OperateTeam,8639).
-record(pk_U2GS_OperateTeam,{
	%% Byte队伍类型
	teamType = 0,
	%% Byte操作类型(1.邀请加入;2.申请入队;3.T人;4.给予队长)
	operateType = 0,
	%% UInt64操作对象玩家ID	
	operatedID = 0
}).

%% 
%% //查询无队伍玩家
-define(U2GS_QueryRoleList,40314).
-record(pk_U2GS_QueryRoleList,{
	%% Int32
	queryType = 0
}).

%% 
%% //查询队伍列表
-define(U2GS_QueryTeamList,29633).
-record(pk_U2GS_QueryTeamList,{
	%% Int32
	mapIDList = []
}).

%% 
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //组队大厅
%% //查询当前地图线的队伍列表
-define(U2GS_QueryTeamListThisLine,21263).
-record(pk_U2GS_QueryTeamListThisLine,{
}).

%% 
%% //玩家快捷加入队伍
-define(U2GS_QuickJoinTeam,32962).
-record(pk_U2GS_QuickJoinTeam,{
	%% UInt64
	roleID = 0,
	%% UInt32
	mapID = 0
}).

%% 
%% //快速匹配
-define(U2GS_QuickTeamMatch,45837).
-record(pk_U2GS_QuickTeamMatch,{
	%% UInt16
	mapList = []
}).

%% 
%% //玩家发起副本快捷组队
-define(U2GS_QuickTeamStart,63294).
-record(pk_U2GS_QuickTeamStart,{
	%% UInt32
	mapID = 0
}).

%% 
%% //客户端请求获取队伍队员战斗力
-define(U2GS_RequestFightingCapacity,23749).
-record(pk_U2GS_RequestFightingCapacity,{
}).

%% 
-define(U2GS_RequestNearByTeamInfo,9627).
-record(pk_U2GS_RequestNearByTeamInfo,{
	%% Byte队伍类型
	teamType = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //0:普通队伍（五分钟没有人就会删除，可以任意换队长）
%% //1:系统队伍（服务器逻辑去删除和创建, 只在服务器内部使用，不可换队长）
%% //2:灵魂伙伴（玩家去删除和创建，不可换队长）
%% //----------------------------------------------------------------
%% //队伍操作
-define(U2GS_TeamOp,47456).
-record(pk_U2GS_TeamOp,{
	%% Byte
	operateType = 0,
	%% UInt64
	operatedID = 0,
	%% UInt64
	param1 = 0
}).

-record(pk_DealRecord,{
	%% UInt64 出售者原装备唯一ID
	itemUID = 0,
	%% UInt32 道具编号ID
	itemID = 0,
	%% Byte 出售类型,1金币交易,2钻石交易,3指定交易
	sellType = 0,
	%% Byte 1购买，2出售
	buyorsell = 0,
	%% UInt64 成交时间s
	dealTime = 0,
	%% UInt32 金币
	gold = 0,
	%% UInt32 钻石
	diamond = 0,
	%% UInt32 税
	tax = 0,
	%% QueryEquipPropInfo装备属性列表--如果是装备才会有这个数据
	equipProps = []
}).

%% 
%% // 购买失败提示音
-define(GS2U_BuyTradeFaild,63128).
-record(pk_GS2U_BuyTradeFaild,{
}).

%% 
%% // 购买成功提示音
-define(GS2U_BuyTradeSuccess,52241).
-record(pk_GS2U_BuyTradeSuccess,{
}).

%% 
%% // 返回成交记录
-define(GS2U_DealRecord,52921).
-record(pk_GS2U_DealRecord,{
	%% Byte 操作码
	opCode = 0,
	%% UInt32 总条数
	number = 0,
	%% DealRecord 结果列表
	dealRecord = []
}).

%% 
%% // 购买，上架，下架，拒绝购买等的操作结果
-define(GS2U_OpTradeResult,58764).
-record(pk_GS2U_OpTradeResult,{
	%% Byte 类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% UInt64 订单ID
	orderID = 0,
	%% Byte 结果
	result = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 查询交易行的订单列表
-define(GS2U_QueryTrade,7448).
-record(pk_GS2U_QueryTrade,{
	%% Byte 操作码
	opCode = 0,
	%% Byte 排序方式,0无序,1升序,2降序
	sortType = 0,
	%% Byte 对什么排序，1品质，2等级，3剩余时间，4出售人，5售价，6单价
	sortIndex = 0,
	%% UInt32 第几页
	pageNumber = 0,
	%% UInt64 当前时间
	nowTime = 0,
	%% QueryTradeList 结果列表
	queryTradeList = []
}).

%% 
%% // 本次查询的订单记录信息
-define(GS2U_QueryTradeInfo,23698).
-record(pk_GS2U_QueryTradeInfo,{
	%% Byte 操作码
	opCode = 0,
	%% Byte 查询类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% Byte 道具类型, 1为装备道具equip，2为普通道具item
	itemClass = 0,
	%% SByte 道具主类型,为空不过滤
	itemTypeList = [],
	%% SByte 道具子类型,不过滤为-1
	itemSubType = 0,
	%% Int32 总共有多少条记录
	allNumber = 0
}).

%% 
%% // 返回上架参考
-define(GS2U_ReferenceItem,2856).
-record(pk_GS2U_ReferenceItem,{
	%% Byte 查询类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% ReferenceItem 参考列表
	referenceItems = [],
	%% ReferenceItem 最近成交(停服后清空)
	referenceItem
}).

-record(pk_QueryEquipPropInfo,{
	%% Byte装备属性类型  1:基础属性, 2:附加属性(未重铸)  3:附加属性(不可重铸) 4.附加属性(已重铸) 
	propType = 0,
	%% Byte属性标识主键  对应propType 如propType = 1时，propKey为属性ID
	propKey = 0,
	%% UInt16属性词缀
	propAffix = 0,
	%% Boolean属性计算类型  false加法  true乘法
	calcType = false,
	%% Single属性值
	propValue = 0.0
}).

-record(pk_QueryTradeList,{
	%% UInt64 订单ID
	orderID = 0,
	%% UInt64 出售者原装备唯一ID
	itemUID = 0,
	%% UInt32 道具编号ID
	itemID = 0,
	%% String 出售者角色姓名
	roleName = "",
	%% Byte 出售类型,1金币交易,2钻石交易,3指定交易
	sellType = 0,
	%% UInt64 上架时间s
	putTime = 0,
	%% UInt64 下架时间s
	downTime = 0,
	%% UInt32 金币
	gold = 0,
	%% UInt32 钻石
	diamond = 0,
	%% String 指定卖给谁
	destRoleName = "",
	%% Byte 品质
	quality = 0,
	%% Byte 道具等级
	itemLevel = 0,
	%% UInt32 堆叠数量
	pileCount = 0,
	%% QueryEquipPropInfo装备属性列表--如果是装备才会有这个数据
	equipProps = []
}).

-record(pk_ReferenceItem,{
	%% UInt32 道具编号ID
	itemID = 0,
	%% UInt16 出售道具个数
	sellNumber = 0,
	%% UInt32 金币
	gold = 0,
	%% UInt32 钻石
	diamond = 0
}).

%% 
%% // 下架
-define(U2GS_DownTrade,17148).
-record(pk_U2GS_DownTrade,{
	%% Byte 类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% UInt64 订单ID
	orderID = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 跟据上一次查询结果，查询下一页
-define(U2GS_NextResult,58438).
-record(pk_U2GS_NextResult,{
	%% UInt32 查询第几页
	pageNumber = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 上架
-define(U2GS_PutTrade,54355).
-record(pk_U2GS_PutTrade,{
	%% Byte 类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% UInt64 出售者原装备唯一ID
	itemUID = 0,
	%% UInt32 道具编号ID
	itemID = 0,
	%% UInt16 出售道具个数
	sellNumber = 0,
	%% Byte 出售时长(单位小时)
	sellTime = 0,
	%% UInt32 金币
	gold = 0,
	%% UInt32 钻石
	diamond = 0,
	%% String 指定卖给谁
	destRoleName = "",
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 首次打开界面，获取最新上架记录
-define(U2GS_QueryNewestTrade,42964).
-record(pk_U2GS_QueryNewestTrade,{
	%% Byte 查询类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% Byte 需要查询最新记录的条数
	getNumber = 0,
	%% SByte 每一页显示的条数，-1表示一次性取所有的记录
	oneNumber = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 查询自己的交易订单
-define(U2GS_QuerySelfTrade,45970).
-record(pk_U2GS_QuerySelfTrade,{
	%% Byte 查询类型，1金币交易,2钻石交易,3指定交易，0查询所有自己的订单
	tradeClass = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 查询交易行的订单列表
-define(U2GS_QueryTrade,40058).
-record(pk_U2GS_QueryTrade,{
	%% Byte 查询类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% Byte 道具类型, 1为装备道具equip，2为普通道具item
	itemClass = 0,
	%% SByte 道具主类型列表,不过滤为空
	itemTypeList = [],
	%% SByte 道具子类型,不过滤为-1
	itemSubType = 0,
	%% UInt32 指定的道具ID的名称列表（每项均是全匹配）
	itemList = [],
	%% Int16 职业，不过滤为-1
	career = 0,
	%% SByte min lvl,不过滤为-1
	itemLvlMin = 0,
	%% SByte max lvl,不过滤为-1
	itemLvlMax = 0,
	%% SByte 品质过滤,不过滤为-1
	itemQuality = 0,
	%% SByte 每一页显示的条数，-1表示一次性取所有的记录
	oneNumber = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% ///////////////////////////////////////////////////////////////////////
%% // 注，因LUNA策划修改功能，以下所有协议
%% // tradeClass 交易类型，1金币交易，保留但屏蔽相关功能
%% // itemClass 道具类型，1为装备道具equip，保留但屏蔽相关功能
%% // sortIndex 新增6单价排序
%% ///////////////////////////////////////////////////////////////////////
%% // 请求商品参考价
-define(U2GS_ReferenceItem,16796).
-record(pk_U2GS_ReferenceItem,{
	%% Byte 查询类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% UInt32 道具编号ID
	itemID = 0,
	%% UInt16 请求个数
	requestNumber = 0
}).

%% 
%% // 请求成交记录
-define(U2GS_RequestDealRecord,3454).
-record(pk_U2GS_RequestDealRecord,{
	%% SByte 查询条数，-1表示一次性取所有的记录
	oneNumber = 0,
	%% Byte 当前页数
	pageNumber = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 排序
-define(U2GS_ResultSort,30881).
-record(pk_U2GS_ResultSort,{
	%% Byte 对什么排序，1品质，2等级，3剩余时间，4出售人，5售价，6单价
	sortIndex = 0,
	%% UInt32 排序后获取第几页
	pageNumber = 0,
	%% Byte 排序方式,0无序,1升序,2降序
	sortType = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 购买
-define(U2GS_TradeBuy,8360).
-record(pk_U2GS_TradeBuy,{
	%% Byte 类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% UInt64 订单ID
	orderID = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% // 拒绝购买
-define(U2GS_TradeRefuse,49450).
-record(pk_U2GS_TradeRefuse,{
	%% Byte 类型，1金币交易,2钻石交易,3指定交易
	tradeClass = 0,
	%% UInt64 订单ID
	orderID = 0,
	%% Byte 操作码
	opCode = 0
}).

%% 
%% //解锁状态
-define(GS2U_GoddessActiveSkill,31922).
-record(pk_GS2U_GoddessActiveSkill,{
	%% UInt32技能ID
	skillID = 0
}).

%% 
%% //成长后女神觉醒
-define(GS2U_WakeInfo,1406).
-record(pk_GS2U_WakeInfo,{
	%% WakeInfo
	wakeInfo
}).

%% 
%% //女神觉醒信息列表
-define(GS2U_WakeInfoList,20072).
-record(pk_GS2U_WakeInfoList,{
	%% WakeInfo
	wakeInfoList = []
}).

%% 
%% //召唤女神
-define(U2GS_CallGoddess,56485).
-record(pk_U2GS_CallGoddess,{
	%% Byte
	cardID = 0
}).

%% 
%% //解锁状态
-define(U2GS_ChangeState,37535).
-record(pk_U2GS_ChangeState,{
	%% Byte
	cardID = 0,
	%% Byte
	state = 0
}).

%% 
%% //女神觉醒一键升级
-define(U2GS_OnKeyUpWakeInfo,59979).
-record(pk_U2GS_OnKeyUpWakeInfo,{
	%% Byte女神卡片ID
	cardID = 0
}).

%% 
%% //解锁女神
-define(U2GS_UnlockCard,32154).
-record(pk_U2GS_UnlockCard,{
	%% Byte
	cardID = 0
}).

%% 
%% //解锁状态
-define(U2GS_UnlockState,10823).
-record(pk_U2GS_UnlockState,{
	%% Byte
	cardID = 0,
	%% Byte
	state = 0
}).

%% 
%% //女神觉醒升级
-define(U2GS_UpGradeWakeInfo,44728).
-record(pk_U2GS_UpGradeWakeInfo,{
	%% Byte女神卡片ID
	cardID = 0
}).

%% 
%% //激活或者成长女神觉醒
-define(U2GS_UpWakeInfo,43827).
-record(pk_U2GS_UpWakeInfo,{
	%% Byte女神卡片ID
	cardID = 0,
	%% UInt16物品数量
	num = 0
}).

-record(pk_WakeInfo,{
	%% Byte女神卡片ID
	cardID = 0,
	%% Byte觉醒等级 0:表示已经激活
	level = 0,
	%% UInt16当前升级数量	
	curNum = 0,
	%% UInt16以100为基数 99就是 99%， =100可以解锁，10000已经解锁
	activeProgress = 0,
	%% Byte解锁的最大状态
	unlockStateMax = 0,
	%% Byte使用状态
	curState = 0
}).

%% 
%% //初始化
-define(GS2U_InitWarriorTrialAck,47257).
-record(pk_GS2U_InitWarriorTrialAck,{
	%% UInt16历史最高完成关卡
	record = 0,
	%% UInt16当前关卡
	cur = 0,
	%% UInt16最高关卡
	max = 0,
	%% UInt32铁血硬币数量
	coin = 0,
	%% UInt16 已领奖的最高关卡
	maxReward = 0,
	%% UInt32 当前关卡已通关角色数量
	curCount = 0
}).

%% 
%% //进副本时候，给客户端初始信息
-define(GS2U_InitWarriorTrialMissionInfo,19866).
-record(pk_GS2U_InitWarriorTrialMissionInfo,{
	%% UInt16关卡ID
	missionID = 0,
	%% UInt16最迟完成时间
	time = 0
}).

%% 
%% //扫荡成功
-define(GS2U_SweepWarriorTrialSuccess,59279).
-record(pk_GS2U_SweepWarriorTrialSuccess,{
	%% UInt16历史最高完成关卡
	record = 0,
	%% UInt16当前扫荡关卡
	cur = 0,
	%% UInt32铁血硬币数量
	coin = 0
}).

%% 
-define(GS2U_WarriorFirstKillReward_Ack,16801).
-record(pk_GS2U_WarriorFirstKillReward_Ack,{
	%% Boolean 是否领奖成功（正常流程下必然成功，失败没有ErrorCode）
	isOK = false,
	%% UInt16 已领奖的最高关卡
	maxReward = 0,
	%% UInt16领奖开始关卡
	start = 0
}).

%% 
%% //挑战结果
-define(GS2U_WarriorTrialSuccess,6523).
-record(pk_GS2U_WarriorTrialSuccess,{
	%% Boolean
	result = false
}).

%% 
%% //挑战关卡
-define(U2GS_BeginWarriorTrial,59331).
-record(pk_U2GS_BeginWarriorTrial,{
}).

%% 
%% //完成所有关卡
-define(U2GS_CompleteWarriorTrail,9471).
-record(pk_U2GS_CompleteWarriorTrail,{
	%% UInt16地图ID
	mapID = 0
}).

%% 
%% //扫当关卡
-define(U2GS_SweepWarriorTrial,38274).
-record(pk_U2GS_SweepWarriorTrial,{
	%% UInt16关卡ID
	mapID = 0
}).

%% 
%% // 一键扫荡
-define(U2GS_SweepWarriorTrial_OneKey_Request,47522).
-record(pk_U2GS_SweepWarriorTrial_OneKey_Request,{
}).

%% 
%% // 请求领取首通奖励
-define(U2GS_WarriorFirstKillReward_Request,1249).
-record(pk_U2GS_WarriorFirstKillReward_Request,{
	%% UInt16 关卡ID
	id = 0
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% //请求初始化
-define(U2GS_WarriorTrialInit,6210).
-record(pk_U2GS_WarriorTrialInit,{
}).

-endif. %%NetmsgRecords
