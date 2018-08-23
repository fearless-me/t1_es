%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(lib_player_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("gs_player_status.hrl").
-include("rec_rw.hrl").

%%-------------------------------------------------------------------

-export([
	get_aid/0, get_aid_def/1, set_aid/1, set_aid_direct/1, % #m_player_rw.aid
	get_uid/0, get_uid_def/1, set_uid/1, set_uid_direct/1, % #m_player_rw.uid
	get_sid/0, get_sid_def/1, set_sid/1, set_sid_direct/1, % #m_player_rw.sid
	get_name/0, get_name_def/1, set_name/1, set_name_direct/1, % #m_player_rw.name
	get_level/0, get_level_def/1, set_level/1, set_level_direct/1, % #m_player_rw.level
	get_sex/0, get_sex_def/1, set_sex/1, set_sex_direct/1, % #m_player_rw.sex
	get_head/0, get_head_def/1, set_head/1, set_head_direct/1, % #m_player_rw.head
	get_race/0, get_race_def/1, set_race/1, set_race_direct/1, % #m_player_rw.race
	get_career/0, get_career_def/1, set_career/1, set_career_direct/1, % #m_player_rw.career
	get_map/0, get_map_def/1, set_map/1, set_map_direct/1, % #m_player_rw.map
	get_last_second_tick/0, get_last_second_tick_def/1, set_last_second_tick/1, set_last_second_tick_direct/1, % #m_player_rw.last_second_tick
	get_last_minute_tick/0, get_last_minute_tick_def/1, set_last_minute_tick/1, set_last_minute_tick_direct/1, % #m_player_rw.last_minute_tick
	get_last_hour_tick/0, get_last_hour_tick_def/1, set_last_hour_tick/1, set_last_hour_tick_direct/1, % #m_player_rw.last_hour_tick
	get_status/0, get_status_def/1, set_status/1, set_status_direct/1, % #m_player_rw.status
	% common function 
	del/0 ,to_record/0 ,init_from/1 ,init_default/0
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_player_rw.aid
get_aid()-> get(aid).

get_aid_def(Def)->
	case get(aid) of
		undefined -> Def;
		V -> V
	end.

set_aid(V)->
	put(aid, V),
	hook_player:on_rw_update(aid, V).

set_aid_direct(V)-> put(aid, V).

%%-------------------------------------------------------------------
%% #m_player_rw.uid
get_uid()-> get(uid).

get_uid_def(Def)->
	case get(uid) of
		undefined -> Def;
		V -> V
	end.

set_uid(V)->
	put(uid, V),
	hook_player:on_rw_update(uid, V).

set_uid_direct(V)-> put(uid, V).

%%-------------------------------------------------------------------
%% #m_player_rw.sid
get_sid()-> get(sid).

get_sid_def(Def)->
	case get(sid) of
		undefined -> Def;
		V -> V
	end.

set_sid(V)->
	put(sid, V),
	hook_player:on_rw_update(sid, V).

set_sid_direct(V)-> put(sid, V).

%%-------------------------------------------------------------------
%% #m_player_rw.name
get_name()-> get(name).

get_name_def(Def)->
	case get(name) of
		undefined -> Def;
		V -> V
	end.

set_name(V)->
	put(name, V),
	hook_player:on_rw_update(name, V).

set_name_direct(V)-> put(name, V).

%%-------------------------------------------------------------------
%% #m_player_rw.level
get_level()-> get(level).

get_level_def(Def)->
	case get(level) of
		undefined -> Def;
		V -> V
	end.

set_level(V)->
	put(level, V),
	hook_player:on_rw_update(level, V).

set_level_direct(V)-> put(level, V).

%%-------------------------------------------------------------------
%% #m_player_rw.sex
get_sex()-> get(sex).

get_sex_def(Def)->
	case get(sex) of
		undefined -> Def;
		V -> V
	end.

set_sex(V)->
	put(sex, V),
	hook_player:on_rw_update(sex, V).

set_sex_direct(V)-> put(sex, V).

%%-------------------------------------------------------------------
%% #m_player_rw.head
get_head()-> get(head).

get_head_def(Def)->
	case get(head) of
		undefined -> Def;
		V -> V
	end.

set_head(V)->
	put(head, V),
	hook_player:on_rw_update(head, V).

set_head_direct(V)-> put(head, V).

%%-------------------------------------------------------------------
%% #m_player_rw.race
get_race()-> get(race).

get_race_def(Def)->
	case get(race) of
		undefined -> Def;
		V -> V
	end.

set_race(V)->
	put(race, V),
	hook_player:on_rw_update(race, V).

set_race_direct(V)-> put(race, V).

%%-------------------------------------------------------------------
%% #m_player_rw.career
get_career()-> get(career).

get_career_def(Def)->
	case get(career) of
		undefined -> Def;
		V -> V
	end.

set_career(V)->
	put(career, V),
	hook_player:on_rw_update(career, V).

set_career_direct(V)-> put(career, V).

%%-------------------------------------------------------------------
%% #m_player_rw.map
get_map()-> get(map).

get_map_def(Def)->
	case get(map) of
		undefined -> Def;
		V -> V
	end.

set_map(V)->
	put(map, V),
	hook_player:on_rw_update(map, V).

set_map_direct(V)-> put(map, V).

%%-------------------------------------------------------------------
%% #m_player_rw.last_second_tick
get_last_second_tick()-> get(last_second_tick).

get_last_second_tick_def(Def)->
	case get(last_second_tick) of
		undefined -> Def;
		V -> V
	end.

set_last_second_tick(V)->
	put(last_second_tick, V),
	hook_player:on_rw_update(last_second_tick, V).

set_last_second_tick_direct(V)-> put(last_second_tick, V).

%%-------------------------------------------------------------------
%% #m_player_rw.last_minute_tick
get_last_minute_tick()-> get(last_minute_tick).

get_last_minute_tick_def(Def)->
	case get(last_minute_tick) of
		undefined -> Def;
		V -> V
	end.

set_last_minute_tick(V)->
	put(last_minute_tick, V),
	hook_player:on_rw_update(last_minute_tick, V).

set_last_minute_tick_direct(V)-> put(last_minute_tick, V).

%%-------------------------------------------------------------------
%% #m_player_rw.last_hour_tick
get_last_hour_tick()-> get(last_hour_tick).

get_last_hour_tick_def(Def)->
	case get(last_hour_tick) of
		undefined -> Def;
		V -> V
	end.

set_last_hour_tick(V)->
	put(last_hour_tick, V),
	hook_player:on_rw_update(last_hour_tick, V).

set_last_hour_tick_direct(V)-> put(last_hour_tick, V).

%%-------------------------------------------------------------------
%% #m_player_rw.status
get_status()-> get(status).

get_status_def(Def)->
	case get(status) of
		undefined -> Def;
		V -> V
	end.

set_status(V)->
	put(status, V),
	hook_player:on_rw_update(status, V).

set_status_direct(V)-> put(status, V).

%%-------------------------------------------------------------------
del()->
	erase(aid),
	erase(uid),
	erase(sid),
	erase(name),
	erase(level),
	erase(sex),
	erase(head),
	erase(race),
	erase(career),
	erase(map),
	erase(last_second_tick),
	erase(last_minute_tick),
	erase(last_hour_tick),
	erase(status),
	ok.
%%-------------------------------------------------------------------
to_record()->
	#m_player_rw{
		aid = get_aid(),
		uid = get_uid(),
		sid = get_sid(),
		name = get_name(),
		level = get_level(),
		sex = get_sex(),
		head = get_head(),
		race = get_race(),
		career = get_career(),
		map = get_map(),
		last_second_tick = get_last_second_tick(),
		last_minute_tick = get_last_minute_tick(),
		last_hour_tick = get_last_hour_tick(),
		status = get_status()
	}.
%%-------------------------------------------------------------------
init_from(Rec)->
	set_aid_direct(Rec#m_player_rw.aid),
	set_uid_direct(Rec#m_player_rw.uid),
	set_sid_direct(Rec#m_player_rw.sid),
	set_name_direct(Rec#m_player_rw.name),
	set_level_direct(Rec#m_player_rw.level),
	set_sex_direct(Rec#m_player_rw.sex),
	set_head_direct(Rec#m_player_rw.head),
	set_race_direct(Rec#m_player_rw.race),
	set_career_direct(Rec#m_player_rw.career),
	set_map_direct(Rec#m_player_rw.map),
	set_last_second_tick_direct(Rec#m_player_rw.last_second_tick),
	set_last_minute_tick_direct(Rec#m_player_rw.last_minute_tick),
	set_last_hour_tick_direct(Rec#m_player_rw.last_hour_tick),
	set_status_direct(Rec#m_player_rw.status),
	ok.
%%-------------------------------------------------------------------
init_default()->
	Rec = #m_player_rw{},
	set_aid_direct(Rec#m_player_rw.aid),
	set_uid_direct(Rec#m_player_rw.uid),
	set_sid_direct(Rec#m_player_rw.sid),
	set_name_direct(Rec#m_player_rw.name),
	set_level_direct(Rec#m_player_rw.level),
	set_sex_direct(Rec#m_player_rw.sex),
	set_head_direct(Rec#m_player_rw.head),
	set_race_direct(Rec#m_player_rw.race),
	set_career_direct(Rec#m_player_rw.career),
	set_map_direct(Rec#m_player_rw.map),
	set_last_second_tick_direct(Rec#m_player_rw.last_second_tick),
	set_last_minute_tick_direct(Rec#m_player_rw.last_minute_tick),
	set_last_hour_tick_direct(Rec#m_player_rw.last_hour_tick),
	set_status_direct(Rec#m_player_rw.status),
	ok.
%%-------------------------------------------------------------------
