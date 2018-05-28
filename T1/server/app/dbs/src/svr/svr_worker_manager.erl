%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:40
%%%-------------------------------------------------------------------
-module(svr_worker_manager).
-author("mawenhong").

-behaviour(gen_serverw).
-include("dbs_private.hrl").
-include("logger.hrl").

%% define
-record(state, {}).

%% API
-export([start_link/0]).
-export([update_server_status/2]).
-export([add_server_info/1, get_server_info/1,del_server_info/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% API
%%%===================================================================
add_server_info(Info)-> ets:insert(?ServerEts, Info).

get_server_info(DBId) ->
    case ets:lookup(?ServerEts, DBId) of
        [#sever_info{} = Info] ->
            Info;
        _ ->
            undefined
    end.

del_server_info(DBId) -> ets:delete(?ServerEts, DBId).

update_server_status(DbId, Status) ->
    ets:update_element(?ServerEts, DbId, {#sever_info.status, Status}).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    ets:new(?ServerEts,
        [public, named_table, {keypos, #sever_info.db_id}, {read_concurrency, true}]),
    {ok, #state{}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({register, Info}, State) ->
    svr_worker_manager_logic:register(Info),
    {noreply, State};
do_handle_info({nodedown, {ServerNode, DBId}}, State) ->
    svr_worker_manager_logic:worker_nodedown(ServerNode, DBId),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.
