%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 点金手
%%% @end
%%% Created : 24. 五月 2017 19:20
%%%-------------------------------------------------------------------
-module(playerMoneyTree).
-author("Administrator").
-include("cfg_price.hrl").
-include("playerPrivate.hrl").

-define(DailySubType_MoneyTree_Number, 1).
-define(DailySubType_MoneyTree_CD, 2).
-define(MoneyTreeFree_Times, 2).
%% API
-export([
	giveMeMoney/0

]).



%%%-------------------------------------------------------------------
giveMeMoney()->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_MoneyTree) of
		true ->
			case getCfg:getCfgPStack(cfg_welfare, 14) of
				#welfareCfg{parameter = Value2} ->

					case playerState:getLevel() >= Value2 of
						true ->
							case canGiveMoney() of
								{true, Cost}->
									doGiveMoney(Cost);
								{_, ErrorCode}->
									playerMsg:sendErrorCodeMsg(ErrorCode)
							end;
						_->
							playerMsg:sendTipsErrorCodeMsg(?ErrorCode_YourLevelIsTooLower)
					end;
				_->
					skip
			end;
		_ ->
			skip
	end,

	ok.

%%%-------------------------------------------------------------------
canGiveMoney()->


	NC = getNumber()+1,
	MC = getMaxNumber(),
	{Cost,CoinUseType} = getCost(NC),
	case NC =< MC of
		true->
			checkCost(Cost,CoinUseType);
		_ ->
			{false, ?ErrorCode_UseSkillErrorNoUseCounter}
	end.

%%%-------------------------------------------------------------------
checkCost(0,_CoinUseType)->
	{true, {?CoinUseTypeGold, 0}};	%% 策划可能配置为0导致后续逻辑错误，这里随便给个coinUseType，反正要扣除的值都是0
checkCost(Cost,CoinUseType)->
	case playerMoney:canUseCoin(CoinUseType,Cost) of
		true ->
			{true, {CoinUseType, Cost}};
		_ ->
			{false, ?ErrorCode_SystemNotEnoughMoney}
	end.

%%%-------------------------------------------------------------------
doGiveMoney({CoinUseType, Cost})->


	PLog = #recPLogTSMoney{reason = ?CoinUseMoneyTree, param = [], target = ?PLogTS_MoneyTree, source = ?PLogTS_PlayerSelf},
	% 由于第一次免费上面传入参数为{100,0} 后面修改扣除钱的时候不能为0 这里处理一下
	IsOk = case Cost =< 0 of
      true ->
	      true;
      _ ->
		   playerMoney:useCoin(CoinUseType, Cost, PLog)
      end,
	case IsOk of
		  true->
			  incNumber(),
			  BoxRate = getBoxRate(),
			  {_,_,AddBoxMoney} =
				  case lists:keyfind(getNumber(),1,BoxRate) of
					  false ->  {0,0,0};
					  Rec ->
						  Rec
				  end,
			  BoxCoin =   getCoinBox(),
			  BoxTotal = misc:ceil(AddBoxMoney * BoxCoin),
			  RandRate = getRandRate(),
			  BaseCoin = getBaseCoin(),
			  TotalCoin = misc:ceil(RandRate * BaseCoin) ,

			  playerMoney:addCoin(
				  ?CoinTypeGold
				  , TotalCoin + BoxTotal
				  , #recPLogTSMoney{
					  reason = ?CoinSourceMoneyTree,
					  param = [],
					  target = ?PLogTS_PlayerSelf,
					  source = ?PLogTS_PlayerSelf
				  }),
			  playerMsg:sendNetMsg(#pk_GS2U_MoneyTreeAck{
				  totalMoney = TotalCoin, boxMoney = BoxTotal, rate = RandRate
			  });
		_->
			ship
	end,
	%%onGiveMoney(Cost, getNumber()),
	ok.

%%%-------------------------------------------------------------------
%%onGiveMoney(0, _Number)->
%%	%%setCD(),
%%	ok;
%%onGiveMoney(_Cost, Number)->
%%	BoxRate = getBoxRate(),
%%	{_,_,AddBoxMoney} =
%%	case lists:keyfind(Number,1,BoxRate) of
%%		  false ->  {0,0,0};
%%		Rec ->
%%			Rec
%%     end,
%%	BoxBase = getBoxBaseCoin(Number),
%%	BoxTotal = misc:ceil(AddBoxMoney * BoxRate),
%%	case BoxTotal > 0 of
%%		true ->
%%			playerMoney:addCoin(
%%				?CoinTypeGold
%%				, BoxTotal
%%				, #recPLogTSMoney{
%%					reason = ?CoinSourceMoneyTree,
%%					param = [],
%%					target = ?PLogTS_PlayerSelf,
%%					source = ?PLogTS_PlayerSelf
%%				}),
%%			playerMsg:sendNetMsg(#pk_GS2U_MoneyTreeBox{
%%				totalMoney = BoxTotal, rate = BoxRate
%%			});
%%		_ ->
%%			skip
%%	end.

%%%-------------------------------------------------------------------
getCost(CN) ->
	case CN < ?MoneyTreeFree_Times of
		true ->
			{0,0};
		_ ->
			case getCfg:getCfgByArgs(cfg_price, CN) of
				#priceCfg{coinBuy   =  CoinBuy,coinType = CoinUseType} ->
					{CoinBuy,CoinUseType};	%% 字段为coinType实际应为CoinUseType
				_ ->
					{0,0}
			end
	end.

%%%-------------------------------------------------------------------
getBaseCoin()->
	Level = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_indexFunction, Level) of
		#indexFunctionCfg{coinAddition  =  CoinAddition} ->
			CoinAddition;
		_ ->
			0
	end.

getCoinBox()->
	Level = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_indexFunction, Level) of
		#indexFunctionCfg{coinHand_box =   CoinHand_box} ->
			CoinHand_box;
		_ ->
			0
	end.

%%%-------------------------------------------------------------------
%%getBoxBaseCoin(Number)->
%%	L =
%%	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_limit) of
%%		#globalsetupCfg{setpara = V} ->
%%			V;
%%		_ ->
%%			[]
%%	end,
%%	case lists:keyfind(Number, 1, L) of
%%		{_, Base} ->
%%			Base;
%%		_ ->
%%			0
%%	end.

getBoxRate()->
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_box) of
		#globalsetupCfg{setpara = V} ->
			V;
		_ ->
			[]
	end.

%%%-------------------------------------------------------------------
getRandRate()->
	L = getRandList(),
	misc:calcOddsByWeightList(L).

getRandList()->
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_rate) of
         #globalsetupCfg{setpara = V} ->
           V;
         _ ->
         []
end.
%%%-------------------------------------------------------------------
getMaxNumber() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_limit) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			10
	end.

%%%-------------------------------------------------------------------
%%getCfgFreeCd()->
%%	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_cd) of
%%		#globalsetupCfg{setpara = [V]} ->
%%			V;
%%		_ ->
%%			3600
%%	end.

%%%-------------------------------------------------------------------
getNumber()->
	playerDaily:getDailyCounter(?DailyType_MoneyTree
		, ?DailySubType_MoneyTree_Number).


incNumber()->
	playerDaily:incDailyCounter(?DailyType_MoneyTree
		, ?DailySubType_MoneyTree_Number).



%%%-------------------------------------------------------------------



