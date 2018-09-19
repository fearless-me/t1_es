%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 15:37
%%%-------------------------------------------------------------------

-module(my_ets).
-author("mawenhong").
%% API
-export([
    new/2,
    clear/1, info/1, size/1, exists/1,
    member/2, to_list/1, foldl/3,
    read/2, read/3, read_element/3,
    write/2,
    delete/2,
    update_element/3, update_counter/3,
    select/2, match/2, match_object/2, match_object/3
]).

info(Name) -> ets:info(Name).

size(Name) ->
    case ets:info(Name, size) of
        undefined -> 0;
        V -> V
    end.

clear(Name) ->
    ets:delete_all_objects(Name).

to_list(Name) ->
    ets:tab2list(Name).

foldl(F, Acc, T) ->
    ets:foldl(F, Acc, T).

exists(Name) ->
    ets:info(Name, named_table) =/= undefined.

new(Name, Options) ->
    ets:new(Name, Options).

update_counter(Tab, Key, UpdateOp)->
    ets:update_counter(Tab, Key, UpdateOp).

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
    ets:lookup_element(Tab, Key, Pos).

%%-------------------------------------------------------------------
write(Tab,Val) ->   ets:insert(Tab, Val).

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



