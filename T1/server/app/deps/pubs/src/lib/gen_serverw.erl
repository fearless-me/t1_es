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
-export([
    pause_effective_monitor/1, continue_effective_monitor/2,
    status_self/0, status/1, status_/1
]).
-export([
    start_link/1, start_link/2, start_link/3, start_link/4,
    start_link2/1, start_link2/2, start_link2/3, start_link2/4,
    init/1, init_loop/2, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3
]).

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
-define(FULL_SWEEP, {fullsweep_after, 50}).
-define(FULL_SWEEP_OPTIONS, {spawn_opt, [?FULL_SWEEP]}).
-define(EFFECTIVE_MONITOR_GUARD, effective_monitor_guard).
-define(EFFECTIVE_MONITOR_INFO, effective_monitor_info).
-define(EFFECTIVE_MONITOR_MIN_MILLISECOND, 500). %% 毫秒
-define(TIMELINE_KEY, msg_deal_timer).
-define(TC(MFA, Msg), case i_need_effective_monitor() of
                          0 -> catch accumulated_msg(0), MFA;
                          _ -> catch tc_start(), RetVal = MFA, catch tc_end(Msg), RetVal
                      end).
-record(msg_exe_monitor_info, {msg = 0, timeout = 0, all = 0, max = 0, min = 0, start, latest}).
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
pause_effective_monitor(Name) ->
    ps:send(Name, pause_effective_monitor).

continue_effective_monitor(Name, Millisecond) ->
    ps:send(Name, continue_effective_monitor, Millisecond).

status_self() ->
    try
        Info = erlang:get(?EFFECTIVE_MONITOR_INFO),
        i_format_monitor_info(Info)
    catch _ : Error : _ -> Error
    end.

i_format_monitor_info(#msg_exe_monitor_info{
    msg = MsgNum, timeout = Timeout, all = All, max = Max, min = Min, start = Start
}) ->
    Base = erlang:get(?EFFECTIVE_MONITOR_GUARD),
    [{MsgNum, Timeout, Base}, [Min, Max, All], [Start, misc_time:localtime_int()]];
i_format_monitor_info(_) -> undefined.

micro_to_milli(Val) -> erlang:trunc(Val / 1000).

status(Name) ->
    gen_server:call(Name, inner_core_status).

status_(Name) ->
    ps:send(Name, inner_core_status).

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
        i_auto_effective_monitor(),
        EffectiveMilliseconds = i_need_effective_monitor(),
        ?INFO("~p|~p|~p|~p init ok", [misc:registered_name(), Module, self(), EffectiveMilliseconds]),
        Ret
    catch _ : Error : ST ->
        ?ERROR("module ~p,args ~p,error ~p,st ~p", [get(?LogicModule), Args, Error, ST]),
        {stop, Error}
    end.

init_loop(Module, ArgList) ->
    put(?LogicModule, Module),
    EffectiveMilliseconds = i_need_effective_monitor(),
    ?INFO("~p|~p|~p|~p init ok", [misc:registered_name(), Module, self(), EffectiveMilliseconds]),
    State = Module:mod_init(ArgList),
    gen_server:enter_loop(?MODULE, [], State).

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
handle_call(inner_core_status, _From, State) ->
    try {reply, gen_serverw:status_self(), State}
    catch _: Error : _ -> {reply, Error, State}
    end;
handle_call(Request, From, State) ->
    Module = get(?LogicModule),
    try ?TC(Module:do_handle_call(Request, From, State), {Request, From})
    catch T : E : ST ->
        ?ERROR("~p|~p call ~w:~p,stack:~p", [self(), misc:registered_name(), T, E, ST]),
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
        ?ERROR("~p|~p cast ~w:~p,stack:~p", [self(), misc:registered_name(), T, E, ST]),
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
handle_info(pause_effective_monitor, State) ->
    catch erlang:put(?EFFECTIVE_MONITOR_GUARD, 0),
    {noreply, State};
handle_info({continue_effective_monitor, Milliseconds}, State) ->
    catch erlang:put(?EFFECTIVE_MONITOR_GUARD, Milliseconds),
    {noreply, State};
handle_info(inner_core_status, State) ->
    catch ?WARN("~n***~p|~p~n~p~n***~n", [self(), misc:registered_name(), gen_serverw:status_self()]),
    {noreply, State};
