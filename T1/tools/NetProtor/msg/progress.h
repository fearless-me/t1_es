//////////////////////////////////////////////////////////////////////////
//<-发出去     ;      ->收消息
// 不用使用int uint long 
// 支持使用 string float int32 uint32 int64 uint64
/////////////////////////////////////////////////////////////////////////
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 

// 服务器进度同步
struct GS2U_ProgressSync <-
{	
	uint64 uid;
	uint64 object_uid;
	uint flag_id;
	uint16 progress_type;
	uint32 time_ms;	// 进度持续时间，毫秒
	uint8 phase;	// 阶段，1start，2break，3hit
	uint32 param;	// 参数，可能是技能ID，采集物ID等
};

// 客户端主动打断进度
struct U2GS_BreakProgress ->
{
	uint flag_id;
};

//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 

