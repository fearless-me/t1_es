%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 五月 2018 9:51
%%%-------------------------------------------------------------------
-module(player_save).
-author("mawenhong").
-include("logger.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").

%% API
-export([save/1]).

%%-------------------------------------------------------------------
save(Uid) ->
    #m_cache_online_player{
        aid = Aid, pos = Pos, map_id = Mid, map_pid = MPid
    } = Player = gs_cache_interface:get_online_player(Uid),
    ?DEBUG("save player aid ~w uid ~w in map ~w|~w", [Aid, Uid, Mid, MPid]),
    NewPlayer = case vector3:valid(Pos) of
                    true -> Player;
                    _ ->
                        NewPos = map_creator_interface:map_init_pos(Mid),
                        Player#m_cache_online_player{pos = NewPos}
                end,
    gs_db_interface:action_data_(Aid, save_player, NewPlayer),
    ok.
