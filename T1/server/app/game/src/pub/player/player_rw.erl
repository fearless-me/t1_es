%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(player_rw).
-author("Hello World").

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("player_status.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
	get_aid/0,get_aid_def/1,set_aid/1,set_aid_direct/1, % #m_player_rw.aid
	get_uid/0,get_uid_def/1,set_uid/1,set_uid_direct/1, % #m_player_rw.uid
	get_sid/0,get_sid_def/1,set_sid/1,set_sid_direct/1, % #m_player_rw.sid
	get_name/0,get_name_def/1,set_name/1,set_name_direct/1, % #m_player_rw.name
	get_level/0,get_level_def/1,set_level/1,set_level_direct/1, % #m_player_rw.level
	get_sex/0,get_sex_def/1,set_sex/1,set_sex_direct/1, % #m_player_rw.sex
	get_head/0,get_head_def/1,set_head/1,set_head_direct/1, % #m_player_rw.head
	get_race/0,get_race_def/1,set_race/1,set_race_direct/1, % #m_player_rw.race
	get_career/0,get_career_def/1,set_career/1,set_career_direct/1, % #m_player_rw.career
	get_map/0,get_map_def/1,set_map/1,set_map_direct/1, % #m_player_rw.map
	get_last_second_tick/0,get_last_second_tick_def/1,set_last_second_tick/1,set_last_second_tick_direct/1, % #m_player_rw.last_second_tick
	get_last_minute_tick/0,get_last_minute_tick_def/1,set_last_minute_tick/1,set_last_minute_tick_direct/1, % #m_player_rw.last_minute_tick
	get_last_hour_tick/0,get_last_hour_tick_def/1,set_last_hour_tick/1,set_last_hour_tick_direct/1, % #m_player_rw.last_hour_tick
	get_status/0,get_status_def/1,set_status/1,set_status_direct/1, % #m_player_rw.status
	% common function 
	del/0,get/0,set/1,set_fields/1,set_fields_direct/1,init/0,init/1
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_player_rw.aid
get_aid()-> get_aid_def(undefined).

get_aid_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.aid 
	end.

set_aid(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{aid = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.aid,V)).

set_aid_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{aid = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.uid
get_uid()-> get_uid_def(undefined).

get_uid_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.uid 
	end.

set_uid(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{uid = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.uid,V)).

set_uid_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{uid = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.sid
get_sid()-> get_sid_def(undefined).

get_sid_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.sid 
	end.

set_sid(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{sid = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.sid,V)).

set_sid_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{sid = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.name
get_name()-> get_name_def(undefined).

get_name_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.name 
	end.

set_name(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{name = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.name,V)).

set_name_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{name = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.level
get_level()-> get_level_def(undefined).

get_level_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.level 
	end.

set_level(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{level = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.level,V)).

set_level_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{level = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.sex
get_sex()-> get_sex_def(undefined).

get_sex_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.sex 
	end.

set_sex(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{sex = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.sex,V)).

set_sex_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{sex = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.head
get_head()-> get_head_def(undefined).

get_head_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.head 
	end.

set_head(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{head = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.head,V)).

set_head_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{head = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.race
get_race()-> get_race_def(undefined).

get_race_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.race 
	end.

set_race(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{race = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.race,V)).

set_race_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{race = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.career
get_career()-> get_career_def(undefined).

get_career_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.career 
	end.

set_career(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{career = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.career,V)).

set_career_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{career = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.map
get_map()-> get_map_def(undefined).

get_map_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.map 
	end.

set_map(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{map = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.map,V)).

set_map_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{map = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.last_second_tick
get_last_second_tick()-> get_last_second_tick_def(undefined).

get_last_second_tick_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.last_second_tick 
	end.

set_last_second_tick(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{last_second_tick = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.last_second_tick,V)).

set_last_second_tick_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{last_second_tick = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.last_minute_tick
get_last_minute_tick()-> get_last_minute_tick_def(undefined).

get_last_minute_tick_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.last_minute_tick 
	end.

set_last_minute_tick(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{last_minute_tick = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.last_minute_tick,V)).

set_last_minute_tick_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{last_minute_tick = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.last_hour_tick
get_last_hour_tick()-> get_last_hour_tick_def(undefined).

get_last_hour_tick_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.last_hour_tick 
	end.

set_last_hour_tick(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{last_hour_tick = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.last_hour_tick,V)).

set_last_hour_tick_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{last_hour_tick = V}).

%%-------------------------------------------------------------------
%% #m_player_rw.status
get_status()-> get_status_def(undefined).

get_status_def(Def)->
	case erlang:get(m_player_rw) of
	undefined -> Def; 
	V -> V#m_player_rw.status 
	end.

set_status(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{status = V}),
	?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.status,V)).

set_status_direct(V)->
	R = erlang:get(m_player_rw),
	erlang:put(m_player_rw, R#m_player_rw{status = V}).

%%-------------------------------------------------------------------
del()-> erlang:erase(m_player_rw).

%%-------------------------------------------------------------------
get()-> erlang:get(m_player_rw).

%%-------------------------------------------------------------------
set(#m_player_rw{}=V)->
	erlang:put(m_player_rw, V).

%%-------------------------------------------------------------------
init()-> erlang:put(m_player_rw, #m_player_rw{}).
init(#m_player_rw{}=V) -> erlang:put(m_player_rw, V).

%%-------------------------------------------------------------------
set_fields_direct([]) ->ok;
set_fields_direct(FieldList) ->
	R1 = erlang:get(m_player_rw),
	R2 = i_set_fields(R1, FieldList, true),
	erlang:put(m_player_rw, R2),
	ok.

%%-------------------------------------------------------------------
set_fields([]) ->ok;
set_fields(FieldList) ->
	R1 = erlang:get(m_player_rw),
	R2 = i_set_fields(R1, FieldList, false),
	erlang:put(m_player_rw, R2),
	ok.

%%-------------------------------------------------------------------
i_set_fields(R, [], _) ->
	R;
i_set_fields(R, [H | FieldList], IsDirect) ->
	i_set_fields(i_set_field(H, R, IsDirect), FieldList, IsDirect).

%%#m_player_rw.aid
i_set_field({#m_player_rw.aid, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{aid = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.aid,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.uid
i_set_field({#m_player_rw.uid, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{uid = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.uid,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.sid
i_set_field({#m_player_rw.sid, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{sid = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.sid,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.name
i_set_field({#m_player_rw.name, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{name = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.name,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.level
i_set_field({#m_player_rw.level, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{level = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.level,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.sex
i_set_field({#m_player_rw.sex, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{sex = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.sex,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.head
i_set_field({#m_player_rw.head, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{head = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.head,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.race
i_set_field({#m_player_rw.race, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{race = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.race,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.career
i_set_field({#m_player_rw.career, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{career = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.career,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.map
i_set_field({#m_player_rw.map, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{map = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.map,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.last_second_tick
i_set_field({#m_player_rw.last_second_tick, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{last_second_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.last_second_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.last_minute_tick
i_set_field({#m_player_rw.last_minute_tick, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{last_minute_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.last_minute_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.last_hour_tick
i_set_field({#m_player_rw.last_hour_tick, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{last_hour_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.last_hour_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_player_rw.status
i_set_field({#m_player_rw.status, Val}, R, IsDirect) ->
	R1 = R#m_player_rw{status = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_player:on_rw_update(#m_player_rw.status,Val));
		 _ -> skip 
	end,
	R1;
i_set_field(_Elem,R, _)-> R.

%%-------------------------------------------------------------------
