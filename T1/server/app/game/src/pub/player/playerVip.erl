%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 特权卡系统
%%% @end
%%% Created : 17. 十二月 2014 16:09
%%%-------------------------------------------------------------------
-module(playerVip).
-author("tiancheng").

-include("playerPrivate.hrl").

%% VIP_ID对应的公共属性
-define(VIP_PropList, [
	{?VIP_ID1, ?PriProp_Vip1},
	{?VIP_ID2, ?PriProp_Vip2},
	{?VIP_ID3, ?PriProp_Vip3}
]).

%% API
-export([
	init/0,
	buy/1,
	checkVip/0,
	checkVip/1,
	getVipPowerList/0,
	checkReward/0
]).

-export([
	gmBuy/1
]).

%% 初始化
-spec init() -> ok.
init() ->
	ok.

checkReward() ->
	case core:isCross() of
		false ->
			RoleID = playerState:getRoleID(),
			L = getCfg:get1KeyList(cfg_vip_card_eco),
			F =
				fun(VipID) ->
					case checkVip(VipID) of
						true ->
							#vip_card_ecoCfg{gift = Gift} = getCfg:getCfgByKey(cfg_vip_card_eco, VipID),
							case getCfg:getCfgByKey(cfg_item, Gift) of
								#itemCfg{} ->
									case playerDaily:getDailyCounter(?DailyType_VipReward, VipID) > 0 of
										true ->
											skip;
										_ ->
											MailItemList = playerMail:createMailGoods(Gift, 1, true, 0, RoleID, ?ItemSourceVipLevelAward),
											Title = stringCfg:getString(vipCardRewardTitle),
											Content = stringCfg:getString(vipCardRewardContent),
											mail:sendSystemMail(RoleID, Title, Content, MailItemList, ""),
											playerDaily:incDailyCounter(?DailyType_VipReward, VipID),
											ok
									end;
								_ when Gift > 0 ->
									?ERROR("checkReward roleID:~p, VipID:~p, itemID:~p not found",
										[RoleID, VipID, Gift]),
									skip;
								_ ->
									?DEBUG("checkReward not vip reward:~p,~p,~p", [RoleID, VipID, Gift]),
									skip
							end;
						_ ->
							?DEBUG("checkReward not vip:~p,~p", [RoleID, VipID]),
							skip
					end
				end,
			lists:foreach(F, L),
			ok;
		_ ->
			skip
	end,
	ok.

%% 检查是否是VIP，不限特权卡类型
-spec checkVip() -> boolean().
checkVip() ->
	F =
		fun({_VIP_ID, _PropID} = Key, Acc) ->
			case checkVip(Key) of
				true -> {true, 0};
				_ -> Acc
			end
		end,
	case misc:foldlEx(F, {false, 0}, ?VIP_PropList) of
		{true, _} -> true;
		_ -> false
	end.

%% 检查是不是指定的VIP
-spec checkVip(ID::uint()) -> boolean().
checkVip({ID, PropID}) ->
	case getCfg:getCfgByKey(cfg_vip_card_eco, ID) of
		#vip_card_ecoCfg{} ->
			OldValue = playerPropSync:getProp(PropID),
			NowTime = time2:getLocalDateTimeSec(),
			NowTime < OldValue;
		_ ->
			false
	end;
checkVip(ID) when erlang:is_integer(ID) ->
	case lists:keyfind(ID, 1, ?VIP_PropList) of
		{_, PropID} ->
			checkVip({ID, PropID});
		_ ->
			false
	end.

gmBuy(0) ->
	[buy(ID) || {ID, _} <- ?VIP_PropList];
gmBuy(ID) ->
	buy(ID).

%%爵位购买id
-spec buy(ID::uint32()) ->ok.
buy(ID) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Vip) of
		true ->
			case lists:keyfind(ID, 1, ?VIP_PropList) of
				{_, PropID} ->
					case getCfg:getCfgByKey(cfg_vip_card_eco, ID) of
						#vip_card_ecoCfg{day = Day, item_id = ItemID, item_num = ItemCount, name = VipName} ->
							OldValue = playerPropSync:getProp(PropID),
							NowTime = time2:getLocalDateTimeSec(),
							EndTime =
								case NowTime < OldValue of
									true ->
										%% 续费
										OldValue + Day * 24 * 3600;
									_ ->
										%% 新购
										time:getDayBeginSeconds(time2:convertSecToDateTime(NowTime)) + (Day + 1) * 24 * 3600
								end,
							playerPropSync:setInt64(PropID, EndTime),
							?INFO("buy vip roleID:~p, ID:~p, time[~p,~p,~p -> ~p]",
								[playerState:getRoleID(), ID, Day, OldValue, NowTime, EndTime]),

							%% 清除一下CD
							playerVipInter:cleanCD(),

							%% 发放每次购买的奖励
							rewardEveryBuy(ItemID, ItemCount, VipName),

							%% 立即检测一次是否领奖
							checkReward(),

							%% 刷新一下商城次数
							playerMall:requestMallInfo(0, ?MallSendType_Mall),
							ok;
						_ ->
							?ERROR("buy vip roleID:~p, ID:~p", [playerState:getRoleID(), ID]),
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%% 获取VIP特权列表
-spec getVipPowerList() -> [{VIP_ID::uint(), FunctionID::uint()}, ...].
getVipPowerList() ->
	F =
		fun({VIP_ID, _PropID} = Key, AccList) ->
			case checkVip(Key) of
				true ->
					Key2List = getCfg:get2KeyList(cfg_vip_card_effect, VIP_ID),
					FT =
						fun(EID, AccL) ->
							case getCfg:getCfgByKey(cfg_vip_card_effect, VIP_ID, EID) of
								#vip_card_effectCfg{function_id = 0} -> AccL;
								_ -> [{VIP_ID, EID} | AccL]
							end
						end,
					lists:foldl(FT, AccList, Key2List);
				_ ->
					AccList
			end
		end,
	lists:foldl(F, [], ?VIP_PropList).

%% 发放每次购买的奖励
-spec rewardEveryBuy(ItemID::uint16(), ItemCount::uint(), VipName::string()) -> no_return().
rewardEveryBuy(ItemID, ItemCount, VipName) when erlang:is_integer(ItemID), erlang:is_integer(ItemCount), ItemCount > 0 ->
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{quality = Quality} ->
			RoleID = playerState:getRoleID(),
			MailItemList = playerMail:createMailGoods(ItemID, ItemCount, true, Quality, RoleID, ?ItemSourceEveryBuyVIP),
			Title = stringCfg:getString(vip_buy_title),
			Content = stringCfg:getString(vip_buy_content, [VipName]),
			mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
		_ ->
			skip
	end;
rewardEveryBuy(ItemID, ItemCount, VipName) ->
	?WARN("rewardEveryBuy failed ItemID:~w ItemCount:~w VipName:~s", [ItemID, ItemCount, VipName]),
	skip.
