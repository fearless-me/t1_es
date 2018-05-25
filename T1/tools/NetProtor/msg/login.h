//////////////////////////////////////////////////////////////////////////
//<-发出去     ;      ->收消息
/////////////////////////////////////////////////////////////////////////

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
	int8	result;				// 0为登录成功，非0为登录失败原因
	uint64	accountID;
	string	identity;
	string  msg;					//不为空，手机必须展示
};


struct UserPlayerData
{
	uint64	roleID;			// 角色ID
	string	name;			// 角色名
	int		level;			// 等级
	int32	wingLevel;		// 翅膀等级
	int8	camp;			// 阵营
	int8	race;			// 种族
	uint32	career;			// 职业
	int8	sex;			// 性别
	int32	head;			// 头
	uint16	mapID;			// 角色所在当前地图ID
	uint16	oldMapID;		// 角色之前所在地图ID
};

struct GS2U_UserPlayerList <-
{
	vector<UserPlayerData>	info;
};

struct U2GS_RequestCreatePlayer ->
{
	string	name;				// 名字
	int8	camp;				// 阵营
	uint32	career;				// 职业
	int8	race;				// 种族
	int8	sex;				// 性别
	int32	head;				// 头
};

struct GS2U_CreatePlayerResult <-
{
	int		errorCode;
	uint64  roleID;
};

struct U2GS_SelPlayerEnterGame ->
{
	uint64	roleID;
};

struct GS2U_SelPlayerResult <-
{
	int result;
};

struct U2GS_RequestDeletePlayer ->
{
	uint64	roleID;
};

struct GS2U_DeletePlayerResult <-
{
	uint64	roleID;
	int		errorCode;
};

struct U2GS_ChangeMap ->
{
	int32 newMapID;
	float fX,
	float fY
};

struct GS2U_GoNewMap <-
{
	int32 tarMapID;
	float fX,
	float fY
};


struct LookInfoMonster
{
	uint64	code;
	uint	id;					// 怪物 ID	
	float	x;					// 怪物坐标
	float	y;
	float	rotW;				//旋转坐标W
	float	targetX;			// 怪物移动的目标点X
	float	targetY;			// 怪物移动的目标点Y
	float	move_speed;			// 怪物移动速度
	float   attack_speed;       // 怪物攻击速度
	uint8	moveStatus;			// 怪物现在是在走还是在跑（客户端用于播放动画）
	uint8	type;				// 类型 0:普通怪 1:载体怪
	uint8	hp_per;				// 当前血量百分比
	int8	camp;			    // 阵营
	uint64	usercode;			// 归宿code
	uint64	groupID;			// 怪物所属分组ID
	uint64	guildID;			// 怪物所属军团ID
	string  name;				// 名字
	uint16	level;				//怪物等级
};

struct GS2U_MonsterList <-
{
	vector<LookInfoMonster> monster_list;	// 视野范围内怪物列表
};

struct LookInfoPlayer
{
	uint64	code;				//流水号
	uint64	roleID;				//角色ID
	string  name;				//名字
	float	x;					//坐标X
	float	y;					//坐标Y
	int8	race;				// 种族
	uint32	career;				//职业
	int8	sex;				// 性别
	int8	camp;			    //阵营
	int32	head;			    //头
	float	move_speed;			//移动速度
	int16	level;				//当前等级	
	uint8   hp_per;				//当前血量百分比
    uint16  petID;              //坐骑外观ID （0 表示没有坐骑或者下马状态）
	uint64	otherCode;			//双人坐骑对方的Code （0 表示没有）	
	string	servername;			// 当前服名
	string	myServerName;		// 归属服名
	bool		isInCross;			// 是否在跨服
	uint8   pkMode;             //玩家Pk状态
};


// 玩家外观信息
struct GS2U_LookInfoPlayer <-
{
	vector<LookInfoPlayer> player_list;
};

