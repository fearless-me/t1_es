%% coding: latin-1
%%: 实现
-module(cfg_identity_area_cht).
-compile(export_all).
-include("cfg_identity_area.hrl").
-include("logger.hrl").

getRow(1,1)->
    #identity_areaCfg {
    id1 = 1,
    id2 = 1,
    area1 = "北京",
    area2 = "北京"
    };
getRow(2,1)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 1,
    area1 = "台湾",
    area2 = "基隆市"
    };
getRow(2,2)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 2,
    area1 = "台湾",
    area2 = "台北市"
    };
getRow(2,3)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 3,
    area1 = "台湾",
    area2 = "新北市"
    };
getRow(2,4)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 4,
    area1 = "台湾",
    area2 = "桃园市"
    };
getRow(2,5)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 5,
    area1 = "台湾",
    area2 = "新竹市"
    };
getRow(2,6)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 6,
    area1 = "台湾",
    area2 = "新竹县"
    };
getRow(2,7)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 7,
    area1 = "台湾",
    area2 = "苗栗县"
    };
getRow(2,8)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 8,
    area1 = "台湾",
    area2 = "台中市"
    };
getRow(2,9)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 9,
    area1 = "台湾",
    area2 = "彰化县"
    };
getRow(2,10)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 10,
    area1 = "台湾",
    area2 = "南投县"
    };
getRow(2,11)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 11,
    area1 = "台湾",
    area2 = "云林县"
    };
getRow(2,12)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 12,
    area1 = "台湾",
    area2 = "嘉义市"
    };
getRow(2,13)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 13,
    area1 = "台湾",
    area2 = "嘉义县"
    };
getRow(2,14)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 14,
    area1 = "台湾",
    area2 = "宜兰县"
    };
getRow(2,15)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 15,
    area1 = "台湾",
    area2 = "花莲县"
    };
getRow(2,16)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 16,
    area1 = "台湾",
    area2 = "台东县"
    };
getRow(2,17)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 17,
    area1 = "台湾",
    area2 = "台南市"
    };
getRow(2,18)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 18,
    area1 = "台湾",
    area2 = "高雄市"
    };
getRow(2,19)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 19,
    area1 = "台湾",
    area2 = "屏东县"
    };
getRow(2,20)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 20,
    area1 = "台湾",
    area2 = "连江县"
    };
getRow(2,21)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 21,
    area1 = "台湾",
    area2 = "金门县"
    };
getRow(2,22)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 22,
    area1 = "台湾",
    area2 = "澎湖县"
    };
getRow(3,1)->
    #identity_areaCfg {
    id1 = 3,
    id2 = 1,
    area1 = "香港",
    area2 = "香港"
    };
getRow(4,1)->
    #identity_areaCfg {
    id1 = 4,
    id2 = 1,
    area1 = "澳门",
    area2 = "澳门"
    };
getRow(5,1)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 1,
    area1 = "天津",
    area2 = "天津"
    };
getRow(6,1)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 1,
    area1 = "上海",
    area2 = "上海"
    };
getRow(7,1)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 1,
    area1 = "重庆",
    area2 = "重庆"
    };
getRow(8,1)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 1,
    area1 = "江苏",
    area2 = "南京"
    };
getRow(8,2)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 2,
    area1 = "江苏",
    area2 = "无锡"
    };
getRow(8,3)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 3,
    area1 = "江苏",
    area2 = "徐州"
    };
getRow(8,4)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 4,
    area1 = "江苏",
    area2 = "常州"
    };
getRow(8,5)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 5,
    area1 = "江苏",
    area2 = "苏州"
    };
getRow(8,6)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 6,
    area1 = "江苏",
    area2 = "南通"
    };
getRow(8,7)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 7,
    area1 = "江苏",
    area2 = "连云港"
    };
getRow(8,8)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 8,
    area1 = "江苏",
    area2 = "淮安"
    };
getRow(8,9)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 9,
    area1 = "江苏",
    area2 = "盐城"
    };
getRow(8,10)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 10,
    area1 = "江苏",
    area2 = "扬州"
    };
getRow(8,11)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 11,
    area1 = "江苏",
    area2 = "镇江"
    };
getRow(8,12)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 12,
    area1 = "江苏",
    area2 = "泰州"
    };
getRow(8,13)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 13,
    area1 = "江苏",
    area2 = "宿迁"
    };
getRow(9,1)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 1,
    area1 = "浙江",
    area2 = "杭州"
    };
getRow(9,2)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 2,
    area1 = "浙江",
    area2 = "宁波"
    };
getRow(9,3)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 3,
    area1 = "浙江",
    area2 = "温州"
    };
getRow(9,4)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 4,
    area1 = "浙江",
    area2 = "嘉兴"
    };
getRow(9,5)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 5,
    area1 = "浙江",
    area2 = "湖州"
    };
getRow(9,6)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 6,
    area1 = "浙江",
    area2 = "绍兴"
    };
getRow(9,7)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 7,
    area1 = "浙江",
    area2 = "金华"
    };
getRow(9,8)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 8,
    area1 = "浙江",
    area2 = "衢州"
    };
getRow(9,9)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 9,
    area1 = "浙江",
    area2 = "舟山"
    };
