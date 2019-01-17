// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 请求加入混沌战场
struct U2GS_RequestJoinHDBattle ->
{
};

// 客户端请求当前活动状态
struct U2GS_RequestQueueNumber ->
{
};

// 客户端收到当前排队人数
struct GS2U_QueueNumber <-
{
	uint32 queueNumber;	// 当前队列中的人数
	bool isStart;		// 活动是否开始，true 是
	bool isIMApply;		// 我是否在排队中，true 是
};

// 请求离开报名混沌战场
struct U2GS_CancelApply ->
{
	
};

// 已经报名成功，且分配战场成功，通知玩家可以进入战场
struct GS2U_JoinHDBattle <-
{
};

// 多少秒后，门将打开
struct GS2U_HDBattleOpenSurplusTime <-
{
	int16 surplusTime;	// 剩余多少秒
};

// 自己的击杀数量
struct GS2U_KillPlayerNumber <-
{
	uint sortNumber;	// 排名
	uint killNumber;	// 击杀数
	uint lxKillNumber;	// 当前连杀数
	uint needKill;		// 需要击杀数
	uint remainSecond;	// 本次活动剩余秒数
	uint gatherNumber;	// 当前采集次数
	uint needGatherNumber; // 需要采集次数
};

// 采集成功一件东西
struct GS2U_HDGatherSuccess <-
{
	uint gatherID;
};

struct KillRank
{
	uint sortNumber;	// 排名
	uint killNumber;	// 击杀数
	string playerName;	// 玩家名
};

// 请求击杀排行榜
struct U2GS_KillRank ->
{
};

// 返回击杀排行榜
struct GS2U_KillRank <-
{
	vector<KillRank> rank;
};

// 下一波怪将在多少秒后到来
struct GS2U_ACCityMonsterSurplusTime <-
{
	int surplusTime;	// 剩余多少秒
};
// 哥布林玩法开启状态
struct GS2U_Goblin_Open_State <-
{
	bool isOpen;	// 是否开启
	uint mapID;		// 开启的地图ID
};

//活动表中的活动状态
struct GS2U_ActivityState <-
{
	uint16 activityID;//活动配置表的id
	uint	mapID;//活动地图id
	int16	phase;//所处阶段
};

//王者战天下 请求当前进攻方、防守方可用人数
struct U2GS_AttackDefenderQuotaNumber ->
{
	uint16 activityID;//活动配置表的id
	uint	mapID;//活动地图id
};
struct GS2U_AttackerDefenderQuotaNumberAck <-
{
	uint16 activityID;//活动配置表的id
	uint	mapID;//活动地图id
	uint16	acctackerQuotaNum;//进攻方可用人数
};
//王者战天下 请求进入活动
struct U2GS_RequestInActivity ->
{
	uint16 activityID;//活动配置表的id
	uint	mapID;//活动地图id
};

//活动结束
struct GS2U_ActivityEnd <-
{
};

//请求王者雕像数据
struct U2GS_RequestMarrorInfo ->
{
};

// 排行榜上玩家穿戴的装备列表
struct PlayerKingBattleEquip
{
	uint equipID;	// 装备ID
	uint8 quality;	// 品质
};

//玩家装备部位等级
struct PlayerKingBattleEquipLevel
{
	uint8 type;
	uint8 level;
};

//王者雕像数据
struct GS2U_MarrorInfoAck <-
{
	string	nickName;//昵称
	uint16	playerLevel;//等级
	uint32	playerForce;//战斗力
	uint64	 roleID;	 // 角色ID
	uint64	 playerCode;     // 玩家流水号
	uint32	 career;	 // 职业
	int8	 race;	 // 种族
	int8	 sex;	 // 性别
	int32	 head;
	int32	 wingLevel; //翅膀等级
	string	clique;//军团名
	uint32	defendDays;//成功防守天数
	uint64	mirrorMaxHp;//防守镜像最大生命值
	uint64	mirrorLastHp;//防守镜像剩余生命值
	vector<int32> fashionIDs;	// 时装ID列表
	vector<PlayerKingBattleEquip>	equipIDList;	// 装备ID列表
	vector<PlayerKingBattleEquipLevel> equipLevelList; //装备等级列表
	string declaration   //守护宣言
};


//王者守护宣言
struct U2GS_GuardianDeclaration ->
{
	string	declaration;//守护宣言
};

