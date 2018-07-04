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
%%% @end
%%% Created : 30. 五月 2018 14:22
%%%-------------------------------------------------------------------
-module(lib_db).
-author("mawenhong").

%%-------------------------------------------------------------------
-export([
%% 玩家数据库
    action_p_/3, action_p_/4, action_p_all_/2, action_p_all_/3,
%% 账号库
    action_a_/3, action_a_/4, action_a_all_/2, action_a_all_/3,
%% 公共库
    action_pub_/3, action_pub_/4, action_pub_all_/2, action_pub_all_/3
]).

-spec action_p_(HashKey :: integer(), MsgId :: atom(), Msg :: any()) -> ok.
-spec action_p_(HashKey :: integer(), MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> ok.
-spec action_p_all_(MsgId :: atom(), Msg :: any()) -> integer().
-spec action_p_all_(MsgId :: atom(), Msg :: any(), FromPid :: pid()) -> integer().

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
action_p_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_ppool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_p_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_ppool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
action_p_all_(MsgId, Msg) ->
    PoolRef = db_proxy:ppool_pg(),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
        end,Members),
    erlang:length(Members).

action_p_all_(MsgId, Msg, FromPid) ->
    PoolRef = db_proxy:ppool_pg(),
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
    Mgr = db_proxy:checkout_apool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_a_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_apool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
action_a_all_(MsgId, Msg) ->
    PoolRef = db_proxy:apool_pg(),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
        end, Members
    ),
    erlang:length(Members).

action_a_all_(MsgId, Msg, FromPid) ->
    PoolRef = db_proxy:apool_pg(),
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
    Mgr = db_proxy:checkout_pubpool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_pub_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_pubpool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%%-------------------------------------------------------------------
action_pub_all_(MsgId, Msg) ->
    PoolRef = db_proxy:pubpool_pg(),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, self()})
        end, Members
    ),
    erlang:length(Members).

action_pub_all_(MsgId, Msg, FromPid) ->
    PoolRef = db_proxy:pubpool_pg(),
    Members = pg_local:get_members(PoolRef),
    lists:foreach(
        fun(Mgr) ->
            db_mgr:scheduler_(Mgr, 0, {MsgId, Msg, FromPid})
        end, Members
    ),
    erlang:length(Members).
%%-------------------------------------------------------------------