getRow(9,10)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 10,
    area1 = "浙江",
    area2 = "台州"
    };
getRow(9,11)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 11,
    area1 = "浙江",
    area2 = "丽水"
    };
getRow(10,1)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 1,
    area1 = "安徽",
    area2 = "合肥"
    };
getRow(10,2)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 2,
    area1 = "安徽",
    area2 = "芜湖"
    };
getRow(10,3)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 3,
    area1 = "安徽",
    area2 = "蚌埠"
    };
getRow(10,4)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 4,
    area1 = "安徽",
    area2 = "淮南"
    };
getRow(10,5)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 5,
    area1 = "安徽",
    area2 = "马鞍山"
    };
getRow(10,6)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 6,
    area1 = "安徽",
    area2 = "淮北"
    };
getRow(10,7)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 7,
    area1 = "安徽",
    area2 = "铜陵"
    };
getRow(10,8)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 8,
    area1 = "安徽",
    area2 = "安庆"
    };
getRow(10,9)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 9,
    area1 = "安徽",
    area2 = "黄山"
    };
getRow(10,10)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 10,
    area1 = "安徽",
    area2 = "滁州"
    };
getRow(10,11)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 11,
    area1 = "安徽",
    area2 = "阜阳"
    };
getRow(10,12)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 12,
    area1 = "安徽",
    area2 = "宿州"
    };
getRow(10,13)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 13,
    area1 = "安徽",
    area2 = "巢湖"
    };
getRow(10,14)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 14,
    area1 = "安徽",
    area2 = "六安"
    };
getRow(10,15)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 15,
    area1 = "安徽",
    area2 = "毫州"
    };
getRow(10,16)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 16,
    area1 = "安徽",
    area2 = "池州"
    };
getRow(10,17)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 17,
    area1 = "安徽",
    area2 = "宣城"
    };
getRow(11,1)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 1,
    area1 = "福建",
    area2 = "福州"
    };
getRow(11,2)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 2,
    area1 = "福建",
    area2 = "厦门"
    };
getRow(11,3)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 3,
    area1 = "福建",
    area2 = "莆田"
    };
getRow(11,4)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 4,
    area1 = "福建",
    area2 = "三明"
    };
getRow(11,5)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 5,
    area1 = "福建",
    area2 = "泉州"
    };
getRow(11,6)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 6,
    area1 = "福建",
    area2 = "漳州"
    };
getRow(11,7)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 7,
    area1 = "福建",
    area2 = "南平"
    };
getRow(11,8)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 8,
    area1 = "福建",
    area2 = "龙岩"
    };
getRow(11,9)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 9,
    area1 = "福建",
    area2 = "宁德"
    };
getRow(12,1)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 1,
    area1 = "江西",
    area2 = "南昌"
    };
getRow(12,2)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 2,
    area1 = "江西",
    area2 = "景德镇"
    };
getRow(12,3)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 3,
    area1 = "江西",
    area2 = "萍乡"
    };
getRow(12,4)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 4,
    area1 = "江西",
    area2 = "九江"
    };
getRow(12,5)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 5,
    area1 = "江西",
    area2 = "新余"
    };
getRow(12,6)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 6,
    area1 = "江西",
    area2 = "鹰潭"
    };
getRow(12,7)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 7,
    area1 = "江西",
    area2 = "赣州"
    };
getRow(12,8)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 8,
    area1 = "江西",
    area2 = "吉安"
    };
getRow(12,9)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 9,
    area1 = "江西",
    area2 = "宜春"
    };
getRow(12,10)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 10,
    area1 = "江西",
    area2 = "抚州"
    };
getRow(12,11)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 11,
    area1 = "江西",
    area2 = "上饶"
    };
getRow(13,1)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 1,
    area1 = "湖北",
    area2 = "武汉"
    };
getRow(13,2)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 2,
    area1 = "湖北",
    area2 = "黄石"
    };
getRow(13,3)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 3,
    area1 = "湖北",
    area2 = "襄樊"
    };
getRow(13,4)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 4,
    area1 = "湖北",
    area2 = "十堰"
    };
getRow(13,5)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 5,
    area1 = "湖北",
    area2 = "荆州"
    };
getRow(13,6)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 6,
    area1 = "湖北",
    area2 = "宜昌"
    };
getRow(13,7)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 7,
    area1 = "湖北",
    area2 = "荆门"
    };
getRow(13,8)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 8,
    area1 = "湖北",
    area2 = "鄂州"
    };
getRow(13,9)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 9,
    area1 = "湖北",
    area2 = "孝感"
    };
getRow(13,10)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 10,
    area1 = "湖北",
    area2 = "黄冈"
    };
getRow(13,11)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 11,
    area1 = "湖北",
    area2 = "咸宁"
    };
getRow(13,12)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 12,
    area1 = "湖北",
    area2 = "随州"
    };
getRow(13,13)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 13,
    area1 = "湖北",
    area2 = "恩施"
    };
getRow(14,1)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 1,
    area1 = "湖南",
    area2 = "长沙"
    };
getRow(14,2)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 2,
    area1 = "湖南",
    area2 = "株洲"
    };
getRow(14,3)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 3,
    area1 = "湖南",
    area2 = "湘潭"
    };
