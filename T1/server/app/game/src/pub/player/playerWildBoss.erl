%%
%% @author chengxs
%%野外boss系统

-module(playerWildBoss).
-author(chengxs).
-include("gsInc.hrl").
-include("playerPrivate.hrl").

-define(DailySubType_WildBossEveryDayTotal,1).


%% ====================================================================
%% API functions
%% ====================================================================
-export([
	sendWildBossInfo/0,
	wildBossChangeTarget/2,
	playerDead/1,
	wildBossDead/8,
	isInWildBoss/0,
%%	changeBuffState/1,
	queryMapBoss/1,
	queryMapBossAck/1
]).

%% ====================================================================
queryMapBoss(Code)->
	MapPid = playerState:getMapPid(),
	MonsterEts = playerState:getMapMonsterEts(),
	case myEts:readRecord(MonsterEts, Code) of
		#recMapObject{id = DataID} ->
			case getCfg:getCfgByArgs(cfg_monster, DataID) of
				#monsterCfg{monsterSubType = ?MonsterSTypeMapBoss} ->
					psMgr:sendMsg2PS(MapPid, queryMapBoss, {Code, DataID});
				#monsterCfg{monsterSubType = ?MonsterSTypeWildBoss} ->
					psMgr:sendMsg2PS(MapPid, queryMapBoss, {Code, DataID});
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

queryMapBossAck({undefined, Data}) ->
	queryMapBossAck({0, Data});
queryMapBossAck({TargetCode, {MonsterCode, DataID}}) ->
	RealTargetCode = getRealAttacker(TargetCode),

	{RealName, IsTeam} =
		case myEts:readRecord(playerState:getMapPlayerEts(), RealTargetCode) of
			#recMapObject{id = RoleID, name = Name} ->
				gsTeamInterface:getLeaderNameIfInLeader(RoleID, Name);
			_ ->
				{"", false}
		end,

	playerMsg:sendNetMsg(playerState:getNetPid(), #pk_GS2U_MapBossInfo{
		mapID = mapState:getMapId(),
		bossID = DataID,
		name = RealName,
		isTeam = IsTeam,
		refreshTime = 0,
		code = MonsterCode
	}),
	ok.

