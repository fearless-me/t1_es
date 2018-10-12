-module(reload).

%% ====================================================================
%% API functions
%% ====================================================================
-export([reload/1]).

%%调用update模块热更新
reload(Param) ->
    [Node | Other] = Param,
    io:format("Reload Node: ~p~n~n", [Node]),
    case Other of
        [] ->
            io:format("want to update modules:~p ok~n~n", [Other]);
        _ ->
            Ret = rpc:call(Node, hot_update, reload, [Other]),
            case Ret of
                {badrpc, Reason} ->
                    io:format("want to update modules:~p failed by:~p~n~n", [Other, Reason]);
                _ ->
                    io:format("want to update modules:~p ok~n~n", [Other])
            end
    end,
    erlang:halt().



