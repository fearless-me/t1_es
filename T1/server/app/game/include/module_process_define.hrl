%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 十一月 2018 14:29
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(MODULE_DEFINE_HRL__).
-define(MODULE_DEFINE_HRL__, true).

-define(MODULE_START, 1).
%% 地图进程模块
-define(MODULE_MAP_PROCESS, 1).
%% 玩家进程模块
-define(MODULE_PLAYER_PROCESS, 2).
-define(MODULE_END, 2).

-type module_type()::?MODULE_START..?MODULE_END.
-export_type([module_type/0]).


-endif. % MODULE_DEFINE_HRL__