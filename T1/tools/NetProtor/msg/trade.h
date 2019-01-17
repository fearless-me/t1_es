// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

///////////////////////////////////////////////////////////////////////
// 注，因LUNA策划修改功能，以下所有协议
// tradeClass 交易类型，1金币交易，保留但屏蔽相关功能
// itemClass 道具类型，1为装备道具equip，保留但屏蔽相关功能
// sortIndex 新增6单价排序
///////////////////////////////////////////////////////////////////////

// 请求商品参考价
struct U2GS_ReferenceItem ->
{
	uint8 tradeClass;	// 查询类型，1金币交易,2钻石交易,3指定交易
	uint32 itemID;	// 道具编号ID
	uint16 requestNumber;	// 请求个数
}

struct ReferenceItem
{
	uint32 itemID;	// 道具编号ID
	uint16 sellNumber;	// 出售道具个数
	uint32 gold;	// 金币
	uint32 diamond;	// 钻石
}

// 返回上架参考
struct GS2U_ReferenceItem <-
{
	uint8 tradeClass;	// 查询类型，1金币交易,2钻石交易,3指定交易
	vector<ReferenceItem> referenceItems;	// 参考列表
	ReferenceItem referenceItem;	// 最近成交(停服后清空)
}

// 请求成交记录
struct U2GS_RequestDealRecord ->
{
	int8 oneNumber;	// 查询条数，-1表示一次性取所有的记录
	uint8 pageNumber;	// 当前页数
	uint8 opCode;	// 操作码
}

//装备属性值列表--交易数据中需要增加属性信息
struct QueryEquipPropInfo
{
	uint8  propType;     //装备属性类型  1:基础属性, 2:附加属性(未重铸)  3:附加属性(不可重铸) 4.附加属性(已重铸) 
	uint8  propKey;      //属性标识主键  对应propType 如propType = 1时，propKey为属性ID
	uint16 propAffix;    //属性词缀
	bool   calcType;     //属性计算类型  false加法  true乘法
	float  propValue;	 //属性值
};

struct DealRecord
{
	uint64 itemUID;	// 出售者原装备唯一ID
	uint32 itemID;	// 道具编号ID
	uint8 sellType;	// 出售类型,1金币交易,2钻石交易,3指定交易
	uint8 buyorsell;	// 1购买，2出售
	uint64 dealTime;	// 成交时间s
	uint32 gold;	// 金币
	uint32 diamond;	// 钻石
	uint32 tax;	// 税
	vector<QueryEquipPropInfo> equipProps;   //装备属性列表--如果是装备才会有这个数据
}

// 返回成交记录
struct GS2U_DealRecord <-
{
	uint8 opCode;		// 操作码
	uint32 number;		// 总条数
	vector<DealRecord> dealRecord; // 结果列表
};


// 查询交易行的订单列表
struct U2GS_QueryTrade ->
{
	uint8 tradeClass;	// 查询类型，1金币交易,2钻石交易,3指定交易
	uint8 itemClass;	// 道具类型, 1为装备道具equip，2为普通道具item
	vector<int8> itemTypeList;	// 道具主类型列表,不过滤为空
	int8 itemSubType;	// 道具子类型,不过滤为-1
	vector<uint32> itemList;	// 指定的道具ID的名称列表（每项均是全匹配）
	int16 career;		// 职业，不过滤为-1
	int8 itemLvlMin;	// min lvl,不过滤为-1
	int8 itemLvlMax;	// max lvl,不过滤为-1
	int8 itemQuality;	// 品质过滤,不过滤为-1
	int8 oneNumber;	// 每一页显示的条数，-1表示一次性取所有的记录
	uint8 opCode;		// 操作码
};

// 首次打开界面，获取最新上架记录
struct U2GS_QueryNewestTrade ->
{
	uint8 tradeClass;	// 查询类型，1金币交易,2钻石交易,3指定交易
	uint8 getNumber;	// 需要查询最新记录的条数
	int8 oneNumber;	// 每一页显示的条数，-1表示一次性取所有的记录
	uint8 opCode;		// 操作码
};

// 跟据上一次查询结果，查询下一页
struct U2GS_NextResult ->
{
	uint32 pageNumber;	// 查询第几页
	uint8 opCode;		// 操作码
};

