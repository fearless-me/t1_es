%% %%
%% %% @author chengxuesong
%% %% @doc @todo 勇者试炼.
%%
%%
-module(playerWarriorTrial).
-author(chengxuesong).

-include("playerPrivate.hrl").
%%存数据库时间
-define(SaveWarriorTrialTime, 30000).
-define(OneKeyGetReward, 0).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initWarriorTrial/0,
	sendWarriorTrialInfoToClient/0,
	beginWarriorTrial/0,
	beginSweepMission/0,
	completeSchedule/0,
	missionInit/1,
	tickMaxTime/0,
	playerBeKilled/1,
	quitQuitMap/0,
	playerCompleteAllMissions/1,
	cleanRankData/0,
	setWarriorTrialInfoAck/1,
	saveWarriorTrialInfoDB/0,
	%%checkAndRepairBraveTriedAchieve/0,
	firstKillReward/1,		%% 领取首杀奖励
	oneKeySweep/0			%% 一键扫荡
]).

%%初始化
initWarriorTrial() ->
	playerState:setWarriorTrialState(?WarriorTrialStateNotChalleng),
	playerState:setWarriorTrialTime(0),
	ok.

-spec setWarriorTrialInfoAck(#rec_warrior_trial{}) -> ok.
setWarriorTrialInfoAck(#rec_warrior_trial{} = WarriorTrialInfo) ->
	playerState:setWarriorTrialInfo(WarriorTrialInfo),
	ok.

sendWarriorTrialInfoToClient() ->
	MaxMission = getMissionNum(),
	CurMission = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule) + 1,
	#rec_warrior_trial{tswkTrialSchedule = MaxMissionIDOfWeek} = getWarriorTrialInfo(),
	NetMsg = #pk_GS2U_InitWarriorTrialAck{
		record = MaxMissionIDOfWeek,
		cur = CurMission,
		max = MaxMission,
		coin = 0,
		maxReward = playerPropSync:getProp(?SerProp_WarriorTrial_RewardID),
		curCount = publicDataMgrLogic:getWarriorTrial(CurMission)
	},
	%%?INFO("sendWarriorTrialInfoToClient = ~p", [NetMsg]),
	playerMsg:sendNetMsg(NetMsg),
	ok.

%%开始挑战关卡
beginWarriorTrial() ->
	Level = playerState:getLevel(),
	LimitedLevel = globalCfg:getGlobalCfg(warriortrial_open),
	case Level >= LimitedLevel of
		true ->
			MaxMission = getMissionNum(),
			CurMission = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule) + 1,
			PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
			PetForce = playerPropSync:getProp(?PriProp_PetForce),
			BuffIDList = [BuffID || #recBuff{buffID = BuffID} <- playerState:getBuffList()],
			?INFO("player:~p beginWarriorTrial MaxMission:~p CurMission:~p PlayerForce:~p PetForce:~p BuffIDList:~w",
				[playerState:getRoleID(),MaxMission,CurMission,PlayerForce,PetForce,BuffIDList]),
			case CurMission of
				1 ->
					playerLogAdd:addLogParticipatorInfo(?LogParticipator_WarriorTrialPlayerIn);
				_ ->skip
			end,
%%			case playerState:getTeamID() > 0 of
%%				true ->
%%					%%离开队伍
%%					playerTeam2:leaveTeam(?TeamTypeNormal);
%%				_ ->
%%					skip
%%			end,
			playerTeam:leaveTeam(false),
			case CurMission =< MaxMission of
				true ->
					#warriortrialCfg{mapid = MapID} = getCfg:getCfgPStack(cfg_warriortrial, CurMission),
					playerScene:onRequestEnterMap(MapID);
				_ ->
					%%已经到最大关卡了
					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialMaxMission)
			end;
		_ ->
			%% 等级不足
			playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialLevelLimited)
	end,

	ok.
