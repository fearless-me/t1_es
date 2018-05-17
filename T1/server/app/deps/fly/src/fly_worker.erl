%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 一月 2018 16:43
%%%-------------------------------------------------------------------
-module(fly_worker).
-author("mawenhong").

-behaviour(gen_server).

%% skip logger.hrl dependence
%%-include("logger.hrl").
-ifndef(WARN).
-define(WARN(Fmt), loggerS:warn("[~w:~w]" ++ Fmt, [?MODULE, ?LINE])).
-define(WARN(Fmt, Args), loggerS:warn("[~w:~w]" ++ Fmt, [?MODULE, ?LINE] ++ Args)).
-endif.

-ifndef(ERROR).
-define(ERROR(Fmt), loggerS:error("[~w:~w]" ++ Fmt, [?MODULE, ?LINE])).
-define(ERROR(Fmt, Args), loggerS:error("[~w:~w]" ++ Fmt, [?MODULE, ?LINE] ++ Args)).
-endif.

%% define
-record(state, {
    modules = [] :: [module()],
    src_dirs = [] :: [file:filename()],
    src_files = [] :: [file:filename()],
    hrl_dirs = [] :: [file:filename()],
    hrl_files = [] :: [file:filename()],
    compile_opts = [],
    src_file_lastmod = [],
    hrl_file_lastmod = [],
    paused = false

}).

-record(hrl_file_srcs, {
    inc_file = "",
    src_files = []
}).
-define(SRC_INC_ETS, src_inc_ets__).

%% API
-export([run_now/0, pause/0, continue/0]).
-export([get_system_modules/0]).
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).


%%%===================================================================
%%% public functions
%%%===================================================================	
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

pause() ->
    gen_server:cast(?MODULE, pause),
    ok.

continue() ->
    gen_server:cast(?MODULE, continue),
    ok.

