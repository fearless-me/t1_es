%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:22
%%%-------------------------------------------------------------------
-module(ai_state_idle).
-author("mawenhong").
-include("rec_rw.hrl").

%% API
-export([on_enter/1, on_exit/1, update/1, on_event/2]).

%%-------------------------------------------------------------------
on_enter(Uid) ->
    mod_ai:clear_all_enmity(Uid),
    mod_ai:reset_patrol_tick(Uid),
    mod_ai:reset_look_for_target_tick(Uid),
    object_rw:set_fields(
        Uid,
        [
            {#m_object_rw.ai_is_patrol, false},
            {#m_object_rw.ai_is_reverse_patrol, false},
            {#m_object_rw.ai_enter_combat_time, 0}
        ]
    ),
    ok.

%%-------------------------------------------------------------------
on_exit(_Uid) ->
    % todo 可能是发现目标，调用触发器事件等等
    ok.

%%-------------------------------------------------------------------
update(Uid) ->
    mod_ai:update_patrol(Uid),
    mod_ai:update_look_for_enemy(Uid),
    ok.

%%-------------------------------------------------------------------
on_event(_Uid, _Event) ->
    % 触发器事件处理
    ok.