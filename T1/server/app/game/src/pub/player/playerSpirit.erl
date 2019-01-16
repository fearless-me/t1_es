%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 十二月 2017 14:27
%%%-------------------------------------------------------------------
-module(playerSpirit).
-author("mawenhong").

-include("playerPrivate.hrl").

-define(DailyType_SpiritValue_Sub_BuyCount, 0).

%% API
-export([
	init/0,
	tick/0,
	buy/0,
	getV/0,
	dec/1
]).

%%%-------------------------------------------------------------------
init() ->
	LV1 = getLimit1(),
	CV = getV(),
	LastTime = getLastTime(),
	NowSec = nowTime(),
	OneNeedSec = oneNeedSecond(),
	case CV < LV1 of
		true ->
			AddV =
				if
					LastTime =:= 0 ->
						LV1;
					true ->
						trunc((NowSec - LastTime) / OneNeedSec)
				end,
			RealVal = erlang:min((LV1 - CV), AddV),
			add(RealVal),
			setLastTime(NowSec),
			ok;
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
tick() ->
	CanAdd = isCanAddThisSec(),
	case CanAdd of
		true ->
			add(1),
			ok;
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
buy() ->
	case canBuy() of
		{true, CoinUse, UseCount} ->
			doBuy(CoinUse, UseCount);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

%%%-------------------------------------------------------------------
doBuy(CoinUseType, UseCount) ->
	true =
		playerMoney:useCoin(
			CoinUseType,
			UseCount,
			#recPLogTSMoney{reason = ?CoinUseSpirit, param = 0, target = ?PLogTS_System, source = ?PLogTS_PlayerSelf}
		),
	playerDaily:incDailyCounter(?DailyType_SpiritValue, ?DailyType_SpiritValue_Sub_BuyCount),
	add(100),
	ok.


canBuy() ->
	Max = getMaxBuyCount(),
	Buy = playerDaily:getDailyCounter(
		?DailyType_SpiritValue,
		?DailyType_SpiritValue_Sub_BuyCount
	),
	{CoinUseType, UseCount} = getBuyCost(),
	case Buy >= Max of
		false ->
			case playerMoney:canUseCoin(CoinUseType, UseCount) of
				true ->
					case getV() + UseCount >= getLimit2() of
						false ->
							{true, CoinUseType, UseCount};
						_ ->
							{false, ?ErrorCode_LifeSkill_CantBuyMax}
					end;
				_ ->
					{false, ?ErrorCode_LifeSkill_NoMoney}
			end;
		_ ->
			{false, ?ErrorCode_LifeSkill_CantBuy}
	end.

%%%-------------------------------------------------------------------
add(Delta) ->
	NewVal = getV() + Delta,
	set(NewVal),
	ok.

set(NewVal) ->
	playerPropSync:setInt(?PriProp_SpiritValue, NewVal).

getV() ->
	playerPropSync:getProp(?PriProp_SpiritValue).

getLastTime() ->
	playerPropSync:getProp(?PriProp_SpiritTickTime).

setLastTime(Time) ->
	playerPropSync:setInt64(?PriProp_SpiritTickTime, Time).

dec(DeltaVal) ->
	Val = getV(),
	Limit1 = getLimit1(),
	case DeltaVal =< Val andalso DeltaVal > 0 of
		true ->
			NewVal = Val - DeltaVal,
			set(NewVal),
			if
				Val >= Limit1 andalso NewVal < Limit1 ->
					setLastTime(nowTime()),
					ok;
				true -> skip
			end,
			true;
		_ -> false
	end.
%%%-------------------------------------------------------------------

getLimit1() ->
	Level = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_indexGrowth, Level) of
		#indexGrowthCfg{energy_limit1 = LV1} -> LV1;
		_ -> 100
	end.

getLimit2() ->
	Level = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_indexGrowth, Level) of
		#indexGrowthCfg{energy_limit2 = LV2} -> LV2;
		_ -> 120
	end.


isCanAddThisSec() ->
	M = oneNeedSecond(),
	E = getV() >= getLimit1(),
	N = nowTime(),
	case E of
		true ->
			false;
		_ ->
			case N - getLastTime() >= M of
				true ->
					setLastTime(N),
					true;
				_ ->
					false
			end
	end.


oneNeedSecond() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, energy_recover) of
		#globalsetupCfg{setpara = [X, Minutes]} when X > 0 ->
			trunc(Minutes * 60 / X);
		_ ->
			20 * 60
	end.

getMaxBuyCount() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, energy_buytimes) of
		#globalsetupCfg{setpara = [Times]} ->
			Times;
		_ ->
			2
	end.

getBuyCost() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, energy_buy) of
		#globalsetupCfg{setpara = [UseType, Count]} ->
			{UseType, Count};
		_ ->
			{103, 5000}
	end.

nowTime() -> misc_time:localtime_seconds().
%%%-------------------------------------------------------------------
