%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 同步属性定义
%%% @end
%%% Created : 20. 十一月 2014 14:32
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(PlayerPropSyncDefine_hrl).
-define(PlayerPropSyncDefine_hrl,1).

%% 支持属性类型
%% (以下四种类型均可同步至客户端，也可保存至数据库)
-define(PropType_INT, 1).
-define(PropType_INT64, 2).
-define(PropType_FLOAT, 3).
-define(PropType_STRING, 4).
%% (以下类型只能保存数据库或者服务器内部使用，不能同步给客户端)
-define(PropType_Any, 5).
-export_type([serProp/0]).

-type propType() :: ?PropType_INT .. ?PropType_Any.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 需要保存到数据库的属性列表，在（公共可视，私有可视与服务器内部属性中定义）
%% 请确保属性在playerPropSync:init()中初始化
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(SaveSqlPropList, [
	?PriProp_PlayerForce,
	?PriProp_PetForce,
	?PubProp_TitleSlot1,
	?PubProp_TitleSlot2,
	?PubProp_TitleSlot3,
	?PubProp_TitleColorSlot,
	?PubProp_TitleFloorSlot,
	?PubProp_FashionVisibleFlag,
	?PubProp_ArunaValue,
	?SerProp_LoadGiveEndIndex,
	?SerProp_MSShopNextFreshTime,
	?SerProp_LoadRefineFlag,
	?PubProp_PlayerKillValue,
	?SerProp_PlayerRevivePhase,
	?PriProp_PlayerKpNum,
	?PubProp_TitleOutDate,
	?PubProp_WingLevel,
	?PriProp_FashionRoomExp,
	?PriProp_FashionRoomLevel,
	?PriProp_CrosArenaInte,
	?PriProp_PlayerOnlineTime,
	?PriProp_PlayerOnlineReward,
	?SerProp_CrosArenaTickTime,
	?SerProp_PlayerHistoryForce,
	?SerProp_PlayerHistoryForceNoPet,
	?SerProp_PlayerLottery,
	?PriProp_PlayerDailySignIn,
	?PriProp_PlayerSignReward,
	?SerProp_playerLevelReward,
	?SerProp_PlayerInvestment,
	?SerProp_PlayerSevenMission,
	?SerProp_PlayerPetFairy,
	?SerProp_GuildExpeditinScore,
	?SerProp_Ladder1v1BestScort,
	?SerProp_GoblinPayMoneyOnce,
	?SerProp_GoblinPayMoneyTenTimes,
	?SerProp_TreasurePayMoneyOnce,
	?SerProp_TreasurePayMoneyTenTimes,
	?SerProp_ActionPoint,
	?SerProp_RedEnvelopeHistory,
	?PriProp_RedEnvelopeSendNum,
	?PriProp_RedEnvelopeSendMoney,
	?PriProp_RedEnvelopeRecvNum,
	?PriProp_RedEnvelopeRecvMoney,
	?PriProp_Liveness,
	?PriProp_WakeUpExp,
	?PubProp_WakeSkillLv,
	?SerProp_MarriageWantBuildTime,
	?SerProp_MarriageTaskInfo,
	?PriProp_MeditationExp,
	?SerProp_PlayerBQs,
	?SerProp_PlayerDZs,
	?SerProp_ActiveFashionSuitList,
	?PriProp_Guild_GodBless_LastTime,
	?PriProp_SkillPoint,
	?SerProp_EquipRecastList,
	?SerProp_PlayerFlag,
	?SerProp_Guild_ExchangeMax,
	?PubProp_ActiveGoddessID,
	?SerProp_PetTerritoryVigor,
	?SerProp_Guild_GodBless_Schedule,
	?SerProp_LotterySys,
	?PriProp_Vip1,
	?PriProp_Vip2,
	?PriProp_Vip3,
	?SerProp_PetAssistBattleInfo,
	?SerProp_SevenDayAim_CopyMap,
	?SerProp_SevenDayAim_WarriorTrial,
	?SerProp_SevenDayAim_FashionCount,
	?SerProp_SevenDayAim_LSTypeMake,
	?SerProp_SevenDayAim_FurniSave,
	?SerProp_SevenDayAim_Dance,
	?SerProp_SevenDayAim_Answer,
	?SerProp_SevenDayAim_LSTypePlant,
	?SerProp_SevenDayAim_LSTypeFish,
	?SerProp_SevenDayAim_LSTypeMine,
	?SerProp_SevenDayAim_LSTypeHunt,
	?SerProp_SevenDayAim_WorldBoss,
	?SerProp_SevenDayAim_Trade,
	?SerProp_SevenDayAim_Aruna,
	?SerProp_SevenDayAim_GuildTask,
	?SerProp_SevenDayAim_ProtectGodTimes,
	?SerProp_SevenDayAim_GatherBattle,
	?SerProp_SevenDayAim_CopyMapTime,
	?SerProp_SevenDayAim_DateTimes,
	?SerProp_SevenDayAim_GuildTaskTimes,
	?SerProp_SevenDayAim_Force,
	?SerProp_SevenDayAim_EquipQuality,
	?SerProp_SevenDayAim_PetAdd,
	?SerProp_SevenDayAimTimeBegin,
	?SerProp_SevenDayAimAlreadyReward,
	?SerProp_SevenDayAim_GemCount,
	?SerProp_ThirtyDayTimeAlreadyReward,
	?SerProp_SideTaskCompleteList,
	?SerProp_SevenDayAim_ProtectGod,
	?SerProp_SevenDayAim_Material,
	?SerProp_UpSkill_CostList,
	?SerProp_EquipGems,
	?SerProp_ThirtyDayTimeBegin,
	?SerProp_AlreadyEnterNormalMapJustForMonsterBook,
	?SerProp_LifeSkill,
	?SerProp_LoopTaskProcess,
	?SerProp_Business,
	?SerProp_DialBox,
	?SerProp_EquipWashCount,
	?SerProp_CrossAliveKill,
	?SerProp_CrossAliveAchieve,
	?SerProp_HomeFurniTrueReward,
	?SerProp_GrowUpMoney,
	?PriProp_SpiritValue,
	?PriProp_SpiritTickTime,
	?SerProp_FloatingProgress,
	?SerProp_FloatingReward,
	?SerProp_WarriorTrial_RewardID,
	?SerProp_LifeSkillNotFreeCount,
	?SerProp_playerFindResLastLevel,
	?SerProp_LifeSkillFishTime,
	%% ?SerProp_CollectionWords,	===========(废弃)===========
	?SerProp_GroupBuyRewardBuy,
	?SerProp_GroupBuyGoodsBuyNum,
	?SerProp_GroupBuyScore,
	?SerProp_GroupBuyScoreLastTime,
	?SerProp_ReportPic,
	?PriProp_Report_Time,
	?SerProp_SevenDayAim_Enchant,
	?SerProp_SevenDayAim_GuildIn,
	%% ?SerProp_CollectionWordsLimit,	===========(废弃)===========
	?SerProp_LoopTaskState,
	?SerProp_PurpleRosesGetCount,
	?SerProp_CollectionWordsVer,
	?SerProp_IsAutoHidePet,
	?SerProp_CopyMapDevilStar,
	?PriProp_VigourValue,
	?SerProp_CurRoleAwakeInfo,
	?SerProp_RoleAwakeList,
	?SerProp_AwakeBuffTimeInfo,
	?PubProp_CustomTitle,
	?PubProp_PlayerFrameID,
	?PriProp_MarriageTitle,
	?SerProp_CareerPassiveSkill,
	?SerProp_KoreanaverRewardGet,
	?SerProp_QuestionnaireSurveyAwardCnt,
	?SerProp_ArunaAutoTaskTime,
	?SerProp_ReportList,
	?SerProp_ReportVersionNum,
	?PriProp_GoogleAchieve_Coin6,
	?PriProp_PlayerHomeOnlineTime,
	?SerProp_HomeBossLetter,
	?SerProp_DeadlineGiftStart,
	?SerProp_DeadlineGiftBuy,
	?SerProp_DeadlineGiftStateNeedToPopup,
	?SerProp_NewFashionInfo,
	?SerProp_WorldBossAwardGetInfo,
	?SerProp_cacRaceLastSetting,
	?PriProp_ChallengeCopyReward,
	?SerProp_GMRechargeOfflineTemStorage,
	?SerProp_ReportReset

]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 公共可视属性，会广播给自己和可视范围内的玩家的属性
%% 请保证枚举值顺序并在playerPropSync:init()中初始化
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(PubProp_Start, 				0).
-define(PubProp_GuildID, 			1).		% int64 军团ID
-define(PubProp_GuildPower, 		2).		% int 军团权限
-define(PubProp_GuildName, 			3).		% string 军团名字
-define(PubProp_TeamID, 			4).		% int64 普通队伍ID
-define(PubProp_GroupID, 			5).		% int64 分组ID
-define(PubProp_FashionMajorHand, 	6).		% int 时装主手
-define(PubProp_FashionHead, 	    7).		% int 时装头
-define(PubProp_FashionClothes, 	8).		% int 时装衣服
-define(PubProp_TitleSlot1, 		9).		% int 称号槽位1
-define(PubProp_TitleSlot2, 		10).	% int 称号槽位2
-define(PubProp_TitleSlot3, 		11).	% int 称号槽位3
-define(PubProp_TitleColorSlot, 	12).	% int 称号颜色槽位
-define(PubProp_TitleFloorSlot, 	13).	% int 称号底图槽位
-define(PubProp_ArunaValue,			14).	% int Aruna军衔值
-define(PubProp_FashionVisibleFlag,	15).	% int 0显示时装，1不显示时装
-define(PubProp_ArunaSampleValue,	16).	% int Aruna样本值，只用来做同步，不用这个来保存数据库
-define(PubProp_TitleOutDate,		17).	% int 过期称号的ID
-define(PubProp_WingLevel,			18).	% ===========(废弃)===========int 翅膀等级（实际上是翅膀阶级），参考?PriProp_WingMaxLevel
-define(PubProp_DarknessCamp,		19).	% int 黑暗之地阵营，0无，1正义，2邪恶
-define(PubProp_ActiveGoddessID,    20).    % 激活的女神id
-define(PubProp_WakeSkillLv, 		21).  	%% 觉醒技能等级uint32
-define(PubProp_HeadEmoticonIcon,   22).  	%% 头顶表情符号索引 int
-define(PubProp_MoveSpeed,   		23).  	%% float 移动速度
-define(PubProp_PlayerKillValue,   	24).  	%% 杀戮值
-define(PubProp_FashionBack, 		25).	% int 时装背部
-define(PubProp_FashionSpirit, 		26).	% int 时装精灵
-define(PubProp_FashionEmotion, 	27).	% int 时装表情
-define(PubProp_GatherCode, 		28).	% int64 采集目标
-define(PubProp_CustomTitle, 		29).	% string 自定义称号内容 ID 放在:PubProp_TitleSlot1中
-define(PubProp_PlayerFrameID, 		30).	% int 玩家当前头像框ID (头像框在Item图集中)
-define(PubProp_End, 			31).
-type pubProp() :: ?PubProp_Start .. ?PubProp_End.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 私有可视属性，属性改变仅通知自己进程所属的客户端
%% 请保证枚举值顺序并在playerPropSync:init()中初始化
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(PriProp_Start, 				10000).
-define(PriProp_Vip1, 				10001).	% int64 Vip1到期时间
-define(PriProp_Achieve,			10002). % int 成就值
-define(PriProp_GuildApplyNumber,	10003). % int 家族申请个数
-define(PriProp_MeditationExp,		10004). % int 灵力冥想基础经验
-define(PriProp_RoleCreateTime,		10005). % int 角色创建时间
-define(PriProp_Guild_GodBless_LastTime,	10006).	% int 家族系统-女神祈福-上次成功祈福的时间
-define(PriProp_FashionRoomLevel,		10007). % int 衣帽间等级
-define(PriProp_PreRecharge,		10008). % int 预充值金额
-define(PriProp_PlayerForce,		10009). % int64 玩家战力
-define(PriProp_Vip2,				10010). % int64 Vip2到期时间
-define(PriProp_Vip3,				10011).	% int64 Vip3到期时间
-define(PriProp_PetForce,			10013).	% int64 宠物战力、宠物总战斗力
-define(PriProp_PlayerKpNum,		10014).	% int 玩家杀人数量
-define(PriProp_FashionRoomExp,		10015).	% int 衣帽间
-define(PriProp_CrosArenaInte,		10016). % int 跨服竞技场积分
-define(PriProp_PlayerOnlineTime,	10017). % int 玩家在线时长 分钟计算
-define(PriProp_PlayerOnlineReward, 10018).	% int64 玩家在线领取奖励列表
-define(PriProp_PlayerDailySignIn,  10019). % int <<玩家每次签到:32>> = <<当前月份:8,上次签到日期:6,当月签到起始日期:6,当月积累签到次数:6,当日是否已签到:6>>
-define(PriProp_PlayerSignReward,   10020). % int 玩家累计签到奖励
-define(PriProp_PlayerGmSwitch,   	10021). % int GM活动开关
-define(PriProp_WakeUpExp,          10022). % int 觉醒技能经验值（不同于以前的女神觉醒，而是所有器灵等级相关联的觉醒技能）
-define(PriProp_WorldRedEnvelope,   10023). % int 红包通知开关
-define(PriProp_RedEnvelopeSendNum,   10024). % int64 发次数
-define(PriProp_RedEnvelopeSendMoney, 10025). % int64 发钱
-define(PriProp_RedEnvelopeRecvNum,   10026). % int64 收次数
-define(PriProp_RedEnvelopeRecvMoney, 10027). % int64 收钱
-define(PriProp_Liveness,             10028). % int64 活跃度
-define(PriProp_MaterialValue,             10029). % int64 材料副本资源值
-define(PriProp_SkillPoint,             10030). % int64 技能点
-define(PriProp_PlayerAllPetForce,     10031). % int64 所有宠物战力
-define(PriProp_GuildLevel,     10032). % int 所在家族等级，没有家族则为0
-define(PriProp_ChangeLineCD,     10033). % int 切线路冷却时间
-define(PriProp_SpiritValue,     10034). % int精力值
-define(PriProp_SpiritTickTime,     10035). % int64精力值恢复时间
-define(PriProp_CanRenameState,     10036). %  角色可改名状态
-define(PriProp_Report_Time,	10037).	% int64 玩家被处罚时间
-define(PriProp_ChallengeCopyReward,	10038).	% int 挑战本多倍奖励状态
-define(PriProp_VigourValue,	10039).	   %角色觉醒元气值
-define(PriProp_MarriageTitle,10040).	   %婚姻title自定义内容
-define(PriProp_GoogleAchieve_Coin6,	10041).	   % 谷歌成就_绑钻累积花费
-define(PriProp_PlayerHomeOnlineTime,	10042).	   % 家园BOSS 预告函计时器
-define(PriProp_End, 				10043).   %
-type priProp() :: ?PriProp_Start .. ?PriProp_End.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 私有属性，只存在于服务器内部，不进行任何同步
%% 请保证枚举值顺序并在playerPropSync:init()中初始化
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(SerProp_Start, 				20000).
-define(SerProp_CopyMapDropItems,	20001).	% {mappid, mapid, [{itemid, number}|_]} 内存中保存副本中的掉落列表
-define(SerProp_HDBattleGetRYTime,	20002). % int64 上次获得荣誉值的时间utc ms
-define(SerProp_RepMountSpeed,		20003). % float 上次爵位给坐骑的加成
-define(SerProp_GetRankRewardCDTime,20004).	% int64 领取排行榜奖励的CD时间
-define(SerProp_PlayerClockCache,	20006). % [#recSavePlayerClock{},...] 玩家时钟缓存
-define(SerProp_BagFullTipsLastTime,20007). % [{背包类型::uint32(), 最近的提示时间::uint32()}, ...] 用于背包已满导致的无法添加道具（目前有普通道具、装备、纹章、符文）的ErrorCode提示，记录时间防止提示过于频繁
-define(SerProp_MeditationState,	20008). % int 灵力冥想状态
-define(SerProp_VipPowerList,		20009). % [] list 爵位vip的权限列表
-define(SerProp_LoadPropList,		20010). % [#rec_player_prop{},...] 加载的需要保存的公共属性
-define(SerProp_LoadGiveEndIndex,	20011). % int32 当前已经获取补偿的类型
-define(SerProp_MSShopNextFreshTime,20012). % int64 神秘商店下一次刷新时间
-define(SerProp_LoadRefineFlag,		20013). % int装备标示
-define(SerProp_RobRoleLoadData,	20014). % 机器人加载参数#rec_LoadRobData{}
-define(SerProp_RobRoleTargetCode,  20015). % int 机器人的目标code
-define(SerProp_RobSkillListAndMinAttackLen,20016). % {[ID,...], float} 机器人技能和最小攻击距离
-define(SerProp_RobRoleSkillSN,     20018). % int 机器人使用技能的SN
-define(SerProp_RobRoleTargetXY,    20019). % int 机器人的目标位置[{Code,TX,TY},...]
-define(SerProp_RobRoleUseItemTime, 20020). % int64 机器人的回复血量的时间
-define(SerProp_PlayerInLadder1v1,  20021). % int 玩家是否在天梯比赛中
-define(SerProp_PlayerLadder1v1Prop,20022). % [{propindex,propcoefficient},...] 玩家在天梯比赛中，因战力相关太大而增加的属性
-define(SerProp_RobSkillCD,   20023). % {int, int} 机器人使用技能的CD时间,该技能的公共CD
-define(SerProp_PlayerRevivePhase,  20024). % int 玩家普通复活和收费复活阶段，收费复活占第三个字节，普通复活占第四个字节
-define(SerProp_PlayerDTime,        20025). % int64 玩家死亡时间
-define(SerProp_PlayerRTime,        20026). % int 多少秒后允许复活
-define(SerProp_PRequestDarkness,   20027). % int64 请求加入黑暗之地的CD
-define(SerProp_PetAssistBattleInfo,  20028). % 骑宠助战信息[#recPetAssistInfo{}]
-define(SerProp_Guild_ExchangeMax,	20029). % [{ID::uint32(), LevelMax::uint32()}, ...]家族系统-兑换功能 {对应配置ID, 已兑换的最大级别} 需要保存
-define(SerProp_GuildSkillDec,		20030). % [{ID, value},...] 军团技能修正的减法值
-define(SerProp_GuildSkillDiv,		20031). % [{ID, value},...] 军团技能修正的除法值
-define(SerProp_CrosArenaTickTime,	20032). % int64跨服竞技场积分更新时间
-define(SerProp_CrosArenaSyncHurt,	20033). % int64 上次同步伤害的时间utc ms
-define(SerProp_PlayerHistoryForce, 20034). % int64玩家历史战斗力（包含骑宠）
-define(SerProp_PlayerLottery, 		20035). % 占卜相关数据{DiamondSingle,GoldRstTime,DiamonRstTime}
-define(SerProp_playerLevelReward,  20036). % string 用户等级礼包
-define(SerProp_playerFindRes,      20037). % [#rec_player_find_res{},...] 资源玩家个人的资源找回数据
-define(SerProp_PlayerInvestment, 	20038). % 天使投资相关数据[]
-define(SerProp_PlayerSevenMission, 20039). % 七日任务相关数据[]
-define(SerProp_PlayerPetFairy,		20040). % 宠物精灵[]
-define(SerProp_PlayerRune,		    20041). % 符文列表[#recRune{},...]
-define(SerProp_PlayerPetRune,		20042). % 符文列表[#recRune{},...]
-define(SerProp_GuildExpeditinScore,20043). % 沙盘PVP得分{version, score}
-define(SerProp_HeadEmoticonIconTime,20044). % 头顶表情符号更换时间
-define(SerProp_MarriageWantBuildTime, 20045).	% 求婚时间表[#recWantBuild{}, ...]
-define(SerProp_MarriageSkillListCache, 20046).	% 已学并加载的夫妻技能{ID,Lv}缓存[{uint(),uint} ...]
-define(SerProp_MarriageTaskInfo,	20047).		% 情缘任务信息{HeadTaskID::uint(), TimeLast::uint32()} 需要每日重置
-define(SerProp_MarriageRingAdd,	20048).		% 婚戒附加属性缓存 属性列表为[{PropType::uint(), PropValue::float()},...]的格式 缓存格式为{{自己来源的加法值列表,自己来源的加法值列表}} 没错，只有加法值
-define(SerProp_Ladder1v1BestScort, 20049).		% 天梯1v1中自己历史最高排名
-define(SerProp_GoblinPayMoneyOnce, 20050).		% 哥布林单次抽奖
-define(SerProp_GoblinPayMoneyTenTimes, 20051).	% 哥布林十次抽
-define(SerProp_TreasurePayMoneyOnce, 20052).	% 稀世宝藏单次抽奖
-define(SerProp_TreasurePayMoneyTenTimes, 20053).% 稀世宝藏十次抽奖
-define(SerProp_RobPetSkillListAndMinAttackLen, 20054).%{[ID,...], float} 机器人宠物的技能列表与最小攻击距离
-define(SerProp_ActionPoint, 20055).% 玩家体力值[LasFreshUTCSec,Value]
-define(SerProp_RedEnvelopeHistory, 20056).% 红包记录-define(SerProp_PlayerBQs, 20057).% 玩家获得的收费表情ID列表[ID1,ID2,...]
-define(SerProp_PlayerBQs, 20057).% 玩家获得的收费表情ID列表[ID1,ID2,...]
-define(SerProp_PlayerDZs, 20058).% 玩家获得的收费动作ID列表[ID1,ID2,...]
-define(SerProp_ActiveFashionSuitList, 20059). % 玩家激活的时装套装列表 [ID1,...]
-define(SerProp_CopyMapSpecEventTemp, 20060). % 副本特殊事件临时记录，用于需要重置的状态的清理 [term(), ...]
-define(SerProp_EquipRecastList, 20061). % 装备重铸[term(), ...]
-define(SerProp_PlayerFlag, 20062). % int64
-define(SerProp_PlayerConvoyTarget, 20063). % int {id,code,term()}
-define(SerProp_PetTerritoryVigor, 20064). % 新版骑宠领地-精力值[LastUpdateTime::uint32(), Value::uint32()]
-define(SerProp_PetTerritorySearch, 20065). % 新版骑宠领地-临时记录搜索消耗货币，搜索失败时返回[{CoinUseType::uint32(), CoinUseCount::uint32()}, ...]
-define(SerProp_BattleLearnHP, 20066). % int
-define(SerProp_Guild_ExchangeCur,	20067). % [{ID::uint32(), LevelCur::uint32()}, ...]家族系统-兑换功能 {对应配置ID, 受限制而只能使用的当前级别} 只存在内存，配合?SerProp_Guild_ExchangeMax使用
-define(SerProp_Guild_GodBless_Schedule,	20068). % {LastTime::uint32(), [ID::uint32(), ...]}家族系统-女神祈福-领取进度奖励记录 {最后领取时间, [已领取的ID, ...]}
-define(SerProp_LotterySys, 20069). % int64
-define(SerProp_DanceState, 20070). % int 跳舞状态
-define(SerProp_SevenDayAim_CopyMap,		20071).	% ?SevenDayAim_CopyMap		[MapID::uint16(),...]
-define(SerProp_SevenDayAim_WarriorTrial,	20072).	% ?SevenDayAim_WarriorTrial	Layer::uint()
-define(SerProp_SevenDayAim_FashionCount,	20073).	% ?SevenDayAim_FashionCount	[FashionID::uint16(),...]
-define(SerProp_SevenDayAim_Force,			20074).	% ?SevenDayAim_Force		Force::uint64()
-define(SerProp_SevenDayAim_EquipQuality,	20075).	% ?SevenDayAim_EquipQuality [Count::uint(),...]
-define(SerProp_SevenDayAim_PetAdd,			20076).	% ?SevenDayAim_PetAdd 		[{PetID::uint16(),Count::uint()},...]
-define(SerProp_SevenDayAimTimeBegin,		20077).	% 七日目标开始时间 目前设定的是角色 功能开启后 首次登录当天凌晨4点的本地时间，时间格式如同time:getSyncTimeFromDBS/0
-define(SerProp_SevenDayAimAlreadyReward,	20078).	% 七日目标已领取奖励 存的是seven_day_aimCfg.id [uint(),...]
-define(SerProp_ThirtyDayTimeAlreadyReward,	20079).	% 30日大礼包已领取奖励 存的是已领取的最大thirty_day_login_giftCfg.id uint()
-define(SerProp_SideTaskCompleteList, 20080).
-define(SerProp_SevenDayAim_ProtectGod,		20081).	% ?SevenDayAim_ProtectGod	[MapID::uint16(),...]
-define(SerProp_SevenDayAim_Material,		20082).	% ?SevenDayAim_Material		[MapID::uint16(),...]
-define(SerProp_UpSkill_CostList,		20083).	% [{MoneyType, MoneyNumber}]
-define(SerProp_EquipGems,		20084).	% [#recGemInfo{}]
-define(SerProp_ThirtyDayTimeBegin,		20085).	% 30日大礼包开始时间 目前设定的是角色首次登录当天凌晨4点的本地时间，时间格式如同time:getSyncTimeFromDBS/0
-define(SerProp_AlreadyEnterNormalMapJustForMonsterBook,		20086).	% 玩家进入过的普通地图列表，仅用于怪物图鉴功能 [MapID::uint16(), ...]
-define(SerProp_MonsterBookProp,		20087).	% 怪物图鉴附加属性，加法值，不存DB [{propType::uint(), propValue::uint()}, ...]
-define(SerProp_PlayerHistoryForceNoPet, 20088). % int64玩家历史战斗力（不包含骑宠）
-define(SerProp_SevenDayAim_GemCount,			20089).	% ?SevenDayAim_GemLevel 		[Count::uint(),...]
-define(SerProp_LifeSkill,          20090).
-define(SerProp_LoopTaskProcess,          20091).	% [{TaskID::uint16(), TaskState::0|1|2}, ...]；TaskState:0进行中，1已完成，2已放弃；按时间降序排列
-define(SerProp_GrowUpMoney,		20092).	% 是否购买成长基金
-define(SerProp_Business,		20093).	% 商业化内容数据[#recBusiness{}]
-define(SerProp_DialBox,		20094).	% 大转盘内容数据[#recDialBox{},...]
-define(SerProp_EquipWashCount,		20095).	%  int64 装备洗练次数
-define(SerProp_CrossAliveKill,		20096).	% 跨服活动-大逃杀 击杀排行 本周周期内累计击杀数
-define(SerProp_CrossAliveAchieve,		20097).	% 跨服活动-大逃杀 角色未在线时的成就计数
-define(SerProp_HomeFurniTrueReward,		20098).	% 家园小屋 领奖次数 {Count::uint(), LastUpdateTime::uint32()}
-define(SerProp_LoopTaskGive,		20099).	% 家族任务相关_当日捐赠计数 用于判断【当前角色】是否给【目标角色的目标时间点】进行了捐赠 [{RoleID::uint64(), Time::uint32()}, ...]
-define(SerProp_FloatingProgress ,		20100).	% 漂浮之石进度#recFloating{}
-define(SerProp_FloatingReward,		20101).	% 漂浮之石领奖列表[#recFloatingAward{},...]
-define(SerProp_WarriorTrial_RewardID,		20102).	% 勇者荣耀/女神禁闭室 已领奖最大关卡ID
-define(SerProp_LifeSkillNotFreeCount,  20103).%生活技能可用的次数 [{DailyID::uint16(),NotFreeCount::uint32()},...]
-define(SerProp_playerFindResLastLevel,      20104). % 资源找回相关，玩家上次所需找回资源时的等级 [{LastTimeOld::uint32(), LastLevelOld::uint16()}, {LastTimeNew::uint32(), LastLevelNew::uint16()}]
-define(SerProp_LifeSkillFishTime,      20105). % 生活技能-钓鱼 累积时长 {Count::uint(), TimeLast::uint32(), TimeAll::uint32()}
-define(SerProp_CopyMapDevilStar,  20106).% 挑战副本通关星级列表
-define(SerProp_GroupBuyRewardBuy,  20107).%团购活动个人积分奖励领取记录 [int(), ...]
-define(SerProp_GroupBuyGoodsBuyNum,  20108).%团购活动个人商品对应购买量 {Ver::uint(), [{ID::int(), Count::uint(), Diamond::uint()}, ...]}
-define(SerProp_GroupBuyScore,  20109).%团购活动个人积分量 uint()
-define(SerProp_ReportPic,  20110).%玩家被举报次数 [Time::uint32(), Num::uint()]
-define(SerProp_SevenDayAim_Enchant,			20111).	% ?SevenDayAim_Enchant		[{PetID::uint16(),Count::uint()},...]
-define(SerProp_cacRaceLastSetting,  20112).% 关于跨服骑宠竞速的最后一次设置值 [{Key::term(), Value::term()}] 目前仅有 最后使用的骑宠 默认是否自动匹配 两项
-define(SerProp_LoopTaskState,  20113).% 家族任务用于支持跨日逻辑的缓存 LUNA-6488 {TimeLast::uint32(), IsAllFive::bool01(), CountEx::uint()} {最后更新时间, 当前轮是否是一键五星状态, 额外可用的完成轮计数}
-define(SerProp_PurpleRosesGetCount,  20114).% uint32() 台湾需求，需要统计紫玫瑰（item.id=29007）的累积购买量，目前购买来源暂定为商城购买
-define(SerProp_CollectionWordsVer,  20115).% uint32() 集字活动版本号控制，用于判断是否要主动重置角色缓存数据并同步配置给客户端
-define(SerProp_IsAutoHidePet,  20116).% uint32() 是否因玩法收回了骑宠？回到普通地图（或特定玩法例如广场舞结束）时需要重置该值并放出骑宠
-define(SerProp_GroupBuyScoreLastTime,  20117).% uint32() 最后一次获得团购积分的时间 time:getSyncTimeFromDBS/0
-define(SerProp_CurRoleAwakeInfo,   20118).% {curstage,curstone}角色觉醒当前进度
-define(SerProp_RoleAwakeList,      20119).% [{{stage,stone},param},...] 角色觉醒列表
-define(SerProp_AwakeBuffTimeInfo,  20120).% {lastUpdateTime,LeftTime} 角色觉醒buff剩余时间
-define(SerProp_CareerPassiveSkill,       20121).% [{passiveskillid,level},...] 转职被动技能列表
-define(SerProp_KoreanaverRewardGet, 20122). % [{id, ver}, ...] (活动ID, 版本号ver)韩国naver论坛独立需求活动 角色领取情况
-define(SerProp_SevenDayAim_GuildIn, 20123). % ?SevenDayAim_GuildIn    [GuildID::uint16(),...] (家族ID)
-define(SerProp_SevenDayAim_LSTypeMake,	20124).	% ?SevenDayAim_LSTypeMake	uint16()
-define(SerProp_SevenDayAim_FurniSave,	20125).	% ?SevenDayAim_FurniSave	[uint16()]
-define(SerProp_SevenDayAim_Dance,	20126).	% ?SevenDayAim_Dance	uint16()
-define(SerProp_SevenDayAim_Answer,	20127).	% ?SevenDayAim_Answer	uint16()
-define(SerProp_SevenDayAim_LSTypePlant, 20128).	% ?SevenDayAim_LSTypePlant	uint16()
-define(SerProp_SevenDayAim_LSTypeFish,	20129).	  % ?SevenDayAim_LSTypeFish	uint16()
-define(SerProp_SevenDayAim_LSTypeMine,	20130).	  % ?SevenDayAim_LSTypeMine	uint16()
-define(SerProp_SevenDayAim_LSTypeHunt,	20131).	  % ?SevenDayAim_LSTypeHunt	uint16()
-define(SerProp_SevenDayAim_WorldBoss,	20132).	  % ?SevenDayAim_WorldBoss	uint16()
-define(SerProp_SevenDayAim_Trade,	20133).	  % ?SevenDayAim_Trade	uint16()
-define(SerProp_SevenDayAim_Aruna,	20134).	  % ?SevenDayAim_Aruna	uint16()
-define(SerProp_SevenDayAim_GuildTask,	20135).	  % ?SevenDayAim_GuildTask	uint16()
-define(SerProp_SevenDayAim_ProtectGodTimes,	20136).	  % ?SevenDayAim_ProtectGodTimes	uint16()
-define(SerProp_SevenDayAim_GatherBattle,	20137).	  % ?SevenDayAim_GatherBattle	[uint16()]
-define(SerProp_SevenDayAim_CopyMapTime,	20138).	  % ?SevenDayAim_CopyMapTime	[{MapID::uint16(),Time::uint16()}...] 通关指定副本X次
-define(SerProp_SevenDayAim_DateTimes,	20139).	  % ?SevenDayAim_DateTimes	uint16() 完成次数
-define(SerProp_SevenDayAim_GuildTaskTimes,	20140).	  % ?SevenDayAim_GuildDailyTaskTimes	uint16() 完成次数
-define(SerProp_HomeBossLetter,	20141).	  % [#recLetter{}.....]家园BOSS 预告函数据
-define(SerProp_DeadlineGiftStart,	20142).	  % [{Deadline_gift::unint16, stateTime::uint64},...]  直购(限时)礼包 玩家触发 的礼包数据
-define(SerProp_DeadlineGiftBuy,	20143).	  % [{{Deadline_gift::unint16, giftID::uint16}, buyNum::uint16}] 直购(限时)礼包 玩家已购的礼包数据
-define(SerProp_DeadlineGiftStateNeedToPopup,	20144).	  %  uint16 1 有 0 无  直购(限时)礼包 需要弹出的消息
-define(SerProp_WorldBossAwardGetInfo,	20145).	  %[{bossid,{year,month,day},count}, ...] 首领入侵领取记录
-define(SerProp_NewFashionInfo,	20146).	  %  [{fashionID::uint,itemid::uint,giveRole::uint64(),giveName::string,give::string,CoinUseType::uint,Price::uint},...] 时装新品折扣活动玩家不在线缓存信息
-define(SerProp_EqupmentCombin,	20147).	%[{EquipID::uint16(), Time::uint32(), Count::uint()}, ...] 记录装备合成行为的装备ID、初次操作时间、次数
-define(SerProp_QuestionnaireSurveyAwardCnt,	20148).	%记录国内版玩家领取问卷调查的奖励
-define(SerProp_GMRechargeOfflineTemStorage,	20149).	%记录GM模拟充值时玩家不在线的临时充值信息[{item_id, addmoney},....]
-define(SerProp_ReportList,  20150).%玩家举报头像列表 [{RoleID::uint32(),Time::uint32()}...]
-define(SerProp_ReportVersionNum,  20151).%玩家举报次数 [TimeVersion::uint32(), Num::uint()]
-define(SerProp_ReportReset,  20152).%玩家头像是否需要被重置 [isRest::uint()]0是不重置  1是重置
-define(SerProp_ArunaAutoTaskTime,  20153).% aruna小号玩家不用完成任务也能提交任务
-define(SerProp_End, 20154).


-type serProp() :: ?SerProp_Start .. ?SerProp_End.



%% 内部属性表
-record(recProp, {
	propIndex	= 0,
	propType	= 0,
	propValue	= 0,
	isChange	= false
}).

-endif. % PlayerPropSyncDefine_hrl