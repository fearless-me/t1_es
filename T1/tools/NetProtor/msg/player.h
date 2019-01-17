// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

struct GS2U_SessionKey <-
{
	string key;
};

struct U2GS_SessionKeyAck ->
{
	string oldKey;
	string newKey;
};

struct U2GS_RequestLogin ->
{
	uint64	accountID;				//账号ID
	string	key;					//随机Key
	int		protocolVer;			//协议版本号
};

//打开充值面板时，取出玩家已经参加了的充值项id
struct U2GS_RequestRechargeHasGiftIDList ->
{
};
struct RechargeDoubleConf
{
	uint32	id;
	float	payMoney;
};

struct GS2U_RequestRechargeHasGiftIDListAck <-
{
	vector<uint32>	takenIDList;						//本玩家已经领过的id
	vector<RechargeDoubleConf>	confIDList;				//双倍的配置列表
};

//玩家充值请求
struct U2GS_RequestRecharge ->
{
	string	funcellAccessToken;					//账号accessToken很长一串
	string	funcellCilentID;					//如173:18072:1.1.2:xiaomi
	string	funcellOrderID;						//funcell的订单号，服务器以些为准，会去重
	string	extArgs;							//扩展参数，如果有，就组装成json
};

//玩家充值请求ACK,订单处理成功了才发给client
struct GS2U_RequestRechargeAck <-
{
	string	funcellOrderID;						//funcell的订单号，服务器以些为准，会去重
	float	moneyNun;							//金额
};	

struct U2GS_SelPlayerEnterGame ->
{
	uint64	roleID;
};

struct PlayerDailyCount
{
	uint32 dailyType;
	uint32 dailyID;
	uint32 dailyValue;
}

struct GS2U_SendPlayerDailyCountList <-
{
	vector<PlayerDailyCount> playerDailyCountList;
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

struct U2GS_RequestDeletePlayer ->
{
	uint64	roleID;
};

struct GS2U_LoginResult <-
{
	int		result;
};

struct GS2U_SelPlayerResult <-
{
	int result;
};

//玩家身上可广播的装备，目前可广播的装备有武器、副手、盔甲、靴子四种类型的装备
struct visibleEquip
{
	uint equipID;  //装备ID
	uint8 quality; //当前品质值
};

struct refineLevel
{
	uint8 type;
	uint8 level;
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
	bool    canRename;       // 是否可以修改名字
	vector<visibleEquip> visible_equips;//可见的装备
	vector<uint16> fashionList;//身上时装列表
	vector<refineLevel>	refine_levels;//装备精炼等级
};

struct GS2U_UserPlayerList <-
{
	int32 unlockNewRace;	//是否解锁新种族
	vector<UserPlayerData>	info;
};

struct GS2U_CreatePlayerResult <-
{
	int		errorCode;
	uint64  roleID;
};

struct GS2U_DeletePlayerResult <-
{
	uint64	roleID;
	int		errorCode;
};

//心跳包(这个只用于检测外挂)
struct U2GS_HeartBeat ->
{
	uint time;			// 客户端自行维护的当前时间
	uint version;		// 版本号，客户端上传的版本号必须是服务器下发的，否则抛弃
};

//心跳包返回，用于网络延迟(这个只用于检测外挂)
struct GS2U_HeartBeatAck <-
{
	uint time;			// 同步给客户端的CD
	uint version;		// 服务器告诉客户端当前版本号
};

//客户端真正的心跳包，只是客户端定时发给客户端
struct U2GS_HeartBeatReal ->
{
	uint time;			// 客户端自行维护的当前时间
};

//请求查询女神的code
struct U2GS_RequestGoddessCode->
{
};

//返回女神的code
struct  GS2U_RequestGoddessCodeAck <-
{
	uint64 goddessCode;	//	女神code
};

// 客户端加载资源完成，可以接收服务器玩家数据
struct U2GS_EnteredMap ->
{
};

// 数据加载完成，玩家进入到地图，可以接收其它玩家消息
struct U2GS_LoadedMap ->
{
};

// 货币初始化
struct MoneyInit
{
	uint8 moneyType;
	uint value;
};

struct RoleBaseInfo
{
	uint64	code;
	uint64	roleID;
	string	name;
	string	servername;			// 当前服名
	string	myServerName;		// 归属服名
	bool		isInCross;			// 是否在跨服
	float	x;
	float	y;
	uint	head;				//头
	int16	level;				//等级
	int8	camp;				//阵营
	uint32	career;				//职业
	int8	race;			// 种族
	int8	sex;			// 性别
	int8	vip;				//VIP
	uint8   hp_per;				//当前血量百分比
	uint	exp;				//当前经验
	uint	maxExp;				//当前等级最大经验
	uint	cur_hp;				//当前血量
	uint 	max_hp;				//血量最大值
	uint	mp;					//当前魔法值
	uint16  mountID;            //坐骑外观ID （0 表示没有坐骑或者下马状态）
	uint64	otherCode;			//双人坐骑对方的Code （0 表示没有）	
	uint8   pkMode;             //玩家Pk状态
	uint16  maxCourage;			//最大怒气
	vector<MoneyInit> moneys;	//货币初始化
	vector<visibleEquip> visible_equips;//玩家可见的装备
	vector<refineLevel> refine_levels;//装备精炼等级（装备部位强化等级)
};

struct GS2U_PlayerBlood <-
{
    uint  blood;
};

struct GS2U_PlayerBaseInfo <-
{
	RoleBaseInfo baseInfo;
};

struct BattleProp =
{
	uint8 index;		// 战斗属性号
	float value;		// 战斗属性值
};

struct BuffBaseInfo =
{
    uint64          buffUID;       //Buff唯一标识符
	uint            buffID;        //BuffID
	uint			time;		   //Buff持续时长
};

// 更新某项战斗属性
struct GS2U_BattlePropList <-
{
	uint64					code;
	uint16					id;
	vector<BattleProp>		battleProp;
};

// 更新所有战斗属性
struct GS2U_AllBattleProp <-
{
	uint64			code;
	vector<float>	battlePropInfo;		// 战斗属性值，下标依次为有效属性索引
};

struct PosInfo =
{
	float x;
	float y;
};

// 附近对象信息
struct ObjBrief
{
	uint64 code;
	string  name;		//名字
	float	x;			//坐标X
	float	y;			//坐标Y
}

struct GS2U_ObjBrief <-
{
	int8 obj_type;			// 对象类型
	vector<ObjBrief> objs;	// 对象列表
}

// 获取对象的详细信息，返回按其它常规协议
struct U2GS_RequestObjInfo ->
{
	int8 obj_type;			// 对象类型
	vector<uint64> codes;	// 对象列表
}

// 玩家外观信息
struct GS2U_LookInfoPlayer <-
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
	vector<uint64> pet_list;		//玩家召唤的宠物code列表
	vector<PosInfo>	move_list;	//移动目标点列表
	vector<BuffBaseInfo> buffs; //当前buff列表
	vector<visibleEquip> visible_equips;//别的玩家可见的装备
	vector<refineLevel>	 refine_levels; //精炼等级（装备部位强化等级）
};


// 整形属性
struct PropInt =
{
	uint16	index;	// 属性索引
	int	value;		// 属性值
};

// 整形64属性
struct PropInt64 =
{
	uint16	index;	// 属性索引
	uint64	value;	// 属性值
};

// 浮点属性
struct PropFloat =
{
	uint16	index;	// 属性索引
	float	value;	// 属性值
};

// 字符串属性
struct PropString
{
	uint16	index;	// 属性索引
	string	value;	// 属性值
};

// 属性同步
struct GS2U_PropSync <-
{
	uint64	code;				// 属性改变的角色流水号
	vector<PropInt> ints;		// 整形属性集合
	vector<PropInt64> int64s;	// 64位整形属性集合
	vector<PropFloat> floats;	// 浮点属性集合
	vector<PropString> strs;	// 字符串属性集合
};

//穿装备时广播给周围玩家
struct GS2U_BroadcastVisibleEquipOn <-
{
	uint64 code;		    //流水号
	visibleEquip equip; //穿上的可见装备
};

//卸装备时广播给周围玩家
struct GS2U_BroadcastVisibleEquipOff <-
{
	uint64 code;	    //流水号
	uint type;      //卸下装备type, 部位
};

//玩家仇恨
struct GS2U_HateInfo <-   
{
	uint64    code;               
	uint64    hateCode;          //仇恨目标code
    int8    opreate;           //1：新增  2:删除
};

struct GS2U_TransferNewPos <-		//好友传送位置（同一张地图）
{
	uint64    code;
	PosInfo pos;
};

