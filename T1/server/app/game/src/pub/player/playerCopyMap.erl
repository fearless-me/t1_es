%%
%% @author zhongyunawei
%% @doc @todo 玩家副本模块.


-module(playerCopyMap).
-author(zhongyuanwei).

-include("playerPrivate.hrl").
-include("../world/mapPrivate.hrl").

-export_type([
	type_copyMapSpecEventCondition/0,
	type_copyMapSpecEvent/0
]).

%%进入副本条件
%%前置任务
-define(CopyMapEnterCond_Task, 1).
%%指定道具
-define(CopyMapEnterCond_Item, 2).
%% 副本奖励最多个数
%%-define( CopyMapRewardMaxNum, 3).
%% 副本扣除体力差值
-define(CopyMapDeductPhysical, 10).

%%%-------------------------------------------------------------------
%% 副本特殊事件触发条件（针对单用户）
%%   使用cfg_copymapScheduleInit初始化副本进度时、使用cfg_copymapScheduleSettle结算副本进度时
%%     根据上述两表的字段condition表示条件列表（且关系），按下列方式解析其元素作为触发条件
-define(CopyMapSpecEventCondition_Begin, 0).
-define(CopyMapSpecEventCondition_Allow, 0).    %% 无条件通过
-define(CopyMapSpecEventCondition_EnterCount, 1).    %% 是否尚未完成过该副本 {1}
-define(CopyMapSpecEventCondition_HpLess, 2).    %% 血量少于多少触发 {2, 是否是百分比, 血量下限}
-define(CopyMapSpecEventCondition_End, 2).
-type type_copyMapSpecEventCondition() :: ?CopyMapSpecEventCondition_Begin .. ?CopyMapSpecEventCondition_End.

%%%-------------------------------------------------------------------
%% 副本特殊事件（针对单用户）
%%   使用cfg_copymapScheduleInit初始化副本进度时、使用cfg_copymapScheduleSettle结算副本进度时
%%     根据上述两表的字段event，按下列方式解析作为发条件
-define(CopyMapSpecEvent_Begin, 1).
-define(CopyMapSpecEvent_TempSkillForWake, 1).    %% 临时添加一个用于觉醒的技能[1]
-define(CopyMapSpecEvent_TempSkillForGod, 2).    %% 临时添加一个用于女神的技能[2]

-define(CopyMapSpecEvent_End, 2).
-type type_copyMapSpecEvent() :: ?CopyMapSpecEvent_Begin .. ?CopyMapSpecEvent_End.



%% ====================================================================
%% API functions
%% ====================================================================
-export([
	getEnterCopyMapCount/1,
	tryDoEvent/1,
	restoreEvent/0
]).

-export([
	kickCopyMapPlayer/0,
	onPassCopyMap/3,
	completeNormalCopyMap/1,%%不要调用此接口，副本完成请调用onPassCopyMap/2
	completeNormalCopyMap_Not_Reward/1,%%不要调用此接口，副本完成请调用onPassCopyMap/2
	enterCopyMap/1,
	leaveCopyMap/0,
	resetCopyMap/1,
	resetCopyMapAck/1,
	canEnterCopyMap/1,
	canEnterCopyMap/2,
	canEnterCopyMap_NotJudgeTimes/1,
	checkEnterCopyMapDailyCount/1,
	checkEnterCopyMapLevel/2,
	playerEnterCopyMapFirst/1,
	init/0,
	getCopyMapHighestScoreAck/1,
	addCopyMapDropList/1,
	getCopyMapDropList/0,
	goonCopyMap/1,
	destroyMap_goonCopyMap_Ack/1,
	enterMapHook/1,
	sendCopyMapDestroy2Client/0,
	playAnimationOver/1,
	show2/5,                    %% 客户端主动请求show2对话完成
	gatherSuccessCopyBuff/1,        %% 地表采集物采集成功
	copyMapScheduleInitAddBuff/1,
	decResByEnterCopyMap/1,
	addCompleteCopyMapAchieve/2,
	onPassHomeBitMap/4
]).

-export([
	incEnterCopyMapGroupDailyCount/1,
	decEnterCopyMapGroupDailyCount/2
]).

-export([
	canRewardUserOnPassCopyMap/1,
	onPassCopyMapDevil/1,
	sendInitDevilMapStartList/0,
	get_devil_copy_pass_star_by_map_id/1,
	queryCopyRankList/1
]).

-spec init() -> ok.
init() ->
	%% 建立副本分数进程字典
	playerState:setCopyMapScoreDict(dict:new()),

	case playerState:getIsPlayer() of
		true ->
			%% 获取每个副本的最高分数
			gsSendMsg:sendMsg2DBServer(getCopyMapHighestScore, playerState:getAccountID(), playerState:getRoleID());
		_ ->
			skip
	end,
	ok.

copyMapScheduleInitAddBuff(undefined) ->
	ok;
copyMapScheduleInitAddBuff(0) ->
	ok;
copyMapScheduleInitAddBuff(BuffList) ->
	Career = playerState:getCareer(),
	case lists:keyfind(Career, 1, BuffList) of
		false -> skip;
		V -> doCopyMapScheduleInitAddBuff(V)
	end,
	ok.

doCopyMapScheduleInitAddBuff({_C, B1, B2, B3}) ->
	?DEBUG("doCopyMapScheduleInitAddBuff[~p]", [{B1, B2, B3}]),
	Level = playerState:getLevel(),
	[playerBuff:addBuff(BuffID, Level) || BuffID <- [B1, B2, B3]];
doCopyMapScheduleInitAddBuff(_Any) ->
	skip.

