%%
%% @doc @todo 装备系统.

-module(playerEquip).
-include("playerPrivate.hrl").
-define(UpStar_NoItem_Fail, 0).%%冲星材料不够,失败
-define(UpStar_NoCoin_Fail, 1).%%冲星材料不够,失败
-define(UpStar_Prog_Succ, 2).%%冲星当前进度,成功
-define(UpStar_Lv_Succ, 3).%%冲星等级,成功
-define(UpStar_Fail, 4).%%冲星失败
-define(UpStar_IsUP_Fail, 5).%%冲星需要突破

-define(EachUpStar, 0).%%单次冲星
-define(QuickUpStar, 1).%%快速冲星
-define(AllEquipStar, 2).%%全部位冲星

-define(RefineSuccess, 1).%%精炼成功
-define(RefineFail, 2).%%精炼失败

-define(InitNum, 0).%%初始合成装备次数
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initRoleDefaultEquip/0,
	getEquipQuailtyRatio/1,
	makeEquip/5,
	equipSalePrice/1,
	equipResolve/1,
	sharedEquip/1,
	getPlayerVisibleEquip/0,
	getEquipQuality/1,
	getEquipByType/1,
	getRefineLevel/0,
	getStartLevel/0,
	getEquipType/1,
	getSuitRefineLevel/1
%%	getAffixesCfg/2,
]).

-export([
	onEquipOn/2,
	onEquipOff/2,
	equipChangeProp/3
]).

%%装备精炼
-export([
	initEquipRefine/0,
	equipRefine/3,
	equipRefineOneKey/0,
	sendRefineList/1
	%%checkAndRepairRefineAchieve/0
]).

%%装备冲星
-export([
	initEquipStar/0,
	allEquipUpStar/2
	%%fixLUN8636/0
]).

%% 装备合成刷新属性
-export([
	equipmentCombineClean/0
]).

%%根据角色初始化默认装备，并穿到身上
-spec initRoleDefaultEquip() -> ok.
initRoleDefaultEquip() ->
	CareerID = playerState:getCareer(),
	case getCfg:getCfgPStack(cfg_player_desc, CareerID) of
		#player_descCfg{equip = EquipIDList} when erlang:is_list(EquipIDList)
			andalso erlang:length(EquipIDList) > 0 ->
			[initEquip(CareerID, EquipID) || EquipID <- EquipIDList, EquipID > 0],
			playerForce:calcPlayerForce(?PlayerEquipForce, true);
		_ ->
			skip
	end,
	ok.

%%根据装备ID和装备品质，生成装备，包括基础装备、特殊装备、套装装备
-spec makeEquip(EquipID, _Quality, BagType, IsBind, PLog) -> #recSaveEquip{}
	when EquipID :: itemId(), _Quality :: equipQuality(), BagType :: bagType(), IsBind :: boolean(), PLog :: #recPLogTSItem{}.
makeEquip(EquipID, _, BagType, IsBind, PLog) ->
	#equipmentCfg{qualityType = Quality} = EquipCfg = getCfg:getCfgPStack(cfg_equipment, EquipID),
	{NewQuality, RealQuality} = recalcQuality(EquipID, Quality),
	EquipUID = uidMgr:makeItemUID(),
	?INFO("player:~p make EquipID:~p UID:~p Quality:~p BagType:~p IsBind:~p", [playerState:getRoleID(), EquipID, EquipUID, RealQuality, BagType, IsBind]),
	{BaseProp, ExtProp} =
		if
		%%绿色到红色
			NewQuality >= ?EquipColorTypeGreen andalso NewQuality =< ?EquipColorTypeMax ->  %%绿色装备有基础属性和附加属性
				{
					makeEquipBaseProp(EquipID, NewQuality, EquipUID),
					#rec_equip_ext_info{equipUID = EquipUID}
				};
			true ->
				%%默认为白色,装备只有基础属性
				{
					makeEquipBaseProp(EquipID, ?EquipColorTypeWhite, EquipUID),
					#rec_equip_ext_info{equipUID = EquipUID}
				}
		end,
	%%这里判定并添加防御加成
	#recSaveEquip{
		roleID = 0,
		itemUID = EquipUID,
		itemID = EquipID,
		pos = BagType,
		isBind = IsBind,
		quality = RealQuality,
		createTime = misc_time:utc_seconds(),
		expiredTime = 0,
		baseProp = BaseProp,
		extProp = ExtProp,
		enhanceProp = makeEquipEnahanceProp(PLog, EquipCfg, EquipUID)
	}.

recalcQuality(_EquipID, Quality) -> {Quality, Quality}.

