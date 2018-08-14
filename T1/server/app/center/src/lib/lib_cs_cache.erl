%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:31
%%%-------------------------------------------------------------------
-module(lib_cs_cache).
-author("mawenhong").
-include("logger.hrl").
-include("pub_common.hrl").
-include("mem_record.hrl").
-include("gdef.hrl").
-include("db_record.hrl").

%% API
-export([
    init/0,  member/2,
    read/2, read/3, read_element/3,
    write/2, replace/3, update_element/3, delete/2,
    select/2, match/2, match_object/2, match_object/3
]).


%%-------------------------------------------------------------------
init() ->
    ok.

%%-------------------------------------------------------------------
member(Tab, Key) ->
    ets:member(Tab, Key).

%%-------------------------------------------------------------------
read(Tab, Key) -> ets:lookup(Tab, Key).
read(Tab, Key, Def) ->
    case ets:lookup(Tab, Key) of
        [] -> Def;
        Val -> Val
    end.

%%-------------------------------------------------------------------
read_element(Tab, Key, Pos)->
    ets:read_element(Tab, Key, Pos).

%%-------------------------------------------------------------------
write(Tab,Val) ->   ets:insert(Tab, Val).

%%-------------------------------------------------------------------
replace(Tab, Key, Val) ->
    case ets:member(Tab, Key) of
        true -> ets:insert(Tab, Val);
        _ -> ets:insert_new(Tab, Val)
    end.

%%-------------------------------------------------------------------
update_element(Tab, Key, ElementSpec) ->
    ets:update_element(Tab, Key, ElementSpec).

%%-------------------------------------------------------------------
delete(Tab, Key) ->
    ets:delete(Tab, Key).

%%-------------------------------------------------------------------
select(Tab, QS) -> ets:select(Tab, QS).

%%-------------------------------------------------------------------
match(Tab, Pattern) -> ets:match(Tab, Pattern).

%%-------------------------------------------------------------------
match_object(Tab, Pattern) -> ets:match_object(Tab, Pattern).
match_object(Tab, Pattern, Limit) -> ets:match_object(Tab, Pattern, Limit).



