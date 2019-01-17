// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// BOSS战开启或关闭
struct GS2U_BossBattleState <-
{
	uint8	flag;		// 0: 关闭 1: 开始
	uint32	mapID;		// 地图id
};

// 请求进入BOSS战位面
struct U2GS_EnterBossBattle ->
{
};

// 同步自己对boss的伤害
struct UpdataHurtToBoss <-
{
	uint64 hurt;				// 伤害值
};

// 同步家族对boss的伤害
struct UpdataGuildHurtToBoss <-
{
	uint64 hurt;				// 伤害值
};

struct BossRankInfo
{
	string name;			// 名称
	uint64 hurt;				// 伤害值
};

// BOSS战排行结果
struct GS2U_BossBattleRankResult <-
{
	uint	curBossID;		// 当前BOSSID
	uint	curPLeftTime;	// 当前个人领取该boss奖励剩余次数
	uint	curGLeftTime;	// 当前公会领取该boss奖励剩余次数
	uint	curRankNum;		// 当前排名
	uint	curGuildRankNum;	// 当前排名
	vector<BossRankInfo> rankList;
	vector<BossRankInfo> guildrankList;
};

// 同步上一次军团副本结束时间
struct GS2U_SendGuildCopyOpenTime <-
{
	uint64 time;			// 绝对时间
};

// 激活军团副本
struct ActiveGuildCopy <->
{
	uint mapID;			// 激活哪个副本
};
// 进入军团副本
struct U2GS_EnterGuildCopy ->
{
	uint mapID;			// 进入哪个副本
};
// 军团副本是开启还是关闭的
struct GS2U_IsGuildCopyOpen <-
{
	bool flag;			// true: 开启，false: 关闭
	uint64 time;		// 军团副本最晚结束时间
};

// 低级副本扫荡（请求扫荡）
struct U2GS_RequestAutoDeal ->
{
	uint16 mapID;			// 扫哪个副本
};

// 继续循环刷本，队长才有效
struct U2GS_GoonCopyMap ->
{
	uint16 mapID;
};

// 特殊关卡
struct GS2U_CopySpecialSchedule <-
{
	uint16 mapID;
	uint16 schedule;
	uint64 code;
};

// 基础信息
struct U2GS_RequestMaterialInfo ->
{
	uint16 mapID;			//哪个副本
};

struct towerInfo
{
	uint32 dataID;			// id
	uint32 type;			// 类型
	uint32 level;			// 等级
};

struct chapterInfo
{
	uint32 nextChapterSeconds; //下一局自动开始时间
	uint16 headCount;	//hc
	uint16 maxChapter; //最大关卡
	uint16 curChapter; //当前关卡
	uint16 curChapterMonsterMax; //怪物总数
	uint16 curChapterMonsterKilled;//怪物击杀数+到达终点的数量
	uint16 mapMonterMax; //地图怪物总数
	uint32 materialVal; //魔力值
}

struct GS2U_MaterialInfo <-
{
	uint16 mapID;			//哪个副本
	uint32 leftSeconds;		//结束时间
	chapterInfo chapter;	// 关卡
	vector<towerInfo> towerList; // 塔的数据	
};

struct GS2U_ChapterInfo <-
{
	chapterInfo chapter;	// 关卡
};

struct U2GS_UpTower ->
{
	uint32 dataID;			// ID
	uint32 type;			// 类型
};

struct GS2U_TowerInfo <-
{
	towerInfo info;
};

struct U2GS_startNextChapter ->
{
};

// 金币副本同步信息
struct GS2U_MoneyDungeonInfo <-
{
	uint32          leftSeconds;		        // 结束时间(秒)
	uint16          maxChapter;             // 最大关卡
	uint16          curChapter;             // 当前关卡（从1开始）
  vector<uint16>  listMonsterID;          // 当前关卡的怪物种类
  vector<uint8>   listMonsterCountMax;    // 对应listMonsterID的最大数量
  vector<uint8>   listMonsterCountKill;   // 对应listMonsterID的已杀掉的数量
  uint8           curLeftCount;           // 当前关卡还有多少怪没刷出来
};

// 金币副本手动刷下一波的请求
struct U2GS_MoneyDungeonNext ->
{
};

// 金币副本放弃游戏请求
struct U2GS_MoneyDungeonGiveup ->
{
};

