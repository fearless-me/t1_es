%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:31
%%%-------------------------------------------------------------------
-module(lib_mem).
-author("mawenhong").
-include("logger.hrl").
-include("pub_common.hrl").
-include("mem_record.hrl").
-include("gdef.hrl").
-include("db_record.hrl").

%% API
-export([new_player/3]).
-export([del_player/1]).
-export([get_player/1]).
-export([player_update/2]).

-export([get_ppid/1]).
-export([add_sock/4, get_sock/1, del_sock/1]).

%%-------------------------------------------------------------------
new_player(Pid, Sock, PPlayer) ->
    #p_player{
        aid = Aid, uid = Uid, sid = Sid, name = Name,
        level = Lv, sex = Sex, camp = Camp, race = Race, career = Career, head = Head,
        map_id = Mid, x = X, y = Y, old_map_id = OMid, old_x = Ox, old_y = Oy
    } = PPlayer,
    Player = #m_player{
        uid =Uid, aid= Aid, sid= Sid,
        name= Name, sex = Sex, camp = Camp,
        career= Career, race = Race,
        level= Lv, pid= Pid, sock = Sock,
        mid= Mid, line = 0, pos = vector3:new(X, 0, Y),
        old_mid= OMid, old_line = 1, old_pos = vector3:new(Ox, 0, Oy)
    },
    ets:insert(?ETS_PLAYER_PUB, Player),
    ok.
%%-------------------------------------------------------------------
del_player(Uid) ->
    ets:delete(?ETS_PLAYER_PUB, Uid).
%%-------------------------------------------------------------------
get_player(Uid) ->
    case ets:lookup(?ETS_PLAYER_PUB, Uid) of
        [Player] -> Player;
        _ -> undefined
    end.
%%-------------------------------------------------------------------
player_update(Uid, Elements)->
    ets:update_element(?ETS_PLAYER_PUB, Uid, Elements),
    ok.

%%-------------------------------------------------------------------
add_sock(Aid, Uid, Pid, Socket) ->
    ets:insert(?ETS_PLAYER_PSOCK,
        #m_player_pid_sock{aid = Aid, uid = Uid, pid = Pid, sock = Socket}).

del_sock(Uid) ->
    ets:delete(?ETS_PLAYER_PSOCK,Uid).

get_sock(Uid) ->
    case ets:lookup(?ETS_PLAYER_PSOCK, Uid) of
        [#m_player_pid_sock{sock = Sock}] -> Sock;
        _ -> undefined
    end.

get_ppid(Uid) ->
    case ets:lookup(?ETS_PLAYER_PSOCK, Uid) of
        [#m_player_pid_sock{pid = Pid}] -> Pid;
        _ -> undefined
    end.


