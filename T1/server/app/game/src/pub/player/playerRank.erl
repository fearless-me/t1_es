%%
%% @author chengxs
%% @doc @todo 排行榜模块.


-module(playerRank).
-author(chengxs).
-include("gsInc.hrl").
-include("playerPrivate.hrl").

%% 领取排行榜奖励的CD时间，一分钟
-define(GetRankRewardCDTime, 120000).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	sendRankInfo/1,
	sendPropList/1,
	sendPropList/2,
	sendRefreshMsgToAllOLPlayer/1,
	requestRankAward/1,
	requestRankRewardAck/1,
	sendStatueModelData/0
]).

-export([
	updatePlayerKeyInfo/0,
	updatePlayerDataInfo/0
]).

%% 领奖消息返回
-spec requestRankRewardAck(tuple() | false) -> ok.
requestRankRewardAck(false) ->
	%% 领取失败
	playerMsg:sendErrorCodeMsg(?ErrorCode_GetRankRewardFailed),
	ok;
requestRankRewardAck({RankType, _RoleID, DiffLastTime, ItemID, ItemNumber} = Msg) ->
	?INFO("requestRankRewardAck:~p", [Msg]),
	playerVariant:setPlayerVariant(?Setting_PlayerVar_GetRankPrizeTime, DiffLastTime),
	Plog = #recPLogTSItem{
		old = 0,
		new = ItemNumber,
		change = ItemNumber,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_Rank,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourceRank,
		reasonParam = RankType
	},
	playerPackage:addGoodsAndMail(ItemID, ItemNumber, true, 0, Plog),
	%% 领取成功
	playerMsg:sendErrorCodeMsg(?ErrorCode_GetRankRewardSuccess),
	ok.

