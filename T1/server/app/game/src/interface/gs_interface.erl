%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 五月 2018 14:38
%%%-------------------------------------------------------------------
-module(gs_interface).
-author("mawenhong").

-include("logger.hrl").
-include("pub_rec.hrl").
-include("common_def.hrl").
-include("gs_cache.hrl").
-include("gs_ps_def.hrl").



-export([
    %% 注册玩家进程
    ppid_name/1,
    register_pid/2,
    %% 踢人
    kick_account/2,
    %% 封号
    forbid_account/1,
    %% 在线人数
    total_online/0
]).
-export([
    %% 给某个进程或者某个玩家发消息
    send_msg/2,
    send_msg/3,
    %% ** 给某个角色发网络消息，比如 给好友发或者公共进程给角色发
    %% ** 给自己发 用 lib_player_pub:send_**/1
    send_net_msg/2,
    %% 广播消息
    broadcast_msg/2,
    %% 广播网络消息 fixme:优化直接打包
    broadcast_net_msg/1,
    %% 平台账号登录时做些处理
    merge_plat_acc_name/2,
    plat_account_crc/2,
    %% 根据地图来检查坐标的有效性
    fix_pos/2
]).

-export([
    is_cross/0, get_server_port/0, get_max_connection/0,
    get_area/0,get_sid/0, get_server_name/0, get_server_type/0,  get_run_no/0, get_center_node/0
]).


%%-------------------------------------------------------------------
is_cross() -> gs_econfig:get_server_type() =:= ?SERVER_TYPE_CROSS.
get_server_port() -> gs_econfig:get_server_port().
get_server_name() -> gs_econfig:get_server_name().
get_server_type() -> gs_econfig:get_server_type().
get_max_connection() -> gs_econfig:get_max_connection().
get_area() -> gs_econfig:get_area().
get_sid() -> gs_econfig:get_sid().
get_run_no()-> gs_econfig:get_run_no().
get_center_node() -> gs_econfig:get_center_node().

%%-------------------------------------------------------------------
total_online() -> misc_ets:size(?ETS_CACHE_ACCOUNT_PID_SOCK).

%%-------------------------------------------------------------------
ppid_name(Aid) ->
    misc:create_atom(player, [Aid]).

register_pid(Pid, Aid) ->
    PsName = ppid_name(Aid),
    try  erlang:register(PsName, Pid) of
        true -> success
    catch _:_:_ -> repeat_login end.

%%-------------------------------------------------------------------
kick_account(Aid, Reason) ->
    Name = misc:create_atom(player, [Aid]),
    ps:send(Name, kick_role, Reason),
    ok.

%%-------------------------------------------------------------------
send_msg(Pid, MsgId) when is_pid(Pid) ->
    ps:send(Pid, MsgId);
send_msg(Uid, MsgId) when is_number(Uid) ->
    Pid = gs_cache_interface:get_online_player_pid(Uid),
    ps:send(Pid, MsgId).

%%-------------------------------------------------------------------
send_msg(Pid, MsgId, Msg) when is_pid(Pid) ->
    ps:send(Pid, MsgId, Msg);
send_msg(Uid, MsgId, Msg) when is_number(Uid) ->
    Pid = gs_cache_interface:get_online_player_pid(Uid),
    ps:send(Pid, MsgId, Msg).

%%-------------------------------------------------------------------
send_net_msg(Pid, NetMsg) when is_pid(Pid) ->
    ps:send(Pid, net_msg, NetMsg);
send_net_msg(Uid, NetMsg) when is_number(Uid) ->
    Pid = gs_cache_interface:get_online_player_pid(Uid),
    ps:send(Pid, net_msg, NetMsg).

%%-------------------------------------------------------------------
broadcast_net_msg(NetMsg) ->
    ps:send(?GS_BROADCAST_OTP, broadcast_net, NetMsg).

%%-------------------------------------------------------------------
broadcast_msg(MsgId, Msg) ->
    ps:send(?GS_BROADCAST_OTP, broadcast, {MsgId, Msg}).

%%-------------------------------------------------------------------
merge_plat_acc_name(PlatName, PlatAcc) ->
    misc:list_to_string_suffix([PlatName, PlatAcc], "_").

plat_account_crc(PlatName, PlatAcc) ->
    PN = misc:crc32(PlatName),
    AN = misc:crc32(PlatAcc),
    (PN bsl 32) bor AN .


%%-------------------------------------------------------------------
forbid_account(Aid) ->
    gs_interface:kick_account(Aid, forbid_account).

%%-------------------------------------------------------------------
fix_pos(_MapId, _Pos) ->
    ok.

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