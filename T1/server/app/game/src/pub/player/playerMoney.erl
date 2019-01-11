%%%-------------------------------------------------------------------
%%% @author zhongyuanwei
%%% @copyright (C) 2018, raink
%%% @doc
%%% 角色货币模块
%%% Created : ???????? build
%%%           20180207 添加冻结钻石与钻石关联，梳理模块
%%%           20180713 检查整理模块
%%%                    模块内函数谨慎重复调用模块内api，防止死循环以及重复检查
%%% @end
%%%-------------------------------------------------------------------
-module(playerMoney).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% 基于货币类型的接口
-export([
	addCoin/3		%% 基于货币类型的添加
	%%decCoin/3,	%% 基于货币类型的扣除 废弃，使用useCoin/3代替
	%%canDecCoin/2	%% 基于货币类型的判断 废弃，使用canDecCoin/2代替
]).

%% 基于货币使用类型的接口
-export([
	canUseCoin/2,	%% 基于货币使用类型的判断
	useCoin/3		%% 基于货币使用类型的扣除
]).

%% 冻结钻石特殊处理接口
-export([
	canLockDiamond/1,	%% 判断是否可以冻结
	lockDiamond/2,		%% 执行冻结
	canUnlockDiamond/1,	%% 判断是否可以解冻
	unlockDiamond/2		%% 执行解冻
]).

-export([
	useMoneyInCross/4,
	playerCrossCost/1
]).

-export([
	addLog/8,
	getCoinInfo/1,	%% 获取货币信息，用于替代playerState:getCoin/1兼容useCoin/3
	coinType2CoinUseType/1,
	coinUseType2CoinType/1
]).

-export([
	fixLockDiamond/0
]).

%%%-------------------------------------------------------------------
%% api:基于货币类型的添加
-spec addCoin(CoinType, CoinNum, PLog) -> boolean() when
	CoinType :: coinType(),
	CoinNum :: uint(),
	PLog :: #recPLogTSMoney{}.
addCoin(_CoinType, 0, _PLog) ->
	true;	%% 特殊处理0为成功
addCoin(?CoinTypeLockDiamond, CoinNum, PLog) ->
	%% 不能使用该接口操作冻结钻石
	?ERROR(
		"addCoin fail roleID:~w,CoinType=~w,CoinNum=~w,PLog=~p",
		[playerState:getRoleID(), ?CoinTypeLockDiamond, CoinNum, PLog]
	),
	false;
