%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(combat_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
	get_skill_id/1,get_skill_id_def/2,set_skill_id/2, % #m_combat_rw.skill_id
	get_target_uid/1,get_target_uid_def/2,set_target_uid/2, % #m_combat_rw.target_uid
	get_skill_serial/1,get_skill_serial_def/2,set_skill_serial/2, % #m_combat_rw.skill_serial
	get_persist_pos/1,get_persist_pos_def/2,set_persist_pos/2, % #m_combat_rw.persist_pos
	get_cur_dmg_index/1,get_cur_dmg_index_def/2,set_cur_dmg_index/2, % #m_combat_rw.cur_dmg_index
	get_operate_time/1,get_operate_time_def/2,set_operate_time/2, % #m_combat_rw.operate_time
	get_spell_time/1,get_spell_time_def/2,set_spell_time/2, % #m_combat_rw.spell_time
	get_channel_cd/1,get_channel_cd_def/2,set_channel_cd/2, % #m_combat_rw.channel_cd
	get_skill_queue/1,get_skill_queue_def/2,set_skill_queue/2, % #m_combat_rw.skill_queue
	% common function 
	del/1,to_record/1,set/2,set_fields/2,init_default/1,init_default/2
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_combat_rw.skill_id
get_skill_id(Uid)-> get_skill_id_def(Uid,undefined).

get_skill_id_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.skill_id 
	end.

set_skill_id(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{skill_id = V}).

%%-------------------------------------------------------------------
%% #m_combat_rw.target_uid
get_target_uid(Uid)-> get_target_uid_def(Uid,undefined).

get_target_uid_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.target_uid 
	end.

set_target_uid(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{target_uid = V}).

%%-------------------------------------------------------------------
%% #m_combat_rw.skill_serial
get_skill_serial(Uid)-> get_skill_serial_def(Uid,undefined).

get_skill_serial_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.skill_serial 
	end.

set_skill_serial(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{skill_serial = V}).

%%-------------------------------------------------------------------
%% #m_combat_rw.persist_pos
get_persist_pos(Uid)-> get_persist_pos_def(Uid,undefined).

get_persist_pos_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.persist_pos 
	end.

set_persist_pos(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{persist_pos = V}).

%%-------------------------------------------------------------------
%% #m_combat_rw.cur_dmg_index
get_cur_dmg_index(Uid)-> get_cur_dmg_index_def(Uid,undefined).

get_cur_dmg_index_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.cur_dmg_index 
	end.

set_cur_dmg_index(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{cur_dmg_index = V}).

%%-------------------------------------------------------------------
%% #m_combat_rw.operate_time
get_operate_time(Uid)-> get_operate_time_def(Uid,undefined).

get_operate_time_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.operate_time 
	end.

set_operate_time(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{operate_time = V}).

%%-------------------------------------------------------------------
%% #m_combat_rw.spell_time
get_spell_time(Uid)-> get_spell_time_def(Uid,undefined).

get_spell_time_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.spell_time 
	end.

set_spell_time(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{spell_time = V}).

%%-------------------------------------------------------------------
%% #m_combat_rw.channel_cd
get_channel_cd(Uid)-> get_channel_cd_def(Uid,undefined).

get_channel_cd_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.channel_cd 
	end.

set_channel_cd(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{channel_cd = V}).

%%-------------------------------------------------------------------
%% #m_combat_rw.skill_queue
get_skill_queue(Uid)-> get_skill_queue_def(Uid,undefined).

get_skill_queue_def(Uid,Def)->
	case erlang:get({Uid,m_combat_rw}) of
	undefined -> Def; 
	V -> V#m_combat_rw.skill_queue 
	end.

set_skill_queue(Uid,V)->
	R = erlang:get({Uid,m_combat_rw}),
	erlang:put({Uid,m_combat_rw}, R#m_combat_rw{skill_queue = V}).

%%-------------------------------------------------------------------
del(Uid)-> erlang:erase({Uid,m_combat_rw}).

%%-------------------------------------------------------------------
to_record(Uid)-> erlang:get({Uid,m_combat_rw}).

%%-------------------------------------------------------------------
set(Uid,#m_combat_rw{}=V)->
	erlang:put({Uid,m_combat_rw}, V).

%%-------------------------------------------------------------------
init_default(Uid)-> erlang:put({Uid,m_combat_rw}, #m_combat_rw{}).
init_default(Uid,#m_combat_rw{}=V) -> erlang:put({Uid,m_combat_rw}, V).

%%-------------------------------------------------------------------
set_fields(_Uid,[]) ->ok;
set_fields(Uid,FieldList) ->
	R1 = erlang:get({Uid,m_combat_rw}),
	R2 = i_set_fields(Uid,FieldList,R1),
	erlang:put({Uid,m_combat_rw}, R2),
	ok.

%%-------------------------------------------------------------------
i_set_fields(_Uid,R, []) ->
	R;
i_set_fields(Uid,R, [H | FieldList]) ->
	i_set_fields(Uid,i_set_field(Uid,R,H), FieldList).

%%#m_combat_rw.skill_id
i_set_field(_Uid,{skill_id, Val}, R) ->
	R#m_combat_rw{skill_id = Val};
i_set_field(_Uid,{skill_id, Val, add}, R) ->
	R#m_combat_rw{skill_id = R#m_combat_rw.skill_id + Val};
i_set_field(_Uid,{skill_id, Val, sub}, R) ->
	R#m_combat_rw{skill_id = R#m_combat_rw.skill_id - Val};
i_set_field(_Uid,{#m_combat_rw.skill_id, Val}, R) ->
	R#m_combat_rw{skill_id = Val};
i_set_field(_Uid,{#m_combat_rw.skill_id, Val, add}, R) ->
	R#m_combat_rw{skill_id = R#m_combat_rw.skill_id + Val};
i_set_field(_Uid,{#m_combat_rw.skill_id, Val, sub}, R) ->
	R#m_combat_rw{skill_id = R#m_combat_rw.skill_id - Val};
%%#m_combat_rw.target_uid
i_set_field(_Uid,{target_uid, Val}, R) ->
	R#m_combat_rw{target_uid = Val};
i_set_field(_Uid,{target_uid, Val, add}, R) ->
	R#m_combat_rw{target_uid = R#m_combat_rw.target_uid + Val};
i_set_field(_Uid,{target_uid, Val, sub}, R) ->
	R#m_combat_rw{target_uid = R#m_combat_rw.target_uid - Val};
i_set_field(_Uid,{#m_combat_rw.target_uid, Val}, R) ->
	R#m_combat_rw{target_uid = Val};
i_set_field(_Uid,{#m_combat_rw.target_uid, Val, add}, R) ->
	R#m_combat_rw{target_uid = R#m_combat_rw.target_uid + Val};
i_set_field(_Uid,{#m_combat_rw.target_uid, Val, sub}, R) ->
	R#m_combat_rw{target_uid = R#m_combat_rw.target_uid - Val};
%%#m_combat_rw.skill_serial
i_set_field(_Uid,{skill_serial, Val}, R) ->
	R#m_combat_rw{skill_serial = Val};
i_set_field(_Uid,{skill_serial, Val, add}, R) ->
	R#m_combat_rw{skill_serial = R#m_combat_rw.skill_serial + Val};
i_set_field(_Uid,{skill_serial, Val, sub}, R) ->
	R#m_combat_rw{skill_serial = R#m_combat_rw.skill_serial - Val};
i_set_field(_Uid,{#m_combat_rw.skill_serial, Val}, R) ->
	R#m_combat_rw{skill_serial = Val};
i_set_field(_Uid,{#m_combat_rw.skill_serial, Val, add}, R) ->
	R#m_combat_rw{skill_serial = R#m_combat_rw.skill_serial + Val};
i_set_field(_Uid,{#m_combat_rw.skill_serial, Val, sub}, R) ->
	R#m_combat_rw{skill_serial = R#m_combat_rw.skill_serial - Val};
%%#m_combat_rw.persist_pos
i_set_field(_Uid,{persist_pos, Val}, R) ->
	R#m_combat_rw{persist_pos = Val};
i_set_field(_Uid,{persist_pos, Val, add}, R) ->
	R#m_combat_rw{persist_pos = R#m_combat_rw.persist_pos + Val};
i_set_field(_Uid,{persist_pos, Val, sub}, R) ->
	R#m_combat_rw{persist_pos = R#m_combat_rw.persist_pos - Val};
i_set_field(_Uid,{#m_combat_rw.persist_pos, Val}, R) ->
	R#m_combat_rw{persist_pos = Val};
i_set_field(_Uid,{#m_combat_rw.persist_pos, Val, add}, R) ->
	R#m_combat_rw{persist_pos = R#m_combat_rw.persist_pos + Val};
i_set_field(_Uid,{#m_combat_rw.persist_pos, Val, sub}, R) ->
	R#m_combat_rw{persist_pos = R#m_combat_rw.persist_pos - Val};
%%#m_combat_rw.cur_dmg_index
i_set_field(_Uid,{cur_dmg_index, Val}, R) ->
	R#m_combat_rw{cur_dmg_index = Val};
i_set_field(_Uid,{cur_dmg_index, Val, add}, R) ->
	R#m_combat_rw{cur_dmg_index = R#m_combat_rw.cur_dmg_index + Val};
i_set_field(_Uid,{cur_dmg_index, Val, sub}, R) ->
	R#m_combat_rw{cur_dmg_index = R#m_combat_rw.cur_dmg_index - Val};
i_set_field(_Uid,{#m_combat_rw.cur_dmg_index, Val}, R) ->
	R#m_combat_rw{cur_dmg_index = Val};
i_set_field(_Uid,{#m_combat_rw.cur_dmg_index, Val, add}, R) ->
	R#m_combat_rw{cur_dmg_index = R#m_combat_rw.cur_dmg_index + Val};
i_set_field(_Uid,{#m_combat_rw.cur_dmg_index, Val, sub}, R) ->
	R#m_combat_rw{cur_dmg_index = R#m_combat_rw.cur_dmg_index - Val};
%%#m_combat_rw.operate_time
i_set_field(_Uid,{operate_time, Val}, R) ->
	R#m_combat_rw{operate_time = Val};
i_set_field(_Uid,{operate_time, Val, add}, R) ->
	R#m_combat_rw{operate_time = R#m_combat_rw.operate_time + Val};
i_set_field(_Uid,{operate_time, Val, sub}, R) ->
	R#m_combat_rw{operate_time = R#m_combat_rw.operate_time - Val};
i_set_field(_Uid,{#m_combat_rw.operate_time, Val}, R) ->
	R#m_combat_rw{operate_time = Val};
i_set_field(_Uid,{#m_combat_rw.operate_time, Val, add}, R) ->
	R#m_combat_rw{operate_time = R#m_combat_rw.operate_time + Val};
i_set_field(_Uid,{#m_combat_rw.operate_time, Val, sub}, R) ->
	R#m_combat_rw{operate_time = R#m_combat_rw.operate_time - Val};
%%#m_combat_rw.spell_time
i_set_field(_Uid,{spell_time, Val}, R) ->
	R#m_combat_rw{spell_time = Val};
i_set_field(_Uid,{spell_time, Val, add}, R) ->
	R#m_combat_rw{spell_time = R#m_combat_rw.spell_time + Val};
i_set_field(_Uid,{spell_time, Val, sub}, R) ->
	R#m_combat_rw{spell_time = R#m_combat_rw.spell_time - Val};
i_set_field(_Uid,{#m_combat_rw.spell_time, Val}, R) ->
	R#m_combat_rw{spell_time = Val};
i_set_field(_Uid,{#m_combat_rw.spell_time, Val, add}, R) ->
	R#m_combat_rw{spell_time = R#m_combat_rw.spell_time + Val};
i_set_field(_Uid,{#m_combat_rw.spell_time, Val, sub}, R) ->
	R#m_combat_rw{spell_time = R#m_combat_rw.spell_time - Val};
%%#m_combat_rw.channel_cd
i_set_field(_Uid,{channel_cd, Val}, R) ->
	R#m_combat_rw{channel_cd = Val};
i_set_field(_Uid,{channel_cd, Val, add}, R) ->
	R#m_combat_rw{channel_cd = R#m_combat_rw.channel_cd + Val};
i_set_field(_Uid,{channel_cd, Val, sub}, R) ->
	R#m_combat_rw{channel_cd = R#m_combat_rw.channel_cd - Val};
i_set_field(_Uid,{#m_combat_rw.channel_cd, Val}, R) ->
	R#m_combat_rw{channel_cd = Val};
i_set_field(_Uid,{#m_combat_rw.channel_cd, Val, add}, R) ->
	R#m_combat_rw{channel_cd = R#m_combat_rw.channel_cd + Val};
i_set_field(_Uid,{#m_combat_rw.channel_cd, Val, sub}, R) ->
	R#m_combat_rw{channel_cd = R#m_combat_rw.channel_cd - Val};
%%#m_combat_rw.skill_queue
i_set_field(_Uid,{skill_queue, Val}, R) ->
	R#m_combat_rw{skill_queue = Val};
i_set_field(_Uid,{skill_queue, Val, add}, R) ->
	R#m_combat_rw{skill_queue = R#m_combat_rw.skill_queue + Val};
i_set_field(_Uid,{skill_queue, Val, sub}, R) ->
	R#m_combat_rw{skill_queue = R#m_combat_rw.skill_queue - Val};
i_set_field(_Uid,{#m_combat_rw.skill_queue, Val}, R) ->
	R#m_combat_rw{skill_queue = Val};
i_set_field(_Uid,{#m_combat_rw.skill_queue, Val, add}, R) ->
	R#m_combat_rw{skill_queue = R#m_combat_rw.skill_queue + Val};
i_set_field(_Uid,{#m_combat_rw.skill_queue, Val, sub}, R) ->
	R#m_combat_rw{skill_queue = R#m_combat_rw.skill_queue - Val};
i_set_field(_Uid,_Elem,R)-> R.

%%-------------------------------------------------------------------
