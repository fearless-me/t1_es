// 设置相关协议
// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

//红包领取日志
struct takeHistory
{
	uint64 takeRoleID;
	string takeName;
	uint32 takeTime;
	uint32 takeMoney;
}

//红包信息
struct redEnvelopeBaseInfo
{
	uint64	redUID;//红包id,
	uint64	creatorRoleID;
	uint64	targetUID;//指定对象UID，玩家ID/0表示不指定玩家，军团ID，地图ID
	string	luckContent;//祝福语
	string	creatorName;//发红包的玩家名
	uint32	creatorLevel;//
	uint8	type;	//	红包类型:1定额，2随机
	uint8	targetType;	//	红包类型:1世界，2军团，3结婚，4地图
	uint32	creatorCareer;//发红包玩家的职业id
	uint8	creatorRace;//发红包玩家的种族
	uint8	creatorSex;//发红包玩家的性别
	int32	creatorHead;//发红包玩家的头
	uint32	allMoney;//
	uint32	allNumber;//红包发的总个数
	uint32	takenMoney;//红包已经领取钱
	uint32	takenNumber;//红包已经领取个数
};

//红包信息
struct redEnvelopeInfo
{
	redEnvelopeBaseInfo baseInfo;
	vector<takeHistory> takenList;//已经领取的记录
};


//红包日志数据
struct redEnvelopeHistory
{
	uint64 redUID;//红包id,
	uint64 creatorRoleID;
	string creatorName;//发红包的玩家名
	uint32 createTime;//发红包的时间
	uint8  targetType;//1世界，2军团，3结婚，4地图
	int32  moneyNumber;//抢到的钱或发的红包总额
};

//发红包
struct U2GS_SendRedEnvelope ->
{
	uint8	type;	//	红包类型:1定额，2随机
	uint8	targetType;//1世界，2军团，3结婚，4地图,5为指定玩家红包
	uint64	targetUID;//指定对象UID，玩家ID/0表示不指定玩家，军团ID，地图ID
	uint32	allNumber;//目标人数：0不限制
	uint32	allMoney;//
	string	luckContent;//祝福语
};

//抢红包
struct U2GS_RobRedEnvelope ->
{
	uint64	redUID;//红包id,
};

//抢红包Ack
struct GS2U_RobRedEnvelopeAck <-
{
	uint32 robAmount;//抢到的数额
	redEnvelopeInfo red;
};

//根据红包id取红包信息
struct U2GS_RedEnvelopeInfo ->
{
	uint64 redUID;//红包id
};

//根据红包id取红包信息Ack  查看详情
struct GS2U_RedEnvelopeInfoAck <-
{
	redEnvelopeInfo red;//红包信息
};

//红包日志
struct U2GS_RedEnvelopeHistory ->
{
};

//红包日志数据
struct GS2U_RedEnvelopeHistoryAck <-
{
	vector<redEnvelopeHistory> historyList;
};

//请求可抢红包
struct U2GS_RedEnvelopeQuery ->
{
	uint8	targetType;//1世界，2军团，3结婚，4地图,5为指定玩家红包
};

//请求可抢红包
struct GS2U_RedEnvelopeQuery <-
{
	vector<redEnvelopeBaseInfo> redEnvelopeList;
};

//玩家放弃抢本轮红包
struct U2GS_GiveUpRedEnvelope ->
{
};
