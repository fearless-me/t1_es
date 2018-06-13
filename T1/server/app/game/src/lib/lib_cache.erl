%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:31
%%%-------------------------------------------------------------------
-module(lib_cache).
-author("mawenhong").
-include("logger.hrl").
-include("pub_common.hrl").
-include("mem_record.hrl").
-include("gdef.hrl").
-include("db_record.hrl").

%% API
-export([
    offline/2,
%% ETS_PLAYER_PUB
    add_player_pub/1, del_player_pub/1, get_player_pub/1, update_player_pub/2,
%% ETS_PLAYER_PRIV
    add_player_priv/2, del_player_priv/1, update_player_priv/2,
%% ETS_PLAYER_PSOCK
    add_socket/4, get_ppid/1, get_socket/1, del_socket/1,
%% ETS_ACCOUNT_PSOCK
    get_account_ppid/1,add_account_socket/3, get_account_socket/1, del_account_socket/1
]).

%%-------------------------------------------------------------------
add_player_pub(PPlayer) ->
    #p_player{
        aid = Aid, uid = Uid, sid = Sid, name = Name,
        level = Lv, sex = Sex, camp = Camp, race = Race, career = Career, head = Head,
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
    ets:insert(?ETS_PLAYER_PUB, Player),
    ?INFO("add player ~w to ETS_PLAYER_PUB", [Uid]),
    ok.
%%-------------------------------------------------------------------
del_player_pub(Uid) ->
    ?INFO("del player ~w from ETS_PLAYER_PUB", [Uid]),
    ets:delete(?ETS_PLAYER_PUB, Uid).

%%-------------------------------------------------------------------
offline(Aid, Uid) ->
    ?INFO("player ~w of account ~p offline", [Uid, Aid]),
    lib_cache:del_socket(Uid),
    lib_cache:del_account_socket(Aid),
    lib_cache:del_player_priv(Uid),
    ok.
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
add_player_priv(Aid, Uid) ->
    ets:insert(?ETS_PLAYER_PRIV,
        #m_player_private{aid = Aid, uid = Uid}).

del_player_priv(Uid)->
    ets:delete(?ETS_PLAYER_PRIV, Uid).

update_player_priv(Uid, Elements)->
    ets:update_element(?ETS_PLAYER_PRIV, Uid, Elements),
    ok.

%%-------------------------------------------------------------------
add_socket(Aid, Uid, Pid, Socket) ->
    ets:insert(?ETS_PLAYER_PSOCK,
        #m_player_pid_sock{aid = Aid, uid = Uid, pid = Pid, sock = Socket}).

del_socket(Uid) ->
    ets:delete(?ETS_PLAYER_PSOCK,Uid).

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
add_account_socket(Aid, Pid, Socket) ->
    ets:insert(?ETS_ACCOUNT_PSOCK,
        #m_account_pid_sock{aid = Aid, pid = Pid, sock = Socket}).

del_account_socket(Uid) ->
    ets:delete(?ETS_ACCOUNT_PSOCK,Uid).

get_account_socket(Uid) ->
    case ets:lookup(?ETS_ACCOUNT_PSOCK, Uid) of
        [#m_account_pid_sock{sock = Sock}] -> Sock;
        _ -> undefined
    end.

get_account_ppid(Uid) ->
    case ets:lookup(?ETS_ACCOUNT_PSOCK, Uid) of
        [#m_account_pid_sock{pid = Pid}] -> Pid;
        _ -> undefined
    end.


