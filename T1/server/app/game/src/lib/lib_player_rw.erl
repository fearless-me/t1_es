%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(lib_player_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("player_status.hrl").
-include("rw_record.hrl").
-include("vector3.hrl").
%%-------------------------------------------------------------------

-export([get_aid/0, get_aid_def/1, set_aid/1]).
-export([get_uid/0, get_uid_def/1, set_uid/1]).
-export([get_sid/0, get_sid_def/1, set_sid/1]).
-export([get_name/0, get_name_def/1, set_name/1]).
-export([get_level/0, get_level_def/1, set_level/1]).
-export([get_sex/0, get_sex_def/1, set_sex/1]).
-export([get_head/0, get_head_def/1, set_head/1]).
-export([get_race/0, get_race_def/1, set_race/1]).
-export([get_career/0, get_career_def/1, set_career/1]).
-export([get_map_id/0, get_map_id_def/1, set_map_id/1]).
-export([get_line/0, get_line_def/1, set_line/1]).
-export([get_pos/0, get_pos_def/1, set_pos/1]).
-export([get_last_second_tick/0, get_last_second_tick_def/1, set_last_second_tick/1]).
-export([get_last_minute_tick/0, get_last_minute_tick_def/1, set_last_minute_tick/1]).
-export([get_last_hour_tick/0, get_last_hour_tick_def/1, set_last_hour_tick/1]).
-export([get_status/0, get_status_def/1, set_status/1]).
-export([del/0]).
-export([to_record/0]).
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
set_aid(V)-> put(aid, V), hook_player:on_rw_update(aid, V).

%%-------------------------------------------------------------------
%% #m_player_rw.uid
get_uid()-> get(uid).
get_uid_def(Def)->
	case get(uid) of
		undefined -> Def;
		V -> V
	end.
set_uid(V)-> put(uid, V), hook_player:on_rw_update(uid, V).

%%-------------------------------------------------------------------
%% #m_player_rw.sid
get_sid()-> get(sid).
get_sid_def(Def)->
	case get(sid) of
		undefined -> Def;
		V -> V
	end.
set_sid(V)-> put(sid, V), hook_player:on_rw_update(sid, V).

%%-------------------------------------------------------------------
%% #m_player_rw.name
get_name()-> get(name).
get_name_def(Def)->
	case get(name) of
		undefined -> Def;
		V -> V
	end.
set_name(V)-> put(name, V), hook_player:on_rw_update(name, V).

%%-------------------------------------------------------------------
%% #m_player_rw.level
get_level()-> get(level).
get_level_def(Def)->
	case get(level) of
		undefined -> Def;
		V -> V
	end.
set_level(V)-> put(level, V), hook_player:on_rw_update(level, V).

%%-------------------------------------------------------------------
%% #m_player_rw.sex
get_sex()-> get(sex).
get_sex_def(Def)->
	case get(sex) of
		undefined -> Def;
		V -> V
	end.
set_sex(V)-> put(sex, V), hook_player:on_rw_update(sex, V).

%%-------------------------------------------------------------------
%% #m_player_rw.head
get_head()-> get(head).
get_head_def(Def)->
	case get(head) of
		undefined -> Def;
		V -> V
	end.
set_head(V)-> put(head, V), hook_player:on_rw_update(head, V).

%%-------------------------------------------------------------------
%% #m_player_rw.race
get_race()-> get(race).
get_race_def(Def)->
	case get(race) of
		undefined -> Def;
		V -> V
	end.
set_race(V)-> put(race, V), hook_player:on_rw_update(race, V).

%%-------------------------------------------------------------------
%% #m_player_rw.career
get_career()-> get(career).
get_career_def(Def)->
	case get(career) of
		undefined -> Def;
		V -> V
	end.
set_career(V)-> put(career, V), hook_player:on_rw_update(career, V).

%%-------------------------------------------------------------------
%% #m_player_rw.map_id
get_map_id()-> get(map_id).
get_map_id_def(Def)->
	case get(map_id) of
		undefined -> Def;
		V -> V
	end.
set_map_id(V)-> put(map_id, V), hook_player:on_rw_update(map_id, V).

%%-------------------------------------------------------------------
%% #m_player_rw.line
get_line()-> get(line).
get_line_def(Def)->
	case get(line) of
		undefined -> Def;
		V -> V
	end.
set_line(V)-> put(line, V), hook_player:on_rw_update(line, V).

%%-------------------------------------------------------------------
%% #m_player_rw.pos
get_pos()-> get(pos).
get_pos_def(Def)->
	case get(pos) of
		undefined -> Def;
		V -> V
	end.
set_pos(V)-> put(pos, V), hook_player:on_rw_update(pos, V).

%%-------------------------------------------------------------------
%% #m_player_rw.last_second_tick
get_last_second_tick()-> get(last_second_tick).
get_last_second_tick_def(Def)->
	case get(last_second_tick) of
		undefined -> Def;
		V -> V
	end.
set_last_second_tick(V)-> put(last_second_tick, V), hook_player:on_rw_update(last_second_tick, V).

%%-------------------------------------------------------------------
%% #m_player_rw.last_minute_tick
get_last_minute_tick()-> get(last_minute_tick).
get_last_minute_tick_def(Def)->
	case get(last_minute_tick) of
		undefined -> Def;
		V -> V
	end.
set_last_minute_tick(V)-> put(last_minute_tick, V), hook_player:on_rw_update(last_minute_tick, V).

%%-------------------------------------------------------------------
%% #m_player_rw.last_hour_tick
get_last_hour_tick()-> get(last_hour_tick).
get_last_hour_tick_def(Def)->
	case get(last_hour_tick) of
		undefined -> Def;
		V -> V
	end.
set_last_hour_tick(V)-> put(last_hour_tick, V), hook_player:on_rw_update(last_hour_tick, V).

%%-------------------------------------------------------------------
%% #m_player_rw.status
get_status()-> get(status).
get_status_def(Def)->
	case get(status) of
		undefined -> Def;
		V -> V
	end.
set_status(V)-> put(status, V), hook_player:on_rw_update(status, V).

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
	erase(map_id),
	erase(line),
	erase(pos),
	erase(last_second_tick),
	erase(last_minute_tick),
	erase(last_hour_tick),
	erase(status),
	ok.
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
		map_id = get_map_id(),
		line = get_line(),
		pos = get_pos(),
		last_second_tick = get_last_second_tick(),
		last_minute_tick = get_last_minute_tick(),
		last_hour_tick = get_last_hour_tick(),
		status = get_status()
	}.
%%-------------------------------------------------------------------
