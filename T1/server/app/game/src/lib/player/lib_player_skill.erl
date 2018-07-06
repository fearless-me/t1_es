%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 六月 2018 11:56
%%%-------------------------------------------------------------------
-module(lib_player_skill).
-author("mawenhong").

%% API
-export([use_skill/2]).


%%-------------------------------------------------------------------
use_skill(SkillId, Tar) ->
    R1 = check_1(SkillId),
    R2 = check_2(R1, SkillId),
    ok = do_use_skill(R2, SkillId, Tar),
    ok.

%%-------------------------------------------------------------------
do_use_skill(true, _SkillId, _Tar) ->
    ok;
do_use_skill(ErrAndFalse, _SkillId, _Tar) ->
    ErrAndFalse.

%%-------------------------------------------------------------------
check_1(_SkillId)->
    true.

check_2(true, _SkillId) ->
    true;
check_2(ErrAndFalse, _SkillId) ->
    ErrAndFalse.



