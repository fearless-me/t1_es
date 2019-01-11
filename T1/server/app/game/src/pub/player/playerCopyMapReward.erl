%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 副本奖励结算
%%% @end
%%% Created : 06. 一月 2015 16:38
%%%-------------------------------------------------------------------
-module(playerCopyMapReward).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-export([
	getCopyMapMaxScore/1,
	onPassCopyMap_Rift/2,
	onPassCopyMap_Normal/3,
	onPassCopyMap_Material/5,
	onPassCopyMap_MoneyDungeon/6,
	isRewardInCopyMap/0,
	isRewardInCopyMap/1,
	updateCopyMapScore/2,
	buyChallengeCopyReward/1,
	multiReward/3
]).

%% 时空裂痕的奖励
-spec onPassCopyMap_Rift(Score :: uint(), CopyMapID :: uint()) -> ok.
onPassCopyMap_Rift(Score, CopyMapID) ->
	%% 是否还有次数
	HaveTimes = playerCopyMapRift:getSurplusTimes() > 0,
	case getCopyMapRewardList(Score, CopyMapID) of
		{Score, RewardExp, RewardGold, RewardList, ItemGift} ->
			{AddExp, AddMoney} = case HaveTimes of
				                     true -> {erlang:trunc(RewardExp), erlang:trunc(RewardGold)};
				                     _ ->
					                     %% 时空裂痕获得奖励的比例
					                     RiftRatio = playerCopyMapRift:getRiftMoneyAndExpRatio(),

					                     %% 是时空裂痕，且没有次数了，金钱与经验都乘以一个比例系数
					                     {erlang:trunc(RewardExp * RiftRatio), erlang:trunc(RewardGold * RiftRatio)}
			                     end,

			%% 经验和金币奖励（根据通关时间等级换算得到）
			true = playerBase:addExp(AddExp, ?ExpSourceCopyMap, Score),
			true = playerMoney:addCoin(?CoinTypeGold, AddMoney,
				#recPLogTSMoney{reason = ?CoinSourceCopyMapReward, param = Score, target = ?PLogTS_PlayerSelf, source = ?PLogTS_CopyMapReward}),

			?INFO("onPassCopyMap_Rift [roleid=~p,mapid=~p] reward :score ~p, and got exp ~p, got gold ~p, reward list ~p, gift:~p",
				[playerState:getRoleID(), CopyMapID, Score, RewardExp, RewardGold, RewardList, ItemGift]),

%% 			%% 是时空裂痕，只有5，10，15次才给道具奖励
%% 			NowNumber = playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Rift) + 1,
%% 			CanGiveItem = HaveTimes andalso NowNumber > 0 andalso NowNumber =< ?Rift_EveryDay_Max_Times andalso (NowNumber rem 5) =:= 0,

			case HaveTimes andalso ItemGift > 0 of
				true ->
					Plog = #recPLogTSItem{
						old = 0,
						new = 1,
						change = 1,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_RiftReward,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourcePassCopyMap,
						reasonParam = CopyMapID
					},
					playerPackage:addGoodsAndMail(ItemGift, 1, true, 0, Plog);
				_ -> skip
			end,

			%% 计分
			case playerScene:getMapType(CopyMapID) of
				?MapTypeCopyMap -> updateCopyMapScore(CopyMapID, Score);
				_ -> skip
			end;
		_ -> skip
	end,
	ok.

