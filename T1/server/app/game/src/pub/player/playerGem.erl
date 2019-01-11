%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% @end
%%% Created : 04. 七月 2017 11:34
%%%-------------------------------------------------------------------
-module(playerGem).
-author("Administrator").

-include("gsInc.hrl").
-include("playerPropSyncDefine.hrl").
-include("playerPrivate.hrl").

-define(GemOpType_LevelUp, 1).
-define(GemOpType_EmbedOn, 2).
-define(GemOpType_EmbedOff, 3).
-define(GemOpType_GemPackageLevelUp, 4).

-define(GemMixNum, 2).

-define(GemSlotRedUpper, 3).
-define(GemSlotCommon, 2).


%% API
-export([
	initGem/0,
	gemOperate/4,
	onEquipChange/3,
	onEquipOff/1,
	getEquipGemProps/1,
	makeNetMsg/1				%%导出给外部调用，生成Msg，
]).


%%
initGem() -> 
	L = getGemInfo(),
	Msg = #pk_GS2U_EquipGemInfos{
		equipGemInfos = [makeNetMsg(GemInfo) || GemInfo <- L]
	},
	playerMsg:sendNetMsg(Msg).

gemOperate(_Type, Pos, _Slot, _Param) when Pos < ?EquipTypeStart, Pos > ?EquipTypeMax ->
	skip;
gemOperate(?GemOpType_LevelUp, EquipType, Slot, NoUse) ->
	gemLevelUp(EquipType, Slot, NoUse);
gemOperate(?GemOpType_EmbedOn, EquipType, Slot, GemUID) ->
	gemEmbedOn(EquipType, Slot, GemUID);
gemOperate(?GemOpType_EmbedOff, EquipType, Slot, _NoUse) ->
	gemEmbedOff(EquipType, Slot, true);
gemOperate(?GemOpType_GemPackageLevelUp, _EquipType, _Slot, GemID) ->
	packageGemLevelUp(GemID);
gemOperate(_Type, EquipType, _Slot, _Param) ->
	?ERROR("gemOperate(~p)", [{_Type, EquipType, _Slot, _Param}]),
	ok.
%%%-------------------------------------------------------------------
packageGemLevelUp(GemID) ->
	case canPackageGemLevelUp(GemID) of
		{true, GemID, NextGem, CostGold} ->
			doPackageGemLevelUp(GemID, NextGem, CostGold);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end,
	ok.

doPackageGemLevelUp(GemID, NextGemID, CostGold) ->
	true =
		playerMoney:useCoin(
			?CoinUseTypeGold,
			CostGold,
			#recPLogTSMoney{
				reason = ?CoinUseGemMix,
				param = NextGemID,
				target = ?PLogTS_Item,
				source = ?PLogTS_PlayerSelf
			}
		),

	DecGemNumber = ?GemMixNum,
	PLog = #recPLogTSItem{
		old = 0,
		new = 0,
		change = -DecGemNumber,
		target = ?PLogTS_GemEmbed,
		source = ?PLogTS_PlayerSelf,
		gold = CostGold,
		goldtype = ?CoinUseTypeGold,
		changReason = ?ItemDeleteReasonGemMake,
		reasonParam = NextGemID
	},
	%true = playerPackage:delGoodsByID(
	%	?Item_Location_Gem_Bag, GemID, DecGemNumber, PLog),
	true = playerPackage:delGoodsByID(
		?Item_Location_Bag, GemID, DecGemNumber, PLog),

	playerAchieve:achieveEvent(?Achieve_AttachedSpec, [1]),
	playerPackage:addGoodsAndMail(
		NextGemID,
		1,
		true,
		0,
		PLog#recPLogTSItem{change = 1}
	),
	ok.

canPackageGemLevelUp(GemID) ->
	%case playerPackage:getBagIdleSlotNum(?Item_Location_Gem_Bag) > 0 of
	case playerPackage:getBagIdleSlotNum(?Item_Location_Bag) > 0 of
		true ->
			%case playerPackage:getGoodsNumByID(?Item_Location_Gem_Bag, GemID) of
			case playerPackage:getGoodsNumByID(?Item_Location_Bag, GemID) of
				GemNum when GemNum >= ?GemMixNum ->
					checkGemLevelUpCost(GemID);
				_ ->
					{false, ?ErrorCode_EquipSlotCostNotEnough}
			end;
		_ ->
			{false, ?ErrorCode_BagItem_GemFull}
	end.
%%%-------------------------------------------------------------------

