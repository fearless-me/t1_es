// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

struct AddProp
{
	uint8 prop;
	float value;
};

// 宠物技能信息
struct PetSkillBaseInfo
{
	uint8  petSkillIndex;		//宠物技能序号
	uint16 petSkillId;			//宠物技能ID
	uint16 petSkillCd;			//宠物技能Cd
	uint8  petSkillType;		//宠物技能Type 0:天赋技能 1:通用技能 2:基础技能
	uint8  petSkillLv;			//宠物技能等级
	uint8  petSkillIsUnlock;	//宠物技能是否解锁
};

// 宠物信息
struct PetBaseInfo
{
	uint16  petID;				//宠物ID
	uint8	petStar;			//宠物星阶
	uint8	status;				//宠物是否出战 0:休息(非助战) 1:休息(助战)2:出战（非召唤）3:出战（召唤）
	vector<PetSkillBaseInfo> skillList;
	string  petName;			//宠物名字
	uint8   petRaw;				//宠物转生
	uint64  petTime;			//宠物到期时间
	vector<AddProp> petProps;	//宠物属性
	uint64  petForce;			//宠物战斗力
	uint32	upCount;			//宠物提升次数
	uint32	petLevel;			//宠物等级
	uint32	petExp;				//宠物经验
};

// 宠物装备信息
struct PetEquipInfo
{
	uint8 equipID;				//宠物装备ID
	uint8 equipLv;				//宠物装备等级
};

// 获得临时骑宠
struct GS2U_AddTempPet <-
{
	uint16  petID;				//宠物ID
};

// 宠物装备信息列表
struct GS2U_PetEquipInfoList <-
{
	vector<PetEquipInfo> petEquipInfoList;
};

// 更新单个宠物
struct GS2U_PetBaseInfo <-
{
	PetBaseInfo	 info;
};

// 更新所有宠物
struct GS2U_PetInfoList <-
{
	vector<PetBaseInfo> petInfoList;
};

// 刷新宠物技能数据
struct GS2U_UpdatePetSkill <-
{
	uint16  petID;	//宠物ID
	PetSkillBaseInfo skillInfo;
};

// 宠物技能升级或者解锁
struct U2GS_PetSkillOperate ->
{
	uint16  operationType; // 1解锁；2升级
	uint16  petID;	//宠物ID
	uint16 petSkillId;			//宠物技能ID
};

// 切换宠物
struct PetSwitch <->
{
	uint16 petId,         //宠物ID
};

// 升星宠物
struct U2GS_UpStartPet ->
{
	uint16  petID;
};

// 宠物转生
struct U2GS_RawPet ->
{
	uint16  petID;
};

// 宠物升星成功
struct GS2U_UpStartPetResult <-
{
	uint16 petID;
	uint8  curStar;		//当前星级
	uint16 petSkillID;  //宠物技能ID
};

// 宠物升级
struct U2GS_PetLevelUp ->
{
	uint16 petID;
	uint64 itemUID;    //物品UID
	uint16 useNum;    //本次使用个数
};

// 宠物升级成功
struct GS2U_PetLevelUp <-
{
	uint16 petID;
	uint16 petLevel;		 
	uint32 petExp;  
};

// 删除宠物
struct GS2U_DeletePet <-
{
	uint16 petID;
};

// 宠物转生成功
struct GS2U_RawPetResult <-
{
	uint16 petID;
	uint8  curRaw;		//当前转生等级
};

// 洗炼宠物技能
struct U2GS_PetSkillCast ->
{
	uint16  petID;
	vector<uint16> skillIDs; //技能ID列表
}

// 洗炼宠物技能结果
struct PetSkillCastResult
{
    uint16 oldSkillID;
	uint16 newSkillID;
	uint16 newSkillLevel;
}

// 洗练宠物技能结果
struct GS2U_PetSkillCastResult <-
{
	uint16  petID;
	vector<PetSkillCastResult> skillList;
};

// 替换宠物技能
struct PetSkillReplace <->
{
	uint16  petID;
}

//上骑宠
struct U2GS_OnMountPet ->
{
};

//下骑宠
struct U2GS_OffMountPet ->
{
};

//显示宠物
struct U2GS_ShowMountPet ->
{
};

//隐藏宠物
struct U2GS_HideMountPet ->
{
};

//服务器返回坐骑系列操作结果（广播给其它玩家）
//既要广播要主人周围的玩家也需要广播给宠物周围的玩家
struct GS2U_OnMountPetAck <-
{
	uint64	ownerCode;          //主人CODE
	uint64	petCode;			//宠物Code
	uint16	petId;				//宠物ID
	uint64	guestCode;			//客人code
};

