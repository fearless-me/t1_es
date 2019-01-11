%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 装备重铸
%%% @end
%%% Created : 01. 十一月 2017 17:39
%%%-------------------------------------------------------------------
-module(playerEquipRecast).
-author("tiancheng").

-include("playerPrivate.hrl").

-define(RecastTypeCommon, 1).
-define(RecastTypeAdvance, 2).

%% API
-export([
    onlineFreshProp/0,
    equipRecastInit/0,
    equipRecastInitFresh/1,
    sendEquipRecastInit2Client/0,
    equipRecast/1,
    equipRecast/2
]).

onlineFreshProp() ->
    skip.   %% LUNA-9073
%%    List = playerPropSync:getProp(?SerProp_EquipRecastList),
%%    lists:foreach(
%%        fun(#recEquipRecast{} = EquipRecast) ->
%%            onRecastStore(EquipRecast, ?EquipOn, true)
%%        end, List).

%% --- 初始化
equipRecastInit() ->
    skip.   %% LUNA-9073
    %% equipRecastInitFresh(playerState:getLevel()).

equipRecastInitFresh(PlayerLevel) ->
    %% LUNA-9073
%%    BaseCareer = ?Career2CareerBase(playerState:getCareer()),
%%    Seq = lists:seq(?EquipTypeStart + 1, ?EquipTypeMax + 1),
%%    RecastProps =
%%        lists:foldl(
%%            fun(EquipPos, Acc) ->
%%                LvlList = getCfg:get3KeyList(cfg_equipRecastInit, EquipPos, BaseCareer),
%%                LvlList2 = lists:reverse(lists:sort(LvlList)),
%%                case lists:filter(fun(E) -> PlayerLevel >= E end, LvlList2) of
%%                    [Lvl|_] ->
%%                        #equipRecastInitCfg{
%%                            props = Props
%%                        } = InitConf = getCfg:getCfgByKey(cfg_equipRecastInit, EquipPos, BaseCareer, Lvl),
%%
%%                        %% 刷新属性最大值与新增属性
%%                        Recast =
%%                            case lists:keyfind(EquipPos, #recEquipRecast.equip_pos, Acc) of
%%                                #recEquipRecast{props = OldProps} = OldRecast ->
%%                                    %% 合并普通附魔属性
%%                                    {_, AddProps} =
%%                                        lists:foldl(
%%                                            fun({PropID, Val, Max}, {Index, Acc_Props}) ->
%%                                                case lists:keyfind(PropID, #recRecastProp.prop_id, Acc_Props) of
%%                                                    #recRecastProp{} = Old ->
%%                                                        {Index + 1, lists:keystore(PropID, #recRecastProp.prop_id, Acc_Props, Old#recRecastProp{prop_max = Max})};
%%                                                    _ ->
%%                                                        NewRec = #recRecastProp{prop_pos = Index, prop_id = PropID, prop_val = Val, prop_max = Max},
%%                                                        {Index + 1, [NewRec | Acc_Props]}
%%                                                end
%%                                            end, {1, OldProps}, Props),
%%
%%                                    OldRecast#recEquipRecast{recast_lvl = Lvl, props = AddProps};
%%                                false ->
%%                                    %% 新增普通附魔属性
%%                                    {_, AddProps} =
%%                                        lists:foldl(
%%                                            fun({PropID, Val, Max}, {Index, Acc_Props}) ->
%%                                                NewRec = #recRecastProp{prop_pos = Index, prop_id = PropID, prop_val = Val, prop_max = Max},
%%                                                {Index + 1, [NewRec | Acc_Props]}
%%                                            end, {1, []}, Props),
%%
%%                                    #recEquipRecast{equip_pos = EquipPos, recast_lvl = Lvl, props = AddProps}
%%                            end,
%%
%%                        %% 合并专精附魔属性
%%                        NewRecast = freshRecastAdvanceProp(BaseCareer, Recast, InitConf),
%%                        lists:keystore(EquipPos, #recEquipRecast.equip_pos, Acc, NewRecast);
%%                    _ ->
%%                        Acc
%%                end
%%            end, playerPropSync:getProp(?SerProp_EquipRecastList), Seq),
%%    playerPropSync:setAny(?SerProp_EquipRecastList, RecastProps),
%%
%%    %% notice client
%%    sendEquipRecastInit2Client(),
    ok.

%% 刷新专精附魔属性最大值和补充属性
freshRecastAdvanceProp(BaseCareer,
    #recEquipRecast{equip_pos = EquipPos, recast_val = RecastVal, recast_lvl = Lvl, props_ext = PropsExt} = Recast,
    #equipRecastInitCfg{lockCastVal = LockCastVal} = Conf) ->
    #equipRecastAdvanceCfg{
        props_1 = Prop1,
        props_2 = Prop2,
        props_3 = Prop3
    } = getCfg:getCfgByKey(cfg_equipRecastAdvance, EquipPos, BaseCareer, Lvl),
    LenConf = erlang:length(lists:filter(fun(E) -> E =< RecastVal end, LockCastVal)),
    LenSelf = erlang:length(PropsExt),
    Diff = LenConf - LenSelf,
    case Diff of
        0 ->
            NewPropsExt =
                if
                    LenConf =:= 0 andalso LenSelf =:= 0 -> PropsExt;
                    LenConf =:= 1 andalso LenSelf =:= 1 -> freshRecastAdvanceProp(PropsExt, [{1, Prop1}]);
                    LenConf =:= 2 andalso LenSelf =:= 2 -> freshRecastAdvanceProp(PropsExt, [{1, Prop1}, {2, Prop2}]);
                    LenConf =:= 3 andalso LenSelf =:= 3 -> freshRecastAdvanceProp(PropsExt, [{1, Prop1}, {2, Prop2}, {3, Prop3}])
                end,
            Recast#recEquipRecast{props_ext = NewPropsExt};
        _ when Diff > 0,Diff < 4 ->
            NewPropsExt =
                if
                    LenConf =:= 1 andalso LenSelf =:= 0 -> freshRecastAdvanceProp(PropsExt, [{1, Prop1}]);
                    LenConf =:= 2 andalso LenSelf =:= 0 -> freshRecastAdvanceProp(PropsExt, [{1, Prop1}, {2, Prop2}]);
                    LenConf =:= 2 andalso LenSelf =:= 1 -> freshRecastAdvanceProp(PropsExt, [{2, Prop2}]);
                    LenConf =:= 3 andalso LenSelf =:= 0 -> freshRecastAdvanceProp(PropsExt, [{1, Prop1}, {2, Prop2}, {3, Prop3}]);
                    LenConf =:= 3 andalso LenSelf =:= 1 -> freshRecastAdvanceProp(PropsExt, [{2, Prop2}, {3, Prop3}]);
                    LenConf =:= 3 andalso LenSelf =:= 2 -> freshRecastAdvanceProp(PropsExt, [{3, Prop3}])
                end,
            Recast#recEquipRecast{props_ext = NewPropsExt};
        _ ->
            ?ERROR("freshRecastAdvanceProp conf error:~p,~p,~p,~p,Diff[~p]",
                [playerState:getRoleID(), BaseCareer, Recast, Conf, Diff]),
            Recast
    end.

freshRecastAdvanceProp(PropsExt, PropsConf) ->
    F =
        fun({Index, Prop}, Acc) ->
            [PropID,_GroupID,_Min|_] = Prop,
            Max = lists:last(Prop),
            case lists:keyfind(Index, #recRecastProp.prop_pos, Acc) of
                #recRecastProp{} = Old ->
                    lists:keystore(Index, #recRecastProp.prop_pos, Acc, Old#recRecastProp{prop_max = Max});
                _ ->
                    [#recRecastProp{prop_pos = Index, prop_id = PropID, prop_val = 0, prop_max = Max} | Acc]
            end
        end,
    lists:foldl(F, PropsExt, PropsConf).

sendEquipRecastInit2Client() ->
    %% LUNA-9073
%%    List = playerPropSync:getProp(?SerProp_EquipRecastList),
%%    InfoList =
%%        lists:map(
%%            fun(#recEquipRecast{equip_pos = Pos, recast_val = Val, props = Props, props_ext = PropsExt}) ->
%%                #pk_RecastPosInfo{
%%                    equipPos = Pos,
%%                    recastVal = Val,
%%                    recastInfo = translateProp2Net(Props), recastInfo_ext = translateProp2Net(PropsExt)
%%                }
%%            end, List),
%%    Msg = #pk_GS2U_EquipRecastInfoInit{recastInfoList = InfoList},
%%    playerMsg:sendNetMsg(Msg),
    ok.

%% 普通重铸
equipRecast(EquipPos) ->
    skip.   %% LUNA-9073
%%    List = playerPropSync:getProp(?SerProp_EquipRecastList),
%%    case lists:keyfind(EquipPos, #recEquipRecast.equip_pos, List) of
%%        #recEquipRecast{props = Props, recast_val = RecastVal, recast_lvl = Lvl} = Recast ->
%%            %% 检查所有属性是否已满
%%            case lists:filter(fun(#recRecastProp{prop_val = Val, prop_max = Max}) -> Val < Max end, Props) of
%%                [] -> skip;
%%                _ ->
%%                    BaseCareer = ?Career2CareerBase(playerState:getCareer()),
%%                    #equipRecastInitCfg{
%%                        cost = CostGroup,
%%                        group = PropGroups,
%%                        reCastValue = ReCastValue
%%                    } = InitConf = getCfg:getCfgByKey(cfg_equipRecastInit, EquipPos, BaseCareer, Lvl),
%%                    %% 检查消耗
%%                    {Cost, Index} = getRecastCost(RecastVal, ReCastValue, CostGroup),
%%                    case checkRecastCost(Cost) of
%%                        {true, _} ->
%%                            %% 扣材料
%%                            true = recastCost(Cost, ?RecastTypeCommon),
%%
%%                            ?DEBUG("equipRecast:~p,~p,~p,~p", [playerState:getRoleID(), InitConf, Cost, Index]),
%%
%%                            %% 随机属性
%%                            {NewRecast, Score} = equipRecastCommon(Recast, lists:max(ReCastValue), lists:nth(Index, PropGroups)),
%%
%%                            %% 合并专精附魔属性
%%                            NewRecast2 = freshRecastAdvanceProp(BaseCareer, NewRecast, InitConf),
%%
%%                            %% 保存并通知客户端
%%                            equipRecastReplace(Recast, NewRecast2, ?RecastTypeCommon, Score),
%%
%%                            %% 成就
%%
%%                            playerAchieve:achieveEvent(?Achieve_Floating_normalenchant_1,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_Floating_normalenchant_2,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_Floating_normalenchant_3,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_Floating_normalenchant_4,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_Floating_normalenchant_5,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_normalenchant,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_ConciseMaster, [1]),
%%                            playerSevenDays:onMissionEvent(?SevenDayMission_Event_11, 1, 0),
%%
%%                            playerSevenDayAim:updateCondition(?SevenDayAim_Enchant,[EquipPos,NewRecast#recEquipRecast.recast_val]),
%%                            ok;
%%                        {_, ErrorCode} ->
%%                            playerMsg:sendErrorCodeMsg(ErrorCode)
%%                    end
%%            end;
%%        _ ->
%%            skip
%%    end.

%% 专精重铸
equipRecast(EquipPos, PropPos) ->
    skip.   %% LUNA-9073
%%    List = playerPropSync:getProp(?SerProp_EquipRecastList),
%%    case lists:keyfind(EquipPos, #recEquipRecast.equip_pos, List) of
%%        #recEquipRecast{props_ext = PropsExt, recast_lvl = Lvl} = Recast ->
%%            %% 检查属性是否已满
%%            case lists:keyfind(PropPos, #recRecastProp.prop_pos, PropsExt) of
%%                false -> skip;
%%                #recRecastProp{prop_val = Val, prop_max = Max} when Val >= Max -> skip;
%%                #recRecastProp{prop_val = Val} = Prop ->
%%                    BaseCareer = ?Career2CareerBase(playerState:getCareer()),
%%                    #equipRecastInitCfg{} = InitConf = getCfg:getCfgByKey(cfg_equipRecastInit, EquipPos, BaseCareer, Lvl),
%%                    #equipRecastAdvanceCfg{
%%                        props_1 = Props1,
%%                        cost_1 = Costs1,
%%                        props_2 = Props2,
%%                        cost_2 = Costs2,
%%                        props_3 = Props3,
%%                        cost_3 = Costs3
%%                    } = AdvanceCfg = getCfg:getCfgByKey(cfg_equipRecastAdvance, EquipPos, BaseCareer, Lvl),
%%
%%                    {GroupID, Cost} =
%%                        case PropPos of
%%                            1 -> getAdvanceGroupIDAndCost(Props1, Val, Costs1);
%%                            2 -> getAdvanceGroupIDAndCost(Props2, Val, Costs2);
%%                            3 -> getAdvanceGroupIDAndCost(Props3, Val, Costs3)
%%                        end,
%%
%%                    %% 检查消耗
%%                    case checkRecastCost(Cost) of
%%                        {true, _} ->
%%                            ?DEBUG("equipRecast:~p,~p,~p,~p,~p", [playerState:getRoleID(), InitConf, AdvanceCfg, GroupID, Cost]),
%%
%%                            %% 扣材料
%%                            true = recastCost(Cost, ?RecastTypeAdvance),
%%
%%                            %% 随机属性
%%                            {NewProp, Score, _AddJD} = equipRecastAdvance(Prop, GroupID),
%%
%%                            NewPropsExt = lists:keystore(PropPos, #recRecastProp.prop_pos, PropsExt, NewProp),
%%                            NewRecast = Recast#recEquipRecast{props_ext = NewPropsExt},
%%
%%                            %% 合并专精附魔属性
%%                            NewRecast2 = freshRecastAdvanceProp(BaseCareer, NewRecast, InitConf),
%%
%%                            %% 保存并通知客户端
%%                            equipRecastReplace(Recast, NewRecast2, ?RecastTypeAdvance, Score),
%%
%%                            %% 成就
%%                            playerAchieve:achieveEvent(?Achieve_Floating_specialization_enchant_1,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_Floating_specialization_enchant_2,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_Floating_specialization_enchant_3,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_Floating_specialization_enchant_4,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_Floating_specialization_enchant_5,[1]),
%%                            playerAchieve:achieveEvent(?Achieve_specialization_enchant,[1]),
%%
%%                            playerAchieve:achieveEvent(?Achieve_ConciseMaster, [1]),
%%                            playerSevenDays:onMissionEvent(?SevenDayMission_Event_11, 1, 0),
%%                            playerSevenDayAim:updateCondition(?SevenDayAim_Enchant,[EquipPos,NewRecast#recEquipRecast.recast_val]),
%%                            ok;
%%                        {_, ErrorCode} ->
%%                            playerMsg:sendErrorCodeMsg(ErrorCode)
%%                    end
%%            end;
%%        _ ->
%%            skip
%%    end.

getAdvanceGroupIDAndCost(Props, Val, Costs) ->
    [_PropID, GroupID, M1, M2 | ML] = Props,
    Index =
        case Val >= M1 andalso Val < M2 of
            true ->
                1;
            _ ->
                L = [M2 | ML],

                case lists:filter(fun(E) -> Val >= E end, lists:reverse(L)) of
                    [V|_] ->
                        misc:getListPos(V, L) + 1;
                    _ ->
                        2
                end
        end,
    case Index =< erlang:length(Costs) of
        true ->
            {GroupID, lists:nth(Index, Costs)};
        _ ->
            {GroupID, lists:last(Costs)}
    end.

getRecastCost(RecastVal, ReCastValue, Costs) ->
    Index =
        case lists:filter(fun(E) -> E =< RecastVal end, lists:reverse(ReCastValue)) of
            [V|_] ->
                misc:getListPos(V, ReCastValue) + 1;
            _ ->
                1
        end,
    case Index =< erlang:length(Costs) of
        true ->
            {lists:nth(Index, Costs), Index};
        _ ->
            {lists:last(Costs), erlang:length(Costs)}
    end.

checkRecastCost({ItemID, ItemNum}) ->
    {playerPackage:getItemNumByID(ItemID) >= ItemNum, ?ErrorCode_BagEquipRecastMaterialNotEnough}.

recastCost({ItemID, ItemNum}, Reason) ->
    %% 扣除道具
    PLog = #recPLogTSItem{
        old = 1,
        new = 0,
        change = -ItemNum,
        target = ?PLogTS_EquipRecast,
        source = ?PLogTS_PlayerSelf,
        gold = 0,
        goldtype = 0,
        changReason = ?ItemDeleteReasonRecast,
        reasonParam = Reason
    },
    playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, ItemNum, PLog).

%% --- 重铸
equipRecastCommon(#recEquipRecast{props = Props, recast_val = RecastVal} = Recast,
    ReCastValueMax, {_PropGroupID1, _PropGroupID2, _PropGroupID3} = GroupIDs) ->
    #globalsetupCfg{setpara = [P1, P2, P3]} = getCfg:getCfgPStack(cfg_globalsetup, equipRecast_enchant_interval),
    {AllPer, AddJD, NewProps} =
        lists:foldl(
            fun(#recRecastProp{prop_pos = Pos, prop_val = Val, prop_max = Max} = Prop, {P, J, Acc}) ->
                Diff = Max - Val,
                case Diff > 0 of
                    true ->
                        GroupID = lists:nth(Pos, tuple_to_list(GroupIDs)),
                        {AddPropVal, Per, AddJDVal} = randValueFromOneGroup(GroupID),
                        case AddPropVal > 0 of
                            true ->
                                {Per + P, AddJDVal + J, [Prop#recRecastProp{prop_val = erlang:min(Val + AddPropVal, Max)} | Acc]};
                            _ ->
                                {P, J, [Prop | Acc]}
                        end;
                    _ ->
                        {P, J, [Prop | Acc]}
                end
            end, {0, 0, []}, Props),

    PP = AllPer * 100 / 3,
    Score =
        if
            PP >= P1 andalso PP =< P2 -> 1;
            PP > P2 andalso PP =< P3 -> 2;
            PP > P3 andalso PP =< 100 -> 3;
            true -> 0
        end,
    NewRecast = Recast#recEquipRecast{props = NewProps, recast_val = erlang:min(RecastVal + AddJD, ReCastValueMax)},
    {NewRecast, Score};
equipRecastCommon(Recast, Max, Data) ->
    ?ERROR("equipRecastCommon:~p,~p,~p,~p", [playerState:getRoleID(), Recast, Max, Data]),
    {Recast, 0}.

%% --- 高级重铸
equipRecastAdvance(#recRecastProp{prop_val = Val, prop_max = Max} = Prop, GroupID) ->
    {AddPropVal, Per, AddJDVal} = randValueFromOneGroup(GroupID),
    #globalsetupCfg{setpara = [P1, P2, P3]} = getCfg:getCfgPStack(cfg_globalsetup, equipRecast_enchant_interval),
    PP = Per * 100,
    Score =
        if
            PP >= P1 andalso PP =< P2 -> 1;
            PP > P2 andalso PP =< P3 -> 2;
            PP > P3 andalso PP =< 100 -> 3;
            true -> 0
        end,
    RAddPropVal = case AddPropVal > 0 of
                      true ->
                          AddPropVal;
                      _ ->
                          0
                  end,
    {Prop#recRecastProp{prop_val = erlang:min(Val + RAddPropVal, Max)}, Score, AddJDVal}.

%% --- 替换属性
equipRecastReplace(OldRecast, RecastStore, Type, Score) ->
    ?DEBUG("player[~p] store [~p]", [playerState:getRoleID(), RecastStore]),
    case RecastStore of
        #recEquipRecast{} ->
            saveEquipRecastProperty(RecastStore),
            sendRecastInfo2Client(RecastStore, Type, Score),
            onRecastStore(OldRecast, ?EquipOff, false),
            onRecastStore(RecastStore, ?EquipOn, true);
        _ ->
            skip
    end,
    ok.

onRecastStore(Recast, OpType, IsNotify) ->
    #recEquipRecast{props = Props, props_ext = PropEx} = Recast,
    MF =
        fun(#recRecastProp{prop_id = PropID, prop_val = PropVal}, Acc) ->
            [{PropID, PropVal, ?PropCalcType_Add} | Acc]
        end,
    ExtProp1 = lists:foldl(MF, [], Props),
    ExtProp2 = lists:foldl(MF, ExtProp1, PropEx),
    playerCalcProp:changeProp_CalcType(ExtProp2, OpType, IsNotify),
    playerForce:calcPlayerForce(IsNotify),
    ok.

sendRecastInfo2Client(#recEquipRecast{equip_pos = Pos, recast_val = Val, props = Props, props_ext = PropsExt}, Type, Score) ->
    Info = #pk_RecastPosInfo{
        equipPos = Pos,
        recastVal = Val,
        recastInfo = translateProp2Net(Props),
        recastInfo_ext = translateProp2Net(PropsExt)
    },
    playerMsg:sendNetMsg(#pk_GS2U_EquipRecastInfo{recastType = Type, score = Score, recastInfo = Info}).

translateProp2Net(Props) ->
    [#pk_RecastPropInfo{pos = Pos, propIndex = PropIdx, propValue = PropVal, propValMax = Max} ||
        #recRecastProp{prop_pos = Pos, prop_id = PropIdx, prop_val = PropVal, prop_max = Max} <- Props].

saveEquipRecastProperty(#recEquipRecast{equip_pos = EquipPos} = Rec) ->
    L1 = playerPropSync:getProp(?SerProp_EquipRecastList),
    L2 = lists:keystore(EquipPos, #recEquipRecast.equip_pos, L1, Rec),
    playerPropSync:setAny(?SerProp_EquipRecastList, L2);
saveEquipRecastProperty(Rec) ->
    ?ERROR("setEquipRecast error, ~p, ~p", [Rec]).

randValueFromOneGroup(GroupID) ->
    L1 = getCfg:get1KeyList(cfg_equipRecastRand),
    L2 = lists:foldl(
        fun(ID, Acc) ->
            case getCfg:getCfgByArgs(cfg_equipRecastRand, ID) of
                #equipRecastRandCfg{group = GroupID, weight = Weight} = Cfg ->
                    [{Weight, Cfg} | Acc];
                _ ->
                    Acc
            end
        end, [], L1),
    case misc:calcOddsByWeightList(L2) of
        #equipRecastRandCfg{values = [Min, Max], enchant_add = [AddMin, AddMax]} ->
            Val = misc:rand(Min, Max),
            Per = (Val - Min) / (Max - Min),
            AddVal = Per * (AddMax - AddMin) + AddMin,
            {Val, Per, erlang:trunc(AddVal)};
        _ ->
            {0, 0.0, 0}
    end.