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

save(Player) ->
    #m_player{aid = Aid, uid = Uid} = Player,
    ?DEBUG("save player aid ~w uid ~w",[Aid, Uid]),
    lib_db:action_p_(Aid, save_player, Player),
    ok.
