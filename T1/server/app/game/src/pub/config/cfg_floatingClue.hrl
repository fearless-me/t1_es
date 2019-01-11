%%: 声明
-ifndef(cfg_floatingClue).
-define(cfg_floatingClue, 1).

-record(floatingClueCfg, {
        %%: Wangshiyu:
        %%: 主ID
        id,

        %%: Wangshiyu:
        %%: 这个条件属于哪个碎片，id对应FloatingPiece表中的ID
        pieceid,

        %%: Wangshiyu：
        %%: 条件类型：
        %%: 1 主线任务类，condid填写主线任务ID
        %%: 2 支线任务类，condid填写支线任务ID
        %%: 3 成就类，condid填写成就表的ID
        type,

        %%: 具体条件内容id
        condid,

        %%: Wangshiyu:
        %%: 显示在界面中的文字描述
        desc

 }).

-endif.