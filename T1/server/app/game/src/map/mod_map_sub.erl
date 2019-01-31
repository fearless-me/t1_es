%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 十一月 2018 15:46
%%%-------------------------------------------------------------------
-module(mod_map_sub).
-author("Administrator").
-include("logger.hrl").
-include("gs_cache.hrl").
-include("rec_rw.hrl").

%% API
-export([sync_player_to_map/1]).

sync_player_to_map(Uid) ->
    #m_cache_player_online{
        level = Level, name = Name, career = Career, race = Race
    } = gs_cache_interface:get_player_online(Uid),
    object_rw:set_fields_direct(
        Uid,
        [
            {#m_object_rw.level, Level},
            {#m_object_rw.name, Name},
            {#m_object_rw.race, Race},
            {#m_object_rw.career, Career}
        ]
    ),
    ok.
