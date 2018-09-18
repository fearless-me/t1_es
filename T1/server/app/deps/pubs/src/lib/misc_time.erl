%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 六月 2018 16:02
%%%-------------------------------------------------------------------
-module(misc_time).
-author("mawenhong").
%% API
-export([micro_seconds/0, milli_seconds/0, utc_seconds/0, tz_seconds/0, localtime_seconds/0]).
-export([localtime_str/0, utc_str/0]).
-export([day_of_the_week/0, day_of_the_week/1, day_of_the_week/3]).
-export([format_datatime/1]).



-define(DAYS_FROM_0_TO_1970, 719528).
-define(SECONDS_PER_DAY, 86400).
-define(SECONDS_FROM_0_TO_1970, ?DAYS_FROM_0_TO_1970 * ?SECONDS_PER_DAY).
-define(TIME_FMT, "~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w").

micro_seconds() -> os:system_time(microsecond).

milli_seconds() -> os:system_time(milli_seconds).

utc_seconds() -> os:system_time(seconds).

localtime_seconds()->
    calendar:datetime_to_gregorian_seconds(calendar:local_time()) -
        ?SECONDS_FROM_0_TO_1970.


localtime_str() ->
    {{Y, MO, D}, {H, MU, S}} = calendar:local_time(),
    lists:flatten(io_lib:format(?TIME_FMT, [Y, MO, D, H, MU, S])).

%%
tz_seconds() ->
    Utc = calendar:universal_time(),
    Now = calendar:local_time(),
    Sec = calendar:datetime_to_gregorian_seconds(Now) - calendar:datetime_to_gregorian_seconds(Utc),
    (Sec div 3600) * 3600.


utc_str() ->
    {{Y, MO, D}, {H, MU, S}} = calendar:universal_time(),
    io_lib:format(?TIME_FMT, [Y, MO, D, H, MU, S]).

day_of_the_week() ->
    {Day, _} = calendar:local_time(),
    calendar:day_of_the_week(Day).

day_of_the_week(Year, Month, Day) -> calendar:day_of_the_week(Year, Month, Day).
day_of_the_week({Year, Month, Day}) -> calendar:day_of_the_week(Year, Month, Day).


format_datatime({{Y, MO, D}, {H, MU, S}}) ->
    io_lib:format(?TIME_FMT, [Y, MO, D, H, MU, S]);
format_datatime(Other) ->
    io_lib:format("~p",[Other]).