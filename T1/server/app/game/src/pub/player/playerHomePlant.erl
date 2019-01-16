%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家家园系统_种植区
%%% @end
%%% Created : 20170825
%%%-------------------------------------------------------------------
-module(playerHomePlant).
-author(meitianyang).

-include("gsInc.hrl").
-include("playerPrivate.hrl").
%%
%%%% MSG
%%-export([
%%	msg/1
%%]).
%%
%%%% API
%%-export([
%%	sendHomePlantInfo/3,	%% 初始化种植区信息
%%	plant2NetMsg/1,			%% 种植区：作物内存数据转换为网络消息
%%	plantTodayAndLast/1,	%% 种植区：计算当日次数与最后时间
%%	plantSuccess/1,			%% 种植区：操作成功反馈
%%	plant/4,                 %%种植 浇水，收割，清除，=== 操作
%%	isCanPickVegetables/1   %%查看是否有菜可以摘
%%]).
%%
%%%% tick
%%-export([
%%	tick/0					%% 处于种植区时，定时检查是否有需要同步的作物，重新执行sendHomePlantInfo/2
%%]).
%%
%%%% gm
%%-export([
%%	gmUpdatePlant/1,		%% GM修改指定作物状态
%%	gmQueryPlant/1,			%% GM查询指定作物状态
%%	gmTimePlant/2,			%% GM修改指定作物种植时间
%%	gmUpdateAll/1           %% GM修改所有作物
%%]).
%%
%%
%%%%策划说的三分钟 同步一次！~~~
%%-define(Time_Refresh, 180).%%刷新时间
%%
%%%%%-------------------------------------------------------------------
%%% 协议
%%msg(#pk_U2GS_HomePlantOperate_Request{homeID = HomeID, areaType = AreaType, itemUid = Pos, operateType = OpType, itemID = ItemID}) ->
%%	RoleID = playerState:getRoleID(),
%%	plant(OpType, RoleID, {HomeID, AreaType, Pos}, ItemID),
%%	ok;
%%msg(Msg) ->
%%	?ERROR("receive error msg:~p,~p", [playerState:getRoleID(), Msg]),
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
%%	ok.
%%
%%%%%-------------------------------------------------------------------
%%% 种植区操作_角色操作接口
%%-spec plant(OpType, RoleID, GlobalPos, ItemID) -> no_return() when
%%	OpType :: ?HomePlant_BEGIN .. ?HomePlant_END,
%%	RoleID :: uint64(),
%%	GlobalPos :: {HomeID, AreaType, Pos},
%%	HomeID :: uint64(),
%%	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
%%	Pos :: 1 .. ?HomePlantPosMax,
%%	ItemID :: uint16().
%%plant(OpType, _RoleID, _GlobalPos, _ItemID) when					%% 错误的操作类型
%%	OpType < ?HomePlant_BEGIN; OpType > ?HomePlant_END ->
%%	?DEBUG("[DebugForHomePlant] plantOperate Invalid OpType:~w", [OpType]),
%%	skip;
%%plant(_OpType, _RoleID, {_HomeID, AreaType, _Pos}, _ItemID) when	%% 错误的区域类型
%%	AreaType =/= ?Home_Plantation_A ->
%%	?DEBUG("[DebugForHomePlant] plantOperate Invalid AreaType:~w", [AreaType]),
%%	skip;
%%plant(OpType, RoleID, {HomeID, AreaType, Uid} = GlobalPos, ItemID) ->
%%	% 确认目标区域开放
%%	ListArea = homeInterface:queryHomeArea(HomeID),
%%	?DEBUG("[DebugForHomePlant] GlobalPos:~w ListArea:~w", [GlobalPos, ListArea]),
%%	case lists:keyfind(AreaType, #rec_home_area.areaID, ListArea) of
%%		false ->
%%			?ERROR_CODE(?ErrorCode_HomePlant_NotOpen);
%%		_ ->
%%			case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%				[#rec_home_area{areaData = StrDataOld}] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						[] ->
%%							skip;
%%						_->
%%							case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								false ->
%%									skip;
%%								#recHomeFurniTrue{betweenExampleData = BetweenExampleData}  ->
%%										case lists:keyfind(Uid,#recHomeLayoutInfo.uid,BetweenExampleData) of
%%											#recHomeLayoutInfo{type = ?Home_Plantation_A} ->
%%												%% 执行操作
%%												playerSevenDayAim:updateCondition(?SevenDayAim_LSTypePlant, []),
%%												homePlantLogic:plant({true, OpType, RoleID, GlobalPos, ItemID, []});
%%											_->
%%												?ERROR_CODE(?ErrorCode_HomePlant_TarNull)
%%										end
%%							end
%%					end;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%			end
%%	end.
%%
%%
%%isCanPickVegetables(HomeID)->
%%
%%	MS = ets:fun2ms(
%%		fun(#recHomePlant{key = {HomeID_, _AreaID, _Pos},isRipe = IsRipe} = Plant) when
%%			HomeID =:= HomeID_ andalso  IsRipe =:= true->
%%			Plant
%%		end
%%	),
%%
%%	case ets:select(?EtsHomePlant, MS) of
%%		  []->
%%		     false;
%%		  _->
%%			  true
%%	end.
%%
%%
%%
%%
%%%%%-------------------------------------------------------------------
%%% 初始化种植区信息
%%-spec sendHomePlantInfo(HomeID::uint64(), Flag::uint(), WillSendMsg::boolean()) -> no_return().
%%sendHomePlantInfo(HomeID, ?Home_House, WillSendMsg) ->
%%	MS = ets:fun2ms(
%%		fun(#recHomePlant{key = {HomeID_, _AreaID, _Pos}} = Plant) when
%%			HomeID =:= HomeID_ ->
%%			Plant
%%		end
%%	),
%%	ListPlant = sendHomePlantInfo_listPlantRefresh(ets:select(?EtsHomePlant, MS), []),
%%	case WillSendMsg of
%%		true ->
%%			ListPlantForNetMsg = [plant2NetMsg(Plant) || Plant <- ListPlant],
%%			playerMsg:sendNetMsg(#pk_GS2U_HomePlant_Sync{listPlant = ListPlantForNetMsg});
%%		_ ->
%%			skip
%%	end,
%%
%%	TimeNow = misc_time:localtime_seconds(),
%%	%%TimeRefresh = sendHomePlantInfo_nexTime(ListPlant, TimeNow + 3600, TimeNow),	%% 最迟1小时刷新
%%	playerState2:setHomePlantRefreshTime(TimeNow+?Time_Refresh);
%%sendHomePlantInfo(_HomeID, _Flag, _WillSendMsg) ->
%%	skip.
%%
%%% 逻辑刷新作物属性
%%sendHomePlantInfo_listPlantRefresh([], Acc) ->
%%	Acc;
%%sendHomePlantInfo_listPlantRefresh([Plant | T], Acc) ->
%%	{_, PlantNew} = homePlantLogic:plantTryRefresh(Plant),
%%	sendHomePlantInfo_listPlantRefresh(T, [PlantNew | Acc]).
%%
%%%%% 计算下次需要刷新的最小时间（入场和种植时需要重新计算）
%%%%sendHomePlantInfo_nexTime([], Min, _TimeNow) ->
%%%%	Min;
%%%%sendHomePlantInfo_nexTime([#recHomePlant{id = PlantID, time = TimePlant, isRipe = IsRipe, pestis = {_, _, TimePestis}} | T], Min, TimeNow) ->
%%%%	#home_plantsCfg{growtime = [T1, T2, T3]} = getCfg:getCfgPStack(cfg_home_plants, PlantID),
%%%%	TimeAdd = homePlantLogic:plantIsWithered([T1, T2, T3]),
%%%%	Min1 =  erlang:min(TimePlant + TimeAdd * 60, Min),
%%%%	Min2 =
%%%%		case IsRipe of
%%%%			false when TimePestis > TimeNow ->
%%%%				erlang:min(TimePestis, Min1);
%%%%			false ->
%%%%				erlang:min(TimePestis + 3600, Min1);
%%%%			_ ->
%%%%				Min1
%%%%		end,
%%%%	sendHomePlantInfo_nexTime(T, Min2, TimeNow).
%%
%%%%%-------------------------------------------------------------------
%%% 作物内存数据转换为网络消息
%%-spec plant2NetMsg(PlantMemory) -> PlantNetMsg when
%%	PlantMemory :: #recHomePlant{} | {uint64(), uint8(), uint8()},
%%	PlantNetMsg::#pk_Plant{}.
%%plant2NetMsg(#recHomePlant{
%%	key = {HomeID, AreaID, Pos},
%%	id = ID,
%%	time = Time,
%%	health = Health,
%%	watering = ListWatering,
%%	compost = ListCompost,
%%	pestis = {IsPestis, _PestisCount, _NextPestis}
%%}) ->
%%	{CountWatering, LastWatering} = plantTodayAndLast(ListWatering),
%%	{CountCompost, LastCompost} = plantTodayAndLast(ListCompost),
%%	#pk_Plant{
%%		homeID = HomeID,
%%		areaType = AreaID,
%%		itemUid  = Pos,
%%		id = ID,
%%		time = Time,
%%		health = Health,
%%		wateringCount = CountWatering,
%%		wateringTime = LastWatering,
%%		compostCount = CountCompost,
%%		compostTime = LastCompost,
%%		isPestis = IsPestis
%%	};
%%plant2NetMsg({HomeID, AreaID, Pos}) ->	%% 此处表示目标位置没有作物，用作错误反馈
%%	#pk_Plant{
%%		homeID = HomeID,
%%		areaType = AreaID,
%%		itemUid  = Pos,
%%		id = 0,
%%		time = 0,
%%		health = 0,
%%		wateringCount = 0,
%%		wateringTime = 0,
%%		compostCount = 0,
%%		compostTime = 0,
%%		isPestis = false
%%	}.
%%
%%%%%-------------------------------------------------------------------
%%% 计算当日次数与最后时间
%%-spec plantTodayAndLast(ListTime::[uint32(), ...]) -> {CountToday::uint8(), TimeLast::uint32()}.
%%plantTodayAndLast(ListTime) ->
%%	plantTodayAndLast(ListTime, {0, 0}).
%%-spec plantTodayAndLast(ListTime::[uint32(), ...], Acc::{uint8(), uint32()}) -> {CountToday::uint8(), TimeLast::uint32()}.
%%plantTodayAndLast([], Acc) ->
%%	Acc;
%%plantTodayAndLast([H | T], {CountToday, TimeLast}) ->
%%	case core:timeIsOnDay(H + ?SECS_FROM_0_TO_1970) of
%%		true ->
%%			TimeLastNew = erlang:max(H, TimeLast),
%%			plantTodayAndLast(T, {CountToday + 1, TimeLastNew});
%%		_ ->
%%			plantTodayAndLast(T, {CountToday, TimeLast})
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% 操作成功反馈，目前只有收获
%%-spec plantSuccess({MasterRoleID, RoleID, HomeRole, OpType, Plant, GlobalPos, PlantID, Health}) -> no_return() when
%%	MasterRoleID :: uint64(),
%%	RoleID :: uint64(),
%%	HomeRole :: ?HomeRole_BEGIN .. ?HomeRole_END,
%%	OpType :: ?HomePlant_BEGIN .. ?HomePlant_END,
%%	Plant :: #recHomePlant{} | false,
%%	GlobalPos :: {HomeID, AreaType, Pos},
%%	HomeID :: uint64(),
%%	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
%%	Pos :: 1 .. ?HomePlantPosMax,
%%	PlantID :: uint16(),	%% PlantID和Plant无关，收获时Plant必然为false，此处给出PlantID便于收获资源
%%	Health :: uint8().		%% Health和Plant无关，收获时Plant必然为false，此处给出Health便于收获资源
%%plantSuccess({MasterRoleID, RoleID, HomeRole, ?HomePlant_Harvest, _Plant, {HomeID, AreaType, _} = GlobalPos, PlantID, Health}) ->
%%	case getCfg:getCfgPStack(cfg_home_plants, PlantID) of
%%		#home_plantsCfg{result = RewardNormal, bonus = RewardLuck, name = PlantName} ->
%%			%% 操作者是访客，则需要限制偷窃次数
%%			IsReward =
%%				case HomeRole of
%%					?HomeRole_Guest ->
%%						#globalsetupCfg{setpara = [Limit]} =
%%							getCfg:getCfgPStack(cfg_globalsetup, plant_helptimes),
%%						case playerDaily:getDailyCounter(?DailyType_EveryDay_helpbonus, 1) < Limit of
%%							true ->
%%								playerDaily:incDailyCounter(?DailyType_EveryDay_helpbonus, 1),
%%								playerAchieve:achieveEvent(?Achieve_GetPlant, [1]),
%%								true;
%%							_ ->
%%								false
%%						end;
%%					_ ->
%%						true
%%				end,
%%			%% 获取奖励内容
%%			ListReward = plantSuccess_parseReward(RewardNormal ++ RewardLuck, RoleID, PlantID, misc:rand(1, 100), []),
%%			%% 执行奖励发放
%%			#globalsetupCfg{setpara = [Percent]} =
%%				getCfg:getCfgPStack(cfg_globalsetup, plant_helpbonus),
%%			{CountHelp, ListMailItem} = plantSuccess_reward(
%%				ListReward,
%%				PlantID,
%%				?PLogTS_Home,
%%				?ItemSourceHomePlantHarvest,
%%				Health,
%%				MasterRoleID,
%%				RoleID,
%%				HomeRole,
%%				GlobalPos,
%%				IsReward,
%%				misc:clamp(Percent, 0, 100) / 100.0,
%%				{0, []}
%%			),
%%			case HomeRole of
%%				?HomeRole_Guest ->
%%					homePlantLogic:visitLog(HomeRole, HomeID, ?HomeOpType_Harvest, PlantID, erlang:length(ListMailItem), PlantID, RoleID, AreaType),
%%					%%运营打点需求(关于偷菜的统计)
%%					LogHomeVisit = #rec_log_home_visit{
%%						homeID = HomeID,
%%						visitID = RoleID,	%% 访客ID
%%						opType = ?HomeOpType_Harvest,
%%						time = misc_time:utc_seconds()
%%					},
%%					dbLog:sendSaveLogHomeVisit(LogHomeVisit),
%%					HelpRoleName = playerNameUID:getPlayerNameByUID(RoleID),
%%					Title = stringCfg:getString(home_harvest_title2),
%%					Content = stringCfg:getString(home_harvest_mail2, [HelpRoleName, PlantName]),
%%					mail:sendSystemMail(MasterRoleID, Title, Content, ListMailItem, ""),
%%					case CountHelp of
%%						0 ->
%%							?ERROR_CODE(?ErrorCode_HomePlant_StealisZero);
%%						_ ->
%%							skip
%%					end;
%%				?HomeRole_Partner ->
%%					homePlantLogic:visitLog(HomeRole, HomeID, ?HomeOpType_Harvest, PlantID, erlang:length(ListMailItem), PlantID, RoleID, AreaType),
%%					%%运营打点需求(关于偷菜的统计)
%%					LogHomeVisit = #rec_log_home_visit{
%%						homeID = HomeID,
%%						visitID = RoleID,	%% 访客ID
%%						opType = ?HomeOpType_Harvest,
%%						time = misc_time:utc_seconds()
%%					},
%%					dbLog:sendSaveLogHomeVisit(LogHomeVisit),
%%					HelpRoleName = playerNameUID:getPlayerNameByUID(RoleID),
%%					Title = stringCfg:getString(home_harvest_title),
%%					Content = stringCfg:getString(home_harvest_mail, [HelpRoleName, PlantName]),
%%					mail:sendSystemMail(MasterRoleID, Title, Content, ListMailItem, "");
%%				_ ->
%%					skip
%%			end,
%%			ok;
%%		_ ->
%%			skip
%%	end.
%%
%%%% 解析奖励
%%-spec plantSuccess_parseReward(ListReward, RoleID, PlantID, Rand, Acc) -> Result when
%%	ListReward :: [Reward, ...],									%% 奖励配置格式
%%	Reward :: {ItemID, ItemCount} | {ItemID, ItemCount, Rate100},	%% 奖励配置格式
%%	ItemID :: uint16(),												%% 道具ID
%%	ItemCount :: uint(),											%% 道具数量
%%	Rate100 :: 0 .. 100,											%% 中奖几率
%%	RoleID :: uint64(),												%% 角色ID，用于异常日志记录
%%	PlantID :: uint16(),											%% 作物ID，用于异常日志记录
%%	Rand :: 1 .. 100,												%% 外部传入随机数
%%	Acc :: [{RewardItemID, RewardItemCount}, ...],					%% 累计奖励
%%	RewardItemID :: uint16(),										%% 累计奖励道具ID
%%	RewardItemCount :: uint(),										%% 累计奖励道具数量
%%	Result :: Acc.													%% 最终累计奖励作为结果
%%plantSuccess_parseReward([], _RoleID,_HelpRoleID, _Rand, Acc) ->
%%	Acc;
%%plantSuccess_parseReward([{ItemID, ItemCount} = H | T], RoleID, PlantID, Rand, Acc) when
%%	erlang:is_integer(ItemCount), ItemCount > 0 ->
%%	case getCfg:getCfgByKey(cfg_item, ItemID) of
%%		#itemCfg{} ->
%%			% 普通奖励直接命中
%%			plantSuccess_parseReward(T, RoleID, PlantID, Rand, [H | Acc]);
%%		_ ->
%%			% 道具异常，记录关联配置
%%			?ERROR(
%%				"plantSuccess_parseReward can not find ItemID:~w from cfg_item, RoleID:~w, PlantID:~w",
%%				[ItemID, RoleID, PlantID]
%%			),
%%			plantSuccess_parseReward(T, RoleID, PlantID, Rand, Acc)
%%	end;
%%plantSuccess_parseReward([{ItemID, ItemCount, Rate100} | T], RoleID, PlantID, Rand, Acc) when
%%	erlang:is_integer(ItemCount), ItemCount > 0 ->
%%	case getCfg:getCfgByKey(cfg_item, ItemID) of
%%		#itemCfg{} ->
%%			% 幸运奖励概率命中
%%			case Rand =< Rate100 of
%%				true ->
%%					plantSuccess_parseReward(T, RoleID, PlantID, Rand, [{ItemID, ItemCount} | Acc]);
%%				_ ->
%%					plantSuccess_parseReward(T, RoleID, PlantID, Rand, Acc)
%%			end;
%%		_ ->
%%			% 道具异常，记录关联配置
%%			?ERROR(
%%				"plantSuccess_parseReward can not find ItemID:~w from cfg_item, RoleID:~w, PlantID:~w",
%%				[ItemID, RoleID, PlantID]
%%			),
%%			plantSuccess_parseReward(T, RoleID, PlantID, Rand, Acc)
%%	end;
%%plantSuccess_parseReward([H | T], RoleID, PlantID, Rand, Acc) ->
%%	% 记录错误的配置结构
%%	?ERROR("plantSuccess_parseReward unknown reward:~w, RoleID:~w, PlantID:~w", [H, RoleID, PlantID]),
%%	plantSuccess_parseReward(T, RoleID, PlantID, Rand, Acc).
%%
%%%% 发奖
%%-spec plantSuccess_reward(ListReward, PlantID, PLogTS, Reason, Health, MasterRoleID, RoleID, HomeRole, GlobalPos, IsReward, Percent, Acc) -> AccNew when
%%	ListReward :: [{ItemID, ItemCount}, ...],
%%	ItemID :: uint16(),
%%	ItemCount :: uint(),
%%	PlantID :: uint16(),
%%	PLogTS :: uint(),
%%	Reason :: uint(),
%%	Health :: uint8(),
%%	MasterRoleID ::uint64(),
%%	RoleID :: uint64(),
%%	HomeRole :: ?HomeRole_BEGIN .. ?HomeRole_END,
%%	GlobalPos :: {HomeID, AreaType, Pos},
%%	HomeID :: uint64(),
%%	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
%%	Pos :: 1 .. ?HomePlantPosMax,
%%	IsReward :: boolean(),	%% 是否给操作者发放奖励
%%	Percent :: float(),		%% 偷窃百分比
%%	Acc :: {uint(), list()},
%%	AccNew :: {uint(), list()}.		%% 偷窃数量和给主人的道具
%%plantSuccess_reward([], _PlantID, _PLogTS, _Reason, _Health, _MasterRoleID, _RoleID, _HomeRole, _GlobalPos, _IsReward, _Percent, Acc) ->
%%	Acc;
%%plantSuccess_reward([{ItemID, ItemCount} | T], PlantID, PLogTS, Reason, Health, RoleID, RoleID, HomeRole, GlobalPos, IsReward, Percent, _Acc) ->
%%	%% 主人收自己的菜
%%	case misc:ceil(erlang:float(Health) / 100.0 * ItemCount) of
%%		ItemCountReal when ItemCountReal > 0 ->
%%			PLog = #recPLogTSItem{
%%				new = ItemCountReal,
%%				change = ItemCountReal,
%%				target = ?PLogTS_PlayerSelf,
%%				source = PLogTS,
%%				changReason = Reason,
%%				reasonParam = PlantID
%%			},
%%			playerPackage:addGoodsAndMail(ItemID, ItemCountReal, false, 0, PLog);
%%		_ ->
%%			skip
%%	end,
%%	plantSuccess_reward(T, PlantID, PLogTS, Reason, Health, RoleID, RoleID, HomeRole, GlobalPos, IsReward, Percent, {0, []});
%%plantSuccess_reward([{ItemID, ItemCount} | T], PlantID, PLogTS, Reason, Health, MasterRoleID, RoleID, HomeRole, {HomeID, AreaType, _Pos} = GlobalPos, IsReward, Percent, {CountHelp, ListMailItemOld}) ->
%%	%% 别人收了主人的菜
%%	AccNew =
%%		case misc:ceil(erlang:float(Health) / 100.0 * ItemCount) of
%%			ItemCountReal when ItemCountReal > 0 ->
%%				%% 操作者和主人各得到多少收成？
%%				{ItemCountA, ItemCountB} =
%%					case HomeRole of
%%						?HomeRole_Partner ->
%%							{0, ItemCountReal};
%%						_ ->
%%							ItemCountA_ = erlang:round(ItemCountReal * Percent),
%%							{ItemCountA_, ItemCountReal - ItemCountA_}
%%					end,
%%				%% 发放操作者的收成
%%				CountHelpNew_ =
%%					case ItemCountA  > 0 of
%%						true when IsReward =:= true ->
%%							PLog = #recPLogTSItem{
%%								new = ItemCountA,
%%								change = ItemCountA,
%%								target = ?PLogTS_PlayerSelf,
%%								source = PLogTS,
%%								changReason = Reason,
%%								reasonParam = PlantID
%%							},
%%							playerPackage:addGoodsAndMail(ItemID, ItemCountA, false, 0, PLog),
%%							homePlantLogic:visitLog(HomeRole, HomeID, ?HomeOpType_Harvest, ItemID, ItemCountA, PlantID, RoleID, AreaType),
%%							ItemCountA;
%%						_ ->
%%							0
%%					end,
%%				%% 发放主人的收成
%%				case ItemCountB > 0 of
%%					true ->
%%						{CountHelp + CountHelpNew_, playerMail:createMailGoods(ItemID, ItemCountB, true,0, MasterRoleID, ?ItemSourceHomePlantHarvest) ++ ListMailItemOld};
%%					_ ->
%%						{CountHelp + CountHelpNew_, ListMailItemOld}
%%				end;
%%			_ ->
%%				{CountHelp, ListMailItemOld}
%%		end,
%%	plantSuccess_reward(T, PlantID, PLogTS, Reason, Health, RoleID, RoleID, HomeRole, GlobalPos, IsReward, Percent, AccNew).
%%
%%%%%-------------------------------------------------------------------
%%% tick
%%-spec tick() -> no_return().
%%tick() ->
%%	case core:isCross() of
%%		  false ->
%%
%%			  TimeNow  = misc_time:localtime_seconds(),
%%			  case playerState2:getHomePlantRefreshTime() of
%%				  0 ->
%%					  playerState2:setHomePlantRefreshTime(TimeNow);
%%				  TimeRefresh when TimeNow >= TimeRefresh ->
%%
%%					  RoleID = playerState:getRoleID(),
%%					  MapID = playerState:getMapID(),
%%					  case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
%%						  #mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeHome} ->
%%							  case homeInterface:queryHomeMap(MapID, playerState:getMapPid()) of
%%								  %%当在家园地图的时候，刷新当前家园的 种植信息过去
%%								  #rec_home_map{homeID = {HomeID, _Flag}} ->
%%									  sendHomePlantInfo(HomeID, ?Home_House, true);
%%								  _->
%%									  %%当不在家园地图的时候，刷新自己家园的信息过去
%%									  case homeInterface:queryHome(RoleID) of
%%										  #rec_home{homeID = HomeID} ->
%%											  sendHomePlantInfo(HomeID, ?Home_House, true);
%%										  _->
%%											  skip
%%									  end
%%								end;
%%							  _->
%%								  %%当不在家园地图的时候，刷新自己家园的信息过去
%%								  case homeInterface:queryHome(RoleID) of
%%									  #rec_home{homeID = HomeID} ->
%%										  sendHomePlantInfo(HomeID, ?Home_House, true);
%%									  _->
%%										  skip
%%								  end
%%						end;
%%				  _T ->
%%					  skip
%%			  end;
%%		   _->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% GM修改指定作物状态
%%-spec gmUpdatePlant({GlobalPos, State, IsPestis, Health}) -> ok | none when
%%	GlobalPos :: {HomeID, AreaID, Pos},
%%	HomeID :: uint64(),
%%	AreaID :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
%%	Pos :: 1 .. ?HomePlantPosMax,
%%	State :: 1 .. 4,	%% 幼苗 发育 成熟 枯萎
%%	IsPestis :: bool01(),
%%	Health :: 0 .. 100.
%%gmUpdatePlant({GlobalPos, State, IsPestis, Health}) ->
%%	case ets:lookup(?EtsHomePlant, GlobalPos) of
%%		[#recHomePlant{id = PlantID, pestis = Pestis} = Plant0] ->
%%			?DEBUG("[DebugForPlant2]"),
%%			Cfg = getCfg:getCfgPStack(cfg_home_plants, PlantID),
%%			TimePlant = gmUpdatePlant_State(State, Cfg),
%%			PestisNew = gmUpdatePlant_IsPestis(IsPestis, Pestis),
%%			Plant1 = Plant0#recHomePlant{
%%				health = Health,
%%				time = TimePlant,
%%				pestis = PestisNew
%%			},
%%			{_, Plant2} = homePlantLogic:plantTryRefresh(Plant1),
%%			ets:insert(?EtsHomePlant, Plant2),	%% 仅作调试用GM指令，不然不准在角色进程写数据
%%			%% 通知地图上所有人
%%			Msg =
%%				#pk_GS2U_HomePlantOperate_Ack{
%%					roleID = playerState:getRoleID(),
%%					operateType = ?HomePlant_Plant,		%% 假装是在种植
%%					reason = 0,
%%					plant = plant2NetMsg(Plant2)
%%				},
%%			EtsPlayer = playerState:getMapPlayerEts(),
%%			ets:foldl(fun(#recMapObject{netPid = NetPid}, _) -> playerMsg:sendNetMsg(NetPid, Msg) end, 0, EtsPlayer),
%%			ok;
%%		_ ->
%%			?DEBUG("[DebugForPlant2] invalid Pos:~w", [GlobalPos]),
%%			none
%%	end.
%%
%%gmUpdateAll({State,IsPestis,Health})->
%%	F =
%%		fun(#recHomePlant{id = PlantID, pestis = Pestis} = Plant0, _Acc) ->
%%			Cfg = getCfg:getCfgPStack(cfg_home_plants, PlantID),
%%			TimePlant = gmUpdatePlant_State(State, Cfg),
%%			PestisNew = gmUpdatePlant_IsPestis(IsPestis, Pestis),
%%			Plant1 = Plant0#recHomePlant{
%%				health = Health,
%%				time = TimePlant,
%%				pestis = PestisNew
%%			},
%%			{_, Plant2} = homePlantLogic:plantTryRefresh(Plant1),
%%			ets:insert(?EtsHomePlant, Plant2)	%% 仅作调试用GM指令，不然不准在角色进程写数据
%%		end,
%%	lists:foldl(F, 0, ets:tab2list(?EtsHomePlant)),
%%	ok;
%%gmUpdateAll(_)->
%%	ok.
%%
%%
%%
%%gmUpdatePlant_State(1, _Cfg) ->
%%	misc_time:localtime_seconds();
%%gmUpdatePlant_State(2, #home_plantsCfg{growtime = [T1, _T2, _T3]}) ->
%%	misc_time:localtime_seconds() - T1 * 60;
%%gmUpdatePlant_State(3, #home_plantsCfg{growtime = [T1, T2, _T3]}) ->
%%	misc_time:localtime_seconds() - (T1 + T2) * 60;
%%gmUpdatePlant_State(4, #home_plantsCfg{growtime = [T1, T2, T3]}) when T3 =/= -1 ->
%%	misc_time:localtime_seconds() - (T1 + T2 + T3) * 60.
%%
%%gmUpdatePlant_IsPestis(1, {false, Count, _}) ->
%%	{true, Count + 1, misc_time:localtime_seconds()};
%%gmUpdatePlant_IsPestis(1, {true, _, _} = Pestis) ->
%%	Pestis;
%%gmUpdatePlant_IsPestis(0, {false, _, _} = Pestis) ->
%%	Pestis;
%%gmUpdatePlant_IsPestis(0, {true, Count, _}) ->
%%	{false, Count, 0}.
%%
%%%%%-------------------------------------------------------------------
%%% GM查询指定作物状态
%%-spec gmQueryPlant(GlobalPos) -> none | #recHomePlant{} when
%%	GlobalPos :: {HomeID, AreaID, Pos},
%%	HomeID :: uint64(),
%%	AreaID :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
%%	Pos :: 1 .. ?HomePlantPosMax.
%%gmQueryPlant(GlobalPos) ->
%%	case ets:lookup(?EtsHomePlant, GlobalPos) of
%%		[#recHomePlant{} = Plant] ->
%%			{_, PlantNew} = homePlantLogic:plantTryRefresh(Plant),
%%			ets:insert(?EtsHomePlant, PlantNew),		%% 仅作调试用GM指令，不然不准在角色进程写数据
%%			%% 通知地图上所有人
%%			Msg =
%%				#pk_GS2U_HomePlantOperate_Ack{
%%					roleID = playerState:getRoleID(),
%%					operateType = ?HomePlant_Plant,		%% 假装是在种植
%%					reason = 0,
%%					plant = plant2NetMsg(PlantNew)
%%				},
%%			EtsPlayer = playerState:getMapPlayerEts(),
%%			ets:foldl(fun(#recMapObject{netPid = NetPid}, _) -> playerMsg:sendNetMsg(NetPid, Msg) end, 0, EtsPlayer),
%%			PlantNew;
%%		_ ->
%%			none
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% GM修改指定作物的种植时间
%%-spec gmTimePlant(GlobalPos, Min) -> none | #recHomePlant{} when
%%	GlobalPos :: {HomeID, AreaID, Pos},
%%	HomeID :: uint64(),
%%	AreaID :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
%%	Pos :: 1 .. ?HomePlantPosMax,
%%	Min :: int().
%%gmTimePlant(GlobalPos, Min) ->
%%	case ets:lookup(?EtsHomePlant, GlobalPos) of
%%		[#recHomePlant{key = Key, time = TimePlant, pestis = {IsPestis, Count, TimePestis}}] ->
%%			PestisNew = {IsPestis, Count, erlang:max(TimePestis + Min * 60, 0)},
%%			Update = [{#recHomePlant.time, TimePlant + Min * 60}, {#recHomePlant.pestis, PestisNew}],
%%			ets:update_element(?EtsHomePlant, Key, Update),
%%			gmQueryPlant(GlobalPos);
%%		_ ->
%%			none
%%	end.
