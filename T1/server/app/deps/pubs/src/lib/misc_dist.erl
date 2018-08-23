%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 八月 2018 14:04
%%%-------------------------------------------------------------------
-module(misc_dist).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([start_slaves/2, start_slave/3]).

%%-------------------------------------------------------------------
start_slaves(Host, SlaveNum) ->
    {ok, Paths} = init:get_argument(pa),
    Path = lists:foldl(
        fun([Path], Acc) ->
            Acc ++ " -pa " ++ Path ++ " "
        end, [], Paths),
    lists:foldl(
        fun(Number, Index) ->
            NodeName = misc:to_atom(lists:concat(["slave_", Number])),
            Command = lists:concat([
                "+S 1  -detached -noinput ", Path,
                " -setcookie ", erlang:get_cookie()]),
            case slave:start(misc:to_atom(Host), NodeName, Command) of
                {ok, Node} ->
                    ?WARN("~p create slave node ~p ok", [node(), Node]);
                {_, Error} ->
                    misc:halt("~p create slave node ~p:~p failed ~p",
                        [node(), NodeName, Host, Error])
            end,
            Index + 1
        end, 1, lists:seq(1, SlaveNum)),
    ok.


%%-------------------------------------------------------------------
start_slave(Host, SlaveName, Args) ->
    {ok, Paths} = init:get_argument(pa),
    Path = lists:foldl(
        fun([Path], Acc) ->
            Acc ++ " -pa " ++ Path ++ " "
        end, [], Paths),

    Command = lists:concat([
        "+S 1 -detached -noinput ", Path,
        " -setcookie ", erlang:get_cookie(), Args]),
    case slave:start(misc:to_atom(Host), SlaveName, Command) of
        {ok, Node} ->
            ?WARN("~p create slave node ~p ok", [node(), Node]),
            Node;
        {_, Error} ->
            misc:halt("~p create slave node ~p:~p failed ~p",
                [node(), SlaveName, Host, Error])
    end.

%%-------------------------------------------------------------------
