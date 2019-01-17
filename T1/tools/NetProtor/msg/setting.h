// 设置相关协议
// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

struct U2GS_AllTeamInvitationSetting ->		// 拒绝所有队伍邀请
{
	uint8 onOrOff;		// 1.开；2.关
}

//变量信息
struct VariantInfo
{
	uint16 index;			//需要修改设置项的下标
	uint32 value;			//设置的值（考虑到以后的数值类设置）
};

struct SwitchVariantInfo
{
	uint32	bitIndex;		// 位索引
	bool	bitValue;		// 位值
};

struct GS2U_VariantInfo <-	//初始化变量信息
{
	vector<VariantInfo> variantList;
};

struct Any_UpdateVariant <->		// 更新数值变量
{
	vector<VariantInfo> updateVariantList;
};

struct Any_UpdateBitVariant <->
{
	vector<SwitchVariantInfo> updateVariantList; // 更新开关变量
};
