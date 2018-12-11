%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(object_rw).
-author("Hello World").

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
-include("map_core.hrl").

%%-------------------------------------------------------------------
-export([
	 set_uid/2, set_uid_direct/2, get_uid/1, get_uid/2, %#m_object_rw.uid 
	 set_pid/2, set_pid_direct/2, get_pid/1, get_pid/2, %#m_object_rw.pid 
	 set_data_id/2, set_data_id_direct/2, get_data_id/1, get_data_id/2, %#m_object_rw.data_id 
	 set_group/2, set_group_direct/2, get_group/1, get_group/2, %#m_object_rw.group 
	 set_owner/2, set_owner_direct/2, get_owner/1, get_owner/2, %#m_object_rw.owner 
	 set_type/2, set_type_direct/2, get_type/1, get_type/2, %#m_object_rw.type 
	 set_level/2, set_level_direct/2, get_level/1, get_level/2, %#m_object_rw.level 
	 set_name/2, set_name_direct/2, get_name/1, get_name/2, %#m_object_rw.name 
	 set_sex/2, set_sex_direct/2, get_sex/1, get_sex/2, %#m_object_rw.sex 
	 set_career/2, set_career_direct/2, get_career/1, get_career/2, %#m_object_rw.career 
	 set_race/2, set_race_direct/2, get_race/1, get_race/2, %#m_object_rw.race 
	 set_camp/2, set_camp_direct/2, get_camp/1, get_camp/2, %#m_object_rw.camp 
	 set_state/2, set_state_direct/2, get_state/1, get_state/2, %#m_object_rw.state 
	 set_move_speed/2, set_move_speed_direct/2, get_move_speed/1, get_move_speed/2, %#m_object_rw.move_speed 
	 set_cur_move/2, set_cur_move_direct/2, get_cur_move/1, get_cur_move/2, %#m_object_rw.cur_move 
	 set_next_move/2, set_next_move_direct/2, get_next_move/1, get_next_move/2, %#m_object_rw.next_move 
	 set_vis_tile_idx/2, set_vis_tile_idx_direct/2, get_vis_tile_idx/1, get_vis_tile_idx/2, %#m_object_rw.vis_tile_idx 
	 set_cur_pos/2, set_cur_pos_direct/2, get_cur_pos/1, get_cur_pos/2, %#m_object_rw.cur_pos 
	 set_start_pos/2, set_start_pos_direct/2, get_start_pos/1, get_start_pos/2, %#m_object_rw.start_pos 
	 set_dest_pos/2, set_dest_pos_direct/2, get_dest_pos/1, get_dest_pos/2, %#m_object_rw.dest_pos 
	 set_face/2, set_face_direct/2, get_face/1, get_face/2, %#m_object_rw.face 
	 set_dir/2, set_dir_direct/2, get_dir/1, get_dir/2, %#m_object_rw.dir 
	 set_move_start_time/2, set_move_start_time_direct/2, get_move_start_time/1, get_move_start_time/2, %#m_object_rw.move_start_time 
	 set_seg_move_time/2, set_seg_move_time_direct/2, get_seg_move_time/1, get_seg_move_time/2, %#m_object_rw.seg_move_time 
	 set_force_stopped/2, set_force_stopped_direct/2, get_force_stopped/1, get_force_stopped/2, %#m_object_rw.force_stopped 
	 set_move_path_list/2, set_move_path_list_direct/2, get_move_path_list/1, get_move_path_list/2, %#m_object_rw.move_path_list 
	 set_born_pos/2, set_born_pos_direct/2, get_born_pos/1, get_born_pos/2, %#m_object_rw.born_pos 
	 set_battle_in_time/2, set_battle_in_time_direct/2, get_battle_in_time/1, get_battle_in_time/2, %#m_object_rw.battle_in_time 
	 set_hp/2, set_hp_direct/2, get_hp/1, get_hp/2, %#m_object_rw.hp 
	 set_max_hp/2, set_max_hp_direct/2, get_max_hp/1, get_max_hp/2, %#m_object_rw.max_hp 
	 set_battle_props/2, set_battle_props_direct/2, get_battle_props/1, get_battle_props/2, %#m_object_rw.battle_props 
	 set_buff_list/2, set_buff_list_direct/2, get_buff_list/1, get_buff_list/2, %#m_object_rw.buff_list 
	 set_ai_state/2, set_ai_state_direct/2, get_ai_state/1, get_ai_state/2, %#m_object_rw.ai_state 
	 set_pre_ai_state/2, set_pre_ai_state_direct/2, get_pre_ai_state/1, get_pre_ai_state/2, %#m_object_rw.pre_ai_state 
	 set_ai_transition/2, set_ai_transition_direct/2, get_ai_transition/1, get_ai_transition/2, %#m_object_rw.ai_transition 
	 set_ai_triggers/2, set_ai_triggers_direct/2, get_ai_triggers/1, get_ai_triggers/2, %#m_object_rw.ai_triggers 
	 set_ai_pause/2, set_ai_pause_direct/2, get_ai_pause/1, get_ai_pause/2, %#m_object_rw.ai_pause 
	 set_ai_id/2, set_ai_id_direct/2, get_ai_id/1, get_ai_id/2, %#m_object_rw.ai_id 
	 set_ai_wp_list/2, set_ai_wp_list_direct/2, get_ai_wp_list/1, get_ai_wp_list/2, %#m_object_rw.ai_wp_list 
	 set_ai_wp_num/2, set_ai_wp_num_direct/2, get_ai_wp_num/1, get_ai_wp_num/2, %#m_object_rw.ai_wp_num 
	 set_ai_wp_idx/2, set_ai_wp_idx_direct/2, get_ai_wp_idx/1, get_ai_wp_idx/2, %#m_object_rw.ai_wp_idx 
	 set_ai_is_reverse_patrol/2, set_ai_is_reverse_patrol_direct/2, get_ai_is_reverse_patrol/1, get_ai_is_reverse_patrol/2, %#m_object_rw.ai_is_reverse_patrol 
	 set_ai_is_patrol/2, set_ai_is_patrol_direct/2, get_ai_is_patrol/1, get_ai_is_patrol/2, %#m_object_rw.ai_is_patrol 
	 set_ai_patrol_rest_tick/2, set_ai_patrol_rest_tick_direct/2, get_ai_patrol_rest_tick/1, get_ai_patrol_rest_tick/2, %#m_object_rw.ai_patrol_rest_tick 
	 set_ai_look_for_target_tick/2, set_ai_look_for_target_tick_direct/2, get_ai_look_for_target_tick/1, get_ai_look_for_target_tick/2, %#m_object_rw.ai_look_for_target_tick 
	 set_ai_pursue_tar_pos/2, set_ai_pursue_tar_pos_direct/2, get_ai_pursue_tar_pos/1, get_ai_pursue_tar_pos/2, %#m_object_rw.ai_pursue_tar_pos 
	 set_ai_pursue_failed/2, set_ai_pursue_failed_direct/2, get_ai_pursue_failed/1, get_ai_pursue_failed/2, %#m_object_rw.ai_pursue_failed 
	 set_ai_cant_pursue/2, set_ai_cant_pursue_direct/2, get_ai_cant_pursue/1, get_ai_cant_pursue/2, %#m_object_rw.ai_cant_pursue 
	 set_ai_check_pursue_tick/2, set_ai_check_pursue_tick_direct/2, get_ai_check_pursue_tick/1, get_ai_check_pursue_tick/2, %#m_object_rw.ai_check_pursue_tick 
	 set_ai_target_uid/2, set_ai_target_uid_direct/2, get_ai_target_uid/1, get_ai_target_uid/2, %#m_object_rw.ai_target_uid 
	 set_ai_enter_combat_time/2, set_ai_enter_combat_time_direct/2, get_ai_enter_combat_time/1, get_ai_enter_combat_time/2, %#m_object_rw.ai_enter_combat_time 
	 set_ai_enter_combat_pos/2, set_ai_enter_combat_pos_direct/2, get_ai_enter_combat_pos/1, get_ai_enter_combat_pos/2, %#m_object_rw.ai_enter_combat_pos 
	 set_ai_use_skill_id/2, set_ai_use_skill_id_direct/2, get_ai_use_skill_id/1, get_ai_use_skill_id/2, %#m_object_rw.ai_use_skill_id 
	 set_ai_attack_wait_tick/2, set_ai_attack_wait_tick_direct/2, get_ai_attack_wait_tick/1, get_ai_attack_wait_tick/2, %#m_object_rw.ai_attack_wait_tick 
	 set_ai_skill_serial/2, set_ai_skill_serial_direct/2, get_ai_skill_serial/1, get_ai_skill_serial/2, %#m_object_rw.ai_skill_serial 
	 set_ai_flee_dst/2, set_ai_flee_dst_direct/2, get_ai_flee_dst/1, get_ai_flee_dst/2, %#m_object_rw.ai_flee_dst 
	 set_ai_flee_dir/2, set_ai_flee_dir_direct/2, get_ai_flee_dir/1, get_ai_flee_dir/2, %#m_object_rw.ai_flee_dir 
	 set_ai_flee_tick/2, set_ai_flee_tick_direct/2, get_ai_flee_tick/1, get_ai_flee_tick/2, %#m_object_rw.ai_flee_tick 
	 set_ai_is_arrived_flee_pos/2, set_ai_is_arrived_flee_pos_direct/2, get_ai_is_arrived_flee_pos/1, get_ai_is_arrived_flee_pos/2, %#m_object_rw.ai_is_arrived_flee_pos 
	 set_ai_arrived_return_pos/2, set_ai_arrived_return_pos_direct/2, get_ai_arrived_return_pos/1, get_ai_arrived_return_pos/2, %#m_object_rw.ai_arrived_return_pos 
	 set_enmity_list/2, set_enmity_list_direct/2, get_enmity_list/1, get_enmity_list/2, %#m_object_rw.enmity_list 
	 set_max_enmity_uid/2, set_max_enmity_uid_direct/2, get_max_enmity_uid/1, get_max_enmity_uid/2, %#m_object_rw.max_enmity_uid 
	 set_ai_lock_target_tick/2, set_ai_lock_target_tick_direct/2, get_ai_lock_target_tick/1, get_ai_lock_target_tick/2, %#m_object_rw.ai_lock_target_tick 
	 set_no_inc_enmity_tick/2, set_no_inc_enmity_tick_direct/2, get_no_inc_enmity_tick/1, get_no_inc_enmity_tick/2, %#m_object_rw.no_inc_enmity_tick 
%%-------------------------------------------------------------------
	init/1, del/1, exists/1, get/1, set_fields/2, set_fields_direct/2 
]).
%%-------------------------------------------------------------------

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
init(Uid)when is_number(Uid)-> init(#m_object_rw{uid = Uid});
init(#m_object_rw{}=V) -> misc_ets:write(i_ets(), V).
%%
del(Uid) -> misc_ets:delete(i_ets(), Uid).
%%
exists(Uid) -> misc_ets:member(i_ets(), Uid).
get(Uid) ->
    case misc_ets:read(i_ets(), Uid) of
        []  -> undefined;
        [R] -> R
    end.
%%-------------------------------------------------------------------

set_fields(_Uid,[]) -> ok;
set_fields(Uid,FieldList) ->
    misc_ets:update_element(
        i_ets(), Uid, FieldList),
    i_set_fields(Uid,FieldList),
    ok.
set_fields_direct(_Uid,[]) -> ok;
set_fields_direct(Uid,FieldList) ->
    misc_ets:update_element(
        i_ets(), Uid, FieldList),
    ok.
%%-------------------------------------------------------------------
i_ets() -> map_rw:detail_ets().

i_set_fields(_Uid,[]) ->
    ok;
i_set_fields(Uid,[FieldTuple | FieldList]) ->
    ?TRY_CATCH(hook_map:on_rw_update(Uid, FieldTuple)),
    i_set_fields(Uid, FieldList).
%%-------------------------------------------------------------------
%% #m_object_rw.uid
get_uid(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.uid).

get_uid(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.uid) of
        undefined -> Def;
        Any -> Any
    end.
    
set_uid(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.uid, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.uid, Val})).
set_uid_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.uid, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.pid
get_pid(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.pid).

