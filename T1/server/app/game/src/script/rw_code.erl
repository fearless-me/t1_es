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
-include("map_unit_cache.hrl").
-include("db_record.hrl").
-include("rec_rw.hrl").
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
run_halt([run_from_scripts_ket])->
    run(),
    halt().

run() ->
    try
        multi_to_code(
            "..\\src\\pub\\map\\unit_rw.erl",
            unit_rw,
            [
                ["logger.hrl", "rec_rw.hrl"],
                [
                    {m_map_unit_rw, record_info(fields, m_map_unit_rw), none, ["Uid"], "hook_map:on_rw_update"}
                ]
            ]
        ),
        multi_to_code(
            "..\\src\\pub\\map\\combat_rw.erl",
            combat_rw,
            [
                ["logger.hrl", "rec_rw.hrl"],
                [
                    {m_combat_rw, record_info(fields, m_combat_rw), none, ["Uid"], ""}
                ]
            ]
        ),
        multi_to_code(
            "..\\src\\pub\\map\\move_rw.erl",
            move_rw,
            [
                ["logger.hrl", "rec_rw.hrl"],
                [
                    {m_map_unit_move_rw, record_info(fields, m_map_unit_move_rw), none, ["Uid"], "hook_map:on_rw_update"}
                ]
            ]
        ),
        multi_to_code(
            "..\\src\\pub\\map\\ai_rw.erl",
            ai_rw,
            [
                ["logger.hrl", "ai.hrl", "rec_rw.hrl"],
                [
                    {m_map_unit_ai_rw, record_info(fields, m_map_unit_ai_rw), none, ["Uid"], ""}
                ]
            ]
        ),
        multi_to_code(
            "..\\src\\pub\\player\\player_rw.erl",
            player_rw,
            [
                ["logger.hrl", "player_status.hrl", "rec_rw.hrl"],
                [
                    {m_player_rw, record_info(fields, m_player_rw), none, [], "hook_player:on_rw_update"}
                ]
            ]
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

    write_file(Fname, "-module(~p).~n~n", [ModName]),
    write_file(Fname, "~ts", [?SPLIT_LINE]),

    inc_files(Fname, IncFiles),
    write_file(Fname, "~ts~n", [?SPLIT_LINE]),

    lists:foreach(
        fun({Record, FieldList, Suffix, ExParams, HookUpdate}) ->
            ExParamN = erlang:length(ExParams),
            write_file(Fname, "-export([\n\t"),
            lists:foreach(
                fun(Field) ->
                    field_fun_export(Fname, Record, Field, Suffix, ExParamN, ExParamN + 1, HookUpdate)
                end, FieldList),

            write_file(Fname, "% common function \n\t"),
            field_fun_export_del(Fname, del, Suffix, ExParamN),
            field_fun_export_to(Fname, to, Suffix, ExParamN),
            field_fun_export_init_from(Fname, init_from, Suffix, ExParamN + 1),
            field_fun_export_init_from(Fname, init_default, Suffix, ExParamN),
            write_file(Fname, "\n]).\n"),
            write_file(Fname, "~ts", [?SPLIT_LINE]),
            ok
        end, Cfgs),

    write_file(Fname, "~ts", [?SPLIT_LINE]),

    lists:foreach(
        fun({Record, FieldList, Suffix, ExParams, HookUpdate}) ->
            ExParamS = string:join(ExParams, ","),
            lists:foreach(
                fun(Field) ->
                    write_file(Fname, "~ts%% #~p.~p\n", [?SPLIT_LINE, Record, Field]),
                    field_fun(Fname, Field, Suffix, ExParamS, HookUpdate)
                end, FieldList),

            write_file(Fname, "~ts", [?SPLIT_LINE]),
            del_fun(Fname, Suffix, del, FieldList, ExParamS),

            write_file(Fname, "~ts", [?SPLIT_LINE]),
            to_record(Fname, Suffix, to, Record, FieldList, ExParamS),

            write_file(Fname, "~ts", [?SPLIT_LINE]),
            init_from_fun(Fname, Suffix, init_from, Record, FieldList, ExParamS, HookUpdate),

            write_file(Fname, "~ts", [?SPLIT_LINE]),
            init_default_fun(Fname, Suffix, init_default, Record, FieldList, ExParamS, HookUpdate),


            write_file(Fname, "~ts", [?SPLIT_LINE]),
            ok
        end, Cfgs),


    file:close(Fname),
    color:info_log("write ~s ok!",[Fname]),
    ok.

inc_files(Fd, Incs) ->
    lists:foreach(
        fun(Inc) ->
            write_file(Fd, "-include(\"~ts\").\n", [Inc])
        end, Incs),
    ok.
%%-----------------------------------------------------------------------

%%-----------------------------------------------------------------------
field_fun_export(Fd, Record, Field, Suffix, GetN, SetN, HookUpdate) ->
    S = field_set_get_signature(Record, Field, Suffix, GetN, SetN, HookUpdate),
    write_file(Fd, "~ts", [S]),
    ok.


field_fun_export_del(Fd, F, none, N) ->
    S = io_lib:format("~p/~p", [F, N]),
    write_file(Fd, "~ts", [S]),
    ok;
field_fun_export_del(Fd, F, Suffix, N) ->
    S = io_lib:format("~p_~p/~p", [F, Suffix, N]),
    write_file(Fd, "~ts", [S]),
    ok.

field_fun_export_to(Fd, F, none, N) ->
    S = io_lib:format(" ,~p_record/~p", [F, N]),
    write_file(Fd, "~ts", [S]),
    ok;
field_fun_export_to(Fd, F, Suffix, N) ->
    S = io_lib:format(" ,~p_~p_record/~p", [F, Suffix, N]),
    write_file(Fd, "~ts", [S]),
    ok.

field_fun_export_init_from(Fd, F, none, N) ->
    S = io_lib:format(" ,~p/~p", [F, N]),
    write_file(Fd, "~ts", [S]),
    ok;
field_fun_export_init_from(Fd, F, Suffix, N) ->
    S = io_lib:format(" ,~p_~p/~p", [F, Suffix, N]),
    write_file(Fd, "~ts", [S]),
    ok.

%%field_fun_export_init_default(Fd, F, none, N) ->
%%    S = io_lib:format("-export([~p/~p]).", [F, N]),
%%    write_file(Fd, "~ts~n", [S]),
%%    ok;
%%field_fun_export_init_default(Fd, F, Suffix, N) ->
%%    S = io_lib:format("-export([~p_~p/~p]).", [F, Suffix, N]),
%%    write_file(Fd, "~ts~n", [S]),
%%    ok.


field_set_get_signature(Record, Field, none, GetN, SetN, HookUpdate) ->
    case HookUpdate of
        [] ->
            io_lib:format("get_~p/~p, get_~p_def/~p, set_~p/~p, % #~p.~p\n\t",
                [Field, GetN, Field, GetN + 1, Field, SetN, Record, Field]);
        _ ->
            io_lib:format("get_~p/~p, get_~p_def/~p, set_~p/~p, set_~p_direct/~p, % #~p.~p\n\t",
                [Field, GetN, Field, GetN + 1, Field, SetN, Field, SetN, Record, Field])
    end;
field_set_get_signature(Record, Field, Suffix, GetN, SetN, HookUpdate) ->
    case HookUpdate of
        [] ->
            io_lib:format("get_~p_~p/~p, get_~p_~p_def/~p, set_~p_~p/~p, % #~p.~p\n\t",
                [Suffix, Field, GetN, Suffix, Field, GetN + 1, Suffix, Field, SetN, Record, Field]);
        _ ->
            io_lib:format("get_~p_~p/~p, get_~p_~p_def/~p, set_~p_~p/~p, set_~p_~p_direct/~p, % #~p.~p\n\t",
                [Suffix, Field, GetN, Suffix, Field, GetN + 1, Suffix, Field, SetN, Suffix, Field, SetN, Record, Field])
    end.



%%-----------------------------------------------------------------------

field_fun(Fd, Field, Suffix, [], HookUpdate) ->
    case Suffix of
        none ->
            write_file(Fd, "get_~p()-> get(~p).~n~n", [Field, Field]),
            write_file(Fd, "get_~p_def(Def)->\n\tcase get(~p) of\n\t\tundefined -> Def;\n\t\tV -> V\n\tend.~n~n", [Field, Field]),
            case HookUpdate of
                [] ->
                    write_file(Fd, "set_~p(V)-> put(~p, V).~n~n", [Field, Field]),
%%                    write_file(Fd, "set_~p_direct(V)-> put(~p, V).~n~n", [Field, Field]),
                    ok;
                _ ->
                    write_file(Fd, "set_~p(V)->\n\tput(~p, V),\n\t~ts(~p, V).~n~n", [Field, Field, HookUpdate, Field]),
                    write_file(Fd, "set_~p_direct(V)-> put(~p, V).~n~n", [Field, Field]),
                    ok
            end,
            ok;
        _ ->
            write_file(Fd, "get_~p_~p()-> get(~p).~n~n", [Suffix, Field, Field]),
            write_file(Fd, "get_~p_~p_def(Def)->\n\tcase get(~p) of\n\t undefined -> Def;\n\tV -> V\n\tend.~n~n", [Suffix, Field, Field]),

            case HookUpdate of
                [] ->
                    write_file(Fd, "set_~p_~p(V)-> put(~p, V).~n~n", [Suffix, Field, Field]),
%%                    write_file(Fd, "set_~p_~p_direct(V)-> put(~p, V).~n~n", [Suffix, Field, Field]),
                    ok;
                _ ->
                    write_file(Fd, "set_~p_~p(V)->\n\tput(~p, V),\n\t~ts(~p, V).~n~n", [Suffix, Field, Field, HookUpdate, Field]),
                    write_file(Fd, "set_~p_~p_direct(V)-> put(~p, V).~n~n", [Suffix, Field, Field]),
                    ok
            end,
            ok
    end,
    ok;
field_fun(Fd, Field, Suffix, ExParam, HookUpdate) ->
    case Suffix of
        none ->
            write_file(Fd, "get_~p(~ts)-> get({~p,~ts}).~n~n", [Field, ExParam, Field, ExParam]),
            write_file(Fd, "get_~p_def(~ts, Def)->\n\tcase get({~p,~ts}) of\n\t\tundefined -> Def;\n\t\tV -> V\n\tend.~n~n", [Field, ExParam, Field, ExParam]),
            case HookUpdate of
                [] ->
                    write_file(Fd, "set_~p(~ts, V)-> put({~p,~ts}, V).~n~n", [Field, ExParam, Field, ExParam]),
%%                    write_file(Fd, "set_~p_direct(~ts, V)-> put({~p,~ts}, V).~n~n", [Field, ExParam, Field, ExParam]),
                    ok;
                _ ->
                    write_file(Fd, "set_~p(~ts, V)->\n\tput({~p,~ts}, V),\n\t~ts(~ts, ~p, V).~n~n",
                        [Field, ExParam, Field, ExParam, HookUpdate, ExParam, Field]),
                    write_file(Fd, "set_~p_direct(~ts, V)-> put({~p,~ts}, V).~n~n",
                        [Field, ExParam, Field, ExParam]),
                    ok
            end,
            ok;
        _ ->
            write_file(Fd, "get_~p_~p(~ts)-> get({~p,~ts}).~n~n", [Suffix, Field, ExParam, Field, ExParam]),
            write_file(Fd, "get_~p_~p_def(~ts)->\n\tcase get({~p,~ts}) of\n\t\tundefined -> Def;\n\t\tV -> V\n\tend.~n~n", [Suffix, Field, ExParam, Field, ExParam]),
            case HookUpdate of
                [] ->
                    write_file(Fd, "set_~p_~p(~ts, V)-> put({~p,~ts}, V).~n~n", [Suffix, Field, ExParam, Field, ExParam]),
%%                    write_file(Fd, "set_~p_~p_direct(~ts, V)-> put({~p,~ts}, V).~n~n", [Suffix, Field, ExParam, Field, ExParam]),
                    ok;
                _ ->
                    write_file(Fd, "set_~p_~p(~ts, V)->\n\tput({~p,~ts}, V),\n\t~ts(~ts, ~p, V).~n~n",
                        [Suffix, Field, ExParam, Field, ExParam, HookUpdate, ExParam, Field]),
                    write_file(Fd, "set_~p_~p_direct(~ts, V)-> put({~p,~ts}, V).~n~n",
                        [Suffix, Field, ExParam, Field, ExParam]),
                    ok
            end,
            ok
    end,

    ok.

del_fun(Fd, Suffix, FuncName, FieldList, []) ->
    case Suffix of
        none -> write_file(Fd, "~p()->\n", [FuncName]);
        _ -> write_file(Fd, "~p_~p()->\n", [FuncName, Suffix])
    end,
    lists:foreach(
        fun(Field) ->
            write_file(Fd, "\terase(~p),\n", [Field])
        end, FieldList),
    write_file(Fd, "\tok.\n"),
    ok;
del_fun(Fd, Suffix, FuncName, FieldList, ExParam) ->
    case Suffix of
        none -> write_file(Fd, "~p(~ts)->\n", [FuncName, ExParam]);
        _ -> write_file(Fd, "~p_~p(~ts)->\n", [FuncName, Suffix, ExParam])
    end,
    lists:foreach(
        fun(Field) ->
            write_file(Fd, "\terase({~p, ~ts}),\n", [Field, ExParam])
        end, FieldList),
    write_file(Fd, "\tok.\n"),
    ok.



to_record(Fd, Suffix, FuncName, Record, FieldList, []) ->
    case Suffix of
        none -> write_file(Fd, "~p_record()->\n", [FuncName]);
        _ -> write_file(Fd, "~p_~p_record()->\n", [FuncName, Suffix])
    end,
    write_file(Fd, "\t#~p{\n", [Record]),

    Str0 = [
        io_lib:format("\t\t~p = get_~p()", [Field, Field]) || Field <- FieldList],
    Str1 = string:join(Str0, ",\n"),
    write_file(Fd, "~ts\n", [Str1]),
    write_file(Fd, "\t}.\n"),
    ok;
to_record(Fd, Suffix, FuncName, Record, FieldList, ExParam) ->
    case Suffix of
        none -> write_file(Fd, "~p_record(~ts)->\n", [FuncName, ExParam]);
        _ -> write_file(Fd, "~p_~p_record(~ts)->\n", [FuncName, Suffix, ExParam])
    end,
    write_file(Fd, "\t#~p{\n", [Record]),

    Str0 =
        case Suffix of
            none ->
                [io_lib:format("\t\t~p = get_~p(~ts)", [Field, Field, ExParam]) || Field <- FieldList];
            _ -> [io_lib:format("\t\t~p = get_~p_~p(~ts)", [Field, Suffix, Field, ExParam]) || Field <- FieldList]
        end,
    Str1 = string:join(Str0, ",\n"),
    write_file(Fd, "~ts\n", [Str1]),
    write_file(Fd, "\t}.\n"),
    ok.


init_from_fun(Fd, Suffix, FuncName, Record, FieldList, [], HookUpdate) ->
    case Suffix of
        none -> write_file(Fd, "~p(Rec)->\n", [FuncName]);
        _ -> write_file(Fd, "~p_~p(Rec)->\n", [FuncName, Suffix])
    end,
    lists:foreach(
        fun(Field) ->
            case Suffix of
                none ->
                    case HookUpdate of
                        [] ->
                            write_file(Fd, "\tset_~p(Rec#~p.~p),~n", [Field, Record, Field]);
                        _ ->
                            write_file(Fd, "\tset_~p_direct(Rec#~p.~p),~n", [Field, Record, Field])
                    end;
                _ ->
                    case HookUpdate of
                        [] ->
                            write_file(Fd, "\tset_~p_~p(Rec#~p.~p),~n", [Suffix, Field, Record, Field]);
                        _ ->
                            write_file(Fd, "\tset_~p_~p_direct(Rec#~p.~p),~n", [Suffix, Field, Record, Field])
                    end
            end
        end, FieldList),
    write_file(Fd, "\tok.\n"),
    ok;
init_from_fun(Fd, Suffix, FuncName, Record, FieldList, ExParam, HookUpdate) ->
    case Suffix of
        none -> write_file(Fd, "~p(~ts, Rec)->\n", [FuncName, ExParam]);
        _ -> write_file(Fd, "~p_~p(~ts, Rec)->\n", [FuncName, Suffix, ExParam])
    end,
    lists:foreach(
        fun(Field) ->
            case Suffix of
                none ->
                    case HookUpdate of
                        [] ->
                            write_file(Fd, "\tset_~p(~ts, Rec#~p.~p),~n", [Field, ExParam, Record, Field]);
                        _ ->
                            write_file(Fd, "\tset_~p_direct(~ts, Rec#~p.~p),~n", [Field, ExParam, Record, Field])
                    end;
                _ ->
                    case HookUpdate of
                        [] ->
                            write_file(Fd, "\tset_~p_~p(~ts, Rec#~p.~p),~n", [Suffix, Field, ExParam, Record, Field]);
                        _ ->
                            write_file(Fd, "\tset_~p_~p_direct(~ts, Rec#~p.~p),~n", [Suffix, Field, ExParam, Record, Field])
                    end
            end
        end, FieldList),
    write_file(Fd, "\tok.\n"),
    ok.

init_default_fun(Fd, Suffix, FuncName, Record, FieldList, [], HookUpdate) ->
    case Suffix of
        none -> write_file(Fd, "~p()->\n\tRec = #~p{},\n", [FuncName, Record]);
        _ -> write_file(Fd, "~p_~p()->\n\tRec = #~p{},\n", [FuncName, Suffix,Record])
    end,
    lists:foreach(
        fun(Field) ->
            case Suffix of
                none ->
                    case HookUpdate of
                        [] ->
                            write_file(Fd, "\tset_~p(Rec#~p.~p),~n", [Field, Record, Field]);
                        _ ->
                            write_file(Fd, "\tset_~p_direct(Rec#~p.~p),~n", [Field, Record, Field])
                    end;
                _ ->
                    case HookUpdate of
                        [] ->
                            write_file(Fd, "\tset_~p_~p(Rec#~p.~p),~n", [Suffix, Field, Record, Field]);
                        _ ->
                            write_file(Fd, "\tset_~p_~p_direct(Rec#~p.~p),~n", [Suffix, Field, Record, Field])
                    end
            end
        end, FieldList),
    write_file(Fd, "\tok.\n"),
    ok;
init_default_fun(Fd, Suffix, FuncName, Record, FieldList, ExParam, HookUpdate) ->
    case Suffix of
        none -> write_file(Fd, "~p(~ts)->\n\tRec = #~p{},\n", [FuncName, ExParam, Record]);
        _ -> write_file(Fd, "~p_~p(~ts)->\n\tRec = #~p{},\n", [FuncName, Suffix, ExParam, Record])
    end,
    lists:foreach(
        fun(Field) ->
            case Suffix of
                none ->
                    case HookUpdate of
                        [] ->
                            write_file(Fd, "\tset_~p(~ts, Rec#~p.~p),~n", [Field, ExParam, Record, Field]);
                        _ ->
                            write_file(Fd, "\tset_~p_direct(~ts, Rec#~p.~p),~n", [Field, ExParam, Record, Field])
                    end;
                _ ->
                    case HookUpdate of
                        [] ->
                            write_file(Fd, "\tset_~p_~p(~ts, Rec#~p.~p),~n", [Suffix, Field, ExParam, Record, Field]);
                        _ ->
                            write_file(Fd, "\tset_~p_~p_direct(~ts, Rec#~p.~p),~n", [Suffix, Field, ExParam, Record, Field])
                    end
            end
        end, FieldList),
    write_file(Fd, "\tok.\n"),
    ok.


%%-------------------------------------------------------------------
write_file(Fd, Fmt) ->
    file:write_file(Fd, Fmt, [append]).
%%-------------------------------------------------------------------
write_file(Fd, Fmt, Args) ->
    file:write_file(Fd, io_lib:format(Fmt, Args), [append]).