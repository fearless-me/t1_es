%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 16:35
%%%-------------------------------------------------------------------
-module(gs_cs_interface).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_cs_def.hrl").

%% API
-export([
    register/1, allow/0,
    get_center_server_pid/0,
    is_center_ready/0
]).


register(Node) ->
    Sid = gs_conf:get_sid(),
    ServerType = get_server_type(),
    ServerName = gs_conf:get_server_name(),
    case rpc:call(
        Node,
        cs_gs_rpc,
        register,
        [Sid, ServerType, ServerName, self()]
    ) of
        {badrpc, Reason} ->
            ?WARN("register to center rpc call failed ~p, try later",[Reason]),
            false;
        _ ->
            true
    end.

allow() ->
    try
        CurNode = erlang:node(),
        CsNode = gs_conf:get_center(),
        [_CurNodeName, IP | _] = string:tokens(atom_to_list(CurNode), "@"),
        NodeList = ["stopgs@" ++ IP, "reload@" ++ IP, "entopGS@" ++ IP, "dbgEmc@" ++ IP],
        misc:allow_node(CsNode),
        lists:foreach(fun(Name) -> misc:allow_node(Name) end, NodeList),
        ok
    catch
        _ : _Err : _ ->
            skip
    end,
    ok.


%%%-------------------------------------------------------------------
get_server_type() ->
    case gs_conf:is_cross() of
        true ->
            ?SERVER_TYPE_CGS;
        _ ->
            ?SERVER_TYPE_GS
    end.

get_center_server_pid() ->
    case ets:lookup(?CenterServerEts, ?CenterServerKey) of
        [#recCenterInfo{pid = Pid}] -> Pid;
        _ -> undefined
    end.

is_center_ready() ->
    case ets:lookup(?CenterServerEts, ?CenterServerKey) of
        [#recCenterInfo{status = ?SEVER_STATUS_DONE}] -> true;
        _ -> false
    end.