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
-export([get_status/0, get_status_def/1, set_status/1]).
-export([get_name/0, get_name_def/1, set_name/1]).
-export([del/0]).
-export([to_record/0]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
get_aid()-> get(aid).
get_aid_def(Def)->
	case get(aid) of
		undefined -> Def;
		V -> V
	end.
set_aid(V)-> put(aid, V).

get_uid()-> get(uid).
get_uid_def(Def)->
	case get(uid) of
		undefined -> Def;
		V -> V
	end.
set_uid(V)-> put(uid, V).

get_sid()-> get(sid).
get_sid_def(Def)->
	case get(sid) of
		undefined -> Def;
		V -> V
	end.
set_sid(V)-> put(sid, V).

get_status()-> get(status).
get_status_def(Def)->
	case get(status) of
		undefined -> Def;
		V -> V
	end.
set_status(V)-> put(status, V).

get_name()-> get(name).
get_name_def(Def)->
	case get(name) of
		undefined -> Def;
		V -> V
	end.
set_name(V)-> put(name, V).

del()->
	erase(aid),
	erase(uid),
	erase(sid),
	erase(status),
	erase(name),
	ok.
to_record()->
	#m_player_rw{
		aid = get_aid(),
		uid = get_uid(),
		sid = get_sid(),
		status = get_status(),
		name = get_name()
	}.
%%-------------------------------------------------------------------
