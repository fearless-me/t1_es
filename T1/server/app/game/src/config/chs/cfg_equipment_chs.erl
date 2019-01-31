%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_equipment_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_equipment.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 装备表

%%-----------------------------------Fields Note-----------------------------------
	%% desc__:
	%% 行描述

	%% id:
	%% 装备ID

	%% name:
	%% 装备名称

	%% describe:
	%% 装备描述

	%% icon:
	%% 装备图标

	%% part:
	%% 装备部位
	%% 1.武器
	%% 2.副武器
	%% 3.头饰
	%% 4.胸甲
	%% 5.肩甲
	%% 6.手套
	%% 7.下装
	%% 8.鞋子
	%% 9.戒指
	%% 10.饰品

	%% quality:
	%% 装备品质
	%% 1.白色
	%% 2.绿色
	%% 3.蓝色
	%% 4.紫色
	%% 5.黄色
	%% 6.橙色

	%% level:
	%% 装备等级，穿戴该装备需要的角色等级

	%% intensity_level:
	%% 强度等级，用于计算装备创建时，属性值强度

	%% profession:
	%% 装备职业
	%% 1.不限制
	%% 100.战士系
	%% 200.法师系
	%% 300.刺客系

	%% model:
	%% 装备模型

	%% price:
	%% 出售价格(金币)，当配置为 null，则通过计算自动生成值

	%% get_way:
	%% 获取途径，[[途径大类,具体途径]]每次需要在结构中新增定义

	%% suitId:
	%% 套装ID

	%% prop_attack:
	%% 攻击

	%% prop_defence:
	%% 防御

	%% prop_strength:
	%% 力量

	%% prop_brains:
	%% 智力

	%% prop_agility:
	%% 敏捷

	%% prop_endurance:
	%% 耐力

	%% spec_hit:
	%% 命中

	%% spec_dodge:
	%% 闪避

	%% spec_crit:
	%% 暴击

	%% spec_quickness:
	%% 急速

	%% spec_recover:
	%% 生命恢复(秒)

	%% spec_speed:
	%% 移动速度
%%---------------------------------------------------------------------------------

getRow(_) -> {}.

getKeyList() -> [

].

get1KeyList() -> [

].

