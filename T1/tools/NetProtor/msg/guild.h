// 公会协议
// tiancheng

//////////////////////////////////////////////////////////////////////
// 快速加入相关协议支持 begin

// 查询允许快速加入的战力条件
struct U2GS_Guild_FastJoin_Get_Request ->
{
  uint64  guildID;
};

// 反馈查询允许快速加入的战力条件
struct GS2U_Guild_FastJoin_Get_Ack <-
{
  uint64  guildID;
  uint64  force;	// 快速加入的战力限制，默认值为0，表示无限制；极大值0x7FFFFFFFFFFFFFFF表示关闭快速加入；暂不考虑超过极大值的情况，其余情况视为有战力限制
};

// 设置允许快速加入的战力条件
struct U2GS_Guild_FastJoin_Set_Request ->
{
  uint64  guildID;
  uint64  force;	// 快速加入的战力限制，默认值为0，表示无限制；极大值0x7FFFFFFFFFFFFFFF表示关闭快速加入；暂不考虑超过极大值的情况，其余情况视为有战力限制
};

// 反馈设置允许快速加入的战力条件
// 虽然和GS2U_Guild_FastJoin_Get_Ack很像，但这个用来表达设置成功
struct GS2U_Guild_FastJoin_Set_Ack <-
{
  uint64  guildID;
  uint64  force;	// 快速加入的战力限制，默认值为0，表示无限制；极大值0x7FFFFFFFFFFFFFFF表示关闭快速加入；暂不考虑超过极大值的情况，其余情况视为有战力限制
};

// 快速加入请求
// 加入成功则走普通加入
struct U2GS_Guild_FastJoin_Request ->
{
};

// 反馈成功的快速加入请求
struct GS2U_Guild_FastJoin_Ack <-
{
  uint64  guildID;
};

// 快速加入相关协议支持 end
//////////////////////////////////////////////////////////////////////

// 发布招募
struct U2GS_OneKeyRecruit_Request ->
{
};
// 发布招募反馈
struct GS2U_OneKeyRecruit_Ack <-
{
  uint32  cd;   // 需要冷去的时间（秒）
  uint32  ret;  // 0成功，非0为errorcode，需要带入cd作为参数
};

// 申请加入公会成功
struct GS2U_RequestJoinGuild_Ack <-
{
  uint64  guildID;
  uint64  cancelID;
};

// 加入公会成功
// 申请被同意/同意招募 导致的加入公会成功
// 客户端需要一个明确的消息（非ERRORCODE）来刷新界面
struct GS2U_JoinGuild_Sync <-
{
  uint64  guildID;
};

// 请求指定公会信息
// 反馈GS2U_OpenGuildForm
struct U2GS_RequestGuildInfo_Request ->
{
  uint64  guildID;
};

// 修改公会名
struct U2GS_ChangeGuildName ->
{
	string newGuildName;
};

// 修改公会名成功(失败只提示ErrorCode)
struct GS2U_ChangeGuildName <-
{
	string newGuildName;
};

// 公会招募榜
struct U2GS_GuildList ->
{
	uint requestPageNumber;	// 请求第几页(打开界面请设置为1，表示请求查看第一页)
};

// 公会信息
struct GuildInfo
{
	uint64 guildID;	// 公会唯一ID
	string guildName;	// 公会名
	uint8 guildLevel;	// 公会等级
	uint8 denoter // 家族标志
	uint fightForce;	// 家族总战力
	uint memberNumber;	// 公会成员个数
	uint maxMemberNumber;	// 公会成员最大个数
	string leaderName;	// 会长姓名
	uint64 leaderRoleID; // 会长id
	uint8 isRequest;	// 是否申请加入，1是，0否
};

// 返回公会招募榜
struct GS2U_GuildList <-
{
	uint nowPage;	// 当前页数
	uint maxPage;	// 总页数
	vector<GuildInfo> guildInfoList;	// 当前页列表
};

// 创建公会
struct U2GS_CreateGuild ->
{
	string guildName;	// 公会名(guild_name_max_length)
	uint8 denoter;		// 家族标志
	string guildNotice; // 家族公告
};

// 公会操作结果
struct GS2U_GuildOpResult <-
{
	uint64 roleCode;
	uint8 opType;	// 1创建家族
	bool opResult;
};

// 解散公会(只有会长才有权力)
struct U2GS_DeleteGuild ->
{
};

// 打开公会界面(服务器会下发公会基本信息和第一页成员两条消息)
struct U2GS_OpenGuildForm ->
{
};

// 请求查看成员列表
struct U2GS_RequestLookMemberList ->
{
	uint requestPageNumber;	// 查看第几页成员
};

// 公会成员个人信息
struct GuildMemberInfo
{
	uint64 roleID;	// 角色唯一ID
	uint64 roleCode;	// 角色Code，如果不在线，code为0
	string roleName;	// 角色名
	uint8 roleGuildLevel;	// 角色在公会中的职位
	uint liveness;	// 活跃度
	uint32 combatNum;	// 战力
	uint64 offlineTime;	// 下线时长
	uint8 vipLevel;	// Vip等级
	uint16 playerLevel; // 玩家等级
  uint32          career;   // 职业
  uint8           race;     // 种族
  uint8           sex;      // 性别
  int32           head;     // 头
  uint16          frameID;  //头像框
};

// 请求查看成员列表
struct GS2U_RequestLookMemberList <-
{
	uint nowPage;	// 当前页数
	uint maxPage;	// 总页数
	vector<GuildMemberInfo> memberList;	// 当前查看页的成员列表
};

