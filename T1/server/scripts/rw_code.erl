%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 六月 2018 14:12
%%%-------------------------------------------------------------------
-module(rw_code).
-author("mawenhong").

-include("../app/game/include/rec_rw.hrl").

-define(LogFileOptions, [exclusive, append, raw, binary]).
%% API
-export([run/0]).

-define(HEADER_SEC,
    "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!\n"
    "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!\n"
    "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!\n"
).

-define(SPLIT_LINE, "%%-------------------------------------------------------------------\n").
%% @doc
%%  multi_to_code 最后一个参数为什么是个list
%%  因为可能会有多个record导出的接口在一个module里
%%  列表头是包含的头文件列表，所剩下就是record导出代码的配置
%%  [
%%   {record name, record field list, 函数名增加的后缀, 函数参数列表,  字段被更新时调用的接口}, ...
%%  ]
%% eg. {m_map_obj_rw, record_info(fields, m_map_obj_rw), none, ["Uid"], "hook_map:on_rw_update"}
%% ---> lib_map_obj_rw:set_pid(Uid, Pid)/ get_pid(Uid)
%%
%% eg. {m_map_obj_rw, record_info(fields, m_map_obj_rw), map_obj, ["Uid"], "hook_map:on_rw_update"}
%% ---> lib_map_obj_rw:set_map_obj_pid(Uid, Pid)/ get_map_obj_pid(Uid)
%%
%%
-export([run_halt/1]).
run_halt([run_from_scripts_ket]) ->
    run(),
    halt().

run() ->
    generate_code(),
    ok.


generate_code() ->
    try
        multi_to_code
        (
            "..\\app\\game\\src\\pub\\player\\player_rw.erl",
            player_rw,
            [
                ["logger.hrl", "pub_def.hrl", "player_status.hrl", "rec_rw.hrl"],
                [
                    {m_player_rw, record_info(fields, m_player_rw), [], [], "hook_player:on_rw_update"}
                ]
            ]
        ),
%%        multi_to_code
%%        (
%%            "..\\app\\game\\src\\pub\\map\\obj\\object_rw.erl",
%%            object_rw,
%%            [
%%                ["logger.hrl", "pub_def.hrl", "rec_rw.hrl", "map_core.hrl"],
%%                [
%%                    {m_object_rw, record_info(fields, m_object_rw), [], ["Uid"], "hook_map:on_rw_update"}
%%                ]
%%            ]
%%        ),
%%
        object_rw
        (
            "..\\app\\game\\src\\pub\\map\\obj\\object_rw.erl",
            record_info(fields, m_object_rw)
        ),
        ok
    catch _:Err:ST ->
        color:error_log("~p,~p~n", [Err, ST])
    end,
    ok.





