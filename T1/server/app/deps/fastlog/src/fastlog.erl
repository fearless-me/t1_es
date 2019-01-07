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
    notice/1, notice/2, notice_sink/3, notice_sink/2,
    warning/1, warning/2, warning_sink/3, warning_sink/2,
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
-define(LOG_LEVEL, ?LOG_LEVEL_INFO).
-else.
-define(LOG_LEVEL, get_env(log_level, ?LOG_LEVEL_DEBUG)).
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
debug(Fmt) -> fastlog:log_sink(?LOG_LEVEL_DEBUG, ?DEFAULT_SINK, Fmt).
debug(Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_DEBUG, ?DEFAULT_SINK, Fmt, Args).

info(Fmt) -> fastlog:log_sink(?LOG_LEVEL_INFO, ?DEFAULT_SINK, Fmt).
info(Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_INFO, ?DEFAULT_SINK, Fmt, Args).

notice(Fmt) -> fastlog:log_sink(?LOG_LEVEL_NOTICE, ?DEFAULT_SINK, Fmt).
notice(Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_NOTICE, ?DEFAULT_SINK, Fmt, Args).

warning(Fmt) -> fastlog:log_sink(?LOG_LEVEL_WARNING, ?DEFAULT_SINK, Fmt).
warning(Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_WARNING, ?DEFAULT_SINK, Fmt, Args).

error(Fmt) -> fastlog:log_sink(?LOG_LEVEL_ERROR, ?DEFAULT_SINK, Fmt).
error(Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_ERROR, ?DEFAULT_SINK, Fmt, Args).

fatal(Fmt) -> fastlog:log_sink(?LOG_LEVEL_FATAL, ?DEFAULT_SINK, Fmt).
fatal(Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_FATAL, ?DEFAULT_SINK, Fmt, Args).

%%-------------------------------------------------------------------
debug_sink(Sink, Fmt) -> fastlog:log_sink(?LOG_LEVEL_DEBUG, Sink, Fmt).
debug_sink(Sink, Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_DEBUG, Sink, Fmt, Args).

info_sink(Sink, Fmt) -> fastlog:log_sink(?LOG_LEVEL_INFO, Sink, Fmt, []).
info_sink(Sink, Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_INFO, Sink, Fmt, Args).

notice_sink(Sink, Fmt) -> fastlog:log_sink(?LOG_LEVEL_NOTICE, Sink, Fmt, []).
notice_sink(Sink, Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_NOTICE, Sink, Fmt, Args).

warning_sink(Sink, Fmt) -> fastlog:log_sink(?LOG_LEVEL_WARNING, Sink, Fmt, []).
warning_sink(Sink, Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_WARNING, Sink, Fmt, Args).

error_sink(Sink, Fmt) -> fastlog:log_sink(?LOG_LEVEL_ERROR, Sink, Fmt, []).
error_sink(Sink, Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_ERROR, Sink, Fmt, Args).

fatal_sink(Sink, Fmt) -> fastlog:log_sink(?LOG_LEVEL_FATAL, Sink, Fmt).
fatal_sink(Sink, Fmt, Args) -> fastlog:log_sink(?LOG_LEVEL_FATAL, Sink, Fmt, Args).

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
        {undefined, undefined} -> {error, fastlog_not_running};
        {undefined, _Default} -> {error, {sink_not_configured, Sink}};
        {SinkPid, _} when LevelAsInt >= SeverityAsInt  ->
            fastlog_sink:log_sink(SinkPid, Level, Fmt, Arg);
        _ -> ok
    end.

level_to_num(?LOG_LEVEL_DEBUG)      -> 1;
level_to_num(?LOG_LEVEL_INFO)       -> 2;
level_to_num(?LOG_LEVEL_NOTICE)     -> 4;
level_to_num(?LOG_LEVEL_WARNING)    -> 8;
level_to_num(?LOG_LEVEL_ERROR)      -> 16;
level_to_num(?LOG_LEVEL_FATAL)      -> 32;
level_to_num(_)                     -> 1.

%%-------------------------------------------------------------------
set_env(Key, Value) ->
    application:set_env(?MODULE, Key, Value).

get_env(Key, Def) ->
    application:get_env(?MODULE, Key, Def).