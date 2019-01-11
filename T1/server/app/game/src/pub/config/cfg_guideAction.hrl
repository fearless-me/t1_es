%%: 声明
-ifndef(cfg_guideAction).
-define(cfg_guideAction, 1).

-record(guideActionCfg, {
        %%: admin:
        %%: 引导动作ID
        id,

        %%: admin:
        %%: 引导触发条件
        %%: 1 到达指定等级触发	
        %%: 2 接取指定任务触发	
        %%: 3 完成指定任务触发	
        %%: 4 获得指定物品触发	
        %%: 5 使用指定道具	
        %%: 6 完成指定引导	
        %%: 7 进入指定副本触发	
        %%: 8 HP达到指定百分比触发	
        %%: 9 击杀指定怪物	
        %%: 10 功能开启触发
        %%: 11 第一次进地图触发
        %%: 12 第一次开UI触发
        %%: 13 关闭界面触发，is_Speacial不能为1，引导路径要用主界面的固有点
        trigger,

        %%: admin:
        %%: 引导触发参数
        %%: 该值与trigger直接关联
        %%: trigger 为 1 时  该值表示 等级
        %%: trigger 为 2 时  该值表示 任务ID
        %%: trigger 为 3 时  该值表示 任务ID
        %%: trigger 为 4 时  该值表示 物品ID
        %%: trigger 为 5 时  该值表示 道具ID
        %%: trigger 为 6 时  该值表示 引导动作ID
        %%: trigger 为 7 时  该值表示 副本ID
        %%: trigger 为 8 时  该值表示 HP百分比
        %%: trigger 为 9 时  该值表示 怪物ID
        %%: trigger 为 10 时  该值表示 功能id（mainmenu_id）
        %%: trigger 为 11 时  该值表示 地图id
        %%: trigger 为 12 时  该值为空 读param_UI
        %%: trigger 为 13 时  该值为空 读param_UI
        triggerParam,

        %%: trigger=12时，填UI的panel名称，表示第一次打开这个panel时触发
        %%: trigger=13时，填UI的panel名称，表示第一次关闭这个panel时触发
        triggerParam_UI,

        %%: admin:
        %%: 该引导动作表现类型
        %%: 同一个引导可以配置多个引导类型
        %%: 1 UI强制引导遮罩
        %%: 2 UI提示框
        %%: 3 UI特殊提示框
        %%: 4 UI帧动画提示，角标UI动画
        %%: 5 UI曲线动画提示
        %%: 6 箭头指向
        %%: 7 指向右侧功能箭头
        %%: 8 摇杆引导
        %%: 9 手指帧动画
        %%: 10 图片展示，连续多张图片连续切换
        %%: 99 视角选择界面
        guideType,

        %%: admin:
        %%: 引导UI目标路径
        %%: 某个面板下的某个控件的路径，如果无则填空
        uiTarget,

        %%: admin:
        %%: 引导结束条件
        %%: 1 按钮点击完成
        %%: 2 等待N秒自动结束/中途点击会提前完成
        %%: 3 UI动作结束触发完成
        finishTrigger,

        %%: 吕建强:
        %%: 如需等待时间输入，单位s
        watingtime,

        %%: admin:
        %%: 引导提示内容
        %%: 颜色统一使用[ff4242]
        content,

        %%: admin:
        %%: 下一个引导ID
        nextGuide,

        %%: 姜泓妃
        %%: 上一步引导ID
        condition,

        %%: 需要控制的资源配置
        %%: a&b  表示a类型的b参数
        %%: a||b 表示a类型加上b类型
        resControl,

        %%: 0为默认不可跳过
        %%: 1为可跳过
        couldBeSkip,

        %%: 王轶俊:
        %%: 是否需要等待ui引导目标出现
        %%: 1需要等待
        %%: 0不需要
        needWaitTarget,

        %%: Coby:
        %%: 判断掉线重连的依据
        mainStep,

        %%: 功能模块开启后才会触发
        %%: 0，无效
        %%: -1，引导任务，点击后不停止玩家移动
        %%: id，mainMenu里功能模块id
        module,

        %%: 关闭消息面板
        closemsgpanle,

        %%: UI的坐标偏移,[x,y]坐标
        ui_offset,

        %%: 引导点击碰撞区域的[x,y]偏移
        box_offset,

        %%: 引导点击碰撞区域的[x,y]增加值
        box_modification,

        %%: 是否脱离主体线id控制，可随时被触发
        %%: 空 否
        %%: 1 是
        is_Speacial,

        %%: 控制左下角和右上角的收缩栏状态
        %%: 0 收缩
        %%: 1 展开
        %%: [左下角状态，右上角状态]
        is_Spread,

        %%: 引导完成后是否点击一次主线任务框，继续进行任务
        %%: 空 否
        %%: 1 是
        is_ContinueTask,

        %%: 是否在上一步引导结束后增加一个透明蒙版阻止点击，直到这一步引导触发后删除蒙版。
        %%: 空 增加
        %%: 1  不增加
        is_SpaceControl,

        %%: 引导触发时播放的语音
        sound

 }).

-endif.