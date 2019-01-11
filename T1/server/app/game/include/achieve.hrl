%%成就系统
%% 20170620最后整理
%% 详见http://192.168.2.32:8080/browse/LUNA-2702
-author(luowei).

-ifndef(Achieve_hrl).
-define(Achieve_hrl,1).

%% 飘浮之石成就类型
-define(AchieveType_FloatIng, 999).


-define(AcTaskID, 		40005).		%%七夕节任务===============[该任务ID无效]=============
-define(AcUseItemID,	776).		%%道具ID===============[该道具ID无效]=============
-define(AcUseItemID1,	2831).		%%中秋道具===============[该道具ID无效]=============
-define(AcUseItemID2,	783).		%%许愿道具===============[该道具ID无效]=============
-define(AcUseItemID4,	790).		%%爱吃冰皮月饼道具===============[该道具ID无效]=============
-define(AcUseItemID5,	791).		%%爱吃五仁月饼道具===============[该道具ID无效]=============
-define(AcUseItemID6,	792).		%%爱吃鲜花月饼道具===============[该道具ID无效]=============
-define(AcUseItemID7,	793).		%%爱吃肉松月饼道具===============[该道具ID无效]=============
-define(AcUseItemID8,	794).		%%爱吃豆沙月饼道具===============[该道具ID无效]=============
-define(AcUseItemID9,	815).		%%国庆捡宝箱===============[该采集物ID无效]=============
-define(AcUseItemID10,	32181).		%%国庆橙戒===============[该道具ID无效]=============
-define(AcUseItemID11,	[32182,34000,34001,34002,34003]).		%%国庆红戒===============[这些道具ID都无效]=============
-define(AcUseItemID12,	2832).		%%国庆大礼包===============[该道具ID无效]=============


%%成就系统时间

%%勇者之路
-define(Achieve_Level,			101).%%等级达人		====等级达到10/20/30/40/50级====初始化为1，角色升级时刷新成就进度====可用
-define(Achieve_Equip,			102).%%装备达人		====N/A====N/A====不可用
-define(Achieve_Mainline,		103).%%主线达人		====N/A====N/A====不可用
-define(Achieve_Task,			104).%%任务达人		====完成任务总数量50/100/200/300/400====提交任务时（包括环任务一次提交多个任务时）刷新成就进度====可用
-define(Achieve_Bag,			105).%%背包达人		====累计开背包格5/10/20/30/40/50/60个====开启背包格时刷新成就进度====可用
-define(Achieve_Store,			106).%%仓库达人		====累计开仓库格5/10/20/30/40/50/60个====开启仓库格时刷新成就进度====可用
-define(Achieve_Update,			107).%%初次更新		====首次更新游戏资源（配置已关闭）====N/A====不可用
-define(Achieve_SignIn,			108).%%每次签到		====累积签到1/5/10/15/20/30次数====每日签到模块免费或钻石签到时刷新成就进度，注意不是七日签到模块（固定1）====可用
-define(Achieve_DevilHell,		109).%%初探魔神地狱	====参加守护女神====进入守护女神对应地图时刷新成就进度（mapsetting:type=1,subtype=1）（固定1）====可用
-define(Achieve_LeaderInvasion,	110).%%初探首领入侵	====初探首领入侵====N/A====不可用
-define(Achieve_Rift,			111).%%初探时空裂痕	====N/A====进入时空裂痕对应地图时刷新成就进度（mapsetting:type=2,subtype=2）（固定1）====不可用
-define(Achieve_MintFurnace,	112).%%初探铸币熔炉	====N/A====N/A====不可用
-define(Achieve_BootCamp,		113).%%初探新兵营地	====N/A====N/A====不可用
-define(Achieve_StarTreasureHouse,114).%%初探星空宝库	====N/A====N/A====不可用
-define(Achieve_BootyBay,		115).%%初探藏宝海湾	====N/A====N/A====不可用
-define(Achieve_SoulPartner,	116).%%初探灵魂伙伴	====N/A====N/A====不可用
-define(Achieve_ChaosBattlefield,117).%%初探混沌战场	====N/A====N/A====不可用
-define(Achieve_BlueSkyCity,	118).%%初探守卫碧空城	====N/A====在碧空城完成一次采集时刷新成就进度（固定1）====不可用
-define(Achieve_Daobao,			119).%%初探盗宝贼踪迹	====N/A====使用藏宝图挖宝成功时刷新成就进度（固定1）====不可用
-define(Achieve_DarkPlace1,		120).%%初探黑暗之地一	====初探深红熔渊一层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用
-define(Achieve_DarkPlace2,		121).%%初探黑暗之地二	====初探深红熔渊二层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用
-define(Achieve_DarkPlace3,		122).%%初探黑暗之地三	====初探深红熔渊三层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用
-define(Achieve_DarkPlace4,		123).%%初探黑暗之地四	====初探深红熔渊四层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用
-define(Achieve_DarkPlace5,		124).%%初探黑暗之地五	====初探深红熔渊五层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用


%%无尽财富
-define(Achieve_GoldTrade,		201).%%金币交易		====N/A====在交易行使用金币购买物品时刷新成就进度（固定1）====不可用
-define(Achieve_DiamondTrade,	202).%%钻石交易		====N/A====在交易行使用钻石购买物品时刷新成就进度（固定1）====不可用
-define(Achieve_MoneyWayward1,	203).%%有钱任性一		====金币累积100W/500W/5000W/10000W====获得金币时刷新成就进度（新增货币数目）====可用
-define(Achieve_MoneyWayward2,	204).%%有钱任性二		====绑定金币累积100W/500W/5000W/10000W（配置已关闭）====N/A====不可用
-define(Achieve_Integral,		205).%%积分达人		====N/A====获得积分时刷新成就进度（新增货币数目）====不可用
-define(Achieve_CollecteMounts,	206).%%坐骑收集		====收集骑宠1/5/10/15/20只====获得骑宠时刷新成就进度（由于骑宠是一个个创建的，所以这里是固定1而不是新增骑宠数目）====可用
-define(Achieve_Exchange,		207).%%兑换达人		====累积资源兑换5/100/200/500/1K件====进行资源兑换时刷新成就进度（兑换的资源数目，参考cfg_sourceshop）====可用
-define(Achieve_BreakDown,		208).%%分解达人		====分解装备20/200/500/1K/2K件====分解装备时刷新成就进度（分解的装备数目）====可用
-define(Achieve_Fashion,		209).%%时装达人		====收集时装3/6/9个====激活或过期后重新激活时装时刷新成就进度（固定1）====可用
-define(Achieve_PetUpstar,		210).%%宠物升星		====骑宠升级为2/3/4/5星====骑宠升星时刷新成就进度（固定1）====可用



