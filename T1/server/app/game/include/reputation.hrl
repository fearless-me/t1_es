%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 爵位系统定义
%%% @end
%%% Created : 20. 一月 2015 14:14
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Reputation_hrl).
-define(Reputation_hrl, 1).

%% VIP_ID
-define(VIP_ID1, 50001).
-define(VIP_ID2, 50002).
-define(VIP_ID3, 50003).

%% 特权执行事件(需要与vip_power.erl配置表powerType对应)
-define(RepEvent_CopyMapTimes, 1).		%% 1.副本每日免费增加次数
-define(RepEvent_MallBer, 3).			%% 3.商城限购礼包购买增加倍率，使用乘法
-define(RepEvent_LotterySys, 4).		%% 4.女神扭蛋机每天免费赠送次数
-define(RepEvent_MSShop, 5).			%% 5.神秘商店新增免费刷新次数
-define(RepEvent_WildBoss, 8).			%% 8.野外首领击杀奖励增加收益次数
-define(RepEvent_WildBossHelp, 9).		%% 9.野外首领击杀奖励增加协助收益次数
-define(RepEvent_TradeOpen, 11).		%% 11.交易行是否可用

-endif. %% Reputation_hrl