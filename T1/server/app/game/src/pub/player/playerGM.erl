
%%%
%%%
%%%
%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc GM指令模块
%%%
%%% @end
%%% Created : 08. 五月 2014 20:03
%%%-------------------------------------------------------------------
-module(playerGM).
-author("ZhongYuanWei").

-include("playerPrivate.hrl").
-include("../world/mapPrivate.hrl").
%%-include("../crossActivity/aruna/arunaDefine.hrl").
-include("rob.hrl").
-include("main.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	parseGM/1,
	execGM/1,
	execGM/2,
	execWebGM/4
]).

-export([
	now_microseconds/0,
	crack/0
]).

%% 不需要启动客户端可直接拼装执行的命令
-export([
	startac/1,
	startac2/1,
	queryRPInfo/1
]).

%%一级GM指令，只能是使用查询类的，不会修改服务器内容的GM指令
-define(GMCmdList1,
	[
		{"getbitvariant", fun getbitvariant/1, "getbitvariant VarType BitIndex", "获取变量"},
		{"getvariant", fun getvariant/1, "getvariant VarType Index", "获取变量"},
		{"queryactivity", fun queryactivity/1, "queryactivity ActivityID", "查询活动开关"},
		{"querycoin", fun querycoin/1, "querycoin CoinType", "查金币"},
		{"queryprop", fun queryprop/1, "queryprop PropIndex", "查询玩家身上的属性"},
		{"queryclock", fun queryclock/1, "queryclock Type SubType Value", "开启一个计时"},
		{"queryitem", fun queryitem/1, "queryitem BagType ItemID", "查物品"},
		{"querytrade", fun querytrade/1, "querytrade TradeType ItemType Num", "查询交易行订单"},
		{"querynewesttrade", fun querynewesttrade/1, "querynewesttrade TradeType ItemType Num", "查询最新交易行订单"},
		{"nexttrade", fun nexttrade/1, "nexttrade Page", "查询下一页"},
		{"printtrade", fun printtrade/1, "printtrade StartIndex EndIndex", "打印查询结果"},
		{"printrank", fun printrank/1, "printrank Type", "打印排行榜"},
		{"printranknum", fun printranknum/1, "printranknum Type", "打印排行榜个数"},
		{"queryselftrade", fun queryselftrade/1, "queryselftrade TradeType", "查询自己的订单"},
		{"querymail", fun querymail/1, "querymail MailID", "查询邮件"},
		{"queryallmail", fun queryallmail/1, "queryallmail", "查询所有邮件"},
		{"readmail", fun readmail/1, "readmail MailID", "阅读邮件"},
		{"querytips", fun querytips/1, "querytips ItemUID", "查询道具TIPS，本GM服务器内部使用"},
		{"queryroleid", fun queryroleid/1, "queryroleid PlayerName", "测试玩家关键数据的缓存进程"},
		{"queryrolename", fun queryrolename/1, "queryrolename RoleID", "查询玩家名"},
		{"getallskill", fun getallskill/1, "getallskill", "查看自己所学所有技能ID"},
		{"testuid", fun testuid/1, "testuid Type", "测试指定类型的UID"},
		{"qn", fun qn/1, "qn [Key]", "查询在线人数，也可以查询1玩家，2宠物，3怪物，4召唤怪物，5载体的数量"},
		{"qn2", fun qn2/1, "qn2 [Key]", "查询当前场景的在线人数"},
		{"openkq", fun openkq/1, "openkq name", "打开空气墙"},
		{"closekq", fun closekq/1, "closekq name", "关闭空气墙"},
		{"queryobjs", fun queryobjs/1, "queryobjs GroupID ObjType", "查询指定分组的对象列表"},
		{"queryobj", fun queryobj/1, "queryobj RoleID", "查询指定角色ID的信息"},
		{"query", fun query/1, "query Value", "查询目标的属性值，0查看选中目标的属性，1查看自己的属性"},
		{"querycross", fun querycross/1, "querycross", "查询当前所在跨服信息"},
		{"requesthdbattle", fun requesthdbattle/1, "requesthdbattle", "请求加入混沌战场"},
		{"queryguild1", fun queryguild1/1, "queryguild1", "查询军团列表"},
		{"queryguild2", fun queryguild2/1, "queryguild2", "在服务器以调试信息打印查询军团列表结果"},
		{"queryguild3", fun queryguild3/1, "queryguild3", "查询自己的军团信息"},
		{"mallshow", fun mallshow/1, "mallshow Seed", "商城显示请求"},
		{"sync9", fun sync9/1, "sync9", "重新同步玩家周围的对象"},
		{"ln", fun ln/1, "ln", "获取当前所在地图线信息"},
		{"ll", fun ll/1, "ll MapID", "获取指定地图线路信息"},
		{"hl", fun hl/1, "hl Line", "获取地图线路信息"},
		{"ss_t", fun ss_t/1, "ss_t id", "切换地图线"},
		{"init_var", fun init_var/1, "init_bit_var", "初始化bit var"},
		{"tz", fun tz/1, "tz", "获取时区指令"},
		{"getactionpoint", fun getactionpoint/1, "getactionpoint", "获取体力值"},
		{"deductactionpoint", fun deductactionpoint/1, "deductactionpoint", "消耗体力值"},
		{"addactionpoint", fun addactionpoint/1, "addactionpoint", "增加体力值"},
		{"ar", fun accuReward/1, "accuReward", "领奖"},
		{"resetpb", fun resetpb/1, "resetpb", "重置双人坐骑状态"},
		{"petab", fun petab/1, "petass", "骑宠助战"},
		{"fashionsuit", fun fashionSuit/1, "fashionsuit", "激活时装套装"},
		{"resetskill", fun resetSkill/1, "resetskill", "重置技能"},
		{"lsgo", fun lsgo/1, "lsgo", "使用生活技能"},
		{"lsgw", fun lsgw/1, "lsgw", "给予奖励"},
		{"lsstop", fun lsstop/1, "lsstop", "停止使用生活技能"},
		{"lsget", fun lsget/1, "lsget", "购买次数"},
		{"bss", fun bss/1, "bss", "广播"},
		{"ets", fun ets/1, "mapets", "地图ets"},
		{"cchat", fun cchat/1, "cchat", "跨服聊天"},
		{"redname", fun redname/1, "redname type", "查看目标是否是红名状态 type[0目标 1自己]"},
		{"copyrank", fun copyrank/1, "copyrank", "副本排行榜"}
%% 		{"uplv_guild_tec_skill",				fun uplv_guild_tec_skill/1,					"uplv_guild_tec_skill","升级工会技能" },
%% 		{"use_guild_feast",					fun use_guild_feast/1,						"use_guild_feast","工会宴席" },
%% 		{"drink_guild_wine",				fun drink_guild_wine/1,					"drink_guild_bottle","喝酒" },
%%		{"call_guild_monster",				fun call_guild_monster/1,					"check_bit_var","校验bit var"	}
	]).


%%二级指令，是除了可以获得道具、装备、货币等等游戏资源以外GM指令
-define(GMCmdList2,
	[
		{"startclock", fun startclock/1, "startclock Type OffTime LengthTime", "开启指定类型的玩家计时器"},
		{"delclock", fun delclock/1, "delclock Type", "删除指定类型的玩家计时器"},
		{"splititem", fun splititem/1, "splititem GoodsUID Num", "道具拆分"},
		{"freshrank", fun freshrank/1, "freshrank Type", "freshrank"},
		{"freshrankall", fun freshrankall/1, "freshrankall", "立即刷新所有类型的排行榜"},
		{"sorttrade", fun sorttrade/1, "sorttrade SortIndex PageNum", "整理交易行"},
		{"buytrade", fun buytrade/1, "buytrade TradeType OrderID", "在交易行购买指定订单"},
		{"puttrade", fun puttrade/1, "puttrade TradeType ItemUID ItemID SellNum SellTime Silver Gold DestRoleName OpCode", "交易行上架"},
		{"downtrade", fun downtrade/1, "downtrade TradeType OrderID", "交易行下架"},
		{"refusetrade", fun refusetrade/1, "refusetrade OrderID", "交易行拒绝某订单"},
		{"delobj", fun delobj/1, "delobj Value", "删除指定Code的对象或者当前选中的对象"},
		{"addmonster", fun addmonster/1, "addmonster MonsterID Number", "添加指定数量个指定ID的怪物"},
		{"addmonster2", fun addmonster2/1, "addmonster2 MonsterID Number", "添加指定数量个指定ID的怪物，测试性能"},
		{"addmonster3", fun addmonster3/1, "addmonster3", "一次性把当前的地图的怪物再重新创建一遍"},
		{"addmonster4", fun addmonster4/1, "addmonster4", "创建一个在1号分组中的怪物"},
		{"addcollect", fun addcollect/1, "addcollect CollectID Number", "添加采集物"},
		{"addnpc", fun addnpc/1, "addnpc NpcID", "添加NPC"},
		{"addcarrier", fun addcarrier/1, "addcarrier CarrierID MoveStatus", "添加载体"},
		{"addconvoy", fun addconvoy/1, "addconvoy MonsterID", "添加护送怪物"},
		{"createguild", fun createguild/1, "createguild GuildName Denoter", "创建公会"},
		{"clearguildcd", fun clearguildcd/1, "clearguildcd RoleID", "设置加入军团CD"},
		{"worldboss", fun worldboss/1, "worldboss", "机器人进BOSS战"},
		{"deleteguild", fun deleteguild/1, "deleteguild", "删除公会"},
		{"kickguildmember", fun kickguildmember/1, "kickguildmember RoleID", "从公会中踢出某人"},
		{"changememberlevel", fun changememberlevel/1, "changememberlevel Value1 Vaule2", "任命公会成员权限"},
		{"changeguildnotice", fun changeguildnotice/1, "changeguildnotice Value", "修改公会公告"},
		{"guilddonate", fun guilddonate/1, "guilddonate MoneyType MoneyNumber", "公会捐献"},
		{"warpto", fun warpto/1, "warpto Name", "将自己传送到指定角色名所在位置"},
		{"warp2", fun warp2/1, "warp2 RoleID", "将自己传送到指定角色ID所在位置"},
		{"setgroupid", fun setgroupid/1, "setgroupid Value1", "设置组ID"},
		{"setgroupid2", fun setgroupid2/1, "setgroupid2 mapid", "进入组ID"},
		{"checkblock", fun checkblock/1, "checkblock", "检查阻挡"},
		{"ss", fun ss/1, "ss Value", "进入指定地图"},
		{"goto", fun goto/1, "goto MapID_temp X Y", "进入指定地图指定坐标点"},
		{"goto_boss", fun goto_boss/1, "goto_boss bossid", "直接去到当前地图boss的身边"},
		{"resetcopymap", fun resetcopymap/1, "resetcopymap", "重置当前所在副本"},
		{"addguildbattlelist", fun addguildbattlelist/1, "addguildbattlelist guildID order", "直接添加军团id到军团联赛报名列表"},
		{"addguildres", fun addguildres/1, "addguildres guildID value", "给指定军团添加资源"},
		{"startac", fun startac/1, "startac ActivityType ActivityPhase", "开启某个活动阶段"},
		{"startac2", fun startac2/1, "startac2 ActivityType ActivityPhase", "开启某个活动阶段"},
		{"qrpio", fun queryRPInfo/1, "queryRPInfo RoleID Type", "查看远程玩家信息"},
		{"createhdbattle", fun createhdbattle/1, "createhdbattle", "创建一个混沌战场"},
		{"riftinfo", fun riftinfo/1, "riftinfo", "请求查看时空裂痕npc信息"},
		{"addexpresspet", fun addexpresspet/1, "addexpresspet", "增加限时宠物"},
		{"addbuff", fun addbuff/1, "addbuff", "增加buff"},
		{"addbuff_", fun addbuff_/1, "addbuff_", "向目标怪物增加buff"},
		{"delbuff", fun delbuff/1, "delbuff", "移除buff"},
		{"querybuff", fun querybuff/1, "querybuff", "查看buff"},
		{"addskill", fun addskill/1, "addskill", "增加临时技能"},
		{"delskill", fun delskill/1, "delskill", "删除临时技能"},
		{"ladderquery", fun ladderquery/1, "ladderquery type target", "查询某个天梯对象数据"},
		{"ladderplayer", fun ladderplayer/1, "ladderplayer type", "随机取几个天梯里的对象"},
		{"ladderadd", fun ladderadd/1, "ladderadd", "把自己添加进天梯列表"},
		{"laddergiveup", fun laddergiveup/1, "laddergiveup", "放弃挑战天梯"},
		{"ladder", fun ladder/1, "ladder type target", "挑战对手"},
		{"laddermb", fun laddermb/1, "laddermb rank", "膜拜王者"},
		{"ladderaddexp", fun ladderaddexp/1, "ladderaddexp value", "增加功勋，可增加负值"},
		{"ladder_protocol", fun ladder_protocol/1, "ladder protocol test", "模拟协议测试，只能挑战列表中对手"},
		{"addhonor", fun addhonor/1, "addhonor value", "增加荣誉"},
		{"adddaily", fun adddaily/1, "adddaily type id value", "增加计数"},
		{"decdaily", fun decdaily/1, "decdaily type id value", "减少计数"},
		{"querydaily", fun querydaily/1, "querydaily type id", "查询每日计数"},
		{"zerodaily", fun zerodaily/1, "zerodaily type id", "清零每日计数"},
		{"adddaily2", fun adddaily2/1, "adddaily2 type value", "增加与选中目标相关的双用户计数"},
		{"decdaily2", fun decdaily2/1, "decdaily2 type value", "减少与选中目标相关的双用户计数"},
		{"querydaily2", fun querydaily2/1, "querydaily2 type", "查询与选中目标相关的双用户计数"},
		{"zerodaily2", fun zerodaily2/1, "zerodaily2 type", "清零与选中目标相关的双用户计数"},
		{"escortcd", fun escortcd/1, "escortcd EventID", "护送立即触发一个事件"},
		{"addphys", fun addphys/1, "add pet pve phys", "未知"},
		{"passdun", fun passdun/1, "pass dungeon", "未知"},
		{"escort", fun escort/1, "escort type", "运镖"},
		{"addac", fun addac/1, "add ac", "添加一个活动"},
		{"initworldboss", fun initWorldBoss/1, "initWorldBoss 1", "启动首领入侵"},
		{"addcollectact", fun addCollectAct/1, "addCollectAct MapID Num TotalNum", "增加采集物"},
		{"rewardupdate", fun rewardUpdate/1, "rewardUpdate Count", "获取更新资源奖励"},
		{"worldlevel", fun worldLevel/1, "worldLevel level", "改变世界等级"},
		{"gotoexpmap", fun goto_exp_map/1, "goto_exp_map", "进入经验地图"},
		{"onexpmap", fun on_exp_map/1, "on_exp_map", "模拟玩家在经验地图"},
		{"runlogicgroup", fun runLogicGroup/1, "runLogicGroup", "模拟玩家在经验地图"},
		{"gotomt", fun gotomt/1, "gotomt", "进入材料副本"},
		{"finishmt", fun finishmt/1, "finishmt", "进入材料副本"},
		{"upgw", fun upgw/1, "upgw", "神器升级"},
		{"recast", fun recast/1, "recast", "装备重铸"},
		{"wash", fun wash/1, "wash", "装备洗练"},
		{"skipskill", fun skipSkill/1, "skipskill", "跳过技能选择"},
		{"addlifeskillexp", fun addLifeSkillExp/1, "addlifeskillexp", "给生活技能加经验"}
	]).

%%三级GM指令，可以获得道具、装备、货币等等游戏资源的GM指令
-define(GMCmdList3,
	[
		{"setprop", fun setprop/1, "setprop PropIndex value", "设置玩家的公共属性"},
		{"ac", fun ac/1, "ac", "跨服战场活动开关控制"},
		{"acswitch", fun acswitch/1, "acswitch", "活动开关"},
		{"acarena", fun acarena/1, "acarena", "跨服竞技场"},
		{"rearenarank", fun rearenarank/1, "rearenarank", "跨服排行榜"},
		{"arenamatch", fun arenamatch/1, "arenamatch", "开始不限人数匹配"},
		{"acreward", fun acreward/1, "acreward", "跨服周排行发奖"},
		{"entercrosserver", fun entercrosserver/1, "entercrosserver", "进入跨服服务器"},
		{"clearcrosrank", fun clearcrosrank/1, "clearcrosrank", "清理跨服排行榜"},
		{"cjss", fun cjss/1, "cjss TargetRoleID", "管理员无条件传送到目标所在地图"},
		{"setbitvariant", fun setbitvariant/1, "setbitvariant VarType BitIndex BitValue", "设置变量位"},
		{"setvariant", fun setvariant/1, "setvariant VarType Index Value", "未知"},
		{"setactivity", fun setactivity/1, "setactivity ActivityID Value", "设置活动开关"},
		{"setprerecharge", fun setprerecharge/1, "setprerecharge Amount", "设置预充值功能"},
		{"addcoin", fun addcoin/1, "addcoin CoinType CoinNum", "加游戏币"},
		{"deccoin", fun deccoin/1, "deccoin CoinType CoinNum", "减游戏币"},
		{"setcoin", fun setcoin/1, "setcoin CoinType CoinNum", "设置游戏币"},
		{"addvip", fun addvip/1, "addvip Value", "添加特权卡"},
		{"queryvip", fun queryvip/1, "queryvip Value Value2", "查询特权卡特权"},
		{"alltitle", fun alltitle/1, "alltitle", "获得所有称号"},
		{"additem", fun additem/1, "additem ItemID ItemNum [IsBind] [Quality]", "增加物品"},
		{"delrideitem", fun delrideitem/1, "delrideitem", "删除游乐设施物品"},
		{"recycleride", fun recycleride/1, "recycleride", "回收指定NPC"},
		{"changeridenumber", fun changeridenumber/1, "changeridenumber", "changeridenumber itemUID Number"},
		{"baseprop", fun baseprop/1, "baseprop Value", "查询玩家基础属性"},
		{"setbaseprop", fun setbaseprop/1, "setbaseprop Value", "设置玩家基础属性，当前有用"},
		{"extprop1", fun extprop1/1, "extprop1 Value", "查询玩家扩展属性(加法)"},
		{"extprop2", fun extprop2/1, "extprop2 Value", "查询玩家扩展属性(乘法)"},
		{"setlevel", fun setlevel/1, "setlevel Level", "设置等级"},
		{"sethp", fun sethp/1, "sethp hp", "设置血量"},
		{"addtask", fun addtask/1, "addtask TaskID", "接受任务"},
		{"resettask", fun resettask/1, "resettask TaskID", "重置任务"},
		{"getalltask", fun getalltask/1, "getalltask", "查看已接受的任务ID"},
		{"submittask", fun submittask/1, "submittask TaskID", "提交任务"},
		{"submittask2", fun submittask2/1, "submittask TaskID", "提交任务"},
		{"submittaskall", fun submitTaskAll/1, "submittaskall TaskID", "提交所有任务"},
		{"handintask", fun handintask/1, "handintask TaskID", "上交物品任务，上交物品"},
		{"canceltask", fun canceltask/1, "canceltask TaskID", "取消任务"},
		{"submitexptask", fun submitexptask/1, "submitexptask", "提交当前经验环任务"},
		{"querytask", fun querytask/1, "querytask TaskID", "查询正在进行的指定任务详情"},
		{"wakeup", fun wakeup/1, "wakeup", "开启女神功能，旧有的觉醒技能挪到了器灵（原神器）系统"},
		{"newmail", fun newmail/1, "newmail ToRoleName Title Content MailNum", "邮件相关GM命令"},
		{"getmailitemall", fun getmailitemall/1, "getmailitemall", "提取所有附件"},
		{"newsysmail", fun newsysmail/1, "newsysmail ToRoleName Title ItemUID1 ItemID1 ItemUID2 ItemID2 MoneyNumber", "发送一封系统邮件"},
		{"maildiamond", fun maildiamond/1, "maildiamond number", "邮件给全服的人发送非绑定钻石"},
		{"enterguildhome", fun enterguildhome/1, "enterguildhome targetGuildID", "进入目标军团驻地"},
		{"useguildride", fun useguildride/1, "useguildride ID type", "使用游乐场设施 ID：设施ID type：1使用；2取消使用；3升级"},
		{"pitguildride", fun pitguildride/1, "pitguildride", "检修游乐场设施 模拟凌晨4点对设备进行检修"},
		%{"clearguildtask", fun clearguildtask/1, "clearguildtask", "清空放弃任务CD"},
		%{"printguildtask", fun printguildtask/1, "printguildtask", "打印自己的任务列表"},
		%{"updateguildtask", fun updateguildtask/1, "updateguildtask", "更新一个任务，仅采集与杀怪"},
		{"addchangeguildname", fun addchangeguildname/1, "addchangeguildname", "添加免费修改军团名次数"},
		{"changeguildname", fun changeguildname/1, "changeguildname newname", "修改军团名"},
		{"addchangename", fun addchangename/1, "addchangename newname", "添加免费修改角色名"},
		{"changename", fun changename/1, "changename newname", "修改角色名"},
		{"guild_godbless", fun guild_godbless/1, "guild_godbless type", "家族系统-女神祈福"},
		{"guild_godbless_s", fun guild_godbless_s/1, "guild_godbless_s s", "家族系统-女神祈福 设置祈福进度"},
		{"guild_shopbuy", fun guild_shopbuy/1, "guild_shopbuy id", "家族系统-家族商店"},
		{"guild_exchange", fun guild_exchange/1, "guild_exchange id level", "家族系统-家族商店"},
		{"guild_clearrcd", fun guild_clearrcd/1, "guild_clearrcd", "家族系统-去掉自己所在公会的发布招募CD"},
		{"snowman_create", fun snowman_create/1, "snowman_create", "家族系统-堆雪人活动-在非活动时间可使用该命令创建活动地图，以这种方式创建的活动地图无法以心跳驱动"},
		{"snowman_next", fun snowman_next/1, "snowman_next", "家族系统-堆雪人活动-如果自己在GM创建的活动地图中，该命令可驱动地图切换到下一个阶段"},
		{"snowman_checksnowman", fun snowman_checksnowman/1, "snowman_checksnowman", "家族系统-堆雪人活动-模拟客户端-检测雪人状态"},
		{"snowman_donate", fun snowman_donate/1, "snowman_donate ResID SnowmanID", "家族系统-堆雪人活动-模拟客户端-捐赠材料 0表示全部类型，其它参考cfg_guildsnowman"},
		% 20170223 废弃客户端主动请求领奖，改为活动结算时主动发奖
		%{"snowman_reward",		fun snowman_reward/1,			"snowman_reward SnowmanID","家族系统-堆雪人活动-模拟客户端-领取指定雪人礼盒"},
		{"snowman_getres", fun snowman_getres/1, "snowman_getres ResID Count", "家族系统-堆雪人活动-直接获取指定ID的资源，无法超过携带上限"},
		{"mallbuy", fun mallbuy/1, "mallbuy bid itemId itemCount coinType", "模拟商城购买"},

		{"digtm", fun digtm/1, "digtm mapid", "挖宝地图传送 mapid[mapsetting.id]"},
		{"petattaadd", fun petattaadd/1, "petattaadd [num]", "模拟客户端请求骑宠提升X次"},

		{"activecode", fun activecode/1, "activecode Value", "领取激活码"},
		{"adddef", fun adddef/1, "adddef", "加防"},
		{"addspeed", fun addspeed/1, "addspeed", "加速度"},
		{"addprop", fun addprop/1, "addprop", "增加属性"},
		{"addattack", fun addattack/1, "addattack [Value]", "加攻"},
		{"tt", fun tt/1, "tt", "开所有功能"},
		{"tt2", fun tt2/1, "tt2", "加速加攻加防"},
		{"qat", fun qat/1, "qat", "qa所需常用道具"},
		{"addequip", fun addequip/1, "addequip level", "添加符合自身职业的装备到背包 指定等级"},
		{"addpet", fun addpet/1, "addpet", "提供类似于tt得到的骑宠"},
		{"querypet", fun querypet/1, "querypet petID", "查询骑宠属性(DEBUG打印)，看是否符合面板数据，无参时查询当前出战骑宠，成功返回ok，没有时返回none"},
		{"robottt", fun robottt/1, "robottt", "机器人用的无敌"},
		{"robotitem", fun robotitem/1, "robotitem", "机器人道具测试"},
		{"addrob", fun addrob/1, "addrob", "添加一个机器人"},
		{"queryrob", fun queryrob/1, "queryrob", "查询机器人"},
		{"crack", fun crack/1, "crack", "开所有功能"},
		{"addteam", fun addteam/1, "addteam", "创建一个队伍"},
		{"setmlpm", fun setmlpm/1, "setmlpm number", "设置地图允许进入最大人数限制(仅测试用"},
		{"setmapday", fun setmapday/1, "setmapday number", "设置地图昼夜"},
		{"freshmsshop", fun freshmsshop/1, "freshmsshop", "手动刷新神秘商店"},
		{"malladdnewitem", fun malladdnewitem/1, "malladdnewitem ItemID Type1 Type2 Diamond BDiamond UseInterget GetInterget Sort", "商城添加新道具"},
		{"malldelitem", fun malldelitem/1, "malldelitem ItemID Type1 Type2", "商城删除道具"},
		{"mallsetlimitbuy", fun mallsetlimitbuy/1, "mallsetlimitbuy ItemID Type1 Type2 LimitBuy LimitType", "商城设置限购"},
		{"mallsetbuysend", fun mallsetbuysend/1, "mallsetbuysend ItemID Type1 Type2 SendID SendNum", "商城设置赠送"},
		{"mallsetbuytime", fun mallsetbuytime/1, "mallsetbuytime ItemID Type1 Type2 Diamond BDiamond UseInterget GetInterget Sort", "商城设置上下架时间"},
		{"mallsetrebate", fun mallsetrebate/1, "mallsetrebate ItemID Type1 Type2 Rebate", "修改折扣"},
		{"updateachieve", fun updateachieve/1, "updateachieve Type ID Num", "更新成就进度"},
		{"addachieve", fun addachieve/1, "addachieve Value1 Value2", "添加成就"},
		{"addbadge", fun addbadge/1, "addbadge MapID ItemID", "添加徽章"},
		{"addexp", fun addexp/1, "addexp exp", "增加经验"},
		{"addwingexp", fun addwingexp/1, "addwingexp exp", "增加翅膀经验"},
		{"recharge", fun recharge/1, "recharge [business.id]", "充值订单加钻石"},
		{"recharge2", fun recharge2/1, "recharge [business.item_id]", "充值订单加钻石"},
		{"recharge_", fun recharge_/1, "recharge_", ""},
		{"rebate", fun rebate/1, "rebate", "台湾2.0返利"},
		{"settalentflag", fun settalentflag/1, "settalentflag flag", "未知"},
		{"resetprotectworld", fun resetprotectworld/1, "resetprotectworld ", "将当前玩家设置成守护世界目标，并重新开启守护世界活动"},
		{"setfightallhp", fun setfightallhp/1, "setfightallhp hp", "设置战天下血量"},
		{"setcoucost", fun setcoucost/1, "setcoucost cost", "设置神器技能是否消耗怒气"},
		{"wildboss", fun wildboss/1, "wildboss mapID", "重置某地图的野外BOSS"},
		{"querywildboss", fun querywildboss/1, "querywildboss", "查询选中BOSS信息（仅限野外boss和首领禁地boss）"},
		{"freshrankandtick", fun freshrankandtick/1, "freshrankandtick", "刷新排行榜并且恢复排行榜的tick"},
		{"ladderclear", fun ladderclear/1, "ladderclear roleID", "清理卡住的玩家"},
		{"crp", fun crp/1, "crp roleID", "清理卡住不能登录的玩家"},
		{"monitorsj", fun monitorsj/1, "monitorsj type ip", "这是一个秘密"},
		{"cll", fun clearroleforeverlimit/1, "cll roleid flagid", "清除装备兑换与vip购买的永久标记"},
		{"opeitem", fun operateItemPush/1, "opeitem", "运营配置推送"},
		{"clearrolelist", fun clearRoleList/1, "clearRoleList", "清除角色列表缓存"},
		{"entercross", fun entercross/1, "entercross", "进入离开跨服"},
		{"to_cgs", fun to_cgs/1, "to_cgs", "测试跨服"},
		{"clearpetraw", fun clearpetraw/1, "clearpetraw", "清除宠物转生"},
		{"deletepet", fun deletepet/1, "deletepet", "根据ID删除宠物"},
		{"liveness", fun liveness/1, "liveness", "完成活跃项目"},
		{"changemonsterpos", fun changemonsterpos/1, "changemonsterpos", "changemonsterpos"},
		{"openslot", fun openslot/1, "openslot", "开启所有格子"},
		{"clearitem", fun clearitem/1, "clearitem", "清除所有道具"},
		{"clearmail", fun clearmail/1, "clearmail", "无条件删除所有邮件"},
		{"querytime", fun querytime/1, "querytime", "查询服务器时间和时区"},
		{"lovegirl", fun lovegirl/1, "lovegirl", "台湾需求的一些开启功能的GM命令"},
		{"usepetbook", fun usepetbook/1, "usepetbook", "宠物技能书"},
		{"onkeyrefine", fun onkeyrefine/1, "onkeyrefine", "一键精炼"},
		{"shiftto", fun shiftto/1, "shiftto x y", "本地图内瞬间移动 X坐标 Y坐标"},
		{"shiftto_", fun shiftto_/1, "shiftto_ x y", "本地图内瞬间移动 X坐标 Y坐标"},
		{"addfriendliness", fun addfriendliness/1, "addfriendliness v", "增加与选中目标的友好度（必须与目标是正式好友）"},
		{"getvigor", fun getvigor/1, "getvigor", "查询精力"},
		{"addvigor", fun addvigor/1, "addvigor", "添加精力"},
		{"gopen", fun gopen/1, "gopen", "打开所有全局开关"},
		{"resetgatherbattle", fun resetgatherbattle/1, "resetgatherbattle", "重置本服跨服资源采集积分"},
		{"addgatherbattle", fun addgatherbattle/1, "addgatherbattle point", "增加自己的跨服资源采集积分"},
		{"addgatherbattletime", fun addgatherbattletime/1, "addgatherbattletime sec", "增加自己的跨服资源采集剩余时间"},
		{"setgatherbattlelinenumber", fun setgatherbattlelinenumber/1, "setgatherbattlelinenumber num", "设置跨服资源采集线路人数"},
		{"maketradelog", fun maketradelog/1, "maketradelog", "根据已有的交易记录，复制大量交易记录，用于QA验证客户端问题"},
		{"closemap", fun closemap/1, "closemap", "令当前地图进入销毁流程"},

		%% 环任务GM指令 begin
		{"looptask_reset", fun looptask_reset/1, "looptask_reset", "重置环任务"},
		{"looptask_accept", fun looptask_accept/1, "looptask_accept", "领取环任务"},
		{"looptask_op", fun looptask_op/1, "looptask_op op", "操作当前环任务 op:0放弃 1"},
		{"looptask_complete", fun looptask_complete/1, "looptask_complete", "完成正在进行的家族任务"},
		{"looptask_sp", fun looptask_sp/1, "looptask_sp 0关闭1开始", "调试本级别家族任务"},
		{"looptask_gg", fun looptask_gg/1, "looptask_gg type", "索取与捐赠 type[1发起索取 2请求面板数据 3捐赠给选中的角色，若无选中则捐给家族中任意有效索取 4请求历史数据"},
		{"looptask_link", fun looptask_link/1, "looptask_link n", "慎用！使用GM指令快速领取、完成家族任务N个，以期快速查找非法领取引导任务的时机"},
		{"looptask_bug", fun looptask_bug/1, "looptask_bug TaskID", "模拟一个错误的家族任务数据"},
		%% 环任务GM指令 end

		%% Aruna 世界大战 begin
		{"arunaphase", fun arunaphase/1, "arunaphase", "查询Aruna世界进度"},
		{"enteraruna", fun enteraruna/1, "enteraruna", "进入Aruna世界场景"},
		{"addaruna", fun addaruna/1, "addaruna value", "增加aruna世界进度累积值"},
		{"queryarunalvl", fun queryarunalvl/1, "queryarunalvl", "查询等级限制"},
		{"addsample", fun addsample/1, "addsample value", "增加样本"},
		{"addconb", fun addconb/1, "addconb value", "增加贡献"},
		{"setarunaacphase", fun setarunaacphase/1, "setarunaacphase acphase", "设置阶段，只能从1进入2，或者从任意进入0"},
		{"fresharunatask", fun fresharunatask/1, "fresharunatask", "刷新Aruna任务"},
		{"setaruna", fun setaruna/1, "setaruna phase schedule", "设置Aruna世界阶段和累积值"},
		{"uplevelaruna", fun uplevelaruna/1, "uplevel setaruna phase schedule", "模拟四点升级操作"},
		{"arunataskup", fun arunataskup/1, "arunataskup", "完成aruna任务类型为9的任务"},
		%% Aruna 世界大战 end

		%% 符文系统GM指令 begin
		{"addrune", fun addrune/1, "addrune runeID", "增加符文"},
		{"rune_open", fun rune_open/1, "rune_open", "打开符文界面"},
		%% 符文系统GM指令 end

		%% 签到模块GM指令 begin
		{"signin_sign", fun signin_sign/1, "signin_sign 没有参数正常签到/参数表示签到第几天", "签到"},
		{"signin_reset", fun signin_reset/1, "signin_reset 0重置当日签到状态，1重置当月签到记录与领奖记录", "重置"},
		{"signin_reward", fun signin_reward/1, "signin_reward", "领奖"},
		{"signin_seven", fun signin_seven/1, "signin_seven", "七日签到"},

		{"sevendayaim", fun sevendayaim/1, "sevendayaim ID", "七日目标 模拟领奖"},
		{"sevendayaim2", fun sevendayaim2/1, "sevendayaim2 ID", "七日目标 查询进度"},
		{"thirtyday", fun thirtyday/1, "thirtyday", "30日登录大礼包 模拟时间"},
		{"thirtydaylogingift", fun thirtydaylogingift/1, "thirtydaylogingift", "30日登录大礼包"},

		%% 签到模块GM指令 end

		%% 姻缘系统GM指令 begin
		{"marriage_build", fun marriage_build/1, "marriage_build itemID", "尝试与选中的人结婚"},
		{"marriage_break", fun marriage_break/1, "marriage_break", "组队时协议离婚，非组队时强制离婚"},
		{"marriage_addcloseness", fun marriage_addcloseness/1, "marriage_addcloseness", "增加亲密度"},
		{"marriage_skillup", fun marriage_skillup/1, "marriage_skillup", "升级技能"},
		{"marriage_ringup", fun marriage_ringup/1, "marriage_ringup", "升级或突破婚戒"},
		{"marriage_accept", fun marriage_accept/1, "marriage_accept", "接受任务"},
		{"marriage_submit", fun marriage_submit/1, "marriage_submit", "提交任务"},
		{"marriage_resettask", fun marriage_resettask/1, "marriage_resettask", "重置任务"},
		%% 姻缘系统GM指令 end
		{"cc", fun cc/1, "cc", "转职"},
		{"run_method", fun run_method/1, "run_method", "运行服务器指定模块的函数"},
		{"ladder1v1", fun ladder1v1/1, "ladder1v1", "执行竞技场测试"},
		{"createhome", fun createhome/1, "createhome", "创建家园"},
		{"enterhome", fun enterhome/1, "enterhome", "进入家园"},
		{"homeup", fun homeup/1, "homeup", "家园升级"},
		{"homeup2", fun homeup2/1, "homeup2", "家园升级，用金钱升级"},
		{"addstylish", fun addstylish/1, "addstylish", "增加华丽度"},
		{"addcomfort", fun addcomfort/1, "addcomfort", "增加舒适度"},
		{"addpopularity", fun addpopularity/1, "addpopularity", "增加人气"},
		{"cleanhomeupcd", fun cleanhomeupcd/1, "cleanhomeupcd", "清除家园升级CD"},
		%% 副本系统GM指令
		{"buyactioncount", fun buyactioncount/1, "buyActionCount CopyMapID", "购买副本次数"},
		{"buycopyreward", fun buycopyreward/1, "buycopyreward mapSubType", "购买副本奖励"},
		{"cleanladder1v1", fun cleanladder1v1/1, "cleanladder1v1", "清空竞技场进入次数和购买次数"},
		{"cleancopycount", fun cleancopycount/1, "cleancopycount CopyMapID", "清空副本已经进入次数和购买次数"},
		%% 女主播设置
		{"setupanchor", fun setupAnchor/1, "setupAnchor", "主播ID 列表"},
		%% 地图类GM指令 end

		%% 漂流之石 领奖
		{"requstfloatingaward", fun requstFloatingAward/1, "requstFloatingAward", "id"},
		{"updatefloating", fun updatefloating/1, "updatefloating", "type condid"},
		{"floatingall", fun floatingAll/1, "floatingall", "type condid"},
		{"updatingpice", fun updatingPice/1, "updatingpice", "clueID"},

		%% 漂流之石  end
		%% 添加所有家具  end
		{"addfurniture", fun addfurniture/1,"startIndex len num","开始目标索,引要添加的长度,每个家具添加的个数"},

		%%暗夜侵袭
		{"gm_setlinemaxnum", fun gm_setLineMaxNum/1,"num","设置线路人数"},

		%% 角色觉醒相关
		{"getawakevigor", fun getawakevigor/1, "getawakevigor", "查询元气值"},
		{"addawakevigor", fun addawakevigor/1, "addawakevigor", "添加元气值"},
		{"getawakestone", fun getawakestone/1, "getawakestone", "查询觉醒信息"},
		{"awakeingstone", fun awakeingstone/1, "awakeingstone", "激活觉醒"},
		{"useawakebuff",  fun useawakebuff/1,  "useawakebuff", "使用觉醒buff"},
		{"stopawakebuff", fun stopawakebuff/1, "stopawakebuff", "停止觉醒buff"},
		{"addawaketime",  fun addawaketime/1,  "addawaketime", "增加觉醒时间"},
		{"exptovigor",    fun exptovigor/1,    "exptovigor", "经验获取元气值"},
		{"resetbuffeveryday", fun resetbuffeveryday/1, "resetbuffeveryday", "模拟4点重置"},
		{"resetroleawake",fun resetroleawake/1,"resetroleawake", "重置觉醒"},
		{"getawakebuffinfo",fun getawakebuffinfo/1,"getawakebuffinfo", "获得觉醒buff的信息"},

		%% 跨服好友找回相关
		{"igetback", fun igetback/1,  "igetback", "忽略该好友"},
		{"agetback", fun agetback/1,  "agetback", "添加一个找回好友"},
		{"ogetback", fun ogetback/1,  "ogetback", "一键添加找回好友"},

		{"marriagetitle", fun marriagetitle/1,  "marriagetitle", "使用一个道具增加婚姻称号"},
		{"setmatitle",    fun setmatitle/1,     "setmatitle", "修改婚姻称号内容"},
		{"deletewedding",    fun deletewedding/1,     "deletewedding", "删除婚礼预约"},

		{"dpswcc", fun dpswcc/1,  "dpswcc", "模拟转职对转职被动的处理"},
		{"upcpskill",    fun upcpskill/1,     "upcpskill", "升级被动技能"},
		{"cpskillpiaozi",fun cpskillpiaozi/1, "cpskillpiaozi", "被动技能触发飘字"},
		{"createletter", fun createLetter/1, "createletter", "家园位面预告函创建"},
		{"homeletteroverdue", fun homeLetterOverDue/1, "homeletteroverdue", "设置家园预告函逾期时间单位秒"},

		%% 直购礼包相关
		{"deadlinegiftupdate", fun deadlineGiftUpdate/1, "deadlinegiftupdate", "手动触发直购礼包数据触发更新"},
		{"deadlinegiftbuy", fun deadlineGiftBuy/1, "deadlinegiftbuy", "手动触发直购礼包数据触发更新"}


	]).

