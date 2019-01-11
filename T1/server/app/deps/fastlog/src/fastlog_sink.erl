%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 一月 2018 14:01
%%%-------------------------------------------------------------------
-module(fastlog_sink).
-author("mawenhong").
-include("fastlog.hrl").
-include_lib("kernel/include/file.hrl").

%%-------------------------------------------------------------------
-define(IMPL_MOD, gen_server).
-behaviour(?IMPL_MOD).


%%-------------------------------------------------------------------
-spec start_link(Sink :: atom(), FileName :: list()) -> pid() | {'error', term()}.
-spec start_link(Sink :: atom(), FileName :: list(), CreateErr :: boolean() ) -> pid() | {'error', term()}.
-spec log_sink(Sink :: atom(), Level :: atom(), Format :: list(), Args :: list() ) -> ok.
%%-------------------------------------------------------------------


%% API
-export([log_sink/4]).
-export([start_link/2, start_link/3]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%%-------------------------------------------------------------------
-define(LOGDIR, "log").
-define(MSG, fast_logger_msg).
-define(MAX_LOG_CNT_ONE_FILE, 150000).
-define(CHECK_FLAG_TIMES, 10).
-define(MAX_OVERLOAD_MSG, 20000).
-define(MAX_OVERLOAD_MSG_STDIO, 2500).
-define(FILE_CACHE, 128 * 1024).
-define(FILE_CACHE_TIMEOUT, 2000).
-define(if_else(Cond, True, False), case Cond of true -> True; _ -> False end).
%%设置日志文件和错误文件的相关选项
-define(DELAY_WRITE, delayed_write).%%{delayed_write, ?FILE_CACHE, ?FILE_CACHE_TIMEOUT}).
-define(LogFileOpenOpt, [append, raw, binary, ?DELAY_WRITE]).
-define(LogFileOptions, ?LogFileOpenOpt).
-define(ErrorLogFileOptions, ?LogFileOpenOpt).
-define(SWEEP_OPT, {spawn_opt, [{fullsweep_after, 50}]}).
%%-------------------------------------------------------------------
-record(state, {
    monitorRef, counter = 0, writes = 0, msg_counter = 0,
    fileName, fd, fd_err, is_log_stdio = false, create_err = true
}).
%%%===================================================================
%%% API
%%%===================================================================
log_sink(Sink, Level, F, A) ->
    do_log_2(fastlog:get_env(?DISCARD_KEY, ?DISCARD_FORBID), Level, Sink, F, A).

do_log_2(?DISCARD_FORBID, Level, Sink, F, A) ->
    Milliseconds = os:system_time(milli_seconds) rem 1000,
    {{YYYY, MM, DD}, {Hour, Min, Sec}} = erlang:localtime(),
    String = io_lib:format
    (
        "[~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w.~.4.0w][~w]" ++ F ++ "~n",
        [YYYY, MM, DD, Hour, Min, Sec, Milliseconds, Level] ++ A
    ),
    try Sink ! {?MSG, Level, erlang:list_to_binary(String)}
    catch _ : _: _ -> skip end,
    ok;
do_log_2(_Any, _Level, _Sink, _F, _A) ->
    ok.

is_slave() -> fastlog:get_env(?MASTER_NODE, undefined) =/= undefined.
%%-------------------------------------------------------------------
passive_pause() -> fastlog:set_env(?DISCARD_KEY, ?DISCARD_PASSIVE).
%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------

start_link(Sink, FileName) ->
    start_link(Sink, FileName, false).

