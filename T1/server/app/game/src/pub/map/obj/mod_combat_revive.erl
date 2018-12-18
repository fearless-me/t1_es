%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 十二月 2018 11:45
%%%-------------------------------------------------------------------
-module(mod_combat_revive).
-author("tiancheng").

-include("battle_prop.hrl").
-include("logger.hrl").
-include("netmsg.hrl").

%% API
-export([
	is_dead/1,
	dead/2,
	request_revive/1
]).

request_revive(Uid) ->
	Bp = object_rw:get_battle_props(Uid),
	Hp = prop_interface:query_v_pf_bpu(?BP_2_HP_CUR, Bp),
	case Hp =< 0 of
		true ->
			MaxHp = prop_interface:query_v_pf_bpu(?BP_2_HP_MAX, Bp),

			object_rw:set_hp(Uid, MaxHp),

			Msg = #pk_GS2U_SyncHp{
				uid = Uid,
				hp_percent = player_interface:get_hp_percent(1, 1)
			},

			mod_view:send_net_msg_to_visual(Uid, Msg),
			ok;
		_ ->
			skip
	end,
	ok.

dead(KillerUid, TargetUid) ->
	?INFO("~p kill ~p", [KillerUid, TargetUid]),

	KillerName = object_rw:get_name(KillerUid),
	Msg = #pk_GS2U_Dead{
		uid = TargetUid,
		killer_uid = KillerUid,
		killer_name = KillerName
	},

	mod_view:send_net_msg_to_visual(TargetUid, Msg),
	ok.

is_dead(#m_battleProps{} = Bp) ->
	prop_interface:query_v_pf_bpu(?BP_2_HP_CUR, Bp) =< 0;
is_dead(Uid) when erlang:is_integer(Uid) ->
	is_dead(object_rw:get_battle_props(Uid));
is_dead(_) ->
	true.