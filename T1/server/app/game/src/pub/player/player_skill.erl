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

-include("object.hrl").
-include("logger.hrl").
-include("cfg_skill.hrl").
-include("netmsg.hrl").
-include("combat.hrl").

%% API
-export([
    get_skill_info_list/0
]).

get_skill_info_list() -> [].