%%进入场景的钩子
enterMapHook({_, #recRequsetEnterMap{}}) ->
	skip;
enterMapHook(#enterMapInfo{mapid = MapID1, mapPid = MapPID1}) ->
	enterMapHook({MapID1, MapPID1});
enterMapHook({MapID, MapPID}) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap} ->
			case canEnterCopyMap(MapID) of
				true ->
					playerState:setCurrentCopyMapDestroyTime(MapID, MapPID);
				_ ->
					playerState:setCurrentCopyMapDestroyTime(MapID, undefined)
			end,
			sendCopyMapDestroy2Client(),
			addCopyMapBuff();
		_ ->
			skip
	end,
	playerWorldBossWar:onEnterMap(MapID),
	playerGuildBoss:onEnterMap(MapID),
	playerliveness:livenessJoinEvent(MapID).

completeCopyMapHook(CopyMapID) ->
	playerState:setCurrentCopyMapDestroyTime(CopyMapID, undefined),
	sendCopyMapDestroy2Client().

addCopyMapBuff() ->
	case core:isCross() of
		true ->
			case playerState:getPlayerEnterMapAddBuffInfo() of
				{IsSameGuild, IsFrind} ->

					case IsSameGuild of
						true ->
							GuildMemberBuffID = getGuildMemberBuffID(),
							psMgr:sendMsg2PS(self(), addBuff, {GuildMemberBuffID});
						_ ->
							skip
					end,
					case IsFrind of
						true ->
							FriendBuffID = getFriendBuffID(),
							psMgr:sendMsg2PS(self(), addBuff, {FriendBuffID});
						_ ->
							skip
					end;
				_ ->
					skip

			end;
		_ ->
			RoleID = playerState:getRoleID(),
			PlayerEts = playerState:getMapPlayerEts(),
			GuildID = playerState:getGuildID(),
			Q = ets:fun2ms(fun(Obj) when Obj#recMapObject.id =/= RoleID -> Obj end),
			OL = ets:select(PlayerEts, Q),
			{FPL, GPL} =
				lists:foldl(
					fun(#recMapObject{id = ObjID, pid = Pid, guild = GID}, {AccF, AccG}) ->


						case ObjID of
							RoleID ->
								skip;
							_ ->
								psMgr:sendMsg2PS(Pid, add_Cross_CopyMapBuff, {})
						end,

						AccF1 =
							case cgsFriendInterface:queryFRT(ObjID, RoleID) of
								?FRT_Formal ->
									[Pid | AccF];
								_ ->
									AccF
							end,

						AccG1 =
							case GuildID =:= GID andalso GID > 0 of
								true ->
									[Pid | AccG];
								_ ->
									AccG
							end,
						{AccF1, AccG1}
					end, {[], []}, OL),

			FriendBuffID = getFriendBuffID(),
			GuildMemberBuffID = getGuildMemberBuffID(),
			addCopyMapBuff(FPL, FriendBuffID),
			addCopyMapBuff(GPL, GuildMemberBuffID)
	end,

	ok.

addCopyMapBuff([], _BuffID) ->
	ok;
addCopyMapBuff(_L, 0) ->
	ok;
addCopyMapBuff(L, BuffID) ->
	psMgr:sendMsg2PS(self(), addBuff, {BuffID}),
	lists:foreach(
		fun(Pid) ->
			psMgr:sendMsg2PS(Pid, addBuff, {BuffID})
		end
		, L
	).

getFriendBuffID() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, team_buff_friends) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			0
	end.

getGuildMemberBuffID() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, team_buff_familys) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			0
	end.

%%将地图销毁时间发送给客户端
sendCopyMapDestroy2Client() ->
	NowSec = time2:getUTCDateTimeSec(),
	{MapID, LeftTime} =
		case playerState:getCurrentCopyMapDestroyTime() of
			{CopyMapID, MapPid} when is_pid(MapPid) ->
				case mapMgrState:getCopyMap(MapPid) of
					#recCopyMapInfo{isWaitDestroy = false, destroyTime = DT} when NowSec < DT ->
						{CopyMapID, DT};
					_ ->
						{CopyMapID, 0}
				end;
			{CopyMapID, _MapPid} ->
				{CopyMapID, 0};
			_ ->
				{0, 0}
		end,

	DestroyTime = LeftTime + time2:getTimezoneSec(),
	?DEBUG("send2player ~p, map ~p, lefttime ~p,destroytime ~p", [playerState:getRoleID(), MapID, LeftTime - NowSec, DestroyTime]),
	playerMsg:sendNetMsg(#pk_GS2U_copy_map_destory_time{copyMapID = MapID, waitTime = DestroyTime, destoryTime = DestroyTime}).


%% 循环刷本
-spec goonCopyMap(MapID :: uint()) -> ok.
goonCopyMap(MapID) ->
	case MapID =:= playerState:getMapID() of
		true ->
			TeamID = playerState:getTeamID(),
			RoleID = playerState:getRoleID(),
			MapPid = playerState:getMapPid(),
			case TeamID > 0 of
				true ->
					TeamLeaderID = gsTeamInterface:getLeaderIDWithTeamID(TeamID), %%team2:getTeamLeaderID(TeamID),
					case RoleID =:= TeamLeaderID of
						true ->
							playerliveness:livenessJoinEvent(MapID),
							core:sendMsgToMapMgr(MapID, destoryMap_goonCopyMap, {MapID, MapPid, self(), TeamLeaderID});
						_ ->
							%% 只有队长才能开启循环刷本
							playerMsg:sendErrorCodeMsg(?ErrorCode_GoonCopyMap_MustBeLeader)
					end;
				_ ->
					core:sendMsgToMapMgr(MapID, destoryMap_goonCopyMap, {MapID, MapPid, self(), RoleID})
			end;
		_ -> playerMsg:sendErrorCodeMsg(?ErrorCode_GoonCopyMap_Failed)
	end,
	ok.

-spec destroyMap_goonCopyMap_Ack({MapID :: uint(), RoleID :: uint64()}) -> ok.
destroyMap_goonCopyMap_Ack({MapID, RoleID}) ->
	case RoleID =:= playerState:getRoleID() of
		true ->
			?INFO("destoryMap_goonCopyMap_Ack:mapid=~p,roleId=~p", [MapID, RoleID]),
			enterCopyMap(MapID);
		_ -> skip
	end,
	ok.

-spec getCopyMapHighestScoreAck(CopyMapScoreList :: list()) -> ok.
getCopyMapHighestScoreAck(CopyMapScoreList) ->
	SelfRoleID = playerState:getRoleID(),
	Fun = fun(Other = #recCopyMapScore{roleID = RoleID, copyMapID = CopyMapID, maxScore = Score}) ->
		case RoleID =:= SelfRoleID of
			true ->
				Dict = playerState:getCopyMapScoreDict(),
				case dict:find(CopyMapID, Dict) of
					{ok, #recCopyMapScore{maxScore = OldScore}} when OldScore >= Score ->
						skip;
					_ ->
						?DEBUG("getCopyMapHighestScoreAck:~p,~p,~p", [RoleID, CopyMapID, Score]),

						NDict = dict:store(CopyMapID, Other, Dict),
						playerState:setCopyMapScoreDict(NDict)
				end;
			_ ->
				?ERROR("getCopyMapHighestScoreAck:~p,~p", [SelfRoleID, Other])
		end
	      end,
	lists:foreach(Fun, CopyMapScoreList).

%% 玩家第一次进入这个副本，fixme 可以用于每日副本计数
-spec playerEnterCopyMapFirst({MapID :: uint(), MapPID :: pid()}) -> ok.
playerEnterCopyMapFirst({MapID, MapPID}) ->
	RoleID = playerState:getRoleID(),
	BitMapID = playerState:getMapIDGroup(),
	?INFO("playerEnterCopyMapFirst roleID=~p,code=~p,mapid=~p,mappid=~p,BitMapID=~p,pid=~p",
		[RoleID, playerState:getPlayerCode(), MapID, MapPID, BitMapID, playerState:getMapPid()]),

	case playerScene:getMapType(BitMapID) of
		?MapTypeCopyMap ->
			case playerTeamCopyMap:isAssistCopyMapByCopyMapID(RoleID, MapID) of
				false ->
					case playerBattle:canGainDropGoods(MapID) of
						true ->
							decResByEnterCopyMap(MapID);
						_ ->
							?INFO("player reward in the end:~p,~p,~p", [RoleID, MapID, MapPID]),
							skip
					end;
				_ ->
					Ret = ets:insert(ets_recAssistCopyMap, #recAssistCopyMap{mapPID = MapPID, mapID = MapID, roleID = RoleID}),
					?INFO("playerEnterCopyMapFirst assist roleid=~p, mapid=~p, mappid=~p ret=~p",
						[RoleID, MapID, MapPID, Ret]),
					skip
			end;
		_ ->
			skip
	end,
	ok.

decResByEnterCopyMap(MapID) ->
	case core:isCross() of
		false ->
			%% 只在普通服走此流程
			#mapsettingCfg{useVitality = UseVitality}
				= MapCfg = getCfg:getCfgPStack(cfg_mapsetting, MapID),

			%% 扣体力
			playerActionPoint:deductActionPoint(UseVitality),

			?INFO("decResByEnterCopyMap roleID=~p, MapID=~p, ActionPoint=~p",
				[playerState:getRoleID(), MapID, UseVitality]),

			Ret = checkEnterCopyMapDailyCount(MapCfg),
			afterCheckEnterCopyMapDailyCount(Ret);
		_ ->
			skip
	end,
	ok.

%% 进入副本
-spec enterCopyMap(CopyMapID :: uint()) -> boolean().
enterCopyMap(CopyMapID) ->
	{MapType, SubType} =
		case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
			#mapsettingCfg{type = Type, subtype = SType} ->
				{Type, SType};
			_ ->
				{999, 999}
		end,
	case MapType of
		?MapTypeCopyMap ->
			case SubType of
				?MapSubTypeMaterial ->
					playerMaterialCopy:onEnterMap(CopyMapID);
				?MapSubTypeMoneyDungeon ->
					playerMoneyDungeon:onEnterMap(CopyMapID);
				?MapSubTypeSpiritArea ->
					playerSpiritArea:onEnterMap(CopyMapID);
				_ ->
					playerScene:onRequestEnterMap(CopyMapID)
			end;
		?MapTypeBitplane ->
			%% 只能在普通地图进入位面  家园地图除外
			case playerScene:getMapType(playerState:getMapID()) =:= ?MapTypeNormal orelse playerState:getMapID() =:=?HomeMapID of
				true ->
					%% 判断目标是否进入的时空裂痕，如果是，则要走时空裂痕的流程
					case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
						#mapsettingCfg{type = ?MapTypeBitplane, subtype = ?MapSubTypeRift} ->
							playerCopyMapRift:requestEnterRift(0, CopyMapID),
							false;
						_ ->
							playerScene:onEnterBitGroup(CopyMapID)
					end;
				_ ->
					false
			end;
		?MapTypeActivity ->
			case SubType of
				?MapSubTypeEscort ->
					playerEscort:requestEscortTeam();
				?MapSubTypeDarknessReady ->
					playerDarkness:requestEnterDarknessPrepareMap(CopyMapID);
				?MapSubTypeDarkness ->
					playerDarkness:requestEnterDarknessMap(CopyMapID);
				?MapSubTypeGuildWar ->
					playerGuildWar:requestEnterGuildWar(CopyMapID);
				?MapSubTypeSnowman ->
					playerGuildSnowman:enterTry(false);
%                ?MapSubTypeWeddingSite ->
%                    IsNormal =
%                        case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%                             #mapsettingCfg{type = ?MapTypeNormal} ->
%                                 playerState:getGroupID() =:= 0;
%                             _ ->
%                                 false
%                        end,
%                    if
%                        IsNormal =:= true ->
%                            playerMarriage:onMarriageWeddingEnter_Request(CopyMapID);
%                        true ->
%                            case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%                                #mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeWeddingSite} ->
%                                    playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_WS_AlreadyIn);
%                                _ ->
%                                    playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_WS_InvalidFrom)
%                            end
%                    end;
%%                ?MapSubTypeGuildExpedition ->
%%                    playerGuildExpedition:requestEnterMap(CopyMapID);
				_ ->
					playerScene:onRequestEnterActivityMap(CopyMapID, undefined)
			end;
		_ ->
			false
	end.

%% 离开副本
-spec leaveCopyMap() -> boolean().
leaveCopyMap() ->
	%% 跨场景，消除副本特殊事件中需要还原的事件影响
	playerCopyMap:restoreEvent(),

	case core:isCross() of
		false ->
			MapID = playerState:getMapID(),
			GroupID = playerState:getGroupID(),
			?INFO("leaveCopyMap ~p,~p,~p,~p", [MapID, playerState:getMapPid(), GroupID, playerState:getRoleID()]),
			playerConvoy:giveUpConvoy(),
			Ret = case groupBase:isInGroup(GroupID) of
				      true ->
					      %% 退出分组
					      playerBattleLearn:outBitMapBattleLearn(),

						  %% 如果在家族战地图，则再退出地图
						  case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
							  #mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeGuildBoss} -> true;
							  _ -> false
						  end;
				      _ ->
					      true
			      end,
			case Ret of
				true ->
					MapType = playerScene:getMapType(MapID),
					MapSubType = playerScene:getMapSubType(MapID),
					case MapType =:= ?MapTypeCopyMap orelse MapType =:= ?MapTypeActivity of
						true ->
							%% 停止移动
							playerMove:stopMove(true),

							if
								%%暗黑之地离开房间时强制设为和平模式 准备间本来就是和平模式不用强制转换
								MapSubType =:= ?MapSubTypeDarkness andalso MapType =:= ?MapTypeActivity  ->
									playerPk:tranState(?PlayerPeaceStatus);
								%%家族精英联赛离开房间时强制设为和平模式
								MapSubType =:= ?MapSubTypeGuildWar andalso MapType =:= ?MapTypeActivity  ->
									playerPk:tranState(?PlayerPeaceStatus);
								true ->
									skip
							end,

							%% 离开地图
							playerDarkness:playerLeaveMap(MapID),
							playerMaterialCopy:leaveCopyMap(MapID),
							%% 进入原来所在地图
							{OldMapID, OldX, OldY} =
								case MapSubType of
									?MapSubTypeGuildExpedition ->
										case playerGuildExpedition:getLeaveGuildExpeditionMap() of
											undefined ->
												playerState:getOldMapPos();
											GeRet ->
												GeRet
										end;
									_ ->
										playerState:getOldMapPos()
								end,

							?INFO("leaveCopyMap:roleid = ~p, curmapid = ~p, targetmapid = ~p", [playerState:getRoleID(), MapID, {OldMapID, OldX, OldY}]),

							playerScene:onRequestEnterMap(OldMapID, OldX, OldY),

							MapSubType = playerScene:getMapSubType(MapID),
							%%勇士试炼副本特殊处理
							case MapType =:= ?MapTypeCopyMap andalso MapSubType =:= ?MapSubTypeWarrior of
								true ->
									playerWarriorTrial:quitQuitMap();
								_ ->
									skip
							end,
							true;
						_ ->
							false
					end;
				_ ->
					true
			end;
		_ ->
			CallBack = playerState:getReturnCallBack(),
			playerState:setReturnCallBack(undefined),
			playerInterface:reqBackGS(CallBack),
			true
	end.

%%被踢了
-spec kickCopyMapPlayer() -> ok.
kickCopyMapPlayer() ->
	MapID = playerState:getMapIDGroup(),
	#mapsettingCfg{type = MapType, subtype = MapSubType, all_time = All_time, useVitality = UseVitality} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	CurHp = playerState:getCurHp(),
	?INFO("kickCopyMapPlayer:~p,~p,~p,~p",
		[MapID, playerState:getRoleID(), playerState:getMapPid(), CurHp]),
	case CurHp =< 0 of
		true ->
			case MapType =:= ?MapTypeBitplane andalso MapSubType =:= ?MapSubTypeBattleLearn of
				true ->
					playerRevive:requestRevive_BattleLearn();
				_ ->
					playerRevive:requestRevive_Unconditional()
			end,
			ok;
		_ ->
			skip
	end,

	case playerState:getIsPlayer() of
		true ->
			leaveCopyMap(),

			%% 记录副本日志
			case MapType of
				?MapTypeCopyMap ->
					if
						MapSubType =:= ?MapSubTypeNormal
							orelse MapSubType =:= ?MapSubTypeHeroCopy
							orelse MapSubType =:= ?MapSubTypeSlime
							orelse MapSubType =:= ?MapSubTypeChallengeCopy ->
							EndTime = misc_time:utc_seconds(),
							LogCopy = #rec_log_copy{
								accountID = playerState:getAccountID(),
								roleID = playerState:getRoleID(),
								copyMapType = MapSubType,            %%副本类型（剧情、英雄、挑战）
								copyMapID = MapID,
								startTime = EndTime - All_time,
								decrActionPoint = UseVitality,
								isPass = 0,                    %%是否通关 （0表示未通关  1表示通关）
								endTime = EndTime,
								goldReward = [],
								expReward = 0,
								dropItems = []
							},
							dbLog:sendSaveLogCopyInfo(LogCopy);
						true ->
							ok
					end;
				_ ->
					ok
			end;
		_ ->
			playerRob:sendToMeLRobPlayerExit(self(), playerState:getPlayerCode(), playerState:getRobRoleID())
	end,
	ok.

%% 重置副本
-spec resetCopyMap(CopyMapID) -> ok when CopyMapID :: uint().
resetCopyMap(CopyMapID) ->
	?INFO("Player[~ts] want to reset CopyMapID[~p]", [playerState:getName(), CopyMapID]),
	MapID = playerState:getMapID(),
	case playerScene:getMapType(MapID) of
		?MapTypeNormal ->
			%% 只能在普通地图重置
			case playerScene:getMapType(CopyMapID) of
				?MapTypeCopyMap ->
					RoleID = playerState:getRoleID(),
					TeamID = playerState:getTeamID(),
					core:sendMsgToMapMgr(CopyMapID, resetCopyMap, {RoleID, TeamID, CopyMapID});
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

-spec resetCopyMapAck(Arg) -> ok when
	Arg :: {true, CopyMapID} | {false, CopyMapID, ErrorCode} | Other, Other :: any(), CopyMapID :: mapId(), ErrorCode :: uint().
resetCopyMapAck({true, CopyMapID}) ->
	?INFO("player[~ts] reset CopyMapID[~p] ok", [playerState:getName(), CopyMapID]),
	%%playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapResetSuccess),
	playerMsg:sendNetMsg(#pk_GS2U_ResetCopyMap{copyMapID = CopyMapID}),
	ok;
resetCopyMapAck({false, CopyMapID, ErrorCode}) ->
	?INFO("player[~ts] reset CopyMapID[~p] failed by[~p]", [playerState:getName(), CopyMapID, ErrorCode]),
	playerMsg:sendErrorCodeMsg(ErrorCode),
	ok;
resetCopyMapAck(Other) ->
	?INFO("player[~ts] reset CopyMapID failed:~p", [playerState:getName(), Other]),
	ok.




%%家园位面发奖
onPassHomeBitMap(Hurt, MapID, MapPid,IsKill)->

	%% 隐藏可能放出的骑宠
	playerPet:petAutoHide(true),
	RoleID = playerState:getRoleID(),
	MyHomeID =
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = ID} ->
			ID;
		_->
			0
	end,
	case  homeInterface:queryHomeMap(playerState:getMapID(),MapPid) of
		#rec_home_map{homeID = {HomeID, _}} ->
			case homeInterface:queryHomeForHomeId(HomeID) of
				#rec_home{homeLvl = HomeLevel} ->
					#home_bossCfg{monsterid = MonsterID,
						reward1 = Reward1,reward2 = Reward2,
						reward3 = Reward3,reward4 = Reward4,
						assist1 = Assist1,assist2 = Assist2,
						assist3 = Assist3,assist4 = Assist4} = getCfg:getCfgPStack(cfg_home_boss, HomeLevel),
					RewardList = [Reward1,Reward2,Reward3,Reward4],
					AssistList = [Assist1,Assist2,Assist3,Assist4],
					#globalsetupCfg{setpara = Thief_phase} = getCfg:getCfgPStack(cfg_globalsetup, thief_phase),
					#monsterCfg{maxHP = MaxHp} = getCfg:getCfgByArgs(cfg_monster, MonsterID),
					Percentage =
						case IsKill of
							  true->100;
							_->
								erlang:trunc((Hurt/MaxHp)*100)
						end,
					SortPhase=lists:sort(Thief_phase),
					sendHomeBitReward(Percentage,SortPhase,MyHomeID,
						RewardList,AssistList,MapID,HomeID,HomeLevel,IsKill);
				_->
					skip
			end;
		_->
			skip
	end,
	ok.

sendHomeBitReward(Percentage,SortPhase,MyHomeID,RewardList,
	AssistList,MapID,HomeID,HomeLevel,IsKill)->
	F = fun(Value,Index)->
			case Percentage >= Value of
				true->Index+1;
				_->
					Index
			end
		end,
	case lists:foldl(F,0,SortPhase) of
		0->
			skip;
		Idx->
			Reward =
				case MyHomeID of
					HomeID ->
						case IsKill of
							  true->
								  Content = stringCfg:getString(thief_win_announce,[playerState:getName()]),
								  activityCommon:sendBroadcastNotice(Content);
							_->
								skip
						end,
						lists:nth(Idx,RewardList) ;
					_->
						lists:nth(Idx,AssistList)
				end,
			F1 = fun({ItemID,Num})->
				case ItemID >0 of
					true->rewardItem(ItemID,Num,MapID);
					_->
						rewardCoin(erlang:abs(ItemID),Num)
				end
			  end,
			lists:foreach(F1,Reward),
			Msg =  #pk_GS2U_HomeBitResult{homeID = HomeID,level = HomeLevel,phase = Idx},
			playerMsg:sendNetMsg(Msg)
	end,
	ok.

rewardItem(ItemID,Num,MapID)->
	Plog = #recPLogTSItem{
		old = 0,
		new = Num,
		change = Num,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_Home,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourceHomeBossRewardGet,
		reasonParam = MapID
	},
	playerPackage:addGoodsAndMail(ItemID, Num, true, 0, Plog),
	ok.
