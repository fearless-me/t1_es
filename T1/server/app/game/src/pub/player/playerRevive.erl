%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 复活模块
%%% @end
%%% Created : 20. 七月 2015 16:38
%%%-------------------------------------------------------------------
-module(playerRevive).
-author("tiancheng").

-include("playerPrivate.hrl").

-define(ReviveProtectTime, 5).   %% 复活保护时间s，超过这个时间，玩家没有复活，则自动复活

-define(Revive_Normal, 1).          %% 普通复活
-define(Revive_Cost, 2).            %% 收费复活
-define(Revive_Unconditional, 3).   %% 无条件复活
-define(Revive_BattleLearn, 4).     %% 切磋复活
%% 多项复活类型，则相加。
-define(ReviveType_None, 0).		%% 0：死亡后不弹复活界面，实际为营地复活
-define(ReviveType_Home, 1).		%% 1：营地复活
-define(ReviveType_Auto, 2).		%% 2：自动复活倒计时
-define(ReviveType_Pos,  4).		%% 4：原地复活
-define(ReviveType_HomeAuto,  3).	%% 3：1+2
-define(ReviveType_HomePos,  5).	%% 5：1+4
-define(ReviveType_AutoPos,  6).	%% 6：2+4
-define(ReviveType_HomeAutoPos,  7).%% 7：1+2+4
-define(ReviveTypeRange, [
	?ReviveType_None,
	?ReviveType_Home,
	?ReviveType_Auto,
	?ReviveType_Pos,
	?ReviveType_HomeAuto,
	?ReviveType_HomePos,
	?ReviveType_AutoPos,
	?ReviveType_HomeAutoPos
]).

%% API
-export([
	onDead/4,
	onDead_New/4,
	revive/1,
	requestRevive_Normal/0,
	requestRevive_Cost/0,
	requestRevive_New/1,
	requestRevive_Cost_New/0,
	requestRevive_Normal_New/0,
	requestRevive_Unconditional/0,
	requestRevive_BattleLearn/0,

	checkPlayerIsRevive/0,
	noticeTeam/3,

	requestRevive_Cost_Count/1,
	playerDeadNotice/1,
	requestRevive_Normal_Count/1,
	requestRevive_Count/1,

	getReviveNum1/1
]).

%%%% 客户端请求复活
%%revive(?Revive_Normal) ->
%%	%% 立即营地复活，不需要判断时间
%%	requestRevive(?Revive_Normal);
revive(?Revive_Normal) ->
	playerState2:autoRevive(false),
	%% 立即营地复活，不需要判断时间
	#mapsettingCfg{fuhuotype = FuhuoType} = getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()),
	case FuhuoType of
		1 ->
			requestRevive_New(?Revive_Normal);
		_ ->
			requestRevive(?Revive_Normal)
	end;

%%revive(?Revive_Cost) ->
%%	%% 收费复活
%%	requestRevive_Cost();
revive(?Revive_Cost) ->
	playerState2:autoRevive(false),
	%% 收费复活
	#mapsettingCfg{fuhuotype = FuhuoType} = getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()),
	case FuhuoType of
		1 ->
			requestRevive_Cost_New();
		_ ->
			requestRevive_Cost()
	end;

%%revive(?Revive_Unconditional) ->
%%	%% 自动复活时间到的复活，需要判断CD时间
%%	requestRevive_Normal();
revive(?Revive_Unconditional) ->
	playerState2:autoRevive(false),
	%% 自动复活时间到的复活，需要判断CD时间
	#mapsettingCfg{fuhuotype = FuhuoType} = getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()),
	case FuhuoType of
		1 ->
			requestRevive_Normal_New();
		_ ->
			requestRevive_Normal()
	end;

revive(Type) ->
	playerState2:autoRevive(false),
	?ERROR("requestRevive:~p,~p", [playerState:getRoleID(), Type]),
	ok.

%% 请求普通营地复活
-spec requestRevive_Normal() -> ok.
requestRevive_Normal() ->
	playerState2:autoRevive(false),
	?DEBUG("requestRevive_Normal:~p,~ts",[playerState:getRoleID(), playerState:getName()]),
	NowTime = time:getSyncTime1970FromDBS(),
	LastTime = playerPropSync:getProp(?SerProp_PlayerDTime),
	ReviveTime = playerPropSync:getProp(?SerProp_PlayerRTime),
	case NowTime - LastTime >= ReviveTime of
		true ->
			%% 允许复活
			requestRevive(?Revive_Normal);
		_ ->
			?ERROR("requestRevive_Normal roleID=~p, roleName=~ts, nowdiff=~p, cd=~p",
				[playerState:getRoleID(),playerState:getName(), NowTime - LastTime, ReviveTime])
	end,
	ok.

