// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 请求Aruna线路入口
struct U2GS_RequestWWLineList ->
{
	
};

// 战场线路
struct WWMapLineInfo
{
	uint16 mapID;
	uint lineID;	// 线路ID
	uint16 number;	// 当前线路人数
};

// 请求进入指定的地图线路
struct U2GS_WWRequestEnterMapLine ->
{
	uint16 mapID;
	uint lineID;	// 线路ID，传0表示随机分配
};

// 返回入口信息
struct GS2U_WWList <-
{
	vector<WWMapLineInfo> lineList;
};

// 请求个人信息
struct U2GS_RequestWWPlayerInfo ->
{
	
};

// 提交样本
struct U2GS_SubmitSamplePoint ->
{
	uint16 configID;	// 样本ID
};

// 返回个人信息，
struct GS2U_WWPlayerInfo <-
{
	uint contribution;	// 个人贡献值
	uint sample_point;	// 样本值
};

// 排行榜信息
struct WWRank
{
	uint16 rankIndex;	// 排名
	uint64 roleID;	// 角色ID
	string roleName;
	string guildName;
	uint contribution;	// 贡献值
};

// 打开主界面
struct U2GS_RequestWWForm ->
{
	bool isFreshRank;	// 是否刷新排行榜,false不刷新，客户端用自己的缓存数据
};

// 可能涉及的动态刷新信息
struct WWFormData
{
	WWRank selfRank;	// 自己的当前信息
	WWRank selfLastRank;	// 自己的上周信息
	bool isGetLastReward;	// 是否已经领取上周奖励
	uint16 phase;	// 世界阶段
	uint schedule;	// 阶段累积值
	uint16 selfPhase;	// 自己领取的世界奖励阶段
	uint upper;		// 提升的倍数
};

// 返回主界面数据
struct GS2U_WWFormData <-
{
	bool isFreshRank;	// 是否刷新排行榜,如果为false,rankList=[]
	bool isInit;		// 是否上线初始化
	vector<WWRank> rankList;	// 排行榜列表,isFreshRank=true,本项才有值
	WWFormData data;	// 动态数据
};

// 领取上周的排行榜奖励
struct U2GS_GetLastReward ->
{
	
};

// 领取世界阶段奖励
struct U2GS_GetPhaseReward ->
{
	
};

// 刷新主界面动态数据
struct GS2U_FreshWWFormData <-
{
	WWFormData data;	// 动态数据
};

// =========以下为活动相关协议===================================================
// 地图同步信息
struct GS2U_WWSyncMapInfo <-
{
	uint16 phase;	// 世界阶段
	uint schedule;	// 阶段累积值
	uint8 acPhase;	// 当前地图的活动阶段
	uint upper;		// 提升的倍数
};

// 第一个阶段
struct GS2U_WWSyncMapInfoOne <-
{
	uint32 residueSec;	// 剩余时间，秒
};

struct WWSyncMapPhaseTwo
{
	uint monsterID;
	uint curNumber;	// 当前击杀数量
	uint maxNumber;	// 需要击杀数量
};

// 第二个阶段
struct GS2U_WWSyncMapInfoTwo <-
{
	uint8 curTimes;	// 当前波数
	uint8 maxTimes;	// 总波数
	vector<WWSyncMapPhaseTwo> targets; // 目标
};

// 第三个阶段
struct GS2U_WWSyncMapInfoThree <-
{
	string selfServerName;
	uint selfPoint;
	string targetServerName;
	uint targetPoint;
	uint distance;	// 剩余距离
};

// 护送结果
struct GS2U_WWEscortResult <-
{
	uint16 old_phase;	// 旧世界阶段
	uint old_schedule;	// 旧阶段累积值
	uint16 new_phase;	// 新世界阶段
	uint new_schedule;	// 新阶段累积值
	uint sample_point;	// 增加的样本值
	bool success;		// 成功或失败
};

