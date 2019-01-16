%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十一月 2017 17:37
%%%-------------------------------------------------------------------
-module(playerRecharge2).
-author("tiancheng").
%%
%%-include("gsInc.hrl").
%%-include("playerPrivate.hrl").
%%-include("../recharge/recharge.hrl").
%%
%%-define(BusinessDiv, 1000).
%%
%%-define(BusinessType_FirstRecharge, 1).%%首冲
%%-define(BusinessType_GrowUpActive, 2).%%成长基金激活
%%-define(BusinessType_GrowUpGet, 3).%%成长基金领取
%%-define(BusinessType_Accumulate, 4).%%累充
%%-define(BusinessType_Consume, 5).%%消费返利
%%-define(BusinessType_CashGift, 6).%%现金礼包
%%-define(BusinessType_DayGift, 7).%%每日超值礼包
%%-define(BusinessType_First, 8).%%首登现金特卖
%%-define(BusinessType_Mall, 9).%%商城
%%-define(BusinessType_Accumulate2, 10).%% 另一个累充，台湾的奇葩需求
%%-define(BusinessType_WebMall, 11).%% 台湾提供的网页充值
%%-define(BusinessType_Vip, 50).%%特权卡，Vip
%%
%%%% 对#businessCfg.isAlonePay的扩展
%%-define(IsAlone_Public,		0).	%% 对自己积累，可向其它0的充值项积累，可被其它0和1的充值项累积
%%-define(IsAlone_Protected,	1).	%% 对自己积累，可向其它0的充值项积累，不可被其它充值项积累
%%-define(IsAlone_Private,	2).	%% 对自己积累，不可向其它0的充值项积累，不可被其它充值项积累
%%
%%%% 是否计入需要钻石
%%-define(AddClaimGold, 1). %%计入需要钻石
%%-define(NotAddClaimGold, 0). %%不计入需要钻石
%%
%%%% API
%%-export([
%%	sendBusinessInfoToClient/0,
%%	requestGetGift/1,
%%	requestBusinessInfo/1
%%]).
%%
%%-export([
%%	consumeDiamond/2,
%%	recharge/3,
%%	recharge3/4
%%]).
%%
%%%% 修复丢失的10号活动数据
%%-export([
%%	fixLostBusiness1/0,
%%	fixLostBusiness10/0
%%]).
%%
%%%% GM模拟充值
%%-export([
%%	gmRechargeTemStorage/3,
%%	dealTemGMRecharge/0,
%%	gmSimulateRecharge/1
%%]).
%%
%%%% 消费钻石
%%consumeDiamond(Type, Value) when Type =:= ?CoinTypeDiamond orelse Type =:= ?CoinTypeBindDiamond ->
%%	ActivityType = ?BusinessType_Consume,
%%	?DEBUG("consumeDiamond:~p,~p", [Type, Value]),
%%	case isOpen(ActivityType) of
%%		true ->
%%			%% 非充值的活动ID可以领取
%%			List = getCheckResetBusinessList(ActivityType),
%%			case lists:keyfind(ActivityType, #recBusiness.activityType, List) of
%%				Business = #recBusiness{claimConsume = Consumes} ->
%%					NewConsume =
%%						case lists:keyfind(Type, #recBusinessConsume.moneyType, Consumes) of
%%							#recBusinessConsume{moneyValue = OldValue} ->
%%								#recBusinessConsume{moneyType = Type, moneyValue = OldValue + abs(Value)};
%%							_ ->
%%								#recBusinessConsume{moneyType = Type, moneyValue = abs(Value)}
%%						end,
%%					NewConsumes = lists:keystore(Type, #recBusinessConsume.moneyType, Consumes, NewConsume),
%%					NewList = lists:keystore(ActivityType, #recBusiness.activityType, List, Business#recBusiness{claimConsume = NewConsumes}),
%%					playerPropSync:setAny(?SerProp_Business, NewList),
%%					?DEBUG("consumeDiamond roleID:~p,~p,~p", [playerState:getRoleID(), Type, Value]),
%%					ok;
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end,
%%
%%	case Type of
%%		?CoinTypeDiamond ->
%%			%% 如果是非绑定钻石的消费，则还要增加绑定钻石的消费
%%			consumeDiamond(?CoinTypeBindDiamond, Value);
%%		_ -> ok
%%	end;
%%consumeDiamond(_, _) ->
%%	ok.
%%
%%%% 充值
%%recharge(ID, Money, Value) ->
%%	?INFO("recharge roleID:~p, ID:~p Money:~p, Value:~p",
%%		[playerState:getRoleID(), ID, Money, Value]),
%%	case ets:lookup(ets_business, ID) of
%%		[#rec_business{claimGold = ValueB}] ->
%%			%% 有的充值可能只给礼包，不发货币，即Value=0，那么就要取实际的配置货币
%%			recharge2(ID, Money, ValueB);
%%		_ ->
%%			recharge2(ID, Money, Value)
%%	end,
%%	ok.
%%recharge2(ID, Money, Value) ->
%%	?INFO("recharge2 roleID:~p, ID:~p Money:~p, Value:~p",
%%		[playerState:getRoleID(), ID, Money, Value]),
%%
%%	%% 先增加本身的充值
%%	recharge3(ID, Money, Value, ID),
%%
%%	%% 根据isAlonePay判断是否对其它项累积充值
%%	case ets:lookup(ets_business, ID) of
%%		[#rec_business{isAlonePay = ?IsAlone_Private}] ->
%%			skip;
%%		[#rec_business{activityType = Type}] ->
%%			Select = ets:fun2ms(
%%				fun(#rec_business{activityType = Type_, isAlonePay = IsAlonePay} = R)
%%					when Type =/= Type_, IsAlonePay =:= ?IsAlone_Public ->
%%					R
%%				end
%%			),
%%			List = lists:filter(fun(#rec_business{} = Business) -> businessInterface:isValid(Business) end, ets:select(ets_business, Select)),
%%			FunFilter =
%%				fun(#rec_business{id = ID_, activityType = Type_}, Acc) ->
%%					case lists:keyfind(Type_, 1, Acc) of
%%						false ->
%%							recharge3(ID_, Money, Value, ID),
%%							[{Type_, ID_} | Acc];
%%						_ ->
%%							Acc
%%					end
%%				end,
%%			lists:foldl(FunFilter, [], lists:keysort(#rec_business.id, List));
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%recharge3(ID, Money, Value, FromID) ->
%%	FromType =
%%		case ets:lookup(ets_business, FromID) of
%%			[#rec_business{activityType = FromType_}] ->
%%				FromType_;
%%			_ -> 0
%%		end,
%%	{FromGiveGold, FromIsAddClaimGold}=
%%		case ets:lookup(ets_business, FromID) of
%%			[#rec_business{giveGold = FromGiveGold_, isAddClaimGold = FromIsAddClaimGold_}] ->
%%				{FromGiveGold_, FromIsAddClaimGold_};
%%			_ -> {0,0}
%%		end,
%%
%%	?INFO("recharge3 roleID:~p, ID:~p Money:~p, Value:~p, FromID:~p",
%%		[playerState:getRoleID(), ID, Money, Value, FromID]),
%%
%%	{Log, AType} =
%%		case ets:lookup(ets_business, ID) of
%%			[#rec_business{version = Version, activityType = ActivityType, resetClaimNumType = RType} = Need] ->
%%				Reason =
%%					case isRechargeActivity(ActivityType) of
%%						true ->
%%							case isOpen(ActivityType) of
%%								true ->
%%									case businessInterface:isValid(Need) of
%%										true ->
%%											%% 记录成长基金购买状态
%%											case ActivityType of
%%												?BusinessType_GrowUpActive ->
%%													playerPropSync:setInt(?SerProp_GrowUpMoney, Version);
%%												_ ->
%%													skip
%%											end,
%%
%%											%% 非充值的活动ID可以领取
%%											List = getCheckResetBusinessList(ActivityType),
%%
%%											case lists:keyfind(ActivityType, #recBusiness.activityType, List) of
%%												false ->
%%													-12;
%%												#recBusiness{claimMoney = OldMoney, claimGold = OldGold} = Business0 ->
%%													Business =
%%														case FromType =:= ?BusinessType_CashGift orelse FromType =:= ?BusinessType_DayGift orelse FromType =:= ?BusinessType_Mall orelse FromType =:= ?BusinessType_Vip of
%%															true ->
%%																case FromIsAddClaimGold of
%%																	?AddClaimGold ->
%%																		%% 记录充值金额(加上额外赠送的钻石数)
%%																		Business0#recBusiness{claimMoney = OldMoney + Money, claimGold = OldGold + Value + FromGiveGold};
%%																	_ ->
%%																		%% 记录充值金额(不加额外赠送的钻石数)
%%																		Business0#recBusiness{claimMoney = OldMoney + Money, claimGold = OldGold + Value}
%%																end;
%%															_ ->
%%																%% 记录充值金额
%%																Business0#recBusiness{claimMoney = OldMoney + Money, claimGold = OldGold + Value}
%%														end,
%%
%%													%% 判断是不是直接发奖的
%%													Ret =
%%														case isGiftActivity(ActivityType) of
%%															true ->
%%																case isGiftActivityNeedRequest(ActivityType) of
%%																	false ->
%%																		NeedGift =
%%																			case ActivityType of
%%																				?BusinessType_Mall ->
%%																					FromType =:= ActivityType;
%%																				?BusinessType_WebMall ->
%%																					FromType =:= ActivityType;
%%																				_ ->
%%																					true
%%																			end,
%%																		%% 直接发奖
%%																		Ret1 = checkRecharge(NeedGift, Need, Business),
%%																		Ret2 = checkConsume(Ret1, Need, Business),
%%																		Ret3 =
%%																			case (FromType =:= ?BusinessType_CashGift orelse FromType =:= ?BusinessType_DayGift orelse FromType =:= ?BusinessType_Mall orelse FromType =:= ?BusinessType_Vip) andalso ActivityType =:= FromType of
%%																				true ->
%%																					%%额外送钻石只要配置数量大于0则生效(不限制次数)
%%																					case FromGiveGold > 0 of
%%																						true ->
%%																							true;
%%																						_ ->
%%																							checkNumber(Ret2, Need, Business)
%%																					end;
%%																				_ ->
%%																					checkNumber(Ret2, Need, Business)
%%																			end,
%%
%%%%																		Ret3 = checkNumber(Ret2, Need, Business),
%%																		Ret4 = checkVip(Ret3, Need, Business),
%%																		Ret5 = checkGrowUp(Ret4, Need, Business),
%%																		Ret6 = checkPlayerLevel(Ret5, Need, Business),
%%																		case Ret6 of
%%																			true ->
%%																				NewBuy =
%%																					case lists:keyfind(ID, #recBusinessBuy.id, Business#recBusiness.claimNum) of
%%																						#recBusinessBuy{number = OldNumber} = Buy ->
%%																							Buy#recBusinessBuy{number = OldNumber + 1};
%%																						_ ->
%%																							Time = businessInterface:getLocalTimestampSec(),
%%																							NTime = getNextResetTime(Time, RType),
%%																							#recBusinessBuy{id = ID, number = 1, time = NTime}
%%																					end,
%%																				BuyL = lists:keystore(ID, #recBusinessBuy.id, Business#recBusiness.claimNum, NewBuy),
%%																				NewList = lists:keystore(ActivityType, #recBusiness.activityType, List, Business#recBusiness{claimNum = BuyL}),
%%																				playerPropSync:setAny(?SerProp_Business, NewList),
%%
%%																				rewardItems(Need, Money, Value),
%%																				1;
%%																			_ ->
%%																				%% 不发奖，但是要累积充值
%%																				NewList = lists:keystore(ActivityType, #recBusiness.activityType, List, Business),
%%																				playerPropSync:setAny(?SerProp_Business, NewList),
%%
%%																				if
%%																					not Ret1 -> -5;
%%																					not Ret2 -> -6;
%%																					not Ret3 -> -7;
%%																					not Ret4 -> -8;
%%																					not Ret5 -> -9;
%%																					not Ret6 -> -10;
%%																					true -> -11
%%																				end
%%																		end;
%%																	_ ->
%%																		%% 需要他自己领取的
%%																		NewList1 = lists:keystore(ActivityType, #recBusiness.activityType, List, Business),
%%																		playerPropSync:setAny(?SerProp_Business, NewList1),
%%																		13
%%																end;
%%															_ ->
%%																%% 没奖，但是要计数
%%																NewList2 = lists:keystore(ActivityType, #recBusiness.activityType, List, Business),
%%																playerPropSync:setAny(?SerProp_Business, NewList2),
%%																14
%%														end,
%%
%%													%% 刷新客户端
%%													requestBusinessInfo(ActivityType),
%%													Ret
%%											end;
%%										_ ->
%%											-4
%%									end;
%%								_ ->
%%									-3
%%							end;
%%						_ ->
%%							-2
%%					end,
%%				{Reason, ActivityType};
%%			_ ->
%%				{-1, 0}
%%		end,
%%
%%	%% 处理购买VIP的情况
%%	case ID div ?BusinessDiv of
%%		?BusinessType_Vip -> playerVip:buy(ID);
%%		_ -> skip
%%	end,
%%
%%	?INFO("player recharge3 roleID:~p,ActivityID:~p,Money:~p,Diamond:~p,Ret:~p",
%%		[playerState:getRoleID(), ID, Money, Value, Log]),
%%
%%	LogR = #rec_log_business{
%%		roleID = playerState:getRoleID(),				%% bigint(20) unsigned
%%		activityID = ID,				%% int(10) unsigned
%%		activityType = AType,				%% tinyint(3) unsigned
%%		money = Money,				%%充值的货币 float
%%		diamond = Value,				%%充值的钻石 int(11)
%%		rechargeOrGift = 1,				%%1充值，2领取 tinyint(3) unsigned
%%		result = Log				%%结果 tinyint(4)
%%	},
%%	dbLog:sendSaveBusiness(LogR),
%%	ok.
%%
%%%% 发货
%%rewardItems(#rec_business{id = ID, activityType = ActivityType, rewardCoinType = RewardCoinType, rewardCoinNum = RewardCoinNum, giveGold = GiveGold} = Business, Money, Value) ->
%%	%%List0 = getItemList([], Business#rec_business.rewardPackageID, 1, 0),
%%	List1 = getItemList([], Business#rec_business.item1, Business#rec_business.num1, 1),
%%	List2 = getItemList(List1, Business#rec_business.item2, Business#rec_business.num2, 2),
%%	List3 = getItemList(List2, Business#rec_business.item3, Business#rec_business.num3, 3),
%%	List4 = getItemList(List3, Business#rec_business.item4, Business#rec_business.num4, 4),
%%	List5 = getItemList(List4, Business#rec_business.item5, Business#rec_business.num5, 5),
%%	List6 = getItemList(List5, Business#rec_business.item6, Business#rec_business.num6, 6),
%%	List7 = getItemList(List6, Business#rec_business.item7, Business#rec_business.num7, 7),
%%	List8 = getItemList(List7, Business#rec_business.item8, Business#rec_business.num8, 8),
%%	List9 = getItemList(List8, Business#rec_business.item9, Business#rec_business.num9, 9),
%%	List10 = getItemList(List9, Business#rec_business.item10, Business#rec_business.num10, 10),
%%
%%	F =
%%		fun(#pk_ActivitySuccessItem{itemID = ItemID, num = ItemNum}) ->
%%			PLog = #recPLogTSItem{
%%				old = 0,
%%				new = 1,
%%				change = 1,
%%				target = ?PLogTS_PlayerSelf,
%%				source = ?PLogTS_BuyItem,
%%				gold = 0,
%%				goldtype = 0,
%%				changReason = ?ItemSourceBuyItem,
%%				reasonParam = ItemID
%%			},
%%			playerPackage:addGoodsAndMail(ItemID, ItemNum, false, 0, PLog)
%%		end,
%%	lists:foreach(F, List10),
%%	CoinList =
%%		case ActivityType =:= ?BusinessType_CashGift orelse ActivityType =:= ?BusinessType_DayGift orelse ActivityType =:= ?BusinessType_Mall orelse ActivityType =:= ?BusinessType_Vip of
%%			true ->
%%				%%只要配置了额外钻石就会覆盖原来配置的赠送星月币(只发赠送钻石,不会发赠送的星月币)
%%				case GiveGold > 0 of
%%					true ->
%%						case playerMoney:addCoin(?CoinTypeDiamond, GiveGold,
%%							#recPLogTSMoney{reason = ?CoinSourceBusinessGiveGold, param = integer_to_list(ID), target = ?PLogTS_PlayerSelf, source = ?PLogTS_BuyItem}) of
%%							true ->
%%								[#pk_CoinConsume{coinType = ?CoinTypeDiamond, value = GiveGold}];
%%							_ ->
%%								?ERROR("giveGold addgold error:~p,~p", [playerState:getRoleID(), Business]),
%%								[]
%%						end;
%%					_ ->
%%						%%没有配置额外钻石,原有配置赠送星月币生效(发赠送的星月币)
%%						case (RewardCoinType =:= ?CoinTypeDiamond orelse RewardCoinType =:= ?CoinTypeBindDiamond) andalso RewardCoinNum > 0 of
%%							true ->
%%								case playerMoney:addCoin(?CoinTypeBindDiamond, RewardCoinNum,
%%									#recPLogTSMoney{reason = ?CoinSourceOperateExchange, param = integer_to_list(ID), target = ?PLogTS_PlayerSelf, source = ?PLogTS_BuyItem}) of
%%									true ->
%%										[#pk_CoinConsume{coinType = RewardCoinType, value = RewardCoinNum}];
%%									_ ->
%%										?ERROR("rewardItems addcoin error:~p,~p", [playerState:getRoleID(), Business]),
%%										[]
%%								end;
%%							_ ->
%%								[]
%%						end
%%				end;
%%			_ ->
%%				case (RewardCoinType =:= ?CoinTypeDiamond orelse RewardCoinType =:= ?CoinTypeBindDiamond) andalso RewardCoinNum > 0 of
%%					true ->
%%						case playerMoney:addCoin(?CoinTypeBindDiamond, RewardCoinNum,
%%							#recPLogTSMoney{reason = ?CoinSourceOperateExchange, param = integer_to_list(ID), target = ?PLogTS_PlayerSelf, source = ?PLogTS_BuyItem}) of
%%							true ->
%%								[#pk_CoinConsume{coinType = RewardCoinType, value = RewardCoinNum}];
%%							_ ->
%%								?ERROR("rewardItems addcoin error:~p,~p", [playerState:getRoleID(), Business]),
%%								[]
%%						end;
%%					_ ->
%%						[]
%%				end
%%		end,
%%
%%	Msg = #pk_GS2U_RechargeSuccess{id = ID, activityType = ActivityType, claimGold = Value, claimMoney = Money, coins = CoinList, items = List10},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%getItemList(List, 0, _ItemNumber, _Index) -> List;
%%getItemList(List, _ItemID, 0, _Index) -> List;
%%getItemList(List, ItemID, ItemNumber, Index) ->
%%	R = #pk_ActivitySuccessItem{
%%		index = Index,
%%		itemID = ItemID,
%%		num = ItemNumber
%%	},
%%	[R | List].
%%
%%%%领取商业化奖励
%%requestGetGift(ID) ->
%%	{Log, AType} =
%%		case ets:lookup(ets_business, ID) of
%%			[#rec_business{activityType = ActivityType, resetClaimNumType = RType} = Need] ->
%%				Reason =
%%					case isGiftActivity(ActivityType) of
%%						true ->
%%							case isOpen(ActivityType) of
%%								true ->
%%									case businessInterface:isValid(Need) of
%%										true ->
%%											%% 非充值的活动ID可以领取
%%											List = getCheckResetBusinessList(ActivityType),
%%											case lists:keyfind(ActivityType, #recBusiness.activityType, List) of
%%												false ->
%%													-12;
%%												#recBusiness{} = Business ->
%%													%% 判断条件
%%													Ret1 = checkRecharge(true, Need, Business),
%%													Ret2 = checkConsume(Ret1, Need, Business),
%%													Ret3 = checkNumber(Ret2, Need, Business),
%%													Ret4 = checkVip(Ret3, Need, Business),
%%													Ret5 = checkGrowUp(Ret4, Need, Business),
%%													Ret6 = checkPlayerLevel(Ret5, Need, Business),
%%
%%													case Ret6 of
%%														true ->
%%															%% 领取并计数
%%															NewBuy =
%%																case lists:keyfind(ID, #recBusinessBuy.id, Business#recBusiness.claimNum) of
%%																	#recBusinessBuy{number = OldNumber} = Buy ->
%%																		Buy#recBusinessBuy{number = OldNumber + 1};
%%																	_ ->
%%																		Time = businessInterface:getLocalTimestampSec(),
%%																		NTime = getNextResetTime(Time, RType),
%%																		#recBusinessBuy{id = ID, number = 1, time = NTime}
%%																end,
%%															BuyL = lists:keystore(ID, #recBusinessBuy.id, Business#recBusiness.claimNum, NewBuy),
%%															NewList = lists:keystore(ActivityType, #recBusiness.activityType, List, Business#recBusiness{claimNum = BuyL}),
%%															playerPropSync:setAny(?SerProp_Business, NewList),
%%
%%															rewardItems(Need, 0.0, 0),
%%
%%															%% 刷新客户端
%%															requestBusinessInfo(ActivityType),
%%															1;
%%														_ ->
%%															ErrorReason =
%%																if
%%																	not Ret1 -> -5;
%%																	not Ret2 -> -6;
%%																	not Ret3 -> -7;
%%																	not Ret4 -> -8;
%%																	not Ret5 -> -9;
%%																	not Ret6 -> -10;
%%																	true -> -11
%%																end,
%%															?ERROR("requestGetGift:~p,ErrorReason:~p,~p,~p",
%%																[playerState:getRoleID(),ErrorReason,Need,Business]),
%%															ErrorReason
%%													end
%%											end;
%%										_ ->
%%											?ERROR("requestGetGift not vaild:~p,~p", [playerState:getRoleID(),Need]),
%%											-4
%%									end;
%%								_ ->
%%									-3
%%							end;
%%						_ ->
%%							-2
%%					end,
%%				{Reason, ActivityType};
%%			_ ->
%%				{-1, 0}
%%		end,
%%	%% 记录日志
%%	LogR = #rec_log_business{
%%		roleID = playerState:getRoleID(),				%% bigint(20) unsigned
%%		activityID = ID,				%% int(10  ) unsigned
%%		activityType = AType,				%% tinyint(3) unsigned
%%		money = 0.0,				%%充值的货币 float
%%		diamond = 0,				%%充值的钻石 int(11)
%%		rechargeOrGift = 2,				%%1充值，2领取 tinyint(3) unsigned
%%		result = Log				%%结果 tinyint(4)
%%	},
%%	dbLog:sendSaveBusiness(LogR),
%%	ok.
%%
%%%% 请求商业化内容
%%requestBusinessInfo(?BusinessType_GrowUpActive) ->
%%	requestBusinessInfo2(?BusinessType_GrowUpActive),
%%	requestBusinessInfo2(?BusinessType_GrowUpGet);
%%requestBusinessInfo(?BusinessType_GrowUpGet) ->
%%	requestBusinessInfo2(?BusinessType_GrowUpActive),
%%	requestBusinessInfo2(?BusinessType_GrowUpGet);
%%requestBusinessInfo(ActivityType) ->
%%	requestBusinessInfo2(ActivityType).
%%requestBusinessInfo2(ActivityType) ->
%%%%	Time = businessInterface:getLocalTimestampSec(),
%%	ClaimIsBuy = case playerPropSync:getProp(?SerProp_GrowUpMoney) > 0 of
%%					 true -> 1;
%%					 _ -> 0
%%				 end,
%%
%%	List = getCheckResetBusinessList(ActivityType),
%%	Msg =
%%		case lists:keyfind(ActivityType, #recBusiness.activityType, List) of
%%			#recBusiness{} = Business ->
%%				F1 =
%%					fun(#recBusinessConsume{moneyType = Type, moneyValue = Value}) ->
%%						#pk_CoinConsume{coinType = Type, value = Value}
%%					end,
%%				F2 =
%%					fun(#recBusinessBuy{id = ID, number = Number}) ->
%%						#pk_ActivityNum{id = ID, claimNum = Number}
%%					end,
%%				#pk_GS2U_BusinessPlayerInfo{
%%					claimMoney = Business#recBusiness.claimMoney,
%%					claimGold = erlang:trunc(Business#recBusiness.claimGold),
%%					claimIsBuy = ClaimIsBuy,
%%					claimConsume = lists:map(F1, Business#recBusiness.claimConsume),
%%					claimNum = lists:map(F2, Business#recBusiness.claimNum)
%%				};
%%			_ ->
%%				#pk_GS2U_BusinessPlayerInfo{claimMoney = 0.0, claimGold = 0, claimIsBuy = ClaimIsBuy, claimConsume = [], claimNum = []}
%%		end,
%%	Msg2 = Msg#pk_GS2U_BusinessPlayerInfo{activityType = ActivityType},
%%	playerMsg:sendNetMsg(Msg2),
%%	ok.
%%
%%getCheckResetBusinessList(ActivityType) ->
%%	BList = playerPropSync:getProp(?SerProp_Business),
%%	NList =
%%		case BList of
%%			[#recBusiness{}|_] ->
%%				case lists:keyfind(ActivityType, #recBusiness.activityType, BList) of
%%					#recBusiness{version = Version, claimNum = ClaimNumbers} = Business ->
%%						case businessInterface:getNowVersionBusinessList(ActivityType) of
%%							[#rec_business{version = Version}|_] = List ->
%%								%% 大版本不需要重置，检测次数
%%								Time = businessInterface:getLocalTimestampSec(),
%%								F =
%%									fun(#recBusinessBuy{id = ID, time = RTime} = Buy, AccList) ->
%%										case Time >= RTime of
%%											true ->
%%												%% 重置
%%												case lists:keyfind(ID, #rec_business.id, List) of
%%													#rec_business{resetClaimNumType = RType} ->
%%														NTime = getNextResetTime(Time, RType),
%%														[Buy#recBusinessBuy{time = NTime, number = 0} | AccList];
%%													_ ->
%%														[Buy | AccList]
%%												end;
%%											_ ->
%%												[Buy | AccList]
%%										end
%%									end,
%%								NewClaimNumbers = lists:foldr(F, [], ClaimNumbers),
%%								lists:keystore(ActivityType, #recBusiness.activityType, BList, Business#recBusiness{claimNum = NewClaimNumbers});
%%							[#rec_business{version = V}|_] ->
%%								%% 重置活动
%%								lists:keystore(ActivityType, #recBusiness.activityType, BList, #recBusiness{activityType = ActivityType, version = V});
%%							_ ->
%%								lists:keydelete(ActivityType, #recBusiness.activityType, BList)
%%						end;
%%					_ ->
%%						%% 没有找到，删除该活动或者重置
%%						case businessInterface:getNowVersion(ActivityType) of
%%							0 ->
%%								lists:keydelete(ActivityType, #recBusiness.activityType, BList);
%%							V ->
%%								lists:keystore(ActivityType, #recBusiness.activityType, BList, #recBusiness{activityType = ActivityType, version = V})
%%						end
%%				end;
%%			_ ->
%%				%% 完全添加新的
%%				case businessInterface:getNowVersion(ActivityType) of
%%					0 ->
%%						[];
%%					V ->
%%						[#recBusiness{activityType = ActivityType, version = V}]
%%				end
%%		end,
%%	case BList /= NList of
%%		true ->
%%			playerPropSync:setAny(?SerProp_Business, NList),
%%			?INFO("checkAndReset [~p] ActivityType=~p ~p -> ~p",
%%				[playerState:getRoleID(), ActivityType, BList, NList]);
%%		_ ->
%%			skip
%%	end,
%%	NList.
%%
%%getNextResetTime(NowTime, 1) ->
%%	%% 按天重置
%%	misc_time:getDayBeginSeconds(time2:convertSecToDateTime(NowTime)) + ?ResetTimeHour * 3600 + 24 * 3600;
%%getNextResetTime(NowTime, 2) ->
%%	%% 按周重置
%%	misc_time:getWeekBeginSecondsByDay(time2:convertSecToDateTime(NowTime)) + ?ResetTimeHour * 3600 + 24 * 7 * 3600;
%%getNextResetTime(NowTime, 3) ->
%%	%% 按月重置
%%	{{Year,Month,_Day}, {_Hour,_Minute,_Second}} = time2:convertSecToDateTime(NowTime),
%%	{Year2, Month2} =
%%		case Month of
%%			12 -> {Year + 1, 1};
%%			_ -> {Year, Month + 1}
%%		end,
%%	time2:convertDateTimeToSec({{Year2,Month2,1},{?ResetTimeHour,0,0}});
%%getNextResetTime(NowTime, _RType) ->
%%	%% 按十年重置
%%	NowTime + 3600 * 24 * 365 * 10.
%%
%%%% 发送商业化内容给客户端
%%sendBusinessInfoToClient() ->
%%	case core:isCross() of
%%		false ->
%%			%% 大于结束时间的，就不发给客户端了
%%			Time = businessInterface:getLocalTimestampSec(),
%%			F =
%%				fun(#rec_business{endTime = ETime} = Business, AccList) ->
%%					case Time < ETime of
%%						true ->
%%							[businessInterface:getProtocolInfo(Business) | AccList];
%%						_ ->
%%							AccList
%%					end
%%				end,
%%			List = ets:foldl(F, [], ets_business),
%%			ListSort = lists:sort(fun(#pk_Business{id = ID1},#pk_Business{id = ID2}) -> ID1 < ID2 end ,List),
%%			playerMsg:sendNetMsg(#pk_GS2U_BusinessInfo{lists = ListSort});
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%%% 是否开启
%%isOpen(?BusinessType_FirstRecharge) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_FirstRecharge);
%%isOpen(?BusinessType_GrowUpActive) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_GrowUpActive);
%%isOpen(?BusinessType_GrowUpGet) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_GrowUpGet);
%%isOpen(?BusinessType_Accumulate) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_Accumulate);
%%isOpen(?BusinessType_Accumulate2) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_Accumulate2);
%%isOpen(?BusinessType_Consume) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_Consume);
%%isOpen(?BusinessType_CashGift) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_CashGift);
%%isOpen(?BusinessType_DayGift) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_DayGift);
%%isOpen(?BusinessType_First) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_Fisrt);
%%isOpen(?BusinessType_Mall) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_MallRecharge);
%%isOpen(?BusinessType_Vip) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Vip);
%%isOpen(?BusinessType_WebMall) ->
%%	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_WebMallRecharge);
%%isOpen(_) -> false.
%%
%%%% 检查充值
%%checkRecharge(Ret, #rec_business{claimGold = 0}, #recBusiness{}) ->
%%	Ret;
%%checkRecharge(true, #rec_business{claimGold = NeedGold}, #recBusiness{claimGold = Gold}) ->
%%	Gold >= NeedGold;
%%checkRecharge(_, _, _) -> false.
%%
%%%% 检查消费
%%checkConsume(Ret, #rec_business{claimConsumeType = 0}, #recBusiness{}) ->
%%	Ret;
%%checkConsume(Ret, #rec_business{claimConsume = 0}, #recBusiness{}) ->
%%	Ret;
%%checkConsume(Ret, #rec_business{}, #recBusiness{claimConsume = []}) ->
%%	Ret;
%%checkConsume(true, #rec_business{claimConsumeType = NType, claimConsume = NValue}, #recBusiness{claimConsume = Consumes}) ->
%%	case lists:keyfind(NType, #recBusinessConsume.moneyType, Consumes) of
%%		#recBusinessConsume{moneyValue = Value} when Value >= NValue -> true;
%%		false -> true;
%%		_ -> false
%%	end;
%%checkConsume(_, _, _) -> false.
%%
%%%% 检查次数
%%checkNumber(Ret, #rec_business{claimNum = 0}, #recBusiness{}) ->
%%	Ret;
%%checkNumber(Ret, #rec_business{}, #recBusiness{claimNum = []}) ->
%%	Ret;
%%checkNumber(true, #rec_business{id = ID, claimNum = MaxNum}, #recBusiness{claimNum = Nums}) ->
%%	case lists:keyfind(ID, #recBusinessBuy.id, Nums) of
%%		#recBusinessBuy{number = Number} when MaxNum > Number -> true;
%%		false -> true;
%%		_ -> false
%%	end;
%%checkNumber(_, _, _) -> false.
%%
%%%% 检查特权卡
%%checkVip(Ret, #rec_business{claimVip = 0}, #recBusiness{}) ->
%%	Ret;
%%checkVip(true, #rec_business{claimVip = NVipLvl}, #recBusiness{}) ->
%%	playerVip:checkVip(NVipLvl);
%%checkVip(_, _, _) -> false.
%%
%%%% 检查开服基金到期时间
%%checkGrowUp(Ret, #rec_business{claimIsBuy = 0}, #recBusiness{}) ->
%%	Ret;
%%checkGrowUp(true, #rec_business{}, #recBusiness{}) ->
%%	case businessInterface:getNowVersion(?BusinessType_GrowUpActive) of
%%		0 ->
%%			false;
%%		Version ->
%%			playerPropSync:getProp(?SerProp_GrowUpMoney) =:= Version
%%	end;
%%checkGrowUp(_, _, _) -> false.
%%
%%%% 检查等级需求
%%checkPlayerLevel(Ret, #rec_business{claimLevel = 0}, #recBusiness{}) ->
%%	Ret;
%%checkPlayerLevel(true, #rec_business{claimLevel = NeedLevel}, #recBusiness{}) ->
%%	playerState:getLevel() >= NeedLevel;
%%checkPlayerLevel(_, _, _) -> false.
%%
%%%% 是否是充值的活动
%%isRechargeActivity(?BusinessType_FirstRecharge) -> true;
%%isRechargeActivity(?BusinessType_GrowUpActive) -> true;
%%isRechargeActivity(?BusinessType_Accumulate) -> true;
%%isRechargeActivity(?BusinessType_Accumulate2) -> true;
%%isRechargeActivity(?BusinessType_CashGift) -> true;
%%isRechargeActivity(?BusinessType_DayGift) -> true;
%%isRechargeActivity(?BusinessType_First) -> true;
%%isRechargeActivity(?BusinessType_Mall) -> true;
%%isRechargeActivity(?BusinessType_Vip) -> true;
%%isRechargeActivity(?BusinessType_WebMall) -> true;
%%isRechargeActivity(_) -> false.
%%
%%%% 有奖活动
%%%% 除了这些活动，其它活动累积计数没有奖励
%%isGiftActivity(?BusinessType_FirstRecharge) -> true;
%%isGiftActivity(?BusinessType_GrowUpActive) -> true;
%%isGiftActivity(?BusinessType_GrowUpGet) -> true;
%%isGiftActivity(?BusinessType_Accumulate) -> true;
%%isGiftActivity(?BusinessType_Accumulate2) -> true;
%%isGiftActivity(?BusinessType_CashGift) -> true;
%%isGiftActivity(?BusinessType_DayGift) -> true;
%%isGiftActivity(?BusinessType_First) -> true;
%%isGiftActivity(?BusinessType_Consume) -> true;
%%isGiftActivity(?BusinessType_Mall) -> true;
%%isGiftActivity(?BusinessType_Vip) -> true;
%%isGiftActivity(?BusinessType_WebMall) -> true;
%%isGiftActivity(_) -> false.
%%
%%%% 需要领奖的活动
%%%% 除了这些活动，其它的有奖活动在达到领奖条件时会主动发奖
%%%% 无论是否有奖，都需要根据isAlonePay的规则记录累积计数
%%isGiftActivityNeedRequest(?BusinessType_FirstRecharge) -> true;
%%isGiftActivityNeedRequest(?BusinessType_GrowUpGet) -> true;
%%isGiftActivityNeedRequest(?BusinessType_Accumulate) -> true;
%%isGiftActivityNeedRequest(?BusinessType_Accumulate2) -> true;
%%isGiftActivityNeedRequest(?BusinessType_Consume) -> true;
%%isGiftActivityNeedRequest(_) -> false.
%%
%%%% 另，business.claimRecharge也有歧义
%%%% 1.描述为领奖条件（充值量）
%%%% 2.描述为充值时对应的钻石累积数量
%%
%%
%%
%%%%%-------------------------------------------------------------------
%%%% 修复丢失的10号活动数据
%%%% 事故描述：
%%%%     当地时间 2018/10/9 23:54:11， 北京时间 2018/10/10 11:54:11， 北美重置了1服所有商业化配置
%%%%     霍丽担心影响玩家数据，向梅天阳求证
%%%%     梅天阳以为仅重置版本号功能才会影响版本号，重置配置功能不会影响版本号，因此没有引起重视
%%%%     北京时间 2018/10/11，我们对北美正式服进行了热更后，有玩家反馈首充、荣耀礼赞活动数据被重置，才暴露了问题
%%%% 处理方式：
%%%%     各方讨论后，决定根据充值表，补充事故时间前充值产生的荣耀礼赞积累值
%%%%     首充、荣耀礼赞被重置的领奖状态不用处理，这部分当做给玩家的福利补偿
%%%%     GM后台提高重置商业化版本功能所需权限级别，减少误操作可能性
%%-define(BusinessIDForFixLostBusiness10,     10001).
%%-define(ActivityTypeForFixLostBusiness10,   10).    %% ?BusinessIDForFixLostBusiness10对应的活动类型，为 div 1000 的值
%%-spec fixLostBusiness10() -> no_return().
%%fixLostBusiness10() ->
%%	RoleID = playerState:getRoleID(),
%%	case ets:lookup(ets_business, ?BusinessIDForFixLostBusiness10) of
%%		[#rec_business{version = VersionCommon}] ->
%%			ListBusiness = playerPropSync:getProp(?SerProp_Business),
%%			Business =
%%				case lists:keyfind(?ActivityTypeForFixLostBusiness10, #recBusiness.activityType, ListBusiness) of
%%					#recBusiness{version = VersionPlayer_, claimMoney = OldMoney, claimGold = OldGold} = Business_ ->
%%						?INFO(
%%							"fixLostBusiness10 data fix RoleID:~w VersionCommon:~w VersionPlayer:~w"
%%							" CurrencyMoneyAmount:~w GameMoneyAmount:~w",
%%							[RoleID, VersionCommon, VersionPlayer_, OldMoney, OldGold]
%%						),
%%						Business_#recBusiness{version = VersionCommon};
%%					_ ->
%%						?INFO(
%%							"fixLostBusiness10 data fix RoleID:~w VersionCommon:~w VersionPlayer:~w"
%%							" CurrencyMoneyAmount:~w GameMoneyAmount:~w",
%%							[RoleID, VersionCommon, false, 0.0, 0]
%%						),
%%						#recBusiness{activityType = ?ActivityTypeForFixLostBusiness10, version = VersionCommon}
%%				end,
%%			Q = ets:fun2ms(fun(#recRecharge{roleID = RoleID_, status = Status} = R)
%%				when RoleID =:= RoleID_ andalso Status =:= ?RECHARGE_STATE_GIVE -> R end),
%%			ListRecharge = ets:select(?EtsRecharge, Q),
%%			{NewMoney, NewGold} = fixLostBusiness10(ListRecharge, 0.0, 0),
%%			ListBusinessNew =
%%				lists:keystore(
%%					?ActivityTypeForFixLostBusiness10,
%%					#recBusiness.activityType,
%%					ListBusiness,
%%					Business#recBusiness{claimMoney = NewMoney, claimGold = NewGold}
%%				),
%%			playerPropSync:setAny(?SerProp_Business, ListBusinessNew),
%%			?INFO(
%%				"fixLostBusiness10 data fix OK!!! RoleID:~w VersionCommon:~w VersionPlayer:~w"
%%				" CurrencyMoneyAmount:~w GameMoneyAmount:~w",
%%				[RoleID, VersionCommon, VersionCommon, NewMoney, NewGold]
%%			);
%%		_ ->
%%			%% 活动已下架，无法补偿
%%			?INFO(
%%				"fixLostBusiness10 can not fix!!! RoleID:~w can not find BusinessID:~w",
%%				[RoleID, ?BusinessIDForFixLostBusiness10]
%%			)
%%	end.
%%
%%-spec fixLostBusiness10(
%%	ListRecharge::[#recRecharge{}, ...], ClaimMoney::float(), ClaimGold::uint()
%%) ->
%%	{float(), uint()}.
%%fixLostBusiness10([], ClaimMoney, ClaimGold) ->
%%	{ClaimMoney, trunc(ClaimGold)};
%%fixLostBusiness10(
%%	[#recRecharge{businessID = BusinessID, currencyMoneyAmount = CurrencyMoneyAmount, gameMoneyAmount = GameMoneyAmount} | T],
%%	ClaimMoney, ClaimGold
%%) ->
%%	case ets:lookup(ets_business, BusinessID) of
%%		[#rec_business{isAlonePay = IsAlonPay, claimGold = GameMoneyAmount2}] when IsAlonPay =/= ?IsAlone_Private ->
%%			case GameMoneyAmount of
%%				0 ->
%%					fixLostBusiness10(T, ClaimMoney + CurrencyMoneyAmount, ClaimGold + GameMoneyAmount2);
%%				_ ->
%%					fixLostBusiness10(T, ClaimMoney + CurrencyMoneyAmount, ClaimGold + GameMoneyAmount)
%%			end;
%%		_ ->
%%			fixLostBusiness10(T, ClaimMoney, ClaimGold)
%%	end.
%%
%%%% 20181016 【韩国】 1、首充第二档版本号异常，可能导致重置。2、消费返利预约配置断档，可能导致清空全部商业化内容。
%%%% 解决可能全部还原的BUG，并且修复首充数据。
%%-spec fixLostBusiness1() -> ok.
%%fixLostBusiness1() ->
%%	RoleID = playerState:getRoleID(),
%%	ListBusiness = playerPropSync:getProp(?SerProp_Business),
%%	case businessInterface:getNowVersion(?BusinessType_FirstRecharge) of
%%		0 ->
%%			%% 活动已下架，无法补偿
%%			?INFO(
%%				"fixLostBusiness1 can not fix!!! RoleID:~w can not find BusinessType:~w",
%%				[RoleID, ?BusinessType_FirstRecharge]
%%			);
%%		VersionCommon ->
%%			Business =
%%				case lists:keyfind(?BusinessType_FirstRecharge, #recBusiness.activityType, ListBusiness) of
%%					#recBusiness{version = VersionPlayer_, claimMoney = OldMoney, claimGold = OldGold} = Business_ ->
%%						?INFO(
%%							"fixLostBusiness1 data fix RoleID:~w VersionCommon:~w VersionPlayer:~w"
%%							" CurrencyMoneyAmount:~w GameMoneyAmount:~w",
%%							[RoleID, VersionCommon, VersionPlayer_, OldMoney, OldGold]
%%						),
%%						Business_#recBusiness{version = VersionCommon};
%%					_ ->
%%						?INFO(
%%							"fixLostBusiness1 data fix RoleID:~w VersionCommon:~w VersionPlayer:~w"
%%							" CurrencyMoneyAmount:~w GameMoneyAmount:~w",
%%							[RoleID, VersionCommon, false, 0.0, 0]
%%						),
%%						#recBusiness{activityType = ?BusinessType_FirstRecharge, version = VersionCommon}
%%				end,
%%			Q = ets:fun2ms(fun(#recRecharge{roleID = RoleID_, status = Status} = R)
%%				when RoleID =:= RoleID_ andalso Status =:= ?RECHARGE_STATE_GIVE -> R end),
%%			ListRecharge = ets:select(?EtsRecharge, Q),
%%			{NewMoney, NewGold} = fixLostBusiness10(ListRecharge, 0.0, 0),
%%			ListBusinessNew =
%%				lists:keystore(
%%					?BusinessType_FirstRecharge,
%%					#recBusiness.activityType,
%%					ListBusiness,
%%					Business#recBusiness{claimMoney = NewMoney, claimGold = NewGold}
%%				),
%%			playerPropSync:setAny(?SerProp_Business, ListBusinessNew),
%%			?INFO(
%%				"fixLostBusiness1 data fix OK!!! RoleID:~w VersionCommon:~w VersionPlayer:~w"
%%				" CurrencyMoneyAmount:~w GameMoneyAmount:~w",
%%				[RoleID, VersionCommon, VersionCommon, NewMoney, NewGold]
%%			)
%%	end.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%GM模拟充值%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%gmRechargeTemStorage(RoleID, Item_ID, AddMoney) ->
%%	% 角色不在线，帮忙改写内存值并写入DB
%%	case ets:lookup(ets_rec_playerdata, RoleID) of
%%		[#rec_playerdata{rec_player_prop = LP0}] ->
%%			NewInfo = case lists:keyfind(?SerProp_GMRechargeOfflineTemStorage, #rec_player_prop.propIndex, LP0) of
%%				false ->
%%					#rec_player_prop{roleID = RoleID, propIndex = ?SerProp_NewFashionInfo, propValue = misc:term_to_string([{Item_ID, AddMoney}])};
%%				#rec_player_prop{propValue = Value} = OldInfo ->
%%					OloList = misc:string_to_term(Value),
%%					OldInfo#rec_player_prop{propValue =misc:term_to_string([{Item_ID, AddMoney} | OloList])}
%%			end,
%%			NewLP = lists:keystore(?SerProp_GMRechargeOfflineTemStorage, #rec_player_prop.propIndex, LP0,NewInfo),
%%			%% 写入同步属性的内存数据
%%			ets:update_element(ets_rec_playerdata, RoleID, [{#rec_playerdata.rec_player_prop, NewLP}]),
%%			%% 通知DB写入
%%			gsSendMsg:sendMsg2DBServer(commonSavePlayerProp, 0, [NewInfo]);
%%		_ ->
%%			skip
%%	end.
%%
%%dealTemGMRecharge() ->
%%	TemChargeList = playerPropSync:getProp(?SerProp_GMRechargeOfflineTemStorage),
%%	doTemGMRecharge(TemChargeList).
%%
%%doTemGMRecharge([]) ->
%%	ok;
%%doTemGMRecharge([Data | TailList]) ->
%%	gmSimulateRecharge(Data),
%%	doTemGMRecharge(TailList).
%%
%%gmSimulateRecharge({Item_ID, AddMoney}) ->
%%	playerRecharge:gmSimulateaddCoin(AddMoney),
%%	%% 获取活动ID
%%	BusinessID = businessInterface:queryBusinessID(Item_ID),
%%	case ets:lookup(ets_business, BusinessID) of
%%		[#rec_business{claimMoney = ClaimMoney, claimGold = ValueB}] ->
%%			%% 有的充值可能只给礼包，不发货币，即Value=0，那么就要取实际的配置货币
%%			gmSimulateRecharge2(BusinessID, ClaimMoney, ValueB);
%%		_ ->
%%			% 有可能是过期了 有可能是参数不对
%%			?INFO("gmSimulateRecharge not find the item_id's business: ~p ~n", [Item_ID])
%%	end,
%%	ok.
%%
%%gmSimulateRecharge2(ID, Money, Value) ->
%%	?INFO("gmSimulateRecharge2 roleID:~p, ID:~p Money:~p, Value:~p ~n", [playerState:getRoleID(), ID, Money, Value]),
%%
%%	%% 先增加本身的充值
%%	gmSimulateRecharge3(ID, Money, Value, ID),
%%
%%	%% 根据isAlonePay判断是否对其它项累积充值
%%	case ets:lookup(ets_business, ID) of
%%		[#rec_business{isAlonePay = ?IsAlone_Private}] ->
%%			skip;
%%		[#rec_business{activityType = Type}] ->
%%			Select = ets:fun2ms(
%%				fun(#rec_business{activityType = Type_, isAlonePay = IsAlonePay} = R)
%%					when Type =/= Type_, IsAlonePay =:= ?IsAlone_Public ->
%%					R
%%				end
%%			),
%%			List = lists:filter(fun(#rec_business{} = Business) -> businessInterface:isValid(Business) end, ets:select(ets_business, Select)),
%%			FunFilter =
%%				fun(#rec_business{id = ID_, activityType = Type_}, Acc) ->
%%					case lists:keyfind(Type_, 1, Acc) of
%%						false ->
%%							recharge3(ID_, Money, Value, ID),
%%							[{Type_, ID_} | Acc];
%%						_ ->
%%							Acc
%%					end
%%				end,
%%			lists:foldl(FunFilter, [], lists:keysort(#rec_business.id, List));
%%		_ ->
%%			skip
%%	end.
%%
%%checkCondition(#rec_business{activityType = ActivityType} = Need) ->
%%	Ret  = isRecharge({true, 0}, ActivityType),
%%	Ret2 = isHasopen(Ret, ActivityType),
%%	isValidAct(Ret2, Need).
%%
%%isRecharge({false, _} = Ret, _ActivityType) ->
%%	Ret;
%%isRecharge(_Ret, ActivityType) ->
%%	case isRechargeActivity(ActivityType) of
%%		true ->
%%			{true, 0};
%%		_ ->
%%			{false, -2}
%%	end.
%%
%%isHasopen({false, _} = Ret, _ActivityType) ->
%%	Ret;
%%isHasopen(_Ret, ActivityType) ->
%%	case isOpen(ActivityType) of
%%		true ->
%%			{true, 0};
%%		_ ->
%%			{false, -3}
%%	end.
%%
%%isValidAct({false, _} = Ret, _Need) ->
%%	Ret;
%%isValidAct(_Ret, Need) ->
%%	case businessInterface:isValid(Need) of
%%		true ->
%%			{true, 0};
%%		_ ->
%%			{false, -4}
%%	end.
%%
%%gmSimulateRecharge3(ID, Money, Value, FromID) ->
%%	{FromType, FromGiveGold, FromIsAddClaimGold} = case ets:lookup(ets_business, FromID) of
%%		[#rec_business{activityType = FromType_, giveGold = FromGiveGold_, isAddClaimGold = FromIsAddClaimGold_}] ->
%%			{FromType_, FromGiveGold_, FromIsAddClaimGold_};
%%		_ ->
%%			{0 ,0 ,0}
%%	end,
%%
%%	?INFO("gmSimulateRecharge3 roleID:~p, ID:~p Money:~p, Value:~p, FromID:~p", [playerState:getRoleID(), ID, Money, Value, FromID]),
%%
%%	{Log, AType} = case ets:lookup(ets_business, ID) of
%%		[#rec_business{version = Version, activityType = ActivityType, resetClaimNumType = RType} = Need] ->
%%			Reason = case checkCondition(Need) of
%%				{true, _} ->
%%					%% 记录成长基金购买状态
%%					case ActivityType of
%%						?BusinessType_GrowUpActive ->
%%							playerPropSync:setInt(?SerProp_GrowUpMoney, Version);
%%						_ ->
%%							skip
%%					end,
%%
%%					%% 非充值的活动ID可以领取
%%					List = getCheckResetBusinessList(ActivityType),
%%
%%					case lists:keyfind(ActivityType, #recBusiness.activityType, List) of
%%						false ->
%%							-12;
%%						#recBusiness{claimMoney = OldMoney, claimGold = OldGold} = Business0 ->
%%							Business = case FromType =:= ?BusinessType_CashGift orelse FromType =:= ?BusinessType_DayGift orelse FromType =:= ?BusinessType_Mall orelse FromType =:= ?BusinessType_Vip of
%%								true ->
%%									case FromIsAddClaimGold of
%%										?AddClaimGold ->
%%											%% 记录充值金额(加上额外赠送的钻石数)
%%											Business0#recBusiness{claimMoney = OldMoney + Money, claimGold = OldGold + Value + FromGiveGold};
%%										_ ->
%%											%% 记录充值金额(不加额外赠送的钻石数)
%%											Business0#recBusiness{claimMoney = OldMoney + Money, claimGold = OldGold + Value}
%%									end;
%%								_ ->
%%									%% 记录充值金额
%%									Business0#recBusiness{claimMoney = OldMoney + Money, claimGold = OldGold + Value}
%%							end,
%%
%%							%% 判断是不是直接发奖的
%%							Ret = case isGiftActivity(ActivityType) of
%%								true ->
%%									case isGiftActivityNeedRequest(ActivityType) of
%%										false ->
%%											NeedGift =
%%												case ActivityType of
%%													?BusinessType_Mall ->
%%														FromType =:= ActivityType;
%%													?BusinessType_WebMall ->
%%														FromType =:= ActivityType;
%%													_ ->
%%														true
%%												end,
%%											%% 直接发奖
%%											Ret1 = checkRecharge(NeedGift, Need, Business),
%%											Ret2 = checkConsume(Ret1, Need, Business),
%%											Ret3 =
%%												case (FromType =:= ?BusinessType_CashGift orelse FromType =:= ?BusinessType_DayGift orelse FromType =:= ?BusinessType_Mall orelse FromType =:= ?BusinessType_Vip) andalso ActivityType =:= FromType of
%%													true ->
%%														%%额外送钻石只要配置数量大于0则生效(不限制次数)
%%														case FromGiveGold > 0 of
%%															true ->
%%																true;
%%															_ ->
%%																checkNumber(Ret2, Need, Business)
%%														end;
%%													_ ->
%%														checkNumber(Ret2, Need, Business)
%%												end,
%%
%%											%%Ret3 = checkNumber(Ret2, Need, Business),
%%											Ret4 = checkVip(Ret3, Need, Business),
%%											Ret5 = checkGrowUp(Ret4, Need, Business),
%%											Ret6 = checkPlayerLevel(Ret5, Need, Business),
%%											case Ret6 of
%%												true ->
%%													NewBuy =
%%														case lists:keyfind(ID, #recBusinessBuy.id, Business#recBusiness.claimNum) of
%%															#recBusinessBuy{number = OldNumber} = Buy ->
%%																Buy#recBusinessBuy{number = OldNumber + 1};
%%															_ ->
%%																Time = businessInterface:getLocalTimestampSec(),
%%																NTime = getNextResetTime(Time, RType),
%%																#recBusinessBuy{id = ID, number = 1, time = NTime}
%%														end,
%%													BuyL = lists:keystore(ID, #recBusinessBuy.id, Business#recBusiness.claimNum, NewBuy),
%%													NewList = lists:keystore(ActivityType, #recBusiness.activityType, List, Business#recBusiness{claimNum = BuyL}),
%%													playerPropSync:setAny(?SerProp_Business, NewList),
%%
%%													gmSimulateRewardItems(Need, Money, Value),
%%													1;
%%												_ ->
%%													%% 不发奖，但是要累积充值
%%													NewList = lists:keystore(ActivityType, #recBusiness.activityType, List, Business),
%%													playerPropSync:setAny(?SerProp_Business, NewList),
%%
%%													if
%%														not Ret1 -> -5;
%%														not Ret2 -> -6;
%%														not Ret3 -> -7;
%%														not Ret4 -> -8;
%%														not Ret5 -> -9;
%%														not Ret6 -> -10;
%%														true -> -11
%%													end
%%											end;
%%										_ ->
%%											%% 需要他自己领取的
%%											NewList1 = lists:keystore(ActivityType, #recBusiness.activityType, List, Business),
%%											playerPropSync:setAny(?SerProp_Business, NewList1),
%%											13
%%									end;
%%								_ ->
%%									%% 没奖，但是要计数
%%									NewList2 = lists:keystore(ActivityType, #recBusiness.activityType, List, Business),
%%									playerPropSync:setAny(?SerProp_Business, NewList2),
%%									14
%%							end,
%%							%% 刷新客户端
%%							requestBusinessInfo(ActivityType),
%%							Ret
%%					end;
%%				{_ , Err} ->
%%					Err
%%			end,
%%				{Reason, ActivityType};
%%			_ ->
%%				{-1, 0}
%%		end,
%%	%% 处理购买VIP的情况
%%	case ID div ?BusinessDiv of
%%		?BusinessType_Vip -> playerVip:buy(ID);
%%		_ -> skip
%%	end,
%%
%%	?INFO("player gmSimulateRecharge3 roleID:~p,ActivityID:~p,Money:~p,Diamond:~p,Ret:~p",
%%		[playerState:getRoleID(), ID, Money, Value, Log]),
%%
%%	LogR = #rec_log_business{
%%		roleID = playerState:getRoleID(),				%% bigint(20) unsigned
%%		activityID = ID,				%% int(10) unsigned
%%		activityType = AType,				%% tinyint(3) unsigned
%%		money = Money,				%%充值的货币 float
%%		diamond = Value,				%%充值的钻石 int(11)
%%		rechargeOrGift = 3,				%%1充值，2领取 tinyint(3) 3 GM模拟充值 unsigned
%%		result = Log				%%结果 tinyint(4)
%%	},
%%	dbLog:sendSaveBusiness(LogR),
%%	ok.
%%
%%gmSimulateRewardItems(#rec_business{id = ID, activityType = ActivityType, rewardCoinType = RewardCoinType, rewardCoinNum = RewardCoinNum, giveGold = GiveGold} = Business, Money, Value) ->
%%	%%List0 = getItemList([], Business#rec_business.rewardPackageID, 1, 0),
%%	List1 = getItemList([], Business#rec_business.item1, Business#rec_business.num1, 1),
%%	List2 = getItemList(List1, Business#rec_business.item2, Business#rec_business.num2, 2),
%%	List3 = getItemList(List2, Business#rec_business.item3, Business#rec_business.num3, 3),
%%	List4 = getItemList(List3, Business#rec_business.item4, Business#rec_business.num4, 4),
%%	List5 = getItemList(List4, Business#rec_business.item5, Business#rec_business.num5, 5),
%%	List6 = getItemList(List5, Business#rec_business.item6, Business#rec_business.num6, 6),
%%	List7 = getItemList(List6, Business#rec_business.item7, Business#rec_business.num7, 7),
%%	List8 = getItemList(List7, Business#rec_business.item8, Business#rec_business.num8, 8),
%%	List9 = getItemList(List8, Business#rec_business.item9, Business#rec_business.num9, 9),
%%	List10 = getItemList(List9, Business#rec_business.item10, Business#rec_business.num10, 10),
%%
%%	F =
%%		fun(#pk_ActivitySuccessItem{itemID = ItemID, num = ItemNum}) ->
%%			PLog = #recPLogTSItem{
%%				old = 0,
%%				new = 1,
%%				change = 1,
%%				target = ?PLogTS_PlayerSelf,
%%				source = ?PLogTS_GMSimulateRecharge,
%%				gold = 0,
%%				goldtype = 0,
%%				changReason = ?ItemSourceGMSimulateRecharge,
%%				reasonParam = ItemID
%%			},
%%			playerPackage:addGoodsAndMail(ItemID, ItemNum, false, 0, PLog)
%%		end,
%%	lists:foreach(F, List10),
%%	CoinList =
%%		case ActivityType =:= ?BusinessType_CashGift orelse ActivityType =:= ?BusinessType_DayGift orelse ActivityType =:= ?BusinessType_Mall orelse ActivityType =:= ?BusinessType_Vip of
%%			true ->
%%				%%只要配置了额外钻石就会覆盖原来配置的赠送星月币(只发赠送钻石,不会发赠送的星月币)
%%				case GiveGold > 0 of
%%					true ->
%%						case playerMoney:addCoin(?CoinTypeDiamond, GiveGold,
%%							#recPLogTSMoney{reason = ?CoinSourceGMSimulateRecharge1, param = integer_to_list(ID), target = ?PLogTS_PlayerSelf, source = ?PLogTS_GMSimulateRecharge}) of
%%							true ->
%%								[#pk_CoinConsume{coinType = ?CoinTypeDiamond, value = GiveGold}];
%%							_ ->
%%								?ERROR("giveGold addgold error:~p,~p", [playerState:getRoleID(), Business]),
%%								[]
%%						end;
%%					_ ->
%%						%%没有配置额外钻石,原有配置赠送星月币生效(发赠送的星月币)
%%						case (RewardCoinType =:= ?CoinTypeDiamond orelse RewardCoinType =:= ?CoinTypeBindDiamond) andalso RewardCoinNum > 0 of
%%							true ->
%%								case playerMoney:addCoin(?CoinTypeBindDiamond, RewardCoinNum,
%%									#recPLogTSMoney{reason = ?CoinSourceGMSimulateRecharge2, param = integer_to_list(ID), target = ?PLogTS_PlayerSelf, source = ?PLogTS_GMSimulateRecharge}) of
%%									true ->
%%										[#pk_CoinConsume{coinType = RewardCoinType, value = RewardCoinNum}];
%%									_ ->
%%										?ERROR("rewardItems addcoin error:~p,~p", [playerState:getRoleID(), Business]),
%%										[]
%%								end;
%%							_ ->
%%								[]
%%						end
%%				end;
%%			_ ->
%%				case (RewardCoinType =:= ?CoinTypeDiamond orelse RewardCoinType =:= ?CoinTypeBindDiamond) andalso RewardCoinNum > 0 of
%%					true ->
%%						case playerMoney:addCoin(?CoinTypeBindDiamond, RewardCoinNum,
%%							#recPLogTSMoney{reason = ?CoinSourceGMSimulateRecharge2, param = integer_to_list(ID), target = ?PLogTS_PlayerSelf, source = ?PLogTS_GMSimulateRecharge}) of
%%							true ->
%%								[#pk_CoinConsume{coinType = RewardCoinType, value = RewardCoinNum}];
%%							_ ->
%%								?ERROR("rewardItems addcoin error:~p,~p", [playerState:getRoleID(), Business]),
%%								[]
%%						end;
%%					_ ->
%%						[]
%%				end
%%		end,
%%
%%	Msg = #pk_GS2U_RechargeSuccess{id = ID, activityType = ActivityType, claimGold = 0, claimMoney = Money, coins = CoinList, items = List10},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.