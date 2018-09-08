%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(unit_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
	get_pid/1, get_pid_def/2, set_pid/2, set_pid_direct/2, % #m_map_unit_rw.pid
	get_data_id/1, get_data_id_def/2, set_data_id/2, set_data_id_direct/2, % #m_map_unit_rw.data_id
	get_group/1, get_group_def/2, set_group/2, set_group_direct/2, % #m_map_unit_rw.group
	get_owner/1, get_owner_def/2, set_owner/2, set_owner_direct/2, % #m_map_unit_rw.owner
	get_type/1, get_type_def/2, set_type/2, set_type_direct/2, % #m_map_unit_rw.type
	get_hp/1, get_hp_def/2, set_hp/2, set_hp_direct/2, % #m_map_unit_rw.hp
	get_max_hp/1, get_max_hp_def/2, set_max_hp/2, set_max_hp_direct/2, % #m_map_unit_rw.max_hp
	get_attr/1, get_attr_def/2, set_attr/2, set_attr_direct/2, % #m_map_unit_rw.attr
	get_buff_list/1, get_buff_list_def/2, set_buff_list/2, set_buff_list_direct/2, % #m_map_unit_rw.buff_list
	get_skill_queue/1, get_skill_queue_def/2, set_skill_queue/2, set_skill_queue_direct/2, % #m_map_unit_rw.skill_queue
	% common function 
	del/1 ,to_record/1 ,init_from/2 ,init_default/1
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_map_unit_rw.pid
get_pid(Uid)-> get({pid,Uid}).

get_pid_def(Uid, Def)->
	case get({pid,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pid(Uid, V)->
	put({pid,Uid}, V),
	hook_map:on_rw_update(Uid, pid, V).

set_pid_direct(Uid, V)-> put({pid,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.data_id
get_data_id(Uid)-> get({data_id,Uid}).

get_data_id_def(Uid, Def)->
	case get({data_id,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_data_id(Uid, V)->
	put({data_id,Uid}, V),
	hook_map:on_rw_update(Uid, data_id, V).

set_data_id_direct(Uid, V)-> put({data_id,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.group
get_group(Uid)-> get({group,Uid}).

get_group_def(Uid, Def)->
	case get({group,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_group(Uid, V)->
	put({group,Uid}, V),
	hook_map:on_rw_update(Uid, group, V).

set_group_direct(Uid, V)-> put({group,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.owner
get_owner(Uid)-> get({owner,Uid}).

get_owner_def(Uid, Def)->
	case get({owner,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_owner(Uid, V)->
	put({owner,Uid}, V),
	hook_map:on_rw_update(Uid, owner, V).

set_owner_direct(Uid, V)-> put({owner,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.type
get_type(Uid)-> get({type,Uid}).

get_type_def(Uid, Def)->
	case get({type,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_type(Uid, V)->
	put({type,Uid}, V),
	hook_map:on_rw_update(Uid, type, V).

set_type_direct(Uid, V)-> put({type,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.hp
get_hp(Uid)-> get({hp,Uid}).

get_hp_def(Uid, Def)->
	case get({hp,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_hp(Uid, V)->
	put({hp,Uid}, V),
	hook_map:on_rw_update(Uid, hp, V).

set_hp_direct(Uid, V)-> put({hp,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.max_hp
get_max_hp(Uid)-> get({max_hp,Uid}).

get_max_hp_def(Uid, Def)->
	case get({max_hp,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_max_hp(Uid, V)->
	put({max_hp,Uid}, V),
	hook_map:on_rw_update(Uid, max_hp, V).

set_max_hp_direct(Uid, V)-> put({max_hp,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.attr
get_attr(Uid)-> get({attr,Uid}).

get_attr_def(Uid, Def)->
	case get({attr,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_attr(Uid, V)->
	put({attr,Uid}, V),
	hook_map:on_rw_update(Uid, attr, V).

set_attr_direct(Uid, V)-> put({attr,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.buff_list
get_buff_list(Uid)-> get({buff_list,Uid}).

get_buff_list_def(Uid, Def)->
	case get({buff_list,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_buff_list(Uid, V)->
	put({buff_list,Uid}, V),
	hook_map:on_rw_update(Uid, buff_list, V).

set_buff_list_direct(Uid, V)-> put({buff_list,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_rw.skill_queue
get_skill_queue(Uid)-> get({skill_queue,Uid}).

get_skill_queue_def(Uid, Def)->
	case get({skill_queue,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_skill_queue(Uid, V)->
	put({skill_queue,Uid}, V),
	hook_map:on_rw_update(Uid, skill_queue, V).

set_skill_queue_direct(Uid, V)-> put({skill_queue,Uid}, V).

%%-------------------------------------------------------------------
del(Uid)->
	erase({pid, Uid}),
	erase({data_id, Uid}),
	erase({group, Uid}),
	erase({owner, Uid}),
	erase({type, Uid}),
	erase({hp, Uid}),
	erase({max_hp, Uid}),
	erase({attr, Uid}),
	erase({buff_list, Uid}),
	erase({skill_queue, Uid}),
	ok.
%%-------------------------------------------------------------------
to_record(Uid)->
	#m_map_unit_rw{
		pid = get_pid(Uid),
		data_id = get_data_id(Uid),
		group = get_group(Uid),
		owner = get_owner(Uid),
		type = get_type(Uid),
		hp = get_hp(Uid),
		max_hp = get_max_hp(Uid),
		attr = get_attr(Uid),
		buff_list = get_buff_list(Uid),
		skill_queue = get_skill_queue(Uid)
	}.
%%-------------------------------------------------------------------
init_from(Uid, Rec)->
	set_pid_direct(Uid, Rec#m_map_unit_rw.pid),
	set_data_id_direct(Uid, Rec#m_map_unit_rw.data_id),
	set_group_direct(Uid, Rec#m_map_unit_rw.group),
	set_owner_direct(Uid, Rec#m_map_unit_rw.owner),
	set_type_direct(Uid, Rec#m_map_unit_rw.type),
	set_hp_direct(Uid, Rec#m_map_unit_rw.hp),
	set_max_hp_direct(Uid, Rec#m_map_unit_rw.max_hp),
	set_attr_direct(Uid, Rec#m_map_unit_rw.attr),
	set_buff_list_direct(Uid, Rec#m_map_unit_rw.buff_list),
	set_skill_queue_direct(Uid, Rec#m_map_unit_rw.skill_queue),
	ok.
%%-------------------------------------------------------------------
init_default(Uid)->
	Rec = #m_map_unit_rw{},
	set_pid_direct(Uid, Rec#m_map_unit_rw.pid),
	set_data_id_direct(Uid, Rec#m_map_unit_rw.data_id),
	set_group_direct(Uid, Rec#m_map_unit_rw.group),
	set_owner_direct(Uid, Rec#m_map_unit_rw.owner),
	set_type_direct(Uid, Rec#m_map_unit_rw.type),
	set_hp_direct(Uid, Rec#m_map_unit_rw.hp),
	set_max_hp_direct(Uid, Rec#m_map_unit_rw.max_hp),
	set_attr_direct(Uid, Rec#m_map_unit_rw.attr),
	set_buff_list_direct(Uid, Rec#m_map_unit_rw.buff_list),
	set_skill_queue_direct(Uid, Rec#m_map_unit_rw.skill_queue),
	ok.
%%-------------------------------------------------------------------
