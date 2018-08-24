-module(hot_update).

-include("logger.hrl").

-export([reload/1, slave_reload_module/3]).

%% todo 重新整理下这个逻辑好安全的更新

reload([])->
	ok;
reload([Module | T]) ->
	reload(Module),
	reload(T);
reload(Module) when erlang:is_atom(Module) ->
	code:purge(Module),
	case code:get_object_code(Module) of
		{Module, Binary, Filename} ->
			case code:load_binary(Module, Filename, Binary) of
            	{module, Module} ->
                    ?WARN("~p: ~p reload.",[Module, node()]),
					reload_on_slave(Module, Binary, Filename);
				{error, What} ->
                    ?ERROR("~p: ~p reload error ~p.",[Module, node(), What])
			end;		
		error ->
            ?ERROR("~p: ~p reload error error_get_object_code.",[Module, node()])
	end.



reload_on_slave(Module, Binary, Filename)->
    Node = node(),
	case misc:process_node(pool_master) of
        Node -> do_reload_on_slave(Module, Binary, Filename);
		_ -> skip
	end,
	ok.

do_reload_on_slave(Module, Binary, Filename) ->
	lists:foreach(
		fun(Node)->
			case rpc:call(Node, hot_update,slave_reload_module, [Module, Binary, Filename]) of
                {module, Module} ->
                    ?WARN("~p: ~p reload.",[Module, Node]);
                Error ->
                    ?ERROR("~p: ~p reload error ~p.",[Module, Node, Error])
			end
		end, nodes_excl_me()).


nodes_excl_me() -> pool:get_nodes() -- [node()].


slave_reload_module(Module, Binary, Filename)->
    code:purge(Module),
    code:load_binary(Module, Filename, Binary).