// 打开公会界面返回的消息
struct GS2U_OpenGuildForm <-
{
	uint64 guildID;	// 公会唯一ID
	string guildName;	// 公会名
	uint8 guildLevel;	// 公会等级
	uint fightForce;	// 家族总战力
	uint memberNumber;	// 公会成员个数
	uint maxMemberNumber;	// 公会成员最大个数
	uint resource;	// 公会物资
	uint liveness;	// 公会活跃
	string notice;	// 公告
	uint8 denoter // 家族标志
	uint8 shopLevel; // 家族商店等级
	uint requestJoinNum;	// 申请列表(官员以上才能查看)
	uint selfContribute;	// 个人贡献点
	uint8 selfGuildLevel;	// 个人在公会中的职位
	uint32 cd;   // 发布招募需要冷去的时间（秒）
	bool  canRename;       // 是否可以修改名字
	bool	isInit;						// 上线需要推送家族信息，以支持一些杂七杂八的显示
};

// 刷新家族属性
struct GS2U_RefreshGuildProp <-
{
	uint64 guildID;	// 公会唯一ID
	uint resource;	// 公会物资
	uint liveness;	// 公会活跃
	uint64 selfContribute;	// 个人贡献点
	uint selfLiveness;	// 个人活跃（加入家族后累计获得的个人贡献，在成员列表中显示为家族贡献）
};

// 打开申请成员界面
struct U2GS_RequestJoinGuildList ->
{
};

// 公会申请成员的个人信息
struct GuildApplyMemberInfo
{
	uint64 roleID;	// 角色唯一ID
	uint64 roleCode;	// 角色Code，如果不在线，code为0
	string roleName;	// 角色名
	uint32 combatNum;	// 战力
	uint8 vipLevel;	// Vip等级
	uint16 playerLevel; // 玩家等级
	uint64 applyTime;// 申请时间
  uint32          career;   // 职业
  uint8           race;     // 种族
  uint8           sex;      // 性别
  int32           head;     // 头
  uint16          frameID;  // 头像框
};

// 打开申请成员界面
struct GS2U_RequestJoinGuildList <- 
{
	vector<GuildApplyMemberInfo> requestList;	// 申请列表
  uint64  force;	// 快速加入的战力限制，默认值为0，表示无限制；极大值0x7FFFFFFFFFFFFFFF表示关闭快速加入；暂不考虑超过极大值的情况，其余情况视为有战力限制
};

// 招募成员
struct U2GS_Recruit ->
{
	uint64 targetCode;	// 招募目标Code
};

// 被招募的人接收到的招募消息
struct GS2U_Recruit <-
{
	uint64 roleID;	// 招募者的角色ID
	string roleName;	// 招募者的角色名
	GuildInfo guildInfo;	// 公会Info
};

// 同意招募
struct U2GS_AgreeRecruit ->
{
	uint64 guildID;
	uint64 roleID;	// 招募者的角色唯一ID
	uint8 agree;	// 1同意，0拒绝
};

// 申请加入工会
struct U2GS_RequestJoinGuild ->
{
	uint64 guildID;		// 公会唯一ID
};

// 同意或者拒绝申请人加入
struct U2GS_DealRequestJoin ->
{
	uint64 guildID;
	vector<uint64> roleIDs;	// 申请者的roleid列表
	uint8 agree;	// 1同意，0拒绝
};

// 退出工会
struct U2GS_ExitGuild ->
{
};

// 踢出工会
struct U2GS_KickGuild ->
{
	uint64 targetRoleID;	// 目标角色ID
};

// 赋予权力
struct U2GS_GivePower ->
{
	uint64 targetRoleID;	// 目标角色ID
	uint8 guileLevel;		// 权限:0请求加入，1普通成员，2管理员，3副家族长，9家族长
};

// 赋予权力Ack，成功才返回给客户端
struct GS2U_GivePower <-
{
	uint64 targetRoleID;	// 目标角色ID
	uint8 guileLevel;		// 权限:0请求加入，1普通成员，2管理员，3副家族长，9家族长
};

// 修改公告
struct U2GS_ChangeNotice ->
{
	string guildNotice;		// 公告
};

// 修改公告结果(成功返回这个结果，失败不会返回)
struct GS2U_ChangeNotice <-
{
	string guildNotice;		// 公告
};

// 修改标志
struct U2GS_ChangeDenoter ->
{
	uint64 guildID;
	uint8 denoter;
};

// 返回修改结果，失败只提示ErrorCode
struct GS2U_ChangeDenoter <-
{
	uint64 guildID;
	uint8 denoter;
};

// 家族升级
struct U2GS_Upgrade ->
{
	uint64 guildID;
};

// 家族升级反馈
struct GS2U_Upgrade_Ack <-
{
  uint64  guildID;
  uint32  level;
};

// 家族商店升级
struct U2GS_ShopUpgrade ->
{
	uint64 guildID;
};

// 家族商店升级
struct GS2U_ShopUpgrade <-
{
	uint64 guildID;
	uint8 shopLevel;	// 家族商店升级
};

// 团长移交
struct U2GS_ChangeLeader ->
{
	uint64 targetRoleID;	// 目标角色ID
};

// 家族捐献(金钱)
struct U2GS_DonateMoney  ->
{
	uint8 moneyType;		// 金钱类型,1(非绑金币),3(非绑钻石)
	uint moneyNumber;		// 金钱数量
};

// 请求捐献剩余次数
struct U2GS_RequestDonateTimes ->
{
	uint8 moneyType;		// 金钱类型,1(非绑金币),3(非绑钻石)
};

// 返回捐献剩余次数
struct GS2U_ReturnDonateTimes <-
{
	uint8 moneyType;		// 金钱类型,1(非绑金币),3(非绑钻石)
	uint16 times;			// 今日剩余次数
};