%% 普通副本的奖励
-spec onPassCopyMap_Normal(Score :: uint(), DiffTime :: uint(), CopyMapID :: uint()) -> ok.
onPassCopyMap_Normal(Score, DiffTime, CopyMapID) ->
	case getCopyMapRewardList(Score, CopyMapID) of
		{Score, RewardExp, RewardGold, RewardList, ItemGift} ->
			{AddExp, AddMoney} = {erlang:trunc(RewardExp), erlang:trunc(RewardGold)},

			RoleID = playerState:getRoleID(),
			IsAssist = core:isAssistCopyMapByCopyMapPID(RoleID, playerState:getMapPid()),
			IsRewardUser = playerCopyMap:canRewardUserOnPassCopyMap(CopyMapID),
			%% 获得爵位加成后的值
			{New_AddMoney, New_AddExp} =
				case IsAssist of
					false when IsRewardUser ->
						{AddMoney, AddExp};
					_ ->
						{0, 0}
				end,
			case core:isCross() of
				true ->
					ok;
				_ ->
					%% 经验和金币奖励（根据通关时间等级换算得到）
					true = playerBase:addExp(New_AddExp, ?ExpSourceCopyMap, Score),
					case New_AddMoney > 0 of
						true ->
							true = playerMoney:addCoin(?CoinTypeGold, New_AddMoney,
								#recPLogTSMoney{reason = ?CoinSourceCopyMapReward, param = Score, target = ?PLogTS_PlayerSelf, source = ?PLogTS_CopyMapReward});
						_ -> skip
					end,

					?INFO("onPassCopyMap_Normal IsAssist:~p [roleid=~p,mapid=~p] reward :score ~p, and got exp ~p,~p, got gold ~p,~p, reward list ~p, gift:~p",
						[IsAssist, RoleID, CopyMapID, Score, RewardExp, New_AddExp, RewardGold, New_AddMoney, RewardList, ItemGift]),

					playerSevenDays:onMissionEvent(?SevenDayMission_Event_5, 1, CopyMapID),
					ok
			end,

			#mapsettingCfg{type = Type, subtype = Subtype, useVitality = UseVitality, difficulty = Difficulty} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),

			%% 取在副本中已经获利的掉落列表
			DropList =
				case IsAssist of
					false when IsRewardUser -> playerCopyMap:getCopyMapDropList();
					_ -> []
				end,

			%% 直接物品奖励
			{NewDropList, DropItemList1} =
				case ItemGift > 0 andalso not IsAssist andalso IsRewardUser of
					true ->
						% 针对节日副本掉落时背包满了发邮件 特殊处理 这个最好放到drop表加个字段控制
						DropItemList = case Subtype =:= ?MapSubTypeFestival of
							true ->
								playerDrop:goodsDrop(ItemGift, 1, CopyMapID, ?ItemSourcePassCopyMap, true);
							_ ->
								playerDrop:goodsDrop(ItemGift, CopyMapID, ?ItemSourcePassCopyMap)
						end,
						DList =
							lists:foldl(
								fun(Rec, Acc) ->
									case Rec of
										{DropNum, [#rec_item{itemUID = ItemUID, itemID = ItemID, isBind = IsBind, quality = Quality} | _]} ->
											[#pk_CopyMapDropItem{
												itemUID = ItemUID,
												itemID = ItemID,
												number = DropNum,
												quality = Quality,
												isBind = IsBind
											} | Acc];
										{DropNum1, [#recSaveEquip{itemUID = ItemUID1, itemID = ItemID1, isBind = IsBind1, quality = Quality1} | _]} ->
											[#pk_CopyMapDropItem{
												itemUID = ItemUID1,
												itemID = ItemID1,
												number = DropNum1,
												quality = Quality1,
												isBind = IsBind1
											} | Acc];
										_ ->
											Acc
									end
								end, DropList, DropItemList),
						{DList, DropItemList};
					_ ->
						{DropList, []}
				end,

			% 对于 史莱姆 挑战副本 守护女神 节日活动额外掉落处理(元素保卫战的额外掉落不走该流程)
			{FsDropPk, FsDropList} = case Type =:= ?MapTypeCopyMap andalso (Subtype =:= ?MapSubTypeDemonBattle
				orelse Subtype =:= ?MapSubTypeChallengeCopy
				orelse Subtype =:= ?MapSubTypeSlime) of
				true ->
					CurFestivalID = playerFestivalCopy:getCurValidFestivalID(),
					playerFestivalCopy:getFestivalExtraDrop(CurFestivalID, CopyMapID);
				_ ->
					{[], []}
			end,

			R = #pk_GS2U_CopyMapResult{
				copyMapID = CopyMapID,
				second = Score,
				goldReward = New_AddMoney,
				expReward = New_AddExp,
				dropItems = NewDropList,
				festivalDrop = FsDropPk,
				isAssist = IsAssist
			},
			%%R2 = justShowMultiReward(pack, playerScene:getMapSubType(CopyMapID), Difficulty, R),
			playerMsg:sendNetMsg(R),
			%% 取副本伤害
			playerStatistics:sendCopyMapHurtToClient(),
			playerStatistics:clearCopyMapHurtStat(),

			case core:isCross() of
				true ->
					checkNeedRank(DiffTime, CopyMapID),
					DLForGS1 = marshallDropList(DropItemList1, []),
					DLForGS = marshallDropList(FsDropList, DLForGS1),
					playerState:setReturnCallBack({onPassCopyMap_Normal_Cros, Score, DiffTime, CopyMapID, IsAssist, DLForGS, New_AddMoney, New_AddExp});
				_ ->
					%% 记录副本日志

					%% 副本结算后指定传送功能
					case IsAssist =:= false andalso Type =:= ?MapTypeCopyMap of
						true ->
							case getCfg:getCfgByKey(cfg_dungeonschallenge, CopyMapID) of
								#dungeonschallengeCfg{endtransport = [TargetMapID, TX, TY]} ->
									playerState:setOldMapPos(TargetMapID, float(TX), float(TY)),
									?INFO("player[~p] copymap[~p] endtransport:~p", [RoleID, CopyMapID, TargetMapID]),
									ok;
								_ -> skip
							end;
						_ -> skip
					end,

					case Type of
						?MapTypeCopyMap ->
							if Subtype =:= ?MapSubTypeNormal
								orelse Subtype =:= ?MapSubTypeHeroCopy
								orelse Subtype =:= ?MapSubTypeSlime
								orelse Subtype =:= ?MapSubTypeChallengeCopy ->
								EndTime = time:getLogTimeSec(),
								FunH = fun(X, AccList) ->
									case X of
										#pk_CopyMapDropItem{itemID = ItemID, number = Number} ->
											[{ItemID, Number} | AccList];
										#rec_item{itemID = ItemID, pileNum = PileNum} ->
											[{ItemID, PileNum} | AccList];
										_ ->
											AccList
									end
								       end,
								LL = lists:foldl(FunH, [], DropList),
								LogCopy = #rec_log_copy{
									accountID = playerState:getAccountID(),
									roleID = RoleID,
									copyMapType = Subtype,            %%副本类型（剧情、英雄、挑战）
									copyMapID = CopyMapID,
									startTime = EndTime - Score,
									decrActionPoint = UseVitality,
									isPass = 1,                    %%是否通关 （0表示未通关  1表示通关）
									endTime = EndTime,
									goldReward = [{1, New_AddMoney}],
									expReward = New_AddExp,
									dropItems = LL
								},
								dbLog:sendSaveLogCopyInfo(LogCopy);
								true ->
									ok
							end;
						_ ->
							ok
					end,

					%% 有翻牌时，才发给客户端去翻牌
					%% 计分
					case playerScene:getMapType(CopyMapID) of
						?MapTypeCopyMap -> updateCopyMapScore(CopyMapID, Score);
						_ -> skip
					end
			end,
			ok;
		_ -> skip
	end,
	ok.

marshallDropList([], Acc) ->
	Acc;
marshallDropList([X | DropList], Acc) ->
	XL = marshallDropList1(X),
	marshallDropList(DropList, XL ++ Acc).


marshallDropList1({DropNum, [#rec_item{itemID = ItemID, isBind = IsBind, quality = Quality} | _]}) ->
	[{ItemID, DropNum, IsBind, Quality}];
marshallDropList1({_DropNum1, [#recSaveEquip{} | _] = EL}) ->
	EL;
marshallDropList1(_Any) ->
	[].



onPassCopyMap_Material(Score, CopyState, CopyMapID, MC, FC) ->
	RoleID = playerState:getRoleID(),
	CMapPid = playerState:getMapPid(),
	IsAssist = core:isAssistCopyMapByCopyMapPID(RoleID, CMapPid),

	{Exp, Gold, DropList} =
		case IsAssist of
			false ->
				DD = playerCopyMap:getCopyMapDropList(),
				case playerState:getMapAward() of
					#recMapAward{mapPid = MapPid, exp = OldExp, gold = OldGold} when CMapPid =:= MapPid ->
						{OldExp, OldGold, DD};
					_ ->
						{0, 0, DD}
				end;
			_ ->
				{0, 0, []}
		end,

	?INFO("~w ~p onPassCopyMap_Material(~w,~w,~w,~w),droplist(~w)",
		[RoleID, IsAssist, Score, CopyMapID, MC, FC, DropList]),

	#mapsettingCfg{type = Type, subtype = Subtype} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),
	% 元素保卫战 节日活动额外掉落
	{FsDropPk, _FsDropList} = case Type =:= ?MapTypeCopyMap andalso Subtype =:= ?MapSubTypeMaterial of
		true ->
			CurFestivalID = playerFestivalCopy:getCurValidFestivalID(),
			playerFestivalCopy:getFestivalExtraDrop(CurFestivalID, CopyMapID);
		_ ->
			{[], []}
	end,

	R = #pk_GS2U_MaterialCopyMapResult{
		copyMapID = playerState:getMapID(),
		score = Score,
		state = CopyState,
		goldReward = Gold,
		expReward = Exp,
		dropItems = DropList,
		festivalDrop = FsDropPk,
		maxChapter = MC,
		finishChapter = FC,
		isAssist = IsAssist
	},
	playerMsg:sendNetMsg(R),

	case core:isCross() of
		true ->
			playerState:setReturnCallBack({onPassCopyMap_Material, Score, IsAssist, CopyMapID});
		_ ->
			F = fun({ItemID, Num}) ->
				PLog = #recPLogTSItem{
					old = 0,
					new = Num,
					change = Num,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_CopyMapReward,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourcePassCopyMap,
					reasonParam = CopyMapID
				},
				playerPackage:addGoodsAndMail(ItemID, Num, true, 0, PLog)
			    end,

			FunGive = fun(#pk_CopyMapDropItem{itemID = ItemID, number = Num}) ->
				PLog = #recPLogTSItem{
					old = 0,
					new = Num,
					change = Num,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_FestivalDrop,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceFestivalGift2,
					reasonParam = CopyMapID
				},
				playerPackage:addGoodsAndMail(ItemID, Num, true, 0, PLog)
         end,

			case IsAssist of
				false ->
					lists:foreach(FunGive, FsDropPk),
					case getCfg:getCfgByArgs(cfg_specialinstance, CopyMapID, 1) of
						#specialinstanceCfg{item = ItemList} when Score > 0 ->
							lists:foreach(F, ItemList);
						_ ->
							ok
					end;
				_ ->
					skip
			end,
			playerAchieve:achieveEvent(?Achieve_material_Copy, [1]),
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_YuanSu),
			%% 假装自己是副本，增加每日活跃
			playerliveness:onFinishLiveness(?LivenessMaterial, 1),
			ok
	end,
	%% 取副本伤害
	playerStatistics:sendCopyMapHurtToClient(),
	playerStatistics:clearCopyMapHurtStat(),

	ok.

onPassCopyMap_MoneyDungeon(Score, _CopyMapID, _MC, _FC, _ListMonsterID, _ListMonsterCountKill) ->
	DropList = playerCopyMap:getCopyMapDropList(),
	%CMapPid = playerState:getMapPid(),


	R = #pk_GS2U_CopyMapResult{
		copyMapID = _CopyMapID,
		second = Score,
		goldReward = 0,
		expReward = 0,
		dropItems = DropList,
		isAssist = core:isAssistCopyMapByCopyMapPID(playerState:getRoleID(), _CopyMapID),
		festivalDrop = []
	},
	%%R = #pk_GS2U_MoneyDungeonCopyMapResult{
	%%	copyMapID             = playerState:getMapID(),
	%%	score                 = Score,
	%%	maxChapter            = MC,
	%%	finishChapter         = FC,
	%%	listMonsterID         = ListMonsterID,
	%%	listMonsterCountKill  = ListMonsterCountKill
	%%},
	playerMsg:sendNetMsg(R),
	playerAchieve:achieveEvent(?Achieve_Gold_Copy, [1]),

	%% 取副本伤害
	playerStatistics:sendCopyMapHurtToClient(),
	playerStatistics:clearCopyMapHurtStat(),
	playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_MiaoDaoTuan),

	%% 假装自己是副本，增加每日活跃
	playerliveness:onFinishLiveness(?LivenessMoneyDungeon, 1),
	playerLogAdd:addLogParticipatorInfo(?LogParticipator_CompleteMoneyDungeno),

	ok.

%% 更新副本分数
-spec updateCopyMapScore(CopyMapID :: uint(), Score :: uint()) -> ok.
updateCopyMapScore(CopyMapID, Score) ->
	Dict = playerState:getCopyMapScoreDict(),
	case dict:find(CopyMapID, Dict) of
		{ok, #recCopyMapScore{maxScore = OldScore}} when Score >= OldScore ->
			skip;
		_ ->
			RoleID = playerState:getRoleID(),
			R = #recCopyMapScore{roleID = RoleID, copyMapID = CopyMapID, maxScore = Score},
			NDict = dict:store(CopyMapID, R, Dict),
			playerState:setCopyMapScoreDict(NDict),

			?DEBUG("updateCopyMapScore:~p,~p,~p", [RoleID, CopyMapID, Score]),

			%% 发送给数据库保存
			gsSendMsg:sendMsg2DBServer(saveCopyMapHighestScore, playerState:getAccountID(), R)
	end,
	ok.

%% 获取副本的分数
-spec getCopyMapMaxScore(CopyMapID :: uint()) -> uint().
getCopyMapMaxScore(CopyMapID) ->
	Dict = playerState:getCopyMapScoreDict(),
	case dict:find(CopyMapID, Dict) of
		{ok, #recCopyMapScore{copyMapID = CopyMapID, maxScore = Score}} ->
			Score;
		_ ->
			0
	end.

%% 获取通关副本奖励列表
-spec getCopyMapRewardList(Score :: uint(), CopyMapID :: uint()) -> Result when
	Result :: {SaveScore, AddExp, AddGold, RewardList} | false,
	SaveScore :: uint(),
	AddExp :: uint(),
	AddGold :: uint(),
	RewardList :: list().
getCopyMapRewardList(Score, CopyMapID) ->
	case getCfg:getCfgByKey(cfg_dungeonschallenge, CopyMapID) of
		#dungeonschallengeCfg{
			time_1 = Time1,
			time_2 = Time2,
			time_3 = Time3,
			time_4 = Time4,
			exp_reward = ExpReward,
			gold_reward = GoldReward,
			s_rate = S_Rate,
			a_rate = A_Rate,
			b_rate = B_Rate,
			c_rate = C_Rate,
			d_rate = D_Rate,

			reward_E1 = Raward1,
			reward_E2 = Raward2,
			reward_E3 = Raward3,
			reward_E4 = Raward4,
			reward_R1 = RawardRate1,
			reward_R2 = RawardRate2,
			reward_R3 = RawardRate3,
			reward_R4 = RawardRate4,

			giftid = ItemGift} ->
			if
				Score < Time1 ->
					AddExp = ExpReward * S_Rate,
					AddGold = GoldReward * S_Rate;
				Score < Time2 ->
					AddExp = ExpReward * A_Rate,
					AddGold = GoldReward * A_Rate;
				Score < Time3 ->
					AddExp = ExpReward * B_Rate,
					AddGold = GoldReward * B_Rate;
				Score < Time4 ->
					AddExp = ExpReward * C_Rate,
					AddGold = GoldReward * C_Rate;
				true ->
					AddExp = ExpReward * D_Rate,
					AddGold = GoldReward * D_Rate
			end,

			RewardList = case Raward1 =< 0 andalso Raward2 =< 0 andalso Raward3 =< 0 andalso Raward4 =< 0 of
				             true ->
					             %% 不需要翻牌奖励
					             [];
				             _ ->
					             All = RawardRate1 + RawardRate2 + RawardRate3 + RawardRate4,
					             DropRewardRate =
						             case All > 1 of
							             true -> random:uniform(All);
							             _ -> All
						             end,
					             DropReward = filterCopyMapRewardList([{Raward1, RawardRate1},
						             {Raward2, RawardRate2},
						             {Raward3, RawardRate3},
						             {Raward4, RawardRate4}], DropRewardRate),
					             [Raward1, Raward2, Raward3, Raward4] -- [DropReward]
			             end,

			{Score, AddExp, AddGold, RewardList, ItemGift};
		_ ->
			?INFO("getCopyMapRewardList CopyMapID:~p is can not found from cfg_dungeonschallenge", [CopyMapID]),
			false
	end.

%% 筛选副本通关奖励
-spec filterCopyMapRewardList(RewardList :: list(), Rate :: uint()) -> uint().
filterCopyMapRewardList([{RewardID, RewardRate} | LeftRewardList], Rate) ->
	case RewardID > 0 of
		true ->
			if
				Rate =< RewardRate ->
					RewardID;
				true ->
					filterCopyMapRewardList(LeftRewardList, Rate - RewardRate)
			end;
		_ ->
			filterCopyMapRewardList(LeftRewardList, Rate - RewardRate)
	end.
%% 用户当前副本地图是否可以获得奖励，只针对指定副本进行判断，未指定的副本均认为可以领取奖励
-spec isRewardInCopyMap() -> boolean().
isRewardInCopyMap() ->
	isRewardInCopyMap(playerState:getMapID()).
-spec isRewardInCopyMap(CopyMapID :: uint16()) -> boolean().
isRewardInCopyMap(CopyMapID) ->

	%%元素保卫战 ~~~购买次数 8组地图 全是通过一个MAPID购买的，这里需要遍历组ID 来获取最终买的次数
	BuyCount =
		case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
			#mapsettingCfg{daily_entercount_group = 0} ->
				playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID);
			#mapsettingCfg{daily_entercount_group = Group} ->
				List1Key = getCfg:get1KeyList(cfg_mapsetting),
				F =
					fun(Key, {_, Count}) ->
						case getCfg:getCfgByArgs(cfg_mapsetting, Key) of
							#mapsettingCfg{daily_entercount_group = G} ->
								case G =:= Group of
									true ->
										case playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, Key) of
											0 ->
												{false, 0};
											BCount when BCount > 0 ->
												{true, BCount};
											_ ->
												{false, Count}
										end;
									_ ->
										{false, Count}
								end;
							_ -> {false, Count}
						end
					end,
				{_, Bcount} = misc:foldlEx(F, {false, 0}, List1Key),
				Bcount
		end,
	DailyCount = playerDaily:getDailyCounter(?DailyType_EnterCopyMap, CopyMapID),

	case playerBattle:canGainDropGoods(CopyMapID) of
		false ->
			%% 普通副本，英雄副本，挑战副本