%%发送最新野外boss信息
sendWildBossInfo() ->
	Fun = fun(#recWildBossInfo{mapID = MapID, bossID = BossID, nextRefreshTime = NRTime}, AccList) ->
		[#pk_WildBossInfo{mapID = MapID,bossID = BossID, refreshTime = NRTime}|AccList]
		  end,
	Infos = ets:foldl(Fun, [], ?TABLE_WildBoss),
	Fun1 = fun(#pk_WildBossInfo{bossID = BossID1}, #pk_WildBossInfo{bossID = BossID2}) ->
		BossID1 < BossID2
		   end,
	NewInfos = lists:sort(Fun1, Infos),
	playerMsg:sendNetMsg(#pk_GS2U_InitWildBossInfo{infos = NewInfos}),
	ok.

%%boss仇恨目标切换或者自己进入或者退出boss仇恨列表
-spec wildBossChangeTarget(TargetCode :: uint(), IsShow :: boolean()) -> ok.
wildBossChangeTarget(_TargetCode, IsShow) ->
	case IsShow of
		true ->
			%%正在参与活动,如果有pk保护buff，移除
			playerBuff:delSpecBuff(?PkBuff);
		_ ->
			skip
	end,
	%case TargetCode > 0 of
	%	true ->
	%		PlayerEts = playerState:getMapPlayerEts(),
	%		case myEts:lookUpEts(PlayerEts, TargetCode) of
	%			[#recMapObject{id = TargetRoleID, name = Name}] ->
	%				%%?DEBUG("[~ts], [~ts], TargetCode = ~p,IsShow = ~p", [playerState:getName(), Name, TargetCode, IsShow]),
	%				{LeaderName, IsTeam} = mapWildBoss:getLeaderNameIfInLeader(TargetRoleID, Name),
	%				playerMsg:sendNetMsg(#pk_GS2U_NoticeWildBossTarget{targetCode = TargetCode, name = LeaderName, isTeam = IsTeam, isShow = IsShow});
	%			_ ->
	%				?INFO("wildBossChangeTarget not find player TargetCode[~p]",[TargetCode]),
	%				skip
	%		end;
	%	_ ->
	%		?ERROR("wildBossChangeTarget TargetCode[~p], IsShow[~p]", [TargetCode, IsShow])
	%end,
	ok.
%%changeBuffState(IsAddBuff) ->
%%	Level = playerState:getLevel(),
%%	%%如果目标是自己加上红名Buff,否则移除Buff
%%	case IsAddBuff of
%%		true ->
%%			?DEBUG("addRedName[~ts]",[playerState:getName()]),
%%			playerBuff:addSpecBuff(?RedNameBuff, Level);
%%		_ ->
%%			?DEBUG("delRedName[~ts]",[playerState:getName()]),
%%			playerBuff:delSpecBuff(?RedNameBuff)
%%	end,
%%	ok.

%% 获取玩家攻击BOSS的code
getBossCode([])->
	0;
getBossCode([BossID|T])->
	BossTargetCode = mapWildBoss:getWildBossTarget(BossID),
	case playerRedName:isInWildBoss(0,BossTargetCode) of
		false->
			getBossCode(T);
		_->
			myEts:lookUpEts(?TABLE_WildBoss, BossID)
	end.

-spec playerDead(AttackCode :: uint32()) -> ok.
playerDead(AttackCode) ->
	?DEBUG("playerDead AttackCode[~p]", [AttackCode]),
	BossIDList = getCfg:get1KeyList(cfg_wildboss),
	case getBossCode(BossIDList) of
		[#recWildBossInfo{bossPid = BossPid, bossCode = BossCode}|_]->
			RAttackCode = getRealAttacker(AttackCode),
			case RAttackCode > 0 of
				true ->
					?INFO("wildboss player killer is [~p]", [RAttackCode]),
					case is_pid(BossPid) of
						true ->
							psMgr:sendMsg2PS(BossPid, wildBossRedNameDead, {BossCode, RAttackCode});
						_ ->
							?INFO("wildboss bosspid[~p]", [BossPid])
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

getRealAttacker(0) ->
	0;
getRealAttacker(AttackCode) ->
	case codeMgr:getObjectTypeByCode(AttackCode) of
		?ObjTypePlayer ->
			AttackCode;
		?ObjTypePet ->
			%% 杀害玩家的是宠物
			PetEts = playerState:getMapPetEts(),
			case myEts:lookUpEts(PetEts, AttackCode) of
				[#recMapObject{ownCode = OwnCode} | _] -> OwnCode;
				_ -> 0
			end;
		?ObjTypeCarrier ->
			MonsterEts = playerState:getMapMonsterEts(),
			case myEts:lookUpEts(MonsterEts, AttackCode) of
				[#recMapObject{ownCode = OwnCode}|_] -> OwnCode;
				_  -> 0
			end;
		?ObjTypeMonster ->
			MonsterEts = playerState:getMapMonsterEts(),
			case myEts:lookUpEts(MonsterEts, AttackCode) of
				[#recMapObject{ownCode = OwnCode}|_] -> OwnCode;
				_ -> 0
			end;
		_ -> 0
	end.

-spec wildBossDead(MapID :: uint(), MapPid::pid(), BossID :: uint(), TargetCode::uint(), PlayerName::string(),TarRoleID :: uint(), TarTeamID::uint(),ListRoleID::list()) -> ok.
wildBossDead(MapID, MapPid, BossID, TargetCode, PlayerName, TarRoleID, TarTeamID, ListRoleID) ->
	Time = case myEts:lookUpEts(?TABLE_WildBoss, BossID) of
			   [#recWildBossInfo{nextRefreshTime = NRT} | _] ->
				   NRT;
			   _ ->
				   ?ERROR("wildBossDead BossID[~p] cant find", [BossID]),
				   0
		   end,
	playerMsg:sendNetMsg(#pk_GS2U_NoticeWildBossDead{info = #pk_WildBossInfo{mapID = MapID,bossID = BossID, refreshTime = Time}}),
	#monsterCfg{showName = BossName} = getCfg:getCfgPStack(cfg_monster, BossID),

	?INFO("wildBossDead:selfroleid=~p,selfcode=~p, selteamID=~p,mapid=~p,bossid=~p,bossname=~ts,targetcode=~p,playername=~ts,tarRoleID=~p,tarTeamID=~p",
		[playerState:getRoleID(), playerState:getPlayerCode(),playerState:getTeamID(), MapID,BossID,BossName,TargetCode,PlayerName,TarRoleID, TarTeamID]),

	%%发通告和奖励
	case erlang:length(PlayerName) > 0 andalso erlang:length(BossName) > 0 of
		true ->
			%% 有名字才提示，如果玩家先死，BOSS后死，则目标不存在，就没名字，那么就不提示了
			playerMsg:sendErrorCodeMsg(?ErrorCode_CnTextWildBossDead, [PlayerName, BossName]);
		_ ->
			skip
	end,

	%% 判断是否可以领取击杀BOSS奖励
	SelfCode = playerState:getPlayerCode(),
	SelfTeamID = playerState:getTeamID(),
	case playerState:getMapPid() =:= MapPid orelse SelfCode =:= TargetCode of	%% LUNA-7309 同地图或者自己才可能得到击杀奖励
		true ->
			case canSendWildBossAward(SelfCode,TargetCode, SelfTeamID,TarTeamID) of
				true ->
					case checkWildBossCanDrop() of
						true ->
							?INFO("wildboss dead in map[~p] boss[~p] send award to [~ts][~p][~p][~p]",
								[MapID,BossID, PlayerName, TargetCode, playerState:getRoleID(), playerState:getTeamID()]),
							%%击杀boss后获得奖励就算完成
							playerLogAdd:addLogParticipatorInfo(?LogParticipator_CompleteWildBoss),
							sendwildbossAward(MapID,BossID);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_WildBoss_OutOfNumberLimit)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	%% 判断是否可以领取保底奖励
	SelfRoleID = playerState:getRoleID(),
	case lists:member(SelfRoleID,ListRoleID) of
		false->
			skip;
		_ ->
			case checkWildBossCanSend(?DailyType_WildBossEveryDayMust,wildboss_times_must) of
				true ->
					case getCfg:getCfgByKey(cfg_wildboss, BossID) of
						#wildbossCfg{normal  = ItemID} ->
							case getCfg:getCfgByKey(cfg_item, ItemID) of
								#itemCfg{name = ItemName} ->
									playerDaily:incDailyCounter(?DailyType_WildBossEveryDayMust, 0),
									Title = stringCfg:getString(wildboss_reward_normal_title),
									Content = stringCfg:getString(wildboss_reward_normal_content, [ItemName]),
									Attachment = playerMail:createMailGoods(ItemID, 1, true, 0, SelfRoleID, ?ItemSourceWildBoss),
									mail:sendSystemMail(SelfRoleID, Title, Content, Attachment, []);
								_ ->
									?ERROR("can not find itemid:~p from cfg_item~n~p", [ItemID, ListRoleID])
							end;
						_ ->
							?ERROR("can not find wildboss_reward_normal from cfg_globalsetup~n~p", [ListRoleID])
					end;
				_ ->
					skip
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_WildBoss_OutOfNumberLimit)
			end
	end,
	ok.

%% 玩家是否在野外BOSS活动中
-spec isInWildBoss() -> boolean().
isInWildBoss() ->
	BossIDList = getCfg:get1KeyList(cfg_wildboss),
	case getBossCode(BossIDList) of
		0->
			false;
		_->
			true
	end.

%%发奖励
-spec sendwildbossAward(MapID::uint(),BossID::uint()) -> ok.
sendwildbossAward(_MapID,BossID) ->
	playerDaily:incDailyCounter(?DailyType_WildBossEveryDay,?DailySubType_WildBossEveryDayTotal),
	#wildbossCfg{rewardID = RewardID} = getCfg:getCfgPStack(cfg_wildboss, BossID),
	playerDrop:goodsDrop(RewardID, BossID, ?ItemSourceWildBoss),
	ok.


%%-------------------------------------------------------------------
checkWildBossCanDrop()->
	MaxNumber = getWildBossEveryDayMaxNumber(),
	CurNumber = playerDaily:getDailyCounter(?DailyType_WildBossEveryDay,?DailySubType_WildBossEveryDayTotal),
	VipAdd = playerVipInter:getVipEffect(?RepEvent_WildBoss, 0),
	MaxNumber + VipAdd > CurNumber.

getWildBossEveryDayMaxNumber()->
	case getCfg:getCfgPStack(cfg_globalsetup, wildboss_times) of
		#globalsetupCfg{setpara = [Val]} ->
			Val;
		_ ->
			4
	end.

%% 检查玩家是否可以领取奖励 Type每日计数常量,  Key全球配置表的关键字
checkWildBossCanSend(Type, Key)->
	MaxNumber = getWildBossEveryDayMaxNumber(Key),
	CurNumber = playerDaily:getDailyCounter(Type,0),
	VipAdd = playerVipInter:getVipEffect(?RepEvent_WildBossHelp, 0),
	MaxNumber + VipAdd > CurNumber.

getWildBossEveryDayMaxNumber(Key)->
	case getCfg:getCfgPStack(cfg_globalsetup, Key) of
		#globalsetupCfg{setpara = [Val]} ->
			Val;
		_ ->
			1
	end.

canSendWildBossAward(SeflCode, TarCode, _SelfTeamID, _TarTeamID) when SeflCode =< 0 orelse TarCode =< 0 ->
	false;
canSendWildBossAward(SeflCode, TarCode, _SelfTeamID, _TarTeamID) when SeflCode =:= TarCode ->
	true;
canSendWildBossAward(_SeflCode, _TarCode, SelfTeamID, TarTeamID) when SelfTeamID =< 0 orelse TarTeamID =< 0 ->
	false;
canSendWildBossAward(_SeflCode, _TarCode, SelfTeamID, TarTeamID) when SelfTeamID =:= TarTeamID ->
	true;
canSendWildBossAward(_SeflCode, _TarCode, _SelfTeamID, _TarTeamID)->
	false.


