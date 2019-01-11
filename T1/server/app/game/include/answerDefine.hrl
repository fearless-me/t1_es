%%%-------------------------------------------------------------------
%%% @author chenlongchuan
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 十一月 2017 10:57
%%%-------------------------------------------------------------------
-author("chenlongchuan").


-define(Ets_RoleAnswerInfo, anserinfo_).

%答题中心服 数据
-record(recRoleAnswerInfo,{
	roleID = 0,
	severID = 0,
	pid = undefined,
	netPid = undefined,
	roleName = ""     ::string(),      %%角色名字
	race			= 0, %% 玩家种族
	career          = 0, %% 职业
	sex				= 0, %% 性别
	level           = 0, %% 等级
	head            = 0  %%头像
}).
