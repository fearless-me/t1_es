#!/usr/bin/env escript
%% coding: latin-1

%%包含头文件
%%ebin下包含app
%%emysql.app
%%localLog.app

%% ====================================================================
%% API functions
%% ====================================================================

-record(rec_db_table,
{
  'Name',        %%表名
  'Comment'        %%表注释
}).

-record(rec_db_table_field,
{
  'Field',        %%表的字段名
  'Type',            %%字段类型
  'Key',            %%是否是关键字
  'Default',        %%字段默认值
  'Extra',        %%额外信息
  'Comment'        %%字段注释
}).

-define(EXPORT_DEFAULT, 1).
-define(EXPORT_USERDEF, 2).

-define(EXPORT_FILE, "../app/common/include/db_record.hrl").
-define(HEADER_SEC,
  "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!\n"
  "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!\n"
  "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!\n"
).

-define(DEFINE_MACRO_S, "-ifndef(GS_DB_RECORD_HRL).\n-define(GS_DB_RECORD_HRL, true).\n").
-define(DEFINE_MACRO_E, "-endif.\n").

main(_) ->
  os:cmd("chcp 65001"),
  color:warn_log(
    "~n##########################################################~n"
    "~n** 导出代码需要依赖 mysql-otp"
    "~n** 所以务必确保已经生成 game 项目的代码~n"
    "~n** 生成数据库表结构 erlang代码~n"
    "~n** 默认使用: localhost root 1234 为数据库的访问地址、账号、密码~n"
    "~n** 默认导出: t1_data, t1_public, t1_account~n"
    "~n** 自定义导出为参数为 $Host $User $Password #Database1 ...#DatabaseN~n"
    "~n##########################################################~n"
  ),
  code:add_path("../app/game/ebin"),
  color:info_log(
    "~n##########################################################~n"
    "\t~-10.w默认导出~n"
    "\t~-10.w定义导出~n"
    "\t#~n"
    "\t~-10.w退出~n"
    "~n##########################################################~n",
    
    [?EXPORT_DEFAULT, ?EXPORT_USERDEF, 0]
  ),
  InputNoStr = io:get_line("Please enter your choice:"),
  [T | _] = string:tokens(string_strip(InputNoStr, "\n"), " "),
  {IT, _} = string:to_integer(T),
  dispatchInput2(IT),
  ok.

dispatchInput2(0) -> ok;
dispatchInput2(?EXPORT_DEFAULT) ->
  export_all_database(["localhost", "root", "1234", ["t1_data", "t1_account", "t1_public"]]),
  main([]);
dispatchInput2(?EXPORT_USERDEF) ->
  InputNoStr = io:get_line("$Host $User $Password #Database1 ... :"),
  case string:tokens(string_strip(InputNoStr, "\n"), " ") of
    [Host, User, Password, Databases] ->
      export_all_database([Host, User, Password, Databases]);
    _ ->
      color:error_log("输入的格式应该为: $Host $User $Password #Database1 ...#DatabaseN")
  end,
  main([]);
dispatchInput2(_) -> main([]).


export_all_database([Host, User, Password, Databases]) ->
  file:write_file(?EXPORT_FILE, ""),
  write_file(?EXPORT_FILE, "~ts", [?HEADER_SEC]),
  write_file(?EXPORT_FILE, ?DEFINE_MACRO_S),
  lists:foreach(
    fun(Database) ->
      export_database(Host, User, Password, Database)
    end, Databases),
  write_file(?EXPORT_FILE, ?DEFINE_MACRO_E),
  ok.

export_database(Host, User, Password, Database) ->
  {ok, Pid} = mysql:start_link([{host, Host}, {user, User}, {password, Password}, {database, Database}]),
  R3 = mysql:query(Pid, "SHOW TABLE STATUS FROM " ++ Database),
  Ret = db:as_record(R3, rec_db_table, record_info(fields, rec_db_table)),
  lists:foreach(fun(Rec) -> read_table_fields(Pid, Rec#rec_db_table.'Name') end, Ret),
  ok.

read_table_fields(Pid, Tab) ->
  Ret = mysql:query(Pid, "SHOW FULL COLUMNS FROM " ++ Tab),
  FieldList1 = db:as_record(Ret, rec_db_table_field, record_info(fields, rec_db_table_field)),
  FieldList2 = [FieldRecord || FieldRecord <- FieldList1, FieldRecord#rec_db_table_field.'Field' =/= <<"auto_id__">>],
%%  io:format("~n ~p~n", [FieldList2]),
  Str = format_fields(FieldList2, length(FieldList2), ""),
  write_file(?EXPORT_FILE, "%% ~s\n-record(p_~s,{\t~s\n}).\n", [binary_to_list(Tab), binary_to_list(Tab), Str]),
  ok.

format_fields([#rec_db_table_field{'Field' = Name, 'Type' = Type, 'Comment' = Comment}], 1, Acc) ->
  Acc ++ "\n\t" ++ binary_to_list(Name) ++ " %% " ++ binary_to_list(Comment) ++ " "  ++  binary_to_list(Type) ;
format_fields([#rec_db_table_field{'Field' = Name, 'Type' = Type, 'Comment' = Comment} | FieldList], X, Acc) ->
  format_fields(FieldList, X - 1, Acc ++ "\n\t" ++ binary_to_list(Name) ++ ", %% " ++ binary_to_list(Comment) ++ " "  ++  binary_to_list(Type)).



string_strip(Str, []) ->
  Str;
string_strip(Str, [CH | L]) ->
  string_strip(string:strip(Str, both, CH), L).

%%-------------------------------------------------------------------
write_file(FileName, Fmt) ->
  file:write_file(FileName, Fmt, [append]).
%%-------------------------------------------------------------------
write_file(FileName, Fmt, Args) ->
  color:info_log(Fmt, Args),
  file:write_file(FileName, io_lib:format(Fmt, Args), [append]).