%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:31
%%%-------------------------------------------------------------------
-module(lib_cs_cache).
-author("mawenhong").
-include("logger.hrl").
-include("pub_common.hrl").
-include("mem_record.hrl").
-include("gdef.hrl").
-include("db_record.hrl").

%% API
-export([
    init/0,
    read/2, read/3, read_element/3,
    write/2, replace/3, update_element/3,
    delete/2,
    select/2, match/2, match_object/2, match_object/3
]).
-export([
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
    ets:new(?ETS_PLAYER_PRIV,   [named_table, public, {keypos, #m_player_private.uid},  ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_PLAYER_PSOCK, [named_table, public, {keypos, #m_player_pid_sock.uid},  ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_ACCOUNT_PSOCK,[named_table, public, {keypos, #m_account_pid_sock.aid}, ?ETS_RC, ?ETS_WC]),
    ok.

%%-------------------------------------------------------------------
read(Tab, Key) -> ets:lookup(Tab, Key).
read(Tab, Key, Def) ->
    case ets:lookup(Tab, Key) of
        [] -> Def;
        Val -> Val
    end.
read_element(Tab, Key, Pos)->
    ets:read_element(Tab, Key, Pos).
%%-------------------------------------------------------------------
write(Tab,Val) ->   ets:insert(Tab, Val).
%%-------------------------------------------------------------------
replace(Tab, Key, Val) ->
    case ets:member(Tab, Key) of
        true -> ets:insert(Tab, Val);
        _ -> ets:insert_new(Tab, Val)
    end.
%%-------------------------------------------------------------------
update_element(Tab, Key, ElementSpec) ->
    ets:update_element(Tab, Key, ElementSpec).

%%-------------------------------------------------------------------
delete(Tab, Key) ->
    ets:delete(Tab, Key).

%%-------------------------------------------------------------------
select(Tab, QS) -> ets:select(Tab, QS).

%%-------------------------------------------------------------------
match(Tab, Pattern) -> ets:match(Tab, Pattern).

%%-------------------------------------------------------------------
match_object(Tab, Pattern) -> ets:match_object(Tab, Pattern).
match_object(Tab, Pattern, Limit) -> ets:match_object(Tab, Pattern, Limit).


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
online(Player, Pid, Sock) ->
    #p_player{aid = Aid, uid = Uid} = Player,
    lib_cache:add_player_pub(Player),
    lib_cache:add_player_priv(Aid, Uid),
    lib_cache:add_socket(Aid, Uid, Pid, Sock),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_player_pub(PPlayer) ->
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

del_account_socket(Uid) ->
    ets:delete(?ETS_ACCOUNT_PSOCK,Uid).

get_account_socket(Uid) ->
    case ets:lookup(?ETS_ACCOUNT_PSOCK, Uid) of
        [#m_account_pid_sock{sock = Sock}] -> Sock;
        _ -> undefined
    end.

get_account_pid(Uid) ->
    case ets:lookup(?ETS_ACCOUNT_PSOCK, Uid) of
        [#m_account_pid_sock{pid = Pid}] -> Pid;
        _ -> undefined
    end.


