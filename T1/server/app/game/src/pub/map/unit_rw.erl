%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(unit_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
	get_pid/1,get_pid_def/2,set_pid/2,set_pid_direct/2, % #m_unit_rw.pid
	get_data_id/1,get_data_id_def/2,set_data_id/2,set_data_id_direct/2, % #m_unit_rw.data_id
	get_group/1,get_group_def/2,set_group/2,set_group_direct/2, % #m_unit_rw.group
	get_owner/1,get_owner_def/2,set_owner/2,set_owner_direct/2, % #m_unit_rw.owner
	get_type/1,get_type_def/2,set_type/2,set_type_direct/2, % #m_unit_rw.type
	% common function 
	del/1,to_record/1,set/2,set_fields/2,init_default/1,init_default/2
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_unit_rw.pid
get_pid(Uid)-> get_pid_def(Uid,undefined).

get_pid_def(Uid,Def)->
	case erlang:get({Uid,m_unit_rw}) of
	undefined -> Def; 
	V -> V#m_unit_rw.pid 
	end.

set_pid(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{pid = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,pid,R)).

set_pid_direct(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{pid = V}).

%%-------------------------------------------------------------------
%% #m_unit_rw.data_id
get_data_id(Uid)-> get_data_id_def(Uid,undefined).

get_data_id_def(Uid,Def)->
	case erlang:get({Uid,m_unit_rw}) of
	undefined -> Def; 
	V -> V#m_unit_rw.data_id 
	end.

set_data_id(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{data_id = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,data_id,R)).

set_data_id_direct(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{data_id = V}).

%%-------------------------------------------------------------------
%% #m_unit_rw.group
get_group(Uid)-> get_group_def(Uid,undefined).

get_group_def(Uid,Def)->
	case erlang:get({Uid,m_unit_rw}) of
	undefined -> Def; 
	V -> V#m_unit_rw.group 
	end.

set_group(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{group = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,group,R)).

set_group_direct(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{group = V}).

%%-------------------------------------------------------------------
%% #m_unit_rw.owner
get_owner(Uid)-> get_owner_def(Uid,undefined).

get_owner_def(Uid,Def)->
	case erlang:get({Uid,m_unit_rw}) of
	undefined -> Def; 
	V -> V#m_unit_rw.owner 
	end.

set_owner(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{owner = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,owner,R)).

set_owner_direct(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{owner = V}).

%%-------------------------------------------------------------------
%% #m_unit_rw.type
get_type(Uid)-> get_type_def(Uid,undefined).

get_type_def(Uid,Def)->
	case erlang:get({Uid,m_unit_rw}) of
	undefined -> Def; 
	V -> V#m_unit_rw.type 
	end.

set_type(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{type = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,type,R)).

set_type_direct(Uid,V)->
	R = erlang:get({Uid,m_unit_rw}),
	erlang:put({Uid,m_unit_rw}, R#m_unit_rw{type = V}).

%%-------------------------------------------------------------------
del(Uid)-> erlang:erase({Uid,m_unit_rw}).

%%-------------------------------------------------------------------
to_record(Uid)-> erlang:get({Uid,m_unit_rw}).

%%-------------------------------------------------------------------
set(Uid,#m_unit_rw{}=V)->
	erlang:put({Uid,m_unit_rw}, V).

%%-------------------------------------------------------------------
init_default(Uid)-> erlang:put({Uid,m_unit_rw}, #m_unit_rw{}).
init_default(Uid,#m_unit_rw{}=V) -> erlang:put({Uid,m_unit_rw}, V).

%%-------------------------------------------------------------------
set_fields(_Uid,[]) ->ok;
set_fields(Uid,FieldList) ->
	R1 = erlang:get({Uid,m_unit_rw}),
	R2 = i_set_fields(Uid,FieldList,R1),
	erlang:put({Uid,m_unit_rw}, R2),
	ok.

%%-------------------------------------------------------------------
i_set_fields(_Uid,R, []) ->
	R;
i_set_fields(Uid,R, [H | FieldList]) ->
	i_set_fields(Uid,i_set_field(Uid,R,H), FieldList).

%%#m_unit_rw.pid
i_set_field(Uid,{pid, Val}, R) ->
	R1 = R#m_unit_rw{pid = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,pid,R)),
	R1;
i_set_field(Uid,{pid, Val, add}, R) ->
	R1 = R#m_unit_rw{pid = R#m_unit_rw.pid + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,pid,R)),
	R1;
i_set_field(Uid,{pid, Val, sub}, R) ->
	R1 = R#m_unit_rw{pid = R#m_unit_rw.pid - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,pid,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.pid, Val}, R) ->
	R1 = R#m_unit_rw{pid = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,pid,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.pid, Val, add}, R) ->
	R1 = R#m_unit_rw{pid = R#m_unit_rw.pid + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,pid,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.pid, Val, sub}, R) ->
	R1 = R#m_unit_rw{pid = R#m_unit_rw.pid - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,pid,R)),
	R1;
%%#m_unit_rw.data_id
i_set_field(Uid,{data_id, Val}, R) ->
	R1 = R#m_unit_rw{data_id = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,data_id,R)),
	R1;
i_set_field(Uid,{data_id, Val, add}, R) ->
	R1 = R#m_unit_rw{data_id = R#m_unit_rw.data_id + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,data_id,R)),
	R1;
i_set_field(Uid,{data_id, Val, sub}, R) ->
	R1 = R#m_unit_rw{data_id = R#m_unit_rw.data_id - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,data_id,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.data_id, Val}, R) ->
	R1 = R#m_unit_rw{data_id = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,data_id,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.data_id, Val, add}, R) ->
	R1 = R#m_unit_rw{data_id = R#m_unit_rw.data_id + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,data_id,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.data_id, Val, sub}, R) ->
	R1 = R#m_unit_rw{data_id = R#m_unit_rw.data_id - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,data_id,R)),
	R1;
%%#m_unit_rw.group
i_set_field(Uid,{group, Val}, R) ->
	R1 = R#m_unit_rw{group = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,group,R)),
	R1;
i_set_field(Uid,{group, Val, add}, R) ->
	R1 = R#m_unit_rw{group = R#m_unit_rw.group + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,group,R)),
	R1;
i_set_field(Uid,{group, Val, sub}, R) ->
	R1 = R#m_unit_rw{group = R#m_unit_rw.group - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,group,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.group, Val}, R) ->
	R1 = R#m_unit_rw{group = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,group,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.group, Val, add}, R) ->
	R1 = R#m_unit_rw{group = R#m_unit_rw.group + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,group,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.group, Val, sub}, R) ->
	R1 = R#m_unit_rw{group = R#m_unit_rw.group - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,group,R)),
	R1;
%%#m_unit_rw.owner
i_set_field(Uid,{owner, Val}, R) ->
	R1 = R#m_unit_rw{owner = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,owner,R)),
	R1;
i_set_field(Uid,{owner, Val, add}, R) ->
	R1 = R#m_unit_rw{owner = R#m_unit_rw.owner + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,owner,R)),
	R1;
i_set_field(Uid,{owner, Val, sub}, R) ->
	R1 = R#m_unit_rw{owner = R#m_unit_rw.owner - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,owner,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.owner, Val}, R) ->
	R1 = R#m_unit_rw{owner = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,owner,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.owner, Val, add}, R) ->
	R1 = R#m_unit_rw{owner = R#m_unit_rw.owner + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,owner,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.owner, Val, sub}, R) ->
	R1 = R#m_unit_rw{owner = R#m_unit_rw.owner - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,owner,R)),
	R1;
%%#m_unit_rw.type
i_set_field(Uid,{type, Val}, R) ->
	R1 = R#m_unit_rw{type = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,type,R)),
	R1;
i_set_field(Uid,{type, Val, add}, R) ->
	R1 = R#m_unit_rw{type = R#m_unit_rw.type + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,type,R)),
	R1;
i_set_field(Uid,{type, Val, sub}, R) ->
	R1 = R#m_unit_rw{type = R#m_unit_rw.type - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,type,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.type, Val}, R) ->
	R1 = R#m_unit_rw{type = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,type,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.type, Val, add}, R) ->
	R1 = R#m_unit_rw{type = R#m_unit_rw.type + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,type,R)),
	R1;
i_set_field(Uid,{#m_unit_rw.type, Val, sub}, R) ->
	R1 = R#m_unit_rw{type = R#m_unit_rw.type - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,type,R)),
	R1;
i_set_field(_Uid,_Elem,R)-> R.

%%-------------------------------------------------------------------
