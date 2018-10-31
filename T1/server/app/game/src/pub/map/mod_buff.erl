%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 六月 2018 14:48
%%%-------------------------------------------------------------------
-module(mod_buff).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("combat.hrl").
-include("rec_rw.hrl").

%% todo 临时定义一个
-record(buffCfg, {id, group_id, type, debuff, del_trigger}).

%% API
-export([
    add_buff/4, %% 添加buff
    tick/1,     %% buff 周期触发
    del_buff/2, %% 删除某个id的buff
    del_buff_trigger/2, %% 删除某个事件触发的比如 进出地图、上下线
    del_buff_group/2, %% 删除某个buff组
    del_buff_effect/2,   %% 删除某个效果的buff
    del_debuff/1,  %% 删除debuff
    del_buff_source/2  %% 删除某个来源的buff
]).

%%-------------------------------------------------------------------
add_buff(Uid, BuffId, Level, SrcUid) ->
    case can_add_buff(Uid, BuffId) of
        true ->
            BuffList1 = i_get_bufflist(Uid),
            BuffExist = is_buff_exist(BuffId, BuffList1),
            BuffList2 = add_buff(BuffExist, Uid, BuffId, Level, SrcUid, BuffList1),
            i_set_bufflist(Uid, BuffList2),
            ok;
        _Any ->
            skip
    end,
    ok.

%% todo 叠加/更新时间/更新等级/ ...(目前未定)
add_buff(true, _Uid, _BuffId, _Level, _SrcUid, BuffList) ->
    BuffList;
%% 添加新buff
add_buff(_Any, Uid, BuffId, Level, SrcUid, BuffList) ->
    Buff = make_buff(Uid, BuffId, Level, SrcUid),
    on_add_buff(Uid, Buff),
    [Buff | BuffList].

%% todo 检查能否添加buff
can_add_buff(_Uid, _BuffId) ->
    true.

%% 
make_buff(_Uid, BuffId, Level, SrcUid) ->
    #m_buff{buff_id = BuffId, lifetime = 1000, level = Level, source = SrcUid}.

%%-------------------------------------------------------------------
is_buff_exist(_BuffId, []) ->
    false;
