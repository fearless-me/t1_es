%% coding: latin-1
%%: 实现
-module(cfg_worldboss_chs).
-compile(export_all).
-include("cfg_worldboss.hrl").
-include("logger.hrl").

getRow(bossaward_normal)->
    #worldbossCfg {
    id = 5,
    settype = bossaward_normal,
    setpara = [{1500,1704},{1501,1724},{1502,1744}]
    };
getRow(bossaward_sp)->
    #worldbossCfg {
    id = 6,
    settype = bossaward_sp,
    setpara = [{1500,1705},{1501,1725},{1502,1745}]
    };
getRow(bossaward1)->
    #worldbossCfg {
    id = 2,
    settype = bossaward1,
    setpara = [{1500,1701},{1501,1721},{1502,1741}]
    };
getRow(bossaward2)->
    #worldbossCfg {
    id = 3,
    settype = bossaward2,
    setpara = [{1500,1702},{1501,1722},{1502,1742}]
    };
getRow(bossaward3)->
    #worldbossCfg {
    id = 4,
    settype = bossaward3,
    setpara = [{1500,1703},{1501,1723},{1502,1743}]
    };
getRow(bossguildaward1)->
    #worldbossCfg {
    id = 8,
    settype = bossguildaward1,
    setpara = [{1500,1711},{1501,1731},{1502,1751}]
    };
getRow(bossguildaward2)->
    #worldbossCfg {
    id = 9,
    settype = bossguildaward2,
    setpara = [{1500,1712},{1501,1732},{1502,1752}]
    };
getRow(bossguildaward3)->
    #worldbossCfg {
    id = 10,
    settype = bossguildaward3,
    setpara = [{1500,1713},{1501,1733},{1502,1753}]
    };
getRow(bossguildawardnormal)->
    #worldbossCfg {
    id = 11,
    settype = bossguildawardnormal,
    setpara = [{1500,1714},{1501,1734},{1502,1754}]
    };
getRow(bossguildawardsp)->
    #worldbossCfg {
    id = 12,
    settype = bossguildawardsp,
    setpara = [{1500,1715},{1501,1735},{1502,1755}]
    };
getRow(worldboss_announce)->
    #worldbossCfg {
    id = 13,
    settype = worldboss_announce,
    setpara = [{80,2509},{60,2519},{40,2529},{20,2539},{10,2544}]
    };
getRow(worldboss_buyattack)->
    #worldbossCfg {
    id = 7,
    settype = worldboss_buyattack,
    setpara = [{100,10000,0},{103,200,3}]
    };
getRow(worldboss_list)->
    #worldbossCfg {
    id = 1,
    settype = worldboss_list,
    setpara = [{1500,324,320},{1501,324,320},{1502,324,320}]
    };
getRow(_)->[].

getKeyList()->[
    {bossaward_normal},
    {bossaward_sp},
    {bossaward1},
    {bossaward2},
    {bossaward3},
    {bossguildaward1},
    {bossguildaward2},
    {bossguildaward3},
    {bossguildawardnormal},
    {bossguildawardsp},
    {worldboss_announce},
    {worldboss_buyattack},
    {worldboss_list}
    ].

get1KeyList()->[
    bossaward_normal,
    bossaward_sp,
    bossaward1,
    bossaward2,
    bossaward3,
    bossguildaward1,
    bossguildaward2,
    bossguildaward3,
    bossguildawardnormal,
    bossguildawardsp,
    worldboss_announce,
    worldboss_buyattack,
    worldboss_list
    ].

