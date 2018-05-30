%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:31
%%%-------------------------------------------------------------------
-module(lib_mem).
-author("mawenhong").
-include("logger.hrl").
-include("pub_common.hrl").
-include("player_record.hrl").
-include("gsdef.hrl").
-include("db_record.hrl").

%% API
-export([new_player/1]).
-export([get_player/1]).
-export([player_update/2]).

new_player(#p_player{
    aid = Aid, uid = Uid, sid = Sid, name = Name,
    level = Lv, sex = Sex, camp = Camp, race = Race, career = Career, head = Head,
    map_id = Mid, x = X, y = Y, old_map_id = OMid, old_x = Ox, old_y = Oy
}) ->
    Player = #m_player{
        uid =Uid,
        aid= Aid,
        sid= Sid,
        name= Name,
        sex = Sex,
        career= Career,
        level= Lv,
        pid= self(),
        mid= Mid, line = 0, pos = vector3:new(X, 0, Y),
        old_mid= OMid, old_line = 1, old_pos = vector3:new(Ox, 0, Oy)
    },
    ets:insert(?ETS_PLAYER_PUB, Player),
    ok.

get_player(Uid) ->
    case ets:lookup(?ETS_PLAYER_PUB, Uid) of
        [Player] -> Player;
        _ -> undefined
    end.

player_update(Uid, Elements)->
    ets:update_element(?ETS_PLAYER_PUB, Uid, Elements),
    ok.
