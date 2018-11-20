%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十一月 2018 15:56
%%%-------------------------------------------------------------------
-module(lawman_srv).
-author("Administrator").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("gs_cache.hrl").


-define(CLEAR_PLAYER_FLAG, i_clear_online_players).
-define(FORBID_MSG_ID_ETS, forbid_msg_id_ets_).


%% API
-export([
    clear_now/2,
    forbid_msg/1, allow_msg/1, forbid_clear/0, is_msg_forbid/1
]).
-export([start_link/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%-------------------------------------------------------------------
clear_now(Sid, GSNode) ->
    gen_server:cast(?MODULE, {?CLEAR_PLAYER_FLAG, Sid, GSNode}).

%%kick_all_player_to_born_map(Reason) ->
%%    gen_server:cast(?MODULE, {kick_all_player_to_born_map, Reason}).

%%-------------------------------------------------------------------
is_msg_forbid(MsgId) ->
    misc_ets:member(?FORBID_MSG_ID_ETS, MsgId).

forbid_msg(MsgId) when is_integer(MsgId) ->
    misc_ets:write(?FORBID_MSG_ID_ETS, #pub_kv{key = MsgId, value = MsgId}),
    ok;
forbid_msg(MsgIdList) when is_list(MsgIdList)->
    Msgs = [  #pub_kv{key = MsgId, value = MsgId} || MsgId <- MsgIdList],
    misc_ets:write(?FORBID_MSG_ID_ETS, Msgs),
    ok.

allow_msg(MsgId) when is_integer(MsgId) ->
    misc_ets:delete(?FORBID_MSG_ID_ETS, MsgId);
allow_msg(MsgIdList) when is_list(MsgIdList)->
    lists:foreach(fun(MsgId)-> misc_ets:delete(?FORBID_MSG_ID_ETS, MsgId) end, MsgIdList).

forbid_clear() ->
    misc_ets:clear(?FORBID_MSG_ID_ETS).

%%-------------------------------------------------------------------


%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    misc_ets:new(?FORBID_MSG_ID_ETS, [public, {keypos, #pub_kv.key}, named_table, ?ETS_WC, ?ETS_RC]),
    {ok, ok}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({clear_done, Sid}, State) ->
    ?TRY_CATCH_ERROR(i_done_clear(Sid)),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast({?CLEAR_PLAYER_FLAG, Sid, GSNode}, State) ->
    case catch i_need_clear(Sid) of
        true -> ?TRY_CATCH_ERROR(i_clear_online_players(Sid, GSNode));
        _Any -> ?WARN("skip clear online player of ~p ",[{Sid, GSNode}])
    end,
    {noreply, State};
do_handle_cast({kick_all_player_to_born_map, Reason}, State) ->
    i_kick_all_player_to_born_map(Reason),
    {noreply, State};
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.

%%-------------------------------------------------------------------
i_kick_all_player_to_born_map(Reason)->
    erlang:spawn
    (
        fun() ->
            ?WARN("cross ~p kick all players to born map **~p**... ",[node(), Reason]),
            try
                QS = ets:fun2ms
                (
                    fun(Info)->
                        {
                            Info#m_cache_online_player.aid,
                            Info#m_cache_online_player.uid,
                            Info#m_cache_online_player.pid
                        }
                    end
                ),
                List = misc_ets:select(?ETS_CACHE_ONLINE_PLAYER, QS),
                lists:foreach
                (
                    fun({Aid, Uid, Pid}) ->
                        ?TRY_CATCH_ERROR(player_interface:kick_to_born_map_(Pid), Err1),
                        ?TRY_CATCH_ERROR(gs_cache_interface:offline(Aid, Uid), Err2),
                        catch ?WARN("\t*** kick player ~p of account ~p to born map  **~p**  ***",
                            [Uid, Aid, Reason])
                    end,
                    List
                ),

                MLL = map_creator_interface:select_all_map_pid(),
                lists:foreach
                (
                    fun(Pid) ->
                        ?TRY_CATCH_ERROR(map_interface:clear_online_player_immediately_(Pid))
                    end,
                    MLL
                ),
                ?WARN("cross ~p kick ~p player(s) to born map **~p** done#",
                    [node(), erlang:length(List), Reason])
            catch _ : _Err : _ST ->
                skip
            end

        end
    ),
    ok.

%%-------------------------------------------------------------------
i_need_clear(Sid) ->
    Now = misc_time:milli_seconds(),
    case erlang:get({?CLEAR_PLAYER_FLAG, Sid}) of
        undefined ->
            erlang:put({?CLEAR_PLAYER_FLAG, Sid}, Now),
            true;
        _ ->
            false
    end.

i_done_clear(Sid) ->
    Now = misc_time:milli_seconds(),
    Pre = erlang:erase({?CLEAR_PLAYER_FLAG, Sid}),
    ?WARN("~p clear online player of server ~p use time ~p (ms)",[node(), Sid, Now - Pre]),
    ok.

%%-------------------------------------------------------------------
i_clear_online_players(Sid, GSNode) when Sid > 0 ->
    ?WARN("*** server ~p|~p down, kick all players in this cross ... ***", [Sid, GSNode]),
    erlang:spawn
    (
        fun() ->
            try
                QS =
                    ets:fun2ms
                    (
                        fun(Info) when Info#m_cache_online_player.sid == Sid ->
                            {
                                Info#m_cache_online_player.aid,
                                Info#m_cache_online_player.uid,
                                Info#m_cache_online_player.map_pid
                            }
                        end
                    ),
                List = misc_ets:select(?ETS_CACHE_ONLINE_PLAYER, QS),
                lists:foreach(
                    fun({Aid, Uid, MPid}) ->
                        catch map_interface:player_exit_map_exception_(MPid, Uid),
                        catch gs_cache_interface:offline(Aid, Uid)
                    end, List),
                ?WARN("*** server ~p|~p down, kick ~p player(s) in this cross ... ***",
                    [Sid, GSNode, erlang:length(List)])
            catch _ : _ : _ -> skip
            end,
            catch ps:send(?MODULE, {clear_done, Sid})

        end
    ),
    ok;
i_clear_online_players(0, _Node) ->
    ?WARN("*** checkck all player in server ... ***"),
    erlang:spawn
    (
        fun() ->
             try
                 MLL = map_creator_interface:select_all_map_pid(),
                 lists:foreach
                 (
                     fun(Pid) ->
                         map_interface:clear_online_player_immediately_(Pid)
                     end,
                     MLL
                 ),

                 QS =
                     ets:fun2ms
                     (
                         fun(Info)->
                             {
                                 Info#m_cache_online_player.aid,
                                 Info#m_cache_online_player.uid,
                                 Info#m_cache_online_player.pid
                             }
                         end
                     ),
                 List = misc_ets:select(?ETS_CACHE_ONLINE_PLAYER, QS),
                 X = lists:foldl
                 (
                     fun({Aid, Uid, Pid}, Acc) ->
                         case misc:is_alive_rpc(Pid) of
                             true -> Acc;
                             _Any -> gs_cache_interface:offline(Aid, Uid), Acc+1
                         end
                     end, 0, List
                 ),
                 ?WARN("*** check all players in server done# clear ~p players ***",[X])
             catch _:_:_  -> skip
             end,
            catch ps:send(?MODULE, {clear_done, 0})
        end
    ),
    ok.