%%%-------------------------------------------------------------------
%%% @author burce
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家家园系统_养殖区
%%% @end
%%% Created : 25. 八月 2017 17:48
%%%-------------------------------------------------------------------
-module(playerHomeFarming).
-author("cxl").

-include("gsInc.hrl").
-include("playerPrivate.hrl").

%%
%%
%%%% MSG
%%-export([
%%	msg/1
%%]).
%%%% API
%%-export([
%%	sendHomeFarmingInfo/2,
%%	farming_tick_addExp/1,
%%	zooFoodSuccess/1,
%%	putOutFarming/1
%%]).
%%
%%% 协议
%%msg(#pk_U2GS_PutPetInFarming{homeID = HomeID, petID = PetID,areaType = AreaType,itemUid = ItemUID}) ->
%%	RoleID = playerState:getRoleID(),
%%	putInFarming(HomeID,AreaType,RoleID,PetID,ItemUID),
%%	ok;
%%
%%% 协议
%%msg(#pk_U2GS_PutOutPetFarming{homeID = HomeID,petID = _PetID,areaType = AreaType,itemUid = UID}) ->
%%	RoleID = playerState:getRoleID(),
%%	putOutFarming({HomeID,AreaType,RoleID,UID}),
%%	ok;
%%
%%% 协议
%%msg(#pk_U2GS_GetPetFood{homeID = HomeID,petID = PetID,itemID = ItemID, areaType = AreaType,itemUid = Uid}) ->
%%	RoleID = playerState:getRoleID(),
%%	putPetFoodFarming(HomeID,AreaType,RoleID,PetID,ItemID,Uid),
%%	ok;
%%msg(Msg) ->
%%	?ERROR("receive error msg:~p,~p", [playerState:getRoleID(), Msg]),
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
%%	ok.
%%
%%
%%% 放置宠物进入饲养区
%%-spec putInFarming(HomeID ::uint64(),AreaType ::uint8(),RoleID :: uint64(), PetID :: uint16(),ItemUID::uint64())-> no_return().
%%
%%putInFarming(HomeID,_AreaType,RoleID,PetID,ItemUID)->					%% 错误的操作类型
%%
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master  of
%%		true ->
%%			case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%				[#rec_home_area{areaData = StrDataOld}] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						[] ->
%%							skip;
%%						_->
%%							case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								false ->
%%									skip;
%%								#recHomeFurniTrue{betweenExampleData = BetweenExampleData}  ->
%%									case lists:keyfind(ItemUID,#recHomeLayoutInfo.uid,BetweenExampleData) of
%%										#recHomeLayoutInfo{type = ?Home_BreedArea,itemID = ItemID} ->
%%											case ets:lookup(?HomeAreaEts, {HomeID, ?Home_BreedArea}) of
%%												[#rec_home_area{areaData = FarmingDataOld} = AreaOld] ->
%%													ListFarmingDataOld = misc:string_to_term(FarmingDataOld),
%%													TimeNow = misc_time:gregorian_seconds_from_1970( ),
%%													case lists:keyfind(ItemUID, 1, ListFarmingDataOld) of
%%														{_,_D,_Time} ->
%%															?ERROR_CODE(?ErrorCode_PetTaskAcceptmax),
%%															skip;	%% 数据相同，不需要更新
%%														_ ->
%%
%%															?INFO("putInFarming  putIntime ~p  petID  ~p  ItemID ~p ",[TimeNow,PetID,ItemID]),
%%															ListDataNew = lists:keystore(ItemUID, 1, ListFarmingDataOld, {ItemUID,PetID, TimeNow}),
%%															StrDataNew = misc:term_to_string(ListDataNew),
%%															AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%															ets:insert(?HomeAreaEts, AreaNew),
%%															homeInterface:saveHome(AreaNew),
%%															putInFarmingSuccess(ItemUID,PetID,1)
%%													end;
%%												_ ->
%%													?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%											end;
%%										_->
%%											?ERROR_CODE(?ErrorCode_HomePlant_TarNull)
%%
%%									end
%%							end
%%					end;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%			end;
%%		_->
%%			skip
%%	end.
%%
%%
%%% 从饲养区 取回宠物
%%-spec putOutFarming({HomeID ::uint64(),AreaType ::uint8(),RoleID :: uint64(), PetID :: uint16(),UID::uint64()})-> no_return().
%%putOutFarming({HomeID,_AreaType,RoleID,UID})->					%% 错误的操作类型
%%
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master of
%%		true ->
%%			case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%				[#rec_home_area{areaData = StrDataOld}] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						[] ->
%%							skip;
%%						_->
%%							case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								false ->
%%									skip;
%%								#recHomeFurniTrue{betweenExampleData = BetweenExampleData}  ->
%%									case lists:keyfind(UID,#recHomeLayoutInfo.uid,BetweenExampleData) of
%%										#recHomeLayoutInfo{type = ?Home_BreedArea,itemID = Id} ->
%%											addExpToPet(HomeID,UID,Id);
%%										_->
%%											?ERROR_CODE(?ErrorCode_HomePlant_TarNull)
%%									end
%%							end
%%					end;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%			end;
%%		_->
%%			skip
%%	end.
%%
%%% 从饲养区 喂食物
%%-spec putPetFoodFarming(HomeID ::uint64(),AreaType ::uint8(),RoleID :: uint64(), PetID :: uint16(), ItemID :: uint16(),Uid::uint64())-> no_return().
%%putPetFoodFarming(HomeID,_AreaType,RoleID,PetID,ItemID,Uid)->					%% 错误的操作类型
%%
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master of
%%		true ->
%%			case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%				[#rec_home_area{areaData = StrDataOld}] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						[] ->
%%							skip;
%%						_->
%%							case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								false ->
%%									skip;
%%								#recHomeFurniTrue{betweenExampleData = BetweenExampleData}  ->
%%									case lists:keyfind(Uid,#recHomeLayoutInfo.uid,BetweenExampleData) of
%%										#recHomeLayoutInfo{type = ?Home_BreedArea} ->
%%											petZoofood({HomeID,Uid,PetID,ItemID});
%%										_->
%%											?ERROR_CODE(?ErrorCode_HomePlant_TarNull)
%%									end
%%							end
%%					end;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%			end;
%%		_->
%%			skip
%%	end.
%%
%%petZoofood({HomeID,Uid,PetID,ItemID}) ->
%%	case ets:lookup(?HomeAreaEts, {HomeID, ?Home_BreedArea}) of
%%		[#rec_home_area{areaData = StrFoodDataOld}] ->
%%
%%			#globalsetupCfg{setpara = [MaxNum]} = getCfg:getCfgByKey(cfg_globalsetup, feed_limit),
%%			Count =  playerDaily:getDailyCounter(?DailyType_Home_PetFarming,0),
%%			case Count >=MaxNum of
%%				true->
%%					playerMsg:sendNetMsg(#pk_GS2U_GetPetFoodResults_Sync{
%%						itemUid = Uid,
%%						result = 2,
%%						petID = PetID,addTime = 0}),
%%					?ERROR_CODE(?ErrorCode_UseSkillErrorNoUseCounter);
%%				_->
%%					ListFoodDataOld = misc:string_to_term(StrFoodDataOld),
%%					case lists:keyfind(Uid, 1, ListFoodDataOld) of
%%						{_,D, _Time} ->
%%
%%							Atime =
%%								case getCfg:getCfgByKey(cfg_item, ItemID) of
%%									#itemCfg{useParam1 = AddTime} ->
%%										AddTime;
%%									_->
%%										0
%%								end,
%%							case  Atime >0 of
%%								true->
%%									case playerBase:costRes(?BackType_Item, ItemID, 1, ?PLogTS_Home, ?ItemDeleteReasonHomeFarmingOP, ?ItemSourceHomeFarmingHarvest) of
%%										{true, _CostItem} ->
%%
%%											playerDaily:incDailyCounter(?DailyType_Home_PetFarming, 0),
%%											playerDaily:addDailyCounter(?DailyType_Homefarming_addTime, D,Atime),
%%
%%											playerMsg:sendNetMsg(#pk_GS2U_GetPetFoodResults_Sync{
%%												itemUid = Uid,
%%												result = 1,
%%												petID = PetID,addTime = Atime});
%%										_->
%%											playerMsg:sendNetMsg(#pk_GS2U_GetPetFoodResults_Sync{
%%												itemUid = Uid,
%%												result = 3,
%%												petID = PetID,addTime = 0})
%%									end;
%%								_->
%%									skip
%%							end;
%%						_ ->
%%							skip
%%					end
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%	end,
%%	ok;
%%
%%petZoofood(_) ->
%%	ok.
%%
%%calculateAllExp(Time,TimeNow,ItemID,PetID)->
%%
%%	GetDeltaTime  =  playerDaily:getDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID),
%%	AddTime  =  playerDaily:getDailyCounter(?DailyType_Homefarming_addTime, PetID),
%%	CurTime =  TimeNow - Time,
%%
%%	%%判断放进去天数，过夜，但是没满24小时，起步两天起
%%	PutInDay =
%%		case  CurTime div 86400 of
%%			0 ->
%%				2;
%%			D->
%%				D+2
%%		end,
%%	L = lists:seq(1, PutInDay),
%%	DayLen = erlang:length(L),
%%
%%	%%获取放进去的那天的结束时间
%%	{_, End} = getStarAndEndTime(Time),
%%	%%获取取出来的那天的开始时间
%%	{Start, _} = getStarAndEndTime(TimeNow),
%%
%%	%%根据天数来加经验
%%	Fun =
%%		fun(Day,ExpNum) ->
%%			case Day of
%%				%%放进去那天的经验
%%				1->
%%					T =  End - Time,
%%					ExpNum+ getExpForPutTime( T,GetDeltaTime,AddTime,ItemID);
%%				DayLen->%%取出来那天的经验
%%
%%					T1= TimeNow- Start,
%%					playerDaily:addDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID,T1 div 60),
%%					ExpNum+ getExpForPutTime( T1,0,0,ItemID);
%%				_->
%%					%%中间的天数都是 加更天
%%					ExpNum+ getExpForPutTime( 86400,0,0,ItemID)
%%			end
%%		end,
%%	lists:foldl(Fun,0,L).
%%
%%
%%
%%addExpToPet(HomeID,ItemUid,ItemID)->
%%	case ets:lookup(?HomeAreaEts, {HomeID, ?Home_BreedArea}) of
%%		[#rec_home_area{areaData = FarmingDataOld} = AreaOld] ->
%%			ListFarmingDataOld = misc:string_to_term(FarmingDataOld),
%%			TimeNow = misc_time:gregorian_seconds_from_1970( ),
%%			case lists:keyfind(ItemUid, 1, ListFarmingDataOld) of
%%				{_,PetID, Time} ->
%%					%%这里判断过不过夜
%%					case core:timeIsOnDay(Time,TimeNow) of
%%						false ->
%%
%%							CurTime =  TimeNow - Time,
%%							ExpNumAll = calculateAllExp(Time,TimeNow,ItemID,PetID),
%%							playerPet:petAddExp(PetID,ExpNumAll),
%%							ListDataNew = lists:delete({ItemUid,PetID,Time},ListFarmingDataOld),
%%							StrDataNew = misc:term_to_string(ListDataNew),
%%							AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%							ets:insert(?HomeAreaEts, AreaNew),
%%							homeInterface:saveHome(AreaNew),
%%							putOutFarmingSuccess(ItemUid,PetID,ExpNumAll,1,erlang:trunc(CurTime/60)),
%%							?INFO("putOutFarming AcrossDay  CurTime ~p  PutInTime  ~p  petID  ~p  ItemID ~p  addExpAll ~p ",
%%								[TimeNow,Time,PetID,ItemID,ExpNumAll]);
%%						_ ->
%%
%%							GetDeltaTime  =  playerDaily:getDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID),
%%							AddTime  =  playerDaily:getDailyCounter(?DailyType_Homefarming_addTime, PetID),
%%							CurTime =  TimeNow - Time,
%%							Minutes =  erlang:trunc(CurTime/60),
%%
%%							ExpNum =getExpForPutTime(CurTime,GetDeltaTime,AddTime,ItemID),
%%							playerDaily:addDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID,Minutes),
%%							playerPet:petAddExp(PetID,ExpNum),
%%							ListDataNew = lists:delete({ItemUid,PetID,Time},ListFarmingDataOld),
%%							StrDataNew = misc:term_to_string(ListDataNew),
%%							AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%							ets:insert(?HomeAreaEts, AreaNew),
%%							homeInterface:saveHome(AreaNew),
%%							putOutFarmingSuccess(ItemUid,PetID,ExpNum,1,Minutes),
%%							?INFO("putOutFarming no AcrossDay CurTime ~p  PutInTime  ~p  petID  ~p ItemID ~p  addExpAll ~p ",
%%								[TimeNow,Time,PetID,ItemID,ExpNum])
%%					end;
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%	end,
%%	ok.
%%
%%getExpForPutTime(CurTime,GetDeltaTime,AddTime,ItemID)->
%%
%%	    Minutes =  erlang:trunc(CurTime/60),
%%		case getCfg:getCfgByKey(cfg_home_zoo, ItemID) of
%%			#home_zooCfg{exp_permin = Exp,maxmin = MaxTime} ->
%%				Validtime = MaxTime + AddTime,
%%				case GetDeltaTime  < Validtime  of
%%					true ->
%%						case  Validtime - (GetDeltaTime +Minutes) >0 of
%%							true ->
%%								Minutes * Exp;
%%							_->
%%								(Validtime - GetDeltaTime)*Exp
%%						end;
%%					_->
%%						0
%%				end;
%%			_->
%%				0
%%		end.
%%
%%getStarAndEndTime(Time)->
%%
%%	{{Year, Month, Day}, {Hour, _Minute, _Second}} = misc_time:convertSec2DateTime(Time),
%%	Mid = misc_time:convertDateTime1970ToSec({{Year, Month, Day}, {?ResetTimeHour, 0, 0}}),
%%	 case Hour >= ?ResetTimeHour of
%%				   true ->
%%					   {Mid, Mid + 24 * 3600};
%%				   _ ->
%%					   {Mid - 24 * 3600, Mid}
%%	 end.
%%
%%
%%%%%-------------------------------------------------------------------
%%% 初始化养殖区
%%-spec sendHomeFarmingInfo(HomeID::uint64(), Flag::uint()) -> no_return().
%%sendHomeFarmingInfo(HomeID, ?Home_House) ->
%%
%%	case ets:lookup(?HomeAreaEts, {HomeID, ?Home_BreedArea}) of
%%		[#rec_home_area{areaLvl = _AreaLvl,areaData = StrDataOld}] ->
%%			TimeNow = misc_time:gregorian_seconds_from_1970( ),
%%			ListDataOld = misc:string_to_term(StrDataOld),
%%			F =
%%			  fun({ItemUid, PetID,Time},Vecter) ->
%%				    LastdeltaTime = erlang:trunc((TimeNow - Time)/60),
%%				    DeltaMinutesTime  =  playerDaily:getDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID),
%%				  	AllTime = DeltaMinutesTime + LastdeltaTime,
%%				    AddTime  =  playerDaily:getDailyCounter(?DailyType_Homefarming_addTime, PetID),
%%
%%					[#pk_FarmingPet{petID = PetID,time = TimeNow,lastdeltaTime = LastdeltaTime,deltaTime = AllTime,itemUid = ItemUid,addTime = AddTime } |Vecter]
%%              end,
%%			NewVecter = lists:foldl(F, [], ListDataOld),
%%			playerMsg:sendNetMsg(#pk_GS2U_HomeFarming_Sync{petList = NewVecter});
%%		_->
%%			skip
%%    end;
%%
%%sendHomeFarmingInfo(_HomeID, _Flag) ->
%%	skip.
%%
%%farming_tick_addExp({RoleID, Correct}) ->
%%	case playerState:getRoleID() of
%%		RoleID ->
%%			playerBase:addExp(Correct, ?ExpSourceHomeFarming, 1);
%%		RID ->
%%			?ERROR("farming_tick_addExp self=~p, role=~p, correct=~p", [RID, RoleID, Correct])
%%	end.
%%
%%zooFoodSuccess({RoleID, BackItemID,BackITemNum}) ->
%%	case playerState:getRoleID() of
%%		RoleID ->
%%			PLog = #recPLogTSItem{
%%				new = BackITemNum,
%%				change = BackITemNum,
%%				target = ?PLogTS_PlayerSelf,
%%				source = ?PLogTS_Home,
%%				changReason = ?ItemSourceHomeFarmingHarvest,
%%				reasonParam = BackItemID
%%			},
%%			playerPackage:addGoodsAndMail(BackItemID, BackITemNum, false, 0, PLog);
%%		RID ->
%%			?ERROR("zooFoodSuccess self=~p, role=~p, BackItemID=~p", [RID, RoleID,BackItemID])
%%	end.
%%
%%
%%putInFarmingSuccess(ItemUid,PetID, Result) ->
%%	%% 通知地图上所有角色
%%	AddTime  =  playerDaily:getDailyCounter(?DailyType_Homefarming_addTime, PetID),
%%	DeltaMinutesTime  =  playerDaily:getDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID),
%%	TimeNow = misc_time:gregorian_seconds_from_1970( ),
%%	Msg = #pk_GS2U_PutPetInFarmingResults_Sync{
%%		result = Result,
%%		petFarming = #pk_FarmingPet{itemUid = ItemUid, petID = PetID,time = TimeNow,deltaTime = DeltaMinutesTime,lastdeltaTime = 0,addTime =AddTime }
%%	},
%%	farmingSuccess(ets:tab2list(playerState:getMapPlayerEts()),Msg).
%%
%%putOutFarmingSuccess(Uid,PetID, ExpNum,Result,Minutes) ->
%%
%%	%% 通知地图上所有角色
%%	Msg = #pk_GS2U_PutOutPetFarmingResults_Sync{
%%		itemUid = Uid,
%%		result = Result,
%%		petID =PetID,
%%		exp = ExpNum,
%%		minutes = Minutes
%%	},
%%	farmingSuccess(ets:tab2list(playerState:getMapPlayerEts()),Msg).
%%
%%%%%-------------------------------------------------------------------
%%
%%farmingSuccess([], _Msg) ->
%%	ok;
%%farmingSuccess([#recMapObject{netPid = NetPid} | T], Msg) ->
%%	playerMsg:sendNetMsg(NetPid, Msg),
%%	farmingSuccess(T, Msg).