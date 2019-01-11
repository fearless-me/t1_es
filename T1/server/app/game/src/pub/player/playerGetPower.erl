%%%-------------------------------------------------------------------
%%% @author clc
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 体力领取
%%% @end
%%% Created : 25. 十月 2017 14:31
%%%-------------------------------------------------------------------
-module(playerGetPower).
-author("clc").
-include("gsInc.hrl").
-include("activityDef.hrl").

-define(SECONDS_PER_DAY, 86400).
-define(DAYS_FROM_0_TO_1970, 719528).

-define(Max_Time, 1).
-define(Noon, 1).
-define(Night, 2).

%% API
-export([getPower/1]).

%%暂时屏蔽 该功能，台湾不需要体力领取
getPower(_Stata)->

%%	GetPowerNumNight  =  playerDaily:getDailyCounter(?DailyType_EveryDay_Get_PowerNight, 0),
%%	GetPowerNumNoon  =  playerDaily:getDailyCounter(?DailyType_EveryDay_Get_PowerNoon,0),
%%
%%
%%	CurrentValue = playerActionPoint:getActionPoint(),
%%	Max = globalCfg:getGlobalCfg(player_action_point_max),
%%
%%	case  Stata of
%%		?Noon when GetPowerNumNoon <?Max_Time ->
%%			Minutes =   getCurrentDay() div 60,
%%			case Minutes >=getEveryDaynoon_start() andalso Minutes < getEveryDaynoon_end() of
%%				true->
%%					case (Max - CurrentValue) >= getEveryDayNoon()  of
%%						true  ->
%%							playerDaily:incDailyCounter(?DailyType_EveryDay_Get_PowerNoon,0),
%%							playerActionPoint:addActionPoint(getEveryDayNoon()),
%%							playerMsg:sendNetMsg(#pk_GS2U_EveryDayGetPower_Sync{isGetSuc = true});
%%						_->
%%							playerMsg:sendErrorCodeMsg(?ErrorCode_Friend2AP_Max)
%%					end;
%%				_->
%%					playerMsg:sendErrorCodeMsg({?ErrorCode_UseSkillErrorNoUseCounter, [1]})
%%			end;
%%		?Night when GetPowerNumNight <?Max_Time ->
%%				Minutes =   getCurrentDay() div 60,
%%				case Minutes >=getEveryDaynight_start() andalso Minutes < getEveryDaynight_end()
%%				of true->
%%					case (Max - CurrentValue) >= getEveryDaynight()  of
%%						true  ->
%%							playerDaily:incDailyCounter(?DailyType_EveryDay_Get_PowerNight,0),
%%							playerActionPoint:addActionPoint(getEveryDaynight()),
%%							playerMsg:sendNetMsg(#pk_GS2U_EveryDayGetPower_Sync{isGetSuc = true});
%%						_->
%%							playerMsg:sendErrorCodeMsg(?ErrorCode_Friend2AP_Max)
%%					end;
%%					_->
%%						playerMsg:sendErrorCodeMsg({?ErrorCode_UseSkillErrorNoUseCounter, [1]})
%%				end;
%%		_->
%%			playerMsg:sendErrorCodeMsg({?ErrorCode_UseSkillErrorNoUseCounter, [1]})
%%	end,
ok.




%%%%%%取出当前天的秒数
%%getCurrentDay() ->
%%	DataTime = time:getLocalNowDateTime1970(),
%%	Curtime  =time:getSyncTime1970FromDBS()- time:getDayBeginSeconds(DataTime),
%%	Curtime.
%%
%%
%%
%%getEveryDayNoon()->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, everyday_noon),
%%	List.
%%
%%getEveryDaynight()->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, everyday_night),
%%	List.
%%
%%
%%getEveryDaynoon_start()->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, everyday_noon_start),
%%	List.
%%
%%
%%getEveryDaynoon_end()->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, everyday_noon_end),
%%	List.
%%
%%
%%getEveryDaynight_start()->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, everyday_night_start),
%%	List.
%%
%%getEveryDaynight_end()->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, everyday_night_end),
%%	List.
%%

