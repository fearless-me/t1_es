%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 16:46
%%%-------------------------------------------------------------------
-author("mawenhong").

-record(player_data,{player_id = 0, name ="", worker = "", data_version = 0, data = <<>>}).

-record(dbs_worker_info, {
    id = 0, ref = undefined, pid = undefined
}).

-define(WorkerEts, dbsWorkerEts_).

-define(PlayerDataMysqlInstanceEts, playerMysqlIntanceEts_).
-record(player_db_instance_info,{
    id = 0,
    host = "",
    port = 3306,
    user = "",
    password = "",
    database = ""
}).

-record(player_mysql_pool_info,{
    id = 0,
    pool = undefined
}).
-define(PlayerDataMysqlPoolEts, playerMysqlPoolEts_).

-define(DbsIniCfg, dbsIniConfig).

-define(SERVER_STATUS_INIT, 0).
-define(SERVER_STATUS_READY, 1).
-define(SERVER_STATUS_DONE, 2).

-define(SERVER_TYPE_GS, gs).
-define(SERVER_TYPE_CENTER, center).
-record(sever_info,{
    db_id = 0,
    type = none,
    node = '',
    name = "",
    status = ?SERVER_STATUS_INIT,
    src_pid = undefined,
    worker_pid = undefined
}).

-define(ServerEts, dbsServerEts_).