struct U2GS_MoveTo    ->
{
	uint64  code;                     //移动的目标Code
	float posX;						//移动的目标点X
	float posY;						//移动的目标点Y
	vector<PosInfo> posInfos;		//包括起点和目标点在内所有路径点
};

struct U2GS_StopMove ->
{
    uint64  code;                      //移动的目标Code
	float posX;						//停止时的坐标点X
	float posY;						//停止时的坐标点Y
};

struct GS2U_ShiftTo    <-
{
	uint64  code;                     //瞬移目标Code
	float posX;						//瞬移的目标点X
	float posY;						//瞬移的目标点Y
};
struct GS2U_StopMove <-
{
	uint64  code;						// 停止      
	float posX;						// 停止到的位置X
	float posY;						// 停止到的位置Y
};

struct GS2U_MoveInfo	<-
{
	uint64	code;
	float	posX;				//移动的目标点X
	float	posY;				//移动的目标点Y
	vector<PosInfo> posInfos;	//包括起点和终点在内的所有路径点
};

struct U2GS_DashTo ->
{
	float posX;						// 冲刺所到的目标点
	float posY;						// 冲刺所到的目标点
};

struct GS2U_DashTo <-
{
	uint64  code;						// 接收远程玩家信息      
	float posX;						// 冲刺所到的目标点
	float posY;						// 冲刺所到的目标点
};

struct Any_ChangeMap <->
{
	uint	mapId;  
	uint	lineID;	// 线路ID	
	float	x;
	float	y;
};

struct C2S_ChangeMap ->
{
	uint	mapId;
	string	waypointName;
};

struct U2GS_TransferMap ->
{
	uint	mapId;
	string	waypointName;
};

struct U2GS_DigTransferMap ->
{
	uint	mapId;
	string  waypointName;
};

struct Any_PlayerLogout <->
{
	uint64	code;
	uint8	reason;		// 退出的原因码
};

// 同步玩家的当前血量百分比（非战斗状态发送给周围玩家，不包括自己）
struct GS2U_BroadcastPlayerHpPC <-
{
	uint64	code;				// 玩家流水号
	uint8	hpPC;				// 玩家的血量百分比
};

// 同步玩家的当前血量（非战斗状态只发送给自己）
struct GS2U_PlayerHp <-
{
	uint64    code;				// 玩家Code
	uint	hp;					// 玩家的血量
};

// 同步玩家的职业相关的特殊属性（能量）（非战斗状态只发送给自己，具体值）
struct GS2U_PlayerSp <-
{
	// 神圣之力值 （骑士专属）
	// 秘法之力值 （法师专属）
	// 恶魔之怒值 （刺客专属）
	// 暗影之力值 （收割者专属）
	uint	sp;				// 玩家的能量值
};

// 同步玩家体力值
struct GS2U_PlayerPhys <-
{
    uint   phys;           //玩家体力值
};

//同步玩家怒气值
struct GS2U_PlayerCour <-
{
	uint   cour;		   //玩家怒气值
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
	vector<BuffBaseInfo> buffs; //当前buff列表
	string  name;				// 名字
	uint16	level;				//怪物等级
};

struct GS2U_MonsterList <-
{
	vector<LookInfoMonster> monster_list;	// 视野范围内怪物列表
};

struct LookInfoPet
{
	uint64	code;				// 宠物 Code
	uint	id;					// 宠物 ID
	string  name;				// 名字
	uint16	level;				// 宠物等级
	uint64	playerCode			// 主人 Code
	float	x;					// 宠物坐标
	float	y;
	float	targetX;			// 宠物移动的目标点X
	float	targetY;			// 宠物移动的目标点Y
	float	move_speed;			// 宠物移动速度
	uint8	hp_per;				// 当前血量百分比
	int8	status;				// 宠物状态 7:隐身状态
	int8	camp;			    // 阵营
	uint8   pkMode;             // 玩家Pk状态  
	uint8	rawLvl;				// 宠物转生等级
	vector<BuffBaseInfo> buffs; // 当前buff列表
};

struct GS2U_PetList <-
{
	vector<LookInfoPet> pet_list;	// 视野范围内宠物列表
};

// 出战宠物的转生等级变化
struct GS2U_PetRawLvlChange <-
{
	uint64 code;
	uint8 rawLvl;				// 宠物转生等级
};

// 出战宠物的等级变化
struct GS2U_PetLvlChange <-
{
	uint64 code;
	uint16 level;				// 宠物等级
};

struct LookInfoNpc
{
	uint64 code;			
	uint id;			// Npc ID

	float x;			// Npc 坐标
	float y;
	float rotW;			//旋转坐标W
	
	string name;		// 名称
	uint actionStatus;	// npc的动作状态
	string title;		// npc称号(如果为空，则客户端自己取配置中的称号)
};

struct GS2U_NpcList <-
{
	vector<LookInfoNpc> npc_list;	// 视野范围内 Npc 列表
};

// npc的动作状态改变
struct GS2U_NpcStatusChange <-
{
	uint64 code;
	uint actionStatus;	// npc的动作状态
};

struct BlockStatusChange
{
	string blockName;	// 阻挡Name
	uint blockStatus;	// 阻挡的动作状态
};

// 阻档状态改变
struct GS2U_BlockStatusChange <-
{
	vector<BlockStatusChange> changes;
};

// 对象的金钱变化
struct MoneyChanges
{
	uint64 code;
	vector<MoneyInit> moneys;	//货币变化列表
};
struct GS2U_MoneyChanges <-
{
	vector<MoneyChanges> changes;
};

// 角色死亡(自己死亡，不广播)
struct GS2U_PlayerDead <-
{
	uint64 deadTime;	// 角色死亡时服务器时间，单位秒
	uint64 code;			// 角色Code
	uint normalReviveCDTime;	// 营地普通复活CD时间，单位秒
	MoneyInit reviveCost;		// 立即原地复活消耗
	uint64 attackCode;			// 攻击者Code
	string attackName;			// 攻击者名字
	vector<MoneyInit> lostMoney;	// 丢失金钱列表
	uint reviveType;	// 复活类型,0：死亡后不弹复活界面，实际为营地复活;1：营地复活;2：自动复活倒计时;4：原地复活;多项复活类型，则相加。
	uint reviveCount;   // 角色已经复活次数
};

// 客户端请求复活
struct U2GS_RequestRevive ->
{
	uint reviveType;	// 1：普通复活；2：收费复活；3：自动复活
};

// 广播给复活玩家的周围（不包括复活玩家自己）的复活消息
struct GS2U_BroadcastPlayerRevive <-
{
	uint64	code;			//角色Code
	uint16	mapId;			//地图ID
	float	x;				//坐标X
	float	y;				//坐标Y
	uint8	hpPC;			//血量百分比
};

// 广播给复活玩家的队友复活消息
struct GS2U_BroadcastTeamRevive <-
{
	uint64	roleID;			//角色ID
	uint16	mapId;			//地图ID
	float	x;				//坐标X
	float	y;				//坐标Y
	uint8	hpPC;			//血量百分比
};

// 发送给复活玩家自己的消息
struct GS2U_PlayerRevive <-
{
	uint16	mapId;			//地图ID
	float	x;				//坐标X
	float	y;				//坐标Y
	uint	curHp;			//当前血量
	uint	maxHp;			//最大血量
	uint	curPower;		//当前能量
	uint    curPhys;        //当前体力
};

// 广播物件消失
struct GS2U_BroadcastDisapear <-
{
	vector<uint64>	code;
};

// 广播物件消失(客户端将处理为立即消失，而不是在队列里等待tick处理)
struct GS2U_BroadcastDisapearFast <-
{
	vector<uint64>	code;
};

// 聊天消息(服务端发送)
struct GS2U_Chatinfo <-
{
	int8 channel;			//频道
	uint64 senderID;		//发送者ID
	uint64 senderCode;		//发送者Code
	string senderName;		//发送者Name
	int8   senderRace;		//种族
	uint32 senderCareer;	//职业
	int8   senderSex;		//性别
	int32  senderHead;		//头
	uint16 frameID;         //头像框
	int16  senderLevel;		//当前等级
	int8 senderVip;			//发送者vip等级
	string content;			//内容
};

// 聊天消息(客户端发送)
struct U2GS_ChatInfo ->
{
	int8 channel;			//频道
	uint64 receiverID;		//接收者ID
	string receiverName;	//接收者Name
	string content;			//内容
};

