%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 商店兑换条件，与playerShop配套
%%% @end
%%% Created : 12. 七月 2018 11:52
%%%-------------------------------------------------------------------
-module(playerShopContidion).
-author("tiancheng").

-include("gsInc.hrl").
-include("playerPrivate.hrl").

%% API
-export([
    checkResourceExchangeCondition/2
]).

%% 资源兑换的条件判断
-spec checkResourceExchangeCondition(Condition::playerShopCond(), Param::uint()) -> true | ErrorCode
    when ErrorCode::uint().
checkResourceExchangeCondition(0, _Param) ->
    true;
checkResourceExchangeCondition(undefined, _Param) ->
    true;
checkResourceExchangeCondition(?PlayerShopCond_ArunaJX, NeedLvl) ->
    %% 检查军衔等级
    case arunaInter:getArunaJXLvl(playerPropSync:getProp(?PubProp_ArunaValue)) >= NeedLvl of
        true ->
            true;
        _ ->
            ?ErrorCode_BagResourceExchangeFailed
    end;
checkResourceExchangeCondition(?PlayerShopCond_Festival, FestivalID) ->
		case getCfg:getCfgByKey(cfg_festivalactivity_config, FestivalID) of
		  #festivalactivity_configCfg{timestart = TimeStart, timeend = TimeEnd} ->
			% 先判断时间条件
			case playerFestivalCopy:isInTheFestivalTime(TimeStart, TimeEnd) of
             true ->
                 true;
             _ ->
                ?ErrorCode_FestivalCopy_NotOpen
         end;
		_ ->
			?ErrorCode_FestivalCopy_NotFound
	end;
checkResourceExchangeCondition(_Condition, _Param) ->
    ?ErrorCode_BagResourceExchangeFailed.