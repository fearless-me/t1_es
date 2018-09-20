%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!

-module(cfg_skill_chs).
-compile(export_all).

-include("cfg_skill.hrl").
-include("logger.hrl").

%% 技能表
getRow(5) ->
	#skillCfg{
		desc__ = "测试技能",
		id = 5,
		name = "如来神掌。假",
		type = 1,
		career = 101,
		casttype = 1,
		casttime = 0,
		casttick = 0,
		purpose = 0,
		target = 1,
		casttarget = 1,
		areatype = 1,
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
getRow(777) ->
	#skillCfg{
		desc__ = "",
		id = 777,
		name = "如来佛脚。神",
		type = 1,
		career = 0,
		casttype = 1,
		casttime = 0,
		casttick = 0,
		purpose = 0,
		target = 1,
		casttarget = 1,
		areatype = 1,
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
getRow(3) ->
	#skillCfg{
		desc__ = "aaaaaa",
		id = 3,
		name = "哦哦哦",
		type = 1,
		career = 0,
		casttype = 1,
		casttime = 0,
		casttick = 0,
		purpose = 0,
		target = 1,
		casttarget = 1,
		areatype = 1,
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
getRow(9999999) ->
	#skillCfg{
		desc__ = "测试技能4",
		id = 9999999,
		name = "旋风斩",
		type = 1,
		career = 0,
		casttype = 1,
		casttime = 0,
		casttick = 0,
		purpose = 0,
		target = 1,
		casttarget = 1,
		areatype = 1,
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
getRow(100100) ->
	#skillCfg{
		desc__ = "面对疾风吧！",
		id = 100100,
		name = "侯塞给",
		type = 1,
		career = 1,
		casttype = 1,
		casttime = 0,
		casttick = 0,
		purpose = 0,
		target = 1,
		casttarget = 1,
		areatype = 1,
		radius = 0,
		arc = 0,
		distance = [1,10],
		cost = [0,0,0],
		cooldown = 5000,
		flying = 1000,
		iconid = "3510",
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
	{5},
	{777},
	{3},
	{9999999},
	{100100}
].

get1KeyList() -> [
	5,
	777,
	3,
	9999999,
	100100
].

