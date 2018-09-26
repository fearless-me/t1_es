%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 八月 2018 15:15
%%%-------------------------------------------------------------------
-module(misc_mnesia).
-author("mawenhong").

-include("logger.hrl").
%% todo list
%% todo 1. 先跑起来
%% todo 2. 在检查问题
%% todo 3. 在处理异常
%% todo 4. 在优化效率

-define(WAIT_TABLES_TIMEOUT, 3*60*1000).

%% API
-export([
    is_running/0, set_master_nodes/1, set_master_nodes/2,
    start/0, stop/0, sync/1, is_local_content/1,table_node/1,
    table_size/1, add_table_copy/3, del_table_copy/2,  wait_for_tables/0,
    create_table/2, delete_table/1, clear_table/1,
    write/1, s_write/1, write/2, read/2, index_read/3, all_keys/1, delete/2,
    dirty_delete/2, dirty_match/2, dirty_select/2, dirty_read/2, dirty_write/1, dirty_write/2,
    dirty_all_keys/1, dirty_read_all/1, dirty_update_counter/2, dirty_update_counter/3
]).


is_running() -> mnesia:system_info(is_running) =:= yes.

set_master_nodes(Nodes) ->
    mnesia:set_master_nodes(Nodes).

set_master_nodes(Tab, Nodes) ->
    mnesia:set_master_nodes(Tab, Nodes).

-spec start() -> boolean().
start() ->
    case mnesia:start() of
        ok -> true;
        {error, Reason} ->
            ?FATAL("mnesia:start,reason:~p ~n", [Reason]),
            false
    end.

stop() -> mnesia:stop().


-spec sync(Node) -> boolean() when Node :: node().
sync(Node) ->
    case mnesia:change_config(extra_db_nodes, [Node]) of
        {ok, [Node]} ->
%%            ?INFO("[~p]sync mnesia to ~p done #", [node(), Nodes]),
            Tables = mnesia:system_info(tables),
            mnesia:wait_for_tables(Tables, 10000),
            true;
        {error, Reason} ->
            ?FATAL("[~p]mnesia sync to ~p failed ~p", [node(), Node, Reason]),
            false
    end.


table_node(Tab) ->
    catch ets:lookup_element(mnesia_gvar,  {Tab,where_to_read}, 2).

-spec is_local_content(Tab:: mnesia:table()) -> boolean().
is_local_content(Tab) ->
    mnesia:table_info(Tab, local_content).

-spec add_table_copy(Tab:: mnesia:table(), N::node(), ST:: mnesia:storage_type()) -> mnesia:t_result(ok).
add_table_copy(Tab, N, S) ->
   case  mnesia:add_table_copy(Tab, N, S) of
       {atomic, ok} -> true;
       {aborted, Reason} ->
           ?ERROR("add_table_copy ~p ~p to ~p failed[~p]",
               [Tab, S, N, Reason]
           ),
           false
   end.


-spec del_table_copy(Tab::mnesia:table(), N::node()) -> mnesia:t_result(ok).
del_table_copy(Tab, N) ->
    case mnesia:del_table_copy(Tab, N) of
        {atomic, ok} -> true;
        {aborted, Reason} ->
            ?ERROR("del_table_copy ~p from ~p failed[~p]",
                [Tab,  N, Reason]
            ),
            false
    end.

table_size(Table) ->
    Node = mnesia:table_info(Table, where_to_read),
    rpc:call(Node, mnesia, table_info, [Table, size]).

-spec create_table(TabName, Arg) -> boolean() when
    TabName :: atom(), Arg :: list().
create_table(TabName, Arg) ->
    case mnesia:create_table(TabName, Arg) of
        {atomic, ok} -> true;
        {aborted, {already_exists, _}} -> true;
        {aborted, Reason} ->
            ?ERROR("create mnesia table failed[~p]", [Reason]),
            false
    end.

-spec delete_table(TabName) -> boolean() when
    TabName :: atom().
delete_table(TabName) ->
    case mnesia:delete_table(TabName) of
        {atomic, ok} -> true;
        {aborted, Reason} -> ?ERROR("delete mnesia table failed[~p]", [Reason]), false
    end.

-spec clear_table(TabName) -> boolean() when
    TabName :: atom().
clear_table(TabName) ->
    case mnesia:clear_table(TabName) of
        {atomic, ok} -> true;
        {aborted, Reason} -> ?ERROR("clear mnesia table failed[~p]", [Reason]), false
    end.

