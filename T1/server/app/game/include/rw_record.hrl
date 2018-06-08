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

%% 进入地图后会动态变
%% 通过自动生成代码lib_obj_rw
-record(m_map_obj_rw,{
    pid = 0, did = 0, group = 0, owner = 0,
%%  移动相关
    move_speed = 20,
    cur_move, next_move,  vis_tile_idx,
    cur_pos, start_pos, dest_pos, face, dir,
    start_time = 0, seg_move_time = 0,  % 分段已经移动时间
    stopped, path_list = [],

%%  战斗相关
    hp = 1, max_hp = 1,
    attr= [], buff_list = []

}).

-record(m_player_rw, {aid,uid,sid,status,name}).

-endif.
