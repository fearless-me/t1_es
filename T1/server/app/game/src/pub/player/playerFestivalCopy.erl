%%%-------------------------------------------------------------------
%%% @author lijie
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%    节日活动
%%% @end
%%% Created : 09. 十月 2018 15:54
%%%-------------------------------------------------------------------
-module(playerFestivalCopy).

-include("playerPrivate.hrl").

-export([
	requestEnterFestivalCopy/2,
	requestBuyFestivalGift/3,
	isInTheFestivalTime/2,
	getCurValidFestivalID/0,
	getFestivalExtraDrop/2,
	enterMapReal/1,
	sendTimeInfoToClient/0
	]).

isInTheFestivalTime([YearStart, MonthStart, DayStart, HourStart], [YearEnd, MonthEnd, DayEnd, HourEnd]) ->
	NowTime = time:getSyncTime1970FromDBS(),
	StartTime = time:convertDateTime1970ToSec({{YearStart, MonthStart, DayStart}, {HourStart, 0 ,0}}),
	EndTime = time:convertDateTime1970ToSec({{YearEnd, MonthEnd, DayEnd}, {HourEnd, 0 ,0}}),
	case NowTime >= StartTime andalso NowTime < EndTime of
		true ->
			true;
		_ ->
			false
	end.

requestEnterFestivalCopy(CurFestivalID, Type) when Type > 0 ->
	case getCfg:getCfgByKey(cfg_festivalactivity_config, CurFestivalID) of
		#festivalactivity_configCfg{enterprop = EnterProp, copyid = CopyId, timestart = TimeStart, timeend = TimeEnd} ->
			% 先判断时间条件
			case isInTheFestivalTime(TimeStart, TimeEnd) of
				true ->
					{CopyMapID, UseProp} = calcuEnterCopyID(Type, CurFestivalID, EnterProp, CopyId),
					case CopyMapID > 0 andalso playerCopyMap:canEnterCopyMap(CopyMapID) of
						true ->
							playerCopyMap:enterCopyMap(CopyMapID),
							playerState2:setCurEnterFsParam({Type, CurFestivalID, UseProp});
						false ->
							skip;
						ErrorCode ->
							playerMsg:sendErrorCodeMsg(ErrorCode)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotOpen)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotFound)
	end;
requestEnterFestivalCopy(_CurFestivalID, Type) ->
	?ERROR("requestEnterFestivalCopy error param ~p ~n",[Type]).

calcuEnterCopyID(Type, CurFestivalID, EnterProp, [ComCopyID, BossCopyID]) ->
	% 判断是否免费 或者卷是否足够 与策划勾兑 只有普通副本才会有免费次数 此时type应该为1
	% 此处的DailyCounter ID计数设计为 活动ID * 10000 + Type 把活动ID乘以10000加上去是避免相领活动交接时出现问题
	OneProp = {ItemID,ItemNum, ComRate, LimitCnt} = lists:nth(Type, EnterProp),
	IsFreeTime = playerDaily:getDailyCounter(?DailyType_FestivalCopy, CurFestivalID * 10000 + Type) < LimitCnt,
	{IsOK, LastProp} = case IsFreeTime of
		true ->
			{true, OneProp};
		_ ->
			case isEnoughItem(ItemID, ItemNum) of
				true ->
					{true, OneProp};
				false ->
					{false, 0}
			end
	end,
	case IsOK of
		true ->
			% 这里计算是进普通还是boss副本
			{_ItemID, _ItemNum, ComRate, _LimitCnt} = LastProp,
			TempRate = random:uniform(10000),
			case TempRate < ComRate of
				true ->
					{ComCopyID, LastProp};
				_ ->
					{BossCopyID, LastProp}
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotEnoughtItem),
			{0, LastProp}
	end.

enterMapReal(MapId) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapId) of
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeFestival} ->
			case playerState2:getCurEnterFsParam() of
				{_Type, _CurFestivalID ,_UseProp} = Param ->
					afterEnterFestivalCopyID(Param),
					playerState2:setCurEnterFsParam(0);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

afterEnterFestivalCopyID({Type, CurFestivalID, UseProp}) ->
	{ItemID, ItemNum, _ComRate, LimitCnt} = UseProp,
	IsFreeTime = playerDaily:getDailyCounter(?DailyType_FestivalCopy, CurFestivalID * 10000 + Type) < LimitCnt,
	case IsFreeTime of
		true ->
			playerDaily:incDailyCounter(?DailyType_FestivalCopy, CurFestivalID * 10000 + Type);
		_ ->
			PLog = #recPLogTSItem{
				old = playerPackage:getItemNumByID(ItemID),
				new = 0,
				change = -ItemNum,
				target = ?PLogTS_Item,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemDeleteFestivalCopy,
				reasonParam = CurFestivalID},
			delItem(ItemID, ItemNum, PLog)
	end,
	% 记参与日志 这里由于数据库对应的日志表只能记一个参数 扩展日志参数字段不便捷 又为了日志的详细 这里对参数做额外处理
	% Y 表示活动ID Y01/Y10表示免费/消耗进的普通副本 Y02/Y20表示免费/消耗进的BOSS副本
	Param = case IsFreeTime of
		true ->
			CurFestivalID * 100 + Type;
		_ ->
			CurFestivalID * 100 + Type * 10
	end,
	playerLogAdd:addLogParticipatorInfo(?LogParticipator_Enter_FestivalCopy, Param).

