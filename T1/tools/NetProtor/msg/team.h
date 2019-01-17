// -> client to server
// <- server to client
// <-> client & server
/***********************队伍类型**********************************/
//0:普通队伍（五分钟没有人就会删除，可以任意换队长）
//1:系统队伍（服务器逻辑去删除和创建, 只在服务器内部使用，不可换队长）
//2:灵魂伙伴（玩家去删除和创建，不可换队长）
/***********************队伍基础操作******************************/

//----------------------------------------------------------------

//队伍操作
struct U2GS_TeamOp ->
{
	//1(创建, 副本ID);2(邀请加入,目标角色ID); 3(快速入队,队伍ID)
	//4(T人，队员ID);5(转移队长,队员ID);6(队长改变副本ID,副本ID)
	//7(开始副本,*);8(离队,*);9(队伍是否能被别人搜索到 0|1) 默认1表示能被别人搜索
	//10(解散队伍,*); 11(查询系统是否在自动为我匹配队伍, *)
	//12(响应队长开始副本, 0|1) 1表示同意
	//13(取消系统自动为我匹配队伍, *)
	//14(组队喊话操作, 聊天频道)
	//15(快速组队, 目标角色ID, 副本ID)
	//16离队并进入副本
	//17开启助战(operatedID:1开启助战，2取消助战，param1:副本ID)
	uint8	operateType;
	uint64	operatedID;
	uint64	param1;
};

//询问，有人邀请你
struct GS2U_InviteUJoinTeam <-
{
	int32	copyMapID;
	uint64	inviterPlayerID;	//邀请玩家ID
	string	inviterPlayerName;	//邀请玩家姓名
	uint64	guildID;			// 帮会ID
	string  guildName;			// 角色名字
	uint8	friendState;		// 是否是好友(1是)
};

//回复，队伍邀请结果
struct U2GS_AckInviteJoinTeam ->
{
	uint8	isAgree;			// 0.拒绝;1.同意;
	uint64	inviterPlayerID;	// 邀请玩家ID
};


// 队伍重置，包括，被踢，离开队伍，解散队伍
// 相关的提示将会通过errorcode来提示
struct GS2U_TeamReset <-
{
	int32 reason; // 0 初始化, 1 T;2退队
};

// 队友离队
struct GS2U_TeammateLeave <-
{
	uint64 teammateID;
};

struct TeamMemberLocation
{
	uint64	playerID;	//队友ID
	float   x;			//队友所在x坐标
	float   y;			//队友所在y坐标
};

//给玩家同步队友位置信息
struct GS2U_TeammateLocation <-
{
	vector<TeamMemberLocation> teammateLocations;
};

//快速匹配
struct U2GS_QuickTeamMatch ->
{
	vector<uint16> mapList;
};

//操作结果
struct GS2U_QuickTeamMatchAck <-
{
	// 0没在队里，1超时，2加入队列
	int32 result;
	// 开始匹配的时间；服务器时间
	uint64 startTime;
};

//队长点击开始副本
struct GS2U_TeamLeaderStartCopymap <-
{
	int32	copyMapID;
};

//队员回复进副本
struct GS2U_TeammateStartCopymapAck <-
{
	uint64	playerID;			// 角色ID
	uint8	isAgree;			// 0.拒绝;1.同意;
};

//提醒队长
struct U2GS_NoticeLeader ->
{
	
};

//队长收到提醒
struct GS2U_ReceiveNotice <-
{
	string sendRoleName;	// 提醒者名字
	uint16 mapID;			// 目标地图ID
};

//队员信息（扩展信息）
struct TeamMemberInfoEx
{
	uint64	playerID;			// 角色ID
	uint64 	code;				// 角色流水号
	uint16	level;				// 等级
	uint16	hpPercent;			// 血量百分比
	uint16  mapID;				// 所在的地图
	uint32  groupID;			// 组ID
	uint64  mapInstanceID;		// 线ID
	uint16  copyMapLeftCount;	// 副本剩余次数
	uint32	actionPoint;		// 体力值
	uint64  force;
	uint16  assistMapID;		// 助战地图ID
	float   x;					// x坐标
	float   y;					// y坐标
	uint    serverID;
	uint16  copyMapStar;		// 
};

