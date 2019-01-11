%%%-------------------------------------------------------------------
%%% @author lijie
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:17
%%%-------------------------------------------------------------------
-module(playerAwake).
-author("lijie").

-include("playerPrivate.hrl").

%% API
-export([
	initRoleAwake/0,
	expToVigour/1,
	roleAwakeing/3,
	resetRoleAwake/0,
	useTheAwakeBuff/0,
	stopTheAwakeBuff/0,
	resetBuffEveryDay/0,
	updateAwakeBuff/2,
	addVigor/1,
	getAwakeBuffInfo/0,
	recoverBuffTimeWhenDead/0,
	setAwakeBuffTime/1,
	tickDealBuffTimeOnCross/0,
	isHasOpen/0
]).

initRoleAwake() ->
	case isHasOpen() of
		true ->
			{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
			AwakeList = playerPropSync:getProp(?SerProp_RoleAwakeList),
			FPk = fun({{Stage,Stone},Param},List) ->
				OnePk = #pk_OneAwakeinfo{stage = Stage, stone = Stone, param = Param},
				[OnePk] ++ List
			      end,
			PkList = lists:foldl(FPk, [], AwakeList),
			playerMsg:sendNetMsg(#pk_GS2U_RoleAwakeInof{curStage = CurStage, curStone = CurStone, allAwakeInfo = PkList}),

			%% 登陆的时候检查一下是否需要重置buff时间
			case core:isCross() of
				false ->
					LastUpdateTime = getAwakeBuffOfTime(),
					NowTime = time:getSyncTime1970FromDBS(),
					case core:timeIsOnDay(LastUpdateTime, NowTime) of
						true ->
							skip;
						_ ->
							resetBuffEveryDay()
					end;
				_ ->
					true
			end,
			sendAwakeBuffInfo(),

			%AddSkillId = case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
			%      #awakeCfg{skillid = SkillId} ->
			%         SkillId;
			%      _ ->
			%         0
			%   end,
			%if
			%	AddSkillId > 0 ->
			%		%playerSkill:initAwakeSkill(AddSkillId,1);
			%	true ->
			%		skip
			%end,

			%%计算属性加成
			FCal= fun({{Stage,Stone},Param},PropList)->
				case getCfg:getCfgByArgs(cfg_awake, Stage, Stone)  of
					#awakeCfg{attribute_one = One, attribute_two = Two, attribute_thr = Thr} ->
						AddValueList =  case Param of
							                1 ->
								                One;
							                2 ->
								                Two;
							                3 ->
								                Thr;
							                _ ->
								                []
						                end,
						FAdd= fun({ID,Num},PropList1)->
							case lists:keyfind(ID,1,PropList1) of
								{_ProID,ProNum} ->
									lists:keystore(ID,1,PropList1,{ID,Num+ProNum});
								false ->
									[{ID,Num}|PropList1]
							end
						      end,
						lists:foldl(FAdd,PropList,AddValueList);
					_->
						PropList
				end
			      end,
			AddPropList = lists:foldl(FCal,[],AwakeList),
			playerCalcProp:changeProp_AddMulti([], [], AddPropList, [], true),
			playerForce:calcPlayerForce(true),
			% 这里需要特殊处理
			case isHasUseTheAwakeBuff() of
				{UseBuffID, _EndTime} when UseBuffID > 0 ->
					case core:isCross() of
						true ->
							tickDealBuffTimeOnCross();
						false ->
							setAwakeBuffTime(0)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

expToVigour(ExpValue) ->
	CurExp = playerState:getCurExp(),
	case CurExp >= ExpValue  of
		true ->
			{ExpRatio,VigorRatio,CoinRatio} = getExpToVigorRatio(),
			NeedCoin = trunc(ExpValue / ExpRatio * CoinRatio),
			%%判断货币是否足够
			case playerMoney:canUseCoin(?CoinUseTypeGold,NeedCoin) of
				true ->
					case playerMoney:useCoin(?CoinUseTypeGold, NeedCoin,#recPLogTSMoney{
							reason = ?CoinUseRoleAwakeExpToVigor,
							param = NeedCoin,
							target = ?PLogTS_RoleAwake,
							source = ?PLogTS_PlayerSelf}) of
						true ->
							% 减经验 加元气值
							playerBase:decExp(ExpValue, ?ExpOutRoleToAwake, ExpValue),
							AddVigorValue = trunc(ExpValue / ExpRatio * VigorRatio),
							addVigor(AddVigorValue);
						_ ->
							%扣钱失败
							playerMsg:sendErrorCodeMsg(?ErrorCode_AwakeExpToVigorUseMoneyFailed)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_AwakeExpToVigorNotEnoughMoney)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_AwakeExpToVigorNotEnoughExp)
	end,
	ok.