%%登峰造极
-define(Achieve_StrongestKing,	301).%%最强王者		====全身装备整体精练2/4/6/8/10====精炼刷新套装效果时刷新成就进度（固定1）====可用
-define(Achieve_StrMan,			302).%%强化狂人		====精练装备30/40/50/60/70/80次====精炼时刷新成就进度（精炼部位数量）====可用
-define(Achieve_GemEmbed,		303).%%宝石镶嵌		====镶嵌纹章2/3/4/5/6/7/8/9/10级====镶嵌纹章时刷新对应级别纹章的成就进度（固定1）====可用
-define(Achieve_WarriorAwaken,	304).%%勇士觉醒		====N/A====N/A====不可用
-define(Achieve_ConciseMaster,	305).%%凝练大师		====装备重铸10/50/80/100次（配置已关闭）====重铸装备时刷新成就进度（固定1）====不可用
-define(Achieve_AttachedSpec,	306).%%宝石合成		====纹章合成1/10/50/100次====合成纹章时刷新成就进度（固定1）====可用
-define(Achieve_AnnihilatorLeader,307).%%首领歼灭者	====累积消灭世界首领1/10/20/30/50/100只====消灭配置指定怪物时刷新成就进度（固定1）====可用
-define(Achieve_TestKillMonster,308).%%测试杀怪		====N/A====消灭配置指定怪物时刷新成就进度（固定1）====不可用
-define(Achieve_MonsterSlayer,	309).%%怪物屠戮者		====累积消灭怪1K/1W/10W/30W/50W/100W/500W只====消灭怪物时刷新成就进度（任务归属导致的杀怪可能有多人同时消灭1只怪）（固定1）====可用
-define(Achieve_CopyLiquidator,	310).%%副本清理者		====副本通关3/50/100/300/500/1K/2K次====副本通关时刷新成就进度（包括走副本流程的活动，材料副本、金币副本、原初灵界）（固定1）====可用
-define(Achieve_Achieve1,		311).%%成就达人1		====累积获得总成就点100/200/300====添加成就点（往往是完成成就时）刷新成就进度（配置奖励的成就点）====可用
-define(Achieve_Achieve2,		312).%%成就达人2		====N/A====N/A====不可用
-define(Achieve_RiftRestorers,	313).%%裂痕修复者		====N/A====完成时空裂痕时刷新成就进度（固定1）====不可用
-define(Achieve_HonorEquipment,	314).%%海神之枪		====N/A====N/A====不可用
-define(Achieve_StrongestKing1,	315).%%最强王者		====N/A====N/A====不可用
-define(Achieve_StrMan1,		316).%%精炼装备		====N/A====N/A====不可用
-define(Achieve_DarkPrime,		317).%%黑暗至尊		====累积消灭深红熔渊boss1/5/10/20/30/50/100次====消灭配置指定怪物时刷新成就进度（固定1）====可用


%%徽章
-define(Achieve_Badge1,			401).%%街道徽章		====废弃
-define(Achieve_Badge2,			402).%%雷神徽章		====废弃
-define(Achieve_Badge3,			403).%%霜峰岭徽章		====废弃
-define(Achieve_Badge4,			404).%%护序者徽章		====废弃
-define(Achieve_Badge5,			405).%%碧空城徽章		====废弃
-define(Achieve_Badge6,			406).%%永生徽章		====废弃
-define(Achieve_Badge7,			407).%%亚厦徽章		====废弃
-define(Achieve_Badge8,			408).%%世界徽章		====废弃
-define(Achieve_Badge9,			409).%%城堡徽章		====废弃
-define(Achieve_Badge10,		410).%%梅尔徽章		====废弃
-define(Achieve_Badge11,		411).%%暖风徽章		====废弃
-define(Achieve_Badge12,		412).%%上古徽章		====废弃
-define(Achieve_Badge13,		413).%%草原徽章		====废弃
-define(Achieve_Badge14,		414).%%可汗徽章		====废弃
-define(Achieve_Badge15,		415).%%雄狮徽章		====废弃
-define(Achieve_Badge16,		416).%%走私者徽章		====废弃
-define(Achieve_Badge17,		417).%%广场区徽章		====废弃
-define(Achieve_Badge18,		418).%%废城区徽章		====废弃
-define(Achieve_Badge19,		419).%%平原徽章		====废弃
-define(Achieve_Badge20,		420).%%预留徽章		====废弃
-define(Achieve_Badge21,		421).%%预留徽章		====废弃
-define(Achieve_Badge22,		422).%%预留徽章		====废弃
-define(Achieve_Badge23,		423).%%预留徽章		====废弃
-define(Achieve_Badge24,		424).%%预留徽章		====废弃
-define(Achieve_Badge25,		425).%%预留徽章		====废弃
-define(Achieve_Badge26,		426).%%预留徽章		====废弃
-define(Achieve_Badge27,		427).%%预留徽章		====废弃
-define(Achieve_Badge28,		428).%%预留徽章		====废弃
-define(Achieve_Badge29,		429).%%预留徽章		====废弃
-define(Achieve_Badge30,		430).%%近卫徽章		====废弃
-define(Achieve_Badge31,		431).%%寒冬徽章		====废弃
-define(Achieve_Badge32,		432).%%罗兰德徽章		====废弃
-define(Achieve_Badge33,		433).%%花园徽章		====废弃
-define(Achieve_Badge34,		434).%%黑暗徽章		====废弃

-define(Achieve_Badge35,		435).%%诸神徽章		====废弃
-define(Achieve_Badge36,		436).%%灰影徽章		====废弃
-define(Achieve_Badge37,		437).%%暖风徽章		====废弃
-define(Achieve_Badge38,		438).%%剑风徽章		====废弃
-define(Achieve_Badge39,		439).%%古代徽章		====废弃

