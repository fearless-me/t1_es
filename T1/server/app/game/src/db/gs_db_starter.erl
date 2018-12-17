%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 八月 2018 15:45
%%%-------------------------------------------------------------------
-module(gs_db_starter).
-author("mawenhong").
-include("logger.hrl").
-include("gs_dbpool.hrl").

%% API
-export([start/0]).



-record(r_db_conf, {id, host, port, user, password, database, conn, max_conn, worker}).

%%--------------------------------------------------------------------
start() ->
    true = misc:start_all_app(db_proxy),
    Sid = gs_interface:get_sid(),
    {_PoolOptions, MySqlOptions} = get_inst_opt(),
    {ok, Pid} = mysql:start_link(MySqlOptions),
    
    case gs_interface:is_cross() of
        false ->
            ?INFO("init data db pool ..."),
            db_pool_init(Pid, get_data_db_conf, [Sid], ?DATA_DB_POOL_NAME, fun gs_db_data_handler:handler/4),
            ?INFO("init data db pool done"),
            ?INFO("#"),
            
            ?INFO("init account db pool ..."),
            db_pool_init(Pid, get_account_db_conf, [], ?ACCOUNT_DB_POOL_NAME, fun gs_db_account_handler:handler/4),
            ?INFO("init account db pool done"),
            ?INFO("#"),

            ?INFO("init log db pool ..."),
%%            Conf = #{
%%                host => "127.0.0.1", port => 3306, user => "root", password => "1234", database => "t1_log",
%%                conn => 64, max_conn => 128, worker => 64, func => fun gs_db_log_handler:handler/4
%%            },
%%            db_proxy:add_pool(?LOG_DB_POOL_NAME, Conf, ?INIT_DB_POOL_TIMEOUT),
            ?INFO("init log db pool done"),
            ?INFO("#"),
            ok;
        _ -> skip
    end,
    
    ?INFO("init public db pool ..."),
    db_pool_init(Pid, get_public_db_conf, [], ?PUBLIC_DB_POOL_NAME, fun gs_db_public_handler:handler/4),
    ?INFO("init public db pool done"),
    ?INFO("#"),
    
    erlang:exit(Pid, normal),
    
    ok.

%%--------------------------------------------------------------------
db_pool_init(Pid, StmtRef, Params, PoolRef, Func) ->
    ?INFO("\t~p", [StmtRef]),
    L1 = load_conf_from_db(Pid, StmtRef, Params),
    do_db_pool_init(L1, PoolRef, Func),
    ok.


do_db_pool_init([Ins | _], PoolRef, Func) ->
    Conf = rec_to_map(Func, Ins),
    db_proxy:add_pool(PoolRef, Conf, ?INIT_DB_POOL_TIMEOUT);
do_db_pool_init(_, PoolRef, _Func) ->
    ?FATAL("node ~p sid ~p init db pool ~p, but config not exists",
        [node(), gs_interface:get_sid(), PoolRef]),
    throw(db_pool_config_error).


rec_to_map(Func, #r_db_conf{
    host = Host,
    port = Port,
    user = User,
    password = Password,
    database = Database,
    conn = Conn,
    max_conn = MaxConn,
    worker = Worker
}) ->
    #{
        host => Host, port => Port, user => User, password => Password, database => Database,
        conn => Conn, max_conn => MaxConn, worker => Worker, func => Func
    }.

%%-------------------------------------------------------------------
load_conf_from_db(Pid, StmtRef, Params) ->
    Res = mysql:execute(Pid, StmtRef, Params),
    Ins = db:as_record(Res, r_db_conf, record_info(fields, r_db_conf)),
    [modify_record(Instance) || Instance <- Ins].

%%-------------------------------------------------------------------
modify_record(#r_db_conf{
    host = Host, port = Port,
    user = User, password = Password, database = Database
} = R) ->
    R#r_db_conf{
        host = erlang:binary_to_list(Host),
        port = Port,
        user = erlang:binary_to_list(User),
        password = erlang:binary_to_list(Password),
        database = erlang:binary_to_list(Database)
    };
modify_record(R) -> R.

%%-------------------------------------------------------------------
get_inst_opt() ->
    PoolOptions = [{size, 1}, {max_overflow, 1}],
    Conf1 = gs_econfig:get_db_conf(),
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
                {get_data_db_conf, "select * from data_db_conf where id=?"},
                {get_public_db_conf, "select * from public_db_conf where id=0"},
                {get_account_db_conf, "select * from account_db_conf limit 1"}
            ]
        }
    ],
    {PoolOptions, MySqlOptions}.