getRow(14,4)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 4,
    area1 = "湖南",
    area2 = "衡阳"
    };
getRow(14,5)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 5,
    area1 = "湖南",
    area2 = "邵阳"
    };
getRow(14,6)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 6,
    area1 = "湖南",
    area2 = "岳阳"
    };
getRow(14,7)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 7,
    area1 = "湖南",
    area2 = "常德"
    };
getRow(14,8)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 8,
    area1 = "湖南",
    area2 = "张家界"
    };
getRow(14,9)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 9,
    area1 = "湖南",
    area2 = "益阳"
    };
getRow(14,10)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 10,
    area1 = "湖南",
    area2 = "郴州"
    };
getRow(14,11)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 11,
    area1 = "湖南",
    area2 = "永州"
    };
getRow(14,12)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 12,
    area1 = "湖南",
    area2 = "怀化"
    };
getRow(14,13)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 13,
    area1 = "湖南",
    area2 = "娄底"
    };
getRow(14,14)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 14,
    area1 = "湖南",
    area2 = "湘西"
    };
getRow(15,1)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 1,
    area1 = "广东",
    area2 = "广州"
    };
getRow(15,2)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 2,
    area1 = "广东",
    area2 = "深圳"
    };
getRow(15,3)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 3,
    area1 = "广东",
    area2 = "珠海"
    };
getRow(15,4)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 4,
    area1 = "广东",
    area2 = "汕头"
    };
getRow(15,5)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 5,
    area1 = "广东",
    area2 = "韶关"
    };
getRow(15,6)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 6,
    area1 = "广东",
    area2 = "佛山"
    };
getRow(15,7)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 7,
    area1 = "广东",
    area2 = "江门"
    };
getRow(15,8)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 8,
    area1 = "广东",
    area2 = "湛江"
    };
getRow(15,9)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 9,
    area1 = "广东",
    area2 = "茂名"
    };
getRow(15,10)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 10,
    area1 = "广东",
    area2 = "肇庆"
    };
getRow(15,11)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 11,
    area1 = "广东",
    area2 = "惠州"
    };
getRow(15,12)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 12,
    area1 = "广东",
    area2 = "梅州"
    };
getRow(15,13)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 13,
    area1 = "广东",
    area2 = "汕尾"
    };
getRow(15,14)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 14,
    area1 = "广东",
    area2 = "河源"
    };
getRow(15,15)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 15,
    area1 = "广东",
    area2 = "阳江"
    };
getRow(15,16)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 16,
    area1 = "广东",
    area2 = "清远"
    };
getRow(15,17)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 17,
    area1 = "广东",
    area2 = "东莞"
    };
getRow(15,18)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 18,
    area1 = "广东",
    area2 = "中山"
    };
getRow(15,19)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 19,
    area1 = "广东",
    area2 = "潮州"
    };
getRow(15,20)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 20,
    area1 = "广东",
    area2 = "揭阳"
    };
getRow(15,21)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 21,
    area1 = "广东",
    area2 = "云浮"
    };
getRow(16,1)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 1,
    area1 = "广西",
    area2 = "南宁"
    };
getRow(16,2)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 2,
    area1 = "广西",
    area2 = "柳州"
    };
getRow(16,3)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 3,
    area1 = "广西",
    area2 = "桂林"
    };
getRow(16,4)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 4,
    area1 = "广西",
    area2 = "梧州"
    };
getRow(16,5)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 5,
    area1 = "广西",
    area2 = "北海"
    };
getRow(16,6)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 6,
    area1 = "广西",
    area2 = "防城港"
    };
getRow(16,7)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 7,
    area1 = "广西",
    area2 = "钦州"
    };
getRow(16,8)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 8,
    area1 = "广西",
    area2 = "贵港"
    };
getRow(16,9)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 9,
    area1 = "广西",
    area2 = "玉林"
    };
getRow(16,10)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 10,
    area1 = "广西",
    area2 = "百色"
    };
getRow(16,11)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 11,
    area1 = "广西",
    area2 = "贺州"
    };
getRow(16,12)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 12,
    area1 = "广西",
    area2 = "河池"
    };
getRow(16,13)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 13,
    area1 = "广西",
    area2 = "来宾"
    };
getRow(16,14)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 14,
    area1 = "广西",
    area2 = "崇左"
    };
getRow(17,1)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 1,
    area1 = "海南",
    area2 = "海口"
    };
getRow(17,2)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 2,
    area1 = "海南",
    area2 = "三亚"
    };
getRow(18,1)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 1,
    area1 = "山东",
    area2 = "济南"
    };
getRow(18,2)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 2,
    area1 = "山东",
    area2 = "青岛"
    };
getRow(18,3)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 3,
    area1 = "山东",
    area2 = "淄博"
    };
getRow(18,4)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 4,
    area1 = "山东",
    area2 = "枣庄"
    };
getRow(18,5)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 5,
    area1 = "山东",
    area2 = "东营"
    };
getRow(18,6)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 6,
    area1 = "山东",
    area2 = "烟台"
    };
getRow(18,7)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 7,
    area1 = "山东",
    area2 = "潍坊"
    };
