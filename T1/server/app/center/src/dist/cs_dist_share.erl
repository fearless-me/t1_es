%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 八月 2018 8:42
%%%-------------------------------------------------------------------
-module(cs_dist_share).
-author("mawenhong").

%% API
-export([start/0, restart/0]).


start() ->
    true = misc_mnesia:start(),
    ok.

restart() ->
    misc_mnesia:stop(),
    true = misc_mnesia:start(),
    ok.