%% 排行榜领奖(一次发榜可以领取一次奖励)
-spec requestRankAward(RankType::playerRankType()) -> ok.
requestRankAward(RankType) when erlang:is_integer(RankType) andalso
	RankType >= ?PlayerRankType_Start andalso RankType =< ?PlayerRankType_End ->
	case getCfg:getCfgPStack(cfg_rank, RankType) of
		#rankCfg{rank_reward = Reward, rewardType = ?RankRewardType_Draw} when erlang:is_list(Reward) ->
			NowTime = misc_time:milli_seconds(),
			LastTime = playerPropSync:getProp(?SerProp_GetRankRewardCDTime),
			case NowTime - LastTime >= ?GetRankRewardCDTime of
				true ->
					RoleID = playerState:getRoleID(),

					%% 先查询这个人是不是在排行榜
					RankList = myEts:lookUpEts(?TABLE_RankInfo, RankType),
					Sort = case lists:keyfind(RoleID, #recPlayerRank.roleID, RankList) of
							   #recPlayerRank{rankSort = S} ->
								   S;
							   _ ->
								   0
						   end,

					%% 判断该名次能否领奖
					Fun = fun({SS, SE, _ItemID, _ItemNumber}) ->
						if
							Sort >= SS andalso Sort =< SE ->
								false;
							SE =:= -1 ->
								%% 所有人都有奖
								false;
							true ->
								true
						end
					end,
					{_, L} = lists:splitwith(Fun, Reward),
					case length(L) > 0 of
						true ->
							%% 向CS请求领奖
							Time = variant:getPlayerVariant(RoleID, ?Setting_PlayerVar_GetRankPrizeTime),
							psMgr:sendMsg2PS(?PsNameRank, requestRankReward, {RankType, RoleID, Time});
						_ ->
							%% 你没有奖励可领
							playerMsg:sendErrorCodeMsg(?ErrorCode_GetRankRewardFailedNotItem),
							skip
					end,

					%% 记录本次领取时间
					playerPropSync:setInt64(?SerProp_GetRankRewardCDTime, NowTime);
				_ ->
					%% cd时间内，不允许再次领取
					playerMsg:sendErrorCodeMsg(?ErrorCode_GetRankRewardFailedCDTime),
					skip
			end;
		_ ->
			skip
	end,
	ok;
requestRankAward(RankType) ->
	?ERROR("requestRankAward:~s,~p,~p", [playerState:getName(),playerState:getRoleID(),RankType]),
	ok.

%% 排行榜刷新
sendRefreshMsgToAllOLPlayer(RankType) ->
	?DEBUG("sendRefreshMsgToAllOLPlayer:~p,~p",[playerState:getRoleID(),RankType]),
	case playerState:isFirstEnterMap() of
		false ->
			playerMsg:sendNetMsg(#pk_GS2U_RefreshRank{type = RankType});
		_ ->
			skip
	end,
	ok.

%% 查询某种类型的排行榜信息
-spec sendRankInfo(Type) -> ok when
	Type::integer().
sendRankInfo(Type) when erlang:is_integer(Type) andalso Type >= ?PlayerRankType_Start andalso Type =< ?PlayerRankType_End ->
	case myEts:lookUpEts(?TABLE_RankInfo, Type) of
		[#recPlayerRank{}|_] = RL ->
			Fun = fun(#recPlayerRank{roleID = RoleID} = Rank, AccList) ->
				{Name, Title,RealWingLevel,FrameID,{Career,Race,Sex,Head,Level}} =
					case Type of
						?PlayerRankType_Guild ->
							%% 这是一个军团排行榜
							{playerGuildWar:getGuildName(Rank#recPlayerRank.value3), #pk_TitleData{title1 = 0, title2 = 0, title3 = 0, color = 0, background = 0, customTitle = ""}, 0,0,
								{0,0,0,0,0}};
						_ ->
							case ets:lookup(ets_recPlayerRankInfo, RoleID) of
								[#recPlayerRankInfo{name = RoleName, title = T, frame = F, wingLevel=WingLevel}] ->
									case core:queryRoleKeyInfoByRoleID(RoleID) of
										#?RoleKeyRec{career = Career_, race = Race_, sex = Sex_, head = Head_, level = Level_} ->
											{RoleName, T, WingLevel, F,
												{Career_, Race_, Sex_, Head_, Level_}};
										_ ->
											{RoleName, T, WingLevel, F,
												{0,0,0,0,0}}
									end;
								_ ->
									{"", #pk_TitleData{title1 = 0, title2 = 0, title3 = 0, color = 0, background = 0, customTitle = ""},0,0,
										{0,0,0,0,0}}
							end
					end,

				R = #pk_RankInfo{
					rankSort = Rank#recPlayerRank.rankSort,
					rankSortC = Rank#recPlayerRank.rankSortC,
					roleID = RoleID,
					name = Name,
					wingLevel = RealWingLevel,
					title = Title,
					frameID = FrameID,
					rankValue1 = Rank#recPlayerRank.value1,
					rankValue2 = Rank#recPlayerRank.value2,
					rankValue3 = Rank#recPlayerRank.value3,
					%% 仅个人排行有效
					career = Career,
					race = Race,
					sex = Sex,
					head = Head,
					level = Level
				},
				[R | AccList]
			end,
			L = lists:foldl(Fun, [], RL),
			playerMsg:sendNetMsg(#pk_GS2U_SendRank{type = Type, datas = L}),
			ok;
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_SendRank{type = Type, datas = []}),
			skip
	end,
	ok;
sendRankInfo(Type) ->
	?ERROR("sendRankInfo recv error type:~s,~p,~p", [playerState:getName(),playerState:getRoleID(),Type]),
	playerMsg:sendNetMsg(#pk_GS2U_SendRank{type = Type, datas = []}),
	ok.

%% 查询玩家的模型信息
-spec sendPropList(RoleID::uint64()) -> ok.
sendPropList(RoleID) ->
	sendTargetInfoToClient(RoleID, playerState:getNetPid()),
	ok.

%% 查询玩家的装备列表
-spec sendPropList(Type::uint(), TargetRoleID::uint64()) -> ok.
sendPropList(Type, TargetRoleID) ->
	%% 先查询这个人是不是在排行榜
	RankList = myEts:lookUpEts(?TABLE_RankInfo, Type),
	case lists:keyfind(TargetRoleID, #recPlayerRank.roleID, RankList) of
		#recPlayerRank{} ->
			%% 是榜上的人，再判断这个人是不是自己
			SelfRoleID = playerState:getRoleID(),
			case TargetRoleID =:= SelfRoleID of
				false ->
					%% 是目标
					sendTargetInfoToClient(TargetRoleID, playerState:getNetPid());
				_ ->
					%% 是自己
					case ets:lookup(ets_recPlayerRankInfo, SelfRoleID) of
						[#recPlayerRankInfo{}] ->
							skip;
						_ ->
							%% 插入新的
							?INFO("queryPlayerInfo:~p", [SelfRoleID]),
							updatePlayerDataInfo()
					end,
					sendSelfInfoToClient(SelfRoleID, Type)
			end;
		_ ->
			%% 获取其它的角色模型
			sendPropList(TargetRoleID)
%% 			?ERROR("sendPropList:selfroleid=~p,targetroleid=~p,ranktype=~p", [playerState:getRoleID(), TargetRoleID, Type])
	end,
	ok.

sendTargetInfoToClient(TargetRoleID, TargetNetPid) ->
	case ets:lookup(ets_recPlayerRankInfo, TargetRoleID) of
		[#recPlayerRankInfo{visibleEquips = EquipList, visibleEquipLevels = RefineList} = Info] ->

			Fun = fun(#recVisibleEquip{} = E) -> #pk_PlayerEquip{equipID = E#recVisibleEquip.equipID, quality = E#recVisibleEquip.quality} end,
			EIDList = lists:map(Fun, EquipList),

			Fun1 = fun(#recEquipRefine{pos = Type, level = Lv}) -> #pk_PlayerEquipLevel{type = Type, level = Lv} end,
			ELvlList = lists:map(Fun1, RefineList),

			R = #pk_GS2U_SendPropList{
				roleID = TargetRoleID,
				playerCode = Info#recPlayerRankInfo.code,
				career = Info#recPlayerRankInfo.career,
				sex = Info#recPlayerRankInfo.sex,
				race = Info#recPlayerRankInfo.race,
				head = Info#recPlayerRankInfo.head,
				wingLevel = Info#recPlayerRankInfo.wingLevel,
				fashionIDs = Info#recPlayerRankInfo.fashionIDs,
				equipIDList = EIDList,
				equipLevelList = ELvlList
			},
			playerMsg:sendNetMsg(TargetNetPid, R);
		_ ->
			%% LUN-8087 【竞技场】竞技场中挑战对手，进入竞技场场景中，不能看到敌人
			case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
				#?RoleKeyRec{career = Career, sex = Sex, race = Race, head = Head} ->
					?WARN("sendPlayerInfoToClient:~p", [TargetRoleID]),
					Msg = #pk_GS2U_SendPropList{
						roleID = TargetRoleID,
						playerCode = 0,
						career = Career,
						sex = Sex,
						race = Race,
						head = Head,
						wingLevel = 0,
						fashionIDs = [],
						equipIDList = [],
						equipLevelList = []
					},
					playerMsg:sendNetMsg(TargetNetPid, Msg);
				_ ->
					%%?ERROR("sendPlayerInfoToClient:~p", [TargetRoleID]),	fixme 可能因跨服组队时请求外观信息无法找到，屏蔽此处错误日志
					MsgDefault = #pk_GS2U_SendPropList{
						roleID = TargetRoleID,
						playerCode = 0,
						career = ?Career_10_Warrior,
						sex = ?SexWoman,
						race = ?RaceHuman,
						head = 1,
						wingLevel = 0,
						fashionIDs = [],
						equipIDList = [],
						equipLevelList = []
					},
					playerMsg:sendNetMsg(TargetNetPid, MsgDefault)

			end
	end,
	ok.

%% 更新玩家模型数据
-spec updatePlayerDataInfo() -> ok.
updatePlayerDataInfo() ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			PlayerCode = playerState:getPlayerCode(),
			EquipList = getBodyEquipList(),
			RefineList = playerState:getEquipRefine(),
			Career = playerState:getCareer(),
			Name = playerState:getName(),
			Sex = playerState:getSex(),
			Race = playerState:getRace(),
			Head = playerState:getHead(),
			Title = #pk_TitleData{
				title1 = playerPropSync:getProp(?PubProp_TitleSlot1),
				title2 = playerPropSync:getProp(?PubProp_TitleSlot2),
				title3 = playerPropSync:getProp(?PubProp_TitleSlot3),
				color = playerPropSync:getProp(?PubProp_TitleColorSlot),
				background = playerPropSync:getProp(?PubProp_TitleFloorSlot),
				customTitle = playerPropSync:getProp(?PubProp_CustomTitle)
			},
			Frame = playerPropSync:getProp(?PubProp_PlayerFrameID),
			FashionList = playerFashion:getShowFashions(),
			R = #recPlayerRankInfo{
				roleID = RoleID,                   	%%角色ID
				career = Career,                   	%%职业
				race = Race,                       %%玩家种族
				sex = Sex,                        %%性别
				head = Head,						%%头
				code = PlayerCode,						%%code
				name = Name,                    	%%姓名
				wingLevel = 0,					%%玩家翅膀等级
				title = Title,                     %%称号列表
				frame = Frame,                      %%头像框
				fashionIDs = FashionList,				%%穿在身上的时装ID列表
				visibleEquipLevels = RefineList,		%%装备精炼等级列表
				visibleEquips = EquipList			  	%%装备列表#recVisibleEquip{}
			},
			ets:insert(ets_recPlayerRankInfo, R),
			ok;
		_ ->
			skip
	end,
	ok.

%% 更新角色的关键数据
-spec updatePlayerKeyInfo() -> ok.
updatePlayerKeyInfo() ->
	case playerState:getIsPlayer() of
		true ->
			PlayerID = playerState:getRoleID(),
			PlayerName = playerState:getName(),
			AccountID = playerState:getAccountID(),
			GsID = gsMainLogic:getServerID(),
            ets:update_element(ets_rec_OnlinePlayer, PlayerID,
                [
                    {#rec_OnlinePlayer.accountID, AccountID},
                    {#rec_OnlinePlayer.code, playerState:getPlayerCode()},
                    {#rec_OnlinePlayer.pid, self()},
                    {#rec_OnlinePlayer.netPid, playerState:getNetPid()}
                ]),
			%% 勇者试炼
			{WTPhase, WTPhaseTime} =
				case mnesia:dirty_read(rec_warrior_trial, PlayerID) of
					[#rec_warrior_trial{tswkTrialSchedule = T1, tswkTrialTime = T2}] -> {T1, T2};
					_ -> {0, 0}
				end,
			PvpIntegral = 
				case mnesia:dirty_read(rec_pet_manor_battle, PlayerID) of
					[#rec_pet_manor_battle{save_time = SaveTime, pet_integral = Integral}] ->
						{SaveTime, Integral};
					_ ->
						{0, 0}
				end,
			%% fixme 此处可能没有初始化同步属性
			ActionPoint =
				case playerPropSync:getProp(?SerProp_ActionPoint) of
					[_, ActionPoint_] ->
						ActionPoint_;
					_ ->
						0
				end,


			%% 角色信息内存表
            gsSendMsg:sendMsg2PublicDMSaveData(
                {?RoleKeyRec, PlayerID,
                    [
                        {#?RoleKeyRec.roleName, PlayerName},
                        {#?RoleKeyRec.accountID, AccountID},
                        {#?RoleKeyRec.gsID, GsID},
                        {#?RoleKeyRec.sex, playerState:getSex()},
                        {#?RoleKeyRec.race, playerState:getRace()},
                        {#?RoleKeyRec.career, playerState:getCareer()},
                        {#?RoleKeyRec.level, playerState:getLevel()},
                        {#?RoleKeyRec.exp, playerState:getCurExp()},
                        {#?RoleKeyRec.gold, playerState:getCoin(?CoinTypeGold)},
                        {#?RoleKeyRec.achieve, playerPropSync:getProp(?PriProp_Achieve)},
                        {#?RoleKeyRec.pvpIntegral, PvpIntegral},
                        {#?RoleKeyRec.petForce, playerPropSync:getProp(?PriProp_PetForce)},
                        {#?RoleKeyRec.petID, playerPet:getPetBattleID()},
                        {#?RoleKeyRec.playerForce, playerPropSync:getProp(?PriProp_PlayerForce)},
                        {#?RoleKeyRec.maxForce, playerPropSync:getProp(?SerProp_PlayerHistoryForce)},
                        {#?RoleKeyRec.maxForceNoPet, playerPropSync:getProp(?SerProp_PlayerHistoryForceNoPet)},
                        {#?RoleKeyRec.aliveKill, playerPropSync:getProp(?SerProp_CrossAliveKill)},
                        {#?RoleKeyRec.reputation, 0},
                        {#?RoleKeyRec.kpNum, playerPropSync:getProp(?PriProp_PlayerKpNum)},
                        {#?RoleKeyRec.wtPhase, WTPhase},
                        {#?RoleKeyRec.wtPhaseTime, WTPhaseTime},
                        {#?RoleKeyRec.lastUpdateTime, misc_time:gregorian_seconds_from_1970( )},
                        {#?RoleKeyRec.vipLv, 0},
	                    {#?RoleKeyRec.actionPoint, ActionPoint},
                        {#?RoleKeyRec.offlineTime, misc_time:gregorian_seconds_from_1970( )}
                    ]
                }),
			ok;
		_ ->
			skip
	end,
	ok.

sendSelfInfoToClient(RoleID, Type) ->
	?INFO("sendSelfInfoToClient:roleID=~p, rankType=~p", [RoleID, Type]),

	%% 先立即更新一下自己的数据
	updatePlayerDataInfo(),

	%% 再发送给客户端
	sendTargetInfoToClient(RoleID, playerState:getNetPid()),
	ok.

%% 获取角色身上穿戴的装备列表
getBodyEquipList() ->
	RoleID = playerState:getRoleID(),
	case playerState:getPackage(?Item_Location_BodyEquipBag) of
		undefined -> [];
		Package ->
			Fun = fun(Equip, EquipList) ->
				case Equip of
					#recSaveEquip{itemID = EquipID, quality = Qua} ->
						R = #recVisibleEquip{
							roleID = RoleID,
							equipID = EquipID,
							quality = Qua
						},
						[R | EquipList];
					_ ->
						EquipList
				end
			      end,
			lists:foldl(Fun, [], Package)
	end.



getPlayerRankInfo(TargetRoleID,Sb_Type,Arr)->
	case ets:lookup(ets_recPlayerRankInfo, TargetRoleID) of
		[#recPlayerRankInfo{visibleEquips = EquipList,name = TName} = Info] ->
			Fun = fun(#recVisibleEquip{} = E) -> #pk_PlayerEquip{equipID = E#recVisibleEquip.equipID, quality = E#recVisibleEquip.quality} end,

			EIDList = lists:map(Fun, EquipList),
			Data =  #pk_RankModelData{
				roleID = TargetRoleID,
				sb_type = Sb_Type,
				name = TName,
				career = Info#recPlayerRankInfo.career,
				sex = Info#recPlayerRankInfo.sex,
				race = Info#recPlayerRankInfo.race,
				head = Info#recPlayerRankInfo.head,
				wingLevel = Info#recPlayerRankInfo.wingLevel,
				fashionIDs = Info#recPlayerRankInfo.fashionIDs,
				equipIDList = EIDList
			},
			[Data|Arr];
		_ ->
			case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
				#?RoleKeyRec{career = Career, sex = Sex, race = Race, head = Head,roleName = Name } ->
					 D = #pk_RankModelData{
						 roleID = TargetRoleID,
						sb_type =Sb_Type,
						name = Name,
						career = Career,
						sex = Sex,
						race = Race,
						head = Head,
						wingLevel = 0,
						fashionIDs = [],
						equipIDList = []
					},
				[D|Arr];
				_ ->
					?ERROR("not find this roleinfo :~p", [TargetRoleID]),
					Arr
			end
	end.


getModelDataForRank(RankType,Num,Sb_Type,Arr)
	when RankType >= ?PlayerRankType_Start andalso RankType =< ?PlayerRankType_End ->
	RankList = myEts:lookUpEts(?TABLE_RankInfo, RankType),
	%%先查，这个名次是否在排行榜里面
	case lists:keyfind(Num, #recPlayerRank.rankSort, RankList) of
			   #recPlayerRank{roleID = RoleID} ->
				   getPlayerRankInfo(RoleID,Sb_Type,Arr);
			   _ ->
				   Arr
	end;
getModelDataForRank(_RankType,_,_,_)->
	[].



sendCharmRankFirstInfo()->

	RankList = myEts:lookUpEts(?TABLE_RankInfo, ?PlayerRankType_Charm),
	%%先查，这个名次是否在排行榜里面
	case lists:keyfind(1, #recPlayerRank.rankSort, RankList) of
		#recPlayerRank{roleID = RoleID} ->
		%% 获取家族（军团）名
		FamilyName =
			case ets:lookup(rec_guild_member, RoleID) of
				[#rec_guild_member{guildID = GuildID}] ->
					case ets:lookup(rec_guild, GuildID) of
						[#rec_guild{guildName = GuildName}] ->
							GuildName;
						_ ->
							""
					end;
				_ ->
					""
			end,
		    Sign= playerIdentity:querySign(RoleID),
			Charm= playerIdentity:queryCharm(RoleID),
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{roleName = Name,level = Level, playerForce = PlayerForce } ->
					Msg = #pk_GS2U_SendCharmRankFirstData{
						roleID = RoleID,
						sb_type =2,
						name = Name,
						playerForce = PlayerForce,
						sign = Sign,
						charm = Charm,
						guildName  = FamilyName,
						level = Level
					},
					playerMsg:sendNetMsg(Msg);
				_ ->
					?ERROR("not find this roleinfo :~p", [RoleID])
			end;
		_ ->
			skip
	end,
	ok.

%%上线发送给客服端需要展示玩家雕像的数据
sendStatueModelData()->

	sendCharmRankFirstInfo(),
	KingModelData = playerAcKingBattleAll:getCurrentDefenderModelData(),
	PularityData_0 =  getModelDataForRank(?PlayerRankType_Charm,1,2,KingModelData),
	PularityData_1 =  getModelDataForRank(?PlayerRankType_pularity,1,3,PularityData_0),
	PularityData_2 =  getModelDataForRank(?PlayerRankType_pularity,2,4,PularityData_1),
	All =  getModelDataForRank(?PlayerRankType_pularity,3,5,PularityData_2),
	playerMsg:sendNetMsg(#pk_GS2U_SendRankModelData{playerRankMoldelList = All}),
	ok.