%%			SubTypeList = [?MapSubTypeNormal, ?MapSubTypeChallengeCopy, ?MapSubTypeHeroCopy],
			#mapsettingCfg{
				daily_effectivecount = MaxAwardLimit
			} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),

			DailyCount < MaxAwardLimit + BuyCount;
		true ->
			true
	end.


%%%-------------------------------------------------------------------
checkNeedRank(DiffTime, CopyMapID) ->
	case getCfg:getCfgByArgs(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{
			type = ?MapTypeCopyMap,
			subtype = ?MapSubTypeChallengeCopy,
			instance_group = InstanceGroup,
			difficulty = Difficulty,
			rank = CopyMapStar
		} when InstanceGroup > 0 andalso  Difficulty =:= ?MapDifficulty_Devil ->
			RoleID = playerState:getRoleID(),
			TeamInfo = gsTeamInterface:getTeamInfoWithRoleID(RoleID),
			case TeamInfo of
				#recTeamInfoGS{leaderID = RoleID} ->
					doSendRankToLeaderServer(TeamInfo, DiffTime, CopyMapID, InstanceGroup, CopyMapStar);
				_ ->
					skip
			end,
			ok;
		_ -> skip
	end,
	ok.


doSendRankToLeaderServer(
	#recTeamInfoGS{
		leaderID = Leader,
		memberList = ML
	} = TeamInfo,
	DiffTime,
	CopyMapID,
	InstanceGroup,
	CopyMapStar
) ->
	IsFromSameServer = gsTeamInterface:isTeamMemberFromSameServer(TeamInfo),
	case IsFromSameServer of
		true ->
			RankTeamInfo = #recMapRankTeamInfo{
				leader = Leader,
				diffTime = DiffTime,
				time = time2:getTimestampSec(),
				members = [MemberID || #recTeamMemberInfoGS{roleID = MemberID} <- ML]
			},
			RankInfo = #recMapRankInfo{
				copyMapID = CopyMapID,
				instanceGroupID = InstanceGroup,
				star = CopyMapStar,
				teamList = [RankTeamInfo]
			},

			NetPid = playerState:getNetPid(),
			Node = erlang:node(NetPid),
			psMgr:sendMsg2PS({gsCenterOtp, Node}, refreshCopyRank, RankInfo),
			ok;

		_ -> skip
	end,
	ok;