is_buff_exist(BuffId, BuffList) ->
    lists:keymember(BuffId, #m_buff.buff_id, BuffList).

%%-------------------------------------------------------------------
del_buff(Uid, BuffId) -> do_del_buff(Uid, #m_buff.buff_id, BuffId).
del_buff_source(Uid, Source) -> do_del_buff(Uid, #m_buff.source, Source).

%% todo 根据配置表类型筛选buff
del_debuff(Uid) -> do_del_buff_cfg(Uid, #buffCfg.debuff, 1).
del_buff_effect(Uid, Type) -> do_del_buff_cfg(Uid, #buffCfg.type, Type).
del_buff_group(Uid, GroupId) -> do_del_buff_cfg(Uid, #buffCfg.group_id, GroupId).
del_buff_trigger(Uid, Trigger) -> do_del_buff_cfg(Uid, #buffCfg.del_trigger, Trigger).

%%-------------------------------------------------------------------
do_del_buff(Uid, Pos, Key) ->
    BuffList1 = i_get_bufflist(Uid),
    {Matched, Unmatched} = i_filter_buff_list(BuffList1, [], [], Pos, Key),
    i_set_bufflist(Uid, Unmatched),
    on_delete_buff(Uid, Matched),
    ok.

do_del_buff_cfg(Uid, Pos, Key) ->
    BuffList1 = i_get_bufflist(Uid),
    {Matched, Unmatched} = i_filter_buff_list_cfg(BuffList1, [], [], Pos, Key),
    i_set_bufflist(Uid, Unmatched),
    on_delete_buff(Uid, Matched),
    ok.

%%-------------------------------------------------------------------
i_filter_buff_list([], Matched, Unmatched, _Pos, _Key) ->
    {Matched, Unmatched};
i_filter_buff_list([Buff | Original], Matched, Unmatched, Pos, Key) when element(Pos, Buff) == Key ->
    i_filter_buff_list(Original, [Buff#m_buff.buff_id | Matched], Unmatched, Pos, Key);
i_filter_buff_list([Buff | Original], Matched, Unmatched, Pos, Key) ->
    i_filter_buff_list(Original, Matched, [Buff | Unmatched], Pos, Key).

%%-------------------------------------------------------------------
i_filter_buff_list_cfg([], Matched, Unmatched, _Pos, _Key) ->
    {Matched, Unmatched};
i_filter_buff_list_cfg([Buff | Original], Matched, Unmatched, Pos, Key) ->
    case i_filter_buff_cfg(Buff#m_buff.buff_id, Pos, Key) of
        true ->
            i_filter_buff_list_cfg(Original, [Buff | Matched], Unmatched, Pos, Key);
        _Any ->
            i_filter_buff_list_cfg(Original, Matched, [Buff | Unmatched], Pos, Key)
    end.

i_filter_buff_cfg(_BuffId, Pos, Key) ->
    BuffCfg = {1, 2},
    element(Pos, BuffCfg) == Key.


%%-------------------------------------------------------------------
tick(#m_cache_map_object{uid = Uid}) ->
    tick(Uid, i_get_bufflist(Uid)).

tick(_Uid, []) -> ok;
tick(Uid, BuffList) ->
    %% todo 区分删除、更新的buff，批量通知
    {DelBuffList, UpdateBuffList, NewBuffList} = tick_all_buff(BuffList, Uid, [], [], []),
    i_set_bufflist(Uid, NewBuffList),
    %%
    on_delete_buff(Uid, DelBuffList),
    on_update_buff(Uid, UpdateBuffList),
    ok.

tick_all_buff([], _Uid, Delete, Update, Continue) ->
    {Delete, Update, Continue};
tick_all_buff([Buff | BuffList], Uid, Delete, Update, Continue) ->
    case tick_one_buff(Uid, Buff) of
        delete -> tick_all_buff(BuffList, Uid, [Buff#m_buff.buff_id | Delete], Update, Continue);
        {update, NewBuff} -> tick_all_buff(BuffList, Uid, Delete, [NewBuff | Update], Continue);
        NewBuff -> tick_all_buff(BuffList, Uid, Delete, Update, [NewBuff | Continue])
    end.

tick_one_buff(Uid, Buff) ->
    buff_effect:active(Uid, Buff),
    Buff;
tick_one_buff(Uid, Buff) ->
    buff_effect:active(Uid, Buff),
    {update, Buff};
tick_one_buff(_Uid, _Buff) ->
    delete.

%%-------------------------------------------------------------------
on_add_buff(Uid, Buff) ->
    ViewNetMsg = #pk_GS2U_AddBuff{uid = Uid, buff = i_marshal_buff(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg).

%%-------------------------------------------------------------------
on_update_buff(_Uid, []) ->
    skip;
on_update_buff(Uid, [Buff]) ->
    ViewNetMsg = #pk_GS2U_UpdateBuff{uid = Uid, buff = i_marshal_buff(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
on_update_buff(Uid, BuffList) when is_list(BuffList) ->
    BuffInfoList = [i_marshal_buff(Buff) || Buff <- BuffList],
    ViewNetMsg = #pk_GS2U_UpdateBuffList{uid = Uid, buff_list = BuffInfoList},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
on_update_buff(Uid, Buff) ->
    ViewNetMsg = #pk_GS2U_UpdateBuff{uid = Uid, buff = i_marshal_buff(Buff)},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg).

%%-------------------------------------------------------------------
on_delete_buff(_Uid, []) ->
    skip;
on_delete_buff(Uid, [BuffId]) ->
    ViewNetMsg = #pk_GS2U_DeleteBuff{uid = Uid, buff_id = BuffId},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
on_delete_buff(Uid, BuffIdList) when is_list(BuffIdList) ->
    ViewNetMsg = #pk_GS2U_DeleteBuffList{uid = Uid, buff_id_list = BuffIdList},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg);
on_delete_buff(Uid, BuffId) when is_number(BuffId) ->
    ViewNetMsg = #pk_GS2U_DeleteBuff{uid = Uid, buff_id = BuffId},
    mod_map_priv:broadcast_net_msg_view(Uid, ViewNetMsg).


%%------------------------------------------------------------------
i_marshal_buff(#m_buff{
    buff_id = BuffId,
    lifetime = Lifetime,
    level = Level,
    wrap = Wrap
}) ->
    #pk_BuffInfo{
        buff_id = BuffId,
        lifetime = Lifetime,
        level = Level,
        wrap = Wrap
    }.


%%------------------------------------------------------------------
i_get_bufflist(Uid) ->
    object_rw:get_buff_list(Uid).

i_set_bufflist(Uid, BuffList) ->
    object_rw:set_buff_list(Uid, BuffList).

