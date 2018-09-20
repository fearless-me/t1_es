%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 八月 2018 15:15
%%%-------------------------------------------------------------------
-module(db_proxy).
-author("mawenhong").

%% API
-export([add_pool/2, add_pool/3]).
-export([checkout_pool/1, pool_pg/1]).

-spec add_pool(PoolRef :: atom(), Conf :: map()) -> ok.
-spec add_pool(PoolRef :: atom(), Conf:: map(), Timeout :: integer()) -> ok.
-callback handler(MsgId :: atom(), Msg :: term(), FromPid :: pid(), PoolId :: atom()) -> ok.


%% conf => maps
%% #{host, port, user, password, database, conn, max_conn, worker, func}
%% host => 主机IP,
%% port => 主机端口,
%% user => 用户名,
%% password => 用户密码,
%% database =>  数据库名,
%% conn => 初始化mysql连接数,
%% max_conn => 最大mysql连接数,
%% worker => 工作者进程,
%% func =>  mysql逻辑处理函数  @-callback handler

add_pool(PoolRef, Conf) ->
    db_proxy_srv:add_pool(PoolRef, Conf).

add_pool(PoolRef, Conf, Timeout) ->
    db_proxy_srv:add_pool(PoolRef, Conf, Timeout).

checkout_pool(PoolRef) -> db_proxy_srv:checkout_pool(PoolRef).
pool_pg(PoolRef) -> db_proxy_srv:pool_pg(PoolRef).


