%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("Hello World").

-ifndef(DB_TABLE_RECORD_HRL).
-define(DB_TABLE_RECORD_HRL, true).


-define(DB_RECORD_VERSION, 1544583283).

%% t1_data.player
%% aid bigint(20) unsigned "" DEFAULT "" COMMENT "" KEY MUL
%% uid bigint(20) unsigned "" DEFAULT "" COMMENT "" KEY PRI
%% sid int(11) unsigned "" DEFAULT "" COMMENT "" KEY ""
%% name varchar(192) "" DEFAULT "" COMMENT "" KEY ""
%% level int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% wing_level int(11) unsigned "" DEFAULT 0 COMMENT "" KEY ""
%% sex tinyint(4) unsigned "" DEFAULT 0 COMMENT "" KEY ""
%% camp int(11) unsigned "" DEFAULT 0 COMMENT "" KEY ""
%% race int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% career int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% head int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% map_id int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% line int(11) "" DEFAULT 0 COMMENT "" KEY ""
%% x float "" DEFAULT 100 COMMENT "" KEY ""
%% y float "" DEFAULT 100 COMMENT "" KEY ""
%% old_map_id int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% old_line int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% old_x float unsigned "" DEFAULT 100 COMMENT "" KEY ""
%% old_y float unsigned "" DEFAULT 100 COMMENT "" KEY ""
%% delete_flag int(10) unsigned "" DEFAULT 0 COMMENT "" KEY ""
%% delete_time int(10) unsigned "" DEFAULT 0 COMMENT "" KEY ""
%% data blob "" DEFAULT "" COMMENT "" KEY ""
%% version bigint(20) unsigned "" DEFAULT "" COMMENT "" KEY ""
-record(p_player,{
	aid=0,uid=undefined,sid=0,name="",level=1,wing_level=0,sex=0,camp=0,
	race=1,career=1,head=1,map_id=1,line=0,x=0.0,y=0.0,old_map_id=1,old_line=1,
	old_x=0.0,old_y=0.0,delete_flag=0,delete_time=0,data= <<>>,version=0
}).


%% t1_account.account
%% aid bigint(20) unsigned "" DEFAULT "" COMMENT 账号唯一ID KEY PRI
%% account varchar(128) "" DEFAULT "" COMMENT 平台AID_+平台Name生成的内部账号 KEY UNI
%% account_crc bigint(11) unsigned "" DEFAULT "" COMMENT "" KEY MUL
%% plat_account varchar(255) "" DEFAULT "" COMMENT 平台生成的账号 KEY ""
%% plat_name char(50) "" DEFAULT "" COMMENT "" KEY ""
%% device char(32) "" DEFAULT "" COMMENT 游戏程序存在手机上的唯一标识 KEY ""
%% imei varchar(50) "" DEFAULT "" COMMENT 安卓设备号 KEY ""
%% idfa varchar(50) "" DEFAULT "" COMMENT ios的号统计 KEY ""
%% mac varchar(50) "" DEFAULT "" COMMENT 手机mac KEY ""
%% create_time datetime "" DEFAULT "" COMMENT 创建时间 KEY ""
%% version_hash_code int(11) "" DEFAULT 0 COMMENT 客户端包版本HashCode KEY ""
-record(p_account,{
	aid=undefined,account="",account_crc=0,plat_account="",plat_name="",device="",imei="",idfa="",
	mac="",create_time="1970-01-01 00:00:00",version_hash_code=0
}).


%% t1_public.serv_restart
%% serv_id int(10) unsigned "" DEFAULT "" COMMENT "" KEY PRI
%% run_no int(10) unsigned "" DEFAULT "" COMMENT "" KEY ""
%% latest int(10) unsigned "" DEFAULT "" COMMENT "" KEY ""
-record(p_serv_restart,{
	serv_id=undefined,run_no=0,latest=0
}).

-endif.
