%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 所有逻辑在这里处理
%%% @end
%%% Created : 06. 十月 2017 15:18
%%%-------------------------------------------------------------------
-module(server_logic).
-author("mawenhong").
-include("logger.hrl").


%% API
-export([info/1, call/2]).

%%%-------------------------------------------------------------------
info(Info) ->
    ?ERROR("unhandle info:[~p] in [~p] [~p,~p]", [Info, node(), ?MODULE, self()]),
    ok.


%%%-------------------------------------------------------------------
-spec(call(Request :: term(), From :: {pid(), Tag :: term()}) ->
    {Reply :: term()}).
call(Request, From) ->
    ?ERROR("unhandle call[~p],From[~p]", [Request, From]),
    timeout.



