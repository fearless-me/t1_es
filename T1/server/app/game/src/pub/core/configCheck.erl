-module(configCheck).

-include("logger.hrl").
-include("config.hrl").
-include("commonDef.hrl").
-include("gameMap.hrl").
-include("buff.hrl").
-include("skill.hrl").
-include("char.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

%% ====================================================================
%% 如果有异常，请throw异常
%% ====================================================================
-export([
	startCheckConfig/0,
	startCheckConfigHaveData/0,
	startCheckConfigHaveModuleData/0
]).

-export([
	checkMapSettingConfig/0,		% 检查地图配置是否正确
	checkInvalidProperty/0			%% 检查哪些技能包含了非法的战斗属性
]).

%% ====================================================================
%% 如果有异常，请throw异常
%% ====================================================================

%% 单纯检查配置
-spec startCheckConfig() -> true.
startCheckConfig() ->
	Ret1 = checkEquipRecastConfig(),
	Ret2 = playerLoopTask:checkConfig() andalso Ret1,
	%%Ret3 = playerEquipWash:checkEquipWashConfig() andalso Ret2, LUNA-9072
	%%Ret4 = playerEquipWash:checkDifferentConfig() andalso Ret3, LUNA-9072
	Ret5 = friendCommon:assert() andalso Ret2,
	Ret6 = playerDrop:configCheck() andalso Ret5,
	Ret7 = playerFloatingManual:checkFloatingConfig() andalso Ret6,
	Ret8 = checkBuffID() andalso Ret7,
	Ret9 = checkItemAndEquipMentID() andalso Ret8,
	Ret10 = checkMapSettingConfig() andalso Ret9,
	Ret11 = checkInvalidProperty() andalso Ret10,
	Ret12 = playerPet:configCheck() andalso Ret11,
	Ret12 =:= true.


%% 带公共数据检查配置
-spec startCheckConfigHaveData() -> true.
startCheckConfigHaveData() -> true.

%% 带模块数据检查配置
-spec startCheckConfigHaveModuleData() -> true.
startCheckConfigHaveModuleData() -> true.

%% buff.id取值为1~65535
-spec checkBuffID() -> boolean().
checkBuffID() ->
	checkBuffID(getCfg:get1KeyList(cfg_buff)).
-spec checkBuffID([integer(), ...]) -> boolean().
checkBuffID([]) ->
	true;
checkBuffID([ID | T]) when erlang:is_integer(ID), ID > 0, ID < 65536 ->
	checkBuffID(T);
checkBuffID([ID | _]) ->
	io:format("~w.~w checkBuffID failed ID:~p~n", [?MODULE, ?LINE, ID]),
	false.

checkItemAndEquipMentID() ->
	ItemKeyList = getCfg:get1KeyList(cfg_item),
	true = lists:max(ItemKeyList) < ?Item_Differentiate,

	EquipMentList = getCfg:get1KeyList(cfg_equipment),
	true = lists:min(EquipMentList) >= ?Item_Differentiate,
	true = lists:max(EquipMentList) < ?Item_RuneIDStart,

	RuneList = getCfg:get1KeyList(cfg_rune),
	true = lists:min(RuneList) >= ?Item_RuneIDStart,
	true.

%%%===================================================================
%%% Internal functions
%%%===================================================================
checkEquipRecastConfig() ->
	Key1List = getCfg:getKeyList(cfg_equipRecastInit),
	Key2List = getCfg:getKeyList(cfg_equipRecastAdvance),
	F =
		fun(Key, Acc) ->
			case lists:member(Key, Acc) of
				true ->
					lists:delete(Key, Acc);
				_ ->
					throw(equipRecastError)
			end
		end,
	[] =:= lists:foldl(F, Key2List, Key1List).

checkMapSettingConfig() ->
	F =
		fun(MapID, _) ->
			case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
				#mapsettingCfg{type = ?MapTypeBitplane, belongto = 0} ->
					{true, MapID};
				#mapsettingCfg{type = ?MapTypeBitplane, belongto = BelongTo} ->
					case getCfg:getCfgByKey(cfg_mapsetting, BelongTo) of
						#mapsettingCfg{type = ?MapTypeNormal} ->
							case gameMapCfg:getMapCfg(BelongTo) of
								undefined -> {true, MapID};
								_ -> {false, 0}
							end;
						#mapsettingCfg{type = ?MapTypeActivity, subtype = SubType} when
							SubType =:= ?MapSubTypeHome; SubType =:= ?MapSubTypeGuildBoss ->
							case gameMapCfg:getMapCfg(BelongTo) of
								undefined -> {true, MapID};
								_ -> {false, 0}
							end;
						_ ->
							{true, MapID}
					end;
				#mapsettingCfg{type = MapType} when MapType =:= ?MapTypeNormal;
					MapType =:= ?MapTypeCopyMap;
					MapType =:= ?MapTypeActivity ->
					case gameMapCfg:getMapCfg(MapID) of
						undefined -> {true, MapID};
						_ -> {false, 0}
					end
			end
		end,
	case misc:foldlEx(F, {false, 0}, getCfg:get1KeyList(cfg_mapsetting)) of
		{false, 0} -> true;
		{_, MID} ->
			?ERROR("map config error, MapID=~p", [MID]),
			false
	end.

%% ====================================================================
-spec checkInvalidProperty() -> boolean().
checkInvalidProperty() ->
	%% 查找哪些技能最终包含的添加BUFF效果中，带有非法的战斗属性
	ListSkillID = getCfg:get1KeyList(cfg_skill),
	case checkInvalidProperty_Skill(ListSkillID, []) of
		[] ->
			true;
		_ ->
			false
	end.
-spec checkInvalidProperty_Skill(ListSkillID::[uint(), ...], AccInvalidSkill::list()) -> ListInvalidSkill::list().
checkInvalidProperty_Skill([], AccInvalidSkill) ->
	AccInvalidSkill;
checkInvalidProperty_Skill([SkillID | T], AccInvalidSkill) ->
	ListInvalidEffect =
		case getCfg:getCfgByKey(cfg_skill, SkillID) of
			#skillCfg{effects = Effects, nouse = 0} ->
				checkInvalidProperty_Effect(Effects, []);
			_ ->
				[]
		end,
	case ListInvalidEffect of
		[] ->
			checkInvalidProperty_Skill(T, AccInvalidSkill);
		_ ->
			InvalidSkill = {SkillID, ListInvalidEffect},
			io:format("~w.~w InvalidSkill:~w~n", [?MODULE, ?LINE, InvalidSkill]),
			?ERROR("InvalidSkill:~w", [InvalidSkill]),
			checkInvalidProperty_Skill(T, [InvalidSkill | AccInvalidSkill])
	end.
-spec checkInvalidProperty_Effect(ListEffectID::[uint(), ...], AccInvalidEffect::list()) -> ListInvalidEffect::list().
checkInvalidProperty_Effect(undefined, AccInvalidEffect) ->
	AccInvalidEffect;	%% 无效效果
checkInvalidProperty_Effect([], AccInvalidEffect) ->
	AccInvalidEffect;
checkInvalidProperty_Effect([EffectID | T], AccInvalidEffect) ->
	ListInvalidBuffID =
		case getCfg:getCfgPStack(cfg_skill_effect, EffectID) of
			#skill_effectCfg{
				effectType = ?ADDBUFF,
				param1 = P1,
				param2 = P2,
				param3 = P3,
				param4 = P4,
				param5 = P5,
				param6 = P6
			} ->
				List1 = checkInvalidProperty_Buff(P1, []),
				List2 = checkInvalidProperty_Buff(P2, List1),
				List3 = checkInvalidProperty_Buff(P3, List2),
				List4 = checkInvalidProperty_Buff(P4, List3),
				List5 = checkInvalidProperty_Buff(P5, List4),
				checkInvalidProperty_Buff(P6, List5);
			_ ->
				[]
		end,
	case ListInvalidBuffID of
		[] ->
			checkInvalidProperty_Effect(T, AccInvalidEffect);
		_ ->
			checkInvalidProperty_Effect(T, [{EffectID, ListInvalidBuffID} | AccInvalidEffect])
	end.