-define(Achieve_Badge40,		440).%%黑塔徽章		====废弃
-define(Achieve_Badge41,		441).%%死寂徽章		====废弃
-define(Achieve_Badge42,		442).%%神殿徽章		====废弃
-define(Achieve_Badge43,		443).%%圣堂徽章		====废弃
-define(Achieve_Badge44,		444).%%议会庭徽章		====废弃

-define(Achieve_Badge45,		445).%%王冠徽章		====废弃
-define(Achieve_Badge46,		446).%%教堂徽章		====废弃
-define(Achieve_Badge47,		447).%%毁灭徽章		====废弃
-define(Achieve_Badge48,		448).%%上古徽章		====废弃
-define(Achieve_Badge49,		449).%%时间徽章		====废弃

-define(Achieve_Badge50,		450).%%深渊徽章		====废弃
-define(Achieve_Badge51,		451).%%初探徽章		====废弃
-define(Achieve_Badge52,		452).%%封印徽章		====废弃
-define(Achieve_Badge53,		453).%%遗忘徽章		====废弃
-define(Achieve_Badge54,		454).%%曙光徽章		====废弃
-define(Achieve_Badge55,		455).%%光明徽章		====废弃
-define(Achieve_Badge56,		456).%%永夜徽章		====废弃
-define(Achieve_Badge57,		457).%%幽暗徽章		====废弃


-define(Achieve_Social_Event1,	501).%%我行我秀		====上传一张照片====上传照片成功时刷新成就进度（固定1）====可用
-define(Achieve_Social_Event2,	502).%%聊天很生动		====使用一次聊天气泡或动作====使用聊天气泡或动作时刷新成就进度（固定1）====可用
-define(Achieve_Social_Event3,	503).%%我是复制党		====N/A====使用赋值世界消息功能时刷新成就进度（固定1）====不可用
-define(Achieve_Social_Event4,	504).%%喇叭喊话		====使用一次喇叭频道（已关闭）====使用道具小喇叭时刷新成就进度（固定1）====不可用
%%-define(Achieve_Social_Event5,	505).%%拥有军团		====加入任何军团====创建、加入家族时刷新成就进度（固定1）====可用
-define(Achieve_Social_Event6,	506).%%拥有灵魂伙伴	====N/A====N/A====不可用
-define(Achieve_Social_Event7,	507).%%好友印象		====N/A====N/A====不可用
-define(Achieve_Social_Event8,	508).%%好友成群		====拥有5/10/20位好友====添加好友时刷新成就进度（现有好友与原有好友的有效差值）====可用
-define(Achieve_Social_Event9,	509).%%送人玫瑰		====N/A====N/A====不可用
-define(Achieve_Social_Event10,	510).%%点个赞			====N/A====N/A====不可用
-define(Achieve_Social_Event11,	511).%%求个赞			====N/A====N/A====不可用

%%节日活动
-define(Achieve_Act_Event1,		601).%%七夕节日任务	====N/A====N/A====不可用
-define(Achieve_Act_Event2,		602).%%倾城之恋		====N/A====使用道具776时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event3,		603).%%有人爱我		====N/A====被使用道具776时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event4,		604).%%击败魔物		====N/A====消灭配置指定怪物时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event5,		605).%%击败魔王		====N/A====消灭配置指定怪物时刷新成就进度（固定1）====不可用

-define(Achieve_Act_Event6,		606).%%中秋节			====N/A====使用道具2831时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event7,		607).%%我要许愿		====N/A====使用道具783时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event8,		608).%%谁为我许愿		====N/A====被使用道具783时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event9,		609).%%爱吃冰皮月饼	====N/A====使用道具790时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event10,	610).%%爱吃五仁月饼	====N/A====使用道具791时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event11,	611).%%爱吃鲜花月饼	====N/A====使用道具792时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event12,	612).%%爱吃肉松月饼	====N/A====使用道具793时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event13,	613).%%爱吃豆沙月饼	====N/A====使用道具794时刷新成就进度（道具数目）====不可用

-define(Achieve_Act_Event14,	614).%%国庆节			====N/A====消灭配置指定怪物时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event15,	615).%%国庆节捡宝箱	====N/A====获得采集物815时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event16,	616).%%国庆橙戒		====N/A====获得道具32181时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event17,	617).%%国庆红戒		====N/A====获得道具32182,34000,34001,34002,34003时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event18,	618).%%国庆大礼包		====N/A====使用道具2832时刷新成就进度（道具数目）====不可用



-define(Achieve_activate_goddess_1,	700).%%激活女神1	====激活第1/2/3/4位女神====激活女神时刷新成就进度（固定1）====可用
-define(Achieve_activate_goddess_2,	701).%%激活女神2	====N/A====N/A====不可用
-define(Achieve_activate_goddess_3,	702).%%激活女神3	====N/A====N/A====不可用
-define(Achieve_activate_goddess_4,	703).%%激活女神4	====N/A====N/A====不可用
-define(Achieve_goddess_level,		704).%%所有女神等级提升到XX	====提升4/20/40/80/100次女神等级====升级女神时刷新成就进度（固定1）====可用

-define(Achieve_activate_Artifact_1,	705).%%激活火器灵	====激活第1位器灵====逻辑错误====不可用
-define(Achieve_activate_Artifact_2,	706).%%激活冰器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_activate_Artifact_3,	707).%%激活雷器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_activate_Artifact_4,	708).%%激活风器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_activate_Artifact_5,	709).%%激活光器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_activate_Artifact_6,	710).%%激活暗器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_Artifact_level,			711).%%所有灵器等级提升到XX	====提升12/30/60/120/240次器灵等级====升级器灵时刷新成就进度（固定1）====可用

