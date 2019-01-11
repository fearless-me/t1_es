%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 八月 2018 16:41
%%%-------------------------------------------------------------------
-module(playerDeadlineGift).
-author("Administrator").

-include("gsInc.hrl").
-include("playerPrivate.hrl").
-include("cfg_deadline_gift.hrl").


%% API
-export([
	msg/1, 				%% 协议处理
	init/0,				%% 上线初始化
	enterMap/1,
	updateCondition/2  %% 触发更新
]).

msg(Msg) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_DeadlineGift) of
		true ->
			msgReal(Msg);
		_ ->
			skip
	end.

init() ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_DeadlineGift) of
		true ->
			%% 存入最新的可用礼包内容
			saveDeadlineGiftState(0, 0),
			sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenOnline);
		_ ->
			skip
	end.

enterMap(MapID) ->
	case core:isCross() of
		false ->
			case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_DeadlineGift) of
				true ->
					case playerScene:getMapType(MapID) of
						?MapTypeNormal ->
							case playerPropSync:getProp(?SerProp_DeadlineGiftStateNeedToPopup) of
								1 ->
									sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenStart);
								_ ->
									skip
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

msgReal(#pk_U2GS_DeadLineGiftBuy{id = ID, giftID = GiftID, itemBuyNum = ItemBuyNum}) ->
	deadLineGiftBuyReq(ID, GiftID, ItemBuyNum),
	ok;
msgReal(#pk_U2GS_DeadLineGiftOpen{}) ->
	sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenOpen),
	ok.

%% GM deadlineGiftUpdate(Type, NewTypeNum)
updateCondition(Type, NewTypeNum) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_DeadlineGift) of
		true ->
			case checkIsUpdate(Type, NewTypeNum) of
				{[], _HaveOpenList} ->
					skip;
				{KeyList, HaveOpenList} ->
					doUpdateCondition(KeyList, HaveOpenList),
					sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenStart),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%% 此处判断是否有新触发的直购礼包
checkIsUpdate(Type, NewTypeNum) ->
	%% 1.取配置列表
	%% 2.根据 SerProp_DeadlineGiftStart 去除已达到的
	%% 3.根据 Type 去除触发类型不同的
	%% 4.循环 2,3生成的列表 判断触发条件 生成 新达到的列表
	HaveOpenList = playerPropSync:getProp(?SerProp_DeadlineGiftStart),
	Fun =
		fun({ID}) ->
			case getCfg:getCfgByKey(cfg_deadline_gift, ID) of
				#deadline_giftCfg{type = Type, type_num = ThisTypeNum} ->
					case lists:keymember({ID} ,1, HaveOpenList) of
						false ->
							NewTypeNum >= ThisTypeNum;
						_ ->
							false
					end;
				_ ->
					false
			end
		end,

	{lists:filter(Fun, getCfg:getKeyList(cfg_deadline_gift)), HaveOpenList}.
%%	%% 5.判断 4生成的列表是否为空
%%	%% 6.如达到多个, 只取最后一条
%%	case KeyList of
%%		[] ->
%%			0;
%%		_ ->
%%			lists:last(KeyList)
%%	end.

%% 此处记录新触发的直购礼包
doUpdateCondition([], HaveOpenList) ->
	playerPropSync:setAny(?SerProp_DeadlineGiftStart,HaveOpenList),
	saveDeadlineGiftState(HaveOpenList, 0);
doUpdateCondition([ID | RestKeyList], HaveOpenList) ->
	doUpdateCondition(RestKeyList, HaveOpenList ++ [{ID, time2:getLocalTimestampSec()}]).

