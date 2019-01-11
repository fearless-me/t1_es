%% coding: latin-1
%%: 实现
-module(cfg_awake_chs).
-compile(export_all).
-include("cfg_awake.hrl").
-include("logger.hrl").

getRow(0,1)->
    #awakeCfg {
    id = 0,
    id_stone = 1,
    item = [{23101,30}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1062},{136,106},{137,106},{140,117},{141,117}],
    attribute_two = [{135,1062},{136,106},{137,106},{142,147},{143,147}],
    attribute_thr = [{135,1062},{136,106},{137,106},{144,144},{145,144}],
    position = 2,
    skillid = 0,
    buffid = 0,
    bufftime = 0,
    minlevel = 100
    };
getRow(0,2)->
    #awakeCfg {
    id = 0,
    id_stone = 2,
    item = [{23101,35}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1065},{136,107},{137,107},{140,117},{141,117}],
    attribute_two = [{135,1065},{136,107},{137,107},{142,150},{143,150}],
    attribute_thr = [{135,1065},{136,107},{137,107},{144,147},{145,147}],
    position = 3,
    skillid = 0,
    buffid = 0,
    bufftime = 0,
    minlevel = 100
    };
getRow(0,3)->
    #awakeCfg {
    id = 0,
    id_stone = 3,
    item = [{23101,40}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1082},{136,108},{137,108},{140,120},{141,120}],
    attribute_two = [{135,1082},{136,108},{137,108},{142,150},{143,150}],
    attribute_thr = [{135,1082},{136,108},{137,108},{144,150},{145,150}],
    position = 4,
    skillid = 0,
    buffid = 0,
    bufftime = 0,
    minlevel = 100
    };
getRow(0,4)->
    #awakeCfg {
    id = 0,
    id_stone = 4,
    item = [{23107,20}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,2220},{136,222},{137,222},{140,246},{141,246}],
    attribute_two = [{135,2220},{136,222},{137,222},{142,312},{143,312}],
    attribute_thr = [{135,2220},{136,222},{137,222},{144,303},{145,303}],
    position = 5,
    skillid = 0,
    buffid = 0,
    bufftime = 0,
    minlevel = 100
    };
getRow(0,5)->
    #awakeCfg {
    id = 0,
    id_stone = 5,
    item = [{23101,50}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1147},{136,115},{137,115},{140,126},{141,126}],
    attribute_two = [{135,1147},{136,115},{137,115},{142,159},{143,159}],
    attribute_thr = [{135,1147},{136,115},{137,115},{144,159},{145,159}],
    position = 6,
    skillid = 0,
    buffid = 0,
    bufftime = 0,
    minlevel = 100
    };
getRow(0,6)->
    #awakeCfg {
    id = 0,
    id_stone = 6,
    item = [{23101,55}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1191},{136,119},{137,119},{140,132},{141,132}],
    attribute_two = [{135,1191},{136,119},{137,119},{142,168},{143,168}],
    attribute_thr = [{135,1191},{136,119},{137,119},{144,162},{145,162}],
    position = 7,
    skillid = 0,
    buffid = 0,
    bufftime = 0,
    minlevel = 100
    };
getRow(0,7)->
    #awakeCfg {
    id = 0,
    id_stone = 7,
    item = [{23101,60}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1245},{136,124},{137,124},{140,138},{141,138}],
    attribute_two = [{135,1245},{136,124},{137,124},{142,174},{143,174}],
    attribute_thr = [{135,1245},{136,124},{137,124},{144,171},{145,171}],
    position = 8,
    skillid = 0,
    buffid = 0,
    bufftime = 0,
    minlevel = 100
    };
getRow(0,8)->
    #awakeCfg {
    id = 0,
    id_stone = 8,
    item = [{23107,35}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,3913},{136,392},{137,392},{140,432},{141,432}],
    attribute_two = [{135,3913},{136,392},{137,392},{142,546},{143,546}],
    attribute_thr = [{135,3913},{136,392},{137,392},{144,537},{145,537}],
    position = 9,
    skillid = 50001,
    buffid = 4100,
    bufftime = 900000,
    minlevel = 100
    };
