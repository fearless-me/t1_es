%%: 声明
-ifndef(cfg_dailytask).
-define(cfg_dailytask, 1).

-record(dailytaskCfg, {
        %%: 等级
        level,

        %%: 任务表的随机任务ID
        group,

        %%: Administrator:
        %%: 刷新时按照任务类型进行权重随机[任务类型，权重值]
        %%: 任务类型：
        %%: type子类型
        %%: 1.杀怪
        %%: 2.对话
        %%: 3.任务采集物品
        %%: 4.掉落收集
        %%: 5.使用物品
        %%: 6.副本任务
        %%: 7.位面任务
        %%: 8.执行操作
        %%: 9.转职任务
        %%: 10.支线任务用——活动类型
        %%: 11.支线任务用——系统类型
        %%: 13.护送任务
        %%: 14,上交道具
        tasksub_weight,

        %%: Administrator:
        %%: 刷新时按照任务类型进行五星概率随机[任务类型，权重值]
        %%: 权重值10000=100%
        %%: 任务类型：
        %%: type子类型
        %%: 必须与tasksub_weight保持一致
        taskstar_weight,

        %%: Administrator:
        %%: 十环经验
        reward_exp,

        %%: Administrator:
        %%: 十环道具奖励
        reward_item1,

        %%: Administrator:
        %%: 十环金币奖励
        reward_money,

        %%: Administrator:
        %%: 家族资金，家族活跃奖励，第一个参数资金数值，第二个参数活跃数值
        reward_guild,

        %%: 奖励展示1
        show_item1,

        %%: 奖励展示2
        show_item2,

        %%: 奖励展示3
        show_item3,

        %%: 奖励展示4
        show_item4,

        %%: 奖励展示5
        show_item5,

        %%: 奖励展示6
        show_item6,

        %%: 奖励展示7
        show_item7

 }).

-endif.