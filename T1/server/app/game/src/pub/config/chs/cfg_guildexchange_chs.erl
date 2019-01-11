%% coding: latin-1
%%: 实现
-module(cfg_guildexchange_chs).
-compile(export_all).
-include("cfg_guildexchange.hrl").
-include("logger.hrl").

getRow(1,0)->
    #guildexchangeCfg {
    id = 1,
    level = 0,
    icon = 4,
    property = [{0,135,0}],
    guildlevel = 1,
    cost = 0,
    name = "家族生命",
    describe = "尚未学习",
    character_a = ""
    };
getRow(1,1)->
    #guildexchangeCfg {
    id = 1,
    level = 1,
    icon = 4,
    property = [{0,135,357}],
    guildlevel = 1,
    cost = 1200,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "357"
    };
getRow(1,2)->
    #guildexchangeCfg {
    id = 1,
    level = 2,
    icon = 4,
    property = [{0,135,843}],
    guildlevel = 1,
    cost = 1400,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "843"
    };
getRow(1,3)->
    #guildexchangeCfg {
    id = 1,
    level = 3,
    icon = 4,
    property = [{0,135,1588}],
    guildlevel = 1,
    cost = 1800,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "1588"
    };
getRow(1,4)->
    #guildexchangeCfg {
    id = 1,
    level = 4,
    icon = 4,
    property = [{0,135,2590}],
    guildlevel = 1,
    cost = 2300,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "2590"
    };
getRow(1,5)->
    #guildexchangeCfg {
    id = 1,
    level = 5,
    icon = 4,
    property = [{0,135,3850}],
    guildlevel = 1,
    cost = 2800,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "3850"
    };
getRow(1,6)->
    #guildexchangeCfg {
    id = 1,
    level = 6,
    icon = 4,
    property = [{0,135,5368}],
    guildlevel = 1,
    cost = 3100,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "5368"
    };
getRow(1,7)->
    #guildexchangeCfg {
    id = 1,
    level = 7,
    icon = 4,
    property = [{0,135,7144}],
    guildlevel = 1,
    cost = 3500,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "7144"
    };
getRow(1,8)->
    #guildexchangeCfg {
    id = 1,
    level = 8,
    icon = 4,
    property = [{0,135,9178}],
    guildlevel = 2,
    cost = 4000,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "9178"
    };
getRow(1,9)->
    #guildexchangeCfg {
    id = 1,
    level = 9,
    icon = 4,
    property = [{0,135,11469}],
    guildlevel = 2,
    cost = 4400,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "11469"
    };
getRow(1,10)->
    #guildexchangeCfg {
    id = 1,
    level = 10,
    icon = 4,
    property = [{0,135,14019}],
    guildlevel = 2,
    cost = 4800,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "14019"
    };
getRow(1,11)->
    #guildexchangeCfg {
    id = 1,
    level = 11,
    icon = 4,
    property = [{0,135,16826}],
    guildlevel = 2,
    cost = 5300,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "16826"
    };
getRow(1,12)->
    #guildexchangeCfg {
    id = 1,
    level = 12,
    icon = 4,
    property = [{0,135,19892}],
    guildlevel = 3,
    cost = 5800,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "19892"
    };
getRow(1,13)->
    #guildexchangeCfg {
    id = 1,
    level = 13,
    icon = 4,
    property = [{0,135,23215}],
    guildlevel = 3,
    cost = 6100,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "23215"
    };
getRow(1,14)->
    #guildexchangeCfg {
    id = 1,
    level = 14,
    icon = 4,
    property = [{0,135,26796}],
    guildlevel = 3,
    cost = 6500,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "26796"
    };
getRow(1,15)->
    #guildexchangeCfg {
    id = 1,
    level = 15,
    icon = 4,
    property = [{0,135,30635}],
    guildlevel = 6,
    cost = 7100,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "30635"
    };
getRow(1,16)->
    #guildexchangeCfg {
    id = 1,
    level = 16,
    icon = 4,
    property = [{0,135,34732}],
    guildlevel = 6,
    cost = 7300,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "34732"
    };
getRow(1,17)->
    #guildexchangeCfg {
    id = 1,
    level = 17,
    icon = 4,
    property = [{0,135,39087}],
    guildlevel = 7,
    cost = 7900,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "39087"
    };
getRow(1,18)->
    #guildexchangeCfg {
    id = 1,
    level = 18,
    icon = 4,
    property = [{0,135,43699}],
    guildlevel = 7,
    cost = 8200,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "43699"
    };
getRow(1,19)->
    #guildexchangeCfg {
    id = 1,
    level = 19,
    icon = 4,
    property = [{0,135,48570}],
    guildlevel = 7,
    cost = 8800,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "48570"
    };
getRow(1,20)->
    #guildexchangeCfg {
    id = 1,
    level = 20,
    icon = 4,
    property = [{0,135,53698}],
    guildlevel = 8,
    cost = 9100,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "53698"
    };
getRow(1,21)->
    #guildexchangeCfg {
    id = 1,
    level = 21,
    icon = 4,
    property = [{0,135,59084}],
    guildlevel = 8,
    cost = 9500,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "59084"
    };
getRow(1,22)->
    #guildexchangeCfg {
    id = 1,
    level = 22,
    icon = 4,
    property = [{0,135,64729}],
    guildlevel = 8,
    cost = 10100,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "64729"
    };
getRow(1,23)->
    #guildexchangeCfg {
    id = 1,
    level = 23,
    icon = 4,
    property = [{0,135,70631}],
    guildlevel = 9,
    cost = 10300,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "70631"
    };
getRow(1,24)->
    #guildexchangeCfg {
    id = 1,
    level = 24,
    icon = 4,
    property = [{0,135,76791}],
    guildlevel = 9,
    cost = 10900,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "76791"
    };
getRow(1,25)->
    #guildexchangeCfg {
    id = 1,
    level = 25,
    icon = 4,
    property = [{0,135,83209}],
    guildlevel = 10,
    cost = 11200,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "83209"
    };
getRow(1,26)->
    #guildexchangeCfg {
    id = 1,
    level = 26,
    icon = 4,
    property = [{0,135,89884}],
    guildlevel = 10,
    cost = 11800,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "89884"
    };
getRow(1,27)->
    #guildexchangeCfg {
    id = 1,
    level = 27,
    icon = 4,
    property = [{0,135,96818}],
    guildlevel = 10,
    cost = 12100,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "96818"
    };
getRow(1,28)->
    #guildexchangeCfg {
    id = 1,
    level = 28,
    icon = 4,
    property = [{0,135,104009}],
    guildlevel = 10,
    cost = 12500,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "104009"
    };
getRow(1,29)->
    #guildexchangeCfg {
    id = 1,
    level = 29,
    icon = 4,
    property = [{0,135,111459}],
    guildlevel = 10,
    cost = 13000,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "111459"
    };
getRow(1,30)->
    #guildexchangeCfg {
    id = 1,
    level = 30,
    icon = 4,
    property = [{0,135,119166}],
    guildlevel = 10,
    cost = 13400,
    name = "家族生命",
    describe = "技能效果：角色增加生命{a}点",
    character_a = "119166"
    };
getRow(2,0)->
    #guildexchangeCfg {
    id = 2,
    level = 0,
    icon = 5,
    property = [{0,136,0},{0,137,0}],
    guildlevel = 1,
    cost = 0,
    name = "家族物攻,法攻",
    character_a = ""
    };
getRow(2,1)->
    #guildexchangeCfg {
    id = 2,
    level = 1,
    icon = 5,
    property = [{0,136,35},{0,137,35}],
    guildlevel = 1,
    cost = 1700,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "35"
    };
