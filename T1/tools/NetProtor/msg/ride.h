// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

struct RideItem
{
	uint64 itemUID;
	uint32 number;	// 剩余可用次数
	uint8 state;	// 当前状态，1空闲，2使用中
};

// 玩家拥有的游乐道具同步信息
struct SyncRideItem <-
{
	vector<RideItem> items;
};

// 使用游乐设施
struct RequestUse ->
{
	uint64 itemUID;
	uint8 useLimit;	// 1所有人，2好友和家族成员，3仅自己
};

// 回收游乐设施
struct RequestRecycle ->
{
	uint64 itemUID;
};

// 请求使用游乐设施
struct RequestUpRide ->
{
	uint64 npcCode;	// npcCode
};

// 请求离开游乐设施
struct RequestDownRide ->
{
	
};

// 玩家状态
struct RidePlayerInfo
{
	uint64 roleID;
	uint32 seatID;   // 座位ID
};

// 玩家改变时的状态广播
struct SyncPlayerInfo <-
{
	uint64 npcCode;
	RidePlayerInfo info;
	uint8 state;	// 当前状态，1空闲，2使用中
};

// 游乐设施状态
struct RideInfo
{
	uint64 npcCode;
	uint itemID;
	uint64 ownerID;
	string ownerName;
	vector<RidePlayerInfo> players;
	uint32 number;	// 剩余可用次数
};

// 当前地图的游乐设施状态
struct SyncRideInfo <-
{
	vector<RideInfo> infos;
};

// 回收游乐设施
struct DeleteRide <-
{
	uint64 npcCode;
};