// 捐献成功家族改变，只发给捐献者
struct GS2U_DonateSuccess <-
{
	uint64 guildID;		// 公会唯一ID
	uint8 guildLevel;	// 公会等级
	uint nowExp;	// 当前经验值
	uint64 roleID;	// 捐献者角色ID
	uint contribute;	// 捐献者最新贡献点
};

// 打开家族商店
struct U2GS_OpenGuildShop ->
{
};

// 领取家族津贴
struct U2GS_GetGuildPrize ->
{
	
};

// 打家族战报名界面
struct U2GS_GuildBattleApply ->
{
	
};

// 参加的家族信息
struct GuildBattleInfo
{
	uint64 guildID;	// 公会唯一ID
	string guildName;	// 公会名
	uint8 guildLevel;	// 公会等级
	uint fightForce;	// 家族总战力
	string leaderName;	// 会长姓名
	uint64 leaderRoleID; // 会长id
	uint8 denoter // 家族标志
};

// 报名信息
struct GS2U_GuildBattleApply <-
{
	vector<GuildBattleInfo> list;
	uint64 selfGuildID;
	uint64 targetGuildID;
};

// 进入家族战
struct U2GS_EnterGuildBattle ->
{
	
};

// 战场上家族的相关信息
struct OccupyGuildInfo
{
	uint64 guildID;
	string guildName;
	vector<uint> occupyIDs; // 拥有的旗帜ID列表，及采集物ID列表
	uint allPoint;	// 总积分
	uint8 denoter // 家族标志
};

// 战场相关信息发生改变
struct GS2U_OccupyOwnerChange <-
{
	uint8 type;	// 1旗帜改变，2定时TICK
	uint remainSec;	// 剩余时间，秒
	OccupyGuildInfo owner;
	OccupyGuildInfo target;
	vector<GuildBattlePlayerInfo> playerInfos; // 只发一部分和玩家自己
};

struct GuildBattlePlayerInfo
{
	uint64 guildID;
	uint8 rank;	// 名次
	uint64 roleID;
	string roleName;
	uint point; // 玩家总分
};

struct GuildBattleResultInfo
{
	uint64 guildID;
	string guildName;
	uint point; // 总积分
	vector<GuildBattlePlayerInfo> playerInfos; // 只发一部分和玩家自己
};

// 中途请求家族战比赛信息
struct U2GS_RequestGuildBattleResult ->
{
};

// 比赛结果(有对手且参与比赛了，才有结果)
struct GS2U_GuildBattleResult <-
{
	uint8 isEnd;	// 1未开始，2比赛中，3结束
	GuildBattleResultInfo win;
	GuildBattleResultInfo lose;
};

// ----------------------------------------------家族精英联赛----------------------------------------------
// 请求竞价家族列表与自己家族信息和分组信息
struct U2GS_RequestGuildWar ->
{
	
};

// 竞价家族
struct BiddingGuild
{
	uint64 guildID;
	string guildName;
	uint biddingMoney;	// 当前竞价出资
	uint8 denoter;
};

struct GS2U_BiddingGuildMsg <-
{
	vector<BiddingGuild> list;
	uint resorce;	// 自己家族当前物资
};

// 出价，出价错误返回errorcode，成功返回GS2U_BiddingGuildMsg
struct U2GS_Bidding ->
{
	uint64 guildID;	// 目标家族ID，如果位置没有被占领，则为自己家族
};

// 每组对战信息
struct GuildWar
{
	uint8 stage;	// 第几场（1初赛，2决赛）
	uint8 group;	// 第几组（1，2）
	uint64 guildID1;
	string guildName1;
	uint8  denoter1;
	uint64 guildID2;
	string guildName2;
	uint8  denoter2;
	uint64 guildID3;
	string guildName3;
	uint8  denoter3;
	uint64 winguildID;
	string winguildName;
	uint8  windenoter;
};

// 返回比赛对战列表
struct GS2U_GuildWar <-
{
	vector<GuildWar> list;
};

// 击杀助攻排行榜
struct GuildWarRank
{
	uint16 rank;
	uint64 roleID;
	string roleName;
	uint killPlayer;
	uint secondAttack;
};

// 水晶状态
struct PebbleState
{
	uint monsterID;
	uint curHP;
	uint maxHP;
	uint resetTime;	// 重置剩余时间
};

// 大炮状态
struct CannonState
{
	uint collectID;
	uint resetTime;	// 重置剩余时间
};

struct GuildIDList
{
	uint64 guildID;
	string guildName;
	uint8 denoter;
};

// 当前场景参战的家族列表
struct GS2U_GuildIDList <-
{
	vector<GuildIDList> list;
};

// 使用大炮
struct U2GS_UseCannon ->
{
	uint64 targetGuildID;
	uint64 selectCode;
};

struct GuildWarInfoIntegral
{
	uint8 type;	// 积分类型:1占领水晶,2争夺炮台,3参战人员,4累积击杀,5累积助攻
	uint16 number;	// 数量
	uint integral;	// 积分
};

struct GuildWarInfo
{
	uint64 guildID;
	string guildName;
	uint8 denoter;
	uint8 key;		    //哪个地图
	uint8 stage;			//阶段
	uint all_integral;	// 总积分
	vector<GuildWarInfoIntegral> integrals;	// 积分列表
};

// 战斗过程中刷新数据
struct GS2U_GuildWarData <-
{
	vector<GuildWarRank> ranks;
	vector<PebbleState> pebbles;
	vector<CannonState> cannons;
	vector<GuildWarInfo> infos;
	uint syTime;	// 剩余时间
};

struct GuildWarReward_item
{
	uint8 isBind;		// 1绑定，0非绑定
	uint itemID;
	uint itemNumber;
}

