%% @author zhengzhichun
%% @doc @todo Add description to playerAcKingBattleAll.
%%王者战天下  刘展
%%
-module(playerAcKingBattleAll).
%%
%%-include("playerPrivate.hrl").
%%-include("../activity/activityPrivate.hrl").
%%-include("../activity/gameactivity/kingbattleall/acKingBattleAllPrivatePrivate.hrl").
%%-include("../activity/gameactivity/activityPhaseDefine.hrl").
%%%% ====================================================================
%%%% API functions
%%%% ====================================================================
%%-export([
%%	getKingRevivePt/0,
%%	flashMirrorInfo/1,
%%	giveMarrorFlower/0
%%]).
%%
%%-export([
%%	enterKingBattleSenceSuccessAck/0,
%%	onEnterAcMap/1,
%%	onLeaveAcMap/1,
%%	onLevelKingBattleMap/0,
%%	changeMap/1,
%%	requestInKingMap/0,
%%	requestJoinKingBattleMapAck/1,
%%	requestQuotaNumber/2,
%%	attacker_buy_buff/0,
%%	attacker_buy_buff_one_key/0,
%%	defender_buy_buff/0,
%%	defender_buy_buff_one_key/0,
%%	defender_buy_mirror_buff/0,
%%	defender_buy_mirror_buff_one_key/0,
%%	repair_mirror/1,
%%	flashBuffInfo/0,
%%	setKingDeclaration/1,
%%	getCurrentDefenderModelData/0
%%]).
%%
%%%%下线或退出王者战天下时的处理
%%-spec onLevelKingBattleMap() -> ok.
%%onLevelKingBattleMap() ->
%%	CurMapID = playerState:getMapID(),
%%	case globalCfg:getGlobalCfg(fightall_map_id) of
%%		Val when Val =:= CurMapID ->
%%			core:sendMsgToActivity(?ActivityType_KingBattleAll,
%%				onLevelKingBattleMap,
%%				{
%%					playerState:getRoleID()
%%				}),
%%			ok;
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%%%王者战天下的复活点
%%-spec getKingRevivePt() -> {X :: float(), Y :: float()}.
%%getKingRevivePt() ->
%%	RoleID = playerState:getRoleID(),
%%	L =
%%		case edb:readAllRecord(rec_guard_mirror) of
%%			[#rec_guard_mirror{roleID = KingRoleID} | _] when KingRoleID =:= RoleID ->
%%				%%防守方复活时的无敌buff
%%				psMgr:sendMsg2PS(self(), addBuff, {playerState:getLevel(), 221}),
%%				globalCfg:getGlobalCfgList(fightall_defend);
%%			_ ->
%%				globalCfg:getGlobalCfgList(fightall_attack)
%%		end,
%%	Index = misc:rand(1, erlang:length(L)),
%%	lists:nth(Index, L).
%%
%%%%申请进入 王者战天下
%%-spec requestInKingMap() -> ok.
%%requestInKingMap() ->
%%	core:sendMsgToActivity(?ActivityType_KingBattleAll,
%%		requestJoinKingBattleMap,
%%		{
%%			playerState:getRoleID(),
%%			playerPropSync:getProp(?SerProp_PlayerHistoryForce)
%%		}),
%%	ok.
%%requestJoinKingBattleMapAck({MapID, MapPID, {X, Y}}) ->
%%	playerScene:onRequestEnterActivityMap(MapID, MapPID, X, Y);
%%requestJoinKingBattleMapAck(ErrorCode) ->
%%	playerMsg:sendErrorCodeMsg(ErrorCode).
%%%%成功进入到守护世界地图
%%enterKingBattleSenceSuccessAck() ->
%%	case core:isCross() of
%%		false ->
%%			Argu = logicArguLib:getRoleBaseInfoArgu(),
%%			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_ENTER_ACTIVE_SENCE, [Argu]),
%%			?DEBUG("R=======enterKingBattleSenceSuccessAck=====~p~n", [R]);
%%		_ ->
%%			?ERROR("can not use condition-trigger-mode in cross server!")
%%	end.
%%
%%%% 王者战天下（查询名额）
%%-spec requestQuotaNumber(V_activityID :: uint16(), V_mapID :: uint16()) -> ok.
%%requestQuotaNumber(V_activityID, V_mapID) ->
%%	KingBattleAllAttackerNum = acKingBattleAllLogic:getOnlineAttackerNumber(),
%%	[{CnfAttackerNum}, _] = globalCfg:getGlobalCfgList(fightall_attacker),
%%	Msg = #pk_GS2U_AttackerDefenderQuotaNumberAck{
%%		activityID = V_activityID,
%%		mapID = V_mapID,
%%		acctackerQuotaNum = CnfAttackerNum - KingBattleAllAttackerNum
%%	},
%%	?DEBUG("~p ~p ", [Msg, KingBattleAllAttackerNum]),
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%-spec changeMap(MapID :: uint16()) -> ok.
%%changeMap(MapID) ->
%%	case globalCfg:getGlobalCfg(fightall_map_id) of
%%		MapID ->
%%			onEnterAcMap(MapID);
%%		_ ->
%%			onLeaveAcMap(MapID)
%%	end,
%%	ok.
%%
%%-spec onEnterAcMap(MapID :: uint16()) -> ok.
%%onEnterAcMap(AcKingBattleAllMapID) ->
%%	case globalCfg:getGlobalCfg(fightall_map_id) of
%%		AcKingBattleAllMapID ->
%%			RoleID = playerState:getRoleID(),
%%			case edb:readAllRecord(rec_guard_mirror) of
%%				[#rec_guard_mirror{
%%					roleID = MirrorRoleID
%%				} | _] when RoleID == MirrorRoleID ->
%%					?DEBUG("CampRedBattle"),
%%					%%玩家设置成与镜像一个阵营
%%					playerState:setCamp(?CampRedBattle, true),
%%					ok;
%%				_ ->
%%					?DEBUG("CampBlueBattle"),
%%					%%玩家设置成与镜像敌对阵营
%%					playerState:setCamp(?CampBlueBattle, true)
%%			end,
%%			%%mwh-new-team
%%			playerTeam:leaveTeam(false),
%%%%			case playerState:getTeamID() > 0 of
%%%%				true -> playerTeam2:leaveTeam(?TeamTypeNormal);
%%%%				_ -> skip
%%%%			end,
%%			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_ShiJieShouHu),
%%			playerLogAdd:addLogParticipatorInfo(?LogParticipator_FightAll),
%%%%      playerliveness:onFinishLiveness(?LivenessFightAll, 1),
%%			ok;
%%		_ ->
%%			ok
%%	end.
%%
%%%%玩家离开 王者战天下 地图
%%-spec onLeaveAcMap(TargetMapID :: integer()) -> ok.
%%onLeaveAcMap(TargetMapID) ->
%%	case globalCfg:getGlobalCfg(fightall_map_id) of
%%		TargetMapID ->
%%			skip;
%%		_ ->
%%			%%玩家重置为玩家阵营
%%			playerState:setCamp(?CampPlayer, true)
%%	end,
%%	ok.
%%
%%%%王者雕像的点赞
%%-spec giveMarrorFlower() -> ok.
%%giveMarrorFlower() ->
%%	?DEBUG("giveMarrorFlower"),
%%	MyRoleID = playerState:getRoleID(),
%%	[#rec_guard_mirror{roleID = RoleID} | _] = edb:readAllRecord(rec_guard_mirror),
%%	%%每日计数的id是54位的，长了报错
%%	<<_:10, RoleID2:54>> = <<RoleID:64>>,
%%	case playerDaily:getDailyCounter(?DailyType_AddPraise4Marror, RoleID2) > 0 of
%%		true ->
%%			%%今天已经对该玩家点过赞了
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_KingGiveFlowerDeny);
%%		false when RoleID =:= MyRoleID ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_KingGiveFlowerDeny4self);
%%		_ ->
%%			%% 接口直接调用到个性信息
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_KingGiveFlowerFail)
%%	end,
%%	ok.
%%
%%%%设置守护宣言
%%-spec setKingDeclaration(Declaration :: string()) -> ok.
%%setKingDeclaration(Declaration) ->
%%	CurrentRoleID = playerState:getRoleID(),
%%	{ok, State} = activityLogic:getActivePhase(?ActivityType_KingBattleAll),
%%	case acKingBattleAllLogic:getDefenderInfo(CurrentRoleID) of
%%		{ok, #rec_guard_mirror{} = Mirror} when ?ActivityPhase_KingBattleAll_5 =/= State ->
%%			acKingBattleAllLogic:updateDefenderInfo(Mirror#rec_guard_mirror{declaration = Declaration}),
%%			Msg = #pk_GS2U_ChangeGuardianDeclaration{
%%				isChange = true
%%			},
%%			playerMsg:sendNetMsg(Msg);
%%		_ ->
%%			Msg = #pk_GS2U_ChangeGuardianDeclaration{
%%				isChange = false
%%			},
%%			playerMsg:sendNetMsg(Msg)
%%	end,
%%
%%	ok.
%%
%%%%等级，名字，战力
%%flashMirrorInfo(IsNotify) ->
%%	CurrentRole = playerState:getRoleID(),
%%	case acKingBattleAllLogic:getCurrentDefenderInfo() of
%%		{ok, #rec_guard_mirror{roleID = RoleID, guardTimes = DefnedDays, hpNumber = CurrentHp, fightForce = LastFightForce, declaration = Declaration}} ->
%%			if
%%				CurrentRole =:= RoleID ->
%%					FightForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce);
%%				true ->
%%					FightForce = LastFightForce
%%			end,
%%			?DEBUG("FightForce=======~p~n", [{FightForce, CurrentHp}]),
%%			MaxHp = acKingBattleAllLogic:calculationMaxHp(FightForce,DefnedDays),
%%			case  core:queryRoleKeyInfoByRoleID(RoleID) of
%%				#?RoleKeyRec{roleName = Name, level = Level, career = Career, race = Race, sex = Sex, head = Head}->
%%					%%[#rec_base_role{roleName = Name, level = Level,career = Career,race = Race,sex = Sex,head = Head}] = ets:lookup(ets_rec_base_role, RoleID),
%%					NewMirrorCode =
%%						case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
%%							[#rec_OnlinePlayer{code = PCode}] ->
%%								PCode;
%%							_ ->
%%								0
%%						end,
%%					GuildName = guildLogic:getGuildNameByRoleID(RoleID),
%%					case acKingBattleAllLogic:getMirrorAppearance(RoleID) of
%%						{ok, #king_battle_mirror_appearance{equipIDList = EquipList, equipLevelList = EquipLevelIDList, fashionIDList = FashionIDList, wingLevel = WingLevel}} ->
%%							MsgEquipmentList = [#pk_PlayerKingBattleEquip{equipID = EquipID, quality = Quarlity} || #recVisibleEquip{equipID = EquipID, quality = Quarlity} <- EquipList],
%%							MsgEquipLevelIDLis = [#pk_PlayerKingBattleEquipLevel{type = EqType, level = EqLv} || #recEquipRefine{pos = EqType, level = EqLv} <- EquipLevelIDList],
%%							playerMsg:sendNetMsg(#pk_GS2U_MarrorInfoAck{
%%								nickName = binToString(Name),
%%								playerLevel = Level,
%%								playerForce = FightForce,
%%								%% UInt64 角色ID
%%								roleID = RoleID,
%%								%% UInt64 玩家流水号
%%								playerCode = NewMirrorCode,
%%								%% SByte 职业
%%								career = Career,
%%								%% SByte 种族
%%								race = Race,
%%								wingLevel = WingLevel,
%%								%% SByte 性别
%%								sex = Sex,
%%								%% Int32
%%								head = Head,
%%								%% String军团名
%%								clique = GuildName,
%%								%% UInt32成功防守天数
%%								defendDays = DefnedDays,
%%								%% UInt64防守镜像最大生命值
%%								mirrorMaxHp = erlang:trunc(MaxHp),
%%								%% UInt64防守镜像剩余生命值
%%								mirrorLastHp = erlang:trunc(CurrentHp),
%%								%%时装
%%								fashionIDs = FashionIDList,
%%								%% PlayerKingBattleEquip 装备ID列表
%%								equipIDList = MsgEquipmentList,
%%								%% PlayerKingBattleEquipLevel装备等级列表
%%								equipLevelList = MsgEquipLevelIDLis,
%%								%%守护宣言
%%								declaration = binToString(Declaration)
%%							});
%%						_ ->
%%							skip
%%					end;
%%				_->
%%					skip
%%			end,
%%			ok;
%%		_ when IsNotify ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleNoKing);
%%		_ ->
%%			skip
%%	end.
%%%%购买buff
%%attacker_buy_buff() ->
%%	case core:isCross() of
%%		false ->
%%			Argu = logicArguLib:getRoleBaseInfoArgu(),
%%			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_ATTACKER_BUFF, [Argu]),
%%			flashBuffInfo(),
%%			?DEBUG("==========attacker_buy_buff=====~p~n", [R]);
%%		_ ->
%%			?ERROR("can not use condition-trigger-mode in cross server!")
%%	end.
%%attacker_buy_buff_one_key() ->
%%	case core:isCross() of
%%		false ->
%%			Argu = logicArguLib:getRoleBaseInfoArgu(),
%%			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_ATTACKER_BUFF_ONE_KEY, [Argu]),
%%			flashBuffInfo(),
%%			?DEBUG("==========attacker_buy_buff_one_key=====~p~n", [R]);
%%		_ ->
%%			?ERROR("can not use condition-trigger-mode in cross server!")
%%	end.
%%defender_buy_buff() ->
%%	case core:isCross() of
%%		false ->
%%			Argu = logicArguLib:getRoleBaseInfoArgu(),
%%			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_DEFENDER_BUFF, [Argu]),
%%			flashBuffInfo(),
%%			?DEBUG("==========defender_buy_buff=====~p~n", [R]);
%%		_ ->
%%			?ERROR("can not use condition-trigger-mode in cross server!")
%%	end.
%%defender_buy_buff_one_key() ->
%%	case core:isCross() of
%%		false ->
%%			Argu = logicArguLib:getRoleBaseInfoArgu(),
%%			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_DEFENDER_BUFF_ONE_KEY, [Argu]),
%%			flashBuffInfo(),
%%			?DEBUG("==========defender_buy_buff_one_key=====~p~n", [R]);
%%		_ ->
%%			?ERROR("can not use condition-trigger-mode in cross server!")
%%	end.
%%defender_buy_mirror_buff() ->
%%	case core:isCross() of
%%		false ->
%%			Argu = logicArguLib:getRoleBaseInfoArgu(),
%%			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_MIRROR_BUFF, [Argu]),
%%			flashBuffInfo(),
%%			?DEBUG("==========defender_buy_mirror_buff=====~p~n", [R]);
%%		_ ->
%%			?ERROR("can not use condition-trigger-mode in cross server!")
%%	end.
%%defender_buy_mirror_buff_one_key() ->
%%	case core:isCross() of
%%		false ->
%%			Argu = logicArguLib:getRoleBaseInfoArgu(),
%%			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_MIRROR_BUFF_ONE_KEY, [Argu]),
%%			flashBuffInfo(),
%%			?DEBUG("==========defender_buy_mirror_buff_one_key=====~p~n", [R]);
%%		_ ->
%%			?ERROR("can not use condition-trigger-mode in cross server!")
%%	end.
%%
%%
%%
%%%%获取数据时需要先将数据发送给客户端一次。
%%repair_mirror(IsRepairAll) ->
%%%%  KingBattleHpPerCoin=500,?CoinTypeDiamond
%%	%%world_guardian_one
%%	{CoinType, KingBattleHpPerCoinPer} = globalCfg:getGlobalCfg(kingBattleRepairMirrorCfg),
%%	World_guardian_one = globalCfg:getGlobalCfg(world_guardian_one),
%%	CurrentRoleID = playerState:getRoleID(),
%%	{ok, State} = activityLogic:getActivePhase(?ActivityType_KingBattleAll),
%%	case acKingBattleAllLogic:getDefenderInfo(CurrentRoleID) of
%%		{ok, #rec_guard_mirror{hpNumber = HpNumber,guardTimes = GuaidTimes} = Mirror} when ?ActivityPhase_KingBattleAll_5 =/= State ->
%%			FightForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
%%
%%
%%			MaxHp = acKingBattleAllLogic:calculationMaxHp(FightForce,GuaidTimes),
%%			KingBattleHpPerCoin = KingBattleHpPerCoinPer * MaxHp,
%%			RepairHp =
%%				case IsRepairAll of true
%%					->
%%					MaxHp - HpNumber;
%%					_ ->
%%						OneRepairHp = KingBattleHpPerCoin * World_guardian_one,
%%						NeedHp = MaxHp - HpNumber,
%%						if
%%							OneRepairHp > NeedHp ->
%%								NeedHp;
%%							true ->
%%								OneRepairHp
%%						end
%%				end,
%%			%%?DEBUG("========repair_mirror==1111=====~p~n", [{MaxHp, HpNumber, FightForce, RepairHp, KingBattleHpPerCoin, CoinType, playerState:getCoin(CoinType)}]),
%%
%%			if
%%				RepairHp > 0 ->
%%					ReapirNeedCoin = erlang:round(RepairHp / KingBattleHpPerCoin),
%%					Plog =
%%						#recPLogTSMoney{
%%							reason = ?CoinUseKingBattleAll,
%%							param = [RepairHp],
%%							target = ?PLogTS_Item4KingBattleAll,
%%							source = ?PLogTS_PlayerSelf
%%						},
%%					{CoinUseType, CurrenCoin} = playerMoney:getCoinInfo(CoinType),
%%					if
%%						CurrenCoin > ReapirNeedCoin ->
%%							UseCoin = ReapirNeedCoin,
%%							NewHp =
%%								case IsRepairAll of true
%%									->
%%									MaxHp;
%%									_ ->
%%										HpNumber + RepairHp
%%								end;
%%						true ->
%%							UseCoin = CurrenCoin,
%%							NewHp = HpNumber + erlang:trunc(UseCoin * KingBattleHpPerCoin)
%%					end,
%%					case playerMoney:useCoin(CoinUseType, UseCoin, Plog) of
%%						true ->
%%							acKingBattleAllLogic:updateDefenderInfo(Mirror#rec_guard_mirror{hpNumber = NewHp, fightForce = FightForce, roleLevel = playerState:getLevel()}),
%%							playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleRepairTips, [UseCoin, erlang:trunc(NewHp - HpNumber)]),
%%							Msg = #pk_GS2U_KingBattleRepairMirror{
%%								mirrorMaxHp = erlang:trunc(MaxHp),
%%								mirrorCurrentHp = erlang:trunc(NewHp)},
%%							playerMsg:sendNetMsg(Msg);
%%						_ ->
%%							playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Diamond_Not_Enough)
%%					end;
%%				true ->
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleNotNeedRepair)
%%			end;
%%		{ok, #rec_guard_mirror{}} ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleOpenFobidRepairMirror);
%%		_ ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleOpDeny)
%%	end,
%%	ok.
%%
%%%%Msg = {error,?ErrorCode_KingBattleNoKing};
%%%%%%        ErrorCode_KingBattleNotJoin
%%
%%%%刷新buff信息
%%flashBuffInfo() ->
%%	CurrentRoleID = playerState:getRoleID(),
%%	Msg =
%%	case acKingBattleAllLogic:getCurrentDefenderInfo() of
%%		{ok, #rec_guard_mirror{roleID = CurrentRoleID, mirrorBuffCfgID = MirrorBuffID, roleBuffCffgID = DefendeiBuffID}} ->
%%			#pk_GS2U_KingBattleBuffInfo{
%%				defenderBuffcfgID = DefendeiBuffID,
%%				mirrorBuffcfgID = MirrorBuffID,
%%				attackerBuffcfgID = 0};
%%		{ok, #rec_guard_mirror{mirrorBuffCfgID = MirrorBuffID, roleBuffCffgID = DefendeiBuffID}} ->
%%			case acKingBattleAllLogic:getAttackerInfo(CurrentRoleID) of
%%				{error, none} ->
%%					{error, ?ErrorCode_KingBattleNotJoin};
%%				{ok, #king_battle_attacker{buffCfgID = BuffCfgID}} ->
%%					#pk_GS2U_KingBattleBuffInfo{
%%						defenderBuffcfgID = DefendeiBuffID,
%%						mirrorBuffcfgID = MirrorBuffID,
%%						attackerBuffcfgID = BuffCfgID}
%%			end;
%%		_ ->
%%			{error, ?ErrorCode_KingBattleNoKing}
%%	end,
%%	case Msg of
%%		{error, ErrorCode} ->
%%			playerMsg:sendErrorCodeMsg(ErrorCode);
%%		_ ->
%%			playerMsg:sendNetMsg(Msg)
%%	end.
%%%% ====================================================================
%%%% Internal functions
%%%% ====================================================================
%%
%%binToString(BinStr) when erlang:is_list(BinStr) ->
%%	BinStr;
%%binToString(BinStr) ->
%%	erlang:binary_to_list(BinStr).
%%
%%
%%%%获取守护者雕像数据
%%getCurrentDefenderModelData()->
%%	case acKingBattleAllLogic:getCurrentDefenderInfo() of
%%		{ok, #rec_guard_mirror{roleID = RoleID}} ->
%%
%%			case acKingBattleAllLogic:getMirrorAppearance(RoleID) of
%%				{ok, #king_battle_mirror_appearance{equipIDList = EquipList,  wingLevel = WingLevel,fashionIDList = FashionIDList}} ->
%%					MsgEquipmentList = [#pk_PlayerEquip{equipID = EquipID, quality = Quarlity} || #recVisibleEquip{equipID = EquipID, quality = Quarlity} <- EquipList],
%%					case  core:queryRoleKeyInfoByRoleID(RoleID) of
%%						#?RoleKeyRec{roleName = Name, career = Career, race = Race, sex = Sex, head = Head}->
%%							[#pk_RankModelData{roleID = RoleID, sb_type = 1,name = Name,career = Career,race = Race,sex = Sex,head = Head,wingLevel = WingLevel,
%%							                  fashionIDs = FashionIDList,equipIDList = MsgEquipmentList}];
%%						_->
%%							[]
%%					end;
%%				_ ->
%%					[]
%%			end;
%%		_->
%%			[]
%%	end.
%%
%%
%%
%%
