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


