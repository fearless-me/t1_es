%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:31
%%%-------------------------------------------------------------------
-module(gs_cache).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_cache.hrl").
-include("db_record.hrl").
-include("map_cache.hrl").

%% API
-export([
    init/0,
%%    
    online/3, offline/2,
%% ETS_CACHE_PLAYER_PUB
    add_player_pub/1,  del_player_pub/1,  get_player_pub/1,  update_player_pub/2,
%% ETS_CACHE_UNIT_COMBAT
    add_unit_combat/2, del_unit_combat/1, get_unit_combat/1, update_unit_combat/2,
%% ETS_CACHE_PLAYER_PID_SOCK
    add_socket/4,  del_socket/1, get_ppid/1, get_socket/1,
%% ETS_CACHE_ACCOUNT_PID_SOCK
    add_account_socket/3, del_account_socket/1, get_account_pid/1, get_account_socket/1,
%% ETS_CACHE_PLAYER_CROSS
    add_player_cross/1, del_player_cross/1
]).

%%-------------------------------------------------------------------
init() ->
    ets:new(?ETS_CACHE_PLAYER_PUB,      [named_table, public, {keypos, #m_cache_player_pub.uid},       ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_PLAYER_CROSS,    [named_table, public, {keypos, #m_cache_player_cross.uid},     ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_PLAYER_PID_SOCK, [named_table, public, {keypos, #m_cache_player_pid_sock.uid},  ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_ACCOUNT_PID_SOCK,[named_table, public, {keypos, #m_cache_account_pid_sock.aid}, ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_ALARM_POLICY,    [named_table, public, {keypos, #m_cache_alarm_policy.id},      ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_ALARM_PLAYER,    [named_table, public, {keypos, #m_cache_alarm_player.uid},     ?ETS_RC, ?ETS_WC]),
    %%
    ets:new(?ETS_CACHE_MAP_PET,         [named_table, public, {keypos, #m_cache_map_unit.uid},         ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_MAP_NPC,         [named_table, public, {keypos, #m_cache_map_unit.uid},         ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_MAP_PLAYER,      [named_table, public, {keypos, #m_cache_map_unit.uid},         ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_MAP_MONSTER,     [named_table, public, {keypos, #m_cache_map_unit.uid},         ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_CACHE_UNIT_COMBAT,     [named_table, public, {keypos, #m_cache_unit_combat.uid},      ?ETS_RC, ?ETS_WC]),
    ok.

%%-------------------------------------------------------------------
online(#p_player{aid = Aid, uid = Uid} = Player, Pid, Sock) ->
    gs_cache:add_player_pub(Player),
    gs_cache:add_unit_combat(Aid, Uid),
    gs_cache:add_socket(Aid, Uid, Pid, Sock),
    ok;
online(#m_cache_player_pub{aid = Aid, uid = Uid} = Player, Pid, Sock) ->
    gs_cache:add_account_socket(Aid, Pid, Sock),
    gs_cache:add_player_pub(Player),
    gs_cache:add_unit_combat(Aid, Uid),
    gs_cache:add_socket(Aid, Uid, Pid, Sock),
    ok.

%%-------------------------------------------------------------------
offline(Aid, Uid) ->
    ?INFO("player ~w of account ~p offline", [Uid, Aid]),
    gs_cache:del_socket(Uid),
    gs_cache:del_account_socket(Aid),
    gs_cache:del_unit_combat(Uid),
    ets:delete(?ETS_CACHE_MAP_PLAYER, Uid),
    ok.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_player_pub( #p_player{} = PPlayer) ->
    #p_player{
        aid = Aid, uid = Uid, sid = Sid, name = Name,
        level = Lv, sex = Sex, camp = Camp, race = Race, career = Career, head = _Head,
        map_id = Mid, x = X, y = Y, old_map_id = OMid, old_x = Ox, old_y = Oy
    } = PPlayer,
    Player = #m_cache_player_pub{
        uid =Uid, aid= Aid, sid= Sid,
        name= Name, sex = Sex, camp = Camp,
        career= Career, race = Race,
        level= Lv,
        mid= Mid, line = 0, pos = vector3:new(X, 0, Y),
        old_mid= OMid, old_line = 1, old_pos = vector3:new(Ox, 0, Oy)
    },
    add_player_pub(Player),
    ok;
add_player_pub(#m_cache_player_pub{} = Player) ->
    ets:insert(?ETS_CACHE_PLAYER_PUB, Player),
%%    ?INFO("add player ~w to ETS_PLAYER_PUB", [Uid]),
    ok.

%%-------------------------------------------------------------------
del_player_pub(Uid) ->
    ?INFO("del player ~w from ETS_PLAYER_PUB", [Uid]),
    ets:delete(?ETS_CACHE_PLAYER_PUB, Uid).

%%-------------------------------------------------------------------
get_player_pub(Uid) ->
    case ets:lookup(?ETS_CACHE_PLAYER_PUB, Uid) of
        [Player] -> Player;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
update_player_pub(Uid, Elements)->
    ets:update_element(?ETS_CACHE_PLAYER_PUB, Uid, Elements),

    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_unit_combat(Aid, Uid) ->
    ets:insert(?ETS_CACHE_UNIT_COMBAT,
        #m_cache_unit_combat{aid = Aid, uid = Uid}).

%%-------------------------------------------------------------------
get_unit_combat(Uid) ->
    case ets:lookup(?ETS_CACHE_UNIT_COMBAT, Uid) of
        [Player] -> Player;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
del_unit_combat(Uid)->
    ets:delete(?ETS_CACHE_UNIT_COMBAT, Uid).

%%-------------------------------------------------------------------
update_unit_combat(Uid, Elements)->
    ets:update_element(?ETS_CACHE_UNIT_COMBAT, Uid, Elements),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_socket(Aid, Uid, Pid, Socket) ->
    ets:insert(?ETS_CACHE_PLAYER_PID_SOCK,
        #m_cache_player_pid_sock{aid = Aid, uid = Uid, pid = Pid, sock = Socket}).

%%-------------------------------------------------------------------
del_socket(Uid) ->
    ets:delete(?ETS_CACHE_PLAYER_PID_SOCK,Uid).

%%-------------------------------------------------------------------
get_socket(Uid) ->
    case ets:lookup(?ETS_CACHE_PLAYER_PID_SOCK, Uid) of
        [#m_cache_player_pid_sock{sock = Sock}] -> Sock;
        _ -> undefined
    end.

get_ppid(Uid) ->
    case ets:lookup(?ETS_CACHE_PLAYER_PID_SOCK, Uid) of
        [#m_cache_player_pid_sock{pid = Pid}] -> Pid;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_account_socket(Aid, Pid, Socket) ->
    ets:insert(?ETS_CACHE_ACCOUNT_PID_SOCK,
        #m_cache_account_pid_sock{aid = Aid, pid = Pid, sock = Socket}).

del_account_socket(Aid) ->
    ets:delete(?ETS_CACHE_ACCOUNT_PID_SOCK,Aid).

get_account_socket(Aid) ->
    case ets:lookup(?ETS_CACHE_ACCOUNT_PID_SOCK, Aid) of
        [#m_cache_account_pid_sock{sock = Sock}] -> Sock;
        _ -> undefined
    end.

get_account_pid(Aid) ->
    case ets:lookup(?ETS_CACHE_ACCOUNT_PID_SOCK, Aid) of
        [#m_cache_account_pid_sock{pid = Pid}] -> Pid;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_player_cross(Uid)->
    ets:insert(?ETS_CACHE_PLAYER_CROSS,
        #m_cache_player_cross{uid = Uid, time = misc_time:milli_seconds()}
    ),
    ok.

del_player_cross(Uid) ->
    ets_cache:delete(?ETS_CACHE_PLAYER_CROSS, Uid),
    ok.


