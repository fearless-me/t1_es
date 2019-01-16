%% @author zhengzhichun
%% @doc @todo Add description to playerFashion.


-module(playerFashion).
-include("gsInc.hrl").
-include("playerPropSyncDefine.hrl").
-include("playerPrivate.hrl").

-define(OperationTypeBuy, 0).
-define(OperationTypeOn, 1).
-define(OperationTypeOff, 2).

%
-define(FashionCondition_EquipRefine, 1).
-define(FashionCondition_EquipStar, 2).
-define(FashionCondition_EquipNumber, 3).
-define(FashionCondition_PetNumber, 4).

-define(FashionPropIDs, [
    ?PubProp_FashionMajorHand,          % int 时装主手
    ?PubProp_FashionHead,               % int 时装头
    ?PubProp_FashionClothes,            % int 时装衣服
    ?PubProp_FashionBack,               % int 时装背部
    ?PubProp_FashionSpirit,             % int 时装精灵
    ?PubProp_FashionEmotion             % int 时装表情
]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
    initFashion/1,
    initFashionSlot/1,
    getShowFashions/0,
    checkTimeout/1
]).

-export([
    roomLevelUp/0,
    roomLevelChange/2,
    buyFashion/3,
    useFashionItem/4,
    operateFashionPosition/2
]).

-export([
    sendFashionList2Client/0
]).
-export([
    msg/1, 				%% 协议处理
    init/0,			%% 上线初始化
    fashionUpdate/0,	%% 活动数据改变
    fashionGiftAck/1	%% 被赠送者收到时装反馈
]).
%%
roomLevelChange(OldLevel, NewLevel)->
	CfgOld = getCfg:getCfgByKey(cfg_fashionCollectionLevel, OldLevel),
	CfgNew = getCfg:getCfgByKey(cfg_fashionCollectionLevel, NewLevel),
	changeFashionRoomProp(?EquipOff, CfgOld),
	changeFashionRoomProp(?EquipOn, CfgNew),
	playerForce:calcPlayerForce(true),
    playerAchieve:achieveEvent(?Achieve_roomLevelChange,[NewLevel - OldLevel]),
    ok.

changeFashionRoomProp(
	Operate,
	#fashionCollectionLevelCfg{attribute = PropList}
)->
	playerCalcProp:changeProp_CalcType(PropList, Operate, true),
	ok;
changeFashionRoomProp(_AnyOp, _AnyCfg)->
	ok.


%% ====================================================================
roomLevelUp() ->
    case canRoomLevelUp() of
        {true, Cfg}->
            doRoomLevelUp(Cfg);
        _ ->
            skip
    end,
    ok.

doRoomLevelUp(
	#fashionCollectionLevelCfg{
		level  = Level
		, exp = NeedExp
	}
)->
    NextLevel = Level + 1,
    RoomExp = playerPropSync:getProp(?PriProp_FashionRoomExp),
    case RoomExp >= NeedExp of
        true ->
            playerPropSync:setProp(
				?PriProp_FashionRoomExp
				, RoomExp - NeedExp
			),
            playerPropSync:setProp(
				?PriProp_FashionRoomLevel
				, NextLevel
			),
            playerMsg:sendNetMsg(
				#pk_GS2U_FashionRoomLevelUp{
					roomLevel = NextLevel
				}
			),
            FashionLevel = #rec_log_fashionroom_level{
                playerID = playerState:getRoleID(),
                oldLevel = Level,
                newLevel = NextLevel,
                time = misc_time:utc_seconds()
            },
            dbLog:sendSaveLogFashionLevel(FashionLevel),
            ok;
        _ ->
            skip
    end,
    ok;
doRoomLevelUp(_Any)->
    skip.

canRoomLevelUp()->
    RoomExp = playerPropSync:getProp(?PriProp_FashionRoomExp),
    CurLevel = playerPropSync:getProp(?PriProp_FashionRoomLevel),
    case getCfg:getCfgByArgs(cfg_fashionCollectionLevel, CurLevel) of
        #fashionCollectionLevelCfg{exp = NeedExp} = Cfg when RoomExp >= NeedExp ->
            case getCfg:getCfgByArgs(cfg_fashionCollectionLevel, CurLevel + 1) of
                #fashionCollectionLevelCfg{} ->
                    {true,Cfg};
                 _ -> false
            end;
        _ ->
            false
    end.
