// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 测试相关的协议

// 
struct GS2U_GridPlayerRotw <-
{
	int rotw;	// 角度
	vector<uint64> codes;	// 目标玩家列表
};