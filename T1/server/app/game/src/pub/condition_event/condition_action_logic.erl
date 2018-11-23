%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 十一月 2018 11:08
%%%-------------------------------------------------------------------
-module(condition_action_logic).
-author("tiancheng").

-include("battle_prop.hrl").
-include("condition_event.hrl").

%% API
-export([
    condition_player_prop/4,
    condition_buff_has/4
]).


condition_player_prop(Uid, PropID, Logic, Value) ->
    case object_rw:get_battle_props(Uid) of
        #m_battleProps{listBPFinal = ListBPFinal} ->
            case lists:keyfind(PropID, 1, ListBPFinal) of
                false ->
                    false;
                {_, _, HaveValue} ->
                    condition_op:op(HaveValue, Logic, Value)
            end;
        _ ->
            false
    end.

condition_buff_has(Uid, Cbh, BuffID, ExistOr) ->
    Exists = player_interface:has_buff(Uid, Cbh, BuffID),
    Logic =
        case ExistOr of
            ?EXIST -> ?LOGIC_EQ;
            ?NOT_EXIST -> ?LOGIC_NE
        end,
    condition_op:op(Logic, true, Exists).