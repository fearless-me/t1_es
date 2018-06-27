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
-include("ai_def.hrl").

%% 进入地图后会动态变
%% 通过自动生成代码lib_obj_rw
-record(m_map_obj_rw,{
    pid = 0, did = 0, group = 0, owner = 0, type=-1,
%%  战斗相关
    hp = 1, max_hp = 1, attr= [], buff_list = []
}).

-record(m_map_obj_move_rw,{
%%  移动相关
    move_speed = 20,
    cur_move=0, next_move=0,  vis_tile_idx=-1,
    cur_pos, start_pos, dest_pos, face, dir,
    start_time = 0, seg_move_time = 0,  % 分段已经移动时间
    stopped=false, path_list = []
}).

-record(m_map_obj_ai_rw,{
    ai_state=0, pre_ai_state=0, ai_transition=1,
    triggers=[], pause=false,
    %
    ai_id=0,
    %idle
    % 巡逻路径， 路径点数， 当前点索引， 是否反向巡逻 ，是否正在巡逻
    wp_list=[],wp_num=0,wp_idx=1, is_reverse_patrol=false, is_patrol=false,
    % 开始巡逻等待tick 、索敌等待tick
    patrol_rest_tick=0, look_for_target_tick=0
    
}).

-record(m_player_rw, {
%%  这些信息将由基础代码来维护
    aid=0, uid=0, sid=0,
    name="", level=1, sex=0, head=1,
    race=0, career=0, map, % m_player_map
    last_second_tick, last_minute_tick, last_hour_tick,
    status
%%  逻辑代码的放在这之后（比如背包，技能等等）
}).

-endif.
