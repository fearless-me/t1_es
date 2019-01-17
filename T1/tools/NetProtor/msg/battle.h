// -> client to server
// <- server to client
// <-> client & server
struct C2S_PlayerUseSkill ->
{
	//技能释放者Code
	uint64            code;
	//使用的技能ID
	uint64			skillId;
	//消息序列号
	uint32 			serial;
	//目标Code列表
	vector<uint64>	targetCodeList;
};

struct C2S_PlayerUseShiftSkill ->
{
	//技能释放者Code
	uint64            code;
	//使用的技能ID
	uint			skillId;
	//消息序列号
	uint32 			serial;
	//目标Code列表
	vector<uint64>	targetCodeList;
	//目标X坐标
	float	x;
	//目标Y坐标
	float	y;
};

// 向对象使用技能
struct GS2U_UseSkillToObject <-
{
	//技能释放者Code
	uint64	userCode;
	//使用的技能ID
	uint	skillId;
	//消息序列号
	uint32 	serial;
	//目标Code列表
	vector<uint64> targetCodeList;
	//施法时间
	uint            time;
};

// 载体使用技能
struct GS2U_CarrierUseSkillToObject <-
{
	//技能释放者Code
	uint64	userCode;
	//使用的技能ID
	uint	skillId;
	//消息序列号
	uint32 	serial;
	//目标Code列表
	vector<uint64> targetCodeList;
	//施法时间
	uint            time;
};

// 向对象使用技能
struct GS2U_UseSkillToPos <-
{
	//技能释放者
	uint64	userCode;
	//使用的技能ID
	uint	skillId;
	//消息序列号
	uint32 	serial;
	//目标Code列表
	vector<uint64> targetCodeList;
	//目标X坐标
	float	x;
	//目标Y坐标
	float	y;
};

//攻击结果攻击者伤害列表
struct AttackResultList
{
	uint8   type;    //1:击中回血 2:反弹伤害
	uint    value;
};

//攻击结果消息
struct GS2U_AttackResult <-
{
	//攻击者Code
	uint64	userCode;
	//伤害目标
	uint64	targetCode;
	//使用的技能ID或者BUFFID
	uint	skillId;
	//消息序列号
	uint32 	serial;
	//结果：无敌(1)、招架(2)、闪避(4)、暴击(8)、命中(16)、格挡(32)、PK保护(64)、治疗(128)按位处理
	vector<uint> result;
    //被攻击者当前百分比
    uint8   bhp_per;
	//攻击者当前百分比
	uint8   ahp_per;
    //目标受到的伤害差量值
    int     diffHp;
	//伤血数值列表
	vector<int>	damageHp;
	//攻击者伤害列表
	vector<AttackResultList>  arList;
};

//攻击结果技能效果(位移相关效果)
struct GS2U_AttackOffsetEffect  <-
{
	//攻击者Code
	uint64	userCode;
	//伤害目标
	uint64	targetCode;
	//使用的技能ID
	uint	skillId;
	//消息序列号
	uint32 	serial;
    //携带效果者code
	uint64        code;
	//目标X坐标
	float	x;
	//目标Y坐标
	float	y;
};

//	对象死亡消息
// 关于攻击者名字
// 优先使用monsterID判断，不为0时读配置表monster
// 其次使用serverstringID判断，不为0时读配置表serverstrings
// 最后直接使用killerName进行显示
struct GS2U_Dead <-
{
	//被攻击者
	uint64	deadActorCode;
	//攻击者
	uint64	killerCode;
    //攻击者名字
	string  killerName;
    //攻击者使用技能ID
	uint    skillID;
	// 可能的怪物ID
	uint16 monsterID;
	// 可能的字符串ID
	uint serverstringsID;
};

//	强制对象立即死亡消息
// 关于攻击者名字
// 优先使用monsterID判断，不为0时读配置表monster
// 其次使用serverstringID判断，不为0时读配置表serverstrings
// 最后直接使用killerName进行显示
struct GS2U_ForceDeadNow <-
{
	//被攻击者
	uint64	deadActorCode;
	//攻击者
	uint64	killerCode;
    //攻击者名字
	string  killerName;
    //攻击者使用技能ID
	uint    skillID;
	// 可能的怪物ID
	uint16 monsterID;
	// 可能的字符串ID
	uint serverstringsID;
};