%% 新的请求普通营地复活 次数限制
-spec requestRevive_Normal_New() -> ok.
requestRevive_Normal_New() ->
	playerState2:autoRevive(false),
	?DEBUG("requestRevive_Normal:~p,~ts",[playerState:getRoleID(), playerState:getName()]),
	NowTime = time:getSyncTime1970FromDBS(),
	LastTime = playerPropSync:getProp(?SerProp_PlayerDTime),
	ReviveTime = playerPropSync:getProp(?SerProp_PlayerRTime),
	case NowTime - LastTime >= ReviveTime of
		true ->
			%% 时间允许的情况下向地图进程询问次数
			MapPid = playerState:getMapPid(),
			RoleID = playerState:getRoleID(),
			psMgr:sendMsg2PS(MapPid, getPlayerReviveNum_Normal, RoleID);
		_ ->
			?ERROR("requestRevive_Normal roleID=~p, roleName=~ts, nowdiff=~p, cd=~p",
				[playerState:getRoleID(),playerState:getName(), NowTime - LastTime, ReviveTime])
	end,
	ok.

-spec requestRevive_Normal_Count(Num::integer()) -> ok.
requestRevive_Normal_Count(Num) ->
	MapID =  playerState:getMapID(),
	#mapsettingCfg{resurrection_times = ReviveTimes} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	case Num < ReviveTimes orelse ReviveTimes =:= -1 of
		true ->
			%% 允许复活
			requestRevive(?Revive_Normal);
		_ ->
			case core:isSingleCopyMap(MapID) of
				true ->
					MapPid = playerState:getMapPid(),
					psMgr:sendMsg2PS(MapPid, laterTime);
				_ ->
					requestRevive_Cost_Count(ReviveTimes),
					?ERROR("~p more than resurrection ~p, not a single copy ~p", [Num, ReviveTimes, MapID])
			end
	end,
	ok.

%% 请求花钱原地复活
-spec requestRevive_Cost() -> ok.
requestRevive_Cost() ->
	playerState2:autoRevive(false),
	?DEBUG("requestRevive_Cost:~p,~ts",[playerState:getRoleID(), playerState:getName()]),
	{CPhase, _NPhase} = getCNPhase(),
	#globalsetupCfg{setpara = CostList} = getCfg:getCfgPStack(cfg_globalsetup, relive_cost),
	Money = getListObj(CostList, CPhase),
	case playerMoney:canUseCoin(?CoinUseTypeDiamond, Money) of
		true ->
			case requestRevive(?Revive_Cost) of
				true ->
					%% 扣钱
					PLog = #recPLogTSMoney{reason = ?CoinUseRevive, param = CPhase, target = ?PLogTS_System, source = ?PLogTS_PlayerSelf},
					playerMoney:useMoneyInCross(playerState:getRoleID(), ?CoinUseTypeDiamond, Money, PLog),
					ok;
				_ ->
					skip
			end,
			addCostPhase(1, erlang:length(CostList));
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond)
	end,
	ok.

%% 新的复活方式 请求花钱的方式
-spec requestRevive_Cost_New() -> ok.
requestRevive_Cost_New() ->
	playerState2:autoRevive(false),
	?DEBUG("requestRevive_Cost_New:~p,~ts",[playerState:getRoleID(), playerState:getName()]),
%%	MapID =  playerState:getMapIDGroup(),
	MapPid = playerState:getMapPid(),
	RoleID = playerState:getRoleID(),
	psMgr:sendMsg2PS(MapPid, getPlayerReviveNum_Cost, RoleID), %% 请求获取当前复活的次数
	ok.

%% 处理接到已经复活次数之后的事情
-spec requestRevive_Cost_Count(Num::integer()) -> ok.
requestRevive_Cost_Count(Num) ->
	requestRevive_Cost_Count(Num, 3).

requestRevive_Cost_Count(Num, N) when N < 1 ->
	?ERROR("~p requestRevive_Cost_Count(~p,~p), map:~p, mapPid:~p",
		[playerState:getRoleID(), Num, N, playerState:getMapID(), playerState:getMapPid()]);
