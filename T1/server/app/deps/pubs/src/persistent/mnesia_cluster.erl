%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 10:39
%%%-------------------------------------------------------------------
-module(mnesia_cluster).
-author("mawenhong").

%% API
-export([leave_cluster/0]).
-export([remove_node_if_mnesia_running/1]).


%% 通知集群的其他节点自己离开集群
leave_cluster() ->
    case nodes_excl_me(cluster_nodes(all)) of
        []       -> true;
        AllNodes -> lists:any(fun leave_cluster/1, AllNodes)
    end.


%% 通知Node节点本节点离开集群
leave_cluster(Node) ->
    case rpc:call(Node,
        mnesia_cluster, remove_node_if_mnesia_running, [node()]) of
        ok  -> true;
        Any -> {false, Any}
    end.

notify_left_cluster(Node) ->
    Nodes = cluster_nodes(running),
    gen_server:abcast(Nodes, mnesia_subscriber, {left_cluster, Node}),
    ok.

cluster_nodes(WhichNodes) -> cluster_status(WhichNodes).

remove_node_if_mnesia_running(Node) ->
    case misc_mnesia:is_running() of
        false ->
            {error, mnesia_not_running};
        true ->
            %% Deleting the the schema copy of the node will result in
            %% the node being removed from the cluster, with that
            %% change being propagated(传播) to all nodes
            %% 删除Node节点的模式表schema将导致Node节点将会被移除掉集群，同时这个改变将会被传播到集群的其他节点
            case mnesia:del_table_copy(schema, Node) of
                {atomic, ok} ->
                    notify_left_cluster(Node),
                    ok;
                {aborted, Reason} ->
                    {error, {failed_to_remove_node, Node, Reason}}
            end
    end.


cluster_status_from_mnesia() ->
    case misc_mnesia:is_running() of
        false ->
            {error, mnesia_not_running};
        true ->
            %% If the tables are not present, it means that
            %% `init_db/3' hasn't been run yet. In other words, either
            %% we are a virgin node or a restarted RAM node. In both
            %% cases we're not interested in what mnesia has to say.
            NodeType = case mnesia:system_info(use_dir) of
                           true  -> disc;
                           false -> ram
                       end,
         AllNodes = mnesia:system_info(db_nodes),
        %% 拿到磁盘节点列表
        DiscCopies = mnesia:table_info(schema, disc_copies),
        DiscNodes = case NodeType of
                        disc -> nodes_incl_me(DiscCopies);
                        ram  -> DiscCopies
                    end,
        %% `mnesia:system_info(running_db_nodes)' is safe since
        %% we know that mnesia is running
        %% 拿到当前正在运行中的集群节点列表
        RunningNodes = mnesia:system_info(running_db_nodes),
        {ok, {AllNodes, DiscNodes, RunningNodes}}
    end.

cluster_status(WhichNodes) ->
    {AllNodes, DiscNodes, RunningNodes} = Nodes =
        case cluster_status_from_mnesia() of
            {ok, Nodes0} ->
                Nodes0;
            {error, Reason} ->
                throw({error, {Reason}})
        end,
    %% 根据WhichNodes这个类型得到不同的节点列表
    case WhichNodes of
        status  -> Nodes;
        all     -> AllNodes;
        disc    -> DiscNodes;
        ram     -> AllNodes -- DiscNodes;
        running -> RunningNodes
    end.


%% 节点列表去除自己当前节点
nodes_excl_me(Nodes) -> Nodes -- [node()].
nodes_incl_me(Nodes) -> lists:usort([node() | Nodes]).