%%: 声明
-ifndef(cfg_lifeskill).
-define(cfg_lifeskill, 1).

-record(lifeskillCfg, {
        %%: 技能类型
        %%: 1.钓鱼
        %%: 2.狩猎
        %%: 3.挖矿
        %%: 4.烹饪
        %%: 5.装修
        skill_type,

        %%: 技能等级
        skill_level,

        %%: 林凯强:
        %%: 技能描述
        %%: 策划看的
        skill_desc,

        %%: 从本级升到下级所需的技能经验
        skill_exp,

        %%: 购买参数
        %%: [{数量，购买方式，货币值，Item id}]
        %%: 100). %%使用金币
        %%: 103). %%使用钻石币,先扣绑定再扣非绑定
        %%: 105). %%仅使用非绑钻石币
        %%:  其中 item id为客户端调用显示Icon、名称
        buy_times,

        %%: 每日购买次数上限
        buy_limit,

        %%: buffid
        buff,

        %%: mawenhong:
        %%:  秒
        cd,

        %%: Wangshiyu:
        %%: 调用lifeskill_info表的poolid
        product,

        %%: 万分比
        rate

 }).

-endif.