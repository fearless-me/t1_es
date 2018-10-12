//////////////////////////////////////////////////////////////////////////
//<-发出去     ;      ->收消息
// 不用使用int uint long 
// 支持使用 string float int32 uint32 int64 uint64
/////////////////////////////////////////////////////////////////////////
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
struct U2GS_Login_Normal ->
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
	int32	versionRes;				// 资源版本
	int32	versionExe;				// 执行程序版本
	int32	versionGame;			// 游戏版本？？
	int32	versionPro;				// 协议版本
};

struct GS2U_LoginResult <-
{
	int32	result;				// 0为登录成功，非0为登录失败原因
	uint64	aid;
	string	identity;
	string  msg;					//不为空，手机必须展示
};


struct UserPlayerData
{
    uint64	uid;			// 角色ID
	string	name;			// 角色名
	int32		level;			// 等级
	int32	wingLevel;		// 翅膀等级
	int32	camp;			// 阵营
	int32	race;			// 种族
	uint32	career;			// 职业
	int32	sex;			// 性别
	int32	head;			// 头
	uint32	mapID;			// 角色所在当前地图ID
	uint32	oldMapID;		// 角色之前所在地图ID
};

struct GS2U_UserPlayerList <-
{
	vector<UserPlayerData>	info;
};

struct U2GS_RequestCreatePlayer ->
{
	string	name;				// 名字
	int32	camp;				// 阵营
	uint32	career;				// 职业
	int32	race;				// 种族
	int32	sex;				// 性别
	int32	head;				// 头
};

struct GS2U_CreatePlayerResult <-
{
	int32		errorCode;
	uint64  uid;
};

struct U2GS_SelPlayerEnterGame ->
{
	uint64	uid;
};

struct GS2U_SelPlayerResult <-
{
	int32 result;
};

struct U2GS_RequestDeletePlayer ->
{
	uint64	uid;
};

struct GS2U_DeletePlayerResult <-
{
	uint64	uid;
	int32		errorCode;
};


//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 