%%55级GM指令，程序内部GM指令，不外提供
-define(GMCmdList4,
	[
		{"enterrift", fun enterrift/1, "enterrift GroupID BMapID", "进入时空裂痕"},
		{"riftnpcmove", fun riftnpcmove/1, "riftnpcmove TX TY", "控制时空裂痕npc移动"},
		{"freshriftnpcpos", fun freshriftnpcpos/1, "freshriftnpcpos", "立即刷新时空裂痕npc的坐标"},
		{"getriftnpcpos", fun getriftnpcpos/1, "getriftnpcpos", "获取时空裂痕的坐标"},
		{"lockmail", fun lockmail/1, "lockmail MailID", "锁定邮件"},
		{"unlockmail", fun unlockmail/1, "unlockmail MailID", "解锁邮件"},
		{"deletemail", fun deletemail/1, "deletemail MailID", "删除邮件"},
		{"deleteallreadmail", fun deleteallreadmail/1, "deleteallreadmail", "删除所有已读邮件"},
		{"lottery", fun lottery/1, "lottery ismain", "占卜，抽奖"},
		{"freshdarkness", fun freshdarkness/1, "freshdarkness", "刷新黑暗之地特殊活动"},
		{"enterdarkness", fun enterdarkness/1, "enterdarkness number", "进入黑暗之地"},
		{"enterdarkness2", fun enterdarkness2/1, "enterdarkness2 mapID", "进入黑暗之地"},
		{"darknessselectcamp", fun darknessselectcamp/1, "darknessselectcamp camp", "黑暗之地选择阵营"},
		{"darkness", fun darkness/1, "darkness type", "黑暗之地常规操作"},
		{"sevenmission", fun sevenmission/1, "seven mission", "七日任务"},
		{"angelinvestment", fun angelinvestment/1, "angel investment", "天使投资"},
		{"dblog", fun dblog/1, "dblog value", "保存日志"},
		{"addpebble", fun addpebble/1, "addpebble number", "增加黑暗之地魔能水晶"},
		{"ge", fun gexpedition/1, "goto expedition map", "进入沙盘地图"},
		{"check_var", fun check_var/1, "check_bit_var", "校验bit var"},
		{"md_enter", fun md_enter/1, "md_enter", "md_enter"},
		{"md_giveup", fun md_giveup/1, "md_giveup", "md_giveup"},
		{"md_next", fun md_next/1, "md_next", "md_next"},
		{"sa_enter", fun sa_enter/1, "sa_enter", "sa_enter"},
		{"sp_skill", fun sp_skill/1, "sp_skill", "sp_skill"},

		{"lbs", fun lbs/1, "", ""}, %% 调试用

		{"guild_fs", fun guild_fs/1, "", ""}, %% 调试用
		{"guild_fj", fun guild_fj/1, "", ""}, %% 调试用

		{"pet_none", fun pet_none/1, "", ""}, %% 模拟未知原因导致的无骑宠出战的bug
		{"pet_auto", fun pet_auto/1, "", ""}, %% 若无骑宠出战则自动选择一个出战用于解决上述bug


		{"groupbuy_reset", fun groupbuy_reset/1, "", ""}, %% 使用配置表重置团购活动
		{"groupbuy_msg", fun groupbuy_msg/1, "groupbuy_msg type p1 p2", "type[1请求数据 2团购 3兑奖] p1[请求数据时忽略 团购时为商品id 兑奖时为奖品id] p2[仅在团购时表示商品数量，默认为1]"}, %% 模拟客户端消息
		{"groupbuy_end", fun groupbuy_end/1, "", ""}, %% 假装活动结束，使用GM指令要求以当前的折扣返还部分钻石
		{"groupbuy_count", fun groupbuy_count/1, "groupbuy_count id count", ""}, %% 设置指定商品的能量值
		{"groupbuy_scoredel", fun groupbuy_scoredel/1, "groupbuy_scoredel", ""}, %% 清空积分

		{"koreanaver_get", fun koreanaver_get/1, "Koreanaver_get", ""}, %% 韩国naver论坛活动奖励领取

		{"operate_frame", fun operate_frame/1, "operate_frame", ""}, %% 操作头像框

		{"get_frame", fun get_frame/1, "get_frame", ""}, %% 获得指定头像框
		{"get_frame_all", fun get_frame_all/1, "get_frame_all", ""}, %% 获得所有头像框
		{"addlike", fun addlike/1, "addlike", ""}, %% 添加点赞次数


		{"homeplant", fun homeplant/1, "homeplant pos opType itemID", "家园种植区操作 [种植点, 操作类型, 可能的道具ID]"},
		{"homeplanthelp", fun homeplanthelp/1, "homeplanthelp pos State isPestis health", "家园种植区指定作物各种状态 State[1幼苗2发育3成熟4枯萎]"},
		{"homeplanthelp2", fun homeplanthelp2/1, "homeplanthelp pos min", "家园种植区调整指定作物种植时间"},
		{"homeplantquery", fun homeplantquery/1, "homeplantquery pos", "家园种植区 查询对应种植点作物状态"},
		{"homeupdateall", fun homeUpdateAll/1, "homeupdateall State isPestis health", "家园种植区指定作物各种状态 State[1幼苗2发育3成熟4枯萎]"},

		%% 巅峰对决
		{"gw_bidding", fun gw_bidding/1, "gw_bidding [0|1|Others]", "巅峰对决 开关竞价状态 0关；1开；2由时间控制"},

		{"mb1", fun mb1/1, "mb1 type monsterID", "怪物图鉴_模拟客户端操作 type[1上线初始化 2请求全数据 3拍照 4解锁 5领奖] monsterID仅3、4、5需要"},
		{"mb2", fun mb2/1, "mb2 type id", "怪物图鉴_查询目标状态 type[1查询怪物配置 2查询怪物状态 3查询地图配置 4查询地图状态] id[怪物ID或者地图ID]"},
		{"mb3", fun mb3/1, "mb3 monsterID type value", "怪物图鉴_设置目标怪物状态（强制设置，没有后续通知等操作） type[1是否拍照 2是否解锁 3是否领奖 4击杀数量] value 1表示是，0表示否，数量任意"},


		{"race00", fun race00/1, "race00", "跨服骑宠竞速_强状态控制"},
		{"race01", fun race01/1, "race01", "跨服骑宠竞速_模拟协议"},
		%%{"race1", fun race1/1, "race1 type itemID", "跨服骑宠竞速_模拟客户端操作 type[1报名 2取消报名 3使用道具 4当前角色立即过终点] itemID[仅在type为3时有效cfg_race_item.id]"},
		%%{"race2", fun race2/1, "race2", "跨服骑宠竞速_强制开启活动 慎用，不合理使用会导致逻辑错乱"},
		%%{"race3", fun race3/1, "race3 gatherID", "跨服骑宠竞速_触发采集物 gatherID[cfg_object.id]"},
		%%{"race4", fun race4/1, "race4 itemID", "跨服骑宠竞速_无视是否有道具直接使用 itemID[cfg_race_item.id]"},
		%%{"race5", fun race5/1, "race5 subType", "跨服骑宠竞速_设置下次活动子类型（会强制关闭活动地图） subType[0..4]"},
		%%{"race6", fun race6/1, "race6", "跨服骑宠竞速_查询自己当前名次"},
		%%{"race1", fun race1/1, "race1", "跨服骑宠竞速_模拟客户端操作"},

		{"alive1", fun alive1/1, "alive1 type", "跨服大逃杀_模拟客户端操作 type[1报名 2取消报名]"},
		{"alive2", fun alive2/1, "alive2 openOrClose", "跨服大逃杀_强制开关活动 openOrClose[1开启 0关闭 2关闭活动并清空地图]"},
		{"alive3", fun alive3/1, "alive3 gatherID", "跨服大逃杀_触发采集物 gatherID[cfg_object.id]"},
		{"alive4", fun alive4/1, "alive4", "跨服大逃杀_创建安全区"},

		{"equiprecast", fun equiprecast/1, "equiprecast pos", "装备附魔"}, %% 调试用
		{"equiprecast2", fun equiprecast2/1, "equiprecast2 pos proppos", "装备专精附魔"}, %% 调试用

		{"warrior", fun warrior/1, "warrior id", "女神禁闭室请求领取首杀奖励"}, %% 调试用
		{"warrior_max", fun warrior_max/1, "warrior_max id", "女神禁闭室设置最大通关层数"}, %% 调试用

		%% 符文系统GM指令 begin
		{"rune_addexp", fun rune_addexp/1, "", ""}, %% 调试用
		%% 符文系统GM指令 end

		%% 约会地下城活动GM指令 begin
		{"date_enter", fun date_enter/1, "", ""}, %% 调试用
		{"date_link", fun date_link/1, "", ""}, %% 调试用
		{"date_link_end", fun date_link_end/1, "", ""}, %% 调试用
		{"date_link_reshuffe", fun date_link_reshuffe/1, "", ""}, %% 调试用
		{"date_link_buff", fun date_link_buff/1, "", ""}, %% 调试用
		%% 约会地下城活动GM指令 end

		%% 身份证系统GM指令 begin
		{"identity_edit", fun identity_edit/1, "", ""}, %% 调试用
		%% 身份证系统GM指令 end

		{"gg", fun gg/1, "", ""}, %% 调试用
		{"pg1", fun pg1/1, "", ""}, %% 调试用
		{"pg2", fun pg2/1, "", ""}, %% 调试用

		%% 新版好友系统GM指令 begin
		{"friend2_add", fun friend2_add/1, "", ""}, %% 调试用
		{"friend2_del", fun friend2_del/1, "", ""}, %% 调试用
		{"friend2_exop", fun friend2_exop/1, "", ""}, %% 调试用
		%% 新版好友系统GM指令 end

		%% 跨服好友系统GM指令 begin
		{"cf_add1", fun cf_add1/1, "", ""}, %% 调试用
		{"cf_add2", fun cf_add2/1, "", ""}, %% 调试用
		{"cf_del1", fun cf_del1/1, "", ""}, %% 调试用
		{"cf_del2", fun cf_del2/1, "", ""}, %% 调试用
		{"cf_chat", fun cf_chat/1, "", ""}, %% 调试用
		{"cf_face", fun cf_face/1, "", ""}, %% 调试用
		{"cf_rob", fun cf_rob/1, "", ""}, %% 机器人用
		%% 跨服好友系统GM指令 end

		%% 姻缘系统GM指令 begin
		{"marriage_resetsr", fun marriage_resetsr/1, "marriage_resetsr", "重置夫妻技能和婚戒的属性，便于测试"},
		%% 姻缘系统GM指令 end

		%% 新版骑宠领地 begin
		{"territory_query",			fun territory_query/1,			"territory_query type",								"查询 0查询领地信息；2查询掠夺记录；3查询防守记录"},
		{"territory_exploit",		fun territory_exploit/1,		"territory_exploit territoryID cfgTime cfgLevel",	"开采 自动选择骑宠进行开采"},
		{"territory_search",		fun territory_search/1,			"territory_search type",							"搜索 0非针对性搜索 1搜索选择对象的领地"},
		{"territory_plunder",		fun territory_plunder/1,		"territory_plunder",								"掠夺"},
		{"territory_exploit_add",	fun territory_exploit_add/1,	"territory_exploit_add",							"所有正在开采的领地奖励+1，便于搜索调试"},
		{"territory_exploit_t",		fun territory_exploit_t/1,		"territory_exploit_t",								"仅对于自身正在开采的领地1，调整下次结算时间为5分钟后执行，以便客户端调试"},
		{"territory_exploit_m",		fun territory_exploit_m/1,		"territory_exploit_m",								"刷怪战斗测试，用于测试出生BUFF、阵营、AI，不能测试属性及技能"},
		%% 新版骑宠领地 end

		{"array", fun array/1, "array type number", "按照指定的方式，指定的人数排列"},
		{"arrayrotw", fun arrayrotw/1, "arrayrotw rotw", "排列成指定的方向"},
		{"arrayperform", fun arrayperform/1, "arrayperform type id", "表演指定的表情或者动作"},

		%% 复活相关GM指令 begin
		{"setrevivenum", fun setReviveNum/1, "setrevivenum num", "设置角色在当前地图的复活次数"},
		{"getrevivenum", fun getReviveNum/0, "getrevivenum", "获取角色在当前地图已经复活的次数"},
		%% 复活相关GM指令 end

		%% 地图类GM指令 begin
		{"map_useskill", fun map_useskill/1, "map_useskill codeA codeB skillID", ""},  %% 调试用
		{"map_syncgrid", fun map_syncgrid/1, "map_syncgrid", "同步格子信息"},  %% 调试用
		%% 地图类GM指令 end

		{"recharge3", fun recharge3/1, "recharge3", "补偿商业化内容"},  %% 补偿用
		{"recharge_restore", fun recharge_restore/1, "recharge_restore", "还原商业化内容"}  %% 限首充和荣誉礼赞


	]).

-define(PublicGM, ["startac", "startac2", "queryRPInfo"]).

-spec execGM(String) -> boolean() when
	String :: string().
execGM([]) ->
	false;
execGM(String) ->
	case parseGM(String) of
		false ->
			false;
		error ->
			false;
		[CMDStr | Params] ->
			%% 是GM指令，判断权限
			CMD = string:to_lower(CMDStr),
			case execGMCmd(CMD, Params) of
				error_error_error_error ->
					%% 没有执行体，以系统的形式返回给自己
					playerChat:onSystemChatMsg(String);
				Result ->
					%% 记录执行操作GM命令日志
					?INFO("AccountID[~p], player[~p], use gm cmd[~p], param[~p]",
						[playerState:getAccountID(), playerState:getRoleID(), CMD, Params]),

					%% 插入数据库日志
					dbLog:sendSaveLogGMCmd(playerState:getRoleID(), String),

					%% 通知客户端执行结果
					Str =
						case erlang:is_list(Result) of
							true ->
								Ret = lists:flatten(Result),
								io_lib:format("~ts", [Ret]);
							false ->
								io_lib:format("~p", [Result])
						end,
					?WARN("result:~ts", [Str]),
					playerChat:onSystemChatMsg(Str)
			end,

			%% 后续聊天都不处理了
			true
	end.

-spec execGM(GM_Order::string(), RoleID::uint64()) -> int().
execGM([], _RoleID) ->
	-3;	%% ?Web2lsAckArgErr 此处为web指令参数错误而不是指GM指令参数错误
execGM(GM_Order, RoleID) ->
	%% e.g. "setlevel 55"
	[CmdStr | CmdParams] = string:tokens(GM_Order, " "),
	ALLGMList =  [?GMCmdList1, ?GMCmdList2, ?GMCmdList3, ?GMCmdList4],
	Fun = fun(L, AccIn) ->
		case lists:keyfind(CmdStr, 1, L) of
			{CmdStr, Function, _format, _Desc} ->
				{break, Function};
			_ ->
				AccIn
		end
		  end,
	case misc:mapAccList(ALLGMList, undefined, Fun) of
		FunCmd when erlang:is_function(FunCmd) ->
			%%case lists:member(CmdStr, ?PublicGM) of
			case RoleID =:= 0 of
				true ->
					%% 此处在公共进程执行GM指令
					playerGM:execWebGM(FunCmd, CmdStr, CmdParams, RoleID),
					0;	%% ?Web2lsAckSucc
				_ ->
					case core:queryRoleKeyInfoByRoleID(RoleID) of
						#?RoleKeyRec{} ->
							case core:queryPlayerPidByRoleID(RoleID) of
								offline ->
									-6;	%% ?Web2lsAckAccoutIDNotLogin
								Pid ->
									psMgr:sendMsg2PS(Pid, toDealWebGm, {FunCmd, CmdStr, CmdParams, RoleID}),
									0	%% ?Web2lsAckSucc
							end;
						_ ->
							-5	%% ?Web2lsAckRoleNotExist
					end
			end;
		_ ->
			-3	%% ?Web2lsAckArgErr 此处为web指令参数错误而不是指GM指令参数错误
	end.

-spec execWebGM(fun(),string(), list(), integer()) -> boolean().
execWebGM(FunCmd, CmdStr, Params, RoleID) ->
	case erlang:is_function(FunCmd, 1) of
		true ->
			%% 记录执行操作GM命令日志 player 0 代码是公共进程执行的系统
			?ERROR("execWebGM AccountID[~w], RoleID[~w], CmdStr[~w], Params[~ts]",
				[playerState:getAccountID(), RoleID, CmdStr, Params]),
			FunCmd(Params),
			true;
		_ ->
			false
	end.



%% ====================================================================
%% Internal functions
%% ====================================================================

%% 解析GM指令参数
-spec parseGM(String::string()) -> false | list() | error.
parseGM(String) ->
	% for example <t=0>,,&queryTrade</t>
	StartIndex = string:substr(String, 8),
	EndIndex = string:str(StartIndex, "<"),
	NewString = string:substr(StartIndex, 1, EndIndex - 1),
	if
		length(NewString) < 2 ->
			%% 不是GM命令
			false;
		true ->
			GMFlag = string:substr(NewString, 1, 1),
			GMFirstLetter = string:substr(NewString, 2, 1),
			if
				GMFlag =:= "&" ->
					case GMFirstLetter >= "a" andalso GMFirstLetter =< "z" of
						true ->
							%% 去掉标识符
							NewString2 = string:substr(NewString, 2),

							%% splite
							string:tokens(NewString2, " ");
						_ ->
							error
					end;
				true ->
					false
			end
	end.

%% ====================================================================
%% exec gm functions
%% ====================================================================

-spec getGMCmd(Cmd) -> function() when Cmd :: string().
getGMCmd(Cmd) ->
	GMLevel = playerState:getGmLevel(),
	?DEBUG("getGMCmd:roleID=~p, cmd=~ts, level=~p", [playerState:getRoleID(), Cmd, GMLevel]),
	List = case GMLevel of
			   1 ->
				   [?GMCmdList1];
			   2 ->
				   [?GMCmdList1, ?GMCmdList2];
			   3 ->
				   [?GMCmdList1, ?GMCmdList2, ?GMCmdList3];
			   55 ->
				   [?GMCmdList1, ?GMCmdList2, ?GMCmdList3, ?GMCmdList4];
			   _ ->
				   []
		   end,
	Fun = fun(L, AccIn) ->
		case lists:keyfind(Cmd, 1, L) of
			{Cmd, Function, _format, _Desc} ->
				{break, Function};
			_ ->
				AccIn
		end
		  end,
	misc:mapAccList(List, undefined, Fun).

-spec execGMCmd(Cmd, Params) -> string() | atom() when
	Cmd :: string(), Params :: list().
execGMCmd(Cmd, Params) ->
	Fun = getGMCmd(Cmd),
	case erlang:is_function(Fun) of
		true ->
			Fun(Params);
		_ ->
			?WARN("Player:~ts Use GM:~p,Fun:~w failed", [playerState:getName(), Cmd, Fun]),
			error_error_error_error
	end.

setprerecharge(Params) when erlang:length(Params) >= 1 ->
	[AmountStr | _Other1] = Params,
	Amount = erlang:list_to_integer(AmountStr),
	psMgr:sendMsg2PS(?PsNamePreRecharge, gmUpdate, {playerState:getAccountID(), Amount}),
	?INFO("setprerecharge[~w]", [Amount]),
	ok.

resetprotectworld(_Params) ->
	RoleID = playerState:getRoleID(),
	core:sendMsgToActivity(?ActivityType_KingBattleAll, gm_setfightallrole, {RoleID, 100000}),
%%	Fun =
%%		fun() ->
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 0}),
%%			startac( ["5", "0"]),
%%			timer:sleep(1000),
%%			FightForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
%%			core:sendMsgToActivity(?ActivityType_KingBattleAll, gm_setfightallrole,{RoleID,100000} ),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "1"]),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "2"]),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "3"]),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "4"]),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "5"])
%%
%%		end,
%%	erlang:spawn(Fun),
	ok.

%%设置战天下镜像血量
setfightallhp(Params) when erlang:length(Params) >= 1 ->
	[HpStr | _Other1] = Params,
	HpNum = string_to_integer(HpStr),
	case HpNum > 0 of
		true ->
			[Row | _] = edb:readAllRecord(rec_guard_mirror),
			NewRow = Row#rec_guard_mirror{
				hpNumber = HpNum
			},
			edb:writeRecord(update_rec_guard_mirror, NewRow),
			edb:clearTable(rec_guard_mirror),
			edb:writeRecord(rec_guard_mirror, NewRow),
			?INFO("setfightallhp[~p]", [HpNum]),
			ok;
		_ ->
			skip
	end,
	ok.

%% 设置角色在当前地图已经复活次数
setReviveNum(Params) ->
	[NumStr] = Params,
	Num = string_to_integer(NumStr),
	case Num >= 0 of
		true ->
			MapPid = playerState:getMapPid(),
			RoleID = playerState:getRoleID(),
			psMgr:sendMsg2PS(MapPid, setReviveNum, {RoleID, Num}),
			ok;
		_ ->
			skip
	end.

%% 获取当前角色已经复活的次数（当前地图中）
getReviveNum() ->
	MapPid = playerState:getMapPid(),
	RoleID = playerState:getRoleID(),
	psMgr:sendMsg2PS(MapPid, getReviveNum, RoleID).

%%启动首领入侵
initWorldBoss(Params) when erlang:length(Params) >= 1 ->
%%	psMgr:sendMsg2PS(?PsNameWorldBOss, initFirst),

%%	core:sendMsgToActivity(?ActivityType_GiveIPad, initFirst, {}),
	playerWorldBossWar:noticeClient(1),
	?INFO("gm initWorldBoss"),
	ok.

lottery(Params) when erlang:length(Params) >= 1 ->
	[MainStr | _Other1] = Params,
	Main = erlang:list_to_integer(MainStr),
%%	10 -> 免费金币单抽  11 ->金币单抽 	110 -> 金币10连
%%	20 -> 免费钻石单抽  21 ->钻石单抽  210 -> 钻石10连
%%	888 -> rst cd
%%	999 -> rst count
	core:setGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Lottery, true),
	if
		Main =:= 10 ->
			playerLottery:requestLottery(true, true, 1);
		Main =:= 11 ->
			playerLottery:requestLottery(true, false, 1);
		Main =:= 110 ->
			playerLottery:requestLottery(true, false, 10);
		Main =:= 20 ->
			playerLottery:requestLottery(false, true, 1);
		Main =:= 21 ->
			playerLottery:requestLottery(false, false, 1);
		Main =:= 210 ->
			playerLottery:requestLottery(false, false, 10);
		Main =:= 888 ->
			playerLottery:gmRstCD();
		Main =:= 999 ->
			playerLottery:gmRstDailyCount();

%%		Main =:= 0 orelse Main =:= 1 ->
%%			IsMain = misc:i2b(Main),
%%			playerLottery:requestLottery(IsMain);
%%		Main =:= 88888 ->
%%			playerDaily:zeroDailyCount(?DailyType_Lottery, 1),
%%			playerDaily:zeroDailyCount(?DailyType_Lottery, 2),
%%%%			playerLottery:resetDestinyStar(misc_time:gregorian_seconds_from_1970()),
%%			"reset success";
%%		Main =:= 99999 ->
%%			%% 指定奖品ID
%%			case Other1 of
%%				[PondStr,OnlyIDStr|_Other2] ->
%%					Pond = erlang:list_to_integer(PondStr),
%%					OnlyID = erlang:list_to_integer(OnlyIDStr),
%%					put('GM_Appoint_Lottery_ItemOnlyID', {Pond, OnlyID}),
%%					"set success";
%%				_ ->
%%					erlang:erase('GM_Appoint_Lottery_ItemOnlyID'),
%%					"set failed"
%%			end;
		true ->
			playerLottery:openLotteryForm()
	end.

dblog(Params) when erlang:length(Params) >= 1 ->
	[Type | _Other1] = Params,
	TypeInt = string_to_integer(Type),
	case TypeInt of
		0 ->
			%% 禁止写DB日志
			core:setGlobalBitVariant(?Setting_GlobalBitVar_WriteLog, false),

			%% 发送消息给DB
			gsSendMsg:sendMsg2LogDBServer(99999, 1),
			ok;
		1 ->
			%% 开放写DB日志
			core:setGlobalBitVariant(?Setting_GlobalBitVar_WriteLog, true),

			%% 发送消息给DB
			gsSendMsg:sendMsg2LogDBServer(99999, 0),
			ok;
		_ ->
			"failed"
	end.

addpebble(Params) when erlang:length(Params) >= 1 ->
	[StrNumber | _Other1] = Params,
	Number = string_to_integer(StrNumber),
	Coin = playerState:getCoin(?CoinTypePebble),
	playerDarkness:addDarknessPebble({playerState:getRoleID(), Coin, Number, 0}),
	ok.

gexpedition(Params) when erlang:length(Params) >= 1 ->
	[StrNumber | _Other1] = Params,
	MapID = string_to_integer(StrNumber),
	playerScene:onRequestEnterMap(MapID),
	ok.

enterdarkness(Params) when erlang:length(Params) >= 1 ->
	[StrNumber | _Other1] = Params,
	Number = string_to_integer(StrNumber),
	playerDarkness:requestEnterDarkness(Number),
	ok.

enterdarkness2(Params) when erlang:length(Params) >= 1 ->
	[StrMapID | _Other1] = Params,
	MapID = string_to_integer(StrMapID),
	playerDarkness:requestEnterDarknessMap(MapID),
	ok.

darknessselectcamp(Params) when erlang:length(Params) >= 1 ->
	[StrCamp | _Other1] = Params,
	Camp = string_to_integer(StrCamp),
	playerDarkness:selectCamp(Camp),
	ok.

darkness(Params) when erlang:length(Params) >= 1 ->
	[StrType | _Other1] = Params,
	Type = string_to_integer(StrType),
	if
		Type =:= 1 ->
			playerDarkness:selfDarkness();
		Type =:= 2 ->
			playerDarkness:openSelectCamp();
		Type =:= 3 ->
			playerDarkness:darknessRank();
		true ->
			skip
	end,
	ok.

sevenmission(Params) when erlang:length(Params) >= 1 ->
	[StrType | _Other1] = Params,
	Type = string_to_integer(StrType),
	if
		Type =:= 0 ->
			playerSevenDays:querySevenMissionData();
		true ->
			playerSevenDays:sevenMissionCompletion(Type)
	end,
	ok.

angelinvestment(Params) when erlang:length(Params) >= 1 ->
	[StrType | _Other1] = Params,
	Type = string_to_integer(StrType),
	if
		Type =:= 0 ->
			playerSevenDays:queryInvestment();
		true ->
			[StrSubType | _] = _Other1,
			SubType = string_to_integer(StrSubType),
			if
				Type =:= 1 ->
					playerSevenDays:angelInvestmentBuy(SubType);
				true ->
					playerSevenDays:angelInvestmentGet(SubType)
			end
	end,
	ok.

freshdarkness(Params) when erlang:length(Params) >= 0 ->
	core:sendMsgToActivity(?ActivityType_Darkness, gm_freshdarkness, 0),
	ok.

%%设置变量位 gm命令 字母被转换为小写了 setBitVariant
setbitvariant(Params) when erlang:length(Params) >= 3 ->
	[VarType0 | Other1] = Params,
	[BitIndex0 | Other2] = Other1,
	[BitValue0 | _Other3] = Other2,
	VarType = string_to_integer(VarType0),
	BitIndex = string_to_integer(BitIndex0),
	BitValue = (string_to_integer(BitValue0) =/= 0),
	Ret = case VarType of
			  0 ->
				  core:setGlobalBitVariant(BitIndex, BitValue);
			  1 ->
				  core:setWorldBitVariant(BitIndex, BitValue);
			  _ ->
				  playerVariant:setPlayerBitVariant(BitIndex, BitValue)
		  end,
	?INFO("Player[~p][~ts] setBitVariant Index[~p] Value[~p] result:~p", [playerState:getRoleID(), playerState:getName(), BitIndex, BitValue, Ret]),
	ok.

setvariant(Params) when erlang:length(Params) >= 3 ->
	[VarType0 | Other1] = Params,
	[BitIndex0 | Other2] = Other1,
	[BitValue0 | _Other3] = Other2,
	VarType = string_to_integer(VarType0),
	Index = string_to_integer(BitIndex0),
	Value = string_to_integer(BitValue0),
	Ret = case VarType of
			  0 ->
				  core:setGlobalVariant(Index, Value);
			  1 ->
				  core:setWorldVariant(Index, Value);
			  3 ->
				  playerVariant:setPlayerVariant(Index, Value);
			  4 ->
				  RealValue = (Value == 1),
				  SetRet = playerVariant:setPlayerBitVariant(Index, RealValue),
				  ?WARN("setvariant setRet:~p,RealValue:~p", [SetRet, RealValue]);
			  _ ->
				  playerVariant:setPlayerVariant(Index, Value)
		  end,
	?INFO("Player[~p][~ts] setBitVariant Index[~p] Value[~p] Result:~p", [playerState:getRoleID(), playerState:getName(), Index, Value, Ret]),
	ok.

%%获取变量
getbitvariant(Params) when erlang:length(Params) >= 2 ->
	[VarType0 | Other1] = Params,
	[BitIndex0 | _Other2] = Other1,
	VarType = string_to_integer(VarType0),
	VarIndex = string_to_integer(BitIndex0),
	case VarType of
		0 ->
			variant:getGlobalBitVariant(VarIndex);
		1 ->
			variant:getWorldBitVariant(gsMainLogic:getServerID(), VarIndex);
		_ ->
			variant:getPlayerBitVariant(playerState:getRoleID(), VarIndex)
	end.

getvariant(Params) when erlang:length(Params) >= 2 ->
	[VarType0 | Other1] = Params,
	[BitIndex0 | _Other2] = Other1,
	VarType = string_to_integer(VarType0),
	VarIndex = string_to_integer(BitIndex0),
	case VarType of
		0 ->
			variant:getGlobalVariant(VarIndex);
		1 ->
			variant:getWorldVariant(gsMainLogic:getServerID(), VarIndex);
		_ ->
			variant:getPlayerVariant(playerState:getRoleID(), VarIndex)
	end.

