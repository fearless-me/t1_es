%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 幸运大转盘
%%% @end
%%% Created : 20. 十一月 2017 10:32
%%%-------------------------------------------------------------------
-module(playerDialBox).
-author("tiancheng").

%% 绑定钻石抽奖
-define(DialBoxBindDiamond, 1).
%% 非绑定钻石抽奖
-define(DialBoxDiamond, 2).

%% 转盘结果
-define(DialBoxResult, 1).
%% 领取宝箱结果
-define(GetDialBoxResult, 2).

-include("playerPrivate.hrl").

%% API
-export([
	msg/1,
	sendDialInfoToClient/0
]).

%% 请求自己的转盘信息(打开转盘)
msg(#pk_U2GS_RequestSelfDialInfo{}) ->
	Infos = [getSelfDialBoxInfo(?DialBoxBindDiamond), getSelfDialBoxInfo(?DialBoxDiamond)],
	Infos2 = [getSelfDialInfoMsg(Box) || #recDialBox{} = Box <- Infos],
	playerMsg:sendNetMsg(#pk_GS2U_SelfDialInfo{infos = Infos2}),
	ok;
%% 请求转转转
msg(#pk_U2GS_RequestJqueryrotate{boxType = BoxType, id = CostID}) ->
	%% 检查匹配
	case isOpen(BoxType) of
		true ->
			case businessInterface:getCost(CostID) of
				#recDialCost{boxType = BoxType} = Cost ->
					requestJaquenette(Cost);
				_ ->
					skip
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
	end,
	ok;
%% 请求领宝箱
msg(#pk_U2GS_RequestGetBox{boxType = BoxType, getTimes = RequestGetTimeNumber}) ->
	case getSelfDialBoxInfo(BoxType) of
		#recDialBox{haveTimes = HaveTimes, getTimes = GetTimeList, haveLuck = HaveLuck} = Box when HaveTimes >= RequestGetTimeNumber ->
			case lists:member(RequestGetTimeNumber, GetTimeList) of
				false ->
					BoxList = businessInterface:getBoxs(BoxType),
					case lists:keyfind(RequestGetTimeNumber, #recDialReward.needTimes, BoxList) of
						#recDialReward{itemID1 = ItemID1,num1 = Num1,itemID2 = ItemID2,num2 = Num2,itemID3 = ItemID3,num3 = Num3} ->
							ItemAll = [{ItemID1,Num1}] ++ [{ItemID2,Num2}] ++ [{ItemID3,Num3}],
							saveSelfDialBoxInfo(Box#recDialBox{getTimes = [RequestGetTimeNumber |GetTimeList]}),

							F =
								fun
									({ItemID, Number},AccIn) ->
										case ItemID =/= 0 of
											true ->
												PItemLog = #recPLogTSItem{
													old = 0,
													new = Number,
													change = Number,
													target = ?PLogTS_PlayerSelf,
													source = ?PLogTS_Dial,
													gold = 0,
													goldtype = 0,
													changReason = ?ItemSourceDialBox,
													reasonParam = RequestGetTimeNumber
												},
												playerPackage:addGoodsAndMail(ItemID, Number, false, 0, PItemLog),
												%% 记录日志
												Log = #rec_log_dial_box{
													roleID = playerState:getRoleID(),
													turnType = BoxType,
													coinType = 0,
													coinNum = 0,
													rewardID = 0,
													itemID = ItemID,
													itemNumber = Number,
													luckNum = HaveLuck,
													times = HaveTimes,
													boxID = ItemID
												},
												dbLog:sendSaveDialBox(Log),

												R = #pk_DialItem{
													%% Byte转盘类型
													boxType = BoxType,
													%% Byte格子编号
													index = 0,
													%% UInt32 '奖励道具ID',
													itemID = ItemID,
													%% UInt32 '奖励道具个数',
													num = Number
												},
												[R | AccIn];
											_ ->
												AccIn
										end

								end,
							RList = lists:foldl(F,[],ItemAll),
							Msg = #pk_GS2U_JqueryrotateResult{type = ?GetDialBoxResult, info = getSelfDialInfoMsg(getSelfDialBoxInfo(BoxType)), results = RList},
							playerMsg:sendNetMsg(Msg),
							ok;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
msg(Msg) ->
	?ERROR("msg roleID:~p, Msg:~p", [playerState:getRoleID(), Msg]),
	ok.

%% 每次点击转盘，转盘成功转动会增加幸运值；转动到物品之后，幸运值再增加；幸运值与转到橙色奖励的概率有关；当转到橙色奖励物品时，幸运值立即清0；具体见数值计算规则
requestJaquenette(#recDialCost{
	id = ID,
	boxType = BoxType, coinType = CoinType, coinNum = CoinNum, times = Times,
	luckyValue = LuckyValue, para_a = ParamA, para_b = ParamB, para_x = ParamX}) ->
	UseType =
		case CoinType of
			?CoinTypeBindDiamond -> ?CoinUseTypeDiamond;
			?CoinTypeDiamond -> ?CoinUseTypeDiamondJustNotBind;
			_ -> false
		end,
	%% 检查消耗
	case playerMoney:canUseCoin(UseType, CoinNum) of
		true ->
			%% 得到转盘库
			{[#recDialItem{} = Rare], [#recDialItem{}|_] = ItemList} = businessInterface:getItems(BoxType),

			%% 扣钱
			PLog = #recPLogTSMoney{reason = ?CoinUseDialBox, param = ID, target = ?PLogTS_Dial, source = ?PLogTS_PlayerSelf},
			true = playerMoney:useCoin(UseType, CoinNum, PLog),

			%% 抽抽抽
			Box = #recDialBox{haveLuck = HaveLuck, haveTimes = HTimes} = getSelfDialBoxInfo(BoxType),

			TimesList = lists:seq(1, Times),
			F =
				fun(_, {AccLuck, AccList}) ->
					{Luck, #recDialItem{} = Item} = dealLottery(Rare, ItemList, AccLuck, LuckyValue, ParamA, ParamB, ParamX),
					{Luck, [Item | AccList]}
				end,
			{NewLuck, RewardList} = lists:foldl(F, {HaveLuck, []}, TimesList),

			%% 判断领取宝箱
			NewBox = Box#recDialBox{haveLuck = NewLuck, haveTimes = HTimes + Times},
			saveSelfDialBoxInfo(NewBox),

			%% 发奖
			FR =
				fun(#recDialItem{index = Index, itemID = ItemID, num = Num}, Acc) ->
					{RItemID, RNumber} =
						case playerPet:petItemIDConvertToChipItem(ItemID) of
							{ItemID2, Number} ->
								{ItemID2, Number * Num};
							_ ->
								{ItemID, Num}
						end,
					PItemLog = #recPLogTSItem{
						old = 0,
						new = RNumber,
						change = RNumber,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_Dial,
						gold = CoinNum,
						goldtype = CoinType,
						changReason = ?ItemSourceDialBox,
						reasonParam = ID
					},
					playerPackage:addGoodsAndMail(RItemID, RNumber, false, 0, PItemLog),

					%% 记录日志
					Log = #rec_log_dial_box{
						roleID = playerState:getRoleID(),
						turnType = BoxType,
						coinType = CoinType,
						coinNum = CoinNum,
						rewardID = Index,
						itemID = RItemID,
						itemNumber = RNumber,
						luckNum = NewLuck,
						times = HTimes + Times,
						boxID = 0
					},
					dbLog:sendSaveDialBox(Log),

					%% 这是要返回给客户端的协议
					R = #pk_DialItem{
						%% Byte转盘类型
						boxType = BoxType,
						%% Byte格子编号
						index = Index,
						%% UInt32 '奖励道具ID',
						itemID = ItemID,
						%% UInt32 '奖励道具个数',
						num = Num
					},
					case ItemID =:= RItemID of
						true ->
							[R | Acc];
						_ ->
							R2 = #pk_DialItem{
								%% Byte转盘类型
								boxType = BoxType,
								%% Byte格子编号
								index = Index,
								%% UInt32 '奖励道具ID',
								itemID = RItemID,
								%% UInt32 '奖励道具个数',
								num = RNumber
							},
							[R#pk_DialItem{num = 0}, R2 | Acc]
					end
				end,
			Results = lists:foldl(FR, [], RewardList),

			Msg = #pk_GS2U_JqueryrotateResult{type = ?DialBoxResult, info = getSelfDialInfoMsg(getSelfDialBoxInfo(BoxType)), results = Results},
			playerMsg:sendNetMsg(Msg),
			ok;
		_ ->
			case CoinType of
				?CoinTypeBindDiamond -> playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_BindDiamond_Not_Enough);
				?CoinTypeDiamond -> playerMsg:sendErrorCodeMsg(?ErrorCode_LotteryForTower_NotEnoughMoney)
			end
	end,
	ok.

%% a.当幸运值小于a时，橙色转到的概率为0
%% b.当幸运值大于等于a时，橙色转到的概率为幸运值/x
%% c.当幸运值大于等于b时，橙色转到的概率为100%；对应数值(a,b,x)都配置
%% 修改判断逻辑 改为先加AddLuck 再判断
dealLottery(#recDialItem{} = Rare, [#recDialItem{}|_] = ItemList, HaveLuck, AddLuck, ParamA, ParamB, ParamX) ->
	HaveLuckNow = HaveLuck + AddLuck,
	case HaveLuckNow >= ParamB of
		true ->
            %% 头奖！
            #itemCfg{name = ItemName} = getCfg:getCfgByKey(cfg_item,Rare#recDialItem.itemID),
            sendBroadcastNotice_luckyTurntableFirstPrize(ItemName),
			{0, Rare};
		_ ->
			case HaveLuckNow >= ParamA andalso HaveLuckNow < ParamB of
				true ->
					case misc:rand(1, ParamX) < HaveLuckNow of
						true ->
							%% 头奖！
                            #itemCfg{name = ItemName} = getCfg:getCfgByKey(cfg_item,Rare#recDialItem.itemID),
                            sendBroadcastNotice_luckyTurntableFirstPrize(ItemName),
							{0, Rare};
						_ ->
							#recDialItem{} = V = misc:calcOddsByWeightList([{Weight, Item} || Item = #recDialItem{weight = Weight} <- ItemList]),
							{HaveLuckNow, V}
					end;
				_ ->
					#recDialItem{} = V = misc:calcOddsByWeightList([{Weight, Item} || Item = #recDialItem{weight = Weight} <- ItemList]),
					{HaveLuckNow, V}
			end
	end.

% 走马灯播放幸运转盘中头奖公告
sendBroadcastNotice_luckyTurntableFirstPrize(ItemName) ->
	Content = stringCfg:getString(turnPlateNotice,[playerState:getName(),ItemName]),
	core:sendBroadcastNotice(Content),
	ok.

getSelfDialBoxInfo(BoxType) when BoxType =:= ?DialBoxBindDiamond orelse BoxType =:= ?DialBoxDiamond ->
	List = playerPropSync:getProp(?SerProp_DialBox),
	NowTime = businessInterface:getLocalTimestampSec(),
	New =
		case List of
			[#recDialBox{}|_] ->
				case lists:keyfind(BoxType, #recDialBox.boxType, List) of
					#recDialBox{time = Time} = Info when NowTime < Time  ->
						Info;
					#recDialBox{} = Info ->
						Info#recDialBox{haveTimes = 0, getTimes = [], time = getResetTime(NowTime)};
					_ ->
						#recDialBox{boxType = BoxType, time = getResetTime(NowTime)}
				end;
			_ ->
				#recDialBox{boxType = BoxType, time = getResetTime(NowTime)}
		end,
	NList = lists:keystore(BoxType, #recDialBox.boxType, List, New),
	playerPropSync:setAny(?SerProp_DialBox, NList),
	New.

saveSelfDialBoxInfo(#recDialBox{boxType = BoxType} = Info) ->
	List = playerPropSync:getProp(?SerProp_DialBox),
	NList = lists:keystore(BoxType, #recDialBox.boxType, List, Info),
	playerPropSync:setAny(?SerProp_DialBox, NList),
	NList.

getResetTime(NowTime) ->
	DateNow = time2:convertSecToDateTime(NowTime + ?SECS_FROM_0_TO_1970),	%% NowTime是从1970年开始的本地时间
	time:getWeekBeginSecondsByDay(DateNow) - ?SECS_FROM_0_TO_1970 + ?ResetTimeHour * 3600 + 24 * 7 * 3600.

sendDialInfoToClient() ->
	case core:isCross() of
		false ->
			{Msg1, Msg2, Msg3} = businessInterface:getDialBoxMsg(),
			playerMsg:sendNetMsg(Msg1),
			playerMsg:sendNetMsg(Msg2),
			playerMsg:sendNetMsg(Msg3),
			ok;
		_ ->
			skip
	end,
	ok.

getSelfDialInfoMsg(#recDialBox{} = Box) ->
	#pk_SelfDialInfo{
		%% Byte转盘类型
		boxType = Box#recDialBox.boxType,
		%% UInt16转动次数
		haveTimes = Box#recDialBox.haveTimes,
		%% UInt16领取到的次数
		getTimes = Box#recDialBox.getTimes,
		%% UInt16拥有幸运值
		haveLuck = Box#recDialBox.haveLuck
	}.

%% 检查开关
isOpen(?DialBoxBindDiamond) ->
	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_DialBindDiamond);
isOpen(?DialBoxDiamond) ->
	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Business_DialDiamond);
isOpen(_) -> false.