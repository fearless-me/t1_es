%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%  逻辑城通过此模块与数据库进程交互，所有的消息将根据HashKey 根据一定的规则分配到不同的
%%%  数据库逻辑进程上，然后数据库逻辑进程，将会调用 db_handler模块的接口
%%%  本模块的函数能被任意逻辑进程调用
%%%  *_all_接口将会返回发送消息的数量
%%%  3个参数/*_all_/2，消息来源进程是self()
%%%  4个参数/*_all_/3，消息来源将由逻辑进程自己指定
%%%
%%% @HashKey@ 用于决定由那个数据库工作进程来操作数据库
%%% 针对玩家，全部用账号ID
%%% 针对公共数据没如果可以并发，随机算则，如果要串行就固定某一个ID
%% 
%%% @end
%%% Created : 30. 五月 2018 14:22
%%%-------------------------------------------------------------------
-module(gs_db_interface).
-author("mawenhong").
-include("gs_dbpool_def.hrl").

%%-------------------------------------------------------------------
-export([
%% 玩家数据库
    action_g_/3, action_g_/4, action_g_all_/2, action_g_all_/3,
%% 账号库
    action_a_/3, action_a_/4, action_a_all_/2, action_a_all_/3,
%% 公共库
    action_pub_/3, action_pub_/4, action_pub_all_/2, action_pub_all_/3
]).

-spec action_g_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
-spec action_g_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
-spec action_g_all_(MsgId :: atom(), Msg :: any()) -> integer().
-spec action_g_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().

-spec action_a_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
-spec action_a_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
-spec action_a_all_(MsgId :: atom(), Msg :: any()) -> integer().
-spec action_a_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().

-spec action_pub_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
-spec action_pub_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
-spec action_pub_all_(MsgId :: atom(), Msg :: any()) -> integer().
-spec action_pub_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().

%%-------------------------------------------------------------------
%% 玩家数据库
action_g_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?DATA_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_g_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?DATA_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
action_g_all_(MsgId, Msg) ->
    PoolRef = db_proxy:pool_pg(?DATA_DB_POOL_NAME),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
        end,Members),
    erlang:length(Members).

action_g_all_(MsgId, Msg, FromPid) ->
    PoolRef = db_proxy:pool_pg(?DATA_DB_POOL_NAME),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, FromPid})
        end, Members
    ),
    erlang:length(Members).

%%-------------------------------------------------------------------
%% 账号库
action_a_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?ACCOUNT_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_a_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?ACCOUNT_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
action_a_all_(MsgId, Msg) ->
    PoolRef = db_proxy:pool_pg(?ACCOUNT_DB_POOL_NAME),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
        end, Members
    ),
    erlang:length(Members).

action_a_all_(MsgId, Msg, FromPid) ->
    PoolRef = db_proxy:pool_pg(?ACCOUNT_DB_POOL_NAME),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, FromPid})
        end, Members
    ),
    erlang:length(Members).

%%-------------------------------------------------------------------
%% 公共库
action_pub_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?PUBLIC_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_pub_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?PUBLIC_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
action_pub_all_(MsgId, Msg) ->
    PoolRef = db_proxy:pool_pg(?PUBLIC_DB_POOL_NAME),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
        end, Members
    ),
    erlang:length(Members).

action_pub_all_(MsgId, Msg, FromPid) ->
    PoolRef = db_proxy:pool_pg(?PUBLIC_DB_POOL_NAME),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, FromPid})
        end, Members
    ),
    erlang:length(Members).
%%-------------------------------------------------------------------