-spec missionInit(Pid::pid()) -> ok.
%%进入关卡初始化
missionInit(Pid) ->
	playerState:setWarriorTrialState(?WarriorTrialStateIsChallenging),
	CurMission = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule) + 1,

	MaxMission = getMissionNum(),
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	PetForce = playerPropSync:getProp(?PriProp_PetForce),
	BuffIDList = [BuffID || #recBuff{buffID = BuffID} <- playerState:getBuffList()],
	?INFO("player:~p missionInit MaxMission:~p CurMission:~p PlayerForce:~p PetForce:~p BuffIDList:~w",
		[playerState:getRoleID(),MaxMission,CurMission,PlayerForce,PetForce,BuffIDList]),

	%%请求创建boss
	#warriortrialCfg{maxTime = MaxTime, attack = Attack} = getCfg:getCfgPStack(cfg_warriortrial, CurMission),
	PlayerAttack = playerPropSync:getProp(?PriProp_PlayerForce) + playerPropSync:getProp(?PriProp_PetForce),
	Per = PlayerAttack / Attack,
	psMgr:sendMsg2PS(Pid, createWarriorTrialBoss, {CurMission, getPowerEffectList(Per)}),

	%%给玩家加buff
	giveBuffToPlayer(),
	Time = misc_time:gregorian_seconds_from_1970( ),

	playerState:setWarriorTrialTime(Time),
	%%通知客户端
	playerMsg:sendNetMsg(#pk_GS2U_InitWarriorTrialMissionInfo{missionID = CurMission, time = MaxTime}),
	ok.

getPowerEffectList(Per) ->
	KeyList = getCfg:get1KeyList(cfg_warriortrial_battle_power),
	CfgList = [getCfg:getCfgByKey(cfg_warriortrial_battle_power, Key) || Key <- KeyList],
	CfgList2 = lists:keysort(#warriortrial_battle_powerCfg.playerLessCommand, CfgList),
	F =
		fun(#warriortrial_battle_powerCfg{playerLessCommand = Less}) ->
			Per < Less
		end,
	case lists:filter(F, CfgList2) of
		[#warriortrial_battle_powerCfg{warriortrial_battle_power_effect = Effects}|_] ->
			Effects;
		_ ->
			[]
	end.

%%完成一个副本
completeSchedule() ->
	%%今天刷本的进度+1
	playerDaily:incDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule),
	%%保存这次刷本的用时
	BeginTime = playerState:getWarriorTrialTime(),
	NowTime = misc_time:gregorian_seconds_from_1970( ),
	playerState:setWarriorTrialTime(0),
	MissionID = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule) ,%+1
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	PetForce = playerPropSync:getProp(?PriProp_PetForce),
	BuffIDList = [BuffID || #recBuff{buffID = BuffID} <- playerState:getBuffList()],
	?INFO("Player:~p complete warriortrial Schedule,cur counter:~p PlayerForce:~p PetForce:~p BuffIDList:~w",
		[playerState:getRoleID(),MissionID,PlayerForce,PetForce,BuffIDList]),
	#warriortrialCfg{maxTime = MaxTime}
		= getCfg:getCfgPStack(cfg_warriortrial, MissionID),
	%限定下时间
	UseTime = misc:clamp(NowTime - BeginTime, 1, MaxTime),
	WarriorTrialInfo = getWarriorTrialInfo(),
	#rec_warrior_trial{tswkTrialSchedule = TTS, tswkTrialTime = TTT} = WarriorTrialInfo,
	TodayWarriorTrialSchedule = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule),
	?DEBUG("TodayWarriorTrialSchedule[~p]TTS[~p]",[TodayWarriorTrialSchedule,TTS]),
	NewWarriorTrialInfo = case TodayWarriorTrialSchedule >= TTS of
							  true ->
								  case TodayWarriorTrialSchedule > TTS of
									  true ->
										  %%当前进度大于本周最大进度，保存进度和挑战时间
										  WarriorTrialInfo#rec_warrior_trial{tswkTrialSchedule = TodayWarriorTrialSchedule, tswkTrialTime = UseTime};
									  _ ->
										  %%当前进度等于本周最大进度，如果时间比以前短，就更新下
										  case UseTime < TTT of
											  true ->
												  WarriorTrialInfo#rec_warrior_trial{tswkTrialTime = UseTime};
											  _ ->
												  WarriorTrialInfo
										  end
								  end;
							  _ ->
								  %%当前进度小于本周最大进度，不保存任何信息
								  WarriorTrialInfo
						  end,


	%%勇者试炼成就
	playerAchieve:achieveEvent(?Achieve_brave_tried, [MissionID,1]),
	%%挑战成功
	case NewWarriorTrialInfo of
		#rec_warrior_trial{trialSchedule = MaxMissionID} when TodayWarriorTrialSchedule > MaxMissionID ->
			saveTrialInfo(NewWarriorTrialInfo#rec_warrior_trial{trialSchedule = TodayWarriorTrialSchedule}),
			psMgr:sendMsg2PS(?PublicDataMgr, addWarriorTrial, {MissionID, playerState:getName()}),
			?INFO("RoleID[~p] Firstkill[~p]", [playerState:getRoleID(), TodayWarriorTrialSchedule]);
		_ ->
			saveTrialInfo(NewWarriorTrialInfo)
	end,

	%%勇者试炼头像框达成检测
	playerFrame:checkCondition(?PlayerFrame_Type_WarriorTrials),

	playerState:setWarriorTrialState(?WarriorTrialStateSuccess),
	playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialSuccess),

	playerSevenDays:onMissionEvent(?SevenDayMission_Event_15, 1, 0),

	%% 清技能CD和回血
	playerBase:clearSkillCDAndRestoreHp(),
	playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_NvShenJinBi),

	%%通知客户端
	playerMsg:sendNetMsg(#pk_GS2U_WarriorTrialSuccess{result = true}),
	playerSevenDayAim:updateCondition(?SevenDayAim_WarriorTrial, [MissionID]),
	%%发奖(将原来的怪物掉落修改为根据配置发奖)
	case getCfg:getCfgPStack(cfg_warriortrial, MissionID) of
		#warriortrialCfg{
			dailykillaward = DailyKillAward,
			exp = Exp
		} ->
			getAward(MissionID,Exp,DailyKillAward);
		_ ->
			?ERROR("#warriortrialCfg err"),
			skip
	end.
%%开始扫荡关卡
-spec beginSweepMission() -> #pk_GS2U_RequestAutoDealAck{} | #pk_GS2U_RequestAutoDealAck{} | skip.
beginSweepMission() ->
	%%扫荡的关卡id
	MissionID = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule) + 1,
	?INFO("player:~p beginSweepMission:~p",[playerState:getRoleID(),MissionID]),
	case MissionID of
		1 ->
			playerLogAdd:addLogParticipatorInfo(?LogParticipator_WarriorTrialPlayerIn);
		_ ->skip
	end,
	case canSweep(MissionID) of
		true ->
			playerliveness:onFinishLiveness(?LivenessBraveTrain,1),
			#warriortrialCfg{mapid = MapID, coinnum = CoinNum, maxTime = MaxTime}
				= getCfg:getCfgPStack(cfg_warriortrial, MissionID),
			%%发普通奖励
			Result = getWarriorSweepingAward(MissionID),
			R =
				case Result of
					#pk_GS2U_RequestAutoDealAck{} ->
						playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_NvShenJinBi),
						%%扫荡成功
						WarriorTrialInfo = getWarriorTrialInfo(),
						#rec_warrior_trial{trialSchedule = RecordSchedule, tswkTrialSchedule = TTS} = WarriorTrialInfo,
						%%成功就增加今天刷本记录
						playerDaily:incDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule),
						TodayWarriorTrialSchedule = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule),
						?INFO("player:~p SweepMission:~p, count:~p TTS:~p",[playerState:getRoleID(),MissionID,TodayWarriorTrialSchedule,TTS]),
						case TodayWarriorTrialSchedule > TTS of
							true ->
								saveTrialInfo(WarriorTrialInfo#rec_warrior_trial{tswkTrialSchedule = TodayWarriorTrialSchedule, tswkTrialTime = MaxTime});
							_ ->
								skip
						end,
						playerMsg:sendNetMsg(#pk_GS2U_SweepWarriorTrialSuccess{record = RecordSchedule, cur = MissionID, coin = CoinNum}),
						playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialSweepSuccess),
						Result;
					_ ->
						%%扫荡失败
						playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialSweepFailed),
						#pk_GS2U_RequestAutoDealAck{
							isSuccess = false,
							copyMapID = MapID,
							coinReward = [],
							expReward = 0,
							dropItems = []
						}
				end,
			R;
		_ ->
			skip
	end.