get_pid(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.pid) of
        undefined -> Def;
        Any -> Any
    end.
    
set_pid(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.pid, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.pid, Val})).
set_pid_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.pid, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.data_id
get_data_id(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.data_id).

get_data_id(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.data_id) of
        undefined -> Def;
        Any -> Any
    end.
    
set_data_id(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.data_id, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.data_id, Val})).
set_data_id_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.data_id, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.group
get_group(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.group).

get_group(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.group) of
        undefined -> Def;
        Any -> Any
    end.
    
set_group(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.group, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.group, Val})).
set_group_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.group, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.owner
get_owner(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.owner).

get_owner(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.owner) of
        undefined -> Def;
        Any -> Any
    end.
    
set_owner(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.owner, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.owner, Val})).
set_owner_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.owner, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.type
get_type(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.type).

get_type(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.type) of
        undefined -> Def;
        Any -> Any
    end.
    
set_type(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.type, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.type, Val})).
set_type_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.type, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.level
get_level(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.level).

get_level(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.level) of
        undefined -> Def;
        Any -> Any
    end.
    
set_level(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.level, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.level, Val})).
set_level_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.level, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.name
get_name(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.name).

get_name(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.name) of
        undefined -> Def;
        Any -> Any
    end.
    
set_name(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.name, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.name, Val})).
set_name_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.name, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.sex
get_sex(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.sex).

