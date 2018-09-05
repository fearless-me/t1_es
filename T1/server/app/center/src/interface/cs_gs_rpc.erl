%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. 八月 2018 11:50
%%%-------------------------------------------------------------------
-module(cs_gs_rpc).
-author("mawenhong").
-include("common_ps_def.hrl").
-include("pub_def.hrl").
-include("logger.hrl").

%% API
-export([register/4]).
-export([test_rpc/0]).

register(Sid, ServerType, ServerName, FromPid) ->
%%    case misc:is_alive(?CS_SVR_MGR_OTP) of
    case watchdog:ready() of
    true -> ps:send_with_from(?CS_SVR_MGR_OTP, register, {Sid, ServerType, ServerName}, FromPid);
    _ -> {badrpc, not_ready}
    end.

test_rpc() ->
    ?WARN("game rpc call center").