getRow(2,2)->
    #guildexchangeCfg {
    id = 2,
    level = 2,
    icon = 5,
    property = [{0,136,84},{0,137,84}],
    guildlevel = 1,
    cost = 2000,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "84"
    };
getRow(2,3)->
    #guildexchangeCfg {
    id = 2,
    level = 3,
    icon = 5,
    property = [{0,136,158},{0,137,158}],
    guildlevel = 1,
    cost = 2600,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "158"
    };
getRow(2,4)->
    #guildexchangeCfg {
    id = 2,
    level = 4,
    icon = 5,
    property = [{0,136,259},{0,137,259}],
    guildlevel = 1,
    cost = 3300,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "259"
    };
getRow(2,5)->
    #guildexchangeCfg {
    id = 2,
    level = 5,
    icon = 5,
    property = [{0,136,385},{0,137,385}],
    guildlevel = 1,
    cost = 4000,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "385"
    };
getRow(2,6)->
    #guildexchangeCfg {
    id = 2,
    level = 6,
    icon = 5,
    property = [{0,136,536},{0,137,536}],
    guildlevel = 1,
    cost = 4400,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "536"
    };
getRow(2,7)->
    #guildexchangeCfg {
    id = 2,
    level = 7,
    icon = 5,
    property = [{0,136,714},{0,137,714}],
    guildlevel = 1,
    cost = 5000,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "714"
    };
getRow(2,8)->
    #guildexchangeCfg {
    id = 2,
    level = 8,
    icon = 5,
    property = [{0,136,917},{0,137,917}],
    guildlevel = 2,
    cost = 5700,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "917"
    };
getRow(2,9)->
    #guildexchangeCfg {
    id = 2,
    level = 9,
    icon = 5,
    property = [{0,136,1146},{0,137,1146}],
    guildlevel = 2,
    cost = 6300,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "1146"
    };
getRow(2,10)->
    #guildexchangeCfg {
    id = 2,
    level = 10,
    icon = 5,
    property = [{0,136,1401},{0,137,1401}],
    guildlevel = 2,
    cost = 6900,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "1401"
    };
getRow(2,11)->
    #guildexchangeCfg {
    id = 2,
    level = 11,
    icon = 5,
    property = [{0,136,1682},{0,137,1682}],
    guildlevel = 2,
    cost = 7600,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "1682"
    };
getRow(2,12)->
    #guildexchangeCfg {
    id = 2,
    level = 12,
    icon = 5,
    property = [{0,136,1989},{0,137,1989}],
    guildlevel = 3,
    cost = 8300,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "1989"
    };
getRow(2,13)->
    #guildexchangeCfg {
    id = 2,
    level = 13,
    icon = 5,
    property = [{0,136,2321},{0,137,2321}],
    guildlevel = 3,
    cost = 8800,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "2321"
    };
getRow(2,14)->
    #guildexchangeCfg {
    id = 2,
    level = 14,
    icon = 5,
    property = [{0,136,2679},{0,137,2679}],
    guildlevel = 3,
    cost = 9300,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "2679"
    };
getRow(2,15)->
    #guildexchangeCfg {
    id = 2,
    level = 15,
    icon = 5,
    property = [{0,136,3063},{0,137,3063}],
    guildlevel = 6,
    cost = 10200,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "3063"
    };
getRow(2,16)->
    #guildexchangeCfg {
    id = 2,
    level = 16,
    icon = 5,
    property = [{0,136,3473},{0,137,3473}],
    guildlevel = 6,
    cost = 10500,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "3473"
    };
getRow(2,17)->
    #guildexchangeCfg {
    id = 2,
    level = 17,
    icon = 5,
    property = [{0,136,3908},{0,137,3908}],
    guildlevel = 7,
    cost = 11300,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "3908"
    };
getRow(2,18)->
    #guildexchangeCfg {
    id = 2,
    level = 18,
    icon = 5,
    property = [{0,136,4369},{0,137,4369}],
    guildlevel = 7,
    cost = 11800,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "4369"
    };
getRow(2,19)->
    #guildexchangeCfg {
    id = 2,
    level = 19,
    icon = 5,
    property = [{0,136,4857},{0,137,4857}],
    guildlevel = 7,
    cost = 12600,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "4857"
    };
getRow(2,20)->
    #guildexchangeCfg {
    id = 2,
    level = 20,
    icon = 5,
    property = [{0,136,5369},{0,137,5369}],
    guildlevel = 8,
    cost = 13100,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "5369"
    };
getRow(2,21)->
    #guildexchangeCfg {
    id = 2,
    level = 21,
    icon = 5,
    property = [{0,136,5908},{0,137,5908}],
    guildlevel = 8,
    cost = 13600,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "5908"
    };
getRow(2,22)->
    #guildexchangeCfg {
    id = 2,
    level = 22,
    icon = 5,
    property = [{0,136,6472},{0,137,6472}],
    guildlevel = 8,
    cost = 14500,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "6472"
    };
getRow(2,23)->
    #guildexchangeCfg {
    id = 2,
    level = 23,
    icon = 5,
    property = [{0,136,7063},{0,137,7063}],
    guildlevel = 9,
    cost = 14800,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "7063"
    };
getRow(2,24)->
    #guildexchangeCfg {
    id = 2,
    level = 24,
    icon = 5,
    property = [{0,136,7679},{0,137,7679}],
    guildlevel = 9,
    cost = 15600,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "7679"
    };
getRow(2,25)->
    #guildexchangeCfg {
    id = 2,
    level = 25,
    icon = 5,
    property = [{0,136,8320},{0,137,8320}],
    guildlevel = 10,
    cost = 16100,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "8320"
    };
getRow(2,26)->
    #guildexchangeCfg {
    id = 2,
    level = 26,
    icon = 5,
    property = [{0,136,8988},{0,137,8988}],
    guildlevel = 10,
    cost = 16900,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "8988"
    };
getRow(2,27)->
    #guildexchangeCfg {
    id = 2,
    level = 27,
    icon = 5,
    property = [{0,136,9681},{0,137,9681}],
    guildlevel = 10,
    cost = 17400,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "9681"
    };
getRow(2,28)->
    #guildexchangeCfg {
    id = 2,
    level = 28,
    icon = 5,
    property = [{0,136,10400},{0,137,10400}],
    guildlevel = 10,
    cost = 17900,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "10400"
    };
getRow(2,29)->
    #guildexchangeCfg {
    id = 2,
    level = 29,
    icon = 5,
    property = [{0,136,11145},{0,137,11145}],
    guildlevel = 10,
    cost = 18700,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "11145"
    };
getRow(2,30)->
    #guildexchangeCfg {
    id = 2,
    level = 30,
    icon = 5,
    property = [{0,136,11916},{0,137,11916}],
    guildlevel = 10,
    cost = 19200,
    name = "家族物攻,法攻",
    describe = "技能效果：角色增加物攻{a}点,法攻{a}点",
    character_a = "11916"
    };
getRow(3,0)->
    #guildexchangeCfg {
    id = 3,
    level = 0,
    icon = 14,
    property = [{0,138,0}],
    guildlevel = 1,
    cost = 0,
    name = "家族物防",
    character_a = ""
    };
getRow(3,1)->
    #guildexchangeCfg {
    id = 3,
    level = 1,
    icon = 14,
    property = [{0,138,35}],
    guildlevel = 1,
    cost = 400,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "35"
    };
getRow(3,2)->
    #guildexchangeCfg {
    id = 3,
    level = 2,
    icon = 14,
    property = [{0,138,84}],
    guildlevel = 1,
    cost = 500,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "84"
    };
getRow(3,3)->
    #guildexchangeCfg {
    id = 3,
    level = 3,
    icon = 14,
    property = [{0,138,158}],
    guildlevel = 1,
    cost = 700,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "158"
    };