// 上传语音数据
struct U2GS_ChatVoice ->
{
	uint8 count;	//一条消息总段数
	uint8 index;	//分段索引
	uint64 playerID;
	uint32 key;		// playercode + timesec
	int8 channel;			//频道
	vector<uint8> data; 	// 音频数据
}

// 请求语音数据
struct U2GS_ReqChatVoice ->
{
	uint64 playerID;	// playercode + timesec
	uint32 key;
}

// 下载语音数据
struct GS2U_RespChatVoice <-
{
	uint8 count;	//一条消息总段数
	uint8 index;	//分段索引
	uint64 playerID;		// playercode + timesec
	uint32 key;
	vector<uint8> data; 	// 音频数据
}

// 下载语音数据
struct GS2U_RespChatVoiceError <-
{
	uint64 playerID;		// playercode + timesec
	uint32 key;
	uint8 errorCode;// 错误码
}

// 已经获得的收费表情与动作列表(上线发给客户端，或者新增某一个时单独发给客户端)
struct GS2U_HaveIconAndActionList <-
{
	vector<uint> icons;		// 表情列表
	vector<uint> actions;	// 动作列表
};

// 显示头顶表情符号
struct U2GS_ShowHeadEmoticonIcon ->
{
	uint iconIndex;	// 符号索引
};

// 显示动作
struct U2GS_ShowAction ->
{
	uint actionIndex;	// 符号索引
};

// 显示动作
struct GS2U_ShowAction <-
{
	uint64 playerCode;
	uint actionIndex;	// 符号索引
};

//返回聊天错误原因
struct GS2U_ChatErrorResult <-
{
	int reason;
};

struct GS2U_Error <-
{	
	uint	errorCode;		//错误号
	vector<string> params;	//ErrorCode附加的参数，可能为空
};

// 通常客户端需要一个明确的返回协议，用于处理界面上的显示
// 因此仅用ErrorCode来提示错误信息是不足的
// 而仅用自定义返回协议又没有复用到ErrorCode的提示逻辑
// 因此该消息模拟GS2U_Error，用于嵌套在其它协议里反馈给客户端
struct Error
{	
	uint            errorCode;  // 错误号
	vector<string>  params;     // ErrorCode附加的参数，可能为空
};

struct GS2U_TipsError <-
{
	//错误号
	uint	errorCode;
};
//提示消息
struct GS2U_TipsString <-
{
	uint8  type;			//提示显示类型：0=tips，1=聊天-系统，2=跑马灯，3=喇叭消息，4=messagebox
	string tips;			//提示的字符串
	vector<string> params;	//附带的参数
};
struct GS2U_PlayerAddExp <-
{
	uint	curExp;				//当前经验，客户端自己使用发送的当前经验与之前的经验差作为增加经验
	int		addExp;				//增加经验
	int		addPercent;		//杀怪经验相关加成百分点
};

struct GS2U_PlayerLevelUp <-
{
	uint64	code;				//玩家流水号
	uint	curExp;				//当前经验
	uint	maxExp;				//最大经验
	uint	addExp;				//增加经验
	int		addPercent;		//杀怪经验相关加成百分点
	uint8	level;				//等级
};

struct GS2U_PlayerChangedWealth <-
{
	uint	type;				//财富类型
	uint32	wealth;				//财富值
	uint16	reason;				//原因码
};

struct MissionObjectInfo
{
	uint64 code;			
	uint id;			// 采集对象 ID
	float x;			// 采集对象 坐标
	float y;
	float rotW;			//旋转坐标W
};

struct GS2U_MissionObjectList <-
{
	vector<MissionObjectInfo> missionObj_list;	// 视野范围内 采集对象 列表
};

struct TaskUseItem
{
	uint64 code;			
	uint id;			// 使用物品 ID
	float x;			// 使用物品 坐标
	float y;
	float rotW;			//旋转坐标W
};

struct GS2U_TaskUseItemList <-
{
	vector<TaskUseItem> useItemlist;	// 视野范围内 使用物品 列表
};

//获取好友坐标
struct U2GS_getFriendPos ->
{
	uint64 friendID;		//好友ID
};

struct U2GS_Transfer2NewPos ->	//传送至一个新位置
{
	uint	mapID;			//地图ID
	float	x;				//新的坐标
	float	y;
};

//瞬间移动，成功返回pk_GS2U_TransferNewPos
struct U2GS_Telesport ->
{
	float	x;	//新的坐标
	float	y;	//新的坐标
};

//进入副本
struct U2GS_EnterCopyMap ->
{
	uint16	copyMapID;		//副本地图ID
};

//离开副本
struct U2GS_LeaveCopyMap ->
{
	uint16	type;		// 1 主动点击退出按钮
};

//邀请队员进入副本
struct GS2U_InvateEnterCopyMap <-
{
	uint16	copyMapID;		//副本地图ID
};

//重置副本进度
struct U2GS_ResetCopyMap ->
{
	uint16	copyMapID;		//副本地图ID
};

//重置副本成功的消息，失败则统一使用系统错误号
struct GS2U_ResetCopyMap <-
{
	uint16	copyMapID;		//副本地图ID
};

struct CopyObj
{
	uint16 targetID;		// 目标ID
	uint8 targetType;		// 目标类型，1怪 or 2采集物
	uint16 curNumber;		// 当前完成的个数
	uint16 allNumber;		// 总的需要完成的个数
};

// 当前副本进行进度
struct GS2U_CopyMapProcess <-
{
	uint8 curSchedule;				// 进度
	uint8 allSchedule;				// 总进度
	vector<CopyObj> scheduleList;	// 进度列表
};


// 副本触发特殊事件
struct GS2U_SpecificEvent_Sync <-
{
  uint32  eventID;      // 事件ID
  bool    initOrSettle; // 表示对应表copymapScheduleInit或表copymapScheduleSettle
  uint32  scheduleID;   // 表示表copymapScheduleInit或表copymapScheduleSettle对应的ID
};

// 副本扩展（地宫当前进度剩余时间，仅作显示用）
struct GS2U_CopyMapProcessCurrentScheduleSurplusSecond <-
{
	uint8 curSchedule;				// 进度
	uint8 type;						// 1为准备；2为战斗
	uint64 surplusSecond;			// 进度剩余时间
};

// 副本扩展（地宫当前进度状态）
struct GS2U_CopyMapProcessCurrentScheduleStatus<-
{
	uint8 curSchedule;				// 进度
	uint8 status;					// 进度状态（0成功/1失败）
};

//通知玩家发了奖励物品
struct GS2U_SendGiftNotice<-
{
	vector<uint64> ids;				// 1为宝箱
};
//怪物数变化
struct GS2U_monsterChange<-
{
	uint32 number;				// 本地图当前怪物数
};

// 选中目标
struct U2GS_SelectTarget ->
{
	// 选中目标的code
	uint64 code;
};

// gs踢人通知手机的消息
struct GS2U_KickOutTip <-
{
	int8 type;	// 踢人类型（1为抢登录情况；2为GM类型）
};

// 断线重连  申请进入目标gs
struct U2GS_ReconnectLoginRequest ->
{
	uint64	accountID;				//账号ID
	uint64	roleID;					//角色ID
	string	key;					//随机Key
	int		protocolVer;			//协议版本号
};

// 断线重连  申请进入目标gs失败，客户端重新登录
struct GS2U_ReconnectLoginRequestFail <-
{
};

struct U2GS_ChangeLineRequest ->
{
	uint8 type;	// 类型，1为换线
};

// 确认换线(老服)
struct U2GS_ChangeLineRequestAck ->
{
	uint8 yes;	// 0为确定换线；1为取消
};

// 换线  申请进入目标gs
struct U2GS_ChangeLineLoginRequest ->
{
	uint64	accountID;				//账号ID
	uint64	roleID;					//角色ID
	string	key;					//随机Key
	int		protocolVer;			//协议版本号
};

// 在GS中换线或登录时，如果有失败性错误，就给手机发该消息
struct GS2U_MsgBoxTips <-
{
	int		code;
	string	msg;
};

// 打副本时杀怪的掉落(仅包括自己的)
struct CopyMapDropItem
{
	uint64 itemUID;	// 物品UID
	uint16 itemID;	// 物品ID
	uint16 number;	// 堆叠数量
	uint8 quality;	// 品质
	bool isBind;    // 是否绑定
};

// 副本通关结果和物品奖励
struct GS2U_CopyMapResult <-
{
	uint16 copyMapID;		// 副本地图ID
	uint16 second;			// 通关时间
	uint32 goldReward;		// 金币奖励
	uint32 expReward;		// 经验奖励
	bool isAssist;			// 是否助战
	vector<CopyMapDropItem> dropItems;	// 掉落列表
	vector<CopyMapDropItem> festivalDrop;	// 节日活动掉落
};