get_sex(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.sex) of
        undefined -> Def;
        Any -> Any
    end.
    
set_sex(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.sex, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.sex, Val})).
set_sex_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.sex, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.career
get_career(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.career).

get_career(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.career) of
        undefined -> Def;
        Any -> Any
    end.
    
set_career(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.career, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.career, Val})).
set_career_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.career, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.race
get_race(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.race).

get_race(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.race) of
        undefined -> Def;
        Any -> Any
    end.
    
set_race(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.race, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.race, Val})).
set_race_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.race, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.camp
get_camp(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.camp).

get_camp(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.camp) of
        undefined -> Def;
        Any -> Any
    end.
    
set_camp(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.camp, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.camp, Val})).
set_camp_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.camp, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.state
get_state(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.state).

get_state(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.state) of
        undefined -> Def;
        Any -> Any
    end.
    
set_state(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.state, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.state, Val})).
set_state_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.state, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.move_speed
get_move_speed(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.move_speed).

get_move_speed(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.move_speed) of
        undefined -> Def;
        Any -> Any
    end.
    
set_move_speed(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.move_speed, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.move_speed, Val})).
set_move_speed_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.move_speed, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.cur_move
get_cur_move(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.cur_move).

get_cur_move(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.cur_move) of
        undefined -> Def;
        Any -> Any
    end.
    