doSendRankToLeaderServer(_, _DiffTime, _CopyMapID, _InstanceGroup, _CopyMapStar) ->
	skip.


%%%-------------------------------------------------------------------
%% msg:购买挑战本多倍奖励
-spec buyChallengeCopyReward(MapSubType::uint()) -> no_return().
buyChallengeCopyReward(?MapSubTypeChallengeCopy) ->
	RetDaily = buyChallengeCopyReward_daily(),
	RetCost = buyChallengeCopyReward_cost(RetDaily),
	buyChallengeCopyReward_do(RetCost);
buyChallengeCopyReward(_) ->
	skip.

%% 检查每日次数
-spec buyChallengeCopyReward_daily() -> term().
buyChallengeCopyReward_daily() ->
	CountDaily = playerDaily:getDailyCounter(?DailyType_ChallengeCopyReward, ?MapSubTypeChallengeCopy),
	case getCfg:getCfgByKey(cfg_globalsetup, challengeCopyRewardDaily) of
		#globalsetupCfg{setpara = [CountDailyMax]}
		when erlang:is_integer(CountDailyMax)
		andalso CountDailyMax > CountDaily ->
			true;
		_ ->
			?ErrorCode_GatherBattleNoBuyTimes
	end.

%% 检查并扣除费用
-spec buyChallengeCopyReward_cost(term()) -> term().
buyChallengeCopyReward_cost(true) ->
	case getCfg:getCfgByKey(cfg_globalsetup, challengeCopyRewardCost) of
		#globalsetupCfg{setpara = ListNeedCoin} when erlang:is_list(ListNeedCoin) ->
			CountDaily = playerDaily:getDailyCounter(?DailyType_ChallengeCopyReward, ?MapSubTypeChallengeCopy),
			case lists:keyfind(CountDaily + 1, 1, ListNeedCoin) of
				{_, CoinUseType, CoinCount} ->
					PLog = #recPLogTSMoney{
						target = ?PLogTS_CopyMapReward,
						source = ?PLogTS_PlayerSelf,
						reason = ?CoinUseBuyChallengeCopyReward
					},
					case playerMoney:useCoin(CoinUseType, CoinCount, PLog) of
						true ->
							true;
						_ ->
							?ErrorCode_Activety_Coin_Not_Enough
					end;
				_ ->
					?ErrorCode_Activety_Coin_Not_Enough
			end;
		_ ->
			?ErrorCode_SystemNotOpen
	end;