getRow(1,1)->
    #awakeCfg {
    id = 1,
    id_stone = 1,
    item = [{23101,100}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1372},{136,137},{137,137},{140,150},{141,150}],
    attribute_two = [{135,1372},{136,137},{137,137},{142,192},{143,192}],
    attribute_thr = [{135,1372},{136,137},{137,137},{144,189},{145,189}],
    position = 2,
    skillid = 50001,
    buffid = 4100,
    bufftime = 900000,
    minlevel = 100
    };
getRow(1,2)->
    #awakeCfg {
    id = 1,
    id_stone = 2,
    item = [{23101,118}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1444},{136,144},{137,144},{140,159},{141,159}],
    attribute_two = [{135,1444},{136,144},{137,144},{142,201},{143,201}],
    attribute_thr = [{135,1444},{136,144},{137,144},{144,198},{145,198}],
    position = 3,
    skillid = 50001,
    buffid = 4100,
    bufftime = 900000,
    minlevel = 100
    };
getRow(1,3)->
    #awakeCfg {
    id = 1,
    id_stone = 3,
    item = [{23101,136}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1524},{136,153},{137,153},{140,168},{141,168}],
    attribute_two = [{135,1524},{136,153},{137,153},{142,213},{143,213}],
    attribute_thr = [{135,1524},{136,153},{137,153},{144,207},{145,207}],
    position = 4,
    skillid = 50001,
    buffid = 4100,
    bufftime = 900000,
    minlevel = 100
    };
getRow(1,4)->
    #awakeCfg {
    id = 1,
    id_stone = 4,
    item = [{23107,50}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,3220},{136,322},{137,322},{140,357},{141,357}],
    attribute_two = [{135,3220},{136,322},{137,322},{142,450},{143,450}],
    attribute_thr = [{135,3220},{136,322},{137,322},{144,441},{145,441}],
    position = 5,
    skillid = 50001,
    buffid = 4100,
    bufftime = 900000,
    minlevel = 100
    };
getRow(1,5)->
    #awakeCfg {
    id = 1,
    id_stone = 5,
    item = [{23101,172}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1702},{136,170},{137,170},{140,186},{141,186}],
    attribute_two = [{135,1702},{136,170},{137,170},{142,237},{143,237}],
    attribute_thr = [{135,1702},{136,170},{137,170},{144,234},{145,234}],
    position = 6,
    skillid = 50001,
    buffid = 4100,
    bufftime = 900000,
    minlevel = 100
    };
getRow(1,6)->
    #awakeCfg {
    id = 1,
    id_stone = 6,
    item = [{23101,190}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1799},{136,180},{137,180},{140,201},{141,201}],
    attribute_two = [{135,1799},{136,180},{137,180},{142,252},{143,252}],
    attribute_thr = [{135,1799},{136,180},{137,180},{144,249},{145,249}],
    position = 7,
    skillid = 50001,
    buffid = 4100,
    bufftime = 900000,
    minlevel = 100
    };
getRow(1,7)->
    #awakeCfg {
    id = 1,
    id_stone = 7,
    item = [{23101,208}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,1902},{136,190},{137,190},{140,210},{141,210}],
    attribute_two = [{135,1902},{136,190},{137,190},{142,267},{143,267}],
    attribute_thr = [{135,1902},{136,190},{137,190},{144,258},{145,258}],
    position = 8,
    skillid = 50001,
    buffid = 4100,
    bufftime = 900000,
    minlevel = 100
    };
getRow(1,8)->
    #awakeCfg {
    id = 1,
    id_stone = 8,
    item = [{23107,70}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,6032},{136,603},{137,603},{140,666},{141,666}],
    attribute_two = [{135,6032},{136,603},{137,603},{142,843},{143,843}],
    attribute_thr = [{135,6032},{136,603},{137,603},{144,828},{145,828}],
    position = 9,
    skillid = 50002,
    buffid = 4101,
    bufftime = 900000,
    minlevel = 100
    };
