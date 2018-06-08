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

%% 进入地图后不会变的
-record(m_map_obj, {
%% 基础相关
    uid = 0, pid = 0, did = 0, name = "", owner = 0, type = ?OBJ_ERR :: obj_type()
}).


-endif.