%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 十月 2017 20:01
%%%-------------------------------------------------------------------
-module(playerLifeSkill).
-author("mawenhong").

-include("playerPrivate.hrl").
%% 1.技能cd
%%
%% API
-export([
	sendInitInfo/0,
	start/4,
	giveReward/4,
	finish/1,
	buyCount/2,
	initLifeSkillLevelLog/0
]).

-export([
	onFinishHuntTask/1
]).

-export([
	gmAddExp/2
]).

-record(recLiftSkill, {
	type = 0,
	level = 1,
	exp = 0
}).

-define(LSType_Fish, 1).
-define(LSType_Hunt, 2).
-define(LSType_Mine, 3).
-define(LSType_Cook, 4).
-define(LSType_Make, 5).
-define(LSType_Max, 5).

-define(LSDailyType_SubType_BEGIN, 1).
-define(LSDailyType_SubType_Fish, 1).
-define(LSDailyType_SubType_FishBuy, 2).
-define(LSDailyType_SubType_FishCount, 3).
-define(LSDailyType_SubType_Hunt, 4).
-define(LSDailyType_SubType_HuntBuy, 5).
-define(LSDailyType_SubType_HuntCount, 6).
-define(LSDailyType_SubType_Mine, 7).
-define(LSDailyType_SubType_MineBuy, 8).
-define(LSDailyType_SubType_MineCount, 9).
-define(LSDailyType_SubType_Cook, 10).
-define(LSDailyType_SubType_CookBuy, 11).
-define(LSDailyType_SubType_CookCount, 12).
-define(LSDailyType_SubType_Make, 13).
-define(LSDailyType_SubType_MakeBuy, 14).
-define(LSDailyType_SubType_MakeCount, 15).
-define(LSDailyType_SubType_END, 15).


-define(GetWay_Task, 3).

%%%-------------------------------------------------------------------
gmAddExp(Type, Exp)->
	addLifeSkillExp(Type, Exp).

%%%-------------------------------------------------------------------
onFinishHuntTask(TaskID) ->
	playerSevenDayAim:updateCondition(?SevenDayAim_LSTypeHunt, []),
	L1 = getCfg:get1KeyList(cfg_lifeskill_info),
	L2 = lists:filter(
		fun(PoolID) ->
			case getCfg:getCfgByArgs(cfg_lifeskill_info, PoolID) of
				#lifeskill_infoCfg{get_way = [?GetWay_Task, TaskID]} ->
					true;
				_ ->
					false
			end
		end, L1),
	case L2 of
		[PoolID | _] ->
			case getCfg:getCfgByArgs(cfg_lifeskill_info, PoolID) of
				#lifeskill_infoCfg{get_exp = Exp} ->
					addLifeSkillExp(?LSType_Hunt, Exp);
				_ ->
					skip
			end;
		_ ->
			?WARN("role[~p],onFinishHuntTask(~p) not find cfg",
				[playerState:getRoleID(), TaskID])
	end,
	ok.