multi_to_code(Fname, ModName, [IncFiles, Cfgs]) ->
    file:write_file(Fname, ""),
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    write_file(Fname, "~ts", [?HEADER_SEC]),
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    
    write_file(Fname, "-module(~p).~n", [ModName]),
    write_file(Fname, "-author(~p).~n~n", ["Hello World"]),
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    
    inc_files(Fname, IncFiles),
    write_file(Fname, "~ts~n", [?SPLIT_LINE]),
    
    lists:foreach(
        fun({Record, FieldList, SuffixOriginalList, ExParams, HookUpdate}) ->
            ExParamN = erlang:length(ExParams),
            SuffixList = [to_list(X) || X <- SuffixOriginalList],
            write_file(Fname, "-export([\n\t"),
            
            lists:foreach(
                fun(Field) ->
                    field_fun_export(Fname, Record, Field, SuffixList, ExParamN, ExParamN + 1, HookUpdate)
                end, FieldList),
            
            write_file(Fname, "% common function \n\t"),
            common_fun_export(
                Fname,
                [
                    {del, ExParamN},
                    {get, ExParamN},
                    {set, ExParamN + 1},
                    {set_fields, ExParamN + 1},
                    {set_fields_direct, ExParamN + 1},
                    {init, ExParamN},
                    {init, ExParamN + 1}
                ],
                SuffixList
            ),
            write_file(Fname, "\n]).\n"),
            write_file(Fname, "~ts", [?SPLIT_LINE]),
            ok
        end, Cfgs),
    
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    
    lists:foreach(
        fun({Record, FieldList, SuffixOriginalList, ExParams, HookUpdate}) ->
            SuffixList = [to_list(X) || X <- SuffixOriginalList],
            lists:foreach(
                fun(Field) ->
                    write_file(Fname, "~ts%% #~p.~p\n", [?SPLIT_LINE, Record, Field]),
                    field_fun(Fname, Record, Field, SuffixList, ExParams, HookUpdate)
                end, FieldList),
            
            write_file(Fname, "~ts", [?SPLIT_LINE]),
            del_fun(Fname, Record, SuffixList, del, ExParams),
            
            write_file(Fname, "~ts", [?SPLIT_LINE]),
            to_record(Fname, Record, SuffixList, get, ExParams),
            
            write_file(Fname, "~ts", [?SPLIT_LINE]),
            set_fun(Fname, Record, SuffixList, set, ExParams),
            
            write_file(Fname, "~ts", [?SPLIT_LINE]),
            init_default_fun(Fname, Record, SuffixList, init, ExParams),
            
            %% Fd, Record,  Suffix, FuncAtom, FieldList,ExParam, HookUpdate
            write_file(Fname, "~ts", [?SPLIT_LINE]),
            set_fields(Fname, Record, SuffixList, set_fields_direct, FieldList, ExParams, [], true),
            set_fields(Fname, Record, SuffixList, set_fields, FieldList, ExParams, HookUpdate, false),
            
            
            %%
            write_file(Fname, "~ts", [?SPLIT_LINE]),
            ok
        end, Cfgs),
    
    
    file:close(Fname),
    color:info_log("write ~s ok!", [Fname]),
    ok.

inc_files(Fd, Incs) ->
    lists:foreach(
        fun(Inc) ->
            write_file(Fd, "-include(\"~ts\").\n", [Inc])
        end, Incs),
    ok.
%%-----------------------------------------------------------------------

%%-----------------------------------------------------------------------
field_fun_export(Fd, Record, Field, SuffixList, GetN, SetN, HookUpdate) ->
    S = field_set_get_signature(Record, Field, SuffixList, GetN, SetN, HookUpdate),
    write_file(Fd, "~ts", [S]),
    ok.


common_fun_export(Fd, CommonFunList, Suffix) ->
    X = erlang:length(CommonFunList),
    lists:foldl(
        fun({F, N}, Cur) ->
            S =
                lists:concat([string:join([to_list(F)] ++ Suffix, "_"), "/", N]),
            case Cur of
                1 -> write_file(Fd, "~ts", [S]);
                _ -> write_file(Fd, "~ts,", [S])
            end,
            Cur - 1
        end, X, CommonFunList),
    
    ok.


field_set_get_signature(Record, Field, SuffixList, GetN, SetN, HookUpdate) ->
    GetFunctionName = field_fun_name("get", Field, SuffixList),
    GetFunctionDefName = string:join([GetFunctionName, "def"], "_"),
    SetFunctionName = field_fun_name("set", Field, SuffixList),
    SetFunctionDirectName = string:join([SetFunctionName, "direct"], "_"),
    case HookUpdate of
        [] ->
            io_lib:format
            (
                "~ts/~p,~ts/~p,~ts/~p, % #~p.~p\n\t",
                [
                    GetFunctionName, GetN, GetFunctionDefName, GetN + 1,
                    SetFunctionName, SetN,
                    Record, Field
                ]
            );
        _ ->
            io_lib:format
            (
                "~ts/~p,~ts/~p,~ts/~p,~ts/~p, % #~p.~p\n\t",
                [
                    GetFunctionName, GetN, GetFunctionDefName, GetN + 1,
                    SetFunctionName, SetN, SetFunctionDirectName, SetN,
                    Record, Field
                ]
            )
    end.