getRow(3,4)->
    #guildexchangeCfg {
    id = 3,
    level = 4,
    icon = 14,
    property = [{0,138,259}],
    guildlevel = 1,
    cost = 900,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "259"
    };
getRow(3,5)->
    #guildexchangeCfg {
    id = 3,
    level = 5,
    icon = 14,
    property = [{0,138,385}],
    guildlevel = 1,
    cost = 1000,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "385"
    };
getRow(3,6)->
    #guildexchangeCfg {
    id = 3,
    level = 6,
    icon = 14,
    property = [{0,138,536}],
    guildlevel = 1,
    cost = 1100,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "536"
    };
getRow(3,7)->
    #guildexchangeCfg {
    id = 3,
    level = 7,
    icon = 14,
    property = [{0,138,714}],
    guildlevel = 1,
    cost = 1300,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "714"
    };
getRow(3,8)->
    #guildexchangeCfg {
    id = 3,
    level = 8,
    icon = 14,
    property = [{0,138,917}],
    guildlevel = 2,
    cost = 1500,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "917"
    };
getRow(3,9)->
    #guildexchangeCfg {
    id = 3,
    level = 9,
    icon = 14,
    property = [{0,138,1146}],
    guildlevel = 2,
    cost = 1600,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "1146"
    };
getRow(3,10)->
    #guildexchangeCfg {
    id = 3,
    level = 10,
    icon = 14,
    property = [{0,138,1401}],
    guildlevel = 2,
    cost = 1800,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "1401"
    };
getRow(3,11)->
    #guildexchangeCfg {
    id = 3,
    level = 11,
    icon = 14,
    property = [{0,138,1682}],
    guildlevel = 2,
    cost = 2000,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "1682"
    };
getRow(3,12)->
    #guildexchangeCfg {
    id = 3,
    level = 12,
    icon = 14,
    property = [{0,138,1989}],
    guildlevel = 3,
    cost = 2100,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "1989"
    };
getRow(3,13)->
    #guildexchangeCfg {
    id = 3,
    level = 13,
    icon = 14,
    property = [{0,138,2321}],
    guildlevel = 3,
    cost = 2300,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "2321"
    };
getRow(3,14)->
    #guildexchangeCfg {
    id = 3,
    level = 14,
    icon = 14,
    property = [{0,138,2679}],
    guildlevel = 3,
    cost = 2400,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "2679"
    };
getRow(3,15)->
    #guildexchangeCfg {
    id = 3,
    level = 15,
    icon = 14,
    property = [{0,138,3063}],
    guildlevel = 6,
    cost = 2600,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "3063"
    };
getRow(3,16)->
    #guildexchangeCfg {
    id = 3,
    level = 16,
    icon = 14,
    property = [{0,138,3473}],
    guildlevel = 6,
    cost = 2700,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "3473"
    };
getRow(3,17)->
    #guildexchangeCfg {
    id = 3,
    level = 17,
    icon = 14,
    property = [{0,138,3908}],
    guildlevel = 7,
    cost = 2900,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "3908"
    };
getRow(3,18)->
    #guildexchangeCfg {
    id = 3,
    level = 18,
    icon = 14,
    property = [{0,138,4369}],
    guildlevel = 7,
    cost = 3000,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "4369"
    };
getRow(3,19)->
    #guildexchangeCfg {
    id = 3,
    level = 19,
    icon = 14,
    property = [{0,138,4857}],
    guildlevel = 7,
    cost = 3300,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "4857"
    };
getRow(3,20)->
    #guildexchangeCfg {
    id = 3,
    level = 20,
    icon = 14,
    property = [{0,138,5369}],
    guildlevel = 8,
    cost = 3400,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "5369"
    };
getRow(3,21)->
    #guildexchangeCfg {
    id = 3,
    level = 21,
    icon = 14,
    property = [{0,138,5908}],
    guildlevel = 8,
    cost = 3500,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "5908"
    };
getRow(3,22)->
    #guildexchangeCfg {
    id = 3,
    level = 22,
    icon = 14,
    property = [{0,138,6472}],
    guildlevel = 8,
    cost = 3700,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "6472"
    };
getRow(3,23)->
    #guildexchangeCfg {
    id = 3,
    level = 23,
    icon = 14,
    property = [{0,138,7063}],
    guildlevel = 9,
    cost = 3800,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "7063"
    };
getRow(3,24)->
    #guildexchangeCfg {
    id = 3,
    level = 24,
    icon = 14,
    property = [{0,138,7679}],
    guildlevel = 9,
    cost = 4000,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "7679"
    };
getRow(3,25)->
    #guildexchangeCfg {
    id = 3,
    level = 25,
    icon = 14,
    property = [{0,138,8320}],
    guildlevel = 10,
    cost = 4100,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "8320"
    };
getRow(3,26)->
    #guildexchangeCfg {
    id = 3,
    level = 26,
    icon = 14,
    property = [{0,138,8988}],
    guildlevel = 10,
    cost = 4400,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "8988"
    };
getRow(3,27)->
    #guildexchangeCfg {
    id = 3,
    level = 27,
    icon = 14,
    property = [{0,138,9681}],
    guildlevel = 10,
    cost = 4500,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "9681"
    };
getRow(3,28)->
    #guildexchangeCfg {
    id = 3,
    level = 28,
    icon = 14,
    property = [{0,138,10400}],
    guildlevel = 10,
    cost = 4600,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "10400"
    };
getRow(3,29)->
    #guildexchangeCfg {
    id = 3,
    level = 29,
    icon = 14,
    property = [{0,138,11145}],
    guildlevel = 10,
    cost = 4800,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "11145"
    };
getRow(3,30)->
    #guildexchangeCfg {
    id = 3,
    level = 30,
    icon = 14,
    property = [{0,138,11916}],
    guildlevel = 10,
    cost = 5000,
    name = "家族物防",
    describe = "技能效果：角色增加物防{a}点",
    character_a = "11916"
    };
getRow(4,0)->
    #guildexchangeCfg {
    id = 4,
    level = 0,
    icon = 17,
    property = [{0,139,0}],
    guildlevel = 1,
    cost = 0,
    name = "家族法防",
    character_a = ""
    };
getRow(4,1)->
    #guildexchangeCfg {
    id = 4,
    level = 1,
    icon = 17,
    property = [{0,139,35}],
    guildlevel = 1,
    cost = 400,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "35"
    };
getRow(4,2)->
    #guildexchangeCfg {
    id = 4,
    level = 2,
    icon = 17,
    property = [{0,139,84}],
    guildlevel = 1,
    cost = 500,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "84"
    };
getRow(4,3)->
    #guildexchangeCfg {
    id = 4,
    level = 3,
    icon = 17,
    property = [{0,139,158}],
    guildlevel = 1,
    cost = 700,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "158"
    };
getRow(4,4)->
    #guildexchangeCfg {
    id = 4,
    level = 4,
    icon = 17,
    property = [{0,139,259}],
    guildlevel = 1,
    cost = 900,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "259"
    };
getRow(4,5)->
    #guildexchangeCfg {
    id = 4,
    level = 5,
    icon = 17,
    property = [{0,139,385}],
    guildlevel = 1,
    cost = 1000,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "385"
    };
getRow(4,6)->
    #guildexchangeCfg {
    id = 4,
    level = 6,
    icon = 17,
    property = [{0,139,536}],
    guildlevel = 1,
    cost = 1100,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "536"
    };
getRow(4,7)->
    #guildexchangeCfg {
    id = 4,
    level = 7,
    icon = 17,
    property = [{0,139,714}],
    guildlevel = 1,
    cost = 1300,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "714"
    };
