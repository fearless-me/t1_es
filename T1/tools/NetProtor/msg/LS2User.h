//////////////////////////////////////////////////////////////////////////
//<-发出去     ;      ->收消息
/////////////////////////////////////////////////////////////////////////
// LoginServer 2 User
struct LS2U_LoginResult <-
{
	int8	result;				// 0为登录成功，非0为登录失败原因
	uint64	accountID;
	string	identity;
	string  msg;					//不为空，手机必须展示
};
//-define( LoginResultSucc, 0 ).
//-define( LoginResultSearchFail, 1 ).
//-define( LoginResultAccountDenied, 2 ).%%黑名单
//-define( LoginResultDbErr, 9 ).

struct GameServerInfo
{
	int16  lineid;
	string  name;
	string	ip;
	int16	port;
	int8	state;
};
//#define GameServer_State_UnCheckPass			0		//正常
//#define GameServer_State_CheckPass				1		//火爆
//#define GameServer_State_Running					2		//爆满
//#define GameServer_State_ForbidLogin			3		//维护
//#define GameServer_State_Closed					4		//维护
//#define GameServer_State_SpecCanVisable			5	//测试人员可见
struct LS2U_GameLineServerList <-
{
	vector<GameServerInfo>	gameServers;
};
//请求线路列表
struct U2LS_RequestGSLine ->
{	
}

struct LS2U_LoginQue <-
{
	uint64	currentNumber;//自己在队列中的序号
};


//gs在用GameServerInfo
struct GS2U_ChangeLineResponse <-
{
	vector<GameServerInfo>	gameServers; //线路列表
	string	identity; //验证码
};


//////////////////////////////////////////////////////////////////////////
// User 2 LoginServer

struct U2LS_Login_Normal ->
{
	string	platformAccount;		// 平台帐号（游戏内帐号用平台id来绑定创建）
	string 	platformName;			// 平台名
	string	platformNickName;		// 平台昵称，没有就填空串
	int64	time;
	string	sign;
	string	deviceId;				// 程序生成，每个设备不能重复
	string	imei;					// 手机串号
	string	idfa;					// 苹果推号
	string	mac;					// 网卡号
	string	extParam				// 扩展参数串
	int		versionRes;				// 资源版本
	int		versionExe;				// 执行程序版本
	int		versionGame;			// 游戏版本？？
	int		versionPro;				// 协议版本
};

// funcell web消息
struct Web2LS_Crypto ->
{
	string	bodyJsonStr;		// 加密消息体
};
// funcell web消息
struct Web2LS_Normal ->
{
	string	bodyJsonStr;		// 未加密消息体
};

// funcell 回复web消息
struct LS2Web_CryptoAck <-
{
	string	bodyJsonStr;		// 加密消息体
};

// funcell 回复web消息
struct LS2Web_NormalAck <-
{
	string	bodyJsonStr;		// 未加密消息体
};