%%-----------------------------------------------------------------------
-define(if_else(Cond, True, False), case Cond of true -> True; _ -> False end).

dict_key(Record, ExParam) ->
    ParamsToList = string:join(ExParam, ","),
    case ExParam of
        [] -> to_list(Record);
        _ -> lists:concat(["{", ParamsToList, ",", Record, "}"])
    end.

field_fun(Fd, Record, Field, Suffix, ExParam, HookUpdate) ->
    DictKey = dict_key(Record, ExParam),
    GetFunctionName = field_fun_name("get", Field, Suffix),
    GetFunctionPara = string:join(ExParam, ","),
    
    GetFunctionDefName = string:join([GetFunctionName, "def"], "_"),
    GetFunctionDefPara = string:join(ExParam ++ ["Def"], ","),
    GetFunctionDefCall = string:join(ExParam ++ ["undefined"], ","),
    
    SetFunctionName = field_fun_name("set", Field, Suffix),
    SetFunctionPara = string:join(ExParam ++ ["V"], ","),
    SetFunctionDirectName = string:join([SetFunctionName, "direct"], "_"),

    HookUpdateCall = string:join(ExParam ++ ["#" ++ to_list(Record) ++ "." ++ to_list(Field), "V"], ","),
    
    GetFunctionBody = io_lib:format(
        "~ts(~ts)-> ~ts(~ts).\n\n",
        [GetFunctionName, GetFunctionPara, GetFunctionDefName, GetFunctionDefCall]
    ),
    
    
    GetFunctionDefBody = io_lib:format(
        "~ts(~ts)->\n\tcase erlang:get(~ts) of\n\tundefined -> Def; \n\tV -> V#~p.~p \n\tend.\n\n",
        [GetFunctionDefName, GetFunctionDefPara, DictKey, Record, Field]
    ),
    
    SetFunctionBody =
        case HookUpdate of
            [] ->
                io_lib:format(
                    "~ts(~ts)->\n\tR = erlang:get(~ts),\n\terlang:put(~ts, R#~p{~p = V}).\n\n",
                    [SetFunctionName, SetFunctionPara, DictKey, DictKey, Record, Field]
                );
            _ ->
                io_lib:format
                (
                    "~ts(~ts)->\n\tR = erlang:get(~ts),\n\terlang:put(~ts, R#~p{~p = V}),\n\t?TRY_CATCH(~ts(~ts)).\n\n",
                    [SetFunctionName, SetFunctionPara, DictKey, DictKey, Record, Field, HookUpdate, HookUpdateCall]
                )
        end,
    
    SetFunctionDirectBody =
        io_lib:format
        (
            "~ts(~ts)->\n\tR = erlang:get(~ts),\n\terlang:put(~ts, R#~p{~p = V}).\n\n",
            [SetFunctionDirectName, SetFunctionPara, DictKey, DictKey, Record, Field]
        ),
    
    
    write_file(Fd, GetFunctionBody),
    write_file(Fd, GetFunctionDefBody),
    
    write_file(Fd, SetFunctionBody),
    case HookUpdate of
        [] -> skip;
        _ -> write_file(Fd, SetFunctionDirectBody)
    end,
    ok.

field_fun_name(Name, Field, SuffixList) ->
    case SuffixList of
        [] -> string:join([Name, to_list(Field)], "_");
        _ ->
            string:join([Name, string:join(SuffixList, "_"), to_list(Field)], "_")
    end.

to_list(X) when is_list(X) ->
    X;
to_list(X) ->
    lists:concat([X]).