requestRevive_Cost_Count(Num, N) ->
	MapPid = playerState:getMapPid(),
	MapID =  playerState:getMapIDGroup(),
	RoleID = playerState:getRoleID(),

	#mapsettingCfg{resurrection_times = ReviveTimes} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	case Num < ReviveTimes orelse ReviveTimes =:= -1 of
		true ->
			#mapsettingCfg{fuhuo_costreward = CostTypeList, fuhuo_cost = CostCountList} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
			CostType = getListObj(CostTypeList, Num + 1),
			Money = getListObj(CostCountList, Num + 1),
			case playerMoney:canUseCoin(CostType, Money) of
				true ->
					case requestRevive(?Revive_Cost) of
						true ->
							%% 扣钱
							PLog = #recPLogTSMoney{reason = ?CoinUseRevive, param = Num, target = ?PLogTS_System, source = ?PLogTS_PlayerSelf},
							playerMoney:useMoneyInCross(RoleID, CostType, Money, PLog),
							psMgr:sendMsg2PS(MapPid, playerRevive, RoleID),
							ok;
						_ ->
							skip
					end;
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond)
			end;
		_ ->
			case core:isSingleCopyMap(MapID) of
				true ->
					MapPid = playerState:getMapPid(),
					psMgr:sendMsg2PS(MapPid, laterTime);
				_ ->
					?ERROR("~p more than resurrection ~p, not a single copy ~p", [Num, ReviveTimes, MapID]),
					requestRevive_Cost_Count(ReviveTimes, N - 1)
			end
	end,
	ok.

%% 无条件复活(营地复活)，服务器执行
-spec requestRevive_Unconditional() -> ok.
requestRevive_Unconditional() ->
	requestRevive(?Revive_Unconditional).

%% 切磋复活
-spec requestRevive_BattleLearn() -> ok.
requestRevive_BattleLearn() ->
	requestRevive(?Revive_BattleLearn).

%% 检查玩家是否需要强制复活
-spec checkPlayerIsRevive() -> ok.
checkPlayerIsRevive() ->
	case playerState:getCurHp() > 0 of
		false ->
			case playerState2:autoRevive() of
				true ->
					NowTime = time:getSyncTime1970FromDBS(),
					LastTime = playerPropSync:getProp(?SerProp_PlayerDTime),
					ReviveTime = playerPropSync:getProp(?SerProp_PlayerRTime),
					case NowTime - LastTime >= ReviveTime + ?ReviveProtectTime of
						true ->
							%% 复活
							MapID = playerState:getMapID(),
							case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
								#mapsettingCfg{fuhuotype = 1} ->
									?INFO("player[~p,~ts] dead, auto revive", [playerState:getRoleID(),playerState:getName()]),
									requestRevive_Normal_New();
								_ ->
									?INFO("player[~p,~ts] dead, auto revive", [playerState:getRoleID(),playerState:getName()]),
									requestRevive_Normal()
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

-spec requestRevive(Type::uint()) -> boolean().
requestRevive(Type) ->
	playerState2:autoRevive(false),
	RoleID = playerState:getRoleID(),
	RoleName = playerState:getName(),
	?INFO("player[~p,~ts,type=~p] requestRevive", [RoleID,RoleName,Type]),
	case playerState:getCurHp() =< 0 of
		true ->
			requestRevive2(Type),
			?INFO("player[~p,~ts,type=~p] dead,revive success",[RoleID,RoleName,Type]),

			%% 复活后的处理
			reviveCallBack(Type),
			true;
		_ ->
			%% 机器人会频繁触发到该逻辑，屏蔽此以减少对错误日志的混淆
			%%?ERROR("player[~p,~ts,type=~p] onRevive but hp > 0",[RoleID,RoleName,Type]),
			false
	end.

%% 新的营地复活（立即的那种，限次数的那种）
-spec requestRevive_New(Type::uint()) -> boolean().
requestRevive_New(Type) ->
	playerState2:autoRevive(false),
	RoleID = playerState:getRoleID(),
	RoleName = playerState:getName(),
	?INFO("player[~p,~ts,type=~p] requestRevive", [RoleID,RoleName,Type]),
	case playerState:getCurHp() =< 0 of
		true ->
			psMgr:sendMsg2PS(playerState:getMapPid(), getPlayerReviveNum_Local, {RoleID, Type});
		_ ->
			?ERROR("player[~p,~ts,type=~p] onRevive but hp > 0",[RoleID,RoleName,Type]),
			false
	end.

