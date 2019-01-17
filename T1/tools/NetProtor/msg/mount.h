// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64


//坐骑信息
struct MountInfo
{
	uint8	level;               	// 坐骑等级
	uint8	state;               	// 坐骑状态0:休息1:召唤
	uint 	curProcess;				// 坐骑当前进度
	uint16	shape_id;				// 坐骑外观（升级之后可能改变）
};

//坐骑
struct GS2U_LookMountInfo <-
{
	MountInfo	  mountInfo; //坐骑信息列表
};

//坐骑的外观列表(玩家获取的外观，包括购买的和升级获得的)
struct GS2U_MountShapeList <-
{
	vector<uint16>	shape_list;
};

//上坐骑
struct U2GS_OnMount ->
{
};

//下坐骑
struct U2GS_OffMount ->
{
};

// 坐骑喂养
struct U2GS_FeedMount ->
{
	uint16 feedNum;			//喂养数量
};

// 玩家获得新的坐骑外观
struct GS2U_NewMountShape <-
{
	uint16	new_shape_id;
};

// 坐骑易容
struct MountShapeShift <->
{
	uint16	new_shape_id;		//新的外观ID
};

//服务器返回坐骑系列操作结果（广播给其它玩家）
struct GS2U_MountAck <-
{
   uint64      code;           //主人CODE
   uint16      shape_id;       //坐骑ID
   uint        opreate;        //1:上坐骑2:下坐骑
};

