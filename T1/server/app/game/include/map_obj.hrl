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

%%
-record(r_map_obj, {
%% 基础相关
    uid = 0, pid = 0, did = 0,
    name = "", group = 0, type = ?OBJ_ERR :: obj_type(),
    map_id = 0, line_id = 0, map_pid = undefined,

%%  移动相关
    cur_move, next_move, pos, start, dir, dest, face, vis_tile_idx,
    start_time = 0, last_up_time = 0,  move_speed = 20,
    total_move_time = 0,   % 预估完成移动总时间
    total_moved_time = 0,  % 已经移动的总时间
    stopped, path_list = [],

%%  战斗相关
    hp = 1, max_hp = 1,
    attr= [], buff_list = []

}).

-endif.