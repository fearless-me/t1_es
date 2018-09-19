%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% -record(slave_info, {name,socket,client}).
%%% Match = #slave_info{name='$1',socket=Sock,client='$2',_='_'},
%%% ets:match(slave_tab,Match) ->  [[Node,_Client]] | [].
%%%
%%% Ms = ets:fun2ms(fun(#slave_info{socket = Sock})-> Sock end),
%%% ets:select(slave_tab, Ms) -> [Socket1] | [].
%%%
%%% @end
%%% Created : 15. 八月 2018 15:37
%%%-------------------------------------------------------------------

-module(my_ets).
-author("mawenhong").
%% API
-export([
    new/2, %% 创建ets
    delete/1,  %% 删除ets
    clear/1, %% 清空ets数据
    info/1, %% ets信息
    size/1, %% ets size
    exists/1, %% ets是否存在
    to_list/1, %% ets 转成成list
    foldl/3,   %% ets 遍历
    member/2, %% 查看key是在ets中
    %% 按key取值, ... , 读取值的某个元素
    read/2, read/3, read_element/3,
    write/2,%% 插入ets
    delete/2, %% 按key删除值
    %% 按key更新值的某个字段
    update_element/3,
    %% 某个字段自增
    update_counter/3,
    %% 匹配
    select/2, select/3,
    match/2, match/3,
    match_object/2, match_object/3
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

delete(Name) ->
    ets:delete(Name).

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

select(Tab, QS, Limit) -> ets:select(Tab, QS, Limit).

%%-------------------------------------------------------------------
match(Tab, Pattern) -> ets:match(Tab, Pattern).
match(Tab, Pattern, Limit) -> ets:match(Tab, Pattern, Limit).

%%-------------------------------------------------------------------
match_object(Tab, Pattern) -> ets:match_object(Tab, Pattern).
match_object(Tab, Pattern, Limit) -> ets:match_object(Tab, Pattern, Limit).