// 副本通关结果和物品奖励
struct GS2U_MaterialCopyMapResult <-
{
	uint16 copyMapID;		// 副本地图ID
	uint16 score;			// 通关分数 0 表示失败
	uint16 state;			// 0 通关， 1 超时， 2 失败
	uint32 goldReward;		// 金币奖励
	uint32 expReward;		// 经验奖励
	uint16 maxChapter;		// 最大关卡
	uint16 finishChapter;	// 完成关卡
	bool isAssist;			// 是否助战
	vector<CopyMapDropItem> dropItems;	// 掉落列表
	vector<CopyMapDropItem> festivalDrop;	// 节日活动掉落
};


// 金币副本通关结算
struct GS2U_MoneyDungeonCopyMapResult <-
{
	uint16          copyMapID;              // 副本地图ID
	uint16          score;			            // 通关分数 0 表示失败
	uint16          maxChapter;		          // 最大关卡
	uint16          finishChapter;	        // 完成关卡
  vector<uint16>  listMonsterID;          // 当前关卡的怪物种类
  vector<uint8>   listMonsterCountKill;   // 对应listMonsterID的已杀掉的数量
};

// 副本
struct GS2U_CopymapFailed <-
{
	uint16          copyMapID;              // 副本地图ID
};

struct CoinData
{
	uint8 coinType;			// 货币类型
	uint32 value;				// 货币值
};

// 低级副本扫荡（请求扫荡反馈，为了共用结构）
struct GS2U_RequestAutoDealAck <-
{
	bool isSuccess;			//	是否成功
	uint16 copyMapID;		// 副本地图ID
	vector<CoinData> coinReward;// 货币奖励
	uint64 expReward;		// 经验奖励
	vector<CopyMapDropItem> dropItems;		// 掉落列表
};

// 一键扫荡反馈多条内容
struct RequestAutoDeal
{
	bool isSuccess;			//	是否成功
	uint16 copyMapID;		// 副本地图ID
	vector<CoinData> coinReward;// 货币奖励
	uint64 expReward;		// 经验奖励
	vector<CopyMapDropItem> dropItems;		// 掉落列表
};
struct GS2U_RequestOneKeyDealAck <-
{
	vector<RequestAutoDeal>	listResult;
};


// 玩家对游戏的反馈
struct U2GS_PlayerCoupleBack ->
{
	uint cbType;	// 反馈类型
	string cbContent;	// 反馈内容
}

// xml公告请求
struct U2GS_XmlNoticeRequest ->
{
	uint8 type;//1更新公告;2活动公告
	string sign;//小写md5(已有content/否则空串)
}
// 返回结果
struct GS2U_XmlNoticeResponse <-
{
	uint8 type;//1更新公告;2活动公告
	uint8 ret;//0用content修改；1不用修改；2没有内容
	string content;//公告内容,json串
	string sign;//小写md5(content)
}

// 激活码领取请求
struct U2GS_ActiveCodeRequest->
{
	string	code;	// 激活码
}

// 公告消息结构
struct NoticeInfo
{
	int64 id;//公告id
	int8 type;//0即时，1定时，2轮播
	int8 pos;//0跑马灯/1登陆界面的公告板/2游戏内的公告板
	string content;//内容
	int32 color;//0xffffff rgb值
	
	int64 afterSecondStart;//多少秒后开始
	int64 duration;//从开始时间持续多少秒	
	int32 interval;//间隔时间秒
}
//请求公告列表，
struct U2GS_NoticeRequest ->
{
	string md5;//client端已有公告id号升序后字符串md5。如md5("1,2,3")不要逗号
};
//公告消息列表（登录时）
struct GS2U_NoticeResponse <-
{
	int8 result;//0客户端与服务器一致，不用修改/1客户端与服务器不一致，需要用下面的noticeList覆盖
	vector<NoticeInfo>	noticeList; //登录时，LS给玩家发的有效公告
	
}
//增加公告，gs发给client(为了用上面的公告消息列表）
struct GS2U_NoticeAdd <-
{
	vector<NoticeInfo>	notice;
};
//删除公告，gs发给client(为了用上面的公告消息列表）
struct GS2U_NoticeDel <-
{
	vector<int64> id;//要删除的公告id
};

//请求杀戮值
struct U2GS_KillValueRequest ->
{
};

//返回杀戮值
struct GS2U_KillValueResponse <-
{
	uint16 killValue;
};

//可杀戮Code
struct GS2U_KillPlayerResponse <-
{
	uint64 code
};

//清除反击对象
struct GS2U_ClearFightObject <-
{
	vector<uint> objs;	// 反击对象列表
};

// 请求目标副本的最高分数
struct U2GS_RequestTargetCopyMapScore ->
{
	uint targetCopyMapID;	// 目标副本ID
};

// 返回目标副本的最高分数
struct GS2U_RequestTargetCopyMapScore <-
{
	uint targetCopyMapID;	// 目标副本ID
	uint highestScore;		// 最高分数
};

//觉醒用道具
struct U2GS_PlayerAwakenUseItem->
{
	uint16 num; // 本次请求使用个数
};

//使用道具后返回信息
struct GS2U_PlayerAwakenInfo<-
{
	int8 type;				//0表示进入游戏  1表示后续升级
	int8 awakenLevel;		//觉醒等级
	uint16 itemNum;			//吃了多少个
};

//同步服务器时间
struct GS2U_SyncServerTime<-
{
	uint time;            //UTC时间（相对于1970年第0秒），单位秒
};

//请求等级值
struct U2GS_GetMapLevel ->
{
}

struct GS2U_MapLevel <-
{
	uint32 level;//等级值
}

//通知玩家剧情对话
struct GS2U_PlotDialogue <-
{
	uint id;    //剧情对话配置表ID
};

// 玩家剧情对话结束
struct U2GS_PlotDialogueEnd ->
{
};

//玩家阵营改变通知客服端
struct GS2U_ChangeCamp <-
{
	uint64 code;  //玩家code
	uint camp;  //阵营ID
};

//返回好友坐标
struct GS2U_returnFriendPos <-
{
	uint	mapID;			//地图ID
	float	x;				//新的坐标
	float	y;
};

// 查询对象
struct U2GS_QueryTargetObject ->
{
	uint64 targetCode;	// 目标code
};


// 进入活动或者玩法
struct U2GS_EnterActiveMap ->
{
	uint64	npcCode;			//Npc Code
	uint16	activeID;			//活动ID
};

// 7日首充，累充 领取礼品事件
struct U2GS_RechargeGettingEvent ->
{
	uint	type;			//1为7日累充，2为普通累充
	uint32	grade;			//要领取的档次
};
//月卡 领取礼品事件
struct U2GS_MonthCardGettingEvent ->
{
	uint	type;			//3为月卡礼品领取
};

//月卡到期提醒
struct GS2U_MonthCardEndTips <-
{
	uint8	remainDays;			//剩余天数
};

//系统内部购买
struct U2GS_Buy4System ->
{
	uint32	costID;			//cost配置表示的id，用以确定购买的item及配置
	uint32	number;			//购买数量
};

//保存客户端需要server保存的自定义事件
struct U2GS_RecClientEvent ->
{
	uint32	eventID;			//事件id(由server来分配维护)
	uint32	eventTime;			//事件发生时间
	string	eventArgs;			//事件需要记录的扩展信息，建议k,v式的json
};

// 副本伤害统计
struct CopyMapStatHurt
{
	uint64	roleID;				//玩家ID
	uint32  beHurt;				//玩家受到的伤害
	uint32  playerHurt;			//玩家攻击的伤害
	uint32  petHurt;			//宠物攻击的伤害
};

struct GS2U_CopyMapStatHurtList <-
{
	vector<CopyMapStatHurt> statList;
}

// 领取爵位等级奖励
struct U2GS_GetVipReward ->
{
	int16   vipLevel			//爵位等级
};

// 重置玩家坐标到本地图的复活点
struct U2GS_ResetPosToRevivePt ->
{
};

// 开始灵力冥想
struct U2GS_StartMeditation ->
{
	bool istart;	// true start and false end
};

// 获取经验
struct U2GS_GetLeavedExp ->
{
	uint8 getType;	//获取经验（0：免费获取； 1：金币获取  2：钻石获取）	
};

