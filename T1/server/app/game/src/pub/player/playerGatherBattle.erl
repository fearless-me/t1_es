%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 幽界探险，跨服采集资源争夺战
%%% @end
%%% Created : 14. 五月 2018 10:07
%%%-------------------------------------------------------------------
-module(playerGatherBattle).
-author("tiancheng").
%%
%%-include("playerPrivate.hrl").
%%-include("../crossActivity/croGatherBattle/gatherBattleHrl.hrl").
%%
%%%% API
%%-export([
%%    msg/1
%%]).
%%
%%-export([
%%    enterMap/1,
%%    syncGBInfo/0,
%%    breakGatherLockAck/1,
%%    requestGBLockGatherAck/1,
%%    requestEnterMapLineCrossAck/1,
%%    getGatherBattlePoint/0,
%%    changeGatherBattlePoint/5,
%%    canGather/1,
%%    gatherSuccess/2,
%%    changeGatherBattlePointAck/1
%%]).
%%
%%msg(#pk_U2GS_RequestGBList{}) ->
%%    MS = ets:fun2ms(fun(Info) when Info#recCrossMapLineInfo.isUse =:= true -> Info end),
%%    PInfo = gatherBattleInter:getPlayerPKGBInfo(playerState:getRoleID()),
%%    Msg =
%%        case ets:select(ets_CrossMapLineInfo, MS) of
%%            [] ->
%%                #pk_GS2U_GBList{mapID = gatherBattleInter:getGatherBattleMapID(), lineList = [], info = PInfo};
%%            List ->
%%                F =
%%                    fun(#recCrossMapLineInfo{normalLineID = LineID, number = Number}) ->
%%                        #pk_GBMapLineInfo{lineID = LineID, number = Number}
%%                    end,
%%                List2 = lists:map(F, List),
%%                #pk_GS2U_GBList{mapID = gatherBattleInter:getGatherBattleMapID(), lineList = List2, info = PInfo}
%%        end,
%%%%    MsgCoin = gatherBattleInter:getPlayerChangedWealth(PInfo),
%%%%    playerMsg:sendNetMsg(MsgCoin),
%%    playerMsg:sendNetMsg(Msg),
%%    ok;
%%msg(#pk_U2GS_GBLeaveRange{}) ->
%%    breakGatherLock(),
%%    ok;
%%msg(#pk_U2GS_BuyTime{id = ID}) ->
%%    case getCfg:getCfgByKey(cfg_alrest_buytime, ID) of
%%        #alrest_buytimeCfg{price = [UseType, Value], limit = Limit, time = Time} when UseType =:= ?CoinUseTypeDiamond; UseType =:= ?CoinUseTypeDiamondJustNotBind ->
%%            case playerMoney:canUseCoin(UseType, erlang:abs(Value)) of
%%                true ->
%%                    CanBuy =
%%                        case Limit of
%%                            0 -> true;
%%                            _ -> playerDaily:getDailyCounter(?DailyType_GatherBattleTimeBuy, ID) < Limit
%%                        end,
%%                    case CanBuy of
%%                        true ->
%%                            PLog = #recPLogTSMoney{reason = ?CoinUseReasonGatherBattleBuyTime, param = ID, target = ?PLogTS_System, source = ?PLogTS_PlayerSelf},
%%                            case playerMoney:useCoin(UseType, erlang:abs(Value), PLog) of
%%                                true ->
%%                                    playerDaily:incDailyCounter(?DailyType_GatherBattleTimeBuy, ID),
%%
%%                                    core:sendMsgToActivity(?ActivityType_CrossGatherBattle, requestBuyTime,
%%                                        {playerState:getRoleID(), self(), playerState:getNetPid(), Time});
%%                                _ ->
%%                                    playerMsg:sendErrorCodeMsg(?ErrorCode_Activety_Coin_Not_Enough)
%%                            end;
%%                        _ ->
%%                            playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleNoBuyTimes)
%%                    end;
%%                _ ->
%%                    playerMsg:sendErrorCodeMsg(?ErrorCode_Activety_Coin_Not_Enough)
%%            end;
%%        _ ->
%%            skip
%%    end,
%%    ok;
%%msg(#pk_U2GS_GBLockGather{gatherCode = Code}) ->
%%    case playerPropSync:getProp(?PubProp_GatherCode) of
%%        0 ->
%%            case playerGather:checkDistance(Code) of
%%                true ->
%%                    RoleID = playerState:getRoleID(),
%%                    CanLock =
%%                        case ets:lookup(ets_GatherBattleLock, Code) of
%%                            [] ->
%%                                case ets:lookup(playerState:getMapCollectEts(), Code) of
%%                                    [#recMapObject{id = ID}] ->
%%                                        %% 检查一下有无收益时间
%%                                        case gatherBattleInter:getPlayerInfo(RoleID) of
%%                                            [#rec_crossgatherbattle{remainTime = RemainTime}] when RemainTime > 0 ->
%%                                                LT = gatherBattleInter:getGatherProtectTime(ID),
%%                                                #recGatherBattleLock{
%%                                                    code = Code, id = ID, mapPid = playerState:getMapPid(),
%%                                                    ownerID = RoleID, timeOutMS = LT,
%%                                                    playerPid = self(), netPid = playerState:getNetPid()
%%                                                };
%%                                            _ ->
%%                                                playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleRemainTimeZero),
%%                                                false
%%                                        end;
%%                                    _ ->
%%                                        false
%%                                end;
%%                            _ ->
%%                                false
%%                        end,
%%                    case CanLock of
%%                        #recGatherBattleLock{} = Lock ->
%%                            %% 检查自己有没有锁定一个
%%                            MS = ets:fun2ms(fun(Info) when Info#recGatherBattleLock.ownerID =:= RoleID -> Info end),
%%                            case ets:select(ets_GatherBattleLock, MS) of
%%                                [] ->
%%                                    core:sendMsgToActivity(?ActivityType_CrossGatherBattle, requestGBLockGather, Lock);
%%                                _ ->
%%                                    playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleAlreadyLockGather)
%%                            end;
%%                        _ ->
%%                            playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleLockFailed)
%%                    end;
%%                _ ->
%%                    playerMsg:sendErrorCodeMsg(?ErrorCode_SystemGatherTooFar)
%%            end;
%%        _ ->
%%            playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleAlreadyLock)
%%    end,
%%    ok;
%%msg(#pk_U2GS_GBRequestEnterMapLine{mapID = MapID, lineID = LineID}) ->
%%    case gatherBattleInter:getGatherBattleMapID() of
%%        MapID ->
%%            PlayerLvl = playerState:getLevel(),
%%            CanIn =
%%            case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
%%                #mapsettingCfg{playerEnter_MinLevel = Lvl} when PlayerLvl >= Lvl ->
%%                    case activity:queryActivitySwitch(?ActivityType_CrossGatherBattle) of
%%                        true ->
%%                            case LineID of
%%                                0 ->
%%                                    true;
%%                                _ ->
%%                                    LineNumber = gatherBattleInter:getLineSetNumber(),
%%                                    case ets:lookup(ets_CrossMapLineInfo, LineID) of
%%                                        [#recCrossMapLineInfo{isUse = false}] ->
%%                                            ?ErrorCode_GatherBattleLineIsClose;
%%                                        [#recCrossMapLineInfo{destroyTime = DestroyTime}] when DestroyTime > 0 ->
%%                                            ?ErrorCode_GatherBattleLineIsWaitClose;
%%                                        [#recCrossMapLineInfo{number = Number}] when Number >= LineNumber ->
%%                                            ?ErrorCode_GatherBattleMapLineMore;
%%                                        [] ->
%%                                            ?ErrorCode_GatherBattleLineNotExist;
%%                                        [#recCrossMapLineInfo{}] ->
%%                                            true
%%                                    end
%%                            end;
%%                        _ ->
%%                            ?ErrorCode_CrossActivity_Apply_NotOpen
%%                    end;
%%                _ ->
%%                    ?ErrorCode_SkillLevelNotEnough
%%            end,
%%            CanIn2 =
%%                case CanIn of
%%                    true ->
%%                        case ets:lookup(ets_WaitEnterPlayer, playerState:getRoleID()) of
%%                            [] -> true;
%%                            [#recWaitEnterPlayer{enterTime = ETime}] ->
%%                                Wait = 180,
%%                                Diff = gatherBattleInter:getTime() - ETime,
%%                                case Diff >= Wait of
%%                                    true ->
%%                                        true;
%%                                    _ ->
%%                                        %% 这里需要个剩余时间
%%                                        playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleEnterMapLineCD, [Wait - Diff]),
%%                                        none
%%                                end
%%                        end;
%%                    _ ->
%%                        CanIn
%%                end,
%%            case CanIn2 of
%%                true ->
%%                    case playerScene:getMapType(playerState:getMapID()) of
%%                        ?MapTypeNormal ->
%%                            LineID2 =
%%                                case LineID of
%%                                    0 ->
%%                                        MS = ets:fun2ms(fun(Info) when Info#recCrossMapLineInfo.isUse =:= true -> Info end),
%%                                        List = ets:select(ets_CrossMapLineInfo, MS),
%%                                        lists:reverse(lists:keysort(#recCrossMapLineInfo.number, List));
%%                                    _ ->
%%                                        LineID
%%                                end,
%%                            case LineID2 of
%%                                [] ->
%%                                    playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleNoLine);
%%                                _ ->
%%                                    core:sendMsgToActivity(?ActivityType_CrossGatherBattle, requestEnterMapLine,
%%                                        {playerState:getRoleID(), self(), playerState:getNetPid(), LineID2})
%%                            end;
%%                        _ ->
%%                            skip
%%                    end;
%%                none ->
%%                    skip;
%%                _ ->
%%                    playerMsg:sendErrorCodeMsg(CanIn2)
%%            end,
%%            ok;
%%        _ ->
%%            skip
%%    end,
%%    ok;
%%msg(Msg) ->
%%    ?ERROR("recv error msg:~p,~p", [playerState:getRoleID(), Msg]).
%%
%%breakGatherLock() ->
%%    case playerPropSync:getProp(?PubProp_GatherCode) of
%%        0 ->
%%            skip;
%%        Code ->
%%            RoleID = playerState:getRoleID(),
%%            case ets:lookup(ets_GatherBattleLock, Code) of
%%                [#recGatherBattleLock{ownerID = RoleID}] ->
%%                    core:sendMsgToActivity(?ActivityType_CrossGatherBattle, breakGatherLock, {RoleID, Code});
%%                [#recGatherBattleLock{}] ->
%%                    %% 不是我在锁定了
%%                    skip;
%%                _ ->
%%                    %% 其它情况，修复数据
%%                    skip
%%            end,
%%            playerPropSync:setInt64(?PubProp_GatherCode, 0)
%%    end,
%%    ok.
%%
%%changeGatherBattlePoint(?CoinTypeGatherPoint, Old, New, Change, Reason) ->
%%    try
%%        case Change < 0 of
%%            true ->
%%                SerialNumber = playerState2:addUseGatherBattlePointSerial(),
%%
%%                ?INFO("changeGatherBattlePoint roleID:~p, {old:~p,new:~p,change:~p},reason:~p,sn:~p",
%%                    [playerState:getRoleID(), Old, New, Change, Reason, SerialNumber]),
%%
%%                %% 只允许减少
%%                core:sendMsgToActivity(?ActivityType_CrossGatherBattle, changeGatherBattlePoint,
%%                    {playerState:getRoleID(), self(), playerState:getNetPid(), Change, Reason, SerialNumber}),
%%                ok;
%%            _ ->
%%                %% 不允许增加和为0
%%                ?ERROR("changeGatherBattlePoint:~p,~p,~p,~p,~p",
%%                    [playerState:getRoleID(), Old, New, Change, Reason])
%%        end
%%    catch
%%        _:Why ->
%%            ?ERROR("changeGatherBattlePoint failed:~p,~p,~p,~p,~p,~p",
%%                [playerState:getRoleID(), Old, New, Change, Reason, Why])
%%    end,
%%    ok;
%%changeGatherBattlePoint(_, _Old, _New, _Change, _Reason) ->
%%    ok.
%%
%%changeGatherBattlePointAck({undefined, Point, Reason}) ->
%%    playerState:setCoin(?CoinTypeGatherPoint, Point),
%%
%%    Msg1 = #pk_GS2U_PlayerChangedWealth{type = ?CoinTypeGatherPoint, wealth = Point, reason = Reason},
%%    playerMsg:sendNetMsg(Msg1),
%%    ?INFO("changeGatherBattlePointAck roleID:~p, SerialNumber:~p, Point:~p",
%%        [playerState:getRoleID(), undefined, Point]),
%%    ok;
%%changeGatherBattlePointAck({SerialNumber, Point, Reason}) ->
%%    case playerState2:isEqualUseGatherBattlePointSerial(SerialNumber) of
%%        true ->
%%            playerState:setCoin(?CoinTypeGatherPoint, Point),
%%
%%            Msg1 = #pk_GS2U_PlayerChangedWealth{type = ?CoinTypeGatherPoint, wealth = Point, reason = Reason},
%%            playerMsg:sendNetMsg(Msg1),
%%            ?INFO("changeGatherBattlePointAck roleID:~p, SerialNumber:~p, Point:~p",
%%                [playerState:getRoleID(), SerialNumber, Point]),
%%            ok;
%%        _ ->
%%            Cache = playerState:getCoin(?CoinTypeGatherPoint),
%%            SN = playerState2:getUseGatherBattlePointSerial(),
%%            ?ERROR("changeGatherBattlePointAck roleID:~p, SerialNumber:~p, Point:~p, Cache:{coin:~p,sn:~p}",
%%                [playerState:getRoleID(), SerialNumber, Point, Cache, SN])
%%    end,
%%    ok.
%%
%%getGatherBattlePoint() ->
%%    case gatherBattleInter:getPlayerInfo(playerState:getRoleID()) of
%%        [#rec_crossgatherbattle{gatherPoint = P}] -> P;
%%        _ -> 0
%%    end.
%%
%%enterMap(MapID) ->
%%    case gatherBattleInter:getGatherBattleMapID() of
%%        MapID ->
%%            syncGBInfo();
%%        _ ->
%%            skip
%%    end,
%%    ok.
%%
%%syncGBInfo() ->
%%    case playerState:getRobRoleID() of
%%        0 ->
%%            %% 仅玩家进程执行
%%            Info = gatherBattleInter:getPlayerPKGBInfo(playerState:getRoleID()),
%%            %%    MsgCoin = gatherBattleInter:getPlayerChangedWealth(Info),
%%            %%    playerMsg:sendNetMsg(MsgCoin),
%%            playerMsg:sendNetMsg(#pk_GS2U_SyncGBInfo{info = Info});
%%        _ ->
%%            skip
%%    end.
%%
%%canGather(Code) ->
%%    case core:isCross() of
%%        true ->
%%            case playerPropSync:getProp(?PubProp_GatherCode) of
%%                Code ->
%%                    RoleID = playerState:getRoleID(),
%%                    case ets:lookup(ets_GatherBattleLock, Code) of
%%                        [#recGatherBattleLock{ownerID = RoleID, lockTimeMS = LockTime, timeOutMS = TimeOut}] ->
%%                            case gatherBattleInter:getTime() * 1000 - LockTime < TimeOut of
%%                                true ->
%%                                    %% 检查一下有无收益时间
%%                                    case gatherBattleInter:getPlayerInfo(RoleID) of
%%                                        [#rec_crossgatherbattle{remainTime = RemainTime}] when RemainTime > 0 ->
%%                                            true;
%%                                        _ ->
%%                                            playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleRemainTimeZero),
%%                                            false
%%                                    end;
%%                                _ ->
%%                                    false
%%                            end;
%%                        _ ->
%%                            false
%%                    end;
%%                _ ->
%%                    false
%%            end;
%%        _ ->
%%            false
%%    end.
%%
%%gatherSuccess(Code, ID) ->
%%    case getCfg:getCfgByKey(cfg_object, ID) of
%%        #objectCfg{type = ?GatherType_GatherBattle, param1 = Point} ->
%%            RoleID = playerState:getRoleID(),
%%            case playerPropSync:getProp(?PubProp_GatherCode) of
%%                Code ->
%%                    case ets:lookup(ets_GatherBattleLock, Code) of
%%                        [#recGatherBattleLock{ownerID = RoleID}] ->
%%                            %% 采集成功
%%%%                            playerPropSync:setInt64(?PubProp_GatherCode, 0),
%%
%%                            core:sendMsgToActivity(?ActivityType_CrossGatherBattle, gatherSuccess,
%%                                {RoleID, Code, Point, playerState:getNetPid()});
%%                        Other ->
%%                            ?ERROR("gather failed:~p,[~p,~p],~p", [RoleID, Code, ID, Other]),
%%                            playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleGatherFailed),
%%                            skip
%%                    end;
%%                Code2 ->
%%                    ?ERROR("gather failed:~p,[~p,~p],~p", [RoleID, Code, ID, Code2]),
%%                    playerMsg:sendErrorCodeMsg(?ErrorCode_GatherBattleGatherFailed),
%%                    skip
%%            end;
%%        _ ->
%%            skip
%%    end,
%%    ok.
%%
%%breakGatherLockAck(Code) ->
%%    case playerPropSync:getProp(?PubProp_GatherCode) of
%%        Code ->
%%            playerPropSync:setInt64(?PubProp_GatherCode, 0);
%%        Code2 ->
%%            ?DEBUG("lock another gather:~p other:~p", [Code, Code2]),
%%            skip
%%    end,
%%    ok.
%%
%%requestGBLockGatherAck(#recGatherBattleLock{code = Code}) ->
%%    playerPropSync:setInt64(?PubProp_GatherCode, Code),
%%    ok.
%%
%%requestEnterMapLineCrossAck({ServerID, MapID, MapPid}) ->
%%    ?INFO("requestEnterMapLineCrossAck serverID:~p,~p,~p", [ServerID, MapID, MapPid]),
%%    playerInterface:reqEnterCrossMapPid(ServerID, MapID, MapPid),
%%    ok.