-spec requestRevive_Count({Num::integer(), Type::uint()}) -> boolean().
requestRevive_Count({Num, Type}) ->
	MapID =  playerState:getMapID(),
	RoleID = playerState:getRoleID(),
	RoleName = playerState:getName(),
	#mapsettingCfg{resurrection_times = ReviveTimes} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	case Num < ReviveTimes orelse ReviveTimes =:= -1 of
		true ->
			%% 允许复活
			requestRevive2(Type),
			?INFO("player[~p,~ts,type=~p] dead,revive success",[RoleID,RoleName,Type]),

			%% 复活后的处理
			reviveCallBack(Type),
			true;
		_ ->
			case core:isSingleCopyMap(MapID) of
				true ->
					MapPid = playerState:getMapPid(),
					psMgr:sendMsg2PS(MapPid, laterTime);
				_ ->
					requestRevive_Cost_Count(ReviveTimes),
					?ERROR("~p more than resurrection ~p, not a single copy ~p", [Num, ReviveTimes, MapID])
			end,
			false
	end,
	ok.

%% 复活处理函数
-spec requestRevive2(Type::uint()) -> boolean().
requestRevive2(?Revive_BattleLearn) ->
	%% 切磋复活
	MapID = playerState:getMapIDGroup(),
	requestRevive4(MapID),
	true;
requestRevive2(Type) ->
	%% 普通复活血量百分比
	#globalsetupCfg{setpara = [HPPer_Normal]} = getCfg:getCfgPStack(cfg_globalsetup, relive_hp),
	%% 收费复活血量百分比
	#globalsetupCfg{setpara = [HPPer_Cost]} = getCfg:getCfgPStack(cfg_globalsetup, relive_cost_hp),

	MapID = playerState:getMapIDGroup(),

	{Sx, Sy} = playerState:getPos(),

	{Normal_Tx, Normal_Ty} =
		case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
			#mapsettingCfg{type = ?MapTypeBitplane} ->
				%% 如果是位面，直接改为原地复活
				{Sx, Sy};
			_ ->
				case playerMap:getMapRevivePt(MapID) of
					{X, Y} ->
						{X, Y};
					_ ->
						?ERROR("player[~p,~ts,type=~p] Error MapID[~p],not cfg",
							[playerState:getRoleID(),playerState:getName(),Type,MapID]),
						{Sx, Sy}
				end
		end,

	case Type of
		?Revive_Unconditional ->
			%% 无条件复活，不执行其它操作
			requestRevive3(MapID, Normal_Tx, Normal_Ty, HPPer_Normal);
		?Revive_Cost ->
			%% 原地复活
			requestRevive3(MapID, Sx, Sy, HPPer_Cost);
		_ ->
			case playerGuildBattle:getRevivePos() of
				{X1, Y1} ->
					%% 军团战死亡
					requestRevive3(MapID, X1, Y1, HPPer_Normal);
				_ ->
					case playerDarkness:getRevivePos(MapID) of
						{X2, Y2} ->
							%% 深红溶渊死亡
							requestRevive3(MapID, X2, Y2, HPPer_Normal);
						_ ->
							%%家族精英联赛死亡
							case playerGuildWar:getRevivePos(MapID) of
								{TTX, TTY} ->
									requestRevive3(MapID, TTX, TTY, HPPer_Normal);
								_ ->
									case playerAlive:getRevivePos() of
										{X3, Y3} ->
											%% 大逃杀死亡
											requestRevive3(MapID, X3, Y3, HPPer_Normal);
										_ ->
											case playerAruna:getRevivePos(MapID) of
												{Xaruna, Yaruna} ->
													%% Aruna死亡
													requestRevive3(MapID, Xaruna, Yaruna, HPPer_Normal);
												_ ->
													%% 其它普通死亡
													requestRevive3(MapID, Normal_Tx, Normal_Ty, HPPer_Normal)
											end
									end
							end
					end