//王者守护宣言修改成功
struct GS2U_ChangeGuardianDeclaration <-
{
	bool isChange;//守护宣言修改结果
};
//王者雕像点赞
struct U2GS_GiveMarrorFlower ->
{
};
//王者守护 购买守护者buff
struct U2GS_KingBattleBuyDeffenderBuff ->
{

};
//王者守护 一键购买守护者buff
struct U2GS_KingBattleBuyDeffenderBuffOneKey ->
{

};
//王者守护 购买进攻方buff
struct U2GS_KingBattleBuyAttackerBuff ->
{

};
//王者守护 一键购买进攻方buff
struct U2GS_KingBattleBuyAttackerBuffOneKey ->
{

};
//王者守护 购买镜像buff
struct U2GS_KingBattleBuyMirrorBuff ->
{

};
//王者守护 一键购买镜像buff
struct U2GS_KingBattleBuyMirrorBuffOneKey ->
{

};
//王者守护 修复镜像
struct U2GS_KingBattleRepairMirror ->
{
	bool isRepairAll;        // 是否一键修复
};
//王者守护  服务器下发下来的守护方信息
struct GS2U_KingBattleRepairMirror <-
{
	//镜像生命最大值
	uint64 mirrorMaxHp;
	//镜像当前生命值
	uint64 mirrorCurrentHp;
}

//王者守护 客户端获取防守方信息
struct U2GS_KingBattleGetBuffInfo ->
{

};
//王者守护  服务器下发下来的守护方信息
struct GS2U_KingBattleBuffInfo <-
{
	//镜像当前已购买的buffID
	uint64 mirrorBuffcfgID;
	//防守方当前已购买的buffID
	uint64 defenderBuffcfgID;
	//防守方当前已购买的buffID,为0表示为收方信息
	uint64 attackerBuffcfgID;
}
//王者守护  守护者结算面板
struct GS2U_KingBattleResult<-
{
	bool isKing;  //是否守护者
	bool isNewKing;  //是否新守护者
	uint64 killNumOrHurt; //守护成功则为击杀人数，新守护者则是伤害
	uint8  days  //守护好多天
	string declaration //守护宣言
	string name  //名字
	uint64	 roleID;	 // 角色ID
	uint32	 career;	 // 职业
	int8	 race;	 // 种族
	int8	 sex;	 // 性别
	int32	 head;
	int32	 wingLevel; //翅膀等级
	vector<int32> fashionIDs;	// 时装ID列表
	vector<PlayerKingBattleEquip>	equipIDList;	// 装备ID列表
	vector<PlayerKingBattleEquipLevel> equipLevelList; //装备等级列表
}

struct WildBossInfo
{
	uint mapID;			//刷boss的地图ID
	uint bossID;		//刷bossID
	uint64 refreshTime; //下次刷新时间，0为已经刷新
	
};
//初始化野外boss信息
struct GS2U_InitWildBossInfo <-
{
	vector<WildBossInfo> infos;
};
//通知客户端boss仇恨目标，和显示界面与否
struct GS2U_NoticeWildBossTarget <-
{
	uint64 targetCode;	// 目标Code
	string name;				// 目标名字（如果拥有队伍则是队长名而不是Code对应角色）
	bool isTeam;				// 目标是否拥有队伍
	bool isShow;        // 是否显示
};
//通知客户端boss死亡
struct GS2U_NoticeWildBossDead <-
{
	WildBossInfo info;
};
struct OperateActExchangeRequire
{
	uint16	itemID;				// 兑换需要的道具ID
	uint16	itemNum;			// 兑换需要的道具数量
};

struct U2GS_QueryMapBossInfo ->
{
	uint64 targetCode;	// 目标Code
};

struct GS2U_MapBossInfo <-
{
	uint mapID;			//刷boss的地图ID
	uint bossID;		//刷bossID
	string name;				//目标名字（如果拥有队伍则是队长名而不是Code对应角色）
	bool isTeam;				// 目标是否拥有队伍
	uint64 refreshTime; //
	uint64 code;		// 刷BOSS的Code
};


//运营活动的兑换
struct GS2U_OperateAct_Exchange <-
{
	uint			exchangeID;			//兑换ID
	uint8			exchangeType;		//兑换的类型，1为道具，2为货币，3为自定义
	uint8			roleExchangedNum;	//本角色已经兑换的次数
	uint8			roleMaxExchangeNum;	//本角色最大可以兑换的次数
	uint16			exchangeArg;		//兑换的参数，如果兑换的是道具，则为道具ID；如果是货币则为货币类型
	uint16			exchangeNum;		//兑换的数量
	uint			startTime;			//兑换开始时间
	uint			endTime;			//兑换结束时间
	string			name;				//兑换活动名字
	string			title;				//兑换标题
	string			content;			//内容描述
	vector<OperateActExchangeRequire>	requireList;	//兑换所需要的道具列表
};

//刷新运营兑换活动面板
struct U2GS_OperateExchangeRefresh ->
{
};

