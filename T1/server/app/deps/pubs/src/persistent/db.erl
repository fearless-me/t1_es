%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 十二月 2017 14:12
%%%-------------------------------------------------------------------
-module(db).
-author("mawenhong").

%% API
-export([
    execute_stmt/3, execute_stmt/4,
    query/2, query/3, query/4,
    transaction/2, transaction/3, transaction/4,
    with/2
]).

%% API
-export([
    as_record/3, as_record/4, as_record/5, as_maps/1,
    get_rows_count/1,
    scalar/1, scalar/2,
    succeed/1
]).


%% @doc Execute a mysql prepared statement with given params.
execute_stmt(PoolName, StatementRef, Params) ->
    mysql_poolboy:execute(PoolName, StatementRef, encode_params(Params)).

%% @doc Execute a mysql prepared statement with given params and timeout
execute_stmt(PoolName, StatementRef, Params, Timeout) ->
    mysql_poolboy:execute(PoolName, StatementRef, encode_params(Params), Timeout).

%% @doc Executes a query to a mysql connection in a given pool.
query(PoolName, Query) ->
    mysql_poolboy:query(PoolName, Query).

%% @doc Executes a query to a mysql connection in a given pool with either
%% list of query parameters or a timeout value.
query(PoolName, Query, ParamsOrTimeout) ->
    mysql_poolboy:query(PoolName, Query, encode_params(ParamsOrTimeout)).

%% @doc Executes a query to a mysql connection in a given pool with both
%% a list of query parameters and a timeout value.
query(PoolName, Query, Params, Timeout) ->
    mysql_poolboy:query(PoolName, Query, encode_params(Params), Timeout).

%% @doc Wrapper to poolboy:transaction/2. Since it is not a mysql transaction.
%% Example instead of:
%% Conn = mysql_poolboy:checkout(mypool),
%% try
%%     mysql:query(Conn, "SELECT...")
%%  after
%%     mysql_poolboy:checkin(mypool, Conn)
%%  end.
%%
%% mysql_poolboy:with(mypool, fun (Conn) -> mysql:query(Conn, "SELECT...") end).
with(PoolName, Fun) when is_function(Fun, 1) ->
    mysql_poolboy:with(PoolName, Fun).

%% @doc Executes a mysql transaction fun. The fun needs to take one argument
%% which is the mysql connection.
transaction(PoolName, TransactionFun) when is_function(TransactionFun, 1) ->
    mysql_poolboy:transaction(PoolName, TransactionFun).

%% @doc Executes a transaction fun. Args list needs be the same length as
%% TransactionFun arity - 1.
transaction(PoolName, TransactionFun, Args)
    when is_function(TransactionFun, length(Args) + 1) ->
    mysql_poolboy:transaction(PoolName, TransactionFun, Args).

%% @doc Same as transaction/3 but with the number of retries the mysql
%% transaction should try to execute.
transaction(PoolName, TransactionFun, Args, Retries)
    when is_function(TransactionFun, length(Args) + 1) ->
    mysql_poolboy:transaction(PoolName, TransactionFun, Args, Retries).




%%-include("emysql.hrl").

%% @doc
succeed({error,_ErrorReason})-> false;
succeed(ok)-> true;
succeed({ok, _Fields, _Rows})-> true;
succeed({atomic,_}) -> true;
%%succeed(#error_packet{}) -> false;
%%succeed(#result_packet{}) -> true;
%%succeed(#ok_packet{}) -> true;
%%succeed([H | _L]) -> succeed(H);
succeed(_Any) -> false.



%% @doc package row data as records
as_record(Columns, Rows, RecordName, Fields, Fun)
    when is_atom(RecordName), is_list(Fields), is_function(Fun) ->
    S = lists:seq(1, length(Columns)),
    P = lists:zip([binary_to_atom(C1, utf8) || C1 <- Columns], S),
    F = fun(FieldName) ->
        case misc:get_value(FieldName, P, none) of
            none ->
                fun(_) -> undefined end;
            Pos ->
                fun(Row) -> lists:nth(Pos, Row) end
        end
        end,
    Fs = [ F(FieldName) || FieldName <- Fields ],
    F1 = fun(Row) ->
        RecordData = [ Fx(Row) || Fx <- Fs ],
        Fun(list_to_tuple([RecordName|RecordData]))
         end,
    [F1(Row) || Row <- Rows].

as_record(Columns, Rows, RecordName, Fields)
    when is_atom(RecordName), is_list(Fields) ->
    as_record(Columns, Rows, RecordName, Fields, fun(A) -> A end).

as_record({_, Columns, Rows}, RecordName, Fields)->
    as_record(Columns, Rows, RecordName, Fields).


%% @doc
get_rows_count({ok, _Fields, Rows})-> erlang:length(Rows);
get_rows_count(Rows) when is_list(Rows) -> erlang:length(Rows);
get_rows_count(_) -> 0.



%%
%% @doc package row data as a map
as_maps({ok, Fields, Rows}) when is_list(Fields), is_list(Rows) ->
    [begin
         maps:from_list([{binary_to_atom(K,utf8), V} || {K, V} <- lists:zip(Fields, R)])
     end || R <- Rows].


%%
%% @doc return the first field fo first row
scalar({_, _Columns, Rows}) -> scalar_1(Rows, undefined).
scalar({_, _Columns, Rows}, Def) -> scalar_1(Rows, Def).

scalar_1(undefined, Def) -> Def;
scalar_1([], Def) -> Def;
scalar_1([[First | _] | _], _Def) ->  First;
scalar_1(_, Def) -> Def.


%% @doc Encodes a term as an ANSI SQL literal 
encode_params(Params) when is_list(Params) ->
    [ encode(Param) || Param <- Params];
encode_params(Other) ->
    Other.


%% @doc only encode list (string)
encode(String) when is_list(String) ->
    case is_utf8_list(String) of
    true -> list_to_binary(String);
    _Any -> unicode:characters_to_binary(String)
    end;
encode(Other) ->
    Other.

is_utf8_list(List) ->
    lists:any(fun(X)-> X < 256 andalso X >= 0 end, List).