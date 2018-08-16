%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 五月 2018 9:51
%%%-------------------------------------------------------------------
-module(lib_player_save).
-author("mawenhong").
-include("logger.hrl").
-include("mem_record.hrl").

%% API
-export([save/1]).

%%-------------------------------------------------------------------
save(Player) ->
    #m_player_pub{aid = Aid, uid = Uid, pos = Pos, mid = Mid} = Player,
    ?DEBUG("save player aid ~w uid ~w",[Aid, Uid]),
    NewPlayer = case vector3:valid(Pos) of
                    true -> Player;
                    _ ->
                        NewPos = gs_map_creator_interface:map_init_pos(Mid),
                        Player#m_player_pub{pos = NewPos}
                end,
    gs_db_interface:action_p_(Aid, save_player, NewPlayer),
    ok.
