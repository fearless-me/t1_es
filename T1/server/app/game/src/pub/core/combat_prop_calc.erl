%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 15:25
%%%-------------------------------------------------------------------
-module(combat_prop_calc).
-author("mawenhong").
-include("logger.hrl").
-include("combat.hrl").

%% API
-export([calc/5]).

%%%-------------------------------------------------------------------
%% api:战斗属性的刷新
-spec calc(BattleProps, AddList, MultiList, AddList_Del, MultiList_Del) -> Ret when
    BattleProps :: battleProps(),
    AddList :: listBPU(), MultiList :: listBPU(),
    AddList_Del :: listBPU(), MultiList_Del :: listBPU(),
    Ret :: battleProps().
calc(BattleProps, [], [], [], []) ->
    BattleProps;
calc(BattleProps, AddList, MultiList, AddList_Del, MultiList_Del) ->
    Ret1 = calc_add(AddList, BattleProps),
    Ret2 = calc_add(MultiList, Ret1),
    Ret3 = calc_del(AddList_Del, Ret2),
    Ret4 = calc_del(MultiList_Del, Ret3),
    calc_convert(Ret4).

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

%% todo 此处应该根据配置计算，临时用写死的宏计算
-define(Career_1,   1). %% 临时定义职业_战士
-define(Career_2,   2). %% 临时定义职业_法师
-define(Career_3,   3). %% 临时定义职业_刺客
-define(Career_4,   4). %% 临时定义职业_骑士
-define(Career_1_2, [
    {?BP_1_STR, [{?BP_2_HP_MAX, 2.0}, {?BP_2_MP_MAX, 1.0}, {?BP_2_ATK, 3.0}, {?BP_2_DEF, 1.0}]},
    {?BP_1_AGI, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_INT, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_STA, [{?BP_2_HP_MAX, 3.0}, {?BP_2_MP_MAX, 1.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 2.0}]}
]).
-define(Career_1_3, [
    {?BP_1_STR, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 1.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_AGI, [{?BP_3_HIT, 2.0}, {?BP_3_FLEE, 2.0}, {?BP_3_CRI, 2.0}, {?BP_3_FAST, 2.0}]},
    {?BP_1_INT, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_STA, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]}
]).
-define(Career_2_2, [
    {?BP_1_STR, [{?BP_2_HP_MAX, 1.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 1.0}]},
    {?BP_1_AGI, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_INT, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 3.0}, {?BP_2_ATK, 3.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_STA, [{?BP_2_HP_MAX, 3.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 2.0}]}
]).
-define(Career_2_3, [
    {?BP_1_STR, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_AGI, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 2.0}, {?BP_3_CRI, 1.0}, {?BP_3_FAST, 1.0}]},
    {?BP_1_INT, [{?BP_3_HIT, 2.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 3.0}, {?BP_3_FAST, 2.0}]},
    {?BP_1_STA, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]}
]).
-define(Career_3_2, [
    {?BP_1_STR, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 2.0}, {?BP_2_DEF, 1.0}]},
    {?BP_1_AGI, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 3.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_INT, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_STA, [{?BP_2_HP_MAX, 3.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 2.0}]}
]).
-define(Career_3_3, [
    {?BP_1_STR, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_AGI, [{?BP_3_HIT, 3.0}, {?BP_3_FLEE, 3.0}, {?BP_3_CRI, 3.0}, {?BP_3_FAST, 2.0}]},
    {?BP_1_INT, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 2.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_STA, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]}
]).
-define(Career_4_2, [
    {?BP_1_STR, [{?BP_2_HP_MAX, 2.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 2.0}, {?BP_2_DEF, 3.0}]},
    {?BP_1_AGI, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_INT, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_STA, [{?BP_2_HP_MAX, 3.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 3.0}]}
]).
-define(Career_4_3, [
    {?BP_1_STR, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_AGI, [{?BP_3_HIT, 2.0}, {?BP_3_FLEE, 2.0}, {?BP_3_CRI, 2.0}, {?BP_3_FAST, 1.0}]},
    {?BP_1_INT, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_STA, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]}
]).
-define(Career2List, [
    {?Career_1, ?Career_1_2, ?Career_1_3},
    {?Career_2, ?Career_2_2, ?Career_2_3},
    {?Career_3, ?Career_3_2, ?Career_3_3},
    {?Career_4, ?Career_4_2, ?Career_4_3}
]).

-spec calc_convert_1(ListBP1, Career, ListBP1Final, ListBP2Acc, ListBP3Acc) -> Ret when
    ListBP1 :: listBPC(), Career :: integer(), ListBP1Final :: listBPU(),
    ListBP2Acc :: listBPC(), ListBP3Acc :: listBPC(),
    Ret :: {ListBP1Final, ListBP2Final, ListBP3Final},
    ListBP2Final :: listBPU(), ListBP3Final :: listBPU().
calc_convert_1([H | T], Career, ListBP1Final, ListBP2Acc, ListBP3Acc) ->
    BP1Final = {ID, _UseType, Add} = calc_convert_final(H),
    {List1to2, List1to3} = lists:keyfind(Career, 1, ?Career2List),
    ListBP2AccNew = calc_convert_1_(lists:keyfind(ID, 1, List1to2), Add, ListBP2Acc),
    ListBP3AccNew = calc_convert_1_(lists:keyfind(ID, 1, List1to3), Add, ListBP3Acc),
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
    {?BP_4_HIT, 1.0 - (0.2 / (1 + math:pow(2.71828, (0.3 * Value - 30.0))))};
calc_convert_3_(?BP_3_FLEE, Value) ->
    %% 策划给的公式：
    %% 真实闪避率 = ( 1 / (1+e^(-0.3*(Target闪避值-User命中值)))) / 5
    %% 因此处无法获取目标数值，因此此处User命中值固定使用100.0代替
    %% 直译为代码：
    %% Percent = (1.0 / (1.0 + math:pow(2.71828, (-0.3 * (Value - 100.0))))) / 5.0
    {?BP_4_FLEE, 0.2 / (1 + math:pow(2.71828, (30.0 - 0.3 * Value)))};
calc_convert_3_(?BP_3_CRI, Value) ->
    {?BP_4_CRI, Value / (Value + 100)};
calc_convert_3_(?BP_3_FAST, Value) ->
    {?BP_4_FAST, Value / (Value + 100)}.