rewardCoin(MoneyType,Num)->
	PLog = #recPLogTSMoney{
		reason = ?CoinSourceHomeBoss,
		param = 0,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_Home
	},
	playerMoney:addCoin(MoneyType, Num, PLog),
	ok.

%% 副本通关
-spec onPassCopyMap(Score :: uint(), DiffTime :: uint(), CopyMapID :: uint()) -> ok.
onPassCopyMap(Score, DiffTime, CopyMapID) when erlang:is_integer(Score) ->
	SelfID = playerState:getRoleID(),
	IsAward = playerCopyMapReward:isRewardInCopyMap(CopyMapID),
	IsAwardReal =
		case playerBattle:canGainDropGoods(CopyMapID) of
			false when IsAward ->
				%% 属于三种子类地图，都是完成后才扣消耗
				case canEnterCopyMap2(CopyMapID, false) of
					true ->
						decResByEnterCopyMap(CopyMapID),
						true;
					ErrorCode ->
						%% 扣消耗失败，不发奖
						?ERROR("onPassCopyMap error roleID=~p, MapID=~p, ErrorCode=~p",
							[SelfID, CopyMapID, ErrorCode]),
						playerMsg:sendErrorCodeMsg(ErrorCode),
						false
				end;
			_ ->
				IsAward
		end,
	?INFO("onPassCopyMap:roleID=~p, score=~p, mapid=~p, IsAwardReal=~p",
		[SelfID, Score, CopyMapID, IsAwardReal]),

	case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{type = MapType, subtype = SubType} ->

			addCompleteCopyMapAchieve(CopyMapID, Score),
			case MapType of
				?MapTypeBitplane ->
					completeBitMap(Score, DiffTime, CopyMapID, SubType);
				?MapTypeCopyMap when IsAwardReal =:= true ->
					completeCopyMapHook(CopyMapID),
					%%更新完成副本的任务
					playerTask:updateTask(?TaskSubType_CopyMap, CopyMapID),
					case SubType of
						?MapSubTypeNormal ->
							playerliveness:onFinishLiveness(?LivenessNormalCopy, 1);
						?MapSubTypeHeroCopy ->
							playerliveness:onFinishLiveness(?LivenessHeroCopy, 1);
						?MapSubTypeSlime ->
							playerliveness:onFinishLiveness(?LivenessShiLaiMuActionPoint, 1);
						?MapSubTypeChallengeCopy ->
							playerliveness:onFinishLiveness(?LivenessChallageCopy, 1);
						% 金币副本只是一个假装自己是副本的活动，此处不会被执行到，请移驾playerCopyMapReward:onPassCopyMap_MoneyDungeon
						%?LivenessMoneyDungeon ->
						%    playerliveness:onFinishLiveness(?LivenessMoneyDungeon, 1);