%% 设置活动开关
setactivity(Params) when erlang:length(Params) >= 2 ->
	[ActivityID_S | Other1] = Params,
	[Value_S | _Other2] = Other1,
	ActivityID = string_to_integer(ActivityID_S),
	Value = string_to_integer(Value_S),
	Ret = activity:setActivitySwitch(ActivityID, Value > 0),
	?INFO("Player[~p][~ts] setactivity ActivityID[~p] Value[~p] Result:~p",
		[playerState:getRoleID(), playerState:getName(), ActivityID, Value, Ret]),
	Ret.

%% 查询活动开关
queryactivity(Params) when erlang:length(Params) >= 1 ->
	[ActivityID_S | _Other1] = Params,
	ActivityID = string_to_integer(ActivityID_S),
	Ret = activity:queryActivitySwitch(ActivityID),
	Ret.

addcoin(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MoneyType = string_to_integer(SValue1),
	Money = string_to_integer(SValue2),
	addMoney(MoneyType, Money),
	ok.

%%购买副本进入次数
buyactioncount(Params) when erlang:length(Params) >= 1 ->
	[MapId|_Other] = Params,
	%%playerActivity:buyActionCount(string_to_integer(MapId)),
	%%首领入侵鼓舞
	playerActivity:inspire(string_to_integer(MapId)),
	ok.

%% 购买副本奖励
buycopyreward([MapSubType_ | _]) ->
	MapSubType = erlang:list_to_integer(MapSubType_),
	playerCopyMapReward:buyChallengeCopyReward(MapSubType).

%%清空进入副本次数和购买次数
cleancopycount(Params) when erlang:length(Params) >= 1 ->
	[MapID|_Other] = Params,
	CopyMapID = string_to_integer(MapID),
	#mapsettingCfg{type = ?MapTypeCopyMap, daily_entercount_group = V} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),
	playerDaily:reduceDailyCounter(?DailyType_EnterCopyMap, CopyMapID, playerDaily:getDailyCounter(?DailyType_EnterCopyMap, CopyMapID)),
	playerDaily:reduceDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID, playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID)),
	case V of
		0 ->
			ok;
		_ ->
			playerDaily:reduceDailyCounter(?DailyType_EnterCopyMapGroup, V, playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, V)),
			playerDaily:reduceDailyCounter(?DailyType_BuyCopyMapGroup_Number, V, playerDaily:getDailyCounter(?DailyType_BuyCopyMapGroup_Number, V))
	end.

%%清空进入竞技场次数和购买次数
cleanladder1v1(Params) when erlang:length(Params) == 0 ->
	playerDaily:reduceDailyCounter(?DailyType_Ladder1v1, 2, playerDaily:getDailyCounter(?DailyType_Ladder1v1, 2)),
	playerDaily:reduceDailyCounter(?DailyType_Ladder1v1, 3, playerDaily:getDailyCounter(?DailyType_Ladder1v1, 3)),
	ok.

setupAnchor(Params) when erlang:length(Params) >= 1 ->

	playerAnchor:setupAnchor(Params),
	ok.

recharge([SValue1|_Other1]) ->
%%	{_, _, OrderID} = os:timestamp(),
	OrderID = time2:getTimestampSec(),
	BusinessID = erlang:list_to_integer(SValue1),
	case ets:lookup(ets_business, BusinessID) of
		[#rec_business{platformItemID = PID, claimGold = Diamond, claimMoney = Money}] ->
			ParseData =
				#rec_http_msg_recharge_info{character_id = playerState:getRoleID(),
					orderid = erlang:integer_to_binary(OrderID),
					amount = Diamond,
					purchasetoken = <<"GM_test">>,
					currency_amount = Money,
					item_id = erlang:list_to_binary(PID),
					item_amount = 1,
					currency = "GM",
					excess_amount = 0,
					excess_money = 0,
					provider_orderid = OrderID - 1000,
					gift = <<"0">>,
					comments = BusinessID,
					category = ""
				},

			?PsNameRecharge ! {<<"new_recharge_msg_coming">>, ParseData, self()},
			ok;
		_ ->
			skip
	end.

recharge3([ID_, Money_, Value_, FromID_ | _]) ->
	ID = erlang:list_to_integer(ID_),
	Money = erlang:list_to_float(Money_),
	Value = erlang:list_to_integer(Value_),
	FromID = erlang:list_to_integer(FromID_),
	playerRecharge2:recharge3(ID, Money, Value, FromID).

recharge_restore([Types|_]) ->
	case erlang:list_to_integer(Types) of
		1 ->
			playerRecharge2:fixLostBusiness1();
		10 ->
			playerRecharge2:fixLostBusiness10();
		_ ->
			skip
	end.

recharge2([ItemID|_Other1]) ->
%%	{_, _, OrderID} = os:timestamp(),
	OrderID = time2:getTimestampSec(),
	BusinessID = businessInterface:queryBusinessID(ItemID),
	case ets:lookup(ets_business, BusinessID) of
		[#rec_business{platformItemID = PID, claimGold = Diamond, claimMoney = Money}] ->
			ParseData =
				#rec_http_msg_recharge_info{character_id = playerState:getRoleID(),
					orderid = erlang:integer_to_binary(OrderID),
					amount = Diamond,
					purchasetoken = <<"GM_test">>,
					currency_amount = Money,
					item_id = erlang:list_to_binary(ItemID),
					item_amount = 1,
					currency = "GM",
					excess_amount = 0,
					excess_money = 0,
					provider_orderid = OrderID - 1000,
					gift = <<"0">>,
					comments = BusinessID,
					category = ""
				},

			?PsNameRecharge ! {<<"new_recharge_msg_coming">>, ParseData, self()},
			ok;
		_ ->
			skip
	end.

recharge_(_) ->
	Fun =
		fun(BusinessID, OrderID) ->
			case ets:lookup(ets_business, BusinessID) of
				[#rec_business{platformItemID = PID, claimGold = Diamond, claimMoney = Money}] ->
					ParseData =
						#rec_http_msg_recharge_info{character_id = playerState:getRoleID(),
							orderid = erlang:integer_to_binary(OrderID),
							amount = Diamond,
							purchasetoken = <<"GM_test">>,
							currency_amount = Money,
							item_id = erlang:list_to_binary(PID),
							item_amount = 1,
							currency = "GM",
							excess_amount = 0,
							excess_money = 0,
							provider_orderid = OrderID - 1000,
							gift = <<"0">>,
							comments = BusinessID,
							category = ""
						},
					?PsNameRecharge ! {<<"new_recharge_msg_coming">>, ParseData, self()};
				_ ->
					skip
			end,
			OrderID + 1
		end,
	lists:foldl(Fun, time2:getTimestampSec(), [9002, 8001, 6002, 7001, 7002, 7003, 6002, 50001, 50002, 50003, 7001, 7002, 7003, 7001, 7002, 7003, 7001, 7002, 7003, 7001, 7002, 7003]).

rebate(_) ->
	rechargeBackLogic:gmRebate().

%%	Msg1 = {rec_http_msg_recharge_info,
%%		165,30.0,30.0,
%%		30.0,<<"NT$">>,
%%		60.0,<<"0">>,1,
%%		<<"props">>,
%%		<<"50999">>,
%%		playerState:getRoleID(),
%%		1,
%%		<<"V71B0Q6R5Y">>,
%%		<<"luna_20180125_30daily_twd">>,
%%		<<>>,7001,
%%		<<"10349">>,
%%		<<"12018033000000023">>,
%%		0.0,0,0,
%%		<<"2018-03-30 15:19:14">>,
%%		<<"9JUL8ggSKHYQ4cF-X05cJyJHV64wJoU0qGEJZilwzAIesUkRMm-T0i2um8dS_iq5YnoJoBWQn-SafKCDbO5xy7JBHbIshV9NZWjhvVLaaEyPyrGKoJXI5qxvGWmiGSKH">>},
%%	Msg2 = {rec_http_msg_recharge_info,
%%		165,30.0,30.0,
%%		30.0,<<"NT$">>,
%%		60.0,<<"0">>,1,
%%		<<"props">>,
%%		<<"50999">>,
%%		playerState:getRoleID(),
%%		1,
%%		<<"BH1B0RX0D6">>,
%%		<<"luna_20180125_30daily_twd">>,
%%		<<>>,7001,
%%		<<"10349">>,
%%		<<"12018033000000030">>,
%%		0.0,0,0,
%%		<<"2018-03-30 16:07:39">>,
%%		<<"a_RwAbzsRWnJpmoQe1LXXXp0XNgyvrPWJ9qqGTHZgWkqjxIY64q7Epp7JoMuYzFPt2jGEEAQjx0r1IMaGlnBOACmPnjyXwau6KElBLLwWP7_Wm7esxRYDuutiiy18C5h">>},
%%	?PsNameRecharge ! {<<"new_recharge_msg_coming">>, Msg1, self()},
%%	?PsNameRecharge ! {<<"new_recharge_msg_coming">>, Msg2, self()}.