-define(Achieve_Wings_up ,				712).%%翅膀升阶XX	====翅膀升到2/3/4/5阶====翅膀升阶时刷新从成就进度（固定1）====可用
-define(Achieve_pet_rebon ,				713).%%骑宠转生	====转生骑宠1/2/4/6/8次====骑宠转生时刷新成就进度（固定1）====可用
-define(Achieve_pet_weapon ,			714).%%骑宠装备	====提升8/20/40/80/120次骑宠装备====强化骑宠装备时刷新成就进度（提升级别）====可用
-define(Achieve_weapon_quality_2 ,		715).%%装备品质2级====装备一件蓝色品质的装备====装备品质2的装备时刷新成就进度（固定1）====可用
-define(Achieve_brave_tried ,			716).%%勇者试炼	====通关女神禁闭室第1/3/5/10/15/20/25/30层====勇者试炼第N层通关时刷新对应成就进度（固定1）====可用
-define(Achieve_Gold_Copy ,				717).%%金币副本	====完成惊天喵盗团1/5/10/20/50/100次====通关金币副本时刷新成就进度（固定1）====可用
-define(Achieve_material_Copy ,			718).%%材料副本	====完成元素保卫战1/5/10/20/50/100次====通关材料副本时刷新成就进度（固定1）====可用
-define(Achieve_First_arena ,			719).%%初入竞技场	====获得一次竞技场胜利====进入竞技场时刷新成就进度（固定1）====可用
-define(Achieve_arena_win ,				720).%%竞技场胜利	====竞技场胜利10/50/100/1000/10000次====竞技场获胜时刷新成就进度（固定1）====可用
%%-define(Achieve_armygroup_build ,		721).%%军团建立	====建立一个军团====创建家族时刷新成就进度（固定1）====可用
-define(Achieve_Sending_redenvelope ,	722).%%发送红包	====发出1/5/10/100/5000个红包====发送红包时刷新成就进度（固定1）====可用
-define(Achieve_First_dead ,			723).%%初次死亡	====死亡1次====死亡时刷新成就进度（固定1）====可用

-define(Achieve_weapon_quality_3,		724).%%装备品质3	====装备一件红色品质的装备====装备品质3的装备时刷新成就进度（固定1）====可用
-define(Achieve_weapon_quality_4 ,		725).%%装备品质4	====装备一件紫色品质的装备====装备品质4的装备时刷新成就进度（固定1）====可用

-define(Achieve_changeCareer_1 ,		1001).%%1阶转职
-define(Achieve_changeCareer_2 ,		1002).%%2阶转职
-define(Achieve_changeCareer_3 ,		1003).%%2阶转职
-define(Achieve_AllUpStar,	            1004).      %%全身升星N级
-define(Achieve_normalenchant,		    1005).%%属性附魔n次
-define(Achieve_specialization_enchant,	1006).%%专精附魔N次
-define(Achieve_EquipOn_red,		    1007).%%装备红色装备N个
-define(Achieve_EquipOn_Purple,		    1008).%%紫色红色装备N个
-define(Achieve_Washspractice,	        1009).      %%洗练装备N次
-define(Achieve_ascension,		        1010).%%骑宠提升到n次
-define(Achieve_petLlUp,		        1011).%%将一只骑宠培养到N级
-define(Achieve_petTrunUp,		        1012).%%将一只骑宠转生到N级


-define(Achieve_roomLevelChange ,		2001).%%衣帽间等级达到2/3/4/5/6/7/8/9/10级
-define(Achieve_UnlockMap_1 ,		    2002).%%解锁东城郊全部的怪物图鉴
-define(Achieve_UnlockMap_2 ,		    2003).%%解锁阿克勒平原全部的怪物图鉴
-define(Achieve_UnlockMap_3 ,		    2004).%%解锁苍空雪域全部的怪物图鉴
-define(Achieve_UnlockMap_4 ,		    2005).%%解锁苍空之塔全部的怪物图鉴
-define(Achieve_UnlockMap_5 ,		    2006).%%解锁精灵故土全部的怪物图鉴
-define(Achieve_UnlockMap_6 ,		    2007).%%解锁遗迹谷地全部的怪物图鉴
-define(Achieve_UnlockMap_7 ,		    2008).%%解锁精灵避难所全部的怪物图鉴
-define(Achieve_UnlockMap_8 ,		    2009).%%解锁首领禁地全部的怪物图鉴
-define(Achieve_UnlockMap_9 ,		    2010).%%解锁黑暗丛林全部的怪物图鉴
-define(Achieve_UnlockMap_10 ,		    2011).%%解锁幽灵树丛全部的怪物图鉴
-define(Achieve_UnlockMap_11 ,		    2012).%%解锁红魔鬼基地全部的怪物图鉴

-define(Achieve_BecomeGuardian ,		    3001).%%成为1次世界守护者

-define(Achieve_DateLink_1 ,		    3005).    %%在约会地下城-梦幻消除中消除1分水晶20/50/100/150/200/300次
-define(Achieve_DateLink_3 ,		    3006).    %%在约会地下城-梦幻消除中消除3分水晶20/50/100/150/200/300次
-define(Achieve_DateLink_5 ,		    3007).    %%在约会地下城-梦幻消除中消除5分水晶20/50/100/150/200/300次
-define(Achieve_DatePush ,		    3008).        %%在约会地下城-游园惊梦中将5/15/30/60/100/200/500个箱子推到终点
-define(Achieve_DatePollParty ,		    3009).    %%在约会地下城-泳池派对中被水流盆中5/20/50/200/1000次
-define(Achieve_DateFindTreasure ,		    3010).%%在约会地下城-躲喵喵中击败5/15/30/60/100/200/500只喵
-define(Achieve_TerritoryExploit ,		    3011).%%成功开采1/5/20/40/80/150/250/400次骑宠领地
-define(Achieve_TerritoryPlunder ,		    3012).%%成功掠夺1/5/20/40/80/150/250/400次骑宠领地
-define(Achieve_AnswerQuistion ,		    3013).%%在全民答题活动中累计答对1/20/40/80/160/200/400/600/800道题目

