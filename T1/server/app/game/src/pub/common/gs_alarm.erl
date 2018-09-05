%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 八月 2018 11:20
%%%-------------------------------------------------------------------
-module(gs_alarm).
-include("pub_def.hrl").
-include("gs_common_rec.hrl").
-include("gs_mem_rec.hrl").

%% API
-export([init/0]).

-define(ETS_ALARM_POLICY, ets_alarm_policy).
-define(ETS_ALARM_PLAYER, ets_alarm_player).

init() ->
    ets:new(?ETS_ALARM_POLICY, [protected, set, named_table, {keypos, #m_alarm_policy.id}, ?ETS_RC, ?ETS_WC]),
    ets:new(?ETS_ALARM_PLAYER, [protected, set, named_table, {keypos, #m_alarm_player.uid}, ?ETS_RC, ?ETS_WC]),
    ok.
