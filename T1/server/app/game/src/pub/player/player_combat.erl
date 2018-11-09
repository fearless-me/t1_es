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
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("cfg_skill.hrl").

%% API
-export([
    online/0,
    change_combat_prop/2, change_combat_prop/4,
    use_skill/4,
    add_buff/2
]).


%% API
%%-------------------------------------------------------------------
%% @todo 在初始化数据之后需要计算属性
online() ->
    Uid = player_rw:get_uid(),
    case gs_cache_interface:read_online_player_element(
        Uid, #m_cache_online_player.prop_list)
    of
        [] -> calc_combat_prop();
        _ -> ok
    end,
    ok.

calc_combat_prop() -> ok.


%%-------------------------------------------------------------------
%% @todo 属性计算方式未定，暂时先这样
change_combat_prop(AddList, MultiList) ->
    change_combat_prop(AddList, MultiList, [], []),
    ok.

change_combat_prop(AddList, MultiList, AddList_Del, MultiList_Del) ->
    Uid = player_rw:get_uid(),
    player_pub:player_change_combat_prop_({Uid, AddList, MultiList, AddList_Del, MultiList_Del}),
    ok.




%%-------------------------------------------------------------------
add_buff(BuffId, Level) ->
    Uid = player_rw:get_uid(),
    Req = #r_player_add_buff_req{uid = Uid, buff_id = BuffId, level = Level},
    player_pub:send_map_msg_(player_add_buff, Req),
    ok.

%%-------------------------------------------------------------------
use_skill(SkillId, Tar, Pos, Serial) ->
    ?DEBUG("~p use skill ~p serial ~p at pos ~w", [player_rw:get_uid(), SkillId, Serial, Pos]),
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
    ?DEBUG("~p use skill ~p serial ~p send to map ~w",
        [Uid, SkillId, Serial, player_rw:get_map()]),
    update_skill_cd(SkillId),
    player_pub:send_map_msg_(player_use_skill, Msg),
    ok;
do_use_skill(ErrAndFalse, SkillId, Tar, _Pos, Serial) ->
    NetMsg = #pk_GS2U_UseSkill{
        uid = player_rw:get_uid(),
        tar_uid = Tar,
        skill_id = SkillId,
        serial = Serial,
        error_code = ErrAndFalse
    },
    player_pub:send_net_msg(NetMsg).


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

check_skill(true, SkillId) ->
    case getCfg:getCfgByArgs(cfg_skill, SkillId) of
        #skillCfg{} -> true;
        _ -> -1
    end;
check_skill(ErrAndFalse, _SkillId) ->
    ErrAndFalse.

check_target(true, _SkillId, _Tar) ->
    true;
check_target(ErrAndFalse, _SkillId, _Tar) ->
    ErrAndFalse.


