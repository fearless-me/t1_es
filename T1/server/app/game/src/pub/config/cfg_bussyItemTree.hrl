%%: 声明
-ifndef(cfg_bussyItemTree).
-define(cfg_bussyItemTree, 1).

-record(bussyItemTreeCfg, {
        %%: 显示顺序
        %%: 按升序显示
        order,

        %%: 是否是一级目录
        %%: 1：是
        %%: 0：不是
        isFirst,

        %%: 物品类别：
        %%: 1：装备
        %%: 2：道具
        %%: 4符文
        mainType,

        %%: 物品主类型
        %%: itemtype
        type,

        %%: 文字
        text,

        %%: 图标id
        icon,

        %%: 品质筛选
        quality,

        %%: 物品次类型
        %%: 如果没有用，则填-1
        subType,

        %%: 作者:
        %%: 只有装备模块用到，当这边配置1的时候·品质筛选quality那个字段就无效·
        qualityRangeShow,

        %%: 是否显示武器筛选
        weaponRangeShow,

        %%: 是否显示职业筛选
        raceRangeShow,

        %%: 是否显示等级范围
        levelRangeShow

 }).

-endif.