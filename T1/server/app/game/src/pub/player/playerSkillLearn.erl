%%
%% @author zhongyunawei
%% @doc @todo 该文件专门处理技能学习、升级等等相关


-module(playerSkillLearn).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

-define(AddSlotSkill, 0). %%镶嵌技能
-define(DelSlotSkill, 1). %%卸载技能

-define(AddSlotSkillOk, 0). %%镶嵌技能成功
-define(DelSlotSkillOk, 1). %%卸载技能成功
-define(SlotSkillError, 2). %%失败

%%客服端选项卡技能类型
-define(TabOne, 1).      %%主动技能
-define(TabTwo, 2).      %%被动技能
-define(TabOther, 3).      %%其他技能
-define(CellNum, 5).      %%每种格子数量
-define(IntervalNum, 50).    %%格子间隔

%% ====================================================================
%% API functions
%% ====================================================================

-export([
	initSkill/0,
	initPassSkill/1,
	initRoleSkill/1,

	addSkillPointLevelUp/1,
	getSkillPointTotal/1,
	upSkill/2,
	resetSkill/0,
	autoUpSkill/1,
	operateSlot/2,
	openWakeSkill/0,
	keepWake/1,
	setLevel/2,
	onRoleLevelUpBaseComboSkill/1,
	updateSkillWithRLevel/1
	%%checkAndDoResetSkill/0
]).

-export([
	initSkillChangeCareer/2,
	sendSkillSlotSkillInfo2Client/0,
	sendSkillInfo2Client/0,
	sendSkillSlotInfo/0
]).

-export([
	isActiveSkill/1,
	isPassSkill/1,
	isRoleSkill/1,
	returnIndex/2,
	returnIndex1/2,
	getSlotTab/1,
	delPassEff/2,
	checkSkillCarrer/2,
	checkAwakenSkillCarrer/1
]).

-export([
	upPassiveSkill/1,
	initCareerPassiveSkill/0,
	sendCareerPassiveSkillInfo/0,
	dealPassiveSkillWhenCareerChange/0,
	addCareerPassiveSkillProp/0,
	isCareerPassHasOpen/0
]).

%% fix
-export([
	autoFillSkill/0
]).

%%初始化技能
-spec initSkill() -> ok.
initSkill() ->
	playerState:setSkill([]),
	playerState:setSkillCD([]),
	playerState:setSlotList([]),
	playerState:setSlotSkill([]),
	playerState:setTriggerSkill([]),
	playerState:setSkillGroupCD([]),
	playerState:setCurUseFastSkill(undefined),
	playerState:setCurUseSlowSkill(undefined),
	playerState:setCurUseSkill(undefined),
	playerState:setGlobalCD(0),
	ok.