getRow(4,8)->
    #guildexchangeCfg {
    id = 4,
    level = 8,
    icon = 17,
    property = [{0,139,917}],
    guildlevel = 2,
    cost = 1500,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "917"
    };
getRow(4,9)->
    #guildexchangeCfg {
    id = 4,
    level = 9,
    icon = 17,
    property = [{0,139,1146}],
    guildlevel = 2,
    cost = 1600,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "1146"
    };
getRow(4,10)->
    #guildexchangeCfg {
    id = 4,
    level = 10,
    icon = 17,
    property = [{0,139,1401}],
    guildlevel = 2,
    cost = 1800,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "1401"
    };
getRow(4,11)->
    #guildexchangeCfg {
    id = 4,
    level = 11,
    icon = 17,
    property = [{0,139,1682}],
    guildlevel = 2,
    cost = 2000,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "1682"
    };
getRow(4,12)->
    #guildexchangeCfg {
    id = 4,
    level = 12,
    icon = 17,
    property = [{0,139,1989}],
    guildlevel = 3,
    cost = 2100,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "1989"
    };
getRow(4,13)->
    #guildexchangeCfg {
    id = 4,
    level = 13,
    icon = 17,
    property = [{0,139,2321}],
    guildlevel = 3,
    cost = 2300,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "2321"
    };
getRow(4,14)->
    #guildexchangeCfg {
    id = 4,
    level = 14,
    icon = 17,
    property = [{0,139,2679}],
    guildlevel = 3,
    cost = 2400,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "2679"
    };
getRow(4,15)->
    #guildexchangeCfg {
    id = 4,
    level = 15,
    icon = 17,
    property = [{0,139,3063}],
    guildlevel = 6,
    cost = 2600,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "3063"
    };
getRow(4,16)->
    #guildexchangeCfg {
    id = 4,
    level = 16,
    icon = 17,
    property = [{0,139,3473}],
    guildlevel = 6,
    cost = 2700,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "3473"
    };
getRow(4,17)->
    #guildexchangeCfg {
    id = 4,
    level = 17,
    icon = 17,
    property = [{0,139,3908}],
    guildlevel = 7,
    cost = 2900,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "3908"
    };
getRow(4,18)->
    #guildexchangeCfg {
    id = 4,
    level = 18,
    icon = 17,
    property = [{0,139,4369}],
    guildlevel = 7,
    cost = 3000,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "4369"
    };
getRow(4,19)->
    #guildexchangeCfg {
    id = 4,
    level = 19,
    icon = 17,
    property = [{0,139,4857}],
    guildlevel = 7,
    cost = 3300,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "4857"
    };
getRow(4,20)->
    #guildexchangeCfg {
    id = 4,
    level = 20,
    icon = 17,
    property = [{0,139,5369}],
    guildlevel = 8,
    cost = 3400,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "5369"
    };
getRow(4,21)->
    #guildexchangeCfg {
    id = 4,
    level = 21,
    icon = 17,
    property = [{0,139,5908}],
    guildlevel = 8,
    cost = 3500,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "5908"
    };
getRow(4,22)->
    #guildexchangeCfg {
    id = 4,
    level = 22,
    icon = 17,
    property = [{0,139,6472}],
    guildlevel = 8,
    cost = 3700,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "6472"
    };
getRow(4,23)->
    #guildexchangeCfg {
    id = 4,
    level = 23,
    icon = 17,
    property = [{0,139,7063}],
    guildlevel = 9,
    cost = 3800,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "7063"
    };
getRow(4,24)->
    #guildexchangeCfg {
    id = 4,
    level = 24,
    icon = 17,
    property = [{0,139,7679}],
    guildlevel = 9,
    cost = 4000,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "7679"
    };
getRow(4,25)->
    #guildexchangeCfg {
    id = 4,
    level = 25,
    icon = 17,
    property = [{0,139,8320}],
    guildlevel = 10,
    cost = 4100,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "8320"
    };
getRow(4,26)->
    #guildexchangeCfg {
    id = 4,
    level = 26,
    icon = 17,
    property = [{0,139,8988}],
    guildlevel = 10,
    cost = 4400,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "8988"
    };
getRow(4,27)->
    #guildexchangeCfg {
    id = 4,
    level = 27,
    icon = 17,
    property = [{0,139,9681}],
    guildlevel = 10,
    cost = 4500,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "9681"
    };
getRow(4,28)->
    #guildexchangeCfg {
    id = 4,
    level = 28,
    icon = 17,
    property = [{0,139,10400}],
    guildlevel = 10,
    cost = 4600,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "10400"
    };
getRow(4,29)->
    #guildexchangeCfg {
    id = 4,
    level = 29,
    icon = 17,
    property = [{0,139,11145}],
    guildlevel = 10,
    cost = 4800,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "11145"
    };
getRow(4,30)->
    #guildexchangeCfg {
    id = 4,
    level = 30,
    icon = 17,
    property = [{0,139,11916}],
    guildlevel = 10,
    cost = 5000,
    name = "家族法防",
    describe = "技能效果：角色增加法防{a}点",
    character_a = "11916"
    };
getRow(5,0)->
    #guildexchangeCfg {
    id = 5,
    level = 0,
    icon = 152,
    property = [{0,140,0},{0,141,0}],
    guildlevel = 8,
    cost = 0,
    name = "家族暴击等级",
    character_a = ""
    };
getRow(5,1)->
    #guildexchangeCfg {
    id = 5,
    level = 1,
    icon = 152,
    property = [{0,140,41},{0,141,41}],
    guildlevel = 8,
    cost = 900,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "41"
    };
getRow(5,2)->
    #guildexchangeCfg {
    id = 5,
    level = 2,
    icon = 152,
    property = [{0,140,98},{0,141,98}],
    guildlevel = 8,
    cost = 1100,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "98"
    };
getRow(5,3)->
    #guildexchangeCfg {
    id = 5,
    level = 3,
    icon = 152,
    property = [{0,140,184},{0,141,184}],
    guildlevel = 8,
    cost = 1400,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "184"
    };
getRow(5,4)->
    #guildexchangeCfg {
    id = 5,
    level = 4,
    icon = 152,
    property = [{0,140,301},{0,141,301}],
    guildlevel = 8,
    cost = 1800,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "301"
    };
getRow(5,5)->
    #guildexchangeCfg {
    id = 5,
    level = 5,
    icon = 152,
    property = [{0,140,448},{0,141,448}],
    guildlevel = 8,
    cost = 2200,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "448"
    };
getRow(5,6)->
    #guildexchangeCfg {
    id = 5,
    level = 6,
    icon = 152,
    property = [{0,140,624},{0,141,624}],
    guildlevel = 8,
    cost = 2400,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "624"
    };
getRow(5,7)->
    #guildexchangeCfg {
    id = 5,
    level = 7,
    icon = 152,
    property = [{0,140,831},{0,141,831}],
    guildlevel = 8,
    cost = 2800,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "831"
    };
getRow(5,8)->
    #guildexchangeCfg {
    id = 5,
    level = 8,
    icon = 152,
    property = [{0,140,1068},{0,141,1068}],
    guildlevel = 8,
    cost = 3200,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "1068"
    };
getRow(5,9)->
    #guildexchangeCfg {
    id = 5,
    level = 9,
    icon = 152,
    property = [{0,140,1334},{0,141,1334}],
    guildlevel = 8,
    cost = 3500,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "1334"
    };
getRow(5,10)->
    #guildexchangeCfg {
    id = 5,
    level = 10,
    icon = 152,
    property = [{0,140,1631},{0,141,1631}],
    guildlevel = 8,
    cost = 3800,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "1631"
    };
getRow(5,11)->
    #guildexchangeCfg {
    id = 5,
    level = 11,
    icon = 152,
    property = [{0,140,1958},{0,141,1958}],
    guildlevel = 8,
    cost = 4200,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "1958"
    };
