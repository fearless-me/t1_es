%%#!/usr/bin/env escript
-module(cc_fast).

-export([main/1]).

-define(IsOnlyCht, 1).
-define(CompileEts, compileEts).
-define(CompileFilesEts, compileFilesEts).
-define(CompileListDEts, compileServerFileListDEts).


-record(rec_serverfile, {
	fileName = "",
	changeTime = 0
}).


main(_) ->
	ets:new(?CompileEts, [public, named_table, {keypos, 1}]),
	ets:new(?CompileFilesEts, [public, named_table, {keypos, 1},{write_concurrency, true},{read_concurrency, true}]),
	dets:open_file(?CompileListDEts,
		[
			{keypos, #rec_serverfile.fileName},
			{type, set},
			{auto_save, 1000},
			{file, "compileListDEtsFile.data"}
		]),
	menu(),
	ok.

-ifdef(IsOnlyCht).
menu() ->
	dispatchInput(2).
-else.
menu() ->
	log(
		"~n##########################################################~n"
		"\t\tLUNA multi-language compile~n"
		"~n"
		"\t1.(chs) China~n"
		"\t2.(cht) Taiwan~n"
%%		"\t3.(enu) English~n"
%%		"\t4.(kor) Korea~n"
%%		"\t5.(xmt) Malaysia~n"
%%		"\t6.(tha) Thailand~n"
%%		"\t7.(rus) Russia~n"
%%		"\t8.(jpn) Japan~n"
%%		"\t9.(vietnam)  Vietnam~n"
		"~n"
		"\t[0  ].exit~n"
		"\t[888].package~n"
		"~n##########################################################~n~n"
	),
	%% 现在还没有多语言版本
	InputNoStr = io:get_line("Please enter your choice:"),
	{InputNo, _Rest} = string:to_integer(InputNoStr),
	dispatchInput(InputNo).
-endif.

dispatchInput(0) ->
	dets:close(?CompileListDEts),
	ok;
dispatchInput(1) -> menu2(chs);
dispatchInput(2) -> menu2(cht);
dispatchInput(3) -> menu2(enu);
dispatchInput(4) -> menu2(kor);
dispatchInput(5) -> menu2(xmt);
dispatchInput(6) -> menu2(tha);
dispatchInput(7) -> menu2(rus);
dispatchInput(8) -> menu2(jpn);
dispatchInput(9) -> menu2(vietnam);
dispatchInput(888) ->
	jump_package(),
	menu();
dispatchInput(_) -> menu().

menu2(Lang) ->
	log(
		"~n##########################################################~n"
		"\t\tselect compile sub order~n"
		"~n"
		"\t> 1.   gs(release)~n"
		"~n"
		"\t> 11.  gs(debug)~n"
%%		"~n"
%%		"\t> 2.   gs fast(release)~n"
		"\t> 12.  gs fast(debug)~n"
		"~n"
%%		"\t> 23.  Engineer(release)~n"
		"\t> 24.  Engineer(debug)~n"
		"~n"
		"\t> 0.   exit~n"
		"\t> 8.   clean~n"
		"\t> 9.   return main...~n"
		"\t> 888. package~n"
		"~n##########################################################~n~n"
	),
	set_title(Lang, unknown_type, unknown_mode),
	InputNoStr = io:get_line("Please enter your choice:"),
	{InputNo, _Rest} = string:to_integer(InputNoStr),
	dispatchInput2(Lang, InputNo).

dispatchInput2(Lang, 1) ->
	setCompileFastParam(undefined),
	compile(Lang, 1);
%%dispatchInput2(Lang, 2) ->
%%	Data = getChangeFileList(),
%%	setCompileFastParam(Data),
%%	timer:sleep(2000),
%%	compile(Lang, 2);
dispatchInput2(Lang, 11) ->
	setCompileFastParam(undefined),
	compile(Lang, 11);
dispatchInput2(Lang, 12) ->
	Data = getChangeFileList(),
	setCompileFastParam(Data),
	timer:sleep(2000),
	compile(Lang, 12);
dispatchInput2(_, 0) ->
	dets:close(?CompileListDEts),
	erlang:halt();
dispatchInput2(Lang, 888) ->
	jump_package(),
	menu2(Lang);
dispatchInput2(_Lang, 9) ->
	menu();
dispatchInput2(Lang, 8) ->
	dets:delete_all_objects(?CompileListDEts),
	os:cmd("cd ../ebin/ && del /q /s *.*"),
	warnLog("===> clean success!! <===~n~n"),
	menu2(Lang);
%%dispatchInput2(Lang, 23) ->
%%	setSearchFileData(undefined),
%%	searchFile(false, {Lang, 23}, scan_all_files());
dispatchInput2(Lang, 24) ->
	setSearchFileData(undefined),
	searchFile(false, {Lang, 24}, scan_all_files());
dispatchInput2(Lang, _) ->
	menu2(Lang).

searchFile(false, {Lang, _XH} = Param1, {_HrlFileList, ErlFileList, _Opts} = Param2) ->
	log("\t[0] ===> return to main menu~n", []),
	InputNoStr1 = io:get_line("Input search file key words:"),
	InputNoStr2 = string_strip(string_strip(InputNoStr1), "\n"),
	case InputNoStr2 of
		"0" ->
			setSearchFileData(undefined),
			menu2(Lang);
		_ ->
			F =
				fun(File, {IsEnough, {Number, AccL}} = Data) ->
					case Number >= 30 of
						true ->
							{true, {Number, AccL}};
						_ ->
							LowerFile = string:to_lower(File),
							LowerInput = string:to_lower(InputNoStr2),
							case string:str(LowerFile, LowerInput) > 0 of
								true ->
									{IsEnough, {Number + 1, [{Number + 1, File} | AccL]}};
								_ ->
									Data
							end
					end
				end,
			{_, {Num, List}} = foldlEx(F, {false, {0, []}}, ErlFileList),
			case Num > 0 of
				true ->
					FF =
						fun({N, File}) ->
							warnLog("[~p] ===> ~ts", [N, File])
						end,
					lists:foreach(FF, lists:reverse(List)),
					setSearchFileData(List),
					searchFile(true, Param1, Param2);
				_ ->
					warnLog("No search~n"),
					searchFile(false, Param1, Param2)
			end
	end;
	
searchFile(_, {Lang, _XH} = Param1, {_HrlFileList, _ErlFileList, Opts} = Param2) ->
	warnLog("[*] ===> compile all searched ~p file(s)", [safe_length(getSearchFileData())]),
	warnLog("[0] ===> return to main menu", []),
	
	InputNoStr1 = io:get_line("Input compile file index:"),
	InputNoStr2 = string_strip(string_strip(InputNoStr1), "\n"),
	case InputNoStr2 of
		"0" ->
			setSearchFileData(undefined),
			menu2(Lang);
		_ ->
			case InputNoStr2 of
				"*" ->
					compileSearchFile(0, Param1, Opts, getSearchFileData());
				_ ->
				case string:to_integer(InputNoStr2) of
					{Index, []} when erlang:is_integer(Index)->
						compileSearchFile(Index, Param1, Opts, getSearchFileData());
					_ ->
						skip
				end			
			end,
			searchFile(false, Param1, Param2)
	end.
	
safe_length(L) when is_list(L) ->
	length(L);
safe_length(_)->
	0.

compileSearchFile(_Index, _Param1, _Opts, undefined)->
	skip;
compileSearchFile(0, {Lang, XH}, Opts, List)->
	FileList = [File || {_, File} <- List],
	setCompileFastParam({true, FileList, Opts, []}),
	compile(Lang, XH);
compileSearchFile(Index, {Lang, XH}, Opts, List)->
	case lists:keyfind(Index, 1, List) of
		{_, File} ->
			setCompileFastParam({true, [File], Opts, []}),
			compile(Lang, XH);
		_ ->
			skip
	end.	


setSearchFileData(Data) ->
	put('SearchFileData', Data).
getSearchFileData() ->
	get('SearchFileData').

foldlEx(_, {true, _} = Accu, _) -> Accu;
foldlEx(F, Accu, [Hd|Tail]) ->
	foldlEx(F, F(Hd, Accu), Tail);
foldlEx(F, Accu, []) when is_function(F, 2) -> Accu.

getCompileServer(1) -> gs;
getCompileServer(2) -> gs;
getCompileServer(23) -> gs;
getCompileServer(11) -> gsD;
getCompileServer(24) -> gsD;
getCompileServer(_) -> gsD.

jump_package() ->
	os:cmd(" cd ../../scripts/ && start escript.exe cpk.ers pkg"),
	ok.

compile(Lang, 1) ->
	warnLog("now path:~p", [file:get_cwd()]),
	%% 先生成版本文件
    set_title(Lang, getCompileServer(1), allCompile),
	Ret=os:cmd("start /B escript.exe version.ers"),
	io:format("~ts~n",[Ret]),
	waitATime(5000),

	%% 用于Release编译打包
	Target = getCompileServer(1),
	FileName = io_lib:format("compile_~p_~p.txt", [Lang, Target]),
	file:write_file(FileName, ""),
	CmdStr = io_lib:format("cd ../ && make all Region=\"~p\" -j8 > scripts/~ts", [Lang, FileName]),

	warnLog("compile [~p,~p] start [~ts], please wait...~n", [Lang, Target, time_format()]),
	os:cmd(CmdStr),

	case checkCompileError(FileName) of
		0 ->
			log("@@@compile [~p,~p] success@@@ at ~ts ~n", [Lang, Target, time_format()]);
		_ ->
			errorLog("***compile [~p,~p] ERROR ERROR ERROR !!!*** ~ts ~n", [Lang, Target, time_format()])
	end,

	menu2(Lang);
compile(Lang, V) ->
	warnLog("now path:~p~n", [file:get_cwd()]),
	Target = getCompileServer(V),
	ets:delete_all_objects(?CompileEts),
	ets:insert(?CompileFilesEts,{1,0}),

	{Schedulers, LogFile, Opts, FileList} = make_cfg(Lang, Target, V), 
	{TaskNum, Ms} = make_worker(FileList, Schedulers, LogFile, Lang, Target, Opts),

	try
		loop_wait(TaskNum),

		compile_done(Ms, LogFile, Lang, Target)
	catch
		_:Why:St->
			errorLog("***compile [~p,~p] ERROR ERROR ERROR !!!*** ~ts ~p,~p ~n",
				[Lang, Target, time_format(), Why, St])
	end,

	menu2(Lang).

checkCompileError(FileName)->
	{ok,Binary} = file:read_file(FileName),
	Content = binary_to_list(Binary),
	case string:str(Content, "recipe for target") of
		0 ->
			string:str(Content, "failed");
		V ->
			V
	end.

waitATime(Time) ->
	receive
		tttttttttttttttcccccccccccccccc ->
			ok
	after Time ->
		ok
	end.

loop_wait(0) ->
	skip;
loop_wait(N) ->
	receive
		{'DOWN', _MRef, _process, _Pid, normal} ->
			ok;
		{'DOWN', MRef, process, Pid, Reason} ->
			warnLog("~p|~p finished ~p~n",[Pid, MRef, Reason]);
		{Pid, Result} ->
			log("~p finished ~p~n",[Pid,  Result])
	end,
	loop_wait(N - 1).

compile2(SrcFile, Opts, LogFile, FileNumbers) ->
	Ret = compile:file(SrcFile, [return, report_errors, error_summary, bin_opt_info | Opts]), %% report,
	{CompileResult, Str} = check_return(SrcFile, Ret),

	case CompileResult =/= error of
		true ->
			CurChangeTime = getFileChangeTime(SrcFile),
			dets:insert(?CompileListDEts, #rec_serverfile{fileName = SrcFile, changeTime = CurChangeTime});
		_ ->
			skip
	end,

	CompiledFileNumber = ets:update_counter(?CompileFilesEts, 1, {2, 1}),
	dLog(LogFile, "[~ts] compiled[~w%] ~s ~p ~ts",
		[time_format(), erlang:trunc(CompiledFileNumber/FileNumbers * 1000)/10, filename:basename(SrcFile), CompileResult =/= error,  Str], CompileResult),
	ok.

check_return(_SrcFile, {ok,_}) ->
	{ok, ""};
check_return(_SrcFile, {ok, _Mod, []}) ->
	{ok, ""};
check_return(_SrcFile, {ok, _Mod, Binary}) ->
	{warn, io_lib:format("~n~ts", [report_warnings(Binary)])};
check_return(_SrcFile, {ok, _Mod, _Binary, Warnings}) ->
	{warn, io_lib:format("~n~ts", [report_warnings(Warnings)])};
check_return(SrcFile, {error, Errors, Warnings}) ->
	Msg = report_errors(Errors),
	ets:insert(?CompileEts, {SrcFile, Msg}),
	{error, io_lib:format("~n~ts~n~ts", [Msg, report_warnings(Warnings)])};
check_return(SrcFile, error) ->
	ets:insert(?CompileEts, {SrcFile, "error"}),
	{error, "error"};
check_return(SrcFile, _Reason) ->
	ets:insert(?CompileEts, {SrcFile, "unknow reason"}),
	{error, "unknow reason"}.

check_compile_error(_FileName) ->
	ets:info(?CompileEts, size).

make_worker([], _Schedulers, _LogFile, _Lang, _Target, _Opts) ->
	{0, os:system_time(milli_seconds)};
make_worker(FileList, Schedulers, LogFile, Lang, Target, Opts) ->

	FileNumbers = erlang:length(FileList),
	Once = trunc(FileNumbers / Schedulers),

	L1 = ssplit_all(Once, FileList),
	TaskNum = length(L1),

	dLog(LogFile,
		"~n*********************************************************~n"
		"*********************************************************~n"
		"*  ~ts ~p ~p ~p files ~p workers\t*~n"
		"*********************************************************~n"
		"*********************************************************~n",
		[time_format(), Target, Lang, FileNumbers, TaskNum], ok),


	StartTime = os:system_time(milli_seconds),
	lists:foldl(
		fun(FLMe, Idx) ->
			erlang:spawn_monitor(
				fun() ->
					try
						Atom = list_to_atom("compile_" ++ integer_to_list(Idx)),
						true = erlang:register(Atom, self()),
						lists:foreach(
						fun(File) ->
						    case check_compile_error(LogFile) of
						        0 ->
						            compile2(File, Opts, LogFile, FileNumbers);
						        _ ->
						            skip
						    end
						end, FLMe)
					catch
						_ : _ ->
							skip
					end
				end),
			Idx + 1
		end, 1, L1),
	{TaskNum, StartTime}.

compile_done(StartTime, LogFile, Lang, Target) ->
	DiffMs = os:system_time(milli_seconds) - StartTime,
	Now = time_format(),

	dLog(LogFile, "~n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~n~n", ok),

	case check_compile_error(LogFile) of
		0 ->
			%% 如果执行单独编译一个文件，则不允许更新头文件
			case getSearchFileData() of
				undefined ->
					F =
						fun(File) ->
							CurChangeTime = getFileChangeTime(File),
							dets:insert(?CompileListDEts, #rec_serverfile{fileName = File, changeTime = CurChangeTime})
						end,
					case getCompileFastParam() of
						{_, _FileList, _Opts, HrlList} ->
							%% 快速编译成功，更新部分头文件
							lists:foreach(F, HrlList);
						_ ->
							%% 全部编译成功，更新头文件
							{HrlFileList, _ErlFileList, _Opts} = scan_all_files(),
							lists:foreach(F, HrlFileList)
					end;
				_ ->
					skip
			end,

			dLog(LogFile, "~n@@@compile [~p,~p] success@@@ at ~ts ~p seconds ~n",
				[Lang, Target, Now, DiffMs / 1000], ok);
		_ ->
			ets:foldl(
				fun({SrcFile, ErrMsg}, _) ->
					dLog(LogFile, "~ts~n~ts", [filename:basename(SrcFile), ErrMsg], error),
					ok
				end, 0, ?CompileEts),
			dLog(LogFile, "~n!!!! compile [~p,~p] ERROR ERROR ERROR !!!*** at ~ts  ~p seconds ~n",
				[Lang, Target, Now, DiffMs / 1000], error)
	end,

	dLog(LogFile, "~n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~n~n", ok),
	ok.

make_cfg(Lang, Target, _V) ->
	FileName = io_lib:format("compile_~p_~p.txt", [Lang, Target]),
	file:write_file(FileName, ""),

	{CompileType, FileList, Opts} = scan_files(getCompileFastParam()),
	Schedulers = erlang:min(schedulers(), erlang:length(FileList)),

	set_title(Lang, Target, CompileType),
	{Schedulers, FileName, make_opts(Opts, Lang, Target), FileList}.

scan_files({IsFast, FileList, Opts, _})->
	case IsFast of
		true ->
			{fastCompile, FileList, Opts};
		_ ->
			{allCompile, FileList, Opts}
	end;
scan_files(undefined)->
	{ok, Config} = file:consult("./mm.config"),
	[{ SrcList, Opts} | _] = Config,

	SrcFileList =
	    lists:foldl(
	    fun(SrcDir, AccList) ->
	         filelib:fold_files(SrcDir, ".erl$$", true, fun(File, Acc) -> [File | Acc] end, AccList)
	    end, [], SrcList),
	{allCompile, SrcFileList, Opts}.

scan_all_files()->
	{ok, Config} = file:consult("./mm.config"),
	[{ SrcList, Opts} | _] = Config,

	SrcFileList =
	    lists:foldl(
	    fun(SrcDir, AccList) ->
	         filelib:fold_files(SrcDir, ".erl$$", true, fun(File, Acc) -> [File | Acc] end, AccList)
	    end, [], SrcList),

    IncFileList =
        lists:foldl(
        fun(SrcDir, AccList) ->
             filelib:fold_files(SrcDir, ".hrl$$", true, fun(File, Acc) -> [File | Acc] end, AccList)
        end, [], SrcList),

	{IncFileList, SrcFileList, Opts}.

schedulers()->
	case catch erlang:system_info(schedulers_online) of
		{'EXIT', _} ->
			4;
		Cpu when Cpu > 1 ->
			Cpu - 1;
		Cpu ->
			Cpu
	end.

make_opts(Opts, Lang, gsD) ->
	[{d, 'Region', Lang}, debug_info | Opts];
make_opts(Opts, Lang, gs) ->
	[{d, 'Region', Lang},{d,'RELEASE'} | Opts].

set_title(Lang, Mode, CompileType) ->
	case os:type() of
		{win32, _} ->
			{_, Cwd} = file:get_cwd(),
			os:cmd(io_lib:format('title \"~p <<~p>> <<~p>> <<~p>>\"', [erlang:list_to_binary(Cwd), Lang, Mode,CompileType]));
		_ ->
			skip
	end.

time_format() -> time_format(erlang:timestamp()).

time_format(Now) ->
	{{Y, M, D}, {H, MM, S}} = calendar:now_to_local_time(Now),
	time_format1(Y, M, D, H, MM, S).
time_format1(Y, M, D, H, MM, S) ->
	lists:concat([Y, "-", one_to_two(M), "-", one_to_two(D), " ",
		one_to_two(H), ":", one_to_two(MM), ":", one_to_two(S)]).
one_to_two(One) -> io_lib:format("~2..0B", [One]).


ssplit_all(N, L) ->
	Len = length(L),
	do_ssplit(N, L, Len, []).

%%---
do_ssplit(_, [], _, Acc) ->
	Acc;
do_ssplit(N, L1, Len, Acc) ->
	{L2, L3} = do_ssplit1(N, L1, Len),
	do_ssplit(N, L3, Len - N, [L2 | Acc]).

%%---
do_ssplit1(N, L, Len) when N =< Len ->
	lists:split(N, L);
do_ssplit1(_N, L, _Len) ->
	{L, []}.

report_errors(Errors) ->
	Es =
		lists:foldl(
			fun({{F, _L}, Eds}, Acc) ->
				list_errors(F, Eds, Acc);
				({F, Eds}, Acc) ->
					list_errors(F, Eds, Acc)
			end, [], Errors),
	lists:flatten(lists:reverse(Es)).

report_warnings(Ws0) ->
	P = "Warning: ",
	Ws = lists:foldl(
		fun({{F, _L}, Eds}, Acc) ->
			format_message(F, P, Eds, Acc);
			({F, Eds}, Acc) ->
				format_message(F, P, Eds, Acc)
		end, [], Ws0),
%%	Ws = lists:sort(Ws1),

	lists:flatten(lists:reverse(Ws)).

format_message(F, P, [{none, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts: ~s~ts\n",
		[time_format(), filename:basename(F), P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{{Line, Column} = _Loc, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts:~w:~w ~s~ts\n",
		[time_format(),filename:basename(F), Line, Column, P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{Line, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts:~w: ~s~ts\n",
		[time_format(),filename:basename(F), Line, P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{Mod, E} | Es], Acc) ->
	%% Not documented and not expected to be used any more, but
	%% keep a while just in case.
	Msg = io_lib:format("[~ts] ~ts: ~s~ts\n",
		[time_format(),filename:basename(F), P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(_, _, [], Acc) -> Acc.

list_errors(F, [{none, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts: ~ts\n",
		[time_format(),filename:basename(F), Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{{Line, Column}, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts:~w:~w: ~ts\n",
		[time_format(),filename:basename(F), Line, Column, Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{Line, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts:~w: ~ts\n",
		[time_format(),filename:basename(F), Line, Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{Mod, E} | Es], Acc) ->
	%% Not documented and not expected to be used any more, but
	%% keep a while just in case.
	Msg = io_lib:format("[~ts] ~ts: ~ts\n",
		[time_format(),filename:basename(F), Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(_F, [], Acc) -> Acc.

getChangeFileList() ->
	{HrlFileList, ErlFileList, Opts} = scan_all_files(),
	warnLog("===> scan files number include[~p] scr[~p]", [erlang:length(HrlFileList), erlang:length(ErlFileList)]),
	HrlChangeList = saveFileChangeTime(HrlFileList),
	warnLog("===> hrl changs number:~p", [erlang:length(HrlChangeList)]),
	ErlChangeList = saveFileChangeTime(ErlFileList),
	warnLog("===> erl changs number:~p", [erlang:length(ErlChangeList)]),
	case HrlChangeList of
		[] ->
			warnLog("===> compile fast ...~n"),
			{true, ErlChangeList, Opts, []};
		_ ->
			warnLog("===> compile all ...~n"),
			{false, ErlFileList, Opts, HrlFileList}
	end.

saveFileChangeTime(List) ->
	F =
		fun(File, AccL) ->
			CurChangeTime = getFileChangeTime(File),
			case dets:lookup(?CompileListDEts, File) of
				[#rec_serverfile{changeTime = ChangeTime}] when CurChangeTime =:= ChangeTime ->
					AccL;
				_ ->
					[File | AccL]
			end
		end,
	lists:foldl(F, [], List).

%% 用MD5代替系统修改时间
getFileChangeTime(File) ->
	getFileMd5(File);
getFileChangeTime(File) ->
	case file:read_file_info(File, [{time, posix}]) of
		{ok, Info} ->
			erlang:element(5, Info);
		_ ->
			errorLog("===> read getFileChangeTime:~ts failed~n", [File]),
			throw(readfileerror)
	end.

getFileMd5(File) ->
	case file:read_file(File) of
		{ok, Data} ->
			erlang:md5(Data);
		_ ->
			errorLog("===> read getFileMd5:~ts failed~n", [File]),
			throw(readfilemd5error)
	end.

setCompileFastParam(Param) ->
	put('CompileFastParam', Param).
getCompileFastParam() ->
	get('CompileFastParam').

string_strip(Str)-> string:strip(Str).

string_strip(Str, [])-> 
	Str;
string_strip(Str, [CH | L])-> 
	string_strip(string:strip(Str, both, CH), L).
	
log(Fmt)-> log(Fmt, []).	
log(Fmt, Args)-> cpc:print(green,io_lib:format(Fmt,Args)).	

warnLog(Fmt)-> warnLog(Fmt, []).
warnLog(Fmt, Args) -> cpc:print(yellow, io_lib:format(Fmt,Args)).

errorLog(Fmt) -> errorLog(Fmt, []).
errorLog(Fmt, Args)-> cpc:print(red, io_lib:format(Fmt,Args)).


dLog(File, Fmt, Flag) ->
	dLog(File,Fmt, [], Flag).

dLog(File,Fmt, Args, Flag)->
	Str = io_lib:format(Fmt, Args),
	file:write_file(File, io_lib:format("~ts~n",[Str]), [append]),
	case Flag of
		error ->
		   errorLog(Str);
		warn ->
		   warnLog(Str);
		_ ->
			log(Str)
	end.