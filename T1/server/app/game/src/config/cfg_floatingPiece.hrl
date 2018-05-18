%%: 声明
-ifndef(cfg_floatingPiece).
-define(cfg_floatingPiece, 1).

-record(floatingPieceCfg, {
        %%: Wangshiyu:
        %%: 主键值，ID
        %%: 最好别删除别插入
        id,

        %%: Wangshiyu:
        %%: 如果废弃了某一片，不能删ID，请用这个标记。标记后实际顺序顺延
        %%: 1，使用
        %%: 0，废弃
        isusing,

        %%: wangshiyu:
        %%: 相当于GroupId，策划规划第几个石头就填几
        stoneid,

        stonename,

        %%: Wangshiyu：
        %%: 一句话描述
        desc,

        %%: Wangshiyu：
        %%: 就填石头ICON的路径文件名，一组石头下的填一样的
        %%: Resource/Texture/icon/文件名
        icon,

        %%: Wangshiyu：
        %%: 直接填插画文件名字！！！
        %%: 插画在单独固定路径下
        %%: Resource/Texture/FloatingStone/文件名
        texturepath,

        %%: Wangshiyu：
        %%: 奖励配置。格式：[{type,id,num},{type,id,num}…]最多不要填超过4个了
        %%: Type：
        %%: 1，item道具表
        %%: 2，equip装备表
        %%: 3，attr 参见 char.hrl
        piecereward,

        %%: Wangshiyu：
        %%: 填写MainMenu的ID，请一定要注意相互对应
        openfunction,

        %%: wangshiyu:
        %%: 每个碎片的故事
        story,

        stringreflection

 }).

-endif.