%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 14:44
%%%-------------------------------------------------------------------
-module(player_combat).
-author("mawenhong").
-include("logger.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").

%% API
-export([
  online/0,
  change_attr/2, change_attr/4,
  use_skill/4,
  add_buff/2
]).


%% API
%%-------------------------------------------------------------------
%% @todo 在初始化数据之后需要计算属性
online() ->
  Uid = player_rw:get_uid(),
  case misc_ets:read_element(
    ?ETS_CACHE_ONLINE_PLAYER,
    Uid, #m_cache_online_player.attr)
  of
    [] -> calc_attr();
    _ -> ok
  end,
  ok.

%%-------------------------------------------------------------------
%% @todo 属性计算方式未定，暂时先这样
change_attr(AddList, MultiList) ->
  change_attr(AddList, MultiList, [], []),
  ok.

change_attr(AddList, MultiList, AddList_Del, MultiList_Del) ->
  Uid = player_rw:get_uid(),
  player_pub:send_map_msg_(player_change_attr, {Uid, AddList, MultiList, AddList_Del, MultiList_Del}),
  ok.



calc_attr() -> ok.



%%-------------------------------------------------------------------
add_buff(BuffId, Level) ->
  Uid = player_rw:get_uid(),
  Req = #r_player_add_buff_req{uid = Uid, buff_id = BuffId, level = Level},
  player_pub:send_map_msg_(player_add_buff, Req),
  ok.


%%-------------------------------------------------------------------
use_skill(SkillId, Tar, Pos, Serial) ->
  ?DEBUG("~p use skill ~p", [player_rw:get_uid(), SkillId]),
  R1 = check_cd(SkillId),
  R2 = check_cost(R1, SkillId),
  R3 = check_skill(R2, SkillId),
  R4 = check_target(R3, SkillId, Tar),
  ok = do_use_skill(R4, SkillId, Tar, Pos, Serial),
  ok.

%%-------------------------------------------------------------------
do_use_skill(true, SkillId, Tar, Pos, Serial) ->
  Uid = player_rw:get_uid(),
  Msg = #r_player_use_skill_req{
    uid = Uid, skill_id = SkillId, tar = Tar, pos = Pos, serial = Serial},
%%    lib_player_map_priv:teleport_call(Pos),
  ?DEBUG("send use skill to map ~p", [player_rw:get_map()]),
  update_skill_cd(SkillId),
  player_pub:send_map_msg_(player_use_skill, Msg),
  ok;
do_use_skill(ErrAndFalse, _SkillId, _Tar, _Pos, _Serial) ->
  %% todo 发送错误消息
  ErrAndFalse.


update_skill_cd(_SkillId) ->
  %% todo 技能cd更新
  ok.

%%-------------------------------------------------------------------
check_cd(_SkillId) ->
  true.

check_cost(true, _SkillId) ->
  true;
check_cost(ErrAndFalse, _SkillId) ->
  ErrAndFalse.

check_skill(true, _SkillId) ->
  true;
check_skill(ErrAndFalse, _SkillId) ->
  ErrAndFalse.

check_target(true, _SkillId, _Tar) ->
  true;
check_target(ErrAndFalse, _SkillId, _Tar) ->
  ErrAndFalse.


