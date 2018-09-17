%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 九月 2018 14:01
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(EVENT_CONDITION_HRL).
-define(EVENT_CONDITION_HRL, true).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
-define(CONDITION_OR,  0).
-define(CONDITION_AND, 1).

%% 逻辑判断
-define(LOGIC_EQ, 1). % =
-define(LOGIC_GT, 2). % >
-define(LOGIC_LT, 3). % <
-define(LOGIC_GE, 4). % >=
-define(LOGIC_LE, 5). % =<
-define(LOGIC_NEQ,6). % !=


%%
-define(CFG_TARGET_SELF,  1).
-define(CFG_TARGET_OTHER, 2).


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 事件主类型
-define(EVENT_DAMAGE, 1).

%% 事件子类型
-define(EVENT_DAMAGE_SUB_PERCENT, 1).
-define(EVENT_DAMAGE_SUB_FIX,     2).


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 条件主类型
-define(CONDITION_PLAYER, 1).

%% 条件子类型
-define(CONDITION_PLAYER_SUB_HP_PERCENT, 1).
-define(CONDITION_PLAYER_SUB_HP,         2).




-endif.
