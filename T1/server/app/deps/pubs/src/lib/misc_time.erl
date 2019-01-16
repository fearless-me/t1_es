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
-export([micro_seconds/0, milli_seconds/0, utc_seconds/0, tz_seconds/0, localtime_seconds/0, localtime_milliseconds/0,
    gregorian_seconds_to_datetime/1,
    gregorian_seconds_from_1970/0,
    getWeekBeginSecondsByDay/1,
    convertDateTime1970ToSec/1,
    getLocalDateTime/0,
    getLocalDateTimeStr/0,
    getUTCNowMSDiff2010/0,
    convertTimeStamp2DateTimeStr/1,
    mysqlDateTimeToSec/1,
    getDayBeginSeconds/1,
    convertSecToTimeStr/1,
    diffSecFrom1970/1
]).
-export([localtime_str/0, localtime_int/0, utc_str/0, milli_seconds_to_str/1, utc_seconds_to_str/1]).
-export([day_of_the_week/0, day_of_the_week/1, day_of_the_week/3]).
-export([format_datetime/1, last_two_month/0]).



-define(DAYS_FROM_0_TO_1970, 719528).
-define(SECONDS_PER_DAY, 86400).
-define(SECONDS_FROM_0_TO_1970, ?DAYS_FROM_0_TO_1970 * ?SECONDS_PER_DAY).
-define(TIME_FMT, "~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w").
-define(TIME_FMT_INT, "~.4w~.2.0w~.2.0w~.2.0w~.2.0w~.2.0w").

micro_seconds() -> os:system_time(microsecond).

milli_seconds() -> os:system_time(milli_seconds).

utc_seconds() -> os:system_time(seconds).

gregorian_seconds_to_datetime(Sec) ->
    calendar:gregorian_seconds_to_datetime(Sec).

gregorian_seconds_from_1970() ->
    calendar:datetime_to_gregorian_seconds(calendar:now_to_local_time(os:timestamp())).

getDayBeginSeconds({{Year,Month,Day},{_Hour,_Min,_Sec}}) ->
    calendar:datetime_to_gregorian_seconds({{Year,Month,Day},{0,0,0}}).

mysqlDateTimeToSec(DateTime) ->
    case erlang:is_integer(DateTime) of
        true ->
            DateTime;
        false ->
            case DateTime of
                {datetime, {{1970, 1, 1}, {0, 0, 0}}} ->
                    0;
                {datetime, DT} ->
                    convertDateTimeToSec(DT)
            end
    end.

getLocalDateTime() ->
    calendar:now_to_local_time(os:timestamp()).

getLocalDateTimeStr() ->
    convertDateTimeToTimeStr(getLocalDateTime()).

getWeekBeginSecondsByDay({{Year,Month,Day},{_Hour,_Min,_Sec}})->
    DayOfWeek = calendar:day_of_the_week(Year, Month, Day),
    TodayBegin = calendar:datetime_to_gregorian_seconds( {{Year,Month,Day},{0,0,0}} ),
    (TodayBegin - (DayOfWeek - 1) * 86400).

convertDateTime1970ToSec({{Year,Month,Day}, {Hour,Minute,Second}}) ->
    calendar:datetime_to_gregorian_seconds({{Year,Month,Day}, {Hour,Minute,Second}}).

getUTCNowMSDiff2010() ->
    NowMS = milli_seconds(),
    Sec = diffSecFrom1970({{2010,1,1},{0,0,0}}),
    NowMS - Sec * 1000.

diffSecFrom1970(DateTime) ->
    Seconds1 = calendar:datetime_to_gregorian_seconds(DateTime),
    Seconds2 = calendar:datetime_to_gregorian_seconds({{1970,1,1}, {0,0,0}}),
    Seconds1 - Seconds2.

-define(SECS_FROM_0_TO_1970,62167219200).
convertTimeStamp2DateTimeStr(Sec) ->
    convertSecToTimeStr(Sec + ?SECS_FROM_0_TO_1970).

convertSecToDateTime(Second) ->
    calendar:gregorian_seconds_to_datetime(Second).
%% 转换秒到时间字符串
-spec convertSecToTimeStr(Second::uint64()) -> string().
convertSecToTimeStr(Second) ->
    convertDateTimeToTimeStr(convertSecToDateTime(Second)).

convertDateTimeToTimeStr({{Year,Month,Day}, {Hour,Minute,Second}} = _DateTime) ->
    io_lib:format("~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w", [Year,Month,Day,Hour,Minute,Second]).

localtime_seconds()->
    calendar:datetime_to_gregorian_seconds(calendar:local_time()) -
        ?SECONDS_FROM_0_TO_1970.

localtime_milliseconds()->
    milli_seconds() + tz_seconds() * 1000.

milli_seconds_to_str(MilliSeconds) ->
    Datetime = calendar:system_time_to_local_time(MilliSeconds, millisecond),
    format_datetime(Datetime).

utc_seconds_to_str(UtcSeconds) ->
    Datetime = calendar:system_time_to_local_time(UtcSeconds, seconds),
    format_datetime(Datetime).


localtime_str() ->
    {{Y, MO, D}, {H, MU, S}} = calendar:local_time(),
    lists:flatten(io_lib:format(?TIME_FMT, [Y, MO, D, H, MU, S])).

localtime_int() ->
    {{Y, MO, D}, {H, MU, S}} = calendar:local_time(),
    list_to_integer(lists:flatten(io_lib:format(?TIME_FMT_INT, [Y, MO, D, H, MU, S]))).

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


format_datetime({{Y, MO, D}, {H, MU, S}}) ->
    lists:flatten(io_lib:format(?TIME_FMT, [Y, MO, D, H, MU, S]));
format_datetime(Other) ->
    lists:flatten(io_lib:format("~p",[Other])).

last_two_month()->
    {Year,Month,_} = erlang:date(),
    case Month of
        12 ->
            [
                year_month_to_integer(Year, Month),
                year_month_to_integer(Year+1, 1)
            ];
        _ ->
            [
                year_month_to_integer(Year, Month),
                year_month_to_integer(Year, Month + 1)
            ]
    end.

year_month_to_integer(Year,Month) ->
    erlang:trunc(Year * 100 + Month).