struct U2GS_CopyChat ->
{
};
//客户端请求修改名字
struct U2GS_ChangeName ->
{
	uint64 roleID;
	string name;
};
//改名结果
struct GS2U_ChangeNameResult <-
{
	uint64 roleID;
	string name;
	uint   errorCode;		//0为成功，其他为失败
};
//领取更新资源奖励结构
struct UpdateReward
{
	uint16 itemid;		//道具ID
	uint16 number;		//奖励个数
};
//是否领取奖励
struct RewardUpdateResource
{
	uint8   count;		//第几次
	bool	flag;		//是否领取
	vector<UpdateReward> rewardList;	//奖励列表
};
//是否领取更新资源奖励
struct GS2U_GetRewardUpdateResource <-
{
	vector<RewardUpdateResource> resultList;
};
//领取更新资源奖励
struct U2GS_GetUpdateReward ->
{
	uint8	count;		//领取更新资源奖励第几次
};

//玩家登陆初始化结束消息
struct GS2U_PlayerInitEnd <-
{
};

//翅膀升级消息
struct U2GS_WingRise ->
{
	uint32 itemID;
	uint32 itemNum; //物品个数，0为所有
	uint8 firstBind;//0: 绑定和非绑并用； 1：只使用绑定
};

//翅膀升级消息
struct GS2U_WingRise <-
{
	uint32 itemID;
	int32 expChange;
};

//翅膀一键升级
struct U2GS_WingRiseOneTouch ->
{
};

//装备合成
struct U2GS_EqupmentCombin ->
{
	uint32 combinID;
	uint32 combinNum;
	vector<uint64> equpmentUIDList;
};


//初始化今日活动任务
struct U2GS_AcceptHolidayTask->
{
};

struct GS2U_AcceptHolidayTaskSucc<-
{
	uint8 result;
};

struct U2GS_CommonditiesPush->
{
	
};

struct pushItem
{
	uint32 sku;
	uint32 itemID;
	uint16 num;
	uint8 isBinded; //0 非绑，1 绑定				
	uint32 price;
	uint8 rebate;
	uint8 coinType; //1 砖石，2 非绑砖石
	uint8 limited;	//购买限制次数
};

struct GS2U_PushInfo<-
{		
	vector<pushItem> items;
	uint32 startTime;
	uint32 endTime;
};

struct U2GS_BuyLimitSales->
{
	uint32 sku;
};

struct GS2U_BuyLimitedResult<-
{
	uint8 result; //0 购买成功；1 货币不足，3 最大购买限制次数
};

//跨服状态
struct GS2U_CrossStep <-
{
	uint8 index;//为2表示从跨服回到GS
};
//获取等级礼包协议
struct  PlayerLevelReward<->
{
	vector<uint8> receiveRewardLevel;//已领取奖励的等级
};

struct U2GS_ReceivePlayerLevelReward-> //领取奖励
{
	uint8 level;
};

struct GS2U_ReceivePlayerLevelRewardResult<-
{
	uint8 level;//当领取成了就发送 此消息，其余的均发送error_code【1等级不够、2已经领取 走error code】
};

// 获取获取在线奖励
struct  GetPlayerOnlineReward<->
{
	uint32 timeID;	//当领取成了就发送此消息，其余的走error code
};

//跨服后，玩家变了code
struct GS2U_CrossNewPlayerCode <-
{
	uint32 uint64;
};
//金宝塔公告信息
struct  lotteryForTowerNotice 
{
	string roleName;
	uint itemID;
	uint itemNumber;
};

//金宝塔奖励道具信息
struct  lotteryForToweItem 
{
	uint pool_id;
	uint cfg_id;
	uint itemID;
	uint itemNumber;
	uint isBind;
	int16  isWin;
};


struct  GS2U_LotteryForTowerInfo<-
{
	int16 current_cfg_id;
	uint endTime;
	uint oneTimeCost;
	uint tenTimeCost;
	uint fiftyTimeCost;
	vector<lotteryForToweItem> itemList;
	vector<lotteryForTowerNotice> noticeList;
}
struct U2GS_LotteryForTowerInfo-> //获取金宝塔信息
{
}
struct U2GS_LotteryForTowerRandonAward-> //金宝塔抽奖
{
	uint randomNumber;
	bool isShowPanel;//是否显示道具奖励面板
};

//抽奖结果发给客户端
struct  GS2U_LotteryForTowerRandonAward<-
{
	int16 current_cfg_id;
	vector<lotteryForTowerNotice> noticeList;
	vector<int16> reward_cfg_id_list;
	
};
//金宝塔结束和开始时间
struct  GS2U_LotteryForTowerBeginTimeEndTime<-
{
	uint32 beginTime;
	uint32 endTime;
};
//进入经验地图
struct U2GS_GoToExpMap-> 
{

};
//向服务器请求宝藏系统信息
struct U2GS_get_lottery_sys_info-> 
{

};
//服务器返回宝藏系统信息给客户端
struct  GS2U_lottery_sys_info<-
{
	int16 goblin_lottery_last_free_times;
	uint  goblin_lottery_free_cd;
	uint  treasure_lottery_last_free_times;
	uint  treasure_lottery_free_cd;
}

//抽奖系统奖励道具信息
struct  lottery_award_item_info 
{
	uint itemID;
	uint itemNumber;
};

//服务器将玩家抽到的奖励发给客户端
struct  GS2U_lottery_award_items<-
{
	vector<lottery_award_item_info> award_item_list;
	vector<lottery_award_item_info> award_item_list_sp;
}

//客户端请求抽奖操作
struct U2GS_lottery_start-> 
{
	uint  type;
};

struct lsbattlefield_rank
{
	uint16  index; //名次
	uint16  score;
	string roleName;

};
//服务器下发给客户端的战斗排行列表
struct  GS2U_lsbattlefield_rank_list<-
{
	vector<lsbattlefield_rank> rank_list;
}

struct  lsbattlefield_award
{
	uint16 itemid;		//道具ID
	uint16 number;		//奖励个数
	uint    isBind;		//是否绑定
	
}
struct  GS2U_lsbattlefield_award_list<-
{
	uint  index;		//名次
	vector<lsbattlefield_award> award_list; //奖励的道具列表
	uint  coinType;		//货币类型
	uint  coinValue;		//货币个数

}
//同步服务器乱世为王活动状态给客户端
struct GS2U_synch_lsbattlefield_state<-
{
	uint state;			//活动状态
};

struct  U2GS_Join_lsbattlefield ->
{
};
//将服务器副本销毁时间同步给客户端
struct GS2U_copy_map_destory_time<-
{
	uint   copyMapID;			//副本id
	uint64 destoryTime;			//活动销毁时间
	uint64 waitTime;
};
//客户端请求获取副本销毁时间
struct  U2GS_get_copy_map_destory_time ->
{
};

//客户端设置翅膀等级
struct U2GS_ChangeWingLevel ->
{
	uint level;
};

//服务器下发给客户端的体力值信息
struct GS2U_action_point_info<-
{
	uint   value;
	uint   lastUpdateUtcTime;
};
//客户端请求获取体力值
struct  U2GS_get_action_point_info ->
{
};

//客户端请购买力值
struct  U2GS_buy_action_point ->
{
};

//客户端请购买进入副本次数
struct  U2GS_buy_action_count ->
{
	uint16	copyMapID;		//副本地图ID
};

// 跨服活动报名组角色信息
// 因为角色可能是跨服的，因此信息需要较为完整地用于显示
struct CrossRoleBase
{
  uint64          id;             // 角色ID
  string          name;           // 姓名
  string          server;         // 所在服名
  uint16          level;          // 等级
  uint32          career;         // 职业
  uint8           race;           // 种族
  uint8           sex;            // 性别
  int32           head;           // 头
  uint16	frameID;				// 头像框
  vector<uint8>   face;           // 自定义头像MD5(16byte)
  uint64          maxForce;       // 历史最大战力（包含骑宠），用于战力匹配
  uint64          maxForceNoPet;  // 历史最大战力（不含骑宠），用于战力匹配
};

//////////////////////////////////////////////////////////////
// 跨服骑宠竞速 begin

// 骑宠竞速 初始化
// 仅普通服执行
// 上线时、子模式改变时触发该消息
struct GS2U_RaceInit <-
{
  uint8           type;		    // 0普通模式 1双倍道具 2强化道具 3加速模式 4混乱模式
  uint16          petID;      // 最近选择的骑宠ID，可用于默认的骑宠选择
  uint8           autoMatch;  // 0不进行自动匹配 1进行自动匹配 2主人自动匹配时不当乘客
};

