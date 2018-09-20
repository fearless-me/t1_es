%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 八月 2018 16:53
%%%-------------------------------------------------------------------
-module(dist_monitor).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").

-callback start_link() -> {'ok', pid()} | 'ignore' | {'error', term()}.
-callback slave_started(SlaveNode :: atom()) -> ok.


%% API
-export([is_all_slaves_stared/0]).
-export([start_link/1]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


%%===================================================================
-record(state, {slaves = [], wait= [], mod}).
%%===================================================================

is_all_slaves_stared() ->
    gen_server:call(?DIST_MONITOR_OTP, all_slaves_stared).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Mod) ->
    gen_serverw:start_link({local, ?DIST_MONITOR_OTP}, ?MODULE, Mod, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(Mod) ->
    erlang:process_flag(trap_exit, true),
    {ok, #state{mod = Mod}}.

%%--------------------------------------------------------------------
do_handle_call(all_slaves_stared, _From, #state{wait = Wait } = State) ->
    Ret = ?if_else(Wait =:= [], true, Wait),
    {reply, Ret, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({slave_register, SlaveNode}, State) ->
    ?WARN("node ~p slave node register ~p",[node(), SlaveNode]),
    erlang:monitor_node(SlaveNode, true),
    #state{wait = Wait, slaves = Slaves } = State,
    {noreply, State#state{slaves = [SlaveNode | Slaves], wait = [SlaveNode | Wait]}};
do_handle_info({slave_started, SlaveNode}, State) ->
    ?WARN("node ~p slave node started ~p",[node(), SlaveNode]),
    #state{wait = Wait, mod = Mod} = State,
    Mod:slave_started(SlaveNode),
    {noreply, State#state{wait = lists:delete(SlaveNode, Wait)}};
do_handle_info({nodedown, Node}, State) ->
    ?FATAL("***** distribution noe ~p down ***",[Node]),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.