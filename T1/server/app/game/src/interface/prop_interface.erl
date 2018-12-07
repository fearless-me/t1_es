%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 属性通用接口 TODO 里面好多魔法数字，不完善，还需要修改
%%% @end
%%% Created : 29. 十一月 2018 14:51
%%%-------------------------------------------------------------------
-module(prop_interface).
-author("tiancheng").

-include("logger.hrl").
-include("combat.hrl").
-include("netmsg.hrl").
-include("type.hrl").
-include("object.hrl").
-include("common_def.hrl").

%% 0按正常逻辑
-define(PROP_CALC_SPECIAL_OPTION_NORMAL, 0).
%% 1无视防御
-define(PROP_CALC_SPECIAL_OPTION_IGNORE_DEFENSE, 1).
%% 2必定命中
-define(PROP_CALC_SPECIAL_OPTION_CERTAINLY_HIT, 2).
%% 4必定暴击
-define(PROP_CALC_SPECIAL_OPTION_CERTAINLY_CS, 4).

%% API
-export([calc/3, calc/5, battleProps2NetMsg/2]).

%% query
-export([
    query_pf_bpc/2,
    query_pf_bpu/2,
    query_v_pf_bpu/2
]).

%% calc damage
-export([
    calcHitAndDamage/4,
    calcTreat/5
]).

