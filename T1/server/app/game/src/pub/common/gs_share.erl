%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. 八月 2018 15:29
%%%-------------------------------------------------------------------
-module(gs_share).
-author("mawenhong").

%% API
-export([start/0, restart/0]).


start() ->
    MasterNode = gs_interface:get_center_node(),
    true = misc_mnesia:start(),
    mnesia:set_master_nodes([MasterNode]),
    ok.

restart() ->
    misc_mnesia:stop(),
    true = misc_mnesia:start(),
    ok.