-define(Achieve_Racing,		    3014).            %%在骑宠竞速活动中获得1/3/6/10/20/40次第一名
-define(Achieve_GuildBttleWin ,		    3015).    %%获得1/5/10/20/40/60/100次家族战的胜利
-define(Achieve_Snowman_0 ,		    3016).        %%在家族雪人活动中获得20/50/100/200/500/1000/2000个雪块儿
-define(Achieve_Snowman_1 ,		    3017).        %%在家族雪人活动中获得20/50/100/200/500/1000/2000个煤球儿
-define(Achieve_Snowman_2 ,		    3018).        %%在家族雪人活动中获得20/50/100/200/500/1000/2000个胡萝卜
-define(Achieve_Snowman_3 ,		    3019).        %%在家族雪人活动中获得20/50/100/200/500/1000/2000个圣诞帽
-define(Achieve_Snowman_4 ,		    3020).        %%在家族雪人活动中获得20/50/100/200/500/1000/2000个树枝
-define(Achieve_KillGuildBoss_1 ,		    3021).%%击败第1阶家族boss
-define(Achieve_KillGuildBoss_2 ,		    3022).%%击败第2阶家族boss
-define(Achieve_KillGuildBoss_3 ,		    3023).%%击败第3阶家族boss
-define(Achieve_KillGuildBoss_4 ,		    3024).%%击败第4阶家族boss
-define(Achieve_KillGuildBoss_5 ,		    3025).%%击败第5阶家族boss
-define(Achieve_KillGuildBoss_6 ,		    3026).%%击败第6阶家族boss
-define(Achieve_KillGuildBoss_7 ,		    3027).%%击败第7阶家族boss
-define(Achieve_KillGuildBoss_8 ,		    3028).%%击败第8阶家族boss
-define(Achieve_KillGuildBoss_9 ,		    3029).%%击败第9阶家族boss
-define(Achieve_KillGuildBoss_10 ,		    3030).%%击败第10阶家族boss
-define(Achieve_GodBless ,		            3031).%%进行1/5/15/30/60/100/200/500次女神祈福

-define(Achieve_JoinGuild ,		            3032).	%%加入或创建家族

-define(Achieve_RideUp_1 ,		            3033).	%%在家族驻地中乘坐一次旋转木马n
-define(Achieve_RideUp_2 ,		            3034).	%%在家族驻地中乘坐一次摩天轮
-define(Achieve_RideUp_3 ,		            3035).	%%在家族驻地中乘坐一次海盗船
-define(Achieve_RideUp_4 ,		            3036).	%%在家族驻地中乘坐一次旋转飞椅
-define(Achieve_RideUp_5 ,		            3037).	%%在家族驻地中乘坐一次青龙列车
-define(Achieve_RideUp_6 ,		            3038).	%%在家族驻地中乘坐一次冰淇淋车

-define(Achieve_GuildDonation ,		        3039).	%%向家族成员捐献1/5/15/30/50/100/200/500/1000次宠物碎片
-define(Achieve_CreateHome ,		        3040).	%%创建一个家园
-define(Achieve_UpdateHome ,		        3041).	%%家园升到2/3/4/5级
-define(Achieve_GetPlant ,		            3042).	%%收获种植物1/20/50/100/200/500/800/1200次
-define(Achieve_HelpFriendGetPlant ,		3043).	%%帮助好友的家园收获种植物1/10/30/60/120/200/400/600/800次


-define(Achieve_Lifeskill_1 ,		        3044).	%%将生活技能-钓鱼提升至2/3/4/5/级
-define(Achieve_Lifeskill_2 ,		        3045).	%%将生活技能-狩猎提升至2/3/4/5/级
-define(Achieve_Lifeskill_3 ,		        3046).	%%将生活技能-采矿提升至2/3/4/5/级
-define(Achieve_Lifeskill_4 ,		        3047).	%%将生活技能-烹饪提升至2/3/4/5/级
-define(Achieve_Lifeskill_5 ,		        3048).	%%将生活技能-制作提升至2/3/4/5/级


-define(Achieve_perfectComPleteCopy_1 ,	    3049).      %%普通副本-蘑菇庄园	以完美评价通关普通副本-蘑菇庄园
-define(Achieve_perfectComPleteCopy_2 ,	    3050).      %%普通副本-破碎宫殿	以完美评价通关普通副本-破碎宫殿
-define(Achieve_perfectComPleteCopy_3 ,	    3051).        %%普通副本-遗失幽域	以完美评价通关普通副本-遗失幽域
-define(Achieve_perfectComPleteCopy_4 ,	    3052).        %%普通副本-神秘海盗团	以完美评价通关普通副本-神秘海盗团
-define(Achieve_perfectComPleteCopy_5 ,	    3053).        %%普通副本-海洋之心	以完美评价通关普通副本-海洋之心
-define(Achieve_perfectComPleteCopy_6 ,	    3054).       %%普通副本-遇难船	以完美评价通关普通副本-遇难船
-define(Achieve_perfectComPleteCopy_7 ,	    3055).        %%英雄副本-蘑菇庄园	以完美评价通关英雄副本-蘑菇庄园
-define(Achieve_perfectComPleteCopy_8 ,	    3056).        %%英雄副本-破碎宫殿	以完美评价通关英雄副本-破碎宫殿
-define(Achieve_perfectComPleteCopy_9 ,	    3057).         %%英雄副本-遗失雪域	以完美评价通关英雄副本-遗失幽域
-define(Achieve_perfectComPleteCopy_10 ,	3058).         %%英雄副本-神秘海盗团	以完美评价通关英雄副本-神秘海盗团
-define(Achieve_perfectComPleteCopy_11 ,	3059).         %%英雄副本-海洋之心	以完美评价通关英雄副本-海洋之心
-define(Achieve_perfectComPleteCopy_12 ,	3060).        %%挑战副本-遇难船	以完美评价通关挑战副本-遇难船

-define(Achieve_crossAlive_kill,	3061).        %% 跨服活动-大逃杀 在一场比赛中击杀数达到globalsetup.alive_achieve


-define(Achieve_marriage ,	    4001).		%%和你的爱人结婚
%%-define(Achieve_perfectComPleteCopy_2 ,	    4002).		%%使用所有的表情和动作
-define(Achieve_Use_RandTitle ,	    4003).		%%使用5/20/40/80/100/120/150个称号词组
-define(Achieve_formalOP ,	    4004).		%%赠送给好友1/20/50/100/200/400/600/800次体力
-define(Achieve_giveGift_1 ,	    4005).		%%赠送给好友1次礼物
-define(Achieve_giveGift_2 ,	    4006).		%%赠送给他人1/100/300/500/800/1500/3000多红玫瑰
-define(Achieve_giveGift_3 ,	    4007).		%%赠送给他人1/100/300/500/800/1500/3000多蓝玫瑰
-define(Achieve_giveGift_4 ,	    4008).		%%赠送给他人1/100/300/500/800/1500/3000多紫玫瑰
-define(Achieve_Usepotion ,	    4009).		%%使用1/10/20/50/100/200/300/400/500次变大药水或变小药水
-define(Achieve_PutTrade ,	4010).		%%在交易行中上架1次物品
-define(Achieve_buyTrade ,	4011).		%%在交易行中购买1次物品
-define(Achieve_inviteDoubleMount ,	4012).		%%向他人发起同乘邀请
-define(Achieve_requestBattleLearn ,	4013).		%%向他人发起决斗邀请