addCoin(CoinType, CoinNum, #recPLogTSMoney{} = PLog)
	when CoinType >= ?CoinTypeMin, CoinType =< ?CoinTypeMax,
	erlang:is_integer(CoinNum), CoinNum > 0 ->
	case core:isCross() of
		true ->
			%% 跨服货币添加警告
			?WARN(
				"addCoin cross warn roleID:~w,CoinType=~w,CoinNum=~w,PLog=~p",
				[playerState:getRoleID(), CoinType, CoinNum, PLog]
			);
		_ ->
			skip
	end,
	%% 如果添加的是个人贡献（?CoinTypeGuildContribute），有额外的限制和处理
	case CoinType of
		?CoinTypeGuildContribute ->
			case playerGuild:checkPlayerContributeAndAddPlayerLiveness(CoinNum) of
				0 ->
					false;
				CoinNumReal ->
					iChangeCoin(CoinType, CoinNumReal, PLog)
			end;
		_ ->
			iChangeCoin(CoinType, CoinNum, PLog)
	end;
addCoin(CoinType, CoinNum, PLog) ->
	?ERROR(
		"addCoin fail roleID:~w,CoinType=~w,CoinNum=~w,PLog=~p",
		[playerState:getRoleID(), CoinType, CoinNum, PLog]
	),
	false.

%%%-------------------------------------------------------------------
%% internal:内部改变货币的函数
-spec iChangeCoin(CoinType, CoinNum, PLog) -> boolean() when
	CoinType :: coinType(),
	CoinNum :: uint(),
	PLog :: #recPLogTSMoney{}.
iChangeCoin(_CoinType, 0, _PLog) ->
	true;	%% 不需要变化，略过
iChangeCoin(CoinType, CoinNum, #recPLogTSMoney{reason = Reason, target = Target} = PLog) ->
	%% 改变的值必须是正数（添加）或者当前值够扣除
	case playerState:getCoin(CoinType) of
		OldCoin when erlang:is_integer(OldCoin) andalso
			(CoinNum > 0 orelse OldCoin >= -CoinNum) ->
			%% 计算变化值
			NewCoin = misc:clamp(OldCoin + CoinNum, 0, ?PlayerCoinMax),
			playerState:setCoin(CoinType, NewCoin),
			%% 各种后续处理
			iChangeCoin_saveNow(CoinType),									%% 实时保存关键货币
			iChangeCoin_addLog(CoinType, NewCoin, CoinNum, OldCoin, PLog),	%% 记录货币变化日志
			iChangeCoin_achieve(CoinType, CoinNum),							%% 成就统计
			iChangeCoin_business(Reason, Target, CoinType, CoinNum),		%% 商业化消费统计
			playerGatherBattle:changeGatherBattlePoint(						%% ?CoinTypeGatherPoint特殊处理
				CoinType, OldCoin, NewCoin, CoinNum, Reason
			),
			iChangeCoin_msg(CoinType, NewCoin, Reason),                     %% 协议
			%% 针对货币溢出打印日志
			case OldCoin + CoinNum > ?PlayerCoinMax of
				true ->
					?INFO(
						"iChangeCoin overflow!!! roleID:~w coinType:~w coinNum:~w PLog:~w",
						[playerState:getRoleID(), CoinType, CoinNum, PLog]
					);
				_ ->
					skip
			end,
			true;
		_ ->
			%% 这里的错误是不可容忍的，因为之前已经验证过条件了
			?ERROR(
				"iChangeCoin faild! roleID:~w CoinType:~w CoinNum:~w PLog:~p~n~p",
				[playerState:getRoleID(), CoinType, CoinNum, PLog, misc:getStackTrace()]
			),
			false
	end.

%%%-------------------------------------------------------------------
%% internal:内部改变货币的函数_实时保存关键货币
-spec iChangeCoin_saveNow(CoinType::coinType()) -> no_return().
iChangeCoin_saveNow(?CoinTypeDiamond = CoinType) ->
	playerSave:updateRoleCoin(CoinType, playerState:getRoleID());
iChangeCoin_saveNow(?CoinTypeBindDiamond = CoinType) ->
	playerSave:updateRoleCoin(CoinType, playerState:getRoleID());
iChangeCoin_saveNow(?CoinTypeScore = CoinType) ->
	playerSave:updateRoleCoin(CoinType, playerState:getRoleID());
iChangeCoin_saveNow(?CoinTypeLockDiamond = CoinType) ->
	playerSave:updateRoleCoin(CoinType, playerState:getRoleID());
iChangeCoin_saveNow(_CoinType) ->
	skip.

%%%-------------------------------------------------------------------
%% internal:内部改变货币的函数_成就统计
-spec iChangeCoin_achieve(CoinType::coinType(), CoinNum::uint()) -> no_return().
iChangeCoin_achieve(?CoinTypeBindDiamond, CoinNum) when CoinNum < 0 ->
	Num = erlang:min(playerPropSync:getProp(?PriProp_GoogleAchieve_Coin6) - CoinNum, ?UINT64_MAX),
	playerPropSync:setInt64(?PriProp_GoogleAchieve_Coin6, Num);
iChangeCoin_achieve(_CoinType, CoinNum) when CoinNum =< 0 ->
	skip;
iChangeCoin_achieve(?CoinTypeGold, CoinNum) ->
	playerAchieve:achieveEvent(?Achieve_MoneyWayward1, [CoinNum]);
iChangeCoin_achieve(?CoinTypeScore, CoinNum) ->
	playerAchieve:achieveEvent(?Achieve_Integral, [CoinNum]);
iChangeCoin_achieve(_CoinType, _CoinNum) ->
	skip.

%%%-------------------------------------------------------------------
%% internal:内部改变货币的函数_商业化消费统计
-spec iChangeCoin_business(Reason::uint(), Target::uint(), CoinType::coinType(), CoinNum::uint()) -> no_return().
iChangeCoin_business(_Reason, _Target, _CoinType, CoinNum) when CoinNum >= 0 ->
	skip;
iChangeCoin_business(?CoinUseTradeBuy, ?PLogTS_Trade, _CoinType, _CoinNum) ->
	ok;
iChangeCoin_business(?CoinUseSendRed, ?PLogTS_RedEnvelope, _CoinType, _CoinNum) ->
	ok;
iChangeCoin_business(_Reason, _Target, CoinType, CoinNum) ->
	case core:isCross() of
		false ->
			playerRecharge2:consumeDiamond(CoinType, CoinNum),
			case CoinType of
				?CoinTypeDiamond ->
					%% 非绑定钻石消费活动(不计交易行的钻石交易)
					playerACChargeOrUse:onUseDiamon(erlang:abs(CoinNum));
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
%% internal:保存货币变化日志
-spec iChangeCoin_addLog(CoinType, NewCoin, CoinNum, OldCoin, #recPLogTSMoney{}) -> ok when
	CoinType::coinType(), NewCoin::uint(), CoinNum::uint(), OldCoin::uint().
iChangeCoin_addLog(CoinType, NewCoin, CoinNum, OldCoin, #recPLogTSMoney{} = PLog) ->
	{_Fgi, _FedID, PlatformName} = playerState:getFuncellInfo(),
	addLog(
		CoinType, NewCoin, CoinNum, OldCoin, PLog, PlatformName,
		playerState:getRoleID(), playerState:getAccountID()
	).

%%%-------------------------------------------------------------------
%% internal:协议
-spec iChangeCoin_msg(CoinType, NewCoin, Reason) -> ok when
	CoinType::coinType(), NewCoin::uint(), Reason::uint().
iChangeCoin_msg(?CoinTypeLockDiamond, NewCoin, Reason) ->
	%% 冻结钻石变化，对于客户端来说是钻石变化
	playerMsg:sendNetMsg(#pk_GS2U_PlayerChangedWealth{
		type = ?CoinTypeLockDiamond,
		wealth = NewCoin,
		reason = Reason
	}),
	playerMsg:sendNetMsg(#pk_GS2U_PlayerChangedWealth{
		type = ?CoinTypeDiamond,
		wealth = playerState:getCoin(?CoinTypeDiamond) - NewCoin,
		reason = Reason
	});
iChangeCoin_msg(?CoinTypeDiamond, NewCoin, Reason) ->
	%% 钻石变化，需要计算冻结钻石部分
	playerMsg:sendNetMsg(#pk_GS2U_PlayerChangedWealth{
		type = ?CoinTypeDiamond,
		wealth = NewCoin - playerState:getCoin(?CoinTypeLockDiamond),
		reason = Reason
	});
iChangeCoin_msg(CoinType, NewCoin, Reason) ->
	playerMsg:sendNetMsg(#pk_GS2U_PlayerChangedWealth{
		type = CoinType,
		wealth = NewCoin,
		reason = Reason
	}).

