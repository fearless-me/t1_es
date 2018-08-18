%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 十二月 2017 17:43
%%%-------------------------------------------------------------------
-module(loggerS).
-author("mawenhong").

-define(DEFAULT_SINK, fastlog).

%% API
-export([
    %%
    start/0,

    %%
    log/2, log/3,
    log_sink/3, log_sink/4,

    %%
    debug/1, debug/2,
    info/1, info/2,
    warn/1, warn/2,
    error/1, error/2,
    fatal/1, fatal/2,

    %%
    debug_sink/3, debug_sink/2,
    info_sink/3, info_sink/2,
    warn_sink/3, warn_sink/2,
    error_sink/3, error_sink/2,
    fatal_sink/3, fatal_sink/2
]).

start( )->
    true = misc:start_app(fastlog),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
log(debug, Fmt) ->
    loggerS:debug(Fmt);
log(info, Fmt) ->
    loggerS:info(Fmt);
log(warn, Fmt) ->
    loggerS:warn(Fmt);
log(error, Fmt) ->
    loggerS:error(Fmt);
log(fatal, Fmt) ->
    loggerS:fatal(Fmt).

log(debug, Fmt, Args) ->
    loggerS:debug(Fmt, Args);
log(info, Fmt, Args) ->
    loggerS:info(Fmt, Args);
log(warn, Fmt, Args) ->
    loggerS:warn(Fmt, Args);
log(error, Fmt, Args) ->
    loggerS:error(Fmt, Args);
log(fatal, Fmt, Args) ->
    loggerS:fatal(Fmt, Args).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
log_sink(debug, Sink, Fmt) ->
    fastlog:debug(Sink, Fmt);
log_sink(info, Sink, Fmt) ->
    fastlog:info(Sink, Fmt);
log_sink(warn, Sink, Fmt) ->
    fastlog:warn(Sink, Fmt);
log_sink(error, Sink, Fmt) ->
    fastlog:error(Sink, Fmt);
log_sink(fatal, Sink, Fmt) ->
    fastlog:fatal(Sink, Fmt).

log_sink(debug, Sink, Fmt, Args) ->
    fastlog:debug(Sink, Fmt, Args);
log_sink(info, Sink, Fmt, Args) ->
    fastlog:info(Sink, Fmt, Args);
log_sink(warn, Sink, Fmt, Args) ->
    fastlog:warn(Sink, Fmt, Args);
log_sink(error, Sink, Fmt, Args) ->
    fastlog:error(Sink, Fmt, Args);
log_sink(fatal, Sink, Fmt, Args) ->
    fastlog:fatal(Sink, Fmt, Args).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
debug(Fmt) -> fastlog:debug(?DEFAULT_SINK, Fmt).
debug(Fmt, Args) -> fastlog:debug(?DEFAULT_SINK, Fmt, Args).

info(Fmt) -> fastlog:info(?DEFAULT_SINK, Fmt).
info(Fmt, Args) -> fastlog:info(?DEFAULT_SINK, Fmt, Args).

warn(Fmt) -> fastlog:warn(?DEFAULT_SINK, Fmt).
warn(Fmt, Args) -> fastlog:warn(?DEFAULT_SINK, Fmt, Args).

error(Fmt) -> fastlog:error(?DEFAULT_SINK, Fmt).
error(Fmt, Args) -> fastlog:error(?DEFAULT_SINK, Fmt, Args).

fatal(Fmt) -> fastlog:fatal(?DEFAULT_SINK, Fmt).
fatal(Fmt, Args) -> fastlog:fatal(?DEFAULT_SINK, Fmt, Args).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
debug_sink(Sink, Fmt) -> fastlog:debug(Sink, Fmt).
debug_sink(Sink, Fmt, Args) -> fastlog:debug(Sink, Fmt, Args).

info_sink(Sink, Fmt) -> fastlog:info(Sink, Fmt).
info_sink(Sink, Fmt, Args) -> fastlog:info(Sink, Fmt, Args).

warn_sink(Sink, Fmt) -> fastlog:warn(Sink, Fmt).
warn_sink(Sink, Fmt, Args) -> fastlog:warn(Sink, Fmt, Args).

error_sink(Sink, Fmt) -> fastlog:error(Sink, Fmt).
error_sink(Sink, Fmt, Args) -> fastlog:error(Sink, Fmt, Args).

fatal_sink(Sink, Fmt) -> fastlog:fatal(Sink, Fmt).
fatal_sink(Sink, Fmt, Args) -> fastlog:fatal(Sink, Fmt, Args).