getRow(5,12)->
    #guildexchangeCfg {
    id = 5,
    level = 12,
    icon = 152,
    property = [{0,140,2314},{0,141,2314}],
    guildlevel = 8,
    cost = 4600,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "2314"
    };
getRow(5,13)->
    #guildexchangeCfg {
    id = 5,
    level = 13,
    icon = 152,
    property = [{0,140,2701},{0,141,2701}],
    guildlevel = 8,
    cost = 4800,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "2701"
    };
getRow(5,14)->
    #guildexchangeCfg {
    id = 5,
    level = 14,
    icon = 152,
    property = [{0,140,3118},{0,141,3118}],
    guildlevel = 8,
    cost = 5100,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "3118"
    };
getRow(5,15)->
    #guildexchangeCfg {
    id = 5,
    level = 15,
    icon = 152,
    property = [{0,140,3564},{0,141,3564}],
    guildlevel = 8,
    cost = 5600,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "3564"
    };
getRow(5,16)->
    #guildexchangeCfg {
    id = 5,
    level = 16,
    icon = 152,
    property = [{0,140,4041},{0,141,4041}],
    guildlevel = 8,
    cost = 5800,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "4041"
    };
getRow(5,17)->
    #guildexchangeCfg {
    id = 5,
    level = 17,
    icon = 152,
    property = [{0,140,4548},{0,141,4548}],
    guildlevel = 8,
    cost = 6200,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "4548"
    };
getRow(5,18)->
    #guildexchangeCfg {
    id = 5,
    level = 18,
    icon = 152,
    property = [{0,140,5085},{0,141,5085}],
    guildlevel = 8,
    cost = 6500,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "5085"
    };
getRow(5,19)->
    #guildexchangeCfg {
    id = 5,
    level = 19,
    icon = 152,
    property = [{0,140,5651},{0,141,5651}],
    guildlevel = 8,
    cost = 6900,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "5651"
    };
getRow(5,20)->
    #guildexchangeCfg {
    id = 5,
    level = 20,
    icon = 152,
    property = [{0,140,6248},{0,141,6248}],
    guildlevel = 8,
    cost = 7200,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "6248"
    };
getRow(5,21)->
    #guildexchangeCfg {
    id = 5,
    level = 21,
    icon = 152,
    property = [{0,140,6875},{0,141,6875}],
    guildlevel = 8,
    cost = 7500,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "6875"
    };
getRow(5,22)->
    #guildexchangeCfg {
    id = 5,
    level = 22,
    icon = 152,
    property = [{0,140,7532},{0,141,7532}],
    guildlevel = 8,
    cost = 8000,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "7532"
    };
getRow(5,23)->
    #guildexchangeCfg {
    id = 5,
    level = 23,
    icon = 152,
    property = [{0,140,8218},{0,141,8218}],
    guildlevel = 9,
    cost = 8100,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "8218"
    };
getRow(5,24)->
    #guildexchangeCfg {
    id = 5,
    level = 24,
    icon = 152,
    property = [{0,140,8935},{0,141,8935}],
    guildlevel = 9,
    cost = 8600,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "8935"
    };
getRow(5,25)->
    #guildexchangeCfg {
    id = 5,
    level = 25,
    icon = 152,
    property = [{0,140,9682},{0,141,9682}],
    guildlevel = 10,
    cost = 8800,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "9682"
    };
getRow(5,26)->
    #guildexchangeCfg {
    id = 5,
    level = 26,
    icon = 152,
    property = [{0,140,10459},{0,141,10459}],
    guildlevel = 10,
    cost = 9300,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "10459"
    };
getRow(5,27)->
    #guildexchangeCfg {
    id = 5,
    level = 27,
    icon = 152,
    property = [{0,140,11266},{0,141,11266}],
    guildlevel = 10,
    cost = 9500,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "11266"
    };
getRow(5,28)->
    #guildexchangeCfg {
    id = 5,
    level = 28,
    icon = 152,
    property = [{0,140,12102},{0,141,12102}],
    guildlevel = 10,
    cost = 9900,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "12102"
    };
getRow(5,29)->
    #guildexchangeCfg {
    id = 5,
    level = 29,
    icon = 152,
    property = [{0,140,12969},{0,141,12969}],
    guildlevel = 10,
    cost = 10300,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "12969"
    };
getRow(5,30)->
    #guildexchangeCfg {
    id = 5,
    level = 30,
    icon = 152,
    property = [{0,140,13866},{0,141,13866}],
    guildlevel = 10,
    cost = 10600,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级{a}点,抗暴等级{a}点",
    character_a = "13866"
    };
getRow(6,0)->
    #guildexchangeCfg {
    id = 6,
    level = 0,
    icon = 281,
    property = [{0,142,0},{0,143,0}],
    guildlevel = 7,
    cost = 0,
    name = "家族爆伤等级",
    character_a = ""
    };
getRow(6,1)->
    #guildexchangeCfg {
    id = 6,
    level = 1,
    icon = 281,
    property = [{0,142,41},{0,143,41}],
    guildlevel = 7,
    cost = 800,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "41"
    };
getRow(6,2)->
    #guildexchangeCfg {
    id = 6,
    level = 2,
    icon = 281,
    property = [{0,142,98},{0,143,98}],
    guildlevel = 7,
    cost = 1000,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "98"
    };
getRow(6,3)->
    #guildexchangeCfg {
    id = 6,
    level = 3,
    icon = 281,
    property = [{0,142,184},{0,143,184}],
    guildlevel = 7,
    cost = 1200,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "184"
    };
getRow(6,4)->
    #guildexchangeCfg {
    id = 6,
    level = 4,
    icon = 281,
    property = [{0,142,301},{0,143,301}],
    guildlevel = 7,
    cost = 1600,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "301"
    };
getRow(6,5)->
    #guildexchangeCfg {
    id = 6,
    level = 5,
    icon = 281,
    property = [{0,142,448},{0,143,448}],
    guildlevel = 7,
    cost = 1900,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "448"
    };
getRow(6,6)->
    #guildexchangeCfg {
    id = 6,
    level = 6,
    icon = 281,
    property = [{0,142,624},{0,143,624}],
    guildlevel = 7,
    cost = 2100,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "624"
    };
getRow(6,7)->
    #guildexchangeCfg {
    id = 6,
    level = 7,
    icon = 281,
    property = [{0,142,831},{0,143,831}],
    guildlevel = 7,
    cost = 2400,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "831"
    };
getRow(6,8)->
    #guildexchangeCfg {
    id = 6,
    level = 8,
    icon = 281,
    property = [{0,142,1068},{0,143,1068}],
    guildlevel = 7,
    cost = 2700,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "1068"
    };
getRow(6,9)->
    #guildexchangeCfg {
    id = 6,
    level = 9,
    icon = 281,
    property = [{0,142,1334},{0,143,1334}],
    guildlevel = 7,
    cost = 3000,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "1334"
    };
getRow(6,10)->
    #guildexchangeCfg {
    id = 6,
    level = 10,
    icon = 281,
    property = [{0,142,1631},{0,143,1631}],
    guildlevel = 7,
    cost = 3300,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "1631"
    };
getRow(6,11)->
    #guildexchangeCfg {
    id = 6,
    level = 11,
    icon = 281,
    property = [{0,142,1958},{0,143,1958}],
    guildlevel = 7,
    cost = 3600,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "1958"
    };
getRow(6,12)->
    #guildexchangeCfg {
    id = 6,
    level = 12,
    icon = 281,
    property = [{0,142,2314},{0,143,2314}],
    guildlevel = 7,
    cost = 4000,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "2314"
    };
