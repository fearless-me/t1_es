%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%       这仅仅是个例子,这得策划说了算
%%% @end
%%% Created : 22. 五月 2018 17:32
%%%-------------------------------------------------------------------
-module(mod_combat).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("map_core.hrl").
-include("combat.hrl").
-include("rec_rw.hrl").
-include("cfg_skill.hrl").


%% 吟唱技能会有一个施放过程，其余全是瞬发技能
%% API
-export([
    use_skill/4
]).

-export([
    is_using_skill/1,
    is_in_battle/1
]).


is_using_skill(Aer) ->
    false.

is_in_battle(Aer) ->
    object_state:in_battle(Aer).

use_skill(Aer, DerList, SkillId, Serial) -> ok.
