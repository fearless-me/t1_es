%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 五月 2018 14:38
%%%-------------------------------------------------------------------
-module(gcore).
-author("mawenhong").
-include("gdef.hrl").
-include("logger.hrl").
-include("pub_common.hrl").

%% 注册玩家进程
-export([register_ppid/2]).
%% 踢人
-export([kick_account/2]).
%% 封号
-export([forbid_account/1]).
%% ** 给某个角色发网络消息，比如 给好友发或者公共进程给角色发
%% ** 给自己发 用 mod_player:send/1
-export([send_net_msg/2]).
%% 广播消息
-export([broadcast_msg/2]).
%% 广播网络消息
-export([broadcast_net_msg/1]).
%%
-export([merge_plat_acc_name/2]).

-export([fix_pos/2]).

%%
-export([halt/1, halt/2]).


-export([nnl/0]).

%%-------------------------------------------------------------------
register_ppid(Pid, Aid) ->
    try  misc:register_process(Pid, player, [Aid] ) of
        true -> sucess
    catch _:_:_  -> repeat_login end.
%%-------------------------------------------------------------------
kick_account(Aid, Reason) ->
    Name = misc:create_atom(player, [Aid]),
    ps:send(Name, kick, Reason),
    ok.
%%-------------------------------------------------------------------
send_net_msg(Pid, NetMsg) when is_pid(Pid) ->
    ps:send(Pid, net_msg, NetMsg);
send_net_msg(Uid, NetMsg) when is_number(Uid) ->
    Pid = lib_cache:get_ppid(Uid),
    ps:send(Pid, net_msg, NetMsg).
%%-------------------------------------------------------------------
broadcast_net_msg(NetMsg) ->
    ps:send(serv_broadcast, broadcast_net, NetMsg).
%%-------------------------------------------------------------------
broadcast_msg(MsgId, Msg) ->
    ps:send(serv_broadcast, broadcast, {MsgId, Msg}).

%%-------------------------------------------------------------------
merge_plat_acc_name(PlatName, PlatAcc) ->
    misc:list_to_string_suffix([PlatName, PlatAcc], "_").

%%-------------------------------------------------------------------
forbid_account(Aid) ->
    gcore:kick_account(Aid, forbid_account).

%%-------------------------------------------------------------------
-define(CRASH_WAIT_SECONDS, 15).
halt(Fmt, Args) -> gcore:halt(io_lib:format(Fmt, Args)).
halt(Msg) ->
    ?FATAL("~ts, after ~p second(s) app crash,~n",
        [Msg, ?CRASH_WAIT_SECONDS]),
    timer:sleep(?CRASH_WAIT_SECONDS * 1000),
    erlang:halt().

%%
fix_pos(MapId, Pos) ->
    ok.

nnl()->
    S = lists:duplicate(15, "\n"),
    ?DEBUG("~ts",[lists:flatten(S)]).


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