//队员信息（基本信息）
struct TeamMemberInfo
{
	uint64	playerID;			// 角色ID
	uint64 	code;				// 角色流水号
	string  playerName;			// 角色名字
	uint64	guildID;			// 帮会ID
	string	guildName;			// 帮会名字
	uint64  force;				// 战力
	uint16	level;				// 等级
	uint32	career;				// 职业
	uint8	race;				// 种族
	uint8	sex;				// 性别
	int32	head;				// 头
	uint16  frameID;            // 头像框
	uint8	hpPercent;			// 血量百分比[0,100]
	uint16  mapID;				// 所在的地图
	uint32  groupID;			// 组ID
	uint64  mapInstanceID;		// 线ID
	uint16  assistMapID;		// 助战地图ID
	float   x;					// x坐标
	float   y;					// y坐标
	string  customInfo;			// 扩展信息
	uint16  copyMapLeftCount;	// 副本剩余次数
	uint32	actionPoint;		// 体力值
	uint    serverID;
	uint16  copyMapStar;		// 
};

//队伍信息
struct TeamBaseInfo
{
	uint64	teamID;
	uint64	leaderID;
	int32	copyMapID;
	int32	canBeSearched;
	uint64	searchStartTime;
};

//队伍信息
struct GS2U_MyTeamInfo <-
{
	TeamBaseInfo base;
	vector<TeamMemberInfo> infos;
};

//队伍信息变化，主要是切换副本，或者换队长
struct GS2U_UpdateTeamInfo <-
{
	TeamBaseInfo base;
};

//队员额外信息（实时性比较强的信息）
struct GS2U_UpdateMemberExInfo <-
{
	TeamMemberInfoEx infoEx;
};

//新增队员信息
struct GS2U_NewMemberJoin <-
{
	TeamMemberInfo info;
};

