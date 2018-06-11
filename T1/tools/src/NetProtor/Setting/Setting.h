////
//// 本文件的注释请以 “////”开头
//// 本文件只支持行注释
//// 空行会自动跳过
////
//// 枚举的注释必须以 “//”开头，写在每个枚举类型的前面
//// 只支持 行注释枚举，多行请自行在每行加 “//”
//// 若要在生成文件中添加空行，请使用'//'注释
////
//// ==========================================================================
//// 使用'//'注释时，在注释开头加上'(@)'表示这个设置项需要发送给客户端，'(*)'表示只会在客户端代码生成，不在服务器生成客户端需要的变量列表，但服务器初始化默认值
//// 使用'//'注释时，在注释末尾加上'($[0-9]+)'表示这个设置项的默认值，没有时，开关类默认为 0(关闭)，数值类默认为 1
//// ==========================================================================
////
//// 枚举定义的字母书写 请使用骆驼式（即：每个单词首字母大写）风格
////
//// 使用’///‘注释的文字会作为生成文件的注释
////
//// *.cs中，
////			
////
//// *.hrl中，
////		会保留骆驼式;
////		会自动在前面加上 "Setting_"
////
//// 枚举定义的值的选取，必须在 @warning 规定范围 内 ！！！！
////
////
enum Setting
{
	//全局数值类变量，占5000个32位整数
	GlobalVar_Start = 1,
	// 好友互赠幸运币抽奖几率($0)
	//GlobalVar_LuckyDrawOdd = 2,
	// 内测送出pad兑换道具的个数计数
	GlobalVar_TestActivityGivePadItemNumber = 3,
	// 活动开关控制组1(每组控制32个活动的开启与关闭)
	GlobalVar_Activity_Switch_1 = 4,
	GlobalVar_End = 5000,

	//世界数值类变量，占5000个32位整数
	WorldVar_Start = 5001,
	WorldVar_End = 10000,

	//客户端只读全局数值类变量，占5000个32位整数
	// (@)客户端只读全局数值变量开始
	GlobalVarReadOnly_Start = 10001,
	// (@)客户端只读全局数值变量结束
	GlobalVarReadOnly_End = 15000,

	//客户端只读世界数值类变量，占5000个32位整数
	// (@)客户端只读世界数值类变量开始
	WorldVarReadOnly_Start = 15001,
	// (@)客户端只读世界数值类变量结束
	WorldVarReadOnly_End = 20000,

	//玩家数值类变量，占5000个32位整数
	// (@)玩家数值类变量开始
	PlayerVar_Start = 20001,
	// 玩家领取排行榜奖励的时间($0)
	PlayerVar_GetRankPrizeTime = 20002,
	// (@)玩家数值类变量结束
	PlayerVar_End = 25000,

	//玩家只读数值类变量，占5000个32位整数
	// (@)玩家只读数值变量开始
	PlayerVarReadOnly_Start = 25001,
	// (@)玩家累计登录天数 ($0)
	PlayerVarReadOnly_AccLoginDay = 25002,
	// (@)玩家在世界BOSS战中对BOSS产生的伤害 ($0)
	PlayerVarReadOnly_WorldBossDamage = 25003,
	// (@)玩家世界BOSS战对BOSS产生伤害的截止日期时间 ($0)
	PlayerVarReadOnly_WorldBossDamage_ExpireDateTime = 25004,
	// (@)玩家累计充值的数量 ($0)
	PlayerVarReadOnly_AccCharge = 25008,
	// (@)玩家根据累计充值数量，已经领取的充值奖励等级，其中高16位为7日累计充值等级，低16位为总累计充值等级（特别注意不能跳领） ($0)
	PlayerVarReadOnly_GetAccChargePrizeLevel = 25009,
	// (@)月卡或者年卡，玩家的充值等级和根据充值等级领取奖励的累计天数，其中高16位为充值等级，低16位为根据充值等级领取奖励的累计天数 ($0)
	PlayerVarReadOnly_ChargeCardLevelAndGetPrizeDay = 25010,
	// (@)玩家充值的月卡或者年卡的开始时间($0)
	PlayerVarReadOnly_ChargeCardBeginTime = 25011,
	// (@)玩家充值的月卡或者年卡的过期时间($0)
	PlayerVarReadOnly_ChargeCardEndTime = 25012,
	// (@)玩家位flag(低1位：日本评分)
	PlayerVarReadOnly_BitFlag = 25013,
	// (@)韩国成长礼包的领取(根据玩家等级来领，低16位来表示，高16表示是否开启)
	PlayerVarReadOnly_KoreaGift = 25014,
	// (@)玩家被拉黑次数($0)
	PlayerVarReadOnly_BeBlackCount = 25015,
	// (@)玩家收到的赞($0)
	PlayerVarReadOnly_BeLike = 25016,
	// (@)玩家上次记录的弧度制经度十万倍取整[-PI * 100000, +PI * 100000]($0)
	PlayerVarReadOnly_RatLongitudeHT = 25017,
	// (@)玩家上次记录的弧度制纬度十万倍取整[-PI / 2 * 100000, +PI / 2 * 100000]($0)
	PlayerVarReadOnly_RatLatitudeHT = 25018,
	// (@)玩家当次已领取的雪人礼盒，按位标记领取了哪个雪人($0)
	PlayerVarReadOnly_SnowmanGift = 25019,
	// (@)记录最后一次领取雪人礼盒的时间，用于辅助PlayerVarReadOnly_SnowmanGift变量的重置($0)
	PlayerVarReadOnly_SnowmanGiftLastTime = 25020,
	// (@)玩家只读数值变量结束
	PlayerVarReadOnly_End = 30000,

