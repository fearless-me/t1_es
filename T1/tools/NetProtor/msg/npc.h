// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// npc瞬间移动消息
struct GS2U_NpcMomentMove <-
{
	uint64	npcCode;	// npcCode
	uint	npcID;		// npcid
	float	tX;			// 目标X
	float	tY;			// 目标Y
};

// 请求时空裂痕npc的信息
struct U2GS_RequestRiftNpcInfo ->
{
	uint64	npcCode;	// npcCode
};

// 返回时空裂痕npc的信息
struct GS2U_RequestRiftNpcInfo <-
{
	uint64	npcCode;
	uint	npcID;
	uint	surplusTimes;	// 时空裂痕今日剩余可领奖次数
	uint	disappearTime;	// 时空裂痕npc消失剩余时间(秒s)
	
	uint64	groupID;		// 时空分组ID
	uint	bitplaneMapID;	// 时空的位面ID
};

// 请求进入时空裂痕
struct U2GS_RequestEnterRift ->
{
	uint64	groupID;		// 时空分组ID
	uint	bitplaneMapID;	// 时空的位面ID
};

struct NpcTitle
{
	uint64	npccode;	// npccode
	string	new_title;	// npc新称号
};

// npc同步称号改变
struct GS2U_NpcTitleChange <-
{
	vector<NpcTitle> npclists;
};