gemLevelUp(EquipType, Slot, _Param) ->
	case canGemLevelUp(EquipType, Slot) of
		{true, GemID, NextGem, CostGold} ->
			doGemLevelUp(EquipType, Slot, GemID, NextGem, CostGold);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end,
	ok.

doGemLevelUp(EquipType, Slot, GemID, NextGemID, CostGold) ->
	true =
		playerMoney:useCoin(
			?CoinUseTypeGold,
			CostGold,
			#recPLogTSMoney{
				reason = ?CoinUseGemMix,
				param = NextGemID,
				target = ?PLogTS_Item,
				source = ?PLogTS_PlayerSelf
			}
		),

	DecGemNumber = ?GemMixNum - 1,
	
	PLog = #recPLogTSItem{
		old = 0,
		new = 0,
		change = -DecGemNumber,
		target = ?PLogTS_GemEmbed,
		source = ?PLogTS_PlayerSelf,
		gold = CostGold,
		goldtype = ?CoinUseTypeGold,
		changReason = ?ItemDeleteReasonGemMake,
		reasonParam = NextGemID
	},

	true = playerPackage:delGoodsByID(
		%?Item_Location_Gem_Bag,
		?Item_Location_Bag,
		GemID,
		DecGemNumber,
		PLog
	),
	playerAchieve:achieveEvent(?Achieve_AttachedSpec, [1]),


	gemChangeProp(EquipType, ?EquipOff, false),
	saveSlotGem(EquipType, Slot, NextGemID),
	gemChangeProp(EquipType, ?EquipOn, true),
	playerForce:calcPlayerForce(true),
	ok.

canGemLevelUp(EquipType, Slot) ->
	case checkSlotNumber(EquipType, Slot) of
		true ->
			GemID = getSlotGemID(EquipType, Slot),
			case GemID > 0 of
				true ->
					case checkGemNumber(GemID, ?GemMixNum - 1) of
						true ->
							checkGemLevelUpCost(GemID);
						_ ->
							{false, ?ErrorCode_EquipSlotCostNotEnough}
					end;
				_ ->
					{false, ?ErrorCode_EquipSlotInvalidGem}
			end;
		_ ->
			skip
	end.

checkGemNumber(GemID, N) ->
	%playerPackage:getGoodsNumByID(?Item_Location_Gem_Bag, GemID) >= N.
	playerPackage:getGoodsNumByID(?Item_Location_Bag, GemID) >= N.

checkGemLevelUpCost(GemID) ->
	case getCfg:getCfgPStack(cfg_item, GemID) of
		#itemCfg{useParam2 = NextGemID, useParam3 = CurLevel, useParam4 = Color} when NextGemID > 0 ->
			MixPrice = getNextGemCost(Color, CurLevel),
			case playerMoney:canUseCoin(?CoinUseTypeGold, MixPrice) of
				true ->
					{true, GemID, NextGemID, MixPrice};
				_ ->
					{false, ?ErrorCode_TradeGold}
			end;
		_ ->
			skip
	end.

getNextGemCost(Color, CurLevel) ->
	case getCfg:getCfgPStack(cfg_gemproperty, Color, CurLevel) of
		#gempropertyCfg{cost = [{?CoinTypeGold, Price}| _]} ->
			Price;
		#gempropertyCfg{cost = Cost} ->
			%% 配置格式不对，此处需要手动添加错误打印
			?ERROR("invalid cfg_gemproperty.cost=~w Key:~w", [Cost, {Color, CurLevel}]),
			999999999;
		_ ->
			%% 没有取到配置，此处因getCfg:getCfgPStack/3有报错
			999999999
	end.
%%%-------------------------------------------------------------------
gemEmbedOn(EquipType, Slot, GemUID) ->
	case canGemEmbedOn(EquipType, Slot, GemUID) of
		{true, Item, GemID} ->
			doGemEmbedOn(EquipType, Slot, GemID, Item);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end,
	ok.