%%仅用于漂浮之石的成就。。。。。。。。。。。。。。。

-define(Achieve_Floating_Level ,	    7000).      %%达到105级
-define(Achieve_Floating_PlayerForce_1 ,	    7001).      %%角色战力达到1
-define(Achieve_Floating_PlayerForce_2 ,	    7002).      %%角色战力达到2
-define(Achieve_Floating_PlayerForce_3 ,	    7003).      %%角色战力达到3
-define(Achieve_Floating_PlayerForce_4 ,	    7004).      %%角色战力达到4
-define(Achieve_Floating_PlayerForce_5 ,	    7005).      %%角色战力达到5

-define(Achieve_Floating_PetForce_1 ,	    7006).      %%宠物战力达到1
-define(Achieve_Floating_PetForce_2 ,	    7007).      %%宠物战力达到2
-define(Achieve_Floating_PetForce_3 ,	    7008).      %%宠物战力达到3
-define(Achieve_Floating_PetForce_4 ,	    7009).      %%宠物战力达到4
-define(Achieve_Floating_PetForce_5 ,	    7010).      %%宠物战力达到5

-define(Achieve_Floating_AllUpStar_1 ,	    7011).      %%全身升星1次
-define(Achieve_Floating_AllUpStar_2 ,	    7012).      %%全身升星2次
-define(Achieve_Floating_AllUpStar_3 ,	    7013).      %%全身升星3次
-define(Achieve_Floating_AllUpStar_4 ,	    7014).      %%全身升星4次
-define(Achieve_Floating_AllUpStar_5 ,	    7015).      %%全身升星5次

-define(Achieve_Floating_refining_1 ,	    7016).      %%精炼1次
-define(Achieve_Floating_refining_2 ,	    7017).      %%精炼2次
-define(Achieve_Floating_refining_3 ,	    7018).      %%精炼3次
-define(Achieve_Floating_refining_4 ,	    7019).      %%精炼4次
-define(Achieve_Floating_refining_5 ,	    7020).      %%精炼5次

-define(Achieve_Floating_Washspractice_1 ,	    7021).      %%洗练1次
-define(Achieve_Floating_Washspractice_2 ,	    7022).      %%洗练2次
-define(Achieve_Floating_Washspractice_3 ,	    7023).      %%洗练3次
-define(Achieve_Floating_Washspractice_4 ,	    7024).      %%洗练4次
-define(Achieve_Floating_Washspractice_5 ,	    7025).      %%洗练5次

-define(Achieve_Floating_2level_GemEmbed_1,		7026).%%宝石镶嵌		====镶嵌纹章2级1个
-define(Achieve_Floating_2level_GemEmbed_2,		7027).%%宝石镶嵌		====镶嵌纹章2级2个
-define(Achieve_Floating_2level_GemEmbed_3,		7028).%%宝石镶嵌		====镶嵌纹章2级3个
-define(Achieve_Floating_2level_GemEmbed_4,		7029).%%宝石镶嵌		====镶嵌纹章2级4个
-define(Achieve_Floating_2level_GemEmbed_5,		7030).%%宝石镶嵌		====镶嵌纹章2级5个

-define(Achieve_Floating_3level_GemEmbed_1,		7031).%%宝石镶嵌		====镶嵌纹章3级1个
-define(Achieve_Floating_3level_GemEmbed_2,		7032).%%宝石镶嵌		====镶嵌纹章3级2个
-define(Achieve_Floating_3level_GemEmbed_3,		7033).%%宝石镶嵌		====镶嵌纹章3级3个
-define(Achieve_Floating_3level_GemEmbed_4,		7034).%%宝石镶嵌		====镶嵌纹章3级4个
-define(Achieve_Floating_3level_GemEmbed_5,		7035).%%宝石镶嵌		====镶嵌纹章3级5个

-define(Achieve_Floating_4level_GemEmbed_1,		7036).%%宝石镶嵌		====镶嵌纹章4级1个
-define(Achieve_Floating_4level_GemEmbed_2,		7037).%%宝石镶嵌		====镶嵌纹章4级2个
-define(Achieve_Floating_4level_GemEmbed_3,		7038).%%宝石镶嵌		====镶嵌纹章4级3个
-define(Achieve_Floating_4level_GemEmbed_4,		7039).%%宝石镶嵌		====镶嵌纹章4级4个
-define(Achieve_Floating_4level_GemEmbed_5,		7040).%%宝石镶嵌		====镶嵌纹章4级5个

-define(Achieve_Floating_5level_GemEmbed_1,		7041).%%宝石镶嵌		====镶嵌纹章5级1个
-define(Achieve_Floating_5level_GemEmbed_2,		7042).%%宝石镶嵌		====镶嵌纹章5级2个
-define(Achieve_Floating_5level_GemEmbed_3,		7043).%%宝石镶嵌		====镶嵌纹章5级3个
-define(Achieve_Floating_5level_GemEmbed_4,		7044).%%宝石镶嵌		====镶嵌纹章5级4个
-define(Achieve_Floating_5level_GemEmbed_5,		7045).%%宝石镶嵌		====镶嵌纹章5级5个

-define(Achieve_Floating_6level_GemEmbed_1,		7046).%%宝石镶嵌		====镶嵌纹章6级1个
-define(Achieve_Floating_6level_GemEmbed_2,		7047).%%宝石镶嵌		====镶嵌纹章6级2个
-define(Achieve_Floating_6level_GemEmbed_3,		7048).%%宝石镶嵌		====镶嵌纹章6级3个
-define(Achieve_Floating_6level_GemEmbed_4,		7049).%%宝石镶嵌		====镶嵌纹章6级4个
-define(Achieve_Floating_6level_GemEmbed_5,		7050).%%宝石镶嵌		====镶嵌纹章6级5个

