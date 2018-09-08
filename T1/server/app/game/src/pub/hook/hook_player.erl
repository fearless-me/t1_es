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
-include("netmsg.hrl").
-include("pub_def.hrl").
-include("gs_common_rec.hrl").
-include("gs_cache_inc.hrl").


%% API
-export([on_account_login/3, on_create/1, on_login/1, on_offline/0]).
-export([on_tick/0, on_second/0, on_minute/0, on_hour/0, on_sharp/1]).
-export([on_change_map/2, on_rw_update/2]).

%%-------------------------------------------------------------------
on_account_login(Aid, Pid, Sock) ->
    gs_cache:add_account_socket(Aid, Pid, Sock),
    gs_db_interface:action_data_(Aid, load_player_list, Aid),
    ok.

%%-------------------------------------------------------------------
on_create(Uid) ->
    player_pub:send_net_msg(#pk_GS2U_CreatePlayerResult{uid = Uid}),
    ?DEBUG("[hook]Aid ~p create new player ~w",
        [player_rw:get_aid(), Uid]),
    ok.

%%-------------------------------------------------------------------
on_login(Player) ->
    Aid = player_rw:get_aid(),
    cross_interface:assign_cross_for_me(Aid),
    player_base:init(Player),
    player_base:send_init_data(),
    gs_cache:online(Player, self(), player_pub:socket()),
    player_cross_priv:online(),
    player_map_priv:online_call(Player),
    player_alarm:init(),
    player_sub:tick_go(),
    ?DEBUG("[hook]Aid ~p player login ~w",
        [player_rw:get_aid(), player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_offline() ->
    %% 1.
    #m_player_map{
        map_id = Mid,
        map_pid = MPid,
        line_id = LineId
    } = player_rw:get_map(),
    Uid = player_rw:get_uid(),
    Aid = player_rw:get_aid(),

    %% 2.
    ?TRY_CATCH(player_map_priv:offline_call(Uid, Mid, LineId, MPid), Err1, St1),
    ?TRY_CATCH(player_cross_priv:offline(), Err2, St2),
    ?TRY_CATCH(gs_cache:offline(Aid, Uid), Err3, St3),
    ?TRY_CATCH(player_alarm:save(), Err4, St4),
    ?TRY_CATCH(player_save:save(Uid), Err5, St5),
    ?WARN("player ~p exit map_~p_~p", [Uid, Mid, LineId]),
    ok.

%%-------------------------------------------------------------------
on_change_map(OldMap, NewMap) ->
    ?DEBUG("[hook]Aid ~p  player ~p change map from ~w to ~w",
        [player_rw:get_aid(), player_rw:get_uid(), OldMap, NewMap]),
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
    ?INFO("player ~p on_hour", [player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_sharp(Hour) ->
    ?INFO("player ~p on_sharp ~p", [player_rw:get_uid(), Hour]),
    ok.

%%-------------------------------------------------------------------
-define(lock(X), lock_transaction(X)).
-define(unlock(), unlock_transaction()).

%%不要在调用lib_player_rw:set_xxx
on_rw_update(level, Level) ->
    ?lock(level),
    Uid = player_rw:get_uid(),
    gs_cache:update_player_pub(Uid, {#m_cache_player_pub.level, Level}),
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