isEnoughItem(ID, Num) ->
	case playerPackage:getItemNumByID(ID) >= Num of
		true ->
			true;
		_ ->
			false
	end.

delItem(ID, Num, PLog) ->
	case erlang:is_integer(ID) andalso ID > 0 andalso erlang:is_integer(Num) andalso Num > 0 of
		true ->
			playerPackage:delGoodsByID(?Item_Location_Bag, ID, Num, PLog);
		_ ->
			skip
	end.

requestBuyFestivalGift(CurFestivalID, PacketID, BuyNum) ->
	case getCfg:getCfgByKey(cfg_festivalactivity_config, CurFestivalID) of
		#festivalactivity_configCfg{giftid = GiftID, timestart = TimeStart, timeend = TimeEnd} ->
			% 先判断时间条件
			case isInTheFestivalTime(TimeStart, TimeEnd) of
				true ->
					% 判断该礼包ID是否在当前活动有配置
					case lists:member(PacketID, GiftID) of
						true ->
							doBuyGiftPacket(CurFestivalID, PacketID, BuyNum);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotBeLong)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotOpen)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotConfigure)
	end.

checkTimes(-1, _PacketID, _BuyNum) ->
	true;
checkTimes(BuyTimes, PacketID, BuyNum) ->
	case playerDaily:getDailyCounter(?DailyType_FestivalGift, PacketID) + BuyNum =< BuyTimes of
		true ->
			true;
		_ ->
			false
	end.

addTimes(-1, _PacketID, _BuyNum) ->
	skip;
addTimes(_BuyTimes, PacketID, BuyNum) ->
	playerDaily:addDailyCounter(?DailyType_FestivalGift, PacketID, BuyNum).

checkMoney(MoneyType, MoneyNum) ->
	case MoneyType >= ?CoinUseTypeMin andalso MoneyType =< ?CoinUseTypeMax of
		true ->
			playerMoney:canUseCoin(MoneyType, MoneyNum);
		_ ->
			false
	end.

decMoney(MoneyType, MoneyNum, PLog) ->
	playerMoney:useCoin(MoneyType, MoneyNum, PLog).


doBuyGiftPacket(CurFestivalID, PacketID, BuyNum) ->
	case getCfg:getCfgByKey(cfg_festivalactivity_gift, PacketID) of
		#festivalactivity_giftCfg{giftid = GiftID, presentid = PresentID, price = [MoneyType, MoneyNum], buytimes = BuyTimes} ->
			% 判断次数和钱是否足够
			case checkTimes(BuyTimes, PacketID, BuyNum) of
				true ->
					case checkMoney(MoneyType, MoneyNum * BuyNum) of
						true ->
							% 添加物品 增加次数 扣钱
							addGift(GiftID, BuyNum, CurFestivalID),
							addPresent(PresentID, BuyNum, CurFestivalID),
							addTimes(BuyTimes, PacketID, BuyNum),
							PLog = #recPLogTSMoney{
								reason = ?CoinUseFestivalGift,
								param =  PacketID,
								target = ?PLogTS_FestivalGift,
								source = ?PLogTS_PlayerSelf
							},
							decMoney(MoneyType, MoneyNum * BuyNum, PLog),
							% 客户端表现
							ListGoods = lists:foldl(fun({ItemID, ItemNum}, PkList) ->
								[#pk_OneGoodsInfo{itemID = ItemID, itemNum = ItemNum * BuyNum, quality = 0, isBind = 1} | PkList] end
								,[], [{GiftID, 1} | PresentID]),
							Msg = #pk_GS2U_ShowGainGoodsOrCoinsInfo{
								gainReason = "FestivalGift",
								listcoins = [],
								listGoods = ListGoods},
							playerMsg:sendNetMsg(Msg);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotEnoughMoney)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotEnoughCnt)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_FestivalCopy_NotFound)
	end.

addGift(GiftID, BuyNum, CurFestivalID)->
	PLog = #recPLogTSItem{
		old         = 0 ,
		new         = 0 ,
		change      = BuyNum ,
		target      = ?PLogTS_PlayerSelf ,
		source      = ?PLogTS_FestivalGift ,
		gold        = 0,
		goldtype    = 0,
		changReason = ?ItemSourceFestivalGift,
		reasonParam = CurFestivalID
	},
	playerPackage:addGoodsAndMail(GiftID, BuyNum, true, 0, PLog).

addPresent([], _BuyNum, _CurFestivalID) ->
	ok;