-spec query_pf_bpc(PropID::battlePropID(), #m_battleProps{}) -> battlePropCache().
query_pf_bpc(PropID, #m_battleProps{} = BattleProps) ->
    Pos = calc_id_to_pos(PropID),
    ListBPC = erlang:element(Pos, BattleProps),
    queryValueFromListBPC(PropID, ListBPC).

-spec query_pf_bpu(PropID::battlePropID(), #m_battleProps{}) -> battlePropUse().
query_pf_bpu(PropID, #m_battleProps{listBPFinal = ListBPFinal}) ->
    queryValueFromListBPU(PropID, ListBPFinal).

-spec query_v_pf_bpu(PropID::battlePropID(), #m_battleProps{}) -> Value::integer() | float().
query_v_pf_bpu(PropID, #m_battleProps{listBPFinal = ListBPFinal}) ->
    {_, _, Value} = queryValueFromListBPU(PropID, ListBPFinal),
    Value.

%%%-------------------------------------------------------------------
%% internal,tool:从列表中查找一个属性值，没找到则返回默认值
-spec queryValueFromListBPU(battlePropID(), listBPU()) -> battlePropUse().
queryValueFromListBPU(ID, List) ->
    case lists:keyfind(ID, 1, List) of
        false ->
            ?DEFAULT_BATTLE_PROP_USE(ID);
        BPU ->
            BPU
    end.
-spec queryValueFromListBPC(battlePropID(), listBPC()) -> battlePropCache().
queryValueFromListBPC(ID, List) ->
    case lists:keyfind(ID, #m_bp.id, List) of
        false ->
            ?DEFAULT_BATTLE_PROP_CACHE(ID);
        BPC ->
            BPC
    end.

%%%-------------------------------------------------------------------
%% api:战斗属性的刷新
-spec calc(BattleProps, AddList, DelList) -> Ret when
    BattleProps :: battleProps(),
    AddList :: listBPU(), DelList :: listBPU(),
    Ret :: battleProps().
calc(BattleProps, AddList, DelList) ->
    AddListReal = [?DEFAULT_BATTLE_PROP_USE(?BP_2_HP_CUR) | [?DEFAULT_BATTLE_PROP_USE(?BP_2_HP_MAX) | AddList]],
    Ret1 = calc_add(AddListReal, BattleProps),
    Ret2 = calc_del(DelList, Ret1),
    calc_convert(Ret2).

%%%-------------------------------------------------------------------
%% api:战斗属性的刷新
-spec calc(BattleProps, AddList, MultiList, AddList_Del, MultiList_Del) -> Ret when
    BattleProps :: battleProps(),
    AddList :: listBPU(), MultiList :: listBPU(),
    AddList_Del :: listBPU(), MultiList_Del :: listBPU(),
    Ret :: battleProps().
calc(BattleProps, AddList, MultiList, AddList_Del, MultiList_Del) ->
    %% 默认添加血量是为了属性列表中必然有血量相关属性
    AddListReal = [?DEFAULT_BATTLE_PROP_USE(?BP_2_HP_CUR) | [?DEFAULT_BATTLE_PROP_USE(?BP_2_HP_MAX) | AddList]],
    Ret1 = calc_add(AddListReal, BattleProps),
    Ret2 = calc_add(MultiList, Ret1),
    Ret3 = calc_del(AddList_Del, Ret2),
    Ret4 = calc_del(MultiList_Del, Ret3),
    Ret5 = calc_convert(Ret4),
    ListBPFinal1 = calc_limit(
        [
            {?BP_2_HP_MAX, 1, max},
            {?BP_2_MP_MAX, 1, max},
            {?BP_2_ATK, 0, max}
        ],
        Ret5#m_battleProps.listBPFinal
    ),
    Ret5#m_battleProps{listBPFinal = calc_max2cur(BattleProps#m_battleProps.listBPFinal, ListBPFinal1)}.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 血量、法力最大值变化引起的当前值变化
-spec calc_max2cur(ListOld::listBPU(), ListNew::listBPU()) -> ListReal::listBPU().
calc_max2cur(ListOld, ListNew) ->
    {_, _, HpOld} = queryValueFromListBPU(?BP_2_HP_CUR, ListOld),
    {_, _, HpMaxOld} = queryValueFromListBPU(?BP_2_HP_MAX, ListOld),
    {_, _, MpOld} = queryValueFromListBPU(?BP_2_MP_CUR, ListOld),
    {_, _, MpMaxOld} = queryValueFromListBPU(?BP_2_MP_MAX, ListOld),
    {_, _, HpNew} = queryValueFromListBPU(?BP_2_HP_CUR, ListNew),
    {_, _, HpMaxNew} = queryValueFromListBPU(?BP_2_HP_MAX, ListNew),
    {_, _, MpNew} = queryValueFromListBPU(?BP_2_MP_CUR, ListNew),
    {_, _, MpMaxNew} = queryValueFromListBPU(?BP_2_MP_MAX, ListNew),
    ListReal =
        case erlang:min(MpMaxNew, erlang:max(1.0, MpMaxNew - MpMaxOld + MpOld)) of
            MpNew ->
                ListNew;
            MpNew_ ->
                lists:keystore(?BP_2_MP_CUR, 1, ListNew,
                    {?BP_2_MP_CUR, ?BPUseType_ADD, MpNew_})
        end,
    case HpOld < 1.0 of
        true ->
            ListReal;
        _ ->
            case erlang:min(HpMaxNew, erlang:max(1.0, HpMaxNew - HpMaxOld + HpOld)) of
                HpNew ->
                    ListReal;
                HpNew_ ->
                    lists:keystore(?BP_2_HP_CUR, 1, ListReal,
                        {?BP_2_HP_CUR, ?BPUseType_ADD, HpNew_})
            end
    end.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 部分属性值限制
-spec calc_limit(ListLimit, listBPU()) -> listBPU() when
    ListLimit :: {PropID, Min, Max},
    PropID :: float(), Min :: float(), Max :: float().
calc_limit([{PropID, Min, max} | T], ListBPFinal) ->
    %% 只限制最小值
    {_, _, Value} = queryValueFromListBPU(PropID, ListBPFinal),
    case erlang:max(Value, Min) of
        Value ->
            calc_limit(T, ListBPFinal);
        New ->
            calc_limit(T, lists:keystore(
                PropID, 1, ListBPFinal, {PropID, ?BPUseType_ADD, New}))
    end;
calc_limit([{PropID, min, Max} | T], ListBPFinal) ->
    %% 只限制最大值
    {_, _, Value} = queryValueFromListBPU(PropID, ListBPFinal),
    case erlang:min(Value, Max) of
        Value ->
            calc_limit(T, ListBPFinal);
        New ->
            calc_limit(T, lists:keystore(
                PropID, 1, ListBPFinal, {PropID, ?BPUseType_ADD, New}))
    end;
calc_limit([{PropID, Min, Max} | T], ListBPFinal) ->
    %% 两边都限制
    {_, _, Value} = queryValueFromListBPU(PropID, ListBPFinal),
    case erlang:min(erlang:max(Min, Value), Max) of
        Value ->
            calc_limit(T, ListBPFinal);
        New ->
            calc_limit(T, lists:keystore(
                PropID, 1, ListBPFinal, {PropID, ?BPUseType_ADD, New}))
    end;
calc_limit([], ListBPFinal) ->
    ListBPFinal.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 根据属性ID获取对应的字段序号
-spec calc_id_to_pos(ID :: battlePropID()) -> Pos :: pos_integer().
calc_id_to_pos(ID) when ?BP_1_MIN =< ID andalso ID =< ?BP_1_MAX ->
    #m_battleProps.listBP1;
calc_id_to_pos(ID) when ?BP_2_MIN =< ID andalso ID =< ?BP_2_MAX ->
    #m_battleProps.listBP2;
calc_id_to_pos(ID) when ?BP_3_MIN =< ID andalso ID =< ?BP_3_MAX ->
    #m_battleProps.listBP3;
calc_id_to_pos(ID) when ?BP_4_MIN =< ID andalso ID =< ?BP_4_MAX ->
    #m_battleProps.listBP4.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 添加属性
%% 考虑到运算性能，将 calc_add/2 和 calc_del/2 分开实现了
-spec calc_add(ListBPU, BattleProps) -> Ret when
    ListBPU :: listBPU(), BattleProps :: battleProps(), Ret :: battleProps().
calc_add([{ID, Type, Value} | T], BattleProps) ->
    Pos = calc_id_to_pos(ID),
    ListBPC = erlang:element(Pos, BattleProps),
    ListBPCNew = calc_add(Type, ID, Value, ListBPC),
    calc_add(T, erlang:setelement(Pos, BattleProps, ListBPCNew));
calc_add([], BattleProps) ->
    BattleProps.

calc_add(?BPUseType_ADD, ID, Value, ListBPC) ->
    case lists:keyfind(ID, #m_bp.id, ListBPC) of
        false ->
            [#m_bp{id = ID, add = Value} | ListBPC];
        #m_bp{add = Add} = Old ->
            New = Old#m_bp{add = Add + Value},
            lists:keyreplace(ID, #m_bp.id, ListBPC, New)
    end;
calc_add(?BPUseType_MUL, ID, Value, ListBPC) ->
    case lists:keyfind(ID, #m_bp.id, ListBPC) of
        false ->
            [#m_bp{id = ID, mul = 1.0 + Value} | ListBPC];
        #m_bp{mul = Mul} = Old ->
            New = Old#m_bp{add = Mul + Value},
            lists:keyreplace(ID, #m_bp.id, ListBPC, New)
    end;
calc_add(_BPUseType, _ID, _Value, ListBPC) ->
    ListBPC.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 减少属性
%% 考虑到运算性能，将 calc_add/2 和 calc_del/2 分开实现了
-spec calc_del(ListBPU, BattleProps) -> Ret when
    ListBPU :: listBPU(), BattleProps :: battleProps(), Ret :: battleProps().
calc_del([{ID, Type, Value} | T], BattleProps) ->
    Pos = calc_id_to_pos(ID),
    ListBPC = erlang:element(Pos, BattleProps),
    ListBPCNew = calc_del(Type, ID, Value, ListBPC),
    calc_del(T, erlang:setelement(Pos, BattleProps, ListBPCNew));
calc_del([], BattleProps) ->
    BattleProps.

calc_del(?BPUseType_ADD, ID, Value, ListBPC) ->
    case lists:keyfind(ID, #m_bp.id, ListBPC) of
        false ->
            [#m_bp{id = ID, add = - Value} | ListBPC];
        #m_bp{add = Add} = Old ->
            New = Old#m_bp{add = Add - Value},
            lists:keyreplace(ID, #m_bp.id, ListBPC, New)
    end;
calc_del(?BPUseType_MUL, ID, Value, ListBPC) ->
    case lists:keyfind(ID, #m_bp.id, ListBPC) of
        false ->
            [#m_bp{id = ID, mul = 1.0 - Value} | ListBPC];
        #m_bp{mul = Mul} = Old ->
            New = Old#m_bp{add = Mul - Value},
            lists:keyreplace(ID, #m_bp.id, ListBPC, New)
    end;
calc_del(_BPUseType, _ID, _Value, ListBPC) ->
    ListBPC.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 转换属性
%% 1类属性可根据职业转换为2、3类属性
%% 3类属性可转换为4类属性
%% 平时刷新就把属性计算好，战斗时可以使用计算好的属性快速计算
-spec calc_convert(battleProps()) -> battleProps().
calc_convert(
    #m_battleProps{
        career = Career,
        listBP1 = ListBP1,
        listBP2 = ListBP2,
        listBP3 = ListBP3,
        listBP4 = ListBP4
    } = BattleProps
) ->
    {ListBP1Final, ListBP2Final, ListBP3Final} =
        calc_convert_1(ListBP1, Career, [], ListBP2, ListBP3),
    ListBP4Final = calc_convert_3(ListBP3Final, ListBP4),
    ListBPFinal = ListBP1Final ++ ListBP2Final ++ ListBP3Final ++ ListBP4Final,
    BattleProps#m_battleProps{listBPFinal = ListBPFinal}.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 转换属性 之 低层属性转换为高层属性
%% 注意！转换结果只有加法值
-spec calc_convert_up(ID, Convert, Value, ListBPC) -> ListBPCNew when
    ID :: battlePropID(), Convert :: float(), Value :: float(),
    ListBPC :: listBPC(), ListBPCNew :: listBPC().
calc_convert_up(ID, Convert, Value, ListBPC) ->
    case lists:keyfind(ID, #m_bp.id, ListBPC) of
        false ->
            [#m_bp{id = ID, add = Value * Convert} | ListBPC];
        #m_bp{add = Add} = Old ->
            New = Old#m_bp{add = Add + Value * Convert},
            lists:keyreplace(ID, #m_bp.id, ListBPC, New)
    end.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 转换属性 之 存储属性转换为最终属性
%% 注意！转换为 battlePropUse() 是为了战斗流程中更方便参与计算
-spec calc_convert_final(battlePropCache()) -> battlePropUse().
calc_convert_final(#m_bp{id = ID, add = Add, mul = Mul}) ->
    {ID, ?BPUseType_ADD, Add * Mul}.

-spec calc_convert_finals(listBPC(), listBPU()) -> listBPU().
calc_convert_finals([H | T], Acc) ->
    calc_convert_finals(T, [calc_convert_final(H) | Acc]);
calc_convert_finals([], Acc) ->
    Acc.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 转换属性 之 1类属性转换
%% 同时得到1、2、3类属性的最终值
-spec calc_convert_1(ListBP1, Career, ListBP1Final, ListBP2Acc, ListBP3Acc) -> Ret when
    ListBP1 :: listBPC(), Career :: integer(), ListBP1Final :: listBPU(),
    ListBP2Acc :: listBPC(), ListBP3Acc :: listBPC(),
    Ret :: {ListBP1Final, ListBP2Final, ListBP3Final},
    ListBP2Final :: listBPU(), ListBP3Final :: listBPU().
calc_convert_1([H | T], Career, ListBP1Final, ListBP2Acc, ListBP3Acc) ->
    BP1Final = {ID, _UseType, Add} = calc_convert_final(H),
    {_, List2, List3} = lists:keyfind(Career, 1, ?Career2List),
    {_, List1to2} = lists:keyfind(ID, 1, List2),
    ListBP2AccNew = calc_convert_1_(List1to2, Add, ListBP2Acc),
    {_, List1to3} = lists:keyfind(ID, 1, List3),
    ListBP3AccNew = calc_convert_1_(List1to3, Add, ListBP3Acc),
    calc_convert_1(T, Career, [BP1Final | ListBP1Final], ListBP2AccNew, ListBP3AccNew);
calc_convert_1([], _Career, ListBP1Final, ListBP2Acc, ListBP3Acc) ->
    ListBP2Final = calc_convert_finals(ListBP2Acc, []),
    ListBP3Final = calc_convert_finals(ListBP3Acc, []),
    {ListBP1Final, ListBP2Final, ListBP3Final}.

-spec calc_convert_1_(ListCfg, Value, ListBPC) -> Ret when
    ListCfg :: [Cfg, ...], Cfg :: {battlePropID(), float()},
    Value :: float(), ListBPC :: listBPC(), Ret :: listBPC().
calc_convert_1_([{ID, Convert} | T], Value, ListBPC) ->
    ListBPCNew = calc_convert_up(ID, Convert, Value, ListBPC),
    calc_convert_1_(T, Value, ListBPCNew);
calc_convert_1_([], _Value, ListBPC) ->
    ListBPC.

%%%-------------------------------------------------------------------
%% internal:战斗属性的刷新 之 转换属性 之 3类属性转换
%% 得到4类属性的最终值
-spec calc_convert_3(ListBP3Final, ListBP4Acc) -> ListBP4Final when
    ListBP3Final :: listBPU(), ListBP4Acc :: listBPC(), ListBP4Final :: listBPU().
calc_convert_3([{ID3, _UseType, Add3} | T], ListBP4Acc) ->
    {ID4, Add4} = calc_convert_3_(ID3, Add3),
    ListBP4AccNew = calc_convert_up(ID4, 1.0, Add4, ListBP4Acc),
    calc_convert_3(T, ListBP4AccNew);
calc_convert_3([], ListBP4Acc) ->
    calc_convert_finals(ListBP4Acc, []).

%% todo 目前属性3转换为属性4写死在代码里，成型后再考虑优化
-spec calc_convert_3_(ID3, Value3) -> Ret when
    ID3 :: battlePropID(), Value3 :: float(),
    Ret :: {ID4, Value4}, ID4 :: battlePropID(), Value4 :: float().
calc_convert_3_(?BP_3_HIT, Value) ->
    %% 策划给的公式：
    %% 真实闪避率 = ( 1 / (1+e^(-0.3*(Target闪避值-User命中值)))) / 5
    %% 自身的真实命中率 = (1 - 对方的真实闪避率)
    %% 因此处无法获取目标数值，因此此处Target闪避值固定使用100.0代替
    %% 直译为代码：
    %% Percent = 1.0 - (1.0 / (1.0 + math:pow(2.71828, (-0.3 * (100.0 - Value))))) / 5.0
    %% pow(2.7, 714.7)将会报错，因此这里需要处理极值的问题，极值为pow(2.7, 100)
    {?BP_4_HIT, 1.0 - (0.2 / (1 + my_pow(2.71828, (0.3 * Value - 30.0))))};
calc_convert_3_(?BP_3_FLEE, Value) ->
    %% 策划给的公式：
    %% 真实闪避率 = ( 1 / (1+e^(-0.3*(Target闪避值-User命中值)))) / 5
    %% 因此处无法获取目标数值，因此此处User命中值固定使用100.0代替
    %% 直译为代码：
    %% Percent = (1.0 / (1.0 + math:pow(2.71828, (-0.3 * (Value - 100.0))))) / 5.0
    {?BP_4_FLEE, 0.2 / (1 + my_pow(2.71828, (30.0 - 0.3 * Value)))};
calc_convert_3_(?BP_3_CRI, Value) ->
    {?BP_4_CRI, Value / (Value + 100)};
calc_convert_3_(?BP_3_FAST, Value) ->
    {?BP_4_FAST, Value / (Value + 100)}.

%%%-------------------------------------------------------------------
%% api:战斗属性转换为协议结构便于发送
-spec battleProps2NetMsg(uint64(), battleProps()) -> #pk_GS2U_BattleProps{}.
battleProps2NetMsg(UID, #m_battleProps{
    career = Career,
    listBP1 = ListBP1,
    listBP2 = ListBP2,
    listBP3 = ListBP3,
    listBP4 = ListBP4,
    listBPFinal = ListBPFinal
}) ->
    #pk_GS2U_BattleProps{
        uid = UID,
        career = Career,
        listBP1 = battleProps2NetMsg_cache(ListBP1, []),
        listBP2 = battleProps2NetMsg_cache(ListBP2, []),
        listBP3 = battleProps2NetMsg_cache(ListBP3, []),
        listBP4 = battleProps2NetMsg_cache(ListBP4, []),
        listBPFinal = battleProps2NetMsg_use(ListBPFinal, [])
    }.

-spec battleProps2NetMsg_cache(listBPC(), [#pk_BattlePropEx{}, ...]) -> [#pk_BattlePropEx{}, ...].
battleProps2NetMsg_cache([#m_bp{id = ID, add = Add, mul = Mul} | T], Acc) ->
    battleProps2NetMsg_cache(T, [#pk_BattlePropEx{propID = ID, addValue = Add, mulValue = Mul} | Acc]);
battleProps2NetMsg_cache([], Acc) ->
    Acc.

-spec battleProps2NetMsg_use(listBPU(), [#pk_BattleProp{}, ...]) -> [#pk_BattleProp{}, ...].
battleProps2NetMsg_use([{ID, _Type, Add} | T], Acc) ->
    battleProps2NetMsg_use(T, [#pk_BattleProp{propID = ID, addValue = Add} | Acc]);
battleProps2NetMsg_use([], Acc) ->
    Acc.

%%%-------------------------------------------------------------------
%% 计算治疗
-spec calcTreat(#m_battleProps{}, #m_battleProps{},
    TreatValue::float(), SpecialOptions::integer(), IsSuckBloodFlag::boolean()) -> #m_hit_damage_result{}.
calcTreat(#m_battleProps{} = AttackBps, #m_battleProps{} = DefenderBps, TreatValue, SpecialOptions, IsSuckBloodFlag) ->
    {
        [
            {_, _, BP_2_HP_MAX_ADD_Des},
            {_, _, BP_2_HP_CUR_ADD_Des}
        ],
        []
    } = calcHitQuery(DefenderBps, [?BP_2_HP_MAX, ?BP_2_HP_CUR], []),

    %% 暴击
    {IsCri, MulCri} =
        case IsSuckBloodFlag of
            true ->
                %% 吸血不暴击
                {false, 1.0};
            _ ->
                case sp_get_cri(SpecialOptions) of
                    true ->
                        {true, 2.0};
                    _ ->
                        {[{_, _, BP_4_CRI_ADD_Src}], []} = calcHitQuery(AttackBps, [?BP_4_CRI], []),
                        case misc:rand(0, ?PERCENT) < erlang:trunc(BP_4_CRI_ADD_Src * ?PERCENT) of
                            true ->
                                {true, 2.0};    %% fixme 暴击固定为2倍伤害
                            _ ->
                                {false, 1.0}    %% 没暴击则单倍伤害
                        end
                end
        end,

    %% 修正目标血量并返回结果
    HpNew = erlang:min(BP_2_HP_CUR_ADD_Des + (TreatValue * MulCri), BP_2_HP_MAX_ADD_Des),
    ListBPFinal = lists:keyreplace(
        ?BP_2_HP_CUR, 1, DefenderBps#m_battleProps.listBPFinal,
        {?BP_2_HP_CUR, ?BPUseType_ADD, HpNew}
    ),
    #m_hit_damage_result{
        attackBps = AttackBps,
        defenseBps = DefenderBps#m_battleProps{listBPFinal = ListBPFinal},
        isHit = true,
        isCri = IsCri,
        damage = 0.0,
        deltaHp = HpNew - BP_2_HP_CUR_ADD_Des,
        isDead = HpNew < 1.0
    }.

%% api:计算战斗伤害
%% ListBPUExtra 表示本次计算中对来源属性修正，仅限于类型2、类型3的属性
-spec calcHitAndDamage(#m_battleProps{}, #m_battleProps{},
    DamageValue::float(), SpecialOptions::integer()) -> #m_hit_damage_result{}.
calcHitAndDamage(#m_battleProps{} = AttackBps, #m_battleProps{} = DefenderBps, DamageValue, SpecialOptions) ->
    {
        [
            {_, _, BP_3_HIT_ADD_Src},
            {_, _, BP_4_CRI_ADD_Src}
        ],
        [
            #m_bp{add = BP_4_HIT_ADD_Src, mul = BP_4_HIT_MUL_Src}
        ]
    } = calcHitQuery(AttackBps, [?BP_3_HIT, ?BP_4_CRI], [?BP_4_HIT]),
    {
        [
            {_, _, BP_2_DEF_ADD_Des},
            {_, _, BP_2_HP_MAX_ADD_Des},
            {_, _, BP_2_HP_CUR_ADD_Des},
            {_, _, BP_3_FLEE_ADD_Des}
        ],
        [
            #m_bp{add = BP_4_FLEE_ADD_Des, mul = BP_4_FLEE_MUL_Des}
        ]
    } = calcHitQuery(DefenderBps, [?BP_2_DEF, ?BP_2_HP_MAX, ?BP_2_HP_CUR, ?BP_3_FLEE], [?BP_4_FLEE]),

    %% 是否命中
    IsHit =
        case sp_get_hit(SpecialOptions) of
            true ->
                true;
            _ ->
                calcHitAndDamage_isHit(BP_3_HIT_ADD_Src, BP_4_HIT_ADD_Src, BP_4_HIT_MUL_Src,
                    BP_3_FLEE_ADD_Des, BP_4_FLEE_ADD_Des, BP_4_FLEE_MUL_Des)
        end,

    case IsHit of
        false ->
            %% 未命中，什么也不用说了
            #m_hit_damage_result{
                attackBps = AttackBps,
                defenseBps = DefenderBps,
                isHit = IsHit,
                isCri = false,
                damage = 0.0,
                deltaHp = 0,
                isDead = BP_2_HP_CUR_ADD_Des < 1.0
            };
        true ->
            %% 暴击
            {IsCri, MulCri} =
                case sp_get_cri(SpecialOptions) of
                    true ->
                        {true, 2.0};
                    _ ->
                        case misc:rand(0, ?PERCENT) < erlang:trunc(BP_4_CRI_ADD_Src * ?PERCENT) of
                            true ->
                                {true, 2.0};    %% fixme 暴击固定为2倍伤害
                            _ ->
                                {false, 1.0}    %% 没暴击则单倍伤害
                        end
                end,

            %% 是否无视防御
            BP_2_DEF_ADD_Des2 = sp_get_defense(SpecialOptions, BP_2_DEF_ADD_Des),

            {Damage, DeltaHp} = calcHitAndDamage_damage(DamageValue, MulCri,
                BP_2_DEF_ADD_Des2, BP_2_HP_MAX_ADD_Des, BP_2_HP_CUR_ADD_Des
            ),

            %% 修正目标血量并返回结果
            HpNew = erlang:max(BP_2_HP_CUR_ADD_Des + DeltaHp, 0.0),
            ListBPFinal = lists:keyreplace(
                ?BP_2_HP_CUR, 1, DefenderBps#m_battleProps.listBPFinal,
                {?BP_2_HP_CUR, ?BPUseType_ADD, HpNew}
            ),
            #m_hit_damage_result{
                attackBps = AttackBps,
                defenseBps = DefenderBps#m_battleProps{listBPFinal = ListBPFinal},
                isHit = IsHit,
                isCri = IsCri,
                damage = Damage,
                deltaHp = DeltaHp,
                isDead = HpNew < 1.0
            }
    end.

%%%-------------------------------------------------------------------
%% internal:计算战斗伤害_获取指定属性用于后续计算
-spec calcHitQuery(UID, ListBPIDF, ListBPID4) -> Ret when
    UID :: uint64(), ListBPIDF :: [battlePropID(), ...], ListBPID4 :: [battlePropID(), ...],
    Ret :: {ListNeedBPF, ListNeedBP4}, ListNeedBPF :: listBPU(), ListNeedBP4 :: listBPC().
calcHitQuery(Props, ListBPIDF, ListBPID4) ->
    %% 注1：1类、2类、3类属性，直接从 listBPFinal 字段取最终结果，减少因属性转化带来的计算量
    %% 注2：4类属性中，有部分属性是需要与其它对象属性一起计算的，则需要从 listBP4 字段取结果，否则仍然从 listBPFinal 字段获取最终结果
    ListNeedBPF = [query_pf_bpu(ID, Props) || ID <- ListBPIDF],
    ListNeedBP4 = [query_pf_bpc(ID, Props) || ID <- ListBPID4],
    {ListNeedBPF, ListNeedBP4}.

%%%-------------------------------------------------------------------
%% internal:计算战斗伤害_判断是否命中
-spec calcHitAndDamage_isHit(Hit3Add, Hit4Add, Hit4Mul, Flee3Add, Flee4Add, Flee4Mul) -> Ret when
    Hit3Add :: float(), Hit4Add :: float(), Hit4Mul :: float(),
    Flee3Add :: float(), Flee4Add :: float(), Flee4Mul :: float(), Ret :: boolean().
calcHitAndDamage_isHit(Hit3Add, Hit4Add, Hit4Mul, Flee3Add, Flee4Add, Flee4Mul) ->
    %% 参考calc_convert_3_/2
    %% Percent = (1.0 / (1.0 + math:pow(2.71828, (-0.3 * (FleeDes - HitSrc))))) / 5.0,
    %% todo Hit4Add, Hit4Mul, Flee4Add, Flee4Mul 这几个值因为设计问题暂时没用上，需要与策划进一步讨论
    FleePercent = 2000 / (0.2 + 0.2 * my_pow(2.71828, (-0.3 * (Flee3Add - Hit3Add)))),    %% 放大10000倍用于下文概率计算
    not (misc:rand(0, ?PERCENT) < erlang:trunc(FleePercent)).

-spec calcHitAndDamage_damage(DamageValue, MulCri, Def, HpMax, HpCur) -> Ret when
    DamageValue :: float(), MulCri :: float(), Def :: float(),
    HpMax :: float(), HpCur :: float(), Ret :: {Damage, DeltaHp},
    Damage :: float(), DeltaHp :: integer().
calcHitAndDamage_damage(DamageValue, MulCri, Def, HpMax, HpCur) ->
    %% fixme 防御效率 = 防御强度 / (防御强度 + 100) 若该算法固定，可单独提炼为一个4类属性用于快速计算
    %% 策划原始伤害公式  【伤害值】* （1- （Target防御强度 / （Target防御强度 + 100））） = 【伤害结果】
    %% 策划不在，根据实际微调为 伤害强度 * 伤害倍率 * (1 - 防御效率) = 伤害值
    Damage = DamageValue * MulCri * (1 - (Def / (Def + 100))),
    DeltaHp = erlang:trunc(erlang:min(Damage, HpCur)),
    %%?DEBUG(
    %%    "[DebugForBattle] calcHitAndDamage_damage Atk:~w MulCri:~w Def:~w HpMax:~w HpCur:~w Damage:~w DeltaHp:~w",
    %%    [Atk, MulCri, Def, HpMax, HpCur, -Damage, -DeltaHp]
    %%),
    {-Damage, -DeltaHp}.

my_pow(X, Y) -> math:pow(X, erlang:min(Y, 100)).

%%%-------------------------------------------------------------------
%%%特殊事件处理
sp_get_defense(SpecialOptions, Defense) ->
    case check_sp(SpecialOptions, ?PROP_CALC_SPECIAL_OPTION_IGNORE_DEFENSE) of
        true -> 0;
        _ -> Defense
    end.

sp_get_hit(SpecialOptions) ->
    check_sp(SpecialOptions, ?PROP_CALC_SPECIAL_OPTION_CERTAINLY_HIT).

sp_get_cri(SpecialOptions) ->
    check_sp(SpecialOptions, ?PROP_CALC_SPECIAL_OPTION_CERTAINLY_CS).

check_sp(0, _Flag) ->
    false;
check_sp(SpecialOptions, Flag)
    when is_integer(SpecialOptions),SpecialOptions > 0,is_integer(Flag),Flag > 0 ->
    (SpecialOptions band Flag) /= 0;
check_sp(_SpecialOptions, _Flag) ->
    false.
%%%-------------------------------------------------------------------