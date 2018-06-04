%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2018 15:23
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(MOVEMENT_HRL).
-define(MOVEMENT_HRL, true).


-define(EMS_STAND,          0).		    %% 站立
-define(EMS_WALK,           1).		    %% 行走
-define(EMS_JUMP,           2).		    %% 跳跃
-define(EMS_DROP,           3).		    %% 下落
-define(EMS_VDROP,          4).		    %% 垂直下落
-define(EMS_SLIDE,          5).		    %% 滑落
-define(EMS_SWIM,           6).		    %% 游泳
-define(EMS_SWIM_STAND,     7).			%% 游泳漂浮状态
-define(EMS_MONSTER_PATROL, 8).			%% 怪物巡逻
-define(EMS_MONSTER_WALK,   9).			%% 怪物行走
-define(EMS_MONSTER_FLEE,   10).			%% 怪物逃跑
-type move_state() :: ?EMS_STAND .. ?EMS_MONSTER_FLEE.


-define(ESMT_REPEL,    0).	%% 击退
-define(ESMT_ASSAULT,  1).	%% 冲锋
-define(ESMT_TELEPORT, 2).	%% 瞬移
-define(ESMT_PULL,     3).  %% 拖拽
-type special_move() :: ?ESMT_REPEL .. ?ESMT_PULL.


-define(ENR_FAILED,     0).				%% 调用失败，可能是上层逻辑有问题
-define(ENR_ARRIVE,     1).				%% 到达终点
-define(ENR_BLOCKING,   2).				%% 被挡住
-define(ENR_WILLDROP,   3).				%% 将掉落
-define(ENR_WILLVDROP,  4).				%% 将垂直掉落
-define(ENR_WILLSLIDE,  5).				%% 将滑落
-define(ENR_WILLSWIM,   6).				%% 将游泳
-define(ENR_WILLCARRY,  7).				%% 将着陆到载具上
-define(ENR_WILLONWATER,8).			    %% 将水上站立
-define(ENR_LANDED,     9).				%% 跳跃着陆
-define(ENR_SWIMLANDED, 10).			%% 游泳搁浅
-define(ENR_CARRYLANDED,11).			%% 乘载着陆
-define(ENR_TOBECONTINUED,  12).		%% 可以继续碰撞
-type nav_result() :: ?ENR_FAILED .. ?ENR_TOBECONTINUED.

-record(r_move_pos,{ dist = 0, speed=1, start_pos, end_pos, dir}).


-endif.
