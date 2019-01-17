// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

//请求初始化
struct U2GS_WarriorTrialInit ->
{
};
//初始化
struct GS2U_InitWarriorTrialAck <-
{
	uint16	record;			//历史最高完成关卡
	uint16  cur;			//当前关卡
	uint16	max;			//最高关卡
	uint32	coin;			//铁血硬币数量
	uint16	maxReward;	// 已领奖的最高关卡
	uint32	curCount;		// 当前关卡已通关角色数量
};
//挑战关卡
struct U2GS_BeginWarriorTrial ->
{
	
};
//进副本时候，给客户端初始信息
struct GS2U_InitWarriorTrialMissionInfo <-
{
	uint16 missionID;		//关卡ID
	uint16 time;			//最迟完成时间
};
//挑战结果
struct GS2U_WarriorTrialSuccess <-
{
	bool result;
};
//扫当关卡
struct U2GS_SweepWarriorTrial ->
{
	uint16 mapID;				//关卡ID
};
//扫荡成功
struct GS2U_SweepWarriorTrialSuccess <-
{
	uint16	record;			//历史最高完成关卡
	uint16  cur;			//当前扫荡关卡
	uint32	coin;			//铁血硬币数量
};
// 一键扫荡
struct U2GS_SweepWarriorTrial_OneKey_Request ->
{
};
//完成所有关卡
struct U2GS_CompleteWarriorTrail ->
{
	uint16 mapID;			//地图ID
};

// 请求领取首通奖励
struct U2GS_WarriorFirstKillReward_Request ->
{
	uint16	id;	// 关卡ID
};

struct GS2U_WarriorFirstKillReward_Ack <-
{
	bool		isOK;				// 是否领奖成功（正常流程下必然成功，失败没有ErrorCode）
	uint16	maxReward;	// 已领奖的最高关卡
	uint16 start;//领奖开始关卡
};