//服务器返回坐骑系列操作结果（广播给其它玩家）
//需要广播给主人周围的玩家
struct GS2U_OffMountPetAck <-
{
   uint64		   code;           //主人CODE
   float	   x;			  
   float       y;			
};

//宠物睡眠，需要广播给宠物周围的玩家以及主人本人
struct GS2U_PetSleep <-
{	
	uint64	code; //宠物
};

//宠物强化
struct U2GS_PetStr ->
{
	uint8   equipID;  //装备ID
	uint8   type;	  //0:普通强化 1:一键强化
};

//宠物强化结果
struct GS2U_PetStrAck <-
{
	PetEquipInfo petEquipInfo;  
};

//宠物改名
struct PetReName <->
{
	uint16 petID;	//宠物ID
	string name;    //宠物名字
};

//宠物助战
struct  U2GS_PetAssistBattle ->
{
	uint16 petID;   //宠物ID
	uint8  slot;	//位置
	uint8  status;  //0取消助战 1助战
};
// 助战信息
struct AssistBattleInfo
{
	uint16 petID; //宠物ID
	uint8  slot;  //位置
};

// 助战信息
struct GS2U_PetAssistInit <-
{
	vector<AssistBattleInfo> infoList;   
};

//更新孔位
struct  GS2U_PetAssistUpdateSlot <-
{
	uint8  slot;	//位置
	uint16 petID;   //宠物ID
};

//更新宠物状态
struct GS2U_UpdatePetStatus <-
{
	uint16 petID;  //宠物ID
	uint8 status;  //宠物状态
};

//广播玩家宠物改名
struct GS2U_PetReName <-
{
	uint64    code;
	string  name;
};

//防止野生宠物 强制消失野生宠物
struct U2GS_PetDisapear ->
{
	uint64   code;
};

//宠物属性提升
struct U2GS_PetAddAtta ->
{
	uint16 petID; //宠物ID
	uint8  num;	  //宠物属性提升次数
};

//宠物属性提升结果
struct GS2U_PetAddAttaRes <-
{
	uint16 petID;
	vector<AddProp>	propList;
};

//宠物属性保存
struct U2GS_PetAttaSave ->
{
	uint16 petID;
};

//宠物属性保存结果
struct GS2U_PetAttaSaveRes <-
{
	uint16 petID;
	vector<AddProp>	propList;
};

//////////////////////////////////////////////////////////////////////////
// 骑宠PVE相关协议
//////////////////////////////////////////////////////////////////////////

// 章节信息
struct CatalogNode
{
	uint16		id;					 // 章节ID 参考petWar表
	uint8		starLevel;			 // 星级	
};

// 同步章节目录			触发时机：1 登陆
struct GS2U_UpdateCatalogList <-
{
	vector<CatalogNode> catalogList; // 章节列表
};

// 领取奖励 
struct U2GS_RequstReward ->
{
};

// 同步当前奖励的级别	触发时机：1 登陆 2 领取奖励成功
struct GS2U_AckRewardLevel <-
{
	uint8		rewardLevel;		 // 奖励级别
};

// 排位
struct U2GS_StandSort ->
{
	vector<uint16> petList;			 // 位置上的骑宠ID列表。数组下标表示位置，从0开始编号 
};

// 响应排位
struct GS2U_AckStandSort <-
{
	vector<uint16> petList;
};

// 同步体力				触发时机: 1 周期性同步，时间周期待定 2 购买体力时同步
struct GS2U_UpdatePower <-
{
	int32		power;				// 体力
};

// 购买体力信息			触发时机: 每次请求购买时
struct GS2U_BuyPowerInfo <-
{
	int32		money;				// 本次购买的费用
	int8		allCount;			// 可购买总数
	int8		curCount;			// 当前可购买数
};

// 购买体力
struct U2GS_BuyPower ->
{
};

// 请求战斗
struct U2GS_RequestBattle ->
{
	int			id;
};

// PVE战斗结果
struct PveItem
{
	int16       id;
	int16		num;
};

struct GS2U_PVEBattleResult <-
{
	int8		res;				// 战斗结果 0：胜利 1:失败
	int32		coin;				// 奖励金钱
	int32		exp;			    // 奖励经验
	int8		score;			    // 通关评分
	vector<PveItem> itemList;		// 物品列表
};

struct PveSweep
{
	uint8 num;	//扫荡次数
	int32		coin;				// 奖励金钱
	int32		exp;			    // 奖励经验
	vector<PveItem> itemList;		// 物品列表
};

//扫荡结果
struct GS2U_PetPveSweepAck <-
{
	vector<PveSweep> sweepList;
};

