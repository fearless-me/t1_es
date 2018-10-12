-module(reload).

%% ====================================================================
%% API functions
%% ====================================================================
-export([reload/1]).

%%调用update模块热更新
reload(Param) ->
    [Node | Other] = Param,
    io:format("Reload Node: ~p~n~n", [Node]),
    case erlang:length(Other) > 0 of
        true ->
            Ret = rpc:call(Node, hot_update, reload, [Other]),
            case Ret of
                {badrpc, Reason} ->
                    io:format("want to update modules:~p failed by:~p~n~n", [Other, Reason]);
                _ ->
                    io:format("want to update modules:~p ok~n~n", [Other])
            end;
        _ ->
            io:format("want to update modules:~p ok~n~n", [Other])
    end,
    erlang:halt().