// 骑宠竞速 选择骑宠
// 仅普通服执行，仅检查骑宠是否存在
// 用于指定参赛骑宠
// 执行成功后，如果是已报名状态且是主人，则自动执行一次报名
struct U2GS_RaceSelectPet ->
{
  uint16          petID;      // 骑宠ID
};

// 骑宠竞速 返回选择骑宠的结果
struct GS2U_RaceSeletPet <-
{
  int32           retInfo;    // 逻辑上的返回值，前后端商议具体内容，用于处理界面逻辑
  vector<Error>   errorInfo;  // 需要提示的错误信息，可能为空，其中ErrorCode为0时表示不提示
  uint16          petID;      // 最新的已选择骑宠，为0时表示未选择
};

// 骑宠竞速 设置自动匹配
// 仅普通服执行，忽略异常值
// 反馈相同协议表示成功
struct U2GS2U_RaceAutoMatch <->
{
  uint8           autoMatch;  // 0不进行自动匹配 1进行自动匹配 2主人自动匹配时不当乘客
};

// 骑宠竞速 查询可邀请人列表
// 仅普通服执行，限定可报名状态下
struct U2GS_RaceInviteList ->
{
};

// 骑宠竞速 可邀请人信息
struct RaceCanBeInvite
{
  uint64          id;             // 角色ID
  string          name;           // 姓名
  uint16          level;          // 等级
  uint32          career;         // 职业
  uint8           race;           // 种族
  uint8           sex;            // 性别
  int32           head;           // 头
  uint16          frameID;        // 头像框
  vector<uint8>   face;           // 自定义头像MD5(16byte)
  uint64          maxForce;       // 最高战力
  bool            isCouple;       // 是否是伴侣
  bool            isFriend;       // 是否是本地正式好友
  bool            isGuildMember;  // 是否是家族成员
  uint32          friendliness;   // 友好度
  uint32          liveness;       // 家族活跃度（进入家族后累计获得的贡献值）
};

// 骑宠竞速 返回查询可邀请人列表的结果
struct GS2U_RaceInviteList <-
{
  int32                   retInfo;    // 逻辑上的返回值，前后端商议具体内容，用于处理界面逻辑
  vector<Error>           errorInfo;  // 需要提示的错误信息，可能为空，其中ErrorCode为0时表示不提示
  vector<RaceCanBeInvite> listInfo;   // 已排序的列表
};

// 骑宠竞速 邀请乘客
// 仅普通服执行，限定可报名等状态下
// 反馈GS2U_RaceApplyState
struct U2GS_RaceInvite_A2S ->
{
  uint64          id;             // 角色ID
};

// 骑宠竞速 通知被邀请信息
struct GS2U_RaceInvite_S2B <-
{
  RaceCanBeInvite master;         // 邀请人信息
  uint16          petID;          // 使用骑宠
  uint32          timeout;        // 超时点（从1970年开始的本地时间，秒）
};

// 骑宠竞速 处理邀请信息
// 仅普通服执行，限定可报名等状态下
// 反馈GS2U_RaceApplyState
struct U2GS_RaceInvite_B2S ->
{
  bool            isAgree;        // 是否同意邀请
  uint64          id;             // 邀请人ID
  uint16          petID;          // 邀请人使用骑宠
};

// 骑宠竞速 报名状态同步
// 邀请、被邀请、报名、取消报名等行为会造成该状态的同步
struct GS2U_RaceApplyState <-
{
  int32                   retInfo;    // 逻辑上的返回值，前后端商议具体内容，用于处理界面逻辑
  vector<Error>           errorInfo;  // 需要提示的错误信息，可能为空，其中ErrorCode为0时表示不提示
  RaceCanBeInvite         master;     // 邀请人信息（必定存在，自己不是乘客时这里是自己，自己是乘客时必定有邀请人）
  vector<RaceCanBeInvite> passenger;  // 已邀请的角色信息（可能为空）
  uint16                  petID;      // 邀请人使用骑宠，邀请人信息为空时无效
  uint8                   type;       // 0你是邀请人 1你是被邀请人
  bool                    isApply;    // 是否已报名
  uint8                   autoMatch;  // 是否自动匹配 0不进行自动匹配 1进行自动匹配 2主人自动匹配时不当乘客 注：这里是队伍属性而不是自己的属性
};

// 骑宠竞速 报名
// 仅普通服执行，检查内容有点多……
// 由于之前的操作已经设定了报名所需全部参数
// 因此这里仅提供空结构用于报名
struct U2GS_RaceApply ->
{
};

// 骑宠竞速 取消报名
// 取消报名后，乘客脱离
struct U2GS_RaceCancel ->
{
};

// 骑宠竞速 小组基本信息
// 用于描述小组报名时的基本情况
struct RaceTeamBase
{
	uint64								applyID;			// 报名组ID
	uint64								leaderID;			// 报名组队长角色ID
	vector<CrossRoleBase>	members;			// 成员角色信息
	uint16								petID;				// 骑宠ID
};

// 骑宠竞速 小组道具信息
// 虚拟道具：0没有；1冰冻；2无敌；3闪电；4烟幕；5反向；6加速；7加速带；8陷阱
struct RaceTeamItem
{
	vector<uint8>		listItemIDA;	// 1号角色的道具
	vector<uint8>		listItemIDB;	// 2号角色的道具
};


// 骑宠竞速 小组排名信息
// 排名情况允许并列，1.laps降序；2.milestone降序；3.time升序
struct RaceTeamSort
{
	uint8		laps;				// 完成圈数
	uint8		milestone;	// 最后碰触到的有效里程碑
	uint64	time;				// 最后碰触到有效里程碑的时间（从1970-01-01开始计算的本地时间，单位毫秒
};

// 骑宠竞速 小组扩展信息
// 用于描述小组比赛时的所有情况
struct RaceTeamEx
{
	uint64				applyID;		// 等价于base.applyID，此处方便算法上查找
	RaceTeamBase	base;
	RaceTeamItem	item;
	RaceTeamSort	sort;
	uint64				giveUpID;		// 弃赛者角色ID（为0时表示尚未弃赛
};

// 上线初始化报名状态（没有报名则没有这个消息
struct GS2U_RaceApplyInfo_Sync <-
{
	RaceTeamBase	info;
};

// 报名请求
// 客户端主动请求
// 对于双人坐骑主人已在马上报名，邀请乘客上马后，乘客自动发起请求
struct U2GS_RaceApply_Request ->
{
};

// 报名成功反馈
// 所有相关角色会收到该消息
struct GS2U_RaceApply_Ack <-
{
	RaceTeamBase	info;
};

// 取消报名请求
struct U2GS_RaceCancel_Request ->
{
};

// 取消报名成功反馈
// 所有相关角色会收到该消息
struct GS2U_RaceCancel_Ack <-
{
	CrossRoleBase		role;		// 取消者信息
};

// 下次活动模式
// 角色上线时同步，活动结束后可能同步
struct GS2U_RaceType_Sync <-
{
	uint8		type;		// 0普通模式 1双倍道具 2强化道具 3加速模式 4混乱模式
};

// 活动地图内广播：阶段切换
struct GS2U_RaceMapState_Sync <-
{
	uint8								type;				// 0普通模式 1双倍道具 2强化道具 3加速模式 4混乱模式
	uint8								state;			// 1准备倒计时 2比赛中 3已有角色冲过终点 4结算倒计时
	uint16							sec;				// 本阶段剩余时间
	uint32							timeBegin;	// 开始比赛时间，用于结算时计算角色耗时
	vector<RaceTeamEx>	info;				// 全信息更新
};

// 活动地图内广播：刷新里程碑变动
struct GS2U_RaceMapMilestone_Sync <-
{
	uint64				applyID;			// 报名组ID
	RaceTeamSort	sort;
};

// 活动地图内广播：使用道具请求
struct U2GS_RaceMapItem_Request ->
{
	uint8		itemID;		// 对应配置race_item.id
};

// 活动地图内广播：刷新道具情况
struct GS2U_RaceMapItem_Sync <-
{
	uint64				applyID;			// 报名组ID
	uint64				roleID;				// 谁
	bool					getOrUse;			// 获得还是使用
	uint8					itemID;				// 虚拟道具ID 对应配置race_item.id
	RaceTeamItem	item;					// 刷新最新道具情况
};

// 角色弃赛时通知队友
struct GS2U_RaceMapGiveUp_Sync <-
{
	bool						isComplete;		// 是否已经冲过终点
	uint8						reason;				// 弃赛原因：0没有入场；1离开地图；2掉线；3下马
	CrossRoleBase		role;					// 弃赛者信息
};

// 跨服骑宠竞速 end
//////////////////////////////////////////////////////////////


