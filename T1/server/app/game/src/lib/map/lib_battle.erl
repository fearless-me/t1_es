%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%       这仅仅是个例子,这得策划说了算
%%% @end
%%% Created : 22. 五月 2018 17:32
%%%-------------------------------------------------------------------
-module(lib_battle).
-author("mawenhong").
-include("logger.hrl").
-include("common_record.hrl").
-include("map_unit.hrl").

%% API
-export([
    dispatcher/5, player_use_skill/4,
    player_vs_player/3, player_vs_mon/3, mon_vs_player/3,
    change_attr/1, change_attr/3, change_attr/5,
    add_buff/3, can_ai_use_skill/1
]).

player_use_skill(Aer, Der, SkillId, Serial) ->
    lib_ai_rw:set_skill_serial(Aer, Serial),
    ?DEBUG("~p use skill ~p tar ~p", [Aer, Der, SkillId]),
    ok.

%%-------------------------------------------------------------------
dispatcher(?OBJ_USR, ?OBJ_USR, Aer, Der, SkillId)->
    player_vs_player(Aer, Der, SkillId);
dispatcher(?OBJ_USR, ?OBJ_MON, Aer, Der, SkillId)->
    player_vs_mon(Aer, Der, SkillId);
dispatcher(?OBJ_MON, ?OBJ_USR, Aer, Der, SkillId)->
    mon_vs_player(Aer, Der, SkillId);
dispatcher(AType, DType, Aer, Der, SkillId)->
    ?WARN("~p(~p) vs ~p(~p) skill",[Aer, AType, Der, DType, SkillId]).


%%-------------------------------------------------------------------
player_vs_player(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.

%%-------------------------------------------------------------------
player_vs_mon(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.

%%-------------------------------------------------------------------
mon_vs_player(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.


can_ai_use_skill(_Aer) ->
    true.


%%-------------------------------------------------------------------
change_attr(#r_player_change_prop_req{
    uid = Uid,
    add = AddList, multi = MultiList,
    add_del = AddList_Del, multi_del = MultiList_Del
}) ->
    change_attr_action(Uid, AddList, MultiList, AddList_Del, MultiList_Del),
    ok.

%%-------------------------------------------------------------------
add_buff(_Uid, _BuffId, _SrcUid) ->

    ok.
%%-------------------------------------------------------------------
change_attr(Uid, AddList, MultiList) ->
    change_attr_action(Uid, AddList, MultiList, [], []),
    ok.

change_attr(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    change_attr_action(Uid, AddList, MultiList, AddList_Del, MultiList_Del),
    ok.

change_attr_action(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    PropList = lib_unit_rw:get_attr(Uid),
    lib_attr_calc:calc(PropList, AddList, MultiList, AddList_Del, MultiList_Del),
    ok.

