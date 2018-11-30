%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% 导出的这些接口是基础设施要用的
%%% 因为牵涉到跨服，所以要统一提供出来好同步数据(游戏服与跨服同步)
%%%
%%% 其他的数据如果没有跨服的需要、或者不需要让跨服玩家看到的数据没有必要单独写接口
%%% 统一使用misc_ets提供的接口
%%% 
%%% 另外请参考下面两个数据的定义中说明
%%% 玩家部分数据的一个快照,提供给**本服务器*所有模块**访问
%%% @reference #m_cache_player_pub{}
%%% 在线玩家的实时数据（这部分数据是在线提供给**本服务器*所有模块**访问用的）
%%% @reference #m_cache_online_player{}
%%%
%%% @end
%%% Created : 30. 五月 2018 19:31
%%%-------------------------------------------------------------------
-module(gs_cache_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("gs_cache.hrl").
-include("db_record.hrl").


%% API
-export([
    init/0,
    online/3, online_cross/2, offline/2
]).
-export([
    get_online_player_pid/1, get_online_player_socket/1, get_online_player_map_pid/1, is_player_online/1,
%% ETS_CACHE_PLAYER_PUB
    add_player_pub/1, del_player_pub/1, get_player_pub/1, update_player_pub/2, read_player_pub_element/2,
%% ETS_CACHE_PLAYER_ONLINE
    add_online_player/1, del_online_player/1, get_online_player/1, update_online_player/2, read_online_player_element/2,
%% ETS_CACHE_ACCOUNT_PID_SOCK
    add_account_socket/3, del_account_socket/1, get_account_pid/1, get_account_socket/1,
%% ETS_CACHE_PLAYER_CROSS
    add_player_cross/1, del_player_cross/1
]).


%%-------------------------------------------------------------------
init() ->
    misc_ets:new(?ETS_CACHE_PLAYER_PUB, [named_table, public, {keypos, #m_cache_player_pub.uid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_ONLINE_PLAYER, [named_table, public, {keypos, #m_cache_online_player.uid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_PLAYER_CROSS, [named_table, public, {keypos, #m_cache_player_cross.uid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_ACCOUNT_PID_SOCK, [named_table, public, {keypos, #m_cache_account_pid_sock.aid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_ALARM_POLICY, [named_table, public, {keypos, #m_cache_alarm_policy.id}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_ALARM_PLAYER, [named_table, public, {keypos, #m_cache_alarm_player.uid}, ?ETS_RC, ?ETS_WC]),
    %%
    misc_ets:new(?ETS_CACHE_MAP_PET_PRIV, [named_table, public, {keypos, #m_cache_map_object_priv.uid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_MAP_NPC_PRIV, [named_table, public, {keypos, #m_cache_map_object_priv.uid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_MAP_PLAYER_PRIV, [named_table, public, {keypos, #m_cache_map_object_priv.uid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_MAP_MONSTER_PRIV, [named_table, public, {keypos, #m_cache_map_object_priv.uid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_RATE_CONTROL_PRIV, [named_table, public, {keypos, #m_cache_rate_control.role_key}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_RATE_CONTROL_KEY_PRIV, [named_table, public, {keypos, #pub_kv.key}, ?ETS_RC, ?ETS_WC]),
    ok.

%%-------------------------------------------------------------------
online(#p_player{uid = Uid} = Player, Pid, Sock) ->
    add_online_player(Player, Pid, Sock),
    case misc_ets:member(?ETS_CACHE_PLAYER_PUB, Uid) of
        true -> skip;
        _Any -> add_player_pub(Player)
    end,
    ok.

online_cross(
    #m_cache_player_pub{} = PlayerPub,
    #m_cache_online_player{aid = Aid, pid = Pid, socket = Sock} = OnlinePlayer
) ->
    gs_cache_interface:add_account_socket(Aid, Pid, Sock),
    gs_cache_interface:add_player_pub(PlayerPub),
    gs_cache_interface:add_online_player(OnlinePlayer),
    ok.

%%-------------------------------------------------------------------
offline(Aid, Uid) ->
    ?INFO("player ~w of account ~p offline", [Uid, Aid]),
    gs_cache_interface:del_online_player(Uid),
    gs_cache_interface:del_account_socket(Aid),
    ok.



%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_player_pub(#p_player{} = PPlayer) ->
    #p_player{
        aid = Aid, uid = Uid, sid = Sid, name = Name, head = Head,
        level = Lv, sex = Sex, camp = Camp, race = Race, career = Career
    } = PPlayer,
    Player = #m_cache_player_pub{
        uid = Uid, aid = Aid, sid = Sid,
        name = Name, sex = Sex, camp = Camp,
        career = Career, race = Race, head = Head,
        level = Lv
    },
    misc_ets:write(?ETS_CACHE_PLAYER_PUB, Player),
    ok;
add_player_pub(#m_cache_player_pub{} = Player) ->
    misc_ets:write(?ETS_CACHE_PLAYER_PUB, Player),
    ok.


del_player_pub(Uid) ->
    ?INFO("del player ~w from ETS_PLAYER_PUB", [Uid]),
    misc_ets:delete(?ETS_CACHE_PLAYER_PUB, Uid).

get_player_pub(Uid) ->
    case misc_ets:read(?ETS_CACHE_PLAYER_PUB, Uid) of
        [Player] -> Player;
        _ ->
            ?ERROR("where is player ETS_PLAYER_PUB data ~p",[Uid]),
            undefined
    end.

update_player_pub(Uid, Elements) ->
    misc_ets:update_element(?ETS_CACHE_PLAYER_PUB, Uid, Elements),
    cross_interface:update_player_cross(Uid, {?ETS_CACHE_PLAYER_PUB, Uid, Elements}),
    ok.

read_player_pub_element(Uid, Pos) ->
    misc_ets:read_element(?ETS_CACHE_PLAYER_PUB, Uid, Pos).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_online_player(#p_player{} = PPlayer, Pid, Socket) ->
    Sid = gs_interface:get_sid(),
    #p_player{
        aid = Aid, uid = Uid, level = Lv, head = Head, name = Name,
        sex = Sex, career = Career, race = Race, camp = Camp,
        map_id = Mid, x = X, y = Y, old_map_id = OMid, old_x = Ox, old_y = Oy
    } = PPlayer,
    Player = #m_cache_online_player{
        uid = Uid, aid = Aid, level = Lv, pid = Pid, socket = Socket,  sid = Sid,
        name = Name, sex = Sex, career = Career, race = Race, camp = Camp, head = Head,
        map_id = Mid, line = 0, pos = vector3:new(X, 0, Y),
        old_map_id = OMid, old_line = 1, old_pos = vector3:new(Ox, 0, Oy)
    },
    gs_cache_interface:add_online_player(Player),
    ok.

add_online_player(#m_cache_online_player{uid = Uid} = Player) ->
    misc_ets:write(?ETS_CACHE_ONLINE_PLAYER, Player),
    cross_interface:add_rate_control(Uid),
    ?INFO("add ETS_CACHE_ONLINE_PLAYER ~p",[Uid]),
    ok.

del_online_player(Uid) ->
    ?INFO("del player ~w from ETS_CACHE_PLAYER_ONLINE", [Uid]),
    misc_ets:delete(?ETS_CACHE_ONLINE_PLAYER, Uid),
    cross_interface:del_rate_control(Uid).

get_online_player(Uid) ->
    case misc_ets:read(?ETS_CACHE_ONLINE_PLAYER, Uid) of
        [Player] -> Player;
        _ -> undefined
    end.

update_online_player(Uid, Elements) ->
    misc_ets:update_element(?ETS_CACHE_ONLINE_PLAYER, Uid, Elements),
    cross_interface:update_player_cross(Uid, {?ETS_CACHE_ONLINE_PLAYER, Uid, Elements}),
    ok.


read_online_player_element(Uid, Pos) ->
    misc_ets:read_element(?ETS_CACHE_ONLINE_PLAYER, Uid, Pos).

get_online_player_socket(Uid) ->
    misc_ets:read_element(
        ?ETS_CACHE_ONLINE_PLAYER, Uid, #m_cache_online_player.socket).

get_online_player_pid(Uid) ->
    ?TRY_CATCH_RET_ONLY(misc_ets:read_element(
        ?ETS_CACHE_ONLINE_PLAYER, Uid, #m_cache_online_player.pid), undefined).

get_online_player_map_pid(Uid) ->
    misc_ets:read_element(
        ?ETS_CACHE_ONLINE_PLAYER, Uid, #m_cache_online_player.map_pid).

is_player_online(Uid) ->
    misc_ets:member(?ETS_CACHE_ONLINE_PLAYER, Uid).


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_account_socket(Aid, Pid, Socket) ->
    misc_ets:write(?ETS_CACHE_ACCOUNT_PID_SOCK,
        #m_cache_account_pid_sock{aid = Aid, pid = Pid, sock = Socket}).

del_account_socket(Aid) ->
    ?INFO("del account ~w from ETS_CACHE_ACCOUNT_PID_SOCK", [Aid]),
    misc_ets:delete(?ETS_CACHE_ACCOUNT_PID_SOCK, Aid).

get_account_socket(Aid) ->
    case misc_ets:read(?ETS_CACHE_ACCOUNT_PID_SOCK, Aid) of
        [#m_cache_account_pid_sock{sock = Sock}] -> Sock;
        _ -> undefined
    end.

get_account_pid(Aid) ->
    case misc_ets:read(?ETS_CACHE_ACCOUNT_PID_SOCK, Aid) of
        [#m_cache_account_pid_sock{pid = Pid}] -> Pid;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_player_cross(Uid) ->
    misc_ets:write(?ETS_CACHE_PLAYER_CROSS,
        #m_cache_player_cross{uid = Uid, time = misc_time:milli_seconds()}
    ),
    ok.

del_player_cross(Uid) ->
    misc_ets:delete(?ETS_CACHE_PLAYER_CROSS, Uid),
    ok.