start_link(Sink, FileName, CreateErr) ->
    ParentPid = self(),
    ?IMPL_MOD:start_link({local, Sink}, ?MODULE, [FileName, ParentPid, CreateErr], [?SWEEP_OPT]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
init(Args) -> mod_init(Args).
%%--------------------------------------------------------------------
handle_call(Request, From, State) ->
    try call(Request, From, State)
    catch T : E : _ST ->
        error_logger:error_report([{T, E}]),
        {reply, error, State}
    end.

%%--------------------------------------------------------------------
handle_cast(_Request, State) -> {noreply, State}.

%%--------------------------------------------------------------------
handle_info(Info, State) ->
    try do_handle_info(Info, State)
    catch T : E : _ST ->
        error_logger:error_report([{T, E}]),
        {noreply, State}
    end.

%%--------------------------------------------------------------------
terminate(_Reason, #state{fd = Fd}) ->
    catch file:close(Fd),
    ok.

%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
mod_init([FileName, ParentPid]) ->
    mod_init(FileName, ParentPid, true);
mod_init([FileName, ParentPid, CreateErr]) when is_boolean(CreateErr) ->
    mod_init(FileName, ParentPid, CreateErr);
mod_init([FileName, ParentPid, CreateErr]) when is_number(CreateErr) ->
    mod_init(FileName, ParentPid, CreateErr > 0).

mod_init(FileName, ParentPid, CreateErr) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    case master_node() of
        undefined -> skip;
        MasterNode -> fastlog:set_env(?MASTER_NODE, MasterNode)
    end,

    Ref = erlang:monitor(process, ParentPid),
    do_init(is_slave(), Ref, FileName, CreateErr).

do_init(true, Ref, _FileName, _CreateErr) ->
    {ok, #state{monitorRef = Ref, counter = 0}};
do_init(false, Ref, FileName, CreateErr) ->
    MkDirNew = fastlog:get_env(new_dir_on_start, false),
    ensure_log_dir(MkDirNew, ?LOGDIR),

    Fd = make_file_(FileName),
    FdErr = ?if_else(CreateErr, make_err_file_(FileName), undefined),

    IsShowInStdio = fastlog:get_env(show_in_stdio, true),
    {
        ok,
        #state{
            monitorRef = Ref, counter = 0, fileName = FileName,
            fd = Fd, fd_err = FdErr, is_log_stdio = IsShowInStdio,
            create_err = CreateErr
        }
    }.

start_file_timer() ->
    erlang:send_after(next_hour_sec() * 1000, self(), rotate_timer),
    ok.
%%--------------------------------------------------------------------
do_handle_info({?MSG, Level, String}, #state{writes = Wr, msg_counter = MsgNumber} = State) ->
    case need_write_log(MsgNumber) of
        true ->
            write_log(Level, String, State),
            Res = check_rotation(State),
            {noreply, Res#state{writes = Wr + 1, msg_counter = MsgNumber + 1}};
        _ ->
            {noreply, State#state{msg_counter = MsgNumber + 1}}
    end;
do_handle_info({?MSG, Level, Fmt, Args, Time}, #state{writes = Wr, msg_counter = MsgNumber} = State) ->
    case need_write_log(MsgNumber) of
        true ->
            write_log(Level, Fmt, Args, Time, State),
            Res = check_rotation(State),
            {noreply, Res#state{writes = Wr + 1, msg_counter = MsgNumber + 1}};
        _ ->
            {noreply, State#state{msg_counter = MsgNumber + 1}}
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
call(Request, From, State) ->
    io:format("call ~w from ~w", [Request, From]),
    {noreply, ok, State}.

%%--------------------------------------------------------------------
rotate(#state{fileName = Fname, fd = Fd, fd_err = FdErr, create_err = HasErr} = State) ->
    catch file:close(Fd),
    catch file:close(FdErr),
    Fd2 = make_file_(Fname),
    Fd3 = ?if_else(HasErr, make_err_file_(Fname), undefined),
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

write_log(Level, String, #state{fd = Fd, msg_counter = Cnt, fd_err = FdErr, is_log_stdio = Stdio, create_err = HasErr}) ->
    file:write(Fd, String),

    write_console(Level, String, Cnt, Stdio),
    case HasErr andalso is_error_log(Level) of
        true -> file:write(FdErr, String);
        _ -> skip
    end.

write_log(Level, Fmt, Args,
    {{YYYY, MM, DD}, {Hour, Min, Sec}}, #state{fd = Fd, msg_counter = Cnt, fd_err = FdErr, is_log_stdio = Stdio, create_err = HasErr}) ->

    Str1 = io_lib:format(Fmt, Args),
    String =
        io_lib:format("[~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w] [~w] ~ts ~n",
            [YYYY, MM, DD, Hour, Min, Sec, Level, Str1]),
    file:write(Fd, String),
    write_console(Level, String, Cnt, Stdio),
    case HasErr andalso is_error_log(Level) of
        true -> file:write(FdErr, String);
        _ -> skip
    end.


-ifndef(RELEASE).
write_console(Level, String, Cnt, IsShowStdio) ->
    write_console_log(need_write_stdio_log(IsShowStdio, Cnt), Level, String).
-else.
write_console(_L1, _String, _Cnt, _IsShowStdio) -> ok.
-endif.

write_console_log(true, Level, String) ->
    color_inout(Level, String);
write_console_log(_, _, _) -> skip.


%%
need_write_stdio_log(fasle, _Cnt) ->
    fasle;
need_write_stdio_log(true, _Cnt) ->
    fastlog:get_env(?DISCARD_STDIO_KEY, ?DISCARD_FORBID) =:= ?DISCARD_FORBID.

need_write_log(Cnt) ->
    Flag = fastlog:get_env(?DISCARD_KEY, ?DISCARD_FORBID),
    case (Cnt rem ?CHECK_FLAG_TIMES) == 0 orelse Flag =:= ?DISCARD_PASSIVE of
        true -> can_write_log_now(Flag);
        _ -> Flag =:= ?DISCARD_FORBID
    end.


can_write_log_now(?DISCARD_ACTIVE) ->
    false;
can_write_log_now(?DISCARD_PASSIVE) ->
    case msg_queue_overload(1) of
        true -> skip;
        _Any -> fastlog:continue()
    end,
    false;
can_write_log_now(?DISCARD_FORBID) ->
    MaxLimit = fastlog:get_env(overload_message_queue_len, ?MAX_OVERLOAD_MSG),
    case msg_queue_overload(MaxLimit) of
        true -> passive_pause();
        _Any -> skip
    end,
    true.

msg_queue_overload(MaxLimit) ->
    case catch erlang:process_info(whereis(?MODULE), message_queue_len) of
        {message_queue_len, MsgQ} ->
            MsgQ > MaxLimit;
        _ -> false
    end.

make_file_(Fname) ->
    Dir = fastlog:get_env(logdir, ?LOGDIR),
    make_file_(Dir, Fname, "").

make_err_file_(Fname) ->
    Dir = fastlog:get_env(logdir, ?LOGDIR),
    make_file_(Dir, Fname, ".Err").

make_file_(Dir, Fname, Suffix) ->
    TimeNow = time_format(erlang:localtime()),
    File = Dir ++ "/" ++ Fname ++ "." ++ TimeNow ++ Suffix ++ ".log",
    {ok, Fd} =
        case file:open(File, ?LogFileOptions) of
            {ok, _} = Res -> Res;
            {error, eexist} -> file:open(File, ?LogFileOpenOpt);
            Error -> io:format("*** create file ~s error ~p ~n", [File, Error]), Error
        end,
    file:write(Fd, <<16#EF, 16#BB, 16#BF>>),
    io:format("[~ts][info]create log file[~s] succ.~n", [time_format_str(erlang:localtime()), File]),
    Fd.

ensure_log_dir(MkNewDir, DefaultDir) ->
    case fastlog:get_env(logdir, undefined) of
        undefined ->
            NewDir = gen_log_dir(MkNewDir, DefaultDir),
            file:make_dir(NewDir),
            fastlog:set_env(logdir, NewDir);
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


color_inout(?LOG_LEVEL_FATAL, Msg) -> io:format(user, "~ts", [red(Msg)]);
color_inout(?LOG_LEVEL_ERROR, Msg) -> io:format(user, "~ts", [red(Msg)]);
color_inout(?LOG_LEVEL_WARNING, Msg) -> io:format(user, "~ts", [yellow(Msg)]); 
color_inout(?LOG_LEVEL_NOTICE, Msg) -> io:format(user, "~ts", [blue(Msg)]);
color_inout(?LOG_LEVEL_DEBUG, Msg) -> io:format(user, "~ts", [green(Msg)]);
color_inout(_, Msg) -> io:format(user, "~ts", [Msg]).


is_error_log(?LOG_LEVEL_DEBUG) -> false;
is_error_log(?LOG_LEVEL_INFO) -> false;
is_error_log(?LOG_LEVEL_NOTICE) -> false;
is_error_log(?LOG_LEVEL_WARNING) -> false;
is_error_log(_) -> true.

-define(BLACK, <<"30">>).
-define(RED, <<"31">>).
-define(GREEN, <<"32">>).
-define(YELLOW, <<"33">>).
-define(BLUE, <<"34">>).
-define(MAGENTA, <<"35">>).
-define(CYAN, <<"36">>).
-define(WHITE, <<"37">>).
-define(DEFAULT, <<"39">>).

-define(ESC, <<"\e[">>).
-define(RST, <<"0">>).
-define(END, <<"m">>).

reset() -> <<?ESC/binary, ?RST/binary, ?END/binary>>.
color(Color) -> <<?ESC/binary, Color/binary, ?END/binary>>.

red(Text)        -> [color(?RED),        Text, reset()].
yellow(Text)     -> [color(?YELLOW),     Text, reset()].
blue(Text)       -> [color(?BLUE),       Text, reset()].
green(Text)      -> [color(?GREEN),      Text, reset()].