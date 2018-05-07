%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 一月 2018 10:42
%%%-------------------------------------------------------------------
-author("mawenhong").

-define(DEBUG(Fmt), loggerS:debug("[~w:~w]"++Fmt,[?MODULE, ?LINE])).
-define(DEBUG(Fmt,Args), loggerS:debug("[~w:~w]"++Fmt,[?MODULE, ?LINE]++Args)).

-define(INFO(Fmt), loggerS:info("[~w:~w]"++Fmt,[?MODULE, ?LINE])).
-define(INFO(Fmt,Args), loggerS:info("[~w:~w]"++Fmt,[?MODULE, ?LINE]++Args)).

-define(WARN(Fmt), loggerS:warn("[~w:~w]"++Fmt,[?MODULE, ?LINE])).
-define(WARN(Fmt,Args), loggerS:warn("[~w:~w]"++Fmt,[?MODULE, ?LINE]++Args)).

-define(ERROR(Fmt), loggerS:error("[~w:~w]"++Fmt,[?MODULE, ?LINE])).
-define(ERROR(Fmt,Args), loggerS:error("[~w:~w]"++Fmt,[?MODULE, ?LINE]++Args)).

-define(FATAL(Fmt), loggerS:fatal("[~w:~w]"++Fmt,[?MODULE, ?LINE])).
-define(FATAL(Fmt,Args), loggerS:fatal("[~w:~w]"++Fmt,[?MODULE, ?LINE]++Args)).