%%Fname, Record, SuffixList, set_fields, FieldList,  ExParams, HookUpdate
set_fields(File, Record, SuffixList, FuncAtom, FieldList, ExParam, HookUpdate, IsDirect) ->
    DickKey = dict_key(Record, ExParam),
    SetFieldFunctionName = string:join([to_list(FuncAtom)] ++ SuffixList, "_"),
    %%string:join(["set"] ++ SuffixList ++ ["fields"], "_"),
    
    UnUseParams = [lists:concat(["_", UnUsePara]) || UnUsePara <- ExParam],
    SetFieldFunctionPara_1 = string:join(UnUseParams ++ ["[]"], ","),
    SetFieldFunctionPara_2 = string:join(ExParam ++ ["FieldList"], ","),
    ISetFieldsFunctionName = i_set_fields_function_name(SuffixList),
    ISetFieldsFunctionPara = string:join(ExParam ++ ["R1, FieldList"], ","),
    SetFieldsFunctionBody = io_lib:format
    (
        "~ts(~ts) ->ok;\n"
        "~ts(~ts) ->\n\t"
        "R1 = erlang:get(~ts),\n\t"
        "R2 = ~s(~s, ~p),\n\t"
        "erlang:put(~s, R2),\n\t"
        "ok.\n\n",
        [
            SetFieldFunctionName, SetFieldFunctionPara_1,
            SetFieldFunctionName, SetFieldFunctionPara_2,
            DickKey,
            ISetFieldsFunctionName, ISetFieldsFunctionPara,  IsDirect,
            DickKey
        ]
    ),
    write_file(File, SetFieldsFunctionBody),
    write_file(File, "~ts", [?SPLIT_LINE]),
    case IsDirect of
        false -> i_set_fields(File, Record, SuffixList, FuncAtom, FieldList, ExParam, HookUpdate);
        _Any -> skip
    end,

    ok.

i_set_fields(File, Record, SuffixList, _FuncAtom, FieldList, ExParam, HookUpdate) ->
    SetFieldsFunctionName = i_set_fields_function_name(SuffixList),
    UnUseParams = [lists:concat(["_", UnUsePara]) || UnUsePara <- ExParam],
    SetFieldsFunctionPara_1 = string:join(UnUseParams ++ ["R, []"], ","),
    SetFieldsFunctionPara_2 = string:join(ExParam ++ ["R, [H | FieldList]"], ","),
    ISetFieldFunctionPara = string:join(ExParam ++ ["H, R"], ","),
    ISetFieldFunctionName = i_set_field_function_name(SuffixList),
    UnUseExParamList = string:join([lists:concat(["_", Param, ","]) || Param <- ExParam], ""),
    ExParamList = string:join([lists:concat([Param, ","]) || Param <- ExParam], ""),
    
    SetFieldFunctionBody = io_lib:format
    (
        "~ts(~ts, _) ->\n\tR;\n"
        "~ts(~ts, IsDirect) ->\n\t~ts(~s~s(~s, IsDirect), FieldList, IsDirect).\n\n",
        [
            SetFieldsFunctionName, SetFieldsFunctionPara_1,
            SetFieldsFunctionName, SetFieldsFunctionPara_2,
            SetFieldsFunctionName, ExParamList, ISetFieldFunctionName, ISetFieldFunctionPara
        ]
    ),
    write_file(File, SetFieldFunctionBody),
    lists:foreach(
        fun(Field) ->
            case HookUpdate of
                [] -> i_set_field(File, Record, Field, SuffixList, UnUseParams, HookUpdate);
                _ ->  i_set_field(File, Record, Field, SuffixList, ExParam, HookUpdate)
            end
        end, FieldList),
    
    
    write_file
    (
        File,
        io_lib:format("~s(~s_Elem,R, _)-> R.\n\n", [i_set_field_function_name(SuffixList), UnUseExParamList])
    ),
    ok.
i_set_fields_function_name(SuffixList) ->
    string:join(["i_set"] ++ SuffixList ++ ["fields"], "_").