%%						?MapSubTypeWorldBoss ->
%%							playerSevenDays:onMissionEvent(?SevenDayMission_Event_16, 1, ?MapSubTypeWorldBoss),
%%							playerliveness:onFinishLiveness(?LivenessArmyCopy, 1);
						?MapSubTypeExpCopyMap ->
							playerLogAdd:addLogParticipatorInfo(?LogParticipator_CompleteExpCopy),
							playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_LuoLi),
							playerliveness:onFinishLiveness(?LivenessExpCopyMap, 1);
						?MapSubTypeFestival ->
							playerLogAdd:addLogParticipatorInfo(?LogParticipator_OnPass_FestivalCopy);
						_ -> skip
					end,
					%%发送伤害通知地图，地图收集所有队友伤害后统一推动流程
					Hurt = playerState:getPlayerCopyMapStatHurt(),
					MsgToMap = {
						SelfID,
						Hurt,
						{
							tickdelay_completeNormalCopyMap,
							{
								[],
								{
									Score,
									DiffTime,
									CopyMapID,
									playerState:getMapPid(),
									SubType
								}
							}
						}
					},
					psMgr:sendMsg2PS(playerState:getMapPid(), teamStatHurt, MsgToMap);
				%gsTeamInterface:sendMsg2TeamWithRoleID(SelfID, teamStatHurt, {SelfID, Hurt}, true),
				%erlang:send_after(
				%    1000,
				%    self(),
				%    {tickdelay_completeNormalCopyMap, {Score, CopyMapID, SubType}}
				%);
				?MapTypeCopyMap when IsAwardReal =:= false ->
					%%更新完成副本的任务
					playerTask:updateTask(?TaskSubType_CopyMap, CopyMapID),
					case MapType of
						?MapSubTypeSlime ->
							playerliveness:onFinishLiveness(?LivenessShiLaiMuActionPoint, 1);
						_ ->
							skip
					end,
					%%发送伤害通知地图，地图收集所有队友伤害后统一推动流程
					Hurt = playerState:getPlayerCopyMapStatHurt(),
					MsgToMap = {
						SelfID,
						Hurt,
						{
							tickdelay_completeNormalCopyMap,
							{
								[],
								{
									Score,
									DiffTime,
									CopyMapID,
									playerState:getMapPid(),
									SubType
								}
							}
						}
					},
					psMgr:sendMsg2PS(playerState:getMapPid(), teamStatHurt, MsgToMap);
				%gsTeamInterface:sendMsg2TeamWithRoleID(SelfID, teamStatHurt, {SelfID, Hurt}, true),
				%erlang:send_after(
				%    1000,
				%    self(),
				%    {tickdelay_completeNormalCopyMap_not_award, {Score, CopyMapID, playerState:getMapPid(), SubType}}
				%);
				_ -> skip
			end;
		_ -> skip
	end,
	ok.


%%完成副本 成就增加
addCompleteCopyMapAchieve(CopyMapID, Score) ->

	case getCfg:getCfgByKey(cfg_dungeonschallenge, CopyMapID) of
		#dungeonschallengeCfg{time_1 = SupperScore} ->
			case SupperScore >= Score of
				true ->
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_1, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_2, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_3, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_4, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_5, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_6, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_7, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_8, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_9, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_10, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_11, [CopyMapID, 1]),
					playerAchieve:achieveEvent(?Achieve_perfectComPleteCopy_12, [CopyMapID, 1]);
				_ ->
					skip
			end;
		_ ->
			?WARN("getLowCopyMapReward MapID:~p is can not found from cfg_dungeonschallenge", [CopyMapID])
	end,
	ok.

%% 完成了一次普通副本
completeNormalCopyMap({ListHurt, {Score, DiffTime, CopyMapID, _MapPid, SubType}}) ->
	[playerStatistics:playerTeamCopyMapHurtStat(RoleID, Hurt) || {RoleID, Hurt} <- ListHurt],

	case SubType of
		%%?MapSubTypeDemonBattle ->
		%%	skip;  %%守护女神奖励没有展示
		?MapSubTypeMaterial ->
			skip;
		?MapSubTypeMoneyDungeon ->
			skip;
		?MapSubTypeSpiritArea ->
			skip;
		_ ->
			%% 发奖
			playerCopyMapReward:onPassCopyMap_Normal(Score, DiffTime, CopyMapID)
	end,

	playerAchieve:achieveEvent(?Achieve_CopyLiquidator, [1]),

	case core:isAssistCopyMapByCopyMapPID(playerState:getRoleID(), playerState:getMapPid()) of
		true ->
			skip;
		_ ->
			%% 通关副本后会+家族贡献, 现屏蔽, 留此记录
%%			playerGuild:addPlayerContribute(?GuildSupplies_CopyMap, CopyMapID)
			skip
	end,

	ok.

completeNormalCopyMap_Not_Reward({ListHurt, {Score, DiffTime, CopyMapID, MapPID, _SubType}}) ->
	playerSevenDays:onMissionEvent(?SevenDayMission_Event_5, 1, CopyMapID),
	R = #pk_GS2U_CopyMapResult{
		copyMapID = CopyMapID,
		second = Score,
		goldReward = 0,
		expReward = 0,
		dropItems = [],
		isAssist = core:isAssistCopyMapByCopyMapPID(playerState:getRoleID(), MapPID),
		festivalDrop = []
	},
	playerMsg:sendNetMsg(R),

	[playerStatistics:playerTeamCopyMapHurtStat(RoleID, Hurt) || {RoleID, Hurt} <- ListHurt],
	playerStatistics:sendCopyMapHurtToClient(),
	playerStatistics:clearCopyMapHurtStat(),


	%% 记录副本日志
	case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = Subtype, useVitality = UseVitality} ->
			if
				Subtype =:= ?MapSubTypeNormal
					orelse Subtype =:= ?MapSubTypeHeroCopy
					orelse Subtype =:= ?MapSubTypeSlime
					orelse Subtype =:= ?MapSubTypeChallengeCopy ->
					case core:isCross() of
						true ->
							playerState:setReturnCallBack({completeNormalCopyMap_Not_Reward_Cros, CopyMapID, Score, DiffTime});
						_ ->
							EndTime = misc_time:utc_seconds(),
							LogCopy = #rec_log_copy{
								accountID = playerState:getAccountID(),
								roleID = playerState:getRoleID(),
								copyMapType = Subtype,            %%副本类型（剧情、英雄、挑战）
								copyMapID = CopyMapID,
								startTime = EndTime - Score,
								decrActionPoint = UseVitality,
								isPass = 0,                    %%是否通关 （0表示未通关  1表示通关）
								endTime = EndTime,
								goldReward = [],
								expReward = 0,
								dropItems = []
							},
							dbLog:sendSaveLogCopyInfo(LogCopy)
					end;
				true -> ok
			end;
		_ -> ok
	end,
	ok.

