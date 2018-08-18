%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 八月 2018 14:04
%%%-------------------------------------------------------------------
-module(slave).
-author("mawenhong").

%% API
-export([]).

f() ->
    rpc:pmap()
    slave:start("slave@127.0.0.1"),
    ok.