	//代客户端保存的数值类变量，占15000个32位整数
	// (@)客户端自己需要服务器代存的数值变量开始
	ClientVar_Start = 35001,
	// (*)玩家自动使用药品ID($0)
	ClientVar_AutoHeal_ItemID = 35002,
	// (*)玩家自动喝血百分比($60)
	ClientVar_AutoHeal_HP_PerSystemMsg = 35003,
	// (*)主界面状态($1)
	ClientVar__MainStyle = 35004,
	// (*)客户端检验日常登陆($0)
	ClientVar_DailyInfo = 35005,
	// (*)客户端存储上次地图传送时间($0)
	ClientVar_MapTeleportData = 35006,
	// (*)一次进入副本114引导标记($0)
	ClientVar_FirestEnterInstance114 = 35007,
	// (*)一次进入副本101引导标记($0)
	ClientVar_FirestEnterInstance101 = 35008,
	// (*)客户端检验王者膜拜日常($0)
	ClientVar_DailyInfo_ArenaKingWorship = 35009,
	// (*)地图是否第一次进入信息开始字段
	ClientVar_FirstEnterMap_Start = 40000,
	// (@)客户端自己需要服务器代存的数值变量结束
	ClientVar_End = 50000,

	//全局开关类变量,占1000个32位整数,范围(50100 ~ 51100),50100*32=1603200,51100*32=1635200
	GlobalBitVar_StartBit = 1603200,
	//世界BOSS战开启状态($0)
	GlobalBitVar_WorldBossWar_Running = 1603201,
	//等级开关($0)
	//GlobalBitVar_Level_Running = 1603202,
	//日志3dgamedatalog库开关
	GlobalBitVar_WriteLog = 1603203,
	//日志文件开关
	//GlobalBitVar_WriteLog_File = 1603204,
	//特殊事件位开关
	GlobalBitVar_Special = 1603205,
	GlobalBitVar_EndBit = 1635200,

	//世界开关类变量,占1000个32位整数,范围(51200 ~ 52200),51200*32=1638400,52200*32=1670400
	WorldBitVar_StartBit = 1638400,
	WorldBitVar_EndBit = 1670400,

