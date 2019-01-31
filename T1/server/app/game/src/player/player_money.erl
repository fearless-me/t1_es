%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2018 11:43
%%%-------------------------------------------------------------------
-module(player_money).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([]).


add_money(_Type, _Num, _Log) ->
    ok.

can_user_money(_UseType, _Num) ->
    true.

use_money(_UseType, _Num, _Log) ->
    ok.