run_now() ->
    {_, MQueueLen} = erlang:process_info(whereis(?MODULE), message_queue_len),
    case MQueueLen == 0 of
        true ->
            gen_server:cast(?MODULE, discover_src_dirs),
            gen_server:cast(?MODULE, discover_src_files),
            gen_server:cast(?MODULE, compare_src_files),
            gen_server:cast(?MODULE, compare_hrl_files),
            ok;
        _ -> skip
    end,
    ok.

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    Interval = fly:info(interval),
    ets:new(?SRC_INC_ETS,
        [
            named_table, set, public,
            {keypos, #hrl_file_srcs.inc_file},
            {write_concurrency, true},
            {read_concurrency, true}
        ]),
    timer:apply_interval(Interval, fly_worker, run_now, []),
    ?WARN("fly worker stared!"),
    {ok, #state{}}.

%%%-------------------------------------------------------------------
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.
%%%-------------------------------------------------------------------
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.
%%%-------------------------------------------------------------------
do_handle_cast(pause, State) ->
    ?WARN("Pausing reload. Call fly:continue() to restart~n"),
    {noreply, State#state{paused = true}};
do_handle_cast(continue, State) ->
    {noreply, State#state{paused = false}};
do_handle_cast(_Any, State) when State#state.paused =:= true ->
    {noreply, State};
do_handle_cast(discover_src_dirs, State) ->
    discover_src_dirs(State);
do_handle_cast(discover_src_files, State) ->
    discover_src_files(State);
do_handle_cast(compare_src_files, State) ->
    compare_src_files(State);
do_handle_cast(compare_hrl_files, State) ->
    compare_hrl_files(State);
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%%-------------------------------------------------------------------
discover_src_dirs(State) ->
    SrcDirs = fly:info(src_dirs),
    IncDirs = fly:info(inc_dirs),
    Options = fly:info(opts),
    {noreply, State#state{
        src_dirs = SrcDirs, hrl_dirs = IncDirs, compile_opts = Options
    }}.

discover_src_files(
    #state{src_dirs = SrcDirs, hrl_dirs = IncDirs} = State) ->
    F =
        fun(X, Acc) ->
            wildcard(X, ".*\\.erl$") ++ Acc
        end,
    ErlFiles = lists:usort(lists:foldl(F, [], SrcDirs ++ IncDirs)),

    Fhrl =
        fun(X, Acc) ->
            wildcard(X, ".*\\.hrl$") ++ Acc
        end,
    HrlFiles = lists:usort(lists:foldl(Fhrl, [], SrcDirs ++ IncDirs)),
    NewState = State#state{src_files = ErlFiles, hrl_files = HrlFiles},
    process_src_files_incs(ErlFiles),
    {noreply, NewState}.


compare_src_files(State) ->
    %% Create a list of file lastmod times...
    F = fun(X) ->
        LastMod = filelib:last_modified(X),
        {X, LastMod}
        end,
    NewSrcFileLastMod = lists:usort([F(X) || X <- State#state.src_files]),

    %% Compare to previous results, if there are changes, then recompile the file...
    process_src_file_lastmod(State#state.src_file_lastmod, NewSrcFileLastMod, State#state.compile_opts),

    %% Return with updated src_file lastmod...
    NewState = State#state{src_file_lastmod = NewSrcFileLastMod},
    {noreply, NewState}.


compare_hrl_files(State) ->
    %% Create a list of file lastmod times...
    F =
        fun(X) ->
            LastMod = filelib:last_modified(X),
            {X, LastMod}
        end,
    NewHrlFileLastMod = lists:usort([F(X) || X <- State#state.hrl_files]),
    
    %% Compare to previous results, if there are changes, then recompile src files that depends
    process_hrl_file_lastmod(State#state.hrl_file_lastmod, NewHrlFileLastMod, State#state.src_files, State#state.compile_opts),

    %% Schedule the next interval...

    %% Return with updated hrl_file lastmod...
    NewState = State#state{hrl_file_lastmod = NewHrlFileLastMod},
    {noreply, NewState}.

process_src_files_incs(SrcFiles) ->
    case ets:info(?SRC_INC_ETS, size) of
        0 ->
            Now = os:system_time(milli_seconds),
            Pid = erlang:spawn(
                fun() ->
                    PidList = process_src_file_incs_1([], lists:sublist(SrcFiles, 50)),
                    wait_src_parse_finish(erlang:length(PidList))
                end),
            wait_pid_go_die(is_process_alive(Pid), Pid),
            Diff = os:system_time(milli_seconds) - Now,
            ?WARN("src files ~p(s), parse hrl include use time ~p(ms)",
                [erlang:length(SrcFiles), Diff]),
            ok;
        _ ->
            skip
    end.


process_src_file_incs(SrcFile) ->
    {ok, Forms} = epp_dodger:parse_file(SrcFile),
    IncludeFiles = src_file_include([], Forms),
%%    ?WARN("src ~ts, incs ~p",[SrcFile, IncludeFiles]),
    lists:foreach(
        fun(IncludeFile) ->
            case ets:lookup(?SRC_INC_ETS, IncludeFile) of
                [] ->
                    ets:insert(
                        ?SRC_INC_ETS,
                        #hrl_file_srcs{inc_file = IncludeFile, src_files = [SrcFile]});
                [#hrl_file_srcs{src_files = SrcFiles} | _] ->
                    ets:update_element(
                        ?SRC_INC_ETS,
                        IncludeFile,
                        {#hrl_file_srcs.src_files, [ SrcFile | SrcFiles]}
                    )
            end
        end, IncludeFiles),
    ok.

process_src_file_incs_1(PidList, []) ->
    PidList;
process_src_file_incs_1(PidList, [SrcFile | SrcFiles]) ->
    Pid = erlang:spawn_monitor(fun() -> process_src_file_incs(SrcFile) end),
    process_src_file_incs_1([Pid | PidList], SrcFiles).

src_file_include(HrlFiles, []) ->
    HrlFiles;
src_file_include(HrlFiles, [{tree, attribute, _, {attribute, _, [{_, _, IncludeFile}]}} | Forms]) when is_list(IncludeFile) ->
    IncludeFileBaseName = filename:basename(IncludeFile),
    case lists:member(IncludeFileBaseName, HrlFiles) of
        true -> src_file_include(HrlFiles, Forms);
        _ -> src_file_include([IncludeFileBaseName | HrlFiles], Forms)
    end;
src_file_include(HrlFiles, [_SomeForm | Forms]) ->
    src_file_include(HrlFiles, Forms).

wait_pid_go_die(true, Pid)->
    timer:sleep(1),
    wait_pid_go_die(is_process_alive(Pid), Pid);
wait_pid_go_die(_, _Pid)-> ok.

wait_src_parse_finish(0) ->
    skip;
wait_src_parse_finish(N) ->
    receive
        {'DOWN', _MRef, _process, _Pid, normal} ->
            ok;
        {'DOWN', _MRef, process, _Pid, _Reason} ->
            ok;
%%            ?WARN("~p|~p finished ~p~n",[Pid, MRef, Reason]);
        {_Pid, _Result} ->
            skip
%%            ?WARN("~p finished ~p~n",[Pid,  Result])
    end,
    wait_src_parse_finish(N - 1).


process_hrl_file_lastmod([{File, LastMod} | T1], [{File, LastMod} | T2], SrcFiles, Options) ->
    %% Hrl hasn't changed, do nothing...
    process_hrl_file_lastmod(T1, T2, SrcFiles, Options);
process_hrl_file_lastmod([{File, _} | T1], [{File, _} | T2], SrcFiles, Options) ->
    %% File has changed, recompile...
    WhoInclude = who_include(File, SrcFiles),
    [recompile_src_file(SrcFile, Options) || SrcFile <- WhoInclude],
    process_hrl_file_lastmod(T1, T2, SrcFiles, Options);
process_hrl_file_lastmod([{File1, LastMod1} | T1], [{File2, LastMod2} | T2], SrcFiles, Options) ->
    %% Lists are different...
    case File1 < File2 of
        true ->
            %% File was removed, do nothing...
            warn_deleted_hrl_files(File1, SrcFiles),
            process_hrl_file_lastmod(T1, [{File2, LastMod2} | T2], SrcFiles, Options);
        false ->
            %% File is new, look for src that include it
            WhoInclude = who_include(File2, SrcFiles),
            [maybe_recompile_src_file(SrcFile, LastMod2, Options) || SrcFile <- WhoInclude],
            process_hrl_file_lastmod([{File1, LastMod1} | T1], T2, SrcFiles, Options)
    end;
process_hrl_file_lastmod([], [{File, LastMod} | T2], SrcFiles, Options) ->
    %% File is new, look for src that include it
    WhoInclude = who_include(File, SrcFiles),
    [maybe_recompile_src_file(SrcFile, LastMod, Options) || SrcFile <- WhoInclude],
    process_hrl_file_lastmod([], T2, SrcFiles, Options);
process_hrl_file_lastmod([{File1, _LastMod1} | T1], [], SrcFiles, Options) ->
    %% Rest of file(s) removed, warn and process next
    warn_deleted_hrl_files(File1, SrcFiles),
    process_hrl_file_lastmod(T1, [], SrcFiles, Options);
process_hrl_file_lastmod([], [], _, _) ->
    %% Done
    ok;
process_hrl_file_lastmod(undefined, _Other, _, _) ->
    %% First load, do nothing
    ok.


warn_deleted_hrl_files(HrlFile, SrcFiles) ->
    WhoInclude = who_include(HrlFile, SrcFiles),
    case WhoInclude of
        [] -> ok;
        _ ->
            ?WARN(
                "Deleted ~p file included in existing src files: ~p.",
                [filename:basename(HrlFile), lists:map(fun(File) -> filename:basename(File) end, WhoInclude)])
    end.


process_src_file_lastmod([{File, LastMod} | T1], [{File, LastMod} | T2], Options) ->
    %% Beam hasn't changed, do nothing...
    process_src_file_lastmod(T1, T2, Options);
process_src_file_lastmod([{File, _} | T1], [{File, _} | T2], Options) ->
    %% File has changed, recompile...
    recompile_src_file(File, Options),
    process_src_file_lastmod(T1, T2, Options);
process_src_file_lastmod([{File1, LastMod1} | T1], [{File2, LastMod2} | T2], Options) ->
    %% Lists are different...
    case File1 < File2 of
        true ->
            %% File was removed, do nothing...
            process_src_file_lastmod(T1, [{File2, LastMod2} | T2], Options);
        false ->
            maybe_recompile_src_file(File2, LastMod2, Options),
            process_src_file_lastmod([{File1, LastMod1} | T1], T2, Options)
    end;
process_src_file_lastmod([], [{File, LastMod} | T2], Options) ->
    maybe_recompile_src_file(File, LastMod, Options),
    process_src_file_lastmod([], T2, Options);
process_src_file_lastmod(_A, [], _) ->
    %% All remaining files, if any, were removed.
    ok;
process_src_file_lastmod(undefined, _Other, _) ->
    %% First load, do nothing.
    ok.

recompile_src_file(SrcFile, Options) ->
    %% Get the module, src dir, and options...
    process_src_file_incs(SrcFile),
    {CompileFun, Module} =
        {fun compile:file/2, list_to_atom(filename:basename(SrcFile, ".erl"))},

    %% Get the old binary code...
    OldBinary = get_object_code(Module),
%%    io:format("compile:file(~ts,~p).~n",
%%        [SrcFile, [binary, return, report_errors, error_summary | Options]]),
    case CompileFun(SrcFile, [binary, return, report_errors, error_summary | Options]) of
        {ok, Module, Binary, Warnings} ->
            reload_if_necessary(CompileFun, SrcFile, Module, OldBinary, Binary, Options, Warnings);

        {ok, [{ok, Module, Binary, Warnings}], Warnings2} ->
            reload_if_necessary(CompileFun, SrcFile, Module, OldBinary, Binary, Options, Warnings ++ Warnings2);

        {ok, multiple, Results, Warnings} ->
            Reloader = fun({CompiledModule, Binary}) ->
                {ok, _, _} = reload_if_necessary(CompileFun, SrcFile, CompiledModule, OldBinary, Binary, Options, Warnings)
                       end,
            lists:foreach(Reloader, Results),
            {ok, [], Warnings};

        {ok, OtherModule, _Binary, Warnings} ->
            Desc = io_lib:format("Module definition (~p) differs from expected (~s)", [OtherModule, filename:rootname(filename:basename(SrcFile))]),

            Errors = [{SrcFile, {0, Module, Desc}}],
            print_results(Module, SrcFile, Errors, Warnings),
            {ok, Errors, Warnings};

        {error, Errors, Warnings} ->
            %% Compiling failed. Print the warnings and errors...
            print_results(Module, SrcFile, Errors, Warnings),
            {ok, Errors, Warnings}
    end.

maybe_recompile_src_file(File, LastMod, Options) ->
    Module = list_to_atom(filename:basename(File, ".erl")),
    case code:which(Module) of
        BeamFile when is_list(BeamFile) ->
            %% check with beam file
            case filelib:last_modified(BeamFile) of
                BeamLastMod when LastMod > BeamLastMod ->
                    recompile_src_file(File, Options);
                _ ->
                    ok
            end;
        _ ->
            %% File is new, recompile...
            recompile_src_file(File, Options)
    end.


get_object_code(Module) ->
    case code:get_object_code(Module) of
        {Module, B, _Filename} -> B;
        _ -> undefined
    end.

reload_if_necessary(_CompileFun, SrcFile, Module, Binary, Binary, _Options, Warnings) ->
    %% Compiling didn't change the beam code. Don't reload...
    print_results(Module, SrcFile, [], Warnings),
    {ok, [], Warnings};

reload_if_necessary(CompileFun, SrcFile, Module, _OldBinary, _Binary, Options, Warnings) ->
    %% Compiling changed the beam code. Compile and reload.
    CompileFun(SrcFile, Options),
    %% Print the warnings...
    print_results(Module, SrcFile, [], Warnings),
    %% reload
    reload(Module),

    {ok, [], Warnings}.

reload(Module) ->
    code:purge(Module),
    case code:load_file(Module) of
        {module, Module} -> ?WARN("~p: Reload.", [Module]);
        {error, nofile} -> ?ERROR("reload error:~p,~p", [Module, nofile])
    end.

print_results(_Module, SrcFile, [], []) ->
    Msg = io_lib:format("~s: Recompiled.", [filename:basename(SrcFile)]),
    ?WARN(lists:flatten(Msg));

print_results(_Module, SrcFile, [], Warnings) ->
    Msg = [
        format_errors(SrcFile, [], Warnings),
        io_lib:format("~s: Recompiled with ~p warnings~n", [SrcFile, length(Warnings)])
    ],
    ?WARN(Msg);

print_results(_Module, SrcFile, Errors, Warnings) ->
    Msg = [
        format_errors(SrcFile, Errors, Warnings)
    ],
    ?ERROR(Msg).


%% @private Print error messages in a pretty and user readable way.
format_errors(File, Errors, Warnings) ->
    AllErrors1 = lists:sort(lists:flatten([X || {_, X} <- Errors])),
    AllErrors2 = [{Line, "Error", Module, Description} || {Line, Module, Description} <- AllErrors1],
    AllWarnings1 = lists:sort(lists:flatten([X || {_, X} <- Warnings])),
    AllWarnings2 = [{Line, "Warning", Module, Description} || {Line, Module, Description} <- AllWarnings1],
    Everything = lists:sort(AllErrors2 ++ AllWarnings2),
    F = fun({Line, Prefix, Module, ErrorDescription}) ->
        Msg = format_error(Module, ErrorDescription),
        io_lib:format("~n~s:~p: ~s: ~s~n", [filename:basename(File), Line, Prefix, Msg])
        end,
    [F(X) || X <- Everything].

format_error(Module, ErrorDescription) ->
    case erlang:function_exported(Module, format_error, 1) of
        true -> Module:format_error(ErrorDescription);
        false -> io_lib:format("~s", [ErrorDescription])
    end.


who_include(HrlFile, _SrcFiles) ->
    case ets:lookup(?SRC_INC_ETS, HrlFile) of
       [#hrl_file_srcs{src_files = SrcFiles} | _] -> SrcFiles;
        _ -> []
    end.
%%who_include(HrlFile, SrcFiles) ->
%%    HrlFileBaseName = filename:basename(HrlFile),
%%    Pred = fun(SrcFile) ->
%%        {ok, Forms} = epp_dodger:quick_parse_file(SrcFile),
%%        is_include(HrlFileBaseName, Forms)
%%           end,
%%    lists:filter(Pred, SrcFiles).


%%is_include(_HrlFile, []) ->
%%    false;
%%is_include(HrlFile, [{tree, attribute, _, {attribute, _, [{_, _, IncludeFile}]}} | Forms]) when is_list(IncludeFile) ->
%%    IncludeFileBaseName = filename:basename(IncludeFile),
%%    case IncludeFileBaseName of
%%        HrlFile -> true;
%%        _ -> is_include(HrlFile, Forms)
%%    end;
%%is_include(HrlFile, [_SomeForm | Forms]) ->
%%    is_include(HrlFile, Forms).


%% @private Return all files in a directory matching a regex.
wildcard(Dir, Regex) ->
    filelib:fold_files(Dir, Regex, true, fun(Y, Acc1) -> [Y | Acc1] end, []).

%% @private Return a list of all modules that belong to Erlang rather
%% than whatever application we may be running.
get_system_modules() ->
    Apps = [
        appmon,
        asn1,
        common_test,
        compiler,
        crypto,
        debugger,
        dialyzer,
        docbuilder,
        edoc,
        erl_interface,
        erts,
        et,
        eunit,
        gs,
        hipe,
        inets,
        inets,
        inviso,
        jinterface,
        kernel,
        mnesia,
        observer,
        orber,
        os_mon,
        parsetools,
        percept,
        pman,
        reltool,
        runtime_tools,
        sasl,
        snmp,
        ssl,
        stdlib,
        syntax_tools,
        test_server,
        toolbar,
        tools,
        tv,
        webtool,
        wx,
        xmerl,
        zlib
    ],
    F = fun(App) ->
        case application:get_key(App, modules) of
            {ok, Modules} -> Modules;
            _Other -> []
        end
        end,
    lists:flatten([F(X) || X <- Apps]).


%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%  {ok, State, Timeout} | ignore | {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init(Args) -> mod_init(Args).

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%% @spec handle_call(_Request, _From, State) ->
%% {reply, Reply, NewState} |
%% {reply, Reply, NewState, timeout() | hibernate} |
%% {noreply, NewState} | {noreply, NewState, timeout() | hibernate} |
%% {stop, Reason, Reply, NewState} | {stop, Reason, NewState}
%%
%% @end
%%--------------------------------------------------------------------
handle_call(Request, From, State) ->
    try
        do_handle_call(Request, From, State)
    catch
        T : E ->
            ?ERROR("call ~w:~w,stack:~p",
                [T, E, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.
%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% {noreply, NewState}} |
%% {noreply, NewState, timeout() | hibernate} |
%% {stop, Reason, NewState}
%%
%% @end
%%--------------------------------------------------------------------
handle_cast(Request, State) ->
    try
        do_handle_cast(Request, State)
    catch
        T : E ->
            ?ERROR("cast ~w:~w,stack:~p",
                [T, E, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> 
%% 	{noreply, State} | {noreply, State, Timeout} | {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(Info, State) ->
    try
        do_handle_info(Info, State)
    catch
        T : E ->
            ?ERROR("info ~w:~w,stack:~p",
                [T, E, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @spec terminate(Reason, State) -> void()
%% 
%%--------------------------------------------------------------------
terminate(_Reason, _State) -> ok.

%%--------------------------------------------------------------------
%% @private
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) -> {ok, State}.