//兑换运营搞的兑换活动
struct U2GS_OperateExchange ->
{
	uint	exchangeID;			//兑换ID
};

struct GS2U_OperateExchangeAck <-
{
	uint	exchangeID;			//兑换ID
};

struct Question
{
	uint questionID;		//题目ID
	vector<uint8> answers;	//题目答案
};

//答题活动开始
struct GS2U_AnswerQuestion <-
{
	uint64 startTime;				//开始时间
	uint8  answerNum;				//答题次数
	vector<Question> questionList;	//题目列表
};

//玩家答题
struct U2GS_PlayerAnswerQuestion ->
{
	uint questionID;		//题目ID
	uint8 answers;			//答案
};

//答题结果
struct GS2U_PlayerAnswerResult <-
{
	int	 	 result;		//答题结果0答错1答对
	uint8    trueAnswer;	//正确答案
};

//答题信息
struct GS2U_PlayerAnswerInfo <-
{
	uint 	trueNum;		//答题正确个数
	uint32	totalExp;		//累计经验
	uint32	totalCoin;		//累计金币
};

//第一全对和幸运玩家
struct GS2U_AnswerFirstAndLuckyPlayer <-
{
	vector<string> playerName;		//玩家名字
};

struct RobitAnswer
{
	
	uint64 startTime;				//开始时间
	uint32 intervalTime;			//间隔时间
};

struct GS2U_RobitAutoAnswer <-
{
	vector<RobitAnswer> answerList;
};

// 申请单人护送
struct U2GS_RequestEscortSolo ->
{
};

// 申请多人护送
struct U2GS_RequestEscortTeam ->
{
};

// 申请劫掠
struct U2GS_RequestEscortRob ->
{
	uint16 sequenceNumber; // 开启序列
};

// 当前护送类型
struct GS2U_CurEscortType <-
{
	uint16 escortType; // 1单人护送，2多人护送，3劫掠
};

// 请求多人护送列表
struct U2GS_RequestEscortList ->
{
};

// 多人护送
struct EscortTeam
{
	uint64 roleID;
	string roleName;
	uint16 sequenceNumber; // 开启序列
	uint16 cur_RobNumber;
	uint16 max_RobNumber;
};

// 返回多人护送列表
struct GS2U_ReturnEscortList <-
{
	vector<EscortTeam> etlist;	// 多人护送列表
};

// 触发了一个事件(服务器通知客户端触发一个事件，客户端响应则回复同样的协议)
struct GS2U_TriggerEvent <->
{	
};

// 事件结果
struct GS2U_TriggerEventResult <-
{
	uint16 eventID;
};

// 护送结果金钱奖励
struct EscortResultReward
{
	uint8 moneyType;	// 金钱类型
	uint money;			// 值
	uint perValue;		// 彩蛋收益
};

struct EscortPlunderMoney
{
	string roleName;		// 角色名字，怪物名字
	int64 plunderMoney;		// 多人劫掠收益，单人怪物伤害收益
};
// 护送劫掠结果
struct GS2U_EscortResult <-
{
	uint16 escortType; // 1单人护送，2多人护送，3劫掠
	uint8 endReason;	// 结束原因，1马车到达终点，2马车死亡，3时间到
	bool isSuccess;	// true成功
	vector<EscortResultReward> rewards;
	vector<EscortPlunderMoney> plunder;
};

// 请求黑暗之地初始信息(打开界面)
struct U2GS_RequestDarknessInfo ->
{
	
};

struct DarknessState
{
	uint remainTime;	// 剩余时间，单位秒
};

// 返回黑暗之地初始信息
struct GS2U_DarknessInfo <-
{
	DarknessState state;
	uint8 buyMoneyType;	// 购买时间，需要的金钱类型
	int buyMoney;		// 购买时间，需要的金钱数量，-1表示不能再购买，如果为0则表示无消耗
};

// 时间
struct GS2U_DarknessState <-
{
	DarknessState state;
};

// 请求入口列表
struct U2GS_RequestEntrance ->
{
	
};

// 返回入口列表
struct GS2U_EnterDarkness <-
{
	vector<uint8> entrances;	// 入口列表
};

// 进入黑暗之地(进入失败，自动加入排队)
struct U2GS_RequestEnterDarkness ->
{
	uint8 entrance;	// 入口编号
};

// 黑暗之地的排队情况
struct GS2U_DarknessQuenenState <-
{
	uint8 entrance;	// 入口编号(这个值不用管)
	uint8 floor;	// 第几层(0为没排队)
};

// 被击杀或者击杀水晶变化情况
struct GS2U_DarknessKillOrBeKill <-
{
	string targetName;
	bool isSuccess;		// 自己胜利为true,自己失败为false
	int changePebble;	// 变化的水晶数量
};