%%%-------------------------------------------------------------------
sendInitInfo() ->
	L0 = getLifeSkillList(),
	L1 = initLifeSkill(L0),
	L2 = [marshall(R) || R <- L1],
	playerMsg:sendNetMsg(#pk_GS2U_InitLifeSkillList{infos = L2}),

	List = playerPropSync:getProp(?SerProp_LifeSkillNotFreeCount),
	ListPK = [
		case lists:keyfind(ID, 1, List) of
			false ->
				#pk_lifeSkillCanUseCount{type = ID, count = 0};
			{_, Count} ->
				#pk_lifeSkillCanUseCount{type = ID, count = Count}
		end
		||
		ID <- lists:seq(?LSDailyType_SubType_BEGIN, ?LSDailyType_SubType_END)
	],
	playerMsg:sendNetMsg(#pk_GS2U_LifeSkillCanUseCount{listNew = ListPK}),

	%% 初始化自增计数
	playerState2:lifeSkill_fish_count(-1),	%% 初始化为-1表示尚未进行钓鱼行为
	case playerPropSync:getProp(?SerProp_LifeSkillFishTime) of
		{_, _, _} ->
			skip;
		_ ->
			%% 这里是因为引用（erlang:make_ref()）可以从erlang结构转换为字符串
			%% 但无法从字符串转换回来
			%% 之前的逻辑因此会取到undefined
			%% 此处修复处理为初始化数据
			playerPropSync:setAny(?SerProp_LifeSkillFishTime, {0, misc_time:localtime_seconds(), 0})
	end,
	ok.

initLifeSkill([]) ->
	L0 = lists:seq(1, ?LSType_Max),
	L1 =
		lists:foldl(
			fun(Type, Acc) ->
				[#recLiftSkill{type = Type, level = 1, exp = 0} | Acc]
			end, [], L0),
	setLifeSkillList(L1),
	L1;
initLifeSkill(L) ->
	L.
%%初始化玩家最开始的等级(默认等级为一级,没发生变化的数据,当前等级和之前等级均为一级)创建角色时记录
initLifeSkillLevelLog() ->
	L0 = lists:seq(1, ?LSType_Max),
	lists:foreach(fun(Type) -> initLifeSkillLevel(Type) end, L0).

initLifeSkillLevel(Type) ->
	LifeSkill = #rec_log_life_skill_level{
		playerID = playerState:getRoleID(),
		type = Type,
		oldLevel = 1,
		curLevel = 1,
		time = misc_time:utc_seconds()
	},
	dbLog:sendSaveLogLifeSkill(LifeSkill).
%%%-------------------------------------------------------------------
start(Type, Code, Param, Times) ->
	case canStart(Type, Code, Param, Times) of
		{true, X} ->
			doStart(Type, X, Param, Times);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_V ->
			skip
	end,
	ok.

canStart(?LSType_Fish, Code, Param, Times) ->
	checkUseLifeSkillWithNpc(?LSType_Fish, Code, Param, Times);
canStart(?LSType_Mine, Code, Param, Times) ->
	checkUseLifeSkillWithNpc(?LSType_Mine, Code, Param, Times);
canStart(Type, Code, Param, Times) ->
	checkUseLifeSkillWithPoolID(Type, Code, Param, Times).

doStart(Type, Level, Param, Times) ->
	setUseLifeSkillCD(Type),
	doStart1(Type, Level, Param, Times),
	ok.

doStart1(?LSType_Fish, Level, _Param, _Times) ->
	case getCfg:getCfgByArgs(cfg_lifeskill, ?LSType_Fish, Level) of
		#lifeskillCfg{buff = BuffID} when is_number(BuffID) ->
			playerBuff:addBuff(BuffID, 1);
		_ ->
			skip
	end,
	%% 需要统计钓鱼时长
	%% 这里在发起钓鱼时记录一个引用（后因引用不能存储为字符串，故改为自增计数）
	%% 结束钓鱼时判定引用是否与?SerProp_LifeSkillFishTime中相同
	%% 相同则累计时长，不同则抛弃
	case playerPropSync:getProp(?SerProp_LifeSkillFishTime) of
		{Count, _, TimeAll} ->
			CountNew =
				case Count + 1 >= 10000 of	%% 钓鱼可能会比较频繁，限制自增计数在一定范围内
					true ->
						1;
					_ ->
						Count + 1
				end,
			playerState2:lifeSkill_fish_count(CountNew),
			playerPropSync:setAny(?SerProp_LifeSkillFishTime, {CountNew, misc_time:localtime_seconds(), TimeAll});
		_ ->
			playerState2:lifeSkill_fish_count(1),
			playerPropSync:setAny(?SerProp_LifeSkillFishTime, {1, misc_time:localtime_seconds(), 0})
	end,
	ok;
doStart1(?LSType_Mine, Level, _Param, _Times) ->
	case getCfg:getCfgByArgs(cfg_lifeskill, ?LSType_Mine, Level) of
		#lifeskillCfg{buff = BuffID} when is_number(BuffID) ->
			playerBuff:addBuff(BuffID, 1);
		_ ->
			skip
	end,
	ok;
doStart1(Type, Level, Param, Times) ->
	doGive(Type, Level, Param, Times),
	skip.

%%%-------------------------------------------------------------------
buyCount(Type, Number) ->
	case canBuyCount(Type, Number) of
		{true, {MoneyUseType, MoneyNum}} ->
			doBuyCount(Type, Number, MoneyUseType, MoneyNum);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end,
	ok.

canBuyCount(Type, Number) ->
	case checkCanBuy(Type, Number) of
		{true, {MoneyUseType, MoneyNum}} ->
			case playerMoney:canUseCoin(MoneyUseType, MoneyNum) of
				true ->
					{true, {MoneyUseType, MoneyNum}};
				_ ->
					skip
			end;
		V ->
			V
	end.


doBuyCount(Type, Number, MoneyUseType, MoneyNum) ->
	addBuyCount(Type),
	true = playerMoney:useCoin(MoneyUseType, MoneyNum,
		#recPLogTSMoney{
			reason = ?CoinUseLifeSkill,
			param = 0,
			target = ?PLogTS_System,
			source = ?PLogTS_PlayerSelf
		}),
	addNotFreeCount(Type, Number),
	sendBuySuccessTips(Type),
	ok.

sendBuySuccessTips(?LSType_Fish)->
	playerMsg:sendErrorCodeMsg(?ErrorCode_LifeSkill_BuyYuErOk);
sendBuySuccessTips(?LSType_Hunt)->
	playerMsg:sendErrorCodeMsg(?ErrorCode_LifeSkill_BuyLieGong);
sendBuySuccessTips(?LSType_Mine)->
	playerMsg:sendErrorCodeMsg(?ErrorCode_LifeSkill_BuyChuTou);
sendBuySuccessTips(_Type)->
	ok.

%%%-------------------------------------------------------------------
giveReward(
	Type, Code, Param, Times
) when Type =:= ?LSType_Fish; Type =:= ?LSType_Mine ->
	case canGive(Type, Code, Param, Times) of
		{true, X} ->
			doGive(Type, X, Param, Times);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_V ->
			skip
	end,
	ok;
giveReward(_Type, _Code, _Param, _Times) ->
	ok.

canGive(?LSType_Fish, NpcCode, Param, Times) ->
	canStart(?LSType_Fish, NpcCode, Param, Times);
canGive(?LSType_Mine, NpcCode, Param, Times) ->
	canStart(?LSType_Mine, NpcCode, Param, Times);
canGive(_Type, _NpcCode, _Param, _Times) ->
	skip.


%%%-------------------------------------------------------------------
doGive(Type, MaxLevel, Param, Times) ->
	setUseLifeSkillCD(Type),
	addUseCount(Type),
	doGive1(isPossible(Type), Type, MaxLevel, Param, Times),
	ok.

doGive1(false, Type, _ItemNeedSkillLevel, _PoolID, Times) ->
	doGive2(Type, Times, undefined);
doGive1(true, ?LSType_Fish, SkillLevel, _Param, _Times) ->
	L1 = getFishCfg(SkillLevel),
	Cfg = getCfgWithWeight(?LSType_Fish, L1),
	doGive11(?LSType_Fish, 1, Cfg),
	ok;
doGive1(true, ?LSType_Mine, MineLevel, _Param, _Times) ->
	L1 = getMineCfg(MineLevel),
	Cfg = getCfgWithWeight(?LSType_Mine, L1),
	doGive11(?LSType_Mine, 1, Cfg),
	ok;
doGive1(true, Type, _ItemNeedSkillLevel, PoolID, Times) ->
	Cfg = getCfg:getCfgByArgs(cfg_lifeskill_info, PoolID),
	doGive11(Type, Times, Cfg),
	ok.

doGive11(Type, Times, #lifeskill_infoCfg{energy_cost = SpiritCost }= Cfg)->
	IsCanGo =
		case is_number(SpiritCost) of
			true ->
				playerSpirit:dec(erlang:trunc(SpiritCost * Times));
			_ ->
				true
		end,
	case IsCanGo of
		true ->
			doGive2(Type, Times, Cfg);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_LifeSkill_NoSpirit),
			playerMsg:sendNetMsg(#pk_GS2U_BreakLifeSkill{type = Type}),
			skip
	end,
	ok;
doGive11(_Type, _Times, _Cfg) -> skip.

isPossible(Type) ->
	case getLifeSkill(Type) of
		#recLiftSkill{level = SkillLevel} ->
			case getCfg:getCfgByArgs(cfg_lifeskill, Type, SkillLevel) of
				#lifeskillCfg{rate = Rate} ->
					misc:isPossible(Rate);
				_ ->
					false
			end;
		_ ->
			false
	end.

getCfgWithWeight(_Type, []) ->
	undefined;
getCfgWithWeight(_Type, L) ->
	L1 = lists:reverse(L),
	case L1 of
		[] ->
			undefined;
		_ ->
			case misc:calcOddsByWeightList(L1) of
				PoolID when is_number(PoolID) ->
					getCfg:getCfgByArgs(cfg_lifeskill_info, PoolID);
				_ ->
					undefined
			end
	end.

%%%-------------------------------------------------------------------
doGive2(Type, _Times, undefined) ->
	doAddSevenDayAim(Type),
	playerMsg:sendNetMsg(#pk_GS2U_GiveRewardAck{type = Type, infos = []});
doGive2(?LSType_Hunt, _Times,
	#lifeskill_infoCfg{get_way = Way, stuff = ItemList}
) ->
	true = decItemCost(ItemList, 1),
	case Way of
		[_, TaskID] ->
			playerTask:acceptTask(TaskID, 0);
		_ ->
			skip
	end,
	ok;
%% 家具生产-新需求不产生真实道具
doGive2(?LSType_Make, Times,
	#lifeskill_infoCfg{
		level = Level,
		item_id = ItemID,
		get_num = [Min, Max],
		reward = Eggs,
		get_exp = Exp,
		stuff = ItemList
	} = Cfg
) ->
	true = decItemCost(ItemList, Times),
%%
	L1 = giveItem(?LSType_Make, Level, ItemID, Min, Max, Times),
	L2 = giveEgg(Eggs, Cfg, Times),
%%

	%%策划说不会有幸运奖
	%%NewList = L1 ++ L2,
	%%saveMakeFurniTrueToDB(NewList),
	addLifeSkillExp(?LSType_Make, erlang:trunc(Exp * Times)),
	playerSevenDayAim:updateCondition(?SevenDayAim_LSTypeMake, [ItemID]),
	playerMsg:sendNetMsg(#pk_GS2U_GiveRewardAck{
		type = ?LSType_Make,
		infos = [#pk_itemInfo{itemID = ID, itemNum = Num} || {ID, Num} <- (L1 ++ L2)]
	}),
	ok;
%% 其它
doGive2(Type, Times,
	#lifeskill_infoCfg{
		level = Level,
		item_id = ItemID,
		get_num = [Min, Max],
		reward = Eggs,
		get_exp = Exp,
		stuff = ItemList
	} = Cfg
) ->
	doAddSevenDayAim(Type),
	true = decItemCost(ItemList, Times),
	L1 = giveItem(Type, Level, ItemID, Min, Max, Times),
	L2 = giveEgg(Eggs, Cfg, Times),
	addLifeSkillExp(Type, erlang:trunc(Exp * Times)),
	playerMsg:sendNetMsg(#pk_GS2U_GiveRewardAck{
		type = Type,
		infos = [#pk_itemInfo{itemID = ID, itemNum = Num} || {ID, Num} <- (L1 ++ L2)]
	}),
	ok;
doGive2(Type, _Times, Cfg) ->
	?ERROR("role[~p],type[~p],cfg[~p]",
		[playerState:getRoleID(), Type, Cfg]).


decItemCost(undefined, _Times) ->
	true;
decItemCost([], _Times) ->
	true;
decItemCost(ItemList, Times) ->
	decItemList(ItemList, Times).

decItemList([], _Times) ->
	true;
decItemList([{ItemID, ItemNum} | L], Times) ->
	RealNum = erlang:trunc(ItemNum * Times),
	PLog = #recPLogTSItem{
		old = RealNum,
		new = 0,
		change = -RealNum,
		target = ?PLogTS_System,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = 0,
		reasonParam = ?ItemDeleteReasonLifeSkill
	},
	#itemCfg{itemType = ItemType} = getCfg:getCfgPStack(cfg_item, ItemID),
	true = playerPackage:delGoodsByID(playerPackage:getPackageType(ItemType), ItemID, RealNum, PLog),
	decItemList(L, Times).


