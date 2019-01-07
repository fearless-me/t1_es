%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 一月 2018 10:42
%%%-------------------------------------------------------------------
-author("mawenhong").


-ifndef(LOGGER_HRL).
-define(LOGGER_HRL, true).

-define(DEBUG(Fmt), fastlog:debug("[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(DEBUG(Fmt,Args), fastlog:debug("[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(INFO(Fmt), fastlog:info("[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(INFO(Fmt,Args), fastlog:info("[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(NOTICE(Fmt), fastlog:notice("[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(NOTICE(Fmt,Args), fastlog:notice("[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(WARN(Fmt), fastlog:warning("[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(WARN(Fmt,Args), fastlog:warning("[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(ERROR(Fmt), fastlog:error("[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(ERROR(Fmt,Args), fastlog:error("[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(FATAL(Fmt), fastlog:fatal("[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(FATAL(Fmt,Args), fastlog:fatal("[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).


%%

-define(DEBUG_SINK(Sink, Fmt), fastlog:debug_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(DEBUG_SINK(Sink, Fmt,Args), fastlog:debug_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(INFO_SINK(Sink, Fmt), fastlog:info_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(INFO_SINK(Sink, Fmt,Args), fastlog:info_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(NOTICE_SINK(Sink, Fmt), fastlog:notice_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(NOTICE_SINK(Sink, Fmt,Args), fastlog:notice_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(WARN_SINK(Sink, Fmt), fastlog:warning_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(WARN_SINK(Sink, Fmt,Args), fastlog:warning_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(ERROR_SINK(Sink, Fmt), fastlog:error_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(ERROR_SINK(Sink, Fmt,Args), fastlog:error_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).
-define(FATAL_SINK(Sink, Fmt), fastlog:fatal_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE])).
-define(FATAL_SINK(Sink, Fmt,Args), fastlog:fatal_sink(Sink, "[~w:~w] "++Fmt,[?MODULE, ?LINE]++Args)).

-endif.


