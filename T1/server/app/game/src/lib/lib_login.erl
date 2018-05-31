%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:12
%%%-------------------------------------------------------------------
-module(lib_login).
-author("mawenhong").
-include("common_record.hrl").
-include("logger.hrl").

%% API
-export([login_1/2]).
-export([logout_1/2]).
-export([verify/2]).


%%--------------------------------------------------------------------
login_1(#r_login_req{
    player_pid = Pid,
    access_token = Token,
    plat_account_name = PlatAccount
}, S) ->
    Ack = verify(PlatAccount, Token),
    login_2(Pid, Ack, S).

login_2(Pid, {false, Error}, S)->
    ps:send(Pid, login_ack, #r_login_ack{error = Error}),
    S;
login_2(Pid, {true, PlatAccount}, S)->
    lib_db:action_p_(misc:crc32(PlatAccount), account_login,  PlatAccount, Pid),
    S#login_state{in = S#login_state.in + 1}.

%%--------------------------------------------------------------------
verify(PlatAccount, _Token) ->
    {true, PlatAccount}.

%%--------------------------------------------------------------------
logout_1(_AccountID, S) ->
    S#login_state{in = S#login_state.in - 1}.