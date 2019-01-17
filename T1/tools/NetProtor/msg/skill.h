// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

//技能信息
struct SkillInfo
{
	uint	id;					//技能ID
	uint	level;				//技能等级
	uint	remainCD;			//技能剩余CD时间，单位（毫秒）
};

//升级结果
struct GS2U_SkillInfo <-
{
	uint	id;					//技能ID
	uint	level;				//技能等级
};

//升级技能
struct U2GS_UpSkill ->
{
	uint id;
	uint type; //11：一键升级; 其他值 升一级
};

//技能信息列表
struct GS2U_SkillInfoList <-
{
	uint64                code;
	vector<SkillInfo>	skillInfoList;
};

//技能升级（学习）请求
struct U2GS_UpgradeSkill_Request ->
{
	uint skillId;			//	技能 ID
};

//技能升级（学习）结果
struct GS2U_UpgradeSkill_Result <-
{
	uint resultCode;				// 技能升级结果(等级不足,钱币不足,最大等级,声望不足,能量不足,装备要求)
	SkillInfo skillinfo;
};

//技能槽的技能信息
struct SkillSlotInfo
{
	uint index;						//技能在卡槽的位置
	uint skillID;					//技能ID
};

//主动技能信息列表（玩家上线发送）
struct GS2U_InitiativeSkillSlotInfoList <-
{
	vector<SkillSlotInfo> skillSlotList;		//技能槽技能信息列表
};

//被动技能信息列表（玩家上线发送）
struct GS2U_PassiveSkillSlotInfoList <-
{
	vector<SkillSlotInfo> skillSlotList;		//技能槽技能信息列表
};

//变身技能信息列表（玩家上线发送）
struct GS2U_TransformSkillSlotInfoList <-
{
	vector<SkillSlotInfo> skillSlotList;		//技能槽技能信息列表
};

//技能开放
struct GS2U_OpenSkill <-
{
	uint skillId;                               //技能ID
	uint level;																	//角色最新等级（该消息可能在升级过程中发送，因此需要用该字段作为最新等级使用）
};

//技能槽对象
struct OpenSlot =
{
	uint8 slot;                                //技能槽编号
	uint8 type;                                //技能槽类型 1:主动技能槽 2:被动技能槽 3:变身技能
};

//技能槽开放
struct GS2U_OpenSlot <-
{
	OpenSlot  openSlot                        //技能槽类型 1:主动技能槽 2:被动技能槽 3:变身技能
};

//开放的技能槽列表
struct GS2U_OpenSlotList <- 
{
	vector<OpenSlot> slotList;               //技能槽列表 
};

//技能减少CD时间
struct GS2U_ReduceCD <-
{
	uint skillId;                              //技能ID
	uint cd;                                   //技能减少后CD
};


//技能改变
struct U2GS_ChangeSkillSlotRequest ->
{
	uint changeType;							//改变类型（添加 or 移除 0是添加，1是移除）
	int8 skillType;								//技能类型（主动技能或被动技能）
	SkillSlotInfo changeSkillInfo;				//将要改变的技能槽信息
};

//技能改变处理结果
struct GS2U_ChangeSkillSlotResult <-
{
	uint changeType;							//改变类型（添加 or 移除 0是添加，1是移除，出错为2）
	int8 skillType;								//技能类型（主动技能或被动技能）
	uint oldIndex;								//技能 以前的下标（默认为 0，表示以前没有添加此技能）
	SkillSlotInfo newSkillInfo;					//改变后的技能槽信息
};

//重置技能
struct U2GS_ResetSkill ->
{
};

///////////////////////////
// 生活技能
struct LifeSkillInfo
{
	int16 type;
	int16 level;
	int32 exp;
};
//初始化生活技能列表
struct GS2U_InitLifeSkillList <-
{
	vector<LifeSkillInfo> infos;
};

struct GS2U_UpdateLifeSkill <-
{
	LifeSkillInfo info;
};

struct U2GS_UseLifeSkill ->
{
	int16 type;	
	int64 npcCode; //钓鱼和采矿需要，其他的填0
	int64 param;
	int16 times; //倍数，制作、烹饪需要的，其他的服务器默认为1
};

struct U2GS_GiveReward ->
{
	int16 type;	
	int64 npcCode; //钓鱼和采矿需要，其他的填0
	int64 param;
};

//生活技能可用次数显示
struct lifeSkillCanUseCount
{
	int16 type;
	uint32 count;
}
struct GS2U_LifeSkillCanUseCount <-
{
	vector<lifeSkillCanUseCount> listNew;
};

struct itemInfo
{
	uint16 	itemID;		//商品ID
	uint16	itemNum;
};

struct GS2U_GiveRewardAck <-
{
	int16 type;
	vector<itemInfo> infos;
};

struct U2GS_FinishLifeSkill ->
{
	int16 type;	
};

struct U2GS_LifeSkillBuyCount ->
{
	int16 type;
	int16 count;	
};

struct GS2U_BreakLifeSkill <-
{
	int16 type;
};

struct U2GS_BuySpirit ->
{
};

//被动技能信息
struct PassiveSkillInfo
{
	uint	id;					//技能ID
	uint	level;				//技能等级
};

//被动技能升级结果
struct GS2U_PassiveSkillInfo <-
{
	uint	id;					//技能ID
	uint	level;				//技能等级
};

//被动技能升级
struct U2GS_PassiveUpSkill ->
{
	uint id;
};

//被动技能信息列表
struct GS2U_PassiveSkillInfoList <-
{
	vector<PassiveSkillInfo>	skillList;
};


//被动技能触发后飘字
struct GS2U_TriggerPassiveSkill <-
{
	uint	id;					//技能ID
	uint	level;				//技能等级
	vector<uint64> codelist;	//飘字列表
};