%% 完成了一次位面
completeBitMap(Score, DiffTime, BitMapID, SubType) ->
	case SubType of
		?MapSubTypeRift -> completeBitMap_Rift(Score, BitMapID);
		_ ->
			%% 完成了一次普通位面(走完成副本发奖流程)
			playerCopyMapReward:onPassCopyMap_Normal(Score, DiffTime, BitMapID)
	end,

	%% 更新任务
%%	playerTask2:updateBitMapTask(BitMapID),
	playerTask:updateTask(?TaskSubType_MiniCopy, BitMapID),
	ok.

%% 完成了一次时空裂痕
completeBitMap_Rift(Score, CopyMapID) ->
	%% 完成了时空裂痕，重置时间
	playerAchieve:achieveEvent(?Achieve_RiftRestorers, [1]),

	%% 先发奖
	playerCopyMapReward:onPassCopyMap_Rift(Score, CopyMapID),

	%% 再设置完成了一次
	gsMainLogic:setEnterRiftTime(playerState:getRoleID(), 0),
	playerDaily:incDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Rift),
	ok.

%% 能否进入副本
%%-spec canEnterCopyMap(CopyMapID :: uint()) -> true | uint().
canEnterCopyMap(CopyMapID) ->
	canEnterCopyMap(CopyMapID, true).
canEnterCopyMap(CopyMapID, CheckTeam) ->
	case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap,subtype = SubType,if_single = 0} = MapCfg ->
			%% 不是单人本，在跨服
			case canEnterCopyMap_NotJudgeTimes(MapCfg) of
				true ->
					case canEnterCopyMap2(MapCfg, CheckTeam) of
						true ->
							case SubType of
								?MapSubTypeMaterial ->
									playerLogAdd:addLogParticipatorInfo(?LogParticipator_Material);
								?MapSubTypeDemonBattle ->
									playerLogAdd:addLogParticipatorInfo(?LogParticipator_Goddess);
								_ ->
									skip
							end,
							canEnterCopyMap3(MapCfg);
						V -> V
					end;
				ErrorCode ->
					ErrorCode
			end;
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = SubType} = MapCfg ->
			%% 是单人本，在本服，可能有断线重连
			%% （特别验证下金币副本/惊天喵盗团的后台开关）
			Continue =
				case SubType of
					?MapSubTypeMoneyDungeon ->
						variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_CoinBtn);
					_ ->
						true
				end,
			case Continue of
				false ->
					?ErrorCode_SystemNotOpen;
				_ ->
					case canEnterCopyMap_NotJudgeTimes(MapCfg) of
						true ->
							case canEnterCopyMap2(MapCfg, CheckTeam) of
								true ->
									true;
								ErrorCode2 ->
									%% 次数、体力等资源不足时，需要判断是否有已存在的地图，以便执行最后的断线重连
									RequestRec = #recRequsetEnterMap{teamID = 0, roleID = playerState:getRoleID(), targetMapID = CopyMapID, isFirstEnterMap = false},
									case psMgr:call(?PSNameCopyMapMgr, requestEnterMap_ByDirect, RequestRec, 5000) of
										{ok, true} ->
											true;
										_ ->
											ErrorCode2
									end
							end;
						ErrorCode ->
							ErrorCode
					end
			end;
		_ ->
			%%进入位面的时候客户端也会向服务器发送进入副本请求
			true
	end.

%% 这里就只判断了助战，体力与次数
canEnterCopyMap2(
	#mapsettingCfg{
		type = ?MapTypeCopyMap,
		id = CopyMapID,
		useVitality = UseVitality} = MapCfg, CheckTeam) ->
	Can =
		case core:isSingleCopyMap(CopyMapID) of
			false when CheckTeam ->
				playerState:getTeamID() > 0;
			_ ->
				true
		end,

	case Can of
		true ->
			case playerTeamCopyMap:isAssistCopyMapByCopyMapID(playerState:getRoleID(), CopyMapID) of
				false ->
					IsEnoughActivePoint = playerActionPoint:getActionPoint() >= UseVitality,
					%% 判断进入次数
					case checkEnterCopyMapDailyCount(MapCfg) of
						{true, _} when IsEnoughActivePoint =:= true ->
							true;
						{true, _} when IsEnoughActivePoint =:= false ->
							?ErrorCode_ActionPointNotEnough;
						{false, ErrorCode2} ->
							ErrorCode2;
						_ ->
							?ErrorCode_System_Error_Unknow
					end;
				_ ->
					%% 助战不判断体力与次数
					true
			end;
		_ ->
			?ErrorCode_NeedTeamEnterCopyMap
	end;
canEnterCopyMap2(CopyMapID, CheckTeam) ->
	case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap} = MapCfg ->
			canEnterCopyMap2(MapCfg, CheckTeam);
		_ ->
			%%进入位面的时候客户端也会向服务器发送进入副本请求
			true
	end.

%% 能否进入副本，不判断进入次数
-spec canEnterCopyMap_NotJudgeTimes(CopyMapID :: uint()) -> true | uint().
canEnterCopyMap_NotJudgeTimes(CopyMapID) when is_integer(CopyMapID) ->
	MapCfg = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),
	canEnterCopyMap_NotJudgeTimes(MapCfg);
canEnterCopyMap_NotJudgeTimes(#mapsettingCfg{type = ?MapTypeCopyMap, maxnum = MaxNum, id = CopyMapID,
	playerEnter_MinLevel = MinLevel, playerEnter_MaxLevel = MaxLevel}) ->
	TeamID = playerState:getTeamID(),
	case TeamID > 0 andalso MaxNum =< 1 of
		true ->
			%% 请退队挑战单人本
			?ErrorCode_CopyMap_OnePlayer_LeaveTeam;
		_ ->
			RoleID = playerState:getRoleID(),
			case checkEnterCopyMapStatus() of
				true ->
					case checkEnterCopyMapLevel(MinLevel, MaxLevel) of
						true ->
							true;
						ErrorCode2 ->
							?ERROR("player:~p ,CopyMapID:~p, canEnterCopyMap2 failed:~p", [RoleID, CopyMapID, ErrorCode2]),
							ErrorCode2
					end;
				ErrorCode ->
					?ERROR("player:~p ,CopyMapID:~p, canEnterCopyMap2 failed:~p", [RoleID, CopyMapID, ErrorCode]),
					ErrorCode
			end
	end.


%% 进入副本状态判定
-spec checkEnterCopyMapStatus() -> true | errorCode.
checkEnterCopyMapStatus() ->
	case playerState:getCurHp() > 0 of
		true ->
			true;
		_ ->
			%% 死亡状态不能进入副本
			?ErrorCode_CopyMapStatusError
	end.

%% 进入副本等级判定
-spec checkEnterCopyMapLevel(Min, Max) -> true | errorCode when
	Min :: uint(), Max :: uint().
checkEnterCopyMapLevel(Min, Max)
	when is_integer(Min) andalso Min > 0 andalso is_integer(Max) andalso Max > 0 andalso Max >= Min ->
	Level = playerState:getLevel(),
	case Level >= Min andalso Level =< Max of
		true ->
			true;
		_ ->
			?ErrorCode_CopyMapLevelLimit
	end;
checkEnterCopyMapLevel(_Min, _Max) ->
	erlang:error(badmapconfig).

%% 获取进入副本的次数
-spec getEnterCopyMapCount(CopyMapID :: uint32()) -> uint32().
getEnterCopyMapCount(CopyMapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, daily_entercount = MaxCount, daily_entercount_group = V} when V =:= 0 ->
			DailyCount = playerDaily:getDailyCounter(?DailyType_EnterCopyMap, CopyMapID),
			BuyCount = playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID),
			YHTimes = playerVipInter:getVipEffect(?RepEvent_CopyMapTimes, {CopyMapID}),
			HATimes = playerDaily:getDailyCounter(?DailyType_EnterCopyMap_Vip, CopyMapID),
			MaxCount + BuyCount + YHTimes - HATimes - DailyCount;
		#mapsettingCfg{type = ?MapTypeCopyMap, daily_entercount = MaxCount, daily_entercount_group = V} ->
			DailyCount = playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, V),
			BuyCount = playerDaily:getDailyCounter(?DailyType_BuyCopyMapGroup_Number, V),
			YHTimes = playerVipInter:getVipEffect(?RepEvent_CopyMapTimes, {CopyMapID}),
			HATimes = playerDaily:getDailyCounter(?DailyType_EnterCopyMap_Vip_Group, V),
			MaxCount + BuyCount + YHTimes - HATimes - DailyCount;
		_ ->
			0
	end.