// 排序
struct U2GS_ResultSort ->
{
	uint8 sortIndex;	// 对什么排序，1品质，2等级，3剩余时间，4出售人，5售价，6单价
	uint32 pageNumber;	// 排序后获取第几页
	uint8 sortType;		// 排序方式,0无序,1升序,2降序
	uint8 opCode;		// 操作码
};

// 查询自己的交易订单
struct U2GS_QuerySelfTrade ->
{
	uint8 tradeClass;	// 查询类型，1金币交易,2钻石交易,3指定交易，0查询所有自己的订单
	uint8 opCode;		// 操作码
};

// 购买
struct U2GS_TradeBuy ->
{
	uint8 tradeClass;	// 类型，1金币交易,2钻石交易,3指定交易
	uint64 orderID;	// 订单ID
	uint8 opCode;		// 操作码
};

// 拒绝购买
struct U2GS_TradeRefuse ->
{
	uint8 tradeClass;	// 类型，1金币交易,2钻石交易,3指定交易
	uint64 orderID;	// 订单ID
	uint8 opCode;		// 操作码
};

// 上架
struct U2GS_PutTrade ->
{
	uint8 tradeClass;	// 类型，1金币交易,2钻石交易,3指定交易
	uint64 itemUID;	// 出售者原装备唯一ID
	uint32 itemID;	// 道具编号ID
	uint16 sellNumber;	// 出售道具个数
	uint8 sellTime; // 出售时长(单位小时)
	uint32 gold;	// 金币
	uint32 diamond;	// 钻石
	string destRoleName;	// 指定卖给谁
	uint8 opCode;		// 操作码
};

// 下架
struct U2GS_DownTrade ->
{
	uint8 tradeClass;	// 类型，1金币交易,2钻石交易,3指定交易
	uint64 orderID;	// 订单ID
	uint8 opCode;		// 操作码
};

// 购买，上架，下架，拒绝购买等的操作结果
struct GS2U_OpTradeResult <-
{
	uint8 tradeClass;	// 类型，1金币交易,2钻石交易,3指定交易
	uint64 orderID;	// 订单ID
	uint8 result;		// 结果
	uint8 opCode;		// 操作码
};

struct QueryTradeList
{
	uint64 orderID;	// 订单ID
	uint64 itemUID;	// 出售者原装备唯一ID
	uint32 itemID;	// 道具编号ID
	string roleName; // 出售者角色姓名
	uint8 sellType;	// 出售类型,1金币交易,2钻石交易,3指定交易
	uint64 putTime;	// 上架时间s
	uint64 downTime;	// 下架时间s
	uint32 gold;	// 金币
	uint32 diamond;	// 钻石
	string destRoleName;	// 指定卖给谁
	uint8 quality;	// 品质
	uint8 itemLevel;	// 道具等级
	uint32 pileCount; // 堆叠数量
	vector<QueryEquipPropInfo> equipProps;   //装备属性列表--如果是装备才会有这个数据
};

// 查询交易行的订单列表
struct GS2U_QueryTrade <-
{
	uint8 opCode;		// 操作码
	uint8 sortType;		// 排序方式,0无序,1升序,2降序
	uint8 sortIndex;	// 对什么排序，1品质，2等级，3剩余时间，4出售人，5售价，6单价
	uint32 pageNumber;	// 第几页
	uint64 nowTime;		// 当前时间
	vector<QueryTradeList> queryTradeList; // 结果列表
};

// 本次查询的订单记录信息
struct GS2U_QueryTradeInfo <-
{
	uint8 opCode;		// 操作码
	uint8 tradeClass;	// 查询类型，1金币交易,2钻石交易,3指定交易
	uint8 itemClass;	// 道具类型, 1为装备道具equip，2为普通道具item
	vector<int8> itemTypeList;	// 道具主类型,为空不过滤
	int8 itemSubType;	// 道具子类型,不过滤为-1
	int allNumber;	// 总共有多少条记录
};

// 购买成功提示音
struct GS2U_BuyTradeSuccess <-
{

};
// 购买失败提示音
struct GS2U_BuyTradeFaild <-
{

};