getRow(18,8)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 8,
    area1 = "山东",
    area2 = "威海"
    };
getRow(18,9)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 9,
    area1 = "山东",
    area2 = "济宁"
    };
getRow(18,10)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 10,
    area1 = "山东",
    area2 = "泰安"
    };
getRow(18,11)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 11,
    area1 = "山东",
    area2 = "日照"
    };
getRow(18,12)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 12,
    area1 = "山东",
    area2 = "莱芜"
    };
getRow(18,13)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 13,
    area1 = "山东",
    area2 = "临沂"
    };
getRow(18,14)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 14,
    area1 = "山东",
    area2 = "德州"
    };
getRow(18,15)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 15,
    area1 = "山东",
    area2 = "聊城"
    };
getRow(18,16)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 16,
    area1 = "山东",
    area2 = "滨州"
    };
getRow(18,17)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 17,
    area1 = "山东",
    area2 = "菏泽"
    };
getRow(19,1)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 1,
    area1 = "河南",
    area2 = "郑州"
    };
getRow(19,2)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 2,
    area1 = "河南",
    area2 = "开封"
    };
getRow(19,3)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 3,
    area1 = "河南",
    area2 = "洛阳"
    };
getRow(19,4)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 4,
    area1 = "河南",
    area2 = "平顶山"
    };
getRow(19,5)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 5,
    area1 = "河南",
    area2 = "焦作"
    };
getRow(19,6)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 6,
    area1 = "河南",
    area2 = "鹤壁"
    };
getRow(19,7)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 7,
    area1 = "河南",
    area2 = "新乡"
    };
getRow(19,8)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 8,
    area1 = "河南",
    area2 = "安阳"
    };
getRow(19,9)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 9,
    area1 = "河南",
    area2 = "濮阳"
    };
getRow(19,10)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 10,
    area1 = "河南",
    area2 = "许昌"
    };
getRow(19,11)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 11,
    area1 = "河南",
    area2 = "漯河"
    };
getRow(19,12)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 12,
    area1 = "河南",
    area2 = "三门峡"
    };
getRow(19,13)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 13,
    area1 = "河南",
    area2 = "南阳"
    };
getRow(19,14)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 14,
    area1 = "河南",
    area2 = "商丘"
    };
getRow(19,15)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 15,
    area1 = "河南",
    area2 = "信阳"
    };
getRow(19,16)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 16,
    area1 = "河南",
    area2 = "周口"
    };
getRow(19,17)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 17,
    area1 = "河南",
    area2 = "驻马店"
    };
getRow(20,1)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 1,
    area1 = "河北",
    area2 = "石家庄"
    };
getRow(20,2)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 2,
    area1 = "河北",
    area2 = "唐山"
    };
getRow(20,3)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 3,
    area1 = "河北",
    area2 = "秦皇岛"
    };
getRow(20,4)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 4,
    area1 = "河北",
    area2 = "邯郸"
    };
getRow(20,5)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 5,
    area1 = "河北",
    area2 = "邢台"
    };
getRow(20,6)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 6,
    area1 = "河北",
    area2 = "保定"
    };
getRow(20,7)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 7,
    area1 = "河北",
    area2 = "张家口"
    };
getRow(20,8)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 8,
    area1 = "河北",
    area2 = "承德"
    };
getRow(20,9)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 9,
    area1 = "河北",
    area2 = "沧州"
    };
getRow(20,10)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 10,
    area1 = "河北",
    area2 = "廊坊"
    };
getRow(20,11)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 11,
    area1 = "河北",
    area2 = "衡水"
    };
getRow(21,1)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 1,
    area1 = "山西",
    area2 = "太原"
    };
getRow(21,2)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 2,
    area1 = "山西",
    area2 = "大同"
    };
getRow(21,3)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 3,
    area1 = "山西",
    area2 = "阳泉"
    };
getRow(21,4)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 4,
    area1 = "山西",
    area2 = "长治"
    };
getRow(21,5)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 5,
    area1 = "山西",
    area2 = "晋城"
    };
getRow(21,6)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 6,
    area1 = "山西",
    area2 = "朔州"
    };
getRow(21,7)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 7,
    area1 = "山西",
    area2 = "晋中"
    };
getRow(21,8)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 8,
    area1 = "山西",
    area2 = "运城"
    };
getRow(21,9)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 9,
    area1 = "山西",
    area2 = "忻州"
    };
getRow(21,10)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 10,
    area1 = "山西",
    area2 = "临汾"
    };
getRow(21,11)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 11,
    area1 = "山西",
    area2 = "吕梁"
    };
getRow(22,1)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 1,
    area1 = "内蒙古",
    area2 = "呼和浩特"
    };
getRow(22,2)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 2,
    area1 = "内蒙古",
    area2 = "包头"
    };
getRow(22,3)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 3,
    area1 = "内蒙古",
    area2 = "乌海"
    };
getRow(22,4)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 4,
    area1 = "内蒙古",
    area2 = "赤峰"
    };
getRow(22,5)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 5,
    area1 = "内蒙古",
    area2 = "通辽"
    };
getRow(22,6)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 6,
    area1 = "内蒙古",
    area2 = "鄂尔多斯"
    };
