%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:31
%%%-------------------------------------------------------------------
-module(gs_cache_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_cache.hrl").
-include("db_record.hrl").


%% API
-export([
    init/0,
%%    
    online/3, online_cross/2, offline/2,
    get_online_player_pid/1, get_online_player_socket/1, get_online_player_map_pid/1,
%% ETS_CACHE_PLAYER_PUB
    add_player_pub/1,  del_player_pub/1,  get_player_pub/1,  update_player_pub/2,
%% ETS_CACHE_PLAYER_ONLINE
    add_online_player/1,  del_online_player/1,  get_online_player/1,  update_online_player/2,
%% ETS_CACHE_ACCOUNT_PID_SOCK
    add_account_socket/3, del_account_socket/1, get_account_pid/1, get_account_socket/1,
%% ETS_CACHE_PLAYER_CROSS
    add_player_cross/1, del_player_cross/1
]).

%%-------------------------------------------------------------------
init() ->
    misc_ets:new(?ETS_CACHE_PLAYER_PUB,      [named_table, public, {keypos, #m_cache_player_pub.uid},       ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_ONLINE_PLAYER,    [named_table, public, {keypos, #m_cache_online_player.uid},   ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_PLAYER_CROSS,    [named_table, public, {keypos, #m_cache_player_cross.uid},     ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_ACCOUNT_PID_SOCK,[named_table, public, {keypos, #m_cache_account_pid_sock.aid}, ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_ALARM_POLICY,    [named_table, public, {keypos, #m_cache_alarm_policy.id},      ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_ALARM_PLAYER,    [named_table, public, {keypos, #m_cache_alarm_player.uid},     ?ETS_RC, ?ETS_WC]),
    %%
    misc_ets:new(?ETS_CACHE_MAP_PET,         [named_table, public, {keypos, #m_cache_map_object.uid},         ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_MAP_NPC,         [named_table, public, {keypos, #m_cache_map_object.uid},         ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_MAP_PLAYER,      [named_table, public, {keypos, #m_cache_map_object.uid},         ?ETS_RC, ?ETS_WC]),
    misc_ets:new(?ETS_CACHE_MAP_MONSTER,     [named_table, public, {keypos, #m_cache_map_object.uid},         ?ETS_RC, ?ETS_WC]),
    ok.

%%-------------------------------------------------------------------
online(#p_player{} = Player, Pid, Sock) ->
    add_online_player(Player, Pid, Sock),
    ok.

online_cross(
    #m_cache_player_pub{}=PlayerPub,
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
add_player_pub( #p_player{} = PPlayer) ->
    #p_player{
        aid = Aid, uid = Uid, sid = Sid, name = Name,
        level = Lv, sex = Sex, camp = Camp, race = Race, career = Career
    } = PPlayer,
    Player = #m_cache_player_pub{
        uid =Uid, aid= Aid, sid= Sid,
        name= Name, sex = Sex, camp = Camp,
        career= Career, race = Race,
        level= Lv
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
        _ -> undefined
    end.

update_player_pub(Uid, Elements)->
    misc_ets:update_element(?ETS_CACHE_PLAYER_PUB, Uid, Elements),
    cross_interface:update_player_cross(Uid, {?ETS_CACHE_PLAYER_PUB, Uid, Elements}),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_online_player( #p_player{} = PPlayer, Pid, Socket) ->
    #p_player{
        aid = Aid, uid = Uid, level = Lv, head = _Head,
        map_id = Mid, x = X, y = Y, old_map_id = OMid, old_x = Ox, old_y = Oy
    } = PPlayer,
    Player = #m_cache_online_player{
        uid =Uid, aid= Aid, level= Lv, pid = Pid, socket = Socket,
        map_id = Mid, line = 0, pos = vector3:new(X, 0, Y),
        old_map_id = OMid, old_line = 1, old_pos = vector3:new(Ox, 0, Oy)
    },
    misc_ets:write(?ETS_CACHE_ONLINE_PLAYER, Player),
    ok.

add_online_player(#m_cache_online_player{} = Player) ->
    misc_ets:write(?ETS_CACHE_ONLINE_PLAYER, Player),
    ok.

del_online_player(Uid) ->
    ?INFO("del player ~w from ETS_CACHE_PLAYER_ONLINE", [Uid]),
    misc_ets:delete(?ETS_CACHE_ONLINE_PLAYER, Uid).

get_online_player(Uid) ->
    case misc_ets:read(?ETS_CACHE_ONLINE_PLAYER, Uid) of
        [Player] -> Player;
        _ -> undefined
    end.
update_online_player(Uid, Elements)->
    misc_ets:update_element(?ETS_CACHE_ONLINE_PLAYER, Uid, Elements),
    cross_interface:update_player_cross(Uid, {?ETS_CACHE_ONLINE_PLAYER, Uid, Elements}),
    ok.

get_online_player_socket(Uid) ->
   misc_ets:read_element(
        ?ETS_CACHE_ONLINE_PLAYER, Uid, #m_cache_online_player.socket).

get_online_player_pid(Uid) ->
    misc_ets:read_element(
        ?ETS_CACHE_ONLINE_PLAYER, Uid, #m_cache_online_player.pid).

get_online_player_map_pid(Uid) ->
    misc_ets:read_element(
        ?ETS_CACHE_ONLINE_PLAYER, Uid, #m_cache_online_player.map_pid).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_account_socket(Aid, Pid, Socket) ->
    misc_ets:write(?ETS_CACHE_ACCOUNT_PID_SOCK,
        #m_cache_account_pid_sock{aid = Aid, pid = Pid, sock = Socket}).

del_account_socket(Aid) ->
    misc_ets:delete(?ETS_CACHE_ACCOUNT_PID_SOCK,Aid).

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
add_player_cross(Uid)->
    misc_ets:write(?ETS_CACHE_PLAYER_CROSS,
        #m_cache_player_cross{uid = Uid, time = misc_time:milli_seconds()}
    ),
    ok.

del_player_cross(Uid) ->
    misc_ets:delete(?ETS_CACHE_PLAYER_CROSS, Uid),
    ok.