// 关于攻击者名字
// 优先使用monsterID判断，不为0时读配置表monster
// 其次使用serverstringID判断，不为0时读配置表serverstrings
// 最后直接使用killerName进行显示
struct GS2U_DeadToTeam <-
{
	//死亡者ID
	uint64	roleID;
	//杀人者
	uint64	killerCode;
    //杀人者名字
	string  killerName;
	// 可能的怪物ID
	uint16 monsterID;
	// 可能的字符串ID
	uint serverstringsID;
};


// 中断使用技能
struct GS2U_BreakSkill <-
{
	//使用者
	uint64 userCode;
	//技能ID
	uint skillId;
	//消息序列号
	uint32 serial;
};

// 触发技能
struct GS2U_TriggerSkill <-
{
	//使用者code
	uint64 userCode;
	//技能ID
	uint skillId;
	//目标Code
	uint64 targetCode;
};

// buff调用技能
struct GS2U_CallSkill <-
{
	//使用者code
	uint64 userCode;
	//技能ID
	uint skillId;
};

// 通知某怪物的速度状态
struct GS2U_MonsterSpeed <-
{
	uint64	code;				//怪物的流水号
	float	speed;				//怪物的移动速度
	uint8	moveStatus;			//怪物的状态：走为0，跑为1
};

// 通知某怪物的攻击速度
struct GS2U_AttackSpeed <-
{
	uint64	code;				//怪物的流水号
	float	speed;				//怪物的攻击速度
};

// 玩家请求转换PK状态
struct U2GS_RequestChangePKMode ->
{
	int			pkMode;		// 请求要转换的PK模式
};

// 服务器响应玩家请求转换PK状态
struct GS2U_ResponseChangePKMode <-
{
	uint64		code;	    // 收到服务器响应转换PK模式的玩家
	int			pkMode;		// 收到服务器响应的PK模式 -1为错误信息
};

//玩家切磋相关协议

// 发送切磋请求
struct U2GS_BattleLearn ->
{
	uint64   code;          //切磋对象
};

// 反馈切磋请求结果
struct U2GS_BattleLearnAck ->
{
	uint64   code;        //发送切磋请求对象
	uint8  result;      //0:拒绝 1：接受
};

// 通知客服端XX请求切磋
struct GS2U_BattleLearnRequest <-
{
	uint64     code;       //请求切磋玩家Code
	string   name;		 //请求切磋玩家名称
};

// 通知客服端切磋结果
struct GS2U_BattleLearnResult <-
{
	uint64   code;         //请求切磋玩家Code
	uint64   targetCode;   //接受请求切磋玩家Code
	string name;         //请求切磋玩家名称
	string targetName;   //接受请求切磋玩家名称
	uint8  result;       //0:失败 1:胜利 2:平局
};

// 通知客服端是否触发倒计时
struct GS2U_IsTriggerCountDown <-
{
	uint8 flag          //0:begin 1:end
	uint8 isTrigger     //0:结束倒计时 1:触发倒计时
};




//回合制战斗消息协议

//初始化战斗数据
struct TurnBattleInit 
{
	uint64 id;		//战斗角色ID
	uint8  type;	//战斗角色类型(0:人物,1:宠物,2:怪物)
	uint8  camp;	//战斗阵营(1:友方,左边, 0:敌方,右边)
	uint8  pos;		//战斗位置(1-6)
	uint   hp;		//战斗血量最大值
};

struct GS2U_TrunBattleInitList <-
{
	vector<TurnBattleInit> il;
};

//战斗结果消息包

//被攻击者信息
struct BeAttack
{
	uint8  camp;
	uint8  pos;
	int   hp;
}; 

struct TrunBattleResult
{
	uint8    camp;
	uint8    pos;		    //攻击者位置
	uint16   id;			//攻击者技能ID
	uint8	 turn;			//攻击回合数
	vector<BeAttack> bl;    //被攻击者列表	 
};

struct GS2U_TrunBattleResultList <-
{
	vector<TrunBattleResult> rl;
};

//战斗请求发包
struct U2GS_RequestBattleAck ->
{
	uint8	num;		//包数量
};

//战斗结束包
struct GS2U_ResponseBattleAck <-
{
};

//客服端请求结束战斗(发送结算)
struct U2GS_RequestBattleEnd ->
{
	uint8	type;		//0:pve 1:pvp
};

