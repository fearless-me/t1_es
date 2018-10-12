%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(object_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
    get_pid/1, get_pid_def/2, set_pid/2, set_pid_direct/2, % #m_object_rw.pid
    get_data_id/1, get_data_id_def/2, set_data_id/2, set_data_id_direct/2, % #m_object_rw.data_id
    get_group/1, get_group_def/2, set_group/2, set_group_direct/2, % #m_object_rw.group
    get_owner/1, get_owner_def/2, set_owner/2, set_owner_direct/2, % #m_object_rw.owner
    get_type/1, get_type_def/2, set_type/2, set_type_direct/2, % #m_object_rw.type
    get_move_speed/1, get_move_speed_def/2, set_move_speed/2, set_move_speed_direct/2, % #m_object_rw.move_speed
    get_cur_move/1, get_cur_move_def/2, set_cur_move/2, set_cur_move_direct/2, % #m_object_rw.cur_move
    get_next_move/1, get_next_move_def/2, set_next_move/2, set_next_move_direct/2, % #m_object_rw.next_move
    get_vis_tile_idx/1, get_vis_tile_idx_def/2, set_vis_tile_idx/2, set_vis_tile_idx_direct/2, % #m_object_rw.vis_tile_idx
    get_cur_pos/1, get_cur_pos_def/2, set_cur_pos/2, set_cur_pos_direct/2, % #m_object_rw.cur_pos
    get_start_pos/1, get_start_pos_def/2, set_start_pos/2, set_start_pos_direct/2, % #m_object_rw.start_pos
    get_dest_pos/1, get_dest_pos_def/2, set_dest_pos/2, set_dest_pos_direct/2, % #m_object_rw.dest_pos
    get_face/1, get_face_def/2, set_face/2, set_face_direct/2, % #m_object_rw.face
    get_dir/1, get_dir_def/2, set_dir/2, set_dir_direct/2, % #m_object_rw.dir
    get_start_time/1, get_start_time_def/2, set_start_time/2, set_start_time_direct/2, % #m_object_rw.start_time
    get_seg_move_time/1, get_seg_move_time_def/2, set_seg_move_time/2, set_seg_move_time_direct/2, % #m_object_rw.seg_move_time
    get_force_stopped/1, get_force_stopped_def/2, set_force_stopped/2, set_force_stopped_direct/2, % #m_object_rw.force_stopped
    get_path_list/1, get_path_list_def/2, set_path_list/2, set_path_list_direct/2, % #m_object_rw.path_list
    get_skill_id/1, get_skill_id_def/2, set_skill_id/2, set_skill_id_direct/2, % #m_object_rw.skill_id
    get_target_uid/1, get_target_uid_def/2, set_target_uid/2, set_target_uid_direct/2, % #m_object_rw.target_uid
    get_skill_serial/1, get_skill_serial_def/2, set_skill_serial/2, set_skill_serial_direct/2, % #m_object_rw.skill_serial
    get_persist_pos/1, get_persist_pos_def/2, set_persist_pos/2, set_persist_pos_direct/2, % #m_object_rw.persist_pos
    get_cur_dmg_index/1, get_cur_dmg_index_def/2, set_cur_dmg_index/2, set_cur_dmg_index_direct/2, % #m_object_rw.cur_dmg_index
    get_operate_time/1, get_operate_time_def/2, set_operate_time/2, set_operate_time_direct/2, % #m_object_rw.operate_time
    get_spell_time/1, get_spell_time_def/2, set_spell_time/2, set_spell_time_direct/2, % #m_object_rw.spell_time
    get_channel_cd/1, get_channel_cd_def/2, set_channel_cd/2, set_channel_cd_direct/2, % #m_object_rw.channel_cd
    get_skill_queue/1, get_skill_queue_def/2, set_skill_queue/2, set_skill_queue_direct/2, % #m_object_rw.skill_queue
    get_hp/1, get_hp_def/2, set_hp/2, set_hp_direct/2, % #m_object_rw.hp
    get_max_hp/1, get_max_hp_def/2, set_max_hp/2, set_max_hp_direct/2, % #m_object_rw.max_hp
    get_attr/1, get_attr_def/2, set_attr/2, set_attr_direct/2, % #m_object_rw.attr
    get_buff_list/1, get_buff_list_def/2, set_buff_list/2, set_buff_list_direct/2, % #m_object_rw.buff_list
    % common function
    del/1, to_record/1, set/2, set_fields/2, init_default/1, init_default/2
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_object_rw.pid
get_pid(Uid) -> get_pid_def(Uid, undefined).

get_pid_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.pid
    end.

set_pid(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{pid = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, pid, R)).

set_pid_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{pid = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.data_id
get_data_id(Uid) -> get_data_id_def(Uid, undefined).

get_data_id_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.data_id
    end.

set_data_id(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{data_id = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, data_id, R)).

set_data_id_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{data_id = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.group
get_group(Uid) -> get_group_def(Uid, undefined).

get_group_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.group
    end.

set_group(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{group = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, group, R)).

set_group_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{group = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.owner
get_owner(Uid) -> get_owner_def(Uid, undefined).

get_owner_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.owner
    end.

set_owner(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{owner = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, owner, R)).

set_owner_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{owner = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.type
get_type(Uid) -> get_type_def(Uid, undefined).

get_type_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.type
    end.

set_type(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{type = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, type, R)).

set_type_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{type = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.move_speed
get_move_speed(Uid) -> get_move_speed_def(Uid, undefined).

get_move_speed_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.move_speed
    end.

set_move_speed(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{move_speed = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, move_speed, R)).

set_move_speed_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{move_speed = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.cur_move
get_cur_move(Uid) -> get_cur_move_def(Uid, undefined).

get_cur_move_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.cur_move
    end.

set_cur_move(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{cur_move = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_move, R)).

set_cur_move_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{cur_move = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.next_move
get_next_move(Uid) -> get_next_move_def(Uid, undefined).

get_next_move_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.next_move
    end.

set_next_move(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{next_move = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, next_move, R)).

set_next_move_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{next_move = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.vis_tile_idx
get_vis_tile_idx(Uid) -> get_vis_tile_idx_def(Uid, undefined).

get_vis_tile_idx_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.vis_tile_idx
    end.

set_vis_tile_idx(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{vis_tile_idx = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, vis_tile_idx, R)).

set_vis_tile_idx_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{vis_tile_idx = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.cur_pos
get_cur_pos(Uid) -> get_cur_pos_def(Uid, undefined).

get_cur_pos_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.cur_pos
    end.

set_cur_pos(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{cur_pos = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_pos, R)).

set_cur_pos_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{cur_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.start_pos
get_start_pos(Uid) -> get_start_pos_def(Uid, undefined).

get_start_pos_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.start_pos
    end.

set_start_pos(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{start_pos = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_pos, R)).

set_start_pos_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{start_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.dest_pos
get_dest_pos(Uid) -> get_dest_pos_def(Uid, undefined).

get_dest_pos_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.dest_pos
    end.

set_dest_pos(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{dest_pos = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dest_pos, R)).

set_dest_pos_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{dest_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.face
get_face(Uid) -> get_face_def(Uid, undefined).

get_face_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.face
    end.

set_face(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{face = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, face, R)).

set_face_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{face = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.dir
get_dir(Uid) -> get_dir_def(Uid, undefined).

get_dir_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.dir
    end.

set_dir(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{dir = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dir, R)).

set_dir_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{dir = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.start_time
get_start_time(Uid) -> get_start_time_def(Uid, undefined).

get_start_time_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.start_time
    end.

set_start_time(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{start_time = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_time, R)).

set_start_time_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{start_time = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.seg_move_time
get_seg_move_time(Uid) -> get_seg_move_time_def(Uid, undefined).

get_seg_move_time_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.seg_move_time
    end.

set_seg_move_time(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{seg_move_time = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, seg_move_time, R)).

set_seg_move_time_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{seg_move_time = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.force_stopped
get_force_stopped(Uid) -> get_force_stopped_def(Uid, undefined).

get_force_stopped_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.force_stopped
    end.

set_force_stopped(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{force_stopped = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, force_stopped, R)).

set_force_stopped_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{force_stopped = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.path_list
get_path_list(Uid) -> get_path_list_def(Uid, undefined).

get_path_list_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.path_list
    end.

set_path_list(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{path_list = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, path_list, R)).

set_path_list_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{path_list = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.skill_id
get_skill_id(Uid) -> get_skill_id_def(Uid, undefined).

get_skill_id_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.skill_id
    end.

set_skill_id(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{skill_id = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_id, R)).

set_skill_id_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{skill_id = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.target_uid
get_target_uid(Uid) -> get_target_uid_def(Uid, undefined).

get_target_uid_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.target_uid
    end.

set_target_uid(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{target_uid = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, target_uid, R)).

set_target_uid_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{target_uid = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.skill_serial
get_skill_serial(Uid) -> get_skill_serial_def(Uid, undefined).

get_skill_serial_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.skill_serial
    end.

set_skill_serial(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{skill_serial = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_serial, R)).

set_skill_serial_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{skill_serial = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.persist_pos
get_persist_pos(Uid) -> get_persist_pos_def(Uid, undefined).

get_persist_pos_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.persist_pos
    end.

set_persist_pos(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{persist_pos = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, persist_pos, R)).

set_persist_pos_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{persist_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.cur_dmg_index
get_cur_dmg_index(Uid) -> get_cur_dmg_index_def(Uid, undefined).

get_cur_dmg_index_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.cur_dmg_index
    end.

set_cur_dmg_index(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{cur_dmg_index = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_dmg_index, R)).

set_cur_dmg_index_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{cur_dmg_index = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.operate_time
get_operate_time(Uid) -> get_operate_time_def(Uid, undefined).

get_operate_time_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.operate_time
    end.

set_operate_time(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{operate_time = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, operate_time, R)).

set_operate_time_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{operate_time = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.spell_time
get_spell_time(Uid) -> get_spell_time_def(Uid, undefined).

get_spell_time_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.spell_time
    end.

set_spell_time(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{spell_time = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, spell_time, R)).

set_spell_time_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{spell_time = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.channel_cd
get_channel_cd(Uid) -> get_channel_cd_def(Uid, undefined).

get_channel_cd_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.channel_cd
    end.

set_channel_cd(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{channel_cd = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, channel_cd, R)).

set_channel_cd_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{channel_cd = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.skill_queue
get_skill_queue(Uid) -> get_skill_queue_def(Uid, undefined).

get_skill_queue_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.skill_queue
    end.

set_skill_queue(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{skill_queue = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_queue, R)).

set_skill_queue_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{skill_queue = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.hp
get_hp(Uid) -> get_hp_def(Uid, undefined).

get_hp_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.hp
    end.

set_hp(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{hp = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, hp, R)).

set_hp_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{hp = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.max_hp
get_max_hp(Uid) -> get_max_hp_def(Uid, undefined).

get_max_hp_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.max_hp
    end.

set_max_hp(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{max_hp = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, max_hp, R)).

set_max_hp_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{max_hp = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.attr
get_attr(Uid) -> get_attr_def(Uid, undefined).

get_attr_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.attr
    end.

set_attr(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{attr = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, attr, R)).

set_attr_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{attr = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.buff_list
get_buff_list(Uid) -> get_buff_list_def(Uid, undefined).

get_buff_list_def(Uid, Def) ->
    case erlang:get({Uid, m_object_rw}) of
        undefined -> Def;
        V -> V#m_object_rw.buff_list
    end.

set_buff_list(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{buff_list = V}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, buff_list, R)).

set_buff_list_direct(Uid, V) ->
    R = erlang:get({Uid, m_object_rw}),
    erlang:put({Uid, m_object_rw}, R#m_object_rw{buff_list = V}).

%%-------------------------------------------------------------------
del(Uid) -> erlang:erase({Uid, m_object_rw}).

%%-------------------------------------------------------------------
to_record(Uid) -> erlang:get({Uid, m_object_rw}).

%%-------------------------------------------------------------------
set(Uid, #m_object_rw{} = V) ->
    erlang:put({Uid, m_object_rw}, V).

%%-------------------------------------------------------------------
init_default(Uid) -> erlang:put({Uid, m_object_rw}, #m_object_rw{}).
init_default(Uid, #m_object_rw{} = V) -> erlang:put({Uid, m_object_rw}, V).

%%-------------------------------------------------------------------
set_fields(_Uid, []) -> ok;
set_fields(Uid, FieldList) ->
    R1 = erlang:get({Uid, m_object_rw}),
    R2 = i_set_fields(Uid, FieldList, R1),
    erlang:put({Uid, m_object_rw}, R2),
    ok.

%%-------------------------------------------------------------------
i_set_fields(_Uid, R, []) ->
    R;
i_set_fields(Uid, R, [H | FieldList]) ->
    i_set_fields(Uid, i_set_field(Uid, R, H), FieldList).

%%#m_object_rw.pid
i_set_field(Uid, {pid, Val}, R) ->
    R1 = R#m_object_rw{pid = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, pid, R)),
    R1;
i_set_field(Uid, {pid, Val, add}, R) ->
    R1 = R#m_object_rw{pid = R#m_object_rw.pid + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, pid, R)),
    R1;
i_set_field(Uid, {pid, Val, sub}, R) ->
    R1 = R#m_object_rw{pid = R#m_object_rw.pid - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, pid, R)),
    R1;
i_set_field(Uid, {#m_object_rw.pid, Val}, R) ->
    R1 = R#m_object_rw{pid = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, pid, R)),
    R1;
i_set_field(Uid, {#m_object_rw.pid, Val, add}, R) ->
    R1 = R#m_object_rw{pid = R#m_object_rw.pid + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, pid, R)),
    R1;
i_set_field(Uid, {#m_object_rw.pid, Val, sub}, R) ->
    R1 = R#m_object_rw{pid = R#m_object_rw.pid - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, pid, R)),
    R1;
%%#m_object_rw.data_id
i_set_field(Uid, {data_id, Val}, R) ->
    R1 = R#m_object_rw{data_id = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, data_id, R)),
    R1;
i_set_field(Uid, {data_id, Val, add}, R) ->
    R1 = R#m_object_rw{data_id = R#m_object_rw.data_id + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, data_id, R)),
    R1;
i_set_field(Uid, {data_id, Val, sub}, R) ->
    R1 = R#m_object_rw{data_id = R#m_object_rw.data_id - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, data_id, R)),
    R1;
i_set_field(Uid, {#m_object_rw.data_id, Val}, R) ->
    R1 = R#m_object_rw{data_id = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, data_id, R)),
    R1;
i_set_field(Uid, {#m_object_rw.data_id, Val, add}, R) ->
    R1 = R#m_object_rw{data_id = R#m_object_rw.data_id + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, data_id, R)),
    R1;
i_set_field(Uid, {#m_object_rw.data_id, Val, sub}, R) ->
    R1 = R#m_object_rw{data_id = R#m_object_rw.data_id - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, data_id, R)),
    R1;
%%#m_object_rw.group
i_set_field(Uid, {group, Val}, R) ->
    R1 = R#m_object_rw{group = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, group, R)),
    R1;
i_set_field(Uid, {group, Val, add}, R) ->
    R1 = R#m_object_rw{group = R#m_object_rw.group + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, group, R)),
    R1;
i_set_field(Uid, {group, Val, sub}, R) ->
    R1 = R#m_object_rw{group = R#m_object_rw.group - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, group, R)),
    R1;
i_set_field(Uid, {#m_object_rw.group, Val}, R) ->
    R1 = R#m_object_rw{group = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, group, R)),
    R1;
i_set_field(Uid, {#m_object_rw.group, Val, add}, R) ->
    R1 = R#m_object_rw{group = R#m_object_rw.group + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, group, R)),
    R1;
i_set_field(Uid, {#m_object_rw.group, Val, sub}, R) ->
    R1 = R#m_object_rw{group = R#m_object_rw.group - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, group, R)),
    R1;
%%#m_object_rw.owner
i_set_field(Uid, {owner, Val}, R) ->
    R1 = R#m_object_rw{owner = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, owner, R)),
    R1;
i_set_field(Uid, {owner, Val, add}, R) ->
    R1 = R#m_object_rw{owner = R#m_object_rw.owner + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, owner, R)),
    R1;
i_set_field(Uid, {owner, Val, sub}, R) ->
    R1 = R#m_object_rw{owner = R#m_object_rw.owner - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, owner, R)),
    R1;
i_set_field(Uid, {#m_object_rw.owner, Val}, R) ->
    R1 = R#m_object_rw{owner = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, owner, R)),
    R1;
i_set_field(Uid, {#m_object_rw.owner, Val, add}, R) ->
    R1 = R#m_object_rw{owner = R#m_object_rw.owner + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, owner, R)),
    R1;
i_set_field(Uid, {#m_object_rw.owner, Val, sub}, R) ->
    R1 = R#m_object_rw{owner = R#m_object_rw.owner - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, owner, R)),
    R1;
%%#m_object_rw.type
i_set_field(Uid, {type, Val}, R) ->
    R1 = R#m_object_rw{type = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, type, R)),
    R1;
i_set_field(Uid, {type, Val, add}, R) ->
    R1 = R#m_object_rw{type = R#m_object_rw.type + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, type, R)),
    R1;
i_set_field(Uid, {type, Val, sub}, R) ->
    R1 = R#m_object_rw{type = R#m_object_rw.type - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, type, R)),
    R1;
i_set_field(Uid, {#m_object_rw.type, Val}, R) ->
    R1 = R#m_object_rw{type = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, type, R)),
    R1;
i_set_field(Uid, {#m_object_rw.type, Val, add}, R) ->
    R1 = R#m_object_rw{type = R#m_object_rw.type + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, type, R)),
    R1;
i_set_field(Uid, {#m_object_rw.type, Val, sub}, R) ->
    R1 = R#m_object_rw{type = R#m_object_rw.type - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, type, R)),
    R1;
%%#m_object_rw.move_speed
i_set_field(Uid, {move_speed, Val}, R) ->
    R1 = R#m_object_rw{move_speed = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, move_speed, R)),
    R1;
i_set_field(Uid, {move_speed, Val, add}, R) ->
    R1 = R#m_object_rw{move_speed = R#m_object_rw.move_speed + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, move_speed, R)),
    R1;
i_set_field(Uid, {move_speed, Val, sub}, R) ->
    R1 = R#m_object_rw{move_speed = R#m_object_rw.move_speed - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, move_speed, R)),
    R1;
i_set_field(Uid, {#m_object_rw.move_speed, Val}, R) ->
    R1 = R#m_object_rw{move_speed = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, move_speed, R)),
    R1;
i_set_field(Uid, {#m_object_rw.move_speed, Val, add}, R) ->
    R1 = R#m_object_rw{move_speed = R#m_object_rw.move_speed + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, move_speed, R)),
    R1;
i_set_field(Uid, {#m_object_rw.move_speed, Val, sub}, R) ->
    R1 = R#m_object_rw{move_speed = R#m_object_rw.move_speed - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, move_speed, R)),
    R1;
%%#m_object_rw.cur_move
i_set_field(Uid, {cur_move, Val}, R) ->
    R1 = R#m_object_rw{cur_move = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_move, R)),
    R1;
i_set_field(Uid, {cur_move, Val, add}, R) ->
    R1 = R#m_object_rw{cur_move = R#m_object_rw.cur_move + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_move, R)),
    R1;
i_set_field(Uid, {cur_move, Val, sub}, R) ->
    R1 = R#m_object_rw{cur_move = R#m_object_rw.cur_move - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_move, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_move, Val}, R) ->
    R1 = R#m_object_rw{cur_move = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_move, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_move, Val, add}, R) ->
    R1 = R#m_object_rw{cur_move = R#m_object_rw.cur_move + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_move, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_move, Val, sub}, R) ->
    R1 = R#m_object_rw{cur_move = R#m_object_rw.cur_move - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_move, R)),
    R1;
%%#m_object_rw.next_move
i_set_field(Uid, {next_move, Val}, R) ->
    R1 = R#m_object_rw{next_move = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, next_move, R)),
    R1;
i_set_field(Uid, {next_move, Val, add}, R) ->
    R1 = R#m_object_rw{next_move = R#m_object_rw.next_move + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, next_move, R)),
    R1;
i_set_field(Uid, {next_move, Val, sub}, R) ->
    R1 = R#m_object_rw{next_move = R#m_object_rw.next_move - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, next_move, R)),
    R1;
i_set_field(Uid, {#m_object_rw.next_move, Val}, R) ->
    R1 = R#m_object_rw{next_move = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, next_move, R)),
    R1;
i_set_field(Uid, {#m_object_rw.next_move, Val, add}, R) ->
    R1 = R#m_object_rw{next_move = R#m_object_rw.next_move + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, next_move, R)),
    R1;
i_set_field(Uid, {#m_object_rw.next_move, Val, sub}, R) ->
    R1 = R#m_object_rw{next_move = R#m_object_rw.next_move - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, next_move, R)),
    R1;
%%#m_object_rw.vis_tile_idx
i_set_field(Uid, {vis_tile_idx, Val}, R) ->
    R1 = R#m_object_rw{vis_tile_idx = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, vis_tile_idx, R)),
    R1;
i_set_field(Uid, {vis_tile_idx, Val, add}, R) ->
    R1 = R#m_object_rw{vis_tile_idx = R#m_object_rw.vis_tile_idx + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, vis_tile_idx, R)),
    R1;
i_set_field(Uid, {vis_tile_idx, Val, sub}, R) ->
    R1 = R#m_object_rw{vis_tile_idx = R#m_object_rw.vis_tile_idx - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, vis_tile_idx, R)),
    R1;
i_set_field(Uid, {#m_object_rw.vis_tile_idx, Val}, R) ->
    R1 = R#m_object_rw{vis_tile_idx = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, vis_tile_idx, R)),
    R1;
i_set_field(Uid, {#m_object_rw.vis_tile_idx, Val, add}, R) ->
    R1 = R#m_object_rw{vis_tile_idx = R#m_object_rw.vis_tile_idx + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, vis_tile_idx, R)),
    R1;
i_set_field(Uid, {#m_object_rw.vis_tile_idx, Val, sub}, R) ->
    R1 = R#m_object_rw{vis_tile_idx = R#m_object_rw.vis_tile_idx - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, vis_tile_idx, R)),
    R1;
%%#m_object_rw.cur_pos
i_set_field(Uid, {cur_pos, Val}, R) ->
    R1 = R#m_object_rw{cur_pos = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_pos, R)),
    R1;
i_set_field(Uid, {cur_pos, Val, add}, R) ->
    R1 = R#m_object_rw{cur_pos = R#m_object_rw.cur_pos + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_pos, R)),
    R1;
i_set_field(Uid, {cur_pos, Val, sub}, R) ->
    R1 = R#m_object_rw{cur_pos = R#m_object_rw.cur_pos - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_pos, Val}, R) ->
    R1 = R#m_object_rw{cur_pos = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_pos, Val, add}, R) ->
    R1 = R#m_object_rw{cur_pos = R#m_object_rw.cur_pos + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_pos, Val, sub}, R) ->
    R1 = R#m_object_rw{cur_pos = R#m_object_rw.cur_pos - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_pos, R)),
    R1;
%%#m_object_rw.start_pos
i_set_field(Uid, {start_pos, Val}, R) ->
    R1 = R#m_object_rw{start_pos = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_pos, R)),
    R1;
i_set_field(Uid, {start_pos, Val, add}, R) ->
    R1 = R#m_object_rw{start_pos = R#m_object_rw.start_pos + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_pos, R)),
    R1;
i_set_field(Uid, {start_pos, Val, sub}, R) ->
    R1 = R#m_object_rw{start_pos = R#m_object_rw.start_pos - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.start_pos, Val}, R) ->
    R1 = R#m_object_rw{start_pos = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.start_pos, Val, add}, R) ->
    R1 = R#m_object_rw{start_pos = R#m_object_rw.start_pos + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.start_pos, Val, sub}, R) ->
    R1 = R#m_object_rw{start_pos = R#m_object_rw.start_pos - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_pos, R)),
    R1;
%%#m_object_rw.dest_pos
i_set_field(Uid, {dest_pos, Val}, R) ->
    R1 = R#m_object_rw{dest_pos = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dest_pos, R)),
    R1;
i_set_field(Uid, {dest_pos, Val, add}, R) ->
    R1 = R#m_object_rw{dest_pos = R#m_object_rw.dest_pos + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dest_pos, R)),
    R1;
i_set_field(Uid, {dest_pos, Val, sub}, R) ->
    R1 = R#m_object_rw{dest_pos = R#m_object_rw.dest_pos - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dest_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.dest_pos, Val}, R) ->
    R1 = R#m_object_rw{dest_pos = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dest_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.dest_pos, Val, add}, R) ->
    R1 = R#m_object_rw{dest_pos = R#m_object_rw.dest_pos + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dest_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.dest_pos, Val, sub}, R) ->
    R1 = R#m_object_rw{dest_pos = R#m_object_rw.dest_pos - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dest_pos, R)),
    R1;
%%#m_object_rw.face
i_set_field(Uid, {face, Val}, R) ->
    R1 = R#m_object_rw{face = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, face, R)),
    R1;
i_set_field(Uid, {face, Val, add}, R) ->
    R1 = R#m_object_rw{face = R#m_object_rw.face + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, face, R)),
    R1;
i_set_field(Uid, {face, Val, sub}, R) ->
    R1 = R#m_object_rw{face = R#m_object_rw.face - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, face, R)),
    R1;
i_set_field(Uid, {#m_object_rw.face, Val}, R) ->
    R1 = R#m_object_rw{face = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, face, R)),
    R1;
i_set_field(Uid, {#m_object_rw.face, Val, add}, R) ->
    R1 = R#m_object_rw{face = R#m_object_rw.face + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, face, R)),
    R1;
i_set_field(Uid, {#m_object_rw.face, Val, sub}, R) ->
    R1 = R#m_object_rw{face = R#m_object_rw.face - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, face, R)),
    R1;
%%#m_object_rw.dir
i_set_field(Uid, {dir, Val}, R) ->
    R1 = R#m_object_rw{dir = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dir, R)),
    R1;
i_set_field(Uid, {dir, Val, add}, R) ->
    R1 = R#m_object_rw{dir = R#m_object_rw.dir + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dir, R)),
    R1;
i_set_field(Uid, {dir, Val, sub}, R) ->
    R1 = R#m_object_rw{dir = R#m_object_rw.dir - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dir, R)),
    R1;
i_set_field(Uid, {#m_object_rw.dir, Val}, R) ->
    R1 = R#m_object_rw{dir = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dir, R)),
    R1;
i_set_field(Uid, {#m_object_rw.dir, Val, add}, R) ->
    R1 = R#m_object_rw{dir = R#m_object_rw.dir + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dir, R)),
    R1;
i_set_field(Uid, {#m_object_rw.dir, Val, sub}, R) ->
    R1 = R#m_object_rw{dir = R#m_object_rw.dir - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, dir, R)),
    R1;
%%#m_object_rw.start_time
i_set_field(Uid, {start_time, Val}, R) ->
    R1 = R#m_object_rw{start_time = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_time, R)),
    R1;
i_set_field(Uid, {start_time, Val, add}, R) ->
    R1 = R#m_object_rw{start_time = R#m_object_rw.start_time + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_time, R)),
    R1;
i_set_field(Uid, {start_time, Val, sub}, R) ->
    R1 = R#m_object_rw{start_time = R#m_object_rw.start_time - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.start_time, Val}, R) ->
    R1 = R#m_object_rw{start_time = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.start_time, Val, add}, R) ->
    R1 = R#m_object_rw{start_time = R#m_object_rw.start_time + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.start_time, Val, sub}, R) ->
    R1 = R#m_object_rw{start_time = R#m_object_rw.start_time - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, start_time, R)),
    R1;
%%#m_object_rw.seg_move_time
i_set_field(Uid, {seg_move_time, Val}, R) ->
    R1 = R#m_object_rw{seg_move_time = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, seg_move_time, R)),
    R1;
i_set_field(Uid, {seg_move_time, Val, add}, R) ->
    R1 = R#m_object_rw{seg_move_time = R#m_object_rw.seg_move_time + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, seg_move_time, R)),
    R1;
i_set_field(Uid, {seg_move_time, Val, sub}, R) ->
    R1 = R#m_object_rw{seg_move_time = R#m_object_rw.seg_move_time - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, seg_move_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.seg_move_time, Val}, R) ->
    R1 = R#m_object_rw{seg_move_time = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, seg_move_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.seg_move_time, Val, add}, R) ->
    R1 = R#m_object_rw{seg_move_time = R#m_object_rw.seg_move_time + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, seg_move_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.seg_move_time, Val, sub}, R) ->
    R1 = R#m_object_rw{seg_move_time = R#m_object_rw.seg_move_time - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, seg_move_time, R)),
    R1;
%%#m_object_rw.force_stopped
i_set_field(Uid, {force_stopped, Val}, R) ->
    R1 = R#m_object_rw{force_stopped = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, force_stopped, R)),
    R1;
i_set_field(Uid, {force_stopped, Val, add}, R) ->
    R1 = R#m_object_rw{force_stopped = R#m_object_rw.force_stopped + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, force_stopped, R)),
    R1;
i_set_field(Uid, {force_stopped, Val, sub}, R) ->
    R1 = R#m_object_rw{force_stopped = R#m_object_rw.force_stopped - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, force_stopped, R)),
    R1;
i_set_field(Uid, {#m_object_rw.force_stopped, Val}, R) ->
    R1 = R#m_object_rw{force_stopped = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, force_stopped, R)),
    R1;
i_set_field(Uid, {#m_object_rw.force_stopped, Val, add}, R) ->
    R1 = R#m_object_rw{force_stopped = R#m_object_rw.force_stopped + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, force_stopped, R)),
    R1;
i_set_field(Uid, {#m_object_rw.force_stopped, Val, sub}, R) ->
    R1 = R#m_object_rw{force_stopped = R#m_object_rw.force_stopped - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, force_stopped, R)),
    R1;
%%#m_object_rw.path_list
i_set_field(Uid, {path_list, Val}, R) ->
    R1 = R#m_object_rw{path_list = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, path_list, R)),
    R1;
i_set_field(Uid, {path_list, Val, add}, R) ->
    R1 = R#m_object_rw{path_list = R#m_object_rw.path_list + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, path_list, R)),
    R1;
i_set_field(Uid, {path_list, Val, sub}, R) ->
    R1 = R#m_object_rw{path_list = R#m_object_rw.path_list - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, path_list, R)),
    R1;
i_set_field(Uid, {#m_object_rw.path_list, Val}, R) ->
    R1 = R#m_object_rw{path_list = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, path_list, R)),
    R1;
i_set_field(Uid, {#m_object_rw.path_list, Val, add}, R) ->
    R1 = R#m_object_rw{path_list = R#m_object_rw.path_list + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, path_list, R)),
    R1;
i_set_field(Uid, {#m_object_rw.path_list, Val, sub}, R) ->
    R1 = R#m_object_rw{path_list = R#m_object_rw.path_list - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, path_list, R)),
    R1;
%%#m_object_rw.skill_id
i_set_field(Uid, {skill_id, Val}, R) ->
    R1 = R#m_object_rw{skill_id = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_id, R)),
    R1;
i_set_field(Uid, {skill_id, Val, add}, R) ->
    R1 = R#m_object_rw{skill_id = R#m_object_rw.skill_id + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_id, R)),
    R1;
i_set_field(Uid, {skill_id, Val, sub}, R) ->
    R1 = R#m_object_rw{skill_id = R#m_object_rw.skill_id - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_id, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_id, Val}, R) ->
    R1 = R#m_object_rw{skill_id = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_id, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_id, Val, add}, R) ->
    R1 = R#m_object_rw{skill_id = R#m_object_rw.skill_id + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_id, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_id, Val, sub}, R) ->
    R1 = R#m_object_rw{skill_id = R#m_object_rw.skill_id - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_id, R)),
    R1;
%%#m_object_rw.target_uid
i_set_field(Uid, {target_uid, Val}, R) ->
    R1 = R#m_object_rw{target_uid = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, target_uid, R)),
    R1;
i_set_field(Uid, {target_uid, Val, add}, R) ->
    R1 = R#m_object_rw{target_uid = R#m_object_rw.target_uid + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, target_uid, R)),
    R1;
i_set_field(Uid, {target_uid, Val, sub}, R) ->
    R1 = R#m_object_rw{target_uid = R#m_object_rw.target_uid - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, target_uid, R)),
    R1;
i_set_field(Uid, {#m_object_rw.target_uid, Val}, R) ->
    R1 = R#m_object_rw{target_uid = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, target_uid, R)),
    R1;
i_set_field(Uid, {#m_object_rw.target_uid, Val, add}, R) ->
    R1 = R#m_object_rw{target_uid = R#m_object_rw.target_uid + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, target_uid, R)),
    R1;
i_set_field(Uid, {#m_object_rw.target_uid, Val, sub}, R) ->
    R1 = R#m_object_rw{target_uid = R#m_object_rw.target_uid - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, target_uid, R)),
    R1;
%%#m_object_rw.skill_serial
i_set_field(Uid, {skill_serial, Val}, R) ->
    R1 = R#m_object_rw{skill_serial = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_serial, R)),
    R1;
i_set_field(Uid, {skill_serial, Val, add}, R) ->
    R1 = R#m_object_rw{skill_serial = R#m_object_rw.skill_serial + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_serial, R)),
    R1;
i_set_field(Uid, {skill_serial, Val, sub}, R) ->
    R1 = R#m_object_rw{skill_serial = R#m_object_rw.skill_serial - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_serial, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_serial, Val}, R) ->
    R1 = R#m_object_rw{skill_serial = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_serial, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_serial, Val, add}, R) ->
    R1 = R#m_object_rw{skill_serial = R#m_object_rw.skill_serial + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_serial, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_serial, Val, sub}, R) ->
    R1 = R#m_object_rw{skill_serial = R#m_object_rw.skill_serial - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_serial, R)),
    R1;
%%#m_object_rw.persist_pos
i_set_field(Uid, {persist_pos, Val}, R) ->
    R1 = R#m_object_rw{persist_pos = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, persist_pos, R)),
    R1;
i_set_field(Uid, {persist_pos, Val, add}, R) ->
    R1 = R#m_object_rw{persist_pos = R#m_object_rw.persist_pos + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, persist_pos, R)),
    R1;
i_set_field(Uid, {persist_pos, Val, sub}, R) ->
    R1 = R#m_object_rw{persist_pos = R#m_object_rw.persist_pos - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, persist_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.persist_pos, Val}, R) ->
    R1 = R#m_object_rw{persist_pos = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, persist_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.persist_pos, Val, add}, R) ->
    R1 = R#m_object_rw{persist_pos = R#m_object_rw.persist_pos + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, persist_pos, R)),
    R1;
i_set_field(Uid, {#m_object_rw.persist_pos, Val, sub}, R) ->
    R1 = R#m_object_rw{persist_pos = R#m_object_rw.persist_pos - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, persist_pos, R)),
    R1;
%%#m_object_rw.cur_dmg_index
i_set_field(Uid, {cur_dmg_index, Val}, R) ->
    R1 = R#m_object_rw{cur_dmg_index = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_dmg_index, R)),
    R1;
i_set_field(Uid, {cur_dmg_index, Val, add}, R) ->
    R1 = R#m_object_rw{cur_dmg_index = R#m_object_rw.cur_dmg_index + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_dmg_index, R)),
    R1;
i_set_field(Uid, {cur_dmg_index, Val, sub}, R) ->
    R1 = R#m_object_rw{cur_dmg_index = R#m_object_rw.cur_dmg_index - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_dmg_index, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_dmg_index, Val}, R) ->
    R1 = R#m_object_rw{cur_dmg_index = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_dmg_index, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_dmg_index, Val, add}, R) ->
    R1 = R#m_object_rw{cur_dmg_index = R#m_object_rw.cur_dmg_index + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_dmg_index, R)),
    R1;
i_set_field(Uid, {#m_object_rw.cur_dmg_index, Val, sub}, R) ->
    R1 = R#m_object_rw{cur_dmg_index = R#m_object_rw.cur_dmg_index - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, cur_dmg_index, R)),
    R1;
%%#m_object_rw.operate_time
i_set_field(Uid, {operate_time, Val}, R) ->
    R1 = R#m_object_rw{operate_time = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, operate_time, R)),
    R1;
i_set_field(Uid, {operate_time, Val, add}, R) ->
    R1 = R#m_object_rw{operate_time = R#m_object_rw.operate_time + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, operate_time, R)),
    R1;
i_set_field(Uid, {operate_time, Val, sub}, R) ->
    R1 = R#m_object_rw{operate_time = R#m_object_rw.operate_time - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, operate_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.operate_time, Val}, R) ->
    R1 = R#m_object_rw{operate_time = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, operate_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.operate_time, Val, add}, R) ->
    R1 = R#m_object_rw{operate_time = R#m_object_rw.operate_time + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, operate_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.operate_time, Val, sub}, R) ->
    R1 = R#m_object_rw{operate_time = R#m_object_rw.operate_time - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, operate_time, R)),
    R1;
%%#m_object_rw.spell_time
i_set_field(Uid, {spell_time, Val}, R) ->
    R1 = R#m_object_rw{spell_time = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, spell_time, R)),
    R1;
i_set_field(Uid, {spell_time, Val, add}, R) ->
    R1 = R#m_object_rw{spell_time = R#m_object_rw.spell_time + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, spell_time, R)),
    R1;
i_set_field(Uid, {spell_time, Val, sub}, R) ->
    R1 = R#m_object_rw{spell_time = R#m_object_rw.spell_time - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, spell_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.spell_time, Val}, R) ->
    R1 = R#m_object_rw{spell_time = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, spell_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.spell_time, Val, add}, R) ->
    R1 = R#m_object_rw{spell_time = R#m_object_rw.spell_time + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, spell_time, R)),
    R1;
i_set_field(Uid, {#m_object_rw.spell_time, Val, sub}, R) ->
    R1 = R#m_object_rw{spell_time = R#m_object_rw.spell_time - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, spell_time, R)),
    R1;
%%#m_object_rw.channel_cd
i_set_field(Uid, {channel_cd, Val}, R) ->
    R1 = R#m_object_rw{channel_cd = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, channel_cd, R)),
    R1;
i_set_field(Uid, {channel_cd, Val, add}, R) ->
    R1 = R#m_object_rw{channel_cd = R#m_object_rw.channel_cd + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, channel_cd, R)),
    R1;
i_set_field(Uid, {channel_cd, Val, sub}, R) ->
    R1 = R#m_object_rw{channel_cd = R#m_object_rw.channel_cd - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, channel_cd, R)),
    R1;
i_set_field(Uid, {#m_object_rw.channel_cd, Val}, R) ->
    R1 = R#m_object_rw{channel_cd = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, channel_cd, R)),
    R1;
i_set_field(Uid, {#m_object_rw.channel_cd, Val, add}, R) ->
    R1 = R#m_object_rw{channel_cd = R#m_object_rw.channel_cd + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, channel_cd, R)),
    R1;
i_set_field(Uid, {#m_object_rw.channel_cd, Val, sub}, R) ->
    R1 = R#m_object_rw{channel_cd = R#m_object_rw.channel_cd - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, channel_cd, R)),
    R1;
%%#m_object_rw.skill_queue
i_set_field(Uid, {skill_queue, Val}, R) ->
    R1 = R#m_object_rw{skill_queue = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_queue, R)),
    R1;
i_set_field(Uid, {skill_queue, Val, add}, R) ->
    R1 = R#m_object_rw{skill_queue = R#m_object_rw.skill_queue + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_queue, R)),
    R1;
i_set_field(Uid, {skill_queue, Val, sub}, R) ->
    R1 = R#m_object_rw{skill_queue = R#m_object_rw.skill_queue - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_queue, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_queue, Val}, R) ->
    R1 = R#m_object_rw{skill_queue = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_queue, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_queue, Val, add}, R) ->
    R1 = R#m_object_rw{skill_queue = R#m_object_rw.skill_queue + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_queue, R)),
    R1;
i_set_field(Uid, {#m_object_rw.skill_queue, Val, sub}, R) ->
    R1 = R#m_object_rw{skill_queue = R#m_object_rw.skill_queue - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, skill_queue, R)),
    R1;
%%#m_object_rw.hp
i_set_field(Uid, {hp, Val}, R) ->
    R1 = R#m_object_rw{hp = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, hp, R)),
    R1;
i_set_field(Uid, {hp, Val, add}, R) ->
    R1 = R#m_object_rw{hp = R#m_object_rw.hp + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, hp, R)),
    R1;
i_set_field(Uid, {hp, Val, sub}, R) ->
    R1 = R#m_object_rw{hp = R#m_object_rw.hp - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, hp, R)),
    R1;
i_set_field(Uid, {#m_object_rw.hp, Val}, R) ->
    R1 = R#m_object_rw{hp = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, hp, R)),
    R1;
i_set_field(Uid, {#m_object_rw.hp, Val, add}, R) ->
    R1 = R#m_object_rw{hp = R#m_object_rw.hp + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, hp, R)),
    R1;
i_set_field(Uid, {#m_object_rw.hp, Val, sub}, R) ->
    R1 = R#m_object_rw{hp = R#m_object_rw.hp - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, hp, R)),
    R1;
%%#m_object_rw.max_hp
i_set_field(Uid, {max_hp, Val}, R) ->
    R1 = R#m_object_rw{max_hp = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, max_hp, R)),
    R1;
i_set_field(Uid, {max_hp, Val, add}, R) ->
    R1 = R#m_object_rw{max_hp = R#m_object_rw.max_hp + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, max_hp, R)),
    R1;
i_set_field(Uid, {max_hp, Val, sub}, R) ->
    R1 = R#m_object_rw{max_hp = R#m_object_rw.max_hp - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, max_hp, R)),
    R1;
i_set_field(Uid, {#m_object_rw.max_hp, Val}, R) ->
    R1 = R#m_object_rw{max_hp = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, max_hp, R)),
    R1;
i_set_field(Uid, {#m_object_rw.max_hp, Val, add}, R) ->
    R1 = R#m_object_rw{max_hp = R#m_object_rw.max_hp + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, max_hp, R)),
    R1;
i_set_field(Uid, {#m_object_rw.max_hp, Val, sub}, R) ->
    R1 = R#m_object_rw{max_hp = R#m_object_rw.max_hp - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, max_hp, R)),
    R1;
%%#m_object_rw.attr
i_set_field(Uid, {attr, Val}, R) ->
    R1 = R#m_object_rw{attr = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, attr, R)),
    R1;
i_set_field(Uid, {attr, Val, add}, R) ->
    R1 = R#m_object_rw{attr = R#m_object_rw.attr + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, attr, R)),
    R1;
i_set_field(Uid, {attr, Val, sub}, R) ->
    R1 = R#m_object_rw{attr = R#m_object_rw.attr - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, attr, R)),
    R1;
i_set_field(Uid, {#m_object_rw.attr, Val}, R) ->
    R1 = R#m_object_rw{attr = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, attr, R)),
    R1;
i_set_field(Uid, {#m_object_rw.attr, Val, add}, R) ->
    R1 = R#m_object_rw{attr = R#m_object_rw.attr + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, attr, R)),
    R1;
i_set_field(Uid, {#m_object_rw.attr, Val, sub}, R) ->
    R1 = R#m_object_rw{attr = R#m_object_rw.attr - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, attr, R)),
    R1;
%%#m_object_rw.buff_list
i_set_field(Uid, {buff_list, Val}, R) ->
    R1 = R#m_object_rw{buff_list = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, buff_list, R)),
    R1;
i_set_field(Uid, {buff_list, Val, add}, R) ->
    R1 = R#m_object_rw{buff_list = R#m_object_rw.buff_list + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, buff_list, R)),
    R1;
i_set_field(Uid, {buff_list, Val, sub}, R) ->
    R1 = R#m_object_rw{buff_list = R#m_object_rw.buff_list - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, buff_list, R)),
    R1;
i_set_field(Uid, {#m_object_rw.buff_list, Val}, R) ->
    R1 = R#m_object_rw{buff_list = Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, buff_list, R)),
    R1;
i_set_field(Uid, {#m_object_rw.buff_list, Val, add}, R) ->
    R1 = R#m_object_rw{buff_list = R#m_object_rw.buff_list + Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, buff_list, R)),
    R1;
i_set_field(Uid, {#m_object_rw.buff_list, Val, sub}, R) ->
    R1 = R#m_object_rw{buff_list = R#m_object_rw.buff_list - Val},
    ?TRY_CATCH(hook_map:on_rw_update(Uid, buff_list, R)),
    R1;
i_set_field(_Uid, _Elem, R) -> R.

%%-------------------------------------------------------------------
