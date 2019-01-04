%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 一月 2019 14:37
%%%-------------------------------------------------------------------
-module(fastlog).
-author("Administrator").

-include("fastlog.hrl").

%% API
-export([
    %
    start/1,
    start_sink/2, start_sink/3,
    %
    log/2, log/3, log_sink/3, log_sink/4,
    %
    debug/1, debug/2, debug_sink/3, debug_sink/2,
    info/1, info/2, info_sink/3, info_sink/2,
    warn/1, warn/2, warn_sink/3, warn_sink/2,
    error/1, error/2, error_sink/3, error_sink/2,
    fatal/1, fatal/2, fatal_sink/3, fatal_sink/2
]).

-export([
    level/1, level/0,
    get_env/2, set_env/2,
    is_pause/0, pause/0, continue/0,
    stdio_pause/0, stdio_continue/0
]).


%%%===================================================================
%%% API
%%%===================================================================

-ifdef(RELEASE).
-define(LOG_LEVEL, info).
-else.
-define(LOG_LEVEL, get_env(log_level, debug)).
-endif.

%%-------------------------------------------------------------------
start(FileName) ->
    true = misc:start_app(fastlog),
    true = fastlog:start_sink(?DEFAULT_SINK, FileName, true),
    true.

%%-------------------------------------------------------------------
start_sink(Sink, FileName) ->
    start_sink(Sink, FileName, false).
start_sink(Sink, FileName, CreateError) ->
    fastlog_sup:start_child(Sink, FileName, CreateError).

%%-------------------------------------------------------------------
pause() -> set_env(?DISCARD_KEY, ?DISCARD_ACTIVE).
continue() -> set_env(?DISCARD_KEY, ?DISCARD_FORBID).
is_pause() -> get_env(?DISCARD_KEY, ?DISCARD_FORBID) =/= ?DISCARD_FORBID.
level(Level) -> set_env(log_level, Level), level().
level() -> get_env(log_level, ?LOG_LEVEL).
stdio_pause() -> set_env(?DISCARD_STDIO_KEY, ?DISCARD_ACTIVE).
stdio_continue() -> set_env(?DISCARD_STDIO_KEY, ?DISCARD_FORBID).

%%-------------------------------------------------------------------
debug(Fmt) -> fastlog:log_sink(debug, ?DEFAULT_SINK, Fmt).
debug(Fmt, Args) -> fastlog:log_sink(debug, ?DEFAULT_SINK, Fmt, Args).

info(Fmt) -> fastlog:log_sink(info, ?DEFAULT_SINK, Fmt).
info(Fmt, Args) -> fastlog:log_sink(info, ?DEFAULT_SINK, Fmt, Args).

warn(Fmt) -> fastlog:log_sink(warn, ?DEFAULT_SINK, Fmt).
warn(Fmt, Args) -> fastlog:log_sink(warn, ?DEFAULT_SINK, Fmt, Args).

error(Fmt) -> fastlog:log_sink(error, ?DEFAULT_SINK, Fmt).
error(Fmt, Args) -> fastlog:log_sink(error, ?DEFAULT_SINK, Fmt, Args).

fatal(Fmt) -> fastlog:log_sink(fatal, ?DEFAULT_SINK, Fmt).
fatal(Fmt, Args) -> fastlog:log_sink(fatal, ?DEFAULT_SINK, Fmt, Args).

%%-------------------------------------------------------------------
debug_sink(Sink, Fmt) -> fastlog:log_sink(debug, Sink, Fmt).
debug_sink(Sink, Fmt, Args) -> fastlog:log_sink(debug, Sink, Fmt, Args).

info_sink(Sink, Fmt) -> fastlog:log_sink(info, Sink, Fmt, []).
info_sink(Sink, Fmt, Args) -> fastlog:log_sink(info, Sink, Fmt, Args).

warn_sink(Sink, Fmt) -> fastlog:log_sink(warn, Sink, Fmt, []).
warn_sink(Sink, Fmt, Args) -> fastlog:log_sink(warn, Sink, Fmt, Args).

error_sink(Sink, Fmt) -> fastlog:log_sink(error, Sink, Fmt, []).
error_sink(Sink, Fmt, Args) -> fastlog:log_sink(error, Sink, Fmt, Args).

fatal_sink(Sink, Fmt) -> fastlog:log_sink(fatal, Sink, Fmt).
fatal_sink(Sink, Fmt, Args) -> fastlog:log_sink(fatal, Sink, Fmt, Args).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
log(Level, Fmt) -> fastlog:log_sink(Level, ?DEFAULT_SINK, Fmt).
log(Level, Fmt, Args) -> fastlog:log_sink(Level, ?DEFAULT_SINK, Fmt, Args).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
log_sink(Level, Sink, Fmt) -> do_log(Level, ?LOG_LEVEL, Sink, Fmt).
log_sink(Level, Sink, Fmt, Args) -> do_log(Level, ?LOG_LEVEL, Sink, Fmt, Args).

%%-------------------------------------------------------------------
do_log(Level, Severity, Sink, Fmt) ->
    do_log(Level, Severity, Sink, Fmt, []).

do_log(Level, Severity, Sink, Fmt, Arg) ->
    LevelAsInt = level_to_num(Level),
    SeverityAsInt = level_to_num(Severity),
    case {whereis(Sink), whereis(?DEFAULT_SINK)} of
        {undefined, undefined} -> {error, lager_not_running};
        {undefined, _Default} -> {error, {sink_not_configured, Sink}};
        {SinkPid, _} when LevelAsInt >= SeverityAsInt  ->
            fastlog_sink:log_sink(SinkPid, Level, Fmt, Arg);
        _ -> ok
    end.

level_to_num(debug)      -> 1;
level_to_num(info)       -> 2;
level_to_num(warn)       -> 4;
level_to_num(error)      -> 8;
level_to_num(fatal)      -> 16;
level_to_num(_)          -> 0.

%%-------------------------------------------------------------------
set_env(Key, Value) ->
    application:set_env(?MODULE, Key, Value).

get_env(Key, Def) ->
    application:get_env(?MODULE, Key, Def).