// 保存新手引导进度
struct U2GS_save_current_guide_id ->
{
	uint16 guideID; //当前的引导ID
};

// 转职
struct U2GS_ChangeCarrer ->
{
	uint32 newCareer; //新职业
};

// 转职
struct GS2U_ChangeCarrer <-
{
	bool result;	  //是否转职成功
	uint32 newCareer; //新职业
};

// 重新转职
struct U2GS_RenewChangeCarrer ->
{
	uint32 newCareer; //新职业
};


//首领入侵 鼓舞伤害加成
struct GS2U_WorldBossBuyBuff->
{
	uint8 type; //货币使用类型
};

// 点金手
struct U2GS_MoneyTree ->
{
};

// 点金手
struct GS2U_MoneyTreeAck <-
{
	uint32 totalMoney; //金币总数
	
	uint32 boxMoney; //宝箱金币
	
	uint16 rate; //倍数
};

// 点金手宝箱
struct GS2U_MoneyTreeBox <-
{
	uint32 totalMoney; //金币总数
	uint16 rate; //倍数
};

////////////////////////////////////////////////////////////
// 七日目标 begin

// 条件变化时同步状态
// 条件类型：
//    1 完成指定副本
//    2 勇者荣耀通过第N层
//    3 守护女神通过第N波
//    101 角色达到指定等级（客户端本地获取）
//    102 指定品质（等于）的骑宠达到指定数量（客户端本地获取）
//    103 拥有时装达到指定数量
//    104 战力达到指定数量
//    105 竞技场排名达到前N
//    106 指定品质（等于）的装备达到指定数量
//    201 满足星级要求（大于等于）的装备（槽位）达到指定数量（客户端本地获取）
//    202 满足精炼要求（大于等于）的装备（槽位）达到指定数量（客户端本地获取）
//    203 满足等级要求（大于等于）的纹章镶嵌达到指定数量（纹章系统重新开发中，此处暂不支持）
//    204 满足等级要求（大于等于）的纹章大师达到指定数量（纹章系统重新开发中，此处暂不支持）
//    205 翅膀达到指定阶级（客户端本地获取）
//    206 满足等级要求（大于等于）的器灵达到指定数量（客户端本地获取）
//    207 满足星级要求（大于等于）的骑宠达到指定数量（客户端本地获取）
//    208 满足转生要求（大于等于）的骑宠达到指定数量（客户端本地获取）
//    209 满足提升要求（大于等于）的骑宠达到指定数量
// 条件参数：
//    1 [已通关地图ID,...]
//    2 [已通关层数]
//    3 [已通关波数]
//    101 [角色等级]
//    102 [0] 仅通知客户端从本地获取数据进行刷新
//    103 [曾获得时装数量]
//    104 [历史最大战力值]
//    105 [历史最高排名] 为0时表示未参与排名
//    106 [装备数量,...] 按品质升序排列 品质0~5
//    201 [0] 仅通知客户端从本地获取数据进行刷新
//    202 [0] 仅通知客户端从本地获取数据进行刷新
//    203 （纹章系统重新开发中，此处暂不支持）
//    204 （纹章系统重新开发中，此处暂不支持）
//    205 [0] 仅通知客户端从本地获取数据进行刷新
//    206 [0] 仅通知客户端从本地获取数据进行刷新
//    207 [0] 仅通知客户端从本地获取数据进行刷新
//    208 [0] 仅通知客户端从本地获取数据进行刷新
//    209 [提升次数1,提升次数2,...]
struct SevenDayAimUpdate
{
  int32         type; // 条件类型
  vector<int64> args; // 条件参数
};
struct GS2U_SevenDayAimUpdate_Sync <-
{
	
  int32         type; // 条件类型
  vector<int64> args; // 条件参数
};

// 上线推送七日目标状态
struct GS2U_SevenDayAimState_Sync <-
{
  uint32                      timeBegin;      // 活动开始时间（从1970年1月1日至今的秒数，活动持续7*24小时）
  vector<SevenDayAimUpdate>   conditions;     // 条件集（活动不在有效期内时为空）
  vector<uint16>              alreadyReward;  // 已经领取的奖励对应配置ID集，参考seven_day_aim.id
};

// 领取奖励
struct U2GS_SevenDayAimReward_Request ->
{
  uint16 id; // 如同配置表seven_day_aim.id
};

// 领取奖励成功的反馈消息，用于刷新界面
struct GS2U_SevenDayAimReward_Ack <-
{
  uint16 id; // 如同配置表seven_day_aim.id
};

// 七日目标 end
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// 30日登录大奖 begin

// 上线推送状态
struct GS2U_ThirtyDayLoginGiftState_Sync <-
{
  uint32  timeBegin;      // 活动开始时间（从1970年1月1日至今的秒数，活动持续30*24小时）
  uint16  alreadyReward;  // 领取到的奖励ID，对应配置表thirty_day_login_gift.id，奖励只能按升序领取
};

// 领取奖励
struct U2GS_ThirtyDayLoginGift_Request ->
{
  uint16 id; // 如同配置表thirty_day_login_gift.id
};

// 领取奖励成功的反馈消息，用于刷新界面
struct GS2U_ThirtyDayLoginGift_Ack <-
{
  uint16 id; // 如同配置表thirty_day_login_gift.id
};

// 30日登录大奖 end
////////////////////////////////////////////////////////////


// 实时语音 女主播 begin
////////////////////////////////////////////////////////////

struct GS2U_SetUpAnchor <-
{
  vector<int64> args; // 主播ID
};

// 实时语音 女主播 end
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// 怪物图鉴 begin

// 请求怪物图鉴数据
struct U2GS_MonsterBook_Request ->
{
};

// 反馈怪物图鉴数据
struct MonsterBook
{
  uint16  id;         // 怪物ID
  uint32  kill;       // 击杀数量
  bool    isSnap;    // 是否拍照
  bool    isUnlock;  // 是否解锁
  bool    isReward;  // 是否领奖
};
struct GS2U_MonsterBook_Ack <-
{
  vector<uint16>        listMapID;    // 已经去过的普通地图
  vector<MonsterBook>   listMonster;  // 图鉴数据
};

// 怪物图鉴_拍照（失败时返回ErrorCode）
struct U2GS_MonsterBookSnap_Request ->
{
  uint16  id;         // 怪物ID
};
struct GS2U_MonsterBookSnap_Ack <-
{
  uint16  id;         // 怪物ID
};

// 怪物图鉴_解锁（失败时返回ErrorCode）
struct U2GS_MonsterBookUnlock_Request ->
{
  uint16  id;         // 怪物ID
};
struct GS2U_MonsterBookUnlock_Ack <-
{
  uint16  id;         // 怪物ID
};

// 怪物图鉴_领奖（失败时返回ErrorCode）
struct U2GS_MonsterBookReward_Request ->
{
  uint16  id;         // 怪物ID
};
struct GS2U_MonsterBookReward_Ack <-
{
  uint16  id;         // 怪物ID
};

// 拍照、击杀怪物，导致可以解锁、领奖
// 此时服务端通知客户端，以便红点显示
// 通知的时机有2种：1.角色上线时（没有则不发送）；2.条件刚刚达成时
struct GS2U_MonsterBookNeed_Sync <-
{
 vector<uint16>   listUnlockID;  // 可以解锁的怪物ID集
 vector<uint16>   listRewardID;  // 可以领奖的怪物ID集
};

// 客户端需求：进入所需新图时明确通知客户端
struct GS2U_MonsterBookEnterNewMap_Sync <-
{
	uint16	mapid;
};

// 怪物图鉴 end
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// 跨服活动-大逃杀 begin

// 角色信息
struct AliveRole
{
	uint64					roleID;			// 角色ID，等价于role.id，此处便于算法查询
	CrossRoleBase		role;				// 基本信息
	vector<uint16>	listVE;			// 虚拟装备集，依次为[武器,头盔,铠甲,鞋子]，没有时用0填充
	uint16					countKill;	// 击杀次数
	uint16					countDead;	// 死亡次数
	bool						isGiveUp;		// 是否弃赛
	uint8						rankID;			// 结算时排名（可能并列，已弃赛时无效）
	uint64                      timeDead;       //最后死亡时间
	bool                        isRevive;       //是否还有复活次数
	uint16                      deadRank;       //死到没有次数的顺序
};

// 报名请求
// 组队时仅队长可发起该请求
struct U2GS_AliveApply_Request ->
{
};

