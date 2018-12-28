//////////////////////////////////////////////////////////////////////////
//<-发出去     ;      ->收消息
//不用使用int uint long 
// 支持使用 string float int32 uint32 int64 uint64
/////////////////////////////////////////////////////////////////////////
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long


// 请求发送初始化数据
struct U2GS_GetPlayerInitData ->
{
};

// skill 数据
struct SkillInfo
{
	uint32 skill_id;
	uint32 level;
	uint32 cd_time;
	uint32 slot_index;//技能盘孔位
};

// 测试用
struct GS2U_PlayerInitBase <-
{
	uint64	uid;	// 角色ID
	string	name;	// 角色名
	int32	level;	// 等级
	int32	camp;	// 阵营
	int32	race;	// 种族
	uint32	career;	// 职业
	int32	sex;	// 性别
	int32	head;	// 头
	uint32	mapID;	// 角色所在当前地图ID
	vector<int32> combat_props;
	vector<BuffInfo> buff_list;
	vector<SkillInfo> skill_list;
};

// 初始化数据发送完毕
struct GS2U_GetPlayerInitDataEnd <-
{	
};


//
struct GS2U_RemoveRemote <-
{
	vector<uint64> uid_list;
}

// 切地图
struct U2GS_ChangeMap ->
{
	uint32 map_id;
	float x,
	float y
};

// 进入地图信息
struct GS2U_GotoNewMap <-
{
	uint16	map_id;			// 角色所在当前地图ID
	float	x;				//坐标X
	float	y;				//坐标Y
};

// 移动
struct GS2U_SyncWalk <-
{
	uint64	uid;	 // 唯一ID
	float	src_x;	 //坐标X
	float	src_y;	 //坐标Y
	float	dst_x;	 //坐标X
	float	dst_y;	 //坐标Y
	int32	move_time; //移动时间（毫秒）  
	float	speed; //移动速度
};

// 标准
struct GS2U_SyncStand <-
{
	uint64  uid;	 //唯一ID
	float	cur_x;	 //坐标X
	float	cur_y;	 //坐标Y
};

// 获取远程对象
struct U2GS_GetRemoteObjInfo ->
{
	vector<uint64> uids; // 唯一ID列表
};

struct GS2U_RemotePlayer <-
{
	uint64  uid;	 //唯一ID
	int32   level; 	 //等级
	string  name;	 //名字
	int32	career;	 //职业
	int32	race;	 //种族
	int32	hp_percent;	//当前百分比
	float	cur_x;	 //坐标X
	float	cur_y;	 //坐标Y
};

struct GS2U_RemoteMonster <-
{
	uint64  uid;	 //唯一ID
	uint32	did;	 //配置表ID
	int32   level;	 //等级	
	int32	hp_percent;	//当前百分比
	float	cur_x;	 //坐标X
	float	cur_y;	 //坐标Y
};

struct GS2U_RemotePet <-
{
	uint64  uid;	 //唯一ID
	uint64 	owner;   //主人
	uint32	did;     //配置表ID
	int32   level;   //等级
	float	cur_x;	 //坐标X
	float	cur_y;	 //坐标Y
};

struct GS2U_RemoteNpc <-
{
	uint64  uid;	 //唯一ID
	uint32	did;     //配置表ID
	int32   level;   //等级
	float	cur_x;	 //坐标X
	float	cur_y;	 //坐标Y
};

// 移动到目标点，包含请求的移动速度
struct U2GS_PlayerWalk ->
{
	float	dst_x; //坐标X
	float	dst_y; //坐标Y
	float	speed; //移动速度
};

struct U2GS_PlayerStopWalk ->
{
	float	cur_x;	 //坐标X
	float	cur_y;	 //坐标Y
};

struct U2GS_HearBeat ->
{
};

struct GS2U_HearBeat <-
{
	uint32 now;
};

struct GS2U_KickByServer <-
{
	string reason; // 1 心跳超时 (后面换成ErrorCode)
};

struct U2GS_ExitGame ->
{
}; 

// 聊天消息(服务端发送)
struct GS2U_Chat <-
{
	int32   channel;		//频道
	uint64 uid;		    //发送者ID
	string content;		//内容
};

// 聊天消息(客户端发送)
struct U2GS_Chat ->
{
	int32 channel;			//频道
	uint64 receiver;		//接收者ID
	string content;			//内容
};




