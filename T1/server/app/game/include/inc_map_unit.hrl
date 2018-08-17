%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:34
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(INC_MAP_UNIT_HRL).
-define(INC_MAP_UNIT_HRL, true).

%%
-define(OBJ_ERR,    0).
-define(OBJ_MIN,    1).
-define(OBJ_MON,    1).
-define(OBJ_STATIC, 2).
-define(OBJ_NPC,    3).
-define(OBJ_PET,    4).
-define(OBJ_USR,    5).
-define(OBJ_MAX,    5).
-type obj_type() :: ?OBJ_MIN .. ?OBJ_MAX.

%% 进入地图后不会变的
-record(m_map_unit, {
%% 基础相关
    uid = 0, pid = 0, did = 0, name = "", owner = 0, type = ?OBJ_ERR :: obj_type()
}).

%% 仇恨数据：仇恨目标UID， 仇恨值， 是否激活
-record(m_unit_enmity,{uid=0,enmity=0,active=true}).

-endif.