//队员上下线
struct GS2U_TeamMemberOnlineState<-
{
	uint64	playerID;
	int32 	state; // 1 上线； 0 离线
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//组队大厅

//查询当前地图线的队伍列表
struct U2GS_QueryTeamListThisLine ->
{
};
//查询队伍列表
struct GS2U_QueryTeamListThisLineAck <-
{
	vector<TeamSnapshot> teamSnapshot;
};

//查询队伍列表
struct U2GS_QueryTeamList ->
{
	vector<int32> mapIDList;
};

struct TeamMemberSnapshot
{
	uint64	playerID;			// 角色ID
	uint64 	code;				// 角色流水号
	string  playerName;			// 角色名字
	uint32	career;				// 职业
	uint16	level;				// 等级
	uint8	race;				// 种族
	uint8	sex;				// 性别
	int32	head;				// 头
	uint16  frameID;            // 头像框
	uint64  force;
	uint64	guildID;			// 帮会ID
};

//简洁信息
struct TeamSnapshot
{
	TeamBaseInfo base;
	vector<TeamMemberSnapshot> members;

};

//查询队伍列表
struct GS2U_QueryTeamListAck <-
{
	vector<TeamSnapshot> teamSnapshot;
};

//查询无队伍玩家
struct U2GS_QueryRoleList ->
{
	// 1 推荐；2 附近;
	// 3 好友；4 家族
	int32 queryType;
};

struct OnlineMemberSnapshot
{
	uint64	playerID;			// 角色ID
	uint64 	code;				// 角色流水号
	uint64	guildID;			// 帮会ID
	string  playerName;			// 角色名字
	string	guildName;			// 帮会名字
	uint32	career;				// 职业
	uint16	level;				// 等级
	uint8	friendState;		// 是否是好友(1是)
	uint8	race;				// 种族
	uint8	sex;				// 性别
	int32	head;				// 头
	uint16  frameID;            // 头像框
	uint32  force;
};


//查询玩家列表
struct GS2U_QueryRoleListAck <-
{
	int32 queryType;
	vector<OnlineMemberSnapshot> playerList;
};


//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//队员额外信息（实时性比较强的信息）
struct GS2U_TeamMemberExtInfo <-
{
	uint64	roleID;				// 角色ID
	uint16	level;				// 等级
	uint8	hpPC;				// 血量百分比
	uint16  mapID;				// 所在的地图
};

//队伍操作
struct U2GS_OperateTeam ->
{
	uint8   teamType;				//队伍类型
	uint8	operateType;			//操作类型(1.邀请加入;2.申请入队;3.T人;4.给予队长)
	uint64	operatedID;				//操作对象玩家ID	
};

//询问，有人邀请你
struct GS2U_BeenInviteTeam <-
{
	uint8   teamType;			//队伍类型
	uint8	inviteType;			//邀请类型(1.邀请加入;2.申请入队)
	uint64	inviterPlayerID;	//邀请玩家ID
	string	inviterPlayerName;	//邀请玩家姓名
};

//回复，队伍邀请结果
struct U2GS_AckInviteTeam ->
{
	uint8   teamType;			// 队伍类型
	uint8	isAgree;			// 0.拒绝;1.同意;
	uint8	inviteType;			// 邀请类型(1.邀请加入;2.申请入队)
	uint64	inviterPlayerID;	// 邀请玩家ID
};

struct GS2U_TeamMemberOffline<-
{
	uint8   teamType;			// 队伍类型
	uint64	playerID;
}

struct GS2U_TeamMemberOnline<-
{
	uint8   teamType;			// 队伍类型
	uint64	playerID;
	uint64 	code;				// 角色流水号	
	uint16	level;
}


//队伍信息
struct GS2U_TeamInfo <-
{
	uint8  teamType;
	int64	teamID;
	uint64	leaderID;
	vector<TeamMemberInfo> info_list;
	string customProp;			// 扩展属性
};

//添加队友信息
struct	GS2U_AddTeamMemberInfo <-
{
	uint8   teamType;				//队伍类型
	TeamMemberInfo memberInfo;
};

//移除队友信息
struct GS2U_DelTeammateInfo <-
{
	uint8   teamType;				//队伍类型
	uint64	teammateID;
};

// 被T
struct GS2U_KickOutByLeader <-
{
	uint8   teamType;				//队伍类型
};

// 队伍解散
struct GS2U_TeamDisbanded <-
{
	uint8   teamType;				//队伍类型
};

// 离队
struct U2GS_LeaveAwayTeam ->
{
	uint8   teamType;	//队伍类型
	uint8	id;			//没用的数据，随便填一个，以后会删掉
};

// 队友离队
struct GS2U_TeammateLeaveAwayTeam <-
{
	uint8  teamType;				//队伍类型
	uint64 teammateID;
};

//队长切换
struct GS2U_TeamChangeLeader <-
{
	uint8   teamType;				//队伍类型
	uint64	newLeaderID;			//新的队长ID
};

struct U2GS_RequestNearByTeamInfo ->
{
	uint8   teamType;	//队伍类型
};

//附近队伍信息
struct NearTeamInfo
{
	int64  teamID;
	uint64 leaderID;
	string leaderName;			//队长名字
	int16  leaderLevel;			//队长等级
	uint8  numberOfTeam;		//队伍人数
  uint32   career; // 职业
  uint8   race;   // 种族
  uint8   sex;    // 性别
  int32   head;   // 头
};

struct GS2U_NearTeamInfo <-
{
	uint8   teamType;				//队伍类型
	vector<NearTeamInfo> teamInfoList;
};

//玩家打开关闭地图面板
struct U2GS_IsOpenMapPanel ->
{
	bool isOpen;
};
//玩家发起副本快捷组队
struct U2GS_QuickTeamStart ->
{
	uint mapID;
};


//玩家快捷加入队伍
struct U2GS_QuickJoinTeam ->
{
	uint64 roleID;
	uint mapID;
};
struct FightingCapacityInfo
{
	uint64 roleID;
	uint64 fightingCapacity;	// 战斗力
}
//客户端请求获取队伍队员战斗力
struct U2GS_RequestFightingCapacity ->
{
	
};
//发送队伍队员战斗力到客户端
struct GS2U_RequestFightingCapacity <-
{
	vector<FightingCapacityInfo> fightingCapacityInfos;
};

struct GS2U_FastTeamAck<-
{	
};

struct U2GS_CancelFastTeam->
{	
};

struct GS2U_FastTeamSucc<-
{
	uint16 time; //进入副本倒计时 单位 秒
};


// 附近玩家信息（用于添加队员）
struct NotTeamMemberInfo
{
  uint64  id;     // 角色ID
  string  name;   // 姓名
  uint16  level;  // 等级
  uint32   career; // 职业
  uint8   race;   // 种族
  uint8   sex;    // 性别
  int32   head;   // 头
	uint    serverID;
};
struct U2GS_NearbyPlayer_Request ->
{
};
struct GS2U_NearbyPlayer_Ack <-
{
  vector<NotTeamMemberInfo> list;
};

	

