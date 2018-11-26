%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 十一月 2018 14:46
%%%-------------------------------------------------------------------
-module(cross_player_bg).
-author("Administrator").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("gs_cache.hrl").
-include("map_core.hrl").
-include("pub_def.hrl").


%% API
-export([clear/1, clear/2, ack/1]).
-export([start_link/1]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

ack(Pid) -> gen_server:cast(Pid, ack).
clear(Pid) -> gen_server:cast(Pid, clear).
clear(Pid, Reason) -> gen_server:cast(Pid, {clear, Reason}).


-define(EXCEPTION_CHECK, 3*60*1000).
-define(ACK_CHECK, 30*1000).
-define(ACK_FLAG, ack_check).
%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Args) ->
    gen_serverw:start_link(?MODULE, Args, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init([Aid, Uid, Pid]) ->
    try
        erlang:process_flag(trap_exit, true),
        Ref = erlang:monitor(process, Pid),
        set_ref(Ref),
        set_aid(Aid),
        set_uid(Uid),
        set_pid(Pid),
        PsName = misc:create_atom(?MODULE, [Aid]),
        case erlang:whereis(PsName) of
           undefined ->
               true = misc:loop_register_process(self(), PsName, 1);
           Pid ->
               cross_player_bg:clear(Pid, repeat_login),
               true = misc:loop_register_process(self(), PsName, 5)
        end,
        erlang:put(?ACK_FLAG, misc_time:utc_seconds()),
        erlang:send_after(?ACK_CHECK, self(), ?ACK_FLAG),
        ?WARN("~p bind player ~w of account ~p monitor pid ~p ref ~p",
            [self(), Uid, Aid, Pid, Ref]),
        {ok, ok}
    catch _ : Error:_ ->
        ?ERROR("~p bind player ~w of account ~p monitor pid ~p error ~p",
            [self(), Uid, Aid, Pid, Error]),
        {stop, Error}
    end.


%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({'EXIT', _From, Reason}, State) ->
    i_clear(Reason),
    {stop, normal, State};
do_handle_info({'DOWN', _, process, _, _}, State) ->
    i_clear('DOWN'),
    {stop, normal, State};
do_handle_info(tick_check, State) ->
    i_tick_check(),
    {noreply, State};
do_handle_info(?ACK_FLAG, State) ->
    i_ack_check(erlang:get(?ACK_FLAG)),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(ack, State) ->
    catch erlang:erase(?ACK_FLAG),
    {noreply, State};
do_handle_cast(clear, State) ->
    catch i_clear(clear),
    {stop, normal, State};
do_handle_cast({clear, Reason}, State) ->
    catch i_clear(Reason),
    {stop, normal, State};
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
set_aid(Aid) -> erlang:put(aid, Aid).
get_aid() -> erlang:get(aid).
set_uid(Uid) -> erlang:put(uid, Uid).
get_uid() -> erlang:get(uid).
set_pid(Pid) -> erlang:put(pid, Pid).
get_pid() -> erlang:get(pid).

set_ref(Ref) -> erlang:put(monitor_ref, Ref).
get_ref() -> erlang:get(monitor_ref).

%%--------------------------------------------------------------------
i_tick_msg() ->
    erlang:send_after(?EXCEPTION_CHECK, self(), tick_check).

i_tick_check() ->
    catch i_tick_msg(),
    Uid = get_uid(),
    IsInMap = object_priv:object_priv_exist(?OBJ_PLAYER, Uid),
    IsOnline= gs_cache_interface:is_player_online(Uid),
    catch ?if_else( not (IsInMap andalso IsOnline), i_clear(tick_check), skip),
    ok.

%%--------------------------------------------------------------------
i_ack_check(undefined)->
    skip;
i_ack_check(_)->
    i_clear(ack_time_out).

i_clear(Reason) ->
    Aid = get_aid(),
    Uid = get_uid(),

    catch ?WARN("player ~w pid ~p of account ~p exit in cross reason ~p ...",
        [Uid, get_pid(), Aid, Reason]),

    catch erlang:demonitor(get_ref()),
    try
        case object_priv:find_object_priv(?OBJ_PLAYER, Uid) of
            #m_cache_map_object_priv{map_pid = MPid} ->
                catch map_interface:player_exit_map_exception_(MPid, Uid);
            _ -> skip
                %% @doc 正常情况不需要这个，为了确保万无一失处理下
%%                case catch gs_cache_interface:get_online_player(Uid) of
%%                    #m_cache_online_player{map_pid = MapPid} ->
%%                        catch map_interface:player_exit_map_exception_(MapPid, Uid);
%%                    _ -> skip
%%                end
        end
    catch _:_:_  -> skip
    end,

    catch gs_cache_interface:offline(Aid, Uid),
    catch ?WARN("player ~w pid ~p of account ~p exit in cross reason ~p ... done#",
        [Uid, get_pid(), Aid, Reason]),
    ok.