tickMaxTime() ->
	BeginTime = playerState:getWarriorTrialTime(),
	case BeginTime > 0 of
		true ->
			NowTime = misc_time:gregorian_seconds_from_1970( ),
			CurMission = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule) + 1,
			#warriortrialCfg{maxTime = MaxTime, mapid = MapID} = getCfg:getCfgPStack(cfg_warriortrial, CurMission),
			MapSubType = playerScene:getMapSubType(MapID),
			case MapSubType =:= ?MapSubTypeWarrior of
				true ->
					%%挑战时间到了
					case NowTime > BeginTime + MaxTime of
						true ->
							?INFO("player:~p WarriorTrial timeout MissionID:~p",[playerState:getRoleID(),CurMission]),
							playerState:setWarriorTrialTime(0),
							%%挑战时间到
							playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialTimeOut),
							%%通知客户端
							playerMsg:sendNetMsg(#pk_GS2U_WarriorTrialSuccess{result = false}),
							%%为了让客户端挑战失败的特效显示出来，延迟离开副本
%%							core:sendMsgToMapMgr(MapID, resetCopyMap, {playerState:getRoleID(), playerState:getTeamID(), MapID}),
							case getCfg:getCfgByArgs(cfg_mapsetting, MapID) of
								#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeWarrior, finish_time = FT} ->
									%%重置副本
									sendRstMsg(MapID, FT);
								_ ->
									sendRstMsg(MapID, 1)
							end,
							ok;
						_ ->
							skip
					end;
				_ ->
					%%不在勇者试炼副本了，退出
					quitQuitMap()
			end;
		_ ->
			skip
	end,
	ok.
%%玩家直接退出副本
quitQuitMap() ->
	playerState:setWarriorTrialTime(0),
	case playerState:getWarriorTrialState() of
		?WarriorTrialStateIsChallenging ->
			%%真正挑战中退出的话，挑战失败
			playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialFailed);
		_ ->
			skip
	end.


