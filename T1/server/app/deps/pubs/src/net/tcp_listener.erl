%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 一月 2018 15:59
%%%-------------------------------------------------------------------
-module(tcp_listener).
-author("mawenhong").

%% API
-export([start_listener/4]).

%% TransOpts = [{port, Port},{max_connections, Max}]
start_listener(Ref, NumAcceptors, TransOpts, Handler)->
    true = misc:ensure_all_applications_started(ranch),
    {ok, _} = ranch:start_listener(
        Ref, NumAcceptors, ranch_tcp, TransOpts, tcp_handler, [{handler, Handler}]),
    ok.