getRow(22,7)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 7,
    area1 = "内蒙古",
    area2 = "呼伦贝尔"
    };
getRow(22,8)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 8,
    area1 = "内蒙古",
    area2 = "巴彦淖尔"
    };
getRow(22,9)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 9,
    area1 = "内蒙古",
    area2 = "乌兰察布"
    };
getRow(22,10)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 10,
    area1 = "内蒙古",
    area2 = "兴安"
    };
getRow(22,11)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 11,
    area1 = "内蒙古",
    area2 = "锡林郭勒"
    };
getRow(22,12)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 12,
    area1 = "内蒙古",
    area2 = "阿拉善"
    };
getRow(23,1)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 1,
    area1 = "辽宁",
    area2 = "沈阳"
    };
getRow(23,2)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 2,
    area1 = "辽宁",
    area2 = "大连"
    };
getRow(23,3)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 3,
    area1 = "辽宁",
    area2 = "鞍山"
    };
getRow(23,4)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 4,
    area1 = "辽宁",
    area2 = "抚顺"
    };
getRow(23,5)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 5,
    area1 = "辽宁",
    area2 = "本溪"
    };
getRow(23,6)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 6,
    area1 = "辽宁",
    area2 = "丹东"
    };
getRow(23,7)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 7,
    area1 = "辽宁",
    area2 = "锦州"
    };
getRow(23,8)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 8,
    area1 = "辽宁",
    area2 = "营口"
    };
getRow(23,9)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 9,
    area1 = "辽宁",
    area2 = "阜新"
    };
getRow(23,10)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 10,
    area1 = "辽宁",
    area2 = "辽阳"
    };
getRow(23,11)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 11,
    area1 = "辽宁",
    area2 = "盘锦"
    };
getRow(23,12)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 12,
    area1 = "辽宁",
    area2 = "铁岭"
    };
getRow(23,13)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 13,
    area1 = "辽宁",
    area2 = "朝阳"
    };
getRow(23,14)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 14,
    area1 = "辽宁",
    area2 = "葫芦岛"
    };
getRow(24,1)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 1,
    area1 = "吉林",
    area2 = "长春"
    };
getRow(24,2)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 2,
    area1 = "吉林",
    area2 = "吉林"
    };
getRow(24,3)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 3,
    area1 = "吉林",
    area2 = "四平"
    };
getRow(24,4)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 4,
    area1 = "吉林",
    area2 = "辽源"
    };
getRow(24,5)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 5,
    area1 = "吉林",
    area2 = "通化"
    };
getRow(24,6)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 6,
    area1 = "吉林",
    area2 = "白山"
    };
getRow(24,7)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 7,
    area1 = "吉林",
    area2 = "松原"
    };
getRow(24,8)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 8,
    area1 = "吉林",
    area2 = "白城"
    };
getRow(24,9)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 9,
    area1 = "吉林",
    area2 = "延边"
    };
getRow(25,1)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 1,
    area1 = "黑龙江",
    area2 = "哈尔滨"
    };
getRow(25,2)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 2,
    area1 = "黑龙江",
    area2 = "齐齐哈尔"
    };
getRow(25,3)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 3,
    area1 = "黑龙江",
    area2 = "鸡西"
    };
getRow(25,4)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 4,
    area1 = "黑龙江",
    area2 = "鹤岗"
    };
getRow(25,5)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 5,
    area1 = "黑龙江",
    area2 = "双鸭山"
    };
getRow(25,6)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 6,
    area1 = "黑龙江",
    area2 = "大庆"
    };
getRow(25,7)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 7,
    area1 = "黑龙江",
    area2 = "伊春"
    };
getRow(25,8)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 8,
    area1 = "黑龙江",
    area2 = "佳木斯"
    };
getRow(25,9)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 9,
    area1 = "黑龙江",
    area2 = "七台河"
    };
getRow(25,10)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 10,
    area1 = "黑龙江",
    area2 = "牡丹江"
    };
getRow(25,11)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 11,
    area1 = "黑龙江",
    area2 = "黑河"
    };
getRow(25,12)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 12,
    area1 = "黑龙江",
    area2 = "绥化"
    };
getRow(26,1)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 1,
    area1 = "四川",
    area2 = "成都"
    };
getRow(26,2)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 2,
    area1 = "四川",
    area2 = "绵阳"
    };
getRow(26,3)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 3,
    area1 = "四川",
    area2 = "自贡"
    };
getRow(26,4)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 4,
    area1 = "四川",
    area2 = "攀枝花"
    };
getRow(26,5)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 5,
    area1 = "四川",
    area2 = "泸州"
    };
getRow(26,6)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 6,
    area1 = "四川",
    area2 = "德阳"
    };
getRow(26,7)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 7,
    area1 = "四川",
    area2 = "广元"
    };
getRow(26,8)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 8,
    area1 = "四川",
    area2 = "遂宁"
    };
getRow(26,9)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 9,
    area1 = "四川",
    area2 = "内江"
    };
getRow(26,10)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 10,
    area1 = "四川",
    area2 = "乐山"
    };
getRow(26,11)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 11,
    area1 = "四川",
    area2 = "资阳"
    };
getRow(26,12)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 12,
    area1 = "四川",
    area2 = "宜宾"
    };
