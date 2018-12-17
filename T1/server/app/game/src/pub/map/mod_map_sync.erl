%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 十二月 2018 17:24
%%%-------------------------------------------------------------------
-module(mod_map_sync).
-author("tiancheng").

-include("map_core.hrl").
-include("netmsg.hrl").
-include("rec_rw.hrl").

%% API
-export([
    net_msg_get_remote_obj_info/1
]).

net_msg_get_remote_obj_info({MasterUid, TargetUidList, NetPid}) ->
    F =
        fun(Uid) ->
            send_remote_info(MasterUid, Uid, NetPid)
        end,
    lists:foreach(F, TargetUidList).

send_remote_info(_MasterUid, Uid, NetPid) ->
    NetMsg =
        case uid_gen:uid_type(Uid) of
            ?UID_TYPE_MON ->
                case object_rw:get(Uid) of
                    #m_object_rw{cur_pos = Pos} = Obj ->
                        #pk_GS2U_RemoteMonster{
                            uid = Uid,
                            level = Obj#m_object_rw.level,
                            did = Obj#m_object_rw.data_id,
                            cur_x = vector3:x(Pos),
                            cur_y = vector3:z(Pos)
                        };
                    _ ->
                        undefined
                end;
            ?UID_TYPE_PLAYER ->
                case object_rw:get(Uid) of
                    #m_object_rw{cur_pos = Pos} = Obj ->
                        #pk_GS2U_RemotePlayer{
                            uid = Uid,
                            level = Obj#m_object_rw.level,
                            name = Obj#m_object_rw.name,
                            career = Obj#m_object_rw.career,
                            race = Obj#m_object_rw.race,
                            cur_x = vector3:x(Pos),
                            cur_y = vector3:z(Pos)
                        };
                    _ ->
                        undefined
                end;
            ?UID_TYPE_NPC ->
                case object_rw:get(Uid) of
                    #m_object_rw{cur_pos = Pos} = Obj ->
                        #pk_GS2U_RemoteNpc{
                            uid = Uid,
                            level = Obj#m_object_rw.level,
                            did = Obj#m_object_rw.data_id,
                            cur_x = vector3:x(Pos),
                            cur_y = vector3:z(Pos)
                        };
                    _ ->
                        undefined
                end;
            _ ->
                undefined
        end,
    case NetMsg of
        undefined -> skip;
        _ -> gs_interface:send_net_msg(NetPid, NetMsg)
    end,
    ok.