	//请注意，默认打开的开关，需要在开关初始化中自行初始化
	//客户端只读全局开关类变量,占1000个32位整数,范围(52300 ~ 53300),52300*32=1673600,53300*32=1705600
	// (@)客户端只读全局开关类变量开始
	GlobalBitVarReadOnly_StartBit = 1673600,
	// (@)QQ群号($0)
	GlobalBitVarReadOnly_Hide_QQ = 1673601,
	// (@)激活码($0)
	GlobalBitVarReadOnly_Hide_ActiveCode = 1673602,
	// (@)手机号绑定($0)
	GlobalBitVarReadOnly_Hide_MobileBind = 1673603,
	// (@)手动更新按钮($0)
	GlobalBitVarReadOnly_Hide_ManualUpdate = 1673604,
	// (@)排行榜功能($0)
	GlobalBitVarReadOnly_Hide_Rank = 1673605,
	// (@)BUG提交按钮($0)
	GlobalBitVarReadOnly_Hide_BugReport = 1673606,
	// (@)幸运抽奖功能($0)
	GlobalBitVarReadOnly_Hide_LuckyDraw = 1673607,
	// (@)充值按鈕($0)
	GlobalBitVarReadOnly_Hide_ChargeButton = 1673608,
	// (@)每日累充奖励开关($0)
	GlobalBitVarReadOnly_Hide_Daily_AccCharge = 1673609,
	// (@)更新和更新提示($0)
	GlobalBitVarReadOnly_Hide_GameResourceUpdate = 1673610,
	// (@)传送按钮($0)
	GlobalBitVarReadOnly_Hide_TransButton = 1673611,
	// (@)月卡福利($0)
	GlobalBitVarReadOnly_Hide_MonWelfare = 1673612,
	// (@)打开占卜抽奖
	GlobalBitVarReadOnly_Lottery = 1673613,
	// (@)打开充值活动
	GlobalBitVarReadOnly_RechargeActivity = 1673614,
	// (@)黑暗之地
	GlobalBitVarReadOnly_Darkness = 1673615,
	// (@)骑宠领地
	GlobalBitVarReadOnly_PetBattle = 1673616,
	// (@)福利按钮
	GlobalBitVarReadOnly_WelfareBtn = 1673617,
	// (@)商城按钮
	GlobalBitVarReadOnly_ShopBtn = 1673618,
	// (@)神秘商店按钮
	GlobalBitVarReadOnly_SecretShopBtn = 1673619,
	// (@)时空裂痕按钮
	GlobalBitVarReadOnly_RiftBtn = 1673620,
	// (@)盗宝贼踪迹按钮
	GlobalBitVarReadOnly_StealBtn = 1673621,
	// (@)铸币熔炉按钮
	GlobalBitVarReadOnly_CoinBtn = 1673622,
	// (@)藏宝海湾按钮
	GlobalBitVarReadOnly_BuriedBtn = 1673623,
	// (@)首领入侵按钮
	GlobalBitVarReadOnly_LeaderBtn = 1673624,
	// (@)幸运选择题按钮
	GlobalBitVarReadOnly_LuckAnswerBtn = 1673625,
	// (@)守护碧空城按钮
	GlobalBitVarReadOnly_GuardCityBtn = 1673626,
	// (@)客户端更新后是否自动关闭客户端
	GlobalBitVarReadOnly_CloseAfterUpdate = 1673627,
	// (@)混沌战场按钮
	GlobalBitVarReadOnly_HDBattle = 1673628,
	// (@)春节活动开关($0)
	GlobalBitVarReadOnly_NewYearAct = 1673629,
	// (@)成长礼包按钮
	GlobalBitVarReadOnly_GrowUp = 1673630,
	// (@)优惠推送按钮
	GlobalBitVarReadOnly_RebatePush = 1673631,
	// (@)跨服战场
	GlobalBitVarReadOnly_CrossServerBattle = 1673632,
	// (@)跨服竞技场
	GlobalBitVarReadOnly_CrossServerArena = 1673633,
	// (@)facebook
	GlobalBitVarReadOnly_FaceBook = 1673634,
	// (@)五星好评
	GlobalBitVarReadOnly_FiveStar = 1673635,
	// (@)沙盘PVP
	GlobalBitVarReadOnly_GuildExpedition = 1673636,
	// (@)玩家个性展示
	GlobalBitVarReadOnly_PersonalityInfo = 1673637,
	// (@)王者雕像
	GlobalBitVarReadOnly_KingBattleAll = 1673638,
	// (@)马车劫掠
	GlobalBitVarReadOnly_EscortGoods = 1673639,
	// (@)装备冲星
	GlobalBitVarReadOnly_equipStar = 1673640,
	// (@)翅膀
	GlobalBitVarReadOnly_playerWing = 1673641,
	// (@)符文
	GlobalBitVarReadOnly_PlayerRune = 1673642,
	// (@)婚姻
	GlobalBitVarReadOnly_WeddingSite = 1673643,
	// (@)交易行是否扣税
	GlobalBitVarReadOnly_PlayerTradeTax = 1673644,
	// (@)宝藏系统开关
	GGlobalBitVarReadOnly_Hide_LOTTERY_SYS=1673645,
	// (@)打开充值more按钮
	GGlobalBitVarReadOnly_RechargeMore=1673646,
	// (@)打开第三方充值页签按钮 2016.7.7
	GGlobalBitVarReadOnly_RechargeThirdPartyTab=1673647,
	// (@)家族堆雪人活动
	GlobalBitVarReadOnly_Snowman=1673648,
	// (@)交易行
	GlobalBitVarReadOnly_Trade=1673649,
	// (@)查看远程玩家
	GlobalBitVarReadOnly_RPView=1673650,
	