getRow(26,13)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 13,
    area1 = "四川",
    area2 = "南充"
    };
getRow(26,14)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 14,
    area1 = "四川",
    area2 = "达州"
    };
getRow(26,15)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 15,
    area1 = "四川",
    area2 = "雅安"
    };
getRow(26,16)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 16,
    area1 = "四川",
    area2 = "阿坝"
    };
getRow(26,17)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 17,
    area1 = "四川",
    area2 = "甘孜"
    };
getRow(26,18)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 18,
    area1 = "四川",
    area2 = "凉山"
    };
getRow(26,19)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 19,
    area1 = "四川",
    area2 = "广安"
    };
getRow(26,20)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 20,
    area1 = "四川",
    area2 = "巴中"
    };
getRow(26,21)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 21,
    area1 = "四川",
    area2 = "眉山"
    };
getRow(27,1)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 1,
    area1 = "贵州",
    area2 = "贵阳"
    };
getRow(27,2)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 2,
    area1 = "贵州",
    area2 = "六盘水"
    };
getRow(27,3)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 3,
    area1 = "贵州",
    area2 = "遵义"
    };
getRow(27,4)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 4,
    area1 = "贵州",
    area2 = "安顺"
    };
getRow(27,5)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 5,
    area1 = "贵州",
    area2 = "铜仁"
    };
getRow(27,6)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 6,
    area1 = "贵州",
    area2 = "毕节"
    };
getRow(27,7)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 7,
    area1 = "贵州",
    area2 = "黔南"
    };
getRow(28,1)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 1,
    area1 = "云南",
    area2 = "昆明"
    };
getRow(28,2)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 2,
    area1 = "云南",
    area2 = "曲靖"
    };
getRow(28,3)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 3,
    area1 = "云南",
    area2 = "玉溪"
    };
getRow(28,4)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 4,
    area1 = "云南",
    area2 = "宝山"
    };
getRow(28,5)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 5,
    area1 = "云南",
    area2 = "昭通"
    };
getRow(28,6)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 6,
    area1 = "云南",
    area2 = "丽江"
    };
getRow(28,7)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 7,
    area1 = "云南",
    area2 = "普洱"
    };
getRow(28,8)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 8,
    area1 = "云南",
    area2 = "临沧"
    };
getRow(28,9)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 9,
    area1 = "云南",
    area2 = "文山"
    };
getRow(28,10)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 10,
    area1 = "云南",
    area2 = "红河"
    };
getRow(28,11)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 11,
    area1 = "云南",
    area2 = "西双版纳"
    };
getRow(29,1)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 1,
    area1 = "西藏",
    area2 = "拉萨"
    };
getRow(29,2)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 2,
    area1 = "西藏",
    area2 = "昌都"
    };
getRow(29,3)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 3,
    area1 = "西藏",
    area2 = "山南"
    };
getRow(29,4)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 4,
    area1 = "西藏",
    area2 = "日喀则"
    };
getRow(29,5)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 5,
    area1 = "西藏",
    area2 = "那曲"
    };
getRow(29,6)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 6,
    area1 = "西藏",
    area2 = "阿里"
    };
getRow(29,7)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 7,
    area1 = "西藏",
    area2 = "林芝"
    };
getRow(30,1)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 1,
    area1 = "陕西",
    area2 = "西安"
    };
getRow(30,2)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 2,
    area1 = "陕西",
    area2 = "铜川"
    };
getRow(30,3)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 3,
    area1 = "陕西",
    area2 = "宝鸡"
    };
getRow(30,4)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 4,
    area1 = "陕西",
    area2 = "咸阳"
    };
getRow(30,5)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 5,
    area1 = "陕西",
    area2 = "渭南"
    };
getRow(30,6)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 6,
    area1 = "陕西",
    area2 = "延安"
    };
getRow(30,7)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 7,
    area1 = "陕西",
    area2 = "汉中"
    };
getRow(30,8)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 8,
    area1 = "陕西",
    area2 = "榆林"
    };
getRow(30,9)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 9,
    area1 = "陕西",
    area2 = "安康"
    };
getRow(30,10)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 10,
    area1 = "陕西",
    area2 = "商洛"
    };
getRow(31,1)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 1,
    area1 = "甘肃",
    area2 = "兰州"
    };
getRow(31,2)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 2,
    area1 = "甘肃",
    area2 = "嘉峪关"
    };
getRow(31,3)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 3,
    area1 = "甘肃",
    area2 = "金昌"
    };
getRow(31,4)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 4,
    area1 = "甘肃",
    area2 = "白银"
    };
getRow(31,5)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 5,
    area1 = "甘肃",
    area2 = "天水"
    };
getRow(31,6)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 6,
    area1 = "甘肃",
    area2 = "威武"
    };
getRow(31,7)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 7,
    area1 = "甘肃",
    area2 = "张掖"
    };
getRow(31,8)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 8,
    area1 = "甘肃",
    area2 = "平凉"
    };
getRow(31,9)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 9,
    area1 = "甘肃",
    area2 = "酒泉"
    };
getRow(31,10)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 10,
    area1 = "甘肃",
    area2 = "庆阳"
    };