%%%-------------------------------------------------------------------
giveEgg([{_ID, _Min, _Max, _Prob} | _ ] = EggList,
	#lifeskill_infoCfg{type = Type, level = Level}, Times
) ->
	lists:foldl(
		fun({EItemID, EMin, EMax, Prob}, Acc) ->
			case misc:isPossible(erlang:trunc(Prob * Times)) of
				true ->
					giveItem(Type, Level, EItemID, EMin, EMax, 1) ++ Acc;
				_ ->
					Acc
			end
		end, [], EggList);
giveEgg(undefined, _Cfg, _Times) ->
	[];
giveEgg([], _Cfg, _Times) ->
	[];
giveEgg(_, Cfg, _Times) ->
	?ERROR("cfg[~p] reward error", [Cfg]),
	[].

%%%-------------------------------------------------------------------

%%giveItem(?LSType_Make, _Level, ItemID, ItemMin, ItemMax, Times) ->
%%	ItemNum = erlang:trunc(misc:rand(ItemMin, ItemMax) * Times),
%%	[{ItemID, ItemNum}];

giveItem(Type, Level, ItemID, ItemMin, ItemMax, Times) ->
	ItemNum = erlang:trunc(misc:rand(ItemMin, ItemMax) * Times),
	PLog = #recPLogTSItem{
		old = 0,
		new = ItemNum,
		change = ItemNum,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_Task,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourceLifeSkill,
		reasonParam = Type * 100 + Level
	},
	playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, PLog),
	[{ItemID, ItemNum}].

