%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 10:29
%%%-------------------------------------------------------------------
-module(code_gen).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").

%% API
-export([
    init/3,
    release/0,
    gen/1,
    is_type/2,
    code_type/1
]).

-define(CodeEts,codeEts).

-define(Bit_Highest,    1).	
-define(Bit_Type,	    5).	
-define(Bit_AreaID, 	5).	
-define(Bit_ServerID,	10).
-define(Bit_IDRange,    43).

-record(rec_code, {
    type,			%% 类型
    curCode,		%% 当前计数的
    minCode,		%% 最小值
    maxCode			%% 最大上限值
}).
%% ====================================================================


init(AreaID, ServerID,CodeTypeList)->
    ?INFO("CodeMgr init"),
    misc_ets:new(?CodeEts,
        [public, named_table, {keypos, #rec_code.type},?ETS_RC, ?ETS_WC]),
    lists:foreach(
        fun(CodeType) ->
            init_1(AreaID, ServerID,CodeType)
        end,CodeTypeList),
    ?INFO("CodeMgr init OK"),
    true.


gen(Type) -> gen_1(Type).

%%判断某个Code是否为某种类型
is_type(CodeType,Code) ->
    {Type,_,_,_} = parse(Code),
    Type =:= CodeType.

%%根据Code获取类型
code_type(Code) ->
    {CodeType,_,_,_} = parse(Code),
    CodeType.

release()-> misc_ets:delete(?CodeEts).



init_1(AreaID, ServerID, CodeType) ->
    MinCode = gen_4(CodeType, AreaID, ServerID, 0),
    MaxCode = gen_4(CodeType, AreaID, ServerID, (1 bsl ?Bit_IDRange) - 1),
    misc_ets:write(?CodeEts,#rec_code{
        type = CodeType,curCode = MinCode, minCode = MinCode, maxCode = MaxCode}),
    ?INFO("Type[~w],ADBID[~w],dbid[~w],min[~w],max:[~w]",
        [CodeType,AreaID,ServerID,MinCode,MaxCode]),
    ok.

%%当达到最大值时，会自动从最小值再次开始
gen_1(Type) ->
    [#rec_code{
        minCode = MinCode
        , maxCode = MaxCode
    }] = misc_ets:read(?CodeEts, Type),
    misc_ets:update_counter(?CodeEts, Type,
        {#rec_code.curCode, 1, MaxCode, MinCode}).

gen_4(CodeType, AreaID, ServerID, BaseCode) ->
    <<Code:64>> =
        <<
            0:?Bit_Highest
            , CodeType:?Bit_Type
            , AreaID:?Bit_AreaID
            , ServerID:?Bit_ServerID
            ,BaseCode:?Bit_IDRange
        >>,
    Code.

parse(Code) ->
    <<
        _:?Bit_Highest
        , CodeType:?Bit_Type
        , AreaID:?Bit_AreaID
        , ServerID:?Bit_ServerID
        , BaseCode:?Bit_IDRange
    >> = <<Code:64>>,
    {CodeType,AreaID,ServerID,BaseCode}.