-define(Achieve_Floating_7level_GemEmbed_1,		7051).%%宝石镶嵌		====镶嵌纹章7级1个
-define(Achieve_Floating_7level_GemEmbed_2,		7052).%%宝石镶嵌		====镶嵌纹章7级2个
-define(Achieve_Floating_7level_GemEmbed_3,		7053).%%宝石镶嵌		====镶嵌纹章7级3个
-define(Achieve_Floating_7level_GemEmbed_4,		7054).%%宝石镶嵌		====镶嵌纹章7级4个
-define(Achieve_Floating_7level_GemEmbed_5,		7055).%%宝石镶嵌		====镶嵌纹章7级5个

-define(Achieve_Floating_8level_GemEmbed_1,		7056).%%宝石镶嵌		====镶嵌纹章8级1个
-define(Achieve_Floating_8level_GemEmbed_2,		7057).%%宝石镶嵌		====镶嵌纹章8级2个
-define(Achieve_Floating_8level_GemEmbed_3,		7058).%%宝石镶嵌		====镶嵌纹章8级3个
-define(Achieve_Floating_8level_GemEmbed_4,		7059).%%宝石镶嵌		====镶嵌纹章8级4个
-define(Achieve_Floating_8level_GemEmbed_5,		7060).%%宝石镶嵌		====镶嵌纹章8级5个

-define(Achieve_Floating_9level_GemEmbed_1,		7061).%%宝石镶嵌		====镶嵌纹章9级1个
-define(Achieve_Floating_9level_GemEmbed_2,		7062).%%宝石镶嵌		====镶嵌纹章9级2个
-define(Achieve_Floating_9level_GemEmbed_3,		7063).%%宝石镶嵌		====镶嵌纹章9级3个
-define(Achieve_Floating_9level_GemEmbed_4,		7064).%%宝石镶嵌		====镶嵌纹章9级4个
-define(Achieve_Floating_9level_GemEmbed_5,		7065).%%宝石镶嵌		====镶嵌纹章9级5个

-define(Achieve_Floating_10level_GemEmbed_1,		7066).%%宝石镶嵌		====镶嵌纹章10级1个
-define(Achieve_Floating_10level_GemEmbed_2,		7067).%%宝石镶嵌		====镶嵌纹章10级2个
-define(Achieve_Floating_10level_GemEmbed_3,		7068).%%宝石镶嵌		====镶嵌纹章10级3个
-define(Achieve_Floating_10level_GemEmbed_4,		7069).%%宝石镶嵌		====镶嵌纹章10级4个
-define(Achieve_Floating_10level_GemEmbed_5,		7070).%%宝石镶嵌		====镶嵌纹章10级5个

-define(Achieve_Floating_normalenchant_1,		    7071).%%普通附魔1次
-define(Achieve_Floating_normalenchant_2,		    7072).%%普通附魔2次
-define(Achieve_Floating_normalenchant_3,		    7073).%%普通附魔3次
-define(Achieve_Floating_normalenchant_4,		    7074).%%普通附魔4次
-define(Achieve_Floating_normalenchant_5,		    7075).%%普通附魔5次

-define(Achieve_Floating_specialization_enchant_1,		    7076).%%专精附魔1次
-define(Achieve_Floating_specialization_enchant_2,		    7077).%%专精附魔2次
-define(Achieve_Floating_specialization_enchant_3,		    7078).%%专精附魔3次
-define(Achieve_Floating_specialization_enchant_4,		    7079).%%专精附魔4次
-define(Achieve_Floating_specialization_enchant_5,		    7080).%%专精附魔5次


-define(Achieve_Floating_EquipOn_red_1,		    7081).%%装备红色装备1个
-define(Achieve_Floating_EquipOn_red_2,		    7082).%%装备红色装备2个
-define(Achieve_Floating_EquipOn_red_3,		    7083).%%装备红色装备3个
-define(Achieve_Floating_EquipOn_red_4,		    7084).%%装备红色装备4个
-define(Achieve_Floating_EquipOn_red_5,		    7085).%%装备红色装备5个

-define(Achieve_Floating_EquipOn_Purple_1,		    7086).%%紫色红色装备1个
-define(Achieve_Floating_EquipOn_Purple_2,		    7087).%%紫色红色装备2个
-define(Achieve_Floating_EquipOn_Purple_3,		    7088).%%紫色红色装备3个
-define(Achieve_Floating_EquipOn_Purple_4,		    7089).%%紫色红色装备4个
-define(Achieve_Floating_EquipOn_Purple_5,		    7090).%%紫色红色装备5个


-define(Achieve_Floating_Fashion_Blue_1,		    7091).%%解锁蓝色时装1个
-define(Achieve_Floating_Fashion_Blue_2,		    7092).%%解锁蓝色时装2个
-define(Achieve_Floating_Fashion_Blue_3,		    7093).%%解锁蓝色时装3个
-define(Achieve_Floating_Fashion_Blue_4,		    7094).%%解锁蓝色时装4个
-define(Achieve_Floating_Fashion_Blue_5,		    7095).%%解锁蓝色时装5个

-define(Achieve_Floating_Fashion_red_1,		    7096).%%解锁红色时装1个
-define(Achieve_Floating_Fashion_red_2,		    7097).%%解锁红色时装2个
-define(Achieve_Floating_Fashion_red_3,		    7098).%%解锁红色时装3个
-define(Achieve_Floating_Fashion_red_4,		    7099).%%解锁红色时装4个
-define(Achieve_Floating_Fashion_red_5,		    7100).%%解锁红色时装5个

-define(Achieve_Floating_Fashion_Purple_1,		    7101).%%解锁紫色时装1个
-define(Achieve_Floating_Fashion_Purple_2,		    7102).%%解锁紫色时装2个
-define(Achieve_Floating_Fashion_Purple_3,		    7103).%%解锁紫色时装3个
-define(Achieve_Floating_Fashion_Purple_4,		    7104).%%解锁紫色时装4个
-define(Achieve_Floating_Fashion_Purple_5,		    7105).%%解锁紫色时装5个