%%%-------------------------------------------------------------------
finish(?LSType_Fish) ->
	playerBuff:delBuffByState(?LifeSkill),
	%% 统计钓鱼时长
	Count = playerState2:lifeSkill_fish_count(),
	TimeNow = misc_time:localtime_seconds(),
	case playerPropSync:getProp(?SerProp_LifeSkillFishTime) of
		{Count, TimeLast, TimeAll} when TimeNow > TimeAll ->
			playerPropSync:setAny(?SerProp_LifeSkillFishTime, {Count, TimeNow, TimeNow - TimeLast + TimeAll}),
			playerState2:lifeSkill_fish_count(-1);	%% 重置为-1，结束本次统计，等待下次开始钓鱼时再开启
		_ ->
			skip
	end,
	ok;
finish(?LSType_Mine) ->
	playerBuff:delBuffByState(?LifeSkill),
	ok;
finish(_Any) ->
	ok.


%%%-------------------------------------------------------------------
addLifeSkillExp(Type, Exp) ->
	case getLifeSkill(Type) of
		#recLiftSkill{} = SkillInfo ->
			doAddLifeSkillExp(Exp, SkillInfo);
		_ ->
			?ERROR("addLifeSkillExp[~p]exp[~p],list[~p]",
				[Type, Exp, getLifeSkillList()])
	end,
	ok.

