%%: 声明
-ifndef(cfg_home_furniture).
-define(cfg_home_furniture, 1).

-record(home_furnitureCfg, {
        %%: 道具id
        id,

        %%: 此处调用lifeskill_info的poolid
        poolid,

        %%: 家具名称
        name,

        %%: Wangshiyu:
        %%: 1.地砖
        %%: 2.墙砖
        %%: 3.地面物件
        %%: 4.墙面物件
        %%: 5.光标(特殊）
        type,

        %%: Wangshiyu：
        %%: 序号影响家具装修标签排序
        %%: 1.养殖
        %%: 2.地毯
        %%: 3.桌子
        %%: 4.凳椅
        %%: 5.沙发
        %%: 6.生活用品
        %%: 7.装饰物
        %%: 8.床
        %%: 9.壁纸
        %%: 10.窗户
        %%: 11.门
        %%: 12.挂件摆设
        %%: 13.地板
        sub_type,

        %%: 0.默认底板
        %%: 1.地板类
        %%: 2.墙面
        %%: 3.地面物件
        %%: 4.墙面物件
        %%: 5.移动光标（特殊唯一）
        %%: 6.地毯
        %%: 类型相同的无法存在于同一个格子当中
        share,

        %%: 1 乡村风格
        %%: 2 魔幻风格
        %%: 3 糖果风
        %%: 4 现代风
        %%: 5百搭套件
        %%: 6赛车系
        %%: 7移植
        stytle,

        %%: Assets\Resources\Prefab\f_x_y
        %%: 该处填写f_x_y
        %%: x为风格编号，0表示无风格
        %%: y为风格下的id,美术按照顺序往后加即可
        path,

        %%: Wangshiyu:
        %%: 一格是4，即CollisionBox的X,Y,Z要除以4来填写，不足1的都填1
        %%: 不管是物件还是墙纸还是地板，都填写[x,y,z]
        cover,

        %%: 是否有碰撞盒
        %%: 0.没有
        %%: 1.有
        crashbox,

        %%: 华丽度
        stylish,

        %%: 0-无功能，纯装饰
        %%: 1-可以进行动作交互
        %%: 2-多人动作交互
        %%: 3-精灵球饲养功能
        %%: 4-盆栽种植功能
        %%: 5-打开仓库
        function,

        %%: 对于有功能的家具，
        %%: 操作的功能权限
        %%: 1-主人
        %%: 2-同居者
        %%: 4-好友
        %%: 8-陌生人
        %%: 这里填和值
        function_users,

        %%: function类型是1时，
        %%: 动作名
        %%: function类型是2时，
        %%: 按照挂载点依次播放的动作名
        %%: function类型是3时,关联home_zoo
        %%: [等级id]
        %%: function类型是4时,
        %%: 关联home_plants
        %%: [可种植种子id1,可种植种子id2,…]
        function_Param,

        %%: function类型是2（多人动作）
        %%: 此处配置人数
        %%: function类型是5（仓库）
        %%: 此处配置增加仓库格子数量
        %%: type是1地砖
        %%: 此处配置0（平铺），1（自转摆放）
        function_Param2,

        %%: 0表示无限制，不显示在简易Tips
        %%: 此处大于0时需要在TIPS显示出来
        home_level,

        %%: Wangshiyu:
        %%: 当前等级家园最多能放多少个此家具
        %%: 格式为[a,b,c]
        %%: Max= a*当前家园等级+b
        %%: 当Max计算值超过c，Max取c
        %%: 配空视为不限制[]
        limit

 }).

-endif.