%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 九月 2018 17:58
%%%-------------------------------------------------------------------
-module(player_buff).
-author("mawenhong").
-include("logger.hrl").
-include("gs_common_rec.hrl").
%% API
-export([add_buff/2]).

%%-------------------------------------------------------------------
add_buff(BuffId, Level) ->
    Uid = player_rw:get_uid(),
    Req = #r_player_add_buff_req{uid = Uid, buff_id = BuffId, level = Level},
    player_pub:send_map_msg_(player_use_skill, Req),
    ok.