// 报名成功反馈
// 所有相关角色会收到该消息
struct GS2U_AliveApply_Ack <-
{
	uint64								applyID;			// 报名组ID
	uint64								leaderID;			// 报名组队长角色ID
	vector<CrossRoleBase>	members;			// 成员角色信息
};

// 取消报名请求
// 组队时仅队长可发起该请求
// 其它情况服务端自动处理
struct U2GS_AliveCancel_Request ->
{
};

// 取消报名成功反馈
// 所有相关角色会收到该消息
struct GS2U_AliveCancel_Ack <-
{
	CrossRoleBase		role;		// 取消者信息
};

// 活动地图内广播：阶段切换
struct GS2U_AliveMapState_Sync <-
{
	uint8								state;			// 1准备倒计时 2比赛中 3结算倒计时
	uint16							sec;				// 本阶段剩余时间
	vector<AliveRole>		listRole;		// 全部角色信息
	bool								isInvalid;	// 是否无效，仅false时正常结算
};

// 活动地图内广播：角色信息刷新
// 虚拟道具变化或者击杀、死亡数变化时刷新
struct GS2U_AliveRole_Sync <-
{
	AliveRole		role;
};

// 活动地图内心跳广播：角色头像及坐标信息，用于画面外以头像展示方位便于索敌
struct AliveRolePos
{
  uint64          id;             // 角色ID
  uint16          level;          // 等级
  uint32          career;         // 职业
  uint8           race;           // 种族
  uint8           sex;            // 性别
  int32           head;           // 头
  float						x;							// X坐标
  float						y;							// Y坐标（对应客户端Z）
};
struct GS2U_AliveRolePos_Sync <-
{
	vector<AliveRolePos>	listPos;
};

// 活动地图内广播：解除DEBUFF的载体刷新点
struct GS2U_AliveCarrier_Sync <-
{
	float		x;		// 刷新点X
	float		y;		// 刷新点Y
	uint32	time;	// 剩余生命周期（秒）
};

// 客户端通知服务端进入安全区
struct U2GS_AliveEnterSafeArea_Request ->
{
};

// 服务端反馈客户端消除DEBUFF
// 可能是U2GS_AliveEnterSafeArea_Request的反馈
// 也可能是心跳触发
struct GS2U_AliveEnterSafeArea_Ack <-
{
};

// 跨服活动-大逃杀 end
////////////////////////////////////////////////////////////

// 每日领取体力
struct U2GS_EveryDayGetPower ->
{
	uint8  getPowerNoonOrNight;    //1,中午，2晚上
};

// 返回领取体力是否成功
struct GS2U_EveryDayGetPower_Sync <-
{
	bool  isGetSuc;    //是否领取成功
};

// 请求地图线路列表
struct U2GS_RequestMapLineList ->
{
	uint16 mapID;
};

struct MapLineInfo
{
	uint lineID;	// 线路ID
	uint16 number;	// 当前线路人数
	uint8 inStates;	// 当前是否在本线路，1在该线路
};

// 返回线路列表
struct GS2U_MapLineList <-
{
	uint16 mapID;
	vector<MapLineInfo> lineList;
};

// 请求进入指定的地图线路
struct U2GS_RequestEnterMapLine ->
{
	uint16 mapID;
	uint lineID;	// 线路ID
};

// 请求自己的历史最大战力
struct U2GS_HisoryForce_Request ->
{
};
struct GS2U_HisoryForce_Ack <-
{
	uint64	maxAll;			// 包含骑宠
	uint64	maxNotPet;	// 不包含骑宠
};


////////////////////////////////////////////////////////////
// LBS系统 begin

// 更新自己的坐标信息
struct U2GS_LBS_Request ->
{
	float		lat;	// 纬度 [-90.0, +90.0] 角度 负值是南纬，正值是北纬，-90.0不等价于+90.0，分属两极
	float		lng;	// 经度 [-180.0, +180.0] 角度 负值是西经，正值是东经，-180.0等价于+180.0
};

// 请求角色列表
struct U2GS_LBS_BesideRole_Request ->
{
	float		lat;	// 纬度 [-90.0, +90.0] 角度 负值是南纬，正值是北纬，-90.0不等价于+90.0，分属两极
	float		lng;	// 经度 [-180.0, +180.0] 角度 负值是西经，正值是东经，-180.0等价于+180.0
	float		dist;	// 距离 [100.0, 5000.0] 米 超过取值返回时返回空集
};

// 反馈请求的角色列表
struct LBSRole
{
	uint64					id;							// 角色ID
	string					name;						// 姓名
	string					server;					// 归属服名
	uint16					level;					// 等级
	uint32					career;					// 职业
	uint8						race;						// 种族
	uint8						sex;						// 性别
	int32						head;						// 头
	vector<uint8>		face;						// 自定义头像MD5(16byte)
	uint64					maxForceAll;		// 历史最大战力（包含骑宠）
	uint8						frt;						// 是自己的什么好友 0本地正式好友 1本地临时好友 2本地黑名单 3本地申请者 4本地陌生人 5跨服好友 6跨服申请者 7自己 8跨服陌生人
	uint64					homeID;					// 家园ID（目前仅限于同服拜访，跨服或没有时为0）
	float						lat;						// 纬度
	float						lng;						// 经度
	float						dist;						// 与自己的距离 100.0时需要处理为小于100 超过5000时需显示太远
};
struct GS2U_LBS_BesideRole_Ack <-
{
	float						lat;			// 纬度 [-90.0, +90.0] 角度 负值是南纬，正值是北纬，-90.0不等价于+90.0，分属两极
	float						lng;			// 经度 [-180.0, +180.0] 角度 负值是西经，正值是东经，-180.0等价于+180.0
	float						dist;			// 距离 [100.0, 5000.0] 米 超过取值返回时返回空集
	vector<LBSRole>	listRole;	// 角色列表
};

// LBS系统 end
////////////////////////////////////////////////////////////

// 假装是商业化内容的签到奖励
// dailyType:84,dailyID:0为0时可以领奖
struct U2GS_BusinessSupperGift_Request ->
{
};
// 仅成功时反馈
struct GS2U_BusinessSupperGift_Ack <-
{
};

// 送花触发特效
struct GS2U_GiveGiftEfects <-
{
  uint32  itemID;      // 送花ID
  uint32  itemCount;   // 送花数量
};

////////////////////////////////////////////////////////// 角色觉醒相关协议 
// 记录的每次激活的选项
struct OneAwakeinfo
{
	uint8 stage;	
	uint8 stone;	
	uint32 param;	//stage 的 激活 stone 激活的属性选项
}

// 当前觉醒信息
struct GS2U_RoleAwakeInof <-
{
	uint8  curStage;     		// 当前阶
	uint8  curStone;   			// 当前激活的漂浮之石
	vector<OneAwakeinfo> allAwakeInfo; //已经激活的属性选择
};

// 觉醒buff信息
struct GS2U_TheAwakeBuffInfo <-
{
	uint32 buffID;			//buffID
	uint8 curstatus;		//当前转态	0 未使用 1 正在使用
	uint32 lefttime;		//剩余时间
};

// 经验值兑换元气
struct U2GS_ExpToVigour ->
{
	uint32 useExpValue;		//使用的经验值
};

// 重置觉醒
struct U2GS_ResetRoleAwake ->
{
};

// 激活某个漂浮之石
struct U2GS_RoleAwakeing ->
{
	uint8 stage;	
	uint8 stone;	
	uint32 awakeParam;		//激活的属性ID
};

// 激活某个漂浮之石返回
struct GS2U_RoleAwakeingRet <-
{
	uint8 stage;	
	uint8 stone;	
	uint32 param;			//stage 的 激活 stone 激活的属性选项
};

// 使用觉醒buff
struct U2GS_UseTheAwakeBuff ->
{
};

struct GS2S_UseTheAwakeBuffRet <-
{
};

// 停止觉醒buff
struct U2GS_StopTheAwakeBuff ->
{
};

struct GS2U_StopTheAwakeBuffRet <-
{
};

// 问卷调查领奖
struct U2GS_GetQuestionnaireSurveyAward ->
{
};

// 进入地图失败，用于通知客户端解除禁止玩家操作
struct GS2U_EnterMapFailed <-
{
};

// 请求领取每日现金礼包奖励
struct U2GS_BusinessCashDailyGift_Request ->
{
};
// 仅领取每日现金礼包奖励成功时反馈
struct GS2U_BusinessCashDailyGift_Ack <-
{
};

//将服务器类型发送给客户端
struct GS2U_SendServerType <-
{
	uint serverType;
}

//玩家被举报次数
struct GS2U_BeReportNum <-
{
	uint8 num;
}