getRow(2,1)->
    #awakeCfg {
    id = 2,
    id_stone = 1,
    item = [{23102,90}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,2125},{136,212},{137,212},{140,234},{141,234}],
    attribute_two = [{135,2125},{136,212},{137,212},{142,297},{143,297}],
    attribute_thr = [{135,2125},{136,212},{137,212},{144,291},{145,291}],
    position = 2,
    skillid = 50002,
    buffid = 4101,
    bufftime = 900000,
    minlevel = 120
    };
getRow(2,2)->
    #awakeCfg {
    id = 2,
    id_stone = 2,
    item = [{23102,108}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,2243},{136,225},{137,225},{140,246},{141,246}],
    attribute_two = [{135,2243},{136,225},{137,225},{142,312},{143,312}],
    attribute_thr = [{135,2243},{136,225},{137,225},{144,309},{145,309}],
    position = 3,
    skillid = 50002,
    buffid = 4101,
    bufftime = 900000,
    minlevel = 120
    };
getRow(2,3)->
    #awakeCfg {
    id = 2,
    id_stone = 3,
    item = [{23102,126}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,2368},{136,237},{137,237},{140,264},{141,264}],
    attribute_two = [{135,2368},{136,237},{137,237},{142,330},{143,330}],
    attribute_thr = [{135,2368},{136,237},{137,237},{144,324},{145,324}],
    position = 4,
    skillid = 50002,
    buffid = 4101,
    bufftime = 900000,
    minlevel = 120
    };
getRow(2,4)->
    #awakeCfg {
    id = 2,
    id_stone = 4,
    item = [{23107,80}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,4995},{136,499},{137,499},{140,549},{141,549}],
    attribute_two = [{135,4995},{136,499},{137,499},{142,699},{143,699}],
    attribute_thr = [{135,4995},{136,499},{137,499},{144,684},{145,684}],
    position = 5,
    skillid = 50002,
    buffid = 4101,
    bufftime = 900000,
    minlevel = 120
    };
getRow(2,5)->
    #awakeCfg {
    id = 2,
    id_stone = 5,
    item = [{23102,162}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,2632},{136,263},{137,263},{140,291},{141,291}],
    attribute_two = [{135,2632},{136,263},{137,263},{142,366},{143,366}],
    attribute_thr = [{135,2632},{136,263},{137,263},{144,363},{145,363}],
    position = 6,
    skillid = 50002,
    buffid = 4101,
    bufftime = 900000,
    minlevel = 120
    };
getRow(2,6)->
    #awakeCfg {
    id = 2,
    id_stone = 6,
    item = [{23102,180}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,2771},{136,277},{137,277},{140,306},{141,306}],
    attribute_two = [{135,2771},{136,277},{137,277},{142,390},{143,390}],
    attribute_thr = [{135,2771},{136,277},{137,277},{144,378},{145,378}],
    position = 7,
    skillid = 50002,
    buffid = 4101,
    bufftime = 900000,
    minlevel = 120
    };
getRow(2,7)->
    #awakeCfg {
    id = 2,
    id_stone = 7,
    item = [{23102,198}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,2915},{136,292},{137,292},{140,321},{141,321}],
    attribute_two = [{135,2915},{136,292},{137,292},{142,405},{143,405}],
    attribute_thr = [{135,2915},{136,292},{137,292},{144,402},{145,402}],
    position = 8,
    skillid = 50002,
    buffid = 4101,
    bufftime = 900000,
    minlevel = 120
    };
getRow(2,8)->
    #awakeCfg {
    id = 2,
    id_stone = 8,
    item = [{23107,120}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,9192},{136,919},{137,919},{140,1017},{141,1017}],
    attribute_two = [{135,9192},{136,919},{137,919},{142,1284},{143,1284}],
    attribute_thr = [{135,9192},{136,919},{137,919},{144,1260},{145,1260}],
    position = 9,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 120
    };
