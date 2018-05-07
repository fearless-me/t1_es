%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 十二月 2017 14:31
%%%-------------------------------------------------------------------
-module(mysql_pool_test).
-author("mawenhong").

%% API
-export([
    start_alone/0,child_spec/0,
    query/0, transaction/0, with/0
]).

start_alone()->
    application:ensure_all_started(mysql_poolboy),
    {PoolOptions, MySqlOptions} = get_conf(),
    mysql_poolboy:add_pool(pool1, PoolOptions, MySqlOptions),
    ok.

child_spec()->
    {PoolOptions, MySqlOptions} = get_conf(),
    mysql_poolboy:child_spec(pool1, PoolOptions, MySqlOptions).


get_conf() ->
    PoolOptions  = [{size, 10}, {max_overflow, 20}],
    MySqlOptions = [
        {user, "root"}, {password, "1234"}, {database, "test"},
        {prepare,
            [
                {foo, "SELECT * FROM t WHERE id=?"}
            ]
        }
    ],
    {PoolOptions, MySqlOptions}.

%%{ok,[<<"id">>,<<"bar">>],[[42,<<"baz">>]]}
query()->
    mysql_poolboy:query(pool1, "SELECT * FROM t WHERE id=?", [42]).

%% {atomic, hello}
transaction()->
    mysql_poolboy:transaction(pool1, fun (Pid) ->
        ok = mysql:query(Pid, "INSERT INTO t VALUES (?, ?)", [1, <<"banana">>]),
        ok = mysql:query(Pid, "INSERT INTO t VALUES (?, ?)", [2, <<"kiwi">>]),
        hello
                                     end).

%% ok
with()->
    mysql_poolboy:with(pool1, fun (Pid) ->
        {ok, _, [[OldTz]]} = mysql:query(Pid, "SELECT @@time_zone"),
        ok = mysql:query(Pid, "SET time_zone = '+00:00'"),
        %% Do some stuff in the UTC time zone...
        ok = mysql:query(Pid, "SET time_zone = ?", [OldTz])
                              end).

%%{ok, Pid} = mysql:start_link([{host, "localhost"}, {user, "root"},{password, "1234"}, {database, "player_data"}])



%%    MySQL	                    Erlang	                                Example
%%    INT, TINYINT, etc.	        integer()	                            42
%%    VARCHAR, TEXT, etc.	        unicode:chardata() [1]	                <<"foo">>, "bar"
%%    VARBINARY, BLOB, etc.	    binary()	                            <<1, 2, 3, 4>>
%%   BIT(N)	                    <<_:N/bitstring>>	                    <<255, 6:3>>
%%   FLOAT, DOUBLE	            float()	                                3.14
%%   DECIMAL(P, S)	            integer() when S == 0                   42
%%                                float() when P =< 15 and S > 0          3.14
%%                               binary() when P >= 16 and S > 0 [2]	    <<"3.14159265358979323846">>
%%    DATETIME, TIMESTAMP	        calendar:datetime() [3]	                {{2014, 11, 18}, {10, 22, 36}}
%%   DATE	                    calendar:date()	                        {2014, 11, 18}
%%    TIME	                    {Days, calendar:time()} [3, 4]	        {0, {10, 22, 36}}
%%    NULL	                    null	                                null

%%Notes:
%%
%% When fetching VARCHAR, TEXT etc. they are returned as binary().
%% When sending (insert or update) any unicode:chardata() is accepted as input.
%% In a (possibly deep) list of integers and binaries,
%% the integers are treated as Unicode codepoints while binaries are treated as UTF-8 encoded Unicode data.
%% For lists, an error occurs if you try to send invalid Unicode data,
%% but if the input is a pure binary, no validation will be done.
%% This is to allow sending binary non-Unicode data for MySQL's binary strings (BLOB, VARBINARY, etc.).
%% DECIMALs are returned as integer() or float() when the value can be represented without precision loss and
%% as binary() for high precision DECIMAL values. This is similar to how the odbc OTP application treats DECIMALs.
%% For DATETIME, TIMESTAMP and TIME values with franctions of seconds,
%% we use a float for the seconds part. (These are unusual and were added to MySQL in version 5.6.4.)
%% Since TIME can be outside the calendar:time() interval,
%% we use the format as returned by calendar:seconds_to_daystime/1 for TIME values.
