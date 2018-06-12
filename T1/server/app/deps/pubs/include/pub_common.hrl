%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 11:41
%%%-------------------------------------------------------------------
-author("mawenhong").

-include_lib("stdlib/include/ms_transform.hrl").

-define(ETS_RC,{read_concurrency,true}).
-define(ETS_WC,{write_concurrency,true}).

-define(ONS_SECOND_MS, 1000).
-define(ONE_MINUTE_MS, 60*1000).
-define(ONT_HOUR_MS, 60*60*1000).

%%
-define(ST_GS,      gs).
-define(ST_CGS,     cgs).

%%
-define(SS_INIT,    0).
-define(SS_READY,   1).
-define(SS_DONE,    2).


-record(kv,{k, v}).
-define(ServerState, serverStateEts_).


%%-------------------------------------------------------------------------------
-define(TRY_CATCH(Fun, Err, St, Format, Args),
    try
        Fun
    catch _:Err:St ->
        ?ERROR(Format ++ "Reason=~w,Stacktrace=~p", Args ++ [Err, St])
    end).

-define(TRY_CATCH(Fun, Err, St, Tip),
    try
        Fun
    catch _:Err:St ->
        ?ERROR("~ts: Reason=~w,Stacktrace=~p", [Tip, Err, St])
    end).
-define(TRY_CATCH(Fun, Err, St),
    try
        Fun
    catch _:Err:St ->
        ?ERROR("Reason=~w,Stacktrace=~p", [Err, St])
    end).

-define(TRY_CATCH(Fun), ?TRY_CATCH(Fun,Err,St)).

%%---------------
-define(TRY_CATCH_RET(Fun, Ret, Err, St, Format, Args),
    try
        Fun
    catch _:Err:St ->
        ?ERROR(Format ++ "Reason=~w,Stacktrace=~p", Args ++ [Err, St]),
        Ret
    end).

-define(TRY_CATCH_RET(Fun, Ret, Err, St, Tip),
    try
        Fun
    catch _:Err:St ->
        ?ERROR("~ts: Reason=~w,Stacktrace=~p", [Tip,Err,St]),
        Ret
    end).
-define(TRY_CATCH_RET(Fun, Ret, Err, St),
    try
        Fun
    catch _:Err:St ->
        ?ERROR("Reason=~w,Stacktrace=~p", [Err,St]),
        Ret
    end).

-define(TRY_CATCH_RET(Fun,Ret), ?TRY_CATCH_RET(Fun, Ret,Err,St)).
%%---------------

-define(TRY_CATCH_ONLY(Fun),
    try
        Fun
    catch
        _:_ -> skip
    end).