sendNewDeadlineGiftMsg(Code) ->
	TimeNow = time2:getLocalTimestampSec(),
	Fun =
		fun(DeadlineGift) ->
			case DeadlineGift of
				#pk_DeadlineGift{startTime = StartTime, remainTime = RemainTime} ->
					StartTime + RemainTime >= TimeNow;
				_ ->
					false
			end
		end,
	CodeMsg = lists:filter(Fun, playerState2:getDeadlineGiftState()),

	case CodeMsg of
		[] ->
			skip;
		_ ->
			%% 排序 触发时间越早的在前面
			NewCodeMsg = lists:keysort(#pk_DeadlineGift.startTime, CodeMsg),
			sendNewDeadlineGiftMsg(Code, NewCodeMsg)
	end,
	ok.
%% 发送最新的直购商品信息
sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenStart, CodeMsg) ->
	Msg = #pk_GS2U_DeadLineGiftList{
		%% UInt16直购礼包/限时礼包 消息推送Code
		code = ?DeadlineGift_Send_WhenStart,
		%% DeadlineGift直购礼包/限时礼包 玩家相关内容
		msg = CodeMsg
	},

	MapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			playerMsg:sendNetMsg(Msg),
			playerPropSync:setInt(?SerProp_DeadlineGiftStateNeedToPopup, 0);
		_ ->
			playerPropSync:setInt(?SerProp_DeadlineGiftStateNeedToPopup,1) %% 等待弹出
	end,

	ok;
%% 发送最新的直购商品信息
sendNewDeadlineGiftMsg(Code, CodeMsg) ->
	Msg = #pk_GS2U_DeadLineGiftList{
		%% UInt16直购礼包/限时礼包 消息推送Code
		code = Code,
		%% DeadlineGift直购礼包/限时礼包 玩家相关内容
		msg = CodeMsg
	},
	playerMsg:sendNetMsg(Msg),
	ok.

saveDeadlineGiftState(HaveOpenList, HaveBuyList) ->
	RealHaveOpenList =
		case HaveOpenList of
			0 ->
				playerPropSync:getProp(?SerProp_DeadlineGiftStart);
			_ ->
				HaveOpenList
		end,
	RealHaveBuyList =
		case HaveBuyList of
			0 ->
				playerPropSync:getProp(?SerProp_DeadlineGiftBuy);
			_ ->
				HaveBuyList
		end,