struct DarknessPlayerRank
{
	uint rank;	// 排名
	uint8 camp;	// 阵营:1正义联盟，2邪恶部落
	uint64 roleID;
	string roleName;
	uint roleLevel;
	uint integral;	// 黑暗之地积分
	uint8 mapPos;	// 黑暗之地当前位置，0为准备间，1~5对应多少层
};

// 请求自己的信息
struct U2GS_SelfDarkness ->
{
	
};

// 告诉客户端自己的阵营
struct GS2U_DarknessCamp <-
{
	uint8 camp;	// 阵营:1正义联盟，2邪恶部落
	uint integral;	// 黑暗之地积分
};

// 返回自己的信息
struct GS2U_SelfDarkness <-
{
	DarknessPlayerRank self;
	bool isNeedSelectCamp;	// 是否需要选择阵营,true需要，false不需要
	uint bossID;
	uint syFreshTime;	// 剩余时间
};

// 请求打开势力选择界面
struct U2GS_OpenSelectCamp ->
{
	
};

// 选择势力
struct U2GS_SelectCamp ->
{
	uint8 camp;	// 阵营:1正义联盟，2邪恶部落
};

// 返回势力选择
struct GS2U_SelectCamp <-
{
	vector<DarknessPlayerRank> camp1;	// 阵营1：正义联盟
	uint cam1Num;
	vector<DarknessPlayerRank> camp2;	// 阵营2：邪恶部落
	uint cam2Num;
};

// 请求黑暗之地排行榜
struct U2GS_DarknessRank ->
{
	
};

// 返回黑暗之地排行榜(排行榜末尾包含自己)
struct GS2U_DarknessRank <-
{
	vector<DarknessPlayerRank> camp1;	// 阵营1：正义联盟
	vector<DarknessPlayerRank> camp2;	// 阵营2：邪恶部落
};

//请求活动配置表
struct U2GS_RequestOPActivityConfList ->
{
	uint8	type;//活动类型
};

//充值、消费配置反馈表
struct ChargeOrUseRuleInfo
{
	uint8	ruleID;//活动中的档位id
	uint32	diamon;//非绑定钻石条件
	string	itemJson;//奖励物品json
	bool	hasTake;//是否已经领取
};
struct GS2U_RequestChargeOrUseListAck <-
{
	uint8	type;//活动类型
	string	activityName;//活动名字
	string	activityDesc;//活动文字描述
	uint32	beginTime;
	uint32	endTime;
	uint32	amountInTime;//活动期间累充消费、充值的非绑定钻石数
	vector<ChargeOrUseRuleInfo> ruleInfoList;
};

//领取充值、消费奖励(只能在活动期间领取）
struct U2GS_GetChargeOrUseGift ->
{
	uint8	type;//活动类型
	uint8	ruleID;//活动中的档位id
};
struct GS2U_GetChargeOrUseGiftAck <-
{
	uint8	type;//活动类型
	uint8	ruleID;//活动中的档位id
	bool	success;//是否领成功
};

//点亮主面板的icon
struct GS2U_IconLight <-
{
	uint8	id;//icon编号(1为充值
	bool	light;//是否领成功
};

// 打开占卜界面
struct U2GS_OpenLotteryForm ->
{
	
};

// 命运主星道具
struct LotteryItem
{
	uint64 roleID;
	string roleName;
	uint pondID;	// 奖池ID
	uint onlyID;	// ID
	uint itemId;
	uint itemNumber;
	uint8 isBind; // 0非绑定，1绑定
};

// 命运主星列表
struct GS2U_DestinyStar <-
{
	vector<LotteryItem> stars;
};

// 奖池金额与抽奖消耗
struct GS2U_LotteryMoney <-
{
	uint64 pondGold;		// 金币奖池
	uint64 pondDiamond;		// 钻石奖池
};

struct LotteryNote
{
	uint64 roleID;
	string roleName;
    uint itemID;
    uint itemNumber;
    uint8 isBind; // 0非绑定，1绑定
    uint8 isServerNote; // 是否添加到全服占卜，0不添加，1添加
    uint64 zbTime;	// 占卜时间
};

struct GS2U_LotteryNote <-
{
	vector<LotteryNote> notes;
};

// 抽奖
struct U2GS_RequestLottery ->
{
	bool isGold;	// 是否是金币抽奖
	bool isFree;    // 是否是免费
	uint8 number;   // 抽多少次，1 或者 10
};

// 抽中结果
struct GS2U_LotteryResult <-
{
	vector<LotteryItem> item;
};


// 请求重置时间
struct U2GS_RequestLotteryResetTime ->
{
};

