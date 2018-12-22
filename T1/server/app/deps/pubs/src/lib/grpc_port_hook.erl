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
-export([get_config/1, get_server_port/0]).
-ifdef(DEBUG).
-export([test/0]).
-endif.

-define(PORT_BASE, 30000).
-define(PORT_MOD, 25000).

%%-------------------------------------------------------------------
get_server_port() -> get_config(node()).

%%-------------------------------------------------------------------
get_config(undefined) ->
    0;
get_config({Node, _}) ->
    get_config(Node);
get_config(Node) ->
    Port = do_node_port(Node),
    ?WARN("gen_rpc get port for node ~p port ~p", [Node, Port]),
    Port.

%%-------------------------------------------------------------------
do_node_port(Node) when is_atom(Node) ->
    do_node_port(atom_to_list(Node));
do_node_port(Node) when is_list(Node) ->
    case string:tokens(Node, "@") of
        [Name, Host] ->
                case string:tokens(Name, "_") of
                    List when is_list(List) ->
                        case catch erlang:list_to_integer(lists:last(List)) of
                            Integer when is_integer(Integer), Integer < 3000 ->
                                (?PORT_BASE + crc32c:crc32c(Host) rem ?PORT_MOD) + Integer;
                            _ ->
                                node_port_default(Node)
                        end;
                    _ -> node_port_default(Node)
                end;
        _ -> node_port_default(Node)
    end.

node_port_default(Node) ->
    (?PORT_BASE + crc32c:crc32c(Node) rem ?PORT_MOD).

%%-------------------------------------------------------------------

-ifdef(DEBUG).
-define(RPC_PORT_ETS, rpc_port).
-record(rec_port_node, {port = 0, nodes = []}).
test() ->
    catch misc_ets:delete(?RPC_PORT_ETS),
    catch ensure_ets(),

    CS = "t1_center@10.1.1.253",
    GS1 = lists:map(
        fun(X) ->
            lists:flatten(io_lib:format("t1_game_~p@10.1.1.10", [X]))
        end, lists:seq(1, 1500)),
    CGS = lists:map(
        fun(X) ->
            lists:flatten(io_lib:format("t1_cross_~p@10.1.1.10", [X]))
        end, lists:seq(1501, 2000)),


    port_print(CS),
    lists:foreach(fun(Node) -> port_print(Node) end, GS1),
    lists:foreach(fun(Node) -> port_print(Node) end, CGS),
    check_conflict(),
    ok.

port_print(Node) ->
    Port = get_config(Node),
    case misc_ets:read(?RPC_PORT_ETS, Port) of
        [] ->
            misc_ets:write(?RPC_PORT_ETS, #rec_port_node{port = Port, nodes = [Node]});
        [#rec_port_node{nodes = NodeList} = Rec] ->
            misc_ets:write(?RPC_PORT_ETS, Rec#rec_port_node{nodes = [Node | NodeList]})
    end.


ensure_ets() ->
    case misc_ets:exists(?RPC_PORT_ETS) of
        false ->
            misc_ets:new(?RPC_PORT_ETS, [named_table, {keypos, #rec_port_node.port}, public]);
        _ ->
            ok
    end.

check_conflict() ->
    ?INFO("check port conflict ..."),
    misc_ets:foldl(
        fun(#rec_port_node{port = Port, nodes = NodeList}, _) ->
            case NodeList of
                [_] -> skip;
                _ -> ?ERROR("~p ~p", [Port, NodeList])
            end

        end, 0, ?RPC_PORT_ETS),
    ?INFO("check port conflict done#"),
    ok.

-endif.