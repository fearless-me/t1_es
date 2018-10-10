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
      BuffList1 = object_rw:get_buff_list(Uid),
      BuffExist = is_buff_exist(BuffId, BuffList1),
      BuffList2 = add_buff(BuffExist, Uid, BuffId, Level, SrcUid, BuffList1),
      object_rw:set_buff_list(Uid, BuffList2),
      ok;
    _Any ->
      skip
  end,
  ok.

%% todo 叠加/更新时间/更新等级/ ...(目前未定)
add_buff(true, _Uid, _BuffId, _Level, _SrcUid, BuffList) ->
  BuffList;
%% 添加新buff
add_buff(_Any, _Uid, BuffId, Level, SrcUid, BuffList) ->
  Buff = make_buff(_Uid, BuffId, Level, SrcUid),
  [Buff | BuffList].

%% todo 检查能否添加buff
can_add_buff(_Uid, _BuffId) ->
  true.

%% 
make_buff(_Uid, BuffId, Level, SrcUid) ->
  #m_buff{buff_id=BuffId, lifetime=1000, level=Level, source=SrcUid}.

%%-------------------------------------------------------------------
is_buff_exist(_BuffId, []) ->
  false;
is_buff_exist(BuffId, BuffList) ->
  lists:keymember(BuffId, #m_buff.buff_id, BuffList).

%%-------------------------------------------------------------------
del_buff(_Uid, _BuffId) -> ok.
del_buff_trigger(_Uid, _Trigger) -> ok.
del_buff_group(_Uid, _GroupId) -> ok.
del_buff_effect(_Uid, _Type) -> ok.
del_debuff(_Uid) -> ok.
del_buff_source(_Uid, _Source) -> ok.


%%-------------------------------------------------------------------
tick(#m_cache_map_object{uid = Uid}) ->
    BuffList = object_rw:get_buff_list_def(Uid, []),
    {_DelBuffList, NewBuffList} = tick_all_buff(BuffList, Uid, [], []),
    object_rw:set_buff_list(Uid, NewBuffList),
    %%

    ok.

tick_all_buff([], _Uid,  Delete, Continue) ->
    {Delete, Continue};
tick_all_buff([Buff | BuffList], Uid, Delete, Continue) ->
    case tick_one_buff(Uid, Buff) of
         delete  -> tick_all_buff(BuffList, Uid, [Buff | Delete], Continue);
         NewBuff -> tick_all_buff(BuffList, Uid, Delete, [NewBuff | Continue])
    end.

tick_one_buff(Uid, Buff) ->
    buff_effect:active(Uid, Buff),
    Buff;
tick_one_buff(_Uid, _Buff) ->
    delete.

%%-------------------------------------------------------------------




