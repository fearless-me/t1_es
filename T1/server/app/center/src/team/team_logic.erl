%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%   先写入 Ets_RoleIDRefTeamID， 再写入 Ets_TeamList
%%%   先删除 Ets_TeamList， 再删除 Ets_RoleIDRefTeamID
%%% @end
%%% Created : 05. 五月 2017 14:42
%%%-------------------------------------------------------------------
-module(team_logic).
-author("Administrator").

-include("logger.hrl").
-include("common_team_inc.hrl").

-export([
	tick/0,
	tickMsg/0
]).

%% API
-export([
	createNewTeam/1,
	leaveTeam/1
]).


%%%-------------------------------------------------------------------
tickMsg() ->
	erlang:send_after(?TeamTickTimeMS, self(), tick).

tick() ->
	tickMsg(),
	Now = misc_time:milli_seconds(),
	L = mne_ex:dirty_all_keys(?ShareUidTeamMatchName),
	tickMatch(Now, L, ?MatchTickControlMax),
	ok.

tickMatch(_Now, [], _N) ->
	ok;
tickMatch(_Now, _L, N) when N =< 0 ->
	ok;
tickMatch(
	Now
	, [_ | L]
	, N
) ->
	tickMatch(Now, L, N - 1).

%%%-------------------------------------------------------------------
createNewTeam({CopyMapID, TargetRoleID, MemberInfo}) ->
    case canCreateTeam(CopyMapID, MemberInfo#m_team_member.roleID) of
        {true, _} ->
            doCreateNewTeam(CopyMapID, TargetRoleID, MemberInfo);
        {_, ErrorCode} ->
            csCore:sendErrorCodeMsg(MemberInfo#m_team_member.netPid, ErrorCode)
    end.
%%canCreateTeam(0, _RoleID) ->
%%	{false, ?ErrorCode_TeamCantChangeMapZero};
canCreateTeam(_CopyMapID, RoleID) ->
    case cs_team_interface:getTeamID(RoleID) of
        TeamID when TeamID > 0 ->
            {false, -1};
        _ ->
            {true, 0}
    end.

doCreateNewTeam(CopyMapID, TargetRoleID, #m_team_member{
    pid = Pid,
    netPid = NetPid,
    roleID = RoleID,
    serverID = ServerID
} = MemberInfo) ->

    NewTeamID = uidMgr:makeTeamUID(),
    TeamInfo = #m_share_team_info{
        teamID = NewTeamID,
        copyMapID = CopyMapID,
        leaderID = RoleID,
        searchStartTime = time:getSyncTimeFromDBS(),
        memberList = [MemberInfo]
    },
    mne_ex:dirty_delete(?ShareUidTeamMatchName, RoleID),
    true = mne_ex:dirty_write(
        #m_share_uid_ref_tid{roleID = RoleID, teamID = NewTeamID, serverID = ServerID}),
    true = mne_ex:dirty_write(?Ets_TeamList, TeamInfo),

    ?DEBUG("[~p]create Team[~p] with[~p], leader[~p],targetMap[~p], member[~p]",
        [RoleID, NewTeamID, TargetRoleID, RoleID, CopyMapID, RoleID]),

    %% 加入组队后向角色进程反馈
    ps:send(Pid, joinTeamOK, NewTeamID),
    ok.

%%%-------------------------------------------------------------------
leaveTeam({RoleID, Pid, NetPid, IsNotify}) ->
    case canLeaveTeam(RoleID) of
        {true, [TeamInfo]} ->
            doLeaveTeam(RoleID, Pid, NetPid, TeamInfo);
        {_, _ErrorCode} when IsNotify ->
           skip;
        _ ->
            skip
    end,
    ok.

canLeaveTeam(RoleID) ->
    case cs_team_interface:getTeamID(RoleID) of
        TeamID when TeamID > 0 ->
            {true, ets:lookup(?Ets_TeamList, TeamID)};
        _ ->
            {false, -999}
    end.

doLeaveTeam(RoleID, Pid, NetPid,
    #m_share_team_info{teamID = TeamID, leaderID = LeaderID} = TeamInfo
) ->

    onMemberLeaveTeam(RoleID, LeaderID, TeamInfo),
    mne_ex:dirty_delete(?ShareUidRefTeamIdName, RoleID),
    ?DEBUG("[~p] leave team[~p],leadre[~p -> 0]",
        [RoleID, TeamID, LeaderID]),

    %% 离开组队后向角色进程反馈
    ps:send(Pid, leaveTeamOK, TeamID),
    ok.

%% 队长离队
onMemberLeaveTeam(LeaderID, LeaderID,
    #m_share_team_info{teamID = TeamID, memberList = ML} = TeamInfo
) ->
    NML = lists:keydelete(LeaderID, #m_team_member.roleID, ML),
    NewLeaderID =
        case NML of
            [] ->
                0;
            [#m_team_member{roleID = RoleID} | _] ->
                RoleID
        end,

    case NewLeaderID =:= 0 of
        true ->
            mne_ex:dirty_delete(?ShareTeamInfoName, TeamID);
        _ ->
            NewTeamInfo = TeamInfo#m_share_team_info{
                leaderID = NewLeaderID,
                memberList = lists:keydelete(LeaderID, #m_team_member.roleID, ML)
            },
            mne_ex:write(NewTeamInfo),
            ok
    end,
    ok;
%% 普通成员离队
onMemberLeaveTeam(RoleID, _LeaderID,
    #m_share_team_info{teamID = TeamID, memberList = ML} = TeamInfo
) ->
    NML = lists:keydelete(RoleID, #m_team_member.roleID, ML),
    case NML of
        [] ->
            mne_ex:dirty_delete(?ShareTeamInfoName, TeamID),
            ok;
        _ ->
            NewTeamInfo = TeamInfo#m_share_team_info{
                memberList = lists:keydelete(RoleID, #m_team_member.roleID, ML)
            },
            mne_ex:write(NewTeamInfo),
            ok
    end,
    ok.