doAddLifeSkillExp(
	AddExp,
	#recLiftSkill{
		type = Type,
		exp = Exp
	} = Skill
) ->
	LifeSkillList = getLifeSkillList(),
	NewSkill = calcSkillLevel(100, Skill#recLiftSkill{exp = Exp + AddExp}),
	NewLifeSkillList = lists:keystore(Type, #recLiftSkill.type, LifeSkillList, NewSkill),
	setLifeSkillList(NewLifeSkillList),
	playerMsg:sendNetMsg(#pk_GS2U_UpdateLifeSkill{info = marshall(NewSkill)}),
	catch onLifeSkillLevelUp(Type, Skill#recLiftSkill.level, NewSkill#recLiftSkill.level),
	ok.

%% 没升级
onLifeSkillLevelUp(_Type, _OldLevel, NewLevel) when NewLevel =:= _OldLevel->
	ok;
%% 升级了
onLifeSkillLevelUp(_Type, _OldLevel, _NewLevel)->
	addLifeSkillAchieve(_Type,_OldLevel,_NewLevel),
	ok.

addLifeSkillAchieve(_Type,_OldLevel,_NewLevel)->
	case _Type of
		?LSType_Fish->
		   playerAchieve:achieveEvent(?Achieve_Lifeskill_1,[_NewLevel,1]);
		?LSType_Hunt->
			playerAchieve:achieveEvent(?Achieve_Lifeskill_2,[_NewLevel,1]);
		?LSType_Mine->
			playerAchieve:achieveEvent(?Achieve_Lifeskill_3,[_NewLevel,1]);
		?LSType_Cook->
			playerAchieve:achieveEvent(?Achieve_Lifeskill_4,[_NewLevel,1]);
		?LSType_Make->
			playerAchieve:achieveEvent(?Achieve_Lifeskill_5,[_NewLevel,1]);
		_->
			skip

    end,
	%%生活技能升级之后记录等级变化日志
	LifeSkill = #rec_log_life_skill_level{
		playerID = playerState:getRoleID(),
		type = _Type,
		oldLevel = _OldLevel,
		curLevel = _NewLevel,
		time = misc_time:utc_seconds()
	},
	dbLog:sendSaveLogLifeSkill(LifeSkill),
	ok.


calcSkillLevel(0, Skill) ->
	Skill;
calcSkillLevel(
	Limit,
	#recLiftSkill{
		level = Level,
		exp = Exp,
		type = Type
	} = Skill
) ->
	case getCfg:getCfgByArgs(cfg_lifeskill, Type, Level) of
		#lifeskillCfg{skill_exp = 0} ->
			Skill;
		#lifeskillCfg{skill_exp = NeedExp} when Exp < NeedExp ->
			Skill;
		#lifeskillCfg{skill_exp = NeedExp} ->
			calcSkillLevel(Limit - 1, Skill#recLiftSkill{level = Level + 1, exp = Exp - NeedExp});
		_ ->
			Skill
	end.

%% 1.不能使用playerDaily,用playerPropSync来代替 -> why -> 因为playerDaily每日要重置,不符合需求
%% 2.playerDaily在客户端上线\数变化的时候,会同步最新的数据 -> 上线\数据变化的时候,需要自己发协议通知客户端数据改变
%%%-------------------------------------------------------------------
getUsedCount(LifeSkillType) ->
	DailySubType = geUseDailyType(LifeSkillType),
	List = playerPropSync:getProp(?SerProp_LifeSkillNotFreeCount),
	case lists:keyfind(DailySubType, 1, List) of
		false ->
			0;
		{_, Count} ->
			Count
	end.
	%playerDaily:getDailyCounter(?DailyType_LifeSkillBuy, DailySubType).

addUseCount(Type) ->
	DailySubType = geUseDailyType(Type),
	List = playerPropSync:getProp(?SerProp_LifeSkillNotFreeCount),
	CountNew =
		case lists:keyfind(DailySubType, 1, List) of
			false ->
				playerPropSync:setAny(?SerProp_LifeSkillNotFreeCount, [{DailySubType, 1} | List]),
				1;
			{_, Count} ->
				ListNew = lists:keyreplace(DailySubType, 1, List, {DailySubType, Count + 1}),
				playerPropSync:setAny(?SerProp_LifeSkillNotFreeCount, ListNew),
				Count + 1
		end,
	playerMsg:sendNetMsg(#pk_GS2U_LifeSkillCanUseCount{listNew = [#pk_lifeSkillCanUseCount{type = DailySubType,count = CountNew}]}).
	%%playerDaily:incDailyCounter(?DailyType_LifeSkillBuy, DailySubType).

getBuyCount(LifeSkillType) ->
	DailySubType = getBuyDailyType(LifeSkillType),
	List = playerPropSync:getProp(?SerProp_LifeSkillNotFreeCount),
	case lists:keyfind(DailySubType, 1, List) of
		false ->
			0;
		{_, Count} ->
			Count
	end.
%%	playerDaily:getDailyCounter(?DailyType_LifeSkillBuy, DailySubType).

addBuyCount(Type) ->
	DailySubType = getBuyDailyType(Type),
	List = playerPropSync:getProp(?SerProp_LifeSkillNotFreeCount),
	CountNew =
		case lists:keyfind(DailySubType, 1, List) of
			false ->
				playerPropSync:setAny(?SerProp_LifeSkillNotFreeCount, [{DailySubType, 1} | List]),
				1;
			{_, Count} ->
				ListNew = lists:keyreplace(DailySubType, 1, List, {DailySubType, Count + 1}),
				playerPropSync:setAny(?SerProp_LifeSkillNotFreeCount, ListNew),
				Count + 1
		end,
	playerMsg:sendNetMsg(#pk_GS2U_LifeSkillCanUseCount{listNew = [#pk_lifeSkillCanUseCount{type = DailySubType,count = CountNew}]}).
%%	playerDaily:incDailyCounter(?DailyType_LifeSkillBuy, DailySubType).

getNotFreeCount(LifeSkillType) ->
	DailySubType = getNotFreeDailyType(LifeSkillType),
	List = playerPropSync:getProp(?SerProp_LifeSkillNotFreeCount),
	case lists:keyfind(DailySubType, 1, List) of
		false ->
			0;
		{_, Count} ->
			Count
	end.
%%	playerDaily:getDailyCounter(?DailyType_LifeSkillBuy, DailySubType).

addNotFreeCount(Type, Num) ->
	DailySubType = getNotFreeDailyType(Type),
	List = playerPropSync:getProp(?SerProp_LifeSkillNotFreeCount),
	CountNew =
		case lists:keyfind(DailySubType, 1, List) of
			false ->
				playerPropSync:setAny(?SerProp_LifeSkillNotFreeCount, [{DailySubType, Num} | List]),
				Num;
			{_, Count} ->
				ListNew = lists:keyreplace(DailySubType, 1, List, {DailySubType, Count + Num}),
				playerPropSync:setAny(?SerProp_LifeSkillNotFreeCount, ListNew),
				Count + Num
		end,
	playerMsg:sendNetMsg(#pk_GS2U_LifeSkillCanUseCount{listNew = [#pk_lifeSkillCanUseCount{type = DailySubType,count = CountNew}]}).
%%	playerDaily:addDailyCounter(?DailyType_LifeSkillBuy, DailySubType, Num).

getNotFreeDailyType(?LSType_Fish) -> ?LSDailyType_SubType_FishCount;
getNotFreeDailyType(?LSType_Hunt) -> ?LSDailyType_SubType_HuntCount;
getNotFreeDailyType(?LSType_Mine) -> ?LSDailyType_SubType_MineCount;
getNotFreeDailyType(?LSType_Cook) -> ?LSDailyType_SubType_CookCount;
getNotFreeDailyType(?LSType_Make) -> ?LSDailyType_SubType_MakeCount.

getBuyDailyType(?LSType_Fish) -> ?LSDailyType_SubType_FishBuy;
getBuyDailyType(?LSType_Hunt) -> ?LSDailyType_SubType_HuntBuy;
getBuyDailyType(?LSType_Mine) -> ?LSDailyType_SubType_MineBuy;
getBuyDailyType(?LSType_Cook) -> ?LSDailyType_SubType_CookBuy;
getBuyDailyType(?LSType_Make) -> ?LSDailyType_SubType_MakeBuy.

geUseDailyType(?LSType_Fish) -> ?LSDailyType_SubType_Fish;
geUseDailyType(?LSType_Hunt) -> ?LSDailyType_SubType_Hunt;
geUseDailyType(?LSType_Mine) -> ?LSDailyType_SubType_Mine;
geUseDailyType(?LSType_Cook) -> ?LSDailyType_SubType_Cook;
geUseDailyType(?LSType_Make) -> ?LSDailyType_SubType_Make.

%%%-------------------------------------------------------------------
checkUseLifeSkillWithNpc(Type, Code, _Param, _Times) ->
	case checkNpc(Type, Code) of
		{true, NpcLevel} ->
			case checkSkillCD(Type, getSkillUsdCdCfg(Type)) of
				{true, _} ->
					case checkCount(Type) of
						{true, _} ->
							checkLifeSkillLevel(Type, NpcLevel);
						V3 ->
							V3
					end;
				V2 ->
					V2
			end;
		V1 ->
			V1
	end.

checkUseLifeSkillWithPoolID(Type, _Code, PoolID, Times) ->
	case checkSkillCD(Type, getSkillUsdCdCfg(Type)) of
		{true, _} ->
			case checkCount(Type) of
				{true, _} ->
					checkLifeSkillWithPoolID(Type, PoolID, Times);
				V2 ->
					V2
			end;
		V1 ->
			V1
	end.

checkNpc(Type, Code) ->
	case checkNpcDist(Code) of
		{true, NpcID} ->
			checkNpc1(Type, getCfg:getCfgByArgs(cfg_npc, NpcID));
		V ->
			V
	end.

checkNpc1(Type, #npcCfg{npc_level = Level} = NpcCfg) ->
	case checkNpcType(Type, NpcCfg) of
		{true, _} ->
			{true, Level};
		V3 ->
			V3
	end;
checkNpc1(_Type, _Any) ->
	{false, ?ErrorCode_LifeSkill_FarFromNpc}.

checkNpcType(?LSType_Fish, #npcCfg{type = ?NpcType_Fish}) ->
	{true, 0};
checkNpcType(?LSType_Mine, #npcCfg{type = ?NpcType_Mine}) ->
	{true, 0};
checkNpcType(_Any, _Cfg) ->
	{false, ?ErrorCode_LifeSkill_ErrorNpc}.

checkNpcDist(NpcCode) ->
	{X, Y} = playerState:getPos(),
	Npc = playerState:getNpcByCode(NpcCode),
	case Npc of
		notFound ->
			{false, ?ErrorCode_LifeSkill_FarFromNpc};
		#recMapObject{id = NpcDataID} ->

			DistSQ = misc:calcDistSquare(X, Y, Npc#recMapObject.x, Npc#recMapObject.y),
			case DistSQ > ?TalkToNpc_Distance * ?TalkToNpc_Distance of
				true ->
					{false, ?ErrorCode_LifeSkill_FarFromNpc};
				false ->
					{true, NpcDataID}
			end;
		_ ->
			{false, ?ErrorCode_LifeSkill_FarFromNpc}
	end.

checkLifeSkillWithPoolID(Type, PoolID, Times) ->
	case getCfg:getCfgByArgs(cfg_lifeskill_info, PoolID) of
		#lifeskill_infoCfg{stuff = ItemList, get_way = GetWay, level = Level} ->
			case checkGetWay(Type, GetWay) of
				{true, _} ->
					case checkItemCost(ItemList, Times) of
						{true, _} ->
%%							Level = getPoolIDNeedLevel(Type, PoolID),
							checkLifeSkillLevel(Type, Level);
						V ->
							V
					end;
				V1 ->
					V1
			end;
		_ ->
			{false, ?ErrorCode_LifeSkill_LowLevel}
	end.



checkGetWay(?LSType_Hunt, [_, TaskID]) ->
	case playerTask:isAcceptedTaskByID(TaskID) of
		true ->
			skip;
		_ ->
			{true, 0}
	end;
checkGetWay(_Type, _Any) ->
	{true, 0}.

checkItemCost(undefined, _Times) ->
	{true, []};
checkItemCost([], _Times) ->
	{true, []};
checkItemCost(ItemList, Times) ->
	case checkItemList(ItemList, Times) of
		true ->
			{true, ItemList};
		_ ->
			{false, ?ErrorCode_LifeSkill_NoItems}
	end.

checkItemList([], _Times) ->
	true;
checkItemList([{ItemID, ItemNum} | L], Times) ->
	case playerPackage:getItemNumByID(ItemID) >= erlang:trunc(ItemNum * Times) of
		true ->
			checkItemList(L, Times);
		_ ->
			false
	end.

checkLifeSkillLevel(Type, LimitLevel) ->
	case getLifeSkill(Type) of
		#recLiftSkill{level = Level} when Type =:= ?LSType_Fish ->
			{true, Level};
		#recLiftSkill{level = Level} when Level >= LimitLevel ->
			{true, LimitLevel};
		#recLiftSkill{} ->
			{false, ?ErrorCode_LifeSkill_LowLevel};
		_ ->
			{false, ?ErrorCode_LifeSkill_NoLearn}
	end.


checkCount(?LSType_Cook) ->
	{true, 0};
checkCount(?LSType_Make) ->
	{true, 0};
checkCount(Type) ->
	FreeCount = getFreeCount(Type),
	BuyCount = getNotFreeCount(Type),
	UseCount = getUsedCount(Type),
	case Type of
		?LSType_Fish ->
			{(FreeCount + BuyCount) > UseCount, ?ErrorCode_LifeSkill_NoYuEr};
		?LSType_Hunt ->
			{(FreeCount + BuyCount) > UseCount, ?ErrorCode_LifeSkill_NoLieGong};
		?LSType_Mine ->
			{(FreeCount + BuyCount) > UseCount, ?ErrorCode_LifeSkill_NoChuTou}
	end.


checkSkillCD(Type, Cd) ->
	L = getLifeSkillCDList(),
	case lists:keyfind(Type, 1, L) of
		{_, LastUseTime} ->
			{myNow() >= (LastUseTime + Cd), ?ErrorCode_LifeSkill_CD};
		_ ->
			{true, 0}
	end.

checkCanBuy(Type, Num) ->
	case getCanBuyCount(Type) > getBuyCount(Type) of
		true ->
			checkCanBuy1(Type, Num);
		_ ->
			{false, ?ErrorCode_LifeSkill_CantBuy}
	end.

checkCanBuy1(Type, Num) ->
	case getLifeSkill(Type) of
		#recLiftSkill{level = Level} ->
			case getCfg:getCfgByArgs(cfg_lifeskill, Type, Level) of
				#lifeskillCfg{buy_times = TL} when is_list(TL) ->
					case lists:keyfind(Num, 1, TL) of
						{_, MoneyUseType, MoneyNum, _} ->
							{true, {MoneyUseType, MoneyNum}};
						_ ->
							{false, ?ErrorCode_LifeSkill_CantBuy}
					end;
				_ ->
					{false, ?ErrorCode_LifeSkill_CantBuy}
			end;
		_ ->
			{false, ?ErrorCode_LifeSkill_NoLearn}
	end.

%%%-------------------------------------------------------------------
%%getPoolIDNeedLevel(Type, PoolID) ->
%%	L1 = getCfg:get2KeyList(cfg_lifeskill, Type),
%%	doCheckPoolNeedLevel(L1, Type, PoolID).
%%
%%doCheckPoolNeedLevel([], _Type, _PoolID) ->
%%	999999999;
%%doCheckPoolNeedLevel([Level | List], Type, PoolID) ->
%%	case getCfg:getCfgByArgs(cfg_lifeskill, Type, Level) of
%%		#lifeskillCfg{product = PL} when is_list(PL) ->
%%			case lists:member(PoolID, PL) of
%%				true ->
%%					Level;
%%				_ ->
%%					doCheckPoolNeedLevel(List, Type, PoolID)
%%			end;
%%		_ ->
%%			999999999
%%	end.

getFishCfg(MaxLevel) ->
	L1 =
		lists:foldl(
			fun(Level, Acc) ->
				case getCfg:getCfgByArgs(cfg_lifeskill, ?LSType_Fish, Level) of
					#lifeskillCfg{product = PL} when is_list(PL) ->
						Acc ++ PL;
					_ ->
						Acc
				end
			end, [], lists:seq(1, MaxLevel)),

	lists:foldl(
		fun(PoolID, Acc) ->
			#lifeskill_infoCfg{get_weight = Weight} = getCfg:getCfgByArgs(cfg_lifeskill_info, PoolID),
			[{Weight, PoolID} | Acc]
		end, [], L1).

getMineCfg(MineLevel) ->
	PoolList =
		case getCfg:getCfgByArgs(cfg_lifeskill, ?LSType_Mine, MineLevel) of
			#lifeskillCfg{product = PL} when is_list(PL) ->
				PL;
			_ ->
				[]
		end,
	lists:foldl(
		fun(PoolID, Acc) ->
			#lifeskill_infoCfg{get_weight = Weight} = getCfg:getCfgByArgs(cfg_lifeskill_info, PoolID),
			[{Weight, PoolID} | Acc]
		end, [], PoolList).



getFreeCount(_Type) ->
	%case getLifeSkill(Type) of
	%	#recLiftSkill{level = Level} ->
	%		case getCfg:getCfgByArgs(cfg_lifeskill, Type, Level) of
	%			#lifeskillCfg{buy_initial = Count} when is_number(Count) ->
	%				Count;
	%			_ ->
	%				0
	%		end;
	%	_ ->
	%		0
	%end.
	% LUNA-5330 【服务器】lifeskill配置字段buy_initial删除
	0.

getCanBuyCount(Type) ->
	case getLifeSkill(Type) of
		#recLiftSkill{level = Level} ->
			case getCfg:getCfgByArgs(cfg_lifeskill, Type, Level) of
				#lifeskillCfg{buy_limit = Limit} ->
					Limit;
				_ ->
					0
			end;
		_ ->
			0
	end.

getSkillUsdCdCfg(Type) ->
	case getLifeSkill(Type) of
		#recLiftSkill{level = Level} ->
			case getCfg:getCfgByArgs(cfg_lifeskill, Type, Level) of
				#lifeskillCfg{cd = CD} ->
					CD;
				_ ->
					3600
			end;
		_ ->
			3600
	end.

getLifeSkillList() ->
	playerPropSync:getProp(?SerProp_LifeSkill).

setLifeSkillList(SkillList) ->
	playerPropSync:setAny(?SerProp_LifeSkill, SkillList),
	ok.

getLifeSkill(Type) ->
	L = getLifeSkillList(),
	lists:keyfind(Type, #recLiftSkill.type, L).

setUseLifeSkillCD(Type) ->
	L1 = getLifeSkillCDList(),
	L2 = lists:keystore(Type, 1, L1, {Type, myNow()}),
	setLifeSkillCDList(L2),
	ok.

setLifeSkillCDList(L) ->
	put(lifeSkillCDList, L),
	ok.


getLifeSkillCDList() ->
	case get(lifeSkillCDList) of
		undefined ->
			[];
		L ->
			L
	end.

marshall(#recLiftSkill{
	type = Type,
	level = Level,
	exp = Exp
}) ->
	#pk_LifeSkillInfo{type = Type, level = Level, exp = Exp}.

myNow() ->
	time2:getTimestampMS().

%%saveMakeFurniTrueToDB(ItemList)->
%%
%%	case ItemList  of
%%		  []->
%%				skip;
%%		_->
%%			case ets:lookup(?HomeFurnitrueEts,playerState:getRoleID() ) of
%%				[#rec_home_furnitrue{furniTrueData = FurnitruePackData} = FurnitrueOld] ->
%%					ListFurnitruePackDataOld = misc:string_to_term(FurnitruePackData),
%%					F =
%%						fun({ID, Num},Arr)->
%%							L = lists:seq(1, Num),
%%							_ = [[#hasFurnitureInfo{uid = uidMgr:makeFurnitrueUID(),time =misc_time:localtime_seconds() ,itemID = ID}|Arr] || _ <- L],
%%							Arr
%%						end,
%%					NewFurnitrueList =  lists:foldl(F,ListFurnitruePackDataOld, ItemList),
%%					NewArea =   FurnitrueOld#rec_home_furnitrue{roleID =  playerState:getRoleID(),furniTrueData =  misc:term_to_string(NewFurnitrueList)},
%%					ets:insert(?HomeFurnitrueEts, NewArea),
%%					homeInterface:saveHome(NewArea);
%%				_->
%%					F =
%%						fun({ID, Num},Arr)->
%%							L = lists:seq(1, Num),
%%							_ = [[#hasFurnitureInfo{uid = uidMgr:makeFurnitrueUID(),time =misc_time:localtime_seconds() ,itemID = ID}|Arr] || _ <- L],
%%							Arr
%%						end,
%%					NewFurnitrueList =  lists:foldl(F,[], ItemList),
%%					NewArea =  #rec_home_furnitrue{roleID =  playerState:getRoleID(),furniTrueData =  misc:term_to_string(NewFurnitrueList)},
%%					ets:insert(?HomeFurnitrueEts, NewArea),
%%					homeInterface:saveHome({insert, NewArea})
%%			end
%%	end,
%%	ok.


doAddSevenDayAim(Type) ->
	case Type of
		?LSType_Fish ->
			playerSevenDayAim:updateCondition(?SevenDayAim_LSTypeFish, []);
		?LSType_Mine ->
			playerSevenDayAim:updateCondition(?SevenDayAim_LSTypeMine, []);
		_ ->
			skip
	end.