roleAwakeing(_Stage, _Stone, Param) ->
	{OldStage, OldStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),

	{OldBuffID, OldSkillId, OldBuffTime} = case getCfg:getCfgByArgs(cfg_awake, OldStage, OldStone) of
      #awakeCfg{buffid = BuffID, skillid = SkillId, bufftime = BuffTime} ->
	      {BuffID, SkillId, BuffTime};
	    _ ->
		    {0, 0, 0}
	end,
	{IsSuc,ErrCode,NewStage,NewStone} = case getCfg:getCfgByArgs(cfg_awake, OldStage, OldStone + 1) of
		#awakeCfg{vitality = VigorValue, item = ItemList, minlevel = LevelLimit} ->
			%%扣钱 扣材料
			{IsCan,Code} = doDecMaterial(VigorValue, ItemList, LevelLimit),
			{IsCanNew,CodeNew} = setAwakeList(IsCan, Code, OldStage, OldStone + 1, Param),
			{IsCanNew,CodeNew,OldStage,OldStone + 1};
		_ ->
			case getCfg:getCfgByArgs(cfg_awake, OldStage + 1, 1) of
				#awakeCfg{vitality = VigorValue, item = ItemList, minlevel = LevelLimit} ->
					%%扣钱 扣材料
					{IsCan,Code} = doDecMaterial(VigorValue, ItemList, LevelLimit),
					{IsCanNew,CodeNew} = setAwakeList(IsCan, Code, OldStage + 1, 1, Param),
					{IsCanNew,CodeNew,OldStage + 1, 1};
				_ ->
					{false,?ErrorCode_RoleAwakeAwakeingIsMax,OldStage,OldStone}
			end
	end,

	if
		IsSuc =:= false ->
			playerMsg:sendErrorCodeMsg(ErrCode);
		true ->
			playerPropSync:setAny(?SerProp_CurRoleAwakeInfo,{NewStage,NewStone}),
			case getCfg:getCfgByArgs(cfg_awake, NewStage, NewStone) of
				#awakeCfg{buffid = NewBuffID, bufftime = NewBuffTime, skillid = NewSkillId} ->
					dealSkillAndBuffWhenAwake(OldBuffID, NewBuffID , OldSkillId, NewSkillId, OldBuffTime, NewBuffTime);
				_ ->
					skip
			end,
			playerMsg:sendNetMsg(#pk_GS2U_RoleAwakeingRet{stage = NewStage, stone = NewStone, param = Param}),
			playerForce:calcPlayerForce(true)
	end,
	ok.

%%重置角色觉醒
resetRoleAwake() ->
	{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
	case CurStage == 0 andalso CurStone == 0 of
		true ->
			skip;
		_ ->
			%先扣钱 在返回材料 最后计算属性
			NeedMoney = case getCfg:getCfgPStack(cfg_globalsetup, awake_reset) of
				#globalsetupCfg{setpara = [Money]} ->
					Money;
				_ ->
					500
		   end,
			case playerMoney:canUseCoin(?CoinUseTypeDiamond,NeedMoney) of
				true ->
					PLog = #recPLogTSMoney{
						reason = ?CoinUseRoleAwakeReset,
						param  = NeedMoney,
						target = ?PLogTS_RoleAwake,
						source = ?PLogTS_PlayerSelf},
					playerMoney:useCoin(?CoinUseTypeDiamond, NeedMoney,PLog),
					returnMaterial(),
					decPropAndCalForce(),
					{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
					ResetSkillId = case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
		                 #awakeCfg{skillid = SkillId} ->
		                    SkillId;
		                 _ ->
		                    0
		              end,
					playerPropSync:setAny(?SerProp_CurRoleAwakeInfo,{0,0}),
					playerPropSync:setAny(?SerProp_RoleAwakeList,[]),
					playerMsg:sendNetMsg(#pk_GS2U_RoleAwakeInof{curStage = 0, curStone = 0, allAwakeInfo = []}),
					resetBuffAndSkillWhenResetAwake(ResetSkillId),
					playerForce:calcPlayerForce(true);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_RoleAwakeResetNotEnoughMoney)
			end
	end,
	ok.

returnMaterial() ->
	AwakeList = playerPropSync:getProp(?SerProp_RoleAwakeList),
	%%计算返还的材料
	FCal= fun({{Stage,Stone},_Param},{AddVigor,AddItemList})->
		case getCfg:getCfgByArgs(cfg_awake, Stage, Stone)  of
			#awakeCfg{vitality = Vigor, item = ItemList} ->
				FAdd= fun({ID,Num},AddItemList1)->
					case lists:keyfind(ID,1,AddItemList1) of
						{_ItemID,ProNum} ->
							lists:keystore(ID,1,AddItemList1,{ID,Num+ProNum});
						false ->
							[{ID,Num} | AddItemList1]
					end
		      end,
				ItemList1 = lists:foldl(FAdd,AddItemList,ItemList),
				{AddVigor + Vigor, ItemList1};
			_->
				{AddVigor,AddItemList}
		end
   end,
	{VigorValue,ItemList} = lists:foldl(FCal,{0,[]},AwakeList),
	addVigor(VigorValue),
	Title = stringCfg:getString(awake_recycle_email_title),
	Content = stringCfg:getString(awake_recycle_email),
	lists:foreach(fun({ItemID, ItemNumber}) ->
			playerMail:sendGoodsMailTitleAndContent(ItemID, ItemNumber, false, 0, Title, Content, ?ItemSourceRoleAwakeReset)
		end, ItemList),
	ok.

useTheAwakeBuff() ->
	{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
	case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
		#awakeCfg{buffid = BuffID} when BuffID > 0 ->
			case isHasUseTheAwakeBuff() of
				{0, _EndTime} ->
					%这里需要计算出buff的结束时间 以及默认处理buff会一直使用 设置剩余时间为0 手动停止时在计算剩余时间
					LeftTime = getAwakeBuffOfValue(),
					case LeftTime > 0 of
						true ->
							NowTime = time:getUTCNowMS(),
							playerBuff:addBuff(BuffID, 1, LeftTime + NowTime),
							setAwakeBuffTime(0),
							playerMsg:sendNetMsg(#pk_GS2S_UseTheAwakeBuffRet{}),
							tickDealBuffTimeOnCross();
						_ ->
							% 这里还是同步一下buff时间
							playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = BuffID, curstatus = 0, lefttime = 0}),
							playerMsg:sendErrorCodeMsg(?ErrorCode_RoleAwakeNotHasTime)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_RoleAwakeAlreadyUse)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_RoleAwakeNotHasAwakeBuff)
	end,
	ok.

