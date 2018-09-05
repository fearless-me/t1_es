%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:07
%%%-------------------------------------------------------------------
-module(hook_player).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_mem_rec.hrl").
-include("netmsg.hrl").

%% API
-export([on_account_login/3, on_create/1, on_login/1, on_offline/0]).
-export([on_tick/0, on_second/0, on_minute/0, on_hour/0, on_sharp/1]).
-export([on_change_map/2, on_rw_update/2]).

%%-------------------------------------------------------------------
on_account_login(Aid, Pid, Sock) ->
    gs_cache_interface:add_account_socket(Aid, Pid, Sock),
    gs_db_interface:action_data_(Aid, load_player_list, Aid),
    ok.

%%-------------------------------------------------------------------
on_create(Uid) ->
    lib_player_pub:send_net_msg(#pk_GS2U_CreatePlayerResult{uid = Uid}),
    ?DEBUG("[hook]Aid ~p create new player ~w",
        [lib_player_rw:get_aid(), Uid]),
    ok.

%%-------------------------------------------------------------------
on_login(Player) ->
    Aid = lib_player_rw:get_aid(),
    gs_cross_interface:assign_cross_for_me(Aid),
    lib_player_base:init(Player),
    lib_player_base:send_init_data(),
    gs_cache_interface:online(Player, self(), lib_player_pub:socket()),
    lib_player_cross_priv:online(),
    lib_player_map_priv:online_call(Player),
    lib_player_alarm:init(),
    lib_player_sub:tick_go(),
    ?DEBUG("[hook]Aid ~p player login ~w",
        [lib_player_rw:get_aid(), lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_offline() ->
    %% 1.
    #m_player_map{
        map_id = Mid,
        map_pid = MPid,
        line_id = LineId
    } = lib_player_rw:get_map(),
    Uid = lib_player_rw:get_uid(),
    Aid = lib_player_rw:get_aid(),

    %% 2.
    ?TRY_CATCH(lib_player_map_priv:offline_call(Uid, Mid, LineId, MPid), Err1, St1),
    ?TRY_CATCH(lib_player_cross_priv:offline(), Err2, St2),
    ?TRY_CATCH(gs_cache_interface:offline(Aid, Uid), Err3, St3),
    ?TRY_CATCH(lib_player_alarm:save(), Err4, St4),
    ?TRY_CATCH(lib_player_save:save(Uid), Err5, St5),
    ?WARN("player ~p exit map_~p_~p", [Uid, Mid, LineId]),
    ok.

%%-------------------------------------------------------------------
on_change_map(OldMap, NewMap) ->
    ?DEBUG("[hook]Aid ~p  player ~p change map from ~w to ~w",
        [lib_player_rw:get_aid(), lib_player_rw:get_uid(), OldMap, NewMap]),
    ok.

%%-------------------------------------------------------------------
on_tick() ->
    ok.

%%-------------------------------------------------------------------
on_second() ->
%%    ?INFO("player ~p on_second", [lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_minute() ->
%%    ?INFO("player ~p on_minute", [lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_hour() ->
    ?INFO("player ~p on_hour", [lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_sharp(Hour) ->
    ?INFO("player ~p on_sharp ~p", [lib_player_rw:get_uid(), Hour]),
    ok.

%%-------------------------------------------------------------------
-define(lock(X), lock_transaction(X)).
-define(unlock(), unlock_transaction()).

%%不要在调用lib_player_rw:set_xxx
on_rw_update(level, Level) ->
    ?lock(level),
    Uid = lib_player_rw:get_uid(),
    gs_cache_interface:update_player_pub(Uid, {#m_player_pub.level, Level}),
    ?unlock(),
    ok;
on_rw_update(_Key, _Value) ->
%%    ?DEBUG("player ~p key ~p  value ~p", [lib_player_rw:get_uid(), Key, Value]),
    ok.


%%-------------------------------------------------------------------
lock_transaction(Key) ->
    case get(player_lock_transaction) of
        Key -> throw("recursive call");
        _ -> put(player_lock_transaction, Key)
    end,
    ok.

unlock_transaction() ->
    erase(player_lock_transaction).

