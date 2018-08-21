%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 八月 2018 11:44
%%%-------------------------------------------------------------------
-module(gs_rpc).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([test_rpc/0]).

test_rpc() ->
    ?WARN("center rpc call game").