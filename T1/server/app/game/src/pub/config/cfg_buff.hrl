%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("tiancheng").

-ifndef(cfg_buff).
-define(cfg_buff, 1).

%% BUFF表
-record(buffCfg, {
	desc__,

	%% BuffID,唯一Key
	id,

	%% 显示的描述内容
	tips,

	%% IconID
	icon,

	%% Buff作用域分类
	useType,

	%% 正负性：0正面 1负面 2无目的性
	purpose,

	%% 效果TYPE：0.无特别效果 1.昏迷 2.迷惑 3.减速 4.变形
	effectType,

	%% 用于区别同类BUFF冲突用，比如“烹饪增加的BUFF都是一个GroupID”
	groupId,

	%% 免疫类型：0无 1.免疫昏迷 2.免疫迷惑 4.免疫减速 8.免疫变形
	immune,

	%% 总时长（毫秒）
	lifeTime,

	%% 每跳间隔（毫秒）
	tickTime,

	%% 是否可以被移除事件移除，1可以 2无法被移除
	canRemove,

	%% 死亡是否移除，1可以 2死亡不移除
	deathRemove,

	%% 跨图是否移除，1可以 2跨图不移除
	mapRemove,

	%% 保存方式：0下线不保存 1下线保存停止计时 2下线保存依然计时
	saveType,

	%% 最大叠加层数
	maxLayer,

	%% 来源冲突方式：0不同来源同ID共存 1不同来源仅最后一个生效
	sourceConflict,

	%% 显示方式：0全部可见 1自己可见 2全不可见
	displayType,

	%% 属性列表
	propList,

	%% 添加条件事件组
	onAdd,

	%% Tick条件事件组
	onTick,

	%% 中断条件事件组
	onStop,

	%% 结束条件事件组
	onEnd
 }).

-endif.