-define(Achieve_Floating_Fashion_Orange_1,		    7106).%%解锁橙色时装1个
-define(Achieve_Floating_Fashion_Orange_2,		    7107).%%解锁橙色时装2个
-define(Achieve_Floating_Fashion_Orange_3,		    7108).%%解锁橙色时装3个
-define(Achieve_Floating_Fashion_Orange_4,		    7109).%%解锁橙色时装4个
-define(Achieve_Floating_Fashion_Orange_5,		    7110).%%解锁橙色时装5个

-define(Achieve_Floating_petLlUp_1_1,		    7111).%%将一只骑宠培养到1级
-define(Achieve_Floating_petLlUp_1_2,		    7112).%%将一只骑宠培养到2级
-define(Achieve_Floating_petLlUp_1_3,		    7113).%%将一只骑宠培养到3级
-define(Achieve_Floating_petLlUp_1_4,		    7114).%%将一只骑宠培养到4级
-define(Achieve_Floating_petLlUp_1_5,		    7115).%%将一只骑宠培养到5级

-define(Achieve_Floating_petLlUp_3_1,		    7116).%%将三只骑宠培养到1级
-define(Achieve_Floating_petLlUp_3_2,		    7117).%%将三只骑宠培养到2级
-define(Achieve_Floating_petLlUp_3_3,		    7118).%%将三只骑宠培养到3级
-define(Achieve_Floating_petLlUp_3_4,		    7119).%%将三只骑宠培养到4级
-define(Achieve_Floating_petLlUp_3_5,		    7120).%%将三只骑宠培养到5级

-define(Achieve_Floating_petLlUp_5_1,		    7121).%%将5只骑宠培养到1级
-define(Achieve_Floating_petLlUp_5_2,		    7122).%%将5只骑宠培养到2级
-define(Achieve_Floating_petLlUp_5_3,		    7123).%%将5只骑宠培养到3级
-define(Achieve_Floating_petLlUp_5_4,		    7124).%%将5只骑宠培养到4级
-define(Achieve_Floating_petLlUp_5_5,		    7125).%%将5只骑宠培养到5级

-define(Achieve_Floating_petRedUpStar_1_1,		    7126).%%将1只红色骑宠培养到1星
-define(Achieve_Floating_petRedUpStar_1_2,		    7127).%%将1只红色骑宠培养到2星
-define(Achieve_Floating_petRedUpStar_1_3,		    7128).%%将1只红色骑宠培养到3星
-define(Achieve_Floating_petRedUpStar_1_4,		    7129).%%将1只红色骑宠培养到4星
-define(Achieve_Floating_petRedUpStar_1_5,		    7130).%%将1只红色骑宠培养到5星

-define(Achieve_Floating_petPurpleUpStar_1_1,		    7131).%%将1只紫色骑宠培养到1星
-define(Achieve_Floating_petPurpleUpStar_1_2,		    7132).%%将1只紫色骑宠培养到2星
-define(Achieve_Floating_petPurpleUpStar_1_3,		    7133).%%将1只紫色骑宠培养到3星
-define(Achieve_Floating_petPurpleUpStar_1_4,		    7134).%%将1只紫色骑宠培养到4星
-define(Achieve_Floating_petPurpleUpStar_1_5,		    7135).%%将1只紫色骑宠培养到5星

-define(Achieve_Floating_petUp_1,		    7136).%%骑宠提升到1次
-define(Achieve_Floating_petUp_2,		    7137).%%骑宠提升到2次
-define(Achieve_Floating_petUp_3,		    7138).%%骑宠提升到3次
-define(Achieve_Floating_petUp_4,		    7139).%%骑宠提升到4次
-define(Achieve_Floating_petUp_5,		    7140).%%骑宠提升到5次

-define(Achieve_Floating_AllpetEquipUp_1,		    7141).%%将全部骑宠装备升到1级
-define(Achieve_Floating_AllpetEquipUp_2,		    7142).%%将全部骑宠装备升到2级
-define(Achieve_Floating_AllpetEquipUp_3,		    7143).%%将全部骑宠装备升到3级
-define(Achieve_Floating_AllpetEquipUp_4,		    7144).%%将全部骑宠装备升到4级
-define(Achieve_Floating_AllpetEquipUp_5,		    7145).%%将全部骑宠装备升到5级

-define(Achieve_Floating_petTrunUp_1_1,		    7146).%%将一只骑宠转生到1级
-define(Achieve_Floating_petTrunUp_1_2,		    7147).%%将一只骑宠转生到2级
-define(Achieve_Floating_petTrunUp_1_3,		    7148).%%将一只骑宠转生到3级
-define(Achieve_Floating_petTrunUp_1_4,		    7149).%%将一只骑宠转生到4级
-define(Achieve_Floating_petTrunUp_1_5,		    7150).%%将一只骑宠转生到5级

-define(Achieve_Floating_petTrunUp_3_1,		    7151).%%将三只骑宠转生到1级
-define(Achieve_Floating_petTrunUp_3_2,		    7152).%%将三只骑宠转生到2级
-define(Achieve_Floating_petTrunUp_3_3,		    7153).%%将三只骑宠转生到3级
-define(Achieve_Floating_petTrunUp_3_4,		    7154).%%将三只骑宠转生到4级
-define(Achieve_Floating_petTrunUp_3_5,		    7155).%%将三只骑宠转生到5级

-define(Achieve_Floating_petTrunUp_5_1,		    7156).%%将5只骑宠转生到1级
-define(Achieve_Floating_petTrunUp_5_2,		    7157).%%将5只骑宠转生到2级
-define(Achieve_Floating_petTrunUp_5_3,		    7158).%%将5只骑宠转生到3级
-define(Achieve_Floating_petTrunUp_5_4,		    7159).%%将5只骑宠转生到4级
-define(Achieve_Floating_petTrunUp_5_5,		    7160).%%将5只骑宠转生到5级


%% -----------------------------------------------------

-record(recAchieve,{
	aID = 0, 				%%成就ID
	aScheduleNum = 0,		%%成就进度
	aScheduleLevel = 0,		%%成就进度等级
	aScheduleGetLevel = 0	%%成都进度领取等级
}).

-record(recBadge,{
	mapID = 0,				%%MapID
	isComplete = false,		%%收集物品是否完成
	itemList = []			%%收集物品列表
}).

-endif.
