%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:12
%%%-------------------------------------------------------------------
-module(login_mod).
-author("mawenhong").
-include("gs_common_rec.hrl").
-include("logger.hrl").

%% API
-export([login_1/2]).
-export([logout_1/2]).

%%--------------------------------------------------------------------
login_1(Req, S) ->
    Bool = verify(Req),
    login_2(Bool, Req,  S).

login_2({false, Error}, Req, S)->
    ps:send(Req#r_login_req.player_pid,
        login_ack, #r_login_ack{error = Error}),
    S;
login_2(true, Req, S)->
    #r_login_req{plat_name = PN, plat_account_name = PA} = Req,
    AccountCrc = gs_interface:plat_account_crc(PN, PA),
    gs_db_interface:action_account_(AccountCrc, account_login,  Req),
    maps:update(in, maps:get(in, S) + 1, S).

%%--------------------------------------------------------------------
verify(#r_login_req{}) -> true;
verify(#r_login_req{}) -> {false, invalid}.

%%--------------------------------------------------------------------
logout_1(_AccountID, S) ->
    maps:update(in, maps:get(in, S) - 1, S).