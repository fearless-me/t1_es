
%%%-------------------------------------------------------------------
%%% @author clc
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 十月 2017 16:53
%%%-------------------------------------------------------------------
-module(gameMapAcGuildBoss).
-author("admin").
-include("mapPrivate.hrl").
-include("activityDef.hrl").
-include("PlayerPropSyncDefine.hrl").
%% API
-export([
	createBoss/1
]).
createBoss({MonsterID, GroupID, PosX, PosY})->
	case getCfg:getCfgPStack(cfg_monster, MonsterID) of
		#monsterCfg{level = Lvl } ->
			TMapID = mapState:getMapId(),
			Arg = #recSpawnMonster{
				id = MonsterID,
				mapID = TMapID,
				mapPid = self(),
				x = float(PosX),
				y = float(PosY),
				level = Lvl,
				guildID = 0,
				params = 0,
				camp = ?CampMonsterEnemies,
				playerEts = mapState:getMapPlayerEts(),
				monsterEts = mapState:getMapMonsterEts(),
				petEts = mapState:getMapPetEts(),
				groupID = GroupID
			},
			_Code = monsterInterface:spawnMonster(Arg),
			%%monsterState:setCurHp(Code, CurHp),
			ok;
		_ ->
			ok
	end,
	ok.