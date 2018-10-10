%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-ifndef(GS_DB_RECORD_HRL).
-define(GS_DB_RECORD_HRL, true).
%% player
-record(p_player,{	
	aid, %%  bigint(20) unsigned
	uid, %%  bigint(20) unsigned
	sid, %%  int(11) unsigned
	name, %%  varchar(192)
	level, %%  int(11) unsigned
	wing_level, %%  int(11) unsigned
	sex, %%  tinyint(4) unsigned
	camp, %%  int(11) unsigned
	race, %%  int(11) unsigned
	career, %%  int(11) unsigned
	head, %%  int(11) unsigned
	map_id, %%  int(11) unsigned
	line, %%  int(11)
	x, %%  float
	y, %%  float
	old_map_id, %%  int(11) unsigned
	old_line, %%  int(11) unsigned
	old_x, %%  float unsigned
	old_y, %%  float unsigned
	data, %%  blob
	version %%  bigint(20) unsigned
}).
%% account
-record(p_account,{	
	aid, %% 账号唯一ID bigint(20) unsigned
	account, %% 平台AID_+平台Name生成的内部账号 varchar(128)
	account_crc, %%  bigint(11) unsigned
	plat_account, %% 平台生成的账号 varchar(255)
	plat_name, %%  char(50)
	device, %% 游戏程序存在手机上的唯一标识 char(32)
	imei, %% 安卓设备号 varchar(50)
	idfa, %% ios的号统计 varchar(50)
	mac, %% 手机mac varchar(50)
	create_time, %% 创建时间 datetime
	version_hash_code %% 客户端包版本HashCode int(11)
}).
%% serv_restart
-record(p_serv_restart,{	
	serv_id, %%  int(10) unsigned
	run_no, %%  int(10) unsigned
	latest %%  int(10) unsigned
}).
-endif.
