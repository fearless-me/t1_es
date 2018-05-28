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

-define(ETSRC,{read_concurrency,true}).
-define(ETSWC,{write_concurrency,true}).

%%
-define(ST_GS,      1).
-define(ST_CGS,     2).

%%
-define(SS_INIT,    0).
-define(SS_READY,   1).
-define(SS_DONE,    2).


-record(kv,{k, v}).
-define(ServerState, serverStateEts_).


%%-------------------------------------------------------------------------------
-define(TRY_CATCH(Fun,ErrReason, Format, Args),
    try
        Fun
    catch
        _:ErrReason ->
            ?ERROR(Format ++ "Reason=~w,Stacktrace=~p", Args ++ [ErrReason,erlang:get_stacktrace()])
    end).

-define(TRY_CATCH(Fun,ErrReason,Tip),
    try
        Fun
    catch
        _:ErrReason ->
            ?ERROR("~ts: Reason=~w,Stacktrace=~p", [Tip,ErrReason,erlang:get_stacktrace()])
    end).
-define(TRY_CATCH(Fun,ErrReason),
    try
        Fun
    catch
        _:ErrReason ->
            ?ERROR("Reason=~w,Stacktrace=~p", [ErrReason,erlang:get_stacktrace()])
    end).

-define(TRY_CATCH(Fun), ?TRY_CATCH(Fun,ErrReason)).

%%---------------
-define(TRY_CATCH_RET(Fun, Ret,ErrReason, Format, Args),
    try
        Fun
    catch
        _:ErrReason ->
            ?ERROR(Format ++ "Reason=~w,Stacktrace=~p", Args ++ [ErrReason,erlang:get_stacktrace()]),
            Ret
    end).

-define(TRY_CATCH_RET(Fun, Ret,ErrReason,Tip),
    try
        Fun
    catch
        _:ErrReason ->
            ?ERROR("~ts: Reason=~w,Stacktrace=~p", [Tip,ErrReason,erlang:get_stacktrace()]),
            Ret
    end).
-define(TRY_CATCH_RET(Fun, Ret, ErrReason),
    try
        Fun
    catch
        _:ErrReason ->
            ?ERROR("Reason=~w,Stacktrace=~p", [ErrReason,erlang:get_stacktrace()]),
            Ret
    end).

-define(TRY_CATCH_RET(Fun,Ret), ?TRY_CATCH_RET(Fun, Ret,ErrReason)).
%%---------------

-define(TRY_CATCH_ONLY(Fun),
    try
        Fun
    catch
        _:_ -> skip
    end).