%%
-spec makeEquipEnahanceProp(PLog::#recPLogTSItem{}, EquipCfg::#equipmentCfg{}, EquipUID::uint64()) -> #rec_equip_enhance_info{}.
makeEquipEnahanceProp(
	#recPLogTSItem{changReason = ?ItemSourceExchangeEquip, reasonParam = SourceID},
	#equipmentCfg{qualityType = Quality, equipLevel = EquipLevel} = EquipCfg,
	EquipUID
) ->
	Count = equipmentCombine(true, SourceID, 1),
	case getCfg:getCfgByKey(cfg_equipment_randomprop_ex, Quality, EquipLevel, Count) of
		#equipment_randomprop_exCfg{region_1 = Region1, region_2 = Region2, region_3 = Region3, region_4 = Region4}
			when erlang:is_integer(Region1) andalso erlang:is_integer(Region2)
			andalso erlang:is_integer(Region3) andalso erlang:is_integer(Region4) ->
			makeEquipEnahanceProp(EquipCfg, EquipUID, true, [Region1, Region2, Region3, Region4]);
		_ ->
			%% 找不到视为不加成
			makeEquipEnahanceProp(EquipCfg, EquipUID, false, [])
	end;
makeEquipEnahanceProp(_PLog, EquipCfg, EquipUID) ->
	makeEquipEnahanceProp(EquipCfg, EquipUID, false, []).


%%套装定制奖励根据ID,套装个数进行战斗奖励
-spec equipSuitAward(Type, EquipID, IsNotify) -> ok when Type :: atom(), EquipID :: uint(), IsNotify :: boolean().
equipSuitAward(Type, EquipID, IsNotify) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{qualityType = QualityType, tierBonusID = TierBonusID} when TierBonusID =/= 0 ->
			Count = getBodyEquipByBonusID(TierBonusID),
			case QualityType =:= ?EquipTypeSuit andalso Count > 1 of
				true ->
					equipSuitAward2(Type, TierBonusID, Count, IsNotify);
				false ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%%装备的出售价格
%%装备出售价格 = 装备原始价格 * selloff * global_in
-spec equipSalePrice(Equip) -> uint() when Equip :: #recSaveEquip{}.
equipSalePrice(Equip) ->
	EquipSourcePrice = equipSourcePrice(Equip), %%装备原始价格
	SellOff = getConfigValueByName(selloff),    %%出售折扣值
	GlobalIn = getConfigValueByName(global_in),
	EquipSalePrice = EquipSourcePrice * SellOff * GlobalIn,
	case EquipSalePrice >= 1 of
		true ->
			erlang:trunc(EquipSalePrice);
		_ ->
			1
	end.

%%分解装备背包里的装备
-spec equipResolve(EquipUID) -> ok | [] when EquipUID :: uint().
equipResolve(EquipUID) ->
	Equip = playerPackage:getGoodsByUID(EquipUID, ?Item_Location_Equip_Bag),
	case Equip of
		#recSaveEquip{isLocked = false} ->
			case equipResolveProcess(Equip) of %%调用装备分解
				[PurpleEssence, GoldenEssence,ItemList] ->
					[PurpleEssence, GoldenEssence,ItemList];
				_Ret ->
					?DEBUG("[DebugForEquip] equipResolveProcess return _Ret:~w", [_Ret]),
					ok
			end;
		_ ->
			?DEBUG("[DebugForEquip] ~w is locked", [EquipUID]),
			ok
	end.

%%玩家共享装备
-spec sharedEquip(EquipUIDs) -> ok when EquipUIDs :: [uint(), ...].
sharedEquip(EquipUIDs) ->
	Fun = fun(EquipUID) ->
		Equip = playerPackage:getGoodsByUID(EquipUID, ?Item_Location_Equip_Bag),
		case Equip of
			#recSaveEquip{} ->
				psMgr:sendMsg2PS(?PsNameMain, playerSharedEquip, Equip);
			_ ->
				EquipBody = playerPackage:getGoodsByUID(EquipUID, ?Item_Location_BodyEquipBag),
				case EquipBody of
					#recSaveEquip{} ->
						psMgr:sendMsg2PS(?PsNameMain, playerSharedEquip, EquipBody);
					_ ->
						skip
				end
		end
		  end,
	lists:foreach(Fun, EquipUIDs),
	ok.

%%获取玩家当前身上对远程玩家可见的装备
-spec getPlayerVisibleEquip() -> []|[#pk_visibleEquip{}, ...].
getPlayerVisibleEquip() ->
	Bag = playerState:getPackage(?Item_Location_BodyEquipBag),
	Fun = fun(Equip, VisibleEquipList) ->
		case Equip of
			#recSaveEquip{itemID = EquipID, quality = Quality} ->
				case checkIsVisible(EquipID) of
					true ->
						VisibleEquip = #pk_visibleEquip{
							equipID = EquipID,
							quality = Quality
						},
						[VisibleEquip | VisibleEquipList];
					false ->
						VisibleEquipList
				end;
			_ ->
				VisibleEquipList
		end
		  end,
	lists:foldl(Fun, [], Bag).

%%根据配置的品质分类产生具体的品质值
-spec getEquipQuality(QualityType) -> uint() when QualityType :: uint().
getEquipQuality(QualityType) ->
	case QualityType of
		?EquipTypeNormal ->
			Quality = lists:nth(random:uniform(4), [?EquipColorTypeWhite, ?EquipColorTypeGreen,
				?EquipColorTypeBlue, ?EquipColorTypePurple]);
		?EquipTypeSpecial ->
			Quality = ?EquipColorTypeOrange;
		?EquipTypeSuit ->
			Quality = ?EquipColorTypeRed;
		_ ->
			Quality = ?EquipColorTypeInvalid
	end,
	Quality.

onEquipOn(#recSaveEquip{baseProp = BaseProp, itemID = EquipID, quality = Quality} = Equip, IsNotifyClient) ->
	#equipmentCfg{
		skill1 = SkillID1,
		skill2 = SkillID2,
		normal_comboSkill = NormalSkill
	} = getCfg:getCfgPStack(cfg_equipment, EquipID),

	%%增加装备技能
	equipComboSkill(NormalSkill, ?EquipOn),
	playerSkill:addGoodsSkill(SkillID1, BaseProp#rec_equip_base_info.skillLevel1),
	playerSkill:addGoodsSkill(SkillID2, BaseProp#rec_equip_base_info.skillLevel2),

	equipChangeProp(Equip, ?EquipOn, true), %%修改战斗属性
	equipSuitAward(equipOn, EquipID, true),
	%%品质成就
	if
		Quality =:= ?EquipColorTypeBlue ->
			playerAchieve:achieveEvent(?Achieve_weapon_quality_2, [Quality]);
		Quality =:= ?EquipColorTypeRed ->
			playerAchieve:achieveEvent(?Achieve_weapon_quality_3, [Quality]);
		Quality =:= ?EquipColorTypePurple ->
			playerAchieve:achieveEvent(?Achieve_weapon_quality_4, [Quality]);
		true ->
			skip
	end,

	case IsNotifyClient of
		true ->
			visibleEquipOnBroadcast(EquipID, Quality);  %%广播给周围玩家
		_ ->
			skip
	end,

	changeSuitRefineProp(getRefineLevel(), ?EquipOn, true),
	changeSuitStarProp(getStartLevel(), ?EquipOn, true),
	playerForce:calcPlayerForce(?PlayerEquipForce, true).

onEquipOff(#recSaveEquip{itemID = EquipID} = Equip, IsNotify) ->
	%%脱武器时，把武器影响的攻击间隔取消
	%%删除装备技能

	#equipmentCfg{
		type = EquipType,
		skill1 = SkillID1,
		skill2 = SkillID2,
		normal_comboSkill = NormalSkill
	} = getCfg:getCfgPStack(cfg_equipment, EquipID),

	equipComboSkill(NormalSkill, ?EquipOff),
	playerSkill:delGoodsSkill(SkillID1),
	playerSkill:delGoodsSkill(SkillID2),

	case EquipType of
		?EquipTypeWeapon ->
			case playerState2:getCrossApply() of
				#recCrossApply{applyID = ApplyID, activityType = ?ActivityType_CrossAlive} ->
					Msg = {?ActivityType_CrossAlive, {ApplyID, playerState:getRoleID()}},
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrossActivity_Alive_Offweapon),
					?DEBUG("[DebugForAlive] cancel~w", [?ErrorCode_CrossActivity_Alive_Offweapon]),
					gsCsInterface:sendMsg2CenterServer(transit, {self(), center, ?PsNameCSActivityMgr, cac_cancel, Msg});
				_ ->
					?DEBUG("[DebugForAlive] cancel"),
					skip	%% 忽略没有报名的情况
			end,
			playerState:setAttackIntervalTime(?DefaultAttackInternalTime);
		_ ->
			skip
	end,

	equipSuitAward(equipOff, EquipID, IsNotify),
	equipChangeProp(Equip, ?EquipOff, IsNotify),%%修改战斗属性
	visibleEquipOffBroadcast(Equip#recSaveEquip.itemID, EquipType),  %%广播给周围玩家

	%% 去掉精练套装属性
	changeSuitRefineProp(getRefineLevel(), ?EquipOff, true),
	changeSuitStarProp(getStartLevel(), ?EquipOff, true),
	playerForce:calcPlayerForce(?PlayerEquipForce, IsNotify).

%% 检查装备是否穿满
getOnAllEquipNumber() ->
	getOnAllEquipNumber(?EquipTypeStart, 0).
getOnAllEquipNumber(EquipType, Number) when EquipType >= ?EquipTypeStart andalso EquipType =< ?EquipTypeMax ->
	case getEquipByType(EquipType) of
		false ->
			getOnAllEquipNumber(EquipType + 1, Number);
		{true, #recSaveEquip{}} ->
			getOnAllEquipNumber(EquipType + 1, Number + 1)
	end;
getOnAllEquipNumber(_, Number) ->
	Number.
getEquipTypeAllNumber() ->
	?EquipTypeMax - ?EquipTypeStart + 1.

equipComboSkill(0, _Op) ->
	skip;
equipComboSkill(ComSkillID, Op) ->
	CombSkillList =
		case getCfg:getCfgPStack(cfg_comboSkill, ComSkillID) of
			#comboSkillCfg{skills = Skills} ->
				Skills;
			_ ->
				[]
		end,
	lists:foreach(
		fun(SkillID) ->
			case Op of
				?EquipOn ->
					playerSkill:addGoodsSkill(SkillID, 1);
				_ ->
					playerSkill:delGoodsSkill(SkillID)
			end
		end, CombSkillList),
	ok.

%%初始化装备精炼
-spec initEquipRefine() -> ok.
initEquipRefine() ->
	RefineList = playerState:getEquipRefine(),
%%	RefineSuitLevel = getSuitRefineLevel(RefineList),
%%	changeSuitRefineProp(RefineSuitLevel, ?EquipOn, true),
	sendRefineList(RefineList).

getRefineLevel()->
	RefineList = playerState:getEquipRefine(),
	getSuitRefineLevel(RefineList).

%%装备精炼
canEquipRefine(Type,GoodluckCharmId) ->
	case checkEquipRefineType(Type) of
		true ->
			RList = playerState:getEquipRefine(),
			#recEquipRefine{level = Lv} = getPosRefineInfo(Type, RList),
			PLv = playerState:getLevel(),
			case getCfg:getCfgByKey(cfg_equipIntenLevel, Lv, Type) of
				#equipIntenLevelCfg{limit_level = LimitLevel} when LimitLevel > PLv ->
					{false, ?ErrorCode_BagEquipNotPlayerLevel};
				#equipIntenLevelCfg{rune_odd = Rune_odd} = Cfg ->

					case GoodluckCharmId >0 of
						true ->
							F= fun({ID,Num,_},{In,{GoodId,InitNum}})->

								case ID  of
									GoodId ->
										{true,{GoodId,Num}};
									_->
										{In,{GoodId,InitNum}}
								end
							   end,
							{IsIn,{Gid,N}}  = misc:foldlEx(F,{false,{GoodluckCharmId,0}},Rune_odd),
							case IsIn of
								true->
									case playerPackage:getItemNumByID(Gid) >= N of
										true ->
											case checkEquipRefineMaterial(Cfg) of
												CList when is_list(CList) ->
													{true, [{Gid,N}|CList], RList};
												false ->
													{false, ?ErrorCode_BagEquipRefineMaterialNotEnougth}
											end;
										_ ->
											{false, ?ErrorCode_BagEquipRefineMaterialNotEnougth}
									end;
								_->
									{false, ?ErrorCode_BagEquipRefineMaterialNotEnougth}
							end;
						_->
							case checkEquipRefineMaterial(Cfg) of
								CList when is_list(CList) ->
									{true, CList, RList};
								false ->
									{false, ?ErrorCode_BagEquipRefineMaterialNotEnougth}
							end
					end;
				_ ->
					{false, ?ErrorCode_BagEquipRefineHasMax}
			end;
		_ ->
			{false, ?ErrorCode_BagEquipRefineTypeNotExist}
	end.

equipRefine(Type, IsNotify,GoodluckCharmId) ->
	case getEquipByType(Type) of
		false ->
			skip;
		_ ->
			equipRefine(Type, true, IsNotify,GoodluckCharmId)
	end.

equipRefine(Type, IsCalcForce, IsNotify,GoodluckCharmId) ->
	case canEquipRefine(Type,GoodluckCharmId) of
		{true, CList, RList} ->
			doEquipRefine(Type, CList, RList, IsCalcForce,GoodluckCharmId);
		{_, ErrorCode} when IsNotify ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end,
	ok.

computationsSuccessrate(Bless, FailOdd, FailMin, Odd) ->

	case Bless < FailOdd * 10000 * FailMin of
		true -> ?RefineFail;
		_ ->
			Rand = random:uniform(10000),
			case Rand =< (Odd * 10000 + Bless) of
				true -> ?RefineSuccess;
				_ -> ?RefineFail
			end
	end.
doEquipRefine(Type, Materials, RefineList, IsCalcForce,GoodluckCharmId) ->
	%% 先扣材料
	delItem(Materials, ?ItemDeleteReasonRefine),

	OldSuitLevel = getSuitRefineLevel(RefineList),

	%% 目前装备跟精炼部位没有关系
	RefineInfo = #recEquipRefine{level = Lv, bless = Bless} = getPosRefineInfo(Type, RefineList),

	#equipIntenLevelCfg{odd = Odd, fail_odd = FailOdd, fail_min = FailMin,standard_odd = Standard_odd,rune_odd = Rune_odd}
		= getCfg:getCfgByKey(cfg_equipIntenLevel, Lv, Type),


	%% 可能精炼失败，失败不增加等级，增加成功率
	IsSuccess =
		case GoodluckCharmId >0 of
			true ->
				F= fun({ID,Num,Successrate},{In,{GoodId,InitNum,SuccRate}})->

					case ID  of
						GoodId ->
							{true,{GoodId,Num,Successrate}};
						_->
							{In,{GoodId,InitNum,SuccRate}}
					end
				   end,
				{IsIn,{_,_,Rate}}  = misc:foldlEx(F,{false,{GoodluckCharmId,0,0}},Rune_odd),
				case IsIn of
					true->
						case  Rate+Odd >= Standard_odd of
							true ->
								Rand = random:uniform(10000),
								case Rand =< (Odd * 10000 + Bless + Rate*10000) of
									true -> ?RefineSuccess;
									_ -> ?RefineFail
								end ;
							_->
								computationsSuccessrate(Bless,FailOdd,FailMin,Odd+Rate)
						end;
					_->
						computationsSuccessrate(Bless,FailOdd,FailMin,Odd)
				end;
			_->
				computationsSuccessrate(Bless,FailOdd,FailMin,Odd)
		end,

	{NLv, NewOdd} =
		case IsSuccess of
			?RefineSuccess ->
				%%装备精炼成功之后记录等级变化日志
				EquipRefine = #rec_log_equip_refine{
					playerID = playerState:getRoleID(),
					type = Type,
					oldLevel = Lv,
					curLevel = Lv + 1,
					time = misc_time:utc_seconds()
				},
				dbLog:sendSaveLogEquipRefine(EquipRefine),
				playerDeadlineGift:updateCondition(?DeadlineGift_Update_WhenRefine, Lv + 1),
				{Lv + 1, 0};
			_ ->
				{Lv, erlang:trunc(FailOdd * 10000 + Bless)}
		end,

	NewRefineInfo = RefineInfo#recEquipRefine{level = NLv, bless = NewOdd},
	NewRList = lists:keystore(Type, #recEquipRefine.pos, RefineList, NewRefineInfo),
	playerState:setEquipRefine(NewRList),
	playerSave:saveRefine(NewRefineInfo),

	case IsSuccess of
		?RefineSuccess ->
			%% 套装加成
			CurSuitLevel = getSuitRefineLevel(NewRList),
			case OldSuitLevel =/= CurSuitLevel of
				true ->
					playerGameNotice:sendGameNotice(?SuitRefineLevel_Notice, CurSuitLevel, 0, 0),

					playerAchieve:achieveEvent(?Achieve_StrongestKing, [1]),

					playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_EquipRedefine, 1),
					changeSuitRefineProp(OldSuitLevel, ?EquipOff, false),
					changeSuitRefineProp(CurSuitLevel, ?EquipOn, false),

					#globalsetupCfg{setpara = RefineL} = getCfg:getCfgByKey(cfg_globalsetup, equipinten_worldtext_limit),
					case lists:member(CurSuitLevel, RefineL) of
						true ->
							String = stringCfg:getString(equipstronger_worldtext_inten, [playerState:getName(), CurSuitLevel]),
							core:sendBroadcastNotice(String);
						_ ->
							skip
					end;
				_ ->
					skip
			end,

			case getEquipByType(Type) of
				{true, _Equip} ->
					%%部位加成
					changePosRefineProp(Lv, Type, ?EquipOff),
					changePosRefineProp(NLv, Type, ?EquipOn);
				_ ->
					skip
			end,

			playerSevenDayAim:updateCondition(?SevenDayAim_EquipRefine, []),
			if
				IsCalcForce ->
					playerForce:calcPlayerForce(?PlayerStrForce, true);
				true ->
					skip
			end,

			playerAchieve:achieveEvent(?Achieve_StrMan, [1]),

			ok;
		_ ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_EquipRefineFailedAddOdd)
			skip
	end,
	playerAchieve:achieveEvent(?Achieve_Floating_refining_1, [1]),
	playerAchieve:achieveEvent(?Achieve_Floating_refining_2, [1]),
	playerAchieve:achieveEvent(?Achieve_Floating_refining_3, [1]),
	playerAchieve:achieveEvent(?Achieve_Floating_refining_4, [1]),
	playerAchieve:achieveEvent(?Achieve_Floating_refining_5, [1]),
	playerliveness:onFinishLiveness(?LivenessRefining, 1),
	sendRefineResult(NewRefineInfo),
%%	equipRefineSpec(NewRList),
	ok.

%% 装备一键精炼
equipRefineOneKey() ->
	EquipTypeList = getEquipRefineOneKeyList(),
	%% 交换精炼顺序，优先精炼武器
	lists:foreach(fun(Type) -> equipRefine(Type, false, false) end, lists:reverse(EquipTypeList)),
	playerForce:calcPlayerForce(?PlayerStrForce, true),
	ok.

%% 装备全部位升星
getEquipStarOneKeyList()->
	EquipTypeList = lists:seq(?EquipTypeStart, ?EquipTypeMax),
	RList0 = playerState:getEquipStarList(),
	RList1 =
		lists:foldl(
			fun(Type, AccIn)->
				case getEquipByType(Type) of
					false ->
						AccIn;
					_ ->
						case lists:keyfind(Type, #recEquipStar.pos, RList0) of
							false ->
								[#recEquipStar{
									bless = 0,
									pos = Type,
									prog = 0,
									star = 0
								} | AccIn];
							V ->
								[V | AccIn]
						end
				end
			end, [], EquipTypeList),
	MinLevel =
		lists:foldl(
			fun(#recEquipStar{pos =_Type,star = Level}, AccMinLevel)->
				case Level < AccMinLevel of
					true ->
						Level;
					_ ->
						AccMinLevel
				end
			end, 999, RList1),
	[EquipType || #recEquipStar{pos = EquipType,star = RefineLevel} <- RList1, RefineLevel =:= MinLevel].

getEquipRefineOneKeyList()->
	EquipTypeList = lists:seq(?EquipTypeStart, ?EquipTypeMax),
	RList0 = playerState:getEquipRefine(),
	RList1 =
		lists:foldl(
			fun(Type, AccIn)->
				case lists:keyfind(Type, #recEquipRefine.pos, RList0) of
					false ->
						[#recEquipRefine{pos = Type} | AccIn];
					V ->
						[V | AccIn]
				end
			end, [], EquipTypeList),
	MinLevel =
		lists:foldl(
			fun(#recEquipRefine{level = Level}, AccMinLevel)->
				case Level < AccMinLevel of
					true ->
						Level;
					_ ->
						AccMinLevel
				end
			end, 999, RList1),
	[EquipType || #recEquipRefine{pos = EquipType, level = RefineLevel} <- RList1, RefineLevel =:= MinLevel].

%%equipRefineSpec(RL) ->
%%	PropValue = playerPropSync:getProp(?SerProp_LoadRefineFlag),
%%	if
%%		PropValue =:= undefined orelse PropValue =:= 0 ->
%%			Fun = fun(#recEquipRefine{level = Lv}, Sum) -> Lv + Sum end,
%%			AllLv = lists:foldl(Fun, 0, RL),
%%			SuitLv = getSuitRefineLevel(RL),
%%			case AllLv of
%%				0 -> skip;
%%				_ -> playerAchieve:achieveEvent(?Achieve_StrMan, [AllLv])
%%			end,
%%			case SuitLv of
%%				0 -> skip;
%%				_ ->
%%					playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_EquipRedefine, SuitLv),
%%					playerAchieve:achieveEvent(?Achieve_StrongestKing, [SuitLv])
%%			end,
%%			playerPropSync:setInt(?SerProp_LoadRefineFlag, 1);
%%		true ->
%%			skip
%%	end.

-spec checkEquipRefineType(Type :: uint()) -> boolean().
checkEquipRefineType(Type) when Type >= ?EquipTypeStart andalso Type =< ?EquipTypeMax ->
	true;
checkEquipRefineType(_Type) ->
	false.

checkEquipRefineMaterial(#equipIntenLevelCfg{materialCost = MaterialCost, materialTransform = SubCost}) ->
	checkEquipRefineMaterial(MaterialCost, SubCost, []).

%%策划余淇星说MaterialCost，只取数组第一组。
checkEquipRefineMaterial([], _SubMaterial, CostList) ->
	CostList;
checkEquipRefineMaterial([ID, Num], [], CostList) ->
	case playerPackage:getItemNumByID(ID) >= Num of
		true ->
			[{ID, Num} | CostList];
		_ ->
			false
	end;
checkEquipRefineMaterial([ID, Num], SubMaterial, CostList) ->
	Have = playerPackage:getItemNumByID(ID),
	case Have >= Num of
		true ->
			[{ID, Num} | CostList];
		_ ->
			%% A不够B来凑
			case Have of
				0 ->
					checkEquipRefineSubMaterial(Num, SubMaterial, CostList);
				_ ->
					checkEquipRefineSubMaterial(Num - Have, SubMaterial, [{ID, Have} | CostList])
			end
	end.
checkEquipRefineSubMaterial(0, _, CostList) ->
	CostList;
checkEquipRefineSubMaterial(Number, [], _CostList) when Number > 0 ->
	%% 补充材料也不够
	false;
checkEquipRefineSubMaterial(Number, [{ID, Num} | List], CostList) ->
	Need = Number * Num,
	Have = playerPackage:getItemNumByID(ID),
	case Have >= Need of
		true ->
			[{ID, Need}|CostList];
		_ ->
			case Have of
				0 ->
					checkEquipRefineSubMaterial(Number, List, CostList);
				_ ->
					case Have div Num of
						0 ->
							%% 一组都不足
							checkEquipRefineSubMaterial(Number, List, CostList);
						UNum ->
							%% 扣完还不够
							checkEquipRefineSubMaterial(Number - UNum, List, [{ID, UNum * Num} | CostList])
					end
			end
	end.

%%初始化装备冲星
-spec initEquipStar() -> ok.
initEquipStar() ->
	L = playerState:getEquipStarList(),
%%	Slv = getSuitUpStarLv(L),
%%	changeSuitStarProp(Slv, ?EquipOn, true),
	sendEquipUpStarList(L).

getStartLevel()->
	L = playerState:getEquipStarList(),
	getSuitUpStarLv(L).

%%装备冲星
-spec allEquipUpStar(Pos :: uint(), Type :: uint()) -> ok.
allEquipUpStar(Pos,Type)->
	case Type =:= ?AllEquipStar of
		true ->
			EquipTypeList = getEquipStarOneKeyList(),
			%% 交换冲星顺序，优先冲星武器
			F =
				fun(Pos1, IsGoon) ->
					case IsGoon of
						true ->
							equipStar(Pos1, ?EachUpStar, Type);
						_ ->
							false
					end
				end,
			lists:foldr(F, true, EquipTypeList);
		_ ->
			case getEquipByType(Pos) of
				false ->
					skip;
				_ ->
					equipStar(Pos,Type, Type)
			end
	end,
	ok.

%%装备冲星
-spec equipStar(Pos :: uint(), Type :: uint(), RequestType::uint()) -> boolean().
equipStar(Pos, Type, RequestType) ->
	Lv = playerState:getLevel(),
	L = playerState:getEquipStarList(),
	EquipStar =
		case lists:keyfind(Pos, #recEquipStar.pos, L) of
			false ->
				#recEquipStar{
					bless = 0,
					pos = Pos,
					prog = 0,
					star = 0
				};
			Tuple ->
				Tuple
		end,
	%% LUN-8636 判断限制等级时取下一级配置，其余依然取当前等级配置
	case getCfg:getCfgByArgs(cfg_equipstar, EquipStar#recEquipStar.star + 1, Pos) of
		#equipstarCfg{limit_level = LimitLv} when Lv >= LimitLv ->
			case getCfg:getCfgByArgs(cfg_equipstar, EquipStar#recEquipStar.star, Pos) of
				#equipstarCfg{} = EquipStarCfg ->
					case equipStar(Type, RequestType, EquipStar, EquipStarCfg) of
						true ->
							playerSevenDays:onMissionEvent(?SevenDayMission_Event_10, 1, 0),
							true;
						_ ->
							false
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarLvNotOverPlayer),
					false
			end;
		#equipstarCfg{} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarLvNotOverPlayer),
			false;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarMaxLevel),
			false
	end.

itemB2A(0, _TransB) ->
	0;
itemB2A(_HaveB, 0) ->
	0;
itemB2A(HaveB, TransB) ->
	erlang:trunc(HaveB / TransB).

itemA2ABList(ItemA, HaveA, NeedA, 0, _HaveB, _TransB) ->
	case HaveA >= NeedA of
		true ->
			[{ItemA, NeedA}];
		_ ->
			false %%不应该到这里
	end;
itemA2ABList(ItemA, HaveA, NeedA, _ItemB, _HaveB, 0) ->
	case HaveA >= NeedA of
		true ->
			[{ItemA, NeedA}];
		_ ->
			false  %%不应该到这里
	end;
itemA2ABList(ItemA, HaveA, NeedA, ItemB, HaveB, TransB) ->
	case HaveA >= NeedA of
		true ->
			[{ItemA, NeedA}];
		%% A不够B来凑
		_ ->
			LeftA = NeedA - HaveA,
			NeedB = LeftA * TransB,
			if
				HaveB < NeedB ->
					false;%%不应该到这里
				HaveA > 0 ->
					[{ItemA, HaveA}, {ItemB, NeedB}];
				true ->
					[{ItemB, NeedB}]
			end
	end.

%%单次冲星
equipStar(
	?EachUpStar,
	RequestType,
	#recEquipStar{pos = Pos, bless = Bless, star = Star} = EquipStar,
	#equipstarCfg{
		cost_item = ItemID, fail_odd = FailOdd,
		transform_item = TItemID, transform_num = TNumber
	} = EquipStarCfg
) ->
	HaveA = playerPackage:getItemNumByID(ItemID),
	HaveB = playerPackage:getItemNumByID(TItemID),
	Num = HaveA + itemB2A(HaveB, TNumber),
	Coin = playerState:getCoin(?CoinTypeGold),
	case eachEquipStar(Bless, Num, Coin, 0, EquipStarCfg, RequestType) of
		{?UpStar_NoItem_Fail, _, _, _} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarMaterialNotEnougth);
		{?UpStar_NoCoin_Fail, _, _, _} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarCoinNotEnougth);
		{?UpStar_IsUP_Fail, _, _, _} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_EquipStarFailedIsUP);
		Other ->
			{Res, Index1, ReNum1, ReCoin1, NewEquipStar} =
				case Other of
					{?UpStar_Lv_Succ, Index, ReNum, ReCoin} ->
						%%装备升星成功之后记录等级变化日志
						EquipStarLevel = #rec_log_equip_star{
							playerID = playerState:getRoleID(),
							type = Pos,
							oldLevel = Star,
							curLevel = Star + 1,
							time = misc_time:utc_seconds()
						},
						playerDeadlineGift:updateCondition(?DeadlineGift_Update_WhenEquipUpStar, Star + 1),
						dbLog:sendSaveLogEquipStar(EquipStarLevel),
						{?UpStar_Lv_Succ, Index, ReNum, ReCoin, EquipStar#recEquipStar{
							bless = 0,
							prog = 0,
							star = Star + 1
						}};
					{?UpStar_Fail, Index, ReNum, ReCoin} ->
						{?UpStar_Fail, Index, ReNum, ReCoin, EquipStar#recEquipStar{
							bless = Bless + trunc(FailOdd * 100),
							prog = 0
						}}
				end,
			CostItemList = itemA2ABList(ItemID, HaveA, Num - ReNum1, TItemID, HaveB, TNumber),
			equipStarRes(?EachUpStar, CostItemList, Coin - ReCoin1, Index1, Res, NewEquipStar)
	end;
%%快速冲星
equipStar(
	?QuickUpStar,
	RequestType,
	EquipStar,
	#equipstarCfg{
		cost_item = ItemID,
		transform_item = TItemID, transform_num = TNumber
	} = EquipStarCfg
) ->
	HaveA = playerPackage:getItemNumByID(ItemID),
	HaveB = playerPackage:getItemNumByID(TItemID),
	Num = HaveA + itemB2A(HaveB, TNumber),

	Coin = playerState:getCoin(?CoinTypeGold),
	{Res, Index, ReNum, ReCoin, NewEquipStar} = equipStar(Num, Coin, 0, EquipStar, EquipStarCfg, RequestType),
	CostItemList = itemA2ABList(ItemID, HaveA, Num - ReNum, TItemID, HaveB, TNumber),
	equipStarRes(?QuickUpStar, CostItemList, Coin - ReCoin, Index, Res, NewEquipStar).

equipStar(
	Num,
	Coin,
	Index,
	#recEquipStar{pos = Pos, bless = Bless, star = Star} = EquipStar,
	#equipstarCfg{fail_odd = FailOdd} = EquipStarCfg,
	RequestType
) ->
	case eachEquipStar(Bless, Num, Coin, Index, EquipStarCfg, RequestType) of
		{?UpStar_Fail, Index1, ReNum, ReCoin} ->
			NewEquipStar = EquipStar#recEquipStar{
				bless = Bless + trunc(FailOdd * 100),
				prog = 0
			},
			equipStar(ReNum, ReCoin, Index1, NewEquipStar, EquipStarCfg, RequestType);
		{?UpStar_Lv_Succ, Index1, ReNum, ReCoin} ->
			%%装备升星成功之后记录等级变化日志
			EquipStarLevel = #rec_log_equip_star{
				playerID = playerState:getRoleID(),
				type = Pos,
				oldLevel = Star,
				curLevel = Star + 1,
				time = misc_time:utc_seconds()
			},
			playerDeadlineGift:updateCondition(?DeadlineGift_Update_WhenEquipUpStar, Star + 1),
			dbLog:sendSaveLogEquipStar(EquipStarLevel),
			NewEquipStar = EquipStar#recEquipStar{
				bless = 0,
				prog = 0,
				star = Star + 1
			},
			{?UpStar_Lv_Succ, Index1, ReNum, ReCoin, NewEquipStar};
		{Type, Index1, ReNum, ReCoin} ->
			{Type, Index1, ReNum, ReCoin, EquipStar}
	end.

