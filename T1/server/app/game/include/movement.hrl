%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2018 15:23
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(GS_MOVEMENT_INC_HRL).
-define(GS_MOVEMENT_INC_HRL, true).

% @doc 怪物三种移动状态主要用来设置不同的速度
% 
-define(EMS_STAND, 0).            %% 站立
-define(EMS_WALK, 1).            %% 行走
-define(EMS_MONSTER_PATROL, 2).            %% 怪物巡逻
-define(EMS_MONSTER_WALK, 3).            %% 怪物行走
-define(EMS_MONSTER_FLEE, 4).            %% 怪物逃跑
-type move_state() :: ?EMS_STAND .. ?EMS_MONSTER_FLEE.


-define(ESMT_REPEL, 0).    %% 击退
-define(ESMT_ASSAULT, 1).    %% 冲锋
-define(ESMT_TELEPORT, 2).    %% 瞬移
-define(ESMT_PULL, 3).  %% 拖拽
-type special_move() :: ?ESMT_REPEL .. ?ESMT_PULL.


-define(ENR_FAILED, 0).                %% 调用失败，可能是上层逻辑有问题
-define(ENR_ARRIVE, 1).                %% 到达终点
-define(ENR_BLOCKING, 2).                %% 被挡住
-define(ENR_TOBECONTINUED, 3).        %% 可以继续碰撞
-type nav_result() :: ?ENR_FAILED .. ?ENR_TOBECONTINUED.

-record(m_move_pos, {dist = 0, speed = 1, start_pos, end_pos, dir}).

%% 当前时间,上次更新时间，两次更新时间的时间差
-record(m_move_timer, {now, latest_up, delta}).


-endif.