getRow(6,13)->
    #guildexchangeCfg {
    id = 6,
    level = 13,
    icon = 281,
    property = [{0,142,2701},{0,143,2701}],
    guildlevel = 7,
    cost = 4200,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "2701"
    };
getRow(6,14)->
    #guildexchangeCfg {
    id = 6,
    level = 14,
    icon = 281,
    property = [{0,142,3118},{0,143,3118}],
    guildlevel = 7,
    cost = 4400,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "3118"
    };
getRow(6,15)->
    #guildexchangeCfg {
    id = 6,
    level = 15,
    icon = 281,
    property = [{0,142,3564},{0,143,3564}],
    guildlevel = 7,
    cost = 4800,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "3564"
    };
getRow(6,16)->
    #guildexchangeCfg {
    id = 6,
    level = 16,
    icon = 281,
    property = [{0,142,4041},{0,143,4041}],
    guildlevel = 7,
    cost = 5000,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "4041"
    };
getRow(6,17)->
    #guildexchangeCfg {
    id = 6,
    level = 17,
    icon = 281,
    property = [{0,142,4548},{0,143,4548}],
    guildlevel = 7,
    cost = 5400,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "4548"
    };
getRow(6,18)->
    #guildexchangeCfg {
    id = 6,
    level = 18,
    icon = 281,
    property = [{0,142,5085},{0,143,5085}],
    guildlevel = 7,
    cost = 5600,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "5085"
    };
getRow(6,19)->
    #guildexchangeCfg {
    id = 6,
    level = 19,
    icon = 281,
    property = [{0,142,5651},{0,143,5651}],
    guildlevel = 7,
    cost = 6000,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "5651"
    };
getRow(6,20)->
    #guildexchangeCfg {
    id = 6,
    level = 20,
    icon = 281,
    property = [{0,142,6248},{0,143,6248}],
    guildlevel = 8,
    cost = 6200,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "6248"
    };
getRow(6,21)->
    #guildexchangeCfg {
    id = 6,
    level = 21,
    icon = 281,
    property = [{0,142,6875},{0,143,6875}],
    guildlevel = 8,
    cost = 6500,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "6875"
    };
getRow(6,22)->
    #guildexchangeCfg {
    id = 6,
    level = 22,
    icon = 281,
    property = [{0,142,7532},{0,143,7532}],
    guildlevel = 8,
    cost = 6900,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "7532"
    };
getRow(6,23)->
    #guildexchangeCfg {
    id = 6,
    level = 23,
    icon = 281,
    property = [{0,142,8218},{0,143,8218}],
    guildlevel = 9,
    cost = 7000,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "8218"
    };
getRow(6,24)->
    #guildexchangeCfg {
    id = 6,
    level = 24,
    icon = 281,
    property = [{0,142,8935},{0,143,8935}],
    guildlevel = 9,
    cost = 7400,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "8935"
    };
getRow(6,25)->
    #guildexchangeCfg {
    id = 6,
    level = 25,
    icon = 281,
    property = [{0,142,9682},{0,143,9682}],
    guildlevel = 10,
    cost = 7600,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "9682"
    };
getRow(6,26)->
    #guildexchangeCfg {
    id = 6,
    level = 26,
    icon = 281,
    property = [{0,142,10459},{0,143,10459}],
    guildlevel = 10,
    cost = 8100,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "10459"
    };
getRow(6,27)->
    #guildexchangeCfg {
    id = 6,
    level = 27,
    icon = 281,
    property = [{0,142,11266},{0,143,11266}],
    guildlevel = 10,
    cost = 8300,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "11266"
    };
getRow(6,28)->
    #guildexchangeCfg {
    id = 6,
    level = 28,
    icon = 281,
    property = [{0,142,12102},{0,143,12102}],
    guildlevel = 10,
    cost = 8500,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "12102"
    };
getRow(6,29)->
    #guildexchangeCfg {
    id = 6,
    level = 29,
    icon = 281,
    property = [{0,142,12969},{0,143,12969}],
    guildlevel = 10,
    cost = 8900,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "12969"
    };
getRow(6,30)->
    #guildexchangeCfg {
    id = 6,
    level = 30,
    icon = 281,
    property = [{0,142,13866},{0,143,13866}],
    guildlevel = 10,
    cost = 9100,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级{a}点,韧性等级{a}点",
    character_a = "13866"
    };
getRow(7,0)->
    #guildexchangeCfg {
    id = 7,
    level = 0,
    icon = 31103,
    property = [{0,144,0},{0,145,0}],
    guildlevel = 6,
    cost = 0,
    name = "家族命中等级",
    character_a = ""
    };
getRow(7,1)->
    #guildexchangeCfg {
    id = 7,
    level = 1,
    icon = 31103,
    property = [{0,144,41},{0,145,41}],
    guildlevel = 6,
    cost = 800,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "41"
    };
getRow(7,2)->
    #guildexchangeCfg {
    id = 7,
    level = 2,
    icon = 31103,
    property = [{0,144,98},{0,145,98}],
    guildlevel = 6,
    cost = 1000,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "98"
    };
getRow(7,3)->
    #guildexchangeCfg {
    id = 7,
    level = 3,
    icon = 31103,
    property = [{0,144,184},{0,145,184}],
    guildlevel = 6,
    cost = 1200,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "184"
    };
getRow(7,4)->
    #guildexchangeCfg {
    id = 7,
    level = 4,
    icon = 31103,
    property = [{0,144,301},{0,145,301}],
    guildlevel = 6,
    cost = 1600,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "301"
    };
getRow(7,5)->
    #guildexchangeCfg {
    id = 7,
    level = 5,
    icon = 31103,
    property = [{0,144,448},{0,145,448}],
    guildlevel = 6,
    cost = 1900,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "448"
    };
getRow(7,6)->
    #guildexchangeCfg {
    id = 7,
    level = 6,
    icon = 31103,
    property = [{0,144,624},{0,145,624}],
    guildlevel = 6,
    cost = 2100,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "624"
    };
getRow(7,7)->
    #guildexchangeCfg {
    id = 7,
    level = 7,
    icon = 31103,
    property = [{0,144,831},{0,145,831}],
    guildlevel = 6,
    cost = 2400,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "831"
    };
getRow(7,8)->
    #guildexchangeCfg {
    id = 7,
    level = 8,
    icon = 31103,
    property = [{0,144,1068},{0,145,1068}],
    guildlevel = 6,
    cost = 2700,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "1068"
    };
getRow(7,9)->
    #guildexchangeCfg {
    id = 7,
    level = 9,
    icon = 31103,
    property = [{0,144,1334},{0,145,1334}],
    guildlevel = 6,
    cost = 3000,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "1334"
    };
getRow(7,10)->
    #guildexchangeCfg {
    id = 7,
    level = 10,
    icon = 31103,
    property = [{0,144,1631},{0,145,1631}],
    guildlevel = 6,
    cost = 3300,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "1631"
    };
getRow(7,11)->
    #guildexchangeCfg {
    id = 7,
    level = 11,
    icon = 31103,
    property = [{0,144,1958},{0,145,1958}],
    guildlevel = 6,
    cost = 3600,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "1958"
    };
getRow(7,12)->
    #guildexchangeCfg {
    id = 7,
    level = 12,
    icon = 31103,
    property = [{0,144,2314},{0,145,2314}],
    guildlevel = 6,
    cost = 4000,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "2314"
    };
getRow(7,13)->
    #guildexchangeCfg {
    id = 7,
    level = 13,
    icon = 31103,
    property = [{0,144,2701},{0,145,2701}],
    guildlevel = 6,
    cost = 4200,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "2701"
    };