initSkillChangeCareer(OldCareer, NewCareer) ->
	OldSkillList = playerState:getSkill(),
	SkillIDList1 = getCfg:get1KeyList(cfg_skill),
	SkillIDList2 = filterLearnedCareerSkill(OldCareer, SkillIDList1),


	FunFilter =
		fun(#recSkill{skillID = ID} = RecSkill, {SL, DL}) ->
			case lists:member(ID, SkillIDList2) of
				true ->
					{SL, [ID | DL]};
				_ ->
					case getCfg:getCfgPStack(cfg_skill, ID) of
						#skillCfg{skillClass = NewCareer}->
							{SL, DL};
						#skillCfg{} ->
							{[RecSkill | SL], DL};
						_ ->
							{SL, DL}
					end
			end
		end,
	{SaveSkillList1, DelSkillList} = lists:foldl(FunFilter, {[], []}, OldSkillList),

	WakeSkills = getWakeSkills(),
	SaveSkillList = lists:subtract(SaveSkillList1, WakeSkills),
%%	
	initSkill(),
	lists:foreach(fun(ID) -> delPassEff(ID) end, DelSkillList ++ WakeSkills),
	playerState:setSkill(SaveSkillList),
%%	NewSkillList = playerState:getSkill(),
%%	playerState:setSkill(lists:append(SaveSkillList, NewSkillList)),
	
%%	NewSkillListID = [NewSkillID || #recSkill{skillID = NewSkillID} <- NewSkillList],
%%	initSoltSkill(NewSkillListID, 1),
	ok.


filterLearnedCareerSkill(CurCareer, SkillIDList) ->
	CurLevel = playerState:getLevel(),
	Fun =
		fun(SkillID) ->
			#skillCfg{
				skillClass = Career,
				baseLevel = Level,
				nouse = Useless
			} = getCfg:getCfgPStack(cfg_skill, SkillID),
			case checkSkillCarrer(CurCareer, Career) of
				true ->
					case checkSkillOpen(CurLevel, Level) of
						true ->
							checkSkillIsHide(Useless);
						_ ->
							false
					end;
				_ ->
					false
			end
		end,
	lists:filter(Fun, SkillIDList).

%%初始化所有槽编号
-spec initSlot() -> list().
initSlot() ->
	lists:seq(1, ?CellNum) ++
		lists:seq(1 + ?IntervalNum, ?IntervalNum + ?CellNum) ++
		lists:seq(1 + ?IntervalNum * 2, ?IntervalNum * 2 + ?CellNum).

%%初始化角色的技能槽
-spec initRoleSlot() -> ok.
initRoleSlot() ->
	List = initSlot(),
	initRoleSlot(List).

initRoleSlot([]) ->
	ok;
initRoleSlot([Index | List]) ->
	case isOpenSlot(Index, 1) of
		true ->
			addSlot(Index, true, false),
			initRoleSlot(List);
		_ ->
			addSlot(Index, false, false),
			initRoleSlot(List)
	end.

%%根据职业初始化角色的技能
-spec initRoleSkill(Career) -> ok when
	Career :: uint().
initRoleSkill(Career) -> doInitRoleSkill(Career, true).

doInitRoleSkill(Career, NeedSave) ->
	%%初始化角色的技能插槽
	initRoleSlot(),
	%%初始化角色技能
	SkillIDList = getCfg:get1KeyList(cfg_skill),
	initRoleSkill(Career, SkillIDList),
	%%初始化插槽上的技能，即哪些技能默认就放在技能插槽上的
	initSoltSkill(Career),
	%%最后统一保存初始化的所有技能信息
	case NeedSave of
		true ->
			playerSave:saveAllSkill(true);
		_ ->
			skip
	end,
	ok.


initRoleSkill(_Career, []) ->
	ok;
initRoleSkill(Career, [SkillID | SkillIDList]) ->
	case isAddSkill(SkillID, Career, playerState:getLevel()) of
		true ->
			addSkill(SkillID, 1, false),
			initRoleSkill(Career, SkillIDList);
		_ ->
			initRoleSkill(Career, SkillIDList)
	end.

%%根据职业初始化角色的技能槽技能
-spec initSoltSkill(Career) -> ok when
	Career :: uint().
initSoltSkill(Career) ->
	SkillList = getSlotList(Career),
	%%初始化只有主动技能,所以索引为1开始
	initSoltSkill(SkillList, 1).

initSoltSkill([], _) ->
	ok;
initSoltSkill([SkillID | List], Index) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		false ->
			?ERROR("SkillID [~p] can't solt , beacuse of no learn", [SkillID]),
			initSoltSkill(List, Index);
		_ ->
			#skillCfg{hiden = Hiden} = getCfg:getCfgPStack(cfg_skill, SkillID),
			case Hiden of
				0 ->
					addSlotSkill(SkillID, Index),
					initSoltSkill(List, Index + 1);
				_ ->
					initSoltSkill(List, Index)
			end
	end.
%%根据职业初始化角色的天生被动技能
-spec initPassSkill(Career) -> ok when
	Career :: uint().
initPassSkill(Career) ->
	PassList = getPassList(Career),
	initPassSkill(PassList, Career).
initPassSkill([], _Career) ->
	ok;
initPassSkill([SkillID | List], Career) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		#recSkill{level = Level} ->
			#skillCfg{skillType = SkillType, skillEx = Ex} = getCfg:getCfgPStack(cfg_skill, SkillID),
			case SkillType =:= ?PassivitySkill andalso Ex =:= undefined of
				true ->
					playerEffect:addPassEffect(SkillID, Level);
				_ ->
					playerSkill:addTriggerSkill(SkillID, Level)
			end;
		_ ->
			?ERROR("SkillID [Career:~p,SkillID:~p,List:~p] can't become effect , beacuse of no learn", [Career, SkillID, SkillList]),
			skip
	end,
	initPassSkill(List, Career).

%%开放觉醒技能
%% 20161101 觉醒技能脱离女神系统，并入器灵系统
%% 该函数具有根据器灵提供的经验转换的等级刷新觉醒技能的效果

getWakeSkills()->
	SkillExp = playerPropSync:getProp(?PriProp_WakeUpExp),
	case SkillExp > 0 of
		true ->
			{_, SkillLv} = playerGodWeapon:getWakeSkillLvByExp(SkillExp),
			case getCfg:getCfgByKey(cfg_transformspell, SkillLv, playerState:getCareer()) of
				#transformspellCfg{} = WSInfo ->
					getAwakenSkills(WSInfo);
				_ ->
					[]
			end;
		_ ->
			[]
	end.

-spec openWakeSkill() -> ok.
openWakeSkill() ->
	SkillExp = playerPropSync:getProp(?PriProp_WakeUpExp),
	%%?DEBUG("[DebugForQL] openWakeSkill SkillExp(~p)", [SkillExp]),
	case SkillExp > 0 of
		true ->
			{_, SkillLv} = playerGodWeapon:getWakeSkillLvByExp(SkillExp),
			case getCfg:getCfgByKey(cfg_transformspell, SkillLv, playerState:getCareer()) of
				#transformspellCfg{} = WSInfo ->
					SkillIDList = getAwakenSkills(WSInfo),
					Fun =
						fun(SkillID) ->
							#skillCfg{maxLevel = MaxLevel} = getCfg:getCfgPStack(cfg_skill, SkillID),
							SkillLvNew =
								case SkillLv >= MaxLevel of
									true ->
										MaxLevel;
									_ ->
										SkillLv
								end,
							case lists:keyfind(SkillID, #recSkill.skillID, playerState:getSkill()) of
								#recSkill{level = SkillLvOld} = Skill ->
									case SkillLvOld >= SkillLvNew of
										true ->
											skip;
										_ ->
											%%?DEBUG("[DebugForQL] openWakeSkill updateSkill Skill(~p) SkillLvNew(~p)", [Skill, SkillLvNew]),
											updateSkill(Skill, SkillLvNew)
									end;
								_ ->
									%%?DEBUG("[DebugForQL] openWakeSkill addSkill SkillID(~p) SkillLvNew(~p)", [SkillID, SkillLvNew]),
									addSkill(SkillID, SkillLvNew)
							end
						end,
					lists:foreach(Fun, SkillIDList);
				_ ->
					?ERROR("openWakeSkill can not find SkillLv(~p) from cfg_transformspell", [SkillLv])
			end;
		_ ->
			skip
	end,
	ok.

doKeepWake(
	NeedWake
	, SkillLevel
	, #transformspellCfg{fakeskill = FakeSkillList} = WSInfo
) ->
	RealSkillList = getAwakenSkills(WSInfo),
	BuffList = playerState:getBuffList(),
	FFE =
		fun(SkillID, AccBuff)->
			case getCfg:getCfgByKey(cfg_skill, SkillID) of
				#skillCfg{effects = Effects} ->
					lists:append(AccBuff,effectBuffList(Effects, []));
				_ ->
					AccBuff
			end
		end,

	RealSkillBuffList = lists:foldl(FFE, [], RealSkillList),
	FakeSkillBuffList = lists:foldl(FFE, [], FakeSkillList),
	CurBuffList = [BuffCurID || #recBuff{buffID = BuffCurID} <- BuffList],

	case NeedWake of
		true ->
			[playerBuff:delBuff(BuffID1) || BuffID1 <- RealSkillBuffList],
			IntersectionList = misc:intersection(FakeSkillBuffList, CurBuffList),
			case IntersectionList of
				[] ->
					FunCallTempSkill =
						fun(SkillID) ->
							playerSkill:addSysSkill(SkillID, SkillLevel),
							playerMsg:sendNetMsg(#pk_GS2U_SpiritArea_Wake_Sync{skillID = SkillID})
						end,
					lists:foreach(FunCallTempSkill, FakeSkillList);
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,

	ok.

effectBuffList([], Acc)->
	Acc;
effectBuffList([EffectID | Effects], Acc)->
	NewAcc =
	case getCfg:getCfgByKey(cfg_skill_effect, EffectID) of
		#skill_effectCfg{param1 = BuffID} ->
			[BuffID | Acc];
		_ ->
			Acc
	end,
	effectBuffList(Effects, NewAcc).

%%保持觉醒
-spec keepWake(NeedWake::boolean()) -> ok.
keepWake(NeedWake) ->
	SkillExp = playerPropSync:getProp(?PriProp_WakeUpExp),
	case SkillExp > 0 of
		true ->
			{_, SkillLv} = playerGodWeapon:getWakeSkillLvByExp(SkillExp),
			case getCfg:getCfgByKey(cfg_transformspell, SkillLv, playerState:getCareer()) of
				#transformspellCfg{} = WSInfo ->
					doKeepWake(NeedWake, SkillLv, WSInfo);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%自动升级技能
-spec autoUpSkill(Level :: uint()) -> ok.
autoUpSkill(Level) ->
	%%开放新技能槽
	openNewSlot(Level),

	%%开放新技能
	openNewSkill(Level).

%%开放新技能槽
%%SkillList = playerState:getSkill(),

%%升级技能
%%autoUpSkill(Level, SkillList).

addSkillPointLevelUp(Level) ->
	OldSkillPoint = playerPropSync:getProp(?PriProp_SkillPoint),
	New =
		case getCfg:getCfgByArgs(cfg_indexGrowth, Level) of
			#indexGrowthCfg{index62 = V} ->
				V;
			_ ->
				1
		end,
	playerPropSync:setInt64(?PriProp_SkillPoint, OldSkillPoint + New),
	ok.

getSkillPointTotal(Level)->
	lists:foldl(
		fun(Lv, Acc) ->
			case getCfg:getCfgByArgs(cfg_indexGrowth, Lv) of
				#indexGrowthCfg{index62 = V} ->
					Acc + V;
				_ ->
					Acc + 1
			end
		end, 0,lists:seq(1, Level)).

resetSkill()->
	case canResetSkill() of
		{true, CostDiamond}->
			case resetSkillCost(CostDiamond) of
				true ->
					doResetSkill();
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.

resetSkillCost(0)->
	true;
resetSkillCost(Diamond)->
	playerMoney:useCoin(
		?CoinUseTypeDiamond,
		Diamond,
		#recPLogTSMoney{
			reason=?CoinSourceResetSkill,
			target=?PLogTS_PlayerSelf,
			source=?PLogTS_PlayerSelf
		}
	).

canResetSkill()->
	Level = playerState:getLevel(),
	{OpenLevel, FreeLevel, CostDiamond} = getResetSkillCfg(),
	{IsOk, _Cost} = RetData = if
		Level < OpenLevel ->
			{false, -1};
		Level =< FreeLevel ->
			{true, 0};
		true ->
			{true, CostDiamond}
	end,
	case IsOk of
		true ->
			TotalSkillPoint = getSkillPointTotal(playerState:getLevel()),
			OldSkillPoint = playerPropSync:getProp(?PriProp_SkillPoint),
			if
				% 未消耗技能点 不用重置
				OldSkillPoint >= TotalSkillPoint ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SkillResetError),
					{false, -1};
				true ->
					RetData
			end;
		_ ->
			RetData
	end.

doResetSkill()->
	Career = playerState:getCareer(),
	L1 = getCfg:get1KeyList(cfg_skill),
	L2 = filterLearnedCareerSkill(Career, L1),
	L3 = lists:foldl(
		fun(SkillID, Acc) ->
			case getCfg:getCfgByKey(cfg_skill, SkillID) of
				#skillCfg{comboID = 0} ->
					[SkillID | Acc];
				_ ->
					Acc
			end
		end, [], L2),
	S1 = playerState:getSkill(),
	S2 = lists:foldl(
		fun(#recSkill{skillID = ID} = R, Acc)->
			case lists:member(ID, L3) of
				true ->
					lists:keystore(
						ID,
						#recSkill.skillID,
						Acc,
						R#recSkill{level = 1}
					);
				_ ->
					Acc
			end
		end, S1, S1),
	playerState:setSkill(S2),
	TotalSkillPoint = getSkillPointTotal(playerState:getLevel()),
	playerPropSync:setInt64(?PriProp_SkillPoint, TotalSkillPoint),
	sendSkillInfo2Client(),
	playerForce:calcPlayerForce(true),
	ok.

calcOneSkillPointCost(_SkillID, Level, SumCost) when Level < 2 ->
	SumCost;
calcOneSkillPointCost(SkillID, Level, SumCost) ->
	case getCfg:getCfgByArgs(cfg_player_skills_upgrading, SkillID, Level) of
		#player_skills_upgradingCfg{skillcoin_cost = SkillPoint} ->
			calcOneSkillPointCost(SkillID, Level - 1, SumCost + SkillPoint);
		_ ->
			calcOneSkillPointCost(SkillID, Level - 1, SumCost)
	end.

%% v3.0.0屏蔽旧版补偿
%% give15
%%checkAndDoResetSkill()->
%%	CurCareer = playerState:getCareer(),
%%	SKillList = playerState:getSkill(),
%%	CostSkillPoint = lists:foldl(
%%		fun(#recSkill{skillID = SkillID, level = Level}, SumCost)->
%%			case getCfg:getCfgByKey(cfg_skill, SkillID) of
%%				#skillCfg{skillClass = CurCareer} ->
%%					SumCost + calcOneSkillPointCost(SkillID, Level, 0);
%%				_ ->
%%					SumCost
%%			end
%%		end, 0, SKillList),
%%
%%	CurSkillPoint = playerPropSync:getProp(?PriProp_SkillPoint),
%%	TotalSkillPoint = getSkillPointTotal(playerState:getLevel()),
%%	case (CurSkillPoint + CostSkillPoint) =/=  TotalSkillPoint of
%%		true ->
%%			doResetSkill();
%%		_ ->
%%			skip
%%	end.

getResetSkillCfg()->
	case getCfg:getCfgByKey(cfg_globalsetup,skillpoints_reset) of
		#globalsetupCfg{setpara = [OpenLevel, FreeLevel, CostDiamond | _]}->
			{OpenLevel, FreeLevel, CostDiamond};
		_ ->
			{1000, 0, 99999999}
	end.


-spec upSkill(SkillID :: uint(), Type :: uint()) -> ok.
upSkill(SkillID, 11) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_UseSkillErrorSkill);
		#recSkill{level = CurLevel} = Rec ->
			case isMax(SkillID, Rec) of
				true ->
					{NewSkillLevel, _} = doUpSkillAllInOne(SkillID, 20),
					case NewSkillLevel > CurLevel of
						true ->
							playerForce:calcPlayerForce(true),
							noticeSkilllv(SkillID, NewSkillLevel),
							playerSkill:upgradeSkillBuff(SkillID, NewSkillLevel),
							ok;
						_ ->
							skip
					end;
				ErrorCode ->
					playerMsg:sendErrorCodeMsg(ErrorCode)
			end
	end,
	ok;
upSkill(SkillID, _Type) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_UseSkillErrorSkill);
		#recSkill{level = CurLevel} ->
			{NewSkillLevel, ErrorCode} = doUpSkill(SkillID),
			case NewSkillLevel > CurLevel of
				true ->
					playerForce:calcPlayerForce(true),
					noticeSkilllv(SkillID, NewSkillLevel),
					playerSkill:upgradeSkillBuff(SkillID, NewSkillLevel),
					ok;
				_ ->
					playerMsg:sendErrorCodeMsg(ErrorCode)
			end
	end,
	ok.


doUpSkillAllInOne(SkillID, TailCallLimit) ->
	CurLevel = playerSkill:getPlayerSkillLevel(SkillID),
	{NewSKillLevel, ErrorCode} = doUpSkill(SkillID),
	case NewSKillLevel > CurLevel of
		true ->
			doUpSkillAllInOne(SkillID, TailCallLimit - 1);
		_ ->
			{NewSKillLevel, ErrorCode}
	end.


doUpSkill(SkillID) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		#recSkill{level = Lv} = Rec ->
			case isCanUpSkill(SkillID, Rec) of
				{Coins, Items, SkillPoint} ->
					Fun =
						fun({Type, Num}) ->
							PLog = #recPLogTSMoney{
								reason = ?CoinUseSkillUp,
								param = SkillID,
								target = ?PLogTS_PlayerSkill,
								source = ?PLogTS_PlayerSelf
							},
							useMoneyOnUpSkill(Type, Num, PLog)
						end,

					lists:foreach(Fun, Coins),
					delItem(Items, ?ItemDeleteReasonUpSkillItem),
					decSkillPoint(SkillPoint),
					NewLv = Lv + 1,
					updateSkill(Rec, NewLv),
					{NewLv, 0};
				Error ->
					{Lv, Error}
			end;
		_ ->
			{0, 0}
	end.

%% 自动升级普通连击
onRoleLevelUpBaseComboSkill(NewLevel) ->
	L0 = comboSkillCfgList(),
	lists:foreach(
		fun(SkillID1) ->
			doAutoLevelUpComboSkill(SkillID1, NewLevel)
		end, L0),
	playerForce:calcPlayerForce(true),
	ok.

doAutoLevelUpComboSkill(SkillID, NewSkillLevel) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		#recSkill{level = Lv} = Rec when Lv < NewSkillLevel ->
			updateSkill(Rec, NewSkillLevel),
			noticeSkilllv(SkillID, NewSkillLevel),
			playerSkill:upgradeSkillBuff(SkillID, NewSkillLevel);
		_ ->
			skip
	end,
	ok.

%%对插槽进行操作
-spec operateSlot(SlotType, Info) -> ok when
	SlotType :: uint(),
	Info :: #pk_SkillSlotInfo{}.
operateSlot(_, #pk_SkillSlotInfo{index = Index}) when Index =< 0 andalso Index >= 6 ->
	{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}};
operateSlot(SlotType, #pk_SkillSlotInfo{skillID = SkillID} = Info) ->
	SkillList = playerState:getSkill(),
	{Result, OldIndex, SkillInfo, SkillType} =
		case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
			#recSkill{level = Level} ->
				{Result0, OldIndex0, SkillInfo0} = changeSlot(SlotType, Info, Level),
				#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
				{Result0, OldIndex0, SkillInfo0, Type};
			_ ->
				%%无效技能
				{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}, 0}
		end,
	SendInfo = #pk_GS2U_ChangeSkillSlotResult{changeType = Result,
		skillType = SkillType,
		oldIndex = OldIndex,
		newSkillInfo = SkillInfo},
	playerMsg:sendNetMsg(SendInfo).