struct GuildWarReward_coin
{
	uint8 cointype		// 货币类型
	uint number;
}

// 终场结算
struct GS2U_GuildWarEnd <-
{
	bool isGradeToJS;   //是否晋级 
	vector<GuildWarInfo> infos;
	vector<GuildWarReward_item> items;
	vector<GuildWarReward_coin> coins;
};

// 玩家登陆时判断能否竞价信息 或者开启时竞价时推送这个消息
struct GS2U_ISInApplyInfo <-
{
	bool isInApply;			//是否在竞价解
	bool isInBattleList;	//对战列表
	uint32 leftTime;		//倒计时
};

struct GuildWarRankInfo
{
	uint64 guildID;
	uint32 rank; 
};

// 玩家登陆时判断HUD 或者活动结束时 开始时推送此小时
struct GS2U_GuildWarRankForHud <-
{
	vector<GuildWarRankInfo> ranks;
};

// 被大炮击中玩家信息列表
struct GS2U_GuildWarCannonHit <-
{
	vector<uint64> hits;
};

// 打开家族技能界面
struct U2GS_RequestGuildSkill ->
{
	
};

struct GuildSkill
{
	uint confId;	// 配置ID
	uint skillID;	// 技能ID
	uint16 skillLvl;// 技能等级
	uint next_confID;	// 本技能下一等级的配置ID，如果已经学完，本值为0
};

// 返回家族技能结果
struct GS2U_GuildSkill <-
{
	vector<GuildSkill> skill;	// 当前已经研究出来的家族列表
	vector<GuildSkill> selfskill;	// 自己已经学习的家族技能列表
};

// 研究技能
struct U2GS_ResearchGuildSkill ->
{
	uint confId;	// 配置ID
};

// 学习技能
struct U2GS_StudyGuildSkill ->
{
	uint confId;	// 配置ID
};

// 打开家族福利BUFF界面
struct U2GS_RequestGuildBuff ->
{
	
};

struct GuildBuff
{
	uint confId;	// 配置ID
	uint buffID;	// BuffID
	uint8 getFlag;	// 今日自己是否已经领取这个BUFF，0未领取，1已领取
};

// 今日已经购买的BUFF列表
struct GS2U_GuildBuff <-
{
	vector<GuildBuff> buff;	// 今日购买的BUFF列表
};

// 购买BUFF
struct U2GS_BuyGuildBuff ->
{
	uint confId;	// 配置ID
};

// 领取BUFF
struct U2GS_getGuildBuff ->
{
	uint confId;	// 配置ID
};

struct GuildBuffRole
{
	uint64 roleID;
	string roleName;
	uint64 buyTime;	// 购买时间，绝对时间，不是UTC时间
	uint confId;	// 配置ID
	uint buffID;	// BuffID
};

struct GS2U_GuildBuffRole <-
{
	vector<GuildBuffRole> bgrs;
};

// 打开家族任务界面，请求家族任务列表，返回GS2U_GuildTask
// 待废弃
struct U2GS_RequestGuildTask ->
{
	
};

// 领取家族工资
// 待废弃
struct U2GS_GuildReward ->
{
	
};

// 召唤神兽
// 待废弃
struct U2GS_SummonMonster ->
{
	
};

// 接取家族驻地任务
// 待废弃
struct U2GS_AcceptGuildTask ->
{
	uint8 taskType;		// 1刺探，2巡逻
};

// 放弃任务
// 待废弃
struct U2GS_GiveUpGuildTask ->
{
	uint8 taskType;		// 1刺探，2巡逻
};

// 家族任务
struct GuildTask
{
	uint8 taskType;		// 1刺探，2巡逻
	uint8 taskState;	// 任务状态，1未接取，2进行中，3已完成
	uint16 curTimes;	// 完成次数
	uint16 maxTimes;	// 最大次数
	uint accCDTime;		// 接取任务的CD时间（还剩这么多秒才能接取任务）
	uint16 taskID;		// 这个ID为零表示没接任务
	uint64 targetGuildID;
	string targetGuildName;
	uint64 targetPlayerRoleID;
	string targetPLayerName;
	uint number1;	// 完成参数1
	uint number2;	// 完成参数2
	uint number3;	// 完成参数3
};

// 家族任务列表
struct GS2U_GuildTask <-
{
	vector<GuildTask> tasks;	// 包含刺探与巡逻任务
};

// 进入家族驻地
// 待废弃
struct U2GS_EnterGuildHome ->
{
	uint64 targetGuildID;
};

// 领取奖励
// 待废弃
struct U2GS_GetGuildHomeReward ->
{
	uint8 taskType;		// 1刺探，2巡逻
};

// 召唤幻象(刺探专有)
// 待废弃
struct U2GS_SummonHX ->
{
	
};

// 弹劾团长
struct U2GS_ImpeachCreater  ->
{
};

// 支持弹劾团长
struct U2GS_SupportImpeachCreater  ->
{
};

// 查询弹劾信息
struct GS2U_QueryImpeachInfo ->
{
};

// 弹劾信息
struct GS2U_ImpeachInfo <-
{
	uint8  canImpeach;		// 能否发起弹劾	
	uint8  supportNumber;  //支持者数量
	uint64 impeacherID;		//发起弹劾者ID
	string impeacherName;	// 发起弹劾这名字
	uint64 impeacheLeftTime; //弹劾过期时间(秒)
};


// 远征地图信息
struct ExpeditionMapInfo
{
	uint32 mapid;	// 公会唯一ID
	uint64 guildID;	// 公会唯一ID
	string guildName;	// 公会名
	uint16 onlineNumber;	// 进入人数
	uint16 queueNumber; // 排队人数
	uint8  isGetReward;	// 是否可以领奖， 非0可以， 0不可以
};

