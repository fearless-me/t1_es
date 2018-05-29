%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 五月 2018 14:16
%%%-------------------------------------------------------------------
-module(gs_db_manager).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_common.hrl").
-include("common_record.hrl").
-include("gsdef.hrl").

-export([all_db_connected/0]).
-export([send_to_dbs/3]).

%% API
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


all_db_connected()->
    ets:foldl(
        fun
            (_, false)-> false;
            (#r_gs_db_info{status = Status}, _)->  Status =:= ?SS_DONE
        end, true, ?ETS_GS_DBS).


send_to_dbs(AccId, MsgId, Msg) ->
    Size = ets:info(?ETS_GS_DBS, size),
    L = ets:tab2list(?ETS_GS_DBS),
    #r_gs_db_info{pid = Pid} = lists:nth( AccId rem Size, L),
    ps:send_with_from(Pid, MsgId, Msg).



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
    erlang:process_flag(priority, high),
    ets:new(?ETS_GS_DBS, [named_table, public, {keypos, #r_gs_db_info.node}, ?ETSRC, ?ETSWC]),
    start_all_db_worker(),
    {ok, #{}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.
%%--------------------------------------------------------------------
start_all_db_worker() ->
    List = gs_core:get_db_nodes(),
    lists:foreach(
        fun(Node)->
            start_worker_1(Node)
        end , List),
    ok.

%%--------------------------------------------------------------------
start_worker_1(Node) ->
    case ets:lookup(?ETS_GS_DBS, Node) of
        [#r_gs_db_info{}] ->
            ok;
        [] ->
            connect_db_action(Node)
    end,
    ok.

%%--------------------------------------------------------------------
connect_db_action(DbNodeName) ->
    {ok, WorkerPid} = gs_db_supervisor:start_child(DbNodeName),
    ?INFO("gs to db ~p 's window ~p start ok",[DbNodeName, WorkerPid]),
    ok.