incEnterCopyMapGroupDailyCount(CopyMapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, daily_entercount_group = V} when V =:= 0 ->
			ok;
		#mapsettingCfg{type = ?MapTypeCopyMap, daily_entercount_group = V} ->
			playerDaily:incDailyCounter(?DailyType_EnterCopyMapGroup, V);
		_ -> ok
	end.

decEnterCopyMapGroupDailyCount(CopyMapID, RewardNum) ->
	case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, daily_entercount_group = V} when V =:= 0 ->
			ok;
		#mapsettingCfg{type = ?MapTypeCopyMap} -> %, daily_entercount_group = V} ->
			case playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, CopyMapID) of
				0 ->
					skip;
%%                V when RewardNum >= V ->
%%                    playerDaily:reduceDailyCounter(?DailyType_EnterCopyMapGroup, CopyMapID,V);
				_ ->
					playerDaily:reduceDailyCounter(?DailyType_EnterCopyMapGroup, CopyMapID, RewardNum)
			end;
		_ -> ok
	end.

%%% 进入副本条件判定
%%%TODO HERE 指定物品进入副本条件判定
%-spec checkEnterCopyMapCondition(CondType :: uint(), Arg :: uint()) -> true | ErrorCode when
%	ErrorCode :: uint().
%checkEnterCopyMapCondition(?CopyMapEnterCond_Task, Arg) ->
%	case playerTask:isSubmittedTaskByID(Arg) of
%		true ->
%			true;
%		_ ->
%			?ErrorCode_CopyMapNoTaskCond
%	end;
%checkEnterCopyMapCondition(?CopyMapEnterCond_Item, _Arg) ->
%	?ErrorCode_CopyMapNoItemCond;
%checkEnterCopyMapCondition(_CodeType, _Arg) ->
%	?ERROR("Error Map Config"),
%	?ErrorCode_SystemErrorMapCfg.

