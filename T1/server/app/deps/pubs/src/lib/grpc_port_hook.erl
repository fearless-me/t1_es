%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 八月 2018 9:44
%%%-------------------------------------------------------------------
-module(grpc_port_hook).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([get_config/1, get_config_rehash/2, get_server_port/0]).
-ifdef(DEBUG).
-export([test/0]).
-endif.

-define(PORT_BASE, 40000).
-define(PORT_MOD, 19000).
-define(PORT_HASH_MIN, 59001).
-define(PORT_HASH_MAX, 60000).

%%-------------------------------------------------------------------
get_server_port() -> get_config(node()).

%%-------------------------------------------------------------------
get_config(Node) ->
    Port = node_port_action(Node),
    ?WARN("gen_rpc get port for node ~p port ~p", [Node, Port]),
    Port.

%%-------------------------------------------------------------------
node_port_action(Node) when is_atom(Node) ->
    ?PORT_BASE + erlang:adler32(atom_to_list(Node)) rem ?PORT_MOD;
node_port_action(Node) when is_list(Node) ->
    ?PORT_BASE + erlang:adler32(Node) rem ?PORT_MOD.

%%-------------------------------------------------------------------
get_config_rehash(_Node, Port) when Port < ?PORT_HASH_MIN ->
    ?PORT_HASH_MIN;
get_config_rehash(_Node, Port) when Port > ?PORT_HASH_MAX ->
    port_rehash_failed;
get_config_rehash(_Node, Port) ->
    Port + 1.



-ifdef(DEBUG).
-define(RPC_PORT_ETS, gen_rpc_node_port).
test() ->
    catch ensure_ets(),
    ets:delete_all_objects(?RPC_PORT_ETS),
    CS = "t1_center@10.1.1.253",
    GS1 = lists:map(
        fun(X) ->
            lists:flatten(io_lib:format("t1_game_~p@10.1.1.~p", [X, X]))
        end, lists:seq(1, 251)),
    GS2 = lists:map(
        fun(X) ->
            lists:flatten(io_lib:format("t1_game_~p@10.1.2.~p", [X, X]))
        end, lists:seq(1, 251)),
    CGS = lists:map(
        fun(X) ->
            lists:flatten(io_lib:format("t1_cross_~p@10.1.2.~p", [X, X]))
        end, lists:seq(1, 251)),

    port_print(CS),
    lists:foreach(fun(Node) -> port_print(Node) end, GS1),
    lists:foreach(fun(Node) -> port_print(Node) end, GS2),
    lists:foreach(fun(Node) -> port_print(Node) end, CGS),
    check_conflict(),
    ok.

port_print(Node) ->
    Port = get_config(Node),
    ets:insert(?RPC_PORT_ETS, {Port, Node}).


ensure_ets() ->
    case ets:info(?RPC_PORT_ETS, size) of
        undefined ->
            ets:new(?RPC_PORT_ETS, [named_table, {keypos, 1}, bag, public]);
        _ ->
            ok
    end.

check_conflict() ->
    X =
        ets:foldl(
            fun
                (V, Conflict) when is_list(V) ->
                    case length(V) > 1 of
                        true -> Conflict + 1;
                        _Any -> Conflict
                    end;
                (_V, Conflict) ->
                    Conflict
            end, 0, ?RPC_PORT_ETS),
    io:format("conflict ~p ~n", [X]),
    ok.

-endif.