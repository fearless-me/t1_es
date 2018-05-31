%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 10:45
%%%-------------------------------------------------------------------
-module(db_proxy).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_common.hrl").

%%
-export([checkout_ppool/1]).
-export([checkout_ppool_/1]).
-export([checkout_apool/1]).
-export([checkout_apool_/1]).
%%
-export([start_db_pool/0]).
-export([start_db_pool/1]).
%%
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

-record(r_db_conf, {id , host, port, user, password, database, conn, max_conn, worker}).
-record(r_db_pool, {id = 0, pool, mgr, conf}).

-define(ETS_PLAYER_DB_POOL, playerMysqlPoolEts_).
-define(ETS_ACCOUNT_DB_POOL, accountMysqlPoolEts_).
-define(CALL_TIMEOUT, 30 * 1000).

%%
checkout_ppool(AccId) ->
    gen_server:call(?MODULE, {give_ppool, AccId}, ?CALL_TIMEOUT).
checkout_ppool_(AccId) -> hash_to_pool(?ETS_PLAYER_DB_POOL, AccId).

checkout_apool(AccId) ->
    gen_server:call(?MODULE, {give_apool, AccId}, ?CALL_TIMEOUT).
checkout_apool_(AccId) -> hash_to_pool(?ETS_ACCOUNT_DB_POOL, AccId).

%% API
start_db_pool() ->
    gen_server:call(?MODULE, start_db_pool, inifinity).
start_db_pool(Timeout) ->
    gen_server:call(?MODULE, start_db_pool, Timeout).


%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    ets:new(?ETS_PLAYER_DB_POOL, [protected, set, named_table, {keypos, #r_db_pool.id}, ?ETSRC]),
    ets:new(?ETS_ACCOUNT_DB_POOL, [protected, set, named_table, {keypos, #r_db_pool.id}, ?ETSRC]),
%%    ets:new(?ETS_PLAYER_DB_INS, [protected, set, named_table, {keypos, #r_player_db_ins.id}, ?ETSRC]),
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    {ok, none}.

%%-------------------------------------------------------------------
do_handle_call(start_db_pool, _From, State) ->
    {reply, init_pool(), State};
do_handle_call({give_ppool, AccId}, _From, State) ->
    {reply, hash_to_pool(?ETS_PLAYER_DB_POOL, AccId), State};
do_handle_call({give_apool, AccId}, _From, State) ->
    {reply, hash_to_pool(?ETS_ACCOUNT_DB_POOL, AccId), State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({'EXIT', _Pid, normal}, State) ->
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
hash_to_pool(Ets, Key) ->
    Size = ets:info(Ets, size),
    PoolId = Key rem Size + 1,
    case ets:lookup(Ets, PoolId) of
        [#r_db_pool{mgr = Mgr}] -> Mgr;
        _ -> undefined
    end.

%%--------------------------------------------------------------------
init_pool() ->
    {_PoolOptions, MySqlOptions} = get_player_ins_opt(),
    {ok, Pid} = mysql:start_link(MySqlOptions),

    ?INFO("init player db pool ..."),
    db_pool_init(Pid, get_player_db_conf, pdb_pool, ?ETS_PLAYER_DB_POOL),
    ?INFO("init player db pool done"),
    ?INFO("#"),

    ?INFO("init account db pool ..."),
    db_pool_init(Pid, get_account_db_conf, adb_pool, ?ETS_ACCOUNT_DB_POOL),
    ?INFO("init account db pool done"),
    ?INFO("#"),
    
    erlang:exit(Pid, normal),
    ok.

%%--------------------------------------------------------------------
db_pool_init(Pid, StmtRef, PoolRef, Ets) ->
    ?INFO("\t~p",[StmtRef]),

    L1 = load_conf_from_db(
        Pid, StmtRef, r_db_conf, record_info(fields, r_db_conf)),
    
    _ = [start_db_pool(PoolRef, Ets, Instance) || Instance <- L1],

    ok.

%%-------------------------------------------------------------------
load_conf_from_db(Pid, StmtRef, Rec, RecFields) ->
    Res = mysql:execute(Pid, StmtRef, []),
    Ins = db:as_record(Res, Rec, RecFields),
    [modify_record(Instance) || Instance <- Ins].

%%-------------------------------------------------------------------
modify_record(#r_db_conf{
    id = Id,
    host = Host, port = Port,
    user = User, password = Password, database = Database
} = R) ->
    R#r_db_conf{
        id = Id,
        host = erlang:binary_to_list(Host),
        port = Port,
        user = erlang:binary_to_list(User),
        password = erlang:binary_to_list(Password),
        database = erlang:binary_to_list(Database)
    };
modify_record(R) -> R.

%%-------------------------------------------------------------------
get_player_ins_opt() ->
    PoolOptions = [{size, 1}, {max_overflow, 1}],
    Conf1 = gconf:get_db_conf(),
    Conf2 = case lists:keyfind(port, 1, Conf1) of
                {port, Port} when is_number(Port) ->
                    Conf1;
                {port, Port} when is_list(Port) ->
                    lists:keyreplace(port, 1, Conf1, {port, erlang:list_to_integer(Port)});
                _ ->
                    Conf1
            end,
    MySqlOptions = Conf2 ++ [
        {
            prepare,
            [
                {get_player_db_conf, "select * from player_db_conf"},
                {get_public_db_conf, "select * from public_db_conf"},
                {get_account_db_conf, "select * from account_db_conf"}
            ]
        }
    ],
    {PoolOptions, MySqlOptions}.

%%-------------------------------------------------------------------
start_db_pool(PoolRef, Ets, Conf) ->
    #r_db_conf{
        id = Id,
        host = Host, port = Port,
        user = User, password = Password, database = Database,
        worker = WorkerNo, conn = Connections, max_conn = MaxConnections
    } = Conf,
    PoolId = misc:create_atom(PoolRef, [Id]),

    ?INFO("\t~p", [PoolId]),
    db_pool:add_pool(PoolId, Host, Port, User, Password, Database, Connections, MaxConnections),

    {ok, Pid} = db_mgr_sup:start_child([Id, PoolId, WorkerNo]),
    ?INFO("\t~p", [misc:register_name(Pid)]),

    db_mgr:start_worker(Pid),

    ets:insert(Ets, #r_db_pool{id = Id, pool = PoolId, mgr = Pid}),
    ok.

