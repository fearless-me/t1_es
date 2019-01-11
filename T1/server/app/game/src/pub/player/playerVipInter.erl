%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 特权卡系统特权对外接口
%%% @end
%%% Created : 20. 一月 2015 16:28
%%%-------------------------------------------------------------------
-module(playerVipInter).
-author("tiancheng").

-include("playerPrivate.hrl").
-include("setupLang.hrl").

-define(FlushPowerListCD, 60000).

%% API
-export([
	getVipEffect/2,
	cleanCD/0
]).

-export([
	gm_getVipEffect/2
]).

gm_getVipEffect(?RepEvent_CopyMapTimes, MapID) ->
	getVipEffect(?RepEvent_CopyMapTimes, {MapID});
gm_getVipEffect(Type, _) ->
	getVipEffect(Type, 0).

%% 获取VIP特权的影响
-spec getVipEffect(FunctionID::uint(), Param::term()) -> term().
getVipEffect(RepType = ?RepEvent_CopyMapTimes, {MapID}) ->
	%% 获得副本每日增加的次数
	L = getRepPowerConfigList(RepType),
	case playerScene:getCopyMapSubType(MapID) of
		undefined -> 0;
		SubType ->
			F =
				fun
					(#vip_card_effectCfg{param1 = Num, param2 = SType}, AccNum) when SubType =:= SType ->
						Num + AccNum;
					(#vip_card_effectCfg{}, AccNum) ->
						AccNum
				end,
			lists:foldl(F, 0, L)
	end;
getVipEffect(RepType = ?RepEvent_MallBer, _) ->
	%% 商城限购礼包购买增加倍率，使用乘法(每日限购)
	case getRepPowerConfigList(RepType) of
		[#vip_card_effectCfg{param1 = Ber}|_] -> Ber;
		_ -> 1
	end;
getVipEffect(RepType = ?RepEvent_LotterySys, _) ->
	%% 女神扭蛋机每天免费赠送次数
	case getRepPowerConfigList(RepType) of
		[#vip_card_effectCfg{param1 = Times}|_] -> Times;
		_ -> 0
	end;
getVipEffect(RepType = ?RepEvent_MSShop, _) ->
	%% 神秘商店新增免费刷新次数
	case getRepPowerConfigList(RepType) of
		[#vip_card_effectCfg{param1 = Times}|_] -> Times;
		_ -> 0
	end;
getVipEffect(RepType = ?RepEvent_WildBoss, _) ->
	%% 野外首领击杀奖励增加收益次数
	case getRepPowerConfigList(RepType) of
		[#vip_card_effectCfg{param1 = Times}|_] -> Times;
		_ -> 0
	end;
getVipEffect(RepType = ?RepEvent_WildBossHelp, _) ->
	%% 野外首领击杀奖励增加协助收益次数
	case getRepPowerConfigList(RepType) of
		[#vip_card_effectCfg{param1 = Times}|_] -> Times;
		_ -> 0
	end;
getVipEffect(RepType = ?RepEvent_TradeOpen, _) ->
	%% 交易行是否可用
	case ?Cur_Lang of
		?Lang_CHS ->
			%% 如果是中文大陆版本，不需要特权卡，也能使用交易行
			true;
		_ ->
			%% 如果特权卡后台开关关闭，则不由特权卡来控制交易行的开关
			case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Vip) of
				true ->
					case getRepPowerConfigList(RepType) of
						[#vip_card_effectCfg{param1 = 1}|_] -> true;
						_ -> false
					end;
				_ ->
					true
			end
	end;
getVipEffect(FunctionID, Param) ->
	?ERROR("getVipEffect roleID:~p, FunctionID:~p Param:~p, trace:~p",
		[playerState:getRoleID(), FunctionID, Param, misc:getStackTrace()]),
	undefined.

%% 执行爵位事件，可能需要返回值
-spec getRepPowerConfigList(RepType::uint()) -> [#vip_card_effectCfg{},...] | [].
getRepPowerConfigList(RepType) ->
	PowerList =
		case inCD() of
			true ->
				playerPropSync:getProp(?SerProp_VipPowerList);
			_ ->
				L = playerVip:getVipPowerList(),
				playerPropSync:setProp(?SerProp_VipPowerList, L),
				L
		end,

	F =
		fun({VIP_ID, EffectID}, AccL) ->
			case getCfg:getCfgByKey(cfg_vip_card_effect, VIP_ID, EffectID) of
				#vip_card_effectCfg{function_id = RepType} = Conf ->
					[Conf | AccL];
				_ ->
					AccL
			end
		end,
	lists:foldl(F, [], PowerList).

inCD() ->
	MS = time2:getTimestampMS(),
	case get(atom_FlushPowerListCD) of
		undefined ->
			put(atom_FlushPowerListCD, MS),
			false;
		V ->
			case MS - V >= ?FlushPowerListCD of
				true ->
					put(atom_FlushPowerListCD, MS),
					false;
				_ ->
					true
			end
	end.

cleanCD() ->
	erlang:erase(atom_FlushPowerListCD).