buyChallengeCopyReward_cost(ErrorCode) ->
	ErrorCode.

%% 计数并购买次数
-spec buyChallengeCopyReward_do(term()) -> no_return().
buyChallengeCopyReward_do(true) ->
	playerDaily:incDailyCounter(?DailyType_ChallengeCopyReward, ?MapSubTypeChallengeCopy),
	Count = playerPropSync:getProp(?PriProp_ChallengeCopyReward),
	playerPropSync:setInt(?PriProp_ChallengeCopyReward, Count + 1),
	playerMsg:sendNetMsg(#pk_U2GS2U_BuyCopyReward{mapSubType = ?MapSubTypeChallengeCopy}),
	playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapRewardDouble);
buyChallengeCopyReward_do(0) ->
	skip;
buyChallengeCopyReward_do(ErrorCode) ->
	playerMsg:sendErrorCodeMsg(ErrorCode).


%%%-------------------------------------------------------------------
%% internal:副本结算展示奖励的时候，告诉客户端多倍的奖励
%% fixme 其实物品实例不能简单的将数量乘以2，这里仅做展示使用
%% fixme 先备用这个方法，还是要争取让客户端做简单的*2显示而不是在这里做手脚
-spec justShowMultiReward(pack, MapSubType::uint(),Difficulty::uint(), #pk_GS2U_CopyMapResult{}) -> #pk_GS2U_CopyMapResult{}.
justShowMultiReward(
	pack, ?MapSubTypeChallengeCopy, Difficulty,
	#pk_GS2U_CopyMapResult{
		goldReward = GR, expReward = ER,
		dropItems = ListDropItem,
		festivalDrop = ListFestival
	} = CopyMapResult
) ->
	case playerPropSync:getProp(?PriProp_ChallengeCopyReward) > 0 andalso Difficulty =/= 4 of
		true ->
			%% 固定2倍
			CopyMapResult#pk_GS2U_CopyMapResult{
				goldReward = GR * 2,
				expReward = ER * 2,
				dropItems = justShowMultiReward(ListDropItem, [], 2),
				festivalDrop = justShowMultiReward(ListFestival, [], 2)
			};
		_ ->
			CopyMapResult
	end;
