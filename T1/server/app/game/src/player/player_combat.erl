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
-include("object.hrl").
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
    case gs_cache_interface:read_player_online_element(
        Uid, #m_cache_player_online.battle_props)
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
        career = ?CAREER_MAIN(player_rw:get_career()),
        listBP1 = ?LIST_BP1,
        listBP2 = ?LIST_BP2,
        listBP3 = ?LIST_BP3
    },
    %% test end
    Uid = player_rw:get_uid(),
    %% 注1.因算法会在所有列表为空时跳过计算，因此这里要传入不影响内容的非空列表
    %% 注2.考虑到可能的优化，低层属性可能会引起更多的计算，因此非空列表中使用高层属性
    %% 注3.通常战斗属性在地图中进行计算，这里仅初始化放在角色进程
    BattlePropsNew = prop_interface:calc(
        BattleProps, [{?BP_4_HIT, ?BPUseType_ADD, 0.0}], []),
    gs_cache_interface:update_player_online(
        Uid, {#m_cache_player_online.battle_props, BattlePropsNew}),

    HpValue = prop_interface:query_v_pf_bpu(?BP_2_HP_CUR, BattlePropsNew),

    %% 同步HP属性到快捷属性中
    gs_cache_interface:update_player_online(
        Uid, {#m_cache_player_online.hp, trunc(HpValue)}
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
    case gs_cache_interface:read_player_online_element(
        Uid, #m_cache_player_online.battle_props)
    of
        #m_battleProps{listBPFinal = ListBPFinal} ->
            ListBPFinal;
        _ ->
            []
    end.

query_prop(BattlePropID) ->
    Uid = player_rw:get_uid(),
    BattleProps = gs_cache_interface:read_player_online_element(
        Uid, #m_cache_player_online.battle_props),
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
add_buff(_SourceUid, _BuffId, _Level) ->
    ok.

%%-------------------------------------------------------------------
use_skill(SkillId, TarList, Pos, Serial) ->
    ?DEBUG("~p use skill ~p serial ~p at pos ~w, Tar:~p",
        [player_rw:get_uid(), SkillId, Serial, Pos, TarList]),
    ok.


