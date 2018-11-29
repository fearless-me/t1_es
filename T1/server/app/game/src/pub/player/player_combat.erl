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

-include("combat.hrl").

%% API
-export([
    online/0,
    change_combat_prop/2, change_combat_prop/4,
    query_prop/0, query_prop/1,
    use_skill/4,
    add_buff/3
]).


%% API
%%-------------------------------------------------------------------
online() ->
    Uid = player_rw:get_uid(),
    case gs_cache_interface:read_online_player_element(
        Uid, #m_cache_online_player.battle_props)
    of
        undefined -> calc_combat_prop();    %% @todo 未从数据库中加载数据，现阶段不做数据存储，转义为未刷新数据
        #m_battleProps{listBPFinal = []} -> calc_combat_prop(); %% 未刷新数据
        _ -> ok
    end,
    ok.

%% @todo 自身属性初始化，临时用固定值代替
calc_combat_prop() ->
    %% test begin
    BattleProps = #m_battleProps{
        career = 1, %% fixme prop_interface:?Career_1
        listBP1 = [
            #m_bp{id = ?BP_1_STR, add = 10.0},
            #m_bp{id = ?BP_1_AGI, add = 8.0},
            #m_bp{id = ?BP_1_INT, add = 10.0},
            #m_bp{id = ?BP_1_STA, add = 10.0}
        ],
        listBP2 = [
            #m_bp{id = ?BP_2_HP_MAX, add = 50.0},
            #m_bp{id = ?BP_2_HP_CUR, add = 50.0},
            #m_bp{id = ?BP_2_MP_MAX, add = 40.0},
            #m_bp{id = ?BP_2_MP_CUR, add = 40.0},
            #m_bp{id = ?BP_2_ATK, add = 38.0},
            #m_bp{id = ?BP_2_DEF, add = 30.0}
        ],
        listBP3 = [
            #m_bp{id = ?BP_3_HIT, add = 36.0},
            #m_bp{id = ?BP_3_FLEE, add = 16.0},
            #m_bp{id = ?BP_3_CRI, add = 26.0}
            #m_bp{id = ?BP_3_FAST, add = 16.0}
        ]
    },
    %% test end
    Uid = player_rw:get_uid(),
    %% 注1.因算法会在所有列表为空时跳过计算，因此这里要传入不影响内容的非空列表
    %% 注2.考虑到可能的优化，低层属性可能会引起更多的计算，因此非空列表中使用高层属性
    %% 注3.通常战斗属性在地图中进行计算，这里仅初始化放在角色进程
    BattlePropsNew = prop_interface:calc(
        BattleProps, [{?BP_4_HIT, ?BPUseType_ADD, 0.0}], []),
    gs_cache_interface:update_online_player(
        Uid, {#m_cache_online_player.battle_props, BattlePropsNew}),

    HpValue = prop_interface:query_v_pf_bpu(?BP_2_HP_CUR, BattlePropsNew),

    %% 同步HP属性到快捷属性中
    gs_cache_interface:update_online_player(
        Uid, {#m_cache_online_player.hp, trunc(HpValue)}
    ),
    ok.


%%-------------------------------------------------------------------
change_combat_prop(AddList, MultiList) ->
    change_combat_prop(AddList, MultiList, [], []),
    ok.

change_combat_prop(AddList, MultiList, AddList_Del, MultiList_Del) ->
    Uid = player_rw:get_uid(),
    player_pub:player_change_combat_prop_({Uid, AddList, MultiList, AddList_Del, MultiList_Del}),
    ok.


%%-------------------------------------------------------------------
query_prop() ->
    Uid = player_rw:get_uid(),
    case gs_cache_interface:read_online_player_element(
        Uid, #m_cache_online_player.battle_props)
    of
        #m_battleProps{listBPFinal = ListBPFinal} ->
            ListBPFinal;
        _ ->
            []
    end.

query_prop(BattlePropID) ->
    Uid = player_rw:get_uid(),
    BattleProps = gs_cache_interface:read_online_player_element(
        Uid, #m_cache_online_player.battle_props),
    query_prop(BattlePropID, BattleProps).

query_prop(BattlePropID, undefined) ->
    ?DEFAULT_BATTLE_PROP_USE(BattlePropID);
query_prop(BattlePropID, #m_battleProps{listBPFinal = ListBPFinal}) ->
    case lists:keyfind(BattlePropID, 1, ListBPFinal) of
        false ->
            ?DEFAULT_BATTLE_PROP_USE(BattlePropID);
        BattlePropUse ->
            BattlePropUse
    end.


%%-------------------------------------------------------------------
add_buff(SourceUid, BuffId, Level) ->
    Uid = player_rw:get_uid(),
    Req = #r_player_add_buff_req{uid = Uid, src_uid = SourceUid, buff_id = BuffId, level = Level},
    player_pub:send_map_msg_(player_add_buff, Req),
    ok.

%%-------------------------------------------------------------------
use_skill(SkillId, TarList, Pos, Serial) ->
    ?DEBUG("~p use skill ~p serial ~p at pos ~w, Tar:~p",
        [player_rw:get_uid(), SkillId, Serial, Pos, TarList]),

    Can =
        case combat_interface:get_skill_cfg(SkillId) of
            #skillCfg{} = SkillCfg ->
                R1 = check_cd(SkillCfg),
                R2 = check_cost(R1, SkillCfg),
                check_target(R2, SkillCfg, TarList);
            _ ->
                1
        end,
    do_use_skill(Can, SkillId, TarList, Pos, Serial),
    ok.

%%-------------------------------------------------------------------
do_use_skill(true, SkillId, Tar, Pos, Serial) ->
    Uid = player_rw:get_uid(),
    ?DEBUG("~p use skill ~p serial ~p send to map ~w",
        [Uid, SkillId, Serial, player_rw:get_map()]),

    update_skill_cd(SkillId),
    player_pub:send_map_msg_(player_use_skill,
        #r_player_use_skill_req{uid = Uid, skill_id = SkillId, tar = Tar, pos = Pos, serial = Serial}),
    ok;
do_use_skill(ErrAndFalse, SkillId, Tar, _Pos, Serial) ->
    NetMsg = #pk_GS2U_UseSkill{
        uid = player_rw:get_uid(),
        tar_uids = Tar,
        skill_id = SkillId,
        serial = Serial,
        error_code = ErrAndFalse
    },
    player_pub:send_net_msg(NetMsg).


update_skill_cd(_SkillId) ->
    %% todo 技能cd更新
    ok.

%%-------------------------------------------------------------------
check_cd(_SkillCfg) ->
    true.

check_cost(true, _SkillCfg) ->
    true;
check_cost(ErrAndFalse, _SkillCfg) ->
    ErrAndFalse.

check_target(true, _SkillCfg, []) ->
    2;
check_target(true, #skillCfg{purpose = Purpose}, TarList) ->
    SelfUid = player_rw:get_uid(),
    case Purpose of
        ?SKILL_PURPOSE_DEC ->
            case lists:member(SelfUid, TarList) of
                true -> 2;
                _ -> true
            end;
        _ -> true
    end;
check_target(ErrAndFalse, _SkillCfg, _Tar) ->
    ErrAndFalse.