%%-ifdef(RELEASE).
%% addMoney(MoneyType,Money) ->
%% 	List = [?CoinTypeDiamond,?CoinTypeBindDiamond,?CoinTypeScore],
%% 	case lists:member(MoneyType,List) of
%% 		true ->
%% 			%%RELEASE版本不能增加这些货币
%% 			?WARN("Player:~ts ID:~p GM AddMoney skip",[playerState:getName(),playerState:getRoleID()]),
%% 			skip;
%% 		_ ->
%% 			playerMoney:addCoin(MoneyType, Money, #recPLogTSMoney{reason=?CoinSourceOnlineGM,param=playerState:getRoleID(),target=?PLogTS_PlayerSelf,source=?PLogTS_GMSystem})
%% 	end,
%% 	ok.
%% -else.
addMoney(?CoinTypeLockDiamond, Money) ->
	playerMoney:lockDiamond(Money,
		#recPLogTSMoney{reason = ?CoinSourceOnlineGM, param = playerState:getRoleID(), target = ?PLogTS_PlayerSelf, source = ?PLogTS_GMSystem});
addMoney(MoneyType, Money) ->
	playerMoney:addCoin(MoneyType, Money,
		#recPLogTSMoney{reason = ?CoinSourceOnlineGM, param = playerState:getRoleID(), target = ?PLogTS_PlayerSelf, source = ?PLogTS_GMSystem}),
	ok.
%%-endif.

deccoin(Params) when erlang:length(Params) =:= 1 ->
	[SValue1 | _Other1] = Params,
	MoneyType = string_to_integer(SValue1),
	case MoneyType of
		?CoinTypeLockDiamond ->
			playerMoney:unlockDiamond(playerState:getCoin(MoneyType), #recPLogTSMoney{reason = ?CoinSourceOnlineGM, param = playerState:getRoleID(), target = ?PLogTS_PlayerSelf, source = ?PLogTS_GMSystem});
		_ ->
			CoinUseType = playerMoney:coinType2CoinUseType(MoneyType),
			playerMoney:useCoin(CoinUseType, playerState:getCoin(MoneyType),
				#recPLogTSMoney{reason = ?CoinSourceOnlineGM, param = playerState:getRoleID(), target = ?PLogTS_GMSystem, source = ?PLogTS_PlayerSelf})
	end,
	ok;
deccoin(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MoneyType = string_to_integer(SValue1),
	Money = string_to_integer(SValue2),
	CoinUseType = playerMoney:coinType2CoinUseType(MoneyType),
	playerMoney:useCoin(CoinUseType, Money,
		#recPLogTSMoney{reason = ?CoinSourceOnlineGM, param = playerState:getRoleID(), target = ?PLogTS_GMSystem, source = ?PLogTS_PlayerSelf}),
	ok.

setcoin([StrCoinType, StrCoinNum | _]) ->
	CoinType = erlang:list_to_integer(StrCoinType),
	CoinNum = erlang:list_to_integer(StrCoinNum),
	case CoinType >= ?CoinTypeMin andalso CoinType =< ?CoinTypeMax of
		true when CoinNum >= 0 ->
			playerState:setCoin(CoinType, CoinNum),
			playerMsg:sendNetMsg(#pk_GS2U_PlayerChangedWealth{
				type = CoinType,
				wealth = CoinNum,
				reason = ?CoinSourceOnlineGM
			});
		_ ->
			error
	end.

querycoin(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MoneyType = string_to_integer(SValue1),
	Value = case MoneyType >= ?CoinTypeMin andalso MoneyType =< ?CoinTypeMax of
				true ->
					playerState:getCoin(MoneyType);
				_ ->
					-1
			end,
	io_lib:format("querycoin:Type=~p, Value=~p", [MoneyType, Value]).

%% 设置玩家的公共属性
setprop(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	case string_to_integer(SValue1) of
		?SerProp_Business ->
			playerPropSync:setAny(?SerProp_Business, []);
		PropIndex ->
			case playerPropSync:getPropType(PropIndex) of
				?PropType_INT ->
					Value = string_to_integer(SValue2),
					playerPropSync:setInt(PropIndex, Value),
					io_lib:format("setprop int ~p:~p", [PropIndex, Value]);
				?PropType_INT64 ->
					Value = string_to_integer(SValue2),
					playerPropSync:setInt64(PropIndex, Value),
					io_lib:format("setprop int64 ~p:~p", [PropIndex, Value]);
				?PropType_FLOAT ->
					Value = erlang:list_to_float(SValue2),
					playerPropSync:setFloat(PropIndex, Value),
					io_lib:format("setprop float ~p:~p", [PropIndex, Value]);
				?PropType_STRING ->
					playerPropSync:setString(PropIndex, SValue2),
					io_lib:format("setprop string ~p:~ts", [PropIndex, SValue2]);
				?PropType_Any ->
					Term = misc:string_to_term(SValue2),
					playerPropSync:setAny(PropIndex, Term);
				ValueType ->
					io_lib:format("setprop undefined ~p,~p:~ts", [ValueType, PropIndex, SValue2])
			end
	end.

%% 查询玩家身上的属性
queryprop(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	PropIndex = string_to_integer(SValue1),
	Value = playerPropSync:getProp(PropIndex),
	case playerPropSync:getPropType(PropIndex) of
		?PropType_STRING ->
			io_lib:format("queryprop: type = ~p, value = ~p", [?PropType_STRING, Value]);
		ValueType ->
			io_lib:format("queryprop: type = ~p, value = ~p", [ValueType, Value])
	end.

%% 开启一个计时
startclock(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	Type = string_to_integer(SValue1),
	OffTime = string_to_integer(SValue2),
	LengthTime = string_to_integer(SValue3),
	playerClock:startClock(Type, 1, OffTime, LengthTime),
	ok.
%% 删除一个计时
delclock(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _] = Params,
	Type = string_to_integer(SValue1),
	playerClock:delClock(Type, 1),
	ok.

%% 开启一个计时
queryclock(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	SubType = string_to_integer(SValue2),
	V = playerClock:getClock(Type, SubType),
	io_lib:format("queryclock:~p,~p,~p", [Type, SubType, V]).

%% 添加爵位声望
addvip(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	playerVip:gmBuy(Value).

queryvip([SValue1 | Other1]) ->
	Value = string_to_integer(SValue1),
	case Other1 of
		[] ->
			playerVipInter:gm_getVipEffect(Value, 0);
		[SValue2|_] ->
			playerVipInter:gm_getVipEffect(Value, string_to_integer(SValue2))
	end.

%%获得所有称号
alltitle(_Params) ->
	AllTitleID = getCfg:get1KeyList(cfg_titlesystem),
	Fun = fun(ID) ->
		TitleCfg = getCfg:getCfgPStack(cfg_titlesystem, ID),
		case TitleCfg#titlesystemCfg.time > 0 of
			true ->
				psMgr:sendMsg2PS(?PsNamePlayerMgr, addTitle, [{playerState:getRoleID(), ID}]);
			_ ->
				playerTitle:addTitle(ID, ?TitleSourceGM)
		end
		  end,
	lists:foreach(Fun, AllTitleID),
	ok.

arunaphase(_Params) ->
	arunaInter:getArunaPhase().

enteraruna(_Params) ->
	playerAruna:requestEnterAruna(0),
	ok.

setaruna([Phases, Schedules | _Params]) -> ok.
%%	Phase = string_to_integer(Phases),
%%	Schedule = string_to_integer(Schedules),
%%	ScheduleWorld = #ww_world_schedule{phase = PhaseOld, schedule = ScheduleOld} = arunaInter:getArunaWorldSchedule(),
%%	memDBCache:dirtySaveSundries(?Sundries_ID_WorldWar, 1, ScheduleWorld#ww_world_schedule{phase = Phase, schedule = Schedule}),
%%	io_lib:format("phase[~p->~p], schedule[~p->~p]", [PhaseOld, Phase, ScheduleOld, Schedule]).

uplevelaruna(_Params) ->
	arunaNormal:checkScheduleValueAndTurnPhase1(),
	ok.

arunataskup(_Params) ->
	playerAruna:msg(#pk_U2GS_AtuoSubmitTask{}),
	ok.

queryarunalvl(_Params) ->
	playerAruna:initWorldMaxLevel().

addaruna([Values|_Params]) ->
	Value = string_to_integer(Values),
	arunaNormal:addPhaseScheduleValue(Value, 0).

addconb([Values|_Params]) ->
	playerAruna:submitSamplePoint(0, string_to_integer(Values)),
	ok.

addsample([Values|_Params]) ->
	Value = string_to_integer(Values),
	case activityMgrLogic:getActivityChildProcessName(?ActivityType_WorldWar) of
		error ->
			skip;
		ProcessName ->
			case getCfg:getCfgByKey(cfg_activity, ?ActivityType_WorldWar) of
				#activityCfg{} ->
					psMgr:cast(ProcessName, gm_addPlayerSampleValue, {playerState:getRoleID(), Value})
			end
	end.

addrune(Params) when erlang:length(Params) >= 3 ->
	[RuneStr | Other1] = Params,
	[NumStr | Other2] = Other1,
	[BindStr | _Other3] = Other2,
	RuneID = string_to_integer(RuneStr),
	Num = string_to_integer(NumStr),
	IsBind = misc:i2b(string_to_integer(BindStr)),
	playerRune:dropRune(RuneID, Num, IsBind),
	ok.

setarunaacphase([AcPhases|_Params]) ->
	AcPhase = string_to_integer(AcPhases),
	Is =
		case core:isCross() of
			true ->
				case AcPhase of
					3 -> true;
					2 -> true;
					-1 -> true;
					_ -> false
				end;
			_ ->
				false
		end,
	case Is of
		true ->
			core:sendMsgToActivity(?ActivityType_WorldWar, gm_setarunaacphase, {playerState:getMapPid(), AcPhase});
		_ ->
			skip
	end.

fresharunatask(_Params) ->
	playerAruna:resetArunaTaskAck(0).

additem(Params) when erlang:length(Params) >= 2 ->
	[SzItemID | Other1] = Params,
	[SzItemNum | Other2] = Other1,

	{_IsBind, Quality} = case Other2 of
							 [] ->
								 {false, 0};
							 [SzIsBind | Other3] ->
								 {IIsBind, _R} = string:to_integer(SzIsBind),
								 IsBind0 = IIsBind > 0,
								 case Other3 of
									 [] ->
										 {IsBind0, 0};
									 [SzQuality | _] ->
										 {Q, _} = string:to_integer(SzQuality),
										 {IsBind0, Q}
								 end
						 end,
	{ItemID, _Rest} = string:to_integer(SzItemID),
	{ItemNum, _} = string:to_integer(SzItemNum),
	PLog = #recPLogTSItem{
		old = 0,
		new = ItemNum,
		change = ItemNum,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_GMSystem,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourceGM,
		reasonParam = playerState:getRoleID()
	},
	playerPackage:addGoods(ItemID, ItemNum, false, Quality, PLog),
	ok.

%%添加家具GM
addfurniture(Params)when erlang:length(Params) >= 3 ->

	[Start | Other1] = Params,
	[Len | Other2] = Other1,
	[Num | _Other3] = Other2,
	Start_index = case string_to_integer(Start) >3  of
					  true ->string_to_integer(Start);
					  _->
						  4
				  end,
	Len_0 = string_to_integer(Len),
	Num_0 = string_to_integer(Num),
	Key1List = getCfg:get1KeyList(cfg_home_furniture),
	ListLen = erlang:length(Key1List),

	NeedAddLen =  ListLen - Start_index - Len_0,
	case NeedAddLen >0 of
		true ->

			NewKeyList =  lists:nthtail(Start_index,Key1List),
			NeedKeyList = lists:sublist(NewKeyList,Len_0),
			PLog = #recPLogTSItem{
				old = 0,
				new = Num_0,
				change = Num_0,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_GMSystem,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourceGM,
				reasonParam = playerState:getRoleID()
			},
			F = fun(ItemID)->
				playerPackage:addGoods(ItemID, Num_0, false, 0, PLog)
				end,
			lists:foreach(F, NeedKeyList),
			NeedAddLen;
		_->
			skip
	end,
	ok.


gm_setLineMaxNum(Params)->
	[Num | Other1] = Params,
	N = string_to_integer(Num),
	playerNightNvasion:gm_setLineMaxNum(N),
	ok.

% 查询元气值
getawakevigor(_) ->
	playerPropSync:getProp(?PriProp_VigourValue).

% 增加元气值
addawakevigor(Params) when Params >= 1 ->
	[V | _] = Params,
	AddValue = 	erlang:list_to_integer(V),
	playerAwake:addVigor(AddValue).

% 获取觉醒激活信息
getawakestone(_) ->
	playerPropSync:getProp(?SerProp_CurRoleAwakeInfo).

% 激活觉醒
awakeingstone(Params) when Params >= 1 ->
	[V | _] = Params,
	Value = erlang:list_to_integer(V),
	playerAwake:roleAwakeing(0,0,Value).

% 使用觉醒buff
useawakebuff(_) ->
	playerAwake:useTheAwakeBuff().

% 停止觉醒buff
stopawakebuff(_) ->
	playerAwake:stopTheAwakeBuff().

% 增加觉醒buff的时间
addawaketime(Params) when Params >= 1 ->
	[V | _] = Params,
	Value = erlang:list_to_integer(V),
	playerAwake:updateAwakeBuff(time,Value).

% 经验兑换元气值
exptovigor(Params) when Params >= 1 ->
	[V | _] = Params,
	Value = erlang:list_to_integer(V),
	playerAwake:expToVigour(Value).

% 模拟4点重置
resetbuffeveryday(_) ->
	playerAwake:resetBuffEveryDay().

% 重置觉醒
resetroleawake(_) ->
	playerAwake:resetRoleAwake().

% 获取buff信息
getawakebuffinfo(_) ->
	playerAwake:getAwakeBuffInfo().

% 忽略该好友
igetback(Params) when Params >= 1 ->
	[V | _] = Params,
	ID = erlang:list_to_integer(V),
	playerFriend:msg(#pk_U2GS_Friend2GetBack_Ignore{id = ID}).

% 添加一个找回好友
agetback(Params) when Params >= 1 ->
	[V | _] = Params,
	ID = erlang:list_to_integer(V),
	playerFriend:msg(#pk_U2GS_Friend2GetBack_Add{id = ID}).

% 一键添加找回好友
ogetback(_) ->
	playerFriend:msg(#pk_U2GS_Friend2GetBack_OneKeyToAdd{}).

marriagetitle(Params) when erlang:length(Params) >= 1 ->
	[SValue | _Other] = Params,
	playerTitle:useItemToAddTitle(#pk_U2GS_UseMarriageTitleItem{itemUID = 0, useNum = 1, text = SValue}),
	ok.

setmatitle(Params) when erlang:length(Params) >= 1 ->
	[SValue | _Other] = Params,
	playerTitle:changeTitleText(#pk_U2GS_ChangeCustomTitleText{titleID = 0, type = ?TitleType1_Marriage, text = SValue}),
	ok.

dpswcc(_) ->
	playerSkillLearn:dealPassiveSkillWhenCareerChange(),
	ok.

upcpskill(Params) when Params >= 1 ->
	[V | _] = Params,
	SkillID = erlang:list_to_integer(V),
	playerSkillLearn:upPassiveSkill(SkillID),
	ok.

cpskillpiaozi(Params) when Params >= 1 ->
	[V | _] = Params,
	SkillID = erlang:list_to_integer(V),
	playerMsg:sendNetMsg(#pk_GS2U_TriggerPassiveSkill{id = SkillID, level = 1}),
	ok.

deletewedding(Params)->
	[SValue | _Other] = Params,
	Value = erlang:list_to_integer(SValue),
	playerWedding:gmDeleteApointmentWedding(Value),
	ok.


delrideitem(_Params) ->
	playerRide:gm_deleteAllRideItem().

recycleride(_Params) ->
	playerRide:gm_recycleride().

changeridenumber([ItemUIDStr, NumberStr | _Param]) ->
	ItemUID = string_to_integer(ItemUIDStr),
	Number = string_to_integer(NumberStr),
	psMgr:sendMsg2PS(?RideOtp, gm_changeTimes, {ItemUID, Number, playerState:getNetPid()}),
	ok.

baseprop(Params) when erlang:length(Params) >= 1 ->
	[Type | _Other1] = Params,
	TypeInt = string_to_integer(Type),
	V1 = playerState:getBattlePropBase(TypeInt),
	V2 = playerState:getBattlePropTotal(TypeInt),
	io_lib:format("baseprop:type=[~p],initvalue=~p,nowvalue=~p", [TypeInt, V1, V2]).

setbaseprop(Params) when erlang:length(Params) >= 2 ->
	[Type | Other1] = Params,
	[Value | _Other2] = Other1,
	TypeInt = string_to_integer(Type),
	ValueInt = string_to_integer(Value),
	playerState:setBattlePropTotal(TypeInt, erlang:float(ValueInt)),
	ok.

extprop1(Params) when erlang:length(Params) >= 1 ->
	[Type | _Other1] = Params,
	TypeInt = string_to_integer(Type),
	V1 = playerState:getBattlePropAdd(TypeInt),
	V2 = playerState:getBattlePropTotal(TypeInt),
	io_lib:format("extprop1:type=[~p],initvalue=~p,nowvalue=~p", [TypeInt, V1, V2]).

extprop2(Params) when erlang:length(Params) >= 1 ->
	[Type | _Other1] = Params,
	TypeInt = string_to_integer(Type),
	V1 = playerState:getBattlePropPC(TypeInt),
	V2 = playerState:getBattlePropTotal(TypeInt),
	io_lib:format("extprop2:type=[~p],initvalue=~p,nowvalue=~p", [TypeInt, V1, V2]).

queryitem(Params) when erlang:length(Params) >= 2 ->
	[SzBagType | Other1] = Params,
	[SzItemUID | _] = Other1,
	Item = playerPackage:getGoodsByUID(string_to_integer(SzItemUID), string_to_integer(SzBagType)),
	?DEBUG("queryItem:~p", [Item]),
	ok.

sethp(Params) when erlang:length(Params) >= 1 ->
	[HPs | _Other1] = Params,
	HP = string_to_integer(HPs),
	HHP = case HP > 0 of
			  true -> HP;
			  _ ->
				  playerState:getMaxHp()
		  end,
	playerBase:setHpDirect(HHP),
	io_lib:format("curhp:~p, maxhp:~p", [playerState:getCurHp(), playerState:getMaxHp()]).

setlevel(Params) when erlang:length(Params) >= 1 ->
	[SzLevel | _] = Params,
	?INFO("setlevel gm..."),
	{Level, _Rest} = string:to_integer(SzLevel),
	LevelList = getCfg:get1KeyList(cfg_indexFunction),
	Max = lists:max(LevelList),
	Level2 = erlang:min(Level, Max),
	Level3 = erlang:min(Level2, playerState2:getWorldMaxLevel()),
	case playerState:getLevel() < Level3 of
		true ->
			AddExp = playerBase:getAddExp(playerState:getLevel(), playerState:getCurExp(), Level3),
			SetLevel = playerBase:setLevel(Level3, true),
			playerMsg:sendMsgToNearPlayer(#pk_GS2U_PlayerLevelUp{
				code = playerState:getPlayerCode(),
				curExp = 0,
				maxExp = playerState:getMaxExp(),
				addExp = AddExp,
				addPercent = 0,
				level = SetLevel
			}, true),
			"setlevel success";
		_ ->
			"setlevel falied"
	end.

%% execGM("loadgoods",Params) when erlang:length(Params) >= 1 ->
%% 	[SzGoodsUID|_] = Params,
%%     {GoodsUID, _Rest} = string:to_integer(SzGoodsUID),
%% 	ok;

splititem(Params) when erlang:length(Params) >= 2 ->
	[SzGoodsUID | Other] = Params,
	[SzNum | _] = Other,
	{GoodsUID, _Rest} = string:to_integer(SzGoodsUID),
	{Num, _R} = string:to_integer(SzNum),
	Plog = #recPLogTSItem{
		old = 0,
		new = Num,
		change = Num,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourceGM,
		reasonParam = 0
	},
	ItemID = case edb:readRecord(rec_item, GoodsUID) of
				 [#rec_item{itemID = ID}] -> ID;
				 _ -> 0
			 end,
	playerPackage:splitItem(GoodsUID, ItemID, Num, true, Plog),
	ok.

%% 领取任务但不触发成就任务的完成检查
addtask(Params) when erlang:length(Params) >= 3 ->
	[SzTaskID | _] = Params,
	{TaskID, _Rest} = string:to_integer(SzTaskID),
	playerTask:gmAddTaskWithoutAchieve(TaskID, true),
	ok;
%% 强制接受任务
addtask(Params) when erlang:length(Params) >= 2 ->
	[SzTaskID | _] = Params,
	{TaskID, _Rest} = string:to_integer(SzTaskID),
	playerTask:gmForceAddTask(TaskID),
	ok;
%%接受任务
addtask(Params) when erlang:length(Params) >= 1 ->
	[SzTaskID | _] = Params,
	{TaskID, _Rest} = string:to_integer(SzTaskID),
	playerTask:acceptTask(TaskID, 0),
	ok.

resettask(Params) when erlang:length(Params) >= 1 ->
	[SzTaskID | _] = Params,
	{TaskID, _Rest} = string:to_integer(SzTaskID),
	playerTask:resetTask(TaskID),
	ok.

getalltask(_) ->
	List =
		lists:foldl(
			fun(#rec_task{taskID = ID}, R) ->
				[ID | R]
			end,
			[],
			playerState:getAcceptedTask()
		),
	io_lib:format("listID:~w", [List]).

%%提交任务
submittask(Params) when erlang:length(Params) >= 1 ->
	[SzTaskID | _] = Params,
	{TaskID, _Rest} = string:to_integer(SzTaskID),
	case erlang:is_integer(TaskID) andalso TaskID > 0 of
		true ->
			playerTask:gmSubmitTask(TaskID);
		_ ->
			skip
	end,
	ok.

%%提交任务
submittask2(Params) when erlang:length(Params) >= 1 ->
	ok.

submitTaskAll(Params) when erlang:length(Params) >= 1 ->
	[SzTaskID | _] = Params,
	{MaxTaskID, _Rest} = string:to_integer(SzTaskID),
	lists:foreach(
		fun(TaskID) ->
			playerTask:gmAddCompleteTask(TaskID)
		end, lists:seq(1, MaxTaskID)),
	playerTask:acceptTask(MaxTaskID + 1, 0),
	ok.

handintask(Params) when erlang:length(Params) >= 1 ->
	[TaskIDStr | T] = Params,
	TaskID = erlang:list_to_integer(TaskIDStr),
	#taskCfg{target_conf = [ItemID, _ItemCount], target_conf_params = [NpcID, _]} = getCfg:getCfgPStack(cfg_task, TaskID),
	case T of
		[] ->
			Q = ets:fun2ms(fun(#recMapObject{id = ID, code = Code}) when ID =:= NpcID -> Code end),
			case ets:select(playerState:getMapNpcEts(), Q) of
				[] ->
					skip;
				[Code|_] ->
					playerTask:handIn(TaskID, ItemID, 1, Code)
			end;
		_ ->
			playerTask:handIn(TaskID, ItemID, 1, gm)
	end.

canceltask([TaskIDStr | _]) ->
	TaskID = erlang:list_to_integer(TaskIDStr),
	playerTask:gmCancelTask(TaskID);
canceltask(_) ->
	[playerTask:gmCancelTask(TaskID) || #rec_task{taskID = TaskID} <- playerState:getAcceptedTask()],
	playerLoopTask:gmReset(),
	playerPropSync:setAny(?SerProp_LoopTaskProcess, []),
	playerPropSync:setAny(?SerProp_LoopTaskState, {misc_time:localtime_seconds(), 0, 0}),
	playerDaily:zeroDailyCount(?DailyType_ExpTask),
	ok.

submitexptask(_) ->
	playerTask:gmSubmitExpTaskCur().


querytask(Params) when erlang:length(Params) >= 1 ->
	[TaskIDStr | _T] = Params,
	TaskID = erlang:list_to_integer(TaskIDStr),
	L1 = playerState:getAcceptedTask(),
	case TaskID > 0 of
		true ->
			case lists:keyfind(TaskID, #rec_task.taskID, L1) of
				#rec_task{} = Task ->
					Task;
				_ ->
					skip
			end;
		_ ->
			F =
				fun(#rec_task{taskID = TID, taskTargetCur = Cur, taskTargetMax = Max}, Acc) ->
					io_lib:format("~ts,~p(~p)", [Acc, TID, Cur >= Max])
				end,
			lists:foldl(F, "", L1)
	end.

%%开启觉醒功能
wakeup(_Params) ->
%%	playerGoddess:gmWakeUp(),
	ok.

%% 查询交易行订单
querytrade(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _] = Other2,
	R = #pk_U2GS_QueryTrade{
		tradeClass = string_to_integer(SValue1),
		itemClass = string_to_integer(SValue2),
		itemTypeList = [],
		itemSubType = -1,
		itemList = [],
		itemLvlMin = -1,
		itemLvlMax = -1,
		itemQuality = -1,
		oneNumber = string_to_integer(SValue3)
	},
	playerTrade:queryTrade(R),
	ok.

%% 查询最新交易行订单
querynewesttrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _] = Other2,
	R = #pk_U2GS_QueryNewestTrade{
		tradeClass = string_to_integer(SValue1),
		getNumber = string_to_integer(SValue2),
		oneNumber = string_to_integer(SValue3)
	},
	playerTrade:queryNewestTrade(R),
	ok.

%% 查询下一页
nexttrade(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _] = Params,
	Value1 = string_to_integer(SValue1),
	%% 查询指定页
	playerTrade:nextResult(Value1, 0),
	ok.

%% 打印查询结果
printtrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _] = Other1,
	%% 查询指定页
	playerTrade:printTradeArray(string_to_integer(SValue1), string_to_integer(SValue2)),
	ok.

%% 打印排行榜
printrank(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type >= ?PlayerRankType_Start andalso Type =< ?PlayerRankType_End of
		true ->
			List = myEts:lookUpEts(?TABLE_RankInfo, Type),
			?DEBUG("printrank:~p", [List]);
		_ ->
			skip
	end,
	ok.

%% 打印排行榜个数
printranknum(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type >= ?PlayerRankType_Start andalso Type =< ?PlayerRankType_End of
		true ->
			List = myEts:lookUpEts(?TABLE_RankInfo, Type),
			Str = io_lib:format("printranknum:~p", [erlang:length(List)]),
			?DEBUG("~ts", [Str]),
			Str;
		_ ->
			skip
	end.

%% 立即刷新某类型的排行榜
freshrank(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type >= ?PlayerRankType_Start andalso Type =< ?PlayerRankType_End of
		true ->
			psMgr:sendMsg2PS(?PsNameRank, immediatelyFreshRank, Type),
			"send freshrank success!";
		_ ->
			"send freshrank failed!"
	end.
freshrankandtick(Params) when erlang:length(Params) >= 1 ->
	?DEBUG("here"),
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type =:= 1 of
		true ->
			psMgr:sendMsg2PS(?PsNameRank, freshrankandtick, {}),
			"send freshrankandtick success!";
		_ ->
			"send freshrankandtick failed!"
	end.

%% 立即刷新所有类型的排行榜
freshrankall(Params) when erlang:length(Params) >= 0 ->
	L = getCfg:get1KeyList(cfg_rank),
	Fun = fun(Type) ->
		case getCfg:getCfgByArgs(cfg_rank, Type) of
			#rankCfg{fresh_cycle = Time} when erlang:is_integer(Time) andalso Time > 0 ->
				%%不刷勇者试炼榜，在周一刷榜会发奖励
				case Type =:= ?PlayerRankType_WarriorTrial of
					true ->
						skip;
					_ ->
						psMgr:sendMsg2PS(?PsNameRank, immediatelyFreshRank, Type)
				end;
			_ -> skip
		end
		  end,
	lists:foreach(Fun, L),
	ok.

%%% 请求排行榜领奖
%rankreward(Params) when erlang:length(Params) >= 1 ->
%	[SValue1 | _Other1] = Params,
%	Type = string_to_integer(SValue1),
%	playerRank:requestRankAward(Type).

%% 排序
sorttrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _] = Other1,
	R = #pk_U2GS_ResultSort{
		sortIndex = string_to_integer(SValue1),
		pageNumber = string_to_integer(SValue2)
	},
	playerTrade:sortTradeQueryResult(R),
	ok.

%% 购买订单
buytrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _] = Other1,
	playerTrade:buyTrade(#pk_U2GS_TradeBuy{tradeClass = string_to_integer(SValue1), orderID = string_to_integer(SValue2)}),
	ok.

%% 上架订单
puttrade(Params) when erlang:length(Params) >= 8 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | Other5] = Other4,
	[SValue6 | Other6] = Other5,
	[SValue7 | Other7] = Other6,
	[SValue8 | _Other8] = Other7,
	R = #pk_U2GS_PutTrade{
		tradeClass = string_to_integer(SValue1),
		itemUID = string_to_integer(SValue2),
		itemID = string_to_integer(SValue3),
		sellNumber = 233,
		sellTime = string_to_integer(SValue4),
		gold = string_to_integer(SValue5),
		diamond = string_to_integer(SValue6),
		destRoleName = SValue7,
		opCode = string_to_integer(SValue8)
	},
	playerTrade:putTrade(R),
	ok.

%% 下架订单
downtrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	R = #pk_U2GS_DownTrade{
		tradeClass = string_to_integer(SValue1),
		orderID = string_to_integer(SValue2)
	},
	playerTrade:downTrade(R),
	ok.

%% 拒绝订单
refusetrade(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	playerTrade:refuseBuy(#pk_U2GS_TradeRefuse{tradeClass = 3, orderID = string_to_integer(SValue1)}),
	ok.

%% 查询自己的订单
queryselftrade(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	R = #pk_U2GS_QuerySelfTrade{
		tradeClass = string_to_integer(SValue1)
	},
	playerTrade:querySelfTrade(R),
	ok.

%% 邮件相关GM命令
newmail(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | _Other4] = Other3, % 发多少封
	Number = string_to_integer(SValue4),
	Fun =
		fun(I) ->
			Title = io_lib:format("~ts-~p", [SValue2, I]),
			A = list_to_binary(Title),
			B = binary_to_list(A),
			playerMail:newMail(SValue1, B, SValue3, "")
		end,
	case Number >= 1 of
		true ->
			List = lists:seq(1, Number),
			lists:foreach(Fun, List),
			ok;
		_ ->
			error
	end.

%% 发送一封系统邮件
newsysmail(Params) when erlang:length(Params) >= 7 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | Other5] = Other4,
	[SValue6 | Other6] = Other5,
	[SValue7 | Other7] = Other6,
	[SValue8 | _Other8] = Other7,
	playerMail:gmSendSysMail2Other(SValue1, SValue2, "syscontent", "",
		string_to_integer(SValue3), string_to_integer(SValue4),
		string_to_integer(SValue5), string_to_integer(SValue6),
		string_to_integer(SValue7), string_to_integer(SValue8)),
	ok.

maildiamond(Params) when erlang:length(Params) >= 1 ->
	%% 给全服玩家发送非绑定钻石
	[SValue1 | _Other1] = Params,
	Number = string_to_integer(SValue1),
	case Number > 0 of
		true ->
			Title = stringCfg:getString(cnTextLuckyCoinUnname),
			F =
				fun(#rec_RoleName{roleName = Name}, _) ->
					playerMail:gmSendSysMail2Other(Name, Title, Title, "",
						0, 0,
						0, 0,
						?CoinTypeDiamond, Number),
					ok
				end,
			ets:foldl(F, 0, ets_rec_RoleName),

%%			execGMCmd("addcoin", ["3", SValue1]),	%% 非绑钻
			ok;
		_ ->
			skip
	end.

querymail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	Ret = playerMail:queryMail(MailID),
	?DEBUG("queryMail:~p", [Ret]),
	ok.

getmailitemall(_Params) ->
	playerMail:getMailItemAll(),
	ok.

queryallmail(Params) when erlang:length(Params) >= 0 ->
	Ret = playerMail:queryAllMail(),
	?DEBUG("queryAllMail:~p", [Ret]),
	ok.

readmail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	playerMail:readMail(MailID),
	ok.

lockmail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	playerMail:lockMail(MailID),
	ok.

unlockmail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	playerMail:unlockMail(MailID),
	ok.

deletemail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	playerMail:deleteMail(MailID),
	ok.

deleteallreadmail(_Params) ->
	playerMail:deleteAllReadMail(),
	ok.

querytips(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	ItemUID = string_to_integer(SValue1),
	?WARN("querytips:~p,~p", [playerState:getRoleID(), ItemUID]),
	Ret2 = playerItemTips:queryItemFromDBMemCache(ItemUID, true),
	Ret1 = playerMail:queryAttachItemInfo([ItemUID]),
	?WARN("querytips:~p,~p,~p", [playerState:getRoleID(), Ret1, Ret2]),
	io_lib:format("ret1=~p,ret2=~p", [Ret1, Ret2]).

%% 测试玩家关键数据的缓存进程
queryroleid(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	?INFO("queryroleid:~p,~ts", [playerState:getRoleID(), SValue1]),
	Ret = playerNameUID:getPlayerUIDByName(SValue1),
	io_lib:format("queryRoleID:~s,~p", [SValue1, Ret]).

queryrolename(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	RoleID = string_to_integer(SValue1),
	Ret = playerNameUID:getPlayerNameByUID(RoleID),
	io_lib:format("queryRoleID:~p,~s", [RoleID, Ret]).

getallskill(_Params) ->
	ListSkillID =
		case playerState:getSkill() of
			undefined ->
				[];
			List ->
				FunGetID =
					fun(#recSkill{skillID = ID}, R) ->
						[ID | R]
					end,
				lists:foldl(FunGetID, [], List)
		end,
	io_lib:format("allSkillID:~p", [ListSkillID]).

testuid(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	UID = case Type of
			  1 ->
				  uidMgr:makeRoleUID();
			  2 ->
				  uidMgr:makeItemUID();
			  3 ->
				  uidMgr:makeTradeUID();
			  4 ->
				  uidMgr:makeMailUID();
			  _ ->
				  uidMgr:makeRoleUID()
		  end,
	?INFO("makenew UID [~p]", [UID]),
	ok.

%% %% 测试遍历效率 #testefficiency 121538205 10000000
%% execGM("testefficiency", Params) when erlang:length(Params) >= 2 ->
%% 	[SValue1|Other1] = Params,
%% 	[SValue2|_Other2] = Other1,
%% 	Code = string_to_integer(SValue1),
%% 	Times = string_to_integer(SValue2),
%% 	?DEBUG("testefficiency start:~p,~p", [Code, Times]),
%%
%% 	Fun1 = fun(_Index, Param) ->
%% 		%%Ets = playerState:getMapMonsterEts(),
%% 		_ETSMS1 = [{'$1', [{'=:=', {element, 2, '$1'}, {const, Param}}], ['$1']}],
%% 		%%MonsterList = myEts:selectEts(Ets, ETSMS),
%% 		Param
%% 	end,
%%
%% 	Fun2 = fun(_Index, Param) ->
%% 		%%Ets = playerState:getMapMonsterEts(),
%% 		_ETSMS2 = ets:fun2ms(fun(Monster) when Monster#recMapObject.code =:= Param ->
%% 			Monster
%% 		end),
%% 		%%MonsterList = myEts:selectEts(Ets, ETSMS),
%% 		Param
%% 	end,
%%
%% 	%% test1
%% 	Time1 = now_microseconds(),
%% 	misc:for(1, Times, 1, Code, Fun1),
%% 	Time2 = now_microseconds(),
%% 	?DEBUG("test1:~p,~p,~p", [Time1,Time2,Time2-Time1]),
%%
%% 	%% test2
%% 	Time3 = now_microseconds(),
%% 	misc:for(1, Times, 1, Code, Fun2),
%% 	Time4 = now_microseconds(),
%% 	?DEBUG("test2:~p,~p,~p", [Time3,Time4,Time4-Time3]),
%% 	ok;

%% 查询服务器在线人数
qn(Params) when erlang:length(Params) =:= 0 ->
	Size = ets:info(ets_rec_OnlinePlayer, size),
	Num2 = ets:info(?SocketProcessEts, size),
	io_lib:format("tc Online Player Count:~p,~p", [Size, Num2]).

%% 查询当前场景的人数
qn2(Params) when erlang:length(Params) =:= 0 ->
	PlayerEts = playerState:getMapPlayerEts(),
	Size = ets:info(PlayerEts, size),
	io_lib:format("Scene Player Count:~p", [Size]).

%% 打开空气墙
openkq(Params) ->
	Msg =
		case Params of
			[SValue1 | _Other1] ->
				?DEBUG("openkq:~ts", [SValue1]),
				#pk_GS2U_BlockStatusChange{changes = [#pk_BlockStatusChange{blockName = SValue1, blockStatus = ?BlockNpc_Open}]};
			_ ->
				?DEBUG("openkq all d1~d10"),
				#pk_GS2U_BlockStatusChange{
					changes = [
						#pk_BlockStatusChange{blockName = "d1", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d2", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d3", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d4", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d5", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d6", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d7", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d8", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d9", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d10", blockStatus = ?BlockNpc_Open}
					]
				}
		end,
	playerMsg:sendNetMsg(Msg),
	ok.

%% 关闭空气墙
closekq(Params) ->
	Msg =
		case Params of
			[SValue1 | _Other1] ->
				?DEBUG("closekq:~ts", [SValue1]),
				#pk_GS2U_BlockStatusChange{changes = [#pk_BlockStatusChange{blockName = SValue1, blockStatus = ?BlockNpc_Close}]};
			_ ->
				?DEBUG("closekq all d1~d10"),
				#pk_GS2U_BlockStatusChange{
					changes = [
						#pk_BlockStatusChange{blockName = "d1", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d2", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d3", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d4", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d5", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d6", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d7", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d8", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d9", blockStatus = ?BlockNpc_Close},
						#pk_BlockStatusChange{blockName = "d10", blockStatus = ?BlockNpc_Close}
					]
				}
		end,
	playerMsg:sendNetMsg(Msg),
	ok.

%% 查询分组中的怪物个数
queryobjs(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	GroupID = string_to_integer(SValue1),
	Type = string_to_integer(SValue2),
	{MonEts, Type2} =
		case Type of
			?ObjTypeNPC ->
				{playerState:getMapNpcEts(), Type};
			?ObjTypePlayer ->
				{playerState:getMapPlayerEts(), Type};
			?ObjTypeCollect ->
				{playerState:getMapCollectEts(), Type};
			?ObjTypePet ->
				{playerState:getMapPetEts(), Type};
			?ObjTypeMonster ->
				{playerState:getMapMonsterEts(), Type};
			_ ->
				{playerState:getMapMonsterEts(), ?ObjTypeMonster}
		end,
	MatchSpec = ets:fun2ms(
		fun(Monster) when Monster#recMapObject.groupID =:= GroupID andalso Monster#recMapObject.type =:= Type2 ->
			{Monster#recMapObject.code, Monster}
		end
	),
	case myEts:selectEts(MonEts, MatchSpec) of
		[] ->
			"not found obj!";
		L ->
			?DEBUG("queryobjs:~p", [L]),
			case Other2 of
				[] ->
					io_lib:format("queryobjs len:~p", [length(L)]);
				_ ->
					LL = [{Code1, ID1} || {Code1, #recMapObject{id = ID1}} <- L],
					io_lib:format("queryobjs len:~p, list:~p, len:~p", [length(LL), LL, erlang:length(LL)])
			end
	end.

%% 全服查询玩家对象
queryobj(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	RoleID = string_to_integer(SValue1),
	case RoleID > 0 of
		true ->
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{accountID = AID, code = Code, roleID = ID} ->
					io_lib:format("queryobj success:accountID=~p, playerCode=~p, playerName=~ts, playerId=~p",
						[AID, Code, playerNameUID:getPlayerNameByUID(ID), ID]);
				_ ->
					io_lib:format("queryobj failed:~p", [RoleID])
			end;
		_ ->
			"queryobj failed"
	end.

%% 查询目标的属性值
query(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	NValue = if
				 Value =:= 0 ->
					 %% 查看选中目标的属性
					 playerState:getSelectTargetCode();
				 Value =:= 1 ->
					 %% 查看自己的属性
					 playerState:getPlayerCode();
				 Value >= 999 ->
					 %% 查看指定目标的属性
					 Value;
				 true ->
					 0
			 end,
	?DEBUG("query:~p,~w", [NValue, self()]),
	if
		NValue =< 0 orelse NValue =:= undefined ->
			"notFound select";
		NValue > 0 ->
			case codeMgr:getObjectTypeByCode(NValue) of
				?ObjTypePlayer ->
					S1 =
						case playerMgrOtp:getOnlinePlayerInfoByCode(NValue) of
							#rec_OnlinePlayer{accountID = AID, roleID = RoleID} ->
								io_lib:format("accountID=~p, playerCode=~p, playerId=~p, playerName=~s", [
									AID,
									NValue,
									RoleID,
									playerNameUID:getPlayerNameByUID(RoleID)
								]);
							_ ->
								"not find player!!"
						end,
					S2 = case playerState:getMapPlayerEts() of
							 undefined ->
								 "notFound player ets";
							 MapPlayerEts ->
								 case myEts:lookUpEts(MapPlayerEts, NValue) of
									 [#recMapObject{hp = H, maxHp = MaxHP, mp = M, x = X, y = Y, mapId = MA, type = T, guild = GuildID, groupID = G, camp = Camp, mapPid = MapPid, buffList = BuffList}] ->
										 Fun = fun(#pk_BuffBaseInfo{buffID = BuffID}) ->
											 BuffID
											   end,
										 Buffs = lists:map(Fun, BuffList),
										 io_lib:format("hp=~p, maxHp=~p, mp=~p, x=~p, y=~p, mapId=~p, type=~p, guild=~p, groupID=~p camp=~p, mapPid=~p, buffs = ~ts, isCross=~p",
											 [H, MaxHP, M, erlang:trunc(X), erlang:trunc(Y), MA, T, GuildID, G, Camp, MapPid, misc:term_to_string(Buffs), core:isCross()]);
									 _ ->
										 "notFound player"
								 end
						 end,
					io_lib:format("Base=[~ts], Other=[~ts]", [S1, S2]);
				?ObjTypeMonster ->
					case playerState:getMapMonsterEts() of
						undefined ->
							"notFound monster ets";
						MapMonsterEts ->
							case myEts:lookUpEts(MapMonsterEts, NValue) of
								[#recMapObject{code = C, id = I, name = N, hp = H, mp = M, x = X, y = Y, mapPid = MPid, camp = Camp, mapId = MA, type = T, status = ST, actionStatus = AT, guild = G, groupID = GG, level = LVL, buffList = Bufs}] ->
									psMgr:sendMsg2PS(MPid, getMonsterProp, C),
									?DEBUG("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, camp=~p, mapId=~p, type=~p, status=~p, actionStatus=~p,guildID=~p,groupID=~p,level=~p,buffs = ~ts",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), Camp, MA, T, ST, AT, G, GG, LVL, misc:term_to_string(Bufs)]),
									io_lib:format("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, camp=~p, mapId=~p, type=~p, status=~p, actionStatus=~p,guildID=~p,groupID=~p,level=~p,buffs = ~ts",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), Camp, MA, T, ST, AT, G, GG, LVL, misc:term_to_string(Bufs)]);
								_ ->
									"notFound monster"
							end
					end;
				?ObjTypePet ->
					case playerState:getMapPetEts() of
						undefined ->
							"notFound pet ets";
						MapPetEts ->
							case myEts:lookUpEts(MapPetEts, NValue) of
								[#recMapObject{code = C, id = I, name = N, hp = H, mp = M, x = X, y = Y, camp = Camp, mapId = MA, type = T, status = ST, actionStatus = AT, groupID = G, level = LVL, ownId = OwnID, buffList = Buffs}] ->
									?DEBUG("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, camp=~p, mapId=~p, type=~p, status=~p, actionStatus=~p,groupID=~p,level=~p,OwnID=~p,buffs = ~ts",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), Camp, MA, T, ST, AT, G, LVL, OwnID, misc:term_to_string(Buffs)]),
									io_lib:format("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, camp=~p, mapId=~p, type=~p, status=~p, actionStatus=~p,groupID=~p,level=~p,OwnID=~p,buffs = ~ts",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), Camp, MA, T, ST, AT, G, LVL, OwnID, misc:term_to_string(Buffs)]);
								_ ->
									"notFound pet"
							end
					end;
				?ObjTypeNPC ->
					case playerState:getMapNpcEts() of
						undefined ->
							"notFound npc ets";
						MapNpcEts ->
							case myEts:lookUpEts(MapNpcEts, NValue) of
								[#recMapObject{code = C, id = I, name = N, hp = H, mp = M, x = X, y = Y, mapId = MA, type = T, actionStatus = AT, status = ST, groupID = G}] ->
									io_lib:format("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, mapId=~p, type=~p, actionStatus=~p, status=~p,groupID=~p",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), MA, T, AT, ST, G]);
								_ ->
									"notFound npc"
							end
					end;
				?ObjTypeCollect ->
					case playerState:getMapCollectEts() of
						undefined ->
							"notFound collect ets";
						CollectEts ->
							case myEts:lookUpEts(CollectEts, NValue) of
								[#recMapObject{code = C, id = I, name = N, hp = H, maxHp = MaxHP, x = X, y = Y, mapId = MA, groupID = G}] ->
									io_lib:format("code=~p, id=~p, name=~s, hp=~p, maxhp=~p, x=~p, y=~p, mapId=~p,groupID=~p",
										[C, I, N, H, MaxHP, erlang:trunc(X), erlang:trunc(Y), MA, G]);
								_ ->
									"notFound collect"
							end
					end;
				UnKnowType ->
					io_lib:format("Not other types:~p", [UnKnowType])
			end;
		true ->
			"notFound other"
	end.

%% 查询当前所在跨服信息
querycross(_) ->
	case core:isCross() of
		true ->
			MapPid = playerState:getMapPid(),
			MapLine = playerState:getMapLine(),
			MapID = playerState:getMapID(),
			Count = ets:info(playerState:getMapPlayerEts(), size),
			{MapID, MapLine, MapPid, Count};
		_ ->
			normal
	end.

%% 设置自己的属性值
setgroupid(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value1 = string_to_integer(SValue1),
	case Value1 < 0 of
		true ->
			%% 分配新的分组
			NewGroupID = playerScene:onEnterBitGroup(playerState:getMapID()),
			io_lib:format("setgroupid new:~p", [NewGroupID]);
		_ ->
			%% 设置老的分组
			GroupID = playerScene:onEnterGroup(Value1),
			io_lib:format("setgroupid old:~p,~p", [Value1, GroupID])
	end.

setgroupid2([SValue1 | _Other1]) ->
	MapID = string_to_integer(SValue1),
	NewGroupID = playerScene:onEnterBitGroup(MapID),
	io_lib:format("setgroupid new:~p", [NewGroupID]).

%% 检查当前位置是不是阻挡
checkblock(Params) ->
	{MapID, X, Y} =
		case erlang:length(Params) >= 3 of
			true ->
				[SValue1 | Other1] = Params,
				[SValue2 | Other2] = Other1,
				[SValue3 | _Other3] = Other2,
				{string_to_integer(SValue1), string_to_integer(SValue2), string_to_integer(SValue3)};
			_ ->
				MapID1 = playerState:getMapID(),
				{X1, Y1} = playerState:getPos(),
				{MapID1, X1, Y1}
		end,
	#recGameMapCfg{
		colCellNum = ColCellNum,
		rowCellNum = RowCellNum,
		cellSize = CellSize,
		block = BlockBinary} = core:getMapCfg(MapID),
	Ret = mapView:isBlock(erlang:float(X), erlang:float(Y), ColCellNum, RowCellNum, CellSize, BlockBinary),
	io_lib:format("mapID=~p,x=~p,y=~p,isblock=~p", [MapID, X, Y, Ret]).

cjss(Params) when erlang:length(Params) >= 1 ->
	%% 管理员无条件传送到目标所在地图
	[SValue1 | _Other1] = Params,
	TargetRoleID = string_to_integer(SValue1),
	case TargetRoleID > 0 of
		true ->
			%% 先判断目标是否与自己处于同一地图
			PlayerEts = playerState:getMapPlayerEts(),
			MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.id =:= TargetRoleID ->
				Object
								   end),
			case myEts:selectEts(PlayerEts, MatchSpec) of
				[#recMapObject{x = X, y = Y, groupID = GroupID}] ->
					playerScene:onEnterGroup(GroupID),
					playerMap:onLaterTransferPosAck(playerState:getMapID(), X, Y),
					"success!";
				_ ->
					case core:queryOnLineRoleByRoleID(TargetRoleID) of
						#rec_OnlinePlayer{code = Code, pid = PID} ->
							psMgr:sendMsg2PS(PID, gm_getplayermapinfo, TargetRoleID),
							io_lib:format("success:roleid=~p,code=~p,name=~s",
								[TargetRoleID, Code, playerNameUID:getPlayerNameByUID(TargetRoleID)]);
						_ ->
							"not found"
					end
			end;
		_ ->
			"cjss error param"
	end.

ac(Params) when erlang:length(Params) >= 1 ->
	[S | _] = Params,
	S1 = string_to_integer(S),
	psMgr:sendMsg2PS(?PsNameCrosHd, setAc, {S1}),
	ok.

acarena(Params) when erlang:length(Params) >= 1 ->
	[S | _] = Params,
	S1 = string_to_integer(S),
	psMgr:sendMsg2PS(?PsNameCrosArena, setAc, {S1}),
	ok.

acswitch(Params) when erlang:length(Params) >= 1 ->
	[S | _] = Params,
	S1 = string_to_integer(S),
	playerPropSync:setInt(?PriProp_PlayerGmSwitch, S1),
	ok.

rearenarank(Params) when erlang:length(Params) >= 0 ->
	psMgr:sendMsg2PS(?PsNameCrosArena, refreshHighRank, {}),
	ok.

arenamatch(Params) when erlang:length(Params) >= 1 ->
	[S | _] = Params,
	case string_to_integer(S) of
		1 -> playerCrosTeam:setIsGMMatch(true);
		_ -> playerCrosTeam:setIsGMMatch(false)
	end,
	ok.

acreward(Params) when erlang:length(Params) >= 0 ->
	gsCrosLogic:dealWeekRewardToHd(),
	ok.

entercrosserver(Params) when erlang:length(Params) >= 0 ->
	psMgr:sendMsg2PS(?PsNameCrosHd, allocMapLine, {
		playerState:getRoleID(),
		playerState:getName(),
		self(),
		playerState:getNetPid(),
		playerState:getCareer(),
		gsMainLogic:getDBID4GS(),
		gsMainLogic:getAreaName(),
		playerPropSync:getProp(?PriProp_PetForce) + playerPropSync:getProp(?PriProp_PlayerForce),
		playerPropSync:getProp(?SerProp_PlayerHistoryForce),
		playerState:getLevel()
	}).

clearcrosrank(Params) when erlang:length(Params) >= 0 ->
	ets:delete_all_objects(rec_cros_rank),
	psMgr:sendMsg2PS(?PsNameCrosHd, clearRank, {}).

%% 进入地图
ss(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	case getCfg:getCfgByArgs(cfg_mapsetting, Value) of
		#mapsettingCfg{type = ?MapTypeCopyMap} ->
			playerCopyMap:resetCopyMap(Value),
			%% 延时两秒钟进入副本
			erlang:send_after(2000, self(), {gm_delayEnterCopyMap, Value}),
			ok;
		#mapsettingCfg{type = ?MapTypeBitplane, belongto = BelongTo} ->
			case playerState:getMapID() =:= BelongTo of
				true ->
					playerCopyMap:enterCopyMap(Value);
				_ ->
					?INFO("gm order ss:failed:~p,~p,~p", [playerState:getMapID(), Value, BelongTo])
			end,
			ok;
		#mapsettingCfg{type = ?MapTypeActivity} ->
			playerScene:onRequestEnterActivityMap(Value, undefined),
			ok;
		_ ->
			case core:getMapWayPt(Value) of
				WayPtList when erlang:is_list(WayPtList) andalso WayPtList =/= [] ->
					[#recMapWayPt{name = Name} | _] = WayPtList,
					playerScene:onRequestEnterMap(Value, Name),
					ok;
				_ ->
					skip
			end,
			ok
	end,
	io_lib:format("enter map: ~p", [Value]).

goto(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	MapID_temp = string_to_integer(SValue1),
	MapID = case MapID_temp =< 0 of
				true ->
					playerState:getMapID();
				_ ->
					MapID_temp
			end,
	X = erlang:float(string_to_integer(SValue2)),
	Y = erlang:float(string_to_integer(SValue3)),
	playerMap:onLaterTransferPosAck(MapID, X, Y),
	io_lib:format("goto:~p, [~p,~p]", [MapID, X, Y]).

goto_boss([SValue1 | _Other1]) ->
	BossID = string_to_integer(SValue1),
	MatchSpec = ets:fun2ms(
		fun(Object) when Object#recMapObject.id =:= BossID ->
			Object
		end),
	MapID = playerState:getMapID(),
	case ets:select(playerState:getMapMonsterEts(), MatchSpec) of
		[#recMapObject{x = X, y = Y}|_] ->
			playerMap:onLaterTransferPosAck(MapID, X, Y),
			io_lib:format("goto:~p, [~p,~p]", [MapID, X, Y]);
		_ ->
			io_lib:format("not found:~p", [BossID])
	end.



resetcopymap(_Params) ->
	CopyMapID = playerState:getMapID(),
	RoleID = playerState:getRoleID(),
	Ret =
		case playerScene:getMapType(CopyMapID) of
			?MapTypeCopyMap ->
				core:sendMsgToMapMgr(CopyMapID, resetCopyMap, {RoleID, playerState:getTeamID(), CopyMapID});
			_ ->
				false
		end,
	io_lib:format("resetcopymap:~p,~p", [CopyMapID, Ret]).

%% 直接添加军团id到军团联赛报名列表
addguildbattlelist(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	ID = string_to_integer(SValue1),
	psMgr:sendMsg2PS(?PsNameGuild, gm_addguildbattlelist, ID),
	ok.

%% 给军团添加物资
addguildres(_Params) when erlang:length(_Params) =:= 0 ->
	GuildID = playerState:getGuildID(),
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{guildLevel = Lvl, resource = Res, liveness = Liv}] ->
			#guildCfg{max_res = MaxRes} = getCfg:getCfgPStack(cfg_guild, Lvl),
			playerGuild:addguildresource(GuildID, MaxRes - Res),
			#guildCfg{max_liv = MaxLiv} = getCfg:getCfgPStack(cfg_guild, Lvl),
			playerGuild:addguildliveness(GuildID, MaxLiv - Liv);
		_ ->
			skip
	end;
addguildres(Params) when erlang:length(Params) =:= 1 ->
	[SValue1 | _] = Params,
	Value = string_to_integer(SValue1),
	GuildID = playerState:getGuildID(),
	playerGuild:addguildresource(GuildID, Value),
	playerGuild:addguildliveness(GuildID, Value);
addguildres(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	GuildID = string_to_integer(SValue1),
	Value = string_to_integer(SValue2),
	playerGuild:addguildresource(GuildID, Value),
	playerGuild:addguildliveness(GuildID, Value).

%% 开启某个活动阶段
startac(Params) when erlang:length(Params) >= 2 ->
	startac2(Params).	%% 统一使用兼容跨服的GM指令
%[SValue1 | Other1] = Params,
%[SValue2 | _Other2] = Other1,
%ActivityType = string_to_integer(SValue1),
%ActivityPhase = string_to_integer(SValue2),
%R = #rec_activity{
%	id = ActivityType,
%	starttime = 0,
%	phasetime = 0,
%	phase = ActivityPhase
%},
%?ERROR("~p startac down:~p, restart", [ ActivityType, ActivityPhase]),
%psMgr:sendMsg2PS(?PsNameActivity, gm_start_activity, self(), {ActivityType, ActivityPhase}),
%psMgr:sendMsg2PS(?PsNameActivityMgr, activityChangeMsg, R),
%"startactivity ok".

%% 开启某个活动阶段，全服，包含所有跨服和所有普通服
startac2(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	ActivityType = string_to_integer(SValue1),
	ActivityPhase = string_to_integer(SValue2),

	R = #rec_activity{
		id = ActivityType,
		starttime = 0,
		phasetime = 0,
		phase = ActivityPhase
	},
	?ERROR("~p startac down:~p, restart", [ ActivityType, ActivityPhase]),
	%% 骑宠竞速关闭活动时需要特殊处理
	case {ActivityType, ActivityPhase} of
		{?ActivityType_CrossRace, ?ActivityPhase_Close} ->
			gsCsInterface:transitMsg2CenterOtp(?PsNameCSRace, gm, {gm00, 0});  %% 通知中心服强制结束
		_ ->
			skip
	end,
	gsCsInterface:sendMsg2CenterServer(startac, R),
%%	psMgr:sendMsg2PS(?PsNameActivity, gm_start_activity, self(), {ActivityType, ActivityPhase}),
%%	psMgr:sendMsg2PS(?PsNameActivityMgr, activityChangeMsg, R),
	"startactivity ok".

queryRPInfo([RoleIDs, Types | _] = Params) when erlang:length(Params) >= 2 ->
	RoleID = string_to_integer(RoleIDs),
	Type = string_to_integer(Types),
	playerRPView:queryRPInfo(RoleID,Type).

%% 创建一个混沌战场
createhdbattle(Params) when erlang:length(Params) >= 0 ->
	core:sendMsgToActivity(?ActivityType_HDBattle, gm_createhdbattle, {}),
	"createhdbattle ok".

%% 请求加入混沌战场
requesthdbattle(Params) when erlang:length(Params) >= 0 ->
	MapID = playerState:getMapIDGroup(),
	case playerScene:getMapType(MapID) of
		?MapTypeNormal ->
			core:sendMsgToActivity(?ActivityType_HDBattle,
				requestJoinHDBattle,
				{
					playerState:getRoleID(),
					playerState:getName(),
					playerState:getLevel(),
					self(),
					playerState:getNetPid(),
					playerPropSync:getProp(?PriProp_PetForce) + playerPropSync:getProp(?PriProp_PlayerForce)
				}),
			"requesthdbattle success";
		_ ->
			%% 不能从副本或者位面中进入混沌战场
			"requesthdbattle failed"
	end.

%% 请求查看时空裂痕npc信息
riftinfo(Params) when erlang:length(Params) >= 0 ->
	Code = playerState:getSelectTargetCode(),
	Ret = case Code > 0 of
			  true ->
				  playerCopyMapRift:requestRiftNpcInfo(Code);
			  _ ->
				  skip
		  end,
	io_lib:format("riftinfo:~p,~p", [Code, Ret]).

%% 请求进入时空裂痕
enterrift(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	GroupID = string_to_integer(SValue1),
	BMapID = string_to_integer(SValue2),
	gsMainLogic:setEnterRiftTime(playerState:getRoleID(), 0),
	Ret = playerCopyMapRift:requestEnterRift(GroupID, BMapID),
	io_lib:format("enterrift:~p,~p,~p", [GroupID, BMapID, Ret]).

%% 立即刷新时空裂痕npc的坐标
freshriftnpcpos(Params) when erlang:length(Params) >= 0 ->
	psMgr:sendMsg2PS(playerState:getMapPid(), gmTest_freshriftnpcpos, {}),
	ok.

%% 获取时空裂痕npc的坐标
getriftnpcpos(Params) when erlang:length(Params) >= 0 ->
	NpcEts = playerState:getMapNpcEts(),
	NpcList = ets:tab2list(NpcEts),
	MapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_rift, MapID) of
		#riftCfg{move_npc_list = MNList} ->
			Fun =
				fun(#recMapObject{id = ID} = Obj, AccList) ->
					case lists:member(ID, MNList) of
						true ->
							[{Obj#recMapObject.code, trunc(Obj#recMapObject.x), trunc(Obj#recMapObject.y)} | AccList];
						_ ->
							AccList
					end
				end,
			L = lists:foldl(Fun, [], NpcList),
			io_lib:format("~p", [L]);
		_ ->
			no_rift_npc
	end.

%% 控制时空裂痕npc移动
riftnpcmove(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	TX = erlang:float(string_to_integer(SValue1)),
	TY = erlang:float(string_to_integer(SValue2)),
	case playerState:getSelectTargetCode() of
		Code when Code > 0 ->
			MapID = playerState:getMapID(),
			case lists:member(MapID, getCfg:get1KeyList(cfg_rift)) of
				true ->
					NpcEts = playerState:getMapNpcEts(),
					case myEts:lookUpEts(NpcEts, Code) of
						[#recMapObject{id = ID}] ->
							case getCfg:getCfgPStack(cfg_rift, MapID) of
								#riftCfg{move_npc_list = MNList} ->
									case lists:member(ID, MNList) of
										true ->
											psMgr:sendMsg2PS(playerState:getMapPid(), gmTest_riftnpcmove, {Code, ID, TX, TY}),
											io_lib:format("true:~p,~p,~p,~p", [Code, ID, TX, TY]);
										_ ->
											"nonenpcid"
									end;
								_ ->
									"nonemapid"
							end;
						_ ->
							"nonetargetcode"
					end;
				_ ->
					"notmapid"
			end;
		_ ->
			"noneselect"
	end.

%% 添加buff
addbuff(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	BuffID = string_to_integer(SValue1),
	BuffLevel =
		case Other1 of
			[] ->
				1;
			[SValue2 | _] ->
				string_to_integer(SValue2)
		end,
	playerBuff:addBuff(BuffID, BuffLevel),
	ok.
%% 向目标怪物添加buff
addbuff_(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	BuffID = string_to_integer(SValue1),
	BuffLevel =
		case Other1 of
			[] ->
				1;
			[SValue2 | _] ->
				string_to_integer(SValue2)
		end,
	case playerState:getSelectTargetCode() of
		0 ->
			skip;
		undefined ->
			skip;
		TargetCode ->
			case codeMgr:getObjectTypeByCode(TargetCode) of
				?ObjTypeMonster ->
					psMgr:sendMsg2PS(playerState:getMapPid(), addBuff, {TargetCode, BuffID, BuffLevel});
				_ ->
					skip
			end
	end.
%% 移除buff
delbuff(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	BuffID = string_to_integer(SValue1),
	playerBuff:delBuff(BuffID),
	ok.

%% 查看buff
querybuff(_Params) ->
	BuffList = playerState:getBuffList(),
	?WARN("querybuff:~p", [BuffList]),
	ok.

%% 增加临时技能
addskill(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	SkillID = string_to_integer(SValue1),
	SkillLevel =
		case Other1 of
			[] ->
				1;
			[SValue2 | _] ->
				string_to_integer(SValue2)
		end,
	case getCfg:getCfgByKey(cfg_skill, SkillID) of
		#skillCfg{skillType = Type, skillEx = Ex} ->
			playerSkill:addSysSkill(Type, Ex, SkillID, SkillLevel);
		_ ->
			skip
	end.

%% 移除临时技能
delskill(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	SkillID = string_to_integer(SValue1),
	case getCfg:getCfgByKey(cfg_skill, SkillID) of
		#skillCfg{} ->
			playerSkill:delSysSkill(SkillID);
		_ ->
			skip
	end.

%% 查询某个对象的天梯数据
ladderquery(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	Target = string_to_integer(SValue2),
	T = case Type of
			1 ->
				%% 按排名
				case ets:lookup(ets_rec_ladder_1v1, Target) of
					[#rec_ladder_1v1{} = R] -> R;
					_ -> false
				end;
			2 ->
				%% 按目标
				playerLadder1v1:queryRoleLadder(Target)
		end,
	case T of
		#rec_ladder_1v1{roleID = RoleID} ->
			io_lib:format("ladderquery:rank=~p, roleID=~p, name=~ts, exploit=~p, cur=~p, max=~p, all=~p, worship=~p, rankmin=~p",
				[
					T#rec_ladder_1v1.rankSort,
					RoleID,
					playerLadder1v1:queryTargetName(RoleID),
					T#rec_ladder_1v1.exploit,
					T#rec_ladder_1v1.cur_win,
					T#rec_ladder_1v1.max_win,
					T#rec_ladder_1v1.win_times,
					T#rec_ladder_1v1.worship_times,
					T#rec_ladder_1v1.rankMin
				]);
		_ -> false
	end.

%% 随机取几个天梯里面的对象 1 取玩家对象，2 取怪物对象
ladderplayer(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	List = ets:tab2list(ets_rec_ladder_1v1),
	Fun =
		fun(#rec_ladder_1v1{roleID = RID}) ->
			case Type of
				1 -> uidMgr:checkUID(?UID_TYPE_Role, RID);
				2 -> not uidMgr:checkUID(?UID_TYPE_Role, RID)
			end
		end,
	L = lists:filter(Fun, List),
	Len = erlang:length(L),
	L2 =
		case Len > 5 of
			true ->
				P1 = lists:nth(misc:rand(1, Len - 0), L),
				P2 = lists:nth(misc:rand(1, Len - 1), L -- [P1]),
				P3 = lists:nth(misc:rand(1, Len - 2), L -- [P1, P2]),
				P4 = lists:nth(misc:rand(1, Len - 3), L -- [P1, P2, P3]),
				P5 = lists:nth(misc:rand(1, Len - 4), L -- [P1, P2, P3, P4]),
				[P1, P2, P3, P4, P5];
			false -> L
		end,
	FM =
		fun(#rec_ladder_1v1{rankSort = Rank, roleID = RID}, Acc) ->
			case Acc =:= "" of
				true ->
					io_lib:format("~p,~p,~ts", [Rank, RID, playerLadder1v1:queryTargetName(RID)]);
				_ ->
					io_lib:format("~ts--~p,~p,~ts", [Acc, Rank, RID, playerLadder1v1:queryTargetName(RID)])
			end
		end,
	lists:foldl(FM, "", L2).

%% 把自己添加进天梯列表
ladderadd(Params) when erlang:length(Params) >= 0 ->
	playerLadder1v1:gmAddSelfToLadderList().

%% 放弃挑战
laddergiveup(Params) when erlang:length(Params) >= 0 ->
	playerLadder1v1:giveUpChallenge(),
	ok.

%% 挑战对手
ladder(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	Target = string_to_integer(SValue2),
	case Type of
		1 ->
			%% 按排名挑战
			playerLadder1v1:challengeTargetByRank(Target, "11");
		2 ->
			%% 按目标挑战
			playerLadder1v1:challengeTargetByRoleID(Target)
	end,
	ok.

%%模拟协议测试请求，只能挑战挑战者列表里的对手
ladder_protocol(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	Target = string_to_integer(SValue2),
	case Type of
		1 ->
			%% 按排名挑战
			playerLadder1v1:protocol_ChallengeTargetByRank(Target, "11");
		2 ->
			%% 按目标挑战
			playerLadder1v1:challengeTargetByRoleID(Target)
	end,
	ok.

%% 膜拜王者
laddermb(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Rank = string_to_integer(SValue1),
	case ets:lookup(ets_rec_ladder_1v1, Rank) of
		[#rec_ladder_1v1{roleID = RID} = _TR] ->
			playerLadder1v1:worshipTarget(RID, playerNameUID:getPlayerNameByUID(RID));
		_ ->
			skip
	end.

%% 清理卡住的玩家
ladderclear(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	TargetRoleID = string_to_integer(SValue1),
	playerLadder1v1:clearLadderMatchState(TargetRoleID).

monitorsj(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	case string_to_integer(SValue1) of
		1 ->
			%% 增加源库IP，暂时不用
			gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_AddRandIP, SValue2}),
			psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_AddRandIP, SValue2}),
			ok;
		2 ->
			%% 增加监控库IP
			gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_AddMonitorIP, SValue2}),
			psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_AddMonitorIP, SValue2}),
			ok;
		10 ->
			%% 删除源库IP
%%			gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_DelRandIP, SValue2}),
%%			psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_DelRandIP, SValue2}),
			ok;
		20 ->
			%% 删除监控库IP
			gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_DelMonitorIP, SValue2}),
			psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_DelMonitorIP, SValue2}),
			ok;
		_ ->
			skip
	end.

%%清除僵尸玩家进程（先跑3分钟），还不行就kill进程
crp(Params) when erlang:length(Params) >= 1 ->
	[RoleIDTmp | _Right1] = Params,
	RoleID = erlang:list_to_integer(RoleIDTmp),
	MeID = playerState:getRoleID(),
	RegName = string:concat("playerOtp", erlang:integer_to_list(RoleID)),

	PlayerOtpName = erlang:list_to_atom(RegName),
	case erlang:whereis(PlayerOtpName) of
		_Pid1 when MeID =:= RoleID ->
			cant_kill_self;
		Pid1 when erlang:is_pid(Pid1) ->
			case erlang:is_process_alive(Pid1) of
				true ->
					?ERROR("self:~w want target:~w quit because gm", [self(), Pid1]),
					Pid1 ! quit,
					timer:sleep(10000),
					case erlang:is_process_alive(Pid1) of
						true ->
							erlang:exit(Pid1, kill),
							?ERROR("gm kill playerpid[~p],gm_roleName:~ts", [RoleID, playerState:getName()]),
							ok;
						_ ->
							safequit
					end;
				_ ->
					dead_playerPid
			end;
		_ ->
			undefined_pid
	end.

%% 清除指定玩家的永久标记
clearroleforeverlimit(Params) when erlang:length(Params) >= 1 ->
	[RoleIDTmp | Right1] = Params,
	RoleID = erlang:list_to_integer(RoleIDTmp),
	[FlagTmp | _] = Right1,
	FlagList = misc:string_to_term(FlagTmp),
	SourceshopForeverLimitType = 0,
	A = edb:readRecord(rec_sourceshop_forever_limit, {RoleID, SourceshopForeverLimitType}),
	?INFO("IsFlagList:~p Has Old FlagList~p", [erlang:is_list(FlagList), A]),
	case A of
		[#rec_sourceshop_forever_limit{sourceshopIDList = LBinStr} | _] when erlang:is_list(FlagList) ->
			SaveIDS1 = misc:string_to_term(misc:binToString(LBinStr)),
			SaveIDS = SaveIDS1 -- FlagList,
			NewRec = #rec_sourceshop_forever_limit{
				roleID = {RoleID, SourceshopForeverLimitType},
				type = SourceshopForeverLimitType,
				sourceshopIDList = misc:term_to_string(SaveIDS)
			},
			?INFO("GM clean shopflag succ old:~p subtrahend:~p", [SaveIDS1, FlagList]),
			edb:writeRecord(update_rec_sourceshop_forever_limit, NewRec),
			edb:writeRecord(rec_sourceshop_forever_limit, NewRec),
			ok;
		_ ->
			?ERROR("GM clean shopflag fail,not can clean"),
			skip
	end.

%% 增加功勋，可增加负值
ladderaddexp(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	PLog = #recPLogTSMoney
	{
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_GMSystem,
		reason = ?CoinSourceOnlineGM,
		param = ?CoinTypeExploit
	},
	playerMoney:addCoin(?CoinTypeExploit, Value, PLog).

addhonor(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	case Value > 0 of
		true ->
			psMgr:sendMsg2PS(self(), hdaddHonorValue, {playerState:getRoleID(), Value}),
			ok;
		_ ->
			skip
	end.

adddaily(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	Value = string_to_integer(SValue3),
	playerDaily:addDailyCounter(Type, ID, Value),
	ok.

decdaily(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	Value = string_to_integer(SValue3),
	playerDaily:reduceDailyCounter(Type, ID, Value),
	ok.

querydaily(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	Count = playerDaily:getDailyCounter(Type, ID),
	io_lib:format("count=~p", [Count]).

zerodaily(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	playerDaily:zeroDailyCount(Type, ID),
	ok.

adddaily2(Params) when erlang:length(Params) >= 2 ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[SValue1 | Other1] = Params,
					[SValue2 | _] = Other1,
					Type = string_to_integer(SValue1),
					Value = string_to_integer(SValue2),
					Old = daily2State:queryDaily2(RoleID, TargetRoleID, Type),
					daily2Logic:saveDaily2({RoleID, TargetRoleID, Type, Old + Value});
				_ ->
					?ERROR("adddaily2 invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR("adddaily2 invalid Target! must select player!")
	end,
	ok.

decdaily2(Params) when erlang:length(Params) >= 2 ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[SValue1 | Other1] = Params,
					[SValue2 | _] = Other1,
					Type = string_to_integer(SValue1),
					Value = string_to_integer(SValue2),
					Old = daily2State:queryDaily2(RoleID, TargetRoleID, Type),
					daily2Logic:saveDaily2({RoleID, TargetRoleID, Type, Old - Value});
				_ ->
					?ERROR("decdaily2 invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR("decdaily2 invalid Target! must select player!")
	end,
	ok.

querydaily2(Params) when erlang:length(Params) >= 1 ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[SValue1 | _] = Params,
					Type = string_to_integer(SValue1),
					Value = daily2State:queryDaily2(RoleID, TargetRoleID, Type),
					io_lib:format("count=~p", [Value]);
				_ ->
					?ERROR("querydaily2 invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR("querydaily2 invalid Target! must select player!")
	end.

zerodaily2(Params) when erlang:length(Params) >= 1 ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[SValue1 | _] = Params,
					Type = string_to_integer(SValue1),
					daily2Logic:saveDaily2({RoleID, TargetRoleID, Type, 0});
				_ ->
					?ERROR("zerodaily2 invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR("zerodaily2 invalid Target! must select player!")
	end,
	ok.

%% 删除一个对象
delobj(Params) when erlang:length(Params) >= 0 ->
	NValue = case Params of
				 [SValue1 | _Other1] ->
					 Value = string_to_integer(SValue1),
					 if
						 Value >= 99999 ->
							 Value;
						 true ->
							 playerState:getSelectTargetCode()
					 end;
				 _ ->
					 playerState:getSelectTargetCode()
			 end,
	?DEBUG("delobj:~p,~w", [NValue, self()]),
	MapPid = playerState:getMapPid(),
	case codeMgr:getObjectTypeByCode(NValue) of
		?ObjTypePlayer ->
			case ets:lookup(playerState:getMapPlayerEts(), NValue) of
				[#recMapObject{id = 0, pid = Pid}] ->
					psMgr:sendMsg2PS(Pid, gm_delobj_rob_player, playerState:getRoleID()),
					io_lib:format("delobj monster success:~p", [NValue]);
				_ ->
					io_lib:format("delobj player failed:~p", [NValue])
			end;
		?ObjTypeMonster ->
			psMgr:sendMsg2PS(MapPid, clearSpawn, [NValue]),
			io_lib:format("delobj monster success:~p", [NValue]);
		?ObjTypeCarrier ->
			psMgr:sendMsg2PS(MapPid, clearSpawn, [NValue]),
			io_lib:format("delobj carrier success:~p", [NValue]);
		?ObjTypeCollect ->
			psMgr:sendMsg2PS(MapPid, clearCollect, [NValue]),
			io_lib:format("delobj collect success:~p", [NValue]);
		?ObjTypeNPC ->
			psMgr:sendMsg2PS(MapPid, clearNpc, {[NValue], playerState:getGroupID()}),
			io_lib:format("delobj npc success:~p", [NValue]);
		UnKnowType ->
			io_lib:format("delobj failed:~p,~p", [NValue, UnKnowType])
	end.

%%创建一个怪物
addconvoy(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	playerConvoy:init(Value, gmtest).

addmonster(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	MapID = playerState:getMapID(),

	{{X, Y}, Camp} =
		case Other2 of
			[SValue3 | Other3] ->
				IsHalfWayPt = string_to_integer(SValue3),
				Camp_ = case Other3 of [] -> ?CampMonsterEnemies; [SValue4 | _] -> string_to_integer(SValue4) end,
				case IsHalfWayPt =:= 1 of
					true ->
						WayPtList = core:getMapWayPt(MapID),
						N = misc:ceil(erlang:length(WayPtList) / 2),
						#recMapWayPt{x = X0, y = Y0} = lists:nth(N, WayPtList),
						{{X0, Y0}, Camp_};
					_ ->
						{playerState:getPos(), Camp_}
				end;
			_ ->
				{playerState:getPos(), ?CampMonsterEnemies}
		end,

	MonsterID = string_to_integer(SValue1),
	Number = string_to_integer(SValue2),
	GroupID = playerState:getGroupID(),
	case Number >= 1 of
		true ->
			Fun = fun(_I) ->
				PlayerEts = playerState:getMapPlayerEts(),
				MonsterEts = playerState:getMapMonsterEts(),
				PetEts = playerState:getMapPetEts(),

				case getCfg:getCfgPStack(cfg_monster, MonsterID) of
					#monsterCfg{} ->
						Arg = #recSpawnMonster{id = MonsterID,
							mapPid = playerState:getMapPid(),
							mapID = MapID,
							x = X + 1,
							y = Y + 1,
							guildID = 0,
							camp = Camp,
							groupID = GroupID,
							petEts = PetEts,
							playerEts = PlayerEts,
							monsterEts = MonsterEts
						},
						playerPet:spawnMonster(Arg);
					_ ->
						?ERROR("GM Add MonsterID:~p failed,not cfg", [MonsterID])
				end
				  end,
			%% 循环创建怪
			List = lists:seq(1, Number),
			lists:foreach(Fun, List),
			io_lib:format("addmonster success: [~p], Number: [~p] Camp:[~w]", [MonsterID, Number, Camp]);
		_ ->
			io_lib:format("addmonster failed: [~p] Camp:[~w]", [Params, Camp])
	end.

addmonster2(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MapID = playerState:getMapID(),
	Camp = ?CampMonsterEnemies,
	{X, Y} = playerState:getPos(),
	MonsterID = string_to_integer(SValue1),
	Number = string_to_integer(SValue2),
	GroupID = playerState:getGroupID(),
	MapPid = playerState:getMapPid(),
	case Number >= 1 of
		true ->
			Fun =
				fun(_I, AccList) ->
					PlayerEts = playerState:getMapPlayerEts(),
					MonsterEts = playerState:getMapMonsterEts(),
					PetEts = playerState:getMapPetEts(),

					case getCfg:getCfgPStack(cfg_monster, MonsterID) of
						#monsterCfg{} ->
							Arg = #recSpawnMonster{id = MonsterID,
								mapPid = MapPid,
								mapID = MapID,
								x = X + 1,
								y = Y + 1,
								guildID = 0,
								camp = Camp,
								groupID = GroupID,
								petEts = PetEts,
								playerEts = PlayerEts,
								monsterEts = MonsterEts
							},
							[Arg | AccList];
						_ ->
							AccList
					end
				end,
			List = lists:foldl(Fun, [], lists:seq(1, Number)),
			psMgr:sendMsg2PS(MapPid, gm_spawnMonster, List),
			io_lib:format("addmonster2 success: [~p], Number: [~p] Camp:[~w]", [MonsterID, Number, Camp]);
		_ ->
			io_lib:format("addmonster2 failed: [~p] Camp:[~w]", [Params, Camp])
	end.

addmonster3(_Params) ->
	MapID = playerState:getMapID(),
	Camp = ?CampMonsterEnemies,
	{X, Y} = playerState:getPos(),
	GroupID = playerState:getGroupID(),
	MapPid = playerState:getMapPid(),
	MonsterList = ets:tab2list(playerState:getMapMonsterEts()),
	Fun =
		fun(#recMapObject{id = MonsterID}, AccList) ->
			PlayerEts = playerState:getMapPlayerEts(),
			MonsterEts = playerState:getMapMonsterEts(),
			PetEts = playerState:getMapPetEts(),

			case getCfg:getCfgPStack(cfg_monster, MonsterID) of
				#monsterCfg{} ->
					Arg = #recSpawnMonster{id = MonsterID,
						mapPid = MapPid,
						mapID = MapID,
						x = X + 1,
						y = Y + 1,
						guildID = 0,
						camp = Camp,
						groupID = GroupID,
						petEts = PetEts,
						playerEts = PlayerEts,
						monsterEts = MonsterEts
					},
					[Arg | AccList];
				_ ->
					AccList
			end
		end,
	List = lists:foldl(Fun, [], MonsterList),
	psMgr:sendMsg2PS(MapPid, gm_spawnMonster, List),
	io_lib:format("addmonster3 success Number: [~p]", [erlang:length(List)]).

addmonster4([MonsterIDs|_]) ->
	MonsterID = string_to_integer(MonsterIDs),
	MapID = playerState:getMapID(),
	Camp = ?CampMonsterEnemies,
	{X, Y} = playerState:getPos(),
	MapPid = playerState:getMapPid(),

	PlayerEts = playerState:getMapPlayerEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	PetEts = playerState:getMapPetEts(),
	Arg = #recSpawnMonster{id = MonsterID,
		mapPid = MapPid,
		mapID = MapID,
		x = X + 1,
		y = Y + 1,
		guildID = 0,
		camp = Camp,
		groupID = 1,
		petEts = PetEts,
		playerEts = PlayerEts,
		monsterEts = MonsterEts
	},
	psMgr:sendMsg2PS(MapPid, gm_spawnMonster, [Arg]),
	ok.

%%创建一个采集物
addcollect(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	CollectID = string_to_integer(SValue1),
	Number = string_to_integer(SValue2),
	GroupID = playerState:getGroupID(),
	{X, Y} = playerState:getPos(),
	MapPid = playerState:getMapPid(),
	psMgr:sendMsg2PS(MapPid, addCollectToMap, {GroupID, [{CollectID, Number, X, Y}]}),
	io_lib:format("addcollect success: [~p], Number: [~p]", [CollectID, Number]).

%%创建一个NPC
addnpc(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	NpcID = string_to_integer(SValue1),
	GroupID = playerState:getGroupID(),
	{X, Y} = playerState:getPos(),
	MapPid = playerState:getMapPid(),
	psMgr:sendMsg2PS(MapPid, addNpcToMap, {GroupID, [{NpcID, 1, X, Y}]}),
	io_lib:format("addnpc success: [~p], Number: [~p]", [NpcID, 1]).

%%创建一个载体
addcarrier(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,

	CarrierID = string_to_integer(SValue1),
	MoveStatus = string_to_integer(SValue2),

	Camp = playerState:getCamp(),
	PetEts = playerState:getMapPetEts(),
	PlayerEts = playerState:getMapPlayerEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	BattleProp = playerCalcProp:getBattleProp(),
	TargetCode = playerState:getPlayerCode(),
	PkMode = playerState:getPkStatus(),
	TeamID = playerState:getTeamID(),
	GuildID = playerState:getGuildID(),
	ID = playerState:getAccountID(),
	{X, Y} = playerState:getPos(),
	CasterInfo = #recCasterInfo{
		casterId = ID,
		casterCode = TargetCode,
		casterPid = self(),
		casterType = ?AttackerTypePlayer,
		casterPkMode = PkMode
	},
	Arg = #recSpawnMonster{
		id = CarrierID,
		mapPid = playerState:getMapPid(),
		mapID = playerState:getMapID(),
		x = X,
		y = Y,
		camp = Camp,
		teamID = TeamID,
		guildID = GuildID,
		playerEts = PlayerEts,
		monsterEts = MonsterEts,
		petEts = PetEts,
		other = #recCallCarrier{
			moveAi = MoveStatus,
			lifeTime = 50000,
			releaseAi = 0,
			battleProp = BattleProp,
			targetCode = TargetCode,
			callCaster = CasterInfo
		}
	},
	playerPet:spawnCarrier(Arg),
	?INFO("createCarrier [~p]", [CarrierID]),
	ok.

%% 创建军团
createguild(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	playerGuild:createGuild(SValue1, erlang:list_to_integer(SValue2), []),
	ok.

%% 设置加入军团CD
clearguildcd(Params) when erlang:length(Params) =:= 1 ->
	[SValue1 | _] = Params,
	Type = string_to_integer(SValue1),
	RoleID = playerState:getRoleID(),
	case Type of
		1 -> playerGuild:recordExitGuildTime(RoleID, 0);
		2 -> playerGuild:recordExitGuildTime(RoleID, misc_time:gregorian_seconds_from_1970())
	end,
	ok;
clearguildcd(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	TargetRoleID = string_to_integer(SValue1),
	Type = string_to_integer(SValue2),
	case Type of
		1 -> playerGuild:recordExitGuildTime(TargetRoleID, 0);
		2 -> playerGuild:recordExitGuildTime(TargetRoleID, misc_time:gregorian_seconds_from_1970())
	end,
	ok.

%% 机器人进BOSS战
worldboss(_Params) ->
%%	playerWorldBossWar:enterParallelUniverseRequest(),
	ok.

%% 删除军团
deleteguild(Params) when erlang:length(Params) >= 0 ->
	playerGuild:deleteGuild(),
	ok.

%% 踢军团人
kickguildmember(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	RoleID = string_to_integer(SValue1),
	playerGuild:kickGuild(RoleID),
	ok.

%% 任命权限
changememberlevel(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	playerGuild:giveGuildPower(string_to_integer(SValue1), string_to_integer(SValue2)),
	ok.

%% 查询军团列表
queryguild1(Params) when erlang:length(Params) >= 0 ->
	playerGuild:guildList(1),
	ok.

%% 打印结果
queryguild2(Params) when erlang:length(Params) >= 0 ->
	L = playerState:getGuildList(),
	?DEBUG("guild list:~p", [L]),
	ok.

%% 查询自己的军团信息
queryguild3(Params) when erlang:length(Params) >= 0 ->
	Info = playerState:getSelfGuildInfo(),
	GuildID = playerState:getGuildID(),
	GuildName = playerState:getGuildName(),
	io_lib:format("print self guild msg:~s,~p,~p", [GuildName, GuildID, Info]).

%% 修改公告
changeguildnotice(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	playerGuild:changeGuildNotice(SValue1),
	ok.

%% 军团捐献
guilddonate(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MoneyType = string_to_integer(SValue1),
	MoneyNumber = string_to_integer(SValue2),
	playerGuild:playerDonateMoney(#pk_U2GS_DonateMoney{moneyType = MoneyType, moneyNumber = MoneyNumber}),
	ok.

%% 进入目标军团驻地
enterguildhome([]) ->
	SelfGuildID = playerState:getGuildID(),
	playerGuildFairground:enter_try(SelfGuildID),
	ok;
enterguildhome(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	playerGuildFairground:enter_try(Value),
	ok.

%% 使用游乐场设施
useguildride(_) ->
	ok.
%%useguildride(Params) when erlang:length(Params) >= 2 ->
%%	[P1 | T1] = Params,
%%	[P2 | _] = T1,
%%%%	playerGuildFairground:onUseRide(erlang:list_to_integer(P1), erlang:list_to_integer(P2)).
%%	ok.

%% 检修游乐场设施
pitguildride(_Params) ->
%%	psMgr:sendMsg2PS(?PsNameGuild, guildFairground_pit, 0).
	ok.

%%% 清空放弃任务CD
%clearguildtask(Params) when erlang:length(Params) >= 0 ->
%	RoleID = playerState:getRoleID(),
%	Key1 = {RoleID, 1},
%	Key2 = {RoleID, 2},
%	case Params of
%		[] ->
%			playerDaily:zeroDailyCount(?DailyType_GuildHomeTask, 1),
%			playerDaily:zeroDailyCount(?DailyType_GuildHomeTask, 2),
%
%			case edb:dirtyReadRecord(rec_guild_task, Key1) of
%				[#rec_guild_task{} = Task] ->
%					edb:dirtySave(rec_guild_task, Key1, Task#rec_guild_task{curTimes = 0, maxTimes = 5}, new_rec_guild_task, update_rec_guild_task);
%				_ ->
%					skip
%			end,
%			case edb:dirtyReadRecord(rec_guild_task, Key2) of
%				[#rec_guild_task{} = Task2] ->
%					edb:dirtySave(rec_guild_task, Key2, Task2#rec_guild_task{curTimes = 0, maxTimes = 5}, new_rec_guild_task, update_rec_guild_task);
%				_ ->
%					skip
%			end,
%			ok;
%		_ ->
%			case edb:dirtyReadRecord(rec_guild_task, Key1) of
%				[#rec_guild_task{} = Task] ->
%					edb:dirtySave(rec_guild_task, Key1, Task#rec_guild_task{freshTime = 1}, new_rec_guild_task, update_rec_guild_task);
%				_ ->
%					skip
%			end,
%			case edb:dirtyReadRecord(rec_guild_task, Key2) of
%				[#rec_guild_task{} = Task2] ->
%					edb:dirtySave(rec_guild_task, Key2, Task2#rec_guild_task{freshTime = 1}, new_rec_guild_task, update_rec_guild_task);
%				_ ->
%					skip
%			end,
%			ok
%	end,
%	ok.

%printguildtask(_Params) ->
%	RoleID = playerState:getRoleID(),
%	Str1 =
%		case edb:dirtyReadRecord(rec_guild_task, {RoleID, 1}) of
%			[#rec_guild_task{taskID = ID1, taskType = T1, targetGuildID = TGID1, targetRoleID = TRID1, curTimes = C1, maxTimes = M1} = Task] ->
%				io_lib:format("task1:id=~p,type=~p,tgid=~p,trid=~p,ct=~p,mt=~p,n1=~p,n2=~p,n3=~p",
%					[ID1, T1, TGID1, TRID1, C1, M1, Task#rec_guild_task.number1, Task#rec_guild_task.number2, Task#rec_guild_task.number3]);
%			_ ->
%				"not found CT"
%		end,
%
%	Str2 =
%		case edb:dirtyReadRecord(rec_guild_task, {RoleID, 2}) of
%			[#rec_guild_task{taskID = ID2, taskType = T2, targetGuildID = TGID2, targetRoleID = TRID2, curTimes = C2, maxTimes = M2} = Task2] ->
%				io_lib:format("task2:id=~p,type=~p,tgid=~p,trid=~p,ct=~p,mt=~p,n1=~p,n2=~p,n3=~p",
%					[ID2, T2, TGID2, TRID2, C2, M2, Task2#rec_guild_task.number1, Task2#rec_guild_task.number2, Task2#rec_guild_task.number3]);
%			_ ->
%				"not found XL"
%		end,
%	io_lib:format("guildTask:~ts --- ~ts", [Str1, Str2]).

%updateguildtask(Params) when erlang:length(Params) >= 1 ->
%	[SValue1 | _Params1] = Params,
%	TaskType = string_to_integer(SValue1),
%	RoleID = playerState:getRoleID(),
%	Key = {RoleID, TaskType},
%	case edb:dirtyReadRecord(rec_guild_task, Key) of
%		[#rec_guild_task{number1 = Number1} = Task] ->
%			%% 判断任务是否完成
%			case playerGuildHome:getTaskState(Task) of
%				2 ->
%					NewTask = Task#rec_guild_task{number1 = Number1 + 1},
%
%					%% 保存
%					edb:dirtySave(rec_guild_task, Key, NewTask, new_rec_guild_task, update_rec_guild_task),
%
%					%% 刷新客户端
%					ClientTask = playerGuildHome:getGuildTaskClientStruct(NewTask),
%					playerMsg:sendNetMsg(#pk_GS2U_GuildTask{tasks = [ClientTask]}),
%
%					%% 打印一个任务列表
%					printguildtask([]);
%				_ ->
%					skip
%			end;
%		_ ->
%			notfoundtask
%	end,
%	ok.

addchangeguildname(_) ->
	case playerState:getGuildID() of
		0 -> skip;
		GuildID ->
			case ets:lookup(rec_guild_ext, GuildID) of
				[#rec_guild_ext{canRename = Can}] when Can > 0 -> ok;
				[#rec_guild_ext{} = GuildExt] ->
					ets:update_element(rec_guild_ext, #rec_guild_ext.canRename, 1),
					guildLogic:saveToMySql(GuildExt#rec_guild_ext{canRename = 1}),
					ok;
				_ ->
					R = #rec_guild_ext{guildID = GuildID, canRename = 1},
					ets:insert(rec_guild_ext, R),
					guildLogic:saveToMySql(R),
					ok
			end,
			ok
	end.

%% 修改军团名
changeguildname(Params) when erlang:length(Params) >= 1 ->
	[GuildName | Other1] = Params,
	case Other1 of
		[] ->
			%% 直接修改，不扣道具
			playerGuild:changeGuildName2(GuildName);
		_ ->
			%% 要走扣道具流程
			playerGuild:changeGuildName(GuildName)
	end.

%%设置角色可以改名
addchangename(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Flag = string_to_integer(SValue1),
	RoleID = playerState:getRoleID(),
	playerSave:saveCanReName(RoleID, Flag),
	ok.

changename(Params) when erlang:length(Params) >= 1 ->
	[RealName | _Other1] = Params,
	playerLogin:changeName(playerState:getRoleID(), RealName).

%% 家族系统-女神祈福
guild_godbless(Params) when erlang:length(Params) >= 1 ->
	[Type | _] = Params,
	TypeReal = erlang:list_to_integer(Type),
	playerGuild:godBless(TypeReal).

%% 家族系统-女神祈福 设置祈福进度
guild_godbless_s(Params) when erlang:length(Params) >= 1 ->
	case playerState:getGuildID() of
		0 ->
			skip;
		GuildID ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{} = Guild] ->
					[Schedule | _] = Params,
					NewGuild = Guild#rec_guild{godBless = erlang:list_to_integer(Schedule)},
					ets:insert(rec_guild, NewGuild),
					guildLogic:saveToMySql(NewGuild);
				_ ->
					skip
			end
	end.

%% 家族系统-家族商店
guild_shopbuy([ID]) ->
	IDReal = erlang:list_to_integer(ID),
	playerGuild:shopBuy(IDReal, 1);
guild_shopbuy([ID, Count]) ->
	IDReal = erlang:list_to_integer(ID),
	CountReal = erlang:list_to_integer(Count),
	playerGuild:shopBuy(IDReal, CountReal).

%% 家族系统-兑换功能
guild_exchange(Params) when erlang:length(Params) >= 2 ->
	[ID | T0] = Params,
	[Level | _] = T0,
	IDReal = erlang:list_to_integer(ID),
	LevelReal = erlang:list_to_integer(Level),
	playerGuild:exchange(IDReal, LevelReal).

%% 家族系统-去掉自己所在公会的发布招募CD
guild_clearrcd(_Params) ->
	case playerState:getGuildID() of
		0 ->
			skip;
		GuildID ->
			ets:update_element(rec_guild, GuildID, {#rec_guild.recruit, 0})
	end.

%% 家族系统-堆雪人活动-在非活动时间可使用该命令创建活动地图，以这种方式创建的活动地图无法以心跳驱动
snowman_create(_) ->
	playerGuildSnowman:enterTry(true).

%% 家族系统-堆雪人活动-如果自己在GM创建的活动地图中，该命令可驱动地图切换到下一个阶段
snowman_next(_) ->
	playerGuildSnowman:gmNext().

%% 家族系统-堆雪人活动-模拟客户端-检测雪人状态
snowman_checksnowman(_) ->
	playerGuildSnowman:checkSnowman().

%% 家族系统-堆雪人活动-模拟客户端-捐赠材料 0表示全部类型，其它参考cfg_guildsnowman
snowman_donate(Params) when erlang:length(Params) >= 1 ->
	[ID | T] = Params,
	[SnowmanID | _] = T,
	playerGuildSnowman:donate({erlang:list_to_integer(ID), erlang:list_to_integer(SnowmanID)}).

%% 家族系统-堆雪人活动-模拟客户端-领取指定雪人礼盒
% 20170223 废弃客户端主动请求领奖，改为活动结算时主动发奖
%snowman_reward(Params) when erlang:length(Params) >= 1 ->
%	[ID|_] = Params,
%	playerGuildSnowman:reward(erlang:list_to_integer(ID)).

%% 家族系统-堆雪人活动-直接获取指定ID的资源，无法超过携带上限
snowman_getres(Params) when erlang:length(Params) >= 2 ->
	[ID | T] = Params,
	[Count | _] = T,
	playerGuildSnowman:gmGetRes({erlang:list_to_integer(ID), erlang:list_to_integer(Count)}).

%%领取激活码
activecode(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	playerActiveCode:getActiveCodeRequest(SValue1),
	?INFO("activecode [~p]", [SValue1]),
	ok.

%% 挖宝地图传送
digtm(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MapID = erlang:list_to_integer(SValue1),
	Pk = #pk_U2GS_DigTransferMap{mapId = MapID, waypointName = "startpoint1"},
	playerMsg:dealNetMsgMain(?CMD_U2GS_DigTransferMap, Pk),
	ok.

petattaadd(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Num = erlang:list_to_integer(SValue1),
	case playerPet:getPetBattle() of
		#recPetInfo{pet_id = PetID} ->
			playerPet:petAttaAdd(PetID, Num);
		_ ->
			skip
	end.

%% "mallbuy bid itemId itemCount coinType", "模拟商城购买"
mallbuy(Params) when erlang:length(Params) >= 4 ->
	[BidStr | T1] =  Params,
	[ItemIDStr | T2] =  T1,
	[ItemCountStr | T3] =  T2,
	[CoinType | _T4] =  T3,
	playerMall:mallBuyRequest(
		#pk_U2GS_ItemBuyRequest{
			tarRoleID = 0,
			db_id = erlang:list_to_integer(BidStr),
			itemid = erlang:list_to_integer(ItemIDStr),
			itemnum = erlang:list_to_integer(ItemCountStr),
			moneytype = erlang:list_to_integer(CoinType)
		},
		?MallSendType_Mall
	).

%%加防
adddef(Params) ->
	N = case Params of
			[Num | _] ->
				string_to_integer(Num);
			_ ->
				100000
		end,
	?INFO("gm cmd adddef:~p", [N]),
	playerBuff:addProp(1, [{?Prop_PhysicalDefence, N, 0}, {?Prop_MagicDefence, N, 0}], true),
	ok.

addspeed(Params) ->
	?INFO("gm cmd addspeed"),
	V1 =
		case Params of
			[V0|_] ->
				string_to_number(V0);
			_ ->
				10
		end,
	playerBuff:addProp(1, [{?Prop_MoveSpeed, V1, 0}], true),
	ok.

%%加攻
addattack(Params) ->
	N = case Params of
			[Num | _] ->
				string_to_integer(Num);
			_ ->
				100000
		end,
	?INFO("gm cmd addattack ~p", [N]),
	playerBuff:addProp(1, [{?Prop_PhysicalAttack, N, 0}, {?Prop_MagicAttack, N, 0}], true),
	ok.

%%增加属性
addprop(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Params1] = Params,
	[SValue2 | _] = Params1,
	PropKey = string_to_integer(SValue1),
	ProValue = string_to_integer(SValue2),
	case PropKey =< ?PropMax of
		true ->
			playerBuff:addProp(1, [{PropKey, ProValue, 0}], true);
		_ ->
			%%"prop not find"
			skip
	end,
	ok.

addteam(_Params) ->
	playerTeam:teamOperate(?TeamOP_Create, 101,0).
%%	case playerTeam2:gm_createTeam() of
%%		true ->
%%			"success";
%%		_ ->
%%			"failed"
%%	end.

%%商城显示请求
mallshow(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Seed = string_to_integer(SValue1),
	playerMall:requestMallInfo(Seed, ?MallSendType_PushBuy),
	ok.

%%重新同步玩家周围的对象
sync9(Params) when erlang:length(Params) >= 0 ->
	playerMap:sync9GridInfo(),
	ok.

crack(Params) when erlang:length(Params) >= 0 ->
	crack(),
	ok.

crack() ->
	crack2(),

	%%开启觉醒功能
%%	playerGoddess:gmWakeUp(),
	ok.

crack2() ->
	L = getCfg:get1KeyList(cfg_mainMenu),
	Fun = fun(ID) ->
		case getCfg:getCfgByArgs(cfg_mainMenu, ID) of
			#mainMenuCfg{type = 2, parameters = TaskID} ->
				%% 打开所有需要接任务才打开的功能
				playerTask:acceptTask(TaskID, 0);
			#mainMenuCfg{type = 3, parameters = TaskID} ->
				%% 打开所有需要完成任务才打开的功能
				case playerTask:acceptTask(TaskID, 0) of
					false ->
						skip;
					_ ->
						playerTask:gmSubmitTask(TaskID)
				end;
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, L),

	%% 飘浮之石功能开关
	floating(),

	%% 开启聊天
	case getCfg:getCfgPStack(cfg_globalsetup, chat_task) of
		#globalsetupCfg{setpara = [ChatTaskID]} ->
			case playerTask:acceptTask(ChatTaskID, 0) of
				false ->
					skip;
				_ ->
					playerTask:gmSubmitTask(ChatTaskID)
			end;
		_ ->
			skip
	end,

	ok.

floating() ->
	L = getCfg:get1KeyList(cfg_floatingClue),
	floating(L).
floating([]) ->
	ok;
floating([CfgID | T]) ->
	case getCfg:getCfgByKey(cfg_floatingClue, CfgID) of
		#floatingClueCfg{pieceid = PieceID,type = Type,condid = Condid} ->
			playerFloatingManual:updateFloating({Type,Condid}),
			playerFloatingManual:requstFloatingAward({PieceID});
		_ ->
			skip
	end,
	floating(T).


floatingAll(Params) when erlang:length(Params) >= 0 ->
	floating2(),
	ok.
floating2() ->
	L = getCfg:get1KeyList(cfg_floatingClue),
	floating2(L).
floating2([]) ->
	ok;
floating2([CfgID | T]) ->
	case getCfg:getCfgByKey(cfg_floatingClue, CfgID) of
		#floatingClueCfg{type = Type,condid = Condid} ->
			playerFloatingManual:updateFloating({Type,Condid});
		_ ->
			skip
	end,
	floating2(T).
updatingPice([Params]) ->
	Flag = string_to_integer(Params),
	updatingPice(1,Flag),
	ok.

updatingPice(ID,Max)->
	case getCfg:getCfgByKey(cfg_floatingClue, ID) of
		#floatingClueCfg{type = Type,condid = Condid} ->
			playerFloatingManual:updateFloating({Type,Condid}),
			case ID<Max of
				true->
					updatingPice(ID+1,Max);
				_->
					skip
			end;
		_ ->
			skip
	end,
	ok.


%%显示功能按钮
%% 20170225 张建生需求更新tt功能
%% 	参考QA提供的“GM命令表tt不能获取的材料.txt”
%%	实际上tt需要添加上述文档需要的材料，文档名说不需要是版署不需要
tt(Params) when erlang:length(Params) >= 0 ->
	%% 0.设置引导标记为极大值用于跳过引导
	playerVariant:setPlayerVariant(?Setting_ClientVar_FirestEnterInstance114, 65535),
	%% 1.提升角色等级到最大值
	MaxLevel = playerState2:getWorldMaxLevel(),
	setlevel(erlang:integer_to_list(MaxLevel)),
	%% 2.添加货币
	tt_addCoin(),
	%% 3.添加道具（仅添加1个骑宠）
	tt_addItem(),
	%% 4.添加装备
	tt_addEquip(MaxLevel),
	%% 5.开启功能
	crack(),
	ok.

tt_addCoin() ->
	addcoin(["1", "999999999"]),	%% 金币
	addcoin(["3", "999999999"]),	%% 钻石
	addcoin(["6", "999999999"]),	%% 绑钻
	addcoin(["12", "999999"]).		%% 帮贡

tt_addItem() ->
	ListItem = getCfg:get1KeyList(cfg_item),
	tt_addItem(ListItem).
tt_addItem([]) ->
	ok;
tt_addItem([ID | T]) ->
	case getCfg:getCfgByKey(cfg_item, ID) of
		#itemCfg{itemType = ?ItemTypeMount} ->
			additem([erlang:integer_to_list(ID), "1"]);
		_ ->
			tt_addItem(T)
	end.

tt_addEquip(MaxLevel) ->
	ListEquip = getCfg:get1KeyList(cfg_equipment),
	ListCfg = [getCfg:getCfgByKey(cfg_equipment, Key) || Key <- ListEquip],
	Career = playerState:getCareer(),
	FunFindWeaponNeed =
		fun(SkillID, Acc) ->
			case getCfg:getCfgByKey(cfg_skill, SkillID) of
				#skillCfg{skillClass = Career, weaponNeed = WeaponNeed} when WeaponNeed > 0 ->
					{true, WeaponNeed};
				_ ->
					Acc
			end
		end,
	{_, WeaponNeed} = misc:foldlEx(FunFindWeaponNeed, {false, 0}, getCfg:get1KeyList(cfg_skill)),
	ListWant = tt_addEquip(ListCfg, ?Career2CareerBase(Career), WeaponNeed, [], MaxLevel),
	lists:foreach(fun additem/1, ListWant).
tt_addEquip([], _CareerBase, _WeaponNeed, Acc, _MaxLevel) ->
	[[erlang:integer_to_list(ID), "1"] || {_Pos, ID, _Quality, _Level} <- Acc];
tt_addEquip(
	[
		#equipmentCfg{
			qualityType = Quality,
			type = 0 = Pos,	%% 武器需要特殊处理，因为需要匹配技能
			subType = WeaponNeed,
			equipLevel = Level,
			iD = ID
		} | T
	], CareerBase, WeaponNeed, Acc, MaxLevel
) when Level =< MaxLevel ->
	case lists:keyfind(Pos, 1, Acc) of
		false ->
			tt_addEquip(T, CareerBase, WeaponNeed, [{Pos, ID, Quality, Level} | Acc], MaxLevel);
		{_, _, Quality_, _} when Quality > Quality_ ->
			tt_addEquip(T, CareerBase, WeaponNeed, lists:keyreplace(Pos, 1, Acc, {Pos, ID, Quality, Level}), MaxLevel);
		{_, _, Quality, Level_} when Level > Level_ ->
			tt_addEquip(T, CareerBase, WeaponNeed, lists:keyreplace(Pos, 1, Acc, {Pos, ID, Quality, Level}), MaxLevel);
		_ ->
			tt_addEquip(T, CareerBase, WeaponNeed, Acc, MaxLevel)
	end;
tt_addEquip(
	[
		#equipmentCfg{
			qualityType = Quality,
			type = Pos,
			class = CareerBase,
			equipLevel = Level,
			iD = ID
		} | T
	], CareerBase, WeaponNeed, Acc, MaxLevel
) when Level =< MaxLevel, Pos =/= 0 ->
	case lists:keyfind(Pos, 1, Acc) of
		false ->
			tt_addEquip(T, CareerBase, WeaponNeed, [{Pos, ID, Quality, Level} | Acc], MaxLevel);
		{_, _, Quality_, _} when Quality > Quality_ ->
			tt_addEquip(T, CareerBase, WeaponNeed, lists:keyreplace(Pos, 1, Acc, {Pos, ID, Quality, Level}), MaxLevel);
		{_, _, Quality, Level_} when Level > Level_ ->
			tt_addEquip(T, CareerBase, WeaponNeed, lists:keyreplace(Pos, 1, Acc, {Pos, ID, Quality, Level}), MaxLevel);
		_ ->
			tt_addEquip(T, CareerBase, WeaponNeed, Acc, MaxLevel)
	end;
tt_addEquip([_H | T], CareerBase, WeaponNeed, Acc, MaxLevel) ->
	tt_addEquip(T, CareerBase, WeaponNeed, Acc, MaxLevel).

qat(_) ->
	ListItem = getCfg:get1KeyList(cfg_item),
	qat_(ListItem),
	lists:foreach(
		fun additem/1,
		[
			["2160", "999"],	%% 升级骑宠
			["2161", "999"],	%% 升级骑宠
			["2162", "999"],	%% 升级骑宠
			["11000", "999"],	%% 突破骑宠
			["201", "999"],		%% 洗练骑宠技能
			["20", "999"],		%% 兑换时装
			["222", "999"],		%% 精炼装备
			["223", "999"],		%% 精炼装备
			["224", "999"],		%% 精炼装备
			["225", "999"],		%% 精炼装备
			["226", "999"],		%% 精炼装备
			["227", "999"],		%% 精炼装备
			["7000", "999"],	%% 合成装备
			["7001", "999"],	%% 合成装备
			["7002", "999"],	%% 合成装备
			["7022", "999"],	%% 合成装备
			["2002", "999"]		%% 兑换骑宠
		]
	).
qat_([]) ->
	ok;
qat_([ID | T]) ->
	case getCfg:getCfgByKey(cfg_item, ID) of
		#itemCfg{itemType = ?ItemTypeMount} ->
			additem([erlang:integer_to_list(ID), "1"]);
		#itemCfg{itemType = ?ItemTypeGem} ->
			additem([erlang:integer_to_list(ID), "999"]);
		_ ->
			skip
	end,
	qat_(T).

tt2(Params) when erlang:length(Params) >= 0 ->
%%	execGMCmd("addattack", ["100000000"]),
%%	execGMCmd("adddef", ["100000000"]),
%%	execGMCmd("addspeed", ["20"]),
	playerBuff:addProp(1,
		[
			{?Prop_MaxHP, 99999999, 0},
			{?Prop_MoveSpeed, 10, 0},
			{?Prop_HitLevel, 9999999, 0},
			{?Prop_MagicAttack, 9999999, 0},
			{?Prop_PhysicalAttack, 9999999, 0},
			{?Prop_PhysicalDefence, 9999999, 0},
			{?Prop_MagicDefence, 9999999, 0}
		]
		, true),
	ok.

addequip(Params) when erlang:length(Params) >= 1 ->
	[LevelString | _] = Params,
	Level = erlang:list_to_integer(LevelString),
	CareerBase = ?Career2CareerBase(playerState:getCareer()),
	FunAdd =
		fun(Key) ->
			case getCfg:getCfgByKey(cfg_equipment, Key) of
				#equipmentCfg{equipLevel = Level, qualityType = Quality, class = Class} when Class =:= CareerBase orelse Class =:= 0 ->
					execGMCmd("additem", [erlang:integer_to_list(Key), "1", "0", erlang:integer_to_list(Quality)]);
				_ ->
					skip
			end
		end,
	lists:foreach(FunAdd, getCfg:get1KeyList(cfg_equipment)).

addpet(_) ->
	FunAddItem =
		fun(IDMin, IDMax, Interaction, Count) ->
			lists:foreach(
				fun(ID) ->
					execGMCmd("additem", [erlang:integer_to_list(ID), erlang:integer_to_list(Count)])
				end,
				lists:seq(IDMin, IDMax, Interaction)
			)
		end,
	%% 骑宠
	FunAddItem(1811, 1813, 1, 1),			%% 骑宠小队1
	FunAddItem(1821, 1827, 1, 1),			%% 骑宠小队1
	FunAddItem(1831, 1838, 1, 1),			%% 骑宠小队1
	FunAddItem(1841, 1848, 1, 1),			%% 骑宠小队1
	FunAddItem(1851, 1859, 1, 1),			%% 骑宠小队1
	ok.

querypet([]) ->
	FunFind =
		fun
			(#recPetInfo{pet_status = Status, pet_id = ID}, {_, _}) when Status >= ?PetState_Battle_Show ->
				{true, ID};
			(_, Acc) ->
				Acc
		end,
	case misc:foldlEx(FunFind, {false, 0}, playerState:getPets()) of
		{true, PetID} ->
			P = playerPetProp:getPetProps(PetID),
			FunForce =
				fun
					(#recPetInfo{pet_force = F, pet_id = ID}, {_, _}) ->
						case ID =:= PetID of
							true ->
								{true, F};
							_ ->
								{false, 0}
						end
				end,
			{_, F} = misc:foldlEx(FunForce, {false, 0}, playerState:getPets()),
			?DEBUG("[DebugForPetTerritory] ID:~wF:~w~n~p", [PetID, F, P]),
			ok;
		_ ->
			none
	end;
querypet(Params) ->
	[PetIDStr | _] = Params,
	PetID = string_to_integer(PetIDStr),
	case playerPetProp:getPetProps(PetID) of
		[] ->
			none;
		P ->
			FunForce =
				fun
					(#recPetInfo{pet_force = F, pet_id = ID}, {_, _}) ->
						case ID =:= PetID of
							true ->
								{true, F};
							_ ->
								{false, 0}
						end
				end,
			{_, F} = misc:foldlEx(FunForce, {false, 0}, playerState:getPets()),
			?DEBUG("[DebugForPetTerritory] ID:~wF:~w~n~p", [PetID, F, P]),
			ok
	end.

addrob(Params) when erlang:length(Params) >= 0 ->
	RoleID = playerState:getRoleID(),
	Pid = playerRob:createRob(RoleID),
	MapID = playerState:getMapID(),
	MapPID = playerState:getMapPid(),
	{X, Y} = playerState:getPos(),

	Type = case Params of
			   [TypeStr|_] ->
				   T = string_to_integer(TypeStr),
				   case T of
					   ?RobType_CopyMap -> T;
					   ?RobType_NormalMapFollow -> T;
					   ?RobType_NormalMap -> T;
					   _ -> ?RobType_NormalMapFollow
				   end;
			   _ -> ?RobType_NormalMapFollow
		   end,

	Number =
		case Params of
			[_, NS|_] -> erlang:min(string_to_integer(NS), 8);
			_ -> 1
		end,
	F =
		fun(_) ->
			LoadRob = #rec_LoadRobData{
				robType = Type,
				robRoleID = RoleID,
				robEnterMap = #rec_RobEnterMap{
					mapID = MapID,
					mapPID = MapPID,
					x = X,
					y = Y
				},
				param = playerState:getPlayerCode()
			},
			playerRob:sendToMeLoadRobRoleData(Pid, LoadRob)
		end,
	lists:foreach(F, lists:seq(1, erlang:max(1, Number))),
	ok.

queryrob(Params) when erlang:length(Params) >= 0 ->
	F =
		fun(#recMapObject{code = Code, id = ID}, Acc) ->
			case ID of
				0 -> [Code | Acc];
				_ -> Acc
			end
		end,
	List = ets:foldl(F, [], playerState:getMapPlayerEts()),
	io_lib:format("find rob number:~p, list:~p", [erlang:length(List), List]).

robotitem(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	ItemID = string_to_integer(SValue1),
	ItemNumber = string_to_integer(SValue2),
	OpType = string_to_integer(SValue3),
	case OpType of
		1 ->
			BagID = playerPackage:getPackageTypeByItemID(ItemID),
			case playerPackage:getBagIdleSlotNum(BagID) of
				0 ->
					%% 空间不足，清空背包
					gmdeleteItem(BagID);
				_ ->
					skip
			end,
			%% 创建
			PLog = #recPLogTSItem{
				old = 0,
				new = 1,
				change = 1,
				target = ?PLogTS_System,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = 0,
				reasonParam = 1313
			},
			playerPackage:addGoodsAndMail(ItemID, ItemNumber, true, 0, PLog);
		2 ->
			%% 使用
			playerPackage:useItemByID(ItemID, ItemNumber, false)
	end,
	ok.


%%-endif.

%% 设置地图允许进入最大人数限制(仅测试用)
setmlpm(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MapID = string_to_integer(SValue1),
	Number = string_to_integer(SValue2),
	core:sendMsgToMapMgr(MapID, gm_setmlpm, {MapID, Number}),
	ok.

%% 设置地图昼夜,0取消强制，1白天，2黑夜
setmapday(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MapID = playerState:getMapID(),
	Day = string_to_integer(SValue1),
	core:sendMsgToMapMgr(MapID, gm_setmapday, {MapID, Day}),
	ok.

%% 手动刷新神秘商店
freshmsshop(Params) when erlang:length(Params) >= 0 ->
	case Params of
		[] ->
			%% 不要钱刷新
			playerMSShop:freshMysteriousShopReal();
		_ ->
			%% 正常刷新流程
			playerMSShop:freshMSShop()
	end.

%%商城添加新道具
malladdnewitem(Params) when erlang:length(Params) >= 8 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | Other5] = Other4,
	[SValue6 | Other6] = Other5,
	[SValue7 | Other7] = Other6,
	[SValue8 | _Other8] = Other7,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	Diamond = string_to_integer(SValue4),
	BDiamond = string_to_integer(SValue5),
	UseInterget = string_to_integer(SValue6),
	GetInterget = string_to_integer(SValue7),
	Sort = string_to_integer(SValue8),
	MallList = #rec_mall{dbID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
		itemID = ItemID,
		sort = Sort,
		type = Type1,
		type1 = Type2,
		diamond = Diamond,
		bindDiamond = BDiamond,
		useIntegral = UseInterget,
		getIntegral = GetInterget},

%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, malladdnewitem, {MallList}, ?Start_Link_TimeOut_ms),
	?DEBUG("execGM  malladdnewitem Ret:~p", [Ret]),
	ok.

%%商城删除道具
malldelitem(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, malldelitem, {Db_ID}, ?Start_Link_TimeOut_ms),
	?DEBUG("execGM  malldelitem Ret:~p", [Ret]),
	ok.
%%商城设置限购
mallsetlimitbuy(Params) when erlang:length(Params) >= 5 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | _Other5] = Other4,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	LimitBuy = string_to_integer(SValue4),
	LimitType = string_to_integer(SValue5),
	BeginTime = misc_time:utc_seconds() + 1,
	EndTime = BeginTime + 60,

	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, mallsetlimitbuy, {Db_ID, LimitBuy, LimitType, BeginTime, EndTime}, ?Start_Link_TimeOut_ms),
	?DEBUG("execGM  mallsetlimitbuy Ret:~p", [Ret]),
	ok.
%%商城设置赠送
mallsetbuysend(Params) when erlang:length(Params) >= 5 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | _Other5] = Other4,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	SendID = string_to_integer(SValue4),
	SendNum = string_to_integer(SValue5),

	BeginTime = misc_time:utc_seconds(),
	EndTime = BeginTime + 60,
	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
	SendBuy = #sendbuy{db_id = Db_ID,
		sendItem = SendID,
		sendNum = SendNum,
		sendBeginTime = BeginTime,
		sendAfterTime = EndTime},
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, mallsetbuysend, {SendBuy}, ?Start_Link_TimeOut_ms),
	?DEBUG("execGM  mallsetbuysend Ret:~p", [Ret]),
	ok.
%%商城设置上下架时间
mallsetbuytime(Params) when erlang:length(Params) >= 8 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | Other5] = Other4,
	[SValue6 | Other6] = Other5,
	[SValue7 | Other7] = Other6,
	[SValue8 | _Other8] = Other7,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	Diamond = string_to_integer(SValue4),
	BDiamond = string_to_integer(SValue5),
	UseInterget = string_to_integer(SValue6),
	GetInterget = string_to_integer(SValue7),
	Sort = string_to_integer(SValue8),
	BeginTime = misc_time:utc_seconds() + 1,
	EndTime = BeginTime + 60,
	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
	MallList = #rec_mall{dbID = Db_ID,
		itemID = ItemID,
		sort = Sort,
		type = Type1,
		type1 = Type2,
		diamond = Diamond,
		bindDiamond = BDiamond,
		useIntegral = UseInterget,
		getIntegral = GetInterget,
		beginTime = BeginTime,
		endTime = EndTime},
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, mallsetbuytime, {MallList}, ?Start_Link_TimeOut_ms),
	?DEBUG("execGM  mallsetbuytime Ret:~p", [Ret]),
	ok.
%%修改折扣
mallsetrebate(Params) when erlang:length(Params) >= 4 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | _Other4] = Other3,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	Rebate = string_to_integer(SValue4),
	BeginTime = misc_time:utc_seconds(),
	EndTime = BeginTime + 60,
	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, mallsetrebate, {Db_ID, Rebate, BeginTime, EndTime}, ?Start_Link_TimeOut_ms),
	?DEBUG("execGM  Ret:~p", [Ret]),
	ok.

%%更新成就进度
updateachieve(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	Num = string_to_integer(SValue3),
	case ID of
		0 ->
			Arg = [Num];
		_ ->
			Arg = [ID, Num]
	end,
	playerAchieve:achieveEvent(Type, Arg),
	ok.
%%添加成就
addachieve(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,

	Value1 = string_to_integer(SValue1),
	Value2 = string_to_integer(SValue2),
	playerAchieve:addAchieveValue(Value1, Value2),
	ok.
%%添加徽章
addbadge(_Params) when erlang:length(_Params) >= 1 ->
	%%暂时屏蔽徽章
	%[SValue1 | Other1] = _Params,
	%[SValue2 | _Other2] = Other1,
	%MapID = string_to_integer(SValue1),
	%ItemID = string_to_integer(SValue2),
	%%playerBadge:gmBadgeEvent(MapID, ItemID),
	ok.
%%增加经验
addexp(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Exp = string_to_integer(SValue1),
	playerBase:addExp(Exp, ?ExpSourceGM, 0),
	ok.

%%增加翅膀经验
addwingexp(Params) when erlang:length(Params) >= 1 ->
%%	[SValue1 | _Other1] = Params,
%%	Exp = string_to_integer(SValue1),
%%	playerWing:useWingItem(1, 0, Exp, Exp),
	ok.
%%增加经验
settalentflag(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Flag = string_to_integer(SValue1),
	playerState:setTalentGMFlag(Flag),
	ok.

%%设置神器技能是否消耗怒气
setcoucost(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Flag = string_to_integer(SValue1),
	playerState:setCourageCostFlag(Flag),
	ok.
%%根据角色名字传送到它所在的地图位置
warpto(Params) when erlang:length(Params) >= 1 ->
	[Name | _Other1] = Params,
	case playerMgrOtp:getOnlinePlayerInfoByName(Name) of
		#rec_OnlinePlayer{pid = PID, roleID = RoleID} ->
			case RoleID =:= playerState:getRoleID() of
				true ->
					skip;
				_ ->
					psMgr:sendMsg2PS(PID, requirePos, {?RequestTargetPlayerPos_GMWrapTo, RoleID})
			end;
		_ ->
			skip
	end,
	ok.
%%根据角色ID传送到它所在的地图位置
warp2(Params) when erlang:length(Params) >= 1 ->
	[SV | _Other1] = Params,
	RoleID = string_to_integer(SV),
	case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
		#rec_OnlinePlayer{pid = PID, roleID = RoleID} ->
			case RoleID =:= playerState:getRoleID() of
				true ->
					skip;
				_ ->
					psMgr:sendMsg2PS(PID, requirePos, {?RequestTargetPlayerPos_GMWrapTo, RoleID})
			end;
		_ ->
			skip
	end,
	ok.

%%增加限时骑宠
addexpresspet(Params) when erlang:length(Params) >= 1 ->
	[SV | _] = Params,
	PetID = string_to_integer(SV),
	playerPet:addExpressPet(PetID),
	ok.

%%获取当前所在地图线
ln(Params) when erlang:length(Params) =:= 0 ->
	MapID = playerState:getMapID(),
	MapPid = playerState:getMapPid(),
	{ok, #recMapInfo{id = MapID, line = Line, totalPlayerNum = Num}} = callMgrMap(MapID, getLineInfo, {MapPid}),
	io_lib:format("current map id:~p, map line id:~p, map line player num:~p", [MapID, Line, Num]).

%% 获取地图线路信息
ll(Params) when erlang:length(Params) =:= 0 ->
	ll(Params, playerState:getMapID());
ll(Params) when erlang:length(Params) >= 1 ->
	[Value | _Other1] = Params,
	ll(Params, string_to_integer(Value)).
ll(_, MapID) ->
	case callMgrMap(MapID, getLineList, {MapID}) of
		{ok, []} ->
			"current map no line";
		{ok, List} ->
			Fun = fun(#recMapInfo{totalPlayerNum = Num, line = Line}) ->
				io_lib:format("line id:~p, line player num:~p", [Line, Num])
				  end,
			lists:map(Fun, List)
	end.

hl(Params) when erlang:length(Params) >= 1 ->
	[Value | _Other1] = Params,
	hl(playerState:getMapID(), playerState:getMapPid(), string_to_integer(Value)).
hl(MapID, MapPid, Line) ->
	case canEnterMapLine(MapID, MapPid, Line) of
		true ->
			playerScene:requestEnterMapLine(MapID, Line);
		Str ->
			Str
	end.

wildboss(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	TargetMapID = string_to_integer(SValue1),
	TargetBossID = string_to_integer(SValue2),
	AddTime =
		case Other1 of
			[SValue2 | _Other2] -> string_to_integer(SValue2);
			_ -> 10
		end,
	NowTime = misc_time:gregorian_seconds_from_1970( ),
	FreshTime = NowTime + AddTime,
	case TargetMapID of
		0 ->
			%% 重置所有的野外BOSS
			Fun =
				fun(#recWildBossInfo{mapID = MapID, bossPid = BossPID, bossCode = BossCode, bossID = BossID} = Data, Acc) ->
					%% 发给地图销毁这个BOSS
					case erlang:is_pid(BossPID) andalso erlang:is_process_alive(BossPID) andalso BossCode > 0 of
						true ->
							?INFO("wildboss:~p, clear spawn:~p", [playerState:getRoleID(), Data]),
							psMgr:sendMsg2PS(BossPID, clearSpawn, [BossCode]);
						_ ->
							skip
					end,

					%% 设置BOSS死亡，以及下一次刷新时间
					myEts:updateEts(?TABLE_WildBoss, BossID,
						[
							{#recWildBossInfo.mapID, MapID},
							{#recWildBossInfo.bossPid, undefined},
							{#recWildBossInfo.bossCode, 0},
							{#recWildBossInfo.targetCode, 0},
							{#recWildBossInfo.isNotice, false},
							{#recWildBossInfo.isFresh, false},
							{#recWildBossInfo.nextRefreshTime, FreshTime}
						]),
					Msg = #pk_GS2U_NoticeWildBossDead{info = #pk_WildBossInfo{mapID = MapID,bossID = BossID, refreshTime = FreshTime}},
					psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {broadcast, Msg}),
					Acc
				end,
			ets:foldl(Fun, 0, ?TABLE_WildBoss),
			"reset all success";
		_ ->
			%% 重置指定地图的野外BOSS
			case myEts:lookUpEts(?TABLE_WildBoss, TargetBossID) of
				[#recWildBossInfo{bossPid = BossPID, bossCode = BossCode} = Data] ->
					%% 发给地图销毁这个BOSS
					case erlang:is_pid(BossPID) andalso erlang:is_process_alive(BossPID) andalso BossCode > 0 of
						true ->
							?INFO("wildboss:~p, targetmapid:~p, clear spawn:~p", [playerState:getRoleID(), TargetMapID, Data]),
							psMgr:sendMsg2PS(BossPID, clearSpawn, [BossCode]);
						_ ->
							skip
					end,

					%% 设置BOSS死亡，以及下一次刷新时间
					myEts:updateEts(?TABLE_WildBoss, TargetBossID,
						[
							{#recWildBossInfo.mapID, TargetMapID},
							{#recWildBossInfo.bossPid, undefined},
							{#recWildBossInfo.bossCode, 0},
							{#recWildBossInfo.targetCode, 0},
							{#recWildBossInfo.isNotice, false},
							{#recWildBossInfo.isFresh, false},
							{#recWildBossInfo.nextRefreshTime, NowTime + 10}
						]),
					Msg = #pk_GS2U_NoticeWildBossDead{info = #pk_WildBossInfo{mapID = TargetMapID,bossID =TargetBossID,  refreshTime = FreshTime}},
					psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {broadcast, Msg}),
					io_lib:format("reset ~p success", [TargetMapID]);
				_ ->
					"TargetBossID error"
			end
	end.

querywildboss(_) ->
	playerWildBoss:queryMapBoss(getSelectMonster()).

escort(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type of
		1 -> playerEscort:requestEscortSolo();
		2 -> playerEscort:requestEscortTeam();
		3 -> playerEscort:requestEscortRob(1)
	end,
	ok.

escortcd(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	EventID = string_to_integer(SValue1),
	case getCfg:getCfgPStack(cfg_escort_event, EventID) of
		#escort_eventCfg{} ->
			core:sendMsgToActivity(?ActivityType_EscortGoods, gm_escortcd, {playerState:getRoleID(), EventID}),
			ok;
		_ ->
			"error eventID"
	end.

clearpetraw(Params) when erlang:length(Params) >= 2 ->
	[PetID | Other0] = Params,
	[Raw | _Other1] = Other0,
	ID = string_to_integer(PetID),
	R = string_to_integer(Raw),
	playerPet:gmDelPetTurnRaw(ID, R),
	ok.

deletepet(Params) when erlang:length(Params) >= 1 ->
	[PetID | _Other0] = Params,
	ID = string_to_integer(PetID),
	playerPet:delPetByID(ID),
	ok.

changemonsterpos(Params) when erlang:length(Params) >= 2 ->
	[XS | Other0] = Params,
	[YS | _Other1] = Other0,
	X = string_to_integer(XS),
	Y = string_to_integer(YS),
	Code = playerState:getSelectTargetCode(),
	psMgr:sendMsg2PS(playerState:getMapPid(), tickUpdateMonsterPos, {Code, X, Y}),
	Msg = #pk_GS2U_MonsterMoveSync{monsterPosList = [#pk_DateMonsterPos{code = Code, x = X, z = Y}]},
	playerMsg:sendNetMsg(Msg),
	ok.

liveness(Params) when erlang:length(Params) >= 1 ->
	[LivenessIDStr | _Other] = Params,
	LivenessID = string_to_integer(LivenessIDStr),
	case LivenessID > 10 of
		true ->
			playerliveness:addTotalLivenessValue(LivenessID);
		_ ->
			case getCfg:getCfgPStack(cfg_dailyActive, LivenessID) of
				#dailyActiveCfg{limit = _Limit} ->
					playerliveness:onFinishLiveness(LivenessID, 1);
				_ ->
					"error liveness ID"
			end
	end.

openslot(Params) when erlang:length(Params) >= 0 ->
	playerPackage:gm_openAllSlot(),
	ok.

querytime(_Params) ->
	Sec = misc_time:gregorian_seconds_from_1970( ),
	Str = misc_time:convertSecToTimeStr(Sec),
	io_lib:format("SyncTime:~ts~nConfZone:~p~nLocalTime:~ts", [Str, misc_time:tz_seconds, misc_time:getLocalDateTimeStr()]).

clearmail(_Params) ->
	playerMail:gm_deleteAllMail(),
	ok.

clearitem(Params) when erlang:length(Params) >= 1 ->
	[TypeStr | _Other] = Params,
	Type = string_to_integer(TypeStr),
	case Type >= ?Item_Location_Start andalso Type =< ?Item_Location_Max of
		true ->
			gmdeleteItem(Type);
		_ ->
			playerRune:gmdeleteRune(),
			"gmdeleteRune"
	end.

gmdeleteItem(BagType) ->
	Plog = #recPLogTSItem{
		old = 0,
		new = 0,
		change = 0,
		target = ?PLogTS_System,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonPlayer,
		reasonParam = 444
	},
	List = playerState:getPackage(BagType),
	F =
		fun
			(#rec_item{itemUID = UID}) ->
				case BagType of
					?Item_Location_Recycle ->
						playerPackage:gm_deleteExpiredTimeGoodsFromRecycle(UID);
					?Item_Location_GemEmbedBag ->
						%% 先卸，再删
						playerPackage:gemEmbedOff([UID]),
						%playerPackage:deleteGoodsByUID(?Item_Location_Gem_Bag, UID, Plog);
						true = playerPackage:deleteGoodsByUID(?Item_Location_Bag, UID, Plog);
					_ ->
						true = playerPackage:deleteGoodsByUID(BagType, UID, Plog)
				end;
			(#recSaveEquip{itemUID = UID2} = Equip) ->
				case BagType of
					?Item_Location_Recycle ->
						playerPackage:gm_deleteExpiredTimeGoodsFromRecycle(UID2);
					?Item_Location_BodyEquipBag ->
						%% 先脱，再删
						playerPackage:gm_equipoff(Equip),
						true = playerPackage:deleteGoodsByUID(?Item_Location_Equip_Bag, UID2, Plog);
					_ ->
						true = playerPackage:deleteGoodsByUID(BagType, UID2, Plog)
				end
		end,
	lists:foreach(F, List),
	io_lib:format("gmdeleteItem:~p", [BagType]).

lovegirl(Params) when erlang:length(Params) >= 0 ->
	execGMCmd("setlevel", ["50"]),
	crack2(),
	execGMCmd("openslot", []),
	ok.

addac(Params) when erlang:length(Params) >= 0 ->
%% 	Ac = #rec_operate_activity{
%% 		id = 0,
%% 		type = 1,
%% 		name = "123",
%% 		phase = 0,
%% 		starttime = misc_time:gregorian_seconds_from_1970( ) + 60,
%% 		endtime = misc_time:gregorian_seconds_from_1970( ) + 3600,
%% 		minlevel = 10,
%% 		maxlevel = 40,
%% 		arg1 = [#recAcKilledMonster{
%% 					ruleID = 1, 
%% 					type = 1, 
%% 					itemID = 222, 
%% 					monsterID = 0, 
%% 					mapIDs = [], 
%% 					diffLv = 0, 
%% 					odds = 10000, 
%% 					playerLimit = 5, 
%% 					serverLimit = 10
%% 					}
%% 				]
%% 	},

	Ac = #rec_operate_activity{
		id = 1,
		type = 1,
		name = "123",
		phase = 0,
		starttime = misc_time:gregorian_seconds_from_1970( ) + 60,
		endtime = misc_time:gregorian_seconds_from_1970( ) + 3600,
		minlevel = 10,
		maxlevel = 40,
		arg1 = [#recAcKilledMonster{
			ruleID = 1,
			type = 1,
			itemID = 222,
			monsterID = 0,
			mapIDs = [],
			diffLv = 0,
			odds = 10000,
			playerLimit = 5,
			serverLimit = 10
		},
			#recAcKilledMonster{
				ruleID = 2,
				type = 1,
				itemID = 221,
				monsterID = 0,
				mapIDs = [],
				diffLv = 0,
				odds = 10000,
				playerLimit = 5,
				serverLimit = 10
			}
		]
	},
	psMgr:sendMsg2PS(operateActivityPID, updateActivity, {0, 0, Ac}).

addCollectAct(Params) when erlang:length(Params) >= 3 ->
	[MapID | Remain1] = Params,
	[Num | Remain2] = Remain1,
	[TotalNum | _Remain3] = Remain2,
	Act = #rec_operate_activity{
		id = 0,                                    %%活动ID int(10) unsigned
		type = ?OperateActType_CollectItem,        %%活动类型 tinyint(4) unsigned
		name = <<"test">>,                        %%活动名称 varchar(256)
		desc = <<"test collect">>,                %%活动描述 text
		phase = 0,                                %%活动是否关闭，0未开启，1运行状态，2关闭状态 tinyint(4)
		starttime = 1438153200,                    %%活动开启时间 bigint(20),"2015-07-29 15:00:00"
		endtime = 1535526000,                    %%活动结束时间 bigint(20),"2018-08-29 15:00:00"
		minlevel = 0,                            %%活动参与最小等级 tinyint(4) unsigned
		maxlevel = 100,                            %%活动参与最大等级 tinyint(4) unsigned
		arg1 = [#recAcCollectItemCfg{
			mapID = erlang:list_to_integer(MapID),        %%地图ID
			freshNum = erlang:list_to_integer(Num),        %%单次刷新数量
			totalFreshNum = erlang:list_to_integer(TotalNum),                    %%总刷新数量
			collectID = 812,                            %%采集ID
			turnFreshInterval = 600000,
			alreadyFreshNum = 0                         %%已经刷新的数量
		}],                        %%活动参数 text
		arg2 = "",                %%活动参数 text
		arg3 = "",                %%活动参数 text
		arg4 = "",                %%活动参数 text
		arg5 = ""                %%活动参数 text
	},
	psMgr:sendMsg2PS(?PsNameOperateActivity, updateActivity, {1, self(), Act}).


addphys(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Phys = string_to_integer(SValue1),
	playerPetPvE:gmAddPhys(Phys).

passdun(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	DunID = string_to_integer(SValue1),
	playerPetPvE:gmPassDun(DunID).

rewardUpdate(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Count = string_to_integer(SValue1),
	playerUpdateReward:getUpdateReward(Count).

worldLevel(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Level = string_to_integer(SValue1),
	#globalsetupCfg{setpara = [MinLevel]} = getCfg:getCfgByArgs(cfg_globalsetup, worldlevel_base),
	RLevel = case Level > MinLevel of
				 true ->
					 Level;
				 _ ->
					 MinLevel
			 end,
	memDBCache:saveSundries(?Sundries_ID_WorldLevel, 1, RLevel),
	playerWorldLevel:sendWorldLevel().

operateItemPush(Params) ->
	[ItemID | Remain1] = Params,
	[Num | Remain2] = Remain1,
	[Price | Remain3] = Remain2,
	[Rebate | _Remain4] = Remain3,
	Result = [#rec_limit_sales{
		sku = 1,
		itemID = string_to_integer(ItemID),
		num = string_to_integer(Num),
		price = string_to_integer(Price),
		rebate = string_to_integer(Rebate),
		startTime = misc_time:utc_seconds(),
		endTime = misc_time:utc_seconds() + 86360,
		coinType = 3,
		limitSales = 1
	}],
	AccountID = playerState:getAccountID(),
	%% 通知数据库删除
	gsSendMsg:sendMsg2DBServer(gmaddLimitPushSale, AccountID, {1222, Result}),
	ok.

clearRoleList(_Params) ->
	AccountID = playerState:getAccountID(),
	ets:delete(ets_recRoleList, AccountID),
	ok.

entercross(Params) when erlang:length(Params) >= 2 ->
	[ServerIDStr | T] = Params,
	[TypeStr | _] = T,
	ServerID = string_to_integer(ServerIDStr),
	Type = string_to_integer(TypeStr),
	case Type of
		1 ->
			playerInterface:reqEnterCrossGS(ServerID, playerState:getMapID(), undefined);
		_ ->
			playerInterface:reqBackGS()
	end.

array(Params) when erlang:length(Params) >= 3 ->
	[S1,S2, S3|_] = Params,
	I3 = string_to_integer(S3),
	TargetCode =
		case I3 > 0 of
			true -> I3;
			_ -> playerState:getSelectTargetCode()
		end,
	Refer =
		case codeMgr:getObjectTypeByCode(TargetCode) of
			?ObjTypePlayer -> TargetCode;
			_ -> 0
		end,
	playerServerTest:array(string_to_integer(S1), string_to_integer(S2), Refer).

arrayrotw(Params) when erlang:length(Params) >= 1 ->
	[S1|_] = Params,
	playerServerTest:arrayRot(string_to_integer(S1)).

arrayperform(Params) when erlang:length(Params) >= 2 ->
	[S1,S2|_] = Params,
	playerServerTest:arrayPerform(string_to_integer(S1), string_to_integer(S2)).

usepetbook(Params) ->
	[PetID | Remain1] = Params,
	[SkillID | Remain2] = Remain1,
	[ID | _] = Remain2,
	playerPet:petFixCast(
		erlang:list_to_integer(PetID),
		erlang:list_to_integer(SkillID),
		erlang:list_to_integer(ID)),
	ok.

onkeyrefine(Params) ->
	case Params of
		[] ->
			playerEquip:equipRefineOneKey();
		[Pos | _]->
			N = erlang:list_to_integer(Pos),
			L = lists:seq(1, N),
			[playerEquip:equipRefineOneKey() || _ <- L]
	end,
	ok.

tz(_Params) ->
	Hour = misc_time:tz_seconds,
	case Hour > 0 of
		true ->
			io_lib:format("time zone +~p~n", [Hour]);
		_ ->
			io_lib:format("time zone ~p~n", [Hour])
	end.

looptask_reset(_Params) ->
	playerLoopTask:gmReset().

looptask_accept([]) ->
	playerLoopTask:msg(#pk_U2GS_RequestAcceptLoopTask{});
looptask_accept([SubTypeStr | _]) ->
	playerLoopTask:gmAcceptWithSubType(erlang:list_to_integer(SubTypeStr)).

looptask_op(Params) when erlang:length(Params) >= 1 ->
	[OPStr | _] = Params,
	OP = erlang:list_to_integer(OPStr),
	case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
		[{TaskID, _} | _] ->
			playerLoopTask:msg(#pk_U2GS_RequestOperateLoopTask{taskID = TaskID, opType = OP});
		_ ->
			skip
	end.

looptask_complete(_Params) ->
	case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
		[{TaskID, _} | _] ->
			playerTask:gmSubmitTask(TaskID);
		_ ->
			skip
	end.

looptask_sp(["0" | _]) ->
	erase(looptask_sp),
	playerLoopTask:gmReset();
looptask_sp([TaskIDStr | _]) ->
	TaskID = erlang:list_to_integer(TaskIDStr),
	put(looptask_sp, TaskID),
	?ERROR("[TestLoopTask] RoleID:~w BeginTest Level:~w TaskID:~w", [playerState:getRoleID(),  playerState:getLevel(), TaskID]),
	playerLoopTask:gmAccept().

%% 索取与捐赠 type[1发起索取 2请求面板数据 3捐赠给选中的角色，若无选中则捐给家族中任意有效索取 4请求历史数据
looptask_gg([TypeStr | _]) ->
	Type = erlang:list_to_integer(TypeStr),
	SelectRoleID = getSelectRoleID(),
	playerLoopTask:gmGlt(Type, SelectRoleID);
looptask_gg(_) ->
	skip.

%%  {"looptask_link", fun looptask_link/1, "looptask_link n", "慎用！使用GM指令快速领取、完成家族任务N轮，以期快速查找非法领取引导任务的时机"},
looptask_link([NStr | _]) ->
	N = erlang:list_to_integer(NStr),
	playerLoopTask:gmLink(N).

%% LUN-8438 【外网】【家族任务】接取到无法完成的家族任务
%% 调试用，模拟一个错误的家族数据
looptask_bug([TaskIDStr | _]) ->
	case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
		[_ | T] ->
			TaskID = erlang:list_to_integer(TaskIDStr),
			playerPropSync:setAny(?SerProp_LoopTaskProcess, [{TaskID, 0} | T]);
		_ ->
			skip
	end.

rune_open(Params) ->
	Code =
		case Params of
			[] ->
				0;
			[StrCode | _] ->
				erlang:list_to_integer(StrCode);
			_ ->
				0
		end,
	playerMsg:sendNetMsg(#pk_GS2U_RuneOpenBorad{code = Code}).

signin_sign([]) ->
	playerDailySignIn:sign(),
	ok;
signin_sign(Params) ->
	[P1 | _] = Params,
	P1_ = erlang:list_to_integer(P1),
	playerDailySignIn:signGM(P1_),
	ok.

signin_reset(Params) ->
	[P1 | _] = Params,
	case erlang:list_to_integer(P1) of
		0 ->
			playerDailySignIn:reset();
		1 ->
			playerDailySignIn:reset(1)
	end.

signin_reward(Params) ->
	[P1 | _] = Params,
	ID = erlang:list_to_integer(P1),
	playerDailySignIn:accuReward(ID),
	ok.

signin_seven(Params) ->
	[P1 | _] = Params,
	DayCount = erlang:list_to_integer(P1),
	playerSignIn:playerSevenDaySignIn(DayCount),
	ok.

sevendayaim(Params) ->
	[P1 | T1] = Params,
	ID = erlang:list_to_integer(P1),
	case T1 of
		[] ->
			playerSevenDayAim:reward(ID);
		_ ->
			L1 = playerPropSync:getProp(?SerProp_SevenDayAimAlreadyReward),
			FunDelete =
				fun
					(V, R) when V =:= ID ->
						R;
					(V, R) ->
						[V | R]
				end,
			L2 = lists:foldl(FunDelete, [], L1),
			playerPropSync:setAny(?SerProp_SevenDayAimAlreadyReward, L2)
	end,
	ok.

sevendayaim2([]) ->
	TimeNowUTC = misc_time:gregorian_seconds_from_1970( ),
	Date = misc_time:gregorian_seconds_to_datetime(TimeNowUTC),
	TimeBeginOfDay = misc_time:getDayBeginSeconds(Date) + ?ResetTimeHour * 3600 - ?SECS_FROM_0_TO_1970,
	TimeBeginWill = TimeBeginOfDay - 3600 * 24 * 6,
	playerPropSync:setInt(?SerProp_SevenDayAimTimeBegin, TimeBeginWill);

sevendayaim2(Params) ->
	[P1 | _] = Params,
	ID = erlang:list_to_integer(P1),
	playerSevenDayAim:queryForGM(ID).

thirtyday(_) ->
	TimeNowUTC = misc_time:gregorian_seconds_from_1970( ),
	Date = misc_time:gregorian_seconds_to_datetime(TimeNowUTC),
	TimeBeginOfDay = misc_time:getDayBeginSeconds(Date) + ?ResetTimeHour * 3600 - ?SECS_FROM_0_TO_1970,
	TimeBeginWill = TimeBeginOfDay - 3600 * 24 * 29,
	playerPropSync:setInt(?SerProp_ThirtyDayTimeBegin, TimeBeginWill),
	DayCount = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_AccLoginDayAll),
	playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_AccLoginDayAll, DayCount + 29).

thirtydaylogingift(Params) ->
	[P1 | _] = Params,
	ID = erlang:list_to_integer(P1),
	playerThirtyDayLoginGift:reward(ID),
	ok.

% 查询 0查询领地信息；2查询掠夺记录；3查询防守记录
territory_query(Params) when erlang:length(Params) >= 1 ->
	[V1 | _T1] = Params,
	case erlang:list_to_integer(V1) of
		0 ->
			playerPetTerritory:queryTerritory();
		1 ->
			playerPetTerritory:queryHistory(true);
		2 ->
			playerPetTerritory:queryHistory(false)
	end,
	ok.

% 开采 自动选择骑宠进行开采
% territoryID cfgTime cfgLevel
territory_exploit(Params) when erlang:length(Params) >= 3 ->
	[V1 | T1] = Params,
	[V2 | T2] = T1,
	[V3 | _T3] = T2,
	TerritoryID = erlang:list_to_integer(V1),
	CfgTime = erlang:list_to_integer(V2),
	CfgLevel = erlang:list_to_integer(V3),
	%% 自动搜索可用的骑宠
	ListPetIDFromPlayer = [PetID || #recPetInfo{pet_id = PetID} <- playerState:getPets()],
	ListPetIDFromTerritory = acPetTerritoryState:queryPet(playerState:getRoleID()),
	FunFilter =
		fun(PetID, _) ->
			case lists:keyfind(PetID, #rec_player_territory_pet.petID, ListPetIDFromTerritory) of
				#rec_player_territory_pet{territoryID = 0} ->
					{true, PetID};
				#rec_player_territory_pet{} ->
					{false, 0};
				_ ->
					{true, PetID}
			end
		end,
	case misc:foldlEx(FunFilter, {false, 0}, ListPetIDFromPlayer) of
		{true, PetID} ->
			playerPetTerritory:exploit(TerritoryID, [PetID], CfgTime, CfgLevel);
		_ ->
			skip
	end,
	ok.

% 搜索 0非针对性搜索 1搜索选择对象的领地
territory_search(Params) when erlang:length(Params) >= 1 ->
	[V1 | _T1] = Params,
	case erlang:list_to_integer(V1) of
		0 ->
			playerPetTerritory:search(0);
		1 ->
			TargetCode = playerState:getSelectTargetCode(),
			RoleID = playerState:getRoleID(),
			case codeMgr:getObjectTypeByCode(TargetCode) of
				?ObjTypePlayer ->
					case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
						#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
							playerPetTerritory:search(TargetRoleID);
						_ ->
							?ERROR("territory_search invalid Target! can not select yourself!")
					end;
				_ ->
					?ERROR("territory_search invalid Target! must select player!")
			end;
		_ ->
			playerPetTerritory:search(1170953497449857027)
	end,
	ok.

% 掠夺
territory_plunder(_) ->
	%% 找到最近搜索到的领地
	RoleID = playerState:getRoleID(),
	case acPetTerritoryState:querySearchHistory(RoleID) of
		[] ->
			none;
		ListSH ->
			[{{TargetRoleID, TerritoryID}, _} | _] = lists:sort(fun({_, T1}, {_, T2}) -> T1 > T2 end, ListSH),
			%% 自动搜索可用的骑宠
			ListPetIDFromPlayer = [PetID || #recPetInfo{pet_id = PetID} <- playerState:getPets()],
			ListPetIDFromTerritory = acPetTerritoryState:queryPet(playerState:getRoleID()),
			FunFilter =
				fun(PetID, _) ->
					case lists:keyfind(PetID, #rec_player_territory_pet.petID, ListPetIDFromTerritory) of
						#rec_player_territory_pet{territoryID = 0} ->
							{true, PetID};
						#rec_player_territory_pet{} ->
							{false, 0};
						_ ->
							{true, PetID}
					end
				end,
			case misc:foldlEx(FunFilter, {false, 0}, ListPetIDFromPlayer) of
				{true, PetID} ->
					playerPetTerritory:plunder(TargetRoleID, TerritoryID, [PetID]);
				_ ->
					skip
			end
	end.

% 所有正在开采的领地奖励+1，便于搜索调试
territory_exploit_add(_) ->
	core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_exploit_add, playerState:getRoleID()).

% 仅对于自身正在开采的领地1，调整下次结算时间为5分钟后执行，以便客户端调试
territory_exploit_t(Params) when erlang:length(Params) >= 1 ->
	[V1 | _T1] = Params,
	core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_exploit_test, {playerState:getRoleID(), erlang:list_to_integer(V1)}).

% 刷怪战斗测试，用于测试出生BUFF、阵营、AI，不能测试属性及技能
territory_exploit_m(_Params) ->
	MapID = playerState:getMapID(),
	MonsterID = 21034,
	GroupID = playerState:getGroupID(),
	PlayerEts = playerState:getMapPlayerEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	PetEts = playerState:getMapPetEts(),
	MapPid = playerState:getMapPid(),
	{X, Y} = playerState:getPos(),
	Arg1 =
		#recSpawnMonster{
			id = MonsterID,
			mapPid = MapPid,
			mapID = MapID,
			x = X + 1,
			y = Y + 1,
			camp = ?CampMonsterEnemies,
			groupID = GroupID,
			petEts = PetEts,
			playerEts = PlayerEts,
			monsterEts = MonsterEts
		},
	Arg2 =
		#recSpawnMonster{
			id = MonsterID,
			mapPid = MapPid,
			mapID = MapID,
			x = X + 1,
			y = Y + 1,
			camp = ?CampMonsterFriendly,
			groupID = GroupID,
			petEts = PetEts,
			playerEts = PlayerEts,
			monsterEts = MonsterEts
		},
	playerPet:spawnMonster(Arg1),
	playerPet:spawnMonster(Arg1),
	playerPet:spawnMonster(Arg2),
	playerPet:spawnMonster(Arg2),
	ok.

% 查询精力
getvigor(_) ->
	playerPetTerritory:getVigor().

% 增加精力
addvigor(Params) when Params >= 1 ->
	[V | _] = Params,
	#globalsetupCfg{setpara = [ValueMax]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_vigorMax),
	ValueOld = playerPetTerritory:getVigor(),
	ValueNew =
		case erlang:list_to_integer(V) + ValueOld of
			ValueNew_ when ValueNew_ > ValueMax ->
				ValueMax;
			ValueNew_ ->
				ValueNew_
		end,
	playerPropSync:setAny(?SerProp_PetTerritoryVigor, [misc_time:localtime_seconds(), ValueNew]).

gopen(_) ->
	ListBit = lists:seq(?Setting_GlobalBitVar_StartBit, ?Setting_GlobalBitVarReadOnly_EndBit),
	[setbitvariant(["0", erlang:integer_to_list(Bit), "1"]) || Bit <- ListBit].

resetgatherbattle(_) ->
	case core:isCross() of
		false ->
			core:sendMsgToActivity(?ActivityType_CrossGatherBattle, resetgatherbattle, 0);
		_ ->
			"falied"
	end.

addgatherbattle([Points|_]) ->
	case core:isCross() of
		false ->
			Point = string_to_integer(Points),
			core:sendMsgToActivity(?ActivityType_CrossGatherBattle, addgatherbattle,
				{playerState:getRoleID(), self(), Point});
		_ ->
			"falied"
	end.

addgatherbattletime([Times|_]) ->
	case core:isCross() of
		false ->
			Sec = string_to_integer(Times),
			core:sendMsgToActivity(?ActivityType_CrossGatherBattle, addgatherbattletime,
				{playerState:getRoleID(), Sec});
		_ ->
			"falied"
	end.

maketradelog(_) ->
	playerTrade:gm_makeTradeLog().

closemap(_) ->
%%	playerState:getMapPid() ! {tickMaxDestroy2, 0}.
	playerState:getMapPid() ! tickMaxDestroy.

setgatherbattlelinenumber([Nums|_]) ->
	Num = string_to_integer(Nums),
	gsCsInterface:sendMsg2CenterServer(gm_gatherbattleline_order, {Num}).

marriage_build(Params) ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[ItemIDString | T1] = Params,
					case T1 of
						[] ->
							playerMarriage:wantBuild(TargetRoleID, erlang:list_to_integer(ItemIDString), []);
						_ ->
							playerMarriage:build({TargetRoleID, gm})
					end;
				_ ->
					?ERROR("marriage_build invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR("marriage_build invalid Target! must select player!")
	end,
	ok.

marriage_break(_Params) ->
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
%%			TeamMemberList = playerTeam2:getTeamAllMemberInfoList(?PlayerTeamTypeNormal),
%%			case lists:keyfind(TargetRoleID, #recTeamMemberInfo.roleID, TeamMemberList) of
%%				#recTeamMemberInfo{} ->
			case gsTeamInterface:isInSameTeam(RoleID, TargetRoleID) of
				true ->
					playerMarriage:break(true);
				_ ->
					playerMarriage:break(false)
			end;
		_ ->
			playerMarriage:break(false)
	end,
	ok.

marriage_addcloseness(Params) when erlang:length(Params) >= 2 ->
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
			[ValueString | T1] = Params,
			[ReasonString | _] = T1,
			Value = erlang:list_to_integer(ValueString),
			Reason = erlang:list_to_integer(ReasonString),
			playerMarriage:closenessAdd({RoleID, TargetRoleID, Value, Reason});
		_ ->
			skip
	end;
marriage_addcloseness(_) ->
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
			playerMarriage:closenessAdd({RoleID, TargetRoleID, 999999999, 0});
		_ ->
			skip
	end.


marriage_skillup(Params) ->
	[CostString | T1] = Params,
	[SlotIDString | _] = T1,
	Cost = erlang:list_to_integer(CostString),
	SlotID = erlang:list_to_integer(SlotIDString),
	playerMarriage:skillUp(Cost, SlotID).

marriage_ringup(Params) ->
	[CostString | _] = Params,
	Cost = erlang:list_to_integer(CostString),
	playerMarriage:ringUp(Cost).

marriage_resetsr(_Params) ->
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} = Rec when TargetRoleID > 0 ->
			RecNew =
				Rec#rec_marriage{
					ringExp = 0,
					ringTop = 1
				},
			marriageState:replaceRelation(RecNew),
			Slots = marriageState:querySlots(RoleID),
			FunMakeSlotsNew =
				fun({SlotID, _}, R) ->
					Slot =
						#rec_marriage_skill{
							roleID = RoleID,
							slotID = SlotID,
							slotExp = 0
						},
					marriageState:replaceSlot(Slot),
					[Slot | R]
				end,
			SlotsNew = lists:foldl(FunMakeSlotsNew, [], Slots),
			gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [RecNew | SlotsNew]);
		_ ->
			skip %% 未婚时忽略
	end.

marriage_accept(_Params) ->
	playerMarriageTask:acceptTask().

marriage_submit(_Params) ->
	playerMarriageTask:leaderSubmitTask(0).

marriage_resettask([]) ->
	playerMarriageTask:resetTask(false);
marriage_resettask([H | _]) ->
	playerMarriageTask:resetTask(erlang:list_to_integer(H) > 0).

md_enter(_Params) ->
	playerMoneyDungeon:onEnterMap(520).

md_giveup(_Params) ->
	playerMoneyDungeon:giveup().

md_next(_Params) ->
	playerMoneyDungeon:next().

sa_enter(_Params) ->
	playerSpiritArea:onEnterMap(?SpiritAreaMapID).

sp_skill(_) ->
	#globalsetupCfg{setpara = ListCareerAndSkillID} =
		getCfg:getCfgPStack(cfg_globalsetup, specEvent_1_skillID),
	case lists:keyfind(playerState:getCareer(), 1, ListCareerAndSkillID) of
		{_, SkillID} ->
			playerSkill:addSysSkill(SkillID, 1),
			{X, Y} = playerState:getPos(),
			playerSkill:onUseSkill(SkillID, [playerState:getPlayerCode()], 0, X, Y);
		_ ->
			skip
	end.


to_cgs(Params)->
	[Type_ | _] = Params,
	Type = erlang:list_to_integer(Type_),
	case Type of
		1 ->
			playerInterface:reqEnterCrossGS(playerState:getMapID());
		0 ->
			playerInterface:reqBackGS();
		_ ->
			skip
	end,
	ok.

ss_t(Params) when erlang:length(Params) >= 1 ->
	[P1_ | _] = Params,
	P1 = erlang:list_to_integer(P1_),
	playerScene:ss_t(P1).

lbs(Params) when erlang:length(Params) >= 3 ->
	[P1_ | T1] = Params,
	[P2_ | T2] = T1,
	[P3_ | T3] = T2,
	P1 = erlang:list_to_integer(P1_),
	P2 = erlang:list_to_integer(P2_),
	P3 = erlang:list_to_integer(P3_),
	lbs_(P1, erlang:float(P2), erlang:float(P3), T3).
lbs_(1, Lat, Lng, _T) ->
	playerLBS:msg(#pk_U2GS_LBS_Request{lat = Lat, lng = Lng});
lbs_(2, Lat, Lng, []) ->
	playerLBS:msg(#pk_U2GS_LBS_BesideRole_Request{lat = Lat, lng = Lng, dist = 1000.0});
lbs_(2, Lat, Lng, [P_ | _]) ->
	P = erlang:list_to_integer(P_),
	playerLBS:msg(#pk_U2GS_LBS_BesideRole_Request{lat = Lat, lng = Lng, dist = erlang:float(P)});
lbs_(_, _, _, _) ->
	skip.

guild_fs([ValueStr | _]) ->
	GuildID = playerState:getGuildID(),
	playerGuild:fastJoin_Set(GuildID, erlang:list_to_integer(ValueStr));
guild_fs(_) ->
	GuildID = playerState:getGuildID(),
	playerGuild:fastJoin_Set(GuildID, ?ForceLimitMax).
guild_fj(_) ->
	playerGuild:fastJoin().

pet_none(_) ->
	playerPet:gmPetNone().

pet_auto(_) ->
	playerPet:petAuto().

groupbuy_reset(_) ->
	psMgr:sendMsg2PS(?PsNameGroupBuy, groupbuy_reset, 0).

%% type[1请求数据 2团购 3兑奖] p1[请求数据时忽略 团购时为商品id 兑奖时为奖品id] p2[仅在团购时表示商品数量，默认为1]
groupbuy_msg(["1" | _]) ->
	playerGroupBuy:msg(#pk_U2GS_GroupBuyWhenOpen{});
groupbuy_msg(["2" | [IDStr | T]]) ->
	Count =
		case T of
			[] ->
				1;
			[CountStr | _] ->
				erlang:list_to_integer(CountStr)
		end,
	playerGroupBuy:msg(#pk_U2GS_GroupBuyGoodsBuyRequest{id = erlang:list_to_integer(IDStr), goodsNum = Count});
groupbuy_msg(["3" | [IDStr | []]]) ->
	playerGroupBuy:msg(#pk_U2GS_GroupBuyRewardBuyRequest{id = erlang:list_to_integer(IDStr)});
groupbuy_msg(_) ->
	bad_args.

groupbuy_end(_) ->
	playerGroupBuy:gmUnlockDiamond().

groupbuy_count([IDStr | [CountStr | _]]) ->
	ID = erlang:list_to_integer(IDStr),
	Count = erlang:list_to_integer(CountStr),
	case ets:lookup(?EtsGroupBuyGoods, ID) of
		[#rec_group_buy_goods{}] ->
			ets:update_element(?EtsGroupBuyGoods, ID, {#rec_group_buy_goods.buy_count, Count});
		_ ->
			skip
	end.

groupbuy_scoredel(_) ->
	psMgr:sendMsg2PS(?PsNameGroupBuy, groupbuy_score_del, {0, 0}).

koreanaver_get(Params) ->
	[P1_ | T1] = Params,
	[P2_ | T2] = T1,
	[P3_ | T3] = T2,
	[P4_ | _T4] = T3,
	P1 = erlang:list_to_integer(P1_),
	P2 = erlang:list_to_integer(P2_),
	P3 = erlang:list_to_integer(P3_),
	P4 = erlang:list_to_integer(P4_),
	Msg = #pk_U2GS_KoreaNaverRewardGetRequest{
		%% Int32对应活动ID
		id = P1,
		%% Int32活动版本号
		ver = P2,
		%% String 论坛账号 新增,用于记录日志
		naverAccountID = "gmTestNaverAccountID",
		%% Int32论坛板块ID
		menuID = P3,
		%% Int32留言板ID
		articleID = P4
	},
	playerKoreaNave:msg(Msg),
	ok.

operate_frame(Params) ->
	[P1_ | T1] = Params,
	[P2_ | _T2] = T1,
	P1 = erlang:list_to_integer(P1_),
	P2 = erlang:list_to_integer(P2_),
	Msg = #pk_U2GS_OperatePortraitFrame{
		state = P1,
		id = P2
	},
	playerFrame:msg(Msg),
	ok.

get_frame(Params) ->
	[P1_ | T1] = Params,
	P1 = erlang:list_to_integer(P1_),
	playerFrame:gm_get_frame(P1).

get_frame_all(_Params) ->
	playerFrame:gm_get_frame_all().

sendToCGSFriend(RoleID, TargetRoleID, N) when N > 0 ->
	psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_formalOP, {?EXOP_Like, RoleID, TargetRoleID}),
	sendToCGSFriend(RoleID, TargetRoleID, N - 1);
sendToCGSFriend(_, _, _) ->
	ok.

addlike(Params) ->
	case erlang:length(Params) >= 1 of
		true ->
			[NumStr | _Other1] = Params,
			Num = erlang:list_to_integer(NumStr),
			RoleID = playerState:getRoleID(),
			sendToCGSFriend(RoleID, RoleID, Num);
		_ ->
			skip
	end.

homeplant(Params) when erlang:length(Params) >= 2 ->
	% 1.解析参数
	[P1_ | T1] = Params,
	[P2_ | T2] = T1,
	P1 = erlang:list_to_integer(P1_),		% Pos 种植点
	P2 = erlang:list_to_integer(P2_),		% OpType 操作类型
	P3 =
		case T2 of
			[] ->
				0;
			[P3_ | _] ->
				erlang:list_to_integer(P3_)	% ItemID 可能的道具ID
		end,
	% 2.查找当前角色所在家园数据
	MapPid = playerState:getMapPid(),
	case homeInterface:queryHomeMapForGM(MapPid) of
		{0, _} ->
			skip;	%% 不在家园中
		{HomeID, 1} ->	%% 在庭院
			playerHomePlant:msg(#pk_U2GS_HomePlantOperate_Request{
				homeID = HomeID,
				areaType = 4,	%% 对种植区A操作
				itemUid  = P1,
				operateType = P2,
				itemID = P3
			});
		_ ->
			skip	%% 不在庭院中
	end.

homeUpdateAll(Params)->
	[P1_ | T1] = Params,
	P2 = erlang:list_to_integer(P1_),		% State 1幼苗2发育3成熟4枯萎
	{P3, P4} =								% IsPestis 是否虫害； Health 健康值
	case T1 of
		[] ->
			{0, 100};
		[P3_ | []] ->
			{erlang:list_to_integer(P3_), 100};
		[P3_ | [P4_ | _]] ->
			{erlang:list_to_integer(P3_), erlang:list_to_integer(P4_)}
	end,
	playerHomePlant:gmUpdateAll({P2, P3, P4}).

homeplanthelp(Params) when erlang:length(Params) >= 2 ->
	% 1.解析参数
	[P1_ | T1] = Params,
	[P2_ | T2] = T1,
	P1 = erlang:list_to_integer(P1_),		% Pos 种植点
	P2 = erlang:list_to_integer(P2_),		% State 1幼苗2发育3成熟4枯萎
	{P3, P4} =								% IsPestis 是否虫害； Health 健康值
	case T2 of
		[] ->
			{0, 100};
		[P3_ | []] ->
			{erlang:list_to_integer(P3_), 100};
		[P3_ | [P4_ | _]] ->
			{erlang:list_to_integer(P3_), erlang:list_to_integer(P4_)}
	end,
	% 2.查找当前角色所在家园数据
	MapPid = playerState:getMapPid(),
	case homeInterface:queryHomeMapForGM(MapPid) of
		{0, _} ->
			skip;	%% 不在家园中
		{HomeID, 1} ->	%% 在庭院
			playerHomePlant:gmUpdatePlant({{HomeID, 4, P1}, P2, P3, P4});
		_ ->
			skip	%% 不在庭院中
	end.

homeplanthelp2(Params) when erlang:length(Params) >= 2 ->
	% 1.解析参数
	[P1_ | T1] = Params,
	[P2_ | _T2] = T1,
	P1 = erlang:list_to_integer(P1_),		% Pos 种植点
	P2 = erlang:list_to_integer(P2_),		% Min 分钟调整
	% 2.查找当前角色所在家园数据
	MapPid = playerState:getMapPid(),
	case homeInterface:queryHomeMapForGM(MapPid) of
		{0, _} ->
			skip;	%% 不在家园中
		{HomeID, 1} ->	%% 在庭院
			playerHomePlant:gmTimePlant({HomeID, 4, P1}, P2);
		_ ->
			skip	%% 不在庭院中
	end.

%% 家园种植区 查询对应种植点作物状态
homeplantquery(Params) when erlang:length(Params) >= 1 ->
	[P1_ | _T1] = Params,
	P1 = erlang:list_to_integer(P1_),		% Pos 种植点
	MapPid = playerState:getMapPid(),
	case homeInterface:queryHomeMapForGM(MapPid) of
		{0, _} ->
			skip;	%% 不在家园中
		{HomeID, 1} ->	%% 在庭院
			playerHomePlant:gmQueryPlant({HomeID, 4, P1});
		_ ->
			skip	%% 不在庭院中
	end.

%% 巅峰对决 gm开关竞价状态 0关；1开；2由时间控制
%% 竞价状态优先级低于活动状态，因此活动开启时必然竞价结束
gw_bidding([P | _]) ->
	NowTime = misc_time:gregorian_seconds_from_1970( ),
	case ets:info(etsGuildWarBidding, size) of
		undefined ->
			"need debug";
		_ when P =:= "0" ->
			ets:insert(etsGuildWarBidding, #recKV{v = {0, NowTime}});
		_ when P =:= "1" ->
			ets:insert(etsGuildWarBidding, #recKV{v = {1, NowTime}});
		_ ->
			ets:insert(etsGuildWarBidding, #recKV{v = {2, NowTime}})
	end;
gw_bidding(_) ->
	NowTime = misc_time:gregorian_seconds_from_1970( ),
	case ets:info(etsGuildWarBidding, size) of
		undefined ->
			"need debug";
		_ ->
			ets:insert(etsGuildWarBidding, #recKV{v = {2, NowTime}})
	end.

%% 怪物图鉴_模拟客户端操作
%% type[1上线初始化 2请求全数据 3拍照 4解锁 5领奖] monsterID仅3、4、5需要
mb1(Params) when erlang:length(Params) >= 1 ->
	[P1_ | T1] = Params,
	P2 =
		case T1 of
			[] ->
				0;
			[P2_ | _] ->
				erlang:list_to_integer(P2_)
		end,
	case erlang:list_to_integer(P1_) of
		1 -> playerMonsterBook:init();
		2 -> playerMonsterBook:msg(#pk_U2GS_MonsterBook_Request{});
		3 -> playerMonsterBook:msg(#pk_U2GS_MonsterBookSnap_Request{id = P2});
		4 -> playerMonsterBook:msg(#pk_U2GS_MonsterBookUnlock_Request{id = P2});
		5 -> playerMonsterBook:msg(#pk_U2GS_MonsterBookReward_Request{id = P2});
		_ ->
			skip
	end.

%% 怪物图鉴_查询目标状态
%% type[1查询怪物配置 2查询怪物状态 3查询地图配置 4查询地图状态] id[怪物ID或者地图ID]
mb2(Params) when erlang:length(Params) >= 2 ->
	[P1_ | T1] = Params,
	[P2_ | _] = T1,
	P1 = erlang:list_to_integer(P1_),
	P2 = erlang:list_to_integer(P2_),
	playerMonsterBook:gmQuery(P1, P2).

%% 怪物图鉴_设置目标怪物状态（强制设置，没有后续通知等操作）
%% monsterID type[1是否拍照 2是否解锁 3是否领奖 4击杀数量] value 1表示是，0表示否，数量任意
mb3(Params) when erlang:length(Params) >= 3 ->
	[P1_ | T1] = Params,
	[P2_ | T2] = T1,
	[P3_ | _] = T2,
	P1 = erlang:list_to_integer(P1_),
	P2 = erlang:list_to_integer(P2_),
	P3 = erlang:list_to_integer(P3_),
	playerMonsterBook:gmSetMonster(P1, P2, P3).

%% 跨服骑宠竞速_强状态控制
%% type[1完全关闭活动 2快速重开活动便于测试]
race00([P1_ | _]) ->
	P1 = erlang:list_to_integer(P1_),
	playerRace:gm00(P1).

%% 跨服骑宠竞速_模拟协议
%% type[1选择骑宠 2设置匹配模式 3请求邀请列表 4邀请 5处理邀请 6报名 7取消报名]
race01([P1_ | T]) ->
	case erlang:list_to_integer(P1_) of
		1 ->
			PetID =
				case playerPet:getPetBattle() of
					#recPetInfo{pet_id = PetID_} ->
						PetID_;
					_ ->
						[P2_ | _] = T,
						erlang:list_to_integer(P2_)
				end,
			playerRace:msg(#pk_U2GS_RaceSelectPet{petID = PetID});
		2 ->
			[P2_ | _] = T,
			AutoMatch = erlang:list_to_integer(P2_),
			playerRace:msg(#pk_U2GS2U_RaceAutoMatch{autoMatch = AutoMatch});
		3 ->
			playerRace:msg(#pk_U2GS_RaceInviteList{});
		4 ->
			playerRace:msg(#pk_U2GS_RaceInvite_A2S{id = getSelectRoleID()});
		5 ->
			[P2_, P3_ | _] = T,
			IsAgree = erlang:list_to_integer(P2_),
			PetID = erlang:list_to_integer(P3_),
			playerRace:msg(#pk_U2GS_RaceInvite_B2S{isAgree = IsAgree, id = getSelectRoleID(), petID = PetID});
		6 ->
			playerRace:msg(#pk_U2GS_RaceApply{});
		7 ->
			playerRace:msg(#pk_U2GS_RaceCancel{})
	end.


%%%% 跨服骑宠竞速_模拟客户端操作
%%%% type[1报名 2取消报名 3使用道具 4当前角色立即过终点] itemID[仅在type为3时有效cfg_race_item.id]
%%race1(Params) when erlang:length(Params) >= 1 ->
%%	[P1_ | T1] = Params,
%%	case erlang:list_to_integer(P1_) of
%%		1 ->
%%			playerRace:msg(#pk_U2GS_RaceApply_Request{});
%%		2 ->
%%			playerRace:msg(#pk_U2GS_RaceCancel_Request{});
%%		3 ->
%%			[P2_ | _T2] = T1,
%%			P2 = erlang:list_to_integer(P2_),
%%			playerRace:msg(#pk_U2GS_RaceMapItem_Request{itemID = P2});
%%		4 ->
%%			playerRace:gmEnd();
%%		_ ->
%%			skip
%%	end.
%%
%%%% 跨服骑宠竞速_强制开启活动
%%%% 慎用，不合理使用会导致逻辑错乱
%%race2(Params) when erlang:length(Params) >= 1 ->
%%	[P1_ | _T1] = Params,
%%	case erlang:list_to_integer(P1_) of
%%		1 ->
%%			activity:setActivitySwitch(?ActivityType_CrossRace, true),	%% 首先在本服将开关打开
%%			startac( ["16", "1"]),										%% 在本服开启报名阶段
%%			core:sendMsgToActivityMgrCross(gm, {race2, 1});				%% 通知跨服开启活动
%%		_ ->
%%			activity:setActivitySwitch(?ActivityType_CrossRace, false),	%% 首先在本服将开关关闭
%%			startac( ["16", "0"]),										%% 在本服关闭活动
%%			core:sendMsgToActivityMgrCross(gm, {race2, 0})				%% 通知跨服关闭活动
%%	end.
%%
%%%% 跨服骑宠竞速_触发采集物
%%%% gatherID[cfg_object.id]
%%race3(Params) when erlang:length(Params) >= 1 ->
%%	[P1_ | _T1] = Params,
%%	P1 = erlang:list_to_integer(P1_),
%%	playerRace:gatherSuccess(P1).
%%
%%%% 跨服骑宠竞速_无视是否有道具直接使用
%%%% itemID[cfg_race_item.id]
%%race4(Params) when erlang:length(Params) >= 1 ->
%%	[P1_ | _T1] = Params,
%%	P1 = erlang:list_to_integer(P1_),
%%	playerRace:gmItem(P1).
%%
%%%% 跨服骑宠竞速_设置下次活动子类型（会强制关闭活动地图）
%%%% subType[0..4]
%%race5(Params) when erlang:length(Params) >= 1 ->
%%	[P1_ | _T1] = Params,
%%	P1 = erlang:list_to_integer(P1_),
%%	playerRace:gmSubType(P1).
%%
%%%% 跨服骑宠竞速_查询自己当前名次
%%race6(_Params) ->
%%	playerRace:gmQuerySort().

%% 跨服大逃杀_模拟客户端操作
%% type[1报名 2取消报名 3请求进入安全区]
alive1(Params) when erlang:length(Params) >= 1 ->
	[P1_ | _T1] = Params,
	case erlang:list_to_integer(P1_) of
		1 ->
			playerAlive:msg(#pk_U2GS_AliveApply_Request{});
		2 ->
			playerAlive:msg(#pk_U2GS_AliveCancel_Request{});
		3 ->
			playerAlive:msg(#pk_U2GS_AliveEnterSafeArea_Request{});
		_ ->
			skip
	end.

%% 跨服大逃杀_强制开关活动
%% openOrClose[1开启 0关闭 2关闭活动并清空地图]
alive2(Params) when erlang:length(Params) >= 1 ->
	[P1_ | _T1] = Params,
	case erlang:list_to_integer(P1_) of
		1 ->
			activity:setActivitySwitch(?ActivityType_CrossAlive, true),		%% 首先在本服将开关打开
			startac( ["25", "1"]),											%% 在本服开启活动
			core:sendMsgToActivityMgrCross(gm, {alive2, 1});				%% 通知跨服开启活动
		2 ->
			activity:setActivitySwitch(?ActivityType_CrossAlive, false),	%% 首先在本服将开关关闭
			startac( ["25", "0"]),											%% 在本服关闭活动
			core:sendMsgToActivityMgrCross(gm, {alive2, 2});				%% 通知跨服关闭活动
		_ ->
			activity:setActivitySwitch(?ActivityType_CrossAlive, false),	%% 首先在本服将开关关闭
			startac( ["25", "0"]),											%% 在本服关闭活动
			core:sendMsgToActivityMgrCross(gm, {alive2, 0})				%% 通知跨服关闭活动
	end.

%% 跨服大逃杀_触发采集物
%% gatherID[cfg_object.id]
alive3(Params) ->
	[P1_ | _T1] = Params,
	P1 = erlang:list_to_integer(P1_),
	playerAlive:gatherSuccess(P1).

%% 跨服大逃杀_创建安全区
alive4(_Params) ->
	playerAlive:gmSafeArea().

identity_edit(Params) ->
	{P1, P2, P3} =
		case Params of
			[] ->
				error;
			[P1_ | T1] ->
				case T1 of
					[] ->
						error;
					[P2_ | T2] ->
						case T2 of
							[] ->
								{erlang:list_to_integer(P1_), erlang:list_to_integer(P2_), {}};
							[P3_ | _] ->
								{erlang:list_to_integer(P1_), erlang:list_to_integer(P2_), erlang:list_to_integer(P3_)};
							_ ->
								error
						end;
					_ ->
						error
				end;
			_ ->
				error
		end,
	case P1 of
		?IDIT_AGE ->
			playerIdentity:editIdentity(P1, P2);
		?IDIT_BIRTH ->
			playerIdentity:editIdentity(P1, {P2, P3});
		?IDIT_ZODIAC ->
			playerIdentity:editIdentity(P1, P2);
		?IDIT_BLOOD ->
			playerIdentity:editIdentity(P1, P2);
		?IDIT_HOMETOWN ->
			playerIdentity:editIdentity(P1, {P2, P3});
		?IDIT_LOCATION ->
			playerIdentity:editIdentity(P1, {P2, P3});
		_ ->
			error
	end.

gg(Params) when erlang:length(Params) >= 1 ->
	case getSelectRoleID() of
		0 ->
			skip;
		ID ->
			[P1 | T] = Params,
			P2Real =
				case T of
					[] ->
						1;
					[P2 | _] ->
						erlang:list_to_integer(P2)
				end,
			playerIdentity:giveGift(ID, erlang:list_to_integer(P1), P2Real, []),
			ok
	end.

pg1(Params) when erlang:length(Params) >= 1 ->
	[P1 | _] = Params,
	playerGuild:suppSupp(erlang:list_to_integer(P1)),
	ok.

pg2(Params) when erlang:length(Params) >= 1 ->
	case getSelectRoleID() of
		0 ->
			skip;
		ID ->
			[P1 | _] = Params,
			playerGuild:suppGive(ID, erlang:list_to_integer(P1)),
			ok
	end.

friend2_add(Params) ->
	[P1 | _] = Params,
	TargetCode = playerState:getSelectTargetCode(),
	#rec_OnlinePlayer{roleID = ID} = playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode),
	case erlang:list_to_integer(P1) of
		0 ->
			playerFriend:add(ID);
		1 ->
			playerFriend:addTemp(ID);
		2 ->
			playerFriend:ban(ID, false);
		_ ->
			error
	end.

friend2_del(Params) ->
	[P1 | _] = Params,
	TargetCode = playerState:getSelectTargetCode(),
	#rec_OnlinePlayer{roleID = ID} = playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode),
	case erlang:list_to_integer(P1) of
		0 ->
			playerFriend:del(ID);
		1 ->
			skip;
		2 ->
			playerFriend:unban(ID);
		_ ->
			error
	end.

friend2_exop(Params) ->
	[P1 | _] = Params,
	TargetCode = playerState:getSelectTargetCode(),
	#rec_OnlinePlayer{roleID = ID} = playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode),
	playerFriend:formalOP(ID, erlang:list_to_integer(P1)).


cf_add1(_Params) ->
	case getSelectRoleID() of
		0 ->
			skip;
		ID ->
			playerFriend:add_cross(ID),
			ok
	end.
cf_add2(_Params) ->
	case getSelectRoleID() of
		0 ->
			skip;
		ID ->
			playerFriend:add_cross2(ID, true),
			ok
	end.
cf_del1(_Params) ->
	case getSelectRoleID() of
		0 ->
			skip;
		ID ->
			playerFriend:del_cross(ID),
			ok
	end.
cf_del2(_Params) ->
	case getSelectRoleID() of
		0 ->
			playerFriend:add_cross2(0, false),
			ok;
		ID ->
			playerFriend:add_cross2(ID, false),
			ok
	end.
cf_chat(_Params) ->
	case getSelectRoleID() of
		0 ->
			skip;
		ID ->
			Msg = #pk_U2GS_Friend2FormalChat_Request{
				receiverID = ID,
				content = erlang:binary_to_list(unicode:characters_to_binary("跨服好友测试聊天内容")),
				time = misc_time:utc_seconds()
			},
			playerFriend:chat(Msg),
			ok
	end.
cf_face(_Params) ->
	case getSelectRoleID() of
		0 ->
			skip;
		ID ->
			case core:queryRoleKeyInfoByRoleID(ID) of
				#?RoleKeyRec{
					face = []
				} ->
					skip;
				#?RoleKeyRec{
					face = Face
				} ->
					playerIdentity:picDownloadBegin({Face, ID});
				_ ->
					skip
			end
	end.
cf_rob(_Params) ->
	case ets:info(?EtsLBS_Main, size) of
		0 ->
			skip;
		Count ->
			List = ets:tab2list(?EtsLBS_Main),
			#recGrid{listRoleID = L} = lists:nth(misc:rand(1, Count), List),
			cf_rob_randOp(L, playerState:getRoleID())
	end.
cf_rob_randOp([], _RoleID) ->
	skip;
cf_rob_randOp(L, RoleID) ->
	Count = erlang:length(L),
	Rand = misc:rand(1, Count),
	case lists:nth(Rand, L) of
		#recPlayerInfo{roleID = TargetRoleID} ->
			case cgsFriendInterface:queryFRT(RoleID, TargetRoleID) of
				?FRT_NoneC ->
					%% 跨服陌生人，请求添加好友
					playerFriend:add_cross(TargetRoleID);
				?FRT_Cross ->
					%% 跨服好友，请求删除好友
					playerFriend:del_cross(TargetRoleID);
				?FRT_CApply ->
					%% 跨服申请者，随机同意或取消
					case misc:rand(1, 2) of
						1 ->
							playerFriend:add_cross2(TargetRoleID, true);
						_ ->
							playerFriend:add_cross2(TargetRoleID, false)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end.

equiprecast([PosStr]) ->
	playerEquipRecast:equipRecast(string_to_integer(PosStr)).

equiprecast2([PosStr, PropPosStr]) ->
	playerEquipRecast:equipRecast(string_to_integer(PosStr), string_to_integer(PropPosStr)).

rune_addexp(Params) ->
	[P1 | T] = Params,
	[P2 | _] = T,
	playerRune:meltForGM(erlang:list_to_integer(P1), erlang:list_to_integer(P2)).

warrior([IDStr | _]) ->
	playerWarriorTrial:firstKillReward(erlang:list_to_integer(IDStr)).

warrior_max([IDStr | _]) ->
	ID = erlang:list_to_integer(IDStr),
	WarriorInfoNew =
		case playerState:getWarriorTrialInfo() of
			#rec_warrior_trial{} = WarriorInfo ->
				WarriorInfo#rec_warrior_trial{trialSchedule = ID, tswkTrialSchedule = ID, tswkTrialTime = 1};
			_ ->
				#rec_warrior_trial{roleID = playerState:getRoleID(), trialSchedule = ID, tswkTrialSchedule = ID, tswkTrialTime = 1}
		end,
	playerState:setWarriorTrialInfo(WarriorInfoNew).

date_enter(Params) ->
	[P1 | T] = Params,  %% 玩法ID
	[P2 | _] = T,       %% 是否是GM模式（创建进入地图时免除绝大部分条件检测）
	P2_ =
		case erlang:list_to_integer(P2) of
			0 ->
				false;
			_ ->
				true
		end,
	playerDate:enterTry(erlang:list_to_integer(P1), P2_).

date_link(Params) ->
	[P1 | T1] = Params, %% 选中还是放开
	P1_ =
		case erlang:list_to_integer(P1) of
			0 ->
				false;
			_ ->
				true
		end,
	[P2 | _] = T1,      %% 0正常模式，1GM模式表示玩家A选中，2GM模式表示玩家B选中
	playerDate:link(P1_, erlang:list_to_integer(P2)).

date_link_end(Params) ->
	[P1 | _] = Params, %% 结算还是立即销毁
	P1_ =
		case erlang:list_to_integer(P1) of
			0 ->
				false;
			_ ->
				true
		end,
	playerDate:link_giveup(P1_).

date_link_reshuffe(Params) ->
	[P1 | _] = Params, %% 是否是GM模式，GM不受次数和冷却限制
	P1_ =
		case erlang:list_to_integer(P1) of
			0 ->
				false;
			_ ->
				true
		end,
	playerDate:link_reshuffle(P1_).

date_link_buff(Params) ->
	[P1 | _] = Params, %% BUFFTYPE
	playerDate:link_buff(erlang:list_to_integer(P1)).

shiftto(Params) ->
	[PX | T1] = Params, %% 目标X坐标
	[PY | _] = T1,     %% 目标Y坐标
	PX_ = erlang:list_to_integer(PX) * 1.0,
	PY_ = erlang:list_to_integer(PY) * 1.0,
	{SX, SY} = playerState:getPos(),
	case SX =/= PX_ orelse SY =/= PY_ of
		true ->
			MapID = playerState:getMapID(),
			playerMap:onLaterTransferPosAck(MapID, PX_, PY_);
		_ ->
			skip
	end.
shiftto_(Params) ->
	[PX | T1] = Params, %% 目标X坐标
	[PY | _] = T1,     %% 目标Y坐标
	PX_ = erlang:list_to_integer(PX) * 1.0,
	PY_ = erlang:list_to_integer(PY) * 1.0,
	{SX, SY} = playerState:getPos(),
	case SX =/= PX_ orelse SY =/= PY_ of
		true ->
			Msg = #pk_GS2U_StopMove{
				code = playerState:getPlayerCode(),
				posX = PX_,
				posY = PY_
			},
			playerMsg:sendMsgToNearPlayer(Msg, true);
		_ ->
			skip
	end.

addfriendliness(Params) ->
	[VS | _] = Params, %% 增加的友好度
	V = erlang:list_to_integer(VS),
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					case cgsFriendInterface:queryFRT(RoleID, TargetRoleID) of
						?FRT_Formal ->
							playerFriend:closenessAdd(?ClosenessAddType_GM, RoleID, TargetRoleID, V);
						_ ->
							?ERROR("addfriendliness invalid Target! must select your formal friend!")
					end;
				_ ->
					?ERROR("addfriendliness invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR("addfriendliness invalid Target! must select player!")
	end.

map_syncgrid(_) ->
	{SX, SY} = playerState:getPos(),
	playerMap:syncChangePos(0.0, 0.0, SX, SY, true).

%% 让地图上的对象使用技能
map_useskill(Params) ->
	[Code | T1] = Params, %% 使用技能的主体Code
	[TargetCode | T2] = T1, %% 技能目标的Code
	[SkillID | _] = T2, %% 技能ID
	Code_ = erlang:list_to_integer(Code),
	TargetCode_ = erlang:list_to_integer(TargetCode),
	SkillID_ = erlang:list_to_integer(SkillID),
	%% 获取当前地图Pid
	Pid = playerState:getMapPid(),
	psMgr:sendMsg2PS(Pid, monsterUseSkill, {Code_, SkillID_, TargetCode_}).

%% ====================================================================
%% private functions
%% ====================================================================

-spec callMgrMap(MapID :: uint(), MsgID :: atom(), Msg :: term()) -> term().
callMgrMap(MapID, MsgID, Msg) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			%%发送到普通地图管理器
			psMgr:call(?PSNameNormalMapMgr, MsgID, Msg);
		_ ->
			%%发送到副本管理器
			psMgr:call(?PSNameCopyMapMgr, MsgID, Msg)
	end.

-spec canEnterMapLine(MapID :: uint(), MapPid :: pid(), Line :: uint()) -> string() | true.
canEnterMapLine(MapID, MapPid, Line) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			case callMgrMap(MapID, getLineList, {MapID}) of
				{ok, List} ->
					case lists:keyfind(Line, #recMapInfo.line, List) of
						false ->
							io_lib:format("current map no line: ~p", [Line]);
						_ ->
							{ok, #recMapInfo{line = CLine}} = callMgrMap(MapID, getLineInfo, {MapPid}),
							case CLine =:= Line of
								true ->
									io_lib:format("current line is:~p, can't switch line", [Line]);
								_ ->
									case playerState:getCurHp() > 0 orelse playerState:getActionStatus() =:= ?CreatureActionStatusDead of
										true ->
											true;
										_ ->
											"player dead, can't switch line"
									end
							end
					end;
				_ ->
					"error"
			end;
		_ ->
			"not normal map, can't switch line"
	end.


-spec string_to_integer(S) -> int() when
	S :: string().
string_to_integer(S) ->
	erlang:list_to_integer(S).


string_to_number(S)->
	case catch erlang:list_to_float(S) of
		{'EXIT', _}->
			erlang:list_to_integer(S);
		V ->
			V
	end.

now_microseconds() ->
	{MegaSecs, Secs, MicroSecs} = os:timestamp(),
	1000000000000 * MegaSecs + Secs * 1000000 + MicroSecs.

init_var(_) ->
	testVariant:init_var().
check_var(_) ->
	testVariant:check_var().
%% %%升级工会技能
%% uplv_guild_tec_skill([TecSkillLv])->
%% 			L=[1,2,3,4,5,6,7,8,9,10,11,12],
%% 	 	[playerGuildTechnology:up_lv_guild_tec_skill(E)||E<-L],
%% 	ok.
%% %%召唤工会神兽
%% call_guild_monster(_)->
%%  		playerGuildTechnology:call_guild_monster(),
%% 	ok.
%% %%使用工会宴席
%% use_guild_feast(_)->
%%  		playerGuildTechnology:use_guild_feast(),
%% 	ok.
%% %%参与工会喝酒
%% drink_guild_wine(_)->
%%  		playerGuildTechnology:drink_wine(),
%% 	ok.

goto_exp_map(_) ->
	case core:isCross() of
		false ->
			RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
			MapIdArgu = logicArguLib:getCurrentMapId(),
			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_ENTER_EXP_MAP, [RoleBaseArgu, MapIdArgu]),
			?DEBUG("==oldmapPos==~w~n", [playerState:getOldMapPos()]),
			?DEBUG("R=====~p~n", [R]);
		_ ->
			?ERROR("can not use condition-trigger-mode in cross server!")
	end,
	ok.

on_exp_map(_) ->
	case core:isCross() of
		false ->
			RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
			MapIdArgu = logicArguLib:getCurrentMapId(),
			R = logicLib:runLogicGroup(?LOGIC_ID_ON_EXP_MAP, [RoleBaseArgu, MapIdArgu]),
			?DEBUG("R=====~p~n", [R]);
		_ ->
			?ERROR("can not use condition-trigger-mode in cross server!")
	end,
	ok.

runLogicGroup(A) ->
	case core:isCross() of
		false ->
			[LogicGroupIDStr | _] = A,
			LogicGroupID = erlang:list_to_integer(LogicGroupIDStr),
			RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
			MapIdArgu = logicArguLib:getCurrentMapId(),
			DailyCounterArgu = logicArguLib:getDailyCountArgu(?DailyType_EXP_MAP_EFFECT_TIME, 0, 60000),
			R = logicLib:runLogicGroup(LogicGroupID, [RoleBaseArgu, MapIdArgu, DailyCounterArgu]),
			?DEBUG("runLogic=====R=~p~n", [R]);
		_ ->
			?ERROR("can not use condition-trigger-mode in cross server!")
	end,
	ok.

run_method([Module, Method | _]) ->
	AtomModule = erlang:list_to_atom(Module),
	AtomMethod = erlang:list_to_atom(Method),
	AtomModule:AtomMethod().

ladder1v1(_) ->
%% 	playerLadder1v1:rankSortRiseAward(2991,2989),
%% 	playerLadder1v1:rankSortRiseAward(2991,999),
	playerLadder1v1:rankSortRiseAward(2001, 1712).
%%	playerLadder1v1:rankSortRiseAward(2500,2300).

createhome([Param]) ->
	AdminAreaID = string_to_integer(Param),
	playerHome:createHome(AdminAreaID, "aaa'bb").

enterhome([Param]) ->
	Flag = string_to_integer(Param),
	playerHome:enterHome(Flag).

homeup(Param) ->
	Lvl = case Param of
			  [LvlS] -> string_to_integer(LvlS);
			  _ -> 0
		  end,
	playerHome:gm_homeup(Lvl).
homeup2(_Param) ->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{} = Home ->
			playerHome:upgradeHome(Home);
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNotExist)
	end,
	ok.


createLetter(_Param)->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{} ->
			playerHome:gm_createLetter();
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNotExist)
	end.

homeLetterOverDue([Param])->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{} ->
			Time = string_to_integer(Param),
			playerHome:gm_homeLetterOverDue(Time);
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNotExist)
	end.

deadlineGiftUpdate(Params) ->
	[P1_ | T1] = Params,
	[P2_ | _T2] = T1,
	P1 = erlang:list_to_integer(P1_),
	P2 = erlang:list_to_integer(P2_),
	playerDeadlineGift:updateCondition(P1, P2),
	ok.

deadlineGiftBuy(Params) ->
	[P1_ | T1] = Params,
	[P2_ | T2] = T1,
	[P3_ | _T3] = T2,
	P1 = erlang:list_to_integer(P1_),
	P2 = erlang:list_to_integer(P2_),
	P3 = erlang:list_to_integer(P3_),
	Msg = #pk_U2GS_DeadLineGiftBuy{id = P1, giftID = P2, itemBuyNum = P3},
	playerDeadlineGift:msg(Msg),
	ok.

requstFloatingAward([Param]) ->
	Flag = string_to_integer(Param),
	playerFloatingManual:requstFloatingAward({Flag}).

updatefloating(Param) ->
	[SValue1 | _Other1] = Param,
	[SValue2 | _Other2] = _Other1,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	playerFloatingManual:updateFloating({Type,ID}).

addstylish([Param]) ->
	V = string_to_integer(Param),
	playerHome:addStylish(V).
addcomfort([Param]) ->
	V = string_to_integer(Param),
	playerHome:addComfort(V).
addpopularity([Param]) ->
	V = string_to_integer(Param),
	playerHome:addPopularity(V).
cleanhomeupcd(_Params) ->
	playerHome:cleanHomeUpCD().

getactionpoint(_) ->
	playerActionPoint:getActionPoint().
deductactionpoint(A) ->
	[DeductValue | _] = A,
	playerActionPoint:deductActionPoint(erlang:list_to_integer(DeductValue)).

addactionpoint(A) ->
	[AddValue | _] = A,
	playerActionPoint:addActionPoint(erlang:list_to_integer(AddValue)).

accuReward(A) ->
	[IDStr | _] = A,
	ID = erlang:list_to_integer(IDStr),
	playerDailySignIn:accuReward(ID).

resetpb(_) ->
	playerPetDouble:doubleMountOff().

petab(A) ->
	[ID | T1] = A,
	[Status | _] = T1,
	playerPet:petAssistBattle(
		1,
		list_to_integer(ID),
		list_to_integer(Status)
	).

gotomt(A) ->
	[IDStr | _] = A,
	CopyMapID = erlang:list_to_integer(IDStr),
	case playerCopyMap:canEnterCopyMap(CopyMapID) of
		true ->
			playerMaterialCopy:onEnterMap(CopyMapID);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end.

finishmt(_) ->
	playerMaterialCopy:gmfinish().

fashionSuit(A) ->
	[ID | T1] = A,
	[Op | _] = T1,
	playerFashion:activeFashionSuit(list_to_integer(ID),
		misc:i2b( list_to_integer(Op) )).

resetSkill(_) ->
	playerSkillLearn:resetSkill().

lsgo(A)->
	[Type, Code, Param | _] = A,
	playerLifeSkill:start(
		list_to_integer(Type),
		list_to_integer(Code),
		list_to_integer(Param)
	),
	ok.

lsgw(A)->
	[Type, Code, Param | _] = A,
	playerLifeSkill:giveReward(
		list_to_integer(Type),
		list_to_integer(Code),
		list_to_integer(Param)
	),
	ok.

lsstop(A)->
	[Type | _] = A,
	playerLifeSkill:finish(list_to_integer(Type)),
	ok.

lsget(A)->
	[Type, Num| _] = A,
	playerLifeSkill:buyCount(
		list_to_integer(Type),
		list_to_integer(Num)
	),
	ok.

ets(_)->
	io_lib:format("map(~p,~p), playerets[~p],petEts[~p],monsterEts[~p]",
		[playerState:getMapID(), playerState:getMapPid(),
			playerState:getMapPlayerEts(), playerState:getMapPetEts(), playerState:getMapMonsterEts()]).

cchat(A)->
	[C, Txt | _] = A,
	playerChat:onPlayerChatMsg(#pk_U2GS_ChatInfo{
		channel = list_to_integer(C),
		receiverID = 0,
		receiverName = "",
		content = "<t=0>,," ++ Txt ++"</t><t=104>,,000000</t>"
	}),
	ok.

redname(["0" | _]) ->
	case playerState:getSelectTargetCode() of
		0 ->
			redname(["1"]);	%% 无选择对象时对自己查询
		undefined ->
			redname(["1"]);	%% 无选择对象时对自己查询
		TargetCode ->
			case codeMgr:getObjectTypeByCode(TargetCode) of
				?ObjTypePlayer ->
					Ets = playerState:getMapPlayerEts(),
					case ets:info(Ets, size) of
						undefined ->
							{none, ?LINE};
						_ ->
							case ets:lookup(Ets, TargetCode) of
								[#recMapObject{status = Status}] ->
									misc:testBit(Status, ?CreatureSpecStautsRedName);
								_ ->
									{none, ?LINE}
							end
					end;
				_ ->
					{none, ?LINE}
			end
	end;
redname(["1" | _]) ->
	misc:testBit(playerState:getStatus(), ?CreatureSpecStautsRedName);
redname(_) ->
	redname(["0"]).	%% 默认对选择对象查询


copyrank(A) ->
	[IDStr | _] = A,
	IG = erlang:list_to_integer(IDStr),
	playerCopyMap:queryCopyRankList(IG),
	ok.

bss(A) ->
	[Key | Params] = A,
	Text = stringCfg:getString(list_to_atom(Key), Params) ,
	core:sendBroadcastNotice(Text).


cc(A) when erlang:length(A) >= 2 ->
	[NewCareer | B] = A,
	[IsGM | _] = B,
	playerCareerChange:change(list_to_integer(NewCareer), erlang:list_to_atom(IsGM));
cc(A) ->
	[NewCareer | _] = A,
	playerCareerChange:change(list_to_integer(NewCareer), true).


upgw(A) ->
	[IDStr | _] = A,
	WeaponID = erlang:list_to_integer(IDStr),
	playerGodWeapon:levelupWeapon(WeaponID).

recast(A) ->
	[EquipPos, RecastType , OpType | _] = A,
	playerEquipRecast:equipRecast(list_to_integer(EquipPos), list_to_integer(RecastType), list_to_integer(OpType), []).

skipSkill(A)->
	[Flag | _] = A,
	playerState:setSkipSkillCheck(misc:i2b(list_to_integer(Flag))).

addLifeSkillExp(A)->
	[Type, Exp | _] = A,
	playerLifeSkill:gmAddExp(list_to_integer(Type), list_to_integer(Exp)).

wash(A)->
	[Pos, PropID, PropV, Index | _] = A,
	playerEquipWash:equipWash(
		list_to_integer(Pos),
		list_to_integer(PropID),
		list_to_integer(PropV),
		list_to_integer(Index)
	),
	ok.

robottt(Params) when erlang:length(Params) >= 0 ->
	tt(Params),
	ok.


-spec getSelectRoleID() -> uint64().
getSelectRoleID() ->
	case playerState:getSelectTargetCode() of
		0 ->
			0;
		undefined ->
			0;
		TargetCode ->
			case codeMgr:getObjectTypeByCode(TargetCode) of
				?ObjTypePlayer ->
					case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
						#rec_OnlinePlayer{roleID = TargetRoleID} ->
							TargetRoleID;
						_ ->
							0
					end;
				_ ->
					0
			end
	end.

-spec getSelectMonster() -> uint64().
getSelectMonster() ->
	case playerState:getSelectTargetCode() of
		0 ->
			0;
		undefined ->
			0;
		TargetCode ->
			case codeMgr:getObjectTypeByCode(TargetCode) of
				?ObjTypeMonster ->
					TargetCode;
				_ ->
					0
			end
	end.



