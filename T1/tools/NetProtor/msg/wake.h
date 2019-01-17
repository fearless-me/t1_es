// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64


//女神觉醒信息
struct WakeInfo
{
	uint8   cardID;					//女神卡片ID
	uint8	level;					//觉醒等级 0:表示已经激活
	uint16	curNum;					//当前升级数量	
	uint16  activeProgress;			//以100为基数 99就是 99%， =100可以解锁，10000已经解锁
	uint8	unlockStateMax;			//解锁的最大状态
	uint8	curState;				//使用状态
};

//女神觉醒信息列表
struct GS2U_WakeInfoList <-
{
	vector<WakeInfo> wakeInfoList;	
};

//激活或者成长女神觉醒
struct U2GS_UpWakeInfo ->
{
	uint8  cardID; //女神卡片ID
	uint16 num;	   //物品数量
};

//女神觉醒升级
struct U2GS_UpGradeWakeInfo ->
{
	uint8	cardID; //女神卡片ID
};

//成长后女神觉醒
struct GS2U_WakeInfo <-
{
	WakeInfo wakeInfo;
};

//女神觉醒一键升级
struct U2GS_OnKeyUpWakeInfo ->
{
	uint8	cardID; //女神卡片ID
};

//召唤女神
struct U2GS_CallGoddess ->
{
	uint8  cardID;	
};

//解锁状态
struct U2GS_UnlockState ->
{
	uint8 cardID;
	uint8 state;
};

//解锁状态
struct U2GS_ChangeState ->
{
	uint8 cardID;
	uint8 state;
};

//解锁状态
struct GS2U_GoddessActiveSkill <-
{
	uint skillID; //技能ID
};

//解锁女神
struct U2GS_UnlockCard ->
{
	uint8 cardID;
};