%% 废弃，使用useCoin/3代替
%%%%-------------------------------------------------------------------
%%% api:基于货币类型的扣除
%%spec decCoin(CoinType, CoinNum, PLog) -> boolean() when
%%	CoinType :: coinType(),
%%	CoinNum :: uint(),
%%	PLog :: #recPLogTSMoney{}.
%%ecCoin(_CoinType, 0, _PLog) ->
%%	true;	%% 特殊处理0为成功
%%ecCoin(CoinType, CoinNum, PLog)
%%	when CoinType =:= ?CoinTypeLockDiamond;
%%	CoinType =:= ?CoinTypeBindDiamond ->
%%	%% 不能使用该接口操作冻结钻石和绑定钻石
%%	?ERROR(
%%		"decCoin fail roleID:~w,CoinType=~w,CoinNum=~w,PLog=~p",
%%		[playerState:getRoleID(), CoinType, CoinNum, PLog]
%%	),
%%	false;
%%ecCoin(CoinType, CoinNum, #recPLogTSMoney{} = PLog)
%%	when CoinType >= ?CoinTypeMin, CoinType =< ?CoinTypeMax,
%%	erlang:is_integer(CoinNum), CoinNum > 0 ->
%%	case iCanDecCoin(CoinType, CoinNum) of
%%		true ->
%%			iChangeCoin(CoinType, -CoinNum, PLog);
%%		_ ->
%%			false
%%	end;
%%ecCoin(CoinType, CoinNum, PLog) ->
%%	?ERROR(
%%		"decCoin fail roleID:~w,CoinType=~w,CoinNum=~w,PLog=~p",
%%		[playerState:getRoleID(), CoinType, CoinNum, PLog]
%%	),
%%	false.

%% 废弃，使用canUseCoin/2代替
%%%%%-------------------------------------------------------------------
%%%% api:基于货币类型的判断
%%-spec canDecCoin(CoinType, CoinNum) -> boolean() when
%%	CoinType :: coinType(),
%%	CoinNum :: uint().
%%canDecCoin(_CoinType, 0) ->
%%	true;	%% 特殊处理0为允许
%%canDecCoin(CoinType, CoinNum)
%%	when CoinType >= ?CoinTypeMin, CoinType =< ?CoinTypeMax,
%%	erlang:is_integer(CoinNum), CoinNum > 0 ->
%%	iCanDecCoin(CoinType, CoinNum);
%%canDecCoin(CoinType, CoinNum) ->
%%	?ERROR(
%%		"canDecCoin fail roleID:~w,CoinType=~w,CoinNum=~w~n~p",
%%		[playerState:getRoleID(), CoinType, CoinNum, misc:getStackTrace()]
%%	),
%%	false.

%%%-------------------------------------------------------------------
%% internal:内部判断货币是否可以使用
-spec iCanDecCoin(CoinType, CoinNum) -> boolean() when
	CoinType :: coinType(), CoinNum :: uint().
iCanDecCoin(?CoinTypeDiamond, CoinNum) ->
	%% 判断钻石时需要计算冻结钻石
	case playerState:getCoin(?CoinTypeDiamond) of
		Num when erlang:is_integer(Num) ->
			case playerState:getCoin(?CoinTypeLockDiamond) of
				LockNum when erlang:is_integer(LockNum) ->
					Num - LockNum >= CoinNum;
				ErrorLock ->
					?ERROR(
						"undefined:~w roleID:~w coinType:~w~n~p",
						[ErrorLock, playerState:getRoleID(), ?CoinTypeLockDiamond, misc:getStackTrace()]
					),
					false
			end;
		Error ->
			?ERROR(
				"undefined:~w roleID:~w coinType:~w~n~p",
				[Error, playerState:getRoleID(), ?CoinTypeDiamond, misc:getStackTrace()]
			),
			false
	end;
iCanDecCoin(?CoinTypeGatherPoint = CoinType, CoinNum) ->
	%% 仅非跨服能消耗
	case core:isCross() of
		false ->
			iCanDecCoin_(CoinType, CoinNum);
		_ ->
			false
	end;
iCanDecCoin(CoinType, CoinNum) ->
	iCanDecCoin_(CoinType, CoinNum).
iCanDecCoin_(CoinType, CoinNum) ->
	case playerState:getCoin(CoinType) of
		Num when erlang:is_integer(Num) ->
			Num >= CoinNum;
		Error ->
			?ERROR(
				"undefined:~w roleID:~w coinType:~w~n~p",
				[Error, playerState:getRoleID(), CoinType, misc:getStackTrace()]
			),
			false
	end.

%%%-------------------------------------------------------------------
%% api:基于货币使用类型的判断
-spec canUseCoin(CoinUseType, CoinNum) -> boolean() when
	CoinUseType :: coinUseType(), CoinNum :: uint().
canUseCoin(_CoinUseType, 0) ->
	true;	%% 特殊处理0为允许
canUseCoin(CoinUseType, CoinNum)
	when not (erlang:is_integer(CoinNum) andalso CoinNum > 0) ->
	?ERROR(
		"canUseCoin fail roleID:~w,CoinUseType=~w,CoinNum=~w~n~p",
		[playerState:getRoleID(), CoinUseType, CoinNum, misc:getStackTrace()]
	),
	false;
canUseCoin(?CoinUseTypeDiamond, CoinNum) ->
	iCanDecCoin(?CoinTypeBindDiamond, ?CoinTypeDiamond, CoinNum) =/= false;
canUseCoin(CoinUseType, CoinNum) ->
	case lists:keyfind(CoinUseType, 1, ?CoinUseType2CoinType) of
		false ->
			?ERROR(
				"canUseCoin fail roleID:~w,CoinUseType=~w,CoinNum=~w~n~p",
				[playerState:getRoleID(), CoinUseType, CoinNum, misc:getStackTrace()]
			),
			false;
		{_, CoinType} ->
			iCanDecCoin(CoinType, CoinNum)
	end.

%%%-------------------------------------------------------------------
%% internal:内部判断货币是否可以使用（多种货币）
-spec iCanDecCoin(CoinType, CoinTypeRC, CoinNum) -> Ret when
	CoinType :: coinType(), CoinTypeRC :: coinType(), CoinNum :: uint(),
	Ret :: false | {CostCoinRC, AddCoin},
	CostCoinRC :: uint(), AddCoin :: uint().
iCanDecCoin(?CoinTypeBindDiamond = CoinType, ?CoinTypeDiamond = CoinTypeRC, CoinNum) ->
	Num = playerState:getCoin(CoinType),
	case Num >= CoinNum of
		true ->
			{0, 0};	%% 没有涉及兑换
		_ ->
			case getCfg:getCfgPStack(cfg_globalsetup, star_moon_exchange) of
				#globalsetupCfg{setpara = [ValueRatio]} when erlang:is_number(ValueRatio) ->
					NumRC = playerState:getCoin(CoinTypeRC) - playerState:getCoin(?CoinTypeLockDiamond),
					Need = CoinNum - Num,
					NeedRC = misc:ceil(Need / ValueRatio),
					case NeedRC =< NumRC of
						true ->
							Add = misc:floor(NeedRC * ValueRatio),
							case Add + Num > ?PlayerCoinMax of
								true ->
									false;	%% 货币超过上限无法执行兑换
								_ ->
									%% 花费NeedRC，得到Add
									{NeedRC, Add}
							end;
						_ ->
							false	%% 兑换了也不够
					end;
				_ ->
					false	%% 配置错误
			end
	end;
iCanDecCoin(CoinType, CoinTypeRC, CoinNum) ->
	%% 暂不支持其它的双重货币扣除
	?ERROR(
		"canDecCoinInternal faild roleID:~w CoinType:~w CoinTypeRC:~w CoinNum:~w~n~p",
		[playerState:getRoleID(), CoinType, CoinTypeRC, CoinNum, misc:getStackTrace()]
	),
	false.

%%%-------------------------------------------------------------------
%% api:基于货币使用类型的扣除
-spec useCoin(CoinUseType, CoinNum, PLog) -> boolean() when
	CoinUseType :: coinUseType(),
	CoinNum :: uint(),
	PLog :: #recPLogTSMoney{}.
useCoin(_CoinUseType, 0, _PLog) ->
	true;	%% 特殊处理0为成功
useCoin(CoinUseType, CoinNum, PLog) ->
	%% 已在canUseCoin/2中验证CoinUseType和CoinNum
	iUseCoin(canUseCoin(CoinUseType, CoinNum), CoinUseType, CoinNum, PLog).

%%%-------------------------------------------------------------------
%% internal:基于货币使用类型的扣除
-spec iUseCoin(IsCan, CoinUseType, CoinNum, PLog) -> boolean() when
	IsCan :: boolean(),
	CoinUseType :: coinUseType(),
	CoinNum :: uint(),
	PLog :: #recPLogTSMoney{}.
iUseCoin(false, _CoinUseType, _CoinNum, _PLog) ->
	false;
iUseCoin(_, ?CoinUseTypeDiamond, CoinNum, #recPLogTSMoney{} = PLog) ->
	%% 蓝钻不足需要自动使用红钻兑换
	%% 这里强匹配是因为上文已经成功执行过一次iCanDecCoin/3
	{CostCoinRC, AddCoin} = iCanDecCoin(?CoinTypeBindDiamond, ?CoinTypeDiamond, CoinNum),
	RetA =
		case CostCoinRC > 0 of
			true ->
				iChangeCoin(?CoinTypeDiamond, -CostCoinRC, #recPLogTSMoney{
					target = ?PLogTS_Coin3to6,
					source = ?PLogTS_PlayerSelf,
					reason = ?CoinUseBindDiamondCostDiamond,
					param = PLog#recPLogTSMoney.reason
				});
			_ ->
				true
		end,
	RetB =
		case AddCoin > 0 of
			true ->
				iChangeCoin(?CoinTypeBindDiamond, AddCoin, #recPLogTSMoney{
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_Coin3to6,
					reason = ?CoinSourceBindDiamondCostDiamond,
					param = PLog#recPLogTSMoney.reason
				});
			_ ->
				true
		end,
	case RetA andalso RetB of
		true ->
			%% 因为上述自动兑换可能因为金额上限导致不完全成功，因此需要第二次判断
			case iCanDecCoin(?CoinTypeBindDiamond, ?CoinTypeDiamond, CoinNum) of
				{0, 0} ->
					iChangeCoin(?CoinTypeBindDiamond, -CoinNum, PLog);
				_ ->
					false
			end;
		_ ->
			false
	end;
