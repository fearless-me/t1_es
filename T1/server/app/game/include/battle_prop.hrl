%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("tiancheng").

-ifndef(BATTLE_PROP_HRL).
-define(BATTLE_PROP_HRL, true).

%% 导出类型
-export_type([
   battlePropUseType/0, battlePropID/0,
   battlePropUse/0, listBPU/0,
   battlePropCache/0, listBPC/0,
   battleProps/0
]).

%% 属性作用类型
-define(BPUseType_IGNORE,   0). %% ignore 忽略，表示该项属性的效果被关闭，不参与计算
-define(BPUseType_ADD,      1). %% addition 加法值
-define(BPUseType_MUL,      2). %% multiplication 乘法值（乘法计算以属性项为单位，在加法计算完成后执行）
-define(BPUseType_FINAL,    3). %% final 最终值，计算后的缓存结果，都是加法值的形式，用于直接显示和快速计算
-type battlePropUseType() :: ?BPUseType_ADD .. ?BPUseType_FINAL.

%% 属性单元结构
-type battlePropID() :: integer().
-type battlePropUse() :: {battlePropID(), battlePropUseType(), float()}.  %% 该结构用于计算
-type listBPU() :: [battlePropUse(), ...].
-define(DEFAULT_BATTLE_PROP_USE(ID), {?BPUseType_ADD, ID, 0.0}).
-record(m_bp, {id, add = 0.0, mul = 1.0}).
-type battlePropCache() :: #m_bp{}. %% 该结构用于缓存
-type listBPC() :: [battlePropCache(), ...].
-define(DEFAULT_BATTLE_PROP_CACHE(ID), #m_bp{id = ID}).

%% 属性集结构
-record(m_battleProps, {
   career      = 0     :: integer(),   %% 职业ID，不同职业影响属性1转化为属性2、属性3的效率，职业0不进行转化
   listBP1     = []    :: listBPC(),   %% 缓存属性1列表，表示基础属性，可转换为属性2、属性3
   listBP2     = []    :: listBPC(),   %% 缓存属性2列表，表示通常属性，此处不包含从属性1转换而来的部分
   listBP3     = []    :: listBPC(),   %% 缓存属性3列表，表示特殊属性，可转换为属性4，此处不包含从属性1转换而来的部分
   listBP4     = []    :: listBPC(),   %% 缓存属性4列表，表示概率属性，此处不包含从属性3转换而来的部分
   listBPFinal = []    :: listBPU()    %% 最终属性列表，所有属性在加算、乘算、转化后得到值，可快速用于显示、战斗等计算
}).
-type battleProps() :: #m_battleProps{}.

%% 属性定义%% 通过编辑数据库dbt_conf.prop_define后，启动数据编辑工具自动生成改文件并提交
-define(BP_1_MIN, 0). %% 1类属性最小值（基础）--1类属性根据职业会转化为2类属性和3类属性
-define(BP_1_STR, 0). %% 力量
-define(BP_1_AGI, 1). %% 敏捷
-define(BP_1_INT, 2). %% 智力
-define(BP_1_STA, 3). %% 耐力
-define(BP_1_MAX, 3). %% 1类属性最大值（基础）
-define(BP_2_MIN, 1000). %% 2类属性最小值（通常）--2类属性可能从1类属性转化而来，也可能直接添加
-define(BP_2_HP_MAX, 1000). %% 生命值（最大）
-define(BP_2_HP_CUR, 1001). %% 生命值（当前）
-define(BP_2_MP_MAX, 1002). %% 法力值（最大）
-define(BP_2_MP_CUR, 1003). %% 法力值（当前）
-define(BP_2_ATK, 1004). %% 伤害强度
-define(BP_2_DEF, 1005). %% 防御强度
-define(BP_2_MAX, 1005). %% 2类属性最大值（通常）
-define(BP_3_MIN, 2000). %% 3类属性最小值（特殊）--3类属性可能从1类属性转化而来，也可能直接添加。会根据公式转化为4类属性
-define(BP_3_HIT, 2000). %% 命中值
-define(BP_3_FLEE, 2001). %% 闪避值
-define(BP_3_CRI, 2002). %% 暴击值
-define(BP_3_FAST, 2003). %% 疾速值
-define(BP_3_MAX, 2003). %% 3类属性最大值（特殊）
-define(BP_4_MIN, 3000). %% 4类属性最小值（概率）--4类属性可能从3类属性转化而来，也可能直接添加
-define(BP_4_HIT, 3000). %% 命中率
-define(BP_4_FLEE, 3001). %% 闪避率
-define(BP_4_CRI, 3002). %% 暴击率
-define(BP_4_FAST, 3003). %% 疾速率
-define(BP_4_MAX, 3003). %% 4类属性最大值（概率）

-endif. %BATTLE_PROP_HRL
