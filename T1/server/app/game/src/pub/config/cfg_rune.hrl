%%: 声明
-ifndef(cfg_rune).
-define(cfg_rune, 1).

-record(runeCfg, {
        %%: Administrator:
        %%: ID必须从100,000开始!!!!!!
        iD,

        name,

        %%: 符文大类型：
        %%: 决定角色或骑宠符文
        %%: 0角色
        %%: 1骑宠
        %%: 废弃
        type,

        %%: 生成时品阶，和穿戴等级无关
        %%: 废弃
        stage,

        %%: Administrator:
        %%: 穿戴等级
        equipLevel,

        %%: 子类型
        %%: 0 圣镜
        %%: 1 圣杯
        %%: 2 圣眼
        %%: 3  圣钥
        %%: 4
        %%: 5 
        subtype,

        %%: Administrator:
        %%: 品质
        %%: 3-A 4-S
        quality,

        %%: Administrator:
        %%: 套装属性属性组id
        property_suite_id,

        icon,

        %%: 随机属性属性组id
        %%: 看rune_randomPro
        random_property_group_id,

        %%: 随机属性条目最小值
        min_num,

        %%: 随机属性条目最大值
        max_num,

        %%: 增强技能组id
        %%: 看rune_skillenha
        skillenha_group_id,

        %%: 增强技能条目数最小值
        skillenha_min_num,

        %%: 增强技能条目数最大值
        skillenha_max_num,

        %%: 圣物套装转换次数最大值
        trans_max_num,

        %%: 出售价格 金币
        %%: 临时销毁途径
        rune_price,

        based_property_group_id,

        %%: 升级所需要的经验需求组
        level_up_group_id,

        %%: Administrator:
        %%: 被熔炼时，提供给其他符文的经验值
        exp_group_id,

        %%: Administrator:
        %%: 对应的smeltcost表格
        smeltcost,

        %%: Administrator:
        %%: 提示是否穿戴
        %%: 0是
        %%: 1否
        need_equipit,

        battlepower_add,

        %%: 装备有效时间
        %%: 从获得装备开始计算
        %%: 时间到了后自动消失
        %%: 时间秒
        %%: 0代表永久
        %%: 限时装备不可交易不可上交易行
        %%: 限时装备只能是绑定装备
        usefulLife,

        %%: Administrator:
        %%: 0非绑定
        %%: 1绑定 限时符文必须是绑定
        inbind,

        %%: Administrator:
        %%: 黑暗之地兑换描述
        description,

        %%: Administrator:
        %%: 符文描述
        explain,

        %%: Administrator:
        %%: 缺少资源跳转
        material_ui

 }).

-endif.