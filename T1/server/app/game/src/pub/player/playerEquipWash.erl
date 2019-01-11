%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 十一月 2017 10:01
%%%-------------------------------------------------------------------
-module(playerEquipWash).
-author("mawenhong").

-include("gsInc.hrl").
-include("playerPropSyncDefine.hrl").
-include("playerPrivate.hrl").

%% API
-export([
    equipWash/4,
    onEquipResolve/1,
    checkEquipWashConfig/0,
    checkDifferentConfig/0
]).

onEquipResolve(#recSaveEquip{itemID = DataID, enhanceProp = Enc}) ->
    {Level, EQ} = getEquipLevelAndQuality(DataID),
    {EquipTpe, _SubType} = playerEquip:getEquipType(DataID),

    case getCfg:getCfgByArgs(cfg_globalsetup, equip_wash) of
        #globalsetupCfg{setpara = [_X, LQ, LevelMin]} ->
            case EQ >= LQ andalso Level >= LevelMin of
                true ->
                    #equipWashEcoCfg{item = ReturnItemID}
                        = getCfg:getCfgByArgs(cfg_equipWashEco, Level, EQ, EquipTpe),
                    #rec_equip_enhance_info{
                        equipUID = _EquipUID
                        , propKey1 = PropID1, propValue1 = PropVal1
                        , propKey2 = PropID2, propValue2 = PropVal2
                        , propKey3 = PropID3, propValue3 = PropVal3
                        , propKey4 = PropID4, propValue4 = PropVal4
                        , propKey5 = PropID5, propValue5 = PropVal5
                    } = Enc,

                    PVL =
                        [
                            {PropID1, PropVal1},
                            {PropID2, PropVal2},
                            {PropID3, PropVal3},
                            {PropID4, PropVal4},
                            {PropID5, PropVal5}
                        ],

                    ReturnNum1 =
                        lists:foldl(
                            fun({PI, PV}, AccN) ->
                                case getCfg:getCfgByKey(cfg_equipWash, Level, EQ, PI) of
                                    #equipWashCfg{valueDown = VD, breakUpPara = BUP} when PV > VD ->
                                        AccN + erlang:float(PV - VD) / BUP;
                                    _ ->
                                        AccN
                                end
                            end, 0, PVL),

                    ReturnNum = erlang:trunc(ReturnNum1),

                    PLog = #recPLogTSItem{
                        old = 0,
                        new = ReturnNum,
                        change = ReturnNum,
                        target = ?PLogTS_PlayerSelf,
                        source = ?PLogTS_EquipWash,
                        gold = 0,
                        goldtype = 0,
                        changReason = ?ItemSourceEquipResolve,
                        reasonParam = 0
                    },
                    playerPackage:addGoodsAndMail(ReturnItemID, ReturnNum, true, 0, PLog),
                    [{ReturnItemID, ReturnNum}];
                false ->
                    []
            end;
        _ ->
            []
    end.
%%%-------------------------------------------------------------------
equipWash(EquipType, PropID, PropVal, Index) ->
    case canWash(EquipType, PropID, erlang:trunc(PropVal)) of
        {true, Equip, Tuple, Cfg} ->
            doWash(EquipType, Index, Equip, Tuple, Cfg);
        _ ->
            skip
    end,
    ok.

