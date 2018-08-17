%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 六月 2018 12:08
%%%-------------------------------------------------------------------
-module(lib_player_sub).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").

%% API
-export([tick_go/0, tick_me/0, tick_msg/0]).


%%-------------------------------------------------------------------
tick_go() ->
    tick_msg(),
    Now = time_misc:milli_seconds(),
    lib_player_rw:set_last_second_tick(Now),
    lib_player_rw:set_last_minute_tick(Now),
    lib_player_rw:set_last_hour_tick(Now),
    ok.

%%-------------------------------------------------------------------
tick_msg()-> erlang:send_after(100, self(), tick_me).

%%-------------------------------------------------------------------
tick_me()->
    %
    tick_msg(),
    
    Now = time_misc:milli_seconds(),
    %
    ?TRY_CATCH(hook_player:on_tick()),
    S = second_action(Now),
    M = minute_action(S, Now),
    H = hour_action(M, Now),
    _ = sharp_action(H, Now),
    ok.

%%-------------------------------------------------------------------
second_action(Now) ->
    Latest = lib_player_rw:get_last_second_tick(),
    case Now - Latest >= ?ONS_SECOND_MS of
        true ->
            lib_player_rw:set_last_second_tick(Now),
            ?TRY_CATCH(hook_player:on_second()),
            true;
        _ -> false
    end.

%%-------------------------------------------------------------------
minute_action(true, Now) ->
    Latest = lib_player_rw:get_last_minute_tick(),
    case Now - Latest >= ?ONE_MINUTE_MS of
        true ->
            lib_player_rw:set_last_minute_tick(Now),
            ?TRY_CATCH(hook_player:on_minute()),
            true;
        _ -> false
    end;
minute_action(_, _Now) -> false.

%%-------------------------------------------------------------------
hour_action(true, Now) ->
    Latest = lib_player_rw:get_last_hour_tick(),
    case Now - Latest >= ?ONT_HOUR_MS of
        true ->
            lib_player_rw:set_last_hour_tick(Now),
            ?TRY_CATCH(hook_player:on_hour()),
            true;
        _ -> false
    end;
hour_action(_, _Now) -> false.

%%-------------------------------------------------------------------
sharp_action(true, _Now) ->
    {{_,_,_}, {H,M,_S}} = calendar:local_time(),
    case M =:= 0 of
        true ->
            ?TRY_CATCH(hook_player:on_sharp(H)), true;
        _ -> false
    end;
sharp_action(_, _Now) -> false.