handle_info(Info, State) ->
    Module = get(?LogicModule),
    try ?TC(Module:do_handle_info(Info, State), Info)
    catch T : E : ST ->
        ?ERROR("~p ~p|~p info ~p:~p,stack:~p", [node(), self(), misc:registered_name(), T, E, ST]),
        {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @spec terminate(Reason, State) -> void()
%% 
%%--------------------------------------------------------------------
terminate(Reason, State) ->
    Module = get(?LogicModule),
    catch ?INFO("~p,~p|~p terminate ~p status ~w",
        [Module, self(), misc:registered_name(), Reason, status_self()]),
    catch Module:on_terminate(Reason, State),
    ok.

%%--------------------------------------------------------------------
%% @private
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) -> {ok, State}.

%%--------------------------------------------------------------------
i_need_effective_monitor() ->
    misc:get_dict_def(?EFFECTIVE_MONITOR_GUARD, 0).

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
tc_start() ->
    put(?TIMELINE_KEY, misc_time:micro_seconds()).

tc_end(Msg) ->
    Td = misc:get_dict_def(?EFFECTIVE_MONITOR_GUARD, ?EFFECTIVE_MONITOR_MIN_MILLISECOND),
    Tf = case get(?TIMELINE_KEY) of
             undefine -> 0;
             StartTime -> micro_to_milli(misc_time:micro_seconds() - StartTime)
         end,
    accumulated_msg(Tf),
    i_tc_warn(Msg, Tf, Td).

i_tc_warn(_, Time, DeadLine) when Time < DeadLine ->
    skip;
i_tc_warn(Msg, Time, _) ->
    Self = self(),
    Mod = get(?LogicModule),
    erlang:spawn
    (
        fun() ->
            Bin = lists:sublist(lists:flatten(io_lib:format("~w", [Msg])), 1, 64),
            ?WARN
            (
                "***effective warning*** ~p|~p|~p ** ~p(ms) ** ~s **",
                [Mod, Self, misc:registered_name(Self), Time, Bin]
            )
        end
    ).


sweep_options(Options) ->
    case lists:keyfind(spawn_opt, 1, Options) of
        false -> [?FULL_SWEEP_OPTIONS | Options];
        {spawn_opt, SpawnOptions} -> add_sweep_options(Options, SpawnOptions)
    end.

add_sweep_options(Options, SpawnOptions) ->
    case lists:keyfind(fullsweep_after, 1, SpawnOptions) of
        false -> lists:keyreplace(spawn_opt, 1, Options, {spawn_opt, [?FULL_SWEEP | SpawnOptions]});
        _ -> Options
    end.


%%-------------------------------------------------------------------
set_monitor_info(Info) -> erlang:put(?EFFECTIVE_MONITOR_INFO, Info).
get_monitor_info() -> erlang:get(?EFFECTIVE_MONITOR_INFO).

%%-------------------------------------------------------------------
accumulated_msg(Milliseconds) ->
    Td = misc:get_dict_def(?EFFECTIVE_MONITOR_GUARD, ?EFFECTIVE_MONITOR_MIN_MILLISECOND),
    Info = do_accumulated_msg(get_monitor_info(), Milliseconds, Td),
    set_monitor_info(Info).

%%-------------------------------------------------------------------
do_accumulated_msg(#msg_exe_monitor_info{msg = C, timeout = TC, all = All, min = Min, max = Max} = Info, Milliseconds, Td) when Milliseconds > Td ->
    Info#msg_exe_monitor_info{
        msg = C + 1,
        timeout = TC + 1,
        all = All + Milliseconds,
        max = erlang:max(Max, Milliseconds),
        min = erlang:min(Min, Milliseconds)
    };
do_accumulated_msg(#msg_exe_monitor_info{msg = C, all = All, min = Min, max = Max} = Info, Milliseconds, _Td) ->
    Info#msg_exe_monitor_info{
        msg = C + 1,
        all = All + Milliseconds,
        max = erlang:max(Max, Milliseconds),
        min = erlang:min(Min, Milliseconds)
    };
do_accumulated_msg(_Any, Milliseconds, Td) when Milliseconds > Td ->
    #msg_exe_monitor_info{msg = 1, timeout = 1, all = Milliseconds, max = Milliseconds, min = Milliseconds, start = misc_time:localtime_int()};
do_accumulated_msg(_Any, Milliseconds, _Td) ->
    #msg_exe_monitor_info{msg = 1, timeout = 0, all = Milliseconds, max = Milliseconds, min = Milliseconds, start = misc_time:localtime_int()}.



-ifdef(RELEASE).
i_auto_effective_monitor() -> ok.
-else.
i_auto_effective_monitor() -> put(?EFFECTIVE_MONITOR_GUARD, ?EFFECTIVE_MONITOR_MIN_MILLISECOND).
-endif.