// 重置时间
struct GS2U_LotteryResetTime <-
{
	uint64 goldFreeRstTime;		// 免费金币抽取CD剩余秒数
	uint64 diamondFreeRstTime;	// 免费钻石抽取CD剩余秒数
};

struct GS2U_WorldLevel <-
{
	uint8 worldLevel;
};


//跨服混沌战场

//跨服混沌战场阶段
struct GS2U_HDBattlePhase <-
{
	uint8	phase;	//活动阶段
	uint16	param1; //活动参数
	uint16  param2;	//活动参数
};

//跨服混沌战场倒计时
struct GS2U_HDBattleCD <-
{
	uint16	time;	
};

//跨服混沌战场战功列表
struct  HDBattleExploit
{
	uint8	rankID;		//排行榜名次
	uint8	camp;		//
	uint64  roleID;		//玩家roleID
	string	name;		//玩家名称
	string  servername;	//玩家线路名称
	uint16	killNum;	//玩家击杀数量
	uint16	asKillNum;	//玩家助攻击杀数量
	uint32	exploit;	//玩家功勋

};

struct GS2U_HDBattleExploits <-
{
	uint8	type;	//1:战功 2:结算
	vector<HDBattleExploit> exploits;	
};

//请求跨服混沌战场战功列表
struct U2GS_RequestHDBattleExploits ->
{
};

//请求混沌战场倒计时（目的为了同步一下时间）
struct U2GS_RequestHDBattleCD ->
{
};

//请求进入跨服混沌战场
struct U2GS_RequestHDBattle ->
{
};

//跨服排行榜
struct CrosBattleExploit
{
	uint8	rankID;		//排行榜名次
	uint32	career		//玩家职业
	uint64  roleID;		//玩家roleID
	string	name;		//玩家名称
	string  servername;	//玩家线路名称
	uint32  force;		//玩家战斗力
	uint32	exploit;	//玩家功勋
};

struct GS2U_CrosBattleExploits <-
{
	vector<CrosBattleExploit> ranks;	
};

//请求跨服排行榜
struct U2GS_RequestCrosRanks ->
{
};


struct ArenaTeamMemberInfo
{
    uint64 id;       	// 玩家id
	uint64 code;		// 玩家Code
    string name;     	// 玩家名字
    bool isLeader;   	// 队长标志
	bool isPrepare;		// 是否准备
    uint8 level;      	// 玩家等级
    uint32 career;     	// 玩家职业
    uint64 force;    	// 玩家战力
    uint32 arenaVal; 	// 竞技场战力
};

//更新跨服竞技场队伍信息（添加和改变）
struct GS2U_UpdateArenaTeamMember <-
{
	vector<ArenaTeamMemberInfo> teamMemberInfos;
};

//邀请
struct U2GS_AddArenaTeamMember ->
{
	uint64 id;
};

//反馈邀请
struct U2GS_AddArenaTeamMemberAck ->
{
	uint64   roleID;  //邀请者ID
	uint8  result;  //0:拒绝 1:接受
};

//通知客服端XX的邀请
struct GS2U_AddArenaTeamMemberRequest <-
{
	uint64 roleID;   //邀请者ID
	string name;   //邀请者名字

};

//删除
struct DeleteArenaTeamMember <->
{
	bool isMyself;
	uint64 id;
};

//准备状态
struct ArenaTeamMemberPrepare <->
{
	uint64 id;
	bool isPrepare;
};

//准备匹配
struct U2GS_ReadyArena ->
{
};

//开始匹配
struct U2GS_StartArena ->
{
};

//角色列表
struct GS2U_ArenaRoleList <-
{
	uint16			  time;  //竞技时间
	vector<ArenaRole> roleList; //角色列表
};

struct ArenaRole
{
	string servername; //服务器名字
	string name;	   //角色名字
	uint64 id;		   //角色ID
	uint8  camp;	   //阵营
};

//角色死亡消息
struct GS2U_ArenaRoleDead <-
{
	uint64 id;
};

struct ArenaBattle
{
	uint64 id;             //玩家ID
	uint8  camp;		   //玩家阵营
	string name;           //玩家名称
	string servername;     //服务器名称
	uint8  killnum;        //击杀数量
	uint64 force;          //战斗力
	uint64 hurt;           //伤害
	uint32 arenaVal; 	   // 竞技场战力
};
//战斗结算
struct GS2U_ArenaBattleList <-
{
	uint8 res;
	vector<ArenaBattle> bList;
};

//请求跨服排行榜
struct U2GS_RequestCrosArenaRanks ->
{
	uint8 type; // 0:临时排行榜 1:永久排行榜
};

