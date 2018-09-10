%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 九月 2018 10:00
%%%-------------------------------------------------------------------
-module(gs_db_public_handler).
-author("mawenhong").


-include("logger.hrl").
-include("gs_cache_inc.hrl").
-include("gs_common_rec.hrl").
-include("gs_db_rec.hrl").

-define(DB_QUERY_TIMEOUT, 15*1000).

%% API
-export([handler/4]).

%%-------------------------------------------------------------------
handler(serv_start, Sid, FromPid, PoolId) ->
    Sql = gs_db_sql:sql(load_serv_start),
    Res = db:query(PoolId, Sql, [Sid], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, [Sid]),
    RunNo = db:scalar(Res),
    ps:send(FromPid, serv_start_ack, RunNo),
    ok;
handler(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("undeal msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.


%%-------------------------------------------------------------------
check_res(Res, Sql, Params) -> check_res_1(db:succeed(Res), Sql, Res, Params).

check_res_1(true, Sql, _Res, _Params) -> ?DEBUG("[success] ~ts", [Sql]);
check_res_1(_, Sql, Res, Params) -> ?ERROR("ret: ~p, sql: ~ts, params: ~p", [Res, Sql, Params]).