-spec playerBeKilled(MapID::uint32()) -> ok.
%%玩家被杀，挑战失败处理
playerBeKilled(MapID) ->
	?INFO("player:~p WarriorTrial Killed by Boss in MapID:~p",[playerState:getRoleID(),MapID]),
	playerState:setWarriorTrialTime(0),
	%%先通知客户端挑战失败
	playerMsg:sendNetMsg(#pk_GS2U_WarriorTrialSuccess{result = false}),
	%%你已经死了
	playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialPlayerDead),
	%%重置副本
	case getCfg:getCfgByArgs(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeWarrior, finish_time = FT} ->
			%%重置副本
			sendRstMsg(MapID, FT);
		_ ->
			sendRstMsg(MapID, 1)
	end,
%%	core:sendMsgToMapMgr(MapID, resetCopyMap, {playerState:getRoleID(), playerState:getTeamID(), MapID}),
	ok.
%%完成所有关卡
-spec playerCompleteAllMissions(MapID::uint16()) -> ok.
playerCompleteAllMissions(MapID) ->
	?INFO("player:~p CompleteAllMissions of MapID:~p",[playerState:getRoleID(),MapID]),
	playerState:setWarriorTrialTime(0),
	%%你已经登峰造极啦
	playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialMaxMission),
	case getCfg:getCfgByArgs(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeWarrior, finish_time = FT} ->
	%%重置副本
			sendRstMsg(MapID, FT);
		_ ->
			skip
	end,
%%	core:sendMsgToMapMgr(MapID, resetCopyMap, {playerState:getRoleID(), playerState:getTeamID(), MapID}),
	ok.
%%Internal Function%%
%%获取关卡数
getMissionNum() ->
	erlang:length(getCfg:get1KeyList(cfg_warriortrial)).
%%是否可以扫荡关卡
-spec canSweep(MissionID :: uint16()) -> boolean().
canSweep(MissionID) ->
	%%只能扫荡曾经通过的关卡,且这次扫荡关卡不能大于最大关卡
	#rec_warrior_trial{tswkTrialSchedule = RecordSchedule} = getWarriorTrialInfo(),
	MissionNumber = getMissionNum(),
	if
		MissionID =< MissionNumber ->
			if
				RecordSchedule =:= 0 ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialIsNone),
					false;
				MissionID =< RecordSchedule ->
					%%背包格子不小于5个
					case isPackageIdle() of
						true ->
							true;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialBagIsAmostFull),
							false
					end;
				true ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialCanOnlySweepPass),
					false
			end;
		true ->
			false
	end.
