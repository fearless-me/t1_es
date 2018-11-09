%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:24
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(GS_COMMON_RECORD_HRL).
-define(GS_COMMON_RECORD_HRL, true).

%% 存在玩家进程当前地图的信息
-record(m_player_map, {map_id, line_id, map_pid}).

%% 登录
-record(r_login_req, {plat_name = "", plat_account_name = "", access_token = "", player_pid = 0}).
-record(r_login_ack, {error = 0, account_info = undefined}).
%% 创角
-record(r_create_player_req, {sid, name, camp, career, race, sex, head, x, y, mid}).
-record(r_create_player_ack, {error = 0, uid = 0, acc_id = 0, name = "",
    camp = 0, career = 0, race = 0, sex = 0, head = 0}).
%% 改变属性
-record(r_player_change_prop_req, {uid, add, multi, add_del, multi_del}).
%% 开始移动
-record(r_player_start_move_req, {uid = 0, tar}).
%% 强制停下
-record(r_player_stop_move_req, {uid, pos}).
%% 退出地图
-record(r_exit_map_req, {uid = 0, map_id = 0, line_id = 0, map_pid}).
-record(r_exit_map_ack, {map_id = 0, line_id = 0, pos, map_pid, error = 0}).
%% 进入地图
-record(r_join_map_req, {uid = 0, group = 0, pid, tar_map_id = 0, tar_line_id = 0, tar_pos, force = false}).
-record(r_join_map_ack, {map_id = 0, line_id = 0, pos, map_pid, error = 0}).
%% 地图传送
-record(r_teleport_req, {uid = 0, map_pid, tar}).
%% 使用技能
-record(r_player_use_skill_req, {uid = 0, skill_id = 0, tar = 0, pos, serial = 0}).
%% 添加buff
-record(r_player_add_buff_req, {uid = 0, src_uid = 0, buff_id = 0, level = 1, lifetime=0, layer=1, skip_immune=false}).






-endif.
