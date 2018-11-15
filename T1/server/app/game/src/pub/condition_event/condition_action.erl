%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 10:25
%%%-------------------------------------------------------------------
-module(condition_action).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("condition_event.hrl").
%%-include("cfg_conditional_event.hrl").

%% API
-export([check/2]).


check(Condition, OriginalParams) ->
    RealParams = filter_params(Condition, OriginalParams),
    check_action(Condition, RealParams).



%%    [{逻辑关系，主分类，分类的ID，参数1，参数2，参数3}]
%%-------------------------------------------------------------------
%% 参数1：	对象	1.自身 2.目标
%% 参数2：	百分比（float）
%% 参数3：	逻辑	1.等于 2.大于 3.小于
check_action([_1, ?CONDITION_PLAYER, ?CONDITION_PLAYER_SUB_HP_PERCENT, P1, P2, P3], [Aer, Der]) ->
    Tar = ?if_else(P1 == ?TARGET_SELF, Aer, Der),
    Percent = player_interface:get_hp_percent(Tar),
    condition_op:op(P2, Percent, P3);

%%-------------------------------------------------------------------
%% 参数1：	对象	1.自身 2.目标
%% 参数2：	值（int）
%% 参数3：	逻辑	1.等于 2.大于 3.小于
check_action([_1, ?CONDITION_PLAYER, ?CONDITION_PLAYER_SUB_HP, P1, P2, P3], [Aer, Der]) ->
    Tar = ?if_else(P1 == ?TARGET_SELF, Aer, Der),
    Hp = player_interface:get_hp(Tar),
    condition_op:op(P2, Hp, P3);
%%
%%是否有BUFF
%%主类型	1_BUFF类
%%子类型	0_存在性
%%区分类型	选项	int	0按ID 1按正负 2按效果 3按GroupID
%%类型参数	填写值	int	填各种id就完了
%%判断逻辑	选项	Bool	0存在 1不存在
%%判断对象	选项	int	0目标 1自身
check_action([_1,?CONDITION_BUFF_HAS, P1, P2, P3, P4], [Aer, Der]) ->
    Tar = ?if_else(P4 == ?TARGET_SELF, Aer, Der),
    Exists = player_interface:has_buff(Tar, P1, P2),
    condition_op:op(?LOGIC_EQ, misc:i2b(P3), Exists);

%%检查BUFF时间
%%主类型	1_Buff
%%子类型	1_时间
%%检查的ID	填写值	int	填BUFFid
%%判断目标	选项	int	0自身 1目标
%%判断逻辑   逻辑操作,大于、等于(?LOGIC_**)..
%%判断值 	填写值	int	填ms值吧
check_action([_1, ?CONDITION_BUFF_CHECK_TIME, P1, P2, P3, P4], [Aer, Der]) ->
    Tar = ?if_else(P2 == ?TARGET_SELF, Aer, Der),
    Hp = player_interface:get_buff_time(Tar, P1),
    condition_op:op(P3, Hp, P4);


%%-------------------------------------------------------------------
check_action(_Condition, _Params) -> false.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 返回真实参数
filter_params(_Event, OriginalParams) ->
    OriginalParams.



