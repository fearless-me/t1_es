%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-ifndef(netmsg).
-define(netmsg,1).

-define(ProtoVersion,617).

%% 
%% //gs在用GameServerInfo
-define(GS2U_ChangeLineResponse,15641).
-record(pk_GS2U_ChangeLineResponse,{
	%% GameServerInfo线路列表
	gameServers,
	%% String验证码
	identity
}).

-record(pk_GameServerInfo,{
	%% Int16
	lineid,
	%% String
	name,
	%% String
	ip,
	%% Int16
	port,
	%% SByte
	state
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
	gameServers
}).

%% 
-define(LS2U_LoginQue,25241).
-record(pk_LS2U_LoginQue,{
	%% UInt64自己在队列中的序号
	currentNumber
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% //<-发出去     ;      ->收消息
%% /////////////////////////////////////////////////////////////////////////
%% // LoginServer 2 User
-define(LS2U_LoginResult,4461).
-record(pk_LS2U_LoginResult,{
	%% SByte 0为登录成功，非0为登录失败原因
	result,
	%% UInt64
	accountID,
	%% String
	identity,
	%% String不为空，手机必须展示
	msg
}).

%% 
%% // funcell 回复web消息
-define(LS2Web_CryptoAck,1690).
-record(pk_LS2Web_CryptoAck,{
	%% String 加密消息体
	bodyJsonStr
}).

%% 
%% // funcell 回复web消息
-define(LS2Web_NormalAck,1056).
-record(pk_LS2Web_NormalAck,{
	%% String 未加密消息体
	bodyJsonStr
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% // User 2 LoginServer
-define(U2LS_Login_Normal,41532).
-record(pk_U2LS_Login_Normal,{
	%% String 平台帐号（游戏内帐号用平台id来绑定创建）
	platformAccount,
	%% String 平台名
	platformName,
	%% String 平台昵称，没有就填空串
	platformNickName,
	%% Int64
	time,
	%% String
	sign,
	%% String 程序生成，每个设备不能重复
	deviceId,
	%% String 手机串号
	imei,
	%% String 苹果推号
	idfa,
	%% String 网卡号
	mac,
	%% String 扩展参数串
	extParam,
	%% Int32 资源版本
	versionRes,
	%% Int32 执行程序版本
	versionExe,
	%% Int32 游戏版本？？
	versionGame,
	%% Int32 协议版本
	versionPro
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
	bodyJsonStr
}).

%% 
%% // funcell web消息
-define(Web2LS_Normal,889).
-record(pk_Web2LS_Normal,{
	%% String 未加密消息体
	bodyJsonStr
}).

-endif. %%NetmsgRecords
