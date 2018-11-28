%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 19:37
%%%-------------------------------------------------------------------
-module(mod_map_condition_event).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("combat.hrl").

%% API
-export([on_event/1]).

on_event({event_damage, SrcUid, DstUid, Value}) ->
    HpMsg = #pk_GS2U_HPChange{
        uid = DstUid, src_uid = SrcUid, cause = ?HP_CHANGE_EVENT, hp_change = -Value
    },
    mod_view:send_net_msg_to_visual(DstUid, HpMsg);
on_event({event_heal, SrcUid, DstUid, Value}) ->
    HpMsg = #pk_GS2U_HPChange{
        uid = DstUid, src_uid = SrcUid, cause = ?HP_CHANGE_EVENT, hp_change = Value
    },
    mod_view:send_net_msg_to_visual(DstUid, HpMsg);
on_event(Msg) ->
    ?ERROR("on deal condition event ~p", [Msg]).