iUseCoin(_, CoinUseType, CoinNum, #recPLogTSMoney{} = PLog)
	when CoinUseType >= ?CoinUseTypeMin, CoinUseType =< ?CoinUseTypeMax ->
	{_, CoinType} = lists:keyfind(CoinUseType, 1, ?CoinUseType2CoinType),
	iChangeCoin(CoinType, -CoinNum, PLog);
iUseCoin(_, UseCoinType, CoinNum, PLog) ->
	?ERROR(
		"useCoin failed UseCoinType[~p] Num[~p] in useCoin Reason[~p]",
		[UseCoinType, CoinNum, PLog]
	),
	false.

%%%-------------------------------------------------------------------
%% api:判断是否可以冻结
-spec canLockDiamond(CoinNum::uint()) -> boolean().
canLockDiamond(0) ->
	true;	%% 特殊处理0为允许
canLockDiamond(CoinNum) when erlang:is_integer(CoinNum), CoinNum > 0 ->
	iCanDecCoin(?CoinTypeDiamond, CoinNum).	%% 实现相同

%%%-------------------------------------------------------------------
%% api:执行冻结
-spec lockDiamond(CoinNum::uint(), PLog::#recPLogTSMoney{}) -> boolean().
lockDiamond(0, _PLog) ->
	true;	%% 特殊处理0为成功
lockDiamond(CoinNum, #recPLogTSMoney{} = PLog) ->
	%% 已在canLockDiamond/1验证CoinNum
	case canLockDiamond(CoinNum) of
		true ->
			iChangeCoin(?CoinTypeLockDiamond, CoinNum, PLog);
		_ ->
			false
	end.

%%%-------------------------------------------------------------------
%% api:判断是否可以解冻
-spec canUnlockDiamond(CoinNum::uint()) -> boolean().
canUnlockDiamond(0) ->
	true;	%% 特殊处理0为允许
canUnlockDiamond(CoinNum) when erlang:is_integer(CoinNum), CoinNum > 0 ->
	case playerState:getCoin(?CoinTypeLockDiamond) of
		LockNum when erlang:is_integer(LockNum) ->
			LockNum >= CoinNum;
		Error ->
			?ERROR(
				"undefined:~w roleID:~w coinType:~w~n~p",
				[Error, playerState:getRoleID(), ?CoinTypeLockDiamond, misc:getStackTrace()]
			),
			false
	end.

%%%-------------------------------------------------------------------
%% api:执行解冻
-spec unlockDiamond(CoinNum::uint(), PLog::#recPLogTSMoney{}) -> boolean().
unlockDiamond(0, _PLog) ->
	true;	%% 特殊处理0为成功
unlockDiamond(CoinNum , #recPLogTSMoney{} = PLog) ->
	%% 已在canUnlockDiamond/1中验证CoinNum
	case canUnlockDiamond(CoinNum) of
		true ->
			iChangeCoin(?CoinTypeLockDiamond, -CoinNum, PLog);
		_ ->
			false
	end.

%%%-------------------------------------------------------------------
%% api:保存货币变化日志
-spec addLog(CoinType::coinType(), NewCoin::uint(), CoinNum::uint(), OldCoin::uint(), #recPLogTSMoney{},
	PlatformName::string(), RoleID::uint64(), AccountID::uint64()) -> ok.
addLog(CoinType, NewCoin, CoinNum, OldCoin, #recPLogTSMoney{} = PLog, PlatformName, RoleID, AccountID) ->
	AddOrDec =
		case CoinNum >= 0 of
			true -> ?AddCoin;
			_ -> ?DelCoin
		end,
	Rec = #recLogCoin{
		playerID = RoleID,
		accountID = AccountID,
		platformName = PlatformName,
		oldcoin = OldCoin,
		newcoin = NewCoin,
		addOrDec = AddOrDec,
		changecoin = CoinNum,
		reason = PLog#recPLogTSMoney.reason,
		target = PLog#recPLogTSMoney.target,
		source = PLog#recPLogTSMoney.source,
		param = PLog#recPLogTSMoney.param,
		dbID = gsMainLogic:getDBID4GS(),
		moneyType = CoinType
	},

	%% 普通货币日志
	dbLog:sendSaveLogCoinChange(CoinType, Rec),

	%% 特殊保存钻石日志
	case CoinType =:= ?CoinTypeDiamond orelse CoinType =:= ?CoinTypeLockDiamond of
		false ->
			skip;
		_ ->
			dbLog:sendSaveLogGold(erlang:setelement(1, Rec, recLogGold))
	end,
	ok.

%%%-------------------------------------------------------------------
%% api:跨服上使用货币
%% 在普通服上等价于useCoin/3
%% 使用前需要自行检查货币是否足够
-spec useMoneyInCross(RoleID::uint64(), CoinUseType::coinUseType(), Money::uint(), PLog::#recPLogTSMoney{}) -> boolean().
useMoneyInCross(RoleID, CoinUseType, Money, PLog) ->
	%% 扣钱
	OldGold = playerState:getCoin(?CoinTypeGold),
	OldBindDiamond = playerState:getCoin(?CoinTypeBindDiamond),
	OldDiamond = playerState:getCoin(?CoinTypeDiamond) - playerState:getCoin(?CoinTypeLockDiamond),
	case useCoin(CoinUseType, Money, PLog) of
		true ->
			case core:isCross() of
				true ->
					NewGold = playerState:getCoin(?CoinTypeGold),
					NewBindDiamond = playerState:getCoin(?CoinTypeBindDiamond),
					NewDiamond = playerState:getCoin(?CoinTypeDiamond) - playerState:getCoin(?CoinTypeLockDiamond),
					DecGold = OldGold - NewGold,
					DecBindDiamond = OldBindDiamond - NewBindDiamond,
					DecDiamond = OldDiamond - NewDiamond,
					case DecGold > 0 orelse DecBindDiamond > 0 orelse DecDiamond > 0 of
						true ->
							%% 发消息给原服，强制立即扣钱
							%% 这里之所以不直接发类型和消耗，是因为在跨服上可能会有其它扣钱的情况，而这些情况是不需要同步的。
							ServerID = core:getRealDBIDByUID(RoleID),
							?INFO("useMoneyInCross roleID:~p, CostType:~p, Money:~p, PLog:~p",
								[RoleID, CoinUseType, Money, PLog]),
							gsCsInterface:transitMsg2ServerOtp(ServerID, ?PsNamePlayerMgr, playerCrossCost,
								{RoleID, playerState:getAccountID(), DecGold, DecDiamond, DecBindDiamond, PLog});
						_ ->
							skip
					end;
				_ ->
					skip
			end,
			true;
		_ ->
			?ERROR("useMoneyInCross failed roleID:~p, CostType:~p, Money:~p, PLog:~p",
				[RoleID, CoinUseType, Money, PLog]),
			false
	end.

%%%-------------------------------------------------------------------
%% api:跨服上有复活消费，发到普通服来处理
playerCrossCost({RoleID, _AccountID, Gold, Diamond, BindDiamond, PLog} = Data) ->
	SelfID = playerState:getRoleID(),
	case RoleID =:= SelfID of
		true ->
			%% 这种情况不应该存在
			?ERROR("playerCrossCost online:~p", [Data]),
			case Diamond > 0 of
				true -> playerMoney:useCoin(?CoinUseTypeDiamondJustNotBind, Diamond, PLog);
				_ -> skip
			end,
			case BindDiamond > 0 of
				true -> playerMoney:useCoin(?CoinUseTypeDiamond, BindDiamond, PLog);
				_ -> skip
			end,
			case Gold > 0 of
				true -> playerMoney:useCoin(?CoinUseTypeGold, Gold, PLog);
				_ -> skip
			end,
			ok;
		_ ->
			?ERROR("playerCost selfID:~p, Data:~p,~p", [SelfID, Data, PLog]),
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
%% api:货币类型转换为货币使用类型
-spec coinType2CoinUseType(coinType()) -> coinUseType().
coinType2CoinUseType(CoinType) ->
	case lists:keyfind(CoinType, 2, ?CoinUseType2CoinType) of
		{CoinUseType, _} ->
			CoinUseType;
		_ ->
			CoinType	%% 可能已经是CoinUseType或者是无效值
	end.

%%%-------------------------------------------------------------------
%% api:货币使用类型转换为货币类型
-spec coinUseType2CoinType(coinUseType()) -> coinType().
coinUseType2CoinType(CoinUseType) ->
	case lists:keyfind(CoinUseType, 1, ?CoinUseType2CoinType) of
		{_, CoinType} ->
			CoinType;
		_ ->
			CoinUseType	%% 可能已经是CoinType或者是无效值
	end.

%%%-------------------------------------------------------------------
%% api:获取货币信息，用于替代playerState:getCoin/1兼容useCoin/3
-spec getCoinInfo(coinType()|coinUseType()) -> {coinUseType(), uint()}.
getCoinInfo(?CoinTypeDiamond) ->
	CoinCount = playerState:getCoin(?CoinTypeDiamond) - playerState:getCoin(?CoinTypeLockDiamond),
	{?CoinUseTypeDiamondJustNotBind, CoinCount};
getCoinInfo(CoinTypeOrCoinUseType) ->
	CoinType = coinUseType2CoinType(CoinTypeOrCoinUseType),
	case playerState:getCoin(CoinType) of
		CoinCount when erlang:is_integer(CoinCount) ->
			case coinType2CoinUseType(CoinType) of
				CoinType ->
					?ERROR("invalid CoinTypeOrCoinUseType:~w~n~p", [CoinTypeOrCoinUseType, misc:getStackTrace()]),
					{0, 0};
				CoinUseType ->
					{CoinUseType, CoinCount}
			end;
		_ ->
			?ERROR("invalid CoinTypeOrCoinUseType:~w~n~p", [CoinTypeOrCoinUseType, misc:getStackTrace()]),
			{0, 0}
	end.

%%%-------------------------------------------------------------------
%% api:LUN-9072 【韩国】【充值】14日更新后，钻石显示负数
-spec fixLockDiamond() -> no_return().
fixLockDiamond() ->
	LockDiamond = playerState:getCoin(?CoinTypeLockDiamond),
	Diamond = playerState:getCoin(?CoinTypeDiamond),
	case LockDiamond - Diamond of
		Diff when Diff > 0 ->
			PLog = #recPLogTSMoney{
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_System,
				reason = ?CoinSourceOnlineGM,
				param = LockDiamond
			},
			iChangeCoin(?CoinTypeDiamond, Diff, PLog);
		_ ->
			skip
	end.
