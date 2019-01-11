%% @author Administrator
%% @doc @todo Add description to playerTeamCopyMap.


-module(playerTeamCopyMap).

-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	inviteMemberToCopyMap/3,
	leaveCopyMapInitiative/1,
	leaveTeamCopyMap/1,
	isAssistCopyMapByCopyMapID/2,
	startCrossCopyMap/2,
	startHomeBitMap/1,
	teammateEnterHomeBitMap/1
]).

startHomeBitMap(#recTeamInfo{
	leaderID = LeaderID
	, memberList = ML
	, copyMapID = CopyMapID})->
	case playerScene:onEnterBitGroup(CopyMapID) of
		0 ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnErrorEnterBitMap);
		GroupID ->
			F = fun(#recTeamMemberInfo{roleID = RoleID,pid = Pid})->
					case RoleID==LeaderID of
						  true->
							  psMgr:sendMsg2PS(Pid, enterBitHomeAck, GroupID);
						_->
							psMgr:sendMsg2PS(Pid, teammateEnterHomeBitMap, GroupID)
					end
				end,
		   lists:foreach(F,ML)
	end,
	ok.

teammateEnterHomeBitMap(GroupID)->
	playerScene:onEnterGroup(GroupID),
	playerPet:petAutoShowWhenEnterBitHome(),
	ok.

startCrossCopyMap(ServerID, CopyMapID)->
	case core:isCross() of
		false ->
            ?DEBUG("#############startCrossCopyM[~p,~p,~p]",
                [playerState:getRoleID(), {ServerID, CopyMapID}, gsMainLogic:getADBID4GS()]),

			{IsTheSameGuild,IsFriend} = checkIsFriendAndIsSameGuild(),
			playerInterface:reqEnterCrossGS(ServerID, CopyMapID, {noticePlayerEnterCrossGameServerMap, {CopyMapID, {IsTheSameGuild,IsFriend}}});
		 _ ->
           case gsMainLogic:getADBID4GS() =:= ServerID of
               true ->
                   playerCopyMap:enterCopyMap(CopyMapID),
                   ok;
               _ ->
                   skip
           end
	end,
	ok.

inviteMemberToCopyMap(_TeamID,RoleID,CopyMapID) ->
    case gsTeamInterface:isTeamLeader(RoleID) of
        true ->
            case core:isCross() of
                true ->
                    ?DEBUG("#############startCrossCopyM[~p,~p,~p]",
                        [playerState:getRoleID(), {gsMainLogic:getDBID4GS(), CopyMapID}, gsMainLogic:getADBID4GS()]),
                    gsTeamInterface:sendMsg2TeamWithRoleID(
                        RoleID,
                        startCrossCopyMap,
                        {gsMainLogic:getDBID4GS(), CopyMapID},
                        false
                    );
                false ->
                    skip
            end,
            ok;
        _ ->
            skip
    end,
%%	case teamInterface:isTeamLeader(RoleID) of
%%		true ->
%%			teamInterface:sendMsg2TeamWithRoleID(
%%				RoleID,
%%				requestEnterCopyMap,
%%				CopyMapID,
%%				false
%%			);
%%		_ ->
%%			skip
%%	end,
	ok.

%% 主动离开副本，需要离开队伍
-spec leaveCopyMapInitiative(IsNotify::boolean()) -> boolean().
leaveCopyMapInitiative(IsNotify) ->
	MapID = playerState:getMapID(),
	case playerScene:getMapType(MapID) of
		?MapTypeCopyMap ->
			MapPid = playerState:getMapPid(),
			core:sendMsgToMapMgr(MapID, playerLeaveCopyMap, {playerState:getRoleID(), MapID, MapPid}),
			playerTeam:leaveTeam(IsNotify),
			true;
		_ ->
			false
	end.

%% 离开队伍，如果在副本中，需要离开副本
-spec leaveTeamCopyMap(IsNotify::boolean()) -> ok.
leaveTeamCopyMap(IsNotify) ->
	MapID = playerState:getMapID(),
	case playerScene:getMapType(MapID) of
		?MapTypeCopyMap ->
			%% 离开副本
			playerCopyMap:leaveCopyMap(),

			MapPid = playerState:getMapPid(),
			core:sendMsgToMapMgr(MapID, playerLeaveCopyMap, {playerState:getRoleID(), MapID, MapPid}),
			ok;
		_ ->
			skip
	end,
	%% 离开队伍
	playerTeam:leaveTeam(IsNotify),
	ok.

%% 用于第一次进入副本时，根据组队中助战地图ID来判断
-spec isAssistCopyMapByCopyMapID(RoleID::uint64(), CopyMapID::uint16()) -> boolean().
isAssistCopyMapByCopyMapID(RoleID, CopyMapID) ->
	case getCfg:getCfgByKey(cfg_mapsetting, CopyMapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap} ->
			case gsTeamInterface:getTeamMemberInfoWithRoleID(RoleID) of
				#recTeamMemberInfoGS{assistMapID = CopyMapID} -> true;
				_ -> false
			end;
		#mapsettingCfg{type = ?MapTypeActivity, subtype = MapSubType} when
			MapSubType =:= ?MapSubTypeDateFindTreasure;
			MapSubType =:= ?MapSubTypeDatePoolParty;
			MapSubType =:= ?MapSubTypeDatebox;
			MapSubType =:= ?MapSubTypeDate ->
			case gsTeamInterface:getTeamMemberInfoWithRoleID(RoleID) of
				#recTeamMemberInfoGS{assistMapID = CopyMapID} -> true;
				_ -> false
			end;
		_ ->
			false
	end.

%%进入副本前 检查是否好友和家族成员
checkIsFriendAndIsSameGuild()->
	MyRoleID = playerState:getRoleID(),
	MyGuildID =
		case ets:lookup(rec_guild_member, MyRoleID) of
			[#rec_guild_member{guildID = GuildID}] ->
				GuildID;
			_->
				[]
		end,
	TeamMemberInfoList =   gsTeamInterface:getTeamMemberInfoListWithRoleID(playerState:getRoleID()),%% [#recTeamMemberInfo{}, ...]

	F= fun(#recTeamMemberInfoGS{roleID = Rid},{IsSameGuild,_})->
		case Rid of
			MyRoleID ->
				{IsSameGuild,0};
			_->
				case ets:lookup(rec_guild_member, Rid) of
					[#rec_guild_member{guildID = OtherGuild}] ->
						case MyGuildID of
							OtherGuild ->
								{true,0};
							_->
								{IsSameGuild,0}
						end;
					_->
						{IsSameGuild,0}
				end

		end
	   end,
	{IsTheSameGuild,_} =   misc:foldlEx(F,{false,0},TeamMemberInfoList),

	F1= fun(#recTeamMemberInfoGS{roleID = Rid},{IsFrid,_})->
			case Rid of
			MyRoleID ->
				{IsFrid,0};
			_->
				case cgsFriendInterface:queryFRT(MyRoleID, Rid) of
					FRT when FRT =:= ?FRT_Formal; FRT =:= ?FRT_Cross; FRT =:= ?FRT_Temp ->
						{true, 0};
					_ ->
						{IsFrid,0}
				end
		end
		end,
	{IsFriend,_} =   misc:foldlEx(F1,{false,0},TeamMemberInfoList),
	{IsTheSameGuild,IsFriend}.