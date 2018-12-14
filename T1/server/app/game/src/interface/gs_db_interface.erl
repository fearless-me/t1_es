%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% <dl>
%%% <dt> 1.逻辑城通过此模块与数据库进程交互，所有的消息将根据HashKey 根据一定的规则分配到不同的</dt>
%%% <dt> 2.数据库逻辑进程上，然后数据库逻辑进程，将会调用 db_handler模块的接口</dt>
%%% <dt> 3.本模块的函数能被任意逻辑进程调用</dt>
%%% <dt> 4.*_all_接口将会返回发送消息的数量</dt>
%%% <dt> 5.3个参数/*_all_/2，消息来源进程是self()</dt>
%%% <dt> 6.4个参数/*_all_/3，消息来源将由逻辑进程自己指定</dt>
%%% <dt></dt>
%%% <dt> *** @HashKey@ 用于决定由那个数据库工作进程来操作数据库 ***</dt>
%%% <dt> *** 针对玩家，全部用账号ID *** </dt>
%%% <dt> ***  针对公共数据没如果可以并发，随机算则，如果要串行就固定某一个ID *** </dt>
%%  </dl>
%%% @end
%%% Created : 30. 五月 2018 14:22
%%%-------------------------------------------------------------------
-module(gs_db_interface).
-author("mawenhong").
-include("gs_dbpool.hrl").

%%-------------------------------------------------------------------
-export([
%% 玩家数据库
    action_data_/3, action_data_/4,
%%    action_data_all_/2, action_data_all_/3,
%% 账号库
    action_account_/3, action_account_/4,
%%    action_account_all_/2, action_account_all_/3,
%% 公共库
    action_public_/3, action_public_/4,
%%    action_public_all_/2, action_public_all_/3

%% 日志库
    action_log_/2, action_log_month_/3
]).

%%-------------------------------------------------------------------
%% 玩家数据库
-spec action_data_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
action_data_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?DATA_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

-spec action_data_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
action_data_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?DATA_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%%%-------------------------------------------------------------------
%%-spec action_data_all_(MsgId :: atom(), Msg :: any()) -> integer().
%%action_data_all_(MsgId, Msg) ->
%%    PoolRef = db_proxy:pool_pg(?DATA_DB_POOL_NAME),
%%    Members = pg_local:get_members(PoolRef),
%%    lists:foreach(
%%        fun(Mgr) ->
%%            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
%%        end,Members),
%%    erlang:length(Members).
%%
%%-spec action_data_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().
%%action_data_all_(MsgId, Msg, FromPid) ->
%%    PoolRef = db_proxy:pool_pg(?DATA_DB_POOL_NAME),
%%    Members = pg_local:get_members(PoolRef),
%%    lists:foreach(
%%        fun(Mgr) ->
%%            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, FromPid})
%%        end, Members
%%    ),
%%    erlang:length(Members).


%%-------------------------------------------------------------------
%% 账号库
-spec action_account_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
action_account_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?ACCOUNT_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

-spec action_account_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
action_account_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?ACCOUNT_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%%%-------------------------------------------------------------------
%%-spec action_account_all_(MsgId :: atom(), Msg :: any()) -> integer().
%%action_account_all_(MsgId, Msg) ->
%%    PoolRef = db_proxy:pool_pg(?ACCOUNT_DB_POOL_NAME),
%%    Members = pg_local:get_members(PoolRef),
%%    lists:foreach(
%%        fun(Mgr) ->
%%            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
%%        end, Members
%%    ),
%%    erlang:length(Members).
%%
%%-spec action_account_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().
%%action_account_all_(MsgId, Msg, FromPid) ->
%%    PoolRef = db_proxy:pool_pg(?ACCOUNT_DB_POOL_NAME),
%%    Members = pg_local:get_members(PoolRef),
%%    lists:foreach(
%%        fun(Mgr) ->
%%            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, FromPid})
%%        end, Members
%%    ),
%%    erlang:length(Members).

%%-------------------------------------------------------------------
%% 公共库
-spec action_public_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
action_public_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?PUBLIC_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

-spec action_public_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
action_public_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?PUBLIC_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%%%-------------------------------------------------------------------
%%-spec action_public_all_(MsgId :: atom(), Msg :: any()) -> integer().
%%action_public_all_(MsgId, Msg) ->
%%    PoolRef = db_proxy:pool_pg(?PUBLIC_DB_POOL_NAME),
%%    Members = pg_local:get_members(PoolRef),
%%    lists:foreach(
%%        fun(Mgr) ->
%%            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
%%        end, Members
%%    ),
%%    erlang:length(Members).
%%
%%-spec action_public_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().
%%action_public_all_(MsgId, Msg, FromPid) ->
%%    PoolRef = db_proxy:pool_pg(?PUBLIC_DB_POOL_NAME),
%%    Members = pg_local:get_members(PoolRef),
%%    lists:foreach(
%%        fun(Mgr) ->
%%            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, FromPid})
%%        end, Members
%%    ),
%%    erlang:length(Members).
%%-------------------------------------------------------------------


%%-------------------------------------------------------------------
%% 日志库
-spec action_log_(HashKey :: integer(), Msg :: any()) -> ok.
action_log_(HashKey, Msg) ->
    {Year,Month,_} = erlang:date(),
    Mgr = db_proxy:checkout_pool(?LOG_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {dblog_month, {Year * 100 + Month, Msg}, self()}).

-spec action_log_month_(HashKey :: integer(), Msg :: any(), FromPid :: pid()) -> ok.
action_log_month_(HashKey, Msg, FromPid) ->
    {Year,Month,_} = erlang:date(),
    Mgr = db_proxy:checkout_pool(?LOG_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {dblog_month, {Year * 100 + Month, Msg}, FromPid}).