// 查询远征地图信息
struct U2GS_QueryExpeditionMapInfo ->
{
};

// 返回远征地图信息
struct GS2U_ExpeditionMapInfoList <-
{
	vector<ExpeditionMapInfo> mapInfoList;	
};

// 远征地图信息
struct ExpeditionGlobalMapInfo
{
	uint32 mapid;	// 地图iD
	uint16 onlineNumber; // 进入人数
	uint16 queueNumber;// 排队人数
};

// 查询全局信息
struct U2GS_QueryExpeditionGlobalMapInfo ->
{
};

// 返回全局信息
struct GS2U_ExpeditionGlobalMapInfoList <-
{
	uint32 leftSeconds;	//活动剩余时间(活动未开启时：0)
	vector<ExpeditionGlobalMapInfo> mapInfoList;	
};


// 帮会远征战斗信息
struct ExpeditionGuildBattleInfo
{
	uint64 guildID;	// 公会唯一ID
	string guildName;	// 公会名
	uint64 guildScore; // 工会分数
};

// 远征地图据点信息
struct ExpeditionPointInfo
{
	uint16 pointIndex;	//  1-3，代表据点A-C
	uint64 guildID;	// 公会唯一ID
	string guildName;	// 公会名
};

// 查询远征地图战斗信息
struct U2GS_QueryExpeditionMapBattleInfo ->
{
	uint32 mapid;	// 地图iD
};

// 返回远征地图战斗信息
struct GS2U_ExpeditionMapBattleInfoList <-
{
	uint32 mapid;	// 地图iD
	uint64 selfScore; // 当前地图得分
	ExpeditionGuildBattleInfo selfGuildBattleInfo;
	vector<ExpeditionPointInfo> pointInfoList;
	vector<ExpeditionGuildBattleInfo> topGuildInfoList;	
};

// 通知本地图帮会成员位置信息
struct U2GS_ExpeditionBroadcastPos ->
{
	uint16 type;	//0, 团长自己， 1-3，代表据点A-C
};

// 通知本地图帮会成员位置信息
struct GS2U_ExpeditionBroadcastPos <-
{
	uint16 type; //0, 团长自己(x,y有效)， 1-3，代表据点A-C(x,y无效)
	string  broadcasterName;			// 广播者名称
	float	x; //目标X坐标	
	float	y; //目标Y坐标
};


// 远征战报信息
struct ExpeditionFinalInfo
{
	uint32 mapid;	// 地图iD
	vector<ExpeditionGuildBattleInfo> topGuildInfoList;	
};

// 查询战报()
struct U2GS_QueryExpeditionFinalInfo ->
{
	
};

// 通知本地图帮会成员位置信息
struct GS2U_ExpeditionFinalInfo <-
{
	uint64 selfTotalScore; // 本次活动所得总分
	vector<ExpeditionFinalInfo> finalInfoList;
};


// 请求领取每日奖励
struct U2GS_GiveMeExpeditionRewardEverDay ->
{
	uint32 mapid;	// 地图iD
};


// 排队状态
struct GS2U_ExpeditionQuenenState <-
{
	uint32 mapid;	// 地图iD
};

// 查询指定角色的家族信息
struct U2GS_QueryGuildInfoByRoleID_Request ->
{
  uint64  roleID;
};
struct GS2U_QueryGuildInfoByRoleID_Ack <-
{
  GuildInfo guildInfo;
};


/////////////////////////////////////////////////////////////////////////////////////
// 女神祈福

// 祈福请求
struct U2GS_Guild_GodBless_Request ->
{
  uint8 type; // 参考guildbless.typ
};

// 祈福请求成功反馈
//    仅祈福成功时使用该消息刷新界面
//    其它情况使用每日计数7获取当日已祈福次数，使用同步属性10006获取上次成功祈福的时间
struct GS2U_Guild_GodBless_Ack <-
{
  uint32  time;   // 本次成功祈福的时间 参考GS2U_SyncServerTime
  uint8   count;  // 当日已祈福次数
};

// 请求查询祈福进度
struct U2GS_Guild_GodBless_Schedule_Request ->
{
};

// 同步/反馈祈福进度
struct GS2U_Guild_GodBless_Schedule_Sync <-
{
  uint32          schedule;
  vector<uint32>  listID;   // 已领取的进度奖励，参考guildbless_schedule.id
};

// 请求领取祈福进度奖励
struct U2GS_Guild_GodBless_Schedule_Reward_Request ->
{
  uint32  id;   // 参考guildbless_schedule.id
};

// 成功领取祈福进度奖励，失败时发送ErrorCode
struct GS2U_Guild_GodBless_Schedule_Reward_Ack <-
{
  uint32  id;   // 参考guildbless_schedule.id
};

/////////////////////////////////////////////////////////////////////////////////////
// 家族商店

// 购买请求
struct U2GS_Guild_ShopBuy_Request ->
{
  uint32  id;         // 配置ID
  uint32  count;      // 数量
};

// 购买反馈，用于客户端得到一个明确的消息以刷新界面
struct GS2U_Guild_ShopBuy_Ack <-
{
  uint32  id;         // 配置ID
  uint32  count;      // 数量
  uint32  errorCode;  // 为0时表示成功，否则需要客户端显示ErrorCode
};

/////////////////////////////////////////////////////////////////////////////////////
// 兑换功能

// 兑换请求
struct U2GS_Guild_Exchange_Request ->
{
  uint32  id;         // 配置ID
  uint32  level;      // 配置等级
};

