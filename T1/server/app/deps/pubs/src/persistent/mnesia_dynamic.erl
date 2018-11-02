%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 9:58
%%%-------------------------------------------------------------------
-module(mnesia_dynamic).
-author("mawenhong").

%%@doc 模块基础代码
-define(MNESIA_MODULE_HEADER(ModuleName),
"-module(" ++ ModuleName ++ ").
-export([get/1]).
~ts
get(Other) -> false. ").


%% API
-export([ create_mem_table_mod/3, test_create/0]).

%%
%% @doc
-spec create_mem_table_mod(ServerID :: integer(), ModName :: atom(), Tabs :: list()) -> ok.
create_mem_table_mod(ServerID, ModName, Tabs) ->
    code_create_setting_module(ServerID, ModName, Tabs),
    ok.

code_create_setting_module(ServerID, ModuleNameTmp, Tabs) ->
    ModuleName = erlang:atom_to_list(ModuleNameTmp),
    CodeStr = code_create_setting_module_format(ServerID, ModuleName, Tabs),
    {Mod, Code} = dynamic_compile:from_string(lists:flatten(CodeStr)),
    code:load_binary(Mod, ModuleName ++ ".erl", Code),
    ok.

code_create_setting_module_format(ServerID, ModuleName, Tabs) ->
    CodeSrc =
        lists:foldl(
            fun(Tab, Acc) ->
                io_lib:format("~nget(~w)-> ~w_~w;",[Tab, Tab, ServerID]) ++ Acc
            end, "", Tabs),
    io_lib:format(?MNESIA_MODULE_HEADER(ModuleName), [CodeSrc]).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
test_create()->
    code_create_setting_module(11, mnesia_x, [player_data, server_info, package]),
    ok.