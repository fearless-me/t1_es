%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:12
%%%-------------------------------------------------------------------
-module(mod_login).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("netmsg.hrl").
-include("login.hrl").

-export([login_/1, logout_/1]).
%% API
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

login_(Ack)         -> ps_mgr:send(?MODULE, {login_req,Ack}).
logout_(AccountID)  -> ps_mgr:send(?MODULE, {logout, AccountID}).


-record(login_state, {lt = 1800, in = 0, lq = undefined}).
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

    {ok, #login_state{lq = lqueue:new()}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({login_req, Req}, State) ->
    {noreply, login_1(Req, State)};
do_handle_info({logout, AccountID}, State) ->
    {noreply, logout_1(AccountID, State)};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
login_1(#login_req{
    player_pid = Pid,
    access_token = Token,
    plat_account_name = PlatAccount
}, S) ->
    Ack = verify(PlatAccount, Token),
    login_2(Pid, Ack, S).

login_2(Pid, {false, Error}, S)->
    ps_mgr:send(Pid, {login_ack, #login_ack{error = Error}}),
    S;
login_2(Pid, {true, PlatAccount}, S)->
    AccountInfo = load_account_info(PlatAccount),
    ps_mgr:send(Pid, {login_ack, #login_ack{account_info = AccountInfo}}),
    S#login_state{in = S#login_state.in + 1}.

verify(PlatAccount, _Token) ->
    {true, PlatAccount}.

load_account_info(Acc) ->
    #account_info{account_name = Acc, account_id = 9999}.
%%--------------------------------------------------------------------
logout_1(_AccountID, S) ->
    S#login_state{in = S#login_state.in - 1}.


