%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 16:25
%%%-------------------------------------------------------------------
-module(gs_cs_pub).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([info/1, call/2]).


info(Info)->
    ?ERROR("unhandle info:[~p] in [~p]", [Info,  self()]),
    ok.

%%%-------------------------------------------------------------------
-spec(call(Request :: term(), From :: {pid(), Tag :: term()}) ->
    {Reply :: term()}).
call(Request, From)->
    ?ERROR("unhandle call[~p],From[~p]", [Request,From]),
    timeout.