i_set_field_function_name(SuffixList) ->
    string:join(["i_set"] ++ SuffixList ++ ["field"], "_").

i_set_field(File, Record, Field, SuffixList, ExParam, HookUpdate) ->
    ISetFunctionName = i_set_field_function_name(SuffixList),
    RecordFieldIdx = lists:concat(["#", Record, ".", Field]),
%%    RecordFieldVal = lists:concat(["R#", Record, ".", Field]),
    HookUpdateCall = string:join(ExParam ++ ["#" ++ to_list(Record) ++ "." ++ to_list(Field), "Val"], ","),
    ExParamList = string:join([lists:concat([Param, ","]) || Param <- ExParam], ""),
    IFieldSetFunctionBody =
        case HookUpdate of
            [] ->
                io_lib:format(
                    "%%#~p.~p\n"
%%                    "~s(~s{~p, Val}, R) ->\n\tR#~p{~p = Val};\n"
%%                    "~s(~s{~p, Val, add}, R) ->\n\tR#~p{~p = ~s + Val};\n"
%%                    "~s(~s{~p, Val, sub}, R) ->\n\tR#~p{~p = ~s - Val};\n"
                    "~s(~s{~s, Val}, R, IsDirect) ->\n\tR#~p{~p = Val};\n"
%%                    "~s(~s{~s, Val, add}, R) ->\n\tR#~p{~p = ~s + Val};\n"
%%                    "~s(~s{~s, Val, sub}, R) ->\n\tR#~p{~p = ~s - Val};\n"
                    ,
                    
                    [
                        Record, Field,
%%                        ISetFunctionName, ExParamList, Field, Record, Field,
%%                        ISetFunctionName, ExParamList, Field, Record, Field, RecordFieldVal,
%%                        ISetFunctionName, ExParamList, Field, Record, Field, RecordFieldVal,
                        ISetFunctionName, ExParamList, RecordFieldIdx, Record, Field
%%                        ISetFunctionName, ExParamList, RecordFieldIdx, Record, Field, RecordFieldVal,
%%                        ISetFunctionName, ExParamList, RecordFieldIdx, Record, Field, RecordFieldVal
                    ]
                );
            _ ->
                io_lib:format(
                    "%%#~p.~p\n"
%%                    "~s(~s{~p, Val}, R) ->\n\tR1 = R#~p{~p = Val},\n\t?TRY_CATCH(~ts(~ts)),\n\tR1;\n"
%%                    "~s(~s{~p, Val, add}, R) ->\n\tR1 = R#~p{~p = ~s + Val},\n\t?TRY_CATCH(~ts(~ts)),\n\tR1;\n"
%%                    "~s(~s{~p, Val, sub}, R) ->\n\tR1 = R#~p{~p = ~s - Val},\n\t?TRY_CATCH(~ts(~ts)),\n\tR1;\n"
                    "~s(~s{~s, Val}, R, IsDirect) ->\n\tR1 = R#~p{~p = Val},\n\tcase IsDirect of \n\t\ttrue -> ?TRY_CATCH(~ts(~ts));\n\t\t _ -> skip \n\tend,\n\tR1;\n"
%%                    "~s(~s{~s, Val, add}, R) ->\n\tR1 = R#~p{~p = ~s + Val},\n\t?TRY_CATCH(~ts(~ts)),\n\tR1;\n"
%%                    "~s(~s{~s, Val, sub}, R) ->\n\tR1 = R#~p{~p = ~s - Val},\n\t?TRY_CATCH(~ts(~ts)),\n\tR1;\n"
                    ,
                    
                    [
                        Record, Field,
%%                        ISetFunctionName, ExParamList, Field, Record, Field, HookUpdate, HookUpdateCall,
%%                        ISetFunctionName, ExParamList, Field, Record, Field, RecordFieldVal, HookUpdate, HookUpdateCall,
%%                        ISetFunctionName, ExParamList, Field, Record, Field, RecordFieldVal, HookUpdate, HookUpdateCall,
                        ISetFunctionName, ExParamList, RecordFieldIdx, Record, Field, HookUpdate, HookUpdateCall
%%                        ISetFunctionName, ExParamList, RecordFieldIdx, Record, Field, RecordFieldVal, HookUpdate, HookUpdateCall,
%%                        ISetFunctionName, ExParamList, RecordFieldIdx, Record, Field, RecordFieldVal, HookUpdate, HookUpdateCall
                    ]
                )
        end,
    write_file(File, IFieldSetFunctionBody),
    ok.

