%%%-------------------------------------------------------------------
%%% @author xiangqin
%%% @copyright (C) 2018, <COMPANY>
%%% @doc集字活动
%%%
%%% @end
%%% Created : 02. 二月 2018 9:53
%%%-------------------------------------------------------------------
-module(playerCollectionWords).
-include("gsInc.hrl").
-include("playerPropSyncDefine.hrl").
-include("cfg_collect_word.hrl").
-include("cfg_collect_word_des.hrl").
-include("playerPrivate.hrl").
%%
%%%% API
%%-export([
%%	collectionWordsUpdate/0,   %% 时间配置更新之后通知客户端配置改变
%%	checkCfg2Sync/1,				%% 检查是否需要同步配置信息
%%    requestCollectionWordsAward/1	%% 请求领奖
%%]).
%%
%%collectionWordsUpdate() ->
%%	checkCfg2Sync(true).
%%
%%%% 检查是否需要同步配置信息
%%-spec checkCfg2Sync(IsInit::boolean()) -> no_return().
%%checkCfg2Sync(IsInit) ->
%%	case core:isCross() of
%%	false ->
%%			VerOld = playerPropSync:getProp(?SerProp_CollectionWordsVer),
%%			case collectionWordsLogic:getCfgInfoFromCfgAndEts() of
%%				#collect_word_desCfg{ver = Ver} = Cfg when IsInit =:= true; VerOld =/= Ver ->
%%					resetForVer(VerOld =/= Ver, Ver),
%%					Msg = packCfg2Msg(Cfg),
%%					%%?DEBUG("[DebugForCollectionWords] checkCfg2Sync ~n~p", [Msg]),
%%					playerMsg:sendNetMsg(Msg);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%% 版本不同需要重置相关数据
%%-spec resetForVer(NeedReset::boolean(), Ver::uint()) -> no_return().
%%resetForVer(true, Ver) ->
%%	?DEBUG("[DebugForCollectionWords] resetForVer Ver:~w", [Ver]),
%%	playerPropSync:setInt(?SerProp_CollectionWordsVer, Ver),
%%	playerDaily:zeroDailyCount(?DailyType_EveryDay_Get_CollectWordsAward),
%%	playerDaily:zeroDailyCount(?DailyType_CollectWords);
%%resetForVer(_, _) ->
%%	skip.
%%
%%%% 打包配置数据进行同步
%%-spec packCfg2Msg(CfgDes::#collect_word_desCfg{}) -> #pk_GS2U_CollectionWords_Sync{}.
%%packCfg2Msg(
%%	#collect_word_desCfg{
%%		group = Group,
%%		ver = Ver,
%%		image = Image,
%%		info_1 = Info_1,
%%		info_2 = Info_2,
%%		open_y_m_d = Open_y_m_d,
%%		limit_time = Limit_time
%%	}
%%) ->
%%	State = #pk_collectionWords_State{
%%		group = Group,
%%		ver = Ver,
%%		image = Image,
%%		info_1 = Info_1,
%%		info_2 = Info_2,
%%		open_y_m_d = Open_y_m_d,
%%		limit_time = Limit_time
%%	},
%%	ListKey = getCfg:get1KeyList(cfg_collect_word),
%%	{ListRewardCfg, Word_limit} = packCfg2Msg_(ListKey, [], 0, Group),
%%	#pk_GS2U_CollectionWords_Sync{
%%		state = State#pk_collectionWords_State{word_limit = Word_limit},
%%		listRewardCfg = ListRewardCfg
%%	}.
%%packCfg2Msg_([], Acc, Word_limit, _Group) ->
%%	{lists:reverse(Acc), Word_limit};
%%packCfg2Msg_([Key | T], Acc, Word_limitOld, Group) ->
%%	case getCfg:getCfgByKey(cfg_collect_word, Key) of
%%		#collect_wordCfg {
%%			id = ID,
%%			group = Group,
%%			collect_num = Collect_num,
%%			target1_id = Target1_id,
%%			target1_num = Target1_num,
%%			target2_id = Target2_id,
%%			target2_num = Target2_num,
%%			target3_id = Target3_id,
%%			target3_num = Target3_num,
%%			target4_id = Target4_id,
%%			target4_num = Target4_num,
%%			target5_id = Target5_id,
%%			target5_num = Target5_num,
%%			reward1_id = Reward1_id,
%%			reward1_num = Reward1_num,
%%			reward2_id = Reward2_id,
%%			reward2_num = Reward2_num,
%%			reward3_id = Reward3_id,
%%			reward3_num = Reward3_num,
%%			word_limit = Word_limit
%%		} ->
%%			Reward = #pk_collectionWords_RewardCfg{
%%				id = ID,
%%				group = Group,
%%				collect_num = Collect_num,
%%				listNeed = packCfg2Msg__([
%%					{Target1_id, Target1_num},
%%					{Target2_id, Target2_num},
%%					{Target3_id, Target3_num},
%%					{Target4_id, Target4_num},
%%					{Target5_id, Target5_num}
%%				], []),
%%				listReward = packCfg2Msg__([
%%					{Reward1_id, Reward1_num},
%%					{Reward2_id, Reward2_num},
%%					{Reward3_id, Reward3_num}
%%				], [])
%%			},
%%			packCfg2Msg_(T, [Reward | Acc], Word_limit, Group);
%%		_ ->
%%			packCfg2Msg_(T, Acc, Word_limitOld, Group)
%%	end.
%%packCfg2Msg__([], Acc) ->
%%	lists:reverse(Acc);
%%packCfg2Msg__([{0, _} | T], Acc) ->
%%	packCfg2Msg__(T, Acc);
%%packCfg2Msg__([{ItemID, ItemCount} | T], Acc) ->
%%	packCfg2Msg__(T, [#pk_itemIdAndCount{itemID = ItemID, count = ItemCount} | Acc]).
%%
%%-define(InitCount, 0).
%%
%%-spec freshCollectionWordsInfo() -> [{ID::uint(), Count::uint()},...].
%%freshCollectionWordsInfo() ->
%%	AwardIDList = getCfg:get1KeyList(cfg_collect_word),
%%	Fun =
%%		fun(AwardID,Acc) ->
%%			Count = playerDaily:getDailyCounter(?DailyType_EveryDay_Get_CollectWordsAward,AwardID),
%%			[{AwardID,Count} | Acc]
%%		end,
%%	NewList = lists:foldl(Fun,[],AwardIDList),
%%	?DEBUG("freshCollectionWordsInfo~w",[NewList]),
%%	NewList.
%%
%%%%玩家请求集字兑换
%%-spec requestCollectionWordsAward(AwardID :: uint16()) -> no_return().
%%requestCollectionWordsAward(AwardID) ->
%%	IsSuccess =
%%		case playerDrop:isOpen() of
%%			false ->
%%				?ERROR_CODE(?ErrorCode_CollectionWordsNotInTime),
%%				false;
%%			_ ->
%%				%% 首先检查兑换次数
%%				Count = playerDaily:getDailyCounter(?DailyType_EveryDay_Get_CollectWordsAward,AwardID),
%%				case getCfg:getCfgPStack(cfg_collect_word, AwardID) of
%%					#collect_wordCfg{collect_num = CollectNum} when not erlang:is_integer(CollectNum); CollectNum =< Count ->
%%						?ERROR_CODE(?ErrorCode_CollectionWordsCountLimit),
%%						false;
%%					Cfg ->
%%						RetCheck = awardCheck(Cfg),				%% 检查材料是否足够
%%						RetCost = awardCost(RetCheck),			%% 扣除材料
%%						awardDo(RetCost, Cfg, Count),			%% 发放奖励
%%%%						awardLog(RetCost),						%% 记录日志
%%						?DEBUG("RetCost~w",[RetCost]),
%%						RetCost
%%				end
%%		end,
%%	?DEBUG("IsSuccess~w",[IsSuccess]),
%%	playerMsg:sendNetMsg(#pk_GS2U_RequestCollectionWordsAwardAck{requestAwardID = AwardID, isSuccess = IsSuccess}).
%%
%%%% 检查材料是否足够
%%-spec awardCheck(#collect_wordCfg{}) -> {boolean(), [{uint(), uint()}, ...]}.
%%awardCheck(
%%	#collect_wordCfg{
%%		target1_id = Target1ID, target1_num = Target1Num,
%%		target2_id = Target2ID, target2_num = Target2Num,
%%		target3_id = Target3ID, target3_num = Target3Num,
%%		target4_id = Target4ID, target4_num = Target4Num,
%%		target5_id = Target5ID, target5_num = Target5Num
%%	}
%%) ->
%%	ListCost = [{Target1ID, Target1Num}, {Target2ID, Target2Num}, {Target3ID, Target3Num}, {Target4ID, Target4Num}, {Target5ID, Target5Num}],
%%	?DEBUG("ListCost~w",[ListCost]),
%%	awardCheck(ListCost, []);
%%awardCheck(_) ->
%%	{false, []}.	%% 配置错误
%%-spec awardCheck([{uint(), uint()}, ...], [{uint(), uint()}, ...]) -> {boolean(), [{uint(), uint()}, ...]}.
%%awardCheck([], Acc) ->
%%	{true, Acc};
%%awardCheck([{0, _Count} | T], Acc) ->
%%	awardCheck(T, Acc);
%%awardCheck([{ID, Count} | T], Acc) ->
%%	case playerPackage:getGoodsCount(ID) >= Count of
%%		true ->
%%			awardCheck(T, [{ID, Count} | Acc]);
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_CollectionWordsNotEnough),
%%			{false, []}
%%	end.
%%
%%%% 扣除材料
%%-spec awardCost({boolean(), [{uint(), uint()}, ...]}) -> boolean().
%%awardCost({false, _}) ->
%%	false;
%%awardCost({_, []}) ->
%%	true;
%%awardCost({_, [{ID, Count} | T]}) ->
%%	case playerPackage:checkAndCostGoods(ID, Count, ?PLogTS_CollectionWords, ?ItemDeleteReasonCollectionWords, 0) of
%%		true ->
%%			awardCost({true, T});
%%		_ ->
%%			false
%%	end.
%%
%%%% 发放奖励
%%-spec awardDo(boolean(), #collect_wordCfg{}, Count::uint()) -> no_return().
%%awardDo(false, _, _) ->
%%	skip;
%%awardDo(_, #collect_wordCfg{
%%	id = AwardID,
%%	reward1_id = Reward1ID, reward1_num = Reward1Num,
%%	reward2_id = Reward2ID, reward2_num = Reward2Num,
%%	reward3_id = Reward3ID, reward3_num = Reward3Num
%%}, _Count) ->
%%	playerDaily:incDailyCounter(?DailyType_EveryDay_Get_CollectWordsAward,AwardID),
%%	PLog = #recPLogTSItem{
%%		target = ?PLogTS_PlayerSelf,
%%		source = ?PLogTS_CollectionWords,
%%		changReason = ?ItemSourceCollectionWords_GiveReward
%%	},
%%	%%记录集字活动领奖的信息
%%	playerLogAdd:addLogParticipatorInfo(?LogParticipator_CollectionWords,AwardID),
%%	ListReward = [{Reward1ID, Reward1Num}, {Reward2ID, Reward2Num}, {Reward3ID, Reward3Num}],
%%	awardDo(ListReward, PLog).
%%-spec awardDo([{uint(), uint()}, ...], PLog::#recPLogTSItem{}) -> no_return().
%%awardDo([], _) ->
%%	ok;
%%awardDo([{0, _Count} | T], PLog) ->
%%	awardDo(T, PLog);
%%awardDo([{ID, Count} | T], PLog) ->
%%	Quality = playerPackage:getQualityFromCfg(ID),
%%	PLogNow = PLog#recPLogTSItem{
%%		new = Count,
%%		change = Count
%%	},
%%	playerPackage:addGoodsAndMail(ID, Count, false, Quality, PLogNow),
%%	awardDo(T, PLog).
%%
%%%% 记录日志
%%%%-spec awardLog(boolean()) -> no_return().
%%%%awardLog(false) ->
%%%%	skip;
%%%%awardLog(_) ->
%%%%	List = freshCollectionWordsInfo(),
%%%%	CountAlready = lists:sum([Count || {_, Count} <- List]),
%%%%	ListCfg = [getCfg:getCfgByKey(cfg_collect_word, Key) || Key <- getCfg:get1KeyList(cfg_collect_word)],
%%%%	CountCfg = lists:sum([Count || #collect_wordCfg{collect_num = Count} <- ListCfg]),
%%%%	case CountAlready >= CountCfg of
%%%%		true ->
%%%%			playerLogAdd:addLogParticipatorInfo(?LogParticipator_CompleteCollectionWords);
%%%%		_ ->
%%%%			playerLogAdd:addLogParticipatorInfo(?LogParticipator_CollectionWords)
%%%%	end.
