%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:28
%%%-------------------------------------------------------------------
-module(sentinel_server).
-author("mawenhong").

-behaviour(gen_serverw).
-include("pub_common.hrl").
-include("logger.hrl").

%% define
-record(state, {}).

%% API
-export([wait_all_started/0]).
-export([status/0, status_/0]).
-export([ready/1, ready/0]).
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% API
%%%===================================================================
status()->
    gen_server:call(?MODULE, status, infinity).

status_()->
    ps:send(?MODULE, status).

ready(V) ->
    ets:insert(?ServerState, #kv{k = 1, v = V}).

ready()->
    case catch ets:lookup(?ServerState, 1) of
        [#kv{v = V}] -> misc:i2b(V);
        _ -> false
    end.


wait_all_started()->
   wait_all_started_1(
       fun gloader:is_task_all_done/0,
       "wait all data load ...",
       " all data load done"
   ),
   ok.

wait_all_started_1(Fun, Tip, Done) ->
    case catch wrapper_check(Fun(), Tip) of
        true ->
            ?WARN("~ts",[Done]);
        _ ->
            timer:sleep(5000),
            wait_all_started_1(Fun, Tip, Done)
    end.

wrapper_check(true, _) -> true;
wrapper_check(_, Msg) -> ?WARN("wait ~ts...", [Msg]), throw(wait).
%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    ets:new(?ServerState,
        [public, named_table, {keypos, #kv.k}, {read_concurrency, true},{write_concurrency, true}]),
    {ok, #state{}}.

%%--------------------------------------------------------------------
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
print_status()->
    ?DEBUG("status:~n"
    "==========~n"
    "auto reload src dirs: ~n\t~ts~n"
    "auto reload inc dirs: ~n\t~ts~n"
    "auto reload opt info: ~n\t~p~n"
    "auto reload interval: ~w(milliseconds)~n"
    "==========",
        [
            io_lib:format("~ts",[misc:list_to_string_suffix(fly:info(src_dirs), "\n\t")]),
            io_lib:format("~ts",[misc:list_to_string_suffix(fly:info(inc_dirs), "\n\t")]),
            fly:info(opts),
            fly:info(interval)
        ]
    ),
    ok.
