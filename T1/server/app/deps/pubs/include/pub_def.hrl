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

-include("logger.hrl").
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
    catch _:Err:St -> ?ERROR(Format ++ "Error=~w,stack=~p", Args ++ [Err, St])
    end).

%%-------------------------------------------------------------------------------
-define(TRY_CATCH(Fun, Err, St, Tip),
    try Fun
    catch _:Err:St -> ?ERROR("~ts: Error=~w,stack=~p", [Tip, Err, St])
    end).

-define(TRY_CATCH(Fun, Err, St),
    try Fun
    catch _:Err:St -> ?ERROR("Error=~w,stack=~p", [Err, St])
    end).

-define(TRY_CATCH(Fun), ?TRY_CATCH(Fun,Err,St)).

%%-------------------------------------------------------------------------------
-define(TRY_CATCH_RET(Fun, Ret, Err, St, Format, Args),
    try Fun
    catch _:Err:St -> ?ERROR(Format ++ "Error=~w,stack=~p", Args ++ [Err, St]), Ret
    end).

-define(TRY_CATCH_RET(Fun, Ret, Err, St, Tip),
    try Fun
    catch _:Err:St -> ?ERROR("~ts: Error=~w,stack=~p", [Tip,Err,St]), Ret
    end).

-define(TRY_CATCH_RET(Fun, Ret, Err, St),
    try Fun
    catch _:Err:St -> ?ERROR("Error=~w,stack=~p", [Err,St]), Ret
    end).

-define(TRY_CATCH_RET(Fun,Ret), ?TRY_CATCH_RET(Fun, Ret,Err,St)).
%%-------------------------------------------------------------------------------
-define(TRY_CATCH_TIP(Fun, Err),
    try Fun
    catch _ : Err : _  ->  ?ERROR("Error=~w", [Err])
    end
).

%%-------------------------------------------------------------------------------
-define(TRY_CATCH_ERROR(Fun, Err),
    try Fun
    catch _:Err:_ -> ?ERROR("Error=~w", [Err])
    end).

-define(TRY_CATCH_ERROR(Fun), ?TRY_CATCH_ERROR(Fun, Err)).

-define(TRY_CATCH_ERROR_RET(Fun, Err, Ret),
    try Fun
    catch _:Err:_ -> ?ERROR("Error=~w", [Err]), Ret
    end).

-define(TRY_CATCH_ERROR_RET(Fun, Ret), ?TRY_CATCH_ERROR_RET(Fun, Err, Ret)).

-define(TRY_CATCH_RET_ONLY(Fun, Ret),
    try Fun
    catch _:_:_ -> Ret
    end).
%%-------------------------------------------------------------------------------
-define(TRY_CATCH_ONLY(Fun), catch Fun).

%%-------------------------------------------------------------------------------


-endif.