//跨服排行榜竞技场
struct CrosArenaBattleRank
{
	uint8	rankID;		//排行榜名次
	uint32	career		//玩家职业
	uint64  roleID;		//玩家roleID
	string	name;		//玩家名称
	string  servername;	//玩家线路名称
	uint32  force;		//玩家战斗力
	uint32	arenaVal;	//竞技场积分
	uint32  win;		//胜利次数
	uint32  fail;		//失败次数
};

struct GS2U_CrosArenaBattleRanks <-
{
	vector<CrosArenaBattleRank> ranks; //角色列表
};

struct CrosArenaBattleHighRank
{
	uint32	career		//玩家职业
	uint64  roleID;		//玩家roleID
	string	name;		//玩家名称
	string  servername;	//玩家线路名称
	uint32  force;		//玩家战斗力
	uint32	arenaVal;	//竞技场积分
	uint32  win;		//胜利次数
	uint32  fail;		//失败次数
	uint64	time;
};

struct GS2U_CrosArenaBattleHighRanks <-
{
	vector<CrosArenaBattleHighRank> ranks;
};

struct CrosArenaMatch <->
{
  bool isMatch;
};


// 天使投资购买
struct U2GS_AngelInvestment ->
{
	uint16 	id;		//商品ID、0表示所有
};

// 天使投资领取
struct U2GS_AngelInvestmentGet ->
{
	uint16 	id;		
};

// 天使投资商品
struct AngelInvestmentData
{
	bool isCanGet;		// 今天能否领取
	uint8 leftNumber;	// 可能领次数
	uint16 id;	// 商品ID
};

// 天使投资购买
struct GS2U_AngelInvestmentList <-
{
	vector<AngelInvestmentData> lists;
};

// 请求天使投资数据
struct U2GS_QueryAngelInvestment ->
{
};

// 七日任务
struct SevenDayMissionData
{
	bool isFinish;	//条件满足时，是否领取过奖励
	uint16 number;	// 已经完成次数
	uint16 max;	// 最大次数
	uint16 missionid;	// id
};

// 七日任务列表
struct GS2U_SevenMissionDataList <-
{
	uint8 days;	//第几天
	uint32  timeoutSeconds;//剩余时间 
	vector<SevenDayMissionData> lists;
};

// 请求七日任务列表
struct U2GS_QuerySevenMissionData ->
{
};

// 七日任务列表
struct GS2U_SevenMissionDataUpdate <-
{
	bool isFinish;	//条件满足时，是否领取过奖励
	uint16 number;	// 已经完成次数
	uint16 max;	// 最大次数
	uint16 missionid;	// id
};

// 七日任务完成
struct U2GS_SevenMissionCompletion ->
{
	uint16 	missionid;		//完成任务ID
};

// 报名广场舞
struct U2GS_ApplyDance ->
{
	uint8 type;	// 1当前在区域中，2不在区域
};

// 广场舞区域
struct U2GS_DanceArea ->
{	
	uint8 type;	// 1进入，2离开
};

// 告诉客户端当前随机舞蹈列表
struct GS2U_ActionList <-
{
	uint32 correctID;	// 正确ID
	vector<uint32> danceIDs;	// 动作列表
};

// 准备切换舞蹈
struct GS2U_SwitchDance <-
{
	uint8 second;	// 多少秒后切换舞蹈
};

// 选择一种舞蹈
struct U2GS_SelectDanceID ->
{
	uint32 danceID;
};

// 选择的舞蹈结果
struct GS2U_SelectDanceID <-
{
	uint32 danceID;
	bool correct;	// 选择结果
};

// 打断舞蹈
struct U2GS_BreakDance ->
{	
};

// 目标打断舞蹈
struct GS2U_BreakDance <-
{
	uint64 roleID;
};


//----------全名答题--------

// 全名答题报名
struct U2GS_ApplyAnswer ->
{
	uint8 type;	// 1当前在区域中，2不在区域
};

// 报名反馈
struct GS2U_ApplyAnswerResult <-
{
	uint8 result;	// 报名结果1成功，2失败，3已报名
	uint64 endTime;				//剩余开始时间
	uint roomID;        //房间ID号
};

//玩家答题
struct U2GS_PlayerAnswer ->
{
	uint questionID;		//题目ID
	bool isright;           //是否正取
	bool isVoice            //是否语音
	string answers;			//答案
};

//返回玩家答题
struct GS2U_PlayerAnswer <-
{
	uint64 roleID;           //玩家roleID
	uint questionID;		//题目ID
	bool isright;           //是否正取
	string answers;			//答案
	uint isFirstAnser       //1,第一个答对，2，第二个答对，其他0；
    string roleName;			//玩家名字
	uint8 level;            //等级
	uint32 career;           //职业
	uint8 sex;            //性别
	uint8 race;            //种族
	int32	head;        //头像
	uint16	frameID;				// 头像框
	bool isVoice            //是否语音
};

