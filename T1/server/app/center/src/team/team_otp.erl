%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 八月 2018 10:03
%%%-------------------------------------------------------------------
-module(team_otp).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("cs_ps_def.hrl").
-include("pub_def.hrl").
-include("team.hrl").

%% API
-export([start_link/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    global:register_name(?TEAM_OTP, self()),
    ets:new(?Ets_TeamList, [protected, named_table, {keypos, #m_team_info.teamID},{read_concurrency, true}]),	%% 队伍信息
    ets:new(?Ets_RoleIDRefTeamID, [protected, named_table, {keypos, #m_uid_ref_tid.roleID},{read_concurrency, true}]),	%% 队伍信息
    ets:new(?Ets_RoleMatchTeam, [protected, named_table, {keypos, #m_player_match.roleID},{read_concurrency, true}]),	%% 队伍信息
    team_logic:tickMsg(),
    ?INFO("[~p] init ok",[self()]),

    {ok, #{}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({queryMatchState, Msg ,_FromPid },State) ->
    team_logic:queryMatchState(Msg),
    {noreply,State};
do_handle_info({sendInitTeamInfo, Msg ,_FromPid },State) ->
    team_logic:sendInitTeamInfo(Msg),
    {noreply,State};
do_handle_info({createTeam, Msg ,_FromPid },State) ->
    team_logic:createNewTeam(Msg),
    {noreply,State};
do_handle_info({dimissTeam, Msg ,_FromPid },State) ->
    team_logic:dismissTeam(Msg),
    {noreply,State};
do_handle_info({joinTeam, Msg ,_FromPid },State) ->
    team_logic:joinTeam(Msg),
    {noreply,State};
do_handle_info({matchTeam, Msg ,_FromPid },State) ->
    team_logic:matchTeam(Msg),
    {noreply,State};
do_handle_info({cancelMatchTeam, Msg ,_FromPid },State) ->
    team_logic:cancelMatchTeam( Msg ),
    {noreply,State};
do_handle_info({leaveTeam, Msg ,_FromPid },State) ->
    team_logic:leaveTeam(Msg),
    {noreply,State};
do_handle_info({leaveTeamAndEnter, Msg ,_FromPid },State) ->
    team_logic:leaveTeamAndEnter(Msg),
    {noreply,State};
do_handle_info({kickMember, Msg ,_FromPid },State) ->
    team_logic:kickMember(Msg),
    {noreply,State};
do_handle_info({changeLeader, Msg ,_FromPid },State) ->
    team_logic:changeLeader(Msg),
    {noreply,State};
do_handle_info({leaderOffline, Msg ,_FromPid },State) ->
    team_logic:leaderOffline(Msg),
    {noreply,State};
do_handle_info({changeTargetMapID, Msg ,_FromPid },State) ->
    team_logic:changeTargetMap(Msg),
    {noreply,State};
do_handle_info({changeMapUpdateTeamInfo, Msg ,_FromPid },State) ->
    team_logic:changeMapUpdateTeamInfo(Msg),
    {noreply,State};
do_handle_info({leaderStartCopymap, Msg ,_FromPid },State) ->
    team_logic:leaderStartCopyMap(Msg),
    {noreply,State};
do_handle_info({memberStartCopymapAck, Msg ,_FromPid },State) ->
    team_logic:memberStartCopyMapAck(Msg),
    {noreply,State};
do_handle_info({setSearchFlag, Msg ,_FromPid },State) ->
    team_logic:setSearchFlag(Msg),
    {noreply,State};
do_handle_info({updateMemberInfo, Msg ,_FromPid },State) ->
    team_logic:updateMemberInfo(Msg),
    {noreply,State};
do_handle_info({assistCopyMapStart, Msg ,_FromPid },State) ->
    team_logic:assistCopyMapStart(Msg),
    {noreply,State};
do_handle_info({assistCopyMapCancel, Msg ,_FromPid },State) ->
    team_logic:assistCopyMapCancel(Msg),
    {noreply,State};
do_handle_info({noticeLeader, Msg ,_FromPid },State) ->
    team_logic:noticeLeader(Msg),
    {noreply,State};
do_handle_info({nodedown, Msg ,_FromPid },State) ->
    team_logic:onServerDown(Msg),
    {noreply,State};
do_handle_info(tick,State) ->
    team_logic:tick(),
    {noreply,State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.