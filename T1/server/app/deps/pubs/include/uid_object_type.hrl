%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 十二月 2018 17:28
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(UID_OBJECT_TYPE_HRL__).
-define(UID_OBJECT_TYPE_HRL__, true).

%%数据库中UID的类型，取值范围为[0,31]
-define(UID_TYPE_START,     0).      %% 开始值

%%(1- 10)预留给地图对象
-define(UID_TYPE_MON, 1).
-define(UID_TYPE_NPC, 2).
-define(UID_TYPE_PET, 3).
-define(UID_TYPE_PLAYER, 4).
-define(UID_TYPE_STATIC, 5).

%%其他逻辑上需要的UID
-define(UID_TYPE_ACCOUNT,   11).      %% 账号
-define(UID_TYPE_ITEM,      12).      %% 道具
-define(UID_TYPE_MAIL,      13).      %% 邮件

%% 服务器运行时需要的
-define(UID_TYPE_TEMP,      20).      %% 队伍(临时且不保存的)

-define(UID_TYPE_END,      63).      %% 结束值

-type uid_type() :: ?UID_TYPE_START .. ?UID_TYPE_END.

-endif. % UID_OBJECT_TYPE_HRL__