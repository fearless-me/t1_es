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
-export([start_listener/5]).
-export([start_listener/6]).

%% TransOpts = [{port, Port},{max_connections, Max}]
start_listener(Ref, NumAcceptors, TransOpts, Handler) ->
    true = misc:start_all_app(ranch),
    {ok, _} = ranch:start_listener(
        Ref,
        NumAcceptors,
        ranch_tcp,
        TransOpts,
        tcp_handler,
        [{handler, Handler}]
    ),
    ok.

start_listener(Ref, NumAcceptors, Port, MaxConnection, Handler) ->
    true = misc:start_all_app(ranch),
    {ok, _} = ranch:start_listener(
        Ref,
        NumAcceptors,
        ranch_tcp,
        [{port, Port}, {max_connections, MaxConnection},{backlog, 512}],
        tcp_handler,
        [{handler, Handler}]
    ),
    ok.

start_listener(Ref, NumAcceptors, Port, MaxConnection, Handler, Conf) ->
    true = misc:start_all_app(ranch),
    {ok, _} = ranch:start_listener(
        Ref,
        NumAcceptors,
        ranch_tcp,
        [{port, Port}, {max_connections, MaxConnection}, {backlog, 512}],
        tcp_handler,
        [{handler, Handler},{netConf,Conf}]
    ),
    ok.

