%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 十二月 2018 10:08
%%%-------------------------------------------------------------------
-module(player_map).
-author("Administrator").

%% API
-export([can_enter_map/2]).

-spec can_enter_map(SrcMapId :: integer(), DstMapId ::integer()) -> true | {false, Reason :: integer()}.
can_enter_map(SrcMapId, DstMapId) ->
    true.