doWash(EquipType, PropIndex, #recSaveEquip{itemID = DataID} = Equip, {PropID, _PropVal, _Index} = X, CostCfg) ->
    {EquipLevel, Quality} = getEquipLevelAndQuality(DataID),
    case getCfg:getCfgByArgs(cfg_equipWash, EquipLevel, Quality, PropID) of
        #equipWashCfg{} = WashCfg ->
            doWash1(EquipType, PropIndex, Equip, X, WashCfg, CostCfg);
        _ ->
            ok
    end,
    ok;
doWash(_EquipType, _PropIndex, _Equip, _X, _Cfg) -> ok.

doWash1(EquipType, PropIndex, #recSaveEquip{enhanceProp = ENC} = Equip, {PropID, PropVal, Index}, WashCfg, CostCfg) ->
    #equipWashEcoCfg{item = ItemID, itemNum = ItemNum} = CostCfg,
    #equipWashCfg{valueMin = Min, valueMax = Max, valueUp = Up} = WashCfg,
    case PropVal >= Up of
        true ->
            skip;
        _ ->
            costItem(ItemID, ItemNum),
            WC = playerPropSync:getProp(?SerProp_EquipWashCount),
            NV =
                case isForceSuccess(WC) of
                    true ->
                        playerPropSync:setInt64(?SerProp_EquipWashCount, 0),
                        misc:rand(1, Max) + PropVal;
                    _ ->
                        playerPropSync:setInt64(?SerProp_EquipWashCount, WC + 1),
                        misc:rand(Min, Max) + PropVal
                end,
            FV = misc:min(NV, Up),
            Msg =
                #pk_GS2U_WashEquip{
                    equipPos = EquipType,
                    index = PropIndex,
                    propInfo = #pk_EquipPropInfo{
                        propType = ?EquipPropTypeBase,
                        propKey = PropID,
                        propAffix = 0,
                        calcType = true,
                        propValue = float(FV)
                    }
                },
            playerMsg:sendNetMsg(Msg),

            case FV > PropVal of
                true ->
                    NEnc = setelement(Index, ENC, float(FV)),
                    NewEquip = Equip#recSaveEquip{enhanceProp = NEnc},
                    playerPackage:storeGoodsAndSave(?Item_Location_BodyEquipBag, NewEquip),

                    playerAchieve:achieveEvent(?Achieve_Floating_Washspractice_1,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Washspractice_2,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Washspractice_3,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Washspractice_4,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Washspractice_5,[1]),
                    playerAchieve:achieveEvent(?Achieve_Washspractice,[1]),
                    playerEquip:equipChangeProp(Equip, ?EquipOff, false),
                    playerEquip:equipChangeProp(NewEquip, ?EquipOn, true),
                    playerForce:calcPlayerForce(true),
                    ok;
                _ ->
                    skip
            end,
            ok
    end,
    ok.

costItem(ItemID, ItemNum) ->
    PackageType = playerPackage:getPackageTypeByItemID(ItemID),
    PLog = #recPLogTSItem{
        old = 0,
        new = 0,
        change = -ItemNum,
        target = ?PLogTS_GemEmbed,
        source = ?PLogTS_PlayerSelf,
        gold = 0,
        goldtype = ?CoinUseTypeGold,
        changReason = ?ItemDeleteReasonEquipWash,
        reasonParam = 0
    },
    true = playerPackage:delGoodsByID(
        PackageType, ItemID, ItemNum, PLog),
    ok.

