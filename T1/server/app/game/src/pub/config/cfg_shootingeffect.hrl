%%: 声明
-ifndef(cfg_shootingeffect).
-define(cfg_shootingeffect, 1).

-record(shootingeffectCfg, {
        %%: ID
        iD,

        %%: 特效名称
        effectname,

        %%: 特效路径
        effectpath

 }).

-endif.