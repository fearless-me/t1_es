%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 17:59
%%%-------------------------------------------------------------------
-module(combat_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_cache.hrl").

%% API
-export([event_damage/3, event_heal/3]).

event_damage(SrcUid, DstUid, Value) ->
    MapPid = player_interface:get_map_pid(SrcUid),
    ps:send(MapPid, condition_event, {event_damage, SrcUid, DstUid, Value}),
    ok.


event_heal(SrcUid, DstUid, Value) ->
    MapPid = player_interface:get_map_pid(SrcUid),
    ps:send(MapPid, condition_event, {event_heal, SrcUid, DstUid, Value}),
    ok.

