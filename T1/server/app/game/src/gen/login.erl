%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:12
%%%-------------------------------------------------------------------
-module(login).
-author("mawenhong").
-include("common_record.hrl").
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
    MergeAccount = gcore:merge_plat_acc_name(PN, PA),
    lib_db:action_a_(misc:crc32(MergeAccount), account_login,  Req),
    maps:update(in, maps:get(in, S) + 1, S).

%%--------------------------------------------------------------------
verify(#r_login_req{}) -> true;
verify(#r_login_req{}) -> {false, invalid}.

%%--------------------------------------------------------------------
logout_1(_AccountID, S) ->
    maps:update(in, maps:get(in, S) - 1, S).