// 兑换反馈，用于客户端得到一个明确的消息以刷新界面
struct GS2U_Guild_Exchange_Ack <-
{
  uint32  id;         // 配置ID
  uint32  level;      // 配置等级
  uint32  errorCode;  // 为0时表示成功，否则需要客户端显示ErrorCode
};

// 同步已兑换的属性
// 玩家上线时推送，成功兑换时推送
struct GS2U_Guild_ExchangeAll_Sync <-
{
  vector<uint32>  listID;     // 配置ID组
  vector<uint32>  listLevel;  // 配置等级组，与ID组一一匹配 （已学得最大等级）
  vector<uint32>  listLevelCur;  // 配置等级组，与ID组一一匹配 （受guildexchange.guildlevel限制后生效的等级）
};

/////////////////////////////////////////////////////////////////////////////////////
// 堆雪人（名为堆雪人，但实际上可能是堆其它东西，反正就是用材料堆个NPC领奖的活动）

/// 活动场景

// 活动地图同步雪人数据
//    反馈请求U2GS_Guild_SnowmanCheck_Request
struct GS2U_Guild_SnowmanSnowman_Sync <-
{
  uint32          count;            // 已完成的数量
  uint32          countMax;         // 最大数量
  uint32          subState;         // 子状态，对应guildsnowman.id
  vector<uint32>  listResSnowman;   // 正在制作的雪人已有的材料数量，下标参考配置表guildsnowman.id-1
};

// 活动地图同步玩家数据
//    打怪、采集时发生变化则同步
struct GS2U_Guild_SnowmanPlayer_Sync <-
{
  vector<uint32>  listResPlayer;    // 当前玩家已有的材料数量，下标参考配置表guildsnowman.id-1
};

// 活动地图合并同步数据
//    进入场景初始化
//    反馈请求U2GS_Guild_SnowmanDonate_Request
struct GS2U_Guild_SnowmanAll_Sync <-
{
  uint32          count;            // 已完成的数量
  uint32          countMax;         // 最大数量
  uint32          subState;         // 子状态，对应guildsnowman.id
  vector<uint32>  listResSnowman;   // 正在制作的雪人已有的材料数量，下标参考配置表guildsnowman.id-1
  vector<uint32>  listResPlayer;    // 当前玩家已有的材料数量，下标参考配置表guildsnowman.id-1
};

// 查看当前雪人进度请求
//    反馈消息GS2U_Guild_SnowmanSnowman_Sync
struct U2GS_Guild_SnowmanCheck_Request ->
{
};

// 捐献材料请求
//    反馈消息GS2U_Guild_SnowmanAll_Sync
struct U2GS_Guild_SnowmanDonate_Request ->
{
  uint32  id;         // 材料类型，参考配置表guildsnowman.id，全部捐献则填0
  uint32  snowmanID;  // 想要捐献给第几个雪人？从1开始
};

// 结算消息
//    活动结束时推送
struct GS2U_Guild_SnowmanSettle_Sync <-
{
  uint32  count;      // 完成雪人数量 参考配置表guildsnowman_settle.id
	uint32  level;      // 开展活动时的家族等级（家族可能在活动期间升级）
  string  guildName;  // 家族名
};

/// 家族驻地

// 初始化已完成的雪人数量以及已领取的礼盒标记
//    角色上线或进入家族驻地时
//    反馈请求U2GS_Guild_SnowmanReward_Request
struct GS2U_Guild_SnowmanCompleteCount_Sync <-
{
  uint32        count;      // 数量
  vector<bool>  listMark;   // true已领取；false未领取
};

// 废弃，领取奖励已改为活动结算时邮件发放
// 领取雪人礼盒请求
//    反馈消息GS2U_Guild_SnowmanCompleteCount_Sync
struct U2GS_Guild_SnowmanReward_Request ->
{
  uint32  id; // 领取第几个雪人的奖励？从1开始
};

// 活动开始提示
// 只提示在线的、已加入家族的角色
struct GS2U_Guild_SnowmanBegin_Sync <-
{
};

// 每完成一个雪人的一种材料收集，通知客户端剩余材料数量，以展示剩余材料可以兑换的奖励
struct GS2U_Guild_SnowmanExtraRes_Sync <-
{
  uint32 count; // 数量
};

/////////////////////////////////////////////////////////////////////////////////////
// 游乐场（取代旧有的家族驻地）

// 进入游乐场请求
struct U2GS_Guild_FairgroundEnter_Request ->
{
  uint64  targetGuildID;
};

// 进入游乐场后同步设备状态
struct Ride
{
  uint32  id;     // 设备ID
  uint32  level;  // 设备等级
  uint8   state;  // 设备状态 0维护中;1未到开放时间;2正常开放
};
struct RideRole
{
  uint64  roleID;   // 角色ID
  uint64  guildID;  // 家族ID（注意！这里是角色所处游乐场对应的家族ID，不一定是角色所在的家族ID）
  uint32  rideID;   // 设备ID
  uint32  seatID;   // 座位ID
  uint32  time;     // 开始使用的时间 （本地时间戳，从1970年1月1日起，秒）
};
struct GS2U_Guild_FairgroundEnter_Ack <-
{
  uint64            guildID;  // 家族ID（注意！这里是角色所处游乐场对应的家族ID，不一定是角色所在的家族ID）
  vector<Ride>      listRide; // 设备列表
  vector<RideRole>  listRole; // 正在使用设备的玩家列表
};

// 使用设备请求
// 操作类型0和1仅能在游乐场中使用
// 操作类型2可以不在游乐场中使用，但需要对应权限
struct U2GS_Guild_FairgroundRide_Request ->
{
  uint32  id;     // 设备ID
  uint8   type;   // 操作类型 1乘坐;2取消乘坐;3升级
};

