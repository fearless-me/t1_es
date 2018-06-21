%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:02
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(AI_DEF_HRL).
-define(AI_DEF_HRL, true).

-define(AIST_Idle,	    0).	%% 空闲状态
-define(AIST_Pursue,	1).	%% 追击状态
-define(AIST_Attack,	2).	%% 攻击状态
-define(AIST_Flee,	    3).	%% 逃跑状态
-type ai_state_type() :: ?AIST_Idle .. ?AIST_Flee.

-define(AIAT_Active,	0). %% 主动型
-define(AIAT_Passive,	1). %% 被动型
-define(AIAT_Barbett,	2). %% 炮塔型
-define(AIAT_Lamster,	3). %% 逃跑型


-endif.