%% 添加副本掉落物品列表
-spec addCopyMapDropList(List :: [#rec_item{}, ...] | [#recSaveEquip{}, ...]) -> ok.
addCopyMapDropList(List) ->
	NMapID = playerState:getMapIDGroup(),
	case playerScene:getMapType(NMapID) of
		?MapTypeCopyMap ->
			NMapPID = playerState:getMapPid(),
			%% 新加的列表
			Fun = fun(Goods, AccList) ->
				GoodsCache = makeCopyMapDropItem(Goods),
				[GoodsCache | AccList]
			      end,

			NList = case playerPropSync:getProp(?SerProp_CopyMapDropItems) of
				        {MapPID, MapID, ItemList} ->
					        case NMapPID =:= MapPID andalso NMapID =:= MapID of
						        true ->
							        %% 追加
							        lists:foldl(Fun, ItemList, List);
						        false ->
							        %% 新的副本或者分组了
							        lists:foldl(Fun, [], List)
					        end;
				        _ ->
					        %% 原来没有记录
					        lists:foldl(Fun, [], List)
			        end,
%%			?DEBUG("addCopyMapDropList:~s,~p,~p", [playerState:getName(),List,NList]),
			playerPropSync:setAny(?SerProp_CopyMapDropItems, {NMapPID, NMapID, NList}),

			case playerScene:getMapSubType(NMapID) of
				?MapSubTypeMaterial ->
					playerMaterialCopy:copyMapDropList(NMapPID, NMapID, NList);
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	ok.

%% 获取副本物品掉落列表
-spec getCopyMapDropList() -> list().
getCopyMapDropList() ->
	NMapID = playerState:getMapIDGroup(),
	case playerScene:getMapType(NMapID) of
		?MapTypeCopyMap ->
			NMapPID = playerState:getMapPid(),
			case playerPropSync:getProp(?SerProp_CopyMapDropItems) of
				{MapPID, MapID, ItemList} when NMapPID =:= MapPID andalso NMapID =:= MapID ->
					%% 合并道具，注意，是合并道具！不是装备
					FunH = fun(#pk_CopyMapDropItem{itemID = ItemID, isBind = Bind, number = Number} = Item, AccList) ->
						case ItemID >= ?Item_Differentiate of
							true ->
								%% 装备不需要叠加
								[Item | AccList];
							_ ->
								{III, LAST} = splitWithByIDAndBind(AccList, ItemID, Bind),
								case III of
									[#pk_CopyMapDropItem{number = Num} = TTT] ->
										[TTT#pk_CopyMapDropItem{number = Number + Num} | LAST];
									_ ->
										[Item | AccList]
								end
						end
					       end,
					LL = lists:foldl(FunH, [], ItemList),
%% 					?DEBUG("AAAAAAA:~p,~p", [ItemList, LL]),
					%% 按品质排序
					FunS = fun(#pk_CopyMapDropItem{itemID = I1, quality = Q1},
						#pk_CopyMapDropItem{itemID = I2, quality = Q2}) ->
						if
							I1 > I2 ->
								true;
							Q1 > Q2 ->
								true;
							true ->
								false
						end
					       end,
					lists:sort(FunS, LL);
				_ ->
					[]
			end;
		_ ->
			[]
	end.

splitWithByIDAndBind([], _ID, _Bind) ->
	{[], []};
splitWithByIDAndBind(List, ID, Bind) ->
	Fun = fun(#pk_CopyMapDropItem{itemID = ItemID, isBind = BI}) ->
		ID =:= ItemID andalso Bind =:= BI
	      end,
	L1 = lists:filter(Fun, List),
	L2 = lists:subtract(List, L1),
	{L1, L2}.

makeCopyMapDropItem(Goods) ->
	case Goods of
		#rec_item{} = Item ->
			#pk_CopyMapDropItem{
				itemUID = Item#rec_item.itemUID,
				itemID = Item#rec_item.itemID,
				number = Item#rec_item.pileNum,
				quality = Item#rec_item.quality,
				isBind = getBind(Item#rec_item.isBind)
			};
		#recSaveEquip{} = Equip ->
			#pk_CopyMapDropItem{
				itemUID = Equip#recSaveEquip.itemUID,
				itemID = Equip#recSaveEquip.itemID,
				number = 1,
				quality = Equip#recSaveEquip.quality,
				isBind = getBind(Equip#recSaveEquip.isBind)
			}
	end.

%% 返回bool型的绑定状态
getBind(Value) ->
	case Value of
		true ->
			true;
		false ->
			false;
		1 ->
			true;
		0 ->
			false
	end.

%%%-------------------------------------------------------------------
%% 尝试触发副本特殊事件
-spec tryDoEvent({Condition :: list(), Event :: term(), {InitOrSettle :: boolean(), ScheduleID :: uint32()}}) -> ok.
tryDoEvent({Condition, Event, ConfigKey} = _Data) ->
	?DEBUG("[DebugForSpecEvent] tryDoEvent ~p", [_Data]),
	case tryDoEvent_C1(Condition, true) of
		true ->
			case tryDoEvent_E(Event, tryDoEvent_Cfg(ConfigKey)) of
				true ->
					tryDoEvent_Notice(Event, ConfigKey);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
%% 尝试触发副本特殊事件_条件检测_遍历
-spec tryDoEvent_C1(Condition :: list(), Acc :: boolean()) -> boolean().
tryDoEvent_C1(_, false) ->
	false;
tryDoEvent_C1([], Acc) ->
	Acc;
tryDoEvent_C1([H | T], _) ->
	tryDoEvent_C1(T, tryDoEvent_C2(H)).

%%%-------------------------------------------------------------------
%% 尝试触发副本特殊事件_条件检测_检测
-spec tryDoEvent_C2(ConditionCell :: term()) -> boolean().
tryDoEvent_C2({?CopyMapSpecEventCondition_Allow}) ->
	true;    %% 无条件通过
tryDoEvent_C2({?CopyMapSpecEventCondition_EnterCount}) ->
	%% 副本最高分为0表示没有完成过该副本
	MapID = playerState:getMapID(),
	playerCopyMapReward:getCopyMapMaxScore(MapID) =:= 0;
tryDoEvent_C2({?CopyMapSpecEventCondition_HpLess, IsPercent, Value}) ->
	HpCur = playerState:getCurHp(),
	case misc:i2b(IsPercent) of
		true ->
			%% 百分比
			HpMax = playerState:getMaxHp(),
			Value >= HpCur / HpMax;
		_ ->
			%% 绝对值
			Value >= HpCur
	end;
tryDoEvent_C2(Unknown) ->
	?ERROR("tryDoEvent_C2 Unknown:~p", [Unknown]),
	false.

%%%-------------------------------------------------------------------
%% 尝试触发副本特殊事件_获取事件参数
-spec tryDoEvent_Cfg({InitOrSettle :: boolean(), ScheduleID :: uint32()}) -> list().
tryDoEvent_Cfg({true, ScheduleID}) ->
	#copymapScheduleInitCfg{eventParam1 = EP1, eventParam2 = EP2, eventParam3 = EP3} =
		getCfg:getCfgPStack(cfg_copymapScheduleInit, ScheduleID),
	[EP1, EP2, EP3];
tryDoEvent_Cfg({false, ScheduleID}) ->
	#copymapScheduleInitCfg{eventParam1 = EP1, eventParam2 = EP2, eventParam3 = EP3} =
		getCfg:getCfgPStack(cfg_copymapScheduleSettle, ScheduleID),
	[EP1, EP2, EP3].

%%%-------------------------------------------------------------------
%% 尝试触发副本特殊事件_执行事件
-spec tryDoEvent_E(Event :: term(), EPS :: list()) -> boolean().
tryDoEvent_E([?CopyMapSpecEvent_TempSkillForWake], [ListSkill | _]) ->
	Career = playerState:getCareer(),
	case lists:keyfind(Career, 1, ListSkill) of
		{_, SkillID} ->
			%% 临时添加技能
			playerSkill:addSysSkill(SkillID, 1),
			%% 这个事件需要还原，记录一下
			List = playerPropSync:getProp(?SerProp_CopyMapSpecEventTemp),
			playerPropSync:setAny(?SerProp_CopyMapSpecEventTemp, [{?CopyMapSpecEvent_TempSkillForWake, SkillID} | List]),
			true;
		_ ->
			?ERROR("tryDoEvent_E can not find Skill from cfg_globalsetup.specEvent_1_skillID:~p by Career:~p", [ListSkill, Career]),
			false
	end;
tryDoEvent_E([?CopyMapSpecEvent_TempSkillForGod], [[{SkillID}] | _]) ->
	?INFO(
		"[DebugForCopyMap] tryDoEvent_E ?CopyMapSpecEvent_TempSkillForGod~nRoleID:~p MapID:~p",
		[playerState:getRoleID(), playerState:getMapID()]
	),
	%% 临时添加技能
	playerSkill:addSysSkill(SkillID, 1),
	%% 这个事件需要还原，记录一下
	List = playerPropSync:getProp(?SerProp_CopyMapSpecEventTemp),
	playerPropSync:setAny(?SerProp_CopyMapSpecEventTemp, [{?CopyMapSpecEvent_TempSkillForGod, SkillID} | List]);
tryDoEvent_E(Unknown, _) ->
	?ERROR("tryDoEvent_E Unknown:~p", [Unknown]),
	false.

%%%-------------------------------------------------------------------
%% 尝试触发副本特殊事件_执行事件_通知客户端
-spec tryDoEvent_Notice(list(), {InitOrSettle :: boolean(), ScheduleID :: uint32()}) -> ok.
tryDoEvent_Notice([ID | _], {InitOrSettle, ScheduleID}) ->
	?INFO(
		"[DebugForCopyMap] tryDoEvent_Notice~nRoleID:~p MapID:~p ID:~p Param:~p",
		[playerState:getRoleID(), playerState:getMapID(), ID, {InitOrSettle, ScheduleID}]
	),
	playerMsg:sendNetMsg(
		#pk_GS2U_SpecificEvent_Sync{
			eventID = ID,
			initOrSettle = InitOrSettle,
			scheduleID = ScheduleID
		}
	).

%%%-------------------------------------------------------------------
%% 还原已触发的事件（如果需要还原的话）
-spec restoreEvent() -> ok.
restoreEvent() ->
	List = playerPropSync:getProp(?SerProp_CopyMapSpecEventTemp),
	?DEBUG("[DebugForSpecEvent] restoreEvent ~p", [List]),
	restoreEvent_R(List),
	playerPropSync:setAny(?SerProp_CopyMapSpecEventTemp, []),
	ok.

%%%-------------------------------------------------------------------
%% 还原已触发的事件（如果需要还原的话）_遍历
-spec restoreEvent_R(list()) -> ok.
restoreEvent_R([]) ->
	ok;
restoreEvent_R([H | T]) ->
	restoreEvent_C(H),
	restoreEvent_R(T).

%%%-------------------------------------------------------------------
%% 还原已触发的事件（如果需要还原的话）_还原
-spec restoreEvent_C(type_copyMapSpecEvent()) -> ok.
restoreEvent_C({?CopyMapSpecEvent_TempSkillForWake, SkillID}) ->
	playerSkill:delSysSkill(SkillID),
	ok;
restoreEvent_C({?CopyMapSpecEvent_TempSkillForGod, SkillID}) ->
	playerSkill:delSysSkill(SkillID),
	ok;
restoreEvent_C(Unknown) ->
	?ERROR("restoreEvent_C Unknown:~p", [Unknown]),
	ok.

playAnimationOver(AN) ->
	GroupID = playerState:getGroupID(),
	MapID = playerState:getMapID(),
	case playerScene:getMapType(MapID) of
		?MapTypeCopyMap ->
			psMgr:sendMsg2PS(playerState:getMapPid(), animationPlayOver, {GroupID, AN});
		?MapTypeBitplane ->
			psMgr:sendMsg2PS(playerState:getMapPid(), animationPlayOver, {GroupID, AN});
		_ when GroupID > 0 ->
			psMgr:sendMsg2PS(playerState:getMapPid(), animationPlayOver, {GroupID, AN});
		_ ->
			skip
	end.

show2(MapID, Show2ID, GroupID, ScheduleID, IsInit) ->
	case playerState:getMapID() of
		MapID ->
			case playerState:getGroupID() of
				GroupID ->
					?DEBUG("[DebugForShow2] show2/4 hit MapID:~w Show2ID:~w GroupID:~w ScheduleID:~w IsInit:~w", [MapID, Show2ID, GroupID, ScheduleID, IsInit]),
					psMgr:sendMsg2PS(playerState:getMapPid(), show2, {GroupID, ScheduleID, Show2ID, IsInit});
				_ ->
					?DEBUG("[DebugForShow2] show2/4 skip MapID:~w Show2ID:~w GroupID:~w ScheduleID:~w IsInit:~w", [MapID, Show2ID, GroupID, ScheduleID, IsInit]),
					skip
			end;
		_ ->
			?DEBUG("[DebugForShow2] show2/4 skip MapID:~w Show2ID:~w GroupID:~w ScheduleID:~w IsInit:~w", [MapID, Show2ID, GroupID, ScheduleID, IsInit]),
			skip
	end,
	ok.


%%% --------------------------------------------------------------------
%% 采集成功
-spec gatherSuccessCopyBuff(GatherID :: uint32()) -> ok.
gatherSuccessCopyBuff(GatherID) ->
	case getCfg:getCfgByKey(cfg_object, GatherID) of
		#objectCfg{type = ?GatherType_CopyBuff, param1 = BuffData} ->
			case BuffData of
				{BuffID, BuffLevel} when
					erlang:is_integer(BuffID), BuffID > 0,
					erlang:is_integer(BuffLevel), BuffLevel > 0 ->
					playerBuff:addBuff(BuffID, BuffLevel);
				BuffID when
					erlang:is_integer(BuffID), BuffID > 0 ->
					playerBuff:addBuff(BuffID, 1);
				_ ->
					?ERROR("invalid param1:~w with cfg_object.id=~w", [BuffData, GatherID])
			end;
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
%% 副本进入次数判断
-spec checkEnterCopyMapDailyCount(Map) -> {boolean(), term()} when
	Map :: MapID | MapCfg,
	MapID :: uint16(),
	MapCfg :: #mapsettingCfg{}.
%% 不从属于地图组
checkEnterCopyMapDailyCount(#mapsettingCfg{id = MapID, daily_entercount_group = 0, type = Type, daily_entercount = DayCount}) ->
	YHTimes = playerVipInter:getVipEffect(?RepEvent_CopyMapTimes, {MapID}),
	HATimes = playerDaily:getDailyCounter(?DailyType_EnterCopyMap_Vip, MapID),
	HasIn = playerDaily:getDailyCounter(?DailyType_EnterCopyMap, MapID),
	BuyCount = playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, MapID),
	case YHTimes > HATimes of
		true ->
			{true, {vip, MapID}};
		_ when (Type =:= ?MapTypeCopyMap orelse Type =:= ?MapTypeActivity), DayCount > 0 ->
			case HasIn >= DayCount + BuyCount of
				true ->
%%                    ?DEBUG("[DebugForCopyMap] ErrorCode_CopyMapCountLimit~n~p", [misc:getStackTrace()]),
					{false, ?ErrorCode_CopyMapCountLimit};    %% 次数不足
				false ->
					{true, {normal, MapID}}
			end;
		_ ->
			{true, {normal, MapID}}
	end;
%% 从属于地图组
checkEnterCopyMapDailyCount(#mapsettingCfg{id = MapID, daily_entercount_group = MapGroup, type = Type, daily_entercount = DayCount}) ->
	YHTimes = playerVipInter:getVipEffect(?RepEvent_CopyMapTimes, {MapID}),
	HATimes = playerDaily:getDailyCounter(?DailyType_EnterCopyMap_Vip_Group, MapGroup),
	HasIn = playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, MapGroup),
	BuyCount = playerDaily:getDailyCounter(?DailyType_BuyCopyMapGroup_Number, MapGroup),
	case YHTimes > HATimes of
		true ->
			{true, {vip, MapID, MapGroup}};
		_ when (Type =:= ?MapTypeCopyMap orelse Type =:= ?MapTypeActivity), DayCount > 0 ->
			case HasIn >= DayCount + BuyCount of
				true ->
%%                    ?DEBUG("[DebugForCopyMap] ErrorCode_CopyMapCountLimit~n~p", [misc:getStackTrace()]),
					{false, ?ErrorCode_CopyMapCountLimit};    %% 次数不足
				false ->
					{true, {normal, MapID}}
			end;
		_ ->
			{true, {normal, MapID}}
	end;
%% 只是个地图ID
checkEnterCopyMapDailyCount(MapID) ->
	#mapsettingCfg{} = MapCfg = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	checkEnterCopyMapDailyCount(MapCfg).

%%% --------------------------------------------------------------------
%% 副本进入次数判断可选后续处理
-spec afterCheckEnterCopyMapDailyCount({boolean(), term()}) -> no_return().
afterCheckEnterCopyMapDailyCount({false, _}) ->
	%% 次数不足，返回原图
	{OldMapID, _OldX, _OldY} = playerState:getOldMapPos(),
	?ERROR("enter count limit reEnterMap roleid:~p,oldMapID:~p",
		[playerState:getRoleID(), OldMapID]),
	erlang:send_after(10000, self(), {goMap, OldMapID});
afterCheckEnterCopyMapDailyCount({true, {normal, MapID}}) ->
	playerDaily:incDailyCounter(?DailyType_EnterCopyMap, MapID),                %% 计入普通次数
	incEnterCopyMapGroupDailyCount(MapID);                                        %% 计入普通次数（组）
afterCheckEnterCopyMapDailyCount({true, {vip, MapID}}) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_EnterCopyMapReputationNotJiShu),        %% 系统提示
	%playerChat:onSystemChatMsg(stringCfg:getString(vipReputationTimesTips)),	%% 系统频道提示
	playerDaily:incDailyCounter(?DailyType_EnterCopyMap_Vip, MapID);            %% 计入爵位优惠次数
afterCheckEnterCopyMapDailyCount({true, {vip, MapID, MapGroup}}) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_EnterCopyMapReputationNotJiShu),        %% 系统提示
	%playerChat:onSystemChatMsg(stringCfg:getString(vipReputationTimesTips)),	%% 系统频道提示
	playerDaily:incDailyCounter(?DailyType_EnterCopyMap_Vip, MapID),            %% 计入爵位优惠次数
	playerDaily:incDailyCounter(?DailyType_EnterCopyMap_Vip_Group, MapGroup).    %% 计入爵位优惠次数（组）

%%% --------------------------------------------------------------------
canEnterCopyMap3(#mapsettingCfg{
	type = ?MapTypeCopyMap,
	subtype = ?MapSubTypeChallengeCopy,
	instance_group = InstanceGroup,
	difficulty = Difficulty,
	rank = MapStar
}) when  Difficulty =:= ?MapDifficulty_Devil ->
	CurStar = get_devil_copy_pass_star(InstanceGroup),
	case CurStar + 1 >= MapStar of
		true -> true;
		_ -> ?ErrorCode_PlayerNotBelongCopyMap
	end;
canEnterCopyMap3(_) -> true.

%%% --------------------------------------------------------------------
setDevilCopyPassStar(CopyMapID) ->
	case getCfg:getCfgByArgs(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{
			type = ?MapTypeCopyMap,
			subtype = ?MapSubTypeChallengeCopy,
			instance_group = InstanceGroup,
			difficulty = Difficulty,
			rank = MapStar
		} when InstanceGroup > 0 andalso  Difficulty =:= ?MapDifficulty_Devil  ->
			PassStar = get_devil_copy_pass_star(InstanceGroup),
			case MapStar > PassStar of
				true ->
					L1 = getDevilCopyMapStarList(),
					L2 = lists:keystore(
						InstanceGroup,
						#recDevilCopyStar.instance_group,
						L1, #recDevilCopyStar{instance_group = InstanceGroup, pass_star = MapStar}),
					setDevilCopyMapStarList(L2),
					sendUpdateDevilCopyStarNetMsg(InstanceGroup, MapStar),
					ok;
				_ -> skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
getDevilCopyMapStarList() ->
	playerPropSync:getProp(?SerProp_CopyMapDevilStar).

setDevilCopyMapStarList(CopyMapStarList) ->
	playerPropSync:setAny(?SerProp_CopyMapDevilStar, CopyMapStarList),
	ok.

%%% --------------------------------------------------------------------
onPassCopyMapDevil(CopyMapID) ->
	setDevilCopyPassStar(CopyMapID),
	ok.

%%% --------------------------------------------------------------------
canRewardUserOnPassCopyMap(CopyMapID) ->
	case getCfg:getCfgByArgs(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{
			type = ?MapTypeCopyMap,
			subtype = ?MapSubTypeChallengeCopy,
			instance_group = InstanceGroup,
			difficulty = Difficulty,
			rank = MapStar
		} when Difficulty =:= ?MapDifficulty_Devil ->
			CurStar = get_devil_copy_pass_star(InstanceGroup),
			CurStar >= 0 andalso MapStar > CurStar;
		_ -> true
	end.

%%% --------------------------------------------------------------------
get_devil_copy_pass_star_by_map_id(0) ->
	get_devil_copy_pass_star(0);
get_devil_copy_pass_star_by_map_id(CopyMapID) ->
	case getCfg:getCfgByArgs(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{
			type = ?MapTypeCopyMap,
			subtype = ?MapSubTypeChallengeCopy,
			difficulty = Difficulty,
			instance_group = InstanceGroup
		} when Difficulty =:= ?MapDifficulty_Devil ->
			get_devil_copy_pass_star(InstanceGroup);
		_ ->
			get_devil_copy_pass_star(0)
	end.

get_devil_copy_pass_star(0) ->
	-10;
get_devil_copy_pass_star(InstanceGroup) ->
	L = getDevilCopyMapStarList(),
	case lists:keyfind(InstanceGroup, #recDevilCopyStar.instance_group, L) of
		#recDevilCopyStar{pass_star = Star} -> Star;
		_ -> 0
	end.

%%% --------------------------------------------------------------------
sendUpdateDevilCopyStarNetMsg(InstanceGroup, MapStar) ->
	playerMsg:sendNetMsg(#pk_GS2U_UpdateDevilCopyMapStar{
		starInfo = #pk_DevilCopyMapStarInfo{
			instanceGroup = InstanceGroup,
			star = MapStar
		}
	}),
	ok.

sendInitDevilMapStartList() ->
	L1 = getDevilCopyMapStarList(),
	L2 = lists:map(
		fun(#recDevilCopyStar{instance_group = IG, pass_star = Star}) ->
			#pk_DevilCopyMapStarInfo{instanceGroup = IG, star = Star}
		end, L1),
	playerMsg:sendNetMsg(#pk_GS2U_DevilCopyMapStarList{starList = L2}),
	ok.

%%% --------------------------------------------------------------------
-define(RankLimit, 100).
-define(ClientLimit, 10).
queryCopyRankList(InstanceGroupID) ->
	L1 = ets:match_object(?CopyRankEts,
		#recMapRankInfo{instanceGroupID = InstanceGroupID, _ = '_'}),
	L2 = lists:keysort(#recMapRankInfo.star, L1),
	L3 = lists:reverse(L2),
	L4 = getTopN(L3, [], ?ClientLimit),
	Msg = #pk_GS2U_DevilCopyMapRankList{
		instanceGroup = InstanceGroupID,
		rankList = lists:reverse(L4)
	},
	?DEBUG("~p",[Msg]),
	playerMsg:sendNetMsg(Msg),
	ok.

getTopN([], Res, _N) ->
	Res;
getTopN(
	[#recMapRankInfo{teamList = TL} = RankInfo | RankList]
	, Res, N
) when N > 0 ->
	NetRankInfo = marshalRankInfo(RankInfo),
	getTopN(RankList, [NetRankInfo | Res], N - erlang:length(TL));
getTopN(_RankList, Res, _N) ->
	Res.

marshalRankInfo(#recMapRankInfo{
	copyMapID = CopyMap,
	star = Star,
	teamList = TL
}) ->
	%% 存的是反序的
%%	TeamLen = erlang:length(TL),
	TeamList1 = [marshalRankTeamInfo(TeamInfo) || TeamInfo <- TL],
	%% 设置排名
%%	{TeamList2, _} =
%%		lists:foldl(
%%			fun(NetRankTeamInfo, {Acc, N}) ->
%%				NewNetRankTeamInfo = NetRankTeamInfo#pk_CopyRankTeamInfo{rankPos = N},
%%				{[NewNetRankTeamInfo | Acc], N - 1}
%%			end, {[], TeamLen}, TeamList1),
	
	#pk_CopyMapRankInfo{
		copyMapID = CopyMap,
		star = Star,
		teamList = lists:reverse(TeamList1)
	}.

marshalRankTeamInfo(#recMapRankTeamInfo{
	leader = Leader,
	diffTime = DiffTime,
	time = Time,
	members = ML
}) ->
	#pk_CopyRankTeamInfo{
		diffTime = DiffTime,
		time = Time + time2:getTimezoneSec(),
		rankPos = 0,
		leader = marshalRankTeamMemberInfo(Leader),
		membersList = [marshalRankTeamMemberInfo(MemberID) || MemberID <- ML]
	}.

marshalRankTeamMemberInfo(RoleID) ->
	#pk_CopyRankTeamMemberInfo{
		roleID = RoleID,
		roleName = core:queryRoleNameByRoleID(RoleID)
	}.


