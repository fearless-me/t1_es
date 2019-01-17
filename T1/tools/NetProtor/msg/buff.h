// -> client to server
// <- server to client
// <-> client & server
struct GS2U_BuffInfo <-
{
    uint64          code;          //目标Code
	uint64          buffUID;       //Buff唯一标识符
	uint            buffID;        //BuffID
	uint            skillID;       //技能ID
	uint            level;         //等级
	uint8	        flag;          //标记字段 flag = 0 增加 flag = 1 删除 flgo = 2 替换
	uint32 			serial;		   //序列号
	int32           endTime;       //剩余时间
};

struct GS2U_BuffHurt <-
{
    uint64          code;          //目标Code
    uint64          buffUID;       //Buff唯一标识符
	uint            buffID;        //BuffID
	int	            damageHp;      //Buff伤害血量
	uint8           hp_per;		  //当前血量百分比
};

struct U2GS_DelBuff ->
{
	uint64          code;          //目标Code
	uint            buffID;        //BuffID
};

// 购买BUFF
struct U2GS_BuyBuff ->
{
	uint id;
};

// 购买成功，失败提示code
struct GS2U_BuyBuffSuccess <-
{
	uint id;
};