getRow(3,1)->
    #awakeCfg {
    id = 3,
    id_stone = 1,
    item = [{23102,180}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,3218},{136,322},{137,322},{140,354},{141,354}],
    attribute_two = [{135,3218},{136,322},{137,322},{142,450},{143,450}],
    attribute_thr = [{135,3218},{136,322},{137,322},{144,441},{145,441}],
    position = 1,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,2)->
    #awakeCfg {
    id = 3,
    id_stone = 2,
    item = [{23102,198}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,3376},{136,338},{137,338},{140,372},{141,372}],
    attribute_two = [{135,3376},{136,338},{137,338},{142,471},{143,471}],
    attribute_thr = [{135,3376},{136,338},{137,338},{144,462},{145,462}],
    position = 2,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,3)->
    #awakeCfg {
    id = 3,
    id_stone = 3,
    item = [{23102,216}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,3539},{136,353},{137,353},{140,393},{141,393}],
    attribute_two = [{135,3539},{136,353},{137,353},{142,495},{143,495}],
    attribute_thr = [{135,3539},{136,353},{137,353},{144,486},{145,486}],
    position = 3,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,4)->
    #awakeCfg {
    id = 3,
    id_stone = 4,
    item = [{23102,234}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,3706},{136,371},{137,371},{140,408},{141,408}],
    attribute_two = [{135,3706},{136,371},{137,371},{142,519},{143,519}],
    attribute_thr = [{135,3706},{136,371},{137,371},{144,510},{145,510}],
    position = 4,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,5)->
    #awakeCfg {
    id = 3,
    id_stone = 5,
    item = [{23107,150}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,7757},{136,776},{137,776},{140,855},{141,855}],
    attribute_two = [{135,7757},{136,776},{137,776},{142,1083},{143,1083}],
    attribute_thr = [{135,7757},{136,776},{137,776},{144,1062},{145,1062}],
    position = 5,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,6)->
    #awakeCfg {
    id = 3,
    id_stone = 6,
    item = [{23102,270}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,4054},{136,405},{137,405},{140,450},{141,450}],
    attribute_two = [{135,4054},{136,405},{137,405},{142,567},{143,567}],
    attribute_thr = [{135,4054},{136,405},{137,405},{144,558},{145,558}],
    position = 6,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,7)->
    #awakeCfg {
    id = 3,
    id_stone = 7,
    item = [{23102,288}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,4235},{136,424},{137,424},{140,468},{141,468}],
    attribute_two = [{135,4235},{136,424},{137,424},{142,591},{143,591}],
    attribute_thr = [{135,4235},{136,424},{137,424},{144,579},{145,579}],
    position = 7,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,8)->
    #awakeCfg {
    id = 3,
    id_stone = 8,
    item = [{23102,306}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,4421},{136,442},{137,442},{140,486},{141,486}],
    attribute_two = [{135,4421},{136,442},{137,442},{142,618},{143,618}],
    attribute_thr = [{135,4421},{136,442},{137,442},{144,606},{145,606}],
    position = 8,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,9)->
    #awakeCfg {
    id = 3,
    id_stone = 9,
    item = [{23102,324}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,4609},{136,461},{137,461},{140,510},{141,510}],
    attribute_two = [{135,4609},{136,461},{137,461},{142,645},{143,645}],
    attribute_thr = [{135,4609},{136,461},{137,461},{144,633},{145,633}],
    position = 9,
    skillid = 50003,
    buffid = 4102,
    bufftime = 900000,
    minlevel = 140
    };
getRow(3,10)->
    #awakeCfg {
    id = 3,
    id_stone = 10,
    item = [{23107,220}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,14409},{136,1441},{137,1441},{140,1590},{141,1590}],
    attribute_two = [{135,14409},{136,1441},{137,1441},{142,2013},{143,2013}],
    attribute_thr = [{135,14409},{136,1441},{137,1441},{144,1977},{145,1977}],
    position = 10,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 140
    };
