%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 七月 2018 9:46
%%%-------------------------------------------------------------------
-module(hook_bag).
-author("mawenhong").
-include("pub_common.hrl").
-include("logger.hrl").

-record(m_item, {uid = 0, owner = 0, did = 0, num = 1, bind = false}).
%% todo list -- 背包后期事项
%% 1. 根据不同逻辑需要   实现背包的整理
%% 2. 添加新物品时要考虑是否叠加
%% 3. 在物品增删改的时候各个系统自己写逻辑，比如装备背包，需要计算属性等等

%% API
-export([
    %% 生成一個道具、
    make/4,
    %% 刪除成功時、新增時， 同步數據給客戶端
    on_deleted/3, on_added/3, on_overlapped/4, sync_all/2,
    %% 刪除一個道具的操作、 堆疊數量、 查找時的檢查、判斷是否是某個物品
    del_one_op/3, overlap_op/2, overlap_num/1, find_check/3, is_did/2,
    %% 道具需要的格子數、最大的格子数、整理背包（合併）
    need_slot/2, max_slots/1, reorder/2,
    %% 
    can_be_overlapped/2, bag_can_overlap/1, did_can_overlap/1
]).


%%-------------------------------------------------------------------
make(_Type, Uid, Did, Num) ->
    #m_item{uid = Uid, did = Did, num = Num}.


%%-------------------------------------------------------------------
on_deleted(Type, #m_item{uid = Uid, did = Did, num = Have} = _Olds, Num) ->
    %% todo 记日志什么的
    ?DEBUG("deleted ~p have/del ~p/~p in bag ~p ",[{Uid, Did}, Have, Num, Type]),
    ok.

on_added(Type, #m_item{uid = Uid, did = Did} = _News, Num) ->
    ?DEBUG("added new item ~p, num ~p in bag ~p",[{Uid, Did}, Num, Type]),
    ok.

on_overlapped(Type, #m_item{uid = Uid, did = Did, num = Have} = _News, From, Num) ->
    ?DEBUG("overlapped ~p item(s) to ~p from ~p, total ~p in bag ~p",
        [Num, {Uid, Did}, From, Have, Type]),
    ok.

%%-------------------------------------------------------------------
sync_all(_Type, _Map) ->
    ok.

%%-------------------------------------------------------------------
-spec del_one_op(Type :: non_neg_integer(), Rs :: tuple(),
    Need :: non_neg_integer()) -> {ok, New :: tuple()} | all.
del_one_op(_Type, #m_item{num = Have}, Need) when Need >= Have ->
    all;
del_one_op(_Type, #m_item{num = Have} = Rs, Need) when Need < Have, Need >= 0 ->
    {ok, Rs#m_item{num = Have-Need}};
del_one_op(_Type, _Rs, _Need) ->
    erlang:error(bad_agrs).

overlap_op( #m_item{num = Have} = Elm, Add) ->
    Elm#m_item{num = Have + Add}.

%%-------------------------------------------------------------------
overlap_num(#m_item{num = Have}) -> Have;
overlap_num(_Rs) -> 0.

can_be_overlapped(#m_item{bind = true}, _Did) ->
    skip;
can_be_overlapped(#m_item{uid = Uid, num = Have, did = Did}, Did) ->
    Max = max_overlapped(Did),
    ?if_else(Max > Have, {Uid, Max - Have}, skip);
can_be_overlapped(#m_item{uid = Uid, num = Have, did = Did}, #m_item{did = Did}) ->
    Max = max_overlapped(Did),
    ?if_else(Max > Have, {Uid, Max - Have}, skip);
can_be_overlapped(_Org, _DidOrItem) ->
    skip.

%% 背包是否允许叠加
bag_can_overlap(1) ->
    true;
bag_can_overlap(_Type) ->
    false.


%% todo 物品配置表能否叠加, 比如装备就不能
did_can_overlap(_Did) ->
    true.


%%-------------------------------------------------------------------
find_check(#m_item{did = Did1, num = Have}, Did, Need) when Have >= Need, Did1 =:= Did ->
    {full, Need};
find_check(#m_item{did = Did1, num = Have}, Did, Need) when Did1 =:= Did ->
    {more, Have, Need - Have};
find_check(_Rs, _Dis, _Need) ->
    skip.

%%-------------------------------------------------------------------
is_did(#m_item{did = Did}, Did) ->
    true;
is_did(_Rs, _Did) ->
    false.

%%-------------------------------------------------------------------
need_slot(_Did, _Num) -> 1.

max_slots(_Type) -> 200.

%% todo 配置表
max_overlapped(_Did) -> 999.

%%-------------------------------------------------------------------
reorder(_Type, Map) ->
    Map.