-spec checkInvalidProperty_Buff(BuffID::uint(), AccInvalidBuffID::[uint(), ...]) -> ListInvalidBuffID::[uint(), ...].
checkInvalidProperty_Buff(undefined, AccInvalidBuffID) ->
	AccInvalidBuffID;	%% 无效BUFF
checkInvalidProperty_Buff(0, AccInvalidBuffID) ->
	AccInvalidBuffID;	%% 无效BUFF
checkInvalidProperty_Buff(BuffID, AccInvalidBuffID) ->
	case getCfg:getCfgPStack(cfg_buff, BuffID) of
		#buffCfg{property = Property} ->
			case checkInvalidProperty_Buff_Property(Property) of
				true ->
					AccInvalidBuffID;
				_ ->
					[BuffID | AccInvalidBuffID]
			end;
		_ ->
			[BuffID | AccInvalidBuffID]
	end.
-spec checkInvalidProperty_Buff_Property(Property::list()) -> boolean().
checkInvalidProperty_Buff_Property(undefined) ->
	true;	%% 无效属性
checkInvalidProperty_Buff_Property([]) ->
	true;
checkInvalidProperty_Buff_Property([{_, _, PropertyIndex, _, _} | T])
	when PropertyIndex >= ?Prop_Min, PropertyIndex =< ?PropMax ->
	checkInvalidProperty_Buff_Property(T);
checkInvalidProperty_Buff_Property(_) ->
	false.
