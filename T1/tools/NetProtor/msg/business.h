// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 商业化内容配置
struct Business
{
	uint id; // '活动ID',
	string platformItemID; //平台订单映射ID
	string name; // '活动内容',
	string des;// '活动描述',
	string pic;// '图片MD5',
	uint8 picType;// '0默认图片，1上传图片',
	uint8 activityType;// '活动类型，1首冲，2成长基金激活，3成长基金领取，4累冲，5消费返利，6现金礼包，7每日充值，8首登现金特卖',
	uint8 isAlonePay;//是否单独计充值 0可被自己、其它0、其它1计入，可计入其它0；1可被自己计入，可计入其它0；2可被自己计入，不可计入其它0
	uint8 resetClaimNumType;// '重置次数，1按天重置，2按周重置，3按月重置',
	uint8 label;// '标签，1稀有，2热卖',
	float claimMoney;// '需要真实货币',
	uint claimGold;// '需要钻石',
	uint8 claimConsumeType;// '消费金额类型，限定3和6，即只记录绑定钻石或者钻石',
	uint claimConsume;// '消费金额',
	uint claimNum;// '购买次数限制',
	uint8 claimIsBuy;//  '开服基金是否购买',
	uint8 claimVip;//  '特权卡限制',
	uint16 claimLevel;// '等级需求',
	uint8 rewardCoinType;// '奖励货币类型',
	uint rewardCoinNum;// '奖励货币数量',
	uint rewardPackageID;// '奖励',
	uint item1;// '奖励道具ID',
	uint num1;// '奖励道具个数',
	uint item2;// '奖励道具ID',
	uint num2;// '奖励道具个数',
	uint item3;// '奖励道具ID',
	uint num3;// '奖励道具个数',
	uint item4;// '奖励道具ID',
	uint num4;// '奖励道具个数',
	uint item5;// '奖励道具ID',
	uint num5;// '奖励道具个数',
	uint item6;// '奖励道具ID',
	uint num6;// '奖励道具个数',
	uint item7;// '奖励道具ID',
	uint num7;// '奖励道具个数',
	uint item8;// '奖励道具ID',
	uint num8;// '奖励道具个数',
	uint item9;// '奖励道具ID',
	uint num9;// '奖励道具个数',
	uint item10;// '奖励道具ID',
	uint num10;// '奖励道具个数',
	uint startTime;// '开始时间',
	uint endTime;// '结束时间',
	uint giveGold;// '额外赠送的钻石数',
	uint8 isAddClaimGold;// '是否计入需要钻石,0:不计入   1:计入',
};

struct CoinConsume
{
	uint8 coinType;			// 货币类型
	uint32 value;				// 货币值
};

struct ActivityNum
{
	uint id; // '活动ID',
	uint claimNum;// '购买次数',
};

// 请求商业化内容
struct U2GS_RequestBusinessInfo ->
{
	uint8 activityType;
};

// 商业化内容（上线同步）
struct GS2U_BusinessInfo <-
{
	vector<Business> lists;
};

// 玩家的充值与购买情况（每次请求）
struct GS2U_BusinessPlayerInfo <-
{
	uint8 activityType;
	float claimMoney;// '充值的真实货币',
	uint claimGold;// '充值的钻石',
	uint8 claimIsBuy;// 开服基金是否购买
	vector<CoinConsume> claimConsume;// '消费金额类型，限定3和6，即只记录绑定钻石或者钻石',
	vector<ActivityNum> claimNum;// 活动的购买次数
};

struct BusinessCAInfo
{
	uint businessID; //累计连续充值ID
	uint8 isComplete; // 是否完成,1完成
	uint8 isReward;	// 是否领奖,1已领
	uint rechargeDiamondCount; // 累计充值钻石数量
};

// 累计连续充值情况
struct GS2U_BusinessCAInfo <-
{
	vector<BusinessCAInfo> cas;
};

// 请求领取
struct U2GS_RequestGetGift ->
{
	uint id; // '活动ID',
};

struct ActivitySuccessItem
{
	uint8 index;	// 编号
	uint itemID;// '奖励道具ID',
	uint num;// '奖励道具个数',
};

// 充值成功表现
struct GS2U_RechargeSuccess <-
{
	uint id; // '活动ID',
	uint8 activityType;
	uint claimGold;// '充值的钻石',
	float claimMoney;// '充值的真实货币',
	vector<CoinConsume> coins;	// 获得的货币奖励
	vector<ActivitySuccessItem> items; // 获得的道具奖励
};

// 以下为大转盘相关协议====================================================================================
// 大转盘的道具
struct DialItem
{
	uint8 boxType;//转盘类型
	uint8 index;//格子编号
	uint itemID;// '奖励道具ID',
	uint num;// '奖励道具个数',
};

struct GS2U_DialItemList <-
{
	vector<DialItem> items;
};

// 大转盘抽奖消耗与幸运值
struct DialCost
{
	uint id;	// 消耗ID
	string des;
	uint8 boxType;
	uint8 coinType;
	uint coinNum;
	uint16 times;	// 抽取次数
	uint16 addLuckValue;	// 增加的幸运值
	uint16 maxLuck;
};

struct GS2U_DialCostList <-
{
	vector<DialCost> costs;
};


// 大转盘的宝箱奖励
struct DialReward
{
	uint8 boxType;//转盘类型
	uint16 needTimes;//转动次数
	uint itemID1;//奖励道具ID
	uint num1;// 奖励道具个数
	uint itemID2;//奖励道具ID
	uint num2;// 奖励道具个数
	uint itemID3;//奖励道具ID
	uint num3;// 奖励道具个数
};

struct GS2U_DialRewardList <-
{
	vector<DialReward> rewards;
};

// 请求自己的转盘信息(打开转盘)
struct U2GS_RequestSelfDialInfo ->
{
};

struct SelfDialInfo
{
	uint8 boxType;//转盘类型
	uint16 haveTimes;//转动次数
	vector<uint16> getTimes;//领取到的次数
	uint16 haveLuck;//拥有幸运值
};

// 个人信息
struct GS2U_SelfDialInfo <-
{
	vector<SelfDialInfo> infos;
};

// 请求转转转
struct U2GS_RequestJqueryrotate ->
{
	uint8 boxType;	//转盘类型
	uint id;	// 消耗ID
};

// 请求领宝箱
struct U2GS_RequestGetBox ->
{
	uint8 boxType;	//转盘类型
	uint16 getTimes;	//领取哪个次数对应的宝箱
};

// 返回抽奖结果,(U2GS_RequestJqueryrotate与U2GS_RequestGetBox均返回本协议)
struct GS2U_JqueryrotateResult <-
{
	uint8 type;	// 1表示转盘结果，2表示领取宝箱结果
	SelfDialInfo info;	// 抽奖后的信息
	vector<DialItem> results;	// 奖品
};
// 以上为大转盘相关协议====================================================================================