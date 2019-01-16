%%%-------------------------------------------------------------------
%%% @author cxl
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 婚礼地图
%%% @end
%%% Created : 20. 六月 2018 19:50
%%%-------------------------------------------------------------------
-module(gameMapMarriageWedding).
-author("cxl").
-include("mapPrivate.hrl").
-include("activityDef.hrl").
-include("PlayerPropSyncDefine.hrl").
%%-include("../src/marriage/marriagePrivate.hrl").
%%%% API
%%-export([init/1,
%%weddingMapTick/0]).
%%
%%init(MapInfo)->
%%
%%	mapState:setWeddingMapInfo(MapInfo),
%%	erlang:send_after(1000, self(), weddingMapTick),
%%	ok.
%%weddingMapTick()->
%%	case mapState:getWeddingMapInfo() of
%%		#rec_weddingMapInfo{} = Info ->
%%			weddingPhase(Info);
%%		_->
%%			skip
%%	end,
%%	ok.
%%
%%weddingPhase(#rec_weddingMapInfo{roleID =RoleID,
%%	phase =?WeddingMapphase_1,phaseTime_1 = PhaseTime_1} = Wedding)->
%%	Now =  misc_time:localtime_seconds(),
%%	case Now >=PhaseTime_1   of
%%		 true ->
%%			 New= Wedding#rec_weddingMapInfo{phase = ?WeddingMapphase_2,redbage_tickrate = 0},
%%			 core:sendMsgToActivity(?ActivityType_MarrigeWedding, weddingMapPhaseChangeAck,
%%				 {RoleID,?WeddingMapphase_2}),
%%			 mapState:setWeddingMapInfo(New);
%%		_->
%%			weddingRed_tick(Wedding)
%%	end,
%%	erlang:send_after(1000, self(), weddingMapTick),
%%
%%	ok;
%%weddingPhase(#rec_weddingMapInfo{roleID = RoleID,phase =?WeddingMapphase_2,phaseTime_2 = PhaseTime_2} = Wedding)->
%%
%%	Now =  misc_time:localtime_seconds(),
%%	case Now >=PhaseTime_2   of
%%		true ->
%%			Redbage_tickrate = marriageState:ceremony_redbage_tickrate(),
%%			New= Wedding#rec_weddingMapInfo{phase = ?WeddingMapphase_3,redbage_tickrate = Now+Redbage_tickrate},
%%			core:sendMsgToActivity(?ActivityType_MarrigeWedding, weddingMapPhaseChangeAck,
%%				{RoleID,?WeddingMapphase_3}),
%%			mapState:setWeddingMapInfo(New);
%%		_->
%%			skip
%%	end,
%%	erlang:send_after(1000, self(), weddingMapTick),
%%	ok;
%%
%%weddingPhase(#rec_weddingMapInfo{ roleID = RoleID, phase =?WeddingMapphase_3,phaseTime_3 = PhaseTime_3} = Wedding)->
%%
%%	Now =  misc_time:localtime_seconds(),
%%	case Now >=PhaseTime_3 - ?ResetMapCountDown   of
%%		true ->
%%			New= Wedding#rec_weddingMapInfo{phase = ?WeddingMapphase_4},
%%			core:sendMsgToActivity(?ActivityType_MarrigeWedding, weddingMapPhaseChangeAck,
%%				{RoleID,?WeddingMapphase_4}),
%%			mapState:setWeddingMapInfo(New);
%%		_->
%%
%%			weddingRed_tick(Wedding)
%%	end,
%%	erlang:send_after(1000, self(), weddingMapTick),
%%	ok;
%%
%%weddingPhase(#rec_weddingMapInfo{roleID = RoleID, phase =?WeddingMapphase_4,phaseTime_3 = PhaseTime_3} = Wedding)->
%%	Now =  misc_time:localtime_seconds(),
%%	case Now >=PhaseTime_3   of
%%		true ->
%%			New= Wedding#rec_weddingMapInfo{phase = ?WeddingMapphase_5},
%%			core:sendMsgToActivity(?ActivityType_MarrigeWedding, weddingMapPhaseChangeAck,
%%				{RoleID,?WeddingMapphase_5}),
%%			mapState:setWeddingMapInfo(New);
%%		_->
%%			erlang:send_after(1000, self(), weddingMapTick)
%%	end,
%%	ok;
%%weddingPhase(_)->
%%	?INFO("gameMapMarriageWedding weddingPhase is over"),
%%	ok.
%%
%%weddingRed_tick(#rec_weddingMapInfo{roleID = RoleID,phase =?WeddingMapphase_1,
%%	redbage_tickrate = Rate,phaseTime_1 = PhaseTime_1} = Wedding) ->
%%	Now =  misc_time:localtime_seconds(),
%%	case Now >=Rate andalso  PhaseTime_1 -Now  > ?RedPhase2LastTime of
%%		true ->
%%			Redbage_tickrate = marriageState:ceremony_redbage_tickrate(),
%%			New= Wedding#rec_weddingMapInfo{redbage_tickrate = Now +Redbage_tickrate},
%%			core:sendMsgToActivity(?ActivityType_MarrigeWedding, isTimeToSendWeddingRed,
%%				{RoleID}),
%%			mapState:setWeddingMapInfo(New);
%%		_->
%%			skip
%%	end,
%%	ok;
%%
%%weddingRed_tick(#rec_weddingMapInfo{roleID = RoleID, phase =?WeddingMapphase_3,redbage_tickrate = Rate} = Wedding)->
%%	Now =  misc_time:localtime_seconds(),
%%	case Now >=Rate   of
%%		true ->
%%			Redbage_tickrate = marriageState:ceremony_redbage_tickrate(),
%%			New= Wedding#rec_weddingMapInfo{redbage_tickrate = Now +Redbage_tickrate},
%%			core:sendMsgToActivity(?ActivityType_MarrigeWedding, isTimeToSendWeddingRed,
%%				{RoleID}),
%%			mapState:setWeddingMapInfo(New);
%%		_->
%%			skip
%%	end,
%%	ok;
%%weddingRed_tick(_)->
%%	ok.
%%