%%			%% 运镖
%%			Condition1 = playerEscort:escortReviveAndConsume(MapID),
%%			case Condition1 of
%%				{Tx, Ty} -> requestRevive3(MapID, Tx, Ty, HPPer_Normal);
%%				leaveEscortMap ->
%%					requestRevive3(MapID, Normal_Tx, Normal_Ty, HPPer_Normal),
%%					timer:sleep(800),
%%					playerCopyMap:leaveCopyMap();
%%				_ ->
%%					%% 巅峰对决
%%					Condition2 = playerGuildWar:getRevivePos(MapID),
%%					case Condition2 of
%%						{TTX, TTY} ->
%%							requestRevive3(MapID, TTX, TTY, HPPer_Normal);
%%						_ ->
%%							%% 黑暗之地
%%							Condition3 = playerDarkness:getRevivePos(MapID),
%%							case Condition3 of
%%								{TTTX, TTTY} ->
%%									requestRevive3(MapID, TTTX, TTTY, HPPer_Normal);
%%								_ ->
%%									requestRevive3(MapID, Normal_Tx, Normal_Ty, HPPer_Normal)
%%							end
%%					end
%%			end
			end
	end,
	true.

%% 其它统一复活
requestRevive3(MapID, X, Y, PercentValue) ->
	RX = erlang:float(X),
	RY = erlang:float(Y),
	?DEBUG("requestRevive3X:~w,Y:~w",[RX,RY]),
	%% 可能在军团战安全区复活
	case playerGuildBattle:getRevivePos() of
		{_X1, _Y1} ->
			playerSafe:playerChangePos(RX, RY);
		_ ->
			skip
	end,

	%% 百分比
	Percent = erlang:max(0, erlang:min(PercentValue / 100, 1)),

	MaxHp = playerState:getMaxHp(),
	CurHp = erlang:round(MaxHp * Percent),
	playerState:setRebornHp(CurHp),

	%% 设置位置，这里会通知周围人自己的变化，同时将周围的变化发给自己
	playerState:setPos(RX, RY),

	%% 清除当前能量值
	playerBase:setSpecBattlePropPower(0.0),

	%% 清除当前体力值
	playerState:setCurPhys(0),

	%% 复活增加PK保护
%% 	case playerScene:getMapType(MapID) of
%% 		?MapTypeActivity -> skip;
%% 		_ -> playerBuff:addSpecBuff(?PkBuff, playerState:getLevel())
%% 	end,
	playerBuff:addSpecBuff(?PkBuff, playerState:getLevel()),
	%% 宠物复活
	case playerPet:getPetBattle() of
		#recPetInfo{pet_status = Status} = Pet when Status =:= ?PetState_Battle_Show -> playerPet:callPet(Pet);
		_ -> skip
	end,

	SelfMsg = #pk_GS2U_PlayerRevive{
		mapId = MapID,
		x = RX,
		y = RY,
		curHp = CurHp,
		maxHp = MaxHp,
		curPower = 0,
		curPhys = 0
	},
	noticeOtherObject(MapID, RX, RY, erlang:trunc(Percent * 100), SelfMsg),

	%% 先复活，再离开位面(这里不判断是不是无条件复活，因为是离开位置，请不要在这里再加其它逻辑)
	case groupBase:isInGroup(playerState:getGroupID()) of
		true ->
			case  getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				%%家园位面死亡 不退出
				#mapsettingCfg{type = ?MapTypeBitplane, subtype = ?MapSubTypeHome}->
					skip;
				_->
					%% 这里只是离开位置，不是切换地图
					playerCopyMap:leaveCopyMap()
			end;
		_ ->
			skip
	end,
	ok.

%% 切磋自动复活
-spec requestRevive4(MapID::uint()) -> ok.
requestRevive4(MapID) ->
	HP = playerPropSync:getProp(?SerProp_BattleLearnHP),
	playerPropSync:setInt(?SerProp_BattleLearnHP, 0),

	playerState:setRebornHp(HP),
	{RX, RY} = playerState:getPos(),

	MaxHp = playerState:getMaxHp(),
	CurHp = playerState:getCurHp(),
	PC = skill:getPercent(CurHp, MaxHp),

	SelfMsg = #pk_GS2U_PlayerRevive{
		mapId = MapID,
		x = RX,
		y = RY,
		curHp = HP,
		maxHp = MaxHp,
		curPower = trunc(playerBase:getSpecBattlePropPower()),
		curPhys = playerState:getCurPhys()
	},
	noticeOtherObject(MapID, RX, RY, PC, SelfMsg),
	ok.