changeSlot(?AddSlotSkill, #pk_SkillSlotInfo{skillID = SkillID, index = Index} = SkillInfo, Level) ->
	NewIndex = calcIndex(SkillID, Index),
	IsHasOpenSlot = isHasOpenSlot(NewIndex),
	IsCanEebed = isCanEmbed(SkillID),
	IsSlotEmbed = isSlotEmbed(NewIndex),
	if
		IsHasOpenSlot =:= false ->
			{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}};
		IsCanEebed =:= false ->
			{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}};
		IsSlotEmbed =:= true ->
			{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}};
		true ->
			case isSkillEmbed(SkillID) of
				#recSlotSkill{slot = Slot} = Skill ->
					%%更新插槽技能
					updateSlotSkill(Skill, NewIndex),
					OldIndex = returnIndex(SkillID, Slot);
				_ ->
					%%增加到技能槽中
					addSlotSkill(SkillID, NewIndex),
					OldIndex = 0
			end,
			%%增加被动技能效果
			addPassEff(SkillID, Level),

			%%增加调用技能
			playerSkill:addCallSkill(SkillID, Level),

			%%移除特殊buff
			[playerBuff:delSpecBuff(BuffID) || BuffID <- [?SpecBuff1, ?SpecBuff2, ?SpecBuff3]],

			%%移除召唤的宠物
%%			[playerPet:delPetByID(PetID) || PetID <- [?DelPetID1, ?DelPetID2, ?DelPetID3, ?DelPetID4, ?DelPetID5, ?DelPetID6, ?DelPetID7, ?DelPetID8, ?DelPetID9]],

			%%成功
			{?AddSlotSkillOk, OldIndex, SkillInfo}
	end;
changeSlot(?DelSlotSkill, #pk_SkillSlotInfo{skillID = SkillID, index = Index} = SkillInfo, _Level) ->
	IsCanUninstall = isCanUninstall(SkillID),
	IsSkillEmbed = isSkillEmbed(SkillID),
	IsSlotEmbed = isSlotEmbed(calcIndex(SkillID, Index)),
	if
		IsCanUninstall =:= false ->
			{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}};
		IsSkillEmbed =:= false ->
			{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}};
		IsSlotEmbed =:= false ->
			{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}};
		true ->
			SSL = playerState:getSlotSkill(),
			#recSlotSkill{slot = Slot} = lists:keyfind(SkillID, #recSlotSkill.skillID, SSL),
			case returnIndex(SkillID, Slot) =:= Index of
				true ->
					%%删除插槽中的技能
					delSlotSkill(SkillID, Slot),

					%%移除被动技能效果
					delPassEff(SkillID),

					%%移除调用技能
					playerSkill:delCallSkill(SkillID),

					%%移除特殊buff
					[playerBuff:delSpecBuff(BuffID) || BuffID <- [?SpecBuff1, ?SpecBuff2, ?SpecBuff3]],

					%%移除召唤的宠物
%%					[playerPet:delPetByID(PetID) || PetID <- [?DelPetID1, ?DelPetID2, ?DelPetID3, ?DelPetID4, ?DelPetID5, ?DelPetID6, ?DelPetID7, ?DelPetID8, ?DelPetID9]],

					%%成功
					{?DelSlotSkillOk, Index, SkillInfo};
				_ ->
					{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}}
			end
	end;
