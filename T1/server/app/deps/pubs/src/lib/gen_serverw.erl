%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 五月 2018 11:34
%%%-------------------------------------------------------------------
-module(gen_serverw).
-author("mawenhong").

-behaviour(gen_server).
-include("logger.hrl").

-callback mod_init(Args :: term()) ->
    {ok, State :: term()} | {ok, State :: term(), timeout() | hibernate} |
    {stop, Reason :: term()} | ignore.
-callback do_handle_call(Request :: term(), From :: {pid(), Tag :: term()},
    State :: term()) ->
    {reply, Reply :: term(), NewState :: term()} |
    {reply, Reply :: term(), NewState :: term(), timeout() | hibernate} |
    {noreply, NewState :: term()} |
    {noreply, NewState :: term(), timeout() | hibernate} |
    {stop, Reason :: term(), Reply :: term(), NewState :: term()} |
    {stop, Reason :: term(), NewState :: term()}.
-callback do_handle_info(Request :: term(), State :: term()) ->
    {noreply, NewState :: term()} |
    {noreply, NewState :: term(), timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: term()}.
-callback do_handle_cast(Info :: timeout | term(), State :: term()) ->
    {noreply, NewState :: term()} |
    {noreply, NewState :: term(), timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: term()}.

%% define
-define(LogicModule, myLogicModule).

%% API
-export([start_link/1, start_link/2, start_link/3, start_link/4]).
-export([start_link2/1, start_link2/2, start_link2/3, start_link2/4]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
    terminate/2, code_change/3]).

%%%===================================================================
%%% public functions
%%%===================================================================	
start_link(Module) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [Module, []], []).

start_link(Module, Args) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [Module, Args], []).

start_link(Module, Args, Options) ->
    gen_server:start_link(?MODULE, [Module, Args], Options).

start_link(Name, Module, Args, Options) ->
    gen_server:start_link(Name, ?MODULE, [Module, Args], Options).

%%--------------------------------------------------------------------
start_link2(Module) ->
    gen_server2:start_link({local, ?MODULE}, ?MODULE, [Module], []).

start_link2(Module, Args) ->
    gen_server2:start_link({local, ?MODULE}, ?MODULE, [Module, Args], []).

start_link2(Module, Args, Options) ->
    gen_server2:start_link(?MODULE, [Module, Args], Options).

start_link2(Name, Module, Args, Options) ->
    gen_server2:start_link(Name, ?MODULE, [Module, Args], Options).

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%  {ok, State, Timeout} | ignore | {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init(Args) ->
    try
        [Module, ArgList] = Args,
        put(?LogicModule, Module),
        random:seed(os:timestamp()),
        Module:mod_init(ArgList)
    catch
        _ : Error ->
            ?ERROR("module ~p,args ~p,error ~p,st ~p",
                [get(?LogicModule), Args, Error, misc:stacktrace()]),
            {stop, Error}
    end
.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%% @spec handle_call(_Request, _From, State) ->
%% {reply, Reply, NewState} |
%% {reply, Reply, NewState, timeout() | hibernate} |
%% {noreply, NewState} | {noreply, NewState, timeout() | hibernate} |
%% {stop, Reason, Reply, NewState} | {stop, Reason, NewState}
%%
%% @end
%%--------------------------------------------------------------------
handle_call(Request, From, State) ->
    Module = get(?LogicModule),
    try Module:do_handle_call(Request, From, State)
    catch T : E ->
            ?ERROR("call ~w:~p,stack:~p", [T, E, erlang:get_stacktrace()]),
            {reply, E, State}
    end.
%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% {noreply, NewState}} |
%% {noreply, NewState, timeout() | hibernate} |
%% {stop, Reason, NewState}
%%
%% @end
%%--------------------------------------------------------------------
handle_cast(Request, State) ->
    Module = get(?LogicModule),
    try Module:do_handle_cast(Request, State)
    catch T : E ->
            ?ERROR("cast ~w:~p,stack:~p", [T, E, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> 
%% 	{noreply, State} | {noreply, State, Timeout} | {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(Info, State) ->
    Module = get(?LogicModule),
    try Module:do_handle_info(Info, State)
    catch T : E ->
            ?ERROR("info ~w:~p,stack:~p", [T, E, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @spec terminate(Reason, State) -> void()
%% 
%%--------------------------------------------------------------------
terminate(Reason, _State) ->
    Module = get(?LogicModule),
    ?INFO("~p,~p terminate ~p", [Module, self(), Reason]),
    ok.

%%--------------------------------------------------------------------
%% @private
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) -> {ok, State}.
