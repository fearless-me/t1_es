// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64


//条件结构
struct Conditions
{
	uint	cluesID;   //线索ID
	bool    condComplete; //是否完成
}
//奖励结构
struct FloatingAward
{
	uint	pieceID;   //碎片ID
	bool    isGeted; //是否领取
}

// 奖励列表   登录会发，完成一个碎片会发
struct GS2U_FloatingAward <-
{
	vector<FloatingAward> rewardList; //奖励列表
};

// 漂浮进度  登录发，完成一个线索会发
struct GS2U_FloatingSchedule <-
{
	uint	lastcluesID;   //最后一个线索ID
	bool    isInit;      //是否登录初始化
	vector<Conditions> condList; //每个线索的条件列表
};

// 领取奖励
struct U2GS_RequestFloatingAward -> 
{
	uint	pieceID;   //碎片ID
};

// 领取奖励结果
struct GS2U_ReceiveFloatingAward <- 
{
	bool    isSuccss;    //是否领取成功
	FloatingAward reward; //奖励
};