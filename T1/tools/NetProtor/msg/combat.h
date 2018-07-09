//////////////////////////////////////////////////////////////////////////
//<-发出去     ;      ->收消息
//不用使用int uint long 
//
/////////////////////////////////////////////////////////////////////////
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 
//不用使用int uint long 

// 技能攻击
struct U2GS_UseSkill ->
{
	float	x;		// 施法者坐标
	float	y;		// 
	uint64	tar_uid; // ID
	uint32 skill_id;// 技能id
	uint32 serial;  // 序列号
};

struct GS2U_UseSkill <-
{
	uint64 uid; 	 // 角色ID
	uint64 tar_uid; // ID
	uint32 skill_id;// 技能id
	uint32 serial;  // 序列号
	uint32 spell_time; //吟唱时间(毫秒)
	uint32 error_code;	// 错误码
};


// 技能打断
struct U2GS_SkillInterrupt ->
{
	uint32 skill_id;// 技能id
};

struct GS2U_SkillInterrupt <-
{
	uint64	uid; 	 // 角色ID
	uint32 skill_id;// 技能id
};

struct GS2U_SpecialMove <-
{
	uint32	type;   // 移动类型
	uint64	uid;    // 角色ID
	float	x;		// 目标点
	float	y;		//
};