%% ====================================================================
%%玩家登录时初始化时装
-spec initFashion(MyFashionList :: [#recFashion{}, ...]) -> ok.
initFashion([#recFashion{} | _] = MyFashionList) ->
    playerState:setFashionList(MyFashionList),
    checkTimeout(false),
    initFashionSuit(),
    playerForce:calcPlayerForce(?PlayerFashionColForce, false),
    ok.

%%拥有的时装下来后，再看着在身上的过期没
-spec initFashionSlot(List) -> ok when List :: [#recFashionOnLoad{}].
initFashionSlot([#recFashionOnLoad{} | _] = List) ->
    lists:foreach(
        fun(#recFashionOnLoad{index = Position, value = FashionID}) ->
            putOnClothes(Position, FashionID)
        end, List),
    ok.

%%玩家登录时，下发已经点亮的时装列表
-spec sendFashionList2Client() -> ok.
sendFashionList2Client() ->
    setInitLevel(),
    Now = misc_time:utc_seconds(),
    PlayerFashionList = playerState:getFashionList(),
    L1 = lists:foldl(
        fun(#recFashion{fashionID = FashionID, endTime = EndTime}, Acc) ->
            if
                EndTime =:= 0 ->
                    [#pk_FashionInfo{time = 0, fashionID = FashionID} | Acc];
                EndTime - Now > 0 ->
                    [#pk_FashionInfo{time = EndTime - Now, fashionID = FashionID} | Acc];
                true ->
                    Acc
            end
        end, [], PlayerFashionList),

    Msg = #pk_GS2U_FashionList{datas = L1},
    ?DEBUG("gs2uFashionInitList[~p]", [Msg]),
    playerMsg:sendNetMsg(Msg).

setInitLevel()->
    case playerPropSync:getProp(?PriProp_FashionRoomLevel) of
        0 ->
            playerPropSync:setProp(?PriProp_FashionRoomLevel, 1),
            ok;
        _ ->
            skip
    end,
    ok.

%% ====================================================================
getSlotFashionID(SlotID) ->
    case playerPropSync:getProp(SlotID) of
        undefined ->
            0;
        FashionID ->
            FashionID
    end.

-spec getOnBodyFashions() -> [Fashion :: integer(), ...].
getOnBodyFashions() ->
    [getSlotFashionID(FashionSlotID) || FashionSlotID <- ?FashionPropIDs].

%%获取可显示的时间
-spec getShowFashions() -> [Fashion :: integer(), ...].
getShowFashions() ->
    case playerPropSync:getProp(?PubProp_FashionVisibleFlag) of
        0 ->
            getOnBodyFashions();
        _ ->
            []
    end.

%% ====================================================================
buyFashion(ItemID, FashionID, ExpiresSecond) ->
    case canBuyFashion(ItemID, FashionID, ExpiresSecond) of
        true ->
            doBuyFashion(ItemID, FashionID, ExpiresSecond);
        {false, ErrorCode} ->
            playerMsg:sendErrorCodeMsg(ErrorCode);
        _ ->
            skip
    end,
    ok.

doBuyFashion(ItemID, FashionID, ExpiresSecond) ->
    Cfg = getCfg:getCfgPStack(cfg_fashion, FashionID),
    true = costItem(ItemID,FashionID, ExpiresSecond, Cfg),
    true = costMoney(FashionID, ExpiresSecond, Cfg),

    case addFashionTime(FashionID, ExpiresSecond) of
        true ->
            ?DEBUG("useDiamond4fashion ok"),
            gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, ExpiresSecond);
        false ->
            skip
%%            gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, -1)
    end,
    ok.
%% ====================================================================
costItem(
    _ItemID,
    _FashionID,
    0,
    #fashionCfg{costItemForever = []}
) ->
    true;
costItem(
    _ItemID,
    _FashionID,
    ExpiresSecond,
    #fashionCfg{costItem = []}
) when ExpiresSecond > 0 ->
    true;
costItem(
    0,
    _FashionID,
    _ExpiresSecond,
    #fashionCfg{}
) ->
    false;
costItem(
    ItemID,
    FashionID,
    ExpiresSecond,
    #fashionCfg{costItem = LimitCostList, costItemForever = ForeverCostList}
) ->
    Num =
        case ExpiresSecond of
            0 ->
                case lists:keyfind(ItemID, 1, ForeverCostList) of
                    false ->
                        0;
                    {_, Num_} ->
                        Num_
                end;
            _ ->
                case LimitCostList of
                    [{ItemID, Num_}] ->
                        Num_;
                    _ ->
                        0
                end
        end,
    case Num of
        0 ->
            false;
        _ ->
            PLog = #recPLogTSItem{
                old = Num,
                new = 0,
                change = -Num,
                target = ?PLogTS_Item,
                source = ?PLogTS_PlayerSelf,
                gold = 0,
                goldtype = 0,
                changReason = ?ItemDeleteReasonFashion,
                reasonParam = FashionID
            },
            ItemType = playerPackage:getItemType(ItemID),
            playerPackage:delGoodsByID(
                playerPackage:getPackageType(ItemType)
                , ItemID
                , Num
                , PLog
            )
    end;
costItem(_ItemID, _FashionID, _AnyTime, _AnyCfg) ->
    false.

costMoney(
    _FashionID
    , 0
    , #fashionCfg{costMoneyForever = []}
) ->
    true;
costMoney(
    _FashionID
    , ExpiresSecond
    , #fashionCfg{costMoney = []}
) when ExpiresSecond > 0 ->
    true;
costMoney(
    FashionID
    , ExpiresSecond
    , #fashionCfg{costMoney = LimitCostList, costMoneyForever = ForeverCostList}
) ->
    [UseType, UseNum] =
        case ExpiresSecond of
            0 ->
                ForeverCostList;
            _ ->
                LimitCostList
        end,
    PLog = #recPLogTSMoney{
        reason = ?CoinUseFashionClothes,
        param = FashionID,
        target = ?PLogTS_Fashion,
        source = ?PLogTS_PlayerSelf
    },
    playerMoney:useCoin(UseType, UseNum, PLog);
costMoney(_FashionID, _AnyTime, _AnyCfg) ->
    false.


%% ====================================================================
canBuyFashion(ItemID, FashionID, BuySeconds) ->
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_playerWing) of
        true ->
            case getCfg:getCfgPStack(cfg_fashion, FashionID) of
                #fashionCfg{} = Cfg ->
                    case checkFashionTime(FashionID, BuySeconds) of
                        true ->
                            case checkCostAndCondition(ItemID,BuySeconds, Cfg) of
                                true ->
                                    checkFashion(FashionID, BuySeconds);
                                V ->
                                    V
                            end;
                        _ ->
                            skip
                    end;
                _ ->
                    skip
            end;
        _ ->
            {false, ?ErrorCode_SystemNotOpen}
    end.

%% ====================================================================
checkFashion(FashionID, _BuySeconds) ->
    L = playerState:getFashionList(),
    case lists:keyfind(FashionID, #recFashion.fashionID, L) of
        #recFashion{endTime = 0} ->
            {false, ?ErrorCode_BagItemNotNeedUse};
        _ ->
            true
    end.

%% ====================================================================
checkCostAndCondition(
    ItemID,
    BuySeconds,
    #fashionCfg{condition = C} = Cfg
) ->
    case checkCondition(C) of
        true ->
            case checkCostMoney(BuySeconds, Cfg) of
                true ->
                    case checkCostItem(ItemID, BuySeconds, Cfg) of
                        true ->
                            true;
                        _ ->
                            {false, ?ErrorCode_FashionConsumeNotEnough}
                    end;
                _ ->
                    {false, ?ErrorCode_FashionConsumeNotEnough}
            end;
        _ ->
            {false, ?ErrorCode_FashionActiveCondition}
    end.

%% ====================================================================
checkCostMoney(0, #fashionCfg{costMoneyForever = []}) ->
    true;
checkCostMoney(_BuySeconds, #fashionCfg{costMoney = []}) ->
    true;
checkCostMoney(0, #fashionCfg{costMoneyForever = [UseType, UseNum]}) ->
    playerMoney:canUseCoin(UseType, UseNum);
checkCostMoney(_BuySeconds, #fashionCfg{costMoney = [UseType, UseNum]}) ->
    playerMoney:canUseCoin(UseType, UseNum).

%% ====================================================================
checkCostItem(_ItemID, 0, #fashionCfg{costItemForever = []}) ->
    true;
checkCostItem(_ItemID, _BuySeconds, #fashionCfg{costItem = []}) ->
    true;
checkCostItem(0, _BuySeconds, #fashionCfg{}) ->
    false;
checkCostItem(ItemID, 0, #fashionCfg{costItemForever = ItemCob}) ->
    case lists:keyfind(ItemID, 1, ItemCob) of
        false ->
            false;
        {_, ItemNum} ->
            playerPackage:getItemNumByID(ItemID) >= ItemNum
    end;
checkCostItem(ItemID, _BuySeconds, #fashionCfg{costItem = [{ItemID, ItemNum}]}) ->
    playerPackage:getItemNumByID(ItemID) >= ItemNum;
checkCostItem(_ItemID, _BuySeconds, #fashionCfg{}) ->
    false.  %% 这里是costItem不符合 [{ItemID, ItemNum}]的格式

%% ====================================================================
checkCondition([]) ->
    true;
checkCondition([C | L]) ->
    case checkCondition1(C) of
        false ->
            false;
        _ ->
            checkCondition(L)
    end.

%% ====================================================================
checkCondition1({?FashionCondition_EquipRefine, RefineLv, _None}) ->
    playerEquip:getRefineLevel() >= RefineLv;
checkCondition1({?FashionCondition_EquipStar, StarLv, _None}) ->
    playerEquip:getStartLevel() >= StarLv;
checkCondition1({?FashionCondition_EquipNumber, Quality, Number}) ->
    playerPackage:getEquipNumAll(Quality) >= Number;
checkCondition1({?FashionCondition_PetNumber, Quality, Number}) ->
    playerPet:getPetNumber(Quality) >= Number;
checkCondition1(_Any) ->
    {false, -2}.


%% ====================================================================
%%用物品点亮时装
-spec useFashionItem(ItemUID :: integer(), UseItemID :: integer()
	, FashionID :: integer(), Time :: integer()) -> RealUseNum :: uint16().
useFashionItem(ItemUID, UseItemID, FashionID, ExpiresSecond) ->
    ?DEBUG("fashion use item ~w",
		[{ItemUID, UseItemID, FashionID, ExpiresSecond}]),

    Now = misc_time:utc_seconds(),
    L = playerState:getFashionList(),
    case lists:keyfind(FashionID, #recFashion.fashionID, L) of
        #recFashion{endTime = 0} ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemNotNeedUse),
            0;
        #recFashion{endTime = BaseEndTime} when BaseEndTime > Now ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemNotNeedUse),
            0;
        _ ->
            case addFashionTime(FashionID, ExpiresSecond) of
                true ->
                    ?DEBUG("useItemEvent4Fashion ok"),
                    gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, ExpiresSecond),
                    1;
                false ->
%%                    gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, -1),
                    0
            end
    end.

%%点亮或延长时装时长
-spec addFashionTime(FashionID :: integer(), ExpiresSecond :: integer()) -> boolean().
addFashionTime(FashionID, ExpiresSecond) ->
    Now = misc_time:utc_seconds(),
    PlayerID = playerState:getRoleID(),
    FashionList = playerState:getFashionList(),

    %%客户端保证时间，正常的客户端都不会出错
    true = checkFashionTime(FashionID, ExpiresSecond),

    Ret =
        case lists:keyfind(FashionID, #recFashion.fashionID, FashionList) of
            #recFashion{endTime = 0} ->
                ok;
            #recFashion{endTime = EndTime1} = Fashion when ExpiresSecond > 0 ->
                NewFashionRec = Fashion#recFashion{endTime = calcExpireSeconds(EndTime1, ExpiresSecond)},
                L0 = lists:keystore(FashionID, #recFashion.fashionID, FashionList, NewFashionRec),
                {NewFashionRec, L0, false};
            _ ->
                playerAchieve:achieveEvent(?Achieve_Fashion, [1]),
                playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Fashion),
                NewRec = #recFashion{roleID = PlayerID, fashionID = FashionID, endTime = calcExpireSeconds(Now, ExpiresSecond)},
				L0 = lists:keystore(FashionID, #recFashion.fashionID, FashionList, NewRec),
                {NewRec, L0, true}
        end,

    case Ret of
        {#recFashion{endTime = EndTime} = Rec, L, SuitChange} ->
            playerSave:saveFashion(Rec),
            playerState:setFashionList(L),
            newFashionAddPoint(FashionID, EndTime =:= 0),
            checkSuit(SuitChange, ?EquipOn, EndTime =:= 0),
            %%漂浮之石成就
            updateFashionFloatingAchive(FashionID),
            true;
        _ ->
            false
    end.

%%漂浮之石成就
updateFashionFloatingAchive(FashionID)->

    case getCfg:getCfgByArgs(cfg_fashion, FashionID) of
        #fashionCfg{quality = Qua} ->
            case Qua of
                ?EquipColorTypeBlue ->
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Blue_1,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Blue_2,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Blue_3,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Blue_4,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Blue_5,[1]);
                ?EquipColorTypeRed ->
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_red_1,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_red_2,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_red_3,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_red_4,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_red_5,[1]);
                ?EquipColorTypePurple ->
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Purple_1,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Purple_2,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Purple_3,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Purple_4,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Purple_5,[1]);
                ?EquipColorTypeOrange ->
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Orange_1,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Orange_2,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Orange_3,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Orange_4,[1]),
                    playerAchieve:achieveEvent(?Achieve_Floating_Fashion_Orange_5,[1]);
                _->
                    skip
            end,

            Qua;
        _->
            skip
    end,

    ok.

checkFashionTime(FashionID, ExpiresSecond) ->
    case getCfg:getCfgByArgs(cfg_fashion, FashionID) of
        #fashionCfg{timeLimit = [0]} ->
            ExpiresSecond =:= 0;
        #fashionCfg{timeLimit = [X]} ->
            X * ?One_Day_Second =:= ExpiresSecond;
        #fashionCfg{timeLimit = [0, X]} ->
            ExpiresSecond =:= 0 orelse X * ?One_Day_Second =:= ExpiresSecond;
        _ ->
            false
    end.
%% ====================================================================
calcExpireSeconds(_NowTime, 0) ->
    0;
calcExpireSeconds(NowTime, ExpiresSecond) ->
    NowTime + ExpiresSecond.

%% ====================================================================
newFashionBroadcast(SuitID) ->
    case getCfg:getCfgByArgs(cfg_fashionCollection, SuitID) of
        #fashionCollectionCfg{name = Name, is_Notice = 1} ->
            NoticeStr = stringCfg:getString(fashionSuit, [playerState:getName(), Name]),
            core:sendBroadcastNotice(NoticeStr),
            ok;
        _ ->
            skip
    end.


%%时装没过期才能上装
-spec checkFashionValid(FashionID :: integer()) -> boolean().
checkFashionValid(FashionID) ->
    try
        FashionList = playerState:getFashionList(),
        case lists:keyfind(FashionID, #recFashion.fashionID, FashionList) of
            #recFashion{endTime = EndTime} ->
                if
                    EndTime =:= 0 ->
                        true;
                    true ->
                        EndTime > misc_time:utc_seconds()
                end;
            _ ->
                false
        end
    catch
        _:_ ->
            false
    end.

%% ====================================================================
%%会自动检查时装时间
-spec putOnClothes(Position :: integer(), FashionID :: integer()) -> boolean().
putOnClothes(Position, FashionID) when 0 =:= FashionID ->
    doPutOnClose(Position, FashionID, Position);
putOnClothes(Position, FashionID) ->
    case checkFashionValid(FashionID) of
        true ->
            case getCfg:getCfgPStack(cfg_fashion, FashionID) of
                #fashionCfg{subType = Type2} ->
                    doPutOnClose(Position, FashionID, Type2);
                _ ->
                    false
            end;
        _ ->
            doPutOnClose(Position, 0, Position),
            ?INFO("putOnClothes fail. position[~w],fid[~w] isvalid[false]", [Position, FashionID]),
            false
    end.

doPutOnClose(Position, FashionID, Type) ->
    case lists:member(Position, ?FashionPropIDs) of
        true ->
            if
                Position =:= Type ->
                    setFashionSlot(Position, FashionID),
                    playerPropSync:setInt(Position, FashionID),
                    % 更新一下自己的内存时装模型
                    updatePlayerDataInfoOfFashion();
                true ->
                    ok
            end;
        _ ->
            ?INFO("putOnClothes fail. position[~w],fid[~w] type[~w]", [Position, FashionID, Type]),
            false
    end.

updatePlayerDataInfoOfFashion() ->
    case ets:lookup(ets_recPlayerRankInfo, playerState:getRoleID()) of
        [#recPlayerRankInfo{} = R] ->
            FashionList = playerFashion:getShowFashions(),
            NewRec = R#recPlayerRankInfo{fashionIDs = FashionList},
            ets:insert(ets_recPlayerRankInfo, NewRec);
        _ ->
            skip
    end.

%% ====================================================================
%%穿，卸操作
-spec operateFashionPosition(FashionID :: integer(), Flag :: boolean()) -> ok.
operateFashionPosition(FashionID, true) ->
    ?DEBUG("[DebugForFashion] putOnAndOffClothes FashionID:~p true", [FashionID]),
    Ret =
        case getCfg:getCfgPStack(cfg_fashion, FashionID) of
            #fashionCfg{subType = Position} ->
                putOnClothes(Position, FashionID);
            _ ->
                false
        end,
    gs2uFashionOperateResult(FashionID, ?OperationTypeOn, misc:convertBool2Int(Ret));

operateFashionPosition(FashionID, _Flag) ->
    ?DEBUG("[DebugForFashion] putOnAndOffClothes FashionID:~p _Flag:~p", [FashionID, _Flag]),
    Ret =
        case getCfg:getCfgPStack(cfg_fashion, FashionID) of
            #fashionCfg{subType = Position} ->
                putOnClothes(Position, 0);
            _ ->
                false
        end,
    gs2uFashionOperateResult(FashionID, ?OperationTypeOff, misc:convertBool2Int(Ret)).

%% ====================================================================
%% 时装过期检查
checkTimeout(IsNotify) ->
    Now = misc_time:utc_seconds(),
    L1 = playerState:getFashionList(),
    {L2, Flag, SuitFlag} = lists:foldl(
        fun(#recFashion{endTime = EndTime} = Rec, {Acc, Calc, SuitChanges}) ->
            if
                EndTime =:= 0 ->
                    {[Rec | Acc], Calc, SuitChanges};
                EndTime - Now > 0 ->
                    {[Rec | Acc], Calc, SuitChanges};
                true ->
                    {Acc, true, true}
            end
        end, {[], false, false}, L1),
    playerState:setFashionList(L2),
    checkSuit(SuitFlag, ?EquipOff, false),
    case Flag andalso IsNotify of
        true ->
            playerForce:calcPlayerForce(?PlayerFashionColForce, IsNotify);
        _ ->
            skip
    end.

%% ====================================================================
%%回馈client操作结果(0: 购买 1：穿戴 2：卸载)
gs2uFashionOperateResult(FashionID, Type, Value) ->
    ?DEBUG("[DebugForFashion] gs2uFashionOperateResult FashionID:~p Type:~p Value:~p", [FashionID, Type, Value]),
    Msg = #pk_GS2U_FashionResult{fashionID = FashionID, type = Type, value = Value},
    playerMsg:sendNetMsg(Msg),
    case Type of
        ?OperationTypeBuy when Value >= 0 ->
            playerSevenDayAim:updateCondition(?SevenDayAim_FashionCount, [FashionID]);
        _ ->
            ok
    end.

%%着装时，记录插槽上的时装id
%%1）登录时，过期后，FashionID=0
%%2）换装时，外部逻辑必须先卸再穿
-spec setFashionSlot(SlotID :: integer(), FashionID :: integer()) -> ok.
setFashionSlot(SlotID, FashionID) ->
    OldList = playerState:getFashionSlotList(),
    NewItem = #recFashionOnLoad{roleID = playerState:getRoleID(), index = SlotID, value = FashionID},
    NewList = lists:keystore(SlotID, #recFashionOnLoad.index, OldList, NewItem),
    playerState:setFashionSlotList(NewList),
    ok.


%% ====================================================================
checkSuit(true, Op, IsForever) ->
    suitChange(Op, IsForever);
checkSuit(_, _, _IsForever) ->
    ok.

suitChange(?EquipOff, _IsForever) ->
    %%
    L1 = playerState:getFashionSuitList(),
    %% 新激活的套装列表
    L2 = makeExistFashionSuitList(),

    L3 = lists:subtract(L1, L2),
    playerState:setFashionSuitList(L2),
    changeFashionSuitProp(L3, ?EquipOff);
suitChange(?EquipOn, IsForever) ->
    %%
    L1 = playerState:getFashionSuitList(),

    %% 新激活的套装列表
    L2 = makeExistFashionSuitList(),

    L3 = lists:subtract(L2, L1),
    playerState:setFashionSuitList(L2),
    ?DEBUG("  [~p]", [L3]),
    changeFashionSuitProp(L3, ?EquipOn),
    [newFashionSuitAddPoint(SuitID, IsForever) || SuitID <- L3],
    [newFashionBroadcast(SuitID) || SuitID <- L3];
suitChange(_, _IsForever) ->
    ok.

newFashionAddPoint(FashionID, true)->
	OldPoint = playerPropSync:getProp(?PriProp_FashionRoomExp),
	#fashionCfg{fashionPoint = AddPoint} = getCfg:getCfgByArgs(cfg_fashion, FashionID),
	playerPropSync:setProp(?PriProp_FashionRoomExp, OldPoint + AddPoint),
	?INFO("player[~p][~p] active fashion[~p], addPoint[~p+~p=~p]",
		[playerState:getRoleID(), self(), FashionID, OldPoint, AddPoint, OldPoint + AddPoint]
	),
	ok;
newFashionAddPoint(_FashionID, _)->
    ok.

newFashionSuitAddPoint(SuitID, true)->
    OldPoint = playerPropSync:getProp(?PriProp_FashionRoomExp),
    #fashionCollectionCfg{suitPoint = AddPoint} = getCfg:getCfgByArgs(cfg_fashionCollection, SuitID),
    playerPropSync:setProp(?PriProp_FashionRoomExp, OldPoint + AddPoint),
    ?INFO("player[~p][~p] active fashionSuit[~p], addPoint[~p+~p=~p]",
        [playerState:getRoleID(), self(), SuitID, OldPoint, AddPoint, OldPoint + AddPoint]
    ),
    ok;
newFashionSuitAddPoint(_SuitID, _)->
    ok.


%% ====================================================================
initFashionSuit() ->
    L1 = makeExistFashionSuitList(),
    playerState:setFashionSuitList(L1),
    changeFashionSuitProp(L1, ?EquipOn).

haveFashionSuit2(FashionIDList, SuitID) ->
    SelfSex = playerState:getSex(),
    case getCfg:getCfgByArgs(cfg_fashionCollection, SuitID) of
        #fashionCollectionCfg{fashionIDGroup = L1, gender = Sex} when Sex =:= SelfSex orelse Sex =:= 0 ->
            case L1 of
                _ when is_list(L1) ->
                    L3 = lists:subtract(L1, FashionIDList),
                    length(L3) =< 0;
                _ ->
                    false
            end;
        _ ->
            false
    end.

%% ====================================================================
-spec changeFashionSuitProp(FashionSuitID, Op) -> ok|skip when FashionSuitID :: list(), Op :: ?EquipOn | ?EquipOff.
changeFashionSuitProp([], _) ->
    playerForce:calcPlayerForce(true),
    ok;
changeFashionSuitProp([FashionSuitID | L], Op) ->
    doChangeFashionSuitProp(FashionSuitID, Op),
    changeFashionSuitProp(L, Op).

doChangeFashionSuitProp(FashionSuitID, Operate) ->
    case getCfg:getCfgByArgs(cfg_fashionCollection, FashionSuitID) of
        #fashionCollectionCfg{paladin = Warrior, wizard = Mage, assassin = Assassin, extra_gain = Ex} ->
            Career = playerState:getCareer(),
            ExNew =
                case Ex of
                    undefined ->
                        [];
                    "[]" ->
                        [];
                    _ ->
                        Ex
                end,
            PropList = case ?Career2CareerMain(Career) of
                           ?CareerMain_1_Warrior ->
                               %% 骑士
                               Warrior ++ ExNew;
                           ?CareerMain_2_Magician ->
                               %% 魔法师
                               Mage ++ ExNew;
                           ?CareerMain_3_Bravo ->
                               %% 刺客
                               Assassin ++ ExNew;
                           _ ->
                               ?ERROR("gold weapon getPropList error Career[~p]", [Career]),
                               []
                       end,
            playerCalcProp:changeProp_CalcType(PropList, Operate, true),
            ok;
        _ ->
            ?ERROR("fashion suit config not exist,key:~p", [FashionSuitID])
    end.

%%
makeExistFashionSuitList() ->
    L1 = getExistFashionIDList(true),
    L2 = getCfgSuitIDList(),

    %% 新激活的套装列表
    lists:foldl(
        fun(SuitID, NewSuitList) ->
            case haveFashionSuit2(L1, SuitID) of
                true ->
                    [SuitID | NewSuitList];
                _ ->
                    NewSuitList
            end
        end, [], L2).

%%
getExistFashionIDList(OnlyForver) ->
    L0 = playerState:getFashionList(),
    [FashionID ||
        #recFashion{
            fashionID = FashionID
            , endTime = EntTime
        } <- L0
        , OnlyForver =:= false orelse EntTime =:= 0].

%%
getCfgSuitIDList() ->
    getCfg:get1KeyList(cfg_fashionCollection).

%%时装新品折扣活动
init() ->
    case isActivityOpened() of
        true ->
            sendFashionConfigInfo(?FashionSyncDataState_Online);
        _ ->
            skip
    end.

fashionUpdate() ->
    case isActivityOpened() of
        true->
            sendFashionConfigInfo(?FashionSyncDataState_Change);
        _ ->
            skip
    end.

%%活动开关是否开启
isActivityOpened()->
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_NewFashion) of
        true->true;
        _ ->false
    end.

sendFashionConfigInfo(Moment) ->
    Msg = #pk_GS2U_FashionConfigInfo{
        %% Int321.当玩家上线时/2.当活动配置该改变时
        state = Moment,
        %% FashionConfigInfo活动信息列表(目前策划要求只发送一条)
        configInfoList = getConfigInfoList()
    },
    playerMsg:sendNetMsg(Msg),
    ok.
getConfigInfoList() ->Fun =
        fun(#rec_activity_new_fashion{
            id = ID,
            batch = Bath,
            fashionID = FashionID,
            itemID = ItemID,
            discount = Discount,
            cointype = CoinType,
            original_price = Original_price,
            price = Price,
            start_time = TimeOpen1 ,
            time = Time,
            resources_bg = Resources_bg,
            fashion_show = Fashion_show
        },AccIn) ->
            NowTime = misc_time:localtime_seconds(),
            TimeOpen = TimeOpen1 + time2:getTimezoneSec(),
            EndTime = TimeOpen + Time * 3600,
            %case NowTime >= TimeOpen andalso NowTime =< EndTime of
            case true of
                true ->
%%                    FashionIDList = misc:string_to_term(FashionID),
%%                    ItemIDList = misc:string_to_term(ItemID),
                    InFo = #pk_FashionConfigInfo{
                        id = ID,
                        batch = Bath,
                        fashionID = [#pk_fashionIDCob{sex = Sex, fashionID = FashionID2} || {Sex, FashionID2} <- FashionID],
                        itemID = [#pk_itemIDCob{count = Count,itemID = ItemID2} || {Count,ItemID2} <- ItemID],
                        discount = Discount,
                        cointype = CoinType,
                        original_price = Original_price,
                        price = Price,
                        start_time = TimeOpen,
                        time = Time,
                        resources_bg = Resources_bg,
                        fashion_show = Fashion_show
                    },
                    [InFo | AccIn];
                _ ->
                    AccIn
            end
        end,
    lists:foldl(Fun,[],ets:tab2list(?EtsFashionConfig)).

%% api,msg
-spec msg(Msg::term()) -> no_return().
msg(#pk_U2GS_FashionBuyRequest{id = ID} = Msg) ->
    msgReal(Msg, fashionLogic:isOpen(ID));

msg(#pk_U2GS_FashionThanksMail{beGiveName = BeGiveName,giveName = GiveName,giveRole = GiveRole}) ->
    sendThanksMail(BeGiveName,GiveName,GiveRole).
%%%-------------------------------------------------------------------
%% internal,msg
msgReal(#pk_U2GS_FashionBuyRequest{} = _Msg, ?FashionState_OutMoment) ->
    skip;
msgReal(#pk_U2GS_FashionBuyRequest{id = ID,sex = Sex,itemid = ItemID,tarRoleID = TarRoleID,give = GiveString} = _Msg, ?FashionState_InMoment) ->
    fashionBuyRequest(ID, Sex, ItemID, TarRoleID, GiveString).

fashionBuyRequest(ID, Sex, ItemID, TarRoleID, GiveString) ->
    RoleID = playerState:getRoleID(),
    case canBuy(ID, Sex, ItemID, TarRoleID) of
        true ->
            FashionID = getFashionID(ID, Sex),
            [#rec_activity_new_fashion{cointype = CoinUseType, price = Price}] = ets:lookup(?EtsFashionConfig, ID),
            doBuy(ID,FashionID,RoleID, ItemID, TarRoleID, CoinUseType, Price, GiveString);
        {false,ErrorCode} ->
            playerMsg:sendErrorCodeMsg(ErrorCode);
        _ ->
            skip
    end,
    ok.
getFashionID(ID,Sex) ->
    [#rec_activity_new_fashion{fashionID = FashionIDList}] = ets:lookup(?EtsFashionConfig, ID),
    FashionID =
        case lists:keyfind(Sex,1,FashionIDList) of
            false ->
                0;
            {_Sex2,FashionID2} ->
                FashionID2
        end,
    FashionID.

canBuy(ID, Sex, ItemID, TarRoleID) ->
    case ets:lookup(?EtsFashionConfig, ID) of
        [#rec_activity_new_fashion{itemID = ItemIDList,cointype = CoinType,price = Price}] ->
            case checkSexAndItem(Sex, ItemID, ItemIDList) of
                true ->
                    case checkSex(Sex,TarRoleID) of
                        true ->
                            case playerMoney:canUseCoin(CoinType, Price) of
                                true ->
                                    true;
                                _ ->
                                    {false, ?ErrorCode_TradeDiamond}
                            end;
                        _ ->
                            false
                    end;
                _ ->
                    false
            end;
        _ ->
            false
    end.
checkSexAndItem(Sex, ItemID, ItemIDList) ->
        case lists:keyfind(Sex,1,ItemIDList) of
            false ->
                false;
            {_Sex2,ItemID2} ->
                case ItemID2 =:= ItemID of
                    true ->
                        true;
                    _ ->
                        false
                end
        end.

checkSex(Sex, 0) ->
    case playerState:getSex() =:= Sex of
        true ->
            true;
        _ ->
            false
    end;
checkSex(Sex, TarRoleID) ->
    case core:queryRoleKeyInfoByRoleID(TarRoleID) of
        #?RoleKeyRec{sex = Sex} ->
            true;
        _ ->
            false
    end.

doBuy(_ID,FashionID,RoleID, ItemID, TarRoleID, CoinUseType, Price, GiveString) ->
    true = costMoney2(CoinUseType, Price,ItemID),
    addItem(FashionID,RoleID,TarRoleID,CoinUseType,Price,ItemID,1,GiveString).

costMoney2(CoinUseType, Price,ItemID) ->
    true = decCost(ItemID, CoinUseType, Price).
decCost(ItemID, CoinUseType, Price) ->
    playerMoney:useCoin(
        CoinUseType
        , Price
        , #recPLogTSMoney{
            reason = ?CoinUseFashionClothes,
            param = ItemID,
            target = ?PLogTS_NewFashion,
            source = ?PLogTS_PlayerSelf
        }).
addItem(FashionID,RoleID,TarRoleID,CoinUseType,Price,ItemID,1,GiveString) ->
    RoleName = playerState:getName(),
    case TarRoleID > 0 of
        true ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Send_Iteam),
            case core:queryPlayerPidByRoleID(TarRoleID) of
                offline ->
                    %%角色不在线,将信息存放在玩家属性中,上线时推送
                    case ets:lookup(ets_rec_playerdata, TarRoleID) of
                        [#rec_playerdata{rec_player_prop = LP0}] ->
                            NewInfo =
                                case lists:keyfind(?SerProp_NewFashionInfo,#rec_player_prop.propIndex, LP0) of
                                    false ->
                                        #rec_player_prop{roleID = TarRoleID, propIndex = ?SerProp_NewFashionInfo, propValue = misc:term_to_string([{FashionID,ItemID,RoleID,RoleName,GiveString,CoinUseType,Price}])};
                                    #rec_player_prop{propValue = Value} = OldInfo ->
                                        NewValue =  misc:string_to_term(Value),
                                        OldInfo#rec_player_prop{propValue = misc:term_to_string([{FashionID,ItemID,RoleID,RoleName,GiveString,CoinUseType,Price} | NewValue])}
                                end,
                            %% 写入同步属性的内存数据
                            NewLP = lists:keystore(?SerProp_NewFashionInfo, #rec_player_prop.propIndex, LP0,NewInfo),
                            ets:update_element(ets_rec_playerdata, TarRoleID, [{#rec_playerdata.rec_player_prop, NewLP}]),
                            %% 通知DB写入
                            gsSendMsg:sendMsg2DBServer(commonSavePlayerProp, 0, [NewInfo]);
                        _ ->
                            skip
                    end;
                Pid ->
                    %% 在线，发给玩家模块去处理
                    psMgr:sendMsg2PS(Pid, fashionGiftAck, [{FashionID,ItemID,RoleID,RoleName,GiveString,CoinUseType,Price}])
            end;
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Succ),
            PLog = #recPLogTSItem{
                old = 0,
                new = 1,
                change = 1,
                target = ?PLogTS_PlayerSelf,
                source = ?PLogTS_NewFashion,
                gold = Price,
                goldtype = CoinUseType,
                changReason = ?ItemSourceNewFashionBuy,
                reasonParam = ItemID
            },
            playerPackage:addGoodsAndMail(ItemID, 1, false, 0, PLog),
            Msg = #pk_GS2U_FashionGiftAck{getFashionGiftAckList = [#pk_getFashionGiftAck{
                fashionID = FashionID,itemid = ItemID,giveRole = 0,giveName = RoleName,give = ""
            }]},
            playerMsg:sendNetMsg(Msg)
    end.
fashionGiftAck([{FashionID,ItemID,RoleID,RoleName,GiveString,CoinUseType,Price}]) ->
    Msg = #pk_GS2U_FashionGiftAck{getFashionGiftAckList = [#pk_getFashionGiftAck{
        fashionID = FashionID,itemid = ItemID,giveRole = RoleID,giveName = RoleName,give = convertGiveString(GiveString)
    }]},
    playerMsg:sendNetMsg(Msg),
    PLog = #recPLogTSItem{
        old = 0,
        new = 1,
        change = 1,
        target = ?PLogTS_PlayerSelf,
        source = ?PLogTS_NewFashion,
        gold = Price,
        goldtype = CoinUseType,
        changReason = ?ItemSourceNewFashionBeGiven,
        reasonParam = ItemID
    },
    playerPackage:addGoodsAndMail(ItemID, 1, false, 0, PLog),
    ok.
sendThanksMail(BeGiveName,GiveName,GiveRole) ->
    Title = stringCfg:getString(fashion_thank_mail_title,[BeGiveName]),
    Content = stringCfg:getString(fashion_thank_mail_content, [GiveName]),
    mail:sendSystemMail(GiveRole, Title, Content, [], "").
%%转换客户端传过来的赠送语
convertGiveString(GiveString) ->
    erlang:binary_to_list(erlang:list_to_binary(GiveString)).







