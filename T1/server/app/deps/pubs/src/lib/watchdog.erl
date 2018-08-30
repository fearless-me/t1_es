%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:28
%%%-------------------------------------------------------------------
-module(watchdog).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").

-callback start_link() -> {'ok', pid()} | 'ignore' | {'error', term()}.
-callback task_list() -> [#watchdog_task{}].

%% API
-export([
    wait/0, status/0, status_/0,
    ready/1, ready/0,
    add_task/1, add_task_list/1
]).
-export([start_link/1, start_link/2, mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


%%%===================================================================
%% define
-define(ServerState, serverStateEts_).
-record(state, {all = [], todo = []}).
%%%===================================================================
wait() ->
    wait_all_started(),
    status(),
    ok.

add_task_list(TaskList) ->
    gen_server:call(?MODULE, {add_task, TaskList}, infinity).

add_task(Task) ->
    gen_server:call(?MODULE, {add_task, [Task]}, infinity),
    ok.

status() ->
    gen_server:call(?MODULE, status, infinity).

status_() ->
    ps:send(?MODULE, status).

ready(V) ->
    ets:insert(?ServerState, #pub_kv{key = 1, value = V}).

ready() ->
    case catch ets:lookup(?ServerState, 1) of
        [#pub_kv{value = V}] -> misc:i2b(V);
        _ -> false
    end.

wait_all_started() ->
    TaskList = gen_server:call(?MODULE, tasklist),
    lists:foreach(
        fun(#watchdog_task{check_fun = F, tip = Tip}) ->
            wait_all_started_1(F, Tip)
        end, TaskList),
    ok.

wait_all_started_1(Fun, Tip) ->
    case catch wrapper_check(Fun(), Tip) of
        true ->
            ?WARN("~ts done #", [Tip]);
        _ ->
            timer:sleep(5000),
            wait_all_started_1(Fun, Tip)
    end.

wrapper_check(true, _) -> true;
wrapper_check(Ret, Msg) -> ?WARN("wait ~ts ~p ...", [Msg, Ret]), false.
%%%===================================================================
%%% public functions
%%%===================================================================

start_link(Mod) ->
    gen_serverw:start_link({local, ?WATCHDOG_OTP}, ?MODULE, Mod, []).

start_link(Name, Mod) ->
    gen_serverw:start_link({local, Name}, ?MODULE, Mod, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(Mod) ->
    TaskList = Mod:task_list(),
    erlang:process_flag(trap_exit, true),
    ets:new(?ServerState, [public, named_table, {keypos, #pub_kv.key}, ?ETS_RC]),
    {ok, #state{all = TaskList, todo = TaskList}}.

%%--------------------------------------------------------------------
do_handle_call({add_task, TaskList}, _From, State) ->
    #state{all = All, todo = ToDo} = State,
    {reply, ok, #state{all = lists:append(TaskList, All), todo = lists:append(TaskList, ToDo)}};
do_handle_call(tasklist, _From, State) ->
    #state{all = All} = State,
    {reply, All, State};
do_handle_call(status, _From, State) ->
    print_status(),
    {reply, ok, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(status, State) ->
    print_status(),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.
%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
print_status() ->
    ?DEBUG("status:~n"
    "======================================================================================================~n"
    "auto reload src dirs: ~n\t~ts~n"
    "auto reload inc dirs: ~n\t~ts~n"
    "auto reload opt info: ~n\t~p~n"
    "auto reload interval: ~w(milliseconds)~n"
    "======================================================================================================",
        [
            io_lib:format("~ts", [misc:list_to_string_suffix(fly:info(src_dirs), "\n\t")]),
            io_lib:format("~ts", [misc:list_to_string_suffix(fly:info(inc_dirs), "\n\t")]),
            fly:info(opts),
            fly:info(interval)
        ]
    ),
    misc:system_info(),
    ok.