noticeOtherObject(MapID, RX, RY, PC, #pk_GS2U_PlayerRevive{} = PlayerRevive) ->
	%% 复活，通知复活点周围的玩家
	Msg = #pk_GS2U_BroadcastPlayerRevive{
		code = playerState:getPlayerCode(),
		mapId = MapID,
		x = RX,
		y = RY,
		hpPC = PC
	},
	playerMsg:sendMsgToNearPlayer(Msg, false),

	%% 通知自己的队友复活
	TeamMsg = #pk_GS2U_BroadcastTeamRevive{
		roleID = playerState:getRoleID(),
		mapId = MapID,
		x = RX,
		y = RY,
		hpPC = PC
	},
	noticeTeam(RX, RY, TeamMsg),

	%% 通知自己复活的血量
	playerMsg:sendNetMsg(PlayerRevive),
	ok.

%% 玩家死亡
-spec onDead(AttackerCode::uint64(), AttackRoleID::uint64(), AttackName::string(), IsBattleLearn::boolean()) -> ok.
onDead(AttackerCode, AttackRoleID, AttackName, IsBattleLearn) ->
	Code = playerState:getPlayerCode(),
	NowTime = time:getSyncTime1970FromDBS(),
	%% 上次死亡时间
%%	LastTime = playerPropSync:getProp(?SerProp_PlayerDTime),
	%% 设置本次死亡时间
	playerPropSync:setInt64(?SerProp_PlayerDTime, NowTime),

	MapID = playerState:getMapIDGroup(),