// 扫荡
struct U2GS_PetPveSweep ->
{
	uint16	id;						//副本ID
};

//////////////////////////////////////////////////////////////////////////
// 骑宠领争相关协议
//////////////////////////////////////////////////////////////////////////

//城池列表
struct PvPCityInfo
{
	uint8  cityID;   //城池ID
	uint64 cityTime  //城池占领时间
	uint64 roleID;	 //占领者ID
	uint32 cityHp;	 //城池护盾值
	uint32 cityMax;	 //城池最大值
	uint32 force;	 //战斗力
	string roleName; //占领者名字
	vector <uint16> petList; //占领者宠物ID
};


//玩家战报列表
struct PvpBattleReportInfo
{
	uint64 time;	//战报时间
	uint8  type;	//1:占领空城 2:收益 3:防守失败 4:攻城失败 5:防守胜利 6:攻城胜利
	uint8  cityID;  //城池ID
    uint64 roleID;	//占领者ID
	string roleName;//占领者名字
};

//获取骑宠Pvp信息
struct U2GS_PvpBattleInfo ->
{
};

//获取骑宠Pvp信息结果
struct GS2U_PvpBattleInfoRes <-
{
	uint8	reel;					 //抢夺令
	vector<uint16> pl;				 //宠物列表
	uint16 point;					 //积分
	vector<PvPCityInfo> cl;			 //城池列表
	vector<PvpBattleReportInfo> bpl; //战报列表
};

// 宠物位置保存
struct U2GS_PvpPosSave ->
{
	vector<uint16> petList;			 
};

// 宠物位置保存结果
struct GS2U_PvpPosSaveAck <-
{
	vector<uint16> petList;
};


// 请求Pvp战斗
struct U2GS_RequestPvpBattle ->
{
	uint8			cityID;
	uint64			roleID;
};

//  战斗结果
struct GS2U_PvpBattleResult <-
{
	int8		res;				// 战斗结果 0：胜利 1:失败
	int32		coin;				// 奖励金钱
	int32		exp;			    // 奖励经验
	PvPCityInfo pi;					// 战斗结果城池信息
};

// 更新战报
struct GS2U_PvpBattleUpdateReport <-
{
	PvpBattleReportInfo br;
};

// 购买抢夺令
struct U2GS_BuyReel ->
{
};

// 战报提示
struct GS2U_PvpBattleReportTip <-
{
};

// 同步抢夺令(自动回复和购买)				
struct GS2U_UpdateReel <-
{
	int8		reel;				// 抢夺令
};

// 查询宠物精灵信息
struct U2GS_QueryPetFairyInfo ->
{
};

// 宠物精灵信息
struct GS2U_PetFairyInfo <-
{
	int32 point;
	int16 level;
};

// 使用宠物技能书
struct U2GS_UsePetSkillBook ->
{
	uint16  petID;				//宠物ID
	uint16 	petSkillId;			//宠物技能ID
	uint16  itemid;				//商品ID
};

// 使用宠物技能书
struct GS2U_UsePetSkillBook <-
{
	uint16  petID;				//宠物ID
	uint16 	oldSkillId;			//宠物技能ID
	uint16 	newSkillId;			//宠物技能ID
	uint16 	newSkillLevel;		//宠物技能等级
};

// 双人坐骑邀请
struct U2GS_DoublePetMountInvite ->
{
	uint64 tarRoleID;
};

// 双人坐骑邀请
struct GS2U_DoublePetMountInvite <-
{
	uint16 petID;
	string srcName;
	uint64 srcRoleID;
};

// 回应双人坐骑
struct U2GS_DoublePetMountInviteAck ->
{
	int8 agree;
	uint64 srcRoleID;
};

// 重置宠物
struct U2GS_ResetPet ->
{
	uint16  petID;				//宠物ID
};

// 重置宠物ACK
struct GS2U_ResetPetAck <-
{
	uint16  petID;				//宠物ID
};


/////////////////////////////////////////////////////////////////////////////////////
// 新版骑宠领地 20170306 begin