// 反馈/同步设备使用情况
// 操作类型1和2仅反馈给地图上的角色
// 操作类型3仅反馈操作者和被操作家族游乐场地图上的角色
struct GS2U_Guild_FairgroundRide_Sync <-
{
  Ride      ride; // 刷新设备情况（操作对象设施）
  RideRole  role; // 刷新角色情况（操作对象角色）
  uint8     type; // 操作类型 1乘坐;2取消乘坐;3升级（需要对应权限）
};



/////////////////////////////////////////////////////////////////////////////////////
// 碎片祈愿
// X值表示当前角色针对某个碎片道具的拥有数量，客户端取背包道具数量即可
// M值表示某个成员当日收到的碎片数量，由服务端计数并同步给客户端
// N值表示某个碎片每人每日最多收到多少个，是M值的上限，在配置表item.useParam1中

// 公会成员个人信息（祈愿相关）
struct Supplication
{
  uint64  roleID;           // 角色唯一ID
  uint64  roleCode;         // 角色Code，如果不在线，code为0
  string  roleName;         // 角色名
  uint8   roleGuildLevel;   // 角色在公会中的职位

  uint32  career;           // 职业
  int8    race;             // 种族
  int8    sex;              // 性别
  int32   head;             // 系统头像（自定义头像使用其它接口获取）
  uint16  frameID;          // 头像框
  int32   level;            // 角色等级

  uint16  itemID;           // 祈愿道具ID
  uint16  itemM;            // 祈愿道具M值：玩家本次祈福获得的碎片量
  bool    isGive;           // 当日是否已经赠送过了（如果是自己则恒为true）
};

// 打开祈愿界面请求列表
struct U2GS_Guild_OpenSupplication_Request ->
{
};

// 反馈祈愿界面请求列表（未加入家族时忽略）
struct GS2U_Guild_OpenSupplication_Ack <-
{
  vector<Supplication>  listInfo;
};

// 发布祈愿
struct U2GS_Guild_Supplicate_Request ->
{
  uint16  itemID;
};

// 发布祈愿成功（失败时返回ErrorCode）
struct GS2U_Guild_Supplicate_Ack <-
{
  uint16  itemID;
};

// 赠送碎片
struct U2GS_Guild_SupplicateGive_Request ->
{
  uint64  roleID;
  uint16  itemID;
};

// 赠送碎片成功（反馈在线的双方便于处理历史记录）// 反馈赠礼（用于客户端刷新赠礼记录）
struct SuppHistory
{
  uint32  time;       // 时间戳
  uint64  roleID;     // 赠送者角色ID
  uint64  tarRoleID;  // 被赠送目标角色ID
  uint16  itemID;     // 赠送道具ID
  uint16  itemM;      // 最新M值
};
struct SuppHistory2
{
  uint32        career;     // 职业
  int8          race;       // 种族
  int8          sex;        // 性别
  int32         head;       // 系统头像（自定义头像使用其它接口获取）
  int32         level;      // 角色等级
  SuppHistory   history;    // 记录1
};
struct NameTable2
{
  uint64  id;         // 角色ID
  string  name;       // 角色名
};
struct GS2U_Guild_SupplicateGive_Ack <-
{
  SuppHistory2        history;     // 单条记录
  vector<NameTable2>  nameTables;  // 名称表
};

// 赠送碎片失败
// 特别用于客户端刷新界面
struct GS2U_Guild_SupplicateGiveF_Ack <-
{
  uint8   type;       // 1自己不在家族；2对方与自家家族不同；3对方M值满
  uint64  tarRoleID;  // 对方角色ID
};

// 上线时同步赠送碎片记录
struct GS2U_Guild_SupplicateGive_Sync <-
{
  vector<SuppHistory2>  listHistory;    // 多条记录
  vector<NameTable2>    nameTables;     // 名称表
};




//------家族BOSS战斗-------------------------

// 请求家族面板展示信息
struct U2GS_RequestGuildBossInfo ->
{
 
};

struct GuildHurtList
{
  string  name;       // 角色名
  uint64  hurt;       //角色伤害
};

struct GuildFastrecord
{
  string  guildname;       // 军团名字
  uint64  useTime;       //使用时间，秒为单位
};


// 返回家族面板信息
struct GS2U_RequestGuildBossInfo_Sync <-
{
  uint8 guildBosslevel;           //家族BOSS等级   0-9
  uint8 hurtBosslevel;           //伤害排行对应的介数 1-10
  uint8 curGuilBosslevel;           //当前进行阶级 1-10
  vector<GuildHurtList>  listHurtList;    // 伤害排行 
  vector<GuildFastrecord>  listFastrecord;    // 最快击杀排行
};

// 返回当前自己伤害
struct GS2U_MyGuildBossRank <-
{
  uint16  rank;           //自己当前排行
  uint64  myhurt;          //角色伤害
};

// 请求进入战斗
struct U2GS_RequestEnterGuildBoss ->
{
     uint8 rquestBosslevel;           //挑战几阶BOSS  1-10在我给你发的最高等级 在+1
};

// 请求伤害排行
struct U2GS_RequestGuildRank ->
{
 
};

// 家族战斗中的伤害  进入地图后我会发这个消息给你
struct GS2U_GuildBossRank <-
{

  uint8 buffLevel;           //buff层数   0-9
  vector<GuildHurtList>  listHurtList;    // 伤害排行
};

// 家族BOSS结算
struct GS2U_GuildBossResoult<-
{
  bool  isChallengeSucceeds       //是否挑战成功
  uint8 guildBosslevel;           //家族BOSS阶级
  bool  isMyFirstKill;         //是否自己首杀
  bool  isMyKill;              //是否自己击杀
  
};
// 请求购买加成BUFF
struct U2GS_GuildBossBuyBuff ->
{
   uint  buffID;           //buffID
};