getRow(7,14)->
    #guildexchangeCfg {
    id = 7,
    level = 14,
    icon = 31103,
    property = [{0,144,3118},{0,145,3118}],
    guildlevel = 6,
    cost = 4400,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "3118"
    };
getRow(7,15)->
    #guildexchangeCfg {
    id = 7,
    level = 15,
    icon = 31103,
    property = [{0,144,3564},{0,145,3564}],
    guildlevel = 6,
    cost = 4800,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "3564"
    };
getRow(7,16)->
    #guildexchangeCfg {
    id = 7,
    level = 16,
    icon = 31103,
    property = [{0,144,4041},{0,145,4041}],
    guildlevel = 6,
    cost = 5000,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "4041"
    };
getRow(7,17)->
    #guildexchangeCfg {
    id = 7,
    level = 17,
    icon = 31103,
    property = [{0,144,4548},{0,145,4548}],
    guildlevel = 6,
    cost = 5400,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "4548"
    };
getRow(7,18)->
    #guildexchangeCfg {
    id = 7,
    level = 18,
    icon = 31103,
    property = [{0,144,5085},{0,145,5085}],
    guildlevel = 6,
    cost = 5600,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "5085"
    };
getRow(7,19)->
    #guildexchangeCfg {
    id = 7,
    level = 19,
    icon = 31103,
    property = [{0,144,5651},{0,145,5651}],
    guildlevel = 6,
    cost = 6000,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "5651"
    };
getRow(7,20)->
    #guildexchangeCfg {
    id = 7,
    level = 20,
    icon = 31103,
    property = [{0,144,6248},{0,145,6248}],
    guildlevel = 8,
    cost = 6200,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "6248"
    };
getRow(7,21)->
    #guildexchangeCfg {
    id = 7,
    level = 21,
    icon = 31103,
    property = [{0,144,6875},{0,145,6875}],
    guildlevel = 8,
    cost = 6500,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "6875"
    };
getRow(7,22)->
    #guildexchangeCfg {
    id = 7,
    level = 22,
    icon = 31103,
    property = [{0,144,7532},{0,145,7532}],
    guildlevel = 8,
    cost = 6900,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "7532"
    };
getRow(7,23)->
    #guildexchangeCfg {
    id = 7,
    level = 23,
    icon = 31103,
    property = [{0,144,8218},{0,145,8218}],
    guildlevel = 9,
    cost = 7000,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "8218"
    };
getRow(7,24)->
    #guildexchangeCfg {
    id = 7,
    level = 24,
    icon = 31103,
    property = [{0,144,8935},{0,145,8935}],
    guildlevel = 9,
    cost = 7400,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "8935"
    };
getRow(7,25)->
    #guildexchangeCfg {
    id = 7,
    level = 25,
    icon = 31103,
    property = [{0,144,9682},{0,145,9682}],
    guildlevel = 10,
    cost = 7600,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "9682"
    };
getRow(7,26)->
    #guildexchangeCfg {
    id = 7,
    level = 26,
    icon = 31103,
    property = [{0,144,10459},{0,145,10459}],
    guildlevel = 10,
    cost = 8100,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "10459"
    };
getRow(7,27)->
    #guildexchangeCfg {
    id = 7,
    level = 27,
    icon = 31103,
    property = [{0,144,11266},{0,145,11266}],
    guildlevel = 10,
    cost = 8300,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "11266"
    };
getRow(7,28)->
    #guildexchangeCfg {
    id = 7,
    level = 28,
    icon = 31103,
    property = [{0,144,12102},{0,145,12102}],
    guildlevel = 10,
    cost = 8500,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "12102"
    };
getRow(7,29)->
    #guildexchangeCfg {
    id = 7,
    level = 29,
    icon = 31103,
    property = [{0,144,12969},{0,145,12969}],
    guildlevel = 10,
    cost = 8900,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "12969"
    };
getRow(7,30)->
    #guildexchangeCfg {
    id = 7,
    level = 30,
    icon = 31103,
    property = [{0,144,13866},{0,145,13866}],
    guildlevel = 10,
    cost = 9100,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级{a}点,闪避等级{a}点",
    character_a = "13866"
    };
getRow(8,0)->
    #guildexchangeCfg {
    id = 8,
    level = 0,
    icon = 31207,
    property = [{0,146,0},{0,160,0}],
    guildlevel = 6,
    cost = 0,
    name = "家族破甲等级",
    character_a = ""
    };
getRow(8,1)->
    #guildexchangeCfg {
    id = 8,
    level = 1,
    icon = 31207,
    property = [{0,146,41},{0,160,41}],
    guildlevel = 6,
    cost = 800,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "41"
    };
getRow(8,2)->
    #guildexchangeCfg {
    id = 8,
    level = 2,
    icon = 31207,
    property = [{0,146,98},{0,160,98}],
    guildlevel = 6,
    cost = 1000,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "98"
    };
getRow(8,3)->
    #guildexchangeCfg {
    id = 8,
    level = 3,
    icon = 31207,
    property = [{0,146,184},{0,160,184}],
    guildlevel = 6,
    cost = 1200,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "184"
    };
getRow(8,4)->
    #guildexchangeCfg {
    id = 8,
    level = 4,
    icon = 31207,
    property = [{0,146,301},{0,160,301}],
    guildlevel = 6,
    cost = 1600,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "301"
    };
getRow(8,5)->
    #guildexchangeCfg {
    id = 8,
    level = 5,
    icon = 31207,
    property = [{0,146,448},{0,160,448}],
    guildlevel = 6,
    cost = 1900,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "448"
    };
getRow(8,6)->
    #guildexchangeCfg {
    id = 8,
    level = 6,
    icon = 31207,
    property = [{0,146,624},{0,160,624}],
    guildlevel = 6,
    cost = 2100,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "624"
    };
getRow(8,7)->
    #guildexchangeCfg {
    id = 8,
    level = 7,
    icon = 31207,
    property = [{0,146,831},{0,160,831}],
    guildlevel = 6,
    cost = 2400,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "831"
    };
getRow(8,8)->
    #guildexchangeCfg {
    id = 8,
    level = 8,
    icon = 31207,
    property = [{0,146,1068},{0,160,1068}],
    guildlevel = 6,
    cost = 2700,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "1068"
    };
getRow(8,9)->
    #guildexchangeCfg {
    id = 8,
    level = 9,
    icon = 31207,
    property = [{0,146,1334},{0,160,1334}],
    guildlevel = 6,
    cost = 3000,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "1334"
    };
getRow(8,10)->
    #guildexchangeCfg {
    id = 8,
    level = 10,
    icon = 31207,
    property = [{0,146,1631},{0,160,1631}],
    guildlevel = 6,
    cost = 3300,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "1631"
    };
getRow(8,11)->
    #guildexchangeCfg {
    id = 8,
    level = 11,
    icon = 31207,
    property = [{0,146,1958},{0,160,1958}],
    guildlevel = 6,
    cost = 3600,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "1958"
    };
getRow(8,12)->
    #guildexchangeCfg {
    id = 8,
    level = 12,
    icon = 31207,
    property = [{0,146,2314},{0,160,2314}],
    guildlevel = 6,
    cost = 4000,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "2314"
    };
getRow(8,13)->
    #guildexchangeCfg {
    id = 8,
    level = 13,
    icon = 31207,
    property = [{0,146,2701},{0,160,2701}],
    guildlevel = 6,
    cost = 4200,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "2701"
    };
getRow(8,14)->
    #guildexchangeCfg {
    id = 8,
    level = 14,
    icon = 31207,
    property = [{0,146,3118},{0,160,3118}],
    guildlevel = 6,
    cost = 4400,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "3118"
    };
getRow(8,15)->
    #guildexchangeCfg {
    id = 8,
    level = 15,
    icon = 31207,
    property = [{0,146,3564},{0,160,3564}],
    guildlevel = 6,
    cost = 4800,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "3564"
    };
