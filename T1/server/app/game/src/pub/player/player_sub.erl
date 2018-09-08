%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 六月 2018 12:08
%%%-------------------------------------------------------------------
-module(player_sub).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").

%% API
-export([tick_go/0, tick_me/0, tick_msg/0]).


%%-------------------------------------------------------------------
tick_go() ->
    tick_msg(),
    Now = misc_time:milli_seconds(),
    player_rw:set_last_second_tick(Now),
    player_rw:set_last_minute_tick(Now),
    player_rw:set_last_hour_tick(Now),
    ok.

%%-------------------------------------------------------------------
tick_msg()-> erlang:send_after(100, self(), tick_me).

%%-------------------------------------------------------------------
tick_me()->
    %
    tick_msg(),
    
    Now = misc_time:milli_seconds(),
    %
    ?TRY_CATCH(hook_player:on_tick()),
    S = do_second(Now),
    M = do_minute(S, Now),
    H = do_hour(M, Now),
    _ = do_sharp(H, Now),
    ok.

%%-------------------------------------------------------------------
do_second(Now) ->
    Latest = player_rw:get_last_second_tick(),
    case Now - Latest >= ?ONS_SECOND_MS of
        true ->
            player_rw:set_last_second_tick(Now),
            ?TRY_CATCH(hook_player:on_second()),
            true;
        _ -> false
    end.

%%-------------------------------------------------------------------
do_minute(true, Now) ->
    Latest = player_rw:get_last_minute_tick(),
    case Now - Latest >= ?ONE_MINUTE_MS of
        true ->
            player_rw:set_last_minute_tick(Now),
            ?TRY_CATCH(hook_player:on_minute()),
            true;
        _ -> false
    end;
do_minute(_, _Now) -> false.

%%-------------------------------------------------------------------
do_hour(true, Now) ->
    Latest = player_rw:get_last_hour_tick(),
    case Now - Latest >= ?ONT_HOUR_MS of
        true ->
            player_rw:set_last_hour_tick(Now),
            ?TRY_CATCH(hook_player:on_hour()),
            true;
        _ -> false
    end;
do_hour(_, _Now) -> false.

%%-------------------------------------------------------------------
do_sharp(true, _Now) ->
    {{_,_,_}, {H,M,_S}} = calendar:local_time(),
    case M =:= 0 of
        true ->
            ?TRY_CATCH(hook_player:on_sharp(H)), true;
        _ -> false
    end;
do_sharp(_, _Now) -> false.
