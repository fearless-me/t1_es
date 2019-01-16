%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 世界大战
%%% @end
%%% Created : 27. 六月 2018 14:18
%%%-------------------------------------------------------------------
-module(playerAruna).
-author("tiancheng").
%%
%%-include("playerPrivate.hrl").
%%-include("../crossActivity/aruna/arunaDefine.hrl").
%%
%%-define(ArunaRankNumber, 30).
%%
%%%% API
%%-export([
%%    msg/1
%%]).
%%
%%-export([
%%    requestEnterAruna/1,
%%    requestEnterArunaAck/1,
%%    getLastRewardAck/1,
%%    getPhaseRewardAck/1,
%%    initWorldMaxLevel/0,
%%    initWorldMaxLevel/1,
%%    isHasOpen/0,
%%    enterMap/1,
%%    gatherSuccess/1,
%%    freshPlayerSamplePoint/1,
%%    updateArunaCrossTask/1,
%%    updateArunaTask/1,
%%    updateArunaTask/2,
%%    resetArunaTask/0,
%%    resetArunaTaskAck/1,
%%    submitSamplePoint/2,
%%    onlineInit/0,
%%    modifyArunaProp/0,
%%    getRevivePos/1
%%]).
%%
%%msg(#pk_U2GS_RequestWWLineList{}) ->
%%    sendMsgToActivity(requestWWLineList, playerState:getNetPid());
%%msg(#pk_U2GS_WWRequestEnterMapLine{mapID = _MapID, lineID = LineID}) ->
%%    case playerScene:getMapType(playerState:getMapID()) of
%%        ?MapTypeNormal ->
%%            requestEnterAruna(LineID);
%%        _ ->
%%            playerMsg:sendErrorCodeMsg(?ErrorCode_ForbidChangeMapLine)
%%    end;
%%msg(#pk_U2GS_RequestWWPlayerInfo{}) ->
%%    RoleID = playerState:getRoleID(),
%%    {Conb, Samp} =
%%        case ets:lookup(ets_aruna_world_war, RoleID) of
%%            [#rec_aruna_world_war{contribution = C, sample_point = S}] ->
%%                {C, S};
%%            _ ->
%%                sendMsgToActivity(initPlayerArunaWorldWarData, playerState:getRoleID()),
%%                {0, 0}
%%        end,
%%    playerMsg:sendNetMsg(#pk_GS2U_WWPlayerInfo{contribution = Conb, sample_point = Samp}),
%%    ok;
%%msg(#pk_U2GS_SubmitSamplePoint{configID = ConfigID}) ->
%%    case getCfg:getCfgByKey(cfg_globalsetup, aruna_config_10) of
%%        #globalsetupCfg{setpara = ConfigList} ->
%%            case lists:keyfind(ConfigID, 1, ConfigList) of
%%                {DecV, AddV} ->
%%                    RoleID = playerState:getRoleID(),
%%                    case ets:lookup(ets_aruna_world_war, RoleID) of
%%                        [#rec_aruna_world_war{sample_point = SP}] when SP >= DecV ->
%%                            submitSamplePoint(erlang:abs(DecV), erlang:abs(AddV));
%%                        _ ->
%%                            playerMsg:sendErrorCodeMsg(?ErrorCode_WWWArunaSubmitSampleValueFailed)
%%                    end;
%%                _ ->
%%                    skip
%%            end;
%%        _ ->
%%            skip
%%    end;
%%msg(#pk_U2GS_RequestWWForm{isFreshRank = IsFreshRank}) ->
%%    RankList = lists:reverse(getRankList(1, [])),
%%    FormData = arunaInter:getWWFormData(playerState:getRoleID()),
%%    Msg = #pk_GS2U_WWFormData{isFreshRank = IsFreshRank, rankList = RankList, data = FormData, isInit = false},
%%    freshWWFormData(Msg);
%%msg(#pk_U2GS_GetLastReward{}) ->
%%    RoleID = playerState:getRoleID(),
%%    case ets:lookup(ets_aruna_world_war, RoleID) of
%%        [#rec_aruna_world_war{get_reward_time = GRT}] ->
%%            case arunaInter:isGetLastReward(GRT) of
%%                false ->
%%                    sendMsgToActivity(getLastReward, {RoleID, playerState:getNetPid(), self()});
%%                _ ->
%%                    playerMsg:sendErrorCodeMsg(?ErrorCode_WWWArunaAlreadyGetLastReward)
%%            end;
%%        _ ->
%%            playerMsg:sendErrorCodeMsg(?ErrorCode_WWWArunaGetLastRewardFailed)
%%    end;
%%msg(#pk_U2GS_GetPhaseReward{}) ->
%%    RoleID = playerState:getRoleID(),
%%    Phase = arunaInter:getArunaPhase(),
%%    case ets:lookup(ets_aruna_world_war, RoleID) of
%%        [#rec_aruna_world_war{get_world_reward_phase = GetPhase}] when GetPhase < Phase ->
%%            sendMsgToActivity(getPhaseReward, {RoleID, playerState:getNetPid(), self()});
%%        _ ->
%%            playerMsg:sendErrorCodeMsg(?ErrorCode_WWWArunaGetLastRewardFailed)
%%    end;
%%
%%msg(#pk_U2GS_AtuoSubmitTask{}) ->
%%    % 条件判断
%%    NowTime = misc_time:gregorian_seconds_from_1970( ),
%%    LastGetTime = playerPropSync:getProp(?SerProp_ArunaAutoTaskTime),
%%    case core:timeIsOnDay(LastGetTime, NowTime) of
%%        false ->
%%            RoleLevel = playerState:getLevel(),
%%            MinLevel = case getCfg:getCfgByKey(cfg_aruna_world, arunaInter:getArunaPhase()) of
%%               #aruna_worldCfg{minlevel = CfgMinLevel} ->
%%                   CfgMinLevel;
%%               _ ->
%%                   0
%%            end,
%%            case RoleLevel < MinLevel of
%%                true ->
%%                    playerTask:autoSubmitArunaTask(),
%%                    playerPropSync:setInt(?SerProp_ArunaAutoTaskTime, NowTime);
%%                _ ->
%%                    skip
%%            end;
%%        _ ->
%%            skip
%%    end,
%%    ok;
%%
%%msg(Pk) ->
%%    ?ERROR("unknow msg roleID:~p, Pk:~p", [playerState:getRoleID(), Pk]),
%%    ok.
%%
%%%% 上线初始化
%%onlineInit() ->
%%    %% 初始化Aruna属性
%%    modifyArunaProp(),
%%
%%    %% 给客户端初始化红点值
%%    case core:isCross() of
%%        false ->
%%            RankList = lists:reverse(getRankList(1, [])),
%%            FormData = arunaInter:getWWFormData(playerState:getRoleID()),
%%            Msg = #pk_GS2U_WWFormData{isFreshRank = true, rankList = RankList, data = FormData, isInit = true},
%%            freshWWFormData(Msg);
%%        _ ->
%%            skip
%%    end,
%%    ok.
%%
%%submitSamplePoint(DecSample, AddConb) ->
%%    sendMsgToActivity(submitSamplePoint,
%%        {playerState:getRoleID(), playerState:getNetPid(), DecSample, AddConb}).
%%
%%enterMap(MapID) ->
%%    case isInArunaMap(MapID) of
%%        true ->
%%            % 默认设置为和平模式
%%            playerPk:tranState(?PlayerPeaceStatus),
%%            RoleID = playerState:getRoleID(),
%%            sendMsgToActivity(enterArunaMap,
%%                {RoleID, playerState:getNetPid(), self(), playerState:getMapPid()}),
%%
%%            case ets:lookup(ets_aruna_world_war, RoleID) of
%%                [#rec_aruna_world_war{sample_point = Point}] ->
%%                    playerPropSync:setProp(?PubProp_ArunaSampleValue, Point);
%%                _ ->
%%                    skip
%%            end;
%%        _ ->
%%            skip
%%    end.
%%
%%modifyArunaProp() ->
%%    %% 修正属性
%%    case getCfg:getCfgByKey(cfg_aruna_Rank, arunaInter:getPlayerJxLvl(playerState:getRoleID())) of
%%        #aruna_RankCfg{buff_def = undefined} ->
%%            skip;
%%        #aruna_RankCfg{buff_def = []} ->
%%            skip;
%%        #aruna_RankCfg{buff_def = [{_, _, _} | _] = Props} ->
%%            F =
%%                fun
%%                    ({PropID, Value, 0}, {AccAdd, AccRate}) ->
%%                        %% 加法
%%                        {[{PropID, Value} | AccAdd], AccRate};
%%                    ({PropID, Value, 1}, {AccAdd, AccRate}) ->
%%                        %% 乘法
%%                        {AccAdd, [{PropID, Value} | AccRate]};
%%                    (_, AccL) ->
%%                        AccL
%%                end,
%%            case lists:foldl(F, {[], []}, Props) of
%%                {[], []} -> skip;
%%                {AddProps, RateProps} ->
%%                    playerCalcProp:changeProp_AddMulti([], [], AddProps, RateProps, true),
%%                    playerForce:calcPlayerForce(?PlayerAruna, true)
%%            end,
%%            ok;
%%        _ ->
%%            skip
%%    end,
%%    ok.
%%
%%gatherSuccess(GatherID) ->
%%    case isInArunaMap() of
%%        true ->
%%            case getCfg:getCfgPStack(cfg_object, GatherID) of
%%                %% 仅对跨服骑宠竞速的采集物生效（里程碑）
%%                #objectCfg{type = ?GatherType_Aruna} ->
%%                    sendMsgToActivity(gatherSuccess,
%%                        {playerState:getRoleID(), playerState:getNetPid(), self(), playerState:getMapPid(), GatherID});
%%                _ ->
%%                    skip
%%            end;
%%        _ ->
%%            skip
%%    end,
%%    ok.
%%
%%isInArunaMap() ->
%%    isInArunaMap(playerState:getMapID()).
%%isInArunaMap(MapID) ->
%%    case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
%%        #mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeWorldWar} ->
%%            true;
%%        _ ->
%%            false
%%    end.
%%
%%freshPlayerSamplePoint(Point) when erlang:is_integer(Point) ->
%%    playerPropSync:setProp(?PubProp_ArunaSampleValue, Point),
%%    ok.
%%
%%getLastRewardAck({_RewardPhase, 0}) ->
%%    %% 下周才能领取奖励
%%    playerMsg:sendErrorCodeMsg(?ErrorCode_WWWArunaNextWeekFreshRankGet);
%%getLastRewardAck({RewardPhase, LastRank}) ->
%%    KeyList = getCfg:get1KeyList(cfg_aruna_stageReward),
%%    getLastRewardAck({RewardPhase, LastRank}, lists:reverse(KeyList)).
%%
%%getLastRewardAck({RewardPhase, LastRank}, []) ->
%%    ?ERROR("getLastRewardAck roleID:~p, RewardPhase:~p, LastRank:~p",
%%        [playerState:getRoleID(), RewardPhase, LastRank]),
%%    ok;
%%getLastRewardAck({RewardPhase, LastRank}, [Key | KeyList]) ->
%%    Conf =
%%        case getCfg:getCfgByKey(cfg_aruna_stageReward, Key) of
%%            #aruna_stageRewardCfg{worldid = RewardPhase, rank = [Rank]} = Conf1 when LastRank =:= Rank ->
%%                Conf1;
%%            #aruna_stageRewardCfg{worldid = RewardPhase, rank = [Rank1, Rank2]} = Conf2 when LastRank >= Rank1, LastRank =< Rank2 ->
%%                Conf2;
%%            _ ->
%%                false
%%        end,
%%    case Conf of
%%        #aruna_stageRewardCfg{reward_rank = MilitaryRankValue, reward_Currency = Coin, reward_item = Items} ->
%%            reward(MilitaryRankValue, Coin, Items, Key),
%%
%%            FormData = arunaInter:getWWFormData(playerState:getRoleID()),
%%            freshWWFormData(#pk_GS2U_FreshWWFormData{data = FormData}),
%%            ok;
%%        _ ->
%%            getLastRewardAck({RewardPhase, LastRank}, KeyList)
%%    end.
%%
%%getPhaseRewardAck(GetPhase) ->
%%    case getCfg:getCfgByKey(cfg_aruna_world, GetPhase) of
%%        #aruna_worldCfg{reward_rank = MilitaryRankValue, reward_Currency = Coin, reward = Items} ->
%%            reward(MilitaryRankValue, Coin, Items, GetPhase),
%%
%%            FormData = arunaInter:getWWFormData(playerState:getRoleID()),
%%            freshWWFormData(#pk_GS2U_FreshWWFormData{data = FormData}),
%%            ok;
%%        _ ->
%%            ?ERROR("getPhaseRewardAck:~p,~p", [playerState:getRoleID(), GetPhase]),
%%            skip
%%    end,
%%    ok.
%%
%%-spec freshWWFormData(#pk_GS2U_WWFormData{} | #pk_GS2U_FreshWWFormData{}) -> ok.
%%freshWWFormData(Data) ->
%%    sendMsgToActivity(freshWWFormData, {playerState:getNetPid(), Data}).
%%
%%reward(MilitaryRankValue, ArunaCoin, ItemList, Param) ->
%%    case ArunaCoin > 0 of
%%        true ->
%%            CoinLog = #recPLogTSMoney{reason = ?CoinSourceArunaWorldWar, param = Param, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Aruna},
%%            playerMoney:addCoin(?CoinTypeAruna, ArunaCoin, CoinLog);
%%        _ ->
%%            skip
%%    end,
%%
%%    addArunaMilitaryRankValue(MilitaryRankValue),
%%
%%    F =
%%        fun
%%            ({ItemID, Number}) ->
%%                PLog = #recPLogTSItem{
%%                    old = 0,
%%                    new = Number,
%%                    change = Number,
%%                    target = ?PLogTS_PlayerSelf,
%%                    source = ?PLogTS_Aruna,
%%                    gold = 0,
%%                    goldtype = 0,
%%                    changReason = ?ItemSourceArunaWorldWar,
%%                    reasonParam = Param
%%                },
%%                playerPackage:addGoodsAndMail(ItemID, Number, false, 0, PLog);
%%            (_Item) ->
%%                ?ERROR("reward item error:~p,~p", [playerState:getRoleID(), ItemList])
%%        end,
%%    lists:foreach(F, ItemList),
%%    ok.
%%
%%addArunaMilitaryRankValue(0) ->
%%    false;
%%addArunaMilitaryRankValue(Value) ->
%%    Old = playerPropSync:getProp(?PubProp_ArunaValue),
%%    playerPropSync:setProp(?PubProp_ArunaValue, Old + Value).
%%
%%getRankList(Index, RetList) when Index > ?ArunaRankNumber ->
%%    RetList;
%%getRankList(Index, RetList) ->
%%    case ets:lookup(ets_ww_world_rank, Index) of
%%        [#ww_world_rank{} = Rank] ->
%%            R = #pk_WWRank{
%%                %% UInt16 排名
%%                rankIndex = Rank#ww_world_rank.rankIndex,
%%                %% UInt64 角色ID
%%                roleID = Rank#ww_world_rank.roleID,
%%                %% String
%%                roleName = Rank#ww_world_rank.roleName,
%%                %% String
%%                guildName = Rank#ww_world_rank.guildName,
%%                %% UInt32 贡献值
%%                contribution = Rank#ww_world_rank.contribution
%%            },
%%            getRankList(Index + 1, [R | RetList]);
%%        _ ->
%%            RetList
%%    end.
%%
%%requestEnterAruna(LineID) ->
%%    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Aruna_WorldWar) of
%%        true ->
%%            sendMsgToActivity(requestEnterAruna, {playerState:getRoleID(), playerState:getName(), self(), playerState:getNetPid(), LineID});
%%        _ ->
%%            playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
%%    end,
%%    ok.
%%
%%requestEnterArunaAck({ServerID, MapID, MapPid}) ->
%%    ?INFO("requestEnterArunaAck serverID:~p,~p,~p", [ServerID, MapID, MapPid]),
%%    playerInterface:reqEnterCrossMapPidServerBattle(ServerID, MapID, MapPid, 1),
%%    ok.
%%
%%sendMsgToActivity(Msg, Data) -> core:sendMsgToActivity(?ActivityType_WorldWar, Msg, Data).
%%
%%initWorldMaxLevel() ->
%%    ets:insert(ets_aruna_jx, #recKeyValue{key = playerState:getRoleID(), value = playerPropSync:getProp(?PubProp_ArunaValue)}),
%%    Ret = initWorldMaxLevel(arunaInter:getArunaPhase()),
%%    resetArunaTask(),
%%    Ret.
%%initWorldMaxLevel(Phase) ->
%%    MaxLevel =
%%        case getCfg:getCfgByKey(cfg_aruna_world, Phase) of
%%            #aruna_worldCfg{worldlevel = [_, Max]} when erlang:is_integer(Max) ->
%%                Max;
%%            #aruna_worldCfg{worldlevel = Max} when erlang:is_integer(Max) ->
%%                Max;
%%            _ ->
%%                skip
%%        end,
%%    case erlang:is_integer(MaxLevel) of
%%        true ->
%%            LevelList = getCfg:get1KeyList(cfg_indexFunction),
%%            IndexMax = lists:max(LevelList),
%%            Value = case isHasOpen() of
%%                        true ->
%%                            erlang:min(IndexMax, MaxLevel);
%%                        _ ->
%%                            CfgMaxLevel = case getCfg:getCfgByKey(cfg_globalsetup, player_maxlevel) of
%%                                              #globalsetupCfg{setpara = [ConfigMaxLevel]} ->
%%                                                  ConfigMaxLevel;
%%                                              _ ->
%%                                                  ?ERROR("cfg_globalsetup.player_maxlevel config error"),
%%                                                  1
%%                                          end,
%%                            erlang:min(IndexMax, CfgMaxLevel)
%%                    end,
%%            playerState2:setWorldMaxLevel(Value),
%%            Value;
%%        _ ->
%%            ?ERROR("initWorldMaxLevel failed:~p,~p default 1", [playerState:getRoleID(), Phase]),
%%            1
%%    end.
%%
%%updateArunaCrossTask(#rec_task{taskType = ?TaskMainType_Aruna,
%%    taskID = TaskID, taskTarget = T, taskTargetCur = C, taskTargetMax = M} = Task) ->
%%    case core:isCross() of
%%        false -> skip;
%%        _ ->
%%            RoleID = playerState:getRoleID(),
%%
%%            ServerID = core:getRealDBIDByUID(RoleID),
%%
%%            ?INFO("updateArunaCrossTask roleID:~p,~p, taskID:~p, [~p,~p,~p]", [RoleID, ServerID, TaskID, T, C, M]),
%%
%%            gsCsInterface:transitMsg2ServerOtp(ServerID, ?PsNamePlayerMgr_2, updateArunaCrossTask, {RoleID, Task}),
%%            ok
%%    end;
%%updateArunaCrossTask(_) ->
%%    skip.
%%
%%updateArunaTask(TaskSubType, Number) ->
%%    case core:isCross() of
%%        true ->
%%            case isInArunaMap() of
%%                true ->
%%                    playerTask:updateTaskCount(TaskSubType, 0, Number);
%%                _ ->
%%                    skip
%%            end;
%%        _ ->
%%            skip
%%    end,
%%    ok.
%%
%%%% 跨服发送过来，刷新任务的状态
%%updateArunaTask(#rec_task{taskID = TaskID} = NewTask) ->
%%    L1 = playerState:getAcceptedTask(),
%%    L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
%%    playerState:setAcceptedTask(L2),
%%    ok.
%%
%%resetArunaTask() ->
%%    RoleID = playerState:getRoleID(),
%%    CanFresh =
%%        case ets:lookup(ets_aruna_world_war, RoleID) of
%%            [#rec_aruna_world_war{task_fresh_time = 0}] ->
%%                true;
%%            [#rec_aruna_world_war{task_fresh_time = FreshTime}] ->
%%                not core:timeIsOnDay(FreshTime, arunaInter:getTime());
%%            [] ->
%%                true;
%%            _ ->
%%                false
%%        end,
%%    case CanFresh of
%%        true ->
%%            sendMsgToActivity(resetArunaTask, {RoleID, self(), arunaInter:getTime()}),
%%            ok;
%%        _ ->
%%            skip
%%    end,
%%    ok.
%%
%%resetArunaTaskAck(_Data) ->
%%    Phase = arunaInter:getArunaPhase(),
%%    Level = playerState:getLevel(),
%%
%%    %% 先删除原来的Aruna任务
%%    FGiveUp =
%%        fun(#rec_task{taskID = TaskID}) ->
%%            case getCfg:getCfgByKey(cfg_task, TaskID) of
%%                #taskCfg{type = ?TaskMainType_Aruna} ->
%%                    playerTask:cancelTask(TaskID);
%%                _ ->
%%                    skip
%%            end
%%        end,
%%    lists:foreach(FGiveUp, playerState:getAcceptedTask()),
%%
%%    %% 重新接
%%    F =
%%        fun(Key, {_, Num}) ->
%%            TaskIDs =
%%                case getCfg:getCfgByKey(cfg_aruna_task, Key) of
%%                    #aruna_taskCfg{worldid = Phase, limit = [], taskid = Ids} ->
%%                        Ids;
%%                    #aruna_taskCfg{worldid = Phase, limit = [LvlMin, LvlMax], taskid = Ids} when Level > LvlMin, Level =< LvlMax ->
%%                        Ids;
%%                    _ ->
%%                        []
%%                end,
%%
%%            TaskID =
%%                case TaskIDs of
%%                    [] -> 0;
%%                    [TID] ->
%%                        TID;
%%                    _ ->
%%                        lists:nth(misc:rand(1, erlang:length(TaskIDs)), TaskIDs)
%%                end,
%%
%%            Ret =
%%                case TaskID of
%%                    0 -> true;
%%                    _ ->
%%                        playerTask:acceptTask(TaskID, 0)
%%                end,
%%
%%            Number =
%%                if
%%                    TaskID =:= 0 -> Num;
%%                    Ret -> Num + 1;
%%                    true ->
%%                        ?ERROR("accept task failed:~p,~p", [playerState:getRoleID(), TaskID]),
%%                        Num
%%                end,
%%            {not Ret, Number}
%%        end,
%%    Result = misc:foldlEx(F, {false, 0}, getCfg:get1KeyList(cfg_aruna_task)),
%%    ?DEBUG("fresh task[~p,~p] phase[~p] task ret[~p]", [playerState:getRoleID(), Level, Phase, Result]).
%%
%%isHasOpen() ->
%%    case core:isCross() of
%%        true ->
%%            playerState2:getIsHasAruna();
%%        _ ->
%%            variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Aruna_WorldWar)
%%    end.
%%
%%%% 获取复活坐标
%%-spec getRevivePos(MapID :: integer()) -> {float(), float()} | false.
%%getRevivePos(MapID) ->
%%    case isInArunaMap(MapID) of
%%        true ->
%%            #globalsetupCfg{setpara = [MapPosList]} = getCfg:getCfgPStack(cfg_globalsetup, aruna_config_20),
%%            Fun =
%%                fun
%%                    ({MapID_, X, Y}, List) when MapID =:= MapID_ ->
%%                        [{X, Y} | List];
%%                    (_, List) ->
%%                        List
%%                end,
%%            PosList = lists:foldl(Fun, [], MapPosList),
%%            NTH = misc:rand(1, erlang:length(PosList)),
%%            lists:nth(NTH, PosList);
%%        _ ->
%%            false
%%    end.