stopTheAwakeBuff() ->
	{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
	case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
		#awakeCfg{buffid = BuffID} when BuffID > 0 ->
			case isHasUseTheAwakeBuff() of
				{UseBuffID, EndTime} when UseBuffID > 0 ->
					%手动停止时 需要判断buff的剩余时间
					NowTime = time:getUTCNowMS(),
					LeftTime = EndTime - NowTime,
					SLeftTime = if
						LeftTime > 0 ->
							setAwakeBuffTime(LeftTime),
			            LeftTime;
						true ->
							setAwakeBuffTime(0),
							0
					end,
					playerBuff:delBuff(UseBuffID),
					playerMsg:sendNetMsg(#pk_GS2U_StopTheAwakeBuffRet{}),
					playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = BuffID, curstatus = 0, lefttime = SLeftTime});
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_RoleAwakeNotUse)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_RoleAwakeNotHasAwakeBuff)
	end,
	ok.

recoverBuffTimeWhenDead() ->
	case isHasUseTheAwakeBuff() of
		{UseBuffID, EndTime} when UseBuffID > 0 ->
			%手动停止时 需要判断buff的剩余时间
			NowTime = time:getUTCNowMS(),
			LeftTime = EndTime - NowTime,
			if
				LeftTime > 0 ->
					setAwakeBuffTime(LeftTime),
					playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = UseBuffID, curstatus = 0, lefttime = LeftTime});
				true ->
					setAwakeBuffTime(0),
					playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = UseBuffID, curstatus = 0, lefttime = 0})
			end,
			playerBuff:delBuff(UseBuffID);
		_ ->
			skip
	end,
	ok.

