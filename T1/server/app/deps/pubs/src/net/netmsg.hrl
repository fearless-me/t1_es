%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-ifndef(netmsg).
-define(netmsg,1).

-define(ProtoVersion,621).

%% 
%% //gs在用GameServerInfo
-define(GS2U_ChangeLineResponse,15641).
-record(pk_GS2U_ChangeLineResponse,{
	%% GameServerInfo线路列表
	gameServers = [],
	%% String验证码
	identity = ""
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
	versionPro = 0
}).

%% 
%% //请求线路列表
-define(U2LS_RequestGSLine,39508).
-record(pk_U2LS_RequestGSLine,{
	%% Int32
	lineID = 0
}).

-endif. %%NetmsgRecords