//玩家主动申请 答题数据
struct U2GS_GetAnswerScore ->
{

};

struct ActivityAnswerRankData
{
	string			name;		// 角色名
	uint32			value;      //积分
}
// 发送面板需要展示的数据
struct GS2U_SendAnswerData <-
{
	uint  questionID;				//ID
	uint64 endTime;				//开始时间
	uint  currentAnswer        //当前题目
	vector<ActivityAnswerRankData> data;//数据列表
}
// 积分排名
struct GS2U_AnswerRank <-
{
	vector<ActivityAnswerRankData> data;//数据列表
	bool isover;           //是否结束活动
	
}

//自己的积排名
struct GS2U_MyAnswerRank <-
{
	uint16			ranking;		//我的名次（进攻方）
	uint32			value;      //积分
}
//答题题目ID
struct GS2U_AllAnswerQuestion <-
{
	uint  questionID;				//ID
	uint64 startTime;				//开始时间
	uint  currentAnswer;           //当前题目
};

// 单个活动的状态
struct ActivityState
{
	uint16 activityID;//活动配置表的id
	int16	state; //所处阶段,这个是策划配置的	
};

//活动表中的所有活动状态
struct GS2U_ActivityStateInit <-
{
	vector<ActivityState> infos; 
};

// 单个活动的状态
struct GS2U_ActivityStateInfo <-
{
	ActivityState infos; 
};

// 注重查询活动的状态
struct U2GS_QueryActivityState ->
{
	uint16 activityID; //活动配置表的id， 0表示所有
};

// 集字活动_活动状态
struct collectionWords_State
{
	uint16				group;			// 配置组ID（扩展用
	uint32				ver;				// 版本号（与缓存版本不同时，表示新的活动配置
	string				image;			// 活动界面图 示例为"Textures/UI/Base_Bg_90" 将来可能为下载资源链接
	string				info_1;			// 活动时间描述 示例为"活动时间:{0}-{1}"
	string				info_2;			// 活动规则描述 示例为"活动规则:活动期间可以从野外怪物获得道具"
	vector<uint>	open_y_m_d;	// 活动开始时间 示例为[2018,04,31]
	uint32				limit_time;	// 活动持续时间 单位秒
	uint32				word_limit;	// 每日字样掉落上限
};

// 集字活动_可领取奖励单元
struct itemIdAndCount
{
	uint16 itemID;
	uint32 count;
};
struct collectionWords_RewardCfg
{
	uint16									id;						// 配置ID，用于逻辑运算
	uint16									group;				// 配置组ID（扩展用
	uint32									collect_num;	// 每日兑换奖励限制次数
	vector<itemIdAndCount>	listNeed;			// 每次兑换所需道具及数量
	vector<itemIdAndCount>	listReward;		// 每次兑换获得道具及数量
};

// 集字活动_同步配置数据
// 该协议通常在角色上线时推送给客户端
// 考虑到可能热更配置，因此在角色心跳中检测版本号变化后，推送给客户端
// 注1：推送该消息前可能会有每日计数type:116,id:n的同步消息，该计数器表示奖励兑换次数，默认为0，id对应为collectionWords_RewardCfg.id
// 注2：推送该消息前可能会有每日计数type:118,id:n的同步消息，该计数器表示字样获得次数，默认为0，id对应为item.id
struct GS2U_CollectionWords_Sync <-
{
	collectionWords_State							state;
	vector<collectionWords_RewardCfg>	listRewardCfg;
};

//玩家请求集字领奖
struct U2GS_RequestCollectionWordsAward ->
{
	uint32			requestAwardID;		// 奖项ID
};

// 集字活动玩家请求领奖反馈
struct GS2U_RequestCollectionWordsAwardAck <-
{
	uint32			requestAwardID;		// 奖项ID
	bool   isSuccess;			//	是否成功
};

// 游戏图片链接公告
struct Picture_notice
{
	int8			site;			// 图片位置
	int32			ver;      		// 图片版本
	string			source;      	// 图片资源链接
	string			target;      	// 图片指向链接(为空则该图片仅展示无法点击)
};

// 游戏图片链接公告反馈
struct GS2U_RequestPictureNoticeAck <-
{
	vector<Picture_notice> data; //数据列表(总数为1~7固定不变)
};

