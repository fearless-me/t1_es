%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("tiancheng").

-ifndef(cfg_monster).
-define(cfg_monster, 1).

%% 怪物配置表
-record(monsterCfg, {
	desc__,

	id,

	name,

	title,

	describe,

	icon,

	level,

	type,

	sub_type,

	camp,

	buff_born,

	ai,

	attack_type,

	move_type,

	alerting_area,

	guarding_area,

	guarding_speed,

	pursuing_area,

	pursuing_speed,

	recover_takeoff,

	dropId,

	model,

	animation_born,

	animation_death,

	sound_death,

	strength_id,

	coefficient_hp,

	coefficient_defense,

	coefficient_attack,

	coefficient_critical,

	coefficient_hit,

	coefficient_dodge,

	coefficient_quickness,

	skill_attack1,

	skill_attack2,

	skill_id1,

	skill_condition1,

	skill_condition_param1,

	skill_target_type1,

	skill_id2,

	skill_condition2,

	skill_condition_param2,

	skill_target_type2,

	skill_id3,

	skill_condition3,

	skill_condition_param3,

	skill_target_type3,

	skill_id4,

	skill_condition4,

	skill_condition_param4,

	skill_target_type4,

	skill_id5,

	skill_condition5,

	skill_condition_param5,

	skill_target_type5,

	born_event,

	death_event
 }).

-endif.