canWash(EquipType, PropID, PropVal) ->
    case checkOpenLevel() of
        true ->
            case playerEquip:getEquipByType(EquipType) of
                {true, #recSaveEquip{} = Equip} ->
                    checkEquip(EquipType, PropID, PropVal, Equip);
                _ ->
                    false
            end;
        _ ->
            false
    end.

%%%-------------------------------------------------------------------
checkOpenLevel() ->
    playerState:getLevel() >= getCfgOpenLevel().

checkEquip(EquipType, PropID, PropVal, #recSaveEquip{itemID = DataID, quality = EQ, enhanceProp = ENP} = Equip) ->
    {Level, _} = getEquipLevelAndQuality(DataID),
    case getCfg:getCfgByArgs(cfg_globalsetup, equip_wash) of
        #globalsetupCfg{setpara = [_X, LQ, LevelMin]} ->
            case EQ >= LQ andalso Level >= LevelMin of
                true ->
                    case checkPropID(PropID, PropVal, ENP) of
                        {true, Tuple} ->
                            checkCost(EquipType, Equip, Tuple);
                        _ ->
                            false
                    end;
                _ ->
                    false
            end;
        _ ->
            false
    end;
checkEquip(_EquipType, _PropID, _PropVal, _Any) -> false.

checkPropID(PropID, PropVal, #rec_equip_enhance_info{propKey1 = PropID, propValue1 = PropVal1}) when round(PropVal1) =:= PropVal ->
    {true, {PropID, PropVal, #rec_equip_enhance_info.propValue1}};
checkPropID(PropID, PropVal, #rec_equip_enhance_info{propKey2 = PropID, propValue2 = PropVal2}) when round(PropVal2) =:= PropVal ->
    {true, {PropID, PropVal, #rec_equip_enhance_info.propValue2}};
checkPropID(PropID, PropVal, #rec_equip_enhance_info{propKey3 = PropID, propValue3 = PropVal3}) when round(PropVal3) =:= PropVal ->
    {true, {PropID, PropVal, #rec_equip_enhance_info.propValue3}};
checkPropID(PropID, PropVal, #rec_equip_enhance_info{propKey4 = PropID, propValue4 = PropVal4}) when round(PropVal4) =:= PropVal ->
    {true, {PropID, PropVal, #rec_equip_enhance_info.propValue4}};
checkPropID(PropID, PropVal, #rec_equip_enhance_info{propKey5 = PropID, propValue5 = PropVal5}) when round(PropVal5) =:= PropVal ->
    {true, {PropID, PropVal, #rec_equip_enhance_info.propValue5}};
checkPropID(_PropID, _PropVal, _Any) -> false.

checkCost(EquipType, #recSaveEquip{itemID = DataID} = Equip, {_PropID, _PropVal, _X} = Tuple) ->
    case getEquipLevelAndQuality(DataID) of
        {0, _G} ->
            false;
        {Level, Q} ->
            case getCfg:getCfgByArgs(cfg_equipWashEco, Level, Q, EquipType) of
                #equipWashEcoCfg{item = ItemID, itemNum = ItemNum} = Cfg ->
                    case playerPackage:getItemNumByID(ItemID) >= ItemNum of
                        true ->
                            {true, Equip, Tuple, Cfg};
                        _ ->
                            false
                    end;
                _ ->
                    false
            end
    end;
checkCost(_EquipType, _Any, _X) -> false.

%%%-------------------------------------------------------------------
getCfgMinQuality() ->
    #globalsetupCfg{setpara = [_X, LQ,Level]} =
        getCfg:getCfgPStack(cfg_globalsetup, equip_wash),
    {LQ, Level}.
%%getCfgMinLevel() ->
%%    case getCfg:getCfgByArgs(cfg_globalsetup, equip_wash) of
%%        #globalsetupCfg{setpara = [_X, _LQ,Level]} ->
%%            Level;
%%        _ ->
%%            9999
%%    end.


getCfgSuccessCount() ->
    case getCfg:getCfgByArgs(cfg_globalsetup, equip_wash) of
        #globalsetupCfg{setpara = [X, _LQ,_Level]} ->
            X;
        _ ->
            9999999999
    end.

getCfgOpenLevel() ->
    10.

isForceSuccess(WC) ->
    WC >= getCfgSuccessCount().


getEquipLevelAndQuality(DataID) ->
    case getCfg:getCfgByKey(cfg_equipment, DataID) of
        #equipmentCfg{levelGroup = Level, qualityType = Q} ->
            {Level, Q};
        _ ->
            {0, 0}
    end.
%%洗炼装备除返还系数为零异常配置检查
-spec checkEquipWashConfig() -> boolean().
checkEquipWashConfig() ->
    L = getCfg:getKeyList(cfg_equipWash),
    check(L, true).
check([], Ret) ->
    Ret;
check([{Level, EQ, PI} = Key | T], Ret) ->
    case getCfg:getCfgByArgs(cfg_equipWash, Level, EQ, PI) of
        #equipWashCfg{breakUpPara = BUP} when BUP >= 1.0 ->
            check(T, Ret);
        _ ->
            ?ERROR("equipWashCfg key:~w", [Key]),
            check(T, false)
    end.
%%装备配置表和装备洗炼配置表检查,两者是否对应
checkDifferentConfig() ->
    L = getCfg:getKeyList(cfg_equipment),
    V = getCfgMinQuality(),
    check2(L,true, V).
check2([],Ret,_V) ->
    Ret;
check2([{ID} = _Key | T],Ret,{QMin, LevelMin}) ->
    case getCfg:getCfgByKey(cfg_equipment,ID) of
        #equipmentCfg{type = Type,levelGroup = Level, qualityType = Q} when Q >= QMin andalso Level >= LevelMin ->
            case getCfg:getCfgByArgs(cfg_equipWashEco, Level, Q, Type) of
                #equipWashEcoCfg{} ->
                    check2(T, Ret, {QMin, LevelMin} );
                _ ->
                    ?ERROR("equipment.id=~w, can not find equipWashEco.type=~w,levelGroup=~w,qualityType=~w", [ID, Type, Level, Q]),
                    check2(T, false, {QMin, LevelMin})
            end;
        _ ->
            check2(T, Ret, {QMin, LevelMin})
    end.