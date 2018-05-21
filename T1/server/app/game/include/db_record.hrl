%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 五月 2018 10:14
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(DB_RECORD_HRL).
-define(DB_RECORD_HRL, true).

%%全国唯一账号表
-record(p_account,{
    accountID = 0,				%%账号唯一ID bigint(20) unsigned
    account = "",				%%平台AID_+平台Name生成的内部账号 varchar(255)
    platformAID = "",				%%平台生成的账号ID varchar(255)
    platformAccount = "",				%%平台生成的账号 varchar(255)
    platformAccountCrc = 0,				%%平台生成的账号 Crc bigint(20) unsigned
    platformName = "",				%%平台名 char(50)
    fgi = 0,				%%平台发的平台id int(1) unsigned
    nickName = "",				%%玩家输入的账号 varchar(50)
    deviceId = "",				%%游戏程序存在手机上的唯一标识 char(32)
    imei = "",				%%安卓设备号 varchar(50)
    idfa = "",				%%ios的号统计 varchar(50)
    mac = "",				%%手机mac varchar(50)
    createTime = 0,				%%创建时间 datetime
    versionPackageHash = 0,				%%客户端包版本HashCode int(11)
    channelAccountID = ""				%%渠道账号ID，主要用于渠道方通过GM后台提供的API查询角色信息 varchar(255)
}).


-endif.
