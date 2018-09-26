%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 八月 2018 10:02
%%%-------------------------------------------------------------------
-module(cs_team_interface).
-author("mawenhong").

-include("common_team_inc.hrl").


%% API
-export([
    %% 是否是队长
    isTeamLeader/1,
    %% 是否有队伍
    isInTeam/1
]).


%% 是否是队长
isTeamLeader(RoleID) ->
    case read_team_info_by_role(RoleID) of
        #m_share_team_info{leaderID = RoleID} ->
            true;
        _ ->
            false
    end.

%% 是否有队伍
isInTeam(RoleID) ->
    read_team_id_by_role(RoleID) =/= 0.



%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%% 下面的函数不要导出
%%%-------------------------------------------------------------------

%%%-------------------------------------------------------------------
read_team_id_by_role(0) ->
    0;
read_team_id_by_role(RoleID) ->
    case catch misc_ets:read(?Ets_RoleIDRefTeamID, RoleID) of
        [#m_share_uid_ref_tid{teamID = TeamID}] ->
            TeamID;
        _ ->
            0
    end.

%%%-------------------------------------------------------------------
read_team_info_by_tid(0) ->
    undefined;
read_team_info_by_tid(TeamID) ->
    case catch misc_ets:read(?Ets_TeamList, TeamID) of
        [#m_share_team_info{} = TeamInfo] ->
            TeamInfo;
        _ ->
            undefined
    end.
%%%-------------------------------------------------------------------
read_team_info_by_role(0) ->
    undefined;
read_team_info_by_role(RoleID) ->
    TID = read_team_id_by_role(RoleID),
    read_team_info_by_tid(TID).