%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十二月 2018 16:09
%%%-------------------------------------------------------------------
-module(player_skill).
-author("tiancheng").
%%
%%-include("object.hrl").
%%-include("logger.hrl").
%%-include("cfg_skill.hrl").
%%-include("netmsg.hrl").
%%-include("combat.hrl").
%%
%%%% API
%%-export([
%%    get_skill_info_list/0
%%]).
%%
%%get_skill_info_list() ->
%%    Career = player_rw:get_career(),
%%
%%    %% TODO 临时代码，上线初始化技能
%%    F =
%%        fun(ID, {SlotIndex, AccL}) ->
%%            #skillCfg{id = SkillID, career = C, subType = SubType, it_type = ItType, it_normal = ItNormal}
%%                = getCfg:getCfgByKey(cfg_skill, ID),
%%            case SubType of
%%                ?SKILL_SUB_TYPE_IT ->
%%                    case C =:= Career of
%%                        true ->
%%                            case ItNormal of
%%                                ?SKILL_NORMAL_TYPE ->
%%                                    {SlotIndex,
%%                                        [#pk_SkillInfo{
%%                                            skill_id = SkillID,
%%                                            level = 1,
%%                                            cd_time = 0,
%%                                            slot_index = 0
%%                                        } | AccL]};
%%                                _ ->
%%                                    {SlotIndex + 1,
%%                                        [#pk_SkillInfo{
%%                                            skill_id = SkillID,
%%                                            level = 1,
%%                                            cd_time = 0,
%%                                            slot_index = SlotIndex
%%                                        } | AccL]}
%%%%                                    case SlotIndex > 3 of
%%%%                                        false ->
%%%%                                            {SlotIndex + 1,
%%%%                                                [#pk_SkillInfo{
%%%%                                                    skill_id = SkillID,
%%%%                                                    level = 1,
%%%%                                                    cd_time = 0,
%%%%                                                    slot_index = SlotIndex
%%%%                                                } | AccL]};
%%%%                                        _ ->
%%%%                                            {SlotIndex, AccL}
%%%%                                    end
%%                            end;
%%                        _ ->
%%                            {SlotIndex, AccL}
%%                    end;
%%                _ ->
%%                    {SlotIndex, AccL}
%%            end
%%        end,
%%    case lists:foldl(F, {1, []}, getCfg:get1KeyList(cfg_skill)) of
%%        {_, []} ->
%%            ?ERROR("role no skill:~p,~p", [player_rw:get_uid(), Career]),
%%            [];
%%        {_, SkillList} ->
%%            SkillList
%%    end.