addPresent([{ItemID, ItemNum}|T], BuyNum, CurFestivalID)->
	PLog = #recPLogTSItem{
		old         = 0 ,
		new         = 0 ,
		change      = ItemNum * BuyNum,
		target      = ?PLogTS_PlayerSelf ,
		source      = ?PLogTS_FestivalGift ,
		gold        = 0,
		goldtype    = 0,
		changReason = ?ItemSourceFestivalGift,
		reasonParam = CurFestivalID
	},
	playerPackage:addGoodsAndMail(ItemID, ItemNum * BuyNum, true, 0, PLog),
	addPresent(T, BuyNum, CurFestivalID).

checkNewValidFestivalID(NowTime) ->
	FestivalList = getCfg:get1KeyList(cfg_festivalactivity_config),
	GetFestivalValid = getNewValidFestivalID(FestivalList),
	playerState2:setCurFsValidID({GetFestivalValid, NowTime}),
	GetFestivalValid.

getNewValidFestivalID([]) ->
	0;
getNewValidFestivalID([OneFsID | T]) ->
	case getCfg:getCfgByKey(cfg_festivalactivity_config, OneFsID) of
		#festivalactivity_configCfg{timestart = TimeStart, timeend = TimeEnd} ->
			case isInTheFestivalTime(TimeStart, TimeEnd) of
				true ->
					OneFsID;
				_ ->
					getNewValidFestivalID(T)
			end;
		_ ->
			getNewValidFestivalID(T)
	end.

% 玩家获得当前有效节日活动ID时
getCurValidFestivalID() ->
	case core:isCross() of
		true ->
			{FSValidIDAtEnter, _LastFreshTime} = playerState2:getCurFsValidID(),
			FSValidIDAtEnter;
		_ ->
			case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_FestivalCopy) of
				true ->
					NowTime = time:getSyncTime1970FromDBS(),
					{LastFSValidID, LastFreshTime} = playerState2:getCurFsValidID(),
					case erlang:abs(NowTime - LastFreshTime) >= 60 of
						true ->
							case getCfg:getCfgByKey(cfg_festivalactivity_config, LastFSValidID) of
								#festivalactivity_configCfg{timestart = TimeStart, timeend = TimeEnd} ->
									case isInTheFestivalTime(TimeStart, TimeEnd) of
										true ->
											playerState2:setCurFsValidID({LastFSValidID, NowTime}),
											LastFSValidID;
										_ ->
											checkNewValidFestivalID(NowTime)
									end;
								_ ->
									checkNewValidFestivalID(NowTime)
							end;
						_ ->
							LastFSValidID
					end;
				_ ->
					0
			end
	end.

getFestivalExtraDrop(FestivalID, CopyMapID) ->
	case getCfg:getCfgByKey(cfg_festivalactivity_drop, FestivalID, CopyMapID) of
		#festivalactivity_dropCfg{dropid = DropID} ->
			DropItemList = playerDrop:goodsDrop(DropID, CopyMapID, ?ItemSourcePassCopyMap),
			FunDrop = fun(Rec, Acc) ->
				case Rec of
					{DropNum, [#rec_item{itemUID = ItemUID, itemID = ItemID, isBind = IsBind, quality = Quality} | _]} ->
						[#pk_CopyMapDropItem{
							itemUID = ItemUID,
							itemID = ItemID,
							number = DropNum,
							quality = Quality,
							isBind = IsBind
						} | Acc];
					{DropNum1, [#recSaveEquip{itemUID = ItemUID1, itemID = ItemID1, isBind = IsBind1, quality = Quality1} | _]} ->
						[#pk_CopyMapDropItem{
							itemUID = ItemUID1,
							itemID = ItemID1,
							number = DropNum1,
							quality = Quality1,
							isBind = IsBind1
						} | Acc];
					_ ->
						Acc
				end
			end,
			DropList = lists:foldl(FunDrop, [], DropItemList),
			{DropList, DropItemList};
		_ ->
			{[], []}
	end.

sendTimeInfoToClient() ->
	ActList = getCfg:get1KeyList(cfg_festivalactivity_config),
	Fun = fun(FestivalID, AccList) ->
		case getCfg:getCfgByKey(cfg_festivalactivity_config, FestivalID) of
			#festivalactivity_configCfg{timestart = [YearStart, MonthStart, DayStart, HourStart], timeend = [YearEnd, MonthEnd, DayEnd, HourEnd]} ->
				StartTime = time:convertDateTime1970ToSec({{YearStart, MonthStart, DayStart}, {HourStart, 0 ,0}}) - ?SECS_FROM_0_TO_1970,
				EndTime = time:convertDateTime1970ToSec({{YearEnd, MonthEnd, DayEnd}, {HourEnd, 0 ,0}}) - ?SECS_FROM_0_TO_1970,
				[#pk_OneFestivalTimeInfo{festivalID = FestivalID, startTime = StartTime, endTime = EndTime} | AccList];
			_ ->
				AccList
		end
	end,
	Pk_List = lists:foldl(Fun, [], ActList),
	playerMsg:sendNetMsg(#pk_GS2U_FestivalTimeInfo{timeinfo = Pk_List}).









