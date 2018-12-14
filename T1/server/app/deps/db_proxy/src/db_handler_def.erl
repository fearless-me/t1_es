%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 八月 2018 15:32
%%%-------------------------------------------------------------------
-module(db_handler_def).
-author("mawenhong").
-include("logger.hrl").

-export([handler/4]).
%% API
handler(MsgId, Msg, FromPid, PoolId) ->
    ?ERROR("msg ~w ~w from ~p, pool ~p", [MsgId, Msg, FromPid, PoolId]),
    ok.
