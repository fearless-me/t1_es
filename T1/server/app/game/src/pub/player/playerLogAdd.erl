%% @author zhengzhichun
%% @doc @todo Add description to playerLogAdd.


-module(playerLogAdd).
-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 addLogParticipatorInfo/1,
		 addLogParticipatorInfo/2,
		 addLogParticipatorInfo2/2
]).

%%玩法参与者信息统计
-spec addLogParticipatorInfo(Type::?LogParticipator_Min .. ?LogParticipator_Max) ->ok.
addLogParticipatorInfo(Type) ->
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	PetForce = playerPropSync:getProp(?PriProp_PetForce),
	dbLog:sendSaveLogParticipatorInfo(#recLogParticipatorInfo{
															  roleName = playerState:getName(),
															  roleID = playerState:getRoleID(),
															  roleLevel = playerState:getLevel(),
															  currentRecharge = playerState:getRechargeAcc(),
															  forcePower = PlayerForce+PetForce,
															  type = Type,
															  guildID = playerState:getGuildID(),
															  param1 = 0,
															  time = time:getLogTimeSec()
															 }),
	ok.

addLogParticipatorInfo(Type,AwardID) ->
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	PetForce = playerPropSync:getProp(?PriProp_PetForce),
	dbLog:sendSaveLogParticipatorInfo(#recLogParticipatorInfo{
		roleName = playerState:getName(),
		roleID = playerState:getRoleID(),
		roleLevel = playerState:getLevel(),
		currentRecharge = playerState:getRechargeAcc(),
		forcePower = PlayerForce+PetForce,
		type = Type,
		guildID = playerState:getGuildID(),
		param1 = AwardID,
		time = time:getLogTimeSec()
	}),
	ok.

addLogParticipatorInfo2(Type,RoleID) ->
	dbLog:sendSaveLogParticipatorInfo(#recLogParticipatorInfo{
		roleName = "",
		roleID = RoleID,
		roleLevel = 0,
		currentRecharge = 0,
		forcePower = 0,
		type = Type,
		guildID = 0,
		param1 = 0,
		time = time:getLogTimeSec()
	}),
	ok.
