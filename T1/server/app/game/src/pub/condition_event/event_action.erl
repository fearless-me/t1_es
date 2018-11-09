%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 10:26
%%%-------------------------------------------------------------------
-module(event_action).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("condition_event.hrl").
-include("gs_common_rec.hrl").
%%-include("cfg_conditional_event.hrl").

%% API
-export([action/2]).

action(Event, OriginalParams) ->
    RealParams = filter_params(Event, OriginalParams),
    do_action(Event, RealParams).

%%-------------------------------------------------------------------
%% 1.调用目标：1.自己 2.目标
%% 2.属性类型：1.生命值
%% 3.千分比（int）
%% 4.常数（int）
%% 5.伤害类型： 1.伤害 2.治疗
do_action([?EVENT_DAMAGE, ?EVENT_DAMAGE_SUB_PERCENT, P1, P2, P3, P4, P5], [Aer, Der]) ->
    Tar = ?if_else(P1 == ?TARGET_SELF, Aer, Der),
    Val = player_interface:get_attr(Tar, P2),
    LastValue = Val * P3 / 1000 + P4,
    case P5 of
        1 -> combat_interface:event_damage(Aer, Tar, LastValue);
        2 -> combat_interface:event_heal(Aer, Tar, LastValue)
    end,
    ok;

%%1.添加BUFF
%%主类型	1_BUFF相关
%%子类型	0_添加BUFF
%%对象	选项	int	0自身 1目标
%%添加ID	填写值	int	填 BUFF ID啊
%%添加时长	填写值	int	0或null则按照原buff配置时长添加
%%Layer	填写值	int	添加层数，无法超过目标BUFF配置最大层数
%%免疫鉴定	选项	Bool	0判断免疫 1无视免疫			*这条和Immune之间的冲突我再想想
do_action([?EVENT_BUFF, ?EVENT_BUFF_SUB_ADD, P1, P2, P3, P4, P5], [Aer, Der]) ->
    Tar = ?if_else(P1 == ?TARGET_SELF, Aer, Der),
    Req = #r_player_add_buff_req{
        uid = Tar, src_uid = Aer, buff_id = P2, lifetime = P3,
        layer = P4, skip_immune = misc:i2b(P5)
    },
    player_interface:add_buff_(Tar, Req),
    ok;

%%2.移除BUFF
%%主类型	1_BUFF相关
%%子类型	1_删除BUFF
%%对象	选项	int	0自身 1目标
%%删除方式	选项	int	0按ID 1按正负 2按效果类 3按Group
%%方式ID	填写值	int_array	可以填写数组值，基于方式不同解读不同（比如删除多个ID，删除多个种类等）
do_action([?EVENT_BUFF, ?EVENT_BUFF_SUB_DEL, P1, P2, P3], [Aer, Der]) ->
    Tar = ?if_else(P1 == ?TARGET_SELF, Aer, Der),
    player_interface:del_buff_(Tar, P2, P3),
    ok;


do_action(_Event, _Params) -> skip.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 返回真实参数
filter_params(_Event, OriginalParams) ->
    OriginalParams.


