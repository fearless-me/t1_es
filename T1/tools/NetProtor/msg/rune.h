// 设置相关协议
// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

//查看符文tips
struct U2GS_QueryRuneTips ->
{
	uint64 runeUID;
};

struct GS2U_QueryRuneTipsAck <-
{
	RuneInfo info;
};

//符文格子数量
struct GS2U_RuneGrid <-
{
	uint8 ownerID;	// 1表示玩家，2表示宠物的符文
	uint16 cur;
	uint16 max;
};

//开启格子
struct U2GS_OpenRuneGrid ->
{
	uint8 ownerID;	// 1表示玩家，2表示宠物的符文
	uint16 openNumber;
};

//删除符文
struct DeleteRunes <->
{
	vector<uint64> runeUIDS;
};

//符文属性
struct RuneBaseProp
{
	int prop;      //这个是 相对应的属性ID，或者技能ID
	uint8 calcType; // 属性计算方式：0加法，1乘法
	float value;  
};

//符文随机属性
struct RuneRandProp
{
	RuneBaseProp prop;
	uint32 indexNumber;	// 序号
};

//符文对象
struct RuneInfo
{
	uint64  runeUID;
	uint32  pos;	// 0为背包，1为玩家穿戴中，其它为某个宠物ID穿戴中
	uint32  runeID;
	uint8	level; // 品阶
	uint32  exp;
	bool 	isBind;
	uint32  validSecond; // 剩余有效时间，单位秒，为0表示永久有效
	uint8	subType; // 部位
	uint8	turnPosNum; // 转换部位次数
	vector<RuneBaseProp> baseProps; //基础属性
	vector<RuneRandProp> randProps; //随机属性
	vector<RuneRandProp> skillProps; //技能附加属性
};

//符文列表
struct GS2U_RuneInfoList <-
{
	vector<RuneInfo> runeList;
};

//远程玩家的符文列表，供查看远程玩家使用
struct GS2U_RPRuneInfoList <-
{
	uint64 targetRoleID;
	vector<RuneInfo> runeList;
};

//请求符文的套装属性
struct U2GS_RequestSuitProp ->
{
	uint32 ownerID;	// 1表示玩家自身，其它ID表示对应宠物
};

//符文套装属性
struct RuneSuitProp
{
	vector<RuneBaseProp> props;
	uint32 suitID;	// 套装ID
	uint8 suitNum;	// 套装件数
	uint32 ownerID;	// 1表示玩家自身，其它ID表示对应宠物
};

//符文卸载和镶嵌的时候，下发操作的单个套装属性
struct GS2U_RuneSuitPropList <-
{
	vector<RuneSuitProp> suitProps;
};

//符文拆卸
struct U2GS_RuneEmbedOff ->
{
	vector<uint64> runeUIDs;     //符文UID
};

struct GS2U_RuneEmbedOffAck <-
{
	vector<RuneInfo> runeList;
};

//符文镶嵌
struct RuneEmbedOn ->
{
	vector<uint64> runeUIDs;   //符文UID
	uint32         targetID;   //镶嵌到玩家身上为1，镶嵌到宠物身上为宠物ID
};

struct GS2U_RuneEmbedOnAck <-
{
	uint32  targetID;   //镶嵌到玩家身上为1，镶嵌到宠物身上为宠物ID
	vector<RuneInfo> runeList;
};



//出售圣物   
struct U2GS_SellRune ->
{
	uint64 targetRuneUID;	// 目标UID
};
//圣物套装部位改变
struct U2GS_RuneTurnPos ->
{
	uint64 targetRuneUID;	// 目标符文UID
};
//圣物套装部位改变结果
struct GS2U_RuneTurnPosAck <-
{
	RuneInfo runeInfo;
};
//符文熔炼
struct U2GS_RuneMelt ->
{
	uint64 targetRuneUID;	// 目标符文UID
};

//熔炼成功结果，失败不返回结果，只提示
struct GS2U_RuneMeltAck <-
{
	RuneInfo runeInfo;
};

//是否保留熔炼结果
struct U2GS_RuneReserve ->
{
	 bool isReserve;  //true 保留，false放弃
};
//符文洗练
struct U2GS_RuneCast ->
{
	uint64 targetUID;  //目标
	uint32 indexNumber;	//目标随机属性序号
	uint64 materialUID;  //材料
};

//符文洗练出的属性
struct GS2U_RuneCastProp <-
{
	uint64 flagID;	// 标识
	RuneBaseProp oldprop;	// 老的属性
	RuneBaseProp newprop;	// 洗练出的属性
};

//确认或者放弃
struct U2GS_RuneCastAffirm ->
{
	uint64 flagID;	// 标识
	bool isAffirm;	// true确认，false放弃
};

//符文成功洗练结果，失败提示errorcode
struct GS2U_RuneCastAck <-
{
	RuneInfo runeInfo;
	vector<uint64> runeUIDS;	//删除的符文UID列表
};

//圣物融合
struct U2GS_RuneFuse ->
{
	uint64 targetRuneUID;	// 目标圣物UID
	uint64 materialUID;  //副圣物材料
	uint8  fuseType;     //融合类型1普通，2铸造融合
	uint64 targetPropKey; //替换主圣物指定的技能ID
    uint64 materialPropKey; //指定一个副圣物技能 替换主圣物技能，只有铸造融合才行,普通融合 这个发0过来
	bool  isUseFuseStone;  //是否使用 融合石，增加成功率
};
//圣物融合结果
struct GS2U_RuneFuseAck <-
{
	RuneInfo runeInfo;
	vector<uint64> runeUIDS;	//删除的符文UID列表
};

//圣物合成
struct U2GS_RuneCompound ->
{
	uint8 quality;   //一件合成品质，>0代表就是一键合成else 用下面单个合成
	uint8 level;   //一件合成等级，其他合成0
	vector<uint64> materialUIDS;  //合成材料，必须是同等级，同品质圣物
};

//圣物合成结果
struct GS2U_RuneCompoundAck <-
{
	vector<RuneInfo> runeList;
    bool isOneKeyCompound;  //是否一键合成
};

// 通过GM指令打开符文面板
struct GS2U_RuneOpenBorad <-
{
    int code;
};