%%	RealHaveOpenList = playerPropSync:getProp(?SerProp_DeadlineGiftStart),
%%	RealHaveBuyList = playerPropSync:getProp(?SerProp_DeadlineGiftBuy),
	Fun =
		fun({ID}, Acc) ->
			case getCfg:getCfgByKey(cfg_deadline_gift, ID) of
				#deadline_giftCfg{
					tab_string = TabString,
					time = Time, item1 = ItemID1, item2 = ItemID2, item3 = ItemID3,
					item1_num = ItemNum1, item2_num = ItemNum2, item3_num = ItemNum3,
					item1_Discount = ItemDiscount1, item2_Discount = ItemDiscount2, item3_Discount = ItemDiscount3,
					item1_coinType = ItemCoinType1, item2_coinType = ItemCoinType2, item3_coinType = ItemCoinType3,
					item1_coinInitial = ItemCoinNum1, item2_coinInitial = ItemCoinNum2, item3_coinInitial = ItemCoinNum3,
					item1_coinNum = ItemRealCoinNum1, item2_coinNum = ItemRealCoinNum2, item3_coinNum = ItemRealCoinNum3,
					item1_name = ItemName1, item2_name = ItemName2, item3_name = ItemName3,
					item1_Counts = ItemCounts1, item2_Counts = ItemCounts2, item3_Counts = ItemCounts3,
					gift1 = Gift1, gift2 = Gift2, gift3 = Gift3,
					image = Image
					} ->
					case lists:keyfind({ID} ,1, RealHaveOpenList) of
						{{ID}, StartTime} ->
							case Time + StartTime >= time2:getLocalTimestampSec() of
								true ->
									New = #pk_DeadlineGift{
										%% UInt16(已触发)礼包ID
										id = ID,
										%% UInt32首次触发时间
										startTime = StartTime,
										%% UInt16持续时间
										remainTime = Time,
										%% String左侧页签文本
										tabString = TabString,
										%% UInt16道具1ID
										itemID1 = ItemID1,
										%% UInt16道具2ID
										itemID2 = ItemID2,
										%% UInt16道具3ID
										itemID3 = ItemID3,
										%% UInt16道具1限购数量
										itemNum1 = ItemNum1,
										%% UInt16道具2限购数量
										itemNum2 = ItemNum2,
										%% UInt16道具3限购数量
										itemNum3 = ItemNum3,
										%% UInt16道具1已购数量
										itemBuyNum1 = findHaveBuyNum(ID, Gift1, RealHaveBuyList),
										%% UInt16道具2已购数量
										itemBuyNum2 = findHaveBuyNum(ID, Gift2, RealHaveBuyList),
										%% UInt16道具3已购数量
										itemBuyNum3 = findHaveBuyNum(ID, Gift3, RealHaveBuyList),
										%% String道具1折扣显示
										itemDiscount1 = itemDiscount(ItemDiscount1),
										%% String道具2折扣显示
										itemDiscount2 = itemDiscount(ItemDiscount2),
										%% String道具3折扣显示
										itemDiscount3 = itemDiscount(ItemDiscount3),
										%% UInt16道具1货币类型
										itemCoinType1 = ItemCoinType1,
										%% UInt16道具2货币类型
										itemCoinType2 = ItemCoinType2,
										%% UInt16道具3货币类型
										itemCoinType3 = ItemCoinType3,
										%% UInt16道具1原货币数量
										itemCoinNum1 = ItemCoinNum1,
										%% UInt16道具2原货币数量
										itemCoinNum2 = ItemCoinNum2,
										%% UInt16道具3原货币数量
										itemCoinNum3 = ItemCoinNum3,
										%% UInt16道具1真实货币数量
										itemRealCoinNum1 = ItemRealCoinNum1,
										%% UInt16道具2真实货币数量
										itemRealCoinNum2 = ItemRealCoinNum2,
										%% UInt16道具3真实货币数量
										itemRealCoinNum3 = ItemRealCoinNum3,
										%% String背景图
										image = Image,
										%% String道具1名称
										itemName1 = ItemName1,
										%% String道具2名称
										itemName2 = ItemName2,
										%% String道具3名称
										itemName3 = ItemName3,
										%% UInt16道具1数量
										itemCounts1 = ItemCounts1,
										%% UInt16道具2数量
										itemCounts2 = ItemCounts2,
										%% UInt16道具3数量
										itemCounts3 = ItemCounts3,
										%% UInt16礼包1序号
										gift1 = Gift1,
										%% UInt16礼包2序号
										gift2 = Gift2,
										%% UInt16礼包3序号
										gift3 = Gift3
									},
									[New | Acc];
								_ ->
									Acc
							end;
						_ ->
							Acc
					end;
				_ ->
					Acc
			end
		end,
%%	lists:foldl(fun(X, Acc) -> case X of 1 -> Acc ++ [X]; 2 -> Acc; _ -> Acc ++ [X] end end, [], [1,2,3,4,5]),
%%	lists:map(Fun, getCfg:getKeyList(cfg_deadline_gift)),

	DeadlineGiftStateList = lists:foldl(Fun, [], getCfg:getKeyList(cfg_deadline_gift)),
	playerState2:setDeadlineGiftState(DeadlineGiftStateList),
	ok.


%% 请求购买直购礼包商品
deadLineGiftBuyReq(ID, GiftID, ItemNum) ->

	DeadlineGiftStateList = playerState2:getDeadlineGiftState(),
	findGoToBuyItemMsg(ID, GiftID, ItemNum, DeadlineGiftStateList),
	ok.

findGoToBuyItemMsg(_ID, _GiftID, _ItemNum, []) ->
	false;
