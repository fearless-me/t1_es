%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!

-module(cfg_skill_chs).
-compile(export_all).

-include("cfg_skill.hrl").
-include("logger.hrl").

%% 技能表
getRow(0) ->
	#skillCfg{
		desc__ = "",
		id = 0,
		name = "",
		type = 0,
		career = 0,
		casttype = 0,
		casttime = 0,
		casttick = 0,
		purpose = 0,
		target = 0,
		casttarget = 0,
		areatype = 0,
		radius = 0,
		arc = 0,
		distance = [],
		cost = [],
		cooldown = 0,
		flying = 0,
		iconid = "",
		castanim = "",
		skilleffect = "",
		hiteffect = "",
		beforecast = "",
		castingtick = "",
		beforehit = [],
		ishit = []
	};
getRow(_) -> {}.

getKeyList() -> [
	{0}
].

get1KeyList() -> [
	0
].

