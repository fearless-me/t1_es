%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 14:36
%%%-------------------------------------------------------------------
-module(server_mgr_pub).
-author("mawenhong").

%% API
-export([on_nodedown/2]).

on_nodedown(GSNode, ServerID) ->
    ok.