%%	MapID = playerState:getMapID(),

	%% 家族精英联赛特殊复活时间
	{GuildWarResult, GWTime} = playerGuildWar:playerDead(AttackRoleID),

	%% 跨服竞技场复活时间
	CosArena = playerCrosTeam:getCrosArenaReviveTime(),

	MapSubType = playerScene:getMapSubType(MapID),

	ReviveType = getReviveType(MapID),

	%% 普通复活需要时间与金钱
	{CPhase, NPhase} = getCNPhase(),
	{MoneyStruct, ReviveTime} =
		if
			GuildWarResult =:= true ->
				{#pk_MoneyInit{moneyType = 0, value = 0}, GWTime};
			IsBattleLearn =:= true ->
				{#pk_MoneyInit{moneyType = 0, value = 0}, 1};
			erlang:is_integer(CosArena) andalso CosArena > 0 ->
				{#pk_MoneyInit{moneyType = 0, value = 0}, CosArena};
			MapSubType =:= ?MapSubTypeExpCopyMap ->
				ExpCopyReviveTime =
					case getCfg:getCfgByArgs(cfg_globalsetup, expfuben_revivedtime) of
						#globalsetupCfg{setpara = [V]} -> V;
						_ -> 3
					end,
				{#pk_MoneyInit{moneyType = 0, value = 0}, ExpCopyReviveTime};
			true ->
				#globalsetupCfg{setpara = TimeList} = getCfg:getCfgPStack(cfg_globalsetup, relive_time),
				#globalsetupCfg{setpara = [_Cost|_] = CostList} = getCfg:getCfgPStack(cfg_globalsetup, relive_cost),
				%% 收费复活
				Money = getListObj(CostList, CPhase),

				%% 只要死亡，复活时间就累积
				RTime = getListObj(TimeList, NPhase),
				addNormalPhase(1, erlang:length(TimeList)),
				{#pk_MoneyInit{moneyType = ?CoinUseTypeDiamond, value = Money}, RTime}
		end,

	%% 设置允许复活的CD时间
	playerPropSync:setInt(?SerProp_PlayerRTime, ReviveTime),

	%% 死亡丢失金钱
	{_IsLost, LostMoney} = playerDarkness:playerDead(AttackerCode, AttackRoleID),




	%%暗夜侵袭僵尸状态死亡
	playerNightNvasion:playerDead(AttackRoleID),


    %%这里特殊处理下，暗夜侵袭僵尸状态死亡，客服端要求不弹死亡结算面板
	NewReviveType =
	case MapSubType of
		  ?MapSubTypeNvasion->
			    case playerState:getStatus() of
					?CreatureSpeStautsDeformation->0;
					_->
						ReviveType
				end;
			_->
				ReviveType
	end,

	%% 通知客户端死亡
	Msg = #pk_GS2U_PlayerDead{
		deadTime = NowTime,
		code = Code,
		normalReviveCDTime = ReviveTime,
		reviveCost = MoneyStruct,
		attackCode = AttackerCode,
		attackName = AttackName,
		lostMoney = LostMoney,
		reviveType = NewReviveType,
		reviveCount = CPhase
	},
	playerMsg:sendNetMsg(Msg),
	playerState2:autoRevive(misc:testBit(ReviveType, ?ReviveType_Auto) andalso misc:testBit(ReviveType, ?ReviveType_Home)),

	?INFO("player dead roleID=~p, roleName=~ts, reviveTime=~p, money=~p, reviveType=~p lostMoney=~p",
		[playerState:getRoleID(), playerState:getName(), ReviveTime, MoneyStruct, ReviveType, LostMoney]),
	ok.

%% 新的死亡
-spec onDead_New(AttackerCode::uint64(), AttackRoleID::uint64(), AttackName::string(), IsBattleLearn::boolean()) -> ok.
onDead_New(AttackerCode, AttackRoleID, AttackName, IsBattleLearn) ->
	MapPid = playerState:getMapPid(),
	RoleID = playerState:getRoleID(),
	psMgr:sendMsg2PS(MapPid, getPlayerReviveNum_Dead, {RoleID, AttackerCode, AttackRoleID, AttackName, IsBattleLearn}),

	ok.

-spec playerDeadNotice({Num::integer(), AttackerCode::uint64(), AttackRoleID::uint64(), AttackName::string(), IsBattleLearn::boolean()}) -> ok.
playerDeadNotice({Num, AttackerCode, AttackRoleID, AttackName, IsBattleLearn}) ->
	Code = playerState:getPlayerCode(),
	NowTime = time:getSyncTime1970FromDBS(),
	%% 上次死亡时间
%%	LastTime = playerPropSync:getProp(?SerProp_PlayerDTime),d
	%% 设置本次死亡时间
	playerPropSync:setInt64(?SerProp_PlayerDTime, NowTime),
	MapID = playerState:getMapIDGroup(),
	%% 家族精英联赛特殊复活时间
	{GuildWarResult, GWTime} = playerGuildWar:playerDead(AttackRoleID),

	%% 跨服竞技场复活时间
	CosArena = playerCrosTeam:getCrosArenaReviveTime(),

	MapSubType = playerScene:getMapSubType(MapID),

	ReviveType = getReviveType(MapID),

	{MoneyStruct, ReviveTime} =
		if
			GuildWarResult =:= true ->
				{#pk_MoneyInit{moneyType = 0, value = 0}, GWTime};
			IsBattleLearn =:= true ->
				{#pk_MoneyInit{moneyType = 0, value = 0}, 1};
			erlang:is_integer(CosArena) andalso CosArena > 0 ->
				{#pk_MoneyInit{moneyType = 0, value = 0}, CosArena};
			MapSubType =:= ?MapSubTypeExpCopyMap ->
				ExpCopyReviveTime =
					case getCfg:getCfgByArgs(cfg_globalsetup, expfuben_revivedtime) of
						#globalsetupCfg{setpara = [V]} -> V;
						_ -> 3
					end,
				{#pk_MoneyInit{moneyType = 0, value = 0}, ExpCopyReviveTime};
			true ->
				%% 普通复活需要时间与金钱
				#mapsettingCfg{fuhuo_CD = TimeList, fuhuo_cost = CostCountList, fuhuo_costreward = CostTypeList} = getCfg:getCfgPStack(cfg_mapsetting, MapID),

				%% 收费复活
				Money = getListObj(CostCountList, Num + 1),
				CostType = getListObj(CostTypeList, Num + 1),

				%% 只要死亡，复活时间就累积
				RTime = getListObj(TimeList, Num + 1),
%%				addNormalPhase(1, erlang:length(TimeList)),
				{#pk_MoneyInit{moneyType = CostType, value = Money}, RTime}
		end,

	%% 设置允许复活的CD时间
	playerPropSync:setInt(?SerProp_PlayerRTime, ReviveTime),

	%% 死亡丢失金钱
	{_IsLost, LostMoney} = playerDarkness:playerDead(AttackerCode, AttackRoleID),

	%% 通知客户端死亡
	Msg = #pk_GS2U_PlayerDead{
		deadTime = NowTime,
		code = Code,
		normalReviveCDTime = ReviveTime,
		reviveCost = MoneyStruct,
		attackCode = AttackerCode,
		attackName = AttackName,
		lostMoney = LostMoney,
		reviveType = ReviveType,
		reviveCount = Num
	},
	playerMsg:sendNetMsg(Msg),
	playerState2:autoRevive(misc:testBit(ReviveType, ?ReviveType_Auto) andalso misc:testBit(ReviveType, ?ReviveType_Home)),

	?INFO("player dead roleID=~p, roleName=~ts, reviveTime=~p, money=~p, reviveType=~p lostMoney=~p reviveCount=~p",
		[playerState:getRoleID(), playerState:getName(), ReviveTime, MoneyStruct, ReviveType, LostMoney, Num]),
	ok.


%%通知自己队友死亡或者复活
-spec noticeTeam(X::float(), Y::float(), Msg::tuple()) -> ok.
noticeTeam(X, Y, Msg) ->
	MapPid = playerState:getMapPid(),
	GroupID = playerState:getGroupID(),
	PlayerEts = playerState:getMapPlayerEts(),
	TeamList = gsTeamInterface:getTeamMemberPidListWithRoleID(playerState:getRoleID()),%%playerTeam2:getTeamAllMemberPidList(),
	NearPidList = mapView:getNearPlayerPid(X, Y, MapPid, GroupID, PlayerEts),
	noticeTeam(X, Y, Msg, TeamList, NearPidList).
noticeTeam(_X, _Y, _Msg, [], _) ->
	ok;
noticeTeam(X, Y, Msg, [Pid | TeamList], NearPidList) ->
	case lists:member(Pid, NearPidList) of
		false ->
			%%队伍玩家下线时，pid为0
			case is_pid(Pid) of
				true ->
					psMgr:sendMsg2PS(Pid, broadcast, Msg);
				_ ->
					skip
			end,
			noticeTeam(X, Y, Msg, TeamList, NearPidList);
		_ ->
			noticeTeam(X, Y, Msg, TeamList, NearPidList)
	end.

getCNPhase() ->
	RevivePhase = playerPropSync:getProp(?SerProp_PlayerRevivePhase),
	RevivePhase2 = RevivePhase band 16#FFFF,
	CPhase = RevivePhase2 bsr 8,     % 收费复活阶段
	NPhase = RevivePhase band 16#FF, % 普通复活阶段
	{erlang:max(CPhase, 1), erlang:max(NPhase, 1)}.

%% 添加收费复活阶段
addCostPhase(Number, Max) ->
	{CPhase, NPhase} = getCNPhase(),
	NewCPhase = erlang:min(erlang:max(CPhase + Number, 1), Max),
	case CPhase /= NewCPhase of
		true ->
			Value = (NewCPhase bsl 8) + NPhase,
			playerPropSync:setInt(?SerProp_PlayerRevivePhase, Value),
			NewCPhase;
		_ ->
			1
	end.

%% 添加普通复活阶段
addNormalPhase(Number, Max) ->
	{CPhase, NPhase} = getCNPhase(),
	NewNPhase = erlang:min(erlang:max(NPhase + Number, 1), Max),
	case NPhase /= NewNPhase of
		true ->
			Value = (CPhase bsl 8) + NewNPhase,
			playerPropSync:setInt(?SerProp_PlayerRevivePhase, Value),
			NewNPhase;
		_ ->
			1
	end.

getListObj([Obj|_] = List, Index) ->
	Len = erlang:length(List),
	if
		Index =< 0 -> Obj;
		Index > Len -> lists:last(List);
		true -> lists:nth(Index, List)
	end.

%% 复活后的回调
reviveCallBack(Type) ->
	case Type of
		?Revive_Unconditional ->
			%% 无条件复活，不传送地图
			skip;
		_ ->
			skip
	end,
	%%复活后同步一下队伍血量
	playerTeam:syncInfo2Team(true),
	%% 如果在大逃杀中复活则退出跨服
	case playerState:getMapID() of
		?CrossAliveMapID ->
			playerInterface:reqBackGS();
		_ ->
			skip
	end,

	checkMapTypeIsNvasion(Type),
	ok.

checkMapTypeIsNvasion(Type)->
		case Type of
			?Revive_Normal ->
				playerNightNvasion:checkMapTypeIsNvasion();
			_ ->
				skip
		end,
		ok.


getReviveType(MapID) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{fuhuo = Type} ->
			case lists:member(Type, ?ReviveTypeRange) of
				true -> Type;
				_ -> ?ReviveType_Home
			end;
		_ -> ?ReviveType_Home
	end.


-spec getReviveNum1(Num::uint()) -> integer().
getReviveNum1(Num) ->
	playerChat:onSystemChatMsg(erlang:integer_to_list(Num)).