getRow(4,1)->
    #awakeCfg {
    id = 4,
    id_stone = 1,
    item = [{23103,150}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,5001},{136,500},{137,500},{140,552},{141,552}],
    attribute_two = [{135,5001},{136,500},{137,500},{142,699},{143,699}],
    attribute_thr = [{135,5001},{136,500},{137,500},{144,684},{145,684}],
    position = 1,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,2)->
    #awakeCfg {
    id = 4,
    id_stone = 2,
    item = [{23103,174}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,5203},{136,520},{137,520},{140,576},{141,576}],
    attribute_two = [{135,5203},{136,520},{137,520},{142,726},{143,726}],
    attribute_thr = [{135,5203},{136,520},{137,520},{144,714},{145,714}],
    position = 2,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,3)->
    #awakeCfg {
    id = 4,
    id_stone = 3,
    item = [{23103,198}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,5409},{136,541},{137,541},{140,597},{141,597}],
    attribute_two = [{135,5409},{136,541},{137,541},{142,756},{143,756}],
    attribute_thr = [{135,5409},{136,541},{137,541},{144,741},{145,741}],
    position = 3,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,4)->
    #awakeCfg {
    id = 4,
    id_stone = 4,
    item = [{23103,222}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,5619},{136,562},{137,562},{140,618},{141,618}],
    attribute_two = [{135,5619},{136,562},{137,562},{142,786},{143,786}],
    attribute_thr = [{135,5619},{136,562},{137,562},{144,771},{145,771}],
    position = 4,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,5)->
    #awakeCfg {
    id = 4,
    id_stone = 5,
    item = [{23107,300}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,11667},{136,1166},{137,1166},{140,1290},{141,1290}],
    attribute_two = [{135,11667},{136,1166},{137,1166},{142,1629},{143,1629}],
    attribute_thr = [{135,11667},{136,1166},{137,1166},{144,1602},{145,1602}],
    position = 5,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,6)->
    #awakeCfg {
    id = 4,
    id_stone = 6,
    item = [{23103,270}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,6052},{136,606},{137,606},{140,666},{141,666}],
    attribute_two = [{135,6052},{136,606},{137,606},{142,846},{143,846}],
    attribute_thr = [{135,6052},{136,606},{137,606},{144,828},{145,828}],
    position = 6,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,7)->
    #awakeCfg {
    id = 4,
    id_stone = 7,
    item = [{23103,294}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,6274},{136,627},{137,627},{140,693},{141,693}],
    attribute_two = [{135,6274},{136,627},{137,627},{142,876},{143,876}],
    attribute_thr = [{135,6274},{136,627},{137,627},{144,861},{145,861}],
    position = 7,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,8)->
    #awakeCfg {
    id = 4,
    id_stone = 8,
    item = [{23103,318}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,6500},{136,650},{137,650},{140,720},{141,720}],
    attribute_two = [{135,6500},{136,650},{137,650},{142,909},{143,909}],
    attribute_thr = [{135,6500},{136,650},{137,650},{144,891},{145,891}],
    position = 8,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,9)->
    #awakeCfg {
    id = 4,
    id_stone = 9,
    item = [{23103,342}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,6731},{136,673},{137,673},{140,741},{141,741}],
    attribute_two = [{135,6731},{136,673},{137,673},{142,939},{143,939}],
    attribute_thr = [{135,6731},{136,673},{137,673},{144,924},{145,924}],
    position = 9,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(4,10)->
    #awakeCfg {
    id = 4,
    id_stone = 10,
    item = [{23107,400}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,20895},{136,2090},{137,2090},{140,2307},{141,2307}],
    attribute_two = [{135,20895},{136,2090},{137,2090},{142,2919},{143,2919}],
    attribute_thr = [{135,20895},{136,2090},{137,2090},{144,2865},{145,2865}],
    position = 10,
    skillid = 50004,
    buffid = 4103,
    bufftime = 900000,
    minlevel = 160
    };