// 查询领地信息
struct PetTerritoryInfo   // 骑宠信息
{
  uint16  petID;          // 骑宠ID
  uint16  petLevel;       // 骑宠等级
  uint64  petForce;       // 骑宠战力
  uint32  territoryID;    // 驻派领地ID（为0时表示未驻派）
  uint8   star;           // 星级
  uint8   raw;            // 转生
};
struct TerritoryInfo      // 领地基础信息
{
  uint32  territoryID;    // 领地ID
  uint32  cfgReward;      // 等级段配置，对应pet_territory_reward.id
  uint32  cfgTime;        // 开采时间配置，对应pet_territory_time.id
  uint32  cfgLevel;       // 领地等级配置，对应pet_territory_level.id
  uint32  cfgForce;       // 战力等级段配置，对应pet_territory_force.id
  uint32  timeFresh;      // 领地最近的刷新时间，用以计算奖励
  uint32  timeEnd;        // 开采结束时间
  uint32  rewardCount1;   // 奖励数量1，对应pet_territory_reward.reward
  uint32  rewardCount2;   // 奖励数量2，对应pet_territory_reward.reward
  uint32  timeSafe;       // 安全保护时间
  uint32  timeSearch;     // 搜索保护时间
};
struct U2GS_QueryTerritoryInfo_Request ->
{
	bool isOpenPanel;        //请求数据，是否需要打开面板
};
struct GS2U_QueryTerritoryInfo_Ack <-
{
  vector<TerritoryInfo>     listTerritory;  // 领地列表
  vector<PetTerritoryInfo>  listPet;        // 骑宠列表
  bool isOpenPanel；       //请求数据，是否需要打开面板
};

// 查询攻防记录
struct TerritoryHistoryCell // 单条攻防记录
{
  uint32  time;             // 攻防时间
  string  roleName;         // 角色姓名
  uint64  roleID;           // 角色ID
  uint32  territoryID;      // 领地ID
  uint32  cfgReward;        // 等级段配置，对应pet_territory_reward.id
  uint32  count1;           // 掠夺数量1，对应pet_territory_reward.reward
  uint32  count2;           // 掠夺数量2，对应pet_territory_reward.reward
};
struct U2GS_QueryTerritoryHistory_Request ->
{
  bool  attackOrDefense;    // true掠夺记录；false防守记录
};
struct GS2U_QueryTerritoryHistory_Ack <-
{
  bool                          attackOrDefense;    // true掠夺记录；false防守记录
  uint32                        fightCount;         // 攻防次数
  vector<TerritoryHistoryCell>  listInfo;           // 战胜（战败）记录
};

// 开采请求
struct U2GS_TerritoryExploit_Request ->
{
  uint32          territoryID;      // 领地ID
  vector<uint32>  listPetID;        // 派遣骑宠
  uint32          cfgTime;          // 开采时间配置，对应pet_territory_time.id
  uint32          cfgLevel;         // 领地等级配置，对应pet_territory_level.id
};
struct GS2U_TerritoryExploit_Ack <-   // 仅成功时返回，失败时返回ERRORCODE
{
  TerritoryInfo             info;     // 刷新该领地数据
  vector<PetTerritoryInfo>  listInfo; // 刷新部分骑宠数据
};

// 搜索别人的领地
struct U2GS_FindTerritory_Request ->
{
  uint64  roleID;       // 角色ID，为0时执行普通搜索，消费参考pet_territory_search，当日已搜索次数参考每日计数8；不为0时针对性反掠夺搜索
};
struct GS2U_FindTerritory_Ack <-
{
  TerritoryInfo             info;       // 领地信息
  vector<PetTerritoryInfo>  listInfo;   // 驻守骑宠信息
  uint64                    roleID;     // 角色ID
  string                    roleName;   // 角色姓名
  uint32                    count;      // 当日已搜索次数
};
struct GS2U_FindTerritoryFailed_Ack <-  // 搜不到则反馈该消息，客户端需要刷新界面
{
  uint32  errorCode;  // 错误码
};

// 掠夺请求
struct U2GS_TerritoryPlunder_Request ->
{
  uint64          roleID;       // 角色ID
  uint32          territoryID;  // 领地ID
  vector<uint32>  listPetID;    // 派遣骑宠
};
struct GS2U_TerritoryPlunder_Ack <-
{
  uint32  cfgReward;    // 等级段配置，对应pet_territory_reward.id
  uint32  count1;       // 掠夺数量1 注：如count1和count2都为0，则掠夺失败
  uint32  count2;       // 掠夺数量2
};

// 精力查询请求
struct U2GS_TerritoryVigor_Request ->
{
};
struct GS2U_TerritoryVigor_Ack <-
{
  uint32  vigor;
};

// 20170323需求变更
// 服务端需要通知客户端是否存在开采结束的领地
struct GS2U_TerritoryExploitEnd_Sync <-
{
};

// 20170324需求补充及变更
// 领地战斗心跳
struct GS2U_TerritoryBattle_Tick_Sync <-
{
  uint32  time;     // 当前状态剩余时间
  uint32  timeAll;  // 活动剩余总时间
  uint8   state;    // 2战斗前等待；3战斗；4结算
};

// 新版骑宠领地 20170306 end
/////////////////////////////////////////////////////////////////////////////////////

