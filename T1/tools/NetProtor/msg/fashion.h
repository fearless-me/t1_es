// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 时装信息 NOTE: 未获取不发
struct FashionInfo
{
	uint32			fashionID;	// 时装ID
	uint32			time;		// 剩余时间 小于等于0：过期 大于0：对应的秒数
};

// 返回时装列表
struct GS2U_FashionList <-
{
	vector<FashionInfo> datas;
};

// 购买时装
struct U2GS_BuyFashion ->
{
	uint16			itemID;     // 道具ID
	uint32			fashionID;	// 时装ID
	uint32			time;		// 购买时间, 0: 永久 > 0：时限时装 单位：秒
	uint8			type;		//（废弃）
};

// 穿卸时装
struct U2GS_OperateFashion ->
{
	uint32			fashionID;	// 时装ID
	bool			flag;		// 0:卸载   非0：穿戴
};

// 时装操作结果
struct GS2U_FashionResult <-
{
	uint32			fashionID;	// 时装ID
	uint8			type;		// 0: 购买 1：穿戴 2：卸载
	uint32			value;		// 0: 失败 非0: 成功 购买成功则为对应的购买时间
};

// 时装可是标示， 用二进制标示 第一位：衣服 第二位：副手 最后一位：衣服
struct U2GS_IsDisplayFashion ->
{
	int8			flag;		// 0: 不显示  1：显示
};

// 衣帽间升级
struct U2GS_FashionRoomLevelUp ->
{
};

// 衣帽间升级成功
struct GS2U_FashionRoomLevelUp <-
{
	uint32 roomLevel;
};

// 激活套装
struct U2GS_ActiveFashionSuit ->
{
	bool			flag;		// 0:卸载   非0：穿戴
	uint32			fashionSuitID;	// 激活套装ID
};

// 激活套装列表
struct GS2U_ActiveFashionSuitList <-
{
	vector<uint32>			activeFashionSuitList;	// 已经激活的套装列表
};

//时装购买/赠送请求
struct U2GS_FashionBuyRequest ->
{
	int id;//活动的ID
	int sex;//性别
	uint itemid;//道具ID
	uint64	tarRoleID; //0,给自己， 否则给其他人买
	string give;//赠送语
};

//被赠送者收到时装反馈
struct getFashionGiftAck
{
	uint fashionID;//时装ID
	uint itemid;//道具ID
	uint64 giveRole;//赠送者的角色ID
	string giveName;//赠送者的角色名
	string give;//赠送语
}

struct GS2U_FashionGiftAck <-
{
	vector<getFashionGiftAck> getFashionGiftAckList;
}

//致谢赠送者
struct U2GS_FashionThanksMail ->
{
	string beGiveName;//被赠送者角色名
	string giveName;//赠送者的角色名
	uint64 giveRole;//赠送者的角色ID
}
