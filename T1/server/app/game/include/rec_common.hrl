%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:24
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(RECORD_COMMON_HRL).
-define(RECORD_COMMON_HRL, true).

%%
-record(r_login_req, {plat_name="", plat_account_name = "", access_token = "", player_pid = 0}).
%%
-record(r_login_ack, {error = 0, account_info = undefined}).
%%
-record(r_create_player_req, {sid, name, camp, career, race, sex, head, x, y, mid}).
%%
-record(r_create_player_ack, {error = 0, uid = 0, acc_id = 0, name = "", camp = 0, career = 0, race = 0, sex = 0, head = 0}).
%%
-record(r_player_change_prop_req, {uid, add, multi, add_del, multi_del}).
%%
-record(r_player_stop_move_req, {uid, pos}).
%%
-record(r_exit_map_req,{uid = 0, map_id = 0, line_id=0, map_pid}).
%%
-record(r_change_map_req,{
    uid = 0, name, group =0, pid,
    map_id = 0, line_id = 0, map_pid,
    tar_map_id = 0, tar_line_id = 0, tar_pos, force=false
}).
%%
-record(r_change_map_ack,{map_id = 0, line_id = 0, pos, map_pid, error = 0}).
%%
-record(r_teleport_req,{uid = 0, map_pid, tar}).
%%
-record(r_player_start_move_req,{uid = 0, tar}).
%%
-record(r_player_use_skill_req,{uid=0, skill_id=0, tar=0, pos, serial=0}).
-record(r_player_add_buff_req,{uid=0, src_uid=0, buff_id=0, level=1}).






-endif.