set_cur_move(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.cur_move, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.cur_move, Val})).
set_cur_move_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.cur_move, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.next_move
get_next_move(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.next_move).

get_next_move(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.next_move) of
        undefined -> Def;
        Any -> Any
    end.
    
set_next_move(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.next_move, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.next_move, Val})).
set_next_move_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.next_move, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.vis_tile_idx
get_vis_tile_idx(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.vis_tile_idx).

get_vis_tile_idx(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.vis_tile_idx) of
        undefined -> Def;
        Any -> Any
    end.
    
set_vis_tile_idx(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.vis_tile_idx, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.vis_tile_idx, Val})).
set_vis_tile_idx_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.vis_tile_idx, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.cur_pos
get_cur_pos(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.cur_pos).

get_cur_pos(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.cur_pos) of
        undefined -> Def;
        Any -> Any
    end.
    
set_cur_pos(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.cur_pos, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.cur_pos, Val})).
set_cur_pos_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.cur_pos, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.start_pos
get_start_pos(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.start_pos).

get_start_pos(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.start_pos) of
        undefined -> Def;
        Any -> Any
    end.
    
set_start_pos(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.start_pos, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.start_pos, Val})).
set_start_pos_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.start_pos, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.dest_pos
get_dest_pos(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.dest_pos).

