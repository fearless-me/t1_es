%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 一月 2018 14:01
%%%-------------------------------------------------------------------
-module(fastlog).
-author("mawenhong").

-behaviour(gen_server2).

-include_lib("kernel/include/file.hrl").

%% API
-export([start_link/1, start_link/2]).

-export([
    debug/3, debug/2,
    info/3, info/2,
    warn/3, warn/2,
    error/3, error/2,
    fatal/3, fatal/2
]).

-export([
    make_init_log/2,
    pause/0, continue/0,
    log_level/1, log_level/0

]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-export([color_inout/2]).

-define(LOGDIR, "log").
-define(MSG, fast_logger_msg).
-define(MAX_LOG_CNT_ONE_FILE, 150000).
-define(if_else(Cond, True, False), case Cond of true -> True; _ -> False end).

-define(DISCARD_FLAG, dicard_log).
-define(MASTER_NODE, master_of_slave).
-define(CHECK_FLAG_TIMES, 100).
-define(MAX_OVERLOAD_MSG, 10000).
-record(state, {monitorRef, counter, fileName, fd, fd_err, is_log_stdio, no_err_fd = false}).

%%设置日志文件和错误文件的相关选项
-define(LogFileOptions, [
    exclusive, append, raw, binary, delayed_write
]).

-define(ErrorLogFileOptions, [
    exclusive, append, raw, binary, delayed_write
]).

-define(LogFileOpenOpt, [append, raw, binary, delayed_write]).


%%%===================================================================
%%% API
%%%===================================================================

-ifdef(RELEASE).
-define(LOG_LEVEL, info).
-else.
-define(LOG_LEVEL, get_env(log_level, debug)).
-endif.

%%-------------------------------------------------------------------
pause() -> set_env(?DISCARD_FLAG, true).
continue() -> set_env(?DISCARD_FLAG, false).
log_level(Level) -> set_env(log_level, Level).
log_level() -> get_env(log_level, ?LOG_LEVEL).
%%-------------------------------------------------------------------

%%-------------------------------------------------------------------
fatal(Sink, Fmt) -> fatal_(?LOG_LEVEL, Sink, Fmt, []).
fatal(Sink, Fmt, Arg) -> fatal_(?LOG_LEVEL, Sink, Fmt, Arg).

fatal_(debug, Sink, Fmt, Arg) ->
    do_log(fatal, Sink, Fmt, Arg);
fatal_(info, Sink, Fmt, Arg) ->
    do_log(fatal, Sink, Fmt, Arg);
fatal_(warn, Sink, Fmt, Arg) ->
    do_log(fatal, Sink, Fmt, Arg);
fatal_(error, Sink, Fmt, Arg) ->
    do_log(fatal, Sink, Fmt, Arg);
fatal_(_, Sink, Fmt, Arg) ->
    do_log(fatal, Sink, Fmt, Arg).

error(Sink, Fmt) -> error_(?LOG_LEVEL, Sink, Fmt, []).
error(Sink, Fmt, Arg) -> error_(?LOG_LEVEL, Sink, Fmt, Arg).

error_(debug, Sink, Fmt, Arg) ->
    do_log(error, Sink, Fmt, Arg);
error_(info, Sink, Fmt, Arg) ->
    do_log(error, Sink, Fmt, Arg);
error_(warn, Sink, Fmt, Arg) ->
    do_log(error, Sink, Fmt, Arg);
error_(error, Sink, Fmt, Arg) ->
    do_log(error, Sink, Fmt, Arg);
error_(_, _Sink, _Fmt, _Arg) ->
    skip.

warn(Sink, Fmt) -> warn_(?LOG_LEVEL, Sink, Fmt, []).
warn(Sink, Fmt, Arg) -> warn_(?LOG_LEVEL, Sink, Fmt, Arg).

warn_(debug, Sink, Fmt, Arg) ->
    do_log(warn, Sink, Fmt, Arg);
warn_(info, Sink, Fmt, Arg) ->
    do_log(warn, Sink, Fmt, Arg);
warn_(warn, Sink, Fmt, Arg) ->
    do_log(warn, Sink, Fmt, Arg);
warn_(_, _Sink, _Fmt, _Arg) ->
    skip.

info(Sink, Fmt) -> info_(?LOG_LEVEL, Sink, Fmt, []).
info(Sink, Fmt, Arg) -> info_(?LOG_LEVEL, Sink, Fmt, Arg).

info_(debug, Sink, Fmt, Arg) ->
    do_log(info, Sink, Fmt, Arg);
info_(info, Sink, Fmt, Arg) ->
    do_log(info, Sink, Fmt, Arg);
info_(_, _Sink, _Fmt, _Arg) ->
    skip.

debug(Sink, Fmt) -> debug_(?LOG_LEVEL, Sink, Fmt, []).
debug(Sink, Fmt, Arg) -> debug_(?LOG_LEVEL, Sink, Fmt, Arg).

debug_(debug, Sink, Fmt, Arg) ->
    do_log(debug, Sink, Fmt, Arg);
debug_(_, _Sink, _Fmt, _Arg) ->
    skip.


do_log(Level, Sink, F, A) ->
    {{YYYY, MM, DD}, {Hour, Min, Sec}} = erlang:localtime(),
    String =
        io_lib:format("[~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w][~w]~ts~n",
            [YYYY, MM, DD, Hour, Min, Sec, Level, io_lib:format(F, A)]),
    case get_env(?MASTER_NODE, undefined) of
        undefined ->
            Sink ! {?MSG, Level, String};
        MasterNode ->
            {Sink, MasterNode} ! {?MSG, Level, String}
    end,
    ok.


is_slave() -> get_env(?MASTER_NODE, undefined) =/= undefined.

make_init_log(Sink, Fname) ->
    gen_server2:call(Sink, {make_init_log, Fname}).


%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
-define(SWEEP_OPT, {spawn_opt,[{fullsweep_after, 50}]}).
start_link(Fname) ->
    ParentPid = self(),
    gen_server2:start_link({local, ?MODULE}, ?MODULE, [Fname, ParentPid], [?SWEEP_OPT]).

start_link(Sink, Fname) ->
    ParentPid = self(),
    gen_server2:start_link({local, Sink}, ?MODULE, [Fname, ParentPid], [?SWEEP_OPT]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
    {ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term()} | ignore).
init(Args) -> mod_init(Args).

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
    State :: #state{}) ->
    {reply, Reply :: term(), NewState :: #state{}} |
    {reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
    {noreply, NewState :: #state{}} |
    {noreply, NewState :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
    {stop, Reason :: term(), NewState :: #state{}}).

handle_call(Request, From, State) ->
    try call(Request, From, State)
    catch T : E : _ST ->
        error_logger:error_report([{T, E}]),
        {reply, error, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_cast(Request :: term(), State :: #state{}) ->
    {noreply, NewState :: #state{}} |
    {noreply, NewState :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: #state{}}).
handle_cast(_Request, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
-spec(handle_info(Info :: timeout() | term(), State :: #state{}) ->
    {noreply, NewState :: #state{}} |
    {noreply, NewState :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: #state{}}).
handle_info(Info, State) ->
    try do_handle_info(Info, State)
    catch T : E : _ST ->
        error_logger:error_report([{T, E}]),
        {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
    State :: #state{}) -> term()).
terminate(_Reason, #state{fd = Fd}) ->
    catch file:close(Fd),
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
    Extra :: term()) ->
    {ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
mod_init([Fname, ParentPid]) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    case master_node() of
        undefined -> skip;
        MasterNode -> set_env(?MASTER_NODE, MasterNode)
    end,

    Ref = erlang:monitor(process, ParentPid),
    do_init(is_slave(), Ref, Fname, ?LOGDIR).

do_init(true, Ref, _Fname, _Dir) ->
    {ok, #state{monitorRef = Ref, counter = 0}};
do_init(false, Ref, Fname, Dir) ->
    MkDirNew = get_env(mkdir_restart, false),
    MkLogRun = get_env(createfile_restart, true),
    ensure_log_dir(MkDirNew, Dir),
    NoErr = case erlang:process_info(self(), registered_name) of
                {registered_name, ?MODULE} -> false;
                _ -> true
            end,

    Fd = ?if_else(MkLogRun, make_file_(Fname), undefined),
    FdErr = ?if_else(NoErr orelse (not MkLogRun), undefined, make_err_file_(Fname)),

    IsShowInStdio = get_env(show_in_stdio, true),
    {ok, #state{
        monitorRef = Ref, counter = 0, fileName = Fname,
        fd = Fd, fd_err = FdErr, is_log_stdio = IsShowInStdio,
        no_err_fd = NoErr}}.




start_file_timer() ->
    Self = self(),
    spawn_link(fun() ->
        %% time is in seconds
        timer:sleep(next_hour_sec() * 1000),
        Self ! rotate_timer
               end),
    ok.
%%--------------------------------------------------------------------
do_handle_info({?MSG, Level, String}, #state{counter = Cnt} = State) ->
    case need_write_log(Cnt) of
        true ->
            write_log(Level, String, State),
            Res = check_rotation(State),
            {noreply, Res};
        _ ->
            {noreply, State}
    end;
do_handle_info({?MSG, Level, Fmt, Args, Time}, #state{counter = Cnt} = State) ->
    case need_write_log(Cnt) of
        true ->
            write_log(Level, Fmt, Args, Time, State),
            Res = check_rotation(State),
            {noreply, Res};
        _ ->
            {noreply, State}
    end;
do_handle_info(rotate_timer, #state{} = State) ->
    {ok, State2} = rotate(State),
    start_file_timer(),
    {ok, State2};
do_handle_info({'DOWN', Ref, process, _Object, _Info}, #state{monitorRef = Ref} = StateData) ->
    erlang:send_after(5000, self(), stop),
    {noreply, StateData};
do_handle_info(stop, StateData) ->
    {stop, normal, StateData};
do_handle_info(_Info, StateData) ->
    {noreply, StateData}.

%%--------------------------------------------------------------------
call({make_init_log, Fname}, _From, State) ->
    #state{no_err_fd = NoErr} = State,

    Fd = make_file_(Fname),
    FdErr = ?if_else(NoErr, undefined, make_err_file_(Fname)),
    {reply, true, State#state{fd = Fd, fd_err = FdErr, fileName = Fname}};
call(Request, From, State) ->
    io:format("undeal call ~w from ~w", [Request, From]),
    {noreply, ok, State}.

%%--------------------------------------------------------------------
rotate(#state{fileName = Fname, fd = Fd, fd_err = FdErr, no_err_fd = NoErr} = State) ->
    catch file:close(Fd),
    catch file:close(FdErr),
    Fd2 = make_file_(Fname),
    Fd3 = ?if_else(NoErr, undefined, make_err_file_(Fname)),
    {ok, State#state{fd = Fd2, fd_err = Fd3, counter = 0}}.

% Check if the file needs to be rotated
% ignore in case of if log type is set to time instead of size
check_rotation(State) ->
    #state{counter = Cntr} = State,
    if
        Cntr > ?MAX_LOG_CNT_ONE_FILE ->
            {ok, State2} = rotate(State),
            State2;
        true ->
            State#state{counter = Cntr + 1}
    end.

write_log(Level, String, #state{fd = Fd, fd_err = FdErr, is_log_stdio = Stdio, no_err_fd = NoErr}) ->
    file:write(Fd, String),
    write_console(Level, Stdio, String),
    case NoErr =:= false andalso is_error_log(Level) of
        true -> file:write(FdErr, String);
        _ -> skip
    end.

write_log(Level, Fmt, Args,
    {{YYYY, MM, DD}, {Hour, Min, Sec}}, #state{fd = Fd, fd_err = FdErr, is_log_stdio = Stdio, no_err_fd = NoErr}) ->

    Str1 = io_lib:format(Fmt, Args),
    String =
        io_lib:format("[~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w] [~w] ~ts ~n",
            [YYYY, MM, DD, Hour, Min, Sec, Level, Str1]),
    file:write(Fd, String),
    write_console(Level, Stdio, String),
    case NoErr =:= false andalso is_error_log(Level) of
        true -> file:write(FdErr, String);
        _ -> skip
    end.


-ifndef(RELEASE).
write_console(Level, Stdio, String) ->
    case Stdio of
        true -> erlang:spawn(
            fun() ->
                color_inout(Level, String)
            end);
        _ -> skip
    end,
    ok.
-else.
write_console(Level, Stdio, String) ->
    case os:type() of
        {win32, _} ->
            case Stdio of
                true -> erlang:spawn(fun() -> color_inout(Level, String) end);
                _ -> skip
            end,
            ok;
        _ ->
            skip
    end,
    skip.
-endif.

color_inout(fatal, Msg) -> io:format(user, "~ts", [color:red(Msg)]);
color_inout(error, Msg) -> io:format(user, "~ts", [color:red(Msg)]);
color_inout(warn, Msg) -> io:format(user, "~ts", [color:yellow(Msg)]);
color_inout(debug, Msg) -> io:format(user, "~ts", [color:green(Msg)]);
color_inout(_, Msg) -> io:format(user, "~ts", [Msg]).


is_error_log(debug) -> false;
is_error_log(info) -> false;
is_error_log(warn) -> false;
is_error_log(_) -> true.

need_write_log(Cnt) when is_number(Cnt) ->
    case Cnt > 0 andalso (Cnt rem ?CHECK_FLAG_TIMES) =:= 0 of
        true ->
            not (get_env(?DISCARD_FLAG, false) orelse check_msg_queue());
        _ ->
            true
    end;
need_write_log(_Any) ->
    true.

check_msg_queue()->
    MaxLimit = get_env(overload_msg_len, ?MAX_OVERLOAD_MSG),
    case erlang:process_info(self(), message_queue_len) of
        {message_queue_len, MsgQ} -> MsgQ >= MaxLimit;
        _ -> false
    end.

make_file_(Fname) ->
    Dir = get_env(logdir, ?LOGDIR),
    make_file_(Dir, Fname, "").

make_err_file_(Fname) ->
    Dir = get_env(logdir, ?LOGDIR),
    make_file_(Dir, Fname, ".Err").

make_file_(Dir, Fname, Suffix) ->
    TimeNow = time_format(erlang:localtime()),
    File = Dir ++ "/" ++ Fname ++ "." ++ TimeNow ++ Suffix ++ ".log",
    {ok, Fd}  =
        case file:open(File, ?LogFileOptions) of
            {ok, _} = Res -> Res;
            {error,eexist} -> file:open(File, ?LogFileOpenOpt);
            Error -> io:format("*** create file ~s error ~p ~n",[File, Error]), Error
        end,
    file:write(Fd, <<16#EF, 16#BB, 16#BF>>),
    io:format("[~ts][info]create log file[~s] succ.~n", [time_format_str(erlang:localtime()), File]),
    Fd.

ensure_log_dir(MkNewDir, Dir) ->
    case get_env(logdir, undefined) of
        undefined ->
            NewDir = gen_log_dir(MkNewDir, Dir),
            file:make_dir(NewDir),
            set_env(logdir, NewDir);
        ExistDir ->
            file:make_dir(ExistDir)
    end,
    ok.

gen_log_dir(true, Dir) ->
    Dir ++ now_day();
gen_log_dir(_, Dir) ->
    Dir.

next_hour_sec() ->
    {_, {_, Min, Sec}} = erlang:localtime(),
    3600 - Min * 60 - Sec.

now_day() ->
    {{YYYY, MM, DD}, {HH, _, _}} = erlang:localtime(),
    lists:flatten(io_lib:format("~.4w~.2.0w~.2.0w~.2.0w",
        [YYYY, MM, DD, HH])).

time_format_str({{YYYY, MM, DD}, {Hour, Min, Sec}}) ->
    lists:flatten(io_lib:format("~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w",
        [YYYY, MM, DD, Hour, Min, Sec])).

time_format({{YYYY, MM, DD}, {Hour, Min, Sec}}) ->
    lists:flatten(io_lib:format("~.4w_~.2.0w_~.2.0w_~.2.0w_~.2.0w_~.2.0w", [YYYY, MM, DD, Hour, Min, Sec])).

master_node() ->
    case init:get_argument(master) of
        error -> undefined;
        {ok, [[MasterNode]]} -> erlang:list_to_atom(MasterNode)
    end.


set_env(Key, Value) ->
    application:set_env(?MODULE, Key, Value).

get_env(Key, Def) ->
    application:get_env(?MODULE, Key, Def).
