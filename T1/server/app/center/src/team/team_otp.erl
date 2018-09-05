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
-include("common_team_inc.hrl").

%% API
-export([start_link/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({global, ?CS_TEAM_OTP}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
%%    ets:new(?Ets_TeamList, [protected, named_table, {keypos, #m_team_info.teamID},{read_concurrency, true}]),	%% 队伍信息
%%    ets:new(?Ets_RoleIDRefTeamID, [protected, named_table, {keypos, #m_uid_ref_tid.roleID},{read_concurrency, true}]),	%% 队伍信息
%%    ets:new(?Ets_RoleMatchTeam, [protected, named_table, {keypos, #m_player_match.roleID},{read_concurrency, true}]),	%% 队伍信息
    team_logic:tickMsg(),
    ?INFO("[~p] init ok",[self()]),

    {ok, ok}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------

do_handle_info({createTeam, Msg ,_FromPid },State) ->
    team_logic:createNewTeam(Msg),
    {noreply,State};
do_handle_info({leaveTeam, Msg ,_FromPid },State) ->
    team_logic:leaveTeam(Msg),
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