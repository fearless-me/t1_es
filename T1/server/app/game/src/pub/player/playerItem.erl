%%
%% @author zhongyunawei
%% @doc @todo 玩家道具相关.


-module(playerItem).
-author(zhongyuanwei).

-include("gsInc.hrl").
-include("playerPropSyncDefine.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

-define(ChangeBigPotion,4100).
-define(ChangesmallerPotion,4101).
-export([
	useBagItem/4,
	useTheMarriageFireWorks/2
]).

%%使用背包里的物品, UseReason是使用原因码
-spec useBagItem(ItemUID, UseNum, UseReason, ParamValue) -> ok|failed when ItemUID::uint(),UseNum::uint(),UseReason::uint(), ParamValue::uint().
useBagItem(ItemUID, UseNum, UseReason, ParamValue) ->
	Item = playerPackage:getGoodsByUID(ItemUID,?Item_Location_Bag),
	case Item of
		#rec_item{itemID = ItemID, pileNum = PileNum} ->
			Now = time:getUTCNowMSDiff2010(),
			case canUseItem(ItemID,Now, UseNum) of
				{_, _CDGroupID, _DailyCountGroupID, 0} ->
					failed;
				{true, CDGroupID, DailyCountGroupID, CanUseNum} ->
					if
						PileNum >= CanUseNum ->  %%判断数量
							useBagItem(Item,CanUseNum,CDGroupID,DailyCountGroupID,Now,UseReason,ParamValue);
						true ->
							failed
					end;
				{?ErrorCode_UseSkillErrorTargetDead, _, _,_} ->
					failed;
				{?ErrorCode_Darkness_Already_In_Floor, _, _,_} ->
					failed;
				{?ErrorCode_Darkness_Transform_Failed_BOSS, _, _,_} ->
					failed;
				{false, _, _,_} ->
					failed;
				{ErrorCode,_,_,_} ->
					playerMsg:sendErrorCodeMsg(ErrorCode),
					failed

			end;
		_ErrorCode_Str ->
			failed
	end.

-spec useBagItem(#rec_item{},UseNum,CDGroupID,DailyCountGroupID,Now,UseReason,ParamValue) -> ok when
	UseNum::uint16(),CDGroupID::uint16(),DailyCountGroupID::uint16(),Now::uint(),UseReason::uint(),ParamValue::uint().
useBagItem(#rec_item{itemUID = ItemUID,itemID = ItemID} = Item, UseNum,CDGroupID,DailyCountGroupID,Now,UseReason,ParamValue) ->
	%%由于触发使用道具的时候会有一些检测，判断是否可以使用，所以不能先扣道具再使用
	UsedNum = playerItemEvent:triggerUseItemEvent(Item,UseNum),
	#itemCfg{useType = UserType, useParam1 = UseParam1, itemType = ItemType} = getCfg:getCfgPStack(cfg_item, ItemID),
	case UsedNum > 0 of
		true ->
			UseResult = playerPackage:useItemByUID(ItemUID,UsedNum,UseReason,ParamValue),
			setUseItemTips(UseResult, ItemID, UsedNum, ItemType),
			setUsedItem(ItemID,CDGroupID,DailyCountGroupID,Now,UsedNum),

			usedItemCallBack(UserType, ItemID, UseParam1, UsedNum),
			addUseItemAchieve(ItemID,UsedNum),
			ok;
		_ ->
			%%如果使用了0个，则需要在各自的事件中去添加各自需要的错误码，并且发送给客户端
			%%这里不统一发送
			setUsedItem(ItemID,CDGroupID,DailyCountGroupID,Now,UsedNum),

			usedItemCallBack(UserType, ItemID, UseParam1, UsedNum),
			addUseItemAchieve(ItemID,UsedNum),
			skip
	end.


%%检查经验道具使用是否多余
-spec checkUseExc(ErrorCode::boolean() | uint(), UserType, UseNum, UseParam1) -> uint() when
	UserType::uint(),UseNum::uint(),UseParam1::uint().
checkUseExc(true, UserType, UseNum, UseParam1) when UserType =:= ?Item_Use_GetEXP orelse UserType =:= ?Item_Use_AddExpByLevel->
	PlayerLev = playerState:getLevel(),
	MaxLevel = playerState2:getWorldMaxLevel(),
	UseNum2 =
		case PlayerLev =:= MaxLevel of
			true ->
				Career = playerState:getCareer(),
				NowExp = playerState:getCurExp(),
				MaxExp = playerBase:getCfgMaxExp(MaxLevel, Career),
				case (NowExp + UseNum * UseParam1 > MaxExp) of
					true ->
						erlang:round((MaxExp - NowExp) div UseParam1);
					_ ->
						UseNum
				end;
			_ ->
				UseNum
		end,
	{true, UseNum2};
checkUseExc(ErrorCode, _, UseNum, _) ->
	{ErrorCode, UseNum}.

%%检查道具是否可以使用
-spec canUseItem(ItemID,Now, UseNum) -> {true | uint(),CDGroupID,DailyCountGroupID} when
	ItemID::itemId(),Now::uint(),UseNum::uint(),CDGroupID::uint16(),DailyCountGroupID::uint16().
canUseItem(ItemID,Now,UseNum) ->
	#itemCfg{
		cdGroup = CDGroupID,
		dailyCountGroup = DailyCountGroupID,
		level = UseLevel,
		useType = UserType,
		useParam1 = UseParam1,
		useMaxCount = UseMaxCount,
		usePlayerClass = CareerLimit,
		itemType = ItemType,
		operate = Operate
	} = getCfg:getCfgPStack(cfg_item, ItemID),
	case UseNum =< UseMaxCount of
		true ->
			CurLevel = playerState:getLevel(),
			Ret0 = checkCrossUse(UserType),
			Ret1 = checkLevel(Ret0,CurLevel,UseLevel),
			Career = playerState:getCareer(),
			Ret2 = checkCareer(Ret1,Career,CareerLimit),
			%% 某些地图不允许使用药水
			Ret2_0 = checkMapCanUse(Ret2, ItemType),
			Ret2_1 = checkMapCanUseDistortion(Ret2_0, UserType),
			Ret3 = checkItemUseCD(Ret2_1,CDGroupID,Now),
			Ret4 = checkPlayerState(Ret3),
			{Ret5, RealUseNumber} = checkItemDailyUseCount(Ret4, ItemID, UseNum, DailyCountGroupID),
			Ret6 = checkItemCanUserExpInDan(Ret5, UserType, UseParam1),
			Ret7 = checkMaxLevelExpSpill(Ret6, UserType),
			Ret8 = checkDarknessItemUse(Ret7, UserType, UseParam1),
			{Ret9, RealUseNumber2} = checkCanUseGuildContribute(Ret8, UserType, RealUseNumber, UseParam1),
			%Ret10 = checkMarriageExpItem(Ret9, UserType),
			Ret10 = checkItemIsAllowUse(Ret9, Operate),
			Ret11 = checkTransformation(Ret10, UserType, UseParam1),
			{Ret12, Num} = checkUseExc(Ret11, UserType, RealUseNumber2, UseParam1),
			{Ret12, CDGroupID, DailyCountGroupID, Num};
		_ ->
			{false,0,0,0}
	end.

%%检测经验丹是否可以使用
-spec checkItemCanUserExpInDan(true, Type :: uint(), ExpType :: uint()) -> true | uint().
checkItemCanUserExpInDan(true, Type, ExpType) ->
	case Type =:= ?Item_Use_MultiExp of
		true ->
			case playerClock:getClock(?ClockType_ExpInDan) of
				[{ExpSubType, _Time}|_] ->
					case ExpSubType > ExpType of
						true ->
							?ErrorCode_BagItemUseExpInDan;
						_ ->
							true
					end;
				_ ->
					true
			end;
		_ ->
			true
	end;
checkItemCanUserExpInDan(ErrorCode, _Type, _ExpType) ->
	ErrorCode.

%% 检测玩家最大等级使用经验道具是否溢出
-spec checkMaxLevelExpSpill(true, UserType :: uint()) -> true | uint().
checkMaxLevelExpSpill(true, UserType) ->
	case UserType =:= ?Item_Use_GetEXP orelse UserType =:=?Item_Use_AddExpByLevel of
		true ->
			Level = playerState:getLevel(),
			Career = playerState:getCareer(),
			NowExp = playerState:getCurExp(),
			MaxLevel = playerState2:getWorldMaxLevel(),
			case Level =:= MaxLevel of
				true ->
					MaxExp = playerBase:getCfgMaxExp(Level, Career),
					case NowExp =:= MaxExp of
						true ->
							?ErrorCode_BagItemExpInMax;
						_ ->
							true
					end;
				_ ->
					true
			end;
		_ ->
			true
	end;
checkMaxLevelExpSpill(ErrorCode, _UserType) ->
	ErrorCode.

%%% 检查姻缘经验道具是否可以使用
%-spec checkMarriageExpItem(true, UserType :: uint()) -> true | uint().
%checkMarriageExpItem(true, UserType) ->
%	?DEBUG("~p.~w checkMarriageExpItem ~p", [?MODULE, ?LINE, UserType]),
%	case UserType =:= ?Item_Use_MarriageExp of
%		true ->
%			case playerMarriage:getPartnerRoleID() of
%				0 ->
%					?DEBUG("~p.~w checkMarriageExpItem", [?MODULE, ?LINE]),
%					?ErrorCode_Marriage_I_Unmarried;
%				_ ->
%					Lv = playerMarriage:getMarriageLevel(),
%					Exp = playerMarriage:getMarriageExp(),
%					LvList = getCfg:get1KeyList(cfg_wedding_ring),
%					LvListRev = lists:reverse(LvList),
%					[MaxLevel | _] = LvListRev,
%					#wedding_ringCfg{exp = MaxExp} =
%						getCfg:getCfgPStack(cfg_wedding_ring, MaxLevel),
%					case Exp >= MaxExp of
%						true ->
%							?DEBUG("~p.~w checkMarriageExpItem", [?MODULE, ?LINE]),
%							?ErrorCode_Marriage_I_LevelMax;
%						_ ->
%							?DEBUG("~p.~w checkMarriageExpItem", [?MODULE, ?LINE]),
%							true
%					end
%			end;
%		_ ->
%			?DEBUG("~p.~w checkMarriageExpItem", [?MODULE, ?LINE]),
%			true
%	end;
%checkMarriageExpItem(ErrorCode, _UserType) ->
%	ErrorCode.

checkCanUseGuildContribute(true, ?Item_Use_GuildContribute, UseNumber, UseParam1) ->
	case playerState:getGuildID() > 0 of
		true ->
			Add = playerGuild:canAddPlayerContribute(UseNumber * UseParam1),
			if
				Add =:= 0 ->
					{?ErrorCode_GuildContrionFailed, UseNumber};
				Add > 0 andalso Add < UseParam1 ->
					{true, 1};
				Add >= UseParam1 ->
					{true, Add div UseParam1};
				true ->
					{?ErrorCode_GuildContrionFailed, UseNumber}
			end;
		false ->
			{?ErrorCode_GuildContrionFailed, UseNumber}
	end;
checkCanUseGuildContribute(ErrorCode, _UserType, UseNumber, _UseParam1) ->
	{ErrorCode, UseNumber}.

checkDarknessItemUse(true, UserType, UseParam1) ->
	case UserType of
		?Item_Use_DarknessTransfer ->
			playerDarkness:canUseDarknessItem(UseParam1);
		_ ->
			true
	end;
checkDarknessItemUse(ErrorCode, _UserType, _UseParam1) ->
	ErrorCode.

%% 检查道具是否允许使用
-spec checkItemIsAllowUse(true | uint(), Operate::uint()) -> true | uint().
checkItemIsAllowUse(true, Operate) ->
	case misc:testBit(Operate, ?Item_Operate_NotUse) of
		true ->
			?ErrorCode_BagItemNotUse;
		_ ->
			true
	end;
checkItemIsAllowUse(ErrorCode, _Operate) ->
	ErrorCode.

checkTransformation(true, ?Item_Use_Buffer, BuffID) ->
	case buff:isTransformationBuff(BuffID) of
		true ->
			case core:isTransformationMap(playerState:getMapID()) of
				true ->
					true;
				_ ->
					?ErrorCode_CurMapNotAllowTransformation
			end;
		_ ->
			true
	end;
checkTransformation(true, _UserType, _UseParam1) ->
	true;
checkTransformation(ErrorCode, _UserType, _UseParam1) ->
	ErrorCode.

checkMapCanUse(true, ?ItemTypeRide) ->
	false;
checkMapCanUse(true, ?ItemTypeDrug) ->
	%% 判断地图
	case playerState:getMapID() of
		?GuildBattleMapID ->
			?ErrorCode_BagItemNotUse;
		_ ->
			true
	end;
checkMapCanUse(ErrorCode, _ItemType) ->
	ErrorCode.

%% 判断能否使用变形药水
checkMapCanUseDistortion(true, ?Item_Use_Transformation) ->
	case core:isTransformationMap(playerState:getMapID()) of
		true ->
			true;
		_ ->
			?ErrorCode_CurMapNotAllowTransformation
	end;
checkMapCanUseDistortion(true, _UseType) ->
	true;
checkMapCanUseDistortion(ErrorCode, _UserType) ->
	ErrorCode.

checkCrossUse(?Item_Use_HPMP) ->
	true;
checkCrossUse(_UserType) ->
	case core:isCross() of
		true ->
			?ErrorCode_SystemClosedOnCGS;
		_ ->
			true
	end.

-spec checkLevel(ErrorCode::true|uint(),CurLevel,LevelLimit) -> true | uint() when
	CurLevel::uint16(),LevelLimit::uint16().
checkLevel(true, CurLevel,LevelLimit) when CurLevel < LevelLimit ->
	%%等级不足
	?ErrorCode_BagItemUseLevelLimit;
checkLevel(true, _CurLevel,_LevelLimit) ->
	true;
checkLevel(ErrorCode, _CurLevel,_LevelLimit) ->
	ErrorCode.

-spec checkCareer(CheckRet,Career,CareerLimit) -> CheckRet when
	CheckRet::true | uint(),Career::career(),CareerLimit::career().
checkCareer(true,Career,CareerLimit) when CareerLimit /= 0 andalso Career =/= CareerLimit->
	%%职业限制
	?ErrorCode_BagItemUseCareerLimit;
checkCareer(true,_Career,_CareerLimit) ->
	true;
checkCareer(ErrorCode,_Career,_CareerLimit) ->
	ErrorCode.

-spec checkItemUseCD(LastCheck,CDGroupID,Now) -> true | uint() when
	LastCheck::true | uint(),CDGroupID::uint16(),Now::uint().
checkItemUseCD(true,CDGroupID,Now) when erlang:is_integer(CDGroupID) andalso CDGroupID > 0 ->
	#itemCDandCountCfg{value = CDTime} = getCfg:getCfgPStack(cfg_itemCDandCount, CDGroupID),
	LastTime = playerState:getItemUseTime(CDGroupID),
	case Now - LastTime > CDTime * 1000 of
		true ->
			true;
		_ ->
			%%使用CD中
			?ErrorCode_BagItemUseInCD
	end;
checkItemUseCD(true,_CDGroupID,_Now) ->
	true;
checkItemUseCD(ErrorCode,_CDGroupID,_Now) ->
	ErrorCode.

checkPlayerState(true) ->
	case playerState:getActionStatus() of
		?CreatureActionStatusDead->
			?ErrorCode_UseSkillErrorTargetDead;
		_->
			true
	end;
checkPlayerState(ErrorCode) ->
	ErrorCode.

%%检查道具组每日使用次数
-spec checkItemDailyUseCount(LastCheck,ItemID, UseNum, DailyCountGroupID) -> {boolean(), uint()} | {uint(), uint()} when
	LastCheck::true | uint(),ItemID::uint(), UseNum::uint(), DailyCountGroupID::uint16().
checkItemDailyUseCount(true, ItemID, UseNum, DailyCountGroupID) when
	erlang:is_integer(DailyCountGroupID) andalso DailyCountGroupID > 0 andalso erlang:is_integer(UseNum) andalso UseNum > 0 ->
	case getCfg:getCfgPStack(cfg_itemCDandCount, DailyCountGroupID) of
		#itemCDandCountCfg{value = Counter} ->
			DailyCounter = playerDaily:getDailyCounter(?DailyType_UseItem,ItemID),
			SYTimes = (Counter - DailyCounter),
			if
				SYTimes =< 0 ->
					%% 今日已经不允许使用了
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemUseDailyCountLimit, [Counter, erlang:max(SYTimes, 0)]),
					{false, UseNum};
				UseNum > SYTimes ->
					{true, SYTimes};
				true ->
					{true, UseNum}
			end;
		_ ->
			%%策划没配置相应的数据，打出错误日志，并让玩家可以使用
			?ERROR("Error,not Cfg of DailyCountGroupID[~p] in cfg_itemCDandCount",[DailyCountGroupID]),
			{true, UseNum}
	end;
checkItemDailyUseCount(true,_ItemID,UseNum,_DailyCountGroupID) ->
	{true, UseNum};
checkItemDailyUseCount(ErrorCode,_ItemID,UseNum,_DailyCountGroupID) ->
	{ErrorCode, UseNum}.

%%设置使用道具信息
-spec setUsedItem(ItemID,CDGroupID,DailyCountGroupID,Now,UsedNum) -> ok when
	ItemID::uint16(),CDGroupID::uint16(),DailyCountGroupID::uint16(),Now::uint(),UsedNum::integer().
setUsedItem(ItemID,CDGroupID,DailyCountGroupID,Now,UsedNum) ->
	playerState:setItemUseTime(CDGroupID,Now),

	%% 计数
	setUsedItemCount(ItemID, DailyCountGroupID, UsedNum),

	playerMsg:sendNetMsg(#pk_GS2U_SingleUseItem{ itemID = ItemID }),
	ok.

-spec setUsedItemCount(ItemID::uint(), DailyCountGroupID::uint(), UsedNum::uint()) -> ok.
setUsedItemCount(ItemID, DailyCountGroupID, UsedNum) when
	erlang:is_integer(DailyCountGroupID) andalso DailyCountGroupID > 0 andalso erlang:is_integer(UsedNum) andalso UsedNum > 0 ->
	%% 每日使用个数计数
	case UsedNum > 0 of
		true ->
			playerDaily:addDailyCounter(?DailyType_UseItem, ItemID, UsedNum),

			%% 给个系统提示
			#itemCDandCountCfg{value = Counter} = getCfg:getCfgPStack(cfg_itemCDandCount, DailyCountGroupID),
			DailyCounter = playerDaily:getDailyCounter(?DailyType_UseItem, ItemID),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemUseDailyCountSuccess, [Counter, Counter - DailyCounter]),
			ok;
		_ ->
			skip
	end,
	ok;
setUsedItemCount(_,_,_) ->
	ok.

%%发送使用道具成功后的tip信息
-spec setUseItemTips(UseResult, ItemID, ItemNum, ItemType) -> ok when
	UseResult::boolean(),ItemID::uint(),ItemNum::uint(), ItemType::uint().
setUseItemTips(_, _ItemID, _ItemNum, ?ItemTypeDrug) ->
	%% 添加本句代码主要是解决pk_GS2U_UseItemResult会被发送两次的问题,playerItemEvent 275行
	ok;
setUseItemTips(_, _ItemID, _ItemNum, ?ItemTypeLifeFood) ->
	%% 添加本句代码主要是解决pk_GS2U_UseItemResult会被发送两次的问题,playerItemEvent 275行
	ok;
setUseItemTips(true, ItemID, ItemNum, _ItemType) ->
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{txt = Txt} when Txt =/= undefined ->
			playerMsg:sendNetMsg(
				#pk_GS2U_UseItemResult{
					itemID = ItemID,
					itemNum = ItemNum,
					result = 0
				});
		_ ->
			ok
	end;
