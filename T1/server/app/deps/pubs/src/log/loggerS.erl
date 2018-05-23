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

%% API
-export([
    debug/1, debug/2,
    info/1, info/2,
    warn/1, warn/2,
    error/1, error/2,
    fatal/1, fatal/2
]).
-export([start/0]).

start( )->
    true = misc:start_app(fastlog),
%%    true = misc:start_applications(log4erl),
%%    log4erl:conf("log4erl.conf"),
%%    set_cut_off(),
    ok.
%%-ifdef(Release).
%%set_cut_off()-> log_filter_codegen:set_cutoff_level(info).
%%-else.
%%set_cut_off()-> ok.
%%-endif.

debug(Fmt) -> fastlog:debug(Fmt).
debug(Fmt, Args) -> fastlog:debug(Fmt, Args).

info(Fmt) -> fastlog:info(Fmt).
info(Fmt, Args) -> fastlog:info(Fmt, Args).

warn(Fmt) -> fastlog:warn(Fmt).
warn(Fmt, Args) -> fastlog:warn(Fmt, Args).

error(Fmt) -> fastlog:error(Fmt).
error(Fmt, Args) -> fastlog:error(Fmt, Args).

fatal(Fmt) -> fastlog:fatal(Fmt).
fatal(Fmt, Args) -> fastlog:fatal(Fmt, Args).

