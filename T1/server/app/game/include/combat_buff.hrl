%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 十一月 2018 15:29
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(COMBAT_BUFF_HRL__).
-define(COMBAT_BUFF_HRL__, true).

-define(BUFF_FOREVER_LOGIC, 2147483647).
-record(m_buff, {buff_id = 0, lifetime = 0, level = 1, layer = 1, source = 0, latest=0}).

%%-------------------------------------------------------------------
%% buff类型
%%-------------------------------------------------------------------

%% 增益buff
-define(BUFF_ENBUFF, 0).
%% 减益buff
-define(BUFF_DEBUFF, 1).
-define(BUFF_UNKNOWN,2).

-define(BUFF_SOURCE_COEXIST, 0).
-define(BUFF_SOURCE_REPLACE, 1).


-define(BUFF_REMOVE_DEATH, death).
-define(BUFF_REMOVE_LEAVE_MAP, leave).


%%-------------------------------------------------------------------
-define(STATE_DEAD, 1).      %% 死亡
-define(STATE_DIZZY, 2).     %% 眩晕
-define(STATE_TIE, 3).       %% 定身
-define(STATE_SPOR, 4).      %% 昏睡
-define(STATE_INVINCIBLE, 5).%% 无敌
-define(STATE_LURK, 6).      %% 隐身


-endif. % COMBAT_BUFF_HRL__