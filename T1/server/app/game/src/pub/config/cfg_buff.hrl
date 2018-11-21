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

	%% 正负性：
	%% 1.正面
	%% 2.负面
	%% 3.无目的性
	purpose,

	%% 效果TYPE：
	%% 1.无特别效果
	%% 2.昏迷
	%% 3.迷惑
	%% 4.减速
	%% 5.变形
	effectType,

	%% 用于区别同类BUFF冲突用，比如“烹饪增加的BUFF都是一个GroupID”
	groupId,

	%% 免疫类型：
	%% 1.无
	%% 2.免疫昏迷
	%% 3.免疫迷惑
	%% 4.免疫减速
	%% 5.免疫变形
	immune,

	%% 总时长（毫秒）
	lifeTime,

	%% 每跳间隔（毫秒）
	tickTime,

	%% 是否可以被移除事件移除：
	%% 1.可以
	%% 2.无法被移除
	canRemove,

	%% 死亡是否移除：
	%% 1.可以
	%% 2.死亡不移除
	deathRemove,

	%% 跨图是否移除：
	%% 1.可以
	%% 2.跨图不移除
	mapRemove,

	%% 保存方式：
	%% 1.下线不保存
	%% 2.下线保存停止计时
	%% 3.下线保存依然计时
	saveType,

	%% 最大叠加层数
	maxLayer,

	%% 来源冲突方式：
	%% 1.不同来源同ID共存
	%% 2.不同来源仅最后一个生效
	sourceConflict,

	%% 显示方式：
	%% 1.全部可见
	%% 2.自己可见
	%% 3全不可见
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
