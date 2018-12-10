%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十二月 2018 15:14
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(MAP_PROGRESS_PRIVATE_HRL__).
-define(MAP_PROGRESS_PRIVATE_HRL__, true).

%% 事件类型
%% 与其它任何事件都不兼容，也不打断
-define(PROGRESS_TYPE_KERNEL, 1).
%% 其它事件类型相互之间全部互斥
-define(PROGRESS_TYPE_SPELL_SKILL, 2).
-define(PROGRESS_TYPE_GATHER, 3).
-define(PROGRESS_TYPE_USE_ITEM, 4).

%% 进度阶段
-define(PROGRESS_PHASE_START, 1).
-define(PROGRESS_PHASE_BREAK, 2).
-define(PROGRESS_PHASE_HIT, 3).
-define(PROGRESS_PHASE_HIT_AND_END, 4).

%% 进度打断条件
-define(PROGRESS_BREAK_CONDITION_MOVE, 1).
-define(PROGRESS_BREAK_CONDITION_DEAD, 2).

-record(m_progress_func, {
    phase = 0,
    func = undefined,
    params::#{}
}).

-record(m_progress_details, {
    flag_id = 0, %% 一个随机标识ID
    object_uid = 0,   %% 进度主体
    object_param = 0,
    progress_type = ?PROGRESS_TYPE_KERNEL,
    break_condition = [],
    next_node_time = 0,
    node_time_list = [],
    times = 0,  %% 触发次数
    all_times = 0,
    broadcast_client = true,
    trigger_list = [] :: [#m_progress_func{}, ...]
}).

-record(m_progress_main, {
    src_uid,    %% 发起进度的对象
    progress_list = [] :: [#m_progress_details{}, ...]
}).

-endif. % MAP_PROGRESS_PRIVATE_HRL__