del_fun(File, Record, Suffix, FuncAtom, ExParam) ->
    ParamsList = string:join(ExParam, ","),
    DictKey = dict_key(Record, ExParam),
    DelFunctionName = string:join([to_list(FuncAtom)] ++ Suffix, "_"),
    DelFunctionBody = io_lib:format
    (
        "~ts(~ts)-> erlang:erase(~ts).\n\n", [DelFunctionName, ParamsList, DictKey]
    ),
    write_file(File, DelFunctionBody),
    ok.



to_record(File, Record, Suffix, FuncAtom, ExParam) ->
    ParamsList = string:join(ExParam, ","),
    DictKey = dict_key(Record, ExParam),
    ToFunctionName = string:join([to_list(FuncAtom)] ++ Suffix, "_"),
    ToFunctionBody = io_lib:format
    (
        "~ts(~ts)-> erlang:get(~ts).\n\n", [ToFunctionName, ParamsList, DictKey]
    ),
    write_file(File, ToFunctionBody),
    ok.


set_fun(File, Record, Suffix, FuncAtom, ExParam) ->
    Match = lists:concat(["#", Record, "{}=V"]),
    ParamsList = string:join(ExParam ++ [Match], ","),
    DictKey = dict_key(Record, ExParam),
    InitFromFunctionName = string:join([to_list(FuncAtom)] ++ Suffix, "_"),
    InitFromFunctionBody = io_lib:format
    (
        "~ts(~ts)->\n\terlang:put(~ts, V).\n\n", [InitFromFunctionName, ParamsList, DictKey]
    ),
    write_file(File, InitFromFunctionBody),
    ok.

init_default_fun(File, Record, Suffix, FuncAtom, ExParam) ->
    ParamsList = string:join(ExParam, ","),
    
    Match = lists:concat(["#", Record, "{}=V"]),
    ParamsList2 = string:join(ExParam ++ [Match], ","),
    DictKey = dict_key(Record, ExParam),
    ToFunctionName = string:join([to_list(FuncAtom)] ++ Suffix, "_"),
    ToFunctionBody1 = io_lib:format
    (
        "~ts(~ts)-> erlang:put(~ts, #~p{}).\n", [ToFunctionName, ParamsList, DictKey, Record]
    ),
    
    ToFunctionBody2 = io_lib:format
    (
        "~ts(~ts) -> erlang:put(~ts, V).\n\n", [ToFunctionName, ParamsList2, DictKey]
    ),
    write_file(File, ToFunctionBody1),
    write_file(File, ToFunctionBody2),
    ok.


%%-------------------------------------------------------------------
write_file(Fd, Fmt) ->
    file:write_file(Fd, Fmt, [append]).
%%-------------------------------------------------------------------
write_file(Fd, Fmt, Args) ->
    file:write_file(Fd, io_lib:format(Fmt, Args), [append]).


