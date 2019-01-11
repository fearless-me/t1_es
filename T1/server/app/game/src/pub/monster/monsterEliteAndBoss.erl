%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 十一月 2017 14:30
%%%-------------------------------------------------------------------
-module(monsterEliteAndBoss).
-author("mawenhong").

-include("monsterPrivate.hrl").
-include("activityDef.hrl").

-record(recMonsterInfo, {
    monsterID = 0,
    monsterNum = 0
}).

%% API
-export([
    onMonsterDead/2,
    monsterDeadElite/2
]).

onMonsterDead(_AttackerCode, Code) ->
    MonID = monsterState:getId(Code),
    MapID = monsterState:getMapID(Code),
    MapPID = monsterState:getMapPid(Code),
    PosXY = monsterState:getMonsterPos(Code),
    PlayerEts = monsterState:getMapPlayerEts(Code),
    catch monsterDeadElite(MapID, MapPID, MonID, PosXY),
    catch monsterBossDead(PlayerEts, MapID, MonID),
    ok.

monsterBossDead(PlayerEts, MapID,MonsterID)->
    case getCfg:getCfgByArgs(cfg_monster, MonsterID) of
        #monsterCfg{showName = MonsterName, monsterSubType = ?MonsterSTypeMapBoss} ->
            case getCfg:getCfgByArgs(cfg_mapsetting, MapID) of
                #mapsettingCfg{desc = Name}->
                    Msg = stringCfg:getString(monsterBoss_dead, [Name, MonsterName]),
                    sendNetMsgToMapPlayer(PlayerEts, Msg),
                    ok;
                _ ->
                    skip
            end,
            ok;
        _ ->
            skip
    end,
    ok.

sendNetMsgToMapPlayer(PlayerEts, Msg)->
    try
        MatchSpec = ets:fun2ms(fun(Object) ->  Object#recMapObject.netPid end),
        MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
        lists:foreach(fun(NetPid) -> core:sendBroadcastNotice(Msg, NetPid) end, MapPlayerNetPidList)
    catch
        _ : _  -> skip
    end.

sendNetMsgToMapPlayer2(PlayerEts, Msg)->
    try
        Fun =
            fun(#recMapObject{netPid = NetPid}, _) ->
                gsSendMsg:sendNetMsg(NetPid, Msg)
            end,
        ets:foldl(Fun, 0, PlayerEts)
    catch
        _:_Why ->
            skip
    end.

%%%-------------------------------------------------------------------
%% 精英怪死亡提示
-spec monsterDeadElite(AttackRoleID::uint64(), TargetCode::uint64()) -> ok.
monsterDeadElite(0, _TargetCode) ->
    skip;
monsterDeadElite(AttackRoleID, TargetCode) ->
    MonsterID = monsterState:getId(TargetCode),
    case getCfg:getCfgByKey(cfg_monster, MonsterID) of
        #monsterCfg{monsterType = 7, showName = Name} ->
            %% 精英怪
            RoleName = playerNameUID:getPlayerNameByUID(AttackRoleID),
            Msg = playerMsg:getErrorCodeMsg(?ErrorCode_KillEliteMonsterNotice, [RoleName, Name]),
            PlayerEts = monsterState:getMapPlayerEts(TargetCode),
            sendNetMsgToMapPlayer2(PlayerEts, Msg),
            ok;
        _ ->
            skip
    end,
    ok.

monsterDeadElite(MapID, MapPID, MonsterID, {_PosX, _PosY} = Pos) ->
    case isNeedCreateElite(MapID, MonsterID) of
        true ->
            doMonsterDeadElite(MapID, MapPID, MonsterID, Pos);
        _ ->
            skip
    end,
    ok;
monsterDeadElite(_Map, _MapPID, _Mon, _Pos) ->
    ok.

doMonsterDeadElite(MapID, _MapPid, MonsterID, Pos) ->
    DL = getMonsterDeadList(),
    NewInfo =
        case lists:keyfind(MonsterID, #recMonsterInfo.monsterID, DL) of
            #recMonsterInfo{monsterNum = Num} = Info ->
                Info#recMonsterInfo{monsterNum = Num + 1};
            _ ->
                #recMonsterInfo{monsterID = MonsterID, monsterNum = 1}
        end,
    IsNeedClear = doCreateMonsterElite(MapID, MonsterID, NewInfo#recMonsterInfo.monsterNum, Pos),
    NewInfo2 =
        case IsNeedClear of
            true ->
                #recMonsterInfo{monsterID = MonsterID, monsterNum = 0};
            _ ->
                NewInfo
        end,

    DL2 = lists:keystore(MonsterID, #recMonsterInfo.monsterID, DL, NewInfo2),
    setMonsterDeadList(DL2),
    ok.

doCreateMonsterElite(MapID, MonsterID, DeadNum, Pos) ->
    case getCfg:getCfgByArgs(cfg_monsterElite, MapID, MonsterID) of
        #monsterEliteCfg{dead_num = NeedNum, elite_monster_id = EliteID} when  DeadNum >= NeedNum ->
            catch doCreateMonster(MapID, EliteID, Pos),
            true;
        _ ->
            false
    end.

doCreateMonster(MapID, MonsterID,{PosX, PosY}) ->
    case getCfg:getCfgPStack(cfg_monster, MonsterID) of
        #monsterCfg{level = Lvl } ->
            Arg = #recSpawnMonster{
                id = MonsterID,
                mapID = MapID,
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
            monsterInterface:spawnMonster(Arg),
            ?DEBUG("###create elite monster[~p],map[~p]",[MonsterID, MapID]),
            ok;
        _ ->
            ok
    end.

%%%-------------------------------------------------------------------
isNeedCreateElite(MapID, MonsterID) ->
    L = getMapCfgMonsterWithEliteList(MapID),
    lists:member(MonsterID, L).

setMonsterDeadList(L)->
    put('MapMonsterDeadEBList', L).

getMonsterDeadList() ->
    case get('MapMonsterDeadEBList') of
        undefined ->
            [];
        List ->
            List
    end.

getMapCfgMonsterWithEliteList(MapID) ->
    getCfg:get2KeyList(cfg_monsterElite, MapID).



