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
-include("rec_rw.hrl").

%% API
-export([action/3]).

action(Event, OriginalParams, CEParams) ->
    RealParams = filter_params(Event, OriginalParams),
    do_action(Event, RealParams, CEParams).

%%-------------------------------------------------------------------
%% [伤害， 属性伤害， 属性来源， 属性ID， 万分比， 常数， 结果类型]
do_action([?EVENT_DAMAGE, ?EVENT_DAMAGE_SUB_PROP, ?TARGET_SELF, PropID, Percent, Const, ResultType],
    [Attack, Target], CEParams) ->
    event_action_logic:event_damage_sub_prop(CEParams, Attack, Target, Attack,
        PropID, Percent, Const, ResultType);
do_action([?EVENT_DAMAGE, ?EVENT_DAMAGE_SUB_PROP, ?TARGET_OTHER, PropID, Percent, Const, ResultType],
    [Attack, Target], CEParams) ->
    event_action_logic:event_damage_sub_prop(CEParams, Attack, Target, Target,
        PropID, Percent, Const, ResultType);
do_action([?EVENT_DAMAGE, ?EVENT_DAMAGE_SUB_FIX_FORMULA, ?TARGET_SELF, PropID, Percent, Const, ResultType],
    [Attack, _Target], _CEParams) ->
    ?ERROR("no realize EVENT_DAMAGE_SUB_FIX_FORMULA"),
    ok;
do_action([?EVENT_DAMAGE, ?EVENT_DAMAGE_SUB_FIX_FORMULA, ?TARGET_OTHER, PropID, Percent, Const, ResultType],
    [Attack, Target], _CEParams) ->
    ?ERROR("no realize EVENT_DAMAGE_SUB_FIX_FORMULA"),
    ok;

%%-------------------------------------------------------------------
%% [添加BUFF， 对象， BuffID， 添加BUFF时长， 添加BUFF层数， 免疫判定]
do_action([?EVENT_ADD_BUFF, Target, BuffID, Millisecond, Layer, Immune],
    [#m_object_rw{uid = Uid1}, #m_object_rw{uid = Uid2}], _CEParams) ->
    ?ERROR("no realize EVENT_ADD_BUFF"),
%%    TargetUid =
%%        case Target of
%%            ?TARGET_SELF -> Uid1;
%%            _ -> Uid2
%%        end,
%%
%%    Req = #r_player_add_buff_req{
%%        uid   = TargetUid, src_uid = Uid1, buff_id = BuffID, lifetime = Millisecond,
%%        layer = Layer, skip_immune = misc:i2b(Immune)
%%    },
%%    player_interface:add_buff_(TargetUid, Req),
    ok;

%% [移除BUFF， 对象， BUFF区分类型， 参数]
do_action([?EVENT_DEL_BUFF, Target, P2, P3], [#m_object_rw{uid = Uid1}, #m_object_rw{uid = Uid2}], _CEParams) ->
    ?ERROR("no realize EVENT_DEL_BUFF"),
%%    TargetUid =
%%        case Target of
%%            ?TARGET_SELF -> Uid1;
%%            _ -> Uid2
%%        end,
%%
%%    player_interface:del_buff_(TargetUid, P2, P3),
    ok;

%%-------------------------------------------------------------------
do_action(Event, _Params, _CEParams) ->
    ?WARN("no realize action:~p", [Event]),
    skip.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 返回真实参数
filter_params(_Event, OriginalParams) ->
    OriginalParams.