wait_for_tables() ->
    Tables = mnesia:system_info(tables),
    mnesia:wait_for_tables(Tables, ?WAIT_TABLES_TIMEOUT),
    ok.


%%%%使用普通锁写入一条记录
-spec write(Record) -> boolean() when
    Record :: tuple().
write(Record) ->
    F = fun() -> mnesia:write(Record) end,
    case mnesia:transaction(F) of
        {atomic, ok} -> true;
        Reason -> ?ERROR("error write record:[~p]", [Reason]), false
    end.

%%使用粘锁写记录
-spec s_write(Record) -> boolean() when Record :: tuple().
s_write(Record) ->
    F = fun() -> mnesia:s_write(Record) end,
    case mnesia:transaction(F) of
        {atomic, ok} -> true;
        Reason -> ?ERROR("error write record:[~p]", [Reason]), false
    end.

-spec write(Table, Record) -> boolean() when Table :: atom(), Record :: tuple().
write(Table, Record) ->
    F = fun() -> mnesia:write(Table, Record, write) end,
    case mnesia:transaction(F) of
        {atomic, ok} -> true;
        Reason -> ?ERROR("error write record:[~p]", [Reason]), false
    end.

%%使用普通锁读取指定Key的记录
-spec read(TabName, Key) -> term() when
    TabName :: atom(), Key :: term().

read(TabName, Key) ->
    F = fun() -> mnesia:read(TabName, Key) end,
    case mnesia:transaction(F) of
        {atomic, ResultOfFun} -> ResultOfFun;
        _ -> []
    end.


-spec index_read(Tab, Key, Attr) -> [Record] when
    Tab :: atom(), Key :: term(), Attr :: mnesia:index_attr(), Record :: tuple().
index_read(TabName, IndexKey, Pos) ->
    F = fun() -> mnesia:index_read(TabName, IndexKey, Pos) end,
    case mnesia:transaction(F) of
        {atomic, ResultOfFun} -> ResultOfFun;
        _ -> []
    end.

-spec all_keys(Tab :: atom()) -> [Key :: term()].
all_keys(TabName) ->
    F = fun() -> mnesia:all_keys(TabName) end,
    case mnesia:transaction(F) of
        {atomic, Val} ->
            Val;
        Error ->
            ?WARN("Error:~p,stack=~p", [Error, misc:callstack()]),
            []
    end.


-spec delete(TabName, Key) -> boolean() when
    TabName :: atom(), Key :: term().
delete(TabName, Key) ->
    F = fun() -> mnesia:delete({TabName, Key}) end,
    case mnesia:transaction(F) of
        {atomic, ok} -> true;
        Reason ->
            ?ERROR("error delete record:[~p]", [Reason]),
            false
    end.

dirty_delete(Table, Key) ->
    mnesia:dirty_delete(Table, Key).

dirty_read(Table, Key) ->
    case mnesia:dirty_read(Table, Key) of
        List when erlang:is_list(List) ->
            List;
        Error ->
            ?ERROR("dirty_read(~p,~p) error:~p", [Table, Key, Error]),
            []
    end.

dirty_match(Table, Match) ->
    case mnesia:dirty_match_object(Table, Match) of
        List when erlang:is_list(List) ->
            List;
        Error ->
            ?ERROR("dirty_match(~p,~p) error:~p", [Table, Match, Error]),
            []
    end.

dirty_select(Table, Spec) ->
    case mnesia:dirty_select(Table, Spec) of
        List when erlang:is_list(List) ->
            List;
        Error ->
            ?ERROR("dirty_select(~p,~p) error:~p", [Table, Spec, Error]),
            []
    end.

dirty_write(Value) ->
    mnesia:dirty_write(Value).

dirty_write(Table, Value) ->
    mnesia:dirty_write(Table, Value).


%% 读取表中的所有行
-spec dirty_read_all(TabName) -> term() when
    TabName :: atom().
dirty_read_all(TabName) ->
    F =
        fun(Key, Acc) ->
            case mnesia:dirty_read(TabName, Key) of
                [] -> Acc;
                Ret -> Ret ++ Acc
            end
        end,
    lists:foldl(F, [], mnesia:dirty_all_keys(TabName)).

-spec dirty_all_keys(TabName) -> [Key :: term()] when
    TabName :: atom().
dirty_all_keys(TabName) ->
    mnesia:dirty_all_keys(TabName).


dirty_update_counter({Tab, Key}, Incr) ->
    mnesia:dirty_update_counter({Tab, Key}, Incr).

dirty_update_counter(Tab, Key, Incr) ->
    mnesia:dirty_update_counter(Tab, Key, Incr).