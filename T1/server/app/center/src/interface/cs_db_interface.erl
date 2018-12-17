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
-module(cs_db_interface).
-author("mawenhong").

-include("cs_dbpool_def.hrl").

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
    action_log_/2, action_log_month_/3, action_log_check_/2
]).

-spec action_data_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
-spec action_data_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
%%-spec action_data_all_(MsgId :: atom(), Msg :: any()) -> integer().
%%-spec action_data_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().

-spec action_account_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
-spec action_account_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
%%-spec action_account_all_(MsgId :: atom(), Msg :: any()) -> integer().
%%-spec action_account_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().

-spec action_public_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
-spec action_public_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
%%-spec action_public_all_(MsgId :: atom(), Msg :: any()) -> integer().
%%-spec action_public_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().

%%-------------------------------------------------------------------
%% 玩家数据库
action_data_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?DATA_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_data_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?DATA_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
%%action_data_all_(MsgId, Msg) ->
%%    PoolRef = db_proxy:pool_pg(?DATA_DB_POOL_NAME),
%%    Members = pg_local:get_members(PoolRef),
%%    lists:foreach(
%%        fun(Mgr) ->
%%            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
%%        end,Members),
%%    erlang:length(Members).
%%
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
action_account_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?ACCOUNT_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_account_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?ACCOUNT_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
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
action_public_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_pool(?PUBLIC_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_public_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pool(?PUBLIC_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
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
    YearMonth = gs_db_checker:year_month(),
    Mgr = db_proxy:checkout_pool(?LOG_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {dblog_month, {YearMonth, Msg}, self()}).

-spec action_log_month_(HashKey :: integer(), Msg :: any(), FromPid :: pid()) -> ok.
action_log_month_(HashKey, Msg, FromPid) ->
    YearMonth = gs_db_checker:year_month(),
    Mgr = db_proxy:checkout_pool(?LOG_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {dblog_month, {YearMonth, Msg}, FromPid}).


-spec action_log_check_(HashKey :: integer(), Table :: any()) -> ok.
action_log_check_(HashKey, Table) ->
    YearMonthList = misc_time:last_two_month(),
    Mgr = db_proxy:checkout_pool(?LOG_DB_POOL_NAME),
    db_mgr:scheduler_(Mgr, HashKey, {dblog_month_check, {misc:to_atom(Table), YearMonthList}, self()}).