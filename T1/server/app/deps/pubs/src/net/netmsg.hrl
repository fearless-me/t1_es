%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-ifndef(netmsg).
-define(netmsg,1).

-define(ProtoVersion,623).

%% 
-define(GS2U_CreatePlayerResult,45054).
-record(pk_GS2U_CreatePlayerResult,{
	%% Int32
	errorCode = 0,
	%% UInt64
	roleID = 0
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
-define(GS2U_GoNewMap,46304).
-record(pk_GS2U_GoNewMap,{
	%% Int32
	tarMapID = 0,
	%% Single
	fX = 0.0,
	%% Single
	fY = 0.0
}).

%% 
-define(GS2U_LoginResult,22162).
-record(pk_GS2U_LoginResult,{
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
%% // 玩家外观信息
-define(GS2U_LookInfoPlayer,18166).
-record(pk_GS2U_LookInfoPlayer,{
	%% LookInfoPlayer
	player_list = []
}).

%% 
-define(GS2U_MonsterList,32656).
-record(pk_GS2U_MonsterList,{
	%% LookInfoMonster 视野范围内怪物列表
	monster_list = []
}).

%% 
-define(GS2U_SelPlayerResult,42464).
-record(pk_GS2U_SelPlayerResult,{
	%% Int32
	result = 0
}).

%% 
-define(GS2U_UserPlayerList,18582).
-record(pk_GS2U_UserPlayerList,{
	%% UserPlayerData
	info = []
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
	%% String 名字
	name = "",
	%% UInt16怪物等级
	level = 0
}).

-record(pk_LookInfoPlayer,{
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
	pkMode = 0
}).

%% 
-define(U2GS_ChangeMap,4914).
-record(pk_U2GS_ChangeMap,{
	%% Int32
	newMapID = 0,
	%% Single
	fX = 0.0,
	%% Single
	fY = 0.0
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% //<-发出去     ;      ->收消息
%% /////////////////////////////////////////////////////////////////////////
-define(U2GS_Login_Normal,58883).
-record(pk_U2GS_Login_Normal,{
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
	versionPro = 0
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
-define(U2GS_SelPlayerEnterGame,56497).
-record(pk_U2GS_SelPlayerEnterGame,{
	%% UInt64
	roleID = 0
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
	oldMapID = 0
}).

-endif. %%NetmsgRecords