get_dest_pos(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.dest_pos) of
        undefined -> Def;
        Any -> Any
    end.
    
set_dest_pos(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.dest_pos, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.dest_pos, Val})).
set_dest_pos_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.dest_pos, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.face
get_face(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.face).

get_face(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.face) of
        undefined -> Def;
        Any -> Any
    end.
    
set_face(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.face, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.face, Val})).
set_face_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.face, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.dir
get_dir(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.dir).

get_dir(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.dir) of
        undefined -> Def;
        Any -> Any
    end.
    
set_dir(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.dir, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.dir, Val})).
set_dir_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.dir, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.move_start_time
get_move_start_time(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.move_start_time).

get_move_start_time(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.move_start_time) of
        undefined -> Def;
        Any -> Any
    end.
    
set_move_start_time(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.move_start_time, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.move_start_time, Val})).
set_move_start_time_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.move_start_time, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.seg_move_time
get_seg_move_time(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.seg_move_time).

get_seg_move_time(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.seg_move_time) of
        undefined -> Def;
        Any -> Any
    end.
    
set_seg_move_time(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.seg_move_time, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.seg_move_time, Val})).
set_seg_move_time_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.seg_move_time, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.force_stopped
get_force_stopped(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.force_stopped).

get_force_stopped(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.force_stopped) of
        undefined -> Def;
        Any -> Any
    end.
    
set_force_stopped(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.force_stopped, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.force_stopped, Val})).
set_force_stopped_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.force_stopped, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.move_path_list
get_move_path_list(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.move_path_list).

get_move_path_list(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.move_path_list) of
        undefined -> Def;
        Any -> Any
    end.
    
set_move_path_list(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.move_path_list, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.move_path_list, Val})).
set_move_path_list_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.move_path_list, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.born_pos
get_born_pos(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.born_pos).

get_born_pos(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.born_pos) of
        undefined -> Def;
        Any -> Any
    end.
    
set_born_pos(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.born_pos, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.born_pos, Val})).
set_born_pos_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.born_pos, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.battle_in_time
get_battle_in_time(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.battle_in_time).

get_battle_in_time(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.battle_in_time) of
        undefined -> Def;
        Any -> Any
    end.
    
set_battle_in_time(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.battle_in_time, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.battle_in_time, Val})).
set_battle_in_time_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.battle_in_time, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.hp
get_hp(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.hp).

get_hp(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.hp) of
        undefined -> Def;
        Any -> Any
    end.
    
set_hp(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.hp, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.hp, Val})).
set_hp_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.hp, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.max_hp
get_max_hp(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.max_hp).

get_max_hp(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.max_hp) of
        undefined -> Def;
        Any -> Any
    end.
    
set_max_hp(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.max_hp, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.max_hp, Val})).
set_max_hp_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.max_hp, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.battle_props
get_battle_props(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.battle_props).

get_battle_props(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.battle_props) of
        undefined -> Def;
        Any -> Any
    end.
    
set_battle_props(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.battle_props, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.battle_props, Val})).
set_battle_props_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.battle_props, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.buff_list
get_buff_list(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.buff_list).

get_buff_list(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.buff_list) of
        undefined -> Def;
        Any -> Any
    end.
    
set_buff_list(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.buff_list, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.buff_list, Val})).
set_buff_list_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.buff_list, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_state
get_ai_state(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_state).

get_ai_state(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_state) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_state(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_state, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_state, Val})).
set_ai_state_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_state, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.pre_ai_state
get_pre_ai_state(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.pre_ai_state).

get_pre_ai_state(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.pre_ai_state) of
        undefined -> Def;
        Any -> Any
    end.
    
set_pre_ai_state(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.pre_ai_state, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.pre_ai_state, Val})).
set_pre_ai_state_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.pre_ai_state, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_transition
get_ai_transition(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_transition).

get_ai_transition(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_transition) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_transition(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_transition, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_transition, Val})).
set_ai_transition_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_transition, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_triggers
get_ai_triggers(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_triggers).