getRow(5,1)->
    #awakeCfg {
    id = 5,
    id_stone = 1,
    item = [{23103,300}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,7203},{136,720},{137,720},{140,795},{141,795}],
    attribute_two = [{135,7203},{136,720},{137,720},{142,1008},{143,1008}],
    attribute_thr = [{135,7203},{136,720},{137,720},{144,987},{145,987}],
    position = 1,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,2)->
    #awakeCfg {
    id = 5,
    id_stone = 2,
    item = [{23103,330}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,7444},{136,744},{137,744},{140,822},{141,822}],
    attribute_two = [{135,7444},{136,744},{137,744},{142,1038},{143,1038}],
    attribute_thr = [{135,7444},{136,744},{137,744},{144,1023},{145,1023}],
    position = 2,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,3)->
    #awakeCfg {
    id = 5,
    id_stone = 3,
    item = [{23103,360}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,7691},{136,769},{137,769},{140,849},{141,849}],
    attribute_two = [{135,7691},{136,769},{137,769},{142,1077},{143,1077}],
    attribute_thr = [{135,7691},{136,769},{137,769},{144,1053},{145,1053}],
    position = 3,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,4)->
    #awakeCfg {
    id = 5,
    id_stone = 4,
    item = [{23103,390}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,7940},{136,794},{137,794},{140,876},{141,876}],
    attribute_two = [{135,7940},{136,794},{137,794},{142,1107},{143,1107}],
    attribute_thr = [{135,7940},{136,794},{137,794},{144,1089},{145,1089}],
    position = 4,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,5)->
    #awakeCfg {
    id = 5,
    id_stone = 5,
    item = [{23107,520}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,16387},{136,1639},{137,1639},{140,1809},{141,1809}],
    attribute_two = [{135,16387},{136,1639},{137,1639},{142,2289},{143,2289}],
    attribute_thr = [{135,16387},{136,1639},{137,1639},{144,2247},{145,2247}],
    position = 5,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,6)->
    #awakeCfg {
    id = 5,
    id_stone = 6,
    item = [{23103,450}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,8451},{136,845},{137,845},{140,933},{141,933}],
    attribute_two = [{135,8451},{136,845},{137,845},{142,1182},{143,1182}],
    attribute_thr = [{135,8451},{136,845},{137,845},{144,1161},{145,1161}],
    position = 6,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,7)->
    #awakeCfg {
    id = 5,
    id_stone = 7,
    item = [{23103,480}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,8711},{136,871},{137,871},{140,963},{141,963}],
    attribute_two = [{135,8711},{136,871},{137,871},{142,1218},{143,1218}],
    attribute_thr = [{135,8711},{136,871},{137,871},{144,1194},{145,1194}],
    position = 7,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,8)->
    #awakeCfg {
    id = 5,
    id_stone = 8,
    item = [{23103,510}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,8976},{136,898},{137,898},{140,990},{141,990}],
    attribute_two = [{135,8976},{136,898},{137,898},{142,1254},{143,1254}],
    attribute_thr = [{135,8976},{136,898},{137,898},{144,1230},{145,1230}],
    position = 8,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,9)->
    #awakeCfg {
    id = 5,
    id_stone = 9,
    item = [{23103,540}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,9245},{136,924},{137,924},{140,1023},{141,1023}],
    attribute_two = [{135,9245},{136,924},{137,924},{142,1290},{143,1290}],
    attribute_thr = [{135,9245},{136,924},{137,924},{144,1269},{145,1269}],
    position = 9,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(5,10)->
    #awakeCfg {
    id = 5,
    id_stone = 10,
    item = [{23107,640}],
    vitality = 0,
    selectattribute = [140,142,144],
    attribute_one = [{135,28549},{136,2855},{137,2855},{140,3150},{141,3150}],
    attribute_two = [{135,28549},{136,2855},{137,2855},{142,3990},{143,3990}],
    attribute_thr = [{135,28549},{136,2855},{137,2855},{144,3915},{145,3915}],
    position = 10,
    skillid = 50005,
    buffid = 4104,
    bufftime = 900000,
    minlevel = 180
    };
getRow(_,_)->[].

getKeyList()->[
    {0,1},
    {0,2},
    {0,3},
    {0,4},
    {0,5},
    {0,6},
    {0,7},
    {0,8},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
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
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {5,6},
    {5,7},
    {5,8},
    {5,9},
    {5,10}
    ].

get1KeyList()->[
    0,
    1,
    2,
    3,
    4,
    5
    ].

get2KeyList(0)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ];
get2KeyList(1)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(4)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(5)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(_)->[].