getRow(31,11)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 11,
    area1 = "甘肃",
    area2 = "定西"
    };
getRow(31,12)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 12,
    area1 = "甘肃",
    area2 = "陇南"
    };
getRow(31,13)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 13,
    area1 = "甘肃",
    area2 = "临夏"
    };
getRow(31,14)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 14,
    area1 = "甘肃",
    area2 = "甘南"
    };
getRow(32,1)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 1,
    area1 = "青海",
    area2 = "西宁"
    };
getRow(32,2)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 2,
    area1 = "青海",
    area2 = "海东"
    };
getRow(32,3)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 3,
    area1 = "青海",
    area2 = "海北"
    };
getRow(32,4)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 4,
    area1 = "青海",
    area2 = "黄南"
    };
getRow(32,5)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 5,
    area1 = "青海",
    area2 = "果洛"
    };
getRow(32,6)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 6,
    area1 = "青海",
    area2 = "玉树"
    };
getRow(32,7)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 7,
    area1 = "青海",
    area2 = "海西"
    };
getRow(32,8)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 8,
    area1 = "青海",
    area2 = "海南"
    };
getRow(33,1)->
    #identity_areaCfg {
    id1 = 33,
    id2 = 1,
    area1 = "宁夏",
    area2 = "银川"
    };
getRow(33,2)->
    #identity_areaCfg {
    id1 = 33,
    id2 = 2,
    area1 = "宁夏",
    area2 = "石嘴山"
    };
getRow(33,3)->
    #identity_areaCfg {
    id1 = 33,
    id2 = 3,
    area1 = "宁夏",
    area2 = "吴忠"
    };
getRow(33,4)->
    #identity_areaCfg {
    id1 = 33,
    id2 = 4,
    area1 = "宁夏",
    area2 = "固原"
    };
getRow(33,5)->
    #identity_areaCfg {
    id1 = 33,
    id2 = 5,
    area1 = "宁夏",
    area2 = "中卫"
    };
getRow(34,1)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 1,
    area1 = "新疆",
    area2 = "乌鲁木齐"
    };
getRow(34,2)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 2,
    area1 = "新疆",
    area2 = "克拉玛依"
    };
getRow(34,3)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 3,
    area1 = "新疆",
    area2 = "吐鲁番"
    };
getRow(34,4)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 4,
    area1 = "新疆",
    area2 = "哈密"
    };
getRow(34,5)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 5,
    area1 = "新疆",
    area2 = "和田"
    };
getRow(34,6)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 6,
    area1 = "新疆",
    area2 = "阿克苏"
    };
getRow(34,7)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 7,
    area1 = "新疆",
    area2 = "喀什"
    };
getRow(34,8)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 8,
    area1 = "新疆",
    area2 = "克孜勒苏柯尔克孜"
    };
getRow(34,9)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 9,
    area1 = "新疆",
    area2 = "巴音郭楞蒙古"
    };
getRow(34,10)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 10,
    area1 = "新疆",
    area2 = "昌吉"
    };
getRow(34,11)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 11,
    area1 = "新疆",
    area2 = "伊犁哈萨克"
    };
getRow(34,12)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 12,
    area1 = "新疆",
    area2 = "塔城"
    };
