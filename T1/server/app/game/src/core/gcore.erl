%%%%%-------------------------------------------------------------------
%%%%% @author mawenhong
%%%%% @copyright (C) 2018, <COMPANY>
%%%%% @doc
%%%%%
%%%%% @end
%%%%% Created : 28. 五月 2018 14:38
%%%%%-------------------------------------------------------------------
-module(gcore).
-author("mawenhong").
-include("gsdef.hrl").
-include("pub_common.hrl").

%%
%%%% API
%%-export([is_cross/0]).
%%-export([server_type/0]).
%%-export([get_db_id/0]).
%%-export([load_ini_conf/1]).
%%-export([get_db_nodes/0]).
%%
%%%%
%%is_cross() -> fasle.
%%
%%%%
%%get_db_id() -> 1.
%%
%%%%
%%server_type() ->
%%   case is_cross() of
%%        true ->
%%            ?ST_CGS;
%%        _ ->
%%            ?ST_GS
%%    end.
%%
%%load_ini_conf(FileName) ->
%%    misc:start_all_app(econfig),
%%    ok = econfig:register_config(?GS_INI_CONF, [FileName]),
%%    ok.
%%
%%get_db_nodes() -> [].
%%%%    N = econfig:get_integer(?GS_INI_CONF, dbs_node, node_num, 0),
%%%%    lists:foldl(
%%%%        fun(X, Acc) ->
%%%%            Node = list_to_atom(lists:flatten(io_lib:format("node_~p", [X]))),
%%%%            case econfig:get_binary(?GS_INI_CONF, dbs_node, Node) of
%%%%                undefined -> Acc;
%%%%                NodeName -> [binary_to_atom(NodeName, utf8) | Acc]
%%%%            end
%%%%        end, [], lists:seq(1, N)).