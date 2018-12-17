%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(common_db_log_handler).
-author("Hello World").

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("common_logdb_record.hrl").

-define(DB_QUERY_TIMEOUT, 15 * 1000).

%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-export([log/2, log_month/3]).
-export([check/3]).

%%-------------------------------------------------------------------
log(R, PoolId) -> i_log(R, PoolId, unuse).
log_month(R, PoolId, YearMonth) -> i_log(R, PoolId, YearMonth).

%%-------------------------------------------------------------------
check(PoolId, Table, YearMonthList) ->
    ResList1 = [i_check(PoolId, Table, YearMonth) || YearMonth <- YearMonthList],
    ResList2 = [Res || Res <- ResList1, Res =/= true],
    case ResList2 of
        [] -> true;
        _  -> ResList2
    end.
i_check(PoolId, Table, YearMonth) ->
    Sql = io_lib:format("create table if not exists ~p_~p like ~p",[Table, YearMonth, Table]),
    Res = db:query(PoolId, Sql, [], ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, []),
    case db:succeed(Res) of
        true -> true;
        _Any -> Res
    end.
%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
i_log(#p_log_money{} = R, PoolId, _)->
	Sql = "insert into log_money(aid,uid,sid,name,level,camp,race,career,head,map_id,line)
	values(?,?,?,?,?,?,?,?,?,?,?)",
	Params = [R#p_log_money.aid, R#p_log_money.uid, 
	R#p_log_money.sid, R#p_log_money.name, R#p_log_money.level, 
	R#p_log_money.camp, R#p_log_money.race, R#p_log_money.career, 
	R#p_log_money.head, R#p_log_money.map_id, R#p_log_money.line],

    Res = db:query(PoolId, Sql, Params, ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, Params),
    ok;
i_log(#p_log_player{} = R, PoolId, _)->
	Sql = "insert into log_player(aid,uid,sid,name,level,camp,race,career,head,map_id,line)
	values(?,?,?,?,?,?,?,?,?,?,?)",
	Params = [R#p_log_player.aid, R#p_log_player.uid, 
	R#p_log_player.sid, R#p_log_player.name, R#p_log_player.level, 
	R#p_log_player.camp, R#p_log_player.race, R#p_log_player.career, 
	R#p_log_player.head, R#p_log_player.map_id, R#p_log_player.line],

    Res = db:query(PoolId, Sql, Params, ?DB_QUERY_TIMEOUT),
    check_res(Res, Sql, Params),
    ok;
i_log(_,_,_)-> skip.

%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
check_res(Res, Sql, Params) -> check_res_1(db:succeed(Res), Sql, Res, Params).

check_res_1(true, Sql, _Res, _Params) -> ?DEBUG("[success] ~ts", [Sql]);
check_res_1(_, Sql, Res, Params) -> ?ERROR("ret: ~p, sql: ~ts, params: ~p", [Res, Sql, Params]).