%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. 十一月 2018 15:49
%%%-------------------------------------------------------------------
-module(mod_combat_filter).
-author("tiancheng").

-include("cfg_skill.hrl").
-include("rec_rw.hrl").

%% API
-export([
    filter/3,
    get_targets/1
]).

%% 过滤目标对象
-spec filter(AttackUid::integer(), [integer(), ...], #skillCfg{}) ->
    {#m_object_rw{}, [#m_object_rw{}, ...]} | ErrorCode when ErrorCode :: integer().
filter(_, [], #skillCfg{}) ->
    -1;
filter(undefined, _, #skillCfg{}) ->
    -1;
filter(#m_object_rw{} = Attacker, [#m_object_rw{}|_] = TargetList, #skillCfg{} = _SkillCfg) ->
    {Attacker, TargetList};
filter(AttackUid, TargetList, #skillCfg{} = SkillCfg) ->
    filter(object_rw:get(AttackUid), get_targets(TargetList), SkillCfg).

get_targets([]) -> [];
get_targets([0]) -> [];
get_targets(TargetList) ->
    F =
        fun(Der, Acc) ->
            case object_rw:get(Der) of
                undefined ->
                    Acc;
                #m_object_rw{} = Obj ->
                    [Obj | Acc]
            end
        end,
    lists:foldl(F, [], TargetList).