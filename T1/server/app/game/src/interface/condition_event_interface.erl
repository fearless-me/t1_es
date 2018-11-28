%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 十一月 2018 14:24
%%%-------------------------------------------------------------------
-module(condition_event_interface).
-author("tiancheng").

-include("condition_event.hrl").
-include("module_process_define.hrl").

%% API
-export([
    init_self_ce_param/1,
    init_ce_param/2,
    get_ce_sp/1,
    get_ce_mt/1
]).

%% init condition param
-spec init_self_ce_param(ModuleProcessType::module_type()) -> map().
init_self_ce_param(ModuleProcessType) ->
    init_ce_param(self(), ModuleProcessType).

-spec init_ce_param(Pid::pid(), ModuleProcessType::module_type()) -> map().
init_ce_param(Pid, ModuleProcessType) ->
    #{?CONDITION_EVENT_PARAMS_SP => Pid, ?CONDITION_EVENT_PARAMS_MPT => ModuleProcessType}.

get_ce_sp(#{?CONDITION_EVENT_PARAMS_SP := Pid}) -> Pid.

get_ce_mt(#{?CONDITION_EVENT_PARAMS_MPT := ModuleType}) -> ModuleType.