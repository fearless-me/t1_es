%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(lib_combat_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("rw_record.hrl").
%%-------------------------------------------------------------------

-export([
	get_skill_id/1, get_skill_id_def/2, set_skill_id/2, % #m_combat_rw.skill_id
	get_target_uid/1, get_target_uid_def/2, set_target_uid/2, % #m_combat_rw.target_uid
	get_skill_serial/1, get_skill_serial_def/2, set_skill_serial/2, % #m_combat_rw.skill_serial
	get_persist_pos/1, get_persist_pos_def/2, set_persist_pos/2, % #m_combat_rw.persist_pos
	get_cur_dmg_index/1, get_cur_dmg_index_def/2, set_cur_dmg_index/2, % #m_combat_rw.cur_dmg_index
	get_operate_time/1, get_operate_time_def/2, set_operate_time/2, % #m_combat_rw.operate_time
	get_spell_time/1, get_spell_time_def/2, set_spell_time/2, % #m_combat_rw.spell_time
	get_channel_cd/1, get_channel_cd_def/2, set_channel_cd/2, % #m_combat_rw.channel_cd
	% common function 
	del/1 ,to_record/1 ,init_from/2 ,init_default/1
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_combat_rw.skill_id
get_skill_id(Uid)-> get({skill_id,Uid}).

get_skill_id_def(Uid, Def)->
	case get({skill_id,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_skill_id(Uid, V)-> put({skill_id,Uid}, V).

%%-------------------------------------------------------------------
%% #m_combat_rw.target_uid
get_target_uid(Uid)-> get({target_uid,Uid}).

get_target_uid_def(Uid, Def)->
	case get({target_uid,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_target_uid(Uid, V)-> put({target_uid,Uid}, V).

%%-------------------------------------------------------------------
%% #m_combat_rw.skill_serial
get_skill_serial(Uid)-> get({skill_serial,Uid}).

get_skill_serial_def(Uid, Def)->
	case get({skill_serial,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_skill_serial(Uid, V)-> put({skill_serial,Uid}, V).

%%-------------------------------------------------------------------
%% #m_combat_rw.persist_pos
get_persist_pos(Uid)-> get({persist_pos,Uid}).

get_persist_pos_def(Uid, Def)->
	case get({persist_pos,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_persist_pos(Uid, V)-> put({persist_pos,Uid}, V).

%%-------------------------------------------------------------------
%% #m_combat_rw.cur_dmg_index
get_cur_dmg_index(Uid)-> get({cur_dmg_index,Uid}).

get_cur_dmg_index_def(Uid, Def)->
	case get({cur_dmg_index,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_cur_dmg_index(Uid, V)-> put({cur_dmg_index,Uid}, V).

%%-------------------------------------------------------------------
%% #m_combat_rw.operate_time
get_operate_time(Uid)-> get({operate_time,Uid}).

get_operate_time_def(Uid, Def)->
	case get({operate_time,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_operate_time(Uid, V)-> put({operate_time,Uid}, V).

%%-------------------------------------------------------------------
%% #m_combat_rw.spell_time
get_spell_time(Uid)-> get({spell_time,Uid}).

get_spell_time_def(Uid, Def)->
	case get({spell_time,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_spell_time(Uid, V)-> put({spell_time,Uid}, V).

%%-------------------------------------------------------------------
%% #m_combat_rw.channel_cd
get_channel_cd(Uid)-> get({channel_cd,Uid}).

get_channel_cd_def(Uid, Def)->
	case get({channel_cd,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_channel_cd(Uid, V)-> put({channel_cd,Uid}, V).

%%-------------------------------------------------------------------
del(Uid)->
	erase({skill_id, Uid}),
	erase({target_uid, Uid}),
	erase({skill_serial, Uid}),
	erase({persist_pos, Uid}),
	erase({cur_dmg_index, Uid}),
	erase({operate_time, Uid}),
	erase({spell_time, Uid}),
	erase({channel_cd, Uid}),
	ok.
%%-------------------------------------------------------------------
to_record(Uid)->
	#m_combat_rw{
		skill_id = get_skill_id(Uid),
		target_uid = get_target_uid(Uid),
		skill_serial = get_skill_serial(Uid),
		persist_pos = get_persist_pos(Uid),
		cur_dmg_index = get_cur_dmg_index(Uid),
		operate_time = get_operate_time(Uid),
		spell_time = get_spell_time(Uid),
		channel_cd = get_channel_cd(Uid)
	}.
%%-------------------------------------------------------------------
init_from(Uid, Rec)->
	set_skill_id(Uid, Rec#m_combat_rw.skill_id),
	set_target_uid(Uid, Rec#m_combat_rw.target_uid),
	set_skill_serial(Uid, Rec#m_combat_rw.skill_serial),
	set_persist_pos(Uid, Rec#m_combat_rw.persist_pos),
	set_cur_dmg_index(Uid, Rec#m_combat_rw.cur_dmg_index),
	set_operate_time(Uid, Rec#m_combat_rw.operate_time),
	set_spell_time(Uid, Rec#m_combat_rw.spell_time),
	set_channel_cd(Uid, Rec#m_combat_rw.channel_cd),
	ok.
%%-------------------------------------------------------------------
init_default(Uid)->
	Rec = #m_combat_rw{},
	set_skill_id(Uid, Rec#m_combat_rw.skill_id),
	set_target_uid(Uid, Rec#m_combat_rw.target_uid),
	set_skill_serial(Uid, Rec#m_combat_rw.skill_serial),
	set_persist_pos(Uid, Rec#m_combat_rw.persist_pos),
	set_cur_dmg_index(Uid, Rec#m_combat_rw.cur_dmg_index),
	set_operate_time(Uid, Rec#m_combat_rw.operate_time),
	set_spell_time(Uid, Rec#m_combat_rw.spell_time),
	set_channel_cd(Uid, Rec#m_combat_rw.channel_cd),
	ok.
%%-------------------------------------------------------------------
