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
    ?DEBUG("player_use_skill ~p", [Req]),
    #r_player_use_skill_req{uid = Aer, skill_id = SkillId, tar = Der, serial = Serial} = Req,
    mod_combat:use_skill(Aer, Der, SkillId, Serial),
    ok;
on_info_msg({player_add_buff, Req}) ->
    #r_player_add_buff_req{uid = Uid, src_uid = SrcUid, buff_id = BuffId, level = Level} = Req,
    mod_buff:add_buff(Uid, BuffId, Level, SrcUid),
    ok;
on_info_msg(Info) ->
    ?DEBUG("info:~p", [Info]),
    ok.

%%-------------------------------------------------------------------
on_call_msg(Request, From) ->
    ?DEBUG("call ~p from ~p", [Request, From]),
    error.

%%-------------------------------------------------------------------
on_cast_msg(Request) ->
    ?DEBUG("cast:~p", [Request]),
    ok.