// 灵界活动心跳
struct GS2U_SpiritArea_Tick_Sync <-
{
  uint32  time;     // 当前状态剩余时间
  uint32  timeAll;  // 活动剩余总时间
  uint8   wave;     // 当前波次，为0时表示开始前等待
  uint8   state;    // 0波次间隔等待；1波次进行中
  bool    isAssist; // 是否处于助战状态
};

// 灵界活动（器灵材料副本、原初灵界）通知客户端调用觉醒技能
// 不能服务端直接调用，因为需要客户端额外表现
struct GS2U_SpiritArea_Wake_Sync <-
{
  uint32 skillID;
};

// 副本剩余时间
struct GS2U_CopyMapLeftTime <-
{
	uint16 mapID;		//地图ID
	uint32 leftTimeMs;	//剩余时间(毫秒)
};

// 动画播放结束
struct U2GS_CopyMapSchedulePlayAnimationOver ->
{
	uint32 animationID; //动画ID 
};

//  播放动画
struct GS2U_CopyMapSchedulePlayAnimation <-
{
	uint16 mapID;		//地图ID
	uint32 schedule;	//进度
	uint32 animationID; //动画ID 
};

// 字幕播放结束
struct U2GS_CopyMapSchedulePlayCharacterOver ->
{
	uint schedule;		//进度
};

//  播放字幕
struct GS2U_CopyMapSchedulePlayCharacter <-
{
	uint16 mapID;		//地图ID
	uint schedule;		//进度
	vector<uint> characterIDs; //字幕ID列表
};

// 副本进度之对话进度（show2）
// 客户端在对话完成后主动请求完成进度
// 服务端在收到客户端请求验证通过后，或者已存在的show2事件超时后，对地图内所有玩家推送该消息
struct U2GS2U_CopyMapScheduleShow2 <->
{
  uint16  mapID;        // 所在地图ID
  uint16  show2ID;      // 对应show2ID
  uint64  groupID;      // 所在分组ID
  uint    scheduleID;   // 所处进度ID（对应配置copymapScheduleInit或copymapScheduleSettle的id）
  bool    isInit;       // true对应copymapScheduleInit;false对应copymapScheduleSettle
};

// 查询挑战副本星级
struct U2GS_QueryDevilCopyMapStarList ->
{
	
};

struct DevilCopyMapStarInfo
{
	uint32 instanceGroup; //配置表中的instance_group
	uint16 star;	//
};

//  挑战副本星级列表
struct GS2U_DevilCopyMapStarList <-
{
	vector<DevilCopyMapStarInfo> starList; 
};

// 更新某个挑战副本的星级
struct GS2U_UpdateDevilCopyMapStar <-
{
	DevilCopyMapStarInfo starInfo;
};

// 查询副本排行榜
struct U2GS_QueryDevilCopyMapRankList ->
{
	uint32 instanceGroup; //配置表中的instance_group
};

// 队员信息
struct CopyRankTeamMemberInfo
{
	uint64 roleID;
	string roleName;
};

// 队伍信息
struct CopyRankTeamInfo
{
	float diffTime;
	uint32 time;
	int16 rankPos;
	CopyRankTeamMemberInfo leader;
	vector<CopyRankTeamMemberInfo> membersList;
};	

// 排行榜信息
struct CopyMapRankInfo
{
	uint32 copyMapID;
	uint16 star;	//
	vector<CopyRankTeamInfo> teamList;
};

//  挑战副本排行榜
struct GS2U_DevilCopyMapRankList <-
{
	uint32 instanceGroup; //配置表中的instance_group
	vector<CopyMapRankInfo> rankList; 
};

// 节日副本的时间信息结构体
struct OneFestivalTimeInfo
{
	uint32 festivalID;		// 活动ID
	uint32 startTime;		// 活动开始时间
	uint32 endTime;			// 活动结束时间
};

// 服务器同步节日副本的时间信息
struct GS2U_FestivalTimeInfo <-
{
	vector<OneFestivalTimeInfo> timeinfo;
}

// 选择进入节日副本
struct U2GS_EnterFestivalCopy ->
{
	uint32 festivalID;		// 活动ID
	uint8 type;				// 1表示进普通副本 2表示进boss副本
};

// 购买节日礼包
struct U2GS_BuyFestivalPacket ->
{
	uint32 festivalID;
	uint32 packetID;		// 礼包ID
	uint32 buynum;			// 购买的数量
};

// 购买副本多倍奖励
struct U2GS2U_BuyCopyReward <->
{
  uint32 mapSubType;  // 挑战本是9
};
