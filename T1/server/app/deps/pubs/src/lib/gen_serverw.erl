%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 为什么要提供一个对gen_server(2)的封装
%%% 是因为我可以方面的统一做控制
%%% 比如针对GC，消息量、处理时间的监控，
%%% 而不需要去改动任何逻辑层的代码
%%% 而付出的代价是性能的些许损耗，但是在可接受范围之类
%%% 参考测试数据: {@link test:*_apply , *_fun, *_call}
%%% @end
%%% Created : 07. 五月 2018 11:34
%%%-------------------------------------------------------------------
-module(gen_serverw).
-author("mawenhong").

-behaviour(gen_server).
-include("logger.hrl").

%% API
-export([start_link/1, start_link/2, start_link/3, start_link/4]).
-export([start_link2/1, start_link2/2, start_link2/3, start_link2/4]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

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
-callback on_terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
    State :: term()) ->
    term().

-optional_callbacks([on_terminate/2]).

%% define
-define(LogicModule, myLogicModule).
-define(FULL_SWEEP, {fullsweep_after, 20}).
-define(FULL_SWEEP_OPTIONS, {spawn_opt,[?FULL_SWEEP]}).
-define(TC(F, Request), tc(fun()-> F end, Request)).
-define(TIMELINE_MICROSECOND, 5000).
%% 假设帧率是 20MS那么是50个消息/client/秒, 服务50client，
%% 那么每个消息  1000*1000/2500 = 400micro seconds
%% 所以每个消息最大处理时间(micro seconds)= 100000 / ClientCount / 1000 / frame_time
%% client count tick_time(milli seconds)  per msg time(micro seconds)
%%    50                20                     400
%%    50                25                     500
%%    50                50                     1000
%%    50                100                    2000
%%    100               20                     200
%%     **

%%%===================================================================
%%% public functions
%%%===================================================================	
start_link(Module) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [Module, []], [?FULL_SWEEP_OPTIONS]).

start_link(Module, Args) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [Module, Args], [?FULL_SWEEP_OPTIONS]).

start_link(Module, Args, Options) ->
    gen_server:start_link(?MODULE, [Module, Args], sweep_options(Options)).

start_link(Name, Module, Args, Options) ->
    gen_server:start_link(Name, ?MODULE, [Module, Args], sweep_options(Options)).

%%--------------------------------------------------------------------
start_link2(Module) ->
    gen_server2:start_link({local, ?MODULE}, ?MODULE, [Module], [?FULL_SWEEP_OPTIONS]).

start_link2(Module, Args) ->
    gen_server2:start_link({local, ?MODULE}, ?MODULE, [Module, Args], [?FULL_SWEEP_OPTIONS]).

start_link2(Module, Args, Options) ->
    gen_server2:start_link(?MODULE, [Module, Args], sweep_options(Options)).

start_link2(Name, Module, Args, Options) ->
    gen_server2:start_link(Name, ?MODULE, [Module, Args], sweep_options(Options)).


%%--------------------------------------------------------------------
sweep_options(Options) ->
    case lists:keyfind(spawn_opt, 1, Options) of
    false -> [?FULL_SWEEP_OPTIONS | Options ];
    {spawn_opt, SpawnOptions} ->  add_sweep_options(Options, SpawnOptions)
    end.

add_sweep_options(Options, SpawnOptions) ->
    case lists:keyfind(fullsweep_after, 1, SpawnOptions) of
        false -> lists:keyreplace(spawn_opt, 1, Options, {spawn_opt,[?FULL_SWEEP | SpawnOptions]});
        _ ->  Options
    end.

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
        Ret = Module:mod_init(ArgList),
        ?INFO("~p|~p|~p init ok", [misc:registered_name(), Module, self()]),
        Ret
    catch _ : Error : ST ->
        ?ERROR("module ~p,args ~p,error ~p,st ~p", [get(?LogicModule), Args, Error, ST]),
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
    try ?TC(Module:do_handle_call(Request, From, State), {Request, From})
    catch T : E : ST ->
        ?ERROR("call ~w:~p,stack:~p", [T, E, ST]),
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
    try ?TC(Module:do_handle_cast(Request, State), Request)
    catch T : E : ST ->
        ?ERROR("cast ~w:~p,stack:~p", [T, E, ST]),
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
    try ?TC(Module:do_handle_info(Info, State), Info)
    catch T : E : ST ->
        ?ERROR("~p info ~p:~p,stack:~p", [node(), T, E, ST]),
        {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @spec terminate(Reason, State) -> void()
%% 
%%--------------------------------------------------------------------
terminate(Reason, State) ->
    Module = get(?LogicModule),
    ?INFO("~p,~p|~p terminate ~p", [Module, self(), misc:registered_name(), Reason]),
    catch Module:on_terminate(Reason, State),
    ok.

%%--------------------------------------------------------------------
%% @private
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) -> {ok, State}.


tc(F, Request) ->
    T1 = misc_time:micro_seconds(),
    Val = F(),
    T2 = misc_time:micro_seconds(),
    case T2 - T1  of
    Time when Time > ?TIMELINE_MICROSECOND ->
        ?WARN(
            "~p,~p|~p deal ~w use time ~p micro seconds",
            [get(?LogicModule), self(), misc:registered_name(), Request, Time]
        );
    _Any -> skip
    end,
    Val.