%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%  逻辑城通过此模块与数据库进程交互，所有的消息将根据HashKey 根据一定的规则分配到不同的
%%%  数据库逻辑进程上，然后数据库逻辑进程，将会调用 db_handler模块的接口
%%%  本模块的函数能被任意逻辑进程调用
%%%  
%%%  3个参数，消息来源进程是self()
%%%  4个参数，消息来源将由逻辑进程自己指定
%%%
%%% @end
%%% Created : 30. 五月 2018 14:22
%%%-------------------------------------------------------------------
-module(lib_db).
-author("mawenhong").

-export([action_p_/3]).
-export([action_p_/4]).
-export([action_a_/3]).
-export([action_a_/4]).

%% 玩家数据库
action_p_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_ppool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_p_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_ppool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

%% 账号库
action_a_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_apool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_a_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_apool_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