justShowMultiReward(pack, _, _, CopyMapResult) ->
	CopyMapResult.
justShowMultiReward([], Acc, _Multi) ->
	Acc;
justShowMultiReward([#pk_CopyMapDropItem{number = Num} = Drop | T], Acc, Multi) ->
	justShowMultiReward(T, [Drop#pk_CopyMapDropItem{number = Num * Multi} | Acc], Multi).

%%%-------------------------------------------------------------------
%% api:副本结算发奖时，计算奖励倍率
-spec multiReward(MapSubType::uint(), Difficulty::uint(), IsAssist::boolean()) -> Multi::uint().
multiReward(?MapSubTypeChallengeCopy, Difficulty, false) ->
	%% 有则固定双倍，没有则默认1倍
	Count = playerPropSync:getProp(?PriProp_ChallengeCopyReward),
	?DEBUG("[DebugForCopyReward] multiReward Count:~w", [Count]),
	case Count > 0 andalso Difficulty =/= 4 of
		true ->
			playerPropSync:setInt(?PriProp_ChallengeCopyReward, Count - 1),
			2;  %% 固定双倍
		_ ->
			1
	end;
multiReward(_MapSubType, _Difficulty, _IsAssist) ->
	?DEBUG("[DebugForCopyReward] multiReward Args:~w Count:~w", [{_MapSubType, _IsAssist}, playerPropSync:getProp(?PriProp_ChallengeCopyReward)]),
	1.
