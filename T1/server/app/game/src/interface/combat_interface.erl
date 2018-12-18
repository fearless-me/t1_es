%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 17:59
%%%-------------------------------------------------------------------
-module(combat_interface).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_cache.hrl").
-include("cfg_skill.hrl").

%% API
-export([
    get_skill_cfg/1
]).

get_skill_cfg(0) -> undefined;
get_skill_cfg(SkillId) ->
    case getCfg:getCfgByArgs(cfg_skill, SkillId) of
        #skillCfg{} = Cfg -> Cfg;
        _Any -> undefined
    end.