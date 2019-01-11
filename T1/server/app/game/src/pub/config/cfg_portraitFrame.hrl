%%: 声明
-ifndef(cfg_portraitFrame).
-define(cfg_portraitFrame, 1).

-record(portraitFrameCfg, {
        %%: 序号
        id,

        %%: 达成条件触发类型
        %%: 99.使用道具获得（触发类型无意义）
        %%: 1.女神禁闭室通关x层
        %%: 2.竞技场达到XX名以上
        %%: 3.被点赞次数达到x
        %%: 4.无条件
        %%: 5.首次充值
        type,

        %%: 达成条件的数值
        %%: type为1时，这里表示层数
        %%: 依次类推
        type_num,

        %%: 用于客户端页签显示位置（废弃）
        %%: 1.全部
        %%: 2.点赞
        %%: 3.其它（占位）
        %%: 默认所有都属于全部（客户端不用，废弃）
        class,

        %%: 0为永久
        %%: 时间按天
        time,

        %%: itemid
        icon,

        %%: 头像框名字
        name,

        %%: 客户端显示
        condition_des

 }).

-endif.