get_ai_triggers(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_triggers) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_triggers(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_triggers, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_triggers, Val})).
set_ai_triggers_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_triggers, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_pause
get_ai_pause(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_pause).

get_ai_pause(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_pause) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_pause(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_pause, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_pause, Val})).
set_ai_pause_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_pause, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_id
get_ai_id(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_id).

get_ai_id(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_id) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_id(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_id, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_id, Val})).
set_ai_id_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_id, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_wp_list
get_ai_wp_list(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_wp_list).

get_ai_wp_list(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_wp_list) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_wp_list(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_wp_list, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_wp_list, Val})).
set_ai_wp_list_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_wp_list, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_wp_num
get_ai_wp_num(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_wp_num).

get_ai_wp_num(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_wp_num) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_wp_num(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_wp_num, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_wp_num, Val})).
set_ai_wp_num_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_wp_num, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_wp_idx
get_ai_wp_idx(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_wp_idx).

get_ai_wp_idx(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_wp_idx) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_wp_idx(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_wp_idx, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_wp_idx, Val})).
set_ai_wp_idx_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_wp_idx, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_is_reverse_patrol
get_ai_is_reverse_patrol(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_is_reverse_patrol).

get_ai_is_reverse_patrol(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_is_reverse_patrol) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_is_reverse_patrol(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_is_reverse_patrol, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_is_reverse_patrol, Val})).
set_ai_is_reverse_patrol_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_is_reverse_patrol, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_is_patrol
get_ai_is_patrol(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_is_patrol).

get_ai_is_patrol(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_is_patrol) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_is_patrol(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_is_patrol, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_is_patrol, Val})).
set_ai_is_patrol_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_is_patrol, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_patrol_rest_tick
get_ai_patrol_rest_tick(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_patrol_rest_tick).

get_ai_patrol_rest_tick(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_patrol_rest_tick) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_patrol_rest_tick(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_patrol_rest_tick, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_patrol_rest_tick, Val})).
set_ai_patrol_rest_tick_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_patrol_rest_tick, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_look_for_target_tick
get_ai_look_for_target_tick(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_look_for_target_tick).

get_ai_look_for_target_tick(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_look_for_target_tick) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_look_for_target_tick(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_look_for_target_tick, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_look_for_target_tick, Val})).
set_ai_look_for_target_tick_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_look_for_target_tick, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_pursue_tar_pos
get_ai_pursue_tar_pos(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_pursue_tar_pos).

get_ai_pursue_tar_pos(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_pursue_tar_pos) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_pursue_tar_pos(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_pursue_tar_pos, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_pursue_tar_pos, Val})).
set_ai_pursue_tar_pos_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_pursue_tar_pos, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_pursue_failed
get_ai_pursue_failed(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_pursue_failed).

get_ai_pursue_failed(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_pursue_failed) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_pursue_failed(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_pursue_failed, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_pursue_failed, Val})).
set_ai_pursue_failed_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_pursue_failed, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_cant_pursue
get_ai_cant_pursue(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_cant_pursue).

get_ai_cant_pursue(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_cant_pursue) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_cant_pursue(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_cant_pursue, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_cant_pursue, Val})).
set_ai_cant_pursue_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_cant_pursue, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_check_pursue_tick
get_ai_check_pursue_tick(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_check_pursue_tick).

get_ai_check_pursue_tick(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_check_pursue_tick) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_check_pursue_tick(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_check_pursue_tick, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_check_pursue_tick, Val})).
set_ai_check_pursue_tick_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_check_pursue_tick, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_target_uid
get_ai_target_uid(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_target_uid).

get_ai_target_uid(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_target_uid) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_target_uid(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_target_uid, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_target_uid, Val})).
set_ai_target_uid_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_target_uid, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_enter_combat_time
get_ai_enter_combat_time(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_enter_combat_time).

get_ai_enter_combat_time(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_enter_combat_time) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_enter_combat_time(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_enter_combat_time, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_enter_combat_time, Val})).
set_ai_enter_combat_time_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_enter_combat_time, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_enter_combat_pos
get_ai_enter_combat_pos(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_enter_combat_pos).

