%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 九月 2018 10:54
%%%-------------------------------------------------------------------
-module(mod_monster).
-author("mawenhong").
-include("logger.hrl").
-include("cfg_monster.hrl").
-include("gs_common_rec.hrl").

%% API
-export([add_born_buff/1]).

%%-------------------------------------------------------------------
add_born_buff({Uid, DataId}) ->
    do_add_born_buff(object_rw:exists(Uid), Uid, DataId).

%%-------------------------------------------------------------------
do_add_born_buff(true, Uid, DataId) ->
    #monsterCfg{buff_born = BuffList} = getCfg:getCfgByArgs(cfg_monster, DataId),
    lists:foreach(
        fun(BuffId)->
            Req = #r_player_add_buff_req{uid = Uid, buff_id = BuffId},
            mod_buff:add_buff(Req)
        end, BuffList),
    ok;
do_add_born_buff(_, _, _) -> skip.

