//////////////////////////////////////////////////////////////////////////
//<-发出去     ;      ->收消息
//不用使用int uint long 
// 支持使用 string float int32 uint32 int64 uint64
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

// 使用技能
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

// 技能打断
struct GS2U_SkillInterrupt <-
{
	uint64	uid; 	 // 角色ID
	uint32 skill_id;// 技能id
};

// 特殊移动 比如 冲锋、抓取、瞬移、拖拽等等
struct GS2U_SpecialMove <-
{
	uint32	type;   // 移动类型
	uint64	uid;    // 角色ID
	float	x;		// 目标点
	float	y;		//
};

// 命中目标
struct GS2U_HitTarget <-
{
	uint64		uid;			//角色ID
	uint64		src_uid;		//发起者ID
	uint32		cause;			//原因 1 :使用技能
	uint32		misc;			//如果是技能，则为技能ID
	uint32		serial;			//如果是技能，则为技能消息序列号
};


// 血量变化
struct GS2U_HPChange <-
{
	uint64		uid;			//角色ID
	uint32		cause;			//HP变化原因 1 技能 2 buff 等等
	uint32      result;			//1闪避 2 暴击 3 格挡等等 
	int32		hp_change;		//HP变化值
	uint64		src_uid;		//发起者ID
	uint32		misc1;			//根据原因来定义
	uint32		misc2;			//根据原因来定义
	uint32		serial;			//根据原因来定义，如果是技能，由为技能消息序列号；其它原因填0
};


// buff 数据
struct BuffInfo
{
	uint32 buff_id;
	uint32 lifetime;
	uint32 level;
	uint32 wrap;
};

// 添加buff
struct GS2U_AddBuff <-
{
	uint64		uid;			// 角色ID
	BuffInfo	buff;			// buff	
};

// 更新buff
struct GS2U_UpdateBuff <-
{
	uint64		uid;			// 角色ID
	BuffInfo	buff;			// buff	
};

// 删除buff
struct GS2U_DeleteBuff <-
{
	uint64		uid;			// 角色ID
	uint32		buff_id;		// buff id
};

// 删除buff
struct U2GS_DeleteBuff ->
{
	uint32		buff_id;		// buff id
};








