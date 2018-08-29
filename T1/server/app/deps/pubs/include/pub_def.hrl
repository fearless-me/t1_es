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

%% 服务器类型
-define(SERVER_TYPE_GS, 1).  % 游戏服
-define(SERVER_TYPE_CGS, 2). % 跨服

%% 服务器状态
-define(SEVER_STATUS_INIT, 0).  % 初始化
-define(SEVER_STATUS_READY, 1). % 连接中
-define(SEVER_STATUS_DONE, 2).  % 启动好

%% 玩家跨服状态
-define(CS_PS_NONE,  0). % 无状态
-define(CS_PS_READY, 1). % 连接好，等待确认
-define(CS_PS_DONE,  2). % 已经完成跨服




%%
-define(if_else(Cond, True, False), case Cond of true -> True; _ -> False end).
%% Helper macro for declaring children of supervisor
-define(CHILD(SupPid, I, Type), supervisor:start_child(SupPid, {I, {I, start_link, []}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, I, Type, Params), supervisor:start_child(SupPid, {I, {I, start_link, Params}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, Name, I, Type, Params), supervisor:start_child(SupPid, {Name, {I, start_link, Params}, permanent, 5000, Type, [Name]})).

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
