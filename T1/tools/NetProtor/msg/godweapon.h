// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

struct GodWeaponInfo
{
	uint8 weaponID;
	uint16 weaponLevel;
	uint16 skillLevel;
};
//初始化
struct GS2U_InitGodWeapon <-
{
	vector<GodWeaponInfo> infos;
}
//神器升级
struct U2GS_LevelUpGodWeapon ->
{
	uint8  weaponID;
}
//神器升级结果
struct GS2U_LevelUpGodWeaponResult <-
{
	uint8 weaponID;
	uint16 weaponLevel;
	uint32 exp;
	uint16 wakeSkillLv;
}
//技能升级
struct U2GS_LevelUpGodWeaponSkill ->
{
	uint8  weaponID;
}
//技能升级结果
struct GS2U_LevelUpGodWeaponSkillResult <-
{
	uint8 weaponID;
	uint16 skillLevel;
}