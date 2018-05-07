%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 10:00
%%%-------------------------------------------------------------------
-module(mnesia_utils).
-author("mawenhong").

%% API
-export([
    start/0, stop/0,

    %% Dirty access regardless of activities - Updates
    dirty_write/1, dirty_write/2,
    dirty_delete/1, dirty_delete/2,
    dirty_delete_object/1, dirty_delete_object/2,
    dirty_update_counter/2, dirty_update_counter/3,

    %% Dirty access regardless of activities - Read
    dirty_read/2,
    dirty_select/2,
    dirty_match_object/1, dirty_match_object/2, dirty_all_keys/1,
    dirty_index_match_object/2, dirty_index_match_object/3,
    dirty_index_read/3, dirty_slot/2,
    dirty_first/1, dirty_next/2, dirty_last/1, dirty_prev/2,

    %% Table mgt
    create_table/2, delete_table/1,
    add_table_copy/3, del_table_copy/2, move_table_copy/3,
    add_table_index/2, del_table_index/2,
    transform_table/3, transform_table/4,
    change_table_copy_type/3,
    clear_table/1,

    %% Table load
    wait_for_tables/2, force_load_table/1,
    set_master_nodes/1, set_master_nodes/2,

    %% QLC functions
    table/1, table/2,

    %% Info
    table_info/2,
    info/0, system_info/1, system_info/0,                      % Not for public use
    subscribe/1, unsubscribe/1, report_event/1,
    set_debug_level/1
]).


start() ->
    mnesia:start().

stop() ->
    mnesia:stop().

info() ->
    mnesia:info().

subscribe(EventCategory) ->
    mnesia:subscribe(EventCategory).

unsubscribe(EventCategory) ->
    mnesia:unsubscribe(EventCategory).


change_table_copy_type(Tab, Node, To) ->
    mnesia:change_table_copy_type(Tab, Node, To).

create_table(Name, TabDef) ->
    mnesia:create_table(Name, TabDef).

delete_table(Tab) ->
    mnesia:delete_table(Tab).

clear_table(Tab) ->
    mnesia:clear_table(Tab).

add_table_copy(Tab, Node, Type) ->
    mnesia:add_table_copy(Tab, Node, Type).

add_table_index(Tab, AttrName) ->
    mnesia:add_table_index(Tab, AttrName).

del_table_index(Tab, Ix) ->
    mnesia:del_table_index(Tab, Ix).

del_table_copy(Tab, N) ->
    mnesia:del_table_copy(Tab, N).

move_table_copy(Tab, From, To) ->
    mnesia:move_table_copy(Tab, From, To).

transform_table(Tab, Fun, NewAttributeList, NewRecordName) ->
    mnesia:transform_table(Tab, Fun, NewAttributeList, NewRecordName).

transform_table(Tab, Fun, NewAttributeList) ->
    mnesia:transform_table(Tab, Fun, NewAttributeList).

wait_for_tables(TabList, Timeout) ->
    mnesia:wait_for_tables(TabList, Timeout).

force_load_table(Tab) ->
    mnesia:force_load_table(Tab).

report_event(Event) ->
    mnesia:report_event(Event).

system_info(InfoKey) ->
    mnesia:system_info(InfoKey).

system_info() ->
    mnesia:system_info().

table(Tab) ->
    mnesia:table(Tab).


set_debug_level(Level) ->
    mnesia:set_debug_level(Level).

set_master_nodes(MasterNodes) ->
    mnesia:set_master_nodes(MasterNodes).

set_master_nodes(Tab, MasterNodes) ->
    mnesia:set_master_nodes(Tab, MasterNodes).


table(Tab, Option) ->
    mnesia:table(Tab, Option).

table_info(Tab, InfoKey) ->
    mnesia:table_info(Tab, InfoKey).


dirty_all_keys(Tab) ->
    mnesia:dirty_all_keys(Tab).

dirty_delete({Tab, Key}) ->
    mnesia:dirty_delete({Tab, Key}).

dirty_delete(Tab, Key) ->
    mnesia:dirty_delete(Tab, Key).

dirty_delete_object(Record) ->
    mnesia:dirty_delete_object(Record).

dirty_delete_object(Tab, Record) ->
    mnesia:dirty_delete_object(Tab, Record).

dirty_first(Tab) ->
    mnesia:dirty_first(Tab).

dirty_index_match_object(Pattern, Pos) ->
    mnesia:dirty_index_match_object(Pattern, Pos).

dirty_index_match_object(Tab, Pattern, Pos) ->
    mnesia:dirty_index_match_object(Tab, Pattern, Pos).

dirty_index_read(Tab, SecondaryKey, Pos) ->
    mnesia:dirty_index_read(Tab, SecondaryKey, Pos).

dirty_last(Tab) ->
    mnesia:dirty_last(Tab).

dirty_match_object(Pattern) ->
    mnesia:dirty_match_object(Pattern).

dirty_match_object(Tab, Pattern) ->
    mnesia:dirty_match_object(Tab, Pattern).

dirty_next(Tab, Key) ->
    mnesia:dirty_next(Tab, Key).

dirty_prev(Tab, Key) ->
    mnesia:dirty_prev(Tab, Key).

dirty_read(Tab, Key) ->
    mnesia:dirty_read(Tab, Key).

dirty_select(Tab, MatchSpec) ->
    mnesia:dirty_select(Tab, MatchSpec).

dirty_slot(Tab, Slot) ->
    mnesia:dirty_slot(Tab, Slot).

dirty_update_counter({Tab, Key}, Incr) ->
    mnesia:dirty_update_counter({Tab, Key}, Incr).

dirty_update_counter(Tab, Key, Incr) ->
    mnesia:dirty_update_counter(Tab, Key, Incr).

dirty_write(Record) ->
    mnesia:dirty_write(Record).

dirty_write(Tab, Record) ->
    mnesia:dirty_write(Tab, Record).