setUseItemTips(_, _, _, _ItemType) ->
	ok.

%% 使用道具回调
usedItemCallBack(?Item_Use_PlayerBQ, _ItemID, IconIndex, UsedNum) when UsedNum > 0 ->
	L = playerPropSync:getProp(?SerProp_PlayerBQs),
	playerPropSync:setAny(?SerProp_PlayerBQs, [IconIndex | L]),
	playerMsg:sendNetMsg(#pk_GS2U_HaveIconAndActionList{icons = [IconIndex], actions = []}),
	ok;
usedItemCallBack(?Item_Use_PlayerDZ, _ItemID, ActionIndex, UsedNum) when UsedNum > 0 ->
	L = playerPropSync:getProp(?SerProp_PlayerDZs),
	playerPropSync:setAny(?SerProp_PlayerDZs, [ActionIndex | L]),
	playerMsg:sendNetMsg(#pk_GS2U_HaveIconAndActionList{icons = [], actions = [ActionIndex]}),
	ok;
usedItemCallBack(?Item_Use_DarknessTransfer, _ItemID, 0, _UsedNum) ->
	%% 传送到准备间
	playerCopyMap:enterCopyMap(?DarknessPrepareMapID),
	ok;

usedItemCallBack(?Item_Use_SpecTitle, _ItemID, _, _UsedNum) ->

	playerAchieve:achieveEvent(?Achieve_Use_RandTitle,[_UsedNum]),
	ok;
usedItemCallBack(?Item_Use_RandTitle, _ItemID, _, _UsedNum) ->
	playerAchieve:achieveEvent(?Achieve_Use_RandTitle,[_UsedNum]),
	ok;
usedItemCallBack(?Item_Use_HPMP, ItemID, _UseParam1, UsedNum) when UsedNum > 0 ->
	%% 在跨服上使用了一个恢复HP的药水，需要同步回普通服
	case core:isCross() of
		true ->
			RoleID = playerState:getRoleID(),

			%% 发消息给原服，强制立即扣钱
			%% 这里之所以不直接发类型和消耗，是因为在跨服上可能会有其它扣钱的情况，而这些情况是不需要同步的。
			ServerID = core:getRealDBIDByUID(RoleID),
			gsCsInterface:transitMsg2ServerOtp(ServerID, ?PsNamePlayerMgr, playerCrossUseItem,
				{RoleID, ItemID, UsedNum}),
			ok;
		_ ->
			skip
	end,
	ok;
usedItemCallBack(_UserType, _ItemID, _UseParam1, _UsedNum) ->
	ok.

addUseItemAchieve(ItemID,UseNum)->
	case ItemID of
		?ChangeBigPotion ->
			playerAchieve:achieveEvent(?Achieve_Usepotion,[UseNum]);
		?ChangesmallerPotion->
			playerAchieve:achieveEvent(?Achieve_Usepotion,[UseNum]);
		_->
			skip
	end,
	ok.

useTheMarriageFireWorks(BuffID, AddPercent)->
	case getCfg:getCfgByKey(cfg_buff, BuffID) of
		#buffCfg{buffDuration = [ContinueTime,_AddLv]} ->
			Level = playerState:getLevel(),
			playerBuff:addBuff(BuffID, Level),
			case playerClock:getClock(?ClockType_MarriageFireWorks) of
				[{ExpSubType, _RemTime}|_] ->
					playerClock:delClock(?ClockType_MarriageFireWorks, ExpSubType),
					playerClock:startClock(?ClockType_MarriageFireWorks, AddPercent, ?ClockNotOffTime, trunc(ContinueTime/1000));
				_ ->
					playerClock:startClock(?ClockType_MarriageFireWorks, AddPercent, ?ClockNotOffTime, trunc(ContinueTime/1000))
			end;
		_ ->
			false
	end.


