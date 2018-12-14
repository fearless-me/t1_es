%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 五月 2018 14:34
%%%-------------------------------------------------------------------
-module(cs_db_handler).
-author("mawenhong").

-include("logger.hrl").

%% API
-export([handler/4]).

%%-------------------------------------------------------------------
handler(serv_start, Sid, FromPid, PoolId) ->
    Sql = cs_db_sql:sql(load_serv_start),
    Res = db:query(PoolId, Sql, [Sid], infinity),
    check_res(Res, Sql, [Sid]),
    RunNo = db:scalar(Res),
    ps:send(FromPid, serv_start_ack, RunNo),
    ok;
handler(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.


%%-------------------------------------------------------------------
check_res(Res, Sql, Params) -> check_res_1(db:succeed(Res), Sql, Res, Params).

check_res_1(true, Sql, _Res, _Params) -> ?DEBUG("[success] ~ts", [Sql]);
check_res_1(_, Sql, Res, Params) -> ?ERROR("ret: ~p, sql: ~ts, params: ~p", [Res, Sql, Params]).