%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 六月 2017 17:20
%%%-------------------------------------------------------------------
-module(gameMapWorldBoss).
-author("Administrator").


-include("mapPrivate.hrl").
-include("activityDef.hrl").
-include("PlayerPropSyncDefine.hrl").

%% API
-export([
	goDie/1,
	setHp/2,
	createBoss/1
]).

createBoss({MonsterID,CurHp, PosX, PosY})->
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
				groupID = 0
			},
			Code = monsterInterface:spawnMonster(Arg),
			monsterState:setCurHp(Code, CurHp),
			ok;
		_ ->
			ok
	end,
	ok.


goDie(DataID)->
	Ets = mapState:getMapMonsterEts(),
	CodeList = getObjByID(Ets, DataID),
	[gatherNpcMgr:deleteObject(Ets, Code) || Code <- CodeList],
	ok.

setHp(DataID, Hp) when Hp > 0->
	?INFO("worldboss[~p],Hp[~p]",[DataID, Hp]),
	Ets = mapState:getMapMonsterEts(),
	CodeList = getObjByID(Ets, DataID),
	lists:foreach(
		fun(Code)->
			doSetHp(Code, DataID, Hp)
		end, CodeList),
	ok;
setHp(_DataID, _Hp) ->
	ok.

doSetHp(Code, DataID, Hp)->
	monsterState:setCurHp(Code, Hp),
	catch addWorldBossBuff(Code, DataID, Hp),
	ok.

getObjByID(Ets, DataID) ->
	MatchSpec = ets:fun2ms(fun(R) when R#recMapObject.id =:= DataID -> R#recMapObject.code end),
	L = myEts:selectEts(Ets, MatchSpec),
	L.


addWorldBossBuff(Code, DataID, CurHp)->
	case getCfg:getCfgByArgs(cfg_worldboss, worldboss_announce) of
		#worldbossCfg{setpara = L} ->
			doAddWorldBossBuff(Code, L, getCfg:getCfgByArgs(cfg_monster, DataID), CurHp);
		_ ->
			skip
	end,
	ok.

doAddWorldBossBuff(_Code, [], _Cfg, _Hp) ->
	skip;
doAddWorldBossBuff(Code, L, #monsterCfg{maxHP = MaxHp}, Hp) when MaxHp > 0 ->
	Percent = trunc(Hp/MaxHp*100),
	BuffID = findBuffID(L, Percent, 0),
	case BuffID > 0 of
		true ->
			monsterBuff:addBuff(Code, BuffID, 1);
		_ ->
			skip
	end,
	
	ok;
doAddWorldBossBuff(_Code, _L, _Cfg, _Hp) ->
	skip.

findBuffID([], _Percent, CurBuffID) ->
	CurBuffID;
findBuffID([{NeedPercent, BuffID} | Left], Percent, _CurBuffID) when NeedPercent >= Percent->
	findBuffID(Left, Percent, BuffID);
findBuffID(_L, _Percent, CurBuffID) ->
	CurBuffID.




