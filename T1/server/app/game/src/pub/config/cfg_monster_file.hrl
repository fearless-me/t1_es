%%: 声明
-ifndef(cfg_monster_file).
-define(cfg_monster_file, 1).

-record(monster_fileCfg, {
        %%: 引用monster_filekey表
        monster_id,

        %%: 方便策划查看
        monster_name,

        %%: 缩放比例
        size,

        %%: 所属地图mapid
        area,

        %%: 地图名，策划看的
        area_name,

        %%: 在各地区的排序
        rank,

        %%: [1,0]表示照相，
        %%: [2,N]表示击杀怪物，N表示数量
        unlock_way,

        %%: [1,N,0]表示奖励N经验
        %%: ,[2,x,y]表示奖励X类货币Y数量
        %%: 货币类型x
        %%: 1.金币
        %%: 3.钻石
        %%: 6.绑定钻石
        unlock_reward,

        %%: 怪物的文化包装文本
        monster_desc,

        %%: 用于客户端显示的出现地
        monster_area,

        %%: [属性ID，属性值]
        extra_bonus,

        %%: 追加目标需求击杀数量
        extra_target

 }).

-endif.