object_rw(Fname, FieldList) ->
    file:write_file(Fname, ""),
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    write_file(Fname, "~ts", [?HEADER_SEC]),
    write_file(Fname, "~ts", [?SPLIT_LINE]),

    write_file(Fname, "-module(~p).~n", [object_rw]),
    write_file(Fname, "-author(~p).~n~n", ["Hello World"]),
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    write_file(Fname, "~ts~n",
    ["-include(\"logger.hrl\").\n"
    "-include(\"pub_def.hrl\").\n"
    "-include(\"rec_rw.hrl\").\n"
    "-include(\"map_core.hrl\").\n"]),

    write_file(Fname, "~ts", [?SPLIT_LINE]),

    write_file(Fname, "~ts~n", ["-export(["]),  
    export_field(Fname, FieldList),
    write_file(Fname, "\tinit/1, del/1, exists/1, get/1, set_fields/2, set_fields_direct/2 \n"),
    write_file(Fname, "])."),
    write_file(Fname, "~n~ts", [?SPLIT_LINE]),
    write_file(Fname, "~n~ts", [?SPLIT_LINE]),
    common_body(Fname),
    field_body(Fname, FieldList),
    color:info_log("write ~s ok!", [Fname]),
    ok.

export_field(Fname, []) ->
    write_file(Fname, "~ts", [?SPLIT_LINE]);
export_field(Fname, [Field | FieldList]) ->
    write_file(Fname, "\t set_~p/2, set_~p_direct/2, get_~p/1, get_~p_def/2, %#m_object_rw.~p ~n",
        [Field, Field,Field, Field, Field]),
    export_field(Fname, FieldList).

common_body(Fname) ->
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    write_file(Fname, "~ts", [
"init(Uid)when is_number(Uid)-> init(#m_object_rw{uid = Uid});
init(#m_object_rw{}=V) -> misc_ets:write(i_ets(), V).
%%
del(Uid) -> misc_ets:delete(i_ets(), Uid).
%%
exists(Uid) -> misc_ets:member(i_ets(), Uid).
get(Uid) ->
    case misc_ets:read(i_ets(), Uid) of
        []  -> undefined;
        [R] -> R
    end.
"
    ]),
    write_file(Fname, "~ts", [?SPLIT_LINE]),



    write_file(Fname, "~ts",
    [
"
set_fields(_Uid,[]) -> ok;
set_fields(Uid,FieldList) ->
    misc_ets:update_element(
        i_ets(), Uid, FieldList),
    i_set_fields(Uid,FieldList),
    ok.
set_fields_direct(_Uid,[]) -> ok;
set_fields_direct(Uid,FieldList) ->
    misc_ets:update_element(
        i_ets(), Uid, FieldList),
    ok.
"
    ]),

    write_file(Fname, "~ts", [?SPLIT_LINE]),
    write_file(Fname,"~ts",
        [
"i_ets() -> map_rw:detail_ets().

i_set_fields(_Uid,[]) ->
    ok;
i_set_fields(Uid,[{Pos, Val} | FieldList]) ->
    ?TRY_CATCH(hook_map:on_rw_update(Uid, Pos, Val)),
    i_set_fields(Uid, FieldList).
"
        ]),
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    ok.

field_body(Fname, []) ->
    write_file(Fname, "~ts", [?SPLIT_LINE]);
field_body(Fname, [Field | FieldList]) ->
    write_file(Fname,
"%% #m_object_rw.~p
get_~p(Uid) ->
    misc_ets:read_element(i_ets(), Uid, #m_object_rw.~p).

get_~p_def(Uid, Def) ->
    case misc_ets:read_element(i_ets(), Uid, #m_object_rw.~p, undefined) of
        undefined -> Def;
        Any -> Any
    end.
    
set_~p(Uid, Val)->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.~p, Val}),
    ?TRY_CATCH(hook_map:on_rw_update(Uid, #m_object_rw.~p, Val)).
set_~p_direct(Uid, Val) ->
    misc_ets:update_element(i_ets(), Uid, {#m_object_rw.~p, Val}),
    ok.
", [Field, Field, Field, Field, Field, Field, Field, Field, Field, Field]),
    write_file(Fname, "~ts", [?SPLIT_LINE]),
    field_body(Fname, FieldList).