%%
%%	case MissionID =< RecordSchedule andalso MissionID =< getMissionNum() of
%%		true ->
%%			%%背包格子不小于5个
%%			case isPackageIdle() of
%%				true ->
%%					true;
%%				_ ->
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialBagIsAmostFull),
%%					false
%%			end;
%%		_ ->
%%			%%?DEBUG("[DebugForWT] canSweep MissionID(~p) RecordSchedule(~p) MissionNum(~p)", [MissionID, RecordSchedule, getMissionNum()]),
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialCanOnlySweepPass),
%%			false
%%	end.
%%给玩家加buff
giveBuffToPlayer() ->
	%%玩家战斗力
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	%%当前挑战的关卡
	MisstionID = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule) + 1,
	#warriortrialCfg{attack = Attack, buff = Buff}
		= getCfg:getCfgPStack(cfg_warriortrial, MisstionID),

	case PlayerForce > Attack of
		true ->
			?WARN("WarriorTrial give player:~p Buff:~p Force:~p Attack:~p,CurMissionID:~p,playerLevel:~p",
				[playerState:getRoleID(),Buff,PlayerForce,Attack,MisstionID,playerState:getLevel()]),
			%%玩家战力高于标准战力,加个buff让玩家一定能打过这个boss
			playerBuff:addBuff(Buff, playerState:getLevel());
		_ ->
			skip
	end,
	ok.

