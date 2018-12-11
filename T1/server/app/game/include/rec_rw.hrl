%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2018 16:07
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(RW_RECORD_HRL).
-define(RW_RECORD_HRL, true).

%% player
%% 通过自动生成代码player_rw
-record(m_player_rw, {
%%  这些信息将由基础代码来维护
    aid = 0, uid = 0, sid = 0,
    name = "", level = 1, sex = 0, head = 1,
    race = 0, career = 0, map, % m_player_map
    last_second_tick, last_minute_tick, last_hour_tick ,
    status
%%  逻辑代码的放在这之后（比如背包，技能等等）
}).


%% 地图对象私有属性
%% 通过自动生成代码unit_rw

-record(m_object_rw, {
    %%-------------------------------------------------------------------
    %% 基础信息
    uid = 0, 
    pid = 0, data_id = 0, group = 0, owner = 0, type = 0,
    level = 1, name="", sex=0, career=1, race=1, camp=0,
    state = 0, %% 状态
    %%-------------------------------------------------------------------
    %% 移动相关
    move_speed = 20,
    cur_move = 0, next_move = 0, vis_tile_idx = -1,
    cur_pos, start_pos, dest_pos, face, dir,
    move_start_time = 0, seg_move_time = 0,  % 分段已经移动时间
    %% stopped 是否被强制停下，比如在追击，巡逻过程中等等
    force_stopped = false, move_path_list = [],
    born_pos, % 出生点
    
    %%-------------------------------------------------------------------
    %% 战斗相关
    battle_in_time = 0, %% 上次进入战斗状态的时间（本状态与基础信息中的state独立区分，因为移动、晕眩状态中，可能是战斗也可能不是战斗）

    hp = 1, max_hp = 1, battle_props, buff_list = [],
    
    %%-------------------------------------------------------------------
    %% AI相关
    ai_state = 0, pre_ai_state = 0, ai_transition = 1,
    ai_triggers = [], ai_pause = false,
    %
    ai_id = 0,
    %idle & 巡逻
    % 巡逻路径， 路径点数， 当前点索引， 是否反向巡逻 ，是否正在巡逻
    ai_wp_list = [], ai_wp_num = 0, ai_wp_idx = 1, ai_is_reverse_patrol = false, ai_is_patrol = false,
    % 开始巡逻等待tick 、索敌等待tick
    ai_patrol_rest_tick = 0, ai_look_for_target_tick = 0,
    % pursue & attack
    % 追击目标点 、追击失败 、不能追击、检查追击tick
    ai_pursue_tar_pos, ai_pursue_failed = false, ai_cant_pursue = false, ai_check_pursue_tick = 10,
    % 当前目标  、进入战斗的时间、进入战斗的坐标、当前使用的技能、下次攻击等待tick， 攻击序列号
    ai_target_uid = 0, ai_enter_combat_time = 0, ai_enter_combat_pos, ai_use_skill_id = 0, ai_attack_wait_tick = 10, ai_skill_serial = 0,
    
    %flee
    ai_flee_dst, ai_flee_dir, ai_flee_tick = 0, ai_is_arrived_flee_pos = false,

    %返回
    ai_arrived_return_pos=false,
    
    % 仇恨
    % 仇恨列表  最大仇恨id 锁定目标tick、 没有增加仇恨的tick
    enmity_list = [], max_enmity_uid = 0, ai_lock_target_tick = 0, no_inc_enmity_tick = 0
   
}).

%%%% 战斗属性
%%-record(m_combat_prop_rw, {
%%    max_hp, speed, attack
%%}).

%%%% 移动相关
%%%% 通过自动生成代码move_rw
%%-record(m_move_rw,{
%%    move_speed = 20,
%%    cur_move=0, next_move=0,  vis_tile_idx=-1,
%%    cur_pos, start_pos, dest_pos, face, dir,
%%    start_time = 0, seg_move_time = 0,  % 分段已经移动时间
%%   %% stopped 是否被强制停下，比如在追击，巡逻过程中等等
%%    force_stopped=false, path_list = []
%%}).
%%
%% AI相关
%% 通过自动生成代码ai_rw
%%-record(m_ai_rw, {
%%    ai_state = 0, pre_ai_state = 0, ai_transition = 1,
%%    triggers = [], pause = false,
%%    %
%%    ai_id = 0,
%%    %idle & 巡逻
%%    % 巡逻路径， 路径点数， 当前点索引， 是否反向巡逻 ，是否正在巡逻
%%    wp_list = [], wp_num = 0, wp_idx = 1, is_reverse_patrol = false, is_patrol = false,
%%    % 开始巡逻等待tick 、索敌等待tick
%%    patrol_rest_tick = 0, look_for_target_tick = 0,
%%    % pursue & attack
%%    % 追击目标点 、追击失败 、不能追击、检查追击tick
%%    pursue_tar_pos, pursue_failed = false, cant_pursue = false, check_pursue_tick = 10,
%%    % 当前目标  、进入战斗的时间、进入战斗的坐标、当前使用的技能、下次攻击等待tick， 攻击序列号
%%    target_uid = 0, enter_combat_time = 0, enter_combat_pos, use_skill_id = 0, attack_wait_tick = 10, skill_serial = 0,
%%
%%    %flee
%%    flee_dst, flee_dir, flee_tick = 0, is_arrived_flee_pos = false,
%%
%%    % 仇恨
%%    % 仇恨列表  最大仇恨id 锁定目标tick、 没有增加仇恨的tick
%%    enmity_list = [], max_enmity_uid = 0, lock_target_tick = 0, no_inc_enmity_tick = 0
%%
%%}).




%%%% 战斗相关
%%%% 通过自动生成代码combat_rw
%%-record(m_combat_rw, {
%%    %% 基础信息
%%    skill_id=0, target_uid=0, skill_serial=0,
%%    %% 技能目标点 , 第几次伤害计算 , 从开始到现在的时长(MS).
%%    persist_pos, cur_dmg_index=0, operate_time=0,
%%    %% 吟唱技能
%%    spell_time=0,
%%    %% 引导技能
%%    channel_cd=0,
%%    %%
%%    skill_queue=[],
%%    hp = 1, max_hp = 1, attr= [], buff_list = []
%%}).



-endif.
