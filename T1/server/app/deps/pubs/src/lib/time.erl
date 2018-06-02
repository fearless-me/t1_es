%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 六月 2018 16:02
%%%-------------------------------------------------------------------
-module(time).
-author("mawenhong").
%% API
-export([milli_seconds/0, utc_seconds/0, tz_seconds/0, localtime_seconds/0]).
-export([localtime_str/0, utc_str/0]).
-export([day_of_the_week/0, day_of_the_week/1, day_of_the_week/3]).


-define(DAYS_FROM_0_TO_1970, 719528).
-define(SECONDS_PER_DAY, 86400).

milli_seconds() -> os:system_time(milli_seconds).

utc_seconds() -> os:system_time(seconds).

localtime_seconds()->
    calendar:datetime_to_gregorian_seconds(calendar:local_time()) -
        ?DAYS_FROM_0_TO_1970 * ?SECONDS_PER_DAY.


localtime_str() ->
    {{Y, MO, D}, {H, MU, S}} = calendar:local_time(),
    lists:flatten(io_lib:format("~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w", [Y, MO, D, H, MU, S])).

%%
tz_seconds() ->
    Local = calendar:local_time(),
    Utc = calendar:universal_time(),
    calendar:datetime_to_gregorian_seconds(Local) - calendar:datetime_to_gregorian_seconds(Utc).


utc_str() ->
    {{Y, MO, D}, {H, MU, S}} = calendar:universal_time(),
    io_lib:format("~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w",
        [Y, MO, D, H, MU, S]).

day_of_the_week() ->
    {Day, _} = calendar:local_time(),
    calendar:day_of_the_week(Day).

day_of_the_week(Year, Month, Day) -> calendar:day_of_the_week(Year, Month, Day).
day_of_the_week({Year, Month, Day}) -> calendar:day_of_the_week(Year, Month, Day).
