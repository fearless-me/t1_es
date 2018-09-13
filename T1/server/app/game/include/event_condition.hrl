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
%% 事件上下文限定
-define(EVENT_SYSTEM, 1).
-define(EVENT_MAP, 2).
-define(EVENT_PLAYER, 3).

%% 事件主类型
-define(EVENT_MAIN_RESERVE, 1).

%% 事件子类型
-define(EVENT_SUB_RESERVE, 1).


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 条件上下文限定
-define(CONDITION_SYSTEM, 1).
-define(CONDITION_MAP, 2).
-define(CONDITION_PLAYER, 3).

%% 条件主类型
-define(CONDITION_MAIN_RESERVE, 1).

%% 条件子类型
-define(CONDITION_SUB_RESERVE, 1).




-endif.
