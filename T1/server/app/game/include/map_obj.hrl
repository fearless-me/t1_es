%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:34
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(OBJ_HRL).
-define(OBJ_HRL, true).

%%
-define(OBJ_ERR, 0).
-define(OBJ_MIN, 1).
-define(OBJ_MON, 1).
-define(OBJ_NPC, 2).
-define(OBJ_PET, 3).
-define(OBJ_USR, 4).
-define(OBJ_MAX, 4).
-type obj_type() :: ?OBJ_MIN .. ?OBJ_MAX.

%% 进入地图后不会变的
-record(m_map_obj, {
%% 基础相关
    uid = 0, pid = 0, did = 0, name = "", owner = 0, type = ?OBJ_ERR :: obj_type()
}).

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

-endif.