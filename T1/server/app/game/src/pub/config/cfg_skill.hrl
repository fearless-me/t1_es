%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!

-ifndef(cfg_skill).
-define(cfg_skill, 1).

%% 技能表
-record(skillCfg, {
	%% 行描述
	desc__,

	%% 要个十万位ID吧，便于职业技能的分类
	id,

	%% 名字就字符串，要考虑加入翻译标记
	name,

	%% 规划分类为:
	%% 1职业技能
	%% 2通用技能（怪物或者人）
	%%  3触发技能（非点击释放类）
	type,

	%% 按照现在的计数方案吧，第一位为主职业，第二位为转职次数，第三位为该转职下第几个职业，非职业技能填0
	career,

	%% 规划分类为:
	%% 1瞬发
	%% 2吟唱
	%% 3持续施法
	%% 4被动技能
	casttype,

	%% 瞬发技能填0，吟唱技能填吟唱时间，持续施法技能填持续总长度
	casttime,

	%% 施法触发间隔时间，仅对吟唱和持续施法有效
	casttick,

	%% 意图：
	%% 0负面
	%% 1增益，主要用于第一步甄别目标有效性
	purpose,

	%% 有效目标:
	%% 1player
	%% 2monster
	%% 4pet
	target,

	%% 施法目标：
	%% 1单体目标
	%% 2方向
	%% 3指定地点
	%% 4自身面向
	casttarget,

	%% 范围类型：
	%% 1单体目标
	%% 2线型
	%% 3圆形
	areatype,

	%% 半径，仅对线型和圆形生效
	radius,

	%% 弧度，仅对圆形生效
	arc,

	%% 射程，int_array，[min,max]
	distance,

	%% 消耗，int_array，[type,subtype,value]
	cost,

	%% CD
	cooldown,

	%% 飞行时间，如果是直接命中的（比如奥冲）就是0
	flying,

	%% icon ID
	iconid,

	%% 动作主类型 _ 子类型 _ id，实际上只用填写文件名，不用写路径
	castanim,

	%% 同上
	skilleffect,

	%% 同上
	hiteffect,

	%% 技能释放前事件，我们先不说条件
	beforecast,

	%% 技能释放中每一casttick事件
	castingtick,

	%% 技能命中前（命中瀑布流已经命中了）
	beforehit,

	%% 技能命中效果
	ishit
 }).

-endif.