changeSlot(_, _, _) ->
	{?SlotSkillError, 0, #pk_SkillSlotInfo{index = 0, skillID = 0}}.

%%设置技能等级，同时会计算该等级下的加法值与乘法值
-spec setLevel(#recSkill{}, SkillLevel) -> #recSkill{} when
	SkillLevel :: uint().
setLevel(#recSkill{skillID = SkillID} = Skill, SkillLevel) ->
	RuneAddLevel = playerState2:getRuneSkillProp(SkillID),
	Cfg = getCfg:getCfgPStack(cfg_skill, Skill#recSkill.skillID),
%%	DamageType = Cfg#skillCfg.damageType,
	DamageMultiply = Cfg#skillCfg.damageMultiply,
%%	case DamageType =:= ?SkillDamageTypeDefault andalso PlusDamType =:= ?SkillDamageTypeDefault of
%%		true ->
%%			Skill#recSkill{
%%				level = SkillLevel,
%%				damagePlus = 0,
%%				isModified = true, %%等级发生变化，需要保存
%%				damageMultiply = calcForm(DamageMultiply, SkillLevel)
%%			};
%%		_ ->
	DamagePlus = Cfg#skillCfg.damagePlus,
	Skill#recSkill{
		level = SkillLevel,
		runeAddLevel = RuneAddLevel,
		isModified = true, %%等级发生变化，需要保存
		damagePlus = calcForm(DamagePlus, SkillLevel, RuneAddLevel),
		damageMultiply = calcForm(DamageMultiply, SkillLevel, RuneAddLevel)
	}.
%%	end.

-spec calcForm(MultOrPlus, SkillLevel, RuneAddLevel) -> float() when
	MultOrPlus :: number() | undefined,
	SkillLevel :: uint(),
	RuneAddLevel :: uint().
calcForm(MultOrPlus, SkillLevel, RuneAddLevel) ->
	case is_list(MultOrPlus) of
		true ->
			Fun = fun(Elem, Sum) ->
				case Elem of
					{1, Arg1, Arg2} ->
						Sum + Arg1 + (SkillLevel + RuneAddLevel - 1) * Arg2;
					{2, Arg1, Arg2} ->
						Value = buff:getGrowthValue(SkillLevel, Arg2),
						Sum + Arg1 + Value;
					{3, Arg1, Arg2, PropKey} ->
						PropValue = playerState:getBattlePropTotal(PropKey),
						Sum + Arg1 + Arg2 * PropValue;
					{4, Arg1, Arg2} ->
						PowerEnergy = playerBase:getSpecBattlePropPower(),
						Sum + Arg1 + Arg2 * PowerEnergy;
					_ ->
						Sum
				end
			      end,
			lists:foldl(Fun, 0, MultOrPlus);
		_ ->
			0
	end.
%% ====================================================================
%% Internal functions
%% ====================================================================

%%开放新的技能
-spec openNewSkill(Level :: uint()) -> ok.
openNewSkill(Level) ->
	SkillIDList = getCfg:get1KeyList(cfg_skill),
	openNewSkill(Level, SkillIDList).
openNewSkill(_, []) ->
	ok;
openNewSkill(Level, [SkillID | List]) ->
	Career = playerState:getCareer(),
	case isAddSkill(SkillID, Career, Level) of
		true ->
			addSkill(SkillID, 1),
			addPassEff(SkillID, 1),
			noticeOpenSkill(SkillID, Level),
			openNewSkill(Level, List);
		_ ->
			openNewSkill(Level, List)
	end.

%%开放新的技能槽
-spec openNewSlot(Level :: uint()) -> ok.
openNewSlot(Level) ->
	List = initSlot(),
	openNewSlot(Level, List).

openNewSlot(_, []) ->
	ok;
openNewSlot(Level, [Index | List]) ->
	case isOpenSlot(Index, Level) of
		true ->
			addSlot(Index, true),
			noticeOpenSlot(Index),
			openNewSlot(Level, List);
		_ ->
			openNewSlot(Level, List)
	end.

%%增加新的技能槽，并且默认保存到数据库
-spec addSlot(Index, IsOpen) -> ok when
	Index :: uint(),
	IsOpen :: boolean().
addSlot(Index, IsOpen) ->
	addSlot(Index, IsOpen, true).

%%增加新的技能槽
-spec addSlot(Index, IsOpen, IsSaveDB) -> ok when
	Index :: uint(), IsOpen :: boolean(), IsSaveDB :: boolean().
addSlot(Index, IsOpen, IsSaveDB) when erlang:is_boolean(IsOpen) ->
	SlotList = playerState:getSlotList(),
	NewSlot = case IsOpen of
		          true ->
			          %%保存到数据库
			          case IsSaveDB of
				          true ->
					          playerSave:saveNewSkillSlot(Index);
				          _ ->
					          skip
			          end,
			          {Index, true};
		          _ ->
			          {Index, false}
	          end,
	NSL = lists:keystore(Index, 1, SlotList, NewSlot),
	playerState:setSlotList(NSL),
	ok.

%%增加新技能
-spec addSkill(SkillID, Level) -> ok when
	SkillID :: uint(),
	Level :: uint().
addSkill(SkillID, Level) ->
	addSkill(SkillID, Level, true).

-spec addSkill(SkillID, Level, IsSave) -> ok when
	SkillID :: uint(),
	Level :: uint(), IsSave :: boolean().
addSkill(SkillID, Level, _IsSave) ->
	SkillList = playerState:getSkill(),
	Skill = #recSkill{
		skillID = SkillID,
		level = Level,
		damagePlus = 0,
		damageMultiply = 1,
		damage = 0
	},
	NewSkill = playerSkillLearn:setLevel(Skill, Level),
	SL = lists:keystore(SkillID, #recSkill.skillID, SkillList, NewSkill),
	%%?DEBUG("[DebugForQL] addSkill~n~p", [{SkillID, Skill, SkillList, NewSkill, SL, Level}]),
	playerState:setSkill(SL),

	%% 都不中途保存技能，改为下线或定时统一保存
%%	case IsSave of
%%		true ->
%%			playerSave:saveSkill(Skill);
%%		_ ->
%%			skip
%%	end,

	%% add log
	dbLog:sendSaveLogSkill(playerState:getRoleID(), SkillID, Level),
	ok.

%-spec delSkill(SkillID :: uint()) -> ok.
%delSkill(SkillID) ->
%	SkillList = playerState:getSkill(),
%	NewSkillList = lists:keydelete(SkillID, #recSkill.skillID, SkillList),
%	playerState:setSkill(NewSkillList),
%	ok.

%%更新技能
-spec updateSkill(Skill, Level) -> ok when
	Skill :: #recSkill{},
	Level :: uint().
updateSkill(#recSkill{skillID = SkillID} = Skill, Level) ->
	SkillList = playerState:getSkill(),
	NewSkill = playerSkillLearn:setLevel(Skill, Level),
	SL = lists:keyreplace(SkillID, #recSkill.skillID, SkillList, NewSkill),
	playerState:setSkill(SL),

	%%刷新被动buff
	addPassEff(SkillID, Level),
	playerSkill:delCallSkill(SkillID),
	playerSkill:addCallSkill(SkillID, Level),

	%% add log
	dbLog:sendSaveLogSkill(playerState:getRoleID(), SkillID, Level),
	ok.

%%更新技能附加等级计算新属性
-spec updateSkillWithRLevel(SkillID) -> ok when
	SkillID :: uint().
updateSkillWithRLevel(SkillID) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		#recSkill{level = Level} = Skill ->
			NewSkill = playerSkillLearn:setLevel(Skill, Level),
			SL = lists:keyreplace(SkillID, #recSkill.skillID, SkillList, NewSkill),
			playerState:setSkill(SL),

			%%刷新被动buff
			addPassEff(SkillID, Level),
			playerSkill:delCallSkill(SkillID),
			playerSkill:addCallSkill(SkillID, Level);
		_ ->
			skip
	end.

%%增加插槽技能
-spec addSlotSkill(SkillID, Index) -> ok when
	SkillID :: uint(),
	Index :: int().
addSlotSkill(SkillID, Index) ->
	Now = misc_time:getUTCNowMSDiff2010(),
	SkillList = playerState:getSlotSkill(),
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	SlotSkill = #recSlotSkill{
		skillID = SkillID,
		slot = Index,
		type = Type,
		time = Now,
		isModified = true
	},
	SSL = lists:keystore(SkillID, #recSlotSkill.skillID, SkillList, SlotSkill),
	playerState:setSlotSkill(SSL).

%%更新插槽技能
-spec updateSlotSkill(Skill, Index) -> ok when
	Skill :: #recSlotSkill{},
	Index :: int().
updateSlotSkill(#recSlotSkill{skillID = SkillID} = Skill, Index) ->
	Now = misc_time:getUTCNowMSDiff2010(),
	SkillList = playerState:getSlotSkill(),
	NewSkill = Skill#recSlotSkill{time = Now, slot = Index, isModified = true},
	SSL = lists:keyreplace(SkillID, #recSkill.skillID, SkillList, NewSkill),
	playerState:setSlotSkill(SSL).

%%删除插槽技能
-spec delSlotSkill(SkillID, Slot) -> ok when
	SkillID :: uint(), Slot :: uint().
delSlotSkill(SkillID, Slot) ->
	SSL = playerState:getSlotSkill(),
	NewSSL = lists:keydelete(SkillID, #recSlotSkill.skillID, SSL),
	playerState:setSlotSkill(NewSSL),
	L = playerState:getDelSlotSkillList(),
	L1 = lists:keystore(Slot, 1, L, {Slot}),
	playerState:setDelSlotSkillList(L1),
	ok.

%%增加被动效果
-spec addPassEff(SkillID, Level) -> ok when
	SkillID :: uint(),
	Level :: uint().
addPassEff(SkillID, Level) ->
	#skillCfg{skillType = SkillType, skillEx = Ex} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		SkillType =:= ?PassivitySkill andalso Ex =:= undefined ->
			playerEffect:addPassEffect(SkillID, Level);
		true ->
			skip
	end,
	ok.

%%移除被动效果
-spec delPassEff(SkillID) -> ok when
	SkillID :: uint().
delPassEff(SkillID) ->
	#skillCfg{skillType = SkillType, skillEx = Ex} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		SkillType =:= ?PassivitySkill andalso Ex =:= undefined ->
			playerEffect:delPassEffect(SkillID);
		SkillType =:= ?PassivitySkill andalso is_list(Ex) =:= true ->
			delPassEff(SkillID, Ex);
		true ->
			skip
	end.

-spec delPassEff(SkillID, Ex) -> ok when
	SkillID :: uint(),
	Ex :: list().
delPassEff(_SkillID, Ex) ->
	Fun = fun(Element) ->
		case Element of
			{?SpecPassSkill1, _, BuffID} ->
				playerBuff:delNoRepeatBuff(BuffID);
			{?SpecPassSkill2, PetID, BuffID} ->
				PetList = playerState:getCallPet(),
				Fun = fun(#recCallPet{pet_code = Code, pet_id = ID}) ->
					case PetID =:= ID of
						true ->
							monsterInterface:delBuff(Code, BuffID);
						_ ->
							skip
					end
				      end,
				lists:foreach(Fun, PetList);
			{?SpecPassSkill3, _, BuffID} ->
				playerBuff:delNoRepeatBuff(BuffID);
			{?SpecPassSkill4, _, BuffID} ->
				playerBuff:delNoRepeatBuff(BuffID);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, Ex).

%%获取初始化插槽技能列表
-spec getSlotList(Career) -> list() when
	Career :: uint().
getSlotList(Career) ->
	#player_descCfg{baseSkill = SkillList} = getCfg:getCfgPStack(cfg_player_desc, Career),
	case is_list(SkillList) of
		true ->
			SkillList;
		_ ->
			[]
	end.

%%获取初始化被动技能列表
-spec getPassList(Career) -> list() when
	Career :: uint().
getPassList(Career) ->
	#player_descCfg{bornSkill = SkillList} = getCfg:getCfgPStack(cfg_player_desc, Career),
	case is_list(SkillList) of
		true ->
			SkillList;
		_ ->
			[]
	end.

%%根据技能类型改变索引值
-spec calcIndex(SkillID, Index) -> uint() when
	SkillID :: uint(),
	Index :: uint().
calcIndex(SkillID, Index) ->
	TabType = getSkillTab(SkillID),
	Index + (TabType - 1) * ?IntervalNum.

%%还原技能索引
-spec returnIndex(SkillID, Index) -> uint() when
	SkillID :: uint(),
	Index :: uint().
returnIndex(SkillID, Index) ->
	TabType = getSkillTab(SkillID),
	Index - (TabType - 1) * ?IntervalNum.

-spec returnIndex1(Index, TabType) -> uint() when
	Index :: uint(),
	TabType :: uint().
returnIndex1(Index, TabType) ->
	Index - (TabType - 1) * ?IntervalNum.

%%获取技能选项类型
-spec getSkillTab(SkillID) -> uint() when
	SkillID :: uint().
getSkillTab(SkillID) ->
	#skillCfg{skillType = SkillType, skillClass = Class} = getCfg:getCfgPStack(cfg_skill, SkillID),
	IsActiveSkill = isActiveSkill(SkillType),
	IsPassSkill = isPassSkill(SkillType),
	IsRoleSkill = isRoleSkill(Class),
	if
		IsActiveSkill =:= true andalso IsRoleSkill =:= true ->
			?TabOne;
		IsPassSkill =:= true ->
			?TabTwo;
		true ->
			?TabOther
	end.

%%获取技能槽选项类型
-spec getSlotTab(Index) -> uint() when
	Index :: uint().
getSlotTab(Index) ->
	if
		Index >= 1 andalso Index =< ?CellNum ->
			?TabOne;
		Index >= ?IntervalNum + 1 andalso Index =< ?IntervalNum + ?CellNum ->
			?TabTwo;
		true ->
			?TabOther
	end.

%%根据觉醒卡牌等级获取觉醒技能
-spec getAwakenSkills(TransformSpell :: #transformspellCfg{}) -> list().
getAwakenSkills(#transformspellCfg{skill = Skills}) -> Skills.
%%	getAwakenSkills(playerState:getCareer(), Cfg).

%%getAwakenSkills(?Career_10_Warrior, #transformspellCfg{} = Cfg) ->
%%	Cfg#transformspellCfg.paladin;
%%getAwakenSkills(?Career_20_Magician, #transformspellCfg{} = Cfg) ->
%%	Cfg#transformspellCfg.wizard;
%%getAwakenSkills(?Career_30_Bravo, #transformspellCfg{} = Cfg) ->
%%	Cfg#transformspellCfg.assassin;
%%getAwakenSkills(?CareerTrainee, #transformspellCfg{} = Cfg) ->
%%	Cfg#transformspellCfg.soulReaper;
%%getAwakenSkills(?CareerMechanic, #transformspellCfg{} = Cfg) ->
%%	Cfg#transformspellCfg.mechanic;
%%getAwakenSkills(Career, #transformspellCfg{} = Cfg) ->
%%	?ERROR("getAwakenSkills Carrer[~p]", [Career]),
%%	[].

%%是否可以镶嵌
-spec isCanEmbed(SkillID) -> boolean() when
	SkillID :: uint().
isCanEmbed(SkillID) ->
	SSL = playerState:getSlotSkill(),
	#skillCfg{conflictSkill = ConflictID} = getCfg:getCfgPStack(cfg_skill, SkillID),
	isCanEmbed(ConflictID, SkillID, SSL).

isCanEmbed(0, _SkillID, _SSL) ->
	true;
isCanEmbed(_ConflictID, _SkillID, []) ->
	true;
isCanEmbed(ConflictID, SkillID, [#recSlotSkill{slot = 0} | SSL]) ->
	isCanEmbed(ConflictID, SkillID, SSL);
isCanEmbed(ConflictID, SkillID, [#recSlotSkill{skillID = SlotSkillID} | SSL]) ->
	#skillCfg{conflictSkill = ID} = getCfg:getCfgPStack(cfg_skill, SlotSkillID),
	case ID =:= ConflictID andalso SkillID =/= SlotSkillID of
		true ->
			false;
		_ ->
			isCanEmbed(ConflictID, SkillID, SSL)
	end;
isCanEmbed(ConflictID, SkillID, [_ | SSL]) ->
	isCanEmbed(ConflictID, SkillID, SSL).

%%是否可以卸载
-spec isCanUninstall(SkillID) -> boolean() when
	SkillID :: uint().
isCanUninstall(SkillID) ->
	Now = misc_time:getUTCNowMSDiff2010(),
	case playerState:isPlayerBattleStatus() of
		true ->
			false;
		_ ->
			SkillCDList = playerState:getSkillCD(),
			case lists:keyfind(SkillID, 1, SkillCDList) of
				{SkillID, CDTime} ->
					case Now >= CDTime of
						true ->
							true;
						_ ->
							false
					end;
				_ ->
					true
			end
	end.

%%判断技能是否镶嵌
-spec isSkillEmbed(SkillID) -> false | #recSlotSkill{} when
	SkillID :: uint().
isSkillEmbed(SkillID) ->
	SSL = playerState:getSlotSkill(),
	case lists:keyfind(SkillID, #recSlotSkill.skillID, SSL) of
		#recSlotSkill{slot = Slot} = Skill when Slot =/= 0 ->
			Skill;
		_ ->
			false
	end.

%%判断技能槽是否已经开放
-spec isHasOpenSlot(Index) -> boolean() when
	Index :: uint().
isHasOpenSlot(Index) ->
	case checkSlotOpen(Index) of
		true ->
			true;
		_ ->
			false
	end.

%%判断技能槽是否被镶嵌
-spec isSlotEmbed(Index) -> boolean() when
	Index :: uint().
isSlotEmbed(Index) ->
	SSL = playerState:getSlotSkill(),
	case lists:keyfind(Index, #recSlotSkill.slot, SSL) of
		#recSlotSkill{} ->
			true;
		false ->
			false
	end.


%%判断主动技能
-spec isActiveSkill(SkillType) -> boolean() when
	SkillType :: uint().
isActiveSkill(SkillType) ->
	case lists:member(SkillType, ?ActiveSkillList) of
		true ->
			true;
		_ ->
			false
	end.

%%判断是不是角色职业技能
-spec isRoleSkill(Class) -> boolean() when
	Class :: uint().
isRoleSkill(Class) ->
	case lists:member(Class, ?RoleSkill) of
		true ->
			true;
		_ ->
			false
	end.

%%判断被动技能
-spec isPassSkill(SkillType) -> boolean() when
	SkillType :: uint().
isPassSkill(SkillType) ->
	case lists:member(SkillType, ?PassSkillList) of
		true ->
			true;
		_ ->
			false
	end.

%%%是否升级技能
%-spec isUpSkill(SkillID, OldLevel, CurLevel) -> true | false | maxLevel when
%	SkillID :: uint(),
%	OldLevel :: uint(),
%	CurLevel :: uint().
%isUpSkill(SkillID, OldLevel, CurLevel) ->
%	#skillCfg{studySkill = StudySkill, maxLevel = MaxLevel} = getCfg:getCfgPStack(cfg_skill, SkillID),
%	isUpSkill(StudySkill, OldLevel, CurLevel, MaxLevel).
%
%isUpSkill(?IncreMentUp, _OldLevel, CurLevel, MaxLevel) when MaxLevel >= CurLevel ->
%	true;
%isUpSkill(?IncreMentUp, OldLevel, _CurLevel, MaxLevel) when MaxLevel > OldLevel ->
%	maxLevel;
%isUpSkill(_, _, _, _) ->
%	false.

-spec isCanUpSkill(SkillID :: uint(), #recSkill{}) -> uint() | {list(), list()}.
isCanUpSkill(SkillID, #recSkill{level = Lv} = Rec) ->
	case isMax(SkillID, Rec) of
		true ->
			isPl(SkillID, Lv);
		Error ->
			Error
	end.
isMax(SkillID, #recSkill{level = OldLevel}) ->
	#skillCfg{
		maxLevel = MaxLevel,
		studySkill = StudySkill
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	isMax(StudySkill, OldLevel, MaxLevel).

isMax(?LearnUp, OldLevel, MaxLevel) when MaxLevel > OldLevel ->
	true;
isMax(?LearnUp, _OldLevel, _MaxLevel) ->
	?ErrorCode_UseSkillErrorUpMax;
isMax(_, _, _) ->
	?ErrorCode_UseSkillErrorNotUp.

isPl(SkillID, OldLevel) ->
	PlayerLevel = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_player_skills_upgrading, SkillID, OldLevel + 1) of
		#player_skills_upgradingCfg{currency = Currency, item = Item, player_level = Lv, skillcoin_cost = SkillPoint} ->
			case PlayerLevel >= Lv of
				true ->
					case isEnoughItem(Item) of
						false ->
							?ErrorCode_UseSkillErrorUpMaterial;
						_ ->
							case isEnoughCoin(Currency) of
								false ->
									?ErrorCode_SkillMoneyNotEnough;
								_ ->
									case isEnoughSkillPoint(SkillPoint) of
										true ->
											{Currency, Item, SkillPoint};
										_ ->
											?ErrorCode_UseSkillErrorUpSkillPoint
									end
							end
					end;
				_ ->
					?ErrorCode_UseSkillErrorUpPlayer
			end;
		_ ->
			?ErrorCode_UseSkillErrorUpMax
	end.

-spec isEnoughItem(list()) -> boolean().
isEnoughItem([]) ->
	true;
isEnoughItem([{ID, Num} | L]) ->
	case playerPackage:getItemNumByID(ID) >= Num of
		true ->
			isEnoughItem(L);
		_ ->
			false
	end.

-spec isEnoughCoin(list()) -> boolean().
isEnoughCoin([]) ->
	true;
isEnoughCoin([{CoinType, Num} | L]) ->
	case canUseMoney(CoinType, Num) of
		true ->
			isEnoughCoin(L);
		_ ->
			false
	end.

-spec isEnoughCoinByUseType(list()) -> boolean().
isEnoughCoinByUseType([]) ->
	true;
isEnoughCoinByUseType([{CoinType, Num} | L]) ->
	case canUseMoneyByUseType(CoinType, Num) of
		true ->
			isEnoughCoinByUseType(L);
		_ ->
			false
	end.

isEnoughSkillPoint(Diff) ->
	playerPropSync:getProp(?PriProp_SkillPoint) >= Diff.

decSkillPoint(Diff) ->
	V = playerPropSync:getProp(?PriProp_SkillPoint),
	case V >= Diff of
		true ->
			playerPropSync:setInt64(?PriProp_SkillPoint, V - Diff);
		_ ->
			false
	end.

-spec canUseMoney(CoinType :: uint(), Num :: uint()) -> boolean().
canUseMoney(CoinType, Num) ->
	CoinUseType = playerMoney:coinType2CoinUseType(CoinType),
	playerMoney:canUseCoin(CoinUseType, Num).

-spec canUseMoneyByUseType(CoinType :: uint(), Num :: uint()) -> boolean().
canUseMoneyByUseType(CoinType, Num) ->
	case CoinType >= ?CoinUseTypeMin of
		true ->
			playerMoney:canUseCoin(CoinType, Num);
		_ ->
			false
	end.

-spec useMoneyOnUpSkill(CoinType :: uint(), Num :: uint(), Plog :: #recPLogTSMoney{}) -> boolean().
useMoneyOnUpSkill(CoinType, Num, PLog) ->
	CoinUseType = playerMoney:coinType2CoinUseType(CoinType),
	Ret = playerMoney:useCoin(CoinUseType, Num, PLog),
	case Ret of
		true ->
			CoinType2 = playerMoney:coinUseType2CoinType(CoinUseType),
			addUpSkillCost(CoinType2, Num);
		_ ->
			skip
	end,
	Ret.

addUpSkillCost(CoinType, MoneyNumber)->
	L1 = playerPropSync:getProp(?SerProp_UpSkill_CostList),
	%%CoinType = playerMoney:coinUseType2CoinType(MoneyType),
	L2 =
		case lists:keyfind(CoinType, 1, L1) of
		{CoinType, OldNumber} ->
			lists:keystore(CoinType, 1, L1, {CoinType, OldNumber + MoneyNumber});
		_ ->
			[{CoinType, MoneyNumber} | L1]
		end,
	playerPropSync:setAny(?SerProp_UpSkill_CostList, L2),
	ok.

%%扣除道具
-spec delItem(ItemList :: list(), Reason :: uint()) -> ok.
delItem([], _) ->
	ok;
delItem([{ID, Num} | List], Reason) ->
	case erlang:is_integer(ID) andalso ID > 0 andalso erlang:is_integer(Num) andalso Num > 0 of
		true ->
			Plog = #recPLogTSItem{
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
			playerPackage:delGoodsByID(?Item_Location_Bag, ID, Num, Plog);
		_ ->
			skip
	end,
	delItem(List, Reason).

%%扣钱
-spec useMoney(ItemList :: list(), Reason :: uint()) -> ok.
useMoney([], _) ->
	ok;
useMoney([{CoinUseType, Num} | List], Reason) ->
	PLog = #recPLogTSMoney{
		reason = Reason,
		param =  0,
		target = ?PLogTS_PlayerSkill,
		source = ?PLogTS_PlayerSelf
	},
	playerMoney:useCoin(CoinUseType, Num, PLog),
	useMoney(List, Reason).

%%是否开放技能槽
-spec isOpenSlot(Index, Level) -> boolean() when
	Index :: uint(),
	Level :: uint().
isOpenSlot(Index, Level) ->
	case checkSlotOpen(Index) of
		true ->
			false;
		_ ->
			checkSlotLevel(Level, Index)
	end.

%%是否增加技能
-spec isAddSkill(SkillID, CurCareer, CurLevel) -> boolean() when
	SkillID :: uint(),
	CurCareer :: uint(),
	CurLevel :: uint().
isAddSkill(SkillID, CurCareer, CurLevel) ->
	#skillCfg{skillClass = Career, baseLevel = Level, nouse = Nouse} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case checkSkillLearn(SkillID) of
		true ->
			false;
		_ ->
			case checkSkillCarrer(CurCareer, Career) of
				true ->
					case checkSkillOpen(CurLevel, Level) of
						true ->
							checkSkillIsHide(Nouse);
						_ ->
							false
					end;
				_ ->
					false
			end
	end.

%% %%是否增加觉醒技能
%%-spec isAddAwakenSkill(SkillID, CurLevel) -> boolean() when
%%	SkillID :: uint(),
%%	CurLevel :: uint().
%%isAddAwakenSkill(SkillID, CurLevel) ->
%%	#skillCfg{skillClass = Career, baseLevel = Level} = getCfg:getCfgPStack(cfg_skill, SkillID),
%%	case checkSkillLearn(SkillID) of
%%		true ->
%%			false;
%%		_ ->
%%			case checkAwakenSkillCarrer(Career) of
%%				true ->
%%					checkSkillOpen(CurLevel, Level);
%%				_ ->
%%					false
%%			end
%%	end.

%%判断技能槽是否已经开放
-spec checkSlotOpen(Index) -> boolean() when
	Index :: uint().
checkSlotOpen(Index) ->
	SlotList = playerState:getSlotList(),
	case lists:keyfind(Index, 1, SlotList) of
		{Index, true} -> %%开放
			true;
		_ ->
			false
	end.

%%判断技能槽是否开放根据等级
-spec checkSlotLevel(CurLevel, Index) -> boolean() when
	CurLevel :: uint(),
	Index :: uint().
checkSlotLevel(CurLevel, Index) ->
	OpenLevel = globalCfg:getSkillSlotOpenSkill(Index),
	case CurLevel >= OpenLevel of
		true ->
			true;
		_ ->
			false
	end.

%%判断技能是否已经学习
-spec checkSkillLearn(SkillID) -> boolean() when
	SkillID :: uint().
checkSkillLearn(SkillID) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		false ->
			false;
		_ ->
			true
	end.

%%判断技能职业是否符合
-spec checkSkillCarrer(CurCareer, Career) -> boolean() when
	CurCareer :: uint(),
	Career :: uint().
%% checkSkillCarrer(_, ?ShapeSkill) ->
%% 	true;
checkSkillCarrer(?CareerMechanic, ?PlayerMechanicSkill) ->
	true;
checkSkillCarrer(?CareerMechanic, _) ->
	false;
checkSkillCarrer(CurCareer, Career) when CurCareer =:= Career ->
	true;
checkSkillCarrer(_, _) ->
	false.

%%判断技能职业是否符合
-spec checkAwakenSkillCarrer(Career) -> boolean() when
	Career :: uint().
checkAwakenSkillCarrer(?ShapeSkill) ->
	true;
checkAwakenSkillCarrer(?ShapegetSkill) ->
	true;
checkAwakenSkillCarrer(?AwakeSkill) ->
	true;
checkAwakenSkillCarrer(_) ->
	false.

%%判断技能是否开放根据等级
-spec checkSkillOpen(CurLevel, OpenLevel) -> boolean() when
	CurLevel :: uint(),
	OpenLevel :: uint().
checkSkillOpen(CurLevel, OpenLevel) when CurLevel >= OpenLevel ->
	true;
checkSkillOpen(_, _) ->
	false.

%%检查技能是否屏蔽
-spec checkSkillIsHide(IsHide :: uint()) -> boolean().
checkSkillIsHide(1) ->
	false;
checkSkillIsHide(_) ->
	true.

%%通知客服端开放技能
-spec noticeOpenSkill(SkillID, Level) -> ok when
	SkillID :: uint(), Level :: uint().
noticeOpenSkill(SkillID, Level) ->
	OpenSkill = #pk_GS2U_OpenSkill{skillId = SkillID, level = Level},
	playerMsg:sendNetMsg(OpenSkill).

%%通知客服端开放技能槽
-spec noticeOpenSlot(Index) -> ok when
	Index :: uint().
noticeOpenSlot(Index) ->
	TabType = getSlotTab(Index),
	NewIndex = returnIndex1(Index, TabType),
	SlotInfo = #pk_OpenSlot{slot = NewIndex, type = TabType},
	OpenSlot = #pk_GS2U_OpenSlot{openSlot = SlotInfo},
	playerMsg:sendNetMsg(OpenSlot).

%%通知客服端技能等级变化
-spec noticeSkilllv(SkillID :: uint(), Lv :: uint()) -> ok.
noticeSkilllv(SkillID, Lv) ->
	Msg = #pk_GS2U_SkillInfo{id = SkillID, level = Lv},
	playerMsg:sendNetMsg(Msg).





%isComboSkill(SkillID) ->
%	L = comboSkillCfgList(),
%	lists:member(SkillID, L).


comboSkillCfgList() ->
	Career = playerState:getCareer(),
	case getCfg:getCfgPStack(cfg_player_desc, Career) of
		#player_descCfg{comboSkillID = Key} ->
			case getCfg:getCfgPStack(cfg_comboSkill, Key) of
				#comboSkillCfg{skills = Skills} ->
					Skills;
				_ -> []
			end;
		_ -> []
	end.

sendSkillSlotSkillInfo2Client() ->
	[AcList, TranList, PassList] = makeSlotSkillInfo(),
	playerMsg:sendNetMsg(#pk_GS2U_InitiativeSkillSlotInfoList{skillSlotList = AcList}),
	playerMsg:sendNetMsg(#pk_GS2U_PassiveSkillSlotInfoList{skillSlotList = PassList}),
	playerMsg:sendNetMsg(#pk_GS2U_TransformSkillSlotInfoList{skillSlotList = TranList}).
%%	case AcList of
%%		[] ->
%%			skip;
%%		AcList ->
%%				playerMsg:sendNetMsg(#pk_GS2U_InitiativeSkillSlotInfoList{skillSlotList = AcList})
%%		end,
%%		case PassList of
%%			[] ->
%%				skip;
%%			PassList ->
%%				playerMsg:sendNetMsg(#pk_GS2U_PassiveSkillSlotInfoList{skillSlotList = PassList})
%%		end,
%%		case TranList of
%%			[] ->
%%				skip;
%%			TranList ->
%%				playerMsg:sendNetMsg(#pk_GS2U_TransformSkillSlotInfoList{skillSlotList = TranList})
%%	end.



-spec makeSlotSkillInfo() -> list().
makeSlotSkillInfo() ->
	SlotSkill = playerState:getSlotSkill(),
	Fun = fun(#recSlotSkill{type = Type, slot = Index, skillID = SkillID}, Acc) ->
		case Index =:= 0 of
			true ->
				Acc;
			_ ->
				case getCfg:getCfgPStack(cfg_skill, SkillID) of
					#skillCfg{skillClass = Class, nouse = 0} ->
						[AcList, TranList, PassList] = Acc,
						NewIndex = playerSkillLearn:returnIndex(SkillID, Index),
						IsPassSkill = playerSkillLearn:isPassSkill(Type),
						IsActiveSkill = playerSkillLearn:isActiveSkill(Type),
						IsRoleSkill = playerSkillLearn:isRoleSkill(Class),
						if
							IsPassSkill =:= true ->
								[AcList, TranList, [#pk_SkillSlotInfo{index = NewIndex, skillID = SkillID} | PassList]];
							IsActiveSkill =:= true andalso IsRoleSkill =/= true ->
								[AcList, [#pk_SkillSlotInfo{index = NewIndex, skillID = SkillID} | TranList], PassList];
							true ->
								[[#pk_SkillSlotInfo{index = NewIndex, skillID = SkillID} | AcList], TranList, PassList]
						end;
					_ ->
						% 应该这个技能从SlotSkill列表移除
						changeSlot(?DelSlotSkill, #pk_SkillSlotInfo{skillID = SkillID, index = Index}, 1)
				end
		end
   end,
	lists:foldl(Fun, [[], [], []], SlotSkill).


sendSkillInfo2Client() ->
	SkillInfo = makeSkillInfo(),
	playerMsg:sendNetMsg(SkillInfo).

-spec makeSkillInfo() -> #pk_GS2U_SkillInfoList{}.
makeSkillInfo() ->
	SkillList = playerState:getSkill(),
	Career = playerState:getCareer(),
	PlayerCode = playerState:getPlayerCode(),
	playerSkillLearn:initPassSkill(Career),
	Fun = fun(#recSkill{skillID = SkillID, level = Level}, AccIn) ->
		#skillCfg{
			skillType = SkillType,
			nouse = Nouse,
			skillEx = Ex,
			skillClass = Class
		} = getCfg:getCfgPStack(cfg_skill, SkillID),
		case Nouse of
			1 -> %%策划屏蔽技能
				AccIn;
			_ ->
				delPassEff(SkillID),
				addPassSkill(SkillID, SkillType, Ex, Level),
				case playerSkillLearn:checkSkillCarrer(Career, Class) orelse playerSkillLearn:checkAwakenSkillCarrer(Class) of
					true ->
						RemainCD = playerSkill:getSkillRemainCD(SkillID),
						Info = #pk_SkillInfo{
							id = SkillID,
							level = Level,
							remainCD = RemainCD
						},
						[Info | AccIn];
					_ ->
						AccIn
				end
		end
	      end,
	List = lists:foldl(Fun, [], SkillList),
	#pk_GS2U_SkillInfoList{
		code = PlayerCode,
		skillInfoList = List
	}.

%%增加被动技能
-spec addPassSkill(SkillID, Type, Ex, Level) -> ok when
	SkillID :: uint(),
	Type :: uint(),
	Ex :: undefined | list(),
	Level :: uint().
addPassSkill(SkillID, ?PassivitySkill, undefined, Level) ->
%%	被动技能自动生效
	playerEffect:addPassEffect(SkillID, Level),
	playerSkill:addCallSkill(SkillID, Level),
	ok;
addPassSkill(SkillID, Type, _Ex, Level) ->
	IsActive = lists:member(Type, ?ActiveSkillList),
	IsTrigger = lists:member(Type, ?PassSkillList),
	if
		IsActive =/= true andalso IsTrigger =/= true ->
			skip;
		true ->
			SkillList = playerState:getSlotSkill(),
			case lists:keyfind(SkillID, #recSlotSkill.skillID, SkillList) of
				#recSlotSkill{} ->
					playerSkill:addCallSkill(SkillID, Level);
				_ ->
					skip
			end
	end,
	ok.

sendSkillSlotInfo() ->
	SlotInfo = makeSlot(),
	playerMsg:sendNetMsg(SlotInfo).

-spec makeSlot() -> #pk_GS2U_OpenSlotList{}.
makeSlot() ->
	SlotList = playerState:getSlotList(),
	Fun = fun({Index, IsOpen}, Acc) ->
		case IsOpen of
			true ->
				TabType = playerSkillLearn:getSlotTab(Index),
				NewIndex = playerSkillLearn:returnIndex1(Index, TabType),
				SlotInfo = #pk_OpenSlot{slot = NewIndex, type = TabType},
				[SlotInfo | Acc];
			_ ->
				Acc
		end
	      end,
	List = lists:foldl(Fun, [], SlotList),
	#pk_GS2U_OpenSlotList{slotList = List}.

checkCondition(CostExp, _ItemList, CoinList) when CostExp =/= undefined andalso  CostExp > 0 ->
	CurExp = playerState:getCurExp(),
	case CurExp >= CostExp  of
		true ->
			case isEnoughCoinByUseType(CoinList) of
				true ->
					{true, 0};
				_ ->
					{false, ?ErrorCode_SkillMoneyNotEnough}
			end;
		_ ->
			{false, ?ErrorCode_SkillEXPNotEnough}
	end;
checkCondition(_CostExp, ItemList,CoinList) ->
	case isEnoughItem(ItemList) of
		true ->
			case isEnoughCoinByUseType(CoinList) of
				true ->
					{true, 0};
				_ ->
					{false, ?ErrorCode_SkillMoneyNotEnough}
			end;
		_ ->
			{false, ?ErrorCode_SkillItemNotEnough}
	end.

checkOtherLimit([]) ->
	{true, 0};
checkOtherLimit([PassSkillID, LevelLimit]) ->
	SkillList = playerPropSync:getProp(?SerProp_CareerPassiveSkill),
	case lists:keyfind(PassSkillID, 1, SkillList) of
		{PassSkillID, CurLevel} when CurLevel >= LevelLimit ->
			{true, 0};
		_ ->
			{false, ?ErrorCode_PerskillLevelNotEnough}
	end.

delteMaterial(IsOk, CostExp, _ItemList, CoinList) when CostExp =/= undefined andalso CostExp > 0 ->
	case IsOk of
		true ->
			playerBase:decExp(CostExp, ?ExpOutCareerPassSkill, CostExp),
			useMoney(CoinList, ?CoinUsePassivaSkillUp);
		_ ->
			skip
	end;
delteMaterial(IsOk, _Cost_Exp, ItemList, CoinList) ->
	case IsOk of
		true ->
			delItem(ItemList, ?ItemDeletePassiveSkillUp),
			useMoney(CoinList, ?CoinUsePassivaSkillUp);
		_ ->
			skip
	end.

doUpPassiveSkill(PassiveSkillID,Level) ->
	case getCfg:getCfgByKey(cfg_passive_skill, PassiveSkillID, Level + 1) of
		#passive_skillCfg{otherid_limit = OthLimit, level_limit = LevelLimit,cost_exp = Cost_Exp, cost_item = ItemCost, cost_coin = CoinCost} ->
			% 扣钱扣物品
			PlayerLevel = playerState:getLevel(),
			{IsOK,ErrorCode} = checkCondition(Cost_Exp, ItemCost, CoinCost),
			{IsOk2,NewLevel,OldLevel,LastErrorCode} = case IsOK of
				true when LevelLimit =< PlayerLevel ->
					case checkOtherLimit(OthLimit) of
						{true,_ErrorCode1} ->
							{true, Level + 1, Level,0};
						{false,ErrorCode1} ->
							{false, Level + 1, Level,ErrorCode1}
					end;
				false when LevelLimit =< PlayerLevel ->
					{false, Level + 1, Level, ErrorCode};
				_ ->
					{false, Level + 1, Level, ?ErrorCode_UseSkillErrorUpPlayer}
			end,
			delteMaterial(IsOk2, Cost_Exp, ItemCost, CoinCost),
			{IsOk2, NewLevel, OldLevel, LastErrorCode};
		_ ->
			case Level > 0 of
				true ->
					{false, Level , Level, ?ErrorCode_UseSkillErrorUpMax};
				_ ->
					{false, Level , Level, ?ErrorCode_UseSkillErrorSkill}
			end
	end.

isMember(_SkillID, []) ->
	false;
isMember(SkillID, [GroupID | T]) ->
	case getCfg:getCfgByKey(cfg_passive_skill_group, GroupID) of
		#passive_skill_groupCfg{includeskills = SkillList} ->
			case lists:member(SkillID, SkillList) of
				true ->
					true;
				_ ->
					isMember(SkillID, T)
			end;
		_ ->
			isMember(SkillID, T)
	end.

isTheCareerHasTheSkill(PassiveSkillID) ->
	PlayerCareer = playerState:getCareer(),
	#player_descCfg{passiveskill_group = GroupList} = getCfg:getCfgPStack(cfg_player_desc, PlayerCareer),
	isMember(PassiveSkillID, GroupList).

upPassiveSkill(PassiveSkillID) ->
	case isTheCareerHasTheSkill(PassiveSkillID) of
		true ->
			SkillList = playerPropSync:getProp(?SerProp_CareerPassiveSkill),
			{IsUp, NewLevel, OldLevel,ErrorCode} = case lists:keyfind(PassiveSkillID, 1, SkillList) of
				false ->
					doUpPassiveSkill(PassiveSkillID, 0);
				{_SkillID,Level} ->
					doUpPassiveSkill(PassiveSkillID, Level)
			end,
			case IsUp of
				true ->
					NewList = lists:keystore(PassiveSkillID, 1, SkillList,{PassiveSkillID,NewLevel}),
					playerPropSync:setAny(?SerProp_CareerPassiveSkill, NewList),
					playerMsg:sendNetMsg(#pk_GS2U_PassiveSkillInfo{id = PassiveSkillID, level = NewLevel}),
					% 属性加成计算
					{OldAddList,OldMulList} = getOneCareerPassiveSkillProp(del, PassiveSkillID, OldLevel),
					{NewAddList,NewMulList} = getOneCareerPassiveSkillProp(add, PassiveSkillID, NewLevel),
					playerCalcProp:changeProp_AddMulti(OldAddList, OldMulList, NewAddList, NewMulList, true),
					initCareerPassiveSkill(),
					playerForce:calcPlayerForce(true);
				_ ->
					playerMsg:sendErrorCodeMsg(ErrorCode)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SkillCareerNotMatch)
	end,
	ok.

sendCareerPassiveSkillInfo() ->
	SlotInfo = makeCareerPassiveSkill(),
	playerMsg:sendNetMsg(SlotInfo).


-spec makeCareerPassiveSkill() -> #pk_GS2U_PassiveSkillInfoList{}.
makeCareerPassiveSkill() ->
	case isCareerPassHasOpen() of
		true ->
			SkillList = playerPropSync:getProp(?SerProp_CareerPassiveSkill),
			Fun = fun({SkillID, Level}, LastList) ->
						OneInfo = #pk_PassiveSkillInfo{id = SkillID, level = Level},
						[OneInfo | LastList]
			      end,
			PkList = lists:foldl(Fun, [], SkillList),
			#pk_GS2U_PassiveSkillInfoList{skillList = PkList};
		_ ->
			#pk_GS2U_PassiveSkillInfoList{skillList = []}
	end.

initAddCareerSkill([]) ->
	ok;
initAddCareerSkill([PassSkillID | T]) ->
	SkillList = playerPropSync:getProp(?SerProp_CareerPassiveSkill),
	PlayerLevel = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_passive_skill, PassSkillID,1) of
		#passive_skillCfg{otherid_limit = OthLimit, cost_exp = CostExp, cost_item = [], cost_coin = [], level_limit = LevelLimit}
			when LevelLimit =< PlayerLevel andalso (CostExp == undefined orelse CostExp =< 0) ->
			case lists:keyfind(PassSkillID, 1, SkillList) of
				false ->
					case checkOtherLimit(OthLimit) of
						{true, _ErrorCode} ->
							playerPropSync:setAny(?SerProp_CareerPassiveSkill, [{PassSkillID,1} | SkillList]),
							playerMsg:sendNetMsg(#pk_GS2U_PassiveSkillInfo{id = PassSkillID, level = 1}),
							{NewAddList, NewMulList} = getOneCareerPassiveSkillProp(add, PassSkillID, 1),
							playerCalcProp:changeProp_AddMulti([], [], NewAddList, NewMulList, true),
							playerForce:calcPlayerForce(true);
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	initAddCareerSkill(T).

%% 重置转职技能
resetCareerPassiveSkill() ->
	playerPropSync:setAny(?SerProp_CareerPassiveSkill, []).

%% 初始化不需要激活的转职被动技能
initCareerPassiveSkill() ->
	case isCareerPassHasOpen() of
		true ->
			PlayerCareer = playerState:getCareer(),
			#player_descCfg{passiveskill_group = GroupList} = getCfg:getCfgPStack(cfg_player_desc, PlayerCareer),
			FunDeal = fun(GroupID) ->
				case getCfg:getCfgByKey(cfg_passive_skill_group, GroupID) of
					#passive_skill_groupCfg{includeskills = SkillList} ->
						initAddCareerSkill(SkillList);
					_ ->
						skip
				end
			end,
			lists:foreach(FunDeal,GroupList);
		_ ->
			skip
	end,
	ok.

%% 累计统计加法加值
countAddPropValue(add, PropID, AddValue, AddList) when AddValue > 0 ->
	case lists:keyfind(PropID, 1, AddList) of
		{_ProID,ProNum} ->
			lists:keystore(PropID, 1, AddList, {PropID, ProNum + AddValue});
		false ->
			[{PropID, AddValue} | AddList]
	end;
countAddPropValue(add, _PropID, _AddValue, AddList) ->
	AddList;
countAddPropValue(del, PropID, AddValue, AddList) when AddValue > 0 ->
	case lists:keyfind(PropID, 1, AddList) of
		{_ProID, ProNum} ->
			lists:keystore(PropID, 1, AddList, {PropID, ProNum - AddValue});
		false ->
			[{PropID, -AddValue} | AddList]
	end;
countAddPropValue(del, _PropID, _AddValue, AddList) ->
	AddList.
%% 累计统计乘法加值
countMulPropValue(PropID, MulValue, MulList) when MulValue > 0 ->
	[{PropID,MulValue} | MulList];
countMulPropValue(_PropID, _MulValue, MulList) ->
	MulList.

%% 获得需要减去或者添加某等级的转职被动技能的属性加成
getOneCareerPassiveSkillProp(AddOrDel, PassiveSkillID, Level) ->
	case getCfg:getCfgByKey(cfg_passive_skill, PassiveSkillID, Level) of
		#passive_skillCfg{prop = AddPropList} ->
			FunDeal = fun({PropID,AddValue,MulValue},{AddList, MulList}) ->
				AddList1 = countAddPropValue(AddOrDel, PropID, AddValue, AddList),
				MulList1 = countMulPropValue(PropID, MulValue, MulList),
				{AddList1, MulList1}
			end,
			lists:foldl(FunDeal, {[],[]}, AddPropList);
		_ ->
			{[],[]}
	end.

%% 需要减去或者添加的所有转职被动技能的属性加成
getAllCareerPassiveSkillProp(AddOrDel) ->
	SkillList = playerPropSync:getProp(?SerProp_CareerPassiveSkill),
	FunCal = fun({PassiveSkillID,Level},{AddList,MulList}) ->
		case getCfg:getCfgByKey(cfg_passive_skill, PassiveSkillID,Level) of
			#passive_skillCfg{prop = AddPropList} ->
				FunDeal = fun({PropID,AddValue,MulValue},{AddList1, MulList1}) ->
					AddList2 = countAddPropValue(AddOrDel, PropID, AddValue, AddList1),
					MulList2 = countMulPropValue(PropID, MulValue, MulList1),
					{AddList2, MulList2}
            end,
				lists:foldl(FunDeal, {AddList,MulList}, AddPropList);
			_ ->
				{AddList,MulList}
		end
   end,
	lists:foldl(FunCal, {[],[]}, SkillList).

addCareerPassiveSkillProp() ->
	case isCareerPassHasOpen() of
		true ->
			{LastAddList, LastMulList} = getAllCareerPassiveSkillProp(add),
			playerCalcProp:changeProp_AddMulti([], [], LastAddList, LastMulList, true),
			playerForce:calcPlayerForce(true);
		_ ->
			skip
	end,
	ok.

%% 减去转职被动技能的属性加成
delCareerPassiveSkillProp() ->
	{LastAddList, LastMulList} = getAllCareerPassiveSkillProp(del),
	playerCalcProp:changeProp_AddMulti(LastAddList, LastMulList, [], [], true),
	playerForce:calcPlayerForce(true),
	ok.

calcOneMaterial(_PassiveSkillID, Level, {Exp, ItemList, CoinList}) when Level =< 0 ->
	{Exp, ItemList,CoinList};
calcOneMaterial(PassiveSkillID, Level, {Exp, ItemList, CoinList}) ->
	case getCfg:getCfgByKey(cfg_passive_skill, PassiveSkillID,Level) of
		#passive_skillCfg{cost_exp = Cost_Exp, cost_coin = Cost_coin} when Cost_Exp =/= undefined andalso Cost_Exp > 0->
			FunAddCoin = fun({CoinUseType,CoinNum}, CoinList1) ->
				CoinType = playerMoney:coinUseType2CoinType(CoinUseType),
				case lists:keyfind(CoinType, 1, CoinList1) of
					{_CoinType,ProCoinNum} ->
						lists:keystore(CoinType,1,CoinList1,{CoinType, ProCoinNum + CoinNum});
					false ->
						[{CoinType,CoinNum} | CoinList1]
				end
			end,
			NewCoinList = lists:foldl(FunAddCoin, CoinList, Cost_coin),
			calcOneMaterial(PassiveSkillID, Level - 1, {Exp + Cost_Exp, ItemList, NewCoinList});
		#passive_skillCfg{cost_item = Cost_item, cost_coin = Cost_coin} ->
			FunAddItem = fun({ItemID,ItemNum}, ItemList1) ->
				case lists:keyfind(ItemID, 1, ItemList1) of
					{_ItemID,ProItemNum} ->
						lists:keystore(ItemID,1,ItemList1,{ItemID, ProItemNum + ItemNum});
					false ->
						[{ItemID,ItemNum} | ItemList]
				end
			end,
			NewItemList = lists:foldl(FunAddItem, ItemList, Cost_item),
			FunAddCoin = fun({CoinUseType,CoinNum}, CoinList1) ->
				CoinType = playerMoney:coinUseType2CoinType(CoinUseType),
				case lists:keyfind(CoinType, 1, CoinList1) of
					{_CoinType,ProCoinNum} ->
						lists:keystore(CoinType,1,CoinList1,{CoinType, ProCoinNum + CoinNum});
					false ->
						[{CoinType,CoinNum} | CoinList1]
				end
			end,
			NewCoinList = lists:foldl(FunAddCoin, CoinList, Cost_coin),
			calcOneMaterial(PassiveSkillID, Level - 1, {Exp, NewItemList,NewCoinList});
		_ ->
			calcOneMaterial(PassiveSkillID, Level - 1, {Exp, ItemList,CoinList})
	end.

calcExpToItemList(0) ->
	[];
calcExpToItemList(AllExp) ->
	ExpStageList = case getCfg:getCfgByKey(cfg_globalsetup, passive_skill_exp_recycle) of
       #globalsetupCfg{setpara = [{_Exp,_ItemID} | _T] = StageList} ->
          StageList;
       _ ->
          []
    end,
	calcExpToItemList(ExpStageList, AllExp,[]).

calcExpToItemList([], _AllExp, ItemList) ->
	ItemList;
calcExpToItemList([{ExpStage, ItemID} | T], AllExp, ItemList) when AllExp >= ExpStage ->
	NewList = [{ItemID, AllExp div ExpStage} | ItemList],
	calcExpToItemList(T, AllExp rem ExpStage, NewList);
calcExpToItemList([{_ExpStage, _ItemID} | T], AllExp, ItemList) ->
	calcExpToItemList(T, AllExp, ItemList).

returnCareerPassiveSkillCost() ->
	SkillList = playerPropSync:getProp(?SerProp_CareerPassiveSkill),
	FunCal = fun({PassiveSkillID,Level},{Exp, ItemList, CoinList}) ->
		calcOneMaterial(PassiveSkillID,Level,{Exp, ItemList, CoinList})
	end,
	{AllExp, LastItemList, LastCoinList} = lists:foldl(FunCal,{0,[],[]}, SkillList),
	ExpItemList = calcExpToItemList(AllExp),

	RoleID = playerState:getRoleID(),
	Title = stringCfg:getString(career_transfer_email_3),
	Content = stringCfg:getString(career_transfer_email_4),
	lists:foreach(
		fun({MoneyType, MoneyNumber}) ->
			mail:sendMoneySystemMail(RoleID, Title, Content, MoneyType, MoneyNumber, [])
		end, LastCoinList),
	lists:foreach(fun({ItemID, ItemNumber}) ->
			playerMail:sendGoodsMailTitleAndContent(ItemID, ItemNumber, false, 0, Title, Content, ?ItemSourceCareerPassiveSkillReset)
      end, LastItemList),
	lists:foreach(fun({ItemID, ItemNumber}) ->
			playerMail:sendGoodsMailTitleAndContent(ItemID, ItemNumber, false, 0, Title, Content, ?ItemSourceCareerPassiveSkillReset)
		end, ExpItemList),
	% 材料返还后就重置
	resetCareerPassiveSkill(),
	ok.

isCareerPassHasOpen() ->
	case core:isCross() of
		true ->
			playerState2:getIsCareerPass();
		_ ->
			variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_CareerPassiveSkill)
	end.

dealPassiveSkillWhenCareerChange() ->
	delCareerPassiveSkillProp(),
	returnCareerPassiveSkillCost(),
	sendCareerPassiveSkillInfo(),
	initCareerPassiveSkill(),
	ok.

%%%-------------------------------------------------------------------
%% api,fix:转职、上线加载技能后
%% 检查是否有未装载技能的技能槽1~5
%% 如果有，则填充
%% 主要是为了解决这个BUG LUN-8554
-spec autoFillSkill() -> no_return().
autoFillSkill() ->
	%% 1.根据技能槽技能筛选出已镶嵌的技能和空余的技能槽，这里只处理1~4普通技能和5觉醒技能
	ListSlotInit = [Slot || {Slot, IsOpen} <- playerState:getSlotList(), IsOpen =:= true, Slot >= 1, Slot =< 5],
	case autoFillSkill_filterSlot(playerState:getSlotSkill(), [], ListSlotInit) of
		{_, [], []} ->
			skip;	%% 已镶嵌满，略过
		{ListSkillIDUsed, _ListSlot14, ListSlot5} ->
			%% 2.将已习得技能筛选为普通职业技能和觉醒职业技能两部分
			{_ListSkillN, ListSkillA} =
				autoFillSkill_filterSkill(playerState:getSkill(), playerState:getCareer(), [], []),
			%% 3.将技能装载到槽中 后面由于技能属性的问题 改为只修复 第五个插槽
			%% autoFillSkill(ListSlot14, ListSkillN, ListSkillIDUsed),
			autoFillSkill(ListSlot5, ListSkillA, ListSkillIDUsed)
	end.

-spec autoFillSkill_filterSlot([#recSlotSkill{}, ...], AccSkillIDUsed::uint(), AccSlot::uint()) ->
	{ListSkillIDUsed::uint(), ListSlot::uint()}.
autoFillSkill_filterSlot([], AccSkillIDUsed, AccSlot) ->
	case lists:member(5, AccSlot) of
		true ->
			{AccSkillIDUsed, lists:delete(5, AccSlot), [5]};
		_ ->
			{AccSkillIDUsed, AccSlot, []}
	end;
autoFillSkill_filterSlot([#recSlotSkill{skillID = SkillID, slot = Slot} | T], AccSkillIDUsed, AccSlot) ->
	autoFillSkill_filterSlot(T, [SkillID | AccSkillIDUsed], lists:delete(Slot, AccSlot)).

-spec autoFillSkill_filterSkill([#recSkill{}, ...], Career::uint(), AccSkillN::[uint(), ...], AccSkillA::[uint(), ...]) ->
	{ListSkillN::[uint(), ...], ListSkillA::[uint(), ...]}.
autoFillSkill_filterSkill([], _Career, AccSkillN, AccSkillA) ->
	{AccSkillN, AccSkillA};
autoFillSkill_filterSkill([#recSkill{skillID = SkillID} | T], Career, AccSkillN, AccSkillA) ->
	case getCfg:getCfgByKey(cfg_skill, SkillID) of
		#skillCfg{nouse = 1} ->
			autoFillSkill_filterSkill(T, Career, AccSkillN, AccSkillA);	%% 这是废弃的技能
		#skillCfg{hiden = 1} ->
			autoFillSkill_filterSkill(T, Career, AccSkillN, AccSkillA);	%% 这是隐藏的技能
		#skillCfg{skillClass = Career, unnormal = 3} ->
			autoFillSkill_filterSkill(T, Career, AccSkillN, [SkillID | AccSkillA]);
		#skillCfg{skillClass = Career, unnormal = 0} ->
			autoFillSkill_filterSkill(T, Career, [SkillID | AccSkillN], AccSkillA);
		_ ->
			autoFillSkill_filterSkill(T, Career, AccSkillN, AccSkillA)
	end.

-spec autoFillSkill(ListSlot::[uint(), ...], ListSkillID::[uint(), ...], ListSkillIDUsed::[uint(), ...]) -> no_return().
autoFillSkill([], _ListSkillID, _ListSkillIDUsed) ->
	ok;
autoFillSkill(_ListSlot, [], _ListSkillIDUsed) ->
	ok;
autoFillSkill([H1 | T1] = ListSlot, [H2 | T2], ListSkillIDUsed) ->
	case lists:member(H2, ListSkillIDUsed) of
		true ->
			autoFillSkill(ListSlot, T2, ListSkillIDUsed);
		_ ->
			playerSkillLearn:operateSlot(?AddSlotSkill,
				#pk_SkillSlotInfo{index = H1, skillID = H2}),
			autoFillSkill(T1, T2, ListSkillIDUsed)
	end.
