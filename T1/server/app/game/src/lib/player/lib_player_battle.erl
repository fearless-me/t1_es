%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 14:44
%%%-------------------------------------------------------------------
-module(lib_player_battle).
-author("mawenhong").
-include("logger.hrl").
-include("mem_record.hrl").
-include("common_record.hrl").

%% API
-export([use_skill/4]).
-export([change_attr/2, change_attr/4]).


%%-------------------------------------------------------------------
use_skill(SkillId, Tar, Pos, Serial) ->
    R1 = check_cd(SkillId),
    R2 = check_cost(R1, SkillId),
    R3 = check_skill(R2, SkillId),
    R4 = check_target(R3, SkillId, Tar),
    ok = do_use_skill(R4, SkillId, Tar, Pos, Serial),
    ok.

%%-------------------------------------------------------------------
do_use_skill(true, SkillId, Tar, Pos, Serial) ->
    Uid = lib_player_rw:get_uid(),
    Msg = #r_player_use_skill_req{
        uid = Uid, skill_id = SkillId, tar = Tar, pos = Pos, serial = Serial},
    lib_player_map_priv:teleport_call(Pos),
    lib_player_pub:send_map_msg_(player_use_skill, Msg),
    ok;
do_use_skill(ErrAndFalse, _SkillId, _Tar, _Pos, _Serial) ->
    %% todo 发送错误消息
    ErrAndFalse.

%%-------------------------------------------------------------------
check_cd(_SkillId)->
    true.

check_cost(true, _SkillId) ->
    true;
check_cost(ErrAndFalse, _SkillId) ->
    ErrAndFalse.

check_skill(true, _SkillId) ->
    true;
check_skill(ErrAndFalse, _SkillId) ->
    ErrAndFalse.

check_target(true, _SkillId, _Tar) ->
    ok;
check_target(ErrAndFalse, _SkillId, _Tar) ->
    ErrAndFalse.


%%-------------------------------------------------------------------
change_attr(AddList, MultiList) ->
    change_attr(AddList, MultiList, [], []),
    ok.

change_attr(AddList, MultiList, AddList_Del, MultiList_Del) ->
    Uid = lib_player_rw:get_uid(),
    #m_player_map{map_pid = Pid} =lib_player_rw:get_map(),
    map_pub:player_change_attr_(
        Pid,
        #r_player_change_prop_req{
            uid = Uid, add = AddList,
            multi = MultiList, add_del = AddList_Del, multi_del = MultiList_Del
        }
    ),
    ok.