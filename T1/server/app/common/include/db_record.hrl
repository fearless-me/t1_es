%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("Hello World").

-ifndef(DB_TABLE_RECORD_HRL).
-define(DB_TABLE_RECORD_HRL, true).

%% t1_data.player
%% aid bigint(20) unsigned '' DEFAULT '' COMMENT '' KEY MUL
%% uid bigint(20) unsigned '' DEFAULT '' COMMENT '' KEY PRI
%% sid int(11) unsigned '' DEFAULT '' COMMENT '' KEY ''
%% name varchar(192) '' DEFAULT '' COMMENT '' KEY ''
%% level int(11) unsigned '' DEFAULT 1 COMMENT '' KEY ''
%% wing_level int(11) unsigned '' DEFAULT 0 COMMENT '' KEY ''
%% sex tinyint(4) unsigned '' DEFAULT 0 COMMENT '' KEY ''
%% camp int(11) unsigned '' DEFAULT 0 COMMENT '' KEY ''
%% race int(11) unsigned '' DEFAULT 1 COMMENT '' KEY ''
%% career int(11) unsigned '' DEFAULT 1 COMMENT '' KEY ''
%% head int(11) unsigned '' DEFAULT 1 COMMENT '' KEY ''
%% map_id int(11) unsigned '' DEFAULT 1 COMMENT '' KEY ''
%% line int(11) '' DEFAULT 0 COMMENT '' KEY ''
%% x float '' DEFAULT 100 COMMENT '' KEY ''
%% y float '' DEFAULT 100 COMMENT '' KEY ''
%% old_map_id int(11) unsigned '' DEFAULT 1 COMMENT '' KEY ''
%% old_line int(11) unsigned '' DEFAULT 1 COMMENT '' KEY ''
%% old_x float unsigned '' DEFAULT 100 COMMENT '' KEY ''
%% old_y float unsigned '' DEFAULT 100 COMMENT '' KEY ''
%% data blob '' DEFAULT '' COMMENT '' KEY ''
%% version bigint(20) unsigned '' DEFAULT '' COMMENT '' KEY ''
-record(p_player, {aid, uid, sid, name, level, wing_level, sex, camp, race,
    career, head, map_id, line, x, y, old_map_id, old_line, old_x, old_y,
    data, version}).


%% t1_account.account
%% aid bigint(20) unsigned '' DEFAULT '' COMMENT 账号唯一ID KEY PRI
%% account varchar(128) '' DEFAULT '' COMMENT 平台AID_+平台Name生成的内部账号 KEY UNI
%% account_crc bigint(11) unsigned '' DEFAULT '' COMMENT '' KEY MUL
%% plat_account varchar(255) '' DEFAULT '' COMMENT 平台生成的账号 KEY ''
%% plat_name char(50) '' DEFAULT '' COMMENT '' KEY ''
%% device char(32) '' DEFAULT '' COMMENT 游戏程序存在手机上的唯一标识 KEY ''
%% imei varchar(50) '' DEFAULT '' COMMENT 安卓设备号 KEY ''
%% idfa varchar(50) '' DEFAULT '' COMMENT ios的号统计 KEY ''
%% mac varchar(50) '' DEFAULT '' COMMENT 手机mac KEY ''
%% create_time datetime '' DEFAULT '' COMMENT 创建时间 KEY ''
%% version_hash_code int(11) '' DEFAULT 0 COMMENT 客户端包版本HashCode KEY ''
-record(p_account, {aid, account, account_crc, plat_account, plat_name, device, imei, idfa, mac,
    create_time, version_hash_code}).


%% t1_public.serv_restart
%% serv_id int(10) unsigned '' DEFAULT '' COMMENT '' KEY PRI
%% run_no int(10) unsigned '' DEFAULT '' COMMENT '' KEY ''
%% latest int(10) unsigned '' DEFAULT '' COMMENT '' KEY ''
-record(p_serv_restart, {serv_id, run_no, latest}).

-endif.
