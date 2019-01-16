%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 十一月 2017 15:22
%%%-------------------------------------------------------------------
-module(gameMapBoss).
-author("mawenhong").
-include("mapPrivate.hrl").
-include("gsInc.hrl").
-include("setupLang.hrl").

-define(MapBossTickTime, 1000).
-define(MakeMapID(MapID, LineID), (MapID + LineID * ?MapMixLineBase)).

%% API
-export([
    initAllMapBoss/0,
    onMapCreate/3,
    onMapDestroy/3,
    heartbeat/0
]).

tickMsg()->
    erlang:send_after(?MapBossTickTime, self(), heartbeat),
    ok.

%%%-------------------------------------------------------------------
initAllMapBoss() ->
    ets:new(?MapBossInfoEts, [public, named_table, {keypos, #recMapBossInfo.mapID}, {read_concurrency, true}, {write_concurrency, true}]),
    L = getCfg:get1KeyList(cfg_monsterBoss),
    lists:foreach(
        fun(MapID) ->
            BossList = makeInitBossList(MapID),
            Info = #recMapBossInfo{
                mapID = MapID,
                mapPid = [],
                bossList = BossList
            },
%%            ?DEBUG("mb_mb init=~p",[ets:tab2list(?MapBossInfoEts)]),
            myEts:insertEts(?MapBossInfoEts, Info)
        end, L),
    tickMsg(),
    ok.

%%%-------------------------------------------------------------------
makeInitBossList(MapID) ->
    L = getCfg:get2KeyList(cfg_monsterBoss, MapID),
    lists:foldl(
        fun(BossID, Acc) ->
            case getCfg:getCfgByArgs(cfg_monsterBoss, MapID, BossID) of
                #monsterBossCfg{pos = [PosX, PosY], cycle_time = CT} ->
                    [#recBossInfo{
                        bossID = BossID,
                        refreshTime = misc_time:milli_seconds() + CT * 60 * 1000,
                        cycleTime = CT * 60 * 1000,
                        posX = float(PosX),
                        posY = float(PosY)
                    } | Acc];
                _ ->
                    Acc
            end
        end, [], L).

%%%-------------------------------------------------------------------
onMapCreate(MapID, MapPid, _MapLine) ->
    case myEts:readRecord(?MapBossInfoEts, MapID) of
        #recMapBossInfo{mapPid = PidList} = Info ->
            ?DEBUG("mb_mb createMap[~p][~p][~p]",[MapID,MapPid,_MapLine]),
            myEts:insertEts(?MapBossInfoEts, Info#recMapBossInfo{mapPid = [MapPid | PidList]});
        _ ->
            ok
    end,
    ok.

%%%-------------------------------------------------------------------
onMapDestroy(MapID, MapPid, _MapLine) ->
    case myEts:readRecord(?MapBossInfoEts, MapID) of
        #recMapBossInfo{mapPid = PidList} = Info ->
            ?DEBUG("mb_mb onMapDestroy[~p][~p][~p]",[MapID,MapPid,_MapLine]),
            myEts:insertEts(?MapBossInfoEts, Info#recMapBossInfo{mapPid = lists:delete(MapPid, PidList)});
        _ ->
            ok
    end,
    ok.

%%%-------------------------------------------------------------------
heartbeat()->
    tickMsg(),
    NowTime = misc_time:milli_seconds(),
    L = getCfg:get1KeyList(cfg_monsterBoss),
    for_do_all_map(NowTime, L),
    ok.

for_do_all_map(_NowTime, [])->
    ok;
for_do_all_map(NowTime, [MapID | MapList])->
    catch  do_check_create(NowTime, MapID),
    for_do_all_map(NowTime, MapList).


do_check_create(NowTime, MapID) ->
    case myEts:readRecord(?MapBossInfoEts, MapID) of
        #recMapBossInfo{bossList = BL, mapPid = ML} = Info ->
            NBL = for_do(NowTime, MapID, BL, ML, []),
            myEts:insertEts(?MapBossInfoEts, Info#recMapBossInfo{bossList = NBL});
        _ ->
            ?WARN("boss info list is gone[~p]", [MapID])
    end,
    ok.

%%%-------------------------------------------------------------------
for_do(_NowTime, _MapID,  [], _ML, Acc) ->
    Acc;
for_do(NowTime, MapID, [BossInfo | BossList], ML, Acc) ->
    NewInfo =
        case BossInfo of
            #recBossInfo{bossID = BossID, refreshTime = RT, cycleTime = CT, posX = X, posY = Y} when NowTime >= RT ->
                catch createBossNow(MapID, BossID, X, Y, ML),
                BossInfo#recBossInfo{refreshTime =  CT + misc_time:milli_seconds()};
            _ ->
                BossInfo
        end,
    for_do(NowTime, MapID, BossList, ML, [NewInfo | Acc]).

%%%-------------------------------------------------------------------
createBossNow(MapID, MonsterID, PosX, PosY, ML) ->
    case getCfg:getCfgPStack(cfg_monster, MonsterID) of
        #monsterCfg{level = Level} when ML =/= [] ->
            F =
                fun(MapPid) ->
                    Arg = #recSpawnMonster{
                        level = Level,
                        id = MonsterID,
                        camp = ?CampMonsterEnemies,
                        mapID = MapID,
                        mapPid = MapPid,
                        x = erlang:float(PosX),
                        y = erlang:float(PosY),
                        rotW = erlang:float(0.1)
                    },
                    ?DEBUG("mb_mb create boss[~p][~p][~p]",[MapID, MapPid, MonsterID]),
                    psMgr:sendMsg2PS(MapPid, spawnMonster_with_notexists,  {Arg})
                end,
            lists:foreach(F, ML),

            %% fixme 该需求是因为翻译工具不完善导致，目前仅对台湾生效
            case ?Cur_Lang of
                ?Lang_CHT ->
                    core:sendBroadcastNotice(
                        erlang:binary_to_list(
                            unicode:characters_to_binary(
                                [12304,91,53,52,102,102,57,48,93] ++
                                    linshi_getMapName(MapID) ++
                                    [91,45,93,30340,37326,22806,39318,38936,91,102,102,48,48,48,48,93] ++
                                    linshi_getMonsterName(MonsterID) ++
                                    [91,45,93,24050,21047,26032,65292,36245,32202,21069,24448,25136,39717,21543,65281,12305]
                            )
                        )
                    );
                _ ->
                    skip
            end;
        _ ->
            ok
    end,
    ok.



linshi_getMapName(4) -> [33980,31354,20043,22612];
linshi_getMapName(7) -> [33980,31354,38634,22495];
linshi_getMapName(11) -> [31934,38728,25925,22303];
linshi_getMapName(12) -> [31934,38728,36991,38627,25152];
linshi_getMapName(13) -> [36986,36321,35895,22320];
linshi_getMapName(14) -> [40657,26263,26862,26519];
linshi_getMapName(15) -> [24189,38728,27193,21474];
linshi_getMapName(_) -> [26410,30693,38936,22495].

linshi_getMonsterName(1109) -> [20912,26230,40845];
linshi_getMonsterName(1105) -> [21205,24863,25331,25802,25163];
linshi_getMonsterName(1107) -> [32005,30382,27969,27667];
linshi_getMonsterName(1106) -> [32160,30382,32051,22763];
linshi_getMonsterName(1108) -> [28814,35282];
linshi_getMonsterName(1110) -> [40657,26263,20043,39746];
linshi_getMonsterName(1111) -> [27515,20129,31085,21496,38263];
linshi_getMonsterName(_) -> [31070,31192,39318,38936].
