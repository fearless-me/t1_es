%%%-------------------------------------------------------------------
%%% @author chenxiaolong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%    暗夜侵袭
%%% @end
%%% Created : 28. 五月 2018 15:54
%%%-------------------------------------------------------------------
-module(playerNightNvasion).
-author("cxl").

%%
%%-include("playerPrivate.hrl").
%%-include("../crossActivity/croNightinvasion/nightNvasionHrl.hrl").
%%%% API
%%-export([ msg/1,
%%	mapLineIsfull/0,
%%	requestEnterMapNvasionCrossAck/1,
%%	onSwitchPKMod/1,
%%	checkMapTypeIsNvasion/0,
%%	playerDead/1,
%%	loginCheckInvasionRward/0,
%%	awardItemList2GoodsAndMail/1,
%%	checkMapIsNvasion/0]).
%%
%%-export([gm_setLineMaxNum/1]).
%%
%%msg(#pk_U2GS_RequestEnterNvasionMap{mapID = MapID}) ->
%%	Level =  playerState:getLevel(),
%%	case nightNvasionInter:checkPlayerLevel(Level,MapID) of
%%		  true->
%%			  case playerDaily:getDailyCounter(?DailyType_NightinvasionFreeTime, 0) >=configinvade_num() of
%%				  true->
%%					  case playerPackage:getGoodsCount(configinvade_itemID())>0 of
%%						  true ->
%%							  core:sendMsgToActivity(?ActivityType_CrossNightNvasion, requestEnterNvasionMap,
%%								  {playerState:getRoleID(),MapID, self(), playerState:getNetPid()});
%%						  _->
%%							  playerMsg:sendErrorCodeMsg(?ErrorCode_CrossActivity_Apply_NeedCount),
%%							  skip
%%					  end;
%%				  _->
%%					  core:sendMsgToActivity(?ActivityType_CrossNightNvasion, requestEnterNvasionMap,
%%						  {playerState:getRoleID(),MapID, self(), playerState:getNetPid()})
%%
%%			  end ;
%%		_->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapLevelLimit)
%%	end,
%%ok;
%%
%%
%%msg(Msg) ->
%%	?ERROR("recv error msg:~p,~p", [playerState:getRoleID(), Msg]).
%%
%%
%%
%%requestEnterMapNvasionCrossAck({ServerID, MapID, MapPid}) ->
%%	?INFO("requestEnterMapNvasionCrossAck serverID:~p,~p,~p", [ServerID, MapID, MapPid]),
%%	NeeItemID =  configinvade_itemID(),
%%	case playerDaily:getDailyCounter(?DailyType_NightinvasionFreeTime, 0) >=configinvade_num() of
%%		true->
%%			case playerPackage:getGoodsCount(NeeItemID)>0 of
%%				true ->
%%					PLog3 = #recPLogTSItem{
%%						old = 0,
%%						new = 0,
%%						change = -1,
%%						target = ?PLogTS_PlayerSelf,
%%						source = ?PLogTS_PlayerSelf,
%%						gold = 0,
%%						goldtype = 0,
%%						changReason = ?ItemDeleteReasonNvasion,
%%						reasonParam = NeeItemID
%%					},
%%					case playerPackage:delGoodsByID(?Item_Location_Bag, NeeItemID, 1, PLog3) of
%%						true ->
%%							%%进入跨服时候先设置为和平模式，策划要求从跨服返回要和平
%%							playerPk:fotceTranState(?PlayerPeaceStatus),
%%							%%记录玩家进入日志
%%							playerLogAdd:addLogParticipatorInfo(?LogParticipator_Nightinvasion),
%%							playerInterface:reqEnterCrossMapPid(ServerID, MapID, MapPid);
%%						_->
%%							?ERROR("delGoodsByID  fail  ~p",[NeeItemID])
%%					end;
%%				_->
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_CrossActivity_Apply_NeedCount)
%%			end;
%%		_->
%%			playerDaily:incDailyCounter(?DailyType_NightinvasionFreeTime,0),
%%			playerInterface:reqEnterCrossMapPid(ServerID, MapID, MapPid)
%%
%%	end ,
%%	ok.
%%
%%
%%gm_setLineMaxNum(Num)->
%%	nightNvasionState:setGMSetLineNumber(Num).
%%
%%%%每天免费限制次数
%%configinvade_num() ->
%%	case getCfg:getCfgByKey(cfg_globalsetup, invade_num) of
%%		#globalsetupCfg{setpara = [N]} -> N;
%%		_ -> 0   %%策划喊改的~~有可能配置其他各式
%%	end.
%%%%进去扣除的itemID
%%configinvade_itemID() ->
%%
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, invade_item),
%%	List.
%%
%%mapLineIsfull()->
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosBattle_CurMaxMapLine),
%%	ok.
%%
%%onSwitchPKMod(PKMode) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeNvasion} ->
%%			case playerState:getPkStatus() of
%%				PKMode ->
%%					skip;
%%				_ ->
%%					playerPk:fotceTranState(PKMode)
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%
%%checkMapTypeIsNvasion() ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeNvasion} ->
%%			playerBuff:addBuff(?TransformationBuff, 1);
%%		_ ->
%%			false
%%	end.
%%
%%
%%playerDead(AttackRoleID)->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeNvasion} ->
%%			BuffList =   playerState:getBuffList(),
%%			case  lists:keyfind(?TransformationBuff,#recBuff.buffID,BuffList) of
%%				#recBuff{}->
%%					core:sendMsgToActivity(?ActivityType_CrossNightNvasion, nvasionTransformationDead,
%%						{playerState:getRoleID(),AttackRoleID});
%%				_->
%%					skip
%%			end;
%%		_ ->
%%			false
%%	end,
%%
%%	ok.
%%checkMapIsNvasion()->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeNvasion} ->
%%			true;
%%		_ ->
%%			false
%%	end.
%%
%%
%%loginCheckInvasionRward()->
%%	RoleID = playerState:getRoleID(),
%%	core:sendMsgToActivity(?ActivityType_CrossNightNvasion, loginCheckInvasionRward,
%%		{RoleID, self()}),
%%	ok.
%%
%%awardItemList2GoodsAndMail([{ItemID, ItemNumber}|T])->
%%	PLog = #recPLogTSItem{
%%		old         = 0 ,
%%		new         = ItemNumber ,
%%		change      = ItemNumber ,
%%		target      = ?PLogTS_PlayerSelf ,
%%		source      = ?PLogTS_Invasion ,
%%		gold        = 0,
%%		goldtype    = 0,
%%		changReason = ?ItemSourceNvasionReward,
%%		reasonParam = 0
%%	},
%%	playerPackage:addGoodsAndMail(ItemID, ItemNumber, true, 0,PLog),
%%	awardItemList2GoodsAndMail(T);
%%awardItemList2GoodsAndMail([])->
%%	[].
%%
%%
%%
