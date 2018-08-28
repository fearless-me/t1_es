%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 八月 2018 10:48
%%%-------------------------------------------------------------------
-module(cross_dst_priv).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([player_req_enter_cross/3, player_req_leave_cross/2]).

player_req_enter_cross(PPlayer, Pid, Socket) ->
    gs_cache_interface:online(PPlayer, Pid, Socket),
    ok.

player_req_leave_cross(Aid, Uid) ->
    gs_cache_interface:offline(Aid, Uid),
    ok.