doGemEmbedOn(EquipType, Slot, CurGem, #rec_item{itemID = NewGem}) ->
	case CurGem > 0 of
		true ->
			PLog = #recPLogTSItem{
				old = 0,
				new = 1,
				change = 1,
				target = ?PLogTS_GemEmbed,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourceGemOff,
				reasonParam = CurGem
			},
			playerPackage:addGoodsAndMail(CurGem, 1, true, 0, PLog);
		_ ->
			skip
	end,

	PDelLog = #recPLogTSItem{
		old = 0,
		new = 0,
		change = -1,
		target = ?PLogTS_GemEmbed,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonGemOn,
		reasonParam = EquipType * 1000000 + Slot
	},
	%true = playerPackage:delGoodsByID(
	%	?Item_Location_Gem_Bag, NewGem, 1, PDelLog),
	true = playerPackage:delGoodsByID(
		?Item_Location_Bag, NewGem, 1, PDelLog),


	gemChangeProp(EquipType, ?EquipOff, false),
	saveSlotGem(EquipType, Slot, NewGem),
	gemChangeProp(EquipType, ?EquipOn, true),
	#itemCfg{useParam3 = Level} = getCfg:getCfgPStack(cfg_item, NewGem),
	playerAchieve:achieveEvent(?Achieve_GemEmbed, [Level, 1]),
	playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Gem),
	playerForce:calcPlayerForce(true),
	ok.


canGemEmbedOn(EquipType, Slot, GemUID) ->
	case checkSlotNumber(EquipType, Slot) of
		true ->
			GemID = getSlotGemID(EquipType, Slot),
			%Item = playerPackage:getGoodsByUID(GemUID, ?Item_Location_Gem_Bag),
			Item = playerPackage:getGoodsByUID(GemUID, ?Item_Location_Bag),
			case Item of
				#rec_item{itemID = ItemID} ->
					case getCfg:getCfgPStack(cfg_gembox_info, EquipType, Slot) of
						#gembox_infoCfg{color = Color} ->
							case getCfg:getCfgPStack(cfg_item, ItemID) of
								#itemCfg{useParam4 = Color} ->
									{true, Item, GemID};
								_ ->
									{false, ?ErrorCode_BagSortGemTypeNotSame}
							end;
						_ ->
							skip
					end;
				_ ->
					{false, ?ErrorCode_EquipGemNotInvalid}
			end;
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
gemEmbedOff(EquipType, Slot, IsNotify) ->
	case canGemEmbedOff(EquipType, Slot) of
		{true, GemID} ->
			doGemEmbedOff(EquipType, Slot, GemID);
		{false, ErrorCode} when IsNotify ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end,
	ok.

doGemEmbedOff(EquipType, Slot, GemID) ->
	gemChangeProp(EquipType, ?EquipOff, false),
	saveSlotGem(EquipType, Slot, 0),
	gemChangeProp(EquipType, ?EquipOn, true),
	playerForce:calcPlayerForce(true),
	PLog = #recPLogTSItem{
		old = 0,
		new = 1,
		change = 1,
		target = ?PLogTS_GemEmbed,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourceGemOff,
		reasonParam = GemID
	},
	playerPackage:addGoodsAndMail(GemID, 1, true, 0, PLog),
	ok.