getRow(8,16)->
    #guildexchangeCfg {
    id = 8,
    level = 16,
    icon = 31207,
    property = [{0,146,4041},{0,160,4041}],
    guildlevel = 6,
    cost = 5000,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "4041"
    };
getRow(8,17)->
    #guildexchangeCfg {
    id = 8,
    level = 17,
    icon = 31207,
    property = [{0,146,4548},{0,160,4548}],
    guildlevel = 6,
    cost = 5400,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "4548"
    };
getRow(8,18)->
    #guildexchangeCfg {
    id = 8,
    level = 18,
    icon = 31207,
    property = [{0,146,5085},{0,160,5085}],
    guildlevel = 6,
    cost = 5600,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "5085"
    };
getRow(8,19)->
    #guildexchangeCfg {
    id = 8,
    level = 19,
    icon = 31207,
    property = [{0,146,5651},{0,160,5651}],
    guildlevel = 6,
    cost = 6000,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "5651"
    };
getRow(8,20)->
    #guildexchangeCfg {
    id = 8,
    level = 20,
    icon = 31207,
    property = [{0,146,6248},{0,160,6248}],
    guildlevel = 8,
    cost = 6200,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "6248"
    };
getRow(8,21)->
    #guildexchangeCfg {
    id = 8,
    level = 21,
    icon = 31207,
    property = [{0,146,6875},{0,160,6875}],
    guildlevel = 8,
    cost = 6500,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "6875"
    };
getRow(8,22)->
    #guildexchangeCfg {
    id = 8,
    level = 22,
    icon = 31207,
    property = [{0,146,7532},{0,160,7532}],
    guildlevel = 8,
    cost = 6900,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "7532"
    };
getRow(8,23)->
    #guildexchangeCfg {
    id = 8,
    level = 23,
    icon = 31207,
    property = [{0,146,8218},{0,160,8218}],
    guildlevel = 9,
    cost = 7000,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "8218"
    };
getRow(8,24)->
    #guildexchangeCfg {
    id = 8,
    level = 24,
    icon = 31207,
    property = [{0,146,8935},{0,160,8935}],
    guildlevel = 9,
    cost = 7400,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "8935"
    };
getRow(8,25)->
    #guildexchangeCfg {
    id = 8,
    level = 25,
    icon = 31207,
    property = [{0,146,9682},{0,160,9682}],
    guildlevel = 10,
    cost = 7600,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "9682"
    };
getRow(8,26)->
    #guildexchangeCfg {
    id = 8,
    level = 26,
    icon = 31207,
    property = [{0,146,10459},{0,160,10459}],
    guildlevel = 10,
    cost = 8100,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "10459"
    };
getRow(8,27)->
    #guildexchangeCfg {
    id = 8,
    level = 27,
    icon = 31207,
    property = [{0,146,11266},{0,160,11266}],
    guildlevel = 10,
    cost = 8300,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "11266"
    };
getRow(8,28)->
    #guildexchangeCfg {
    id = 8,
    level = 28,
    icon = 31207,
    property = [{0,146,12102},{0,160,12102}],
    guildlevel = 10,
    cost = 8500,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "12102"
    };
getRow(8,29)->
    #guildexchangeCfg {
    id = 8,
    level = 29,
    icon = 31207,
    property = [{0,146,12969},{0,160,12969}],
    guildlevel = 10,
    cost = 8900,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "12969"
    };
getRow(8,30)->
    #guildexchangeCfg {
    id = 8,
    level = 30,
    icon = 31207,
    property = [{0,146,13866},{0,160,13866}],
    guildlevel = 10,
    cost = 9100,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级{a}点,坚固等级{a}点",
    character_a = "13866"
    };
getRow(_,_)->[].

getKeyList()->[
    {1,0},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {1,10},
    {1,11},
    {1,12},
    {1,13},
    {1,14},
    {1,15},
    {1,16},
    {1,17},
    {1,18},
    {1,19},
    {1,20},
    {1,21},
    {1,22},
    {1,23},
    {1,24},
    {1,25},
    {1,26},
    {1,27},
    {1,28},
    {1,29},
    {1,30},
    {2,0},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
    {2,9},
    {2,10},
    {2,11},
    {2,12},
    {2,13},
    {2,14},
    {2,15},
    {2,16},
    {2,17},
    {2,18},
    {2,19},
    {2,20},
    {2,21},
    {2,22},
    {2,23},
    {2,24},
    {2,25},
    {2,26},
    {2,27},
    {2,28},
    {2,29},
    {2,30},
    {3,0},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {3,8},
    {3,9},
    {3,10},
    {3,11},
    {3,12},
    {3,13},
    {3,14},
    {3,15},
    {3,16},
    {3,17},
    {3,18},
    {3,19},
    {3,20},
    {3,21},
    {3,22},
    {3,23},
    {3,24},
    {3,25},
    {3,26},
    {3,27},
    {3,28},
    {3,29},
    {3,30},
    {4,0},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {4,6},
    {4,7},
    {4,8},
    {4,9},
    {4,10},
    {4,11},
    {4,12},
    {4,13},
    {4,14},
    {4,15},
    {4,16},
    {4,17},
    {4,18},
    {4,19},
    {4,20},
    {4,21},
    {4,22},
    {4,23},
    {4,24},
    {4,25},
    {4,26},
    {4,27},
    {4,28},
    {4,29},
    {4,30},
    {5,0},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {5,6},
    {5,7},
    {5,8},
    {5,9},
    {5,10},
    {5,11},
    {5,12},
    {5,13},
    {5,14},
    {5,15},
    {5,16},
    {5,17},
    {5,18},
    {5,19},
    {5,20},
    {5,21},
    {5,22},
    {5,23},
    {5,24},
    {5,25},
    {5,26},
    {5,27},
    {5,28},
    {5,29},
    {5,30},
    {6,0},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {6,5},
    {6,6},
    {6,7},
    {6,8},
    {6,9},
    {6,10},
    {6,11},
    {6,12},
    {6,13},
    {6,14},
    {6,15},
    {6,16},
    {6,17},
    {6,18},
    {6,19},
    {6,20},
    {6,21},
    {6,22},
    {6,23},
    {6,24},
    {6,25},
    {6,26},
    {6,27},
    {6,28},
    {6,29},
    {6,30},
    {7,0},
    {7,1},
    {7,2},
    {7,3},
    {7,4},
    {7,5},
    {7,6},
    {7,7},
    {7,8},
    {7,9},
    {7,10},
    {7,11},
    {7,12},
    {7,13},
    {7,14},
    {7,15},
    {7,16},
    {7,17},
    {7,18},
    {7,19},
    {7,20},
    {7,21},
    {7,22},
    {7,23},
    {7,24},
    {7,25},
    {7,26},
    {7,27},
    {7,28},
    {7,29},
    {7,30},
    {8,0},
    {8,1},
    {8,2},
    {8,3},
    {8,4},
    {8,5},
    {8,6},
    {8,7},
    {8,8},
    {8,9},
    {8,10},
    {8,11},
    {8,12},
    {8,13},
    {8,14},
    {8,15},
    {8,16},
    {8,17},
    {8,18},
    {8,19},
    {8,20},
    {8,21},
    {8,22},
    {8,23},
    {8,24},
    {8,25},
    {8,26},
    {8,27},
    {8,28},
    {8,29},
    {8,30}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

get2KeyList(1)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ];
get2KeyList(2)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ];
get2KeyList(3)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ];
get2KeyList(4)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ];
get2KeyList(5)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ];
get2KeyList(6)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ];
get2KeyList(7)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ];
get2KeyList(8)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ];
get2KeyList(_)->[].

