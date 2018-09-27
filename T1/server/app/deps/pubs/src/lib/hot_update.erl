
%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2018 15:24
%%%-------------------------------------------------------------------

-module(hot_update).

-include("logger.hrl").

-export([reload/1, slave_reload_module/3]).

-define(SOFT_PURGE_WAIT_TIME, 500).
-define(SOFT_PURGE_WAIT_COUNT, 10).

%%-------------------------------------------------------------------
reload([])->
	ok;
reload([Module | T]) ->
	reload(Module),
	reload(T);
reload(Module) when erlang:is_atom(Module) ->
	code:purge(Module),
	case code:get_object_code(Module) of
		{Module, Binary, Filename} ->
			case try_to_safe_reload(Module, Filename, Binary, ?SOFT_PURGE_WAIT_COUNT) of
            	{module, Module} ->
                    ?WARN("~p: ~p reload.",[Module, node()]),
					reload_on_slave(Module, Filename, Binary);
				{error, What} ->
                    ?ERROR("~p: ~p reload error ~p.",[Module, node(), What])
			end;		
		error ->
            ?ERROR("~p: ~p reload error error_get_object_code.",[Module, node()])
	end.


%%-------------------------------------------------------------------
reload_on_slave(Module, Filename, Binary)->
    Node = node(),
	case misc:process_node(pool_master) of
        Node -> do_reload_on_slave(Module, Filename, Binary);
		_ -> skip
	end,
	ok.

do_reload_on_slave(Module, Filename, Binary) ->
	lists:foreach(
		fun(Node)->
			case rpc:call(Node, hot_update,slave_reload_module, [Module, Filename, Binary]) of
                {module, Module} ->
                    ?WARN("~p: ~p reload.",[Module, Node]);
                Error ->
                    ?ERROR("~p: ~p reload error ~p.",[Module, Node, Error])
			end
		end, nodes_excl_me()).


%%-------------------------------------------------------------------
nodes_excl_me() -> pool:get_nodes() -- [node()].


%%-------------------------------------------------------------------
slave_reload_module(Module, Filename, Binary)->
	try_to_safe_reload(Module, Filename, Binary, ?SOFT_PURGE_WAIT_COUNT).


%%-------------------------------------------------------------------
try_to_safe_reload(Module, Filename, Binary, N) when N =< 0 ->
	code:purge(Module),
	code:load_binary(Module, Filename, Binary);
try_to_safe_reload(Module, Filename, Binary, N)  ->
	case code:soft_purge(Module) of
		true ->
			code:load_binary(Module, Filename, Binary);
		false ->
			misc:sleep(?SOFT_PURGE_WAIT_TIME),
			try_to_safe_reload(Module, Filename, Binary, N - 1)
	end.