	// (@)客户端只读全局开关类变量结束
	GlobalBitVarReadOnly_EndBit = 1705600,

	//客户端只读世界开关类变量,占1000个32位整数,范围(53500 ~ 54500),53500*32=1712000,54500*32=1744000
	// (@)客户端只读世界开关类变量开始
	WorldBitVarReadOnly_StartBit = 1712000,
	// (@)客户端只读世界开关类变量结束
	WorldBitVarReadOnly_EndBit = 1744000,

	//玩家开关类变量,占5000个32位整数,范围(55300 ~ 60300),55300*32=1769600,60300*32=1929600
	// (@)玩家开关类变量开始
	PlayerBitVar_StartBit = 1769600,
	// (@)玩家是否只接收好友的邮件($0)
	PlayerBitVar_OnlyReceiveFriendMail = 1769601,
	// (@)拒绝所有队伍邀请($0)
	PlayerBitVar_RejectTeamRequest = 1769602,
	// (@)接收世界消息($1)
	PlayerBitVar_WorldChatMsg = 1769603,
	// (@)接收私聊消息($1)
	PlayerBitVar_PrivateChatMsg = 1769604,
	// (@)接收队伍消息($1)
	PlayerBitVar_TeamChatMsg = 1769605,
	// (@)接收公会消息($1)
	PlayerBitVar_GuildChatMsg = 1769606,
	// (@)接收系统消息($1)
	PlayerBitVar_SystemMsg = 1769607,
	// (@)接受喇叭消息($1)
	PlayerBitVar_Horn = 1769608,
	// (@)机器人自动答题($1)
	PlayerBitVar_RobitAnswer = 1769609,
	// (@)玩家开关类变量结束
	PlayerBitVar_EndBit = 1929600,

	//玩家只读开关类变量,占5000个32位整数,范围(60500 ~ 65500),60500*32=1936000,60300*32=2096000
	// (@)玩家只读开关类变量开始，索引60500
	PlayerBitVarReadOnly_StartBit = 1936000,
	// (@)玩家进游戏第一次签到奖励，索引60500 ($0)
	PlayerBitVarReadOnly_SignPrize1 = 1936001,
	// (@)玩家进游戏第二次签到奖励，索引60500 ($0)
	PlayerBitVarReadOnly_SignPrize2 = 1936002,
	// (@)玩家进游戏第三次签到奖励，索引60500 ($0)
	PlayerBitVarReadOnly_SignPrize3 = 1936003,
	// (@)玩家进游戏第四次签到奖励，索引60500 ($0)
	PlayerBitVarReadOnly_SignPrize4 = 1936004,
	// (@)玩家进游戏第五次签到奖励，索引60500 ($0)
	PlayerBitVarReadOnly_SignPrize5 = 1936005,
	// (@)玩家进游戏第六次签到奖励，索引60500 ($0)
	PlayerBitVarReadOnly_SignPrize6 = 1936006,
	// (@)玩家进游戏第七次签到奖励，索引60500 ($0)
	PlayerBitVarReadOnly_SignPrize7 = 1936007,
	// (@)玩家绑定手机号后给的奖励，索引60500 ($0)
    PlayerBitVarReadOnly_BindPhonePrize = 1936008,

	// (@)玩家领取爵位（VIP）奖励，预留32*4 = 128个爵位等级，目前只使用到16个，索引60503 ($0)
	PlayerBitVarReadOnly_GetVipRewardByLV1 = 1936096,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV2 = 1936097,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV3 = 1936098,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV4 = 1936099,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV5 = 1936100,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV6 = 1936101,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV7 = 1936102,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV8 = 1936103,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV9 = 1936104,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV10 = 1936105,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV11 = 1936106,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV12 = 1936107,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV13 = 1936108,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV14 = 1936109,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV15 = 1936110,
	// (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
	PlayerBitVarReadOnly_GetVipRewardByLV16 = 1936111,

	// (@)玩家只读开关类变量结束
	PlayerBitVarReadOnly_EndBit = 2096000,
	//
	// 变量最大索引值
	VarMaxIndex = 65535,
};