%%装备冲星结果
equipStarRes(_Type, false, _CostCoin, _Index, _Res, _EquipStar) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarMaterialNotEnougth);
equipStarRes(Type, CostItemList, CostCoin, Index, Res, #recEquipStar{pos = Pos} = EquipStar) ->
	%%删除物品
	delItem(CostItemList, ?ItemDeleteReasonEquipUpStar),

	%%删除金币
	case CostCoin > 0 of
		true ->
			true = playerMoney:useCoin(?CoinUseTypeGold, CostCoin,
				#recPLogTSMoney{reason = ?CoinUseEquipUpStar, param = 0, target = ?PLogTS_EquipUpStar, source = ?PLogTS_PlayerSelf});
		_ ->
			skip
	end,
	L = playerState:getEquipStarList(),
	%%改变装备属性
	case Res of
		?UpStar_Lv_Succ ->
			{Old, New} =
				case getEquipByType(Pos) of
					{true, Equip} ->
						equipChangeProp(Equip, ?EquipOff, false),
						%%还原原来的装备
						NL = lists:keystore(Pos, #recEquipStar.pos, L, EquipStar),
						playerState:setEquipStarList(NL),
						%%再同步修改角色的战斗属性
						equipChangeProp(Equip, ?EquipOn, true),

						%%广播
						OldSuitLv = getSuitUpStarLv(L),
						CurSuitLv = getSuitUpStarLv(NL),
						{OldSuitLv, CurSuitLv};
					_ ->
						NL = lists:keystore(Pos, #recEquipStar.pos, L, EquipStar),
						playerState:setEquipStarList(NL),
						OldSuitLv = getSuitUpStarLv(L),
						CurSuitLv = getSuitUpStarLv(NL),
						{OldSuitLv, CurSuitLv}
				end,
			if
				Old =/= New ->
					%%漂浮之石成就
					playerAchieve:achieveEvent(?Achieve_Floating_AllUpStar_1,[New-Old]),
					playerAchieve:achieveEvent(?Achieve_Floating_AllUpStar_2,[New-Old]),
					playerAchieve:achieveEvent(?Achieve_Floating_AllUpStar_3,[New-Old]),
					playerAchieve:achieveEvent(?Achieve_Floating_AllUpStar_4,[New-Old]),
					playerAchieve:achieveEvent(?Achieve_Floating_AllUpStar_5,[New-Old]),
					playerAchieve:achieveEvent(?Achieve_AllUpStar,[New-Old]),
					changeSuitStarProp(Old, ?EquipOff, false),
					changeSuitStarProp(New, ?EquipOn, false);
				true ->
					skip
			end,
			playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_EquipStar),
			playerForce:calcPlayerForce(?PlayerEquipForce, true),
			if
				Old =/= New andalso New > 0 ->
%%					%%勇士[00ff00]<t=9>[~p],[~p],【~ts】</t>[-]将全身装备冲星至[00ff00]【~ts】[-]，创造新的传奇。
					SuitBroadL =
						case getCfg:getCfgByKey(cfg_globalsetup, equipstar_worldtext_limit) of
							#globalsetupCfg{setpara = V} ->
								V;
							_ ->
								[]
						end,
					case lists:member(New, SuitBroadL) of
						true ->
							Desc =
								case getCfg:getCfgByArgs(cfg_equipstar, New, Pos) of
									#equipstarCfg{desc = Desc1} ->
										Desc1;
									_ ->
										""
								end,
							%% LUNA-6939 装备升星10级及以下时，不在进行跑马灯公告，只进行系统公告。（仅删除掉跑马灯公告触发）
							String = stringCfg:getString(equipstronger_worldtext_star, [playerState:getName(), Desc]),
							case New =< 10 of
								true ->
									core:sendBroadcastChatNotice(String);
								_ ->
									core:sendBroadcastNotice(String)
							end;
						_ ->
							skip
					end;
%%					N = stringCfg:getString(equipUpstar, [playerState:getRoleID(), playerState:getPlayerCode(), playerState:getName(), Desc]),
%%					core:sendBroadcastNotice(N);
				true ->
					skip
			end;
		_ ->
			NL = lists:keystore(Pos, #recEquipStar.pos, L, EquipStar),
			playerState:setEquipStarList(NL)
	end,
	playerSave:saveEquipStar(EquipStar),

	%%发送消息
	sendEquipUpStarRes(EquipStar, Type, Index, CostItemList, CostCoin, Res),
	playerSevenDayAim:updateCondition(?SevenDayAim_EquipStar, []),
	true.

%%装备单次冲星结果
eachEquipStar(_Bless, Num, Coin, Index, #equipstarCfg{cost_num = CostNum}, _RequestType) when Num < CostNum ->
	{?UpStar_NoItem_Fail, Index, Num, Coin};
eachEquipStar(_Bless, Num, Coin, Index, #equipstarCfg{cost_coin = CostCoin}, _RequestType) when Coin < CostCoin ->
	{?UpStar_NoCoin_Fail, Index, Num, Coin};
eachEquipStar(_Bless, Num, Coin, Index, #equipstarCfg{isup = 1}, ?AllEquipStar) ->
	{?UpStar_IsUP_Fail, Index, Num, Coin};
eachEquipStar(Bless, Num, Coin, Index,
	#equipstarCfg{progress = _Progress, fail_odd = FailOdd, fail_min = FailTimes, cost_num = CostNum, cost_coin = CostCoin},
	_RequestType)
	when Bless < trunc(FailOdd * FailTimes * 100) ->
	{?UpStar_Fail, Index + 1, Num - CostNum, Coin - CostCoin};
eachEquipStar(Bless, Num, Coin, Index, #equipstarCfg{odd = Odd, cost_num = CostNum, cost_coin = CostCoin}, _RequestType) ->
	eachEquipStar(random:uniform(100), Odd * 100 + Bless, Index, Num, Coin, CostNum, CostCoin).

eachEquipStar(R, Odd, Index, Num, Coin, CostNum, CostCoin) when R =< Odd ->
	{?UpStar_Lv_Succ, Index + 1, Num - CostNum, Coin - CostCoin};
eachEquipStar(_R, _Odd, Index, Num, Coin, CostNum, CostCoin) ->
	{?UpStar_Fail, Index + 1, Num - CostNum, Coin - CostCoin}.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%生成装备的基础属性,EquipID装备配置表ID, Quality装备品质
-spec makeEquipBaseProp(EquipID, Quality, EquipUID) -> #rec_equip_base_info{}
	when EquipID :: uint(), Quality :: equipQuality(), EquipUID :: uint().
makeEquipBaseProp(EquipID, _Quality, EquipUID) ->
	#equipmentCfg{} = EquipmentCfg = getCfg:getCfgPStack(cfg_equipment, EquipID),      %%装备基础属性
	#rec_equip_base_info{
		equipUID = EquipUID,
		propKey1 = EquipmentCfg#equipmentCfg.propType1,
		propValue1 = misc:rand(EquipmentCfg#equipmentCfg.min1, EquipmentCfg#equipmentCfg.max1),
		propKey2 = EquipmentCfg#equipmentCfg.propType2,
		propValue2 = misc:rand(EquipmentCfg#equipmentCfg.min2, EquipmentCfg#equipmentCfg.max2),
		propKey3 = EquipmentCfg#equipmentCfg.propType3,
		propValue3 = misc:rand(EquipmentCfg#equipmentCfg.min3, EquipmentCfg#equipmentCfg.max3),
		propKey4 = EquipmentCfg#equipmentCfg.propType4,
		propValue4 = misc:rand(EquipmentCfg#equipmentCfg.min4, EquipmentCfg#equipmentCfg.max4),
		propKey5 = EquipmentCfg#equipmentCfg.propType5,
		propValue5 = misc:rand(EquipmentCfg#equipmentCfg.min5, EquipmentCfg#equipmentCfg.max5),
		skillLevel1 = misc:rand(EquipmentCfg#equipmentCfg.minLevel1, EquipmentCfg#equipmentCfg.maxLevel1),
		skillLevel2 = misc:rand(EquipmentCfg#equipmentCfg.minLevel2, EquipmentCfg#equipmentCfg.maxLevel2)
	}.


makeEquipEnahanceProp(#equipmentCfg{randomprop = []}, EquipUID, _IsEquipmentCombine, _RandomPropExList) ->
	#rec_equip_enhance_info{equipUID = EquipUID};
makeEquipEnahanceProp(#equipmentCfg{randomprop = [_X, 0]}, EquipUID, _IsEquipmentCombine, _RandomPropExList) ->
	#rec_equip_enhance_info{equipUID = EquipUID};
makeEquipEnahanceProp(#equipmentCfg{randomprop = [PoolID, N]}, EquipUID, IsEquipmentCombine, RandomPropExList) ->
	L1 = getCfg:get2KeyList(cfg_equipment_randomprop, PoolID),
	L2 = lists:foldl(
		fun(PropID, ACC)->
			case getCfg:getCfgByArgs(cfg_equipment_randomprop, PoolID, PropID) of
				#equipment_randompropCfg{probability = Prob} = Cfg ->
					[{Prob, Cfg} | ACC];
				_ ->
					ACC
			end
		end, [], L1),
	L3 = [misc:calcOddsByWeightList(L2) || _X <- lists:seq(1, N)],
	makeEquipEnahanceProp2(EquipUID, L3, IsEquipmentCombine, RandomPropExList);
makeEquipEnahanceProp(_Cfg, EquipUID, _IsEquipmentCombine, _RandomPropExList) ->
	#rec_equip_enhance_info{equipUID = EquipUID}.


makeEquipEnahanceProp2(EquipUID, [], _IsEquipmentCombine, _RandomPropExList)->
	#rec_equip_enhance_info{equipUID = EquipUID};
makeEquipEnahanceProp2(EquipUID, CfgList, IsEquipmentCombine, RandomPropExList)->
	PropList = [randomEnPropVal(Cfg, IsEquipmentCombine, RandomPropExList) || Cfg <- CfgList],
	PropListLen = erlang:length(PropList),
	{PropID1, PropVal1} = safeGetFromList(1, PropListLen, PropList),
	{PropID2, PropVal2} = safeGetFromList(2, PropListLen, PropList),
	{PropID3, PropVal3} = safeGetFromList(3, PropListLen, PropList),
	{PropID4, PropVal4} = safeGetFromList(4, PropListLen, PropList),
	{PropID5, PropVal5} = safeGetFromList(5, PropListLen, PropList),
	#rec_equip_enhance_info{
		equipUID = EquipUID
		, propKey1 = PropID1, propValue1 = PropVal1
		, propKey2 = PropID2, propValue2 = PropVal2
		, propKey3 = PropID3, propValue3 = PropVal3
		, propKey4 = PropID4, propValue4 = PropVal4
		, propKey5 = PropID5, propValue5 = PropVal5
	}.

safeGetFromList(Index, N, _L) when Index > N orelse Index < 1->
	{0,0};
safeGetFromList(Index, _N, L)->
	lists:nth(Index, L).

dealFun([], [], AccList) ->
	AccList;
dealFun([{PLO, PMO, WT} | PL], [H | T], AccList) ->
	dealFun(PL, T, [{WT + H,{PLO, PMO}} | AccList]);
dealFun(_, _, AccList) ->
	AccList.    %% 防止输入两列表长度不一致异常

randomEnPropVal(
	#equipment_randompropCfg{propid = PropID, min = Min, max = Max, prop_probability = PL},
	false, _RandomPropExList
)->
	Diff = Max - Min,
	L1 = [{WT,{PLO, PMO}} || {PLO, PMO, WT} <- PL],
	{PMin, PMax} = misc:calcOddsByWeightList(L1),
	{PropID, Min + misc:rand(erlang:trunc(Diff * PMin), erlang:trunc(Diff * PMax))/100};
randomEnPropVal(
	#equipment_randompropCfg{propid = PropID, min = Min, max = Max, prop_probability = PL},
	_IsEquipmentCombine, RandomPropExList
)->
	Diff = Max - Min,
	L1 = dealFun(PL, RandomPropExList, []),
	{PMin, PMax} = misc:calcOddsByWeightList(L1),
	{PropID, Min + misc:rand(erlang:trunc(Diff * PMin), erlang:trunc(Diff * PMax))/100}.


%%检查默认装备职业
checkDefaultEquipClass(PlayerClass, EquipClass) when is_list(EquipClass) ->
	lists:member(PlayerClass, EquipClass);
checkDefaultEquipClass(PlayerClass, EquipClass) when EquipClass =:= PlayerClass orelse EquipClass =:= 0 ->
	true;
checkDefaultEquipClass(_, _) ->
	false.

%%扣除道具
-spec delItem(ItemList :: list(), Reason :: uint()) -> ok.
delItem([], _) ->
	ok;
delItem([{ID, Num} | List], Reason) ->
	case erlang:is_integer(ID) andalso ID > 0 andalso erlang:is_integer(Num) andalso Num > 0 of
		true ->
			PLog = #recPLogTSItem{
				old = Num,
				new = 0,
				change = -Num,
				target = ?PLogTS_Item,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = Reason,
				reasonParam = 0
			},
			playerPackage:delGoodsByID(?Item_Location_Bag, ID, Num, PLog);
		_ ->
			skip
	end,
	delItem(List, Reason).

-spec getBodyEquipByBonusID(QueryTierBonusID) -> Count when
	QueryTierBonusID :: uint(), Count :: uint().
getBodyEquipByBonusID(QueryTierBonusID) ->
	Fun = fun(#recSaveEquip{itemID = EquipID, quality = Quality}, Count) ->
		case Quality =:= ?EquipColorTypeRed of
			true ->
				case getCfg:getCfgPStack(cfg_equipment, EquipID) of
					#equipmentCfg{tierBonusID = TierBonusID} ->
						case QueryTierBonusID =:= TierBonusID of
							true ->
								Count + 1;
							false ->
								Count
						end;
					_ ->
						Count
				end;
			false ->
				Count
		end
		  end,
	lists:foldl(Fun, 0, playerState:getPackage(?Item_Location_BodyEquipBag)).

%%套装战斗属性的改变
-spec equipSuitAward2(Type, TierID, Count, IsNotify) -> ok
	when Type :: atom(), Count :: uint(), TierID :: uint(), IsNotify :: boolean().
equipSuitAward2(Type, TierID, Count, IsNotify) ->
	TierBonus = getCfg:getCfgPStack(cfg_tierBonus, TierID, Count),
	case TierBonus of
		#tierBonusCfg{
			propType1 = PropType1, %%奖励类型1
			value1 = PropValue1,
			mulityOrPlus1 = MulityOrPlus1,
			propType2 = PropType2,
			value2 = PropValue2,
			mulityOrPlus2 = MulityOrPlus2,
			propType3 = PropType3,
			value3 = PropValue3,
			mulityOrPlus3 = MulityOrPlus3,
			propType4 = PropType4,
			value4 = PropValue4,
			mulityOrPlus4 = MulityOrPlus4
		} ->
			ExtProp = [{PropType1, PropValue1, MulityOrPlus1}, {PropType2, PropValue2, MulityOrPlus2},
				{PropType3, PropValue3, MulityOrPlus3}, {PropType4, PropValue4, MulityOrPlus4}],
			case Type of
				equipOn ->
					playerCalcProp:changeProp_CalcType(ExtProp, ?EquipOn, IsNotify);
				equipOff ->
					playerCalcProp:changeProp_CalcType(ExtProp, ?EquipOff, IsNotify)
			end
	end,
	ok.


%%根据配置名从配置表中取出配置值
-spec getConfigValueByName(RowName) -> term() when RowName :: atom().
getConfigValueByName(RowName) ->
	GlobalsetupCfg = getCfg:getCfgPStack(cfg_globalsetup, RowName),
	case GlobalsetupCfg of
		#globalsetupCfg{setpara = []} ->
			?EquipConfigInvalid;
		#globalsetupCfg{setpara = Value} when erlang:is_list(Value) andalso erlang:length(Value) > 0 ->
			lists:nth(1, Value);
		_ ->
			?EquipConfigInvalid
	end.

%%根据配置名从配置表中取出配置值
-spec getConfigValueByNameGroup(RowName, No) -> term() when RowName :: string(), No :: int().
getConfigValueByNameGroup(RowName, No) ->
	RowID = RowName ++ erlang:integer_to_list(No),
	AtomRowID = misc:string_to_term(RowID),
	GlobalsetupCfg = getCfg:getCfgPStack(cfg_globalsetup, AtomRowID),
	case GlobalsetupCfg of
		#globalsetupCfg{setpara = []} ->
			?EquipConfigInvalid;
		#globalsetupCfg{setpara = Value} when erlang:is_list(Value) andalso erlang:length(Value) > 0 ->
			lists:nth(1, Value);
		_ ->
			?EquipConfigInvalid
	end.

%%从装备基础价格表取出对应装备的基础价格
-spec getEquipBasePrice(ItemLevel) -> float() when ItemLevel :: uint().
getEquipBasePrice(ItemLevel) ->
	case getCfg:getCfgPStack(cfg_eq_charge, ItemLevel) of
		#eq_chargeCfg{eq_charge = Charge} ->
			float(Charge);
		_ ->
			0.0
	end.

%%获取装备分解的等级资源配置值
-spec getEquipSourceValue(EquipID) -> uint() when EquipID :: uint().
getEquipSourceValue(EquipID) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{itemLevel = ItemLevel} ->
			case getCfg:getCfgPStack(cfg_eq_charge, ItemLevel) of
				#eq_chargeCfg{source1 = Source1} ->
					Source1;
				_ ->
					0
			end;
		_ ->
			0
	end.

%%获取品质价格权重值
-spec getQualityPriceWeight(Quality) -> uint() when Quality :: uint().
getQualityPriceWeight(Quality) ->
	%%品质体格权重
	case Quality of
		?EquipColorTypeWhite ->
			getConfigValueByName(charge_white);
		?EquipColorTypeGreen ->
			getConfigValueByName(charge_green);
		?EquipColorTypeBlue ->
			getConfigValueByName(charge_blue);
		?EquipColorTypePurple ->
			getConfigValueByName(charge_purple);
		?EquipColorTypeOrange ->
			getConfigValueByName(charge_orange);
		?EquipColorTypeRed ->
			getConfigValueByName(charge_red);
		_ ->
			0
	end.


%%根据品质得到装备的加成系数
-spec getEquipQuailtyRatio(Quality) -> uint() when Quality :: equipQuality().
getEquipQuailtyRatio(Quality) ->
	if
		Quality =:= ?EquipColorTypeWhite ->
			getConfigValueByName(?EquipQualityRatioWhite);
		Quality =:= ?EquipColorTypeGreen ->
			getConfigValueByName(?EquipQualityRatioGreen);
		Quality =:= ?EquipColorTypeBlue ->
			getConfigValueByName(?EquipQualityRatioBlue);
		Quality =:= ?EquipColorTypePurple ->
			getConfigValueByName(?EquipQualityRatioPurple);
		Quality =:= ?EquipColorTypeOrange ->
			getConfigValueByName(?EquipQualityRatioOrange);
		Quality =:= ?EquipColorTypeRed ->
			getConfigValueByName(?EquipQualityRatioRed);
		true ->
			?EquipConfigInvalid
	end.

%%初始化角色默认装备
-spec initEquip(CareerID, EquipID) -> ok when
	CareerID :: career(), EquipID :: itemId().
initEquip(CareerID, EquipID) ->
	#equipmentCfg{iD = EquipID, class = EquipClass, type = Type, atkDelay = AtkDelay} = getCfg:getCfgPStack(cfg_equipment, EquipID),
	case checkDefaultEquipClass(CareerID, EquipClass) of
		true ->
			BagType = ?Item_Location_BodyEquipBag,
			PLog = #recPLogTSItem{
				old = 0,
				new = 1,
				change = 1,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_System,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourceIntenal,
				reasonParam = CareerID
			},
			Equip = makeEquip(EquipID, ?EquipColorTypeWhite, BagType, true, PLog), %%修改战斗属性
			playerPackage:addGoodsInstance(Equip, PLog),
			equipChangeProp(Equip, ?EquipOn, true),
			case Type of
				?EquipTypeWeapon ->
					playerState:setAttackIntervalTime(AtkDelay);
				_ ->
					skip
			end;
		false ->
			skip
	end,
	ok.

%%检查此装备是否对远程玩家可见
-spec checkIsVisible(EquipID) -> boolean() when EquipID :: uint().
checkIsVisible(EquipID) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{type = Type} ->
			lists:member(Type, ?EquipTypeVisibleOfOtherPlayer);
		_ ->
			false
	end.

%%向周围玩家广播穿上的可见装备
-spec visibleEquipOnBroadcast(EquipID, Quality) -> ok when EquipID :: uint(), Quality :: uint().
visibleEquipOnBroadcast(EquipID, Quality) ->
	case checkIsVisible(EquipID) of
		true ->
			sendVisibleEquipOnMessage(EquipID, Quality);
		false ->
			skip
	end,
	ok.

%%向周围玩家广播脱下的可见装备
-spec visibleEquipOffBroadcast(EquipID, Type) -> ok when EquipID :: uint(), Type :: uint().
visibleEquipOffBroadcast(EquipID, Type) ->
	case checkIsVisible(EquipID) of
		true ->
			sendVisibleEquipOffMessage(Type);
		false ->
			skip
	end,
	ok.

%%根据部位找身上装备
-spec getEquipByType(Type) -> {true, #recSaveEquip{}} | false when Type :: uint().
getEquipByType(Type) ->
	Bag = playerState:getPackage(?Item_Location_BodyEquipBag),
	getEquipByType(Type, Bag).

getEquipByType(_Type, []) ->
	false;
getEquipByType(Type, [Equip | BagList]) ->
	{EquipType, _} = getEquipType(Equip#recSaveEquip.itemID),
	case EquipType =:= Type of
		true ->
			{true, Equip};
		_ ->
			getEquipByType(Type, BagList)
	end.

%%装备分解为代币,返回紫色精华和金色精华值
%%紫色精华 = 分解资源1=等级资源1基础值*资源1品质权重*随机值
%%金色精华 = 分解资源2=等级资源2基础值*资源2品质权重*随机值
%%分解价格 = 等级基础价格*部位价格权重*品质价格权重*destroyoff*global_out
-spec equipResolveProcess(Equip) -> ok | [] when Equip :: #recSaveEquip{}.
equipResolveProcess(#recSaveEquip{itemID = EquipID, itemUID = EquipUID, quality = Quality}) ->
%%	case Quality >= ?EquipColorTypeBlue of
	case Quality >= ?EquipColorTypeWhite of
		true ->
			%%在配置的最小值和最大值之间取随机float值，配置的最大值是1
			Source1 = getEquipSourceValue(EquipID),  %%等级资源基础值
			%%取装备的部位价格权重和等级基础价格
			case getCfg:getCfgPStack(cfg_equipment, EquipID) of
				#equipmentCfg{itemLevel = ItemLevel} ->
					LevelBasePrice = getEquipBasePrice(ItemLevel);   %%等级基础价格
				_ ->
					LevelBasePrice = 0
			end,

			%%分解价格=	等级基础价格*部位价格权重*品质价格权重*destroyoff*global_out
			ResolvePrice = erlang:trunc(LevelBasePrice),%%erlang:round(LevelBasePrice * PartPriceWeight * QualityPriceWeight * DestroyOff * GlobalOut),
			GoldIsEnough = playerMoney:canUseCoin(?CoinUseTypeGold, ResolvePrice),  %%玩家当前的剩余金币是否足够
			case GoldIsEnough of  %%判断玩家的金币是否足够
				true ->
					%%从装备背包里删除已分解的装备
					true = playerPackage:deleteGoodsByUID(?Item_Location_Equip_Bag, EquipUID,
						#recPLogTSItem{
							old = 1,
							new = 0,
							change = -1,
							target = ?PLogTS_EquipResolve,
							source = ?PLogTS_PlayerSelf,
							gold = 0,
							goldtype = 0,
							changReason = ?ItemDeleteReasonResolve,
							reasonParam = 0
						}),
					%%装备分解完成后扣除金币
					true = playerMoney:useCoin(?CoinUseTypeGold, ResolvePrice,
						#recPLogTSMoney{
							reason = ?CoinSourceEquipResolve,
							param = EquipUID,
							target = ?PLogTS_EquipResolve,
							source = ?PLogTS_PlayerSelf
						}),

					ChangePurpleEssence = Source1,

					%% 获得爵位加成
					playerMoney:addCoin(?CoinTypePurpleEssence, ChangePurpleEssence,
						#recPLogTSMoney{
							reason = ?CoinSourceEquipResolve,
							param = EquipUID,
							target = ?PLogTS_PlayerSelf,
							source = ?PLogTS_EquipResolve
						}),%%更新玩家的紫色精华
					%% ItemList = playerEquipWash:onEquipResolve(Equip), LUNA-9072
					[ChangePurpleEssence, 0, []];
				false ->
					?DEBUG("[DebugForEquip] Money is not enough", []),
					ok
			end;
		_ ->
			?DEBUG("[DebugForEquip] Quality:~w is invalid", [Quality]),
			ok
	end.

%%返回玩家身上的装备信息，供战斗模块检测校验使用
-spec getPlayerEquip() -> []|[#recEquipEnhance{}, ...].
getPlayerEquip() ->
	Bag = playerState:getPackage(?Item_Location_BodyEquipBag),
	Fun =
		fun(Equip, EquipList) ->
			case Equip of
				#recSaveEquip{itemID = EquipID, enhanceProp = EnhanceProp, extProp = ExtProp} ->
					{Type, SubType} = getEquipType(EquipID),
					EquipEnhance = #recEquipEnhance{
						id = EquipID,
						type = Type,
						subType = SubType,
						enhanceProp = EnhanceProp,
						extProp = ExtProp
					},
					[EquipEnhance | EquipList];
				_ ->
					EquipList
			end
		end,
	lists:foldl(Fun, [], Bag).

%%获取装备的类型/部位和子类型,返回-1时配置有问题
-spec getEquipType(EquipID) -> {int(), int()} when EquipID :: uint().
getEquipType(EquipID) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{type = Type, subType = SubType} ->
			{Type, SubType};
		_ ->
			{-1, -1}
	end.

%%装备的原始价格
%%装备原始价格 = 等级基础价格*部位价格权重*品质价格权重
-spec equipSourcePrice(Equip) -> uint() when Equip :: #recSaveEquip{}.
equipSourcePrice(#recSaveEquip{itemID = EquipID, quality = Quality}) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{type = Type, itemLevel = ItemLevel} ->
			PartPriceWeight = getConfigValueByNameGroup("part", Type), %%部位价格权重
			LevelBasePrice = getEquipBasePrice(ItemLevel);   %%等级基础价格
		_ ->
			PartPriceWeight = 0,
			LevelBasePrice = 0.0
	end,
	QualityPriceWeight = getQualityPriceWeight(Quality),
	EquipSourcePrice = LevelBasePrice * PartPriceWeight * QualityPriceWeight,
	erlang:round(EquipSourcePrice);
equipSourcePrice(_) ->
	0.

%%发送可见装备穿上广播消息
-spec sendVisibleEquipOnMessage(EquipID, Quality) -> ok when EquipID :: uint(), Quality :: uint().
sendVisibleEquipOnMessage(EquipID, Quality) ->
	VisibleEquip = #pk_visibleEquip{
		equipID = EquipID,
		quality = Quality
	},
	playerMsg:sendMsgToNearPlayer(#pk_GS2U_BroadcastVisibleEquipOn{
		equip = VisibleEquip,
		code = playerState:getPlayerCode()
	}, true),
	ok.

%%发送可见装备卸下广播消息
-spec sendVisibleEquipOffMessage(Type) -> ok when Type :: uint().
sendVisibleEquipOffMessage(Type) ->
	playerMsg:sendMsgToNearPlayer(#pk_GS2U_BroadcastVisibleEquipOff{
		type = Type,
		code = playerState:getPlayerCode()
	}, true),
	ok.

-spec equipChangeProp(Equip :: #recSaveEquip{}, Operate :: ?EquipOn | ?EquipOff, IsNotify :: boolean()) -> ok.
equipChangeProp(#recSaveEquip{itemID = ItemID, baseProp = BaseProp, enhanceProp = EnProp}, Operate, IsNotify) ->
	playerState:setEquips(getPlayerEquip()),
	case getCfg:getCfgPStack(cfg_equipment, ItemID) of
		#equipmentCfg{type = Type} ->
			PosLevel = getPosStarLevel(Type, playerState:getEquipStarList()),
			StartProps =
				case getCfg:getCfgByArgs(cfg_equipstar, PosLevel, Type) of
					#equipstarCfg{starProps = SPL} when is_list(SPL) ->
						SPL;
					_ ->
						[]
				end,

			EquipStartProps = playerCalcProp:makePropsGroup_Equip(
				BaseProp,
				StartProps,
				Operate
			),

			#rec_equip_base_info{
				propKey1 = K1, propValue1 = V1,
				propKey2 = K2, propValue2 = V2,
				propKey3 = K3, propValue3 = V3,
				propKey4 = K4, propValue4 = V4,
				propKey5 = K5, propValue5 = V5
			} = BaseProp,

			BasePropCalc = [
				{K1, V1, ?PropCalcType_Add},
				{K2, V2, ?PropCalcType_Add},
				{K3, V3, ?PropCalcType_Add},
				{K4, V4, ?PropCalcType_Add},
				{K5, V5, ?PropCalcType_Add}
			],

			#rec_equip_enhance_info{
				propKey1 = KE1, propValue1 = VE1,
				propKey2 = KE2, propValue2 = VE2,
				propKey3 = KE3, propValue3 = VE3,
				propKey4 = KE4, propValue4 = VE4,
				propKey5 = KE5, propValue5 = VE5
			} = EnProp,

			EnhancePropCalc = [
				{KE1, VE1, ?PropCalcType_Add},
				{KE2, VE2, ?PropCalcType_Add},
				{KE3, VE3, ?PropCalcType_Add},
				{KE4, VE4, ?PropCalcType_Add},
				{KE5, VE5, ?PropCalcType_Add}
			],

			RedefineProps = getPosRefineProp(Type),
			GemsProps = playerGem:getEquipGemProps(Type),

			playerCalcProp:changeProp_CalcType(
				BasePropCalc,
				EquipStartProps ++ RedefineProps ++ GemsProps ++ EnhancePropCalc,
				Operate,
				IsNotify
			);
		_ ->
			?ERROR("equipChangeProp not find item:roleID=~p,roleName=~ts,itemID=~p",
				[playerState:getRoleID(), playerState:getName(), ItemID]),
			ok
	end.

%%==========================================================================
%%装备精炼
%%==========================================================================

%%改变装备精炼部位属性加成
-spec changePosRefineProp(PosLevel :: uint(), Type :: uint(), Opreate :: uint()) -> ok.
changePosRefineProp(0, _, _) ->
	ok;
changePosRefineProp(PosLevel, Type, Operate) ->
	playerCalcProp:changeProp_CalcType(getPosRefineProp(PosLevel, Type), Operate, true).

%%改变装备精炼套装属性加成
-spec changeSuitRefineProp(SuitLevel :: uint(), Operate :: uint(), IsOnOff :: boolean()) -> ok.
changeSuitRefineProp(0, _, _) ->
	skip;
changeSuitRefineProp(SuitLevel, Operate, false) ->
	%% 不需要检查是否穿脱装备
	#equipIntenLevelCfg{allBonus = Bonus} = getCfg:getCfgByKey(cfg_equipIntenLevel, SuitLevel, ?EquipTypeWeapon),
	playerCalcProp:changeProp_CalcType(Bonus, Operate, true);
changeSuitRefineProp(SuitLevel, Operate, true) ->
	%% 需要检查是否穿脱装备
	On = getOnAllEquipNumber(),
	All = getEquipTypeAllNumber(),
	Can = case Operate of
			  ?EquipOn -> On =:= All;
			  _ ->
				  On =:= All - 1
		  end,
	case Can of
		true ->
			#equipIntenLevelCfg{allBonus = Bonus} = getCfg:getCfgByKey(cfg_equipIntenLevel, SuitLevel, ?EquipTypeWeapon),
			playerCalcProp:changeProp_CalcType(Bonus, Operate, true);
		_ ->
			ok
	end.

%%改变装备重新部位套装属性
changeSuitStarProp(0, _, _NoCheckAll) ->
	skip;
changeSuitStarProp(SuitLevel, Operate, false) ->
	On = getOnAllEquipNumber(),
	All = getEquipTypeAllNumber(),
	case On =:= All of
		true ->
			%% 不需要检查是否穿脱装备
			#equipstarCfg{allbonus = Bonus} = getCfg:getCfgByArgs(cfg_equipstar, SuitLevel, ?EquipTypeWeapon),
			playerCalcProp:changeProp_CalcType(Bonus, Operate, true);
		_ ->
			%% 装备没穿够，不需要改变套装属性
			skip
	end;
changeSuitStarProp(SuitLevel, Operate, true) ->
	%% 需要检查是否穿脱装备
	On = getOnAllEquipNumber(),
	All = getEquipTypeAllNumber(),
	Can = case Operate of
			  ?EquipOn -> On =:= All;
			  _ -> On =:= All - 1
		  end,
	case Can of
		true ->
			#equipstarCfg{allbonus = Bonus} = getCfg:getCfgByArgs(cfg_equipstar, SuitLevel, ?EquipTypeWeapon),
			playerCalcProp:changeProp_CalcType(Bonus, Operate, true);
		_ ->
			ok
	end.

%%获取装备精炼部位等级
-spec getPosRefineInfo(Type :: uint(), RefineList :: list()) -> #recEquipRefine{}.
getPosRefineInfo(Type, RefineList) ->
	case lists:keyfind(Type, #recEquipRefine.pos, RefineList) of
		#recEquipRefine{} = Refine ->
			Refine;
		_ ->
			#recEquipRefine{pos = Type}
	end.

%%获取装备部位星级
-spec getPosStarLevel(Pos :: uint(), L :: list()) -> uint().
getPosStarLevel(Pos, L) ->
	case lists:keyfind(Pos, #recEquipStar.pos, L) of
		false ->
			0;
		#recEquipStar{star = Star} ->
			Star
	end.

%%获取装备精炼部位属性值根据部位等级
getPosRefineProp(Type) ->
	RList = playerState:getEquipRefine(),
	#recEquipRefine{level = Lv} = getPosRefineInfo(Type, RList),
	getPosRefineProp(Lv, Type).

-spec getPosRefineProp(PosLevel :: uint(), Type :: uint()) -> {float(), list()}.
getPosRefineProp(0, _Type) ->
	[];
getPosRefineProp(PosLevel, Type) ->
	Career = playerState:getCareer(),
	#equipNewIntenCfg{
		offHandBonus = OffHandBonus,
		amuletBonus = AmuletBonus,
		bootBonus = BootBonus,
		ringBonus = RingBonus,
		helmBonus = HelmBonus,
		pantBonus = PantBonus,
		chestBonus = ChestBonus,
		mainHandBonus = MainHandBonus
	} = getCfg:getCfgPStack(cfg_equipNewInten, ?Career2CareerBase(Career)),
	case Type of
		?EquipTypeWeapon ->
			getPosProp(PosLevel, MainHandBonus, Type);
		?EquipTypeEarrings ->
			getPosProp(PosLevel, OffHandBonus, Type);
		?EquipTypeArmor ->
			getPosProp(PosLevel, ChestBonus, Type);
		?EquipTypeBoots ->
			getPosProp(PosLevel, BootBonus, Type);
		?EquipTypeRing ->
			getPosProp(PosLevel, RingBonus, Type);
		?EquipTypeNecklace ->
			getPosProp(PosLevel, AmuletBonus, Type);
		?EquipTypeTrousers ->
			getPosProp(PosLevel, PantBonus, Type);
		?EquipTypeHelmet ->
			getPosProp(PosLevel, HelmBonus, Type)
	end.

getPosProp(_PosLevel, undefined, _Type) ->
	[];
getPosProp(PosLevel, PosBonus, Type) ->
	#equipIntenLevelCfg{
		bonus = MainHandBonus
	} = getCfg:getCfgByKey(cfg_equipIntenLevel, PosLevel, Type),
	getPosProp(PosLevel, MainHandBonus, PosBonus, []).
getPosProp(_PosLevel, _MainHandBonus, [], AllBonus) ->
	AllBonus;
getPosProp(PosLevel, MainHandBonus, [{Key, A, B} | L], AllBonus) ->
	case lists:keyfind(Key, 1, MainHandBonus) of
		false ->
			?ERROR("cfg_equipIntenLevel not find prop ~p", [Key]),
			[];
		{Key, BaseValue, CalcType} ->
			NewValue = {Key, BaseValue * A + PosLevel * B, CalcType},
			getPosProp(PosLevel, MainHandBonus, L, [NewValue | AllBonus])
	end.

%%获取装备精炼套装等级
-spec getSuitRefineLevel(RefineList :: list()) -> uint().
getSuitRefineLevel(RefineList) ->
	getSuitRefineLevel(lists:seq(?EquipTypeStart, ?EquipTypeMax), RefineList, 0).

getSuitRefineLevel([], _RefineList, MinLv) ->
	MinLv;
getSuitRefineLevel([Type | Types], RefineList, MinLv) ->
	case lists:keyfind(Type, #recEquipRefine.pos, RefineList) of
		#recEquipRefine{pos = ?EquipTypeStart, level = Level} ->
			getSuitRefineLevel(Types, RefineList, Level);
		#recEquipRefine{level = Level} ->
			case Level >= MinLv of
				true ->
					getSuitRefineLevel(Types, RefineList, MinLv);
				_ ->
					getSuitRefineLevel(Types, RefineList, Level)
			end;
		_ ->
			0
	end.

%%获取装备冲星套装等级
-spec getSuitUpStarLv(L :: list()) -> uint().
getSuitUpStarLv(L) ->
	getSuitUpStarLv(lists:seq(?EquipTypeStart, ?EquipTypeMax), L, 0).
getSuitUpStarLv([], _L, Lv) ->
	Lv;
getSuitUpStarLv([Pos | PL], L, MinLv) ->
	case lists:keyfind(Pos, #recEquipStar.pos, L) of
		#recEquipStar{star = Star} ->
			if
				MinLv =:= 0 ->
					getSuitUpStarLv(PL, L, Star);
				Star >= MinLv ->
					getSuitUpStarLv(PL, L, MinLv);
				true ->
					getSuitUpStarLv(PL, L, Star)
			end;
		_ ->
			0
	end.

%%装备精炼列表
-spec sendRefineList(RefineList :: list()) -> ok.
sendRefineList(RefineList) ->
	Fun =
		fun(#recEquipRefine{pos = Type, level = Level, bless = Bless}) ->
			#pk_EquipRefineLevel{
				type = Type,
				bless = Bless,
				level = Level
			}
		end,
	Msg = #pk_GS2U_EquipRefineLevel{
		equipRefines = lists:map(Fun, RefineList)
	},
	playerMsg:sendNetMsg(Msg).

%%装备精炼结果
-spec sendRefineResult(#recEquipRefine{}) -> ok.
sendRefineResult(#recEquipRefine{pos = Type, level = Level, bless = Bless}) ->
	Msg = #pk_GS2U_EquipRefineResult{
		code = playerState:getPlayerCode(),
		type = Type,
		bless = Bless,
		level = Level
	},
	playerMsg:sendMsgToNearPlayer(Msg, true).

%%==========================================================================
%%装备升星
%%==========================================================================
-spec sendEquipUpStarList(L :: list()) -> ok.
sendEquipUpStarList(L) ->
	Fun =
		fun(#recEquipStar{
			pos = Pos,
			bless = Bless,
			prog = Prog,
			star = Star
		}) ->
			#pk_EquipUpStarInfo{
				pos = Pos,
				level = Star,
				prog = Prog,
				bless = Bless
			}
		end,
	List = lists:map(Fun, L),
	Msg = #pk_GS2U_EquipUpStarInfoList{
		equipUpStars = List
	},
	playerMsg:sendNetMsg(Msg).

sendEquipUpStarRes(#recEquipStar{
	pos = Pos,
	bless = Bless,
	prog = Prog,
	star = Star
}, Type, Index, List, Coin, Res) ->
	Info = #pk_EquipUpStarInfo{
		pos = Pos,
		level = Star,
		prog = Prog,
		bless = Bless
	},
	CostList = [#pk_starCostItem{itemID = ItemID, itemNum = ItemNum} || {ItemID, ItemNum} <- List],
	Msg = #pk_GS2U_EquipUpStarRes{
		equipUpStarInfo = Info,
		type = Type,
		index = Index,
		costList = CostList,
		coin = Coin,
		res = Res
	},
	playerMsg:sendNetMsg(Msg).

%% v3.0.0屏蔽旧版补偿
%% give13
%%checkAndRepairRefineAchieve() ->
%%	RefineList = playerState:getEquipRefine(),
%%	RefineSuitLevel = getSuitRefineLevel(RefineList),
%%	playerAchieve:setAchieveEevent(?Achieve_StrongestKing,RefineSuitLevel).

%% v3.0.0屏蔽旧版补偿
%% give14
%%%% LUN-8636
%%%% 将星级限制在配置允许最大值
%%-spec fixLUN8636() -> no_return().
%%fixLUN8636() ->
%%	L = playerState:getEquipStarList(),
%%	fixLUN8636(L).
%%-spec fixLUN8636([#recEquipStar{}, ...]) -> no_return().
%%fixLUN8636([]) ->
%%	ok;
%%fixLUN8636([#recEquipStar{star = Star, pos = Pos} = EquipStar | T]) ->
%%	case fixLUN8636_getMaxStar(Star, Pos) of
%%		Star ->
%%			skip;
%%		MaxStar ->
%%			EquipStarNew = EquipStar#recEquipStar{star = MaxStar},
%%			L = playerState:getEquipStarList(),
%%			NL = lists:keystore(Pos, #recEquipStar.pos, L, EquipStarNew),
%%			playerState:setEquipStarList(NL),
%%			playerSave:saveEquipStar(EquipStarNew)
%%	end,
%%	fixLUN8636(T).
%%-spec fixLUN8636_getMaxStar(Star::uint(), Pos::uint()) -> MaxStar::uint().
%%fixLUN8636_getMaxStar(0, _Pos) ->
%%	0;
%%fixLUN8636_getMaxStar(Star, Pos) ->
%%	case getCfg:getCfgByKey(cfg_equipstar, Star, Pos) of
%%		#equipstarCfg{} ->
%%			Star;
%%		_ ->
%%			fixLUN8636_getMaxStar(Star - 1, Pos)
%%	end.

%%%-------------------------------------------------------------------
%% internal:刷新合成次数，返回旧值用于本次属性计算
-spec equipmentCombine(IsCombine::boolean(), SourceID::uint(), CountAdd::uint()) -> CountValidOld::uint().
equipmentCombine(true, SourceID, CountAdd) ->
	#itemTinkerCfg{exweight_cd = [CountMax, CountDay]} = getCfg:getCfgPStack(cfg_itemTinker, SourceID),
	TimeNow = misc_time:localtime_seconds(),
	List0 = playerPropSync:getProp(?SerProp_EqupmentCombin),
	{List1, CountValidOld} =
		case lists:keyfind(SourceID, 1, List0) of
			{_, Time, Count} when Count >= CountMax orelse Time + CountDay * 86400 =< TimeNow ->
				%% 满足次数或时间条件，需要重置，本次返回重置值
				{lists:keystore(SourceID, 1, List0, {SourceID, TimeNow, ?InitNum}), ?InitNum};
			{_, _Time, Count} when Count + CountAdd >= CountMax ->
				%% 下次满足次数或时间条件，需要重置，本次返回旧值
				{lists:keystore(SourceID, 1, List0, {SourceID, TimeNow, ?InitNum}), Count};
			{_, Time, Count} ->
				%% 不满足任何条件，累加
				{lists:keystore(SourceID, 1, List0, {SourceID, Time, Count + CountAdd}), Count};
			_ when CountAdd >= CountMax ->
				%% 没有，但次数超过，仅初始化
				{[{SourceID, TimeNow, ?InitNum} | List0], ?InitNum};
			_ ->
				%% 没有，且次数没超过，可以积累
				{[{SourceID, TimeNow, CountAdd} | List0], ?InitNum}
		end,
	playerPropSync:setAny(?SerProp_EqupmentCombin, List1),
	CountValidOld;
equipmentCombine(_IsCombine, _SourceID, _CountAdd) ->
	0.

%%%-------------------------------------------------------------------
%% api:合成次数清理
-spec equipmentCombineClean() -> no_return().
equipmentCombineClean() ->
	List = equipmentCombineClean(
		playerPropSync:getProp(?SerProp_EqupmentCombin),
		misc_time:localtime_seconds(),
		[]
	),
	playerPropSync:setAny(?SerProp_EqupmentCombin, List).

-spec equipmentCombineClean(List::list(), TimeNow::uint32(), Acc::list()) -> no_return().
equipmentCombineClean([], _TimeNow, Acc) ->
	lists:reverse(Acc); %% 尽量保持原有顺序，减少磁盘写入
equipmentCombineClean([{SourceID, Time, Count} = H | T], TimeNow, Acc) ->
	case getCfg:getCfgByKey(cfg_itemTinker, SourceID) of
		#itemTinkerCfg{exweight_cd = [CountMax, CountDay]}
			when erlang:is_integer(CountMax)
			andalso erlang:is_integer(CountDay) ->
			case Count >= CountMax orelse Time + CountDay * 86400 >= TimeNow of
				true ->
					%% 抛弃需要重置的数据
					equipmentCombineClean(T, TimeNow, Acc);
				_ ->
					equipmentCombineClean(T, TimeNow, [H | Acc])
			end;
		InvalidCfg ->
			%% 因配置问题抛弃无法判断是否需要重置的数据，避免容量问题造成的更严重问题
			?ERROR(
				"equipmentCombineClean RoleID:~w H:~w InvalidCfg:~w",
				[playerState:getRoleID(), H, InvalidCfg]
			),
			equipmentCombineClean(T, TimeNow, Acc)
	end.