canGemEmbedOff(EquipType, Slot) ->
	case checkSlotNumber(EquipType, Slot) of
		true ->
			GemID = getSlotGemID(EquipType, Slot),
			case GemID > 0 of
				true ->
					case getCfg:getCfgPStack(cfg_item, GemID) of
						#itemCfg{} ->
							{true, GemID};
						_ ->
							{false, ?ErrorCode_EquipGemNotInvalid}
					end;
				_ ->
					{false, ?ErrorCode_EquipSlotInvalidGem}
			end;
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
getSlotGemID(EquipType, Slot) ->
	L = getGemInfo(),
	case lists:keyfind(EquipType, #recGemInfo.type, L) of
		#recGemInfo{gems = Gems} ->
			case lists:keyfind(Slot, #recSlotInfo.slot, Gems) of
				#recSlotInfo{gemID = GemID} ->
					GemID;
				_ ->
					0
			end;
		_ ->
			0
	end.

%%%-------------------------------------------------------------------
saveSlotGem(EquipType, Slot, GemID) ->
	L = getGemInfo(),
	NewR =
		case lists:keyfind(EquipType, #recGemInfo.type, L) of
			#recGemInfo{gems = Gems} = R ->
				R#recGemInfo{
					gems = lists:keystore(
						Slot,
						#recSlotInfo.slot,
						Gems,
						#recSlotInfo{slot = Slot, gemID = GemID}
					)
				};
			_ ->
				#recGemInfo{
					type = EquipType,
					gems = [#recSlotInfo{slot = Slot, gemID = GemID}]
				}
		end,
	L1 = lists:keystore(EquipType, #recGemInfo.type, L, NewR),
	setGemInfo(L1),
	updateGemInfo2Client(NewR),
	ok.

getGemInfo() ->
	playerPropSync:getProp(?SerProp_EquipGems).

setGemInfo(L) ->
	ListGemID = getGemIDFromGemID(L, []),
	updateFloatingAchieve(ListGemID),
	playerSevenDayAim:updateCondition(?SevenDayAim_GemLevel, ListGemID),
	playerPropSync:setAny(?SerProp_EquipGems, L).

getGemIDFromGemID([], Acc) ->
	Acc;
getGemIDFromGemID([#recGemInfo{gems = ListGem} | T], Acc) ->
	getGemIDFromGemID(ListGem ++ T, Acc);
getGemIDFromGemID([#recSlotInfo{gemID = GemID} | T], Acc) ->
	getGemIDFromGemID(T, [GemID | Acc]).

%%%-------------------------------------------------------------------
gemChangeProp(EquipType, Type, IsNotify) ->
	case playerEquip:getEquipByType(EquipType) of
		{true, Equip} ->
			playerEquip:equipChangeProp(Equip, Type, IsNotify);
		_ ->
			?ERROR("gemChangeProp,p[~p]op[~p],equip[~p]",
				[playerState:getRoleID(), Type, EquipType]),
			throw("equip gem error")
	end.
%%%-------------------------------------------------------------------
onEquipChange(EquipType, #recSaveEquip{} = OldEquip, #recSaveEquip{} = NewEquip) ->
	OldSlotNumber = getEquipTypeSlotNumber(EquipType, OldEquip),
	NewSlotNumber = getEquipTypeSlotNumber(EquipType, NewEquip),
	case NewSlotNumber < OldSlotNumber of
		true ->
			lists:foreach(
				fun(Slot) ->
					GemID = getSlotGemID(EquipType, Slot),
					case GemID > 0 of
						true ->
							saveSlotGem(EquipType, Slot, 0),
							PLog = #recPLogTSItem{
								old = 0,
								new = 1,
								change = 1,
								target = ?PLogTS_GemEmbed,
								source = ?PLogTS_PlayerSelf,
								gold = 0,
								goldtype = 0,
								changReason = ?ItemSourceGemOff,
								reasonParam = GemID
							},
							playerPackage:addGoodsAndMail(GemID, 1, true, 0, PLog);
						_ ->
							skip
					end
				end, lists:seq(NewSlotNumber + 1, OldSlotNumber));
		_ ->
			skip
	end,
	ok;
onEquipChange(_EquipType, _OldEquip, _NewEquip) ->
	ok.

onEquipOff(#recSaveEquip{itemID = EquipID} = Equip) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{type = EquipType} ->
			SlotNumber = getEquipTypeSlotNumber(EquipType, Equip),
			lists:foreach(
				fun(Slot) ->
					GemID = getSlotGemID(EquipType, Slot),
					case GemID > 0 of
						true ->
							doGemEmbedOff(EquipType, Slot,GemID);
						_ ->
							skip
					end
				end, lists:seq(1, SlotNumber));
		_ ->
			skip
	end;
onEquipOff(_Equip) ->
	ok.

%%%-------------------------------------------------------------------
getEquipGemProps(EquipType)->
	L = getGemInfo(),
	case lists:keyfind(EquipType, #recGemInfo.type, L) of
		#recGemInfo{gems = Gems}->
			lists:foldl(
				fun(#recSlotInfo{gemID = GemID}, Acc)->
					  gemProperty(GemID) ++ Acc
				end, [], Gems);
		_ ->
			[]
	end.

gemProperty(0)->
	[];
gemProperty(GemID)->
	#itemCfg{useParam3 = Level, useParam4 = Color} = getCfg:getCfgPStack(cfg_item, GemID),
	case getCfg:getCfgByArgs(cfg_gemproperty, Color, Level) of
		#gempropertyCfg{pro = PropList}->
			PropList;
		_ ->
			[]
	end.


%%%-------------------------------------------------------------------
checkSlotNumber(EquipType, Slot) ->
	getEquipTypeSlotNumber(EquipType) >= Slot andalso Slot > 0.

getEquipTypeSlotNumber(EquipType) when erlang:is_integer(EquipType) ->
	case playerEquip:getEquipByType(EquipType) of
		{true, #recSaveEquip{} = Equip} ->
			getEquipTypeSlotNumber(EquipType, Equip);
		_ ->
			0
	end;
getEquipTypeSlotNumber(_) ->
	0.

getEquipTypeSlotNumber(EquipType, #recSaveEquip{itemID = ItemID}) ->
	#equipmentCfg{equipLevel = EquipLevel} = getCfg:getCfgPStack(cfg_equipment, ItemID),
	getSlotNumberFromCfg(EquipType, EquipLevel);
getEquipTypeSlotNumber(_,_) ->
	0.

getSlotNumberFromCfg(EquipType, EquipLevel)->
	L = getCfg:get2KeyList(cfg_gembox_info, EquipType),
	lists:foldl(
		fun(Slot, AccSlotNumber)->
			case getCfg:getCfgByArgs(cfg_gembox_info, EquipType, Slot) of
				#gembox_infoCfg{level = Lvl} when EquipLevel >= Lvl ->
					AccSlotNumber + 1;
				_ ->
					AccSlotNumber
			end
		end, 0, L).



updateGemInfo2Client(#recGemInfo{} = GemInfo) ->
	Msg = #pk_GS2U_EquipGemInfoUpdate{equipGemInfo = makeNetMsg(GemInfo)},
	playerMsg:sendNetMsg(Msg),
	ok;
updateGemInfo2Client(_) ->
	skip.

makeNetMsg(#recGemInfo{type = Pos, gems = Gems}) ->
	#pk_EquipGemInfo{
		equipPos = Pos,
		gemList = [#pk_GemEmbedInfo{slot = Slot, gemID = GemID} || #recSlotInfo{slot = Slot, gemID = GemID} <- Gems]
	}.



updateFloatingAchieve(Args)->


	%% 根据配置表cfg_gemproperty获取纹章最大等级，以便生成合适长度的列表
	FunGetGemLevelMax =
		fun(Key1, Max0) ->
			ListMax1 = getCfg:get2KeyList(cfg_gemproperty, Key1),
			Max1 = lists:max(ListMax1),
			erlang:max(Max0, Max1)
		end,
	GemLevelMax = lists:foldl(FunGetGemLevelMax, 0, getCfg:get1KeyList(cfg_gemproperty)),
	ListGem0 = [{Level, 0} || Level <- lists:seq(1, GemLevelMax)],
	%% 根据当前装备的纹章（来自传参），计算出当前的各等级纹章数量
	FunCount =
		fun
			(0, ListGemAcc) ->
				ListGemAcc;
			(GemID, ListGemAcc) ->
				#itemCfg{useParam3 = Level} = getCfg:getCfgPStack(cfg_item, GemID),
				case lists:keyfind(Level, 1, ListGemAcc) of
					false ->
						[{Level, 1} | ListGemAcc];
					{_, Count} ->
						lists:keyreplace(Level, 1, ListGemAcc, {Level, Count + 1})
				end
		end,
	ListGem1 = lists:foldl(FunCount, ListGem0, Args),

%%这里，检查2-10级的 穿在身上的纹章数量，判断成就达成
	F =
		fun({Lel,Count}) ->
			case Lel of
				2->
					playerAchieve:setAchieveEevent(?Achieve_Floating_2level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_2level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_2level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_2level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_2level_GemEmbed_5,Count);

				3->
					playerAchieve:setAchieveEevent(?Achieve_Floating_3level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_3level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_3level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_3level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_3level_GemEmbed_5,Count);

				4->
					playerAchieve:setAchieveEevent(?Achieve_Floating_4level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_4level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_4level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_4level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_4level_GemEmbed_5,Count);
				5->
					playerAchieve:setAchieveEevent(?Achieve_Floating_5level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_5level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_5level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_5level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_5level_GemEmbed_5,Count);
				6->
					playerAchieve:setAchieveEevent(?Achieve_Floating_6level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_6level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_6level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_6level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_6level_GemEmbed_5,Count);
				7->
					playerAchieve:setAchieveEevent(?Achieve_Floating_7level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_7level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_7level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_7level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_7level_GemEmbed_5,Count);
				8->
					playerAchieve:setAchieveEevent(?Achieve_Floating_8level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_8level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_8level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_8level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_8level_GemEmbed_5,Count);
				9->
					playerAchieve:setAchieveEevent(?Achieve_Floating_9level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_9level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_9level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_9level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_9level_GemEmbed_5,Count);
				10->
					playerAchieve:setAchieveEevent(?Achieve_Floating_10level_GemEmbed_1,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_10level_GemEmbed_2,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_10level_GemEmbed_3,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_10level_GemEmbed_4,Count),
					playerAchieve:setAchieveEevent(?Achieve_Floating_10level_GemEmbed_5,Count);
				  _->
					sikp
			end

		end,
	    lists:foreach(F,ListGem1),


	ok.

%%info() ->
%%%%	1:1
%%%%	binary | pb
%%%%	decode on receive  | on tick
%%%%	playerMgr -> tick all playerOtp | tick on map tick  | self tick
%%%%	mapMgr -> tick all mapOtp | self tick
%%%%
%%	ok.