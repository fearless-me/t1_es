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
-include("gs_def.hrl").
-include("gs_mem_rec.hrl").
-include("gs_db_rec.hrl").

%% API
-export([
    init/0,
%%    
    online/3, offline/2,
%% ETS_PLAYER_PUB
    add_player_pub/1, del_player_pub/1, get_player_pub/1, update_player_pub/2,
%% ETS_PLAYER_PRIV
    add_player_priv/2, del_player_priv/1, update_player_priv/2,
%% ETS_PLAYER_PSOCK
    add_socket/4, get_ppid/1, get_socket/1, del_socket/1,
%% ETS_ACCOUNT_PSOCK
    get_account_pid/1,add_account_socket/3, get_account_socket/1, del_account_socket/1
]).

%%-------------------------------------------------------------------
init() ->
    ets:new(?ETS_PLAYER_PUB,   [named_table, public, {keypos, #m_player_pub.uid},       ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_PLAYER_CROSS,   [named_table, public, {keypos, #m_player_pub.uid},       ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_PLAYER_PRIV,   [named_table, public, {keypos, #m_player_private.uid},  ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_PLAYER_PSOCK, [named_table, public, {keypos, #m_player_pid_sock.uid},  ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_ACCOUNT_PSOCK,[named_table, public, {keypos, #m_account_pid_sock.aid}, ?ETS_RC, ?ETS_WC]),
    ok.

%%-------------------------------------------------------------------
online(#p_player{aid = Aid, uid = Uid} = Player, Pid, Sock) ->
    gs_cache_interface:add_player_pub(Player),
    gs_cache_interface:add_player_priv(Aid, Uid),
    gs_cache_interface:add_socket(Aid, Uid, Pid, Sock),
    ok;
online(#m_player_pub{aid = Aid, uid = Uid} = Player, Pid, Sock) ->
    gs_cache_interface:add_player_pub(Player),
    gs_cache_interface:add_player_priv(Aid, Uid),
    gs_cache_interface:add_socket(Aid, Uid, Pid, Sock),
    ok.

%%-------------------------------------------------------------------
offline(Aid, Uid) ->
    ?INFO("player ~w of account ~p offline", [Uid, Aid]),
    gs_cache_interface:del_socket(Uid),
    gs_cache_interface:del_account_socket(Aid),
    gs_cache_interface:del_player_priv(Uid),
    ok.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_player_pub( #p_player{} = PPlayer) ->
    #p_player{
        aid = Aid, uid = Uid, sid = Sid, name = Name,
        level = Lv, sex = Sex, camp = Camp, race = Race, career = Career, head = _Head,
        map_id = Mid, x = X, y = Y, old_map_id = OMid, old_x = Ox, old_y = Oy
    } = PPlayer,
    Player = #m_player_pub{
        uid =Uid, aid= Aid, sid= Sid,
        name= Name, sex = Sex, camp = Camp,
        career= Career, race = Race,
        level= Lv,
        mid= Mid, line = 0, pos = vector3:new(X, 0, Y),
        old_mid= OMid, old_line = 1, old_pos = vector3:new(Ox, 0, Oy)
    },
    add_player_pub(Player),
    ok;
add_player_pub(#m_player_pub{} = Player) ->
    ets:insert(?ETS_PLAYER_PUB, Player),
%%    ?INFO("add player ~w to ETS_PLAYER_PUB", [Uid]),
    ok.

%%-------------------------------------------------------------------
del_player_pub(Uid) ->
    ?INFO("del player ~w from ETS_PLAYER_PUB", [Uid]),
    ets:delete(?ETS_PLAYER_PUB, Uid).

%%-------------------------------------------------------------------
get_player_pub(Uid) ->
    case ets:lookup(?ETS_PLAYER_PUB, Uid) of
        [Player] -> Player;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
update_player_pub(Uid, Elements)->
    ets:update_element(?ETS_PLAYER_PUB, Uid, Elements),

    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_player_priv(Aid, Uid) ->
    ets:insert(?ETS_PLAYER_PRIV,
        #m_player_private{aid = Aid, uid = Uid}).

%%-------------------------------------------------------------------
del_player_priv(Uid)->
    ets:delete(?ETS_PLAYER_PRIV, Uid).

%%-------------------------------------------------------------------
update_player_priv(Uid, Elements)->
    ets:update_element(?ETS_PLAYER_PRIV, Uid, Elements),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_socket(Aid, Uid, Pid, Socket) ->
    ets:insert(?ETS_PLAYER_PSOCK,
        #m_player_pid_sock{aid = Aid, uid = Uid, pid = Pid, sock = Socket}).

%%-------------------------------------------------------------------
del_socket(Uid) ->
    ets:delete(?ETS_PLAYER_PSOCK,Uid).

%%-------------------------------------------------------------------
get_socket(Uid) ->
    case ets:lookup(?ETS_PLAYER_PSOCK, Uid) of
        [#m_player_pid_sock{sock = Sock}] -> Sock;
        _ -> undefined
    end.

get_ppid(Uid) ->
    case ets:lookup(?ETS_PLAYER_PSOCK, Uid) of
        [#m_player_pid_sock{pid = Pid}] -> Pid;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_account_socket(Aid, Pid, Socket) ->
    ets:insert(?ETS_ACCOUNT_PSOCK,
        #m_account_pid_sock{aid = Aid, pid = Pid, sock = Socket}).

del_account_socket(Aid) ->
    ets:delete(?ETS_ACCOUNT_PSOCK,Aid).

get_account_socket(Aid) ->
    case ets:lookup(?ETS_ACCOUNT_PSOCK, Aid) of
        [#m_account_pid_sock{sock = Sock}] -> Sock;
        _ -> undefined
    end.

get_account_pid(Aid) ->
    case ets:lookup(?ETS_ACCOUNT_PSOCK, Aid) of
        [#m_account_pid_sock{pid = Pid}] -> Pid;
        _ -> undefined
    end.


