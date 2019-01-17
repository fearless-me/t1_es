// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64
struct TalentInfo
{
	uint8 id;		//天赋id
	uint8 level;	//天赋等级
	uint64 nextlevelexp;		//下一级需要的天赋经验
};
struct U2GS_TalentInit ->
{
};
//初始化所有属性的等级
struct GS2U_TalentInitAck <-
{
	vector<TalentInfo> talentInfos;
};
struct U2GS_TalentLevelUp ->
{
	uint8 id;
};

struct GS2U_TalentLevelUpSuccess <-
{
	TalentInfo talentInfo;
};