getRow(34,13)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 13,
    area1 = "新疆",
    area2 = "阿勒泰"
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
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
    {3,1},
    {4,1},
    {5,1},
    {6,1},
    {7,1},
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
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {9,5},
    {9,6},
    {9,7},
    {9,8},
    {9,9},
    {9,10},
    {9,11},
    {10,1},
    {10,2},
    {10,3},
    {10,4},
    {10,5},
    {10,6},
    {10,7},
    {10,8},
    {10,9},
    {10,10},
    {10,11},
    {10,12},
    {10,13},
    {10,14},
    {10,15},
    {10,16},
    {10,17},
    {11,1},
    {11,2},
    {11,3},
    {11,4},
    {11,5},
    {11,6},
    {11,7},
    {11,8},
    {11,9},
    {12,1},
    {12,2},
    {12,3},
    {12,4},
    {12,5},
    {12,6},
    {12,7},
    {12,8},
    {12,9},
    {12,10},
    {12,11},
    {13,1},
    {13,2},
    {13,3},
    {13,4},
    {13,5},
    {13,6},
    {13,7},
    {13,8},
    {13,9},
    {13,10},
    {13,11},
    {13,12},
    {13,13},
    {14,1},
    {14,2},
    {14,3},
    {14,4},
    {14,5},
    {14,6},
    {14,7},
    {14,8},
    {14,9},
    {14,10},
    {14,11},
    {14,12},
    {14,13},
    {14,14},
    {15,1},
    {15,2},
    {15,3},
    {15,4},
    {15,5},
    {15,6},
    {15,7},
    {15,8},
    {15,9},
    {15,10},
    {15,11},
    {15,12},
    {15,13},
    {15,14},
    {15,15},
    {15,16},
    {15,17},
    {15,18},
    {15,19},
    {15,20},
    {15,21},
    {16,1},
    {16,2},
    {16,3},
    {16,4},
    {16,5},
    {16,6},
    {16,7},
    {16,8},
    {16,9},
    {16,10},
    {16,11},
    {16,12},
    {16,13},
    {16,14},
    {17,1},
    {17,2},
    {18,1},
    {18,2},
    {18,3},
    {18,4},
    {18,5},
    {18,6},
    {18,7},
    {18,8},
    {18,9},
    {18,10},
    {18,11},
    {18,12},
    {18,13},
    {18,14},
    {18,15},
    {18,16},
    {18,17},
    {19,1},
    {19,2},
    {19,3},
    {19,4},
    {19,5},
    {19,6},
    {19,7},
    {19,8},
    {19,9},
    {19,10},
    {19,11},
    {19,12},
    {19,13},
    {19,14},
    {19,15},
    {19,16},
    {19,17},
    {20,1},
    {20,2},
    {20,3},
    {20,4},
    {20,5},
    {20,6},
    {20,7},
    {20,8},
    {20,9},
    {20,10},
    {20,11},
    {21,1},
    {21,2},
    {21,3},
    {21,4},
    {21,5},
    {21,6},
    {21,7},
    {21,8},
    {21,9},
    {21,10},
    {21,11},
    {22,1},
    {22,2},
    {22,3},
    {22,4},
    {22,5},
    {22,6},
    {22,7},
    {22,8},
    {22,9},
    {22,10},
    {22,11},
    {22,12},
    {23,1},
    {23,2},
    {23,3},
    {23,4},
    {23,5},
    {23,6},
    {23,7},
    {23,8},
    {23,9},
    {23,10},
    {23,11},
    {23,12},
    {23,13},
    {23,14},
    {24,1},
    {24,2},
    {24,3},
    {24,4},
    {24,5},
    {24,6},
    {24,7},
    {24,8},
    {24,9},
    {25,1},
    {25,2},
    {25,3},
    {25,4},
    {25,5},
    {25,6},
    {25,7},
    {25,8},
    {25,9},
    {25,10},
    {25,11},
    {25,12},
    {26,1},
    {26,2},
    {26,3},
    {26,4},
    {26,5},
    {26,6},
    {26,7},
    {26,8},
    {26,9},
    {26,10},
    {26,11},
    {26,12},
    {26,13},
    {26,14},
    {26,15},
    {26,16},
    {26,17},
    {26,18},
    {26,19},
    {26,20},
    {26,21},
    {27,1},
    {27,2},
    {27,3},
    {27,4},
    {27,5},
    {27,6},
    {27,7},
    {28,1},
    {28,2},
    {28,3},
    {28,4},
    {28,5},
    {28,6},
    {28,7},
    {28,8},
    {28,9},
    {28,10},
    {28,11},
    {29,1},
    {29,2},
    {29,3},
    {29,4},
    {29,5},
    {29,6},
    {29,7},
    {30,1},
    {30,2},
    {30,3},
    {30,4},
    {30,5},
    {30,6},
    {30,7},
    {30,8},
    {30,9},
    {30,10},
    {31,1},
    {31,2},
    {31,3},
    {31,4},
    {31,5},
    {31,6},
    {31,7},
    {31,8},
    {31,9},
    {31,10},
    {31,11},
    {31,12},
    {31,13},
    {31,14},
    {32,1},
    {32,2},
    {32,3},
    {32,4},
    {32,5},
    {32,6},
    {32,7},
    {32,8},
    {33,1},
    {33,2},
    {33,3},
    {33,4},
    {33,5},
    {34,1},
    {34,2},
    {34,3},
    {34,4},
    {34,5},
    {34,6},
    {34,7},
    {34,8},
    {34,9},
    {34,10},
    {34,11},
    {34,12},
    {34,13}
    ].

get1KeyList()->[
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
    30,
    31,
    32,
    33,
    34
    ].

get2KeyList(1)->[
    1
    ];
get2KeyList(2)->[
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
    22
    ];
get2KeyList(3)->[
    1
    ];
get2KeyList(4)->[
    1
    ];
get2KeyList(5)->[
    1
    ];
get2KeyList(6)->[
    1
    ];
get2KeyList(7)->[
    1
    ];
get2KeyList(8)->[
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
    13
    ];
get2KeyList(9)->[
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
    11
    ];
get2KeyList(10)->[
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
    17
    ];
get2KeyList(11)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(12)->[
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
    11
    ];
get2KeyList(13)->[
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
    13
    ];
get2KeyList(14)->[
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
    14
    ];
get2KeyList(15)->[
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
    21
    ];
get2KeyList(16)->[
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
    14
    ];
get2KeyList(17)->[
    1,
    2
    ];
get2KeyList(18)->[
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
    17
    ];
get2KeyList(19)->[
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
    17
    ];
get2KeyList(20)->[
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
    11
    ];
get2KeyList(21)->[
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
    11
    ];
get2KeyList(22)->[
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
    12
    ];
get2KeyList(23)->[
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
    14
    ];
get2KeyList(24)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(25)->[
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
    12
    ];
get2KeyList(26)->[
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
    21
    ];
get2KeyList(27)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(28)->[
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
    11
    ];
get2KeyList(29)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(30)->[
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
get2KeyList(31)->[
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
    14
    ];
get2KeyList(32)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ];
get2KeyList(33)->[
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(34)->[
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
    13
    ];
get2KeyList(_)->[].

