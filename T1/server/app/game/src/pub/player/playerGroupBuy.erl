%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2018, raink
%%% @doc
%%% 团购_角色功能接口
%%% Created : 20180207 build
%%% @end
%%%-------------------------------------------------------------------
-module(playerGroupBuy).
-author("meitianyang").
%%
%%-include("playerPrivate.hrl").
%%-include("../groupBuy/groupBuyPrivate.hrl").
%%
%%%% api
%%-export([
%%	msg/1, 				%% 协议处理
%%	init/0,				%% 上线初始化
%%	refreshPlayerData/0,%% 刷新个人数据
%%	groupBuyUpdate/0	%% 活动数据改变
%%]).
%%
%%-export([
%%	gmUnlockDiamond/0	%% 假装活动结束，使用GM指令要求以当前的折扣返还部分钻石
%%]).
%%
%%%%%-------------------------------------------------------------------
%%%% gm:假装活动结束，使用GM指令要求以当前的折扣返还部分钻石
%%-spec gmUnlockDiamond() -> no_return().
%%gmUnlockDiamond() ->
%%	{Ver, ListBuy} = playerPropSync:getProp(?SerProp_GroupBuyGoodsBuyNum),
%%	PLogUnlock = #recPLogTSMoney{
%%		target = ?PLogTS_PlayerSelf,
%%		source = ?PLogTS_GroupBuy,
%%		reason = ?CoinSourceGroupBuyBack
%%	},
%%	PLogUse = #recPLogTSMoney{
%%		target = ?PLogTS_GroupBuy,
%%		source = ?PLogTS_PlayerSelf,
%%		reason = ?CoinUseReasonGroupBuyReal
%%	},
%%	unlockDiamond(ListBuy, PLogUnlock, PLogUse, 0, Ver, groupBuyLogic:getVersion()),
%%	playerPropSync:setAny(?SerProp_GroupBuyGoodsBuyNum, {Ver, []}).
%%
%%%%%-------------------------------------------------------------------
%%%% api,msg
%%-spec msg(Msg::term()) -> no_return().
%%msg(Msg) ->
%%	refreshPlayerData(),	%% 收到协议先刷新个人数据再进行操作
%%	msgReal(Msg, groupBuyLogic:isOpen()).
%%
%%%%%-------------------------------------------------------------------
%%%% api,init
%%-spec init() -> no_return().
%%init() ->
%%	case playerState:getRobRoleID() of
%%		0 ->
%%			refreshPlayerData(),	%% 刷新个人数据
%%			%% 无论是否功能开启，都需要通知客户端（然后客户端才知道功能是否开启）
%%			groupBuyWhenOpen(?GroupBuySyncDataState_Online);
%%		_ ->
%%			skip    %% 机器人不处理该操作
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% api:刷新个人数据
%%-spec refreshPlayerData() -> no_return().
%%refreshPlayerData() ->
%%	case core:isCross() of
%%		true ->
%%			skip;
%%		_ ->
%%			{VerNow, TimeLimit, State} = groupBuyLogic:getArgsForRefreshPlayerData(),
%%			{VerOld, ListBuy} = playerPropSync:getProp(?SerProp_GroupBuyGoodsBuyNum),
%%			%% 1.如果最后获得积分时间小于或等于后台设置时间，则积分和兑奖记录需要清除
%%			case playerPropSync:getProp(?SerProp_GroupBuyScoreLastTime) =< TimeLimit of
%%				true ->
%%					playerPropSync:setInt64(?SerProp_GroupBuyScore, 0),
%%					playerPropSync:setAny(?SerProp_GroupBuyRewardBuy, []);
%%				_ ->
%%					skip
%%			end,
%%			%% 2.若版本不匹配或阶段允许，则需要尝试解冻钻石并重置购买记录
%%			case ListBuy of
%%				[] ->
%%					skip;
%%				_ ->
%%					case VerOld of
%%						VerNow when State =:= ?GroupBuyState_Open ->
%%							skip;
%%						_ ->
%%							playerPropSync:setAny(?SerProp_GroupBuyGoodsBuyNum, {VerNow, []}),
%%							PLogUnlock = #recPLogTSMoney{
%%								target = ?PLogTS_PlayerSelf,
%%								source = ?PLogTS_GroupBuy,
%%								reason = ?CoinSourceGroupBuyBack
%%							},
%%							PLogUse = #recPLogTSMoney{
%%								target = ?PLogTS_GroupBuy,
%%								source = ?PLogTS_PlayerSelf,
%%								reason = ?CoinUseReasonGroupBuyReal
%%							},
%%							unlockDiamond(ListBuy, PLogUnlock, PLogUse, 0, VerOld, VerNow)
%%					end
%%			end
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% api:活动数据改变
%%-spec groupBuyUpdate() -> no_return().
%%groupBuyUpdate() ->
%%	refreshPlayerData(),	%% 刷新个人数据
%%	%% 无论是否功能开启，都需要通知客户端（然后客户端才知道功能是否开启）
%%	groupBuyWhenOpen(?GroupBuySyncDataState_Change).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:解冻钻石
%%-type groupDataCell() :: {int(), uint(), uint()} | {int(), uint(), uint(), float()}.
%%-spec unlockDiamond(
%%	ListGroupData::[groupDataCell(), ...], PLogUnlock::#recPLogTSMoney{},
%%	PLogUse::#recPLogTSMoney{}, Acc::uint(), VerOld::uint(), VerNew::uint()
%%) -> no_return().
%%unlockDiamond([], _, _, 0, _VerOld, _VerNew) ->
%%	skip;
%%unlockDiamond([], _, _, DiamondBack, _VerOld, _VerNew) ->
%%	%% 解冻钻石 - 扣除钻石 > 0
%%	%% 发邮件通知玩家
%%	Title = stringCfg:getString(group_buy_title),
%%	Content = stringCfg:getString(group_buy_content, [DiamondBack]),
%%	mail:sendSystemMail(playerState:getRoleID(), Title, Content, [], ""),
%%	ok;
%%unlockDiamond([DataCell | T], PLogUnlock, PLogUse, DiamondBack, VerOld, VerNew) ->
%%	{ID, Count, Diamond, PriceCell} =
%%		case DataCell of
%%			{ID_, Count_, Diamond_} ->
%%				{ID_, Count_, Diamond_, 0}; %% 兼容老数据
%%			{ID_, Count_, Diamond_, PriceCell_} ->
%%				{ID_, Count_, Diamond_, PriceCell_}
%%		end,
%%	DiamondCost =
%%		case VerOld of
%%			VerNew ->
%%				case groupBuyLogic:getGoodsInfo(ID) of
%%					#rec_group_buy_goods{} = GoodsInfo ->
%%						%% 相同版本的活动，取公共数据
%%						{PriceCellCommon, _} = getCost(GoodsInfo),
%%						?INFO(
%%							"unlockDiamond will RoleID:~w DataCell:~w PriceCellCommon:~w VerOld:~w",
%%							[playerState:getRoleID(), DataCell, PriceCellCommon, VerOld]
%%						),
%%						misc:ceil(PriceCellCommon * Count);
%%					_ ->
%%						%% 相同版本的活动，但取不到公共数据，报错
%%						?ERROR(
%%							"unlockDiamond will RoleID:~w DataCell:~w VerOld:~w",
%%							[playerState:getRoleID(), DataCell, VerOld]
%%						),
%%						Diamond
%%				end;
%%			_ ->
%%				%% 不同版本的活动，只能用缓存数据
%%				?WARN(
%%					"unlockDiamond will RoleID:~w DataCell:~w PriceCell:~w VerOld:~w VerNew:~w",
%%					[playerState:getRoleID(), DataCell, PriceCell, VerOld, VerNew]
%%				),
%%				case PriceCell of
%%					0 ->
%%						Diamond;    %% 兼容老数据
%%					_ ->
%%						misc:ceil(PriceCell * Count)
%%				end
%%		end,
%%	DiamondBackAdd =
%%		case Diamond >= DiamondCost of
%%			true ->
%%				Coin3 = playerState:getCoin(?CoinTypeDiamond),
%%				case Coin3 + Diamond >= DiamondCost andalso playerMoney:unlockDiamond(Diamond, PLogUnlock) of
%%					true ->
%%						case playerMoney:useCoin(?CoinUseTypeDiamondJustNotBind, DiamondCost, PLogUse) of
%%							true ->
%%								Diamond - DiamondCost;
%%							_ ->
%%								%% 成功解冻后扣除钻石失败，应为解冻逻辑或扣除逻辑的严重错误
%%								?ERROR(
%%									"unlockDiamond useCoin faild RoleID:~w DataCell:~w DiamondCost:~w VerOld:~w VerNew:~w Coin3:~w Coin13:~w~n~p",
%%									[
%%										playerState:getRoleID(), DataCell, DiamondCost, VerOld, VerNew,
%%										Coin3, playerState:getCoin(?CoinTypeLockDiamond),
%%										groupBuyLogic:getGoodsInfo(ID)
%%									]
%%								),
%%								0
%%						end;
%%					_ ->
%%						%% 解冻钻石数量不足以扣除钻石或解冻失败，可能为配置前后变化导致
%%						?ERROR(
%%							"unlockDiamond unlockDiamond faild RoleID:~w DataCell:~w DiamondCost:~w VerOld:~w VerNew:~w Coin3:~w Coin13:~w~n~p",
%%							[
%%								playerState:getRoleID(), DataCell, DiamondCost, VerOld, VerNew,
%%								Coin3, playerState:getCoin(?CoinTypeLockDiamond),
%%								groupBuyLogic:getGoodsInfo(ID)
%%							]
%%						),
%%						0
%%				end;
%%			_ ->
%%				%% 需要扣除的钻石大于折扣之前的钻石，惊了！
%%				?ERROR(
%%					"unlockDiamond Diamond faild RoleID:~w DataCell:~w DiamondCost:~w VerOld:~w VerNew:~w~n~p",
%%					[playerState:getRoleID(), DataCell, DiamondCost, VerOld, VerNew, groupBuyLogic:getGoodsInfo(ID)]
%%				),
%%				0
%%		end,
%%	unlockDiamond(T, PLogUnlock, PLogUse, DiamondBackAdd + DiamondBack, VerOld, VerNew).
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg
%%-spec msgReal(Msg::term(), State::?GroupBuyState_Open .. ?GroupBuyState_END) -> no_return().
%%msgReal(#pk_U2GS_GroupBuyWhenOpen{}, State) when State =/= ?GroupBuyState_Close ->
%%	groupBuyWhenOpen(?GroupBuySyncDataState_Ack);
%%msgReal(#pk_U2GS_GroupBuyGoodsBuyRequest{id = Id, goodsNum = GoodsNum}, ?GroupBuyState_Open) ->
%%	groupBuyGoodsBuyRequest(Id, GoodsNum);
%%msgReal(#pk_U2GS_GroupBuyRewardBuyRequest{id = Id}, State)  when State =/= ?GroupBuyState_Close ->
%%	groupBuyRewardBuyRequest(Id);
%%msgReal(_, _) ->
%%	skip.
%%
%%%%%-------------------------------------------------------------------
%%%% msg:打开界面请求信息
%%%% 作为协议反馈时，需要判断功能是否打开；作为上线初始化，必须同步数据
%%-spec groupBuyWhenOpen(State::?GroupBuySyncDataState_BEGIN .. ?GroupBuySyncDataState_END) -> no_return().
%%groupBuyWhenOpen(State) ->
%%	{TimeOpen, TimeLimit, TimeScore, Image} =
%%		case ets:lookup(?EtsGroupBuyState, ets:first(?EtsGroupBuyState)) of
%%			[#rec_group_buy_state{open_time = Open_time, limit_time = Limit_time, score_add_time = Score_add_time, image = Image_}] ->
%%				{Open_time, Limit_time, Score_add_time, Image_};
%%			_ ->
%%				{0, 0, 0, []}
%%		end,
%%	{_, ListAlreadyBuy} = playerPropSync:getProp(?SerProp_GroupBuyGoodsBuyNum),
%%	Msg = #pk_GS2U_GroupBuyWhenOpen{
%%		state = State,
%%		%% 活动状态
%%		open_time = TimeOpen,
%%		limit_time = TimeLimit,
%%		score_add_time = TimeScore,
%%		image = Image,
%%		%% 活动内容
%%		goodsListInfo = [goodsInfo2Msg(Data) || Data <- groupBuyLogic:getGoodsInfo()],
%%		rewardListInfo = [rewardInfo2Msg(Data) || Data <- groupBuyLogic:getRewardInfo()],
%%		%% 个人数据
%%		personalScore = playerPropSync:getProp(?SerProp_GroupBuyScore),
%%		rewardPersonalListInfo = playerPropSync:getProp(?SerProp_GroupBuyRewardBuy),
%%		goodsPersonalListInfo = listAlreadyBuy2idAndCount(ListAlreadyBuy, [])
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%listAlreadyBuy2idAndCount([], Acc) ->
%%	lists:reverse(Acc);
%%listAlreadyBuy2idAndCount([{ID, Count, _} | T], Acc) -> %% 兼容老数据
%%	listAlreadyBuy2idAndCount(T, [#pk_idAndCount{id = ID, count = Count} | Acc]);
%%listAlreadyBuy2idAndCount([{ID, Count, _, _} | T], Acc) ->
%%	listAlreadyBuy2idAndCount(T, [#pk_idAndCount{id = ID, count = Count} | Acc]).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:内存结构转换为协议结构
%%-spec goodsInfo2Msg(#rec_group_buy_goods{}) -> #pk_GroupBuyGoodsInfo{}.
%%goodsInfo2Msg(#rec_group_buy_goods{} = Data0) ->
%%	[_ | Data1] = erlang:tuple_to_list(Data0),
%%	[ID | [_ | Data2]] = Data1,	%% 去掉group不需要
%%	erlang:list_to_tuple([pk_GroupBuyGoodsInfo | [ID | Data2]]).
%%-spec rewardInfo2Msg(#rec_group_buy_reward{}) -> #pk_GroupBuyRewardInfo{}.
%%rewardInfo2Msg(#rec_group_buy_reward{} = Data0) ->
%%	[_ | Data1] = erlang:tuple_to_list(Data0),
%%	[ID | [_ | Data2]] = Data1,	%% 去掉group不需要
%%	erlang:list_to_tuple([pk_GroupBuyRewardInfo | [ID | Data2]]).
%%
%%%%%-------------------------------------------------------------------
%%%% msg:请求购买团购活动商品
%%-spec groupBuyGoodsBuyRequest(Id::int(), GoodsNum::uint()) -> no_return().
%%groupBuyGoodsBuyRequest(Id, GoodsNum) ->
%%	GoodsInfo = groupBuyLogic:getGoodsInfo(Id),											%% 获取商品信息
%%	RetCheckLimit = checkLimitBuy(GoodsInfo, GoodsNum),									%% 检查限购
%%	{IsEnough, {PriceAll, ScoreAll}} = checkCost(RetCheckLimit, GoodsInfo, GoodsNum),	%% 检查价格
%%	RetCost = lockDiamond({IsEnough, {PriceAll, ScoreAll}}, Id),						%% 冻结钻石
%%	rewardForBuy(RetCost, GoodsInfo, GoodsNum),											%% 发放商品
%%	score(RetCost, ScoreAll),															%% 增加积分
%%	addBuyCount(RetCost, GoodsInfo, GoodsNum, PriceAll),								%% 增加购买量
%%	%% 协议反馈
%%	Msg = #pk_GS2U_GroupBuyGoodsBuyAck{
%%		buyCode = case RetCost of true -> 1; _ -> 0 end,
%%		id = Id,
%%		goodsNum = GoodsNum,
%%		scoreAdd = ScoreAll,
%%		scoreNew = playerPropSync:getProp(?SerProp_GroupBuyScore),
%%		lockDiamond = 0,    %% PriceAll,    fixme 此处设计问题，不应该在此处同步冻结钻石数量，冻结钻石已在playerMoney中特殊处理同步
%%		%% 生成新的购买量数据（增加的购买量正在通过消息告诉公共进程进行写入，这里读取的不是最新数据，但只需要加入自己的数据进行反馈）
%%		goodsBuyCountListInfo = goodsBuyCountListInfo(RetCost, Id, GoodsNum)
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:检查是否限购
%%-spec checkLimitBuy(#rec_group_buy_goods{}|term(), GoodsNum::uint()) -> boolean().
%%checkLimitBuy(#rec_group_buy_goods{id = Id, collect_num = Max}, GoodsNum) when GoodsNum > 0 ->
%%	{_, ListLimitBuy} = playerPropSync:getProp(?SerProp_GroupBuyGoodsBuyNum),
%%	case lists:keyfind(Id, 1, ListLimitBuy) of
%%		false when GoodsNum =< Max ->
%%			true;
%%		{_, Count, _} when Count + GoodsNum =< Max ->    %% 兼容老数据
%%			true;
%%		{_, Count, _, _} when Count + GoodsNum =< Max ->
%%			true;
%%		_ ->
%%			false
%%	end;
%%checkLimitBuy(_GoodsInfo, _GoodsNum) ->
%%	false.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:检查价格
%%-spec checkCost(boolean(), #rec_group_buy_goods{}|term(), GoodsNum::uint()) -> {boolean(), {Diamond::uint(), Score::uint()}}.
%%checkCost(false, _, _) ->
%%	{false, {0, 0}};
%%checkCost(_, #rec_group_buy_goods{} = GoodsInfo, GoodsNum) ->
%%	{PriceCell, ScoreCell} = getCost(GoodsInfo),
%%	PriceAll = misc:ceil(PriceCell * GoodsNum),
%%	ScoreAll = misc:ceil(ScoreCell * GoodsNum),
%%	IsEnough = playerMoney:canLockDiamond(PriceAll),	%% 仅为非绑钻
%%	{IsEnough, {PriceAll, ScoreAll}}.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:计算单价
%%-spec getCost(#rec_group_buy_goods{}) -> {Price::float(), Score::float()}.
%%getCost(
%%	#rec_group_buy_goods{
%%		true_price = PriceBase,
%%		rebate5_num = CountD,
%%		rebate5_price = PriceD,
%%		buy_count = Count,
%%		score = Score
%%	}
%%) when Count >= CountD ->
%%	{PriceBase * PriceD / 100.0, Score * PriceD / 100.0};
%%getCost(
%%	#rec_group_buy_goods{
%%		true_price = PriceBase,
%%		rebate4_num = CountD,
%%		rebate4_price = PriceD,
%%		buy_count = Count,
%%		score = Score
%%	}
%%) when Count >= CountD ->
%%	{PriceBase * PriceD / 100.0, Score * PriceD / 100.0};
%%getCost(
%%	#rec_group_buy_goods{
%%		true_price = PriceBase,
%%		rebate3_num = CountD,
%%		rebate3_price = PriceD,
%%		buy_count = Count,
%%		score = Score
%%	}
%%) when Count >= CountD ->
%%	{PriceBase * PriceD / 100.0, Score * PriceD / 100.0};
%%getCost(
%%	#rec_group_buy_goods{
%%		true_price = PriceBase,
%%		rebate2_num = CountD,
%%		rebate2_price = PriceD,
%%		buy_count = Count,
%%		score = Score
%%	}
%%) when Count >= CountD ->
%%	{PriceBase * PriceD / 100.0, Score * PriceD / 100.0};
%%getCost(
%%	#rec_group_buy_goods{
%%		true_price = PriceBase,
%%		rebate1_num = CountD,
%%		rebate1_price = PriceD,
%%		buy_count = Count,
%%		score = Score
%%	}
%%) when Count >= CountD ->
%%	{PriceBase * PriceD / 100.0, Score * PriceD / 100.0};
%%getCost(
%%	#rec_group_buy_goods{
%%		true_price = PriceBase,
%%		score = Score
%%	}
%%) ->
%%	{PriceBase, Score};
%%getCost(_) ->
%%	{0, 0}.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:冻结钻石
%%-spec lockDiamond({boolean(), {Cost::uint(), Score::uint()}}, Id::int()) -> boolean().
%%lockDiamond({false, _}, _Id) ->
%%	false;
%%lockDiamond({_, {Cost, _}}, Id) ->
%%	PLog = #recPLogTSMoney{
%%		reason = ?CoinUseReasonGroupBuy,
%%		param = Id,
%%		target = ?PLogTS_GroupBuy,
%%		source = ?PLogTS_PlayerSelf
%%	},
%%	playerMoney:lockDiamond(Cost, PLog).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:发放商品
%%-spec rewardForBuy(boolean(), #rec_group_buy_goods{}, uint()) -> boolean().
%%rewardForBuy(false, _, _) ->
%%	skip;
%%rewardForBuy(_, #rec_group_buy_goods{
%%	item1_id = ID1,
%%	item1_num = Count1,
%%	item2_id = ID2,
%%	item2_num = Count2,
%%	item3_id = ID3,
%%	item3_num = Count3,
%%	item4_id = ID4,
%%	item4_num = Count4,
%%	item5_id = ID5,
%%	item5_num = Count5
%%}, GoodsNum) ->
%%	ListItem = [
%%		{ID1, Count1 * GoodsNum},
%%		{ID2, Count2 * GoodsNum},
%%		{ID3, Count3 * GoodsNum},
%%		{ID4, Count4 * GoodsNum},
%%		{ID5, Count5 * GoodsNum}
%%	],
%%	PLog = #recPLogTSItem{
%%		target = ?PLogTS_PlayerSelf,
%%		source = ?PLogTS_GroupBuy,
%%		changReason = ?ItemSourceGroupBuyGoodsBuy
%%	},
%%	rewardDo(ListItem, PLog).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:发放商品（执行）
%%-spec rewardDo([{uint(), uint()}, ...], #recPLogTSItem{}) -> no_return().
%%rewardDo([], _) ->
%%	ok;
%%rewardDo([{0, _Count} | T], PLog) ->
%%	rewardDo(T, PLog);
%%rewardDo([{ID, Count} | T], PLog) ->
%%	Quality = playerPackage:getQualityFromCfg(ID),
%%	PLogNow = PLog#recPLogTSItem{
%%		new = Count,
%%		change = Count
%%	},
%%	playerPackage:addGoodsAndMail(ID, Count, false, Quality, PLogNow),
%%	rewardDo(T, PLog).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:增加积分
%%-spec score(boolean(), ScoreAdd::uint()) -> no_return().
%%score(false, _) ->
%%	0;
%%score(_, ScoreAdd) ->
%%	ScoreOld = playerPropSync:getProp(?SerProp_GroupBuyScore),
%%	playerPropSync:setInt64(?SerProp_GroupBuyScore, ScoreOld + ScoreAdd),
%%	playerPropSync:setInt(?SerProp_GroupBuyScoreLastTime, misc_time:localtime_seconds()).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:增加购买量
%%-spec addBuyCount(boolean(), #rec_group_buy_goods{}, uint(), uint()) -> no_return().
%%addBuyCount(false, _, _, _) ->
%%	skip;
%%addBuyCount(_, #rec_group_buy_goods{id = Id} = GoodsInfo, GoodsNum, PriceAll) ->
%%	{_, ListBuy} = playerPropSync:getProp(?SerProp_GroupBuyGoodsBuyNum),
%%	Ver = groupBuyLogic:getVersion(),
%%	{PriceCell, _} = getCost(GoodsInfo),
%%	case lists:keyfind(Id, 1, ListBuy) of
%%		false ->
%%			playerPropSync:setAny(?SerProp_GroupBuyGoodsBuyNum, {Ver, [{Id, GoodsNum, PriceAll, PriceCell} | ListBuy]});
%%		{_, CountOld, PriceOld} ->  %% 兼容老数据
%%			ListBuyNew = lists:keyreplace(Id, 1, ListBuy, {Id, CountOld + GoodsNum, PriceOld + PriceAll, PriceCell}),
%%			playerPropSync:setAny(?SerProp_GroupBuyGoodsBuyNum, {Ver, ListBuyNew});
%%		{_, CountOld, PriceOld, _} ->
%%			ListBuyNew = lists:keyreplace(Id, 1, ListBuy, {Id, CountOld + GoodsNum, PriceOld + PriceAll, PriceCell}),
%%			playerPropSync:setAny(?SerProp_GroupBuyGoodsBuyNum, {Ver, ListBuyNew})
%%	end,
%%	psMgr:sendMsg2PS(?PsNameGroupBuy, addBuyCount, {Id, GoodsNum}).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:获取最新能量值
%%-spec goodsBuyCountListInfo(boolean(), ID::int(), Count::uint()) -> [#pk_idAndCount{}, ...].
%%goodsBuyCountListInfo(true, ID, Count) ->
%%	ListBuyCount = goodsBuyCountListInfo(),
%%	case lists:keyfind(ID, #pk_idAndCount.id, ListBuyCount) of
%%		false ->
%%			[#pk_idAndCount{id = ID, count = Count} | ListBuyCount];
%%		#pk_idAndCount{count = CountOld} ->
%%			lists:keyreplace(ID, #pk_idAndCount.id, ListBuyCount, #pk_idAndCount{id = ID, count = CountOld + Count})
%%	end;
%%goodsBuyCountListInfo(_, _, _) ->
%%	goodsBuyCountListInfo().
%%-spec goodsBuyCountListInfo() -> [#pk_idAndCount{}, ...].
%%goodsBuyCountListInfo() ->
%%	[
%%		#pk_idAndCount{id = ID, count = Count} ||
%%		#rec_group_buy_goods{id = ID, buy_count = Count} <-
%%			groupBuyLogic:getGoodsInfo()
%%	].
%%
%%%%%-------------------------------------------------------------------
%%%% msg:请求领取团购活动积分商品
%%-spec groupBuyRewardBuyRequest(Id::int()) -> no_return().
%%groupBuyRewardBuyRequest(Id) ->
%%	RetAlready = checkAlready(Id),				%% 检查是否领过了
%%	RewardInfo = getRewardInfo(RetAlready, Id),	%% 获取奖励信息
%%	ScoreMy = playerPropSync:getProp(?SerProp_GroupBuyScore),
%%	RetCheck = checkScore(RewardInfo, ScoreMy),	%% 检查积分是否足够
%%	rewardForScore(RetCheck, RewardInfo),		%% 执行领奖
%%	Msg = #pk_GS2U_GroupBuyRewardBuyAck{
%%		buyCode = case RetCheck of true -> 1; _ -> 0 end,
%%		id = Id,
%%		goodsBuyCountListInfo = goodsBuyCountListInfo()
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:检查是否领过了
%%-spec checkAlready(Id::int()) -> boolean().
%%checkAlready(Id) ->
%%	List = playerPropSync:getProp(?SerProp_GroupBuyRewardBuy),
%%	not lists:member(Id, List).
%%
%%%% 获取奖励信息
%%-spec getRewardInfo(boolean(), Id::int()) -> #rec_group_buy_reward{}|term().
%%getRewardInfo(false, _Id) ->
%%	0;
%%getRewardInfo(_, Id) ->
%%	groupBuyLogic:getRewardInfo(Id).
%%
%%%% 检查积分是否足够
%%-spec checkScore(#rec_group_buy_reward{}|term(), ScoreMy::uint()) -> boolean().
%%checkScore(#rec_group_buy_reward{score = NeedScore}, ScoreMy) when ScoreMy >= NeedScore ->
%%	true;
%%checkScore(_, _) ->
%%	false.
%%
%%%% 执行领奖
%%-spec rewardForScore(boolean(), #rec_group_buy_reward{}|term()) -> no_return().
%%rewardForScore(false, _) ->
%%	skip;
%%rewardForScore(_, #rec_group_buy_reward{
%%	id = ID,
%%	reward1_id = ID1,
%%	reward1_num = Count1,
%%	reward2_id = ID2,
%%	reward2_num = Count2,
%%	reward3_id = ID3,
%%	reward3_num = Count3,
%%	reward4_id = ID4,
%%	reward4_num = Count4,
%%	reward5_id = ID5,
%%	reward5_num = Count5
%%}) ->
%%	ListItem = [
%%		{ID1, Count1},
%%		{ID2, Count2},
%%		{ID3, Count3},
%%		{ID4, Count4},
%%		{ID5, Count5}
%%	],
%%	PLog = #recPLogTSItem{
%%		target = ?PLogTS_PlayerSelf,
%%		source = ?PLogTS_GroupBuy,
%%		changReason = ?ItemSourceGroupBuyRewardBuy
%%	},
%%	List = playerPropSync:getProp(?SerProp_GroupBuyRewardBuy),
%%	playerPropSync:setAny(?SerProp_GroupBuyRewardBuy,[ID | List]),
%%	rewardDo(ListItem, PLog).