findGoToBuyItemMsg(ID, GiftID, ItemNum, [H | T]) ->

	case H of
		#pk_DeadlineGift{
			startTime = StartTime, remainTime = RemainTime,
			itemNum1 = ItemNum1, itemNum2 = ItemNum2, itemNum3 = ItemNum3,
			id = ID, itemID1 = ItemID1, itemID2 = ItemID2, itemID3 = ItemID3,
			itemBuyNum1 = ItemBuyNum1, itemBuyNum2 = ItemBuyNum2, itemBuyNum3 = ItemBuyNum3,
			itemCoinType1 = ItemCoinType1, itemCoinType2 = ItemCoinType2, itemCoinType3 = ItemCoinType3,
			itemRealCoinNum1 = ItemRealCoinNum1, itemRealCoinNum2 = ItemRealCoinNum2, itemRealCoinNum3 = ItemRealCoinNum3,
			itemCounts1 = ItemCounts1, itemCounts2 = ItemCounts2, itemCounts3 = ItemCounts3, gift1 = Gift1, gift2 = Gift2, gift3 = Gift3
			} ->
				case GiftID of
					Gift1 when ItemNum1 - ItemBuyNum1 >= ItemNum ->
						doDeadLineGiftBuy(ID, GiftID, ItemID1, ItemCounts1, ItemNum, ItemCoinType1, ItemRealCoinNum1, RemainTime + StartTime);
					Gift2 when ItemNum2 - ItemBuyNum2 >= ItemNum ->
						doDeadLineGiftBuy(ID, GiftID, ItemID2, ItemCounts2, ItemNum, ItemCoinType2, ItemRealCoinNum2, RemainTime + StartTime);
					Gift3 when ItemNum3 - ItemBuyNum3 >= ItemNum ->
						doDeadLineGiftBuy(ID, GiftID, ItemID3, ItemCounts3, ItemNum, ItemCoinType3, ItemRealCoinNum3, RemainTime + StartTime);
					_ ->
						playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNumberLimit)
				end;
		_ ->
			findGoToBuyItemMsg(ID, GiftID, ItemNum, T)
	end.

doDeadLineGiftBuy(ID, GiftID, ItemID,ItemCounts, ItemNum, ItemCoinType, ItemRealCoinNum, EndTime) ->
	case EndTime >= time2:getLocalTimestampSec() of
		true ->
			RealPrice = erlang:trunc(ItemRealCoinNum * ItemNum),
			case playerMoney:canUseCoin(ItemCoinType,RealPrice) of
				true ->
					PLogMoney = #recPLogTSMoney{reason = ?CoinUseDeadLineGiftBuy, param = [], target = ?PLogTS_PlayerSelf, source = ?PLogTS_DeadlineGift},
					case playerMoney:useCoin(ItemCoinType,RealPrice, PLogMoney) of
						true->
							PLogItem =  #recPLogTSItem{
								old = 0,
								new = ItemCounts,
								change = ItemCounts,
								target = ?PLogTS_PlayerSelf,
								source = ?PLogTS_DeadlineGift,
								gold = RealPrice,
								goldtype = ItemCoinType,
								changReason = ?ItemSourceDeadLineGiftBuy
							},
							addNewDeadlineGiftBuyProp(ID, GiftID, ItemNum),
							playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNone),
							playerPackage:addGoodsAndMail(ItemID, ItemCounts, true, 0, PLogItem),
							sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenBuySuccess),
							ok;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotEnoughMoney),
							sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenBuyError)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotEnoughMoney),
					sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenBuyError)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_DeadLineGiftBuyOutOfTime),
			sendNewDeadlineGiftMsg(?DeadlineGift_Send_WhenBuyError)
	end,
	ok.

addNewDeadlineGiftBuyProp(ID, GiftID, ItemNum) ->
	HaveBuyList = playerPropSync:getProp(?SerProp_DeadlineGiftBuy),
	NewBuyNum = findHaveBuyNum(ID, GiftID, HaveBuyList) + ItemNum,
	NewHaveBuyList = lists:keystore({ID, GiftID},1, HaveBuyList, {{ID, GiftID}, NewBuyNum}),
	playerPropSync:setAny(?SerProp_DeadlineGiftBuy, NewHaveBuyList),
	saveDeadlineGiftState(0, NewHaveBuyList),
	ok.

%%在已购列表中查询当前配置项中的已购数量
findHaveBuyNum(ID, GiftID, HaveBuyList) ->
	case lists:keyfind({ID,GiftID}, 1, HaveBuyList) of
		{{ID,GiftID}, ThisItemBuyNum} ->
			ThisItemBuyNum;
		_ ->
			0
	end.

%% 字段中的值为字符串，表达显示上的折扣率
%% 由于导表工具的问题，填0时导出为空字符串
%% 这里需要将空字符串处理为"0"表示免费
itemDiscount([]) -> "0";
itemDiscount(Others) -> Others.


