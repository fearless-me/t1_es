%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:10
%%%-------------------------------------------------------------------
-module(lib_obj).
-author("mawenhong").

-include("logger.hrl").
-include("map.hrl").
-include("map_obj.hrl").

%% API
-export([new/8]).
-export([new_player/5]).
%%
-export([get_uid/1]).
-export([get_pid/1]).
-export([get_did/1]).
-export([get_owner/1]).
-export([get_type/1]).

%%-------------------------------------------------------------------
new(Type, Pid, Uid, Mid, Owner, Group, Pos, Face) ->

    lib_move:init(Uid, Pos, Face),
    lib_obj_rw:set_did(Uid, Mid),
    lib_obj_rw:set_group(Uid, Group),
    lib_obj_rw:set_pid(Uid, Pid),
    #m_map_obj{uid = Uid, pid = Pid, did = Mid, owner = Owner, type = Type}.

new_player(Pid, Uid, Group, Pos, Face) ->
    lib_move:init(Uid, Pos, Face),
    lib_obj_rw:set_did(Uid, 0),
    lib_obj_rw:set_group(Uid, Group),
    lib_obj_rw:set_pid(Uid, Pid),
    #m_map_obj{uid = Uid, pid = Pid, did = 0, owner = 0, type = ?OBJ_USR}.


%%-------------------------------------------------------------------
get_uid(Obj) -> Obj#m_map_obj.uid.
get_pid(Obj) -> Obj#m_map_obj.pid.
get_did(Obj) -> Obj#m_map_obj.did.
get_owner(Obj) -> Obj#m_map_obj.owner.
get_type(Obj) -> Obj#m_map_obj.type.
%%-------------------------------------------------------------------
