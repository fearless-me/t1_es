%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 14:44
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(PUB_DEF_HRL).
-define(PUB_DEF_HRL, true).

-include_lib("stdlib/include/ms_transform.hrl").

-define(ETS_RC,{read_concurrency,true}).
-define(ETS_WC,{write_concurrency,true}).

-define(ONS_SECOND_MS, 1000).
-define(ONE_MINUTE_MS, 60*1000).
-define(ONT_HOUR_MS, 60*60*1000).



-define(WATCHDOG_OTP, watchdog).
-define(DIST_MONITOR_OTP, dist_monitor).

%%
-define(if_else(Cond, True, False), case Cond of true -> True; _ -> False end).
%% Helper macro for declaring children of supervisor
-define(CHILD_START(SupPid, I, Type), supervisor:start_child(SupPid, {I, {I, start_link, []}, permanent, 5000, Type, [I]})).
-define(CHILD_START(SupPid, I, Type, Params), supervisor:start_child(SupPid, {I, {I, start_link, Params}, permanent, 5000, Type, [I]})).
-define(CHILD_START(SupPid, Name, I, Type, Params), supervisor:start_child(SupPid, {Name, {I, start_link, Params}, permanent, 5000, Type, [Name]})).

-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).
-define(CHILD(I, Type, Params), {I, {I, start_link, Params}, permanent, 5000, Type, [I]}).
-define(CHILD(Name, I, Type, Params), {Name, {I, start_link, Params}, permanent, 5000, Type, [Name]}).

%%-------------------------------------------------------------------------------
-define(TRY_CATCH(Fun, Err, St, Format, Args),
    try Fun
    catch _:Err:St ->
        ?ERROR(Format ++ "Reason=~w,Stacktrace=~p", Args ++ [Err, St])
    end).

%%-------------------------------------------------------------------------------
-define(TRY_CATCH(Fun, Err, St, Tip),
    try Fun
    catch _:Err:St ->
        ?ERROR("~ts: Reason=~w,Stacktrace=~p", [Tip, Err, St])
    end).
-define(TRY_CATCH(Fun, Err, St),
    try Fun
    catch _:Err:St ->
        ?ERROR("Reason=~w,Stacktrace=~p", [Err, St])
    end).

-define(TRY_CATCH(Fun), ?TRY_CATCH(Fun,Err,St)).

%%-------------------------------------------------------------------------------
-define(TRY_CATCH_RET(Fun, Ret, Err, St, Format, Args),
    try Fun
    catch _:Err:St ->
        ?ERROR(Format ++ "Reason=~w,Stacktrace=~p", Args ++ [Err, St]),
        Ret
    end).

-define(TRY_CATCH_RET(Fun, Ret, Err, St, Tip),
    try Fun
    catch _:Err:St ->
        ?ERROR("~ts: Reason=~w,Stacktrace=~p", [Tip,Err,St]),
        Ret
    end).
-define(TRY_CATCH_RET(Fun, Ret, Err, St),
    try Fun
    catch _:Err:St ->
        ?ERROR("Reason=~w,Stacktrace=~p", [Err,St]),
        Ret
    end).

-define(TRY_CATCH_RET(Fun,Ret), ?TRY_CATCH_RET(Fun, Ret,Err,St)).

%%-------------------------------------------------------------------------------
-define(TRY_CATCH_ONLY(Fun),
    try Fun
    catch _:_ -> skip
    end).

%%-------------------------------------------------------------------------------




-endif.
