// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 打开天梯1v1界面
struct U2GS_OpenLadder1v1 ->
{
	
};

// 对手信息
struct LadderTargetInfo
{
	uint64 roleID;
	string name;
	uint16 level;	// 等级
	uint32	career;	// 职业
	uint ranksort;	// 当前排名
	uint fightingCapacity;	// 战斗力
	int8 sex;	// 性别
	int8 race;	// 种族
};

// 自己的信息
struct SelfBattleInfo
{
	uint ranksort;	// 当前排名
	uint fightingCapacity;	// 战斗力
	uint exploit;	// 累积功勋
	uint16 cur_ChallengeTimes;	// 当前完成的挑战次数
	uint16 max_ChallengeTimes;	// 今日最大的挑战次数
	uint8 moneyType;	// 本次挑战需要消耗的金钱类型
	uint money;		// 本次挑战需要消耗的金钱(每日超过5次挑战要收费)
	uint16 cur_win;	// 当前连胜次数
	uint16 max_win;	// 最高连胜次数
	uint win_times;	// 累积胜利次数
	uint surplusSec;	// 发奖剩余秒数
	uint exploitValue;	// 本次预计可领功勋
};

// 返回筛选的对手
struct GS2U_LadderTargetList <-
{
	vector<LadderTargetInfo> targets;	// 对手列表，注意：size =< 6
	SelfBattleInfo selfInfo;	// 自己的信息
};

// 刷新对手(返回 GS2U_LadderTargetList)
struct U2GS_FreshLadderTargetList ->
{
	
};

// 按排名挑战对手
struct U2GS_ChallengeTargetByRank ->
{
	uint ranksort;	// 当前排名
	string name;   //目标名字
};

// 按对象挑战对手
struct U2GS_ChallengeTargetByRoleID ->
{
	uint64 roleID;	// 对手roleID
};

// 放弃挑战
struct U2GS_GiveUpChallenge ->
{
	
};

// 获取对象的模型相关信息(返回rank.h GS2U_SendPropList 这个协议)
struct U2GS_RequestPlayerInfo ->
{
	uint64 roleID;	// roleID
};

// 请求王者列表
struct U2GS_RequestKingList ->
{
	
};

struct KingRole
{
	uint64 roleID;	// roleID
	uint ranksort;	// 当前排名
	uint32	career;	// 职业
	string roleName;
	uint worshipTimes;	// 被膜拜次数
};

// 返回王者列表
struct GS2U_ReturnKingList <-
{
	vector<KingRole> kings;	// 王者列表
};

// 膜拜王者
struct U2GS_WorshipTarget ->
{
	uint64 roleID;	// roleID
	string roleName;
};

// 请求对战记录
struct U2GS_RequestBattleNotes ->
{
	
};

// 十连杀与终结信息
struct LadderLS
{
	uint64 roleID; // 胜利者
	string roleName;
	bool isTerminator; // 是否是终结者，true表示终结对象
	uint16 ls_times; // 连胜次数
	uint64 targetID; // 失败者，目标
	string targetName;
};

// 自己的对战记录
struct LadderMatchInfo
{
	uint64 roleID; // 自己
	string roleName;
	bool isChallenge; // true挑战者,false被挑战者
	bool isWin; // true胜利,false失败
	uint64 targetID; // 目标
	string targetName;
	uint rank1; // 挑战前排名
	uint rank2; // 挑战后排名
};

// 返回对战记录
struct GS2U_BattleNotes <-
{
	vector<LadderLS> lsInfo;
	vector<LadderMatchInfo> selfInfo;
};

// 准备开始，倒计时秒
struct GS2U_PrepareSec <-
{
	uint8 second;	// 剩余秒数，客户端自行倒计时
};

// 比赛开始，倒计时秒
struct GS2U_BattleStartSec <-
{
	uint second;	// 战斗剩余秒数
};

// 战斗结果
struct GS2U_Ladder1v1BattleEnd <-
{
	uint8 result;	// 0失败，1胜利
	uint exploit;	// 累积功勋
	uint rank; // 最新排名
};

// 针对小号不用完成任务也可以提交aruna经验任务
struct U2GS_AtuoSubmitTask ->
{
};