// ----------------直购礼包/限时礼包 开始---------------
struct DeadlineGift
{
    uint16          id;                 //(已触发)礼包ID
    uint32          startTime;          //首次触发时间(UTC秒)
    uint32          remainTime;         //持续时间(UTC秒)
	string          tabString;              //左侧页签文本
    uint16          itemID1;            //道具1ID
    uint16          itemID2;            //道具2ID
    uint16          itemID3;            //道具3ID
    uint16          itemNum1;           //道具1限购数量
    uint16          itemNum2;           //道具2限购数量
    uint16          itemNum3;           //道具3限购数量
    uint16          itemBuyNum1;        //道具1已购数量
    uint16          itemBuyNum2;        //道具2已购数量
    uint16          itemBuyNum3;        //道具3已购数量
    string          itemDiscount1;      //道具1折扣显示
    string          itemDiscount2;      //道具2折扣显示
    string          itemDiscount3;      //道具3折扣显示
    uint16          itemCoinType1;      //道具1货币类型
    uint16          itemCoinType2;      //道具2货币类型
    uint16          itemCoinType3;      //道具3货币类型
    uint16          itemCoinNum1;       //道具1原货币数量
    uint16          itemCoinNum2;       //道具2原货币数量
    uint16          itemCoinNum3;       //道具3原货币数量
    uint16          itemRealCoinNum1;   //道具1真实货币数量
    uint16          itemRealCoinNum2;   //道具2真实货币数量
    uint16          itemRealCoinNum3;   //道具3真实货币数量
    string          image;              //背景图
	string          itemName1;              //道具1名称
	string          itemName2;              //道具2名称
	string          itemName3;              //道具3名称
	uint16          itemCounts1;           //道具1数量
	uint16          itemCounts2;           //道具2数量
	uint16          itemCounts3;           //道具3数量
	uint16          gift1;                 //礼包1序号
	uint16          gift2;                 //礼包2序号
	uint16          gift3;                 //礼包3序号
};

// 推送礼包内容
// 消息推送Code
// 当玩家上线后           1     只有此时才关注  DeadlineGift 中的  image字段
// 当玩家购买成功后        2
// 当玩家购买失败后        3     此时 msg字段为空不用管
// 当玩家触发礼包条件后     4
// 当玩家点击图标之后       5
struct GS2U_DeadLineGiftList <-
{
    uint16               code;      //直购礼包/限时礼包 消息推送Code
    vector<DeadlineGift> msg;       //直购礼包/限时礼包 玩家相关内容
};

// 购买某个礼包内商品
struct U2GS_DeadLineGiftBuy ->
{
    uint16          id;             //(已触发)礼包ID
    uint16          giftID;         //礼包序号ID
    uint16          itemBuyNum;     //道具购买数量
};

// 打开直购礼包界面
struct U2GS_DeadLineGiftOpen ->
{
};
// ----------------直购礼包/限时礼包 结束---------------

// 跨服采集资源争夺战 start----------------------------------------------------------
// 锁定采集物，锁定成功设置广播属性，失败直接提示errorcode
struct U2GS_GBLockGather ->
{
	uint64 gatherCode;	// 采集物Code
};

// 离开范围（服务器解除采集物锁定）
struct U2GS_GBLeaveRange ->
{
	
};

// 请求争夺战入口
struct U2GS_RequestGBList ->
{
	
};

// 战场线路
struct GBMapLineInfo
{
	uint lineID;	// 线路ID
	uint16 number;	// 当前线路人数
};

// 请求进入指定的地图线路
struct U2GS_GBRequestEnterMapLine ->
{
	uint16 mapID;
	uint lineID;	// 线路ID，传0表示随机分配
};

// 资源采集争夺战个人信息
struct PlayerGBInfo
{
	uint remainSecond;	// 剩余时间，单位秒
	uint gatherPoint;	// 持有晶体
	uint8 status;		// 当前状态，0无收益，1正常，2双倍
};

// 返回入口信息
struct GS2U_GBList <-
{
	uint16 mapID;
	vector<GBMapLineInfo> lineList;
	PlayerGBInfo info;
};

// 同步个人信息，
struct GS2U_SyncGBInfo <-
{
	PlayerGBInfo info;
};

// 购买时间
struct U2GS_BuyTime ->
{
	uint id;
};

// 跨服采集资源争夺战 end----------------------------------------------------------

// 暗夜侵袭 start----------------------------------------------------------
// 请求进入指定的地图线路
struct U2GS_RequestEnterNvasionMap ->
{
	uint16 mapID;
};

// 奖励
struct RewardItem
{
	uint16 itemID;	// ID
	uint number;	// 数量
};
// 物品获得，
struct GS2U_KillMonsterReward <-
{
	vector<RewardItem> rewardItemList; // 奖励列表
};

// 通知玩家离开地图
struct GS2U_UneedleaveOutMap<-
{
	uint type ; //1 被杀，2时间到
};
// 暗夜侵袭 end----------------------------------------------------------