get_ai_enter_combat_pos(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_enter_combat_pos) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_enter_combat_pos(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_enter_combat_pos, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_enter_combat_pos, Val})).
set_ai_enter_combat_pos_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_enter_combat_pos, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_use_skill_id
get_ai_use_skill_id(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_use_skill_id).

get_ai_use_skill_id(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_use_skill_id) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_use_skill_id(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_use_skill_id, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_use_skill_id, Val})).
set_ai_use_skill_id_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_use_skill_id, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_attack_wait_tick
get_ai_attack_wait_tick(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_attack_wait_tick).

get_ai_attack_wait_tick(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_attack_wait_tick) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_attack_wait_tick(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_attack_wait_tick, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_attack_wait_tick, Val})).
set_ai_attack_wait_tick_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_attack_wait_tick, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_skill_serial
get_ai_skill_serial(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_skill_serial).

get_ai_skill_serial(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_skill_serial) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_skill_serial(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_skill_serial, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_skill_serial, Val})).
set_ai_skill_serial_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_skill_serial, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_flee_dst
get_ai_flee_dst(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_flee_dst).

get_ai_flee_dst(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_flee_dst) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_flee_dst(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_flee_dst, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_flee_dst, Val})).
set_ai_flee_dst_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_flee_dst, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_flee_dir
get_ai_flee_dir(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_flee_dir).

get_ai_flee_dir(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_flee_dir) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_flee_dir(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_flee_dir, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_flee_dir, Val})).
set_ai_flee_dir_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_flee_dir, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_flee_tick
get_ai_flee_tick(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_flee_tick).

get_ai_flee_tick(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_flee_tick) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_flee_tick(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_flee_tick, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_flee_tick, Val})).
set_ai_flee_tick_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_flee_tick, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_is_arrived_flee_pos
get_ai_is_arrived_flee_pos(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_is_arrived_flee_pos).

get_ai_is_arrived_flee_pos(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_is_arrived_flee_pos) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_is_arrived_flee_pos(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_is_arrived_flee_pos, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_is_arrived_flee_pos, Val})).
set_ai_is_arrived_flee_pos_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_is_arrived_flee_pos, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_arrived_return_pos
get_ai_arrived_return_pos(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_arrived_return_pos).

get_ai_arrived_return_pos(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_arrived_return_pos) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_arrived_return_pos(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_arrived_return_pos, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_arrived_return_pos, Val})).
set_ai_arrived_return_pos_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_arrived_return_pos, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.enmity_list
get_enmity_list(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.enmity_list).

get_enmity_list(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.enmity_list) of
        undefined -> Def;
        Any -> Any
    end.
    
set_enmity_list(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.enmity_list, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.enmity_list, Val})).
set_enmity_list_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.enmity_list, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.max_enmity_uid
get_max_enmity_uid(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.max_enmity_uid).

get_max_enmity_uid(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.max_enmity_uid) of
        undefined -> Def;
        Any -> Any
    end.
    
set_max_enmity_uid(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.max_enmity_uid, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.max_enmity_uid, Val})).
set_max_enmity_uid_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.max_enmity_uid, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.ai_lock_target_tick
get_ai_lock_target_tick(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_lock_target_tick).

get_ai_lock_target_tick(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.ai_lock_target_tick) of
        undefined -> Def;
        Any -> Any
    end.
    
set_ai_lock_target_tick(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_lock_target_tick, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.ai_lock_target_tick, Val})).
set_ai_lock_target_tick_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.ai_lock_target_tick, Val}),
    ok.
%%-------------------------------------------------------------------
%% #m_object_rw.no_inc_enmity_tick
get_no_inc_enmity_tick(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.no_inc_enmity_tick).

get_no_inc_enmity_tick(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.no_inc_enmity_tick) of
        undefined -> Def;
        Any -> Any
    end.
    
set_no_inc_enmity_tick(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.no_inc_enmity_tick, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid,{#m_object_rw.no_inc_enmity_tick, Val})).
set_no_inc_enmity_tick_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.no_inc_enmity_tick, Val}),
    ok.
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
