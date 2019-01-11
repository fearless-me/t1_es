%% @author zhengzhichun
%% @doc @todo Add description to playerRecharge.
%% luna 商业化内容移到playerRecharge2
-module(playerRecharge).
%%
%%-include("playerPrivate.hrl").
%%-include("setupLang.hrl").
%%-include("cfg_recharge_item_relation.hrl").
%%-include("../recharge/recharge.hrl").
%%-define(FuncellPaySuccess, 1).    %%支付成功
%%-define(FuncellPayFail, 2).      %%支付失败
%%-define(FuncellPayUnknowGive, 3).  %%游戏已经发货但客户端未确认
%%-define(FuncellPayDone, 4).      %%订单完成
%%
%%-define(Rec_sourceshop_forever_limit_BuyItem_type, 3).%%标记表中的直够类型（直接买道具）
%%
%%%% ====================================================================
%%%% API functions
%%%% ====================================================================
%%-export([
%%%%预充值代码
%%	isHavePreRecharge/0,
%%	setMyPreRechargeAmount/1,
%%	requestGetMyPreRecharge/0,
%%	getMyPreRecharge/1,
%%	dealEvenDoneOrder/1
%%%%以上是预充值相关功能，目前不再支持预充值、如有预充值相关功能则删掉所有老代码重新编写。预充值只需要走充值时玩家掉线的处理方式即可，只需要修改订单状态和角色id
%%]).
%%
%%-export([
%%%%	getChargeGift/2,
%%	dealOnlineOrder/1,
%%	buyGrowUp/0,
%%	check_lost_recharge_bill/0
%%]).
%%
%%%%api port
%%-export([
%%	tidyGiftItem/1,
%%	gmSimulateaddCoin/1
%%%%	putGift2Package/4
%%]).
%%
%%-export([
%%	signIn/0,
%%	getCashDailyGift/0
%%]).
%%
%%-export([
%%	init/0
%%]).
%%
%%%% 初始化玩家充值信息
%%-spec init() -> ok.
%%init() ->
%%	erlang:send_after(500, self(), online_delay_init_data),
%%	ok.
%%
%%
%%%%检查丢失的订单信息
%%check_lost_recharge_bill() ->
%%	?DEBUG("check_lost_recharge_bill=====111111111111111111111111111====~p~n", [playerState:getRoleID()]),
%%	?PsNameRecharge ! {<<"check_lost_recharge_bill">>, playerState:getRoleID(), self()}.
%%
%%%%问cs是否有预充值
%%%%checkCSHasAck消息收结果
%%-spec isHavePreRecharge() -> ok.
%%isHavePreRecharge() ->
%%%%  预充值业务逻辑、据说很早很早以前有一次删档、且保留充值记录的公共测试，预充值就是拿来将老的充值记录返还给清楚数据之后的玩家用的
%%%%  psMgr:sendMsg2PS(?PsNamePreRecharge, checkCSHas, {playerState:getAccountID()})
%%	ignore
%%.
%%%%设置预充值额属性
%%-spec setMyPreRechargeAmount(AmountMoney :: number()) -> ok.
%%setMyPreRechargeAmount(AmountMoney) ->
%%	AmountDiamond = erlang:round(AmountMoney * ?PayRate),
%%	?DEBUG("setMyPreRechargeAmount[~w]", [AmountDiamond]),
%%	playerPropSync:setInt(?PriProp_PreRecharge, AmountDiamond),
%%	ok.
%%
%%%%申请领回我的预充值币
%%%%getMyPreRechargeAck消息收结果（CS当做后续会成功处理）
%%-spec requestGetMyPreRecharge() -> ok.
%%requestGetMyPreRecharge() ->
%%	psMgr:sendMsg2PS(?PsNamePreRecharge, getMyPreRecharge, {playerState:getAccountID()}).
%%
%%%%领回我的预充值币
%%-spec getMyPreRecharge(Amount :: uint32()) -> ok.
%%getMyPreRecharge(Amount) when erlang:is_number(Amount), Amount > 0 ->
%%	case playerPropSync:getProp(?PriProp_PreRecharge) of
%%		PropVale when erlang:is_integer(PropVale) andalso PropVale =:= (Amount * ?PayRate) ->
%%			CoinNum = Amount * ?PayRate,
%%			playerMoney:addCoin(?CoinTypeBindDiamond, erlang:round(CoinNum * 2.5),
%%				#recPLogTSMoney{reason = ?CoinSource4PreRechargeBack, param = Amount, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Recharge}),
%%			playerPropSync:setInt(?PriProp_PreRecharge, 0),
%%			chargeAccumulate(CoinNum),
%%			?INFO("getMyPreRecharge success CSamount[~w] roleid:~p", [Amount, playerState:getRoleID()]),
%%			%%给奖励道具
%%			#globalsetupCfg{setpara = PrizeItem} = getCfg:getCfgByArgs(cfg_globalsetup, pre_recharge),
%%			case PrizeItem of
%%				[ItemID] ->
%%					Plog = #recPLogTSItem{
%%						old = 0,
%%						new = 1,
%%						change = 1,
%%						target = ?PLogTS_PlayerSelf,
%%						source = ?PLogTS_Recharge,
%%						gold = 0,
%%						goldtype = 0,
%%						changReason = ?ItemSourceRechargeAward,
%%						reasonParam = Amount
%%					},
%%					playerPackage:addGoodsAndMail(ItemID, 1, true, 0, Plog);
%%				_ ->
%%					skip
%%			end,
%%			ok;
%%		PropVale ->
%%			?ERROR("getMyPreRecharge fail CSamount[~w] playerOtpAmount[~w]", [Amount, PropVale])
%%	end,
%%	ok;
%%getMyPreRecharge(_Amount) -> ok.
%%
%%%%当用户在线时直接处理订单、该函数不允许失败。一切失败均为异常订单
%%-spec dealOnlineOrder(#recRecharge{}) -> ok.
%%dealOnlineOrder(#recRecharge{
%%	roleID = RoleID,
%%	feOrderID = FeOrderID,
%%	gameMoneyAmount = CurrencyAmount,
%%	currencyMoneyAmount = CurrencyMoneyAmount,
%%	giftStr = GiftStr,
%%	item_amount = _ItemNumber,
%%	item_id = _ItemID,
%%	businessID = BusinessID
%%} = RechargeInfo) ->
%%	CoinNum = erlang:trunc(CurrencyAmount * ?PayRate),
%%	if
%%		CoinNum > 0 ->
%%%%			playerACChargeOrUse:onChargeDiamon(CoinNum),
%%			addCoin(RechargeInfo),
%%			ok;
%%		true ->
%%			?INFO("recharge system this payment no money OrderID=~p roleID=~p,CurrencyAmount=~p~n", [FeOrderID, RoleID, CoinNum]),
%%			skip
%%	end,
%%
%%	%% 商业化内容
%%	try
%%		playerRecharge2:recharge(BusinessID, CurrencyMoneyAmount, CoinNum)
%%	catch
%%		_ : Reason ->
%%			?ERROR(
%%				"businuss failed! Reason:~w RoleID:~w FeOrderID:~p~nplayerRecharge2:recharge(~w, ~w, ~w)~n~p",
%%				[Reason, RoleID, FeOrderID, BusinessID, CurrencyAmount, CoinNum, erlang:get_stacktrace()]
%%			)
%%	end,
%%
%%	dealGift(GiftStr, FeOrderID),
%%%%	giveItem(ItemID,FeOrderID),
%%	MailContent = stringCfg:getString(rechargeMailContent, [erlang:binary_to_list(FeOrderID), CoinNum]),
%%	mail:sendSystemMail(RoleID, stringCfg:getString(rechargeMailTitle), MailContent, [], ""),
%%	dbLog:sendSaveLogRecharge(RechargeInfo, ?RECHARGE_STATE_GIVE, 0),
%%	dbLog:sendSaveLogRecharged_PlayerInfo(getRechargedPlayerInfo(RechargeInfo)),
%%	{ok, <<"success">>}.
%%
%%dealEvenDoneOrder(#recRecharge{
%%	roleID = RoleID,
%%	feOrderID = FeOrderIDBinStr
%%}) ->
%%	case RoleID =:= playerState:getRoleID() of
%%		true ->
%%			FeOrderID = erlang:binary_to_list(FeOrderIDBinStr),
%%			Msg = #pk_GS2U_RequestRechargeAck{funcellOrderID = FeOrderID, moneyNun = 0.0},
%%			playerMsg:sendNetMsg(Msg);
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%%giveItem(RechargeItemRelationId,FeOrderID) ->
%%%	ItemRelationID =
%%%		try
%%%		    erlang:binary_to_integer(RechargeItemRelationId)
%%%		catch
%%%		    _:_Why ->
%%%				?ERROR("giveItem:~p,~p", [FeOrderID, RechargeItemRelationId]),
%%%				0
%%%		end,
%%%	?INFO("giveItem:~p,~p,~p", [FeOrderID, RechargeItemRelationId, ItemRelationID]),
%%%	case ItemRelationID > 0 of
%%%		true ->
%%%			case getCfg:getCfgByKey(cfg_recharge_item_relation, ItemRelationID) of
%%%				#recharge_item_relationCfg{items = ItemList} ->
%%%					?INFO("recharge system give items to user begin OrderID=~p Relation ItemID=~p,items=~p~n", [FeOrderID, ItemRelationID, ItemList]),
%%%					[giveItem1(ItemInfo) || ItemInfo <- ItemList];
%%%				_ ->
%%%					skip
%%%			end;
%%%		_ ->
%%%			skip
%%%	end,
%%%	ok.
%%%
%%%-spec giveItem1(ItemOne :: string()) -> ok.
%%%giveItem1([ItemID, ItemNum, ItemBind]) ->
%%%	PLog = #recPLogTSItem{
%%%		old = 0,
%%%		new = 1,
%%%		change = 1,
%%%		target = ?PLogTS_PlayerSelf,
%%%		source = ?PLogTS_BuyItem,
%%%		gold = 0,
%%%		goldtype = 0,
%%%		changReason = ?ItemSourceBuyItem,
%%%		reasonParam = ItemID
%%%	},
%%%	playerPackage:addGoodsAndMail(ItemID, ItemNum, ItemBind =:= 1, 0, PLog),
%%%	playerShop:setMyHasForeverLimitID([ItemID], ?Rec_sourceshop_forever_limit_BuyItem_type),
%%%	ok.
%%
%%addCoin(#recRecharge{feOrderID = OrderID, gameMoneyAmount = CurrencyAmount}) ->
%%	CoinNum = erlang:trunc(CurrencyAmount * ?PayRate),
%%	PlayerID = playerState:getRoleID(),
%%	?INFO("recharge system will add coin to user: roleID:~p, OrderID=~p,CoinNum=~p", [PlayerID, OrderID, CoinNum]),
%%	chargeAccumulate(CoinNum),
%%%%	{Coin, GotLevel} = getCoinAndGotLevelPerDay(),
%%%%	setCoinAndGotLevelPerDay(Coin + CoinNum, GotLevel),
%%	true = playerMoney:addCoin(?CoinTypeDiamond, CoinNum,
%%		#recPLogTSMoney{reason = ?CoinSourceRecharge, param = binary_to_list(OrderID), target = ?PLogTS_PlayerSelf, source = ?PLogTS_Recharge}),
%%	?INFO("recharge system add coin to user success roleID:~p, OrderID=~p,CoinNum=~p", [PlayerID, OrderID, CoinNum]),
%%	Msg = #pk_GS2U_RequestRechargeAck{funcellOrderID = binary_to_list(OrderID), moneyNun = erlang:float(CoinNum / ?PayRate)},
%%	playerMsg:sendNetMsg(Msg),
%%%%	playerVip:topUpMoney(CoinNum / ?PayRate).
%%	ok.
%%
%%%%累积充值
%%-spec chargeAccumulate(Coin :: uint32()) -> ok.
%%chargeAccumulate(Coin) when is_number(Coin) andalso Coin > 0 ->
%%	AccCharge = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_AccCharge),
%%	?INFO("chargeAccumulate:acc[~p]+new[~p]", [AccCharge, Coin]),
%%	playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_AccCharge, erlang:trunc(AccCharge + Coin)),
%%	ok.
%%
%%gmSimulateaddCoin(CurrencyAmount) when CurrencyAmount >0 ->
%%	CoinNum = erlang:trunc(CurrencyAmount * ?PayRate),
%%	PlayerID = playerState:getRoleID(),
%%	?INFO("gmSimulateaddCoin system will add coin to user: roleID:~p, OrderID=~p,CoinNum=~p", [PlayerID, "gmrecharge", CoinNum]),
%%	chargeAccumulate(CoinNum),
%%	OrderID = <<"gmrecharge">>,
%%%%	{Coin, GotLevel} = getCoinAndGotLevelPerDay(),
%%%%	setCoinAndGotLevelPerDay(Coin + CoinNum, GotLevel),
%%	true = playerMoney:addCoin(?CoinTypeDiamond, CoinNum,
%%		#recPLogTSMoney{reason = ?CoinSourceGMSimulateRecharge3, param = binary_to_list(OrderID), target = ?PLogTS_PlayerSelf, source = ?PLogTS_GMSimulateRecharge}),
%%	?INFO("gmSimulateaddCoin system add coin to user success roleID:~p, OrderID=~p,CoinNum=~p", [PlayerID, OrderID, CoinNum]),
%%	Msg = #pk_GS2U_RequestRechargeAck{funcellOrderID = binary_to_list(OrderID), moneyNun = erlang:float(CoinNum / ?PayRate)},
%%	playerMsg:sendNetMsg(Msg),
%%%%	playerVip:topUpMoney(CoinNum / ?PayRate).
%%	ok;
%%gmSimulateaddCoin(_CurrencyAmount) ->
%%	ok.
%%
%%%%%%角色新建7日内首充和普通累充的奖励领取
%%%%-spec getChargeGift(Type :: uint8(), Grade :: integer()) -> ok.
%%%%getChargeGift(3, Grade) ->
%%%%	%%每日累充
%%%%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Hide_Daily_AccCharge) of
%%%%		true ->
%%%%			Sec = time:getSyncTime1970FromDBS(),
%%%%			{{Year, Month, Day}, _} = calendar:gregorian_seconds_to_datetime(Sec - 4 * 3600),
%%%%
%%%%			Week = calendar:day_of_the_week(Year, Month, Day),
%%%%			{Coin, GotLevel} = getCoinAndGotLevelPerDay(),
%%%%%% 			?DEBUG("===~p ~p ~p ~p",[Week,Coin,GotLevel,Grade]),
%%%%			case getCfg:getCfgByArgs(cfg_dailyrecharge, Grade) of
%%%%				#dailyrechargeCfg{day = WeekCfg} when WeekCfg =:= Week ->
%%%%					Fun = fun(I, Acc) ->
%%%%						case getCfg:getCfgByArgs(cfg_dailyrecharge, I) of
%%%%							#dailyrechargeCfg{id = IDCfg, item = ItemList, diamond = Diamond, day = WeekCfg2} when Coin >= Diamond, WeekCfg2 =:= Week, IDCfg > GotLevel ->
%%%%								ItemList ++ Acc;
%%%%							_ ->
%%%%								Acc
%%%%						end
%%%%						  end,
%%%%					L = case GotLevel =< Grade of
%%%%							true ->
%%%%								lists:foldl(Fun, [], lists:seq(GotLevel, Grade));
%%%%							_ ->
%%%%								[]
%%%%						end,
%%%%					TidyItemList = tidyGiftItem(L),
%%%%%% 					?DEBUG("cfg_dailyrecharge==~p",[TidyItemList]),
%%%%					case TidyItemList of
%%%%						[] ->
%%%%							playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed);
%%%%						_ ->
%%%%							setCoinAndGotLevelPerDay(Coin, Grade),
%%%%							playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingSuccess)
%%%%					end,
%%%%
%%%%					lists:foreach(fun({ItemID, NumOrQuality, Career, _}) ->
%%%%						putGift2Package(ItemID, NumOrQuality, Career, ?ItemSourceRechargeAward) end, TidyItemList),
%%%%
%%%%					ok;
%%%%				_All ->
%%%%					?WARN("~p", [_All]),
%%%%					playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed)
%%%%			end;
%%%%		_ ->
%%%%			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed)
%%%%	end,
%%%%	ok;
%%%%%%并非日本特有（到了多少等级点评论按键即领取这个奖励，只能一次）
%%%%getChargeGift(100, _Grade) ->
%%%%	?DEBUG("playerRecharge:getChargeGift/2[100,_] begin..."),
%%%%	ConfLevel = globalCfg:getGlobalCfg(awardGiveMarkLevel),
%%%%	ConfItemID = globalCfg:getGlobalCfg(awardGiveMarkItemID),
%%%%	ConfItemNum =
%%%%		case getCfg:getCfgByKey(cfg_globalsetup, awardGiveMarkItemNum) of
%%%%			#globalsetupCfg{setpara = [SetPara]} ->
%%%%				SetPara;
%%%%			_ ->
%%%%				1
%%%%		end,
%%%%	?DEBUG("playerRecharge:getChargeGift/2[100,_] ConfLevel(~p),ConfItemID(~p),ConfItemNum(~p)~n", [ConfLevel, ConfItemID, ConfItemNum]),
%%%%	PlayerBitFlag = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_BitFlag),
%%%%	<<_T:31, GetFlag:1>> = <<PlayerBitFlag:32>>,
%%%%	Level = playerState:getLevel(),
%%%%	case GetFlag of
%%%%		0 when Level >= ConfLevel ->
%%%%			Plog = #recPLogTSItem{
%%%%				old = 0,
%%%%				new = 1,
%%%%				change = 1,
%%%%				target = ?PLogTS_PlayerSelf,
%%%%				source = ?PLogTS_AwardGiveMark,
%%%%				gold = 0,
%%%%				goldtype = 0,
%%%%				changReason = ?ItemSourceAwardGiveMark,
%%%%				reasonParam = ConfItemID
%%%%			},
%%%%			playerPackage:addGoodsAndMail(ConfItemID, ConfItemNum, true, 0, Plog),
%%%%			<<PlayerBitFlag2:32>> = <<_T:31, 1:1>>,
%%%%			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_BitFlag, PlayerBitFlag2),
%%%%			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingSuccess);
%%%%		_ ->
%%%%			?WARN("ConfLevel[~p],ConfItemID[~p],GetFlag[~p],Level[~p]", [ConfLevel, ConfItemID, GetFlag, Level]),
%%%%%% 			playerChat:onSystemChatMsg( stringCfg:getString(reputablyGift) ),
%%%%			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed)
%%%%	end,
%%%%	?DEBUG("playerRecharge:getChargeGift/2[100,_] end."),
%%%%	ok;
%%%%%%韩国成长礼包
%%%%getChargeGift(101, Grade) ->
%%%%	Level = playerState:getLevel(),
%%%%	KoreaGift = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_KoreaGift),
%%%%	<<Enable:16, GetLevel:16>> = <<KoreaGift:32>>,
%%%%	?INFO("getChargeGift101 ==GetLevel:~p all32:~p", [GetLevel, KoreaGift]),
%%%%	case Enable > 0 of
%%%%		true ->
%%%%			case misc:get_pos_state(Grade, GetLevel) of
%%%%				0 when Grade < 17, Grade > 0 ->
%%%%					%%为0表示没领过，1~16的档位
%%%%					case getCfg:getCfgPStack(cfg_koreangift, Grade) of
%%%%						#koreangiftCfg{lv = ConfLevel, diamond = Diamon} when Level >= ConfLevel ->
%%%%							?INFO("koreangift ConfLevel:~p Level:~p roleID:~p", [ConfLevel, Level, playerState:getRoleID()]),
%%%%
%%%%							case playerMoney:addCoin(?CoinTypeBindDiamond, Diamon,
%%%%								#recPLogTSMoney{reason = ?CoinSourceGrowUpForKorea, param = ConfLevel, target = ?PLogTS_GrowUpForKorea, source = ?PLogTS_PlayerSelf}) of
%%%%								true ->
%%%%									NewGetLevel = misc:set_pos_state(Grade, 1, GetLevel),%%相关位置为1
%%%%									<<NewKoreaGift:32>> = <<Enable:16, NewGetLevel:16>>,
%%%%									playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_KoreaGift, NewKoreaGift),
%%%%									playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingSuccess),
%%%%									ok;
%%%%								_ ->
%%%%									skip
%%%%							end;
%%%%						_ ->
%%%%							?ERROR("cfg_koreangift not find,id:~P", [Grade]),
%%%%							playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed4NoneGet)
%%%%					end;
%%%%				_ ->
%%%%					?ERROR("koreangift grade:~p", [Grade]),
%%%%					playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed4NoneGet),
%%%%					skip
%%%%			end,
%%%%			?DEBUG("koreangift Level:~p roleID:~p", [Level, playerState:getRoleID()]);
%%%%		false ->
%%%%			?ERROR("koreangift Enable:~p", [Enable]),
%%%%			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed4NeedBuy)
%%%%	end,
%%%%	ok;
%%%%getChargeGift(Type, Grade) ->
%%%%	RoleID = playerState:getRoleID(),
%%%%	{Coin, FirstCharge, AccLevel} = getCoinFirstAccLevel(RoleID),
%%%%	?INFO("getChargeGift:role[~p]coin[~p]FirstCharge[~p],AccLeve[~p]", [RoleID, Coin, FirstCharge, AccLevel]),
%%%%	ConfDiamond2 =
%%%%		case Type of
%%%%			1 ->
%%%%				%%7日累充
%%%%				case getCfg:getCfgByKey(cfg_rechargeFirst, Grade) of
%%%%					#rechargeFirstCfg{diamond = ConfDiamond} ->
%%%%						ConfDiamond;
%%%%					_ ->
%%%%						0
%%%%				end;
%%%%			_ ->
%%%%				%%普通累充
%%%%				case getCfg:getCfgByKey(cfg_rechargeAccumulation, Grade) of
%%%%					#rechargeAccumulationCfg{diamond = ConfDiamond} ->
%%%%						ConfDiamond;
%%%%					_ ->
%%%%						0
%%%%				end
%%%%		end,
%%%%	case ConfDiamond2 =< Coin of
%%%%		true ->
%%%%			%%当前累充大于配置的累充条件
%%%%			{ItemList4Gift, NewFirstCharge, NewAccLevel} = getConfItemByGade(Type, Grade, Coin, FirstCharge, AccLevel),
%%%%			?DEBUG("====~p,F[~w],Normal[~w]", [ItemList4Gift, NewFirstCharge, NewAccLevel]),
%%%%
%%%%			TidyItemList = tidyGiftItem(ItemList4Gift),
%%%%			?DEBUG("++++++++++====~p", [TidyItemList]),
%%%%			case TidyItemList of
%%%%				[] ->
%%%%					playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed);
%%%%				_ ->
%%%%					<<NewFirstAndAccLevel:32>> = <<NewFirstCharge:16, NewAccLevel:16>>,
%%%%					playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_GetAccChargePrizeLevel, NewFirstAndAccLevel),
%%%%					playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingSuccess)
%%%%			end,
%%%%
%%%%			lists:foreach(fun({ItemID, NumOrQuality, Career, _}) ->
%%%%				putGift2Package(ItemID, NumOrQuality, Career, ?ItemSourceRechargeAward) end, TidyItemList);
%%%%		_ ->
%%%%			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingFailed)
%%%%	end,
%%%%	ok.
%%
%%%%%%根据类型(7日内累计和普通累计)和档次，取出应该发的奖励item列表（本档次和以前欠的）
%%%%-spec getConfItemByGade(Type, Grade, Coin, FirstCharge, AccLevel) -> {ItemList4Gift, NewFirstCharge, NewAccLevel} when
%%%%	FirstCharge :: 1, NormalAccCharge :: 2, Item :: {ItemID :: integer(), Num :: uint32()},
%%%%	Type :: FirstCharge|NormalAccCharge,
%%%%	Grade :: uint32(), Coin :: uint32(),
%%%%	FirstCharge :: uint16(), AccLevel :: uint16(),
%%%%	ItemList4Gift :: [Item],
%%%%	NewFirstCharge :: uint16(), NewAccLevel :: uint16().
%%%%getConfItemByGade(Type, Grade, Coin, FirstCharge, _AccLevel) when Type =:= 1 ->
%%%%	Now = time:getSyncTime1970FromDBS(),
%%%%	{datetime, {{Y, M, D}, {H, I, S}}} = playerState:getRoleCreateTime(),
%%%%	RoleCreateTime = time:convertDateTime1970ToSec({{Y, M, D}, {H, I, S}}),
%%%%	?DEBUG("~p", [{Now - RoleCreateTime, Now, RoleCreateTime, 3600 * 24 * 7}]),
%%%%	case Now - RoleCreateTime of
%%%%		SevenDay when SevenDay =< 3600 * 24 * 7 ->
%%%%			%%角色创建7日内
%%%%			Fun = fun(I1, Acc) ->
%%%%				case getCfg:getCfgByArgs(cfg_rechargeFirst, I1) of
%%%%					#rechargeFirstCfg{item_1 = ItemList, diamond = Diamond} when Coin >= Diamond ->
%%%%						ItemList ++ Acc;
%%%%					_ ->
%%%%						Acc
%%%%				end
%%%%				  end,
%%%%			L = case FirstCharge + 1 =< Grade of
%%%%					true ->
%%%%						lists:foldl(Fun, [], lists:seq(FirstCharge + 1, Grade));
%%%%					_ ->
%%%%						[]
%%%%				end,
%%%%			{L, Grade, _AccLevel};
%%%%		_ ->
%%%%			{[], FirstCharge, _AccLevel}
%%%%	end;
%%%%getConfItemByGade(Type, Grade, Coin, _FirstCharge, AccLevel) when Type =:= 2 ->
%%%%	Fun = fun(I, Acc) ->
%%%%		case getCfg:getCfgByArgs(cfg_rechargeAccumulation, I) of
%%%%			#rechargeAccumulationCfg{item_1 = ItemList, diamond = Diamond} when Coin >= Diamond ->
%%%%				ItemList ++ Acc;
%%%%			_ ->
%%%%				Acc
%%%%		end
%%%%		  end,
%%%%	L = case AccLevel + 1 =< Grade of
%%%%			true ->
%%%%				lists:foldl(Fun, [], lists:seq(AccLevel + 1, Grade));
%%%%			_ ->
%%%%				[]
%%%%		end,
%%%%	{L, _FirstCharge, Grade}.
%%
%%%%整理各档次配置的奖励item(叠加处理，只能处理自己职业的)
%%-spec tidyGiftItem(ItemList) -> TidyItemList when
%%	ItemList :: [Item], TidyItemList :: [Item],
%%	Item :: {ItemID, ItemNumOrQuality, Carear},
%%	ItemID :: uint32(), ItemNumOrQuality :: uint32(), Carear :: uint32().
%%tidyGiftItem(ItemList) ->
%%	AllCarear = 0,
%%	MyCareer = playerState:getCareer(),
%%	TidyFun = fun
%%		          ({ItemID, ItemNum, Career, _} = Item, Acc) when erlang:is_tuple(Item) andalso
%%			          (Career =:= MyCareer orelse Career =:= AllCarear) ->
%%			          case lists:keysearch(ItemID, 1, Acc) of
%%				          {value, {HasItemID, HasItemNum, Carear, ClientSpecial}} when HasItemID < ?Item_Differentiate ->
%%					          lists:keystore(ItemID, 1, Acc, {HasItemID, HasItemNum + ItemNum, Carear, ClientSpecial});
%%				          %%下面这种应该要规避，装备不叠加
%%				          {value, {HasItemID, Quality, Carear, ClientSpecial}} when HasItemID >= ?Item_Differentiate ->
%%					          lists:keystore(ItemID, 1, Acc, {HasItemID, Quality, Carear, ClientSpecial});
%%				          _ ->
%%					          [Item | Acc]
%%			          end;
%%		          (_Item, Acc) ->
%%%% 					  ?ERROR("tidyGiftItem[~p]",[_Item]),
%%			          Acc
%%	          end,
%%	lists:foldl(TidyFun, [], ItemList).
%%
%%%%%%根据奖励列表给玩家背包放物品(只给职业相关的)
%%%%-spec putGift2Package(ItemID :: integer(), NumOrQuality :: integer(), Career :: uint32(), GoodSource :: uint32()) -> ok.
%%%%putGift2Package(ItemID, NumOrQuality, Career, GoodSource) ->
%%%%	%%所有职业
%%%%	AllCarear = 0,
%%%%%% 	?DEBUG("zzc=========putGift2Package mycareer[~w] concareer[~w] itemID[~w]NumOrQuality[~w]",[playerState:getCareer(),Career,ItemID,NumOrQuality]),
%%%%	case playerState:getCareer() of
%%%%		MyCarear when MyCarear =:= Career orelse Career =:= AllCarear ->
%%%%			{Quality, RealNum} =
%%%%				case ItemID < ?Item_Differentiate of
%%%%					true ->
%%%%						{0, NumOrQuality};
%%%%					_ ->
%%%%						%%一件某个质量的装备
%%%%						{NumOrQuality, 1}
%%%%				end,
%%%%			Plog = #recPLogTSItem{
%%%%				old = 0,
%%%%				new = RealNum,
%%%%				change = RealNum,
%%%%				target = ?PLogTS_PlayerSelf,
%%%%				source = ?PLogTS_Recharge,
%%%%				gold = 0,
%%%%				goldtype = 0,
%%%%				changReason = GoodSource,
%%%%				reasonParam = Career
%%%%			},
%%%%			playerMonthCard:onlyRoleDo({"putGift2Package mycareer,concareer,itemID", playerState:getCareer(), Career, ItemID}),
%%%%			playerPackage:addGoodsAndMail(ItemID, RealNum, true, Quality, Plog);
%%%%		_ ->
%%%%			%%本职业不匹配的，不要给玩家
%%%%			skip
%%%%	end,
%%%%	ok.
%%
%%%%%%取出充值累计值，7日充值已领档次，普通累计已领档次
%%%%-spec getCoinFirstAccLevel(RoleID) -> {Coin, FirstCharge, AccLevel} when
%%%%	RoleID :: integer(), Coin :: uint32(), FirstCharge :: uint16(), AccLevel :: uint16().
%%%%getCoinFirstAccLevel(RoleID) ->
%%%%	Coin = variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_AccCharge),
%%%%	FirstAndAccLevel = variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_GetAccChargePrizeLevel),
%%%%	<<FirstCharge:16, AccLevel:16>> = <<FirstAndAccLevel:32>>,
%%%%	{Coin, FirstCharge, AccLevel}.
%%%%
%%%%%%取出玩家每日累充
%%%%-spec getCoinAndGotLevelPerDay() -> {Coin :: uint(), GotLevel :: uint8()}.
%%%%getCoinAndGotLevelPerDay() ->
%%%%	CoinAndGotLevel = playerDaily:getDailyCounter(?DailyType_Recharge, 0),
%%%%	<<Coin:24, GotLevel:8>> = <<CoinAndGotLevel:32>>,
%%%%	{Coin, GotLevel}.
%%%%
%%%%%%设置玩家每日累充
%%%%-spec setCoinAndGotLevelPerDay(Coin :: uint(), GotLevel :: uint8()) -> ok.
%%%%setCoinAndGotLevelPerDay(Coin, GotLevel) ->
%%%%	IntCoin = erlang:trunc(Coin),
%%%%	<<CoinAndGotLevel:32>> = <<IntCoin:24, GotLevel:8>>,
%%%%	playerDaily:incCounter(?DailyType_Recharge, 0, CoinAndGotLevel),
%%%%	ok.
%%
%%%%订单赠送（订单gift字段）
%%-spec dealGift(GiftStr :: string(), OrderID :: string()) -> ok.
%%dealGift(<<"0">>, _OrderID) ->
%%	ok;
%%dealGift(BindDiamond, OrderID) when erlang:is_integer(BindDiamond), BindDiamond > 0 ->
%%	ToRoleID = playerState:getRoleID(),
%%	?INFO("recharge system  will send gift mail, roleid:~p, orderid:~p BindDiamond:~p", [ToRoleID, OrderID, BindDiamond]),
%%	MailTitle = stringCfg:getString(orderRebateMailTitle),
%%	MailContent = stringCfg:getString(orderRebateMailContent, [OrderID]),
%%	AttachmentList = [#recMailCoin{coinType = ?CoinTypeBindDiamond, coinNum = BindDiamond}],
%%	MailReturn = mail:sendSystemMail(ToRoleID, MailTitle, MailContent, AttachmentList, ""),
%%	?INFO("recharge system  send gift mail end , roleid:~p, orderid:~p MailReturn:~p", [ToRoleID, OrderID, MailReturn]),
%%	ok.
%%%%已不存在该功能。当前的计算方式为excess_amount 和amount 加到一起构成玩家所得到的货币值
%%%%dealGift(GiftStrBin,OrderID) ->
%%%%	ToRoleID = playerState:getRoleID(),
%%%%	?INFO("orderid:~p giftStr:~p  roleid:~p",[ OrderID, GiftStrBin, ToRoleID ]),
%%%%	MailTitle = stringCfg:getString(orderRebateMailTitle),
%%%%	MailContent = stringCfg:getString(orderRebateMailContent, [OrderID]),
%%%%	GiftStr = misc:binToString(GiftStrBin),
%%%%	case string:tokens(GiftStr, ",") of
%%%%		[Gift] ->
%%%%			BindDiamondNum = erlang:list_to_integer(Gift),
%%%%			if BindDiamondNum > 0 ->
%%%%				AttachmentList = [#recMailCoin{coinType = ?CoinTypeBindDiamond, coinNum = BindDiamondNum}],
%%%%				mail:sendSystemMail(ToRoleID, MailTitle, MailContent, AttachmentList, "");
%%%%				true ->skip
%%%%			end;
%%%%		[Gift,Execess] ->
%%%%			BindDiamondNum = erlang:list_to_integer(Gift),
%%%%			case BindDiamondNum of
%%%%				0 ->skip;
%%%%				_ ->
%%%%					AttachmentList = [#recMailCoin{coinType = ?CoinTypeBindDiamond, coinNum = BindDiamondNum}],
%%%%					mail:sendSystemMail(ToRoleID, MailTitle, MailContent, AttachmentList, "")
%%%%			end,
%%%%
%%%%			CoinNum = erlang:list_to_integer(Execess),
%%%%			case CoinNum>0 andalso erlang:is_number(CoinNum) of
%%%%				true ->
%%%%					LogParam = OrderID ,
%%%%
%%%%					playerACChargeOrUse:onChargeDiamon(CoinNum),
%%%%					chargeAccumulate(CoinNum),
%%%%					{Coin,GotLevel} = getCoinAndGotLevelPerDay(),
%%%%					setCoinAndGotLevelPerDay(Coin+CoinNum,GotLevel),
%%%%
%%%%					playerVip:topUpMoney(CoinNum),
%%%%
%%%%					playerMoney:addCoin(?CoinTypeDiamond, CoinNum,
%%%%						#recPLogTSMoney{reason=?CoinSourceRecharge,param=LogParam,target=?PLogTS_PlayerSelf,source=?PLogTS_Recharge});
%%%%				_ ->
%%%%					skip
%%%%			end;
%%%%		_ ->
%%%%			?ERROR("orderid:~p giftStr:~p  roleid:~p",[ OrderID, GiftStrBin, ToRoleID ])
%%%%	end,
%%%%
%%%%	ok.
%%
%%%%购买成长礼包
%%-spec buyGrowUp() -> uint16().
%%buyGrowUp() ->
%%	KoreaGift = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_KoreaGift),
%%	<<Enable:16, GetLevel:16>> = <<KoreaGift:32>>,
%%	case Enable < 1 of
%%		true ->
%%			<<NewKoreaGift:32>> = <<1:16, GetLevel:16>>,
%%			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_KoreaGift, NewKoreaGift),
%%			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_BuyItem4GrowUpOK),
%%			1;
%%		false ->
%%			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_BuyItem4GrowUpNot),
%%			0
%%	end.
%%
%%%% 商业化内容-超值礼包界面上的每日签到奖励
%%%% 和商业化内容本身没有关系，这个签到是引导玩家去那个界面用的
%%%% 放在这里便于维护
%%-spec signIn() -> no_return().
%%signIn() ->
%%	case core:isCross() of
%%		false ->
%%			case playerDaily:getDailyCounter(?DailyType_BusinessSupperGift, 0) of
%%				0 ->
%%					playerDaily:incDailyCounter(?DailyType_BusinessSupperGift, 0),
%%					case getCfg:getCfgPStack(cfg_globalsetup, daily_packs_box) of
%%						#globalsetupCfg{setpara = [Coin]} when Coin > 0 ->
%%							PLog = #recPLogTSMoney{
%%								target = ?PLogTS_PlayerSelf,
%%								source = ?PLogTS_BusinessSupperGift,
%%								reason = ?CoinSourceBusinessSupperGift
%%							},
%%							playerMoney:addCoin(?CoinTypeGold, Coin, PLog),
%%							playerMsg:sendNetMsg(#pk_GS2U_BusinessSupperGift_Ack{});
%%						_ ->
%%							skip
%%					end;
%%				_ -> skip
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%% 商业化内容-现金礼包界面上的每日签到奖励
%%-spec getCashDailyGift() -> no_return().
%%getCashDailyGift() ->
%%	case core:isCross() of
%%		false ->
%%			case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_CashGift) of
%%				true ->
%%					case playerDaily:getDailyCounter(?DailyType_BusinessDailyCashGift, 0) of
%%						0 ->
%%							playerDaily:incDailyCounter(?DailyType_BusinessDailyCashGift, 0),
%%							case getCfg:getCfgPStack(cfg_globalsetup, cash_pack_box) of
%%								#globalsetupCfg{setpara = [CoinType, CoinNum]} when CoinNum > 0 ->
%%									PLog = #recPLogTSMoney{
%%										target = ?PLogTS_PlayerSelf,
%%										source = ?PLogTS_BusinessCashDailyGift,
%%										reason = ?CoinSourceBusinessCashDailyGift
%%									},
%%									playerMoney:addCoin(CoinType, CoinNum, PLog),
%%									playerMsg:sendNetMsg(#pk_GS2U_BusinessCashDailyGift_Ack{});
%%								_ ->
%%									skip
%%							end;
%%						_ ->
%%							skip
%%					end;
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 充值当时玩家信息记录Start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%% 获取玩家充值当时玩家信息
%%-spec getRechargedPlayerInfo(#recRecharge{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo(#recRecharge{roleID = RoleID}) ->
%%	%% 充值次数
%%	RechargeCount = publicDataMgrLogic:getPlayerRechargeCount(RoleID),
%%	%% 渠道来源标识（FGI），渠道来源账户ID
%%	{FgiID, ChannelID, _} = playerState:getFuncellInfo(),
%%	%% 觉醒阶段，觉醒漂浮之石阶段
%%	{AwakeStage, FloatingStone} = playerPropSync:getProp(?SerProp_CurRoleAwakeInfo),
%%	%% 家族ID
%%	Info = #rec_log_recharged_playerinfo{
%%		accountID = playerState:getAccountID(),
%%		rechargeNum = RechargeCount + 1,    %% 充值次数不在次数刷新，而是后续流程
%%		fgi = FgiID,
%%		channelAccountID = ChannelID,
%%		playerID = RoleID,
%%		playerLevel = playerState:getLevel(),
%%		playerCareer = playerState:getCareer(),
%%		playerGuildID = playerState:getGuildID(),
%%		time = time:getLogTimeSec(),
%%		awakeStage = AwakeStage,
%%		floatingStone = FloatingStone
%%	},
%%	Info2 = getRechargedPlayerInfo_Equip(Info),         %% 装备
%%	Info3 = getRechargedPlayerInfo_EquipRefine(Info2),  %% 装备精炼
%%	Info4 = getRechargedPlayerInfo_EquipUpStar(Info3),  %% 装备升星
%%	Info5 = getRechargedPlayerInfo_EquipGem(Info4),     %% 装备纹章（镶嵌）
%%	Info6 = getRechargedPlayerInfo_Rune(Info5),         %% 符文（圣物）
%%	Info7 = getRechargedPlayerInfo_Pet(Info6),          %% 骑宠相关内容
%%	Info8 = getRechargedPlayerInfo_Marriage(Info7),     %% 婚姻相关内容（需要先处理roleID）
%%	getRechargedPlayerInfo_Fashion(Info8).              %% 时装相关内容
%%
%%%% 玩家充值当时玩家信息-装备
%%-spec getRechargedPlayerInfo_Equip(#rec_log_recharged_playerinfo{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo_Equip(#rec_log_recharged_playerinfo{} = Info) ->
%%	EquipList = playerState:getEquips(),
%%	Fun =
%%		fun
%%			(#recEquipEnhance{type = ?EquipTypeWeapon, id = Equip}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipID1 = Equip};
%%			(#recEquipEnhance{type = ?EquipTypeHelmet, id = Equip}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipID2 = Equip};
%%			(#recEquipEnhance{type = ?EquipTypeEarrings, id = Equip}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipID3 = Equip};
%%			(#recEquipEnhance{type = ?EquipTypeArmor, id = Equip}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipID4 = Equip};
%%			(#recEquipEnhance{type = ?EquipTypeNecklace, id = Equip}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipID5 = Equip};
%%			(#recEquipEnhance{type = ?EquipTypeTrousers, id = Equip}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipID6 = Equip};
%%			(#recEquipEnhance{type = ?EquipTypeRing, id = Equip}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipID7 = Equip};
%%			(#recEquipEnhance{type = ?EquipTypeBoots, id = Equip}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipID8 = Equip};
%%			(_, PlayerInfo) ->
%%				PlayerInfo
%%		end,
%%	lists:foldl(Fun, Info, EquipList).
%%
%%%% 玩家充值当时玩家信息-装备精炼
%%-spec getRechargedPlayerInfo_EquipRefine(#rec_log_recharged_playerinfo{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo_EquipRefine(#rec_log_recharged_playerinfo{} = Info) ->
%%	EquipRefineList = playerState:getEquipRefine(),
%%	Fun =
%%		fun
%%			(#recEquipRefine{pos = ?EquipTypeWeapon, level = Refine}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipRefining1 = Refine};
%%			(#recEquipRefine{pos = ?EquipTypeHelmet, level = Refine}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipRefining2 = Refine};
%%			(#recEquipRefine{pos = ?EquipTypeEarrings, level = Refine}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipRefining3 = Refine};
%%			(#recEquipRefine{pos = ?EquipTypeArmor, level = Refine}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipRefining4 = Refine};
%%			(#recEquipRefine{pos = ?EquipTypeNecklace, level = Refine}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipRefining5 = Refine};
%%			(#recEquipRefine{pos = ?EquipTypeTrousers, level = Refine}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipRefining6 = Refine};
%%			(#recEquipRefine{pos = ?EquipTypeRing, level = Refine}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipRefining7 = Refine};
%%			(#recEquipRefine{pos = ?EquipTypeBoots, level = Refine}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipRefining8 = Refine};
%%			(_, PlayerInfo) ->
%%				PlayerInfo
%%		end,
%%	lists:foldl(Fun, Info, EquipRefineList).
%%
%%%% 玩家充值当时玩家信息-装备升星
%%-spec getRechargedPlayerInfo_EquipUpStar(#rec_log_recharged_playerinfo{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo_EquipUpStar(#rec_log_recharged_playerinfo{} = Info) ->
%%	EquipStarList = playerState:getEquipStarList(),
%%	Fun =
%%		fun
%%			(#recEquipStar{pos = ?EquipTypeWeapon, star = Star}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipUpStar1 = Star};
%%			(#recEquipStar{pos = ?EquipTypeHelmet, star = Star}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipUpStar2 = Star};
%%			(#recEquipStar{pos = ?EquipTypeEarrings, star = Star}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipUpStar3 = Star};
%%			(#recEquipStar{pos = ?EquipTypeArmor, star = Star}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipUpStar4 = Star};
%%			(#recEquipStar{pos = ?EquipTypeNecklace, star = Star}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipUpStar5 = Star};
%%			(#recEquipStar{pos = ?EquipTypeTrousers, star = Star}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipUpStar6 = Star};
%%			(#recEquipStar{pos = ?EquipTypeRing, star = Star}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipUpStar7 = Star};
%%			(#recEquipStar{pos = ?EquipTypeBoots, star = Star}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{equipUpStar8 = Star};
%%			(_, PlayerInfo) ->
%%				PlayerInfo
%%		end,
%%	lists:foldl(Fun, Info, EquipStarList).
%%
%%%% 玩家充值当时玩家信息-装备纹章
%%-spec getRechargedPlayerInfo_EquipGem(#rec_log_recharged_playerinfo{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo_EquipGem(#rec_log_recharged_playerinfo{} = Info) ->
%%	EquipGemList = playerPropSync:getProp(?SerProp_EquipGems),
%%	FunSlot =
%%		fun(#recSlotInfo{gemID = GemID}, {Level, Num, Sum}) ->
%%			case getCfg:getCfgPStack(cfg_item, GemID) of
%%				#itemCfg{useParam3 = CurLevel} when CurLevel > Level ->
%%					{CurLevel, 1, Sum + CurLevel};
%%				#itemCfg{useParam3 = CurLevel} when CurLevel == Level ->
%%					{CurLevel, Num + 1, Sum + CurLevel};
%%				#itemCfg{useParam3 = CurLevel} ->
%%					{CurLevel, Num, Sum + CurLevel};
%%				_ ->
%%					%% 防止配置错误造成的流程阻断
%%					{Level, Num, Sum}
%%			end
%%		end,
%%	Fun =
%%		fun(#recGemInfo{gems = Gems}, Ret) ->
%%			lists:foldl(FunSlot, Ret, Gems)
%%		end,
%%	{MaxLevel, MaxLevelNum, LevelSum} = lists:foldl(Fun, {0, 0, 0}, EquipGemList),
%%	Info#rec_log_recharged_playerinfo{gemMaxLevel = MaxLevel, gemMaxLevelNum = MaxLevelNum, gemLevelSum = LevelSum}.
%%
%%%% 玩家充值当时玩家信息-符文（圣物）
%%-spec getRechargedPlayerInfo_Rune(#rec_log_recharged_playerinfo{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo_Rune(#rec_log_recharged_playerinfo{} = Info) ->
%%	RuneList = playerRune:getPlayerRune(),
%%	Fun =
%%		fun
%%			(#recRune{subType = ?RuneSubType_DB, runeID = Rune}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{rune1 = Rune};
%%			(#recRune{subType = ?RuneSubType_HY, runeID = Rune}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{rune2 = Rune};
%%			(#recRune{subType = ?RuneSubType_LY, runeID = Rune}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{rune3 = Rune};
%%			(#recRune{subType = ?RuneSubType_TK, runeID = Rune}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{rune4 = Rune};
%%			(_, PlayerInfo) ->
%%				PlayerInfo
%%		end,
%%	lists:foldl(Fun, Info, RuneList).
%%
%%%% 玩家充值当时玩家信息-骑宠相关内容
%%-spec getRechargedPlayerInfo_Pet(#rec_log_recharged_playerinfo{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo_Pet(#rec_log_recharged_playerinfo{} = Info) ->
%%	AssistPets = playerPropSync:getProp(?SerProp_PetAssistBattleInfo),
%%	Fun =
%%		fun
%%			(#recPetAssistInfo{slot = 1, petID = PetID}, PlayerInfo) ->
%%				case playerPet:getPetByID(PetID) of
%%					{ok, #recPetInfo{pet_level = Level, pet_star = Star, pet_raw = Raw}} ->
%%						PlayerInfo#rec_log_recharged_playerinfo{
%%							ridePet1ID = PetID,
%%							ridePet1Level = Level,
%%							ridePet1Star = Star,
%%							ridePet1TransLevel = Raw
%%						};
%%					_ ->
%%						PlayerInfo
%%				end;
%%			(#recPetAssistInfo{slot = 2, petID = PetID}, PlayerInfo) ->
%%				case playerPet:getPetByID(PetID) of
%%					{ok, #recPetInfo{pet_level = Level, pet_star = Star, pet_raw = Raw}} ->
%%						PlayerInfo#rec_log_recharged_playerinfo{
%%							ridePet2ID = PetID,
%%							ridePet2Level = Level,
%%							ridePet2Star = Star,
%%							ridePet2TransLevel = Raw
%%						};
%%					_ ->
%%						PlayerInfo
%%				end;
%%			(#recPetAssistInfo{slot = 3, petID = PetID}, PlayerInfo) ->
%%				case playerPet:getPetByID(PetID) of
%%					{ok, #recPetInfo{pet_level = Level, pet_star = Star, pet_raw = Raw}} ->
%%						PlayerInfo#rec_log_recharged_playerinfo{
%%							ridePet3ID = PetID,
%%							ridePet3Level = Level,
%%							ridePet3Star = Star,
%%							ridePet3TransLevel = Raw
%%						};
%%					_ ->
%%						PlayerInfo
%%				end;
%%			(#recPetAssistInfo{slot = 4, petID = PetID}, PlayerInfo) ->
%%				case playerPet:getPetByID(PetID) of
%%					{ok, #recPetInfo{pet_level = Level, pet_star = Star, pet_raw = Raw}} ->
%%						PlayerInfo#rec_log_recharged_playerinfo{
%%							ridePet4ID = PetID,
%%							ridePet4Level = Level,
%%							ridePet4Star = Star,
%%							ridePet4TransLevel = Raw
%%						};
%%					_ ->
%%						PlayerInfo
%%				end;
%%			(#recPetAssistInfo{slot = 5, petID = PetID}, PlayerInfo) ->
%%				case playerPet:getPetByID(PetID) of
%%					{ok, #recPetInfo{pet_level = Level, pet_star = Star, pet_raw = Raw}} ->
%%						PlayerInfo#rec_log_recharged_playerinfo{
%%							ridePet5ID = PetID,
%%							ridePet5Level = Level,
%%							ridePet5Star = Star,
%%							ridePet5TransLevel = Raw
%%						};
%%					_ ->
%%						PlayerInfo
%%				end;
%%			(_, PlayerInfo) ->
%%				PlayerInfo
%%		end,
%%	InfoNew = lists:foldl(Fun, Info, AssistPets),
%%	EquipList = playerState:getPetEquip(),
%%	FunEquip =
%%		fun
%%			(#recPetEquip{equip_pos = 0, equip_lv = Level}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{ridePetEquipLevel1 = Level};
%%			(#recPetEquip{equip_pos = 1, equip_lv = Level}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{ridePetEquipLevel2 = Level};
%%			(#recPetEquip{equip_pos = 2, equip_lv = Level}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{ridePetEquipLevel3 = Level};
%%			(#recPetEquip{equip_pos = 3, equip_lv = Level}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{ridePetEquipLevel4 = Level};
%%			(_, PlayerInfo) ->
%%				PlayerInfo
%%		end,
%%	InfoNew2 = lists:foldl(FunEquip, InfoNew, EquipList),
%%	case playerPet:getPetBattle() of
%%		false ->
%%			InfoNew2;
%%		#recPetInfo{
%%			pet_id = PetIDMain, pet_level = PetLevelMain,
%%			pet_star = PetStarMain, pet_raw = PetRawMain
%%		} ->
%%			InfoNew2#rec_log_recharged_playerinfo{
%%				ridePetMainID = PetIDMain,
%%				ridePetMainLevel = PetLevelMain,
%%				ridePetMainStar = PetStarMain,
%%				ridePetMainTransLevel = PetRawMain
%%			}
%%	end.
%%
%%%% 玩家充值当时玩家信息-婚姻相关内容
%%-spec getRechargedPlayerInfo_Marriage(#rec_log_recharged_playerinfo{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo_Marriage(#rec_log_recharged_playerinfo{playerID = RoleID} = Info) ->
%%	#rec_marriage{ringTop = RingTop, ringExp = RingExp} = marriageState:queryRelation(RoleID),
%%	InfoNew = Info#rec_log_recharged_playerinfo{ringLevel = RingTop, ringExp = RingExp},
%%	MarriageSkillList = marriageState:querySlots(RoleID),
%%	Fun =
%%		fun
%%			({1, Exp}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{marriageSkill1 = Exp};
%%			({2, Exp}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{marriageSkill2 = Exp};
%%			({3, Exp}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{marriageSkill3 = Exp};
%%			({4, Exp}, PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{marriageSkill4 = Exp};
%%			(_, PlayerInfo) ->
%%				PlayerInfo
%%		end,
%%	lists:foldl(Fun, InfoNew, MarriageSkillList).
%%
%%%% 玩家充值当时玩家信息-时装相关内容
%%-spec getRechargedPlayerInfo_Fashion(#rec_log_recharged_playerinfo{}) -> #rec_log_recharged_playerinfo{}.
%%getRechargedPlayerInfo_Fashion(#rec_log_recharged_playerinfo{} = Info) ->
%%	FashionList = playerState:getFashionList(),
%%	Fun =
%%		fun
%%			(#recFashion{endTime = 0}, #rec_log_recharged_playerinfo{fashionForever = Count} = PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{fashionForever = Count + 1};
%%			(_, #rec_log_recharged_playerinfo{fashionLimit = Count} = PlayerInfo) ->
%%				PlayerInfo#rec_log_recharged_playerinfo{fashionLimit = Count + 1}
%%		end,
%%	lists:foldl(Fun, Info, FashionList).
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 充值当时玩家信息记录End %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
