%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 十二月 2017 17:12
%%%-------------------------------------------------------------------

-module(dbs).
-author("mawenhong").

-include("logger.hrl").

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).
-export([start/0, stop/0]).

-define(APP, dbs).

%% ===================================================================
%% Application callbacks
%% ===================================================================


start() ->
    application:ensure_all_started(?APP).

stop() ->
    application:stop(?APP),
    erlang:halt().



start(_StartType, _StartArgs) ->
%%    logger
%%    config
%%    mysql_config | manager
%%    mysql_logic
%%    cache
%%    vm / gc / monitor

    {ok, SupPid} = dbs_sup:start_link(),
    
    lists:foreach(
        fun({Msg, stdio, Thunk}) ->
            io:format("starting ~s ~n", [Msg]),
            Thunk(),
            ok;
            ({Msg, Thunk}) ->
                ?INFO("starting ~s ...", [Msg]),
                try
                    Thunk()
                catch
                    _ : Err  ->
                        ?ERROR("run ~p,error ~p, app crash!!! ",[Thunk, Err]),
                        timer:sleep(50000),
                        erlang:halt()
                end,
                ?INFO("starting ~s done", [Msg]),
                ok
        end,
        [
            {"Logger", stdio,
                fun() ->
                    ok = loggerS:start()
                end},
            {"Error Logger",
                fun() ->
                    common_error_logger:start(dbs_sup, dbs)
                end},
            {"sentinel",
                fun() ->
                    {ok, _} = sentinel_server:start_link()
                end},
            {"Config init",
                fun() ->
                    ok = mod_ini_conf:init_conf("dbs.ini")
                end},
            {"mem cache",
                fun() ->
                    ok = mod_player_cache_manager:start_player_cache()
                end},
            {"mysql pool manager",
                fun() ->
                    {ok, _} = mysql_pool_manager:start_link(),
                    ok = mysql_instance_loader:load_db_conf(),
                    ok = mysql_pool_manager:start_player_mysql_pool(),
                    ok
                end},
            {"check dbpool",
                fun() ->
                    case mysql_pool_manager:check_player_db() of
                        [] -> skip;
                        _ ->
                            ?FATAL("please check player db"),
                            timer:sleep(10000),
                            erlang:halt()
                    end
                end},
            {"worker supervisor",
                fun() ->
                    {ok, _} = dbs_worker_supervisor:start_link()
                end},
            {"worker pool",
                fun() ->
                    {ok, _} = dbs_worker_manager:start_link()
                end},
            {"monitor/gc/vms",
                fun() ->
                    {ok, _} = background_gc:start_link(),
                    {ok, _} = vm_memory_monitor:start_link(0.5),
                    ok
                end},
            {"server window supervisor",
                fun() ->
                    {ok, _} = svr_supervisor:start_link()
                end},
            {"server window manager",
                fun() ->
                    {ok, _} = svr_worker_manager:start_link()
                end},
            {"start auto compile and load",
                fun() ->
                    ok = fly:start()
                end},
            {"showing staus",
                fun() ->
                    sentinel_server:status()
                end}
        ]
    ),
    sentinel_server:ready(true),
    ?WARN("###~p start ok###", [?APP]),
    {ok, SupPid}.

stop(_State) ->
    ok.