-spec getWarriorSweepingAward( MissionID::uint16() ) ->#pk_GS2U_RequestAutoDealAck{} | skip.
getWarriorSweepingAward( MissionID ) ->
	case getCfg:getCfgPStack(cfg_warriortrial, MissionID) of
		#warriortrialCfg{
			mapid = MapID,
			dailykillaward = DailyKillAward,
			exp = Exp,
			gold = [BindGoldMin,BindGoldMax],
			purple = [PurpleMin,PurpleMax],
			golden = [GoldenMin,GoldenMax]
		} ->
			%%道具list
				Fun =
					fun({ItemID, ItemNum},AccIn) ->
						case getCfg:getCfgPStack(cfg_item, ItemID) of
							#itemCfg{id = ItemID,quality = Quality} ->
								[#pk_CopyMapDropItem{
									itemUID = 0,
									itemID = ItemID,
									number = ItemNum,
									quality = Quality,
									isBind = 0
								} | AccIn];
							_ ->
								?ERROR("#itemCfg err"),
								AccIn
						end
					end,
			ItemList = lists:foldl(Fun, [], DailyKillAward),
			getAward(MissionID,Exp,DailyKillAward),
			BindGold = misc:rand(BindGoldMin, BindGoldMax),
			Purple = misc:rand(PurpleMin, PurpleMax),
			Golden = misc:rand(GoldenMin, GoldenMax),
			case BindGold > 0 of
				true ->
					true = playerMoney:addCoin(?CoinTypeGold, BindGold,
						#recPLogTSMoney{reason=?CoinSourceCopyMapReward,param=MissionID,target=?PLogTS_PlayerSelf,source=?PLogTS_Warrior});
				_ ->
					skip
			end,
			case Purple > 0 of
				true ->
					true = playerMoney:addCoin(?CoinTypePurpleEssence, Purple,
						#recPLogTSMoney{reason=?CoinSourceCopyMapReward,param=MissionID,target=?PLogTS_PlayerSelf,source=?PLogTS_Warrior});
				_ ->
					skip
			end,
			case Golden > 0 of
				true ->
					true = playerMoney:addCoin(?CoinTypeGoldenEssence, Golden,
						#recPLogTSMoney{reason=?CoinSourceCopyMapReward,param=MissionID,target=?PLogTS_PlayerSelf,source=?PLogTS_Warrior});
				_ ->
					skip
			end,

			#pk_GS2U_RequestAutoDealAck{
				isSuccess = true,
				copyMapID = MapID,
				coinReward = [
					#pk_CoinData{coinType = ?CoinTypeGold, value = BindGold},
					#pk_CoinData{coinType = ?CoinTypePurpleEssence, value = Purple},
					#pk_CoinData{coinType = ?CoinTypeGoldenEssence, value = Golden}
				],
				expReward = Exp,
				dropItems = ItemList
			};
		_ ->
			?ERROR("#warriortrialCfg err"),
			skip
	end.
%%清空玩家勇士排行榜需要数据
-spec cleanRankData() -> ok.
cleanRankData() ->
	Info = getWarriorTrialInfo(),
	NewInfo = Info#rec_warrior_trial{tswkTrialSchedule = 0, tswkTrialTime = 0},
	saveTrialInfo(NewInfo),
	ok.
%%所有背包不得少于5个
-spec isPackageIdle() -> boolean().
isPackageIdle() ->
	playerPackage:getBagIdleSlotNum(?Item_Location_Bag) >= 2
		andalso playerPackage:getBagIdleSlotNum(?Item_Location_Equip_Bag) >= 2.
		%andalso playerPackage:getBagIdleSlotNum(?Item_Location_Gem_Bag) >= 5.

-spec saveTrialInfo(WarriorTrialInfo::#rec_warrior_trial{}) -> ok.
saveTrialInfo(WarriorTrialInfo) ->
	?DEBUG("WarriorTrialInfo = ~p",[WarriorTrialInfo]),
	playerState:setWarriorTrialInfo(WarriorTrialInfo),
	ok.
saveWarriorTrialInfoDB() ->
	playerSave:saveWarriorTrialInfo(playerState:getWarriorTrialInfo()),
	ok.
getWarriorTrialInfo() ->
	case playerState:getWarriorTrialInfo() of
		#rec_warrior_trial{} = WarriorInfo ->
			WarriorInfo;
		_ ->
			#rec_warrior_trial{roleID = playerState:getRoleID()}
	end.


sendRstMsg(MapID, ResetTime)->
	case playerState:getMapID() of
		MapID ->
			psMgr:sendMsg2PS(playerState:getMapPid(), clearMonsterAndCollectObject, 0);
		MapID2 ->
			?ERROR("sendRstMsg roleID:~p, MapID:~p, MapID2:~p, MapPid:~p",
				[playerState:getRoleID(), MapID, MapID2, playerState:getMapPid()]),
			skip
	end,
	erlang:send_after(ResetTime*1000, self(), {warriorTrialResetCopyMap, MapID}),
	ok.

%%%-------------------------------------------------------------------
%% 领取首杀奖励
-spec firstKillReward(ID::uint16()) -> no_return().
firstKillReward(?OneKeyGetReward) ->
	RewardID = playerPropSync:getProp(?SerProp_WarriorTrial_RewardID),
	{RewardList, LastMaxRewardID}=
		case getWarriorTrialInfo() of
			#rec_warrior_trial{trialSchedule = Max} ->
				Fun1 =
					fun(Key, {Acc, TempRewardID}) ->
						case RewardID < Key andalso Max >= Key of
							true ->
								case getCfg:getCfgByKey(cfg_warriortrial, Key) of
									#warriortrialCfg{firstkillaward = []} ->
										{Acc, TempRewardID};
									#warriortrialCfg{firstkillaward = Reward} when erlang:is_list(Reward) ->
										case TempRewardID < Key of
											true ->
												{Reward ++ Acc, Key};
											_ ->
												{Reward ++ Acc, TempRewardID}
										end;
									_ ->
										{Acc, TempRewardID}
								end;
							_ ->
								{Acc, TempRewardID}
						end
					end,
				lists:foldl(Fun1, {[], RewardID}, getCfg:get1KeyList(cfg_warriortrial));
			_ ->
				[]
		end,

	case RewardList =/= [] of
		true ->
			playerPropSync:setInt(?SerProp_WarriorTrial_RewardID, LastMaxRewardID),
			Fun = fun({ItemID, ItemNum}) ->
				Plog = #recPLogTSItem{
					old = 0,
					new = ItemNum,
					change = ItemNum,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_Warrior,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceWarriorTrialOneyKey,
					reasonParam = RewardID
				},
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog)
				  end,
			lists:foreach(Fun, RewardList),
			playerMsg:sendNetMsg(#pk_GS2U_WarriorFirstKillReward_Ack{isOK = true, start = RewardID + 1, maxReward = LastMaxRewardID});
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_WarriorFirstKillReward_Ack{isOK = false, start = RewardID, maxReward = RewardID})
	end;
firstKillReward(ID) ->
	RewardID = playerPropSync:getProp(?SerProp_WarriorTrial_RewardID),
	case getCfg:getCfgByKey(cfg_warriortrial, ID) of
		#warriortrialCfg{firstkillaward = []} ->
			playerMsg:sendNetMsg(#pk_GS2U_WarriorFirstKillReward_Ack{isOK = false, start = RewardID, maxReward = RewardID});	%% 没有配置奖励
		#warriortrialCfg{firstkillaward = ListReward} when erlang:is_list(ListReward) ->
			case getWarriorTrialInfo() of
				#rec_warrior_trial{trialSchedule = Max} when Max >= ID ->
					case RewardID < ID of
						true ->
							%% 先记录已领奖再发奖
							playerPropSync:setInt(?SerProp_WarriorTrial_RewardID, ID),
							?INFO("RoleID[~p] Firstkillaward[~p]", [playerState:getRoleID(), ListReward]),
							Fun = fun({ItemID, ItemNum}) ->
								Plog = #recPLogTSItem{
									old = 0,
									new = ItemNum,
									change = ItemNum,
									target = ?PLogTS_PlayerSelf,
									source = ?PLogTS_Warrior,
									gold = 0,
									goldtype = 0,
									changReason = ?ItemSourceWarriorTrial,
									reasonParam = ID
								},
								playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog)
								  end,
							lists:foreach(Fun, ListReward),
							playerMsg:sendNetMsg(#pk_GS2U_WarriorFirstKillReward_Ack{isOK = true, start = RewardID + 1, maxReward = ID});
						_ ->
							playerMsg:sendNetMsg(#pk_GS2U_WarriorFirstKillReward_Ack{isOK = false, start = RewardID,  maxReward = RewardID})	%% 已经领取过了
					end;
				_ ->
					playerMsg:sendNetMsg(#pk_GS2U_WarriorFirstKillReward_Ack{isOK = false, start = RewardID, maxReward = RewardID})	%% 没有通关
			end;
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_WarriorFirstKillReward_Ack{isOK = false, start = RewardID, maxReward = RewardID})	%% 乱传什么ID
	end.

%%%-------------------------------------------------------------------
% api:一键扫荡
-spec oneKeySweep() -> no_return().
oneKeySweep() ->
	List = oneKeySweep([]),
	playerMsg:sendNetMsg(#pk_GS2U_RequestOneKeyDealAck{listResult = List}).
-spec oneKeySweep(Acc::[#pk_RequestAutoDeal{}, ...]) -> Ret::[#pk_RequestAutoDeal{}, ...].
oneKeySweep(Acc) ->
	case beginSweepMission() of
		#pk_GS2U_RequestAutoDealAck{
			isSuccess = true,
			copyMapID = CopyMapID,
			coinReward = CoinReward,
			expReward = ExpReward,
			dropItems = DropItems
		} ->
			E = #pk_RequestAutoDeal{
				isSuccess = true,
				copyMapID = CopyMapID,
				coinReward = CoinReward,
				expReward = ExpReward,
				dropItems = DropItems
			},
			oneKeySweep([E | Acc]);
		_ ->
			Acc
	end.

%% v3.0.0屏蔽旧版补偿
%% give14
%%repairBraveTriedAchieve(CurMissID,MaxMissID) when CurMissID =< MaxMissID ->
%%	playerAchieve:achieveEvent(?Achieve_brave_tried, [CurMissID,1]),
%%
%%	%%勇者试炼头像框达成检测
%%	playerFrame:checkCondition(?PlayerFrame_Type_WarriorTrials),
%%
%%	repairBraveTriedAchieve(CurMissID + 1, MaxMissID);
%%repairBraveTriedAchieve(_CurMissID, _MaxMissID) ->
%%	ok.
%%
%%checkAndRepairBraveTriedAchieve() ->
%%	#rec_warrior_trial{trialSchedule = MaxMissID} = getWarriorTrialInfo(),
%%	repairBraveTriedAchieve(1, MaxMissID).

getAward(MissionID,Exp,DailyKillAward) ->
	Fun2 = fun({ItemID, ItemNum}) ->
		case getCfg:getCfgPStack(cfg_item, ItemID) of
			#itemCfg{useType = UseType,useParam1 = CoinType,useParam2 = CoinNum} ->
				case UseType =:= ?Item_Use_GetBindedGold of
					true ->
						playerMoney:addCoin(CoinType, ItemNum * CoinNum,
							#recPLogTSMoney{reason = ?CoinSourceCopyMapReward, param = MissionID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Warrior});
					_ ->
						Plog = #recPLogTSItem{
							old = 0,
							new = ItemNum,
							change = ItemNum,
							target = ?PLogTS_PlayerSelf,
							source = ?PLogTS_Warrior,
							gold = 0,
							goldtype = 0,
							changReason = ?ItemSourceWarriorTrial,
							reasonParam = MissionID
						},
						playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog)
				end;
			_ ->
				?ERROR("#itemCfg err")
		end
		   end,
	lists:foreach(Fun2, DailyKillAward),
	true = playerBase:addExp(Exp, ?ExpSourceCopyMap, 0).