// 请求自己家族当前阶 击杀BOSS排名
struct U2GS_MyGuildKllBossRank ->
{
   uint  guildLevel;           //buffID
};

// 返回当前自己家族排名，用时时间
struct GS2U_MyGuildKillBossRank <-
{
  uint16  rank;           //自己家族击杀排行
  uint16  ustime;          //用时时间
  vector<GuildFastrecord>  listTopTenGuildList;    // 当前阶级排名前十的家族
};


//------家族BOSS战斗-------------------------


/////////////////////////////////////////////////////////////////////////////////////
// 家族任务相关：索取与捐赠 begin

// 索取条目
struct GuildLoopTask_Get
{
	uint64	roleID;						// 角色唯一ID
	uint64	roleCode;					// 角色Code，如果不在线，code为0
	string	roleName;					// 角色名
	uint8		roleGuildLevel;		// 角色在公会中的职位
	uint32	career;						// 职业
	int8		race;							// 种族
	int8		sex;							// 性别
	int32		head;							// 系统头像（自定义头像使用其它接口获取）
	uint16      frameID;                        // 头像框
	int32		level;						// 角色等级
	uint16	taskID;						// 相关任务ID
	uint16	itemID;						// 索取道具ID
	uint16	itemM;						// 索取道具M值：玩家本次索取获得的道具量
	uint16	itemN;						// 索取道具N值：玩家发起索取时需要的道具量
	bool		isGive;						// 是否已经捐赠过了（如果是自己则恒为true）
	uint32	timeWantGet;			// 发起索取的时间
};

// 上线或请求时反馈，同步自己当前的索取条目
// PlayerDailyCount.dailyType=29且PlayerDailyCount.dailyID=5时
// PlayerDailyCount.dailyValue表示当日已经索取次数
struct GS2U_GuildLoopTask_MyGet_Sync <-
{
	// 0上线同步；1发起索取的反馈；2被捐赠时若在线的同步；因任务变动导致的删除索取信息
	// 每日重置时没有同步，因为逻辑上是放弃正在进行的家族任务，因此客户端可直接清除正在索取的条目
	uint8											state;
	// 可能有的索取条目，无效时为空列表
	// 任务无效时无效；未发起索取时无效
	vector<GuildLoopTask_Get>	myGet;
};

// 发起索取，反馈GS2U_GuildLoopTask_MyGet_Sync
// 可能伴随ErrorCode
struct U2GS_GuildLoopTask_WantGet_Request ->
{
	uint16	taskID;	// 相关任务ID
};

// 打开捐赠界面请求数据
struct U2GS_GuildLoopTask_OpenUI_Request ->
{
};

// 打开捐赠界面数据反馈
struct GS2U_GuildLoopTask_OpenUI_Ack <-
{
	vector<GuildLoopTask_Get>	listData;
};

// 请求指定目标的捐赠信息（用于绕过U2GS_GuildLoopTask_OpenUI_Request的针对性捐赠的显示数据支持）
struct U2GS_GuildLoopTask_WantGive_Request ->
{
	uint64	roleID;
	uint32	time; // 用于同步的时间戳(索取发起的时间)
};
struct GS2U_GuildLoopTask_WantGive_Ack <-
{
	uint8											type;				// 如同GS2U_GuildLoopTask_Give_Ack.type
	uint64										roleID;			// 如果需要删除条目，则根据该RoleID进行删除
	vector<GuildLoopTask_Get>	listData;		// 为空时需要删除，否则需要刷新
};

// 发起捐赠
struct U2GS_GuildLoopTask_Give_Request ->
{
	uint64	roleID;
	uint16	itemID;
	uint32	count;
};

// 反馈捐赠结果（反馈捐赠方）
struct GS2U_GuildLoopTask_Give_Ack <-
{
	uint8											type;				// 0成功；1自己不在家族；2对方与自家家族不同；3对方M值满；4自己物品不足（id错误）；5自己物品不足（数量不足）；6自己物品不足（协议传参为0）；7捐赠数量溢出（并发冲突）;8捐赠对象是自己；9已经捐过了
	uint64										roleID;			// 如果需要删除条目，则根据该RoleID进行删除
	uint16										taskID;			// 成功时可能需要使用该字段展示奖励，目前是用task.grouid和task.task_star查找表guildDonation_reward
	vector<GuildLoopTask_Get>	listData;		// 为空时需要删除，否则需要刷新
	uint32										count;			// 捐赠成功后对应的数量
};

// 打开记录面板时请求自己相关的历史记录
struct U2GS_GuildLoopTask_History_Request ->
{
};

// 反馈历史记录
struct GuildLoopTaskGiveHistory
{
	uint32	time;				// 时间戳
	uint64	roleID;			// 赠送者角色ID
	uint64	tarRoleID;	// 被赠送目标角色ID
	uint16	taskID;			// 相关任务ID
	uint16	itemID;			// 赠送道具ID
	uint16	itemM;			// 最新M值
	uint16	itemN;			// 相关N值
};
struct GuildLoopTaskGiveHistory2
{
	uint32										career;		// 职业
	int8											race;			// 种族
	int8											sex;			// 性别
	int32											head;			// 系统头像（自定义头像使用其它接口获取）
	int32											level;		// 角色等级
	GuildLoopTaskGiveHistory	history;	// 记录1
};
struct GS2U_GuildLoopTask_History_Ack <-
{
	vector<GuildLoopTaskGiveHistory2>	listHistory;	// 多条记录
	vector<NameTable2>								nameTables;		// 名称表
};

// 家族任务相关：索取与捐赠 end
/////////////////////////////////////////////////////////////////////////////////////
