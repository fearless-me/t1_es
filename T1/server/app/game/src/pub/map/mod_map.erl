%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 15:00
%%%-------------------------------------------------------------------
-module(mod_map).
-author("mawenhong").
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_common_rec.hrl").

%% API
-export([
    on_call_msg/2,
    on_cast_msg/1,
    on_info_msg/1
]).

%%-------------------------------------------------------------------
on_info_msg({player_change_combat_prop, {Uid, AddList, MultiList, AddList_Del, MultiList_Del}}) ->
    mod_combat_prop:change_combat_prop(Uid, AddList, MultiList, AddList_Del, MultiList_Del),
    ok;
on_info_msg({player_use_skill, Req}) ->
    ?DEBUG("player_use_skill ~w", [Req]),
    #r_player_use_skill_req{uid = Aer, skill_id = SkillId, tar = Der, serial = Serial} = Req,
    mod_combat:use_skill(Aer, Der, SkillId, Serial),
    ok;
on_info_msg({player_add_buff, Req}) ->
    mod_buff:add_buff(Req),
    ok;
on_info_msg({sync_player_to_map, Uid}) ->
    ?TRY_CATCH_ONLY(mod_map_sub:sync_player_to_map(Uid)),
    ok;
on_info_msg({player_del_buff, Uid, OpType, Params}) ->
    mod_buff:condition_event_del_buff(OpType, Uid, Params),
    ok;
on_info_msg(Info) ->
    ?ERROR("info:~p", [Info]),
    ok.

%%-------------------------------------------------------------------
on_call_msg(Request, From) ->
    ?ERROR("call ~p from ~p", [Request, From]),
    error.

%%-------------------------------------------------------------------
on_cast_msg(Request) ->
    ?ERROR("cast:~p", [Request]),
    ok.
