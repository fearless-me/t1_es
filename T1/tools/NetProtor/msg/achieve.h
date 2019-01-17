// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 成就进度
struct GS2U_AchieveSchedule <-
{
	uint16  achieveID;   //成就ID
	uint8	scheduleRewardID;   //成就当前领取的进度阶段编号
	uint32	scheduleCompleteNum;//成就当前进度数量
	uint8   scheduleCompleteID;//成就当前完成的进度阶段编号
};

// 成就进度
struct AchieveSchedule
{
	uint16  achieveID;         //成就ID
	uint8	scheduleRewardID;  //成就当前领取的进度阶段编号
	uint32	scheduleCompleteNum;//成就当前进度数量
	uint8   scheduleCompleteID;//成就当前完成的进度阶段编号
};

// 成就进度列表
struct GS2U_AchieveScheduleList <-
{
	vector<AchieveSchedule> scheduleList;
};

// 领取成就点数
struct U2GS_ReceiveAchieveValue ->
{
	uint16 achieveID;   //成就ID
};


// 徽章信息
struct BadgeInfo
{
	uint16  mapID;				   //MapID
	vector<uint> itemList;		   //收集物品列表
};

// 徽章信息列表

struct GS2U_BadgeInfoList <-
{
	vector<BadgeInfo> badgeInfoList;
};

struct GS2U_BadgeInfo <- 
{
	uint16  mapID;				    //MapID
	uint    itemID;				    //收集物品列表
};


// 称号信息
struct TitleInfo
{
	uint16  titleID;				//称号ID
	uint32 	endTime;       			//结束时间（0表示永久， 时间为服务器绝对时间）
};

// 已拥有称号信息列表
struct GS2U_OwnTitleList <-
{
	vector<TitleInfo> titleInfoList;
};

// 新增已获得的称号
struct GS2U_AddTitle <- 
{
	uint16  titleID;				//称号ID
	uint32 	endTime;       			//结束时间（0表示永久， 时间为服务器绝对时间）
};

// 删除已获得的称号
struct GS2U_DelTitle <- 
{
	uint16  titleID;				//称号ID
};

// 改变称号装配状态的消息（存放对应槽位装的配称号ID，没有装配存为0）
struct U2GS_ChangeTitleState -> 
{
	uint16  titleSlot1;				//称号槽位1
	uint16  titleSlot2;				//称号槽位2
	uint16  titleSlot3;				//称号槽位3
	uint16  colorSlot;				//颜色效果槽位
	uint16  floorSlot;				//底图效果槽位
};

// 改变称号装配状态的消息
struct U2GS_ChangeLimiteTitleState -> 
{
	uint16  titleID;				//称号ID
};

// 改变称号装配状态的消息
struct U2GS_ChangeCustomTitleText -> 
{
	uint16	titleID;			//称号ID 唯一类型的称号用不到 唯一类型用type 如婚姻称号 这个就用默认值0 type为婚姻称号的type
	uint16  type;				//称号类型
	string 	text;				//内容
};

// 每日活跃信息
struct DailyActiveInfo
{
	uint8  	dailyID;					//日常活动ID
	uint8 	curTimes;       			//完成的当前次数
};

// 初始化日常活动
struct GS2U_InitDailyActiveInfo <- 
{
	vector<DailyActiveInfo> dailyActiveInfoList;	//初始化日常活动列表
	vector<uint16> receivedAwardList;				//初始化领取奖励列表
};

// 更新日常活动
struct GS2U_UpdateDailyActiveInfo <- 
{
	DailyActiveInfo dailyActiveInfo;				//更新日常活动
};

// 领取奖励
struct U2GS_ReceiveDailyActiveAward -> 
{
	uint16  dailyActivityValue;			//领取奖励的活跃度
};

// 领取奖励结果
struct GS2U_ReceiveDailyActiveAwardResult <- 
{
	uint16  dailyActivityValue;			//领取奖励的活跃度
};