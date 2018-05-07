%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:35
%%%-------------------------------------------------------------------
-module(dbs_worker_manager).
-author("mawenhong").

-behaviour(gen_serverw).
-include("dbs_private.hrl").
-include("logger.hrl").

%% define
-record(state, {worker_size = 0}).

%% API
-export([start_link/0]).
-export([get_worker_pid/1,get_worker_pid_/1]).
-export([get_worker_size/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).



%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% API
%%%===================================================================
get_worker_pid(PlayerID) ->
    gen_server:call(?MODULE, {get_worker_pid, PlayerID}, infinity).

get_worker_pid_(PlayerID) ->
    Count = dbs_worker_manager:get_worker_size(),
    [#dbs_worker_info{ pid = Pid }]
        = ets:lookup(?WorkerEts, misc:mod_1(PlayerID, Count)),
    Pid.

get_worker_size()->
    ets:info(?WorkerEts, size).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    ets:new(?WorkerEts,
        [protected, set, named_table, {keypos, #dbs_worker_info.id}, {read_concurrency, true}]),
    start_worker_pool(),
    {ok, #state{worker_size = ets:info(?WorkerEts, size)}}.
%%--------------------------------------------------------------------
do_handle_call({get_worker_pid, PlayerID}, _From, #state{worker_size = Count} = State) ->
    [#dbs_worker_info{ pid = Pid }]
        = ets:lookup(?WorkerEts, misc:mod_1(PlayerID, Count)),
    {reply, Pid, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------\
do_handle_info({'DOWN', _MRef, _process, _Pid, normal}, State) ->
    {noreply, State};
%%info({'EXIT',_Port,normal}, State) ->
%%    {noreply, State};
do_handle_info({'DOWN', MRef, process, Pid, Reason}, State) ->
    ?ERROR("dbs worker ~w ~w crash ~w",
        [Pid,  erlang:process_info(Pid,[registered_name]), Reason]),
    case ets:match_object(?WorkerEts,
        #dbs_worker_info{ref = MRef, _ = '_'}) of
        [#dbs_worker_info{id = Id}] ->
            start_worker(Id);
        _ ->
            skip
    end,
    {noreply, State#state{worker_size = ets:info(?WorkerEts, size)}};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.
%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
start_worker_pool() ->
    Num = erlang:max(mod_ini_conf:get_dbs_worker_num(), 10),
    lists:foreach(
        fun(Index) -> start_worker(Index) end, lists:seq(1, Num)),
    ok.

start_worker(Index) ->
    {ok, Pid} = dbs_worker_supervisor:start_child([Index]),
    Mref = erlang:monitor(process, Pid),
    ets:insert(?WorkerEts, #dbs_worker_info{id = Index,
        ref = Mref, pid = Pid}),
    ok.
