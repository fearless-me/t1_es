%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:30
%%%-------------------------------------------------------------------
-module(dbs_worker).
-author("mawenhong").

-behaviour(gen_serverw).
-include("dbs_private.hrl").
-include("logger.hrl").
-include("dbs_worker_private.hrl").

%% API
-export([save_player_data_/2,  load_player_data_/2]).
-export([save_player_data/2, load_player_data/2]).
-export([status_/1, status/1]).

-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Index) ->
    gen_serverw:start_link2(?MODULE, [Index],[]).

%%%===================================================================
%%% API
%%%===================================================================
save_player_data_(Worker, Data) ->
    ps_mgr:send(Worker, {save_player_data, Data}).

save_player_data(Worker, Data) ->
    gen_server2:call(Worker,{save_player_data, Data}, infinity).

load_player_data_(Worker, PlayerID) ->
    ps_mgr:send(Worker, {load_player_data, {self(), PlayerID}}).

load_player_data(Worker, PlayerID) ->
    gen_server2:call(Worker, {load_player_data,PlayerID}, infinity).

status_(Worker) ->
    ps_mgr:send(Worker, status).

status(Worker) ->
    gen_server2:call(Worker, status).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init([Index]) ->
    NameAtom = erlang:list_to_atom(lists:flatten(io_lib:format("~w_~w", [?MODULE, Index]))),
    true = erlang:register(NameAtom, self()),
    erlang:process_flag(trap_exit, true),
    {ok, #state{save = 0, load = 0, name = NameAtom}}.

%%--------------------------------------------------------------------
do_handle_call(status, _From,
    #state{save = Saved, load = Loaded, name = Name} = State
) ->
    {reply, {Saved, Loaded, Name}, State};
do_handle_call({save_player_data, Data}, _From, #state{save = Saved, name = Name} = State) ->
    Ret = mod_player_cache_manager:save(Data#player_data{worker = io_lib:format("~p",[Name])}),
    {reply, Ret, State#state{save = Saved + 1}};
do_handle_call({load_player_data, RoleID}, _From,  #state{load = Loaded} = State) ->
    Data = mod_player_cache_manager:load(RoleID),
    {reply, Data, State#state{load = Loaded + 1}};
do_handle_call(status, _From,
    #state{save = Saved, load = Loaded, name = Name} = State
) ->
    {reply, {Saved, Loaded, Name}, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------

do_handle_info(status,
    #state{save = Saved, load = Loaded, name = Name} = State
) ->
    ?INFO("status[~p/~p] load:~w, save:~w", [self(), Name, Loaded, Saved]),
    {noreply, State};
do_handle_info({save_player_data, Data}, #state{save = Saved, name = Name} = State) ->
    mod_player_cache_manager:save(Data#player_data{worker = io_lib:format("~p",[Name])}),
    {noreply, State#state{save = Saved + 1}};
do_handle_info({load_player_data, {From, RoleID}}, #state{load = Loaded} = State) ->
    Data = mod_player_cache_manager:load(RoleID),
    ps_mgr:send(From, Data),
    {noreply, State#state{load = Loaded + 1}};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.