resetBuffEveryDay() ->
	{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
	case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
		#awakeCfg{buffid = BuffID, bufftime = BuffTime} when BuffID > 0 ->
			case isHasUseTheAwakeBuff() of
				{UseBuffID, _EndTime} when UseBuffID > 0 ->
					NowTime = time:getUTCNowMS(),
					BuffEndTime = NowTime + BuffTime,
					setAwakeBuffTime(time,0),
					playerBuff:delBuff(UseBuffID),
					playerBuff:addBuff(BuffID, 1, BuffEndTime),
					playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = UseBuffID, curstatus = 1, lefttime = BuffTime});
				_ ->
					setAwakeBuffTime(time,BuffTime),
					playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = BuffID, curstatus = 0, lefttime = BuffTime})
			end;
		_ ->
			setAwakeBuffTime(time,0)
	end,
	ok.

dealSkillAndBuffWhenAwake(OldBuffID, NewBuffID , OldSkillId, NewSkillId,OldBuffTime, NewBuffTime) ->
	case NewBuffID =/= OldBuffID of
		true ->
			% 通常buff ID更改的时候 buff默认时间会加长 这里注意要处理
			TimeDiff = NewBuffTime - OldBuffTime,
			updateAwakeBuff(level,TimeDiff);
		_ ->
			skip
	end,
	case NewSkillId =/= OldSkillId of
		true ->
			if
				OldSkillId > 0 ->
					playerSkill:delAwakeSkill(OldSkillId);
				true ->
					skip
			end,
			if
				NewSkillId > 0 ->
					playerSkill:addAwakeSkill(NewSkillId,1);
				true ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

resetBuffAndSkillWhenResetAwake(SkillId) ->
	case isHasUseTheAwakeBuff() of
		{UseBuffID, _EndTime} when UseBuffID > 0 ->
			playerBuff:delBuff(UseBuffID);
		_ ->
			skip
	end,
	setAwakeBuffTime(0),
	playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = 0, curstatus = 0, lefttime = 0}),
	if
		SkillId > 0 ->
			playerSkill:delAwakeSkill(SkillId);
		true ->
			skip
	end,
	ok.

updateAwakeBuff(time,AddTime) ->
	{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
	case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
		#awakeCfg{buffid = BuffID} when BuffID > 0 ->
			case isHasUseTheAwakeBuff() of
				{UseBuffID, EndTime} when UseBuffID > 0 ->
					BuffEndTime = EndTime + AddTime,
					playerBuff:delBuff(UseBuffID),
					playerBuff:addBuff(BuffID, 1, BuffEndTime),
					NowTime = time:getUTCNowMS(),
					playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = UseBuffID, curstatus = 1, lefttime = BuffEndTime - NowTime});
				_ ->
					if
						AddTime > 0 ->
							% 这个函数这里不支持减法操作 这里还是校验一下AddTime
							addAwakeBuffTime(AddTime),
							LeftTime = getAwakeBuffOfValue(),
							playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = BuffID, curstatus = 0, lefttime = LeftTime});
						true ->
							skip
					end
			end;
		_ ->
			skip
	end,
	ok;
updateAwakeBuff(level,TimeDiff) ->
	{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
	case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
		#awakeCfg{buffid = BuffID} when BuffID > 0 ->
			case isHasUseTheAwakeBuff() of
				{UseBuffID, EndTime} when UseBuffID > 0 ->
					BuffEndTime = EndTime + TimeDiff,
					playerBuff:delBuff(UseBuffID),
					playerBuff:addBuff(BuffID, 1, BuffEndTime),
					NowTime = time:getUTCNowMS(),
					playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = UseBuffID, curstatus = 1, lefttime = BuffEndTime - NowTime});
				_ ->
					if
						TimeDiff > 0 ->
							% 这个函数这里不支持减法操作 这里还是校验一下AddTime
							addAwakeBuffTime(TimeDiff),
							LeftTime = getAwakeBuffOfValue(),
							playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = BuffID, curstatus = 0, lefttime = LeftTime});
						true ->
							skip
					end
			end;
		_ ->
			skip
	end,
	ok.

isHasUseTheAwakeBuff() ->
	BuffList = playerState:getBuffList(),
	checkUseAwakeBuffId(BuffList).

%%*********************************************************
sendAwakeBuffInfo() ->
	{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
	{SBuffID, SStatus, SLeftTime} = case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
		#awakeCfg{buffid = BuffID} when BuffID > 0 ->
			case isHasUseTheAwakeBuff() of
				{UseBuffID, EndTime} when UseBuffID > 0 ->
					NowTime = time:getUTCNowMS(),
					{UseBuffID, 1, EndTime - NowTime};
				_ ->
					LeftTime = getAwakeBuffOfValue(),
					{BuffID, 0, LeftTime}
			end;
		_ ->
			{0, 0, 0}
	end,
	playerMsg:sendNetMsg(#pk_GS2U_TheAwakeBuffInfo{buffID = SBuffID, curstatus = SStatus, lefttime = SLeftTime}),
	ok.

getAwakeBuffInfo() ->
	{CurStage, CurStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
	case getCfg:getCfgByArgs(cfg_awake, CurStage, CurStone) of
		#awakeCfg{buffid = BuffID} when BuffID > 0 ->
			case isHasUseTheAwakeBuff() of
				{UseBuffID, EndTime} when UseBuffID > 0 ->
					NowTime = time:getUTCNowMS(),
					{UseBuffID, 1, EndTime - NowTime};
				_ ->
	             LeftTime = getAwakeBuffOfValue(),
					{BuffID, 0, LeftTime}
			end;
		_ ->
			{0, 0, 0}
	end.

-spec checkUseAwakeBuffId(list()) -> term().
checkUseAwakeBuffId([]) ->
	{0, 0};
checkUseAwakeBuffId([#recBuff{effect = Effect, buffID = BuffID, endTime = EndTime} | L]) ->
	case Effect =:= ?BuffEffect_RoleAwake of
		true ->
			{BuffID, EndTime};
		_ ->
			checkUseAwakeBuffId(L)
	end.

getExpToVigorRatio() ->
	case getCfg:getCfgPStack(cfg_globalsetup, awake_ratio) of
	#globalsetupCfg{setpara = [Exp,Vigor,Coin]} ->
		{Exp,Vigor,Coin};
	_ ->
		{1000,1,1}
	end.

-spec isEnoughItem(list()) -> boolean().
isEnoughItem([]) ->
	true;
isEnoughItem([{ID, Num} | L]) ->
	case playerPackage:getGoodsNumByID(?Item_Location_Bag, ID) >= Num of
		true ->
			isEnoughItem(L);
		_ ->
			false
	end.

%%扣除道具
-spec delItem(ItemList :: list(), Reason :: uint()) -> ok.
delItem([], _Reason) ->
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

doDecMaterial(DecVigor,ItemList, LevelLimit) ->
	PlayerLevel = playerState:getLevel(),
	case getVigor() >= DecVigor andalso PlayerLevel >= LevelLimit of
		true ->
		 	case isEnoughItem(ItemList) of
				true ->
					decVigor(DecVigor),
					delItem(ItemList,?ItemDeleteReasonRoleAwake),
			      {true,0};
				_ ->
					{false,?ErrorCode_RoleAwakeNotEnoughItem}
			end;
		_ ->
			{false, ?ErrorCode_RoleAwakeNotEnoughVigorOrLevelLimit}
	end.

setAwakeList(IsCan, Code, Stage, Stone, Param) ->
	if
		IsCan =:= true ->
			case Param > 0 andalso Param < 4 of
				true ->
					AwakeList = playerPropSync:getProp(?SerProp_RoleAwakeList),
				 	NewList = lists:keystore({Stage,Stone},1,AwakeList,{{Stage,Stone}, Param}),
					playerPropSync:setAny(?SerProp_RoleAwakeList,NewList),
					addPropAndCalForce(Stage, Stone, Param),
					{IsCan, Code};
				_ ->
					{false,?ErrorCode_RoleAwakeParamError}
			end;
		true ->
			{IsCan,Code}
	end.

addPropAndCalForce(Stage, Stone, Param) ->
	%%计算属性加成
	case getCfg:getCfgByArgs(cfg_awake, Stage, Stone)  of
		#awakeCfg{attribute_one = One, attribute_two = Two, attribute_thr = Thr} ->
			AddValueList =  case Param of
				                1 ->
					                One;
				                2 ->
					                Two;
				                3 ->
					                Thr;
				                _ ->
					                []
			                end,
			FAdd= fun({ID,Num},AddList)->
				case lists:keyfind(ID,1,AddList) of
					{_ProID,ProNum} ->
						lists:keystore(ID,1,AddList,{ID,Num+ProNum});
					false ->
						[{ID,Num}|AddList]
				end
	      end,
			AddPropList = lists:foldl(FAdd,[],AddValueList),
			playerCalcProp:changeProp_AddMulti([], [], AddPropList, [], true);
		_ ->
			skip
	end,
	ok.

decPropAndCalForce() ->
	AwakeList = playerPropSync:getProp(?SerProp_RoleAwakeList),

	%%计算需要减去的属性
	FCal= fun({{Stage,Stone},Param},PropList)->
		case getCfg:getCfgByArgs(cfg_awake, Stage, Stone)  of
			#awakeCfg{attribute_one = One, attribute_two = Two, attribute_thr = Thr} ->
				AddValueList =  case Param of
					                1 ->
						                One;
					                2 ->
						                Two;
					                3 ->
						                Thr;
					                _ ->
						                []
				                end,
				FAdd= fun({ID,Num},PropList1)->
					case lists:keyfind(ID,1,PropList1) of
						{_ProID,ProNum} ->
							lists:keystore(ID,1,PropList1,{ID,ProNum - Num});
						false ->
							[{ID,-Num}|PropList1]
					end
				      end,
				lists:foldl(FAdd,PropList,AddValueList);
			_->
				PropList
		end
	      end,
	DecPropList = lists:foldl(FCal,[],AwakeList),
	playerCalcProp:changeProp_AddMulti(DecPropList, [], [], [], true),
	ok.

addVigor(AddValue) ->
	NewVal = getVigor() + AddValue,
	setVigor(NewVal),
	ok.

decVigor(DecValue) ->
	OriVal = getVigor(),
	case DecValue =< OriVal andalso DecValue > 0 of
		true ->
			NewVal = OriVal - DecValue,
			setVigor(NewVal),
			true;
		_ ->
			false
	end.

setVigor(SetValue) ->
	playerPropSync:setInt(?PriProp_VigourValue, SetValue).

getVigor() ->
	playerPropSync:getProp(?PriProp_VigourValue).

addAwakeBuffTime(AddValue) ->
	NewVal = getAwakeBuffOfValue() + AddValue,
	setAwakeBuffTime(NewVal),
	ok.

setAwakeBuffTime(SetValue) ->
	{LastUpdateTime,_LeftTime} = playerPropSync:getProp(?SerProp_AwakeBuffTimeInfo),
	playerPropSync:setAny(?SerProp_AwakeBuffTimeInfo, {LastUpdateTime,SetValue}).

setAwakeBuffTime(time,SetValue) ->
	NowTime = time:getSyncTime1970FromDBS(),
	playerPropSync:setAny(?SerProp_AwakeBuffTimeInfo, {NowTime,SetValue}).

getAwakeBuffOfValue() ->
	{_LastUpdateTime,LeftTime} = playerPropSync:getProp(?SerProp_AwakeBuffTimeInfo),
	LeftTime.

getAwakeBuffOfTime() ->
	{LastUpdateTime,_LeftTime} = playerPropSync:getProp(?SerProp_AwakeBuffTimeInfo),
	LastUpdateTime.

tickDealBuffTimeOnCross() ->
	case core:isCross() of
		true ->
			case isHasUseTheAwakeBuff() of
				{UseBuffID, EndTime} when UseBuffID > 0 ->
					NowTime = time:getUTCNowMS(),
					LeftTime = EndTime - NowTime,
					RoleID = playerState:getRoleID(),
					ServerID = core:getRealDBIDByUID(RoleID),
					gsCsInterface:transitMsg2ServerOtp(ServerID, ?PsNameDealAwakeBuff, dealAwakeBuffTime, {RoleID,LeftTime}),
					erlang:send_after(5000, self(), tickDealBuffTimeOnCross);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

isHasOpen() ->
	case core:isCross() of
		true ->
			playerState2:getIsHasRoleAwake();
		_ ->
			variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_RoleAwake)
	end.
