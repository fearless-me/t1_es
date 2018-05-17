%% coding: latin-1
%%: 实现
-module(cfg_allplayerquestion_cht).
-compile(export_all).
-include("cfg_allplayerquestion.hrl").


getRow(1)->
    #allplayerquestionCfg {
    iD = 1,
    question = "女朋友出轨了，你应该？",
    answer1 = "原谅她",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(2)->
    #allplayerquestionCfg {
    iD = 2,
    question = "小明给小红表白了，谁给他的勇气？",
    answer1 = "梁静茹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(3)->
    #allplayerquestionCfg {
    iD = 3,
    question = "花是米的妈妈，蝶是花的什么？",
    answer1 = "恋人",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(4)->
    #allplayerquestionCfg {
    iD = 4,
    question = "狼来了（一种水果）？",
    answer1 = "杨桃",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(5)->
    #allplayerquestionCfg {
    iD = 5,
    question = "路飞是哪一部动漫的角色",
    answer1 = "海贼王",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(6)->
    #allplayerquestionCfg {
    iD = 6,
    question = "什么马可以下海？",
    answer1 = "海马",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(7)->
    #allplayerquestionCfg {
    iD = 7,
    question = "一年的司机是新司机，十年的司机呢？",
    answer1 = "老司机",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(8)->
    #allplayerquestionCfg {
    iD = 8,
    question = "如果原谅有颜色，那一定是？",
    answer1 = "绿色",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(9)->
    #allplayerquestionCfg {
    iD = 9,
    question = "小明生日是29号，他不可能生于几月？",
    answer1 = "二月",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(10)->
    #allplayerquestionCfg {
    iD = 10,
    question = "杨贵妃看到什么会笑？",
    answer1 = "荔枝",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(11)->
    #allplayerquestionCfg {
    iD = 11,
    question = "孙悟空的座驾是什么？",
    answer1 = "筋斗云",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(12)->
    #allplayerquestionCfg {
    iD = 12,
    question = "俗称四不像的是？",
    answer1 = "麋鹿",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(13)->
    #allplayerquestionCfg {
    iD = 13,
    question = "白求恩是哪国人",
    answer1 = "加拿大",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(14)->
    #allplayerquestionCfg {
    iD = 14,
    question = "游戏中斗士使用什么武器？",
    answer1 = "双手剑",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(15)->
    #allplayerquestionCfg {
    iD = 15,
    question = "游戏中守卫由什么基础职业转职而来？",
    answer1 = "战士",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(16)->
    #allplayerquestionCfg {
    iD = 16,
    question = "游戏中巫师由什么基础职业转职而来？",
    answer1 = "法师",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(17)->
    #allplayerquestionCfg {
    iD = 17,
    question = "游戏中流氓由什么基础职业转职而来？",
    answer1 = "刺客",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(18)->
    #allplayerquestionCfg {
    iD = 18,
    question = "世界天气的推动力是什么？",
    answer1 = "太阳",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(19)->
    #allplayerquestionCfg {
    iD = 19,
    question = "蛔虫生活在人体内属于什么关系？",
    answer1 = "寄生",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(20)->
    #allplayerquestionCfg {
    iD = 20,
    question = "第一架望远镜是由谁发明？",
    answer1 = "伽利略",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(21)->
    #allplayerquestionCfg {
    iD = 21,
    question = "边缘比中央厚的透镜叫？",
    answer1 = "凹透镜",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(22)->
    #allplayerquestionCfg {
    iD = 22,
    question = "边缘比中央薄的透镜叫？",
    answer1 = "凸透镜",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(23)->
    #allplayerquestionCfg {
    iD = 23,
    question = "天然气主要成分是？",
    answer1 = "甲烷",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(24)->
    #allplayerquestionCfg {
    iD = 24,
    question = "秦始皇兵马俑是在中国的哪个省发掘的？",
    answer1 = "陕西",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(25)->
    #allplayerquestionCfg {
    iD = 25,
    question = "我们通常用来指代飞碟等不明飞行物的英文缩写是什么？",
    answer1 = "UFO",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(26)->
    #allplayerquestionCfg {
    iD = 26,
    question = "佛教中高僧经过火化后所留下的结晶体叫什么？",
    answer1 = "舍利子",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(27)->
    #allplayerquestionCfg {
    iD = 27,
    question = "老北京居民居住的院落式组合建筑一般被叫做什么？",
    answer1 = "四合院",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(28)->
    #allplayerquestionCfg {
    iD = 28,
    question = "（脑筋急转弯）什么人始终不敢洗澡？",
    answer1 = "泥人",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(29)->
    #allplayerquestionCfg {
    iD = 29,
    question = "小说《封神演义》中，商纣王宠妃是谁？",
    answer1 = "妲己",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(30)->
    #allplayerquestionCfg {
    iD = 30,
    question = "著名的“自由女神像”坐落于美国的哪个城市？",
    answer1 = "纽约",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(31)->
    #allplayerquestionCfg {
    iD = 31,
    question = "与刘德华、张学友、郭富城合称为香港四大天王的是谁？",
    answer1 = "黎明",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(32)->
    #allplayerquestionCfg {
    iD = 32,
    question = "与黎明、张学友、郭富城合称为香港四大天王的是谁？",
    answer1 = "刘德华",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(33)->
    #allplayerquestionCfg {
    iD = 33,
    question = "与刘德华、黎明、郭富城合称为香港四大天王的是谁？",
    answer1 = "张学友",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(34)->
    #allplayerquestionCfg {
    iD = 34,
    question = "与刘德华、张学友、黎明合称为香港四大天王的是谁？",
    answer1 = "郭富城",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(35)->
    #allplayerquestionCfg {
    iD = 35,
    question = "欧洲的哪个城市被世界公认为雾都？",
    answer1 = "伦敦",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(36)->
    #allplayerquestionCfg {
    iD = 36,
    question = "中国古代四大发明除了指南针、造纸术、火药还有？",
    answer1 = "印刷术",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(37)->
    #allplayerquestionCfg {
    iD = 37,
    question = "中国古代四大发明除了印刷术、造纸术、火药还有？",
    answer1 = "指南针",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(38)->
    #allplayerquestionCfg {
    iD = 38,
    question = "中国古代四大发明除了指南针、印刷术、火药还有？",
    answer1 = "造纸术",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(39)->
    #allplayerquestionCfg {
    iD = 39,
    question = "中国古代四大发明除了指南针、造纸术、印刷术还有？",
    answer1 = "火药",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(40)->
    #allplayerquestionCfg {
    iD = 40,
    question = "溥仪是我国哪个朝代最后一个皇帝？",
    answer1 = "清朝",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(41)->
    #allplayerquestionCfg {
    iD = 41,
    question = "成语“攻其不备”的下句是什么？",
    answer1 = "出其不意",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(42)->
    #allplayerquestionCfg {
    iD = 42,
    question = "游戏中新手的出生地图是？",
    answer1 = "阿克勒港口",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(43)->
    #allplayerquestionCfg {
    iD = 43,
    question = "黄山在我国的什么省份？",
    answer1 = "安徽",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(44)->
    #allplayerquestionCfg {
    iD = 44,
    question = "DNA全称是什么？",
    answer1 = "脱氧核糖核酸",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(45)->
    #allplayerquestionCfg {
    iD = 45,
    question = "世界上最小的国家是哪个？",
    answer1 = "梵蒂冈",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(46)->
    #allplayerquestionCfg {
    iD = 46,
    question = "引起煤气中毒的主要气体是？",
    answer1 = "一氧化碳",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(47)->
    #allplayerquestionCfg {
    iD = 47,
    question = "大象最怕什么动物？",
    answer1 = "老鼠",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(48)->
    #allplayerquestionCfg {
    iD = 48,
    question = "最大的鲸鱼是？",
    answer1 = "蓝鲸",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(49)->
    #allplayerquestionCfg {
    iD = 49,
    question = "珊瑚是动物还是植物？",
    answer1 = "动物",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(50)->
    #allplayerquestionCfg {
    iD = 50,
    question = "什么牛有三只角？",
    answer1 = "犀牛",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(51)->
    #allplayerquestionCfg {
    iD = 51,
    question = "雪橇三傻除了阿拉斯加、萨摩耶还有？",
    answer1 = "哈士奇",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(52)->
    #allplayerquestionCfg {
    iD = 52,
    question = "雪橇三傻除了哈士奇、阿拉斯加还有？",
    answer1 = "萨摩耶",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(53)->
    #allplayerquestionCfg {
    iD = 53,
    question = "导盲犬一般是什么品种？",
    answer1 = "拉布拉多",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(54)->
    #allplayerquestionCfg {
    iD = 54,
    question = "女朋友生病了应该多喝什么？",
    answer1 = "热水",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(55)->
    #allplayerquestionCfg {
    iD = 55,
    question = "熊猫是哪一个省的特有动物？",
    answer1 = "四川",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(56)->
    #allplayerquestionCfg {
    iD = 56,
    question = "成都是哪一个省的省会？",
    answer1 = "四川",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(57)->
    #allplayerquestionCfg {
    iD = 57,
    question = "熊猫最喜欢吃什么？",
    answer1 = "竹子",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(58)->
    #allplayerquestionCfg {
    iD = 58,
    question = "什么鱼可以上岸行走？",
    answer1 = "鳄鱼",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(59)->
    #allplayerquestionCfg {
    iD = 59,
    question = "什么鱼有八条腿？",
    answer1 = "章鱼",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(60)->
    #allplayerquestionCfg {
    iD = 60,
    question = "《水手》这首老歌，原唱是谁？",
    answer1 = "郑智化",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(61)->
    #allplayerquestionCfg {
    iD = 61,
    question = "划船不用浆，全靠什么？",
    answer1 = "浪",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(62)->
    #allplayerquestionCfg {
    iD = 62,
    question = "电影《战狼2》的导演是谁？",
    answer1 = "吴京",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(63)->
    #allplayerquestionCfg {
    iD = 63,
    question = "中国内地首家迪斯尼乐园是在哪的？",
    answer1 = "上海",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(64)->
    #allplayerquestionCfg {
    iD = 64,
    question = "大头大头，下雨不愁，人家有伞，我有什么？",
    answer1 = "大头",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(65)->
    #allplayerquestionCfg {
    iD = 65,
    question = "以双乳为目，肚脐为口的是哪位神话人物？",
    answer1 = "刑天",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(66)->
    #allplayerquestionCfg {
    iD = 66,
    question = "葫芦娃救爷爷，下一句是什么？",
    answer1 = "一个一个送",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(67)->
    #allplayerquestionCfg {
    iD = 67,
    question = "“亲亲我吧爱我吧”翻译成数字号码是什么？",
    answer1 = "7758258",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(68)->
    #allplayerquestionCfg {
    iD = 68,
    question = "衣带渐宽终不悔的下一句是什么？",
    answer1 = "为伊消得人憔悴",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(69)->
    #allplayerquestionCfg {
    iD = 69,
    question = "劳其筋骨，饿其体肤的上一句是什么？",
    answer1 = "必先苦其心志",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(70)->
    #allplayerquestionCfg {
    iD = 70,
    question = "《出师表》的作者是谁？",
    answer1 = "诸葛亮",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(71)->
    #allplayerquestionCfg {
    iD = 71,
    question = "宁采臣的师傅是谁？",
    answer1 = "燕赤霞",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(72)->
    #allplayerquestionCfg {
    iD = 72,
    question = "李小龙是哪一年去世的？",
    answer1 = "1973",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(73)->
    #allplayerquestionCfg {
    iD = 73,
    question = "称为“山城”的是中国的哪儿？",
    answer1 = "重庆",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(74)->
    #allplayerquestionCfg {
    iD = 74,
    question = "唐诗《枫桥夜泊》中提到的寺庙叫什么？",
    answer1 = "寒山寺",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(75)->
    #allplayerquestionCfg {
    iD = 75,
    question = "扶不起的阿斗指的是谁？",
    answer1 = "刘禅",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(76)->
    #allplayerquestionCfg {
    iD = 76,
    question = "能够加血的职业是什么",
    answer1 = "修士",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(77)->
    #allplayerquestionCfg {
    iD = 77,
    question = "四大歌神除了张学友，郭富城，黎明之外，还有谁",
    answer1 = "刘德华",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(78)->
    #allplayerquestionCfg {
    iD = 78,
    question = "本游戏当中初始职业除了战士、法师还有？",
    answer1 = "刺客",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(79)->
    #allplayerquestionCfg {
    iD = 79,
    question = "被窝里放屁-打一歇后语",
    answer1 = "能文能武",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(80)->
    #allplayerquestionCfg {
    iD = 80,
    question = "\"我从未见过如此厚颜无耻之人\",此中，无耻之人是谁",
    answer1 = "王朗",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(81)->
    #allplayerquestionCfg {
    iD = 81,
    question = "谁的口头禅是”你会freestyle吗？”",
    answer1 = "吴亦凡",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(82)->
    #allplayerquestionCfg {
    iD = 82,
    question = "谁把苹果卖到了最高价",
    answer1 = "库克",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(83)->
    #allplayerquestionCfg {
    iD = 83,
    question = "在哪个系统能够试穿自己还未拥有的时装",
    answer1 = "衣帽间",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(84)->
    #allplayerquestionCfg {
    iD = 84,
    question = "草没有草，打一字",
    answer1 = "早",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(85)->
    #allplayerquestionCfg {
    iD = 85,
    question = "一寸大小的太阳，打一字",
    answer1 = "时",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(86)->
    #allplayerquestionCfg {
    iD = 86,
    question = "什么老鼠有两条腿？",
    answer1 = "米老鼠",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(87)->
    #allplayerquestionCfg {
    iD = 87,
    question = "刚刚出生的婴儿啼哭的时候有眼泪吗?",
    answer1 = "没有",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(88)->
    #allplayerquestionCfg {
    iD = 88,
    question = "“沉鱼落雁，闭月羞花”中“闭月”是指",
    answer1 = "貂蝉",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(89)->
    #allplayerquestionCfg {
    iD = 89,
    question = "被称为“诗圣”的唐代诗人为？",
    answer1 = "杜甫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(90)->
    #allplayerquestionCfg {
    iD = 90,
    question = "世界上人口最多的国家是？",
    answer1 = "中国",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(91)->
    #allplayerquestionCfg {
    iD = 91,
    question = "地球上最大的动物是什么？",
    answer1 = "蓝鲸",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(92)->
    #allplayerquestionCfg {
    iD = 92,
    question = "巧克力最早问世于哪国？",
    answer1 = "西班牙",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(93)->
    #allplayerquestionCfg {
    iD = 93,
    question = "人脑中控制人体平衡力的是那部分？",
    answer1 = "小脑",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(94)->
    #allplayerquestionCfg {
    iD = 94,
    question = "世界最长的河流是哪条？",
    answer1 = "亚马逊河",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(95)->
    #allplayerquestionCfg {
    iD = 95,
    question = "提出狭义相对论和广义相对论的科学家是？",
    answer1 = "爱因斯坦",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(96)->
    #allplayerquestionCfg {
    iD = 96,
    question = "光年是什么单位？",
    answer1 = "长度",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(97)->
    #allplayerquestionCfg {
    iD = 97,
    question = "“本事同根生，相煎何太急”出自谁之笔？",
    answer1 = "曹植",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(98)->
    #allplayerquestionCfg {
    iD = 98,
    question = "“老牛舔犊”中的“犊”是指？",
    answer1 = "小牛",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(99)->
    #allplayerquestionCfg {
    iD = 99,
    question = "非洲最南端的国家是？",
    answer1 = "南非",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(100)->
    #allplayerquestionCfg {
    iD = 100,
    question = "“万有引力”理论是哪一位科学家提出的？",
    answer1 = "牛顿",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(101)->
    #allplayerquestionCfg {
    iD = 101,
    question = "世界领土面积最大的国家是？",
    answer1 = "俄罗斯",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(102)->
    #allplayerquestionCfg {
    iD = 102,
    question = "五岳除了泰山、华山、衡山、恒山还有？",
    answer1 = "嵩山",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(103)->
    #allplayerquestionCfg {
    iD = 103,
    question = "世界上最早的报纸出现在哪个国家？",
    answer1 = "中国",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(104)->
    #allplayerquestionCfg {
    iD = 104,
    question = "“都江堰”水利工程是谁主持修建的？",
    answer1 = "李冰",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(105)->
    #allplayerquestionCfg {
    iD = 105,
    question = "最大的鸟是？",
    answer1 = "鸵鸟",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(106)->
    #allplayerquestionCfg {
    iD = 106,
    question = "“桃李满天下”中的“桃李”指什么？",
    answer1 = "学生",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(107)->
    #allplayerquestionCfg {
    iD = 107,
    question = "“史记”的作者是？",
    answer1 = "司马迁",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(108)->
    #allplayerquestionCfg {
    iD = 108,
    question = "你追我，如果你追上我，我就让你____？",
    answer1 = "嘿嘿嘿",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(109)->
    #allplayerquestionCfg {
    iD = 109,
    question = "诗经《秦风·无衣》中第三小节“王于兴师”的下半句为？",
    answer1 = "修我甲兵",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(110)->
    #allplayerquestionCfg {
    iD = 110,
    question = "凭借《嫌疑犯X的献身》荣登直木三十五赏的日本推理小说家为？",
    answer1 = "东野圭吾",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(111)->
    #allplayerquestionCfg {
    iD = 111,
    question = "荣获2015年雨果最佳长篇小说奖的中国科幻作品的名称为？",
    answer1 = "三体",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(112)->
    #allplayerquestionCfg {
    iD = 112,
    question = "电视剧《权利的游戏》中，北境之王史塔克家族的首府名称为？",
    answer1 = "临冬城",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(113)->
    #allplayerquestionCfg {
    iD = 113,
    question = "HBO电视台于2015年播出，乔纳森·诺兰担任主创的科幻剧名称为？",
    answer1 = "西部世界",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(114)->
    #allplayerquestionCfg {
    iD = 114,
    question = "被网友戏称“EX咖喱棒”的Excarliber持有者的原型人物为？",
    answer1 = "亚瑟王",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(115)->
    #allplayerquestionCfg {
    iD = 115,
    question = "2010年逝世，拥有“造梦大师”之称的日本动画导演为？",
    answer1 = "今敏",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(116)->
    #allplayerquestionCfg {
    iD = 116,
    question = "动漫作品《千与千寻》的作者是？",
    answer1 = "宫崎骏",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(117)->
    #allplayerquestionCfg {
    iD = 117,
    question = "凭借《你的名字》荣获第40届日本电影学院奖最佳编剧的是？",
    answer1 = "新海诚",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(118)->
    #allplayerquestionCfg {
    iD = 118,
    question = "“来盘昆特牌吧”是出自哪个RPG游戏的梗？",
    answer1 = "巫师三",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(119)->
    #allplayerquestionCfg {
    iD = 119,
    question = "见证任天堂游戏发展历史的水管工游戏形象的名称为？",
    answer1 = "马里奥",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(120)->
    #allplayerquestionCfg {
    iD = 120,
    question = "各位勇者们生活的这片大陆的名字是？",
    answer1 = "蓝色大陆",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(121)->
    #allplayerquestionCfg {
    iD = 121,
    question = "蓝色大陆最大的城市，政治、经济、文化交流中心是？",
    answer1 = "阿克勒城",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(122)->
    #allplayerquestionCfg {
    iD = 122,
    question = "是否可以穿戴其他职业的武器？（请填写是或否）",
    answer1 = "是",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(123)->
    #allplayerquestionCfg {
    iD = 123,
    question = "是否可以在主城对其他玩家进行杀戮？（请填写是或否）",
    answer1 = "是",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(124)->
    #allplayerquestionCfg {
    iD = 124,
    question = "从天而降是哪个骑宠的技能",
    answer1 = "气球熊猫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(125)->
    #allplayerquestionCfg {
    iD = 125,
    question = "恶灵退散是哪个骑宠的技能",
    answer1 = "剑齿虎",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(126)->
    #allplayerquestionCfg {
    iD = 126,
    question = "绝不原谅是哪个骑宠的技能",
    answer1 = "杀象特",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(127)->
    #allplayerquestionCfg {
    iD = 127,
    question = "一毛不拔是哪个骑宠的技能",
    answer1 = "机械鸟",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(128)->
    #allplayerquestionCfg {
    iD = 128,
    question = "顾客是上帝是哪个骑宠的技能",
    answer1 = "西瓜鲨",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(129)->
    #allplayerquestionCfg {
    iD = 129,
    question = "杀戮意志是哪个骑宠的技能",
    answer1 = "钢铁狼",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(130)->
    #allplayerquestionCfg {
    iD = 130,
    question = "主人，加油！是哪个骑宠的技能",
    answer1 = "雪橇车",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(131)->
    #allplayerquestionCfg {
    iD = 131,
    question = "迷魂曲是哪个骑宠的技能",
    answer1 = "贝斯",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(132)->
    #allplayerquestionCfg {
    iD = 132,
    question = "超能粒子是哪个骑宠的技能",
    answer1 = "天外飞碟",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(133)->
    #allplayerquestionCfg {
    iD = 133,
    question = "防御矩阵是哪个骑宠的技能",
    answer1 = "机甲乔巴",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(134)->
    #allplayerquestionCfg {
    iD = 134,
    question = "你是在玩火是哪个骑宠的技能",
    answer1 = "翼狮",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(135)->
    #allplayerquestionCfg {
    iD = 135,
    question = "梦魇是哪个骑宠的技能",
    answer1 = "鲸梦",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(136)->
    #allplayerquestionCfg {
    iD = 136,
    question = "龙生九子是哪个骑宠的技能",
    answer1 = "机械游龙",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(137)->
    #allplayerquestionCfg {
    iD = 137,
    question = "以人为镜是哪个骑宠的技能",
    answer1 = "大黄蜂",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(138)->
    #allplayerquestionCfg {
    iD = 138,
    question = "恃强凌弱是哪个骑宠的技能",
    answer1 = "大钻风",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(139)->
    #allplayerquestionCfg {
    iD = 139,
    question = "“少壮不努力\"的下一句是？",
    answer1 = "老大徒伤悲",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(140)->
    #allplayerquestionCfg {
    iD = 140,
    question = "”但使龙城飞将在\"的下一句是？",
    answer1 = "不教胡马度阴山",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(141)->
    #allplayerquestionCfg {
    iD = 141,
    question = "”海内存知己\"的下一句是？",
    answer1 = "天涯若比邻",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(142)->
    #allplayerquestionCfg {
    iD = 142,
    question = "第一届现代奥运会在何地举行的？",
    answer1 = "雅典",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(143)->
    #allplayerquestionCfg {
    iD = 143,
    question = "人体缺少哪种元素会造成甲状腺肿大",
    answer1 = "碘",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(144)->
    #allplayerquestionCfg {
    iD = 144,
    question = "乒乓球十九世纪始于那个国家？",
    answer1 = "英国",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(145)->
    #allplayerquestionCfg {
    iD = 145,
    question = "屈原是春秋时代哪国人？",
    answer1 = "楚国",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(146)->
    #allplayerquestionCfg {
    iD = 146,
    question = "被称为“第九艺术”的是？",
    answer1 = "电子游戏",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(147)->
    #allplayerquestionCfg {
    iD = 147,
    question = "“干冰”是由什么凝结而成的？",
    answer1 = "二氧化碳",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(148)->
    #allplayerquestionCfg {
    iD = 148,
    question = "世界卫生组织的英文缩写是？",
    answer1 = "WHO",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(149)->
    #allplayerquestionCfg {
    iD = 149,
    question = "《本草纲目》的作者是？",
    answer1 = "李时珍",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(150)->
    #allplayerquestionCfg {
    iD = 150,
    question = "人体最坚硬的部分是？",
    answer1 = "牙齿",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(151)->
    #allplayerquestionCfg {
    iD = 151,
    question = "\"光年”是（）单位？",
    answer1 = "长度",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(152)->
    #allplayerquestionCfg {
    iD = 152,
    question = "《孙子兵法》的作者是？",
    answer1 = "孙武",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(153)->
    #allplayerquestionCfg {
    iD = 153,
    question = "世界杯足球赛的首届冠军是哪只国家的队伍？",
    answer1 = "乌拉圭",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(154)->
    #allplayerquestionCfg {
    iD = 154,
    question = "七大洲中面积最小的是？",
    answer1 = "南极洲",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(155)->
    #allplayerquestionCfg {
    iD = 155,
    question = "\"变脸”是哪个剧种的绝活？",
    answer1 = "川剧",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(156)->
    #allplayerquestionCfg {
    iD = 156,
    question = "蓝色大陆中最早的人类是谁创造的？",
    answer1 = "露娜女神",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(157)->
    #allplayerquestionCfg {
    iD = 157,
    question = "自然界中已知的最硬的物质是？",
    answer1 = "金刚石",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(158)->
    #allplayerquestionCfg {
    iD = 158,
    question = "在日剧“李狗嗨”的演员中，我们老婆的本名叫什么？",
    answer1 = "新垣结衣",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(159)->
    #allplayerquestionCfg {
    iD = 159,
    question = "在日剧《逃避虽然可耻但有用》的演员中，我们老婆的本名叫什么？",
    answer1 = "新垣结衣",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(160)->
    #allplayerquestionCfg {
    iD = 160,
    question = "在日剧《恋空》的演员中，我们老婆的本名叫什么？",
    answer1 = "新垣结衣",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(161)->
    #allplayerquestionCfg {
    iD = 161,
    question = "美剧《权力的游戏》中，“凡人皆有一死，”下一句是什么？",
    answer1 = "凡人皆需供奉",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(162)->
    #allplayerquestionCfg {
    iD = 162,
    question = "“长夜将至，我从今夜开始守望，”下一句是什么？",
    answer1 = "至死方休",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(163)->
    #allplayerquestionCfg {
    iD = 163,
    question = "“winter is coming，”的中文翻译是什么？",
    answer1 = "凛冬将至",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(164)->
    #allplayerquestionCfg {
    iD = 164,
    question = "“两性联姻，一堂缔约，良缘永结，”下一句是什么？",
    answer1 = "匹配同称",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(165)->
    #allplayerquestionCfg {
    iD = 165,
    question = "书籍《道德经》中，“天地不仁，”下一句是什么？",
    answer1 = "以万物为刍狗",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(166)->
    #allplayerquestionCfg {
    iD = 166,
    question = "书籍《周易》中，“天行健，”下一句是什么？",
    answer1 = "君子以自强不息",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(167)->
    #allplayerquestionCfg {
    iD = 167,
    question = "书籍《周易》中，“地势坤，”下一句是什么？",
    answer1 = "君子以厚德载物",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(168)->
    #allplayerquestionCfg {
    iD = 168,
    question = "诗文《牡丹亭》中，“情不知其所起，”下一句是什么？",
    answer1 = "一往而深",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(169)->
    #allplayerquestionCfg {
    iD = 169,
    question = "“噫吁嚱，危乎高哉，蜀道之难，”下一句是什么？",
    answer1 = "难于上青天",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(170)->
    #allplayerquestionCfg {
    iD = 170,
    question = "诗文《亡灵书》中，“神圣的风带着音乐，吹过你”后半句是什么？",
    answer1 = "黄金的琴弦",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(171)->
    #allplayerquestionCfg {
    iD = 171,
    question = "诗文《亡灵书》中，“原始的生命的初生，无名的事物的”后半句是什么？",
    answer1 = "初名",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(172)->
    #allplayerquestionCfg {
    iD = 172,
    question = "七宗罪为傲慢，色欲，贪食，贪婪，懒惰，愤怒，和什么？",
    answer1 = "嫉妒",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(173)->
    #allplayerquestionCfg {
    iD = 173,
    question = "文章《药》讲述了有关人血馒头的故事，其作者是谁？",
    answer1 = "鲁迅",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(174)->
    #allplayerquestionCfg {
    iD = 174,
    question = "一个自己和自己生下了自己，然后杀死了自己的故事，电影名是？",
    answer1 = "前目的地",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(175)->
    #allplayerquestionCfg {
    iD = 175,
    question = "诗人海子的绝笔作，“面朝大海，”下一句是什么？",
    answer1 = "春暖花开",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(176)->
    #allplayerquestionCfg {
    iD = 176,
    question = "（100-82）等于多少？--三位数",
    answer1 = "666",
    answer2 = "六六六",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(177)->
    #allplayerquestionCfg {
    iD = 177,
    question = "你有一个大佬女朋友，但他却没有胸，他是啥？--四字",
    answer1 = "女装大佬",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(178)->
    #allplayerquestionCfg {
    iD = 178,
    question = "海贼王中，修炼两年后，索隆的哪只眼睛受伤了？",
    answer1 = "左眼",
    answer2 = "左",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(179)->
    #allplayerquestionCfg {
    iD = 179,
    question = "钉宫三连击除了八嘎、hentai，还有？",
    answer1 = "无路赛",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(180)->
    #allplayerquestionCfg {
    iD = 180,
    question = "钉宫三连击除了八嘎、无路赛，还有？",
    answer1 = "hentai",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(181)->
    #allplayerquestionCfg {
    iD = 181,
    question = "钉宫三连击除了无路赛、hentai，还有？",
    answer1 = "八嘎",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(182)->
    #allplayerquestionCfg {
    iD = 182,
    question = "《光辉岁月》是哪个组合的代表作品？",
    answer1 = "Beyond",
    answer2 = "beyond",
    answer3 = "BEYOND",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(183)->
    #allplayerquestionCfg {
    iD = 183,
    question = "《小时代》：这是一个最好的时代，__？",
    answer1 = "也是最坏的时代",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(184)->
    #allplayerquestionCfg {
    iD = 184,
    question = "猜歌名：是谁在敲打我窗，是谁在撩动琴弦？",
    answer1 = "被遗忘的时光",
    answer2 = "《被遗忘的时光》",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(185)->
    #allplayerquestionCfg {
    iD = 185,
    question = "鉴别墨的好坏时，墨色以什么颜色为最佳？",
    answer1 = "紫色",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(186)->
    #allplayerquestionCfg {
    iD = 186,
    question = "中国历史上进行“焚书坑儒”的是哪一位皇帝？",
    answer1 = "秦始皇",
    answer2 = "嬴政",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(187)->
    #allplayerquestionCfg {
    iD = 187,
    question = "中日甲午战争后，清政府与日本签订了哪一个丧权辱国的条约？",
    answer1 = "马关条约",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(188)->
    #allplayerquestionCfg {
    iD = 188,
    question = "专利权人不能享受哪种权利？",
    answer1 = "免费权",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(189)->
    #allplayerquestionCfg {
    iD = 189,
    question = "猜歌名：你不曾发觉，你总是用右手牵着我，但是心却跳动在左边。",
    answer1 = "左边",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(190)->
    #allplayerquestionCfg {
    iD = 190,
    question = "《千与千寻》中千寻的父母由于贪吃变成了什么？",
    answer1 = "猪",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(191)->
    #allplayerquestionCfg {
    iD = 191,
    question = "“吃得苦中苦”的下一句是？",
    answer1 = "方为人上人",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(192)->
    #allplayerquestionCfg {
    iD = 192,
    question = "“冬天到了，春天还会远吗？”出自哪位诗人？",
    answer1 = "雪莱",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(193)->
    #allplayerquestionCfg {
    iD = 193,
    question = "\"海上生明月\"的下一句是？",
    answer1 = "天涯共此时",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(194)->
    #allplayerquestionCfg {
    iD = 194,
    question = "\"秋风吹不尽，总是玉关情。\"谁写的?",
    answer1 = "李白",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(195)->
    #allplayerquestionCfg {
    iD = 195,
    question = "火影中，抓走我爱罗的组织是?",
    answer1 = "晓",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(196)->
    #allplayerquestionCfg {
    iD = 196,
    question = "汶川8.0级地震发生在哪一年?",
    answer1 = "2008",
    answer2 = "二零零八",
    answer3 = "2008年",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(197)->
    #allplayerquestionCfg {
    iD = 197,
    question = "我国将地震烈度划分为多少度?",
    answer1 = "12",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(198)->
    #allplayerquestionCfg {
    iD = 198,
    question = "荷兰的风车主要用于?",
    answer1 = "排水",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(199)->
    #allplayerquestionCfg {
    iD = 199,
    question = "被称为“万物之园”的是指?",
    answer1 = "圆明园",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(200)->
    #allplayerquestionCfg {
    iD = 200,
    question = "被称作“草原钢城”的是?",
    answer1 = "包头",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(201)->
    #allplayerquestionCfg {
    iD = 201,
    question = "武侯祠在什么城市？",
    answer1 = "成都",
    answer2 = "四川成都",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(202)->
    #allplayerquestionCfg {
    iD = 202,
    question = "以“无字碑”名扬天下的是?",
    answer1 = "武则天",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(203)->
    #allplayerquestionCfg {
    iD = 203,
    question = "哪个国家有“千湖国”的称号?",
    answer1 = "芬兰",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(204)->
    #allplayerquestionCfg {
    iD = 204,
    question = "美国的国花是什么花?",
    answer1 = "玫瑰",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(205)->
    #allplayerquestionCfg {
    iD = 205,
    question = "除了苍空雪域外，还有一幅地图也是以苍空命名，该地图叫？",
    answer1 = "苍空之塔",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(206)->
    #allplayerquestionCfg {
    iD = 206,
    question = "露娜女神命玩家寻找的是什么之石，请说出它的全称",
    answer1 = "漂浮之石",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(207)->
    #allplayerquestionCfg {
    iD = 207,
    question = "什么车子寸步难行?",
    answer1 = "风车",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(208)->
    #allplayerquestionCfg {
    iD = 208,
    question = "游戏中，苏珊最喜欢的宠物是谁？",
    answer1 = "大白",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(209)->
    #allplayerquestionCfg {
    iD = 209,
    question = "荆柯刺秦发生在什么时期？",
    answer1 = "战国",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(210)->
    #allplayerquestionCfg {
    iD = 210,
    question = "奥林匹克运动的发祥地是哪里？",
    answer1 = "雅典",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(211)->
    #allplayerquestionCfg {
    iD = 211,
    question = "我国早在春秋战国就发明了足球运动，当时叫做什么？",
    answer1 = "蹴鞠",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(212)->
    #allplayerquestionCfg {
    iD = 212,
    question = "白炽灯的灯丝用的是什么材料？",
    answer1 = "钨",
    answer2 = "钨丝",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(213)->
    #allplayerquestionCfg {
    iD = 213,
    question = "谁中国古代四大美女中的“羞花”？",
    answer1 = "杨玉环",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(214)->
    #allplayerquestionCfg {
    iD = 214,
    question = "什么动物猜拳永远只会出剪刀？",
    answer1 = "螃蟹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(215)->
    #allplayerquestionCfg {
    iD = 215,
    question = "齿龈出血是由于缺乏维生素ABCD中的哪一个？",
    answer1 = "C",
    answer2 = "维生素C",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(216)->
    #allplayerquestionCfg {
    iD = 216,
    question = "“天下第一奇山”是指？",
    answer1 = "黄山",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(217)->
    #allplayerquestionCfg {
    iD = 217,
    question = "什么瓜不能吃？",
    answer1 = "傻瓜",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(218)->
    #allplayerquestionCfg {
    iD = 218,
    question = "射出去的子弹头是直着飞行还是旋转飞行？",
    answer1 = "旋转飞行",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(219)->
    #allplayerquestionCfg {
    iD = 219,
    question = "人体最坚硬的部分是颅骨还是牙齿？",
    answer1 = "牙齿",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(220)->
    #allplayerquestionCfg {
    iD = 220,
    question = "鳄鱼是哺乳动物吗？",
    answer1 = "不是",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(221)->
    #allplayerquestionCfg {
    iD = 221,
    question = "森林、石油、淡水自然资源中, 属于不可再生自然资源的是？",
    answer1 = "石油",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(222)->
    #allplayerquestionCfg {
    iD = 222,
    question = "人会感染“疯牛病”吗?",
    answer1 = "会",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(223)->
    #allplayerquestionCfg {
    iD = 223,
    question = "我国长城是谁下令修建的？",
    answer1 = "秦始皇",
    answer2 = "嬴政",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(224)->
    #allplayerquestionCfg {
    iD = 224,
    question = "名画《蒙娜丽莎》出自哪位画家之手？",
    answer1 = "达芬奇",
    answer2 = "列奥纳多·达·芬奇",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(225)->
    #allplayerquestionCfg {
    iD = 225,
    question = "“天生我材必有用，千金散尽还复来”出自哪首诗？",
    answer1 = "将进酒",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(226)->
    #allplayerquestionCfg {
    iD = 226,
    question = "在《鲁滨逊漂流记》中，鲁滨逊认识的野人是叫什么？",
    answer1 = "星期五",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(227)->
    #allplayerquestionCfg {
    iD = 227,
    question = "《爱拼才会赢》使用的什么方言演唱的？",
    answer1 = "闽南语",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(228)->
    #allplayerquestionCfg {
    iD = 228,
    question = "“白雪公主”这个形象最早来自于哪个童话？",
    answer1 = "安徒生童话",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(229)->
    #allplayerquestionCfg {
    iD = 229,
    question = "他曾温酒斩华雄、千里走单骑、刮骨疗毒，这位英雄是？",
    answer1 = "关羽",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(230)->
    #allplayerquestionCfg {
    iD = 230,
    question = "在电影《肖申克的救赎》中，主人公安迪在入狱前职业是？",
    answer1 = "银行家",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(231)->
    #allplayerquestionCfg {
    iD = 231,
    question = "我国历史上第一个女皇帝是",
    answer1 = "武则天",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(232)->
    #allplayerquestionCfg {
    iD = 232,
    question = "集齐了七颗龙珠之后可以召唤什么？",
    answer1 = "神龙",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(233)->
    #allplayerquestionCfg {
    iD = 233,
    question = "”天马流星拳“是哪个日本动漫角色的招数？",
    answer1 = "星矢",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(234)->
    #allplayerquestionCfg {
    iD = 234,
    question = "”天马流星拳“这招数出自哪部日本动画片？",
    answer1 = "圣斗士星矢",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(235)->
    #allplayerquestionCfg {
    iD = 235,
    question = "天蟹座、摩羯座和银牛座，以上哪个星座是十二星座其中之一？",
    answer1 = "摩羯座",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(236)->
    #allplayerquestionCfg {
    iD = 236,
    question = "《义勇军进行曲》是谁作词的？",
    answer1 = "田汉",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(237)->
    #allplayerquestionCfg {
    iD = 237,
    question = "《义勇军进行曲》是谁作曲的？",
    answer1 = "聂耳",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(238)->
    #allplayerquestionCfg {
    iD = 238,
    question = "“物竞天择，优胜劣汰。” 这是哪部著作中的核心言论？",
    answer1 = "进化论",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(239)->
    #allplayerquestionCfg {
    iD = 239,
    question = "《进化论》的作者是谁？",
    answer1 = "达尔文",
    answer2 = "查尔斯·罗伯特·达尔文",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(240)->
    #allplayerquestionCfg {
    iD = 240,
    question = "《地动仪》的发明者是谁？",
    answer1 = "张衡",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(241)->
    #allplayerquestionCfg {
    iD = 241,
    question = "中国历史中替父从军的女性叫什么？",
    answer1 = "花木兰",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(242)->
    #allplayerquestionCfg {
    iD = 242,
    question = "中华人民共和国一共拥有多少个民族？",
    answer1 = "56",
    answer2 = "五十六",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(243)->
    #allplayerquestionCfg {
    iD = 243,
    question = "中国名山黄山，在哪个省？",
    answer1 = "安徽",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(244)->
    #allplayerquestionCfg {
    iD = 244,
    question = "中国传统节日端午节是为了纪念哪位名人的？",
    answer1 = "屈原",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(245)->
    #allplayerquestionCfg {
    iD = 245,
    question = "中国最大的淡水湖是哪个？",
    answer1 = "鄱阳湖",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(246)->
    #allplayerquestionCfg {
    iD = 246,
    question = "中国哪位传说人物“三过家门而不入”？",
    answer1 = "大禹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(247)->
    #allplayerquestionCfg {
    iD = 247,
    question = "中国哪位传说人物拥有锲而不舍的“移山”精神？",
    answer1 = "愚公",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(248)->
    #allplayerquestionCfg {
    iD = 248,
    question = "哪个传说中的鸟捡石头“填海”？",
    answer1 = "精卫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(249)->
    #allplayerquestionCfg {
    iD = 249,
    question = "中国上古四神兽是“朱雀”、“玄武”、“白虎”和什么？",
    answer1 = "青龙",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(250)->
    #allplayerquestionCfg {
    iD = 250,
    question = "中国上古四神兽是“青龙”、“玄武”、“白虎”和什么？",
    answer1 = "朱雀",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(251)->
    #allplayerquestionCfg {
    iD = 251,
    question = "中国上古四神兽是“朱雀”、“青龙”、“白虎”和什么？",
    answer1 = "玄武",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(252)->
    #allplayerquestionCfg {
    iD = 252,
    question = "中国上古四神兽是“朱雀”、“玄武”、“青龙”和什么？",
    answer1 = "白虎",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(253)->
    #allplayerquestionCfg {
    iD = 253,
    question = "古埃及的统治者被称为？",
    answer1 = "法老",
    answer2 = "法老王",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(254)->
    #allplayerquestionCfg {
    iD = 254,
    question = "古埃及的统治者死后会被葬在什么地方？",
    answer1 = "金字塔",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(255)->
    #allplayerquestionCfg {
    iD = 255,
    question = "希腊神话中的美神是谁？",
    answer1 = "维纳斯",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(256)->
    #allplayerquestionCfg {
    iD = 256,
    question = "希腊神话中的爱神是谁？",
    answer1 = "丘比特",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(257)->
    #allplayerquestionCfg {
    iD = 257,
    question = "北欧神话中的主神是谁？",
    answer1 = "奥丁",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(258)->
    #allplayerquestionCfg {
    iD = 258,
    question = "希腊神话中的海神是谁？",
    answer1 = "波塞冬",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(259)->
    #allplayerquestionCfg {
    iD = 259,
    question = "智慧女神和战争女神是谁？",
    answer1 = "雅典娜",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(260)->
    #allplayerquestionCfg {
    iD = 260,
    question = "著名科幻小说《海底两万里》的作者是谁？",
    answer1 = "凡尔纳",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(261)->
    #allplayerquestionCfg {
    iD = 261,
    question = "花中四君子是指梅、竹、菊和什么？",
    answer1 = "兰",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(262)->
    #allplayerquestionCfg {
    iD = 262,
    question = "花中四君子是指竹、菊、兰和什么？",
    answer1 = "梅",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(263)->
    #allplayerquestionCfg {
    iD = 263,
    question = "花中四君子是指梅、菊、兰和什么？",
    answer1 = "竹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(264)->
    #allplayerquestionCfg {
    iD = 264,
    question = "花中四君子是指梅、兰、竹和什么？",
    answer1 = "菊",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(265)->
    #allplayerquestionCfg {
    iD = 265,
    question = "鲁迅的小说《孔乙己》中的主人公去的小酒馆叫什么名字？",
    answer1 = "咸亨酒店",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(266)->
    #allplayerquestionCfg {
    iD = 266,
    question = "本游戏的骑宠主要获得方式是？",
    answer1 = "扭蛋",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(267)->
    #allplayerquestionCfg {
    iD = 267,
    question = "“关关雎鸠，在河之洲”的下一句是？",
    answer1 = "窈窕淑女，君子好逑",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(268)->
    #allplayerquestionCfg {
    iD = 268,
    question = "荷兰的首都是什么？",
    answer1 = "阿姆斯特丹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(269)->
    #allplayerquestionCfg {
    iD = 269,
    question = "941,947,953,n,971 求n的值",
    answer1 = "967",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(270)->
    #allplayerquestionCfg {
    iD = 270,
    question = "3,1,4,1,5,9,n,6,5,3 求n的值（某特殊值）",
    answer1 = "2",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(271)->
    #allplayerquestionCfg {
    iD = 271,
    question = "161051,14641,1331,121,n 求n的值?",
    answer1 = "11",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(272)->
    #allplayerquestionCfg {
    iD = 272,
    question = "7只小绵羊和一群香辣蟹总共有44条腿，请问有多少香辣蟹？",
    answer1 = "2",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(273)->
    #allplayerquestionCfg {
    iD = 273,
    question = "花豹以79.2km/h的速度追赶133m外的54km/h的绒绒兔，多少秒能追上？",
    answer1 = "19",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(274)->
    #allplayerquestionCfg {
    iD = 274,
    question = "a^2+b^2=c^2 这个公式描述了什么定理?",
    answer1 = "勾股",
    answer2 = "勾股定理",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(275)->
    #allplayerquestionCfg {
    iD = 275,
    question = "香辣蟹有几条腿？",
    answer1 = "8",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(276)->
    #allplayerquestionCfg {
    iD = 276,
    question = "声音在室温下的传播速度大概是每秒多少米？（精确到个位）",
    answer1 = "346",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(277)->
    #allplayerquestionCfg {
    iD = 277,
    question = "食盐主要成分的化学式",
    answer1 = "NaCl",
    answer2 = "氯化钠",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(278)->
    #allplayerquestionCfg {
    iD = 278,
    question = "篮球规则中中场休息多长时间?",
    answer1 = "10分钟",
    answer2 = "十分钟",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(279)->
    #allplayerquestionCfg {
    iD = 279,
    question = "“吃得苦中苦”的下一句是?",
    answer1 = "方为人上人",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(280)->
    #allplayerquestionCfg {
    iD = 280,
    question = "被称为“诗圣”的唐代诗人为?",
    answer1 = "杜甫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(281)->
    #allplayerquestionCfg {
    iD = 281,
    question = "被称为“诗仙”的唐代诗人为?",
    answer1 = "李白",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(282)->
    #allplayerquestionCfg {
    iD = 282,
    question = "被称为我国“瓷都”的是指哪一城市？",
    answer1 = "景德镇",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(283)->
    #allplayerquestionCfg {
    iD = 283,
    question = "校园歌曲《童年》的词曲作者是?",
    answer1 = "罗大佑",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(284)->
    #allplayerquestionCfg {
    iD = 284,
    question = "“豆蔻年华”是指几岁?",
    answer1 = "13",
    answer2 = "13岁",
    answer3 = "十三岁",
    answer4 = "十三",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(285)->
    #allplayerquestionCfg {
    iD = 285,
    question = "造成气候变暖的主要原因是人类生产活动中排放大量的什么气体?",
    answer1 = "二氧化碳",
    answer2 = "co2",
    answer3 = "CO2",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(286)->
    #allplayerquestionCfg {
    iD = 286,
    question = "平面直角坐标系中，右下方为第几象限？",
    answer1 = "4",
    answer2 = "四",
    answer3 = "第四象限",
    answer4 = "第4象限",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(287)->
    #allplayerquestionCfg {
    iD = 287,
    question = "龙在十二生肖中排第几？",
    answer1 = "5",
    answer2 = "五",
    answer3 = "第五",
    answer4 = "第5",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(288)->
    #allplayerquestionCfg {
    iD = 288,
    question = "《三国演义》中，曹操得了头疼病请谁来医治？",
    answer1 = "华佗",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(289)->
    #allplayerquestionCfg {
    iD = 289,
    question = "世界四大洋中面积最小的是?",
    answer1 = "北冰洋",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(290)->
    #allplayerquestionCfg {
    iD = 290,
    question = "味精的主要成分是什么",
    answer1 = "谷氨酸钠",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(291)->
    #allplayerquestionCfg {
    iD = 291,
    question = "狗热时用什么散热?",
    answer1 = "舌头",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(292)->
    #allplayerquestionCfg {
    iD = 292,
    question = "美国国旗星条旗上有多少颗星?",
    answer1 = "50",
    answer2 = "五十",
    answer3 = "50颗",
    answer4 = "五十颗",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(293)->
    #allplayerquestionCfg {
    iD = 293,
    question = "阿拉伯数字起源于?",
    answer1 = "印度",
    answer2 = "古印度",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(294)->
    #allplayerquestionCfg {
    iD = 294,
    question = "奔驰汽车原产于哪一个国家?",
    answer1 = "德国",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(295)->
    #allplayerquestionCfg {
    iD = 295,
    question = "钙的吸收与什么维生素有关?",
    answer1 = "维生素D",
    answer2 = "D",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(296)->
    #allplayerquestionCfg {
    iD = 296,
    question = "弱冠指的是多少岁？",
    answer1 = "20",
    answer2 = "二十",
    answer3 = "20岁",
    answer4 = "二十岁",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(297)->
    #allplayerquestionCfg {
    iD = 297,
    question = "被称为“万园之园”的是指?",
    answer1 = "圆明园",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(298)->
    #allplayerquestionCfg {
    iD = 298,
    question = "中国第一座佛教寺院是哪一座?",
    answer1 = "白马寺",
    answer2 = "洛阳白马寺",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(299)->
    #allplayerquestionCfg {
    iD = 299,
    question = "沉鱼落雁，闭月羞花”中“沉鱼”是指?",
    answer1 = "西施",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(300)->
    #allplayerquestionCfg {
    iD = 300,
    question = "中国的国花是什么花?",
    answer1 = "牡丹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(301)->
    #allplayerquestionCfg {
    iD = 301,
    question = "“沉鱼落雁，闭月羞花”中“闭月”是指?",
    answer1 = "貂蝉",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(302)->
    #allplayerquestionCfg {
    iD = 302,
    question = "地球上出现的潮汐是由于什么引起的？",
    answer1 = "月球",
    answer2 = "月亮",
    answer3 = "地月引力",
    answer4 = "地月吸引力",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(303)->
    #allplayerquestionCfg {
    iD = 303,
    question = "海市蜃楼的本质是什么",
    answer1 = "折射",
    answer2 = "反射",
    answer3 = "光的折射",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(304)->
    #allplayerquestionCfg {
    iD = 304,
    question = "《时间简史》的作者是谁",
    answer1 = "霍金",
    answer2 = "斯蒂芬·霍金",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(305)->
    #allplayerquestionCfg {
    iD = 305,
    question = "你受伤了，老虎走过来舔你，你感不感动？",
    answer1 = "不敢动",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(306)->
    #allplayerquestionCfg {
    iD = 306,
    question = "tan90°等于多少？",
    answer1 = "不存在",
    answer2 = "不存在的",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(307)->
    #allplayerquestionCfg {
    iD = 307,
    question = "他这么可爱，一定是？",
    answer1 = "男孩子",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(308)->
    #allplayerquestionCfg {
    iD = 308,
    question = "他这么可爱，一定不是？",
    answer1 = "女孩子",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(309)->
    #allplayerquestionCfg {
    iD = 309,
    question = "什么月饼最难吃？",
    answer1 = "五仁",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(310)->
    #allplayerquestionCfg {
    iD = 310,
    question = "虾类依什么呼吸？ ",
    answer1 = "鳃",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(311)->
    #allplayerquestionCfg {
    iD = 311,
    question = "咖啡的故乡是哪里?  ",
    answer1 = "非洲 ",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(312)->
    #allplayerquestionCfg {
    iD = 312,
    question = "奥林匹克运动会的发源地是",
    answer1 = "希腊",
    answer2 = "古希腊",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(313)->
    #allplayerquestionCfg {
    iD = 313,
    question = "地球上出现的四季更替是由于？",
    answer1 = "公转",
    answer2 = "地球公转",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(314)->
    #allplayerquestionCfg {
    iD = 314,
    question = "电脑的中央处理器英文简写是什么？",
    answer1 = "CPU",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(315)->
    #allplayerquestionCfg {
    iD = 315,
    question = "《三国演义》中的“凤雏”是谁？ ",
    answer1 = "庞统",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(316)->
    #allplayerquestionCfg {
    iD = 316,
    question = "世界上最大的冰川在哪个洲？",
    answer1 = "南极洲",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(317)->
    #allplayerquestionCfg {
    iD = 317,
    question = "WTO是哪个组织的称呼？",
    answer1 = "世界贸易组织",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(318)->
    #allplayerquestionCfg {
    iD = 318,
    question = "“问君能有几多愁”诗句的下句是",
    answer1 = "恰似一江春水向东流",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(319)->
    #allplayerquestionCfg {
    iD = 319,
    question = "被称为“诗圣”的唐代诗人为？",
    answer1 = "杜甫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(320)->
    #allplayerquestionCfg {
    iD = 320,
    question = "不等腰直角三角形中对着直角的边叫做",
    answer1 = "弦",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(321)->
    #allplayerquestionCfg {
    iD = 321,
    question = "能使淀粉变成蓝黑色的是？",
    answer1 = "碘",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(322)->
    #allplayerquestionCfg {
    iD = 322,
    question = "著名的卢浮宫博物馆在哪个城市？",
    answer1 = "巴黎",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(323)->
    #allplayerquestionCfg {
    iD = 323,
    question = "《孙子兵法》的作者是",
    answer1 = "孙武",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(324)->
    #allplayerquestionCfg {
    iD = 324,
    question = "《钢铁是怎样炼成的》作者是谁？ ",
    answer1 = "奥斯特洛夫斯基",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(325)->
    #allplayerquestionCfg {
    iD = 325,
    question = "香槟酒是葡萄酒吗？",
    answer1 = "是",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(326)->
    #allplayerquestionCfg {
    iD = 326,
    question = "白求恩是哪个国家的？",
    answer1 = "加拿大",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(327)->
    #allplayerquestionCfg {
    iD = 327,
    question = "人体最大的解毒器官是？",
    answer1 = "肝脏",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(328)->
    #allplayerquestionCfg {
    iD = 328,
    question = "知天命”代指（）岁 ？",
    answer1 = "50",
    answer2 = "五十",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(329)->
    #allplayerquestionCfg {
    iD = 329,
    question = "被称为“药王”的是？",
    answer1 = "孙思邈",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(330)->
    #allplayerquestionCfg {
    iD = 330,
    question = "有“黑金”美誉的燃料是",
    answer1 = "石油",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(331)->
    #allplayerquestionCfg {
    iD = 331,
    question = "蟋蟀是靠什么发出鸣叫声的？",
    answer1 = "翅膀",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(332)->
    #allplayerquestionCfg {
    iD = 332,
    question = "我国的“冰城”是指哪一城市？",
    answer1 = "哈尔滨",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(333)->
    #allplayerquestionCfg {
    iD = 333,
    question = "扑克牌中是 \"K\"长胡子还是 \"Q\"长胡子？",
    answer1 = "K",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(334)->
    #allplayerquestionCfg {
    iD = 334,
    question = "被称为“第七艺术”的是",
    answer1 = "电影",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(335)->
    #allplayerquestionCfg {
    iD = 335,
    question = "依照西方习俗, 订婚戒指戴在左手哪根手指上？",
    answer1 = "无名指",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(336)->
    #allplayerquestionCfg {
    iD = 336,
    question = "钢是由铁和什么组成的？",
    answer1 = "碳",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(337)->
    #allplayerquestionCfg {
    iD = 337,
    question = "《泰坦尼克号》女主角戴的项链的名字是？",
    answer1 = "海洋之心",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(338)->
    #allplayerquestionCfg {
    iD = 338,
    question = "《桃花扇》的作者是？",
    answer1 = "孔尚任",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(339)->
    #allplayerquestionCfg {
    iD = 339,
    question = "《滕王阁序》的作者是？",
    answer1 = "王勃",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(340)->
    #allplayerquestionCfg {
    iD = 340,
    question = "《天工开物》的作者是？",
    answer1 = "宋应星",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(341)->
    #allplayerquestionCfg {
    iD = 341,
    question = "《天龙八部》的作者是",
    answer1 = "金庸",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(342)->
    #allplayerquestionCfg {
    iD = 342,
    question = "《天龙八部》里的乔峰是汉人吗？",
    answer1 = "不是",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(343)->
    #allplayerquestionCfg {
    iD = 343,
    question = "《铁臂阿童木》的作者是",
    answer1 = "手冢治虫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(344)->
    #allplayerquestionCfg {
    iD = 344,
    question = "《庭院深深》的作者是",
    answer1 = "琼瑶",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(345)->
    #allplayerquestionCfg {
    iD = 345,
    question = "《玩偶世家》是19世纪戏剧家亨利克·易卜生的著名社会剧，他的国籍是？",
    answer1 = "挪威",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(346)->
    #allplayerquestionCfg {
    iD = 346,
    question = "《威尼斯商人》的作者是",
    answer1 = "莎士比亚",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(347)->
    #allplayerquestionCfg {
    iD = 347,
    question = "《围城》的作者是",
    answer1 = "钱钟书",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(348)->
    #allplayerquestionCfg {
    iD = 348,
    question = "《物种起源》的作者是",
    answer1 = "达尔文",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(349)->
    #allplayerquestionCfg {
    iD = 349,
    question = "《雾都孤儿》的作者是",
    answer1 = "狄更斯",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(350)->
    #allplayerquestionCfg {
    iD = 350,
    question = "《西厢记》是元杂剧的四大爱情剧之一，它的作者是",
    answer1 = "王实甫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(351)->
    #allplayerquestionCfg {
    iD = 351,
    question = "《撑洋伞的女人》这幅世界名画是谁画的？",
    answer1 = "莫奈",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(352)->
    #allplayerquestionCfg {
    iD = 352,
    question = "《西游记》中唐僧去西天取经，“西天”指的是今天的",
    answer1 = "印度",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(353)->
    #allplayerquestionCfg {
    iD = 353,
    question = "《醒世恒言》的作者是？",
    answer1 = "冯梦龙",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(354)->
    #allplayerquestionCfg {
    iD = 354,
    question = "《羊脂球》是法国著名作家莫泊桑的小说，其实“羊脂球”是一种？",
    answer1 = "食品",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(355)->
    #allplayerquestionCfg {
    iD = 355,
    question = "《摇篮曲》是世界名曲，它的作者是？",
    answer1 = "舒伯特",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(356)->
    #allplayerquestionCfg {
    iD = 356,
    question = "100克虾皮和100克芝麻酱哪个含钙量高？",
    answer1 = "芝麻酱",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(357)->
    #allplayerquestionCfg {
    iD = 357,
    question = "《倚天屠龙记》里的谢逊的绰号是？",
    answer1 = "金毛狮王",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(358)->
    #allplayerquestionCfg {
    iD = 358,
    question = "《倚天屠龙记》里的殷天正的绰号是？",
    answer1 = "白眉鹰王",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(359)->
    #allplayerquestionCfg {
    iD = 359,
    question = "《倚天屠龙记》里的张无忌的老爸是？",
    answer1 = "张翠山",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(360)->
    #allplayerquestionCfg {
    iD = 360,
    question = "那一天，人类终于回想起了，曾经一度被什么东西支配的恐惧",
    answer1 = "巨人",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(361)->
    #allplayerquestionCfg {
    iD = 361,
    question = "凯撒大帝名言\"veni,vidi,vici\"的中文译文是什么？",
    answer1 = "我来我见我征服",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(362)->
    #allplayerquestionCfg {
    iD = 362,
    question = "\"无限大な梦のあとの 何もない世の中じゃ\" 这首歌的最佳演唱者是谁？",
    answer1 = "和田光司",
    answer2 = "わだ こうじ",
    answer3 = "Wada Kouji",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(363)->
    #allplayerquestionCfg {
    iD = 363,
    question = "《圣斗士星矢》中\"庐山升龙霸\"的进阶技能是什么？",
    answer1 = "庐山百龙霸",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(364)->
    #allplayerquestionCfg {
    iD = 364,
    question = "《Re:CREATORS》中，\"谎言的谎言，这便可瞬间，\"下一句是？",
    answer1 = "颠倒正反",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(365)->
    #allplayerquestionCfg {
    iD = 365,
    question = "《Re：从零开始的异世界生活》中，有复活权能的是七宗罪中哪一个？",
    answer1 = "傲慢",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(366)->
    #allplayerquestionCfg {
    iD = 366,
    question = "鲁路修·兰佩路基的超能力名字是？",
    answer1 = "Geass",
    answer2 = "geass",
    answer3 = "GEASS",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(367)->
    #allplayerquestionCfg {
    iD = 367,
    question = "《高达SEED》中，阿斯兰·萨拉的专属高达名叫？",
    answer1 = "Justice",
    answer2 = "justice",
    answer3 = "正义",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(368)->
    #allplayerquestionCfg {
    iD = 368,
    question = "六道包括天道、阿修罗道、人道、畜生道、饿鬼道和什么？",
    answer1 = "地狱道",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(369)->
    #allplayerquestionCfg {
    iD = 369,
    question = "六道包括天道、阿修罗道、人道、畜生道、地狱道和什么？",
    answer1 = "饿鬼道",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(370)->
    #allplayerquestionCfg {
    iD = 370,
    question = "六道包括天道、阿修罗道、人道、饿鬼道、地狱道和什么？",
    answer1 = "畜生道",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(371)->
    #allplayerquestionCfg {
    iD = 371,
    question = "六道包括天道、阿修罗道、畜生道、饿鬼道、地狱道和什么？",
    answer1 = "人道",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(372)->
    #allplayerquestionCfg {
    iD = 372,
    question = "六道包括天道、人道、畜生道、饿鬼道、地狱道和什么？",
    answer1 = "阿修罗道",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(373)->
    #allplayerquestionCfg {
    iD = 373,
    question = "六道包括阿修罗道、人道、畜生道、饿鬼道、地狱道和什么？",
    answer1 = "天道",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(374)->
    #allplayerquestionCfg {
    iD = 374,
    question = "神说，要有光，于是就有了什么",
    answer1 = "光",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(375)->
    #allplayerquestionCfg {
    iD = 375,
    question = "《旧约圣经》第一章的名字是什么？",
    answer1 = "创世纪",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(376)->
    #allplayerquestionCfg {
    iD = 376,
    question = "《新约圣经》第一章的名字是什么？",
    answer1 = "马太福音",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(377)->
    #allplayerquestionCfg {
    iD = 377,
    question = "电影《君の名は。》的中文译名是？",
    answer1 = "你的名字",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(378)->
    #allplayerquestionCfg {
    iD = 378,
    question = "两个人之间的距离除了电车还有秒速几厘米？",
    answer1 = "五",
    answer2 = "5",
    answer3 = "五厘米",
    answer4 = "5厘米",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(379)->
    #allplayerquestionCfg {
    iD = 379,
    question = "El Psy Congroo，一切都是什么的选择？",
    answer1 = "命运石之门",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(380)->
    #allplayerquestionCfg {
    iD = 380,
    question = "《火影忍者》中，三大瞳术包括白眼，写轮眼和什么？",
    answer1 = "轮回眼",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(381)->
    #allplayerquestionCfg {
    iD = 381,
    question = "《火影忍者》中，三大瞳术包括写轮眼，轮回眼和什么？",
    answer1 = "白眼",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(382)->
    #allplayerquestionCfg {
    iD = 382,
    question = "《火影忍者》中，三大瞳术包括白眼，轮回眼和什么？",
    answer1 = "写轮眼",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(383)->
    #allplayerquestionCfg {
    iD = 383,
    question = "印度四大种姓，包括婆罗门，刹帝利，吠舍和什么？",
    answer1 = "首陀罗",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(384)->
    #allplayerquestionCfg {
    iD = 384,
    question = "印度四大种姓，包括婆罗门，刹帝利，首陀罗和什么？",
    answer1 = "吠舍",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(385)->
    #allplayerquestionCfg {
    iD = 385,
    question = "印度四大种姓，包括婆罗门，吠舍，首陀罗和什么？",
    answer1 = "刹帝利",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(386)->
    #allplayerquestionCfg {
    iD = 386,
    question = "印度四大种姓，包括刹帝利，吠舍，首陀罗和什么？",
    answer1 = "婆罗门",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(387)->
    #allplayerquestionCfg {
    iD = 387,
    question = "埃及最大的金字塔是？",
    answer1 = "胡夫金字塔",
    answer2 = "胡夫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(388)->
    #allplayerquestionCfg {
    iD = 388,
    question = "\"Archer I am the bone of my sword…\"是什么技能的咏唱词？",
    answer1 = "无限剑制",
    answer2 = "UBW",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(389)->
    #allplayerquestionCfg {
    iD = 389,
    question = "什么人生病从来不看医生?",
    answer1 = "盲人",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(390)->
    #allplayerquestionCfg {
    iD = 390,
    question = "打什么东西,不必花力气?",
    answer1 = "打瞌睡",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(391)->
    #allplayerquestionCfg {
    iD = 391,
    question = "书店里买不到什么书？",
    answer1 = "遗书",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(392)->
    #allplayerquestionCfg {
    iD = 392,
    question = "什么英文字母最多人喜欢听?",
    answer1 = "CD",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(393)->
    #allplayerquestionCfg {
    iD = 393,
    question = "什么人始终不敢洗澡",
    answer1 = "泥人",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(394)->
    #allplayerquestionCfg {
    iD = 394,
    question = "不必花力气打的东西是什么？",
    answer1 = "打哈欠",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(395)->
    #allplayerquestionCfg {
    iD = 395,
    question = "什么酒不能喝?",
    answer1 = "碘酒",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(396)->
    #allplayerquestionCfg {
    iD = 396,
    question = "红豆的小孩是谁？",
    answer1 = "南国",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(397)->
    #allplayerquestionCfg {
    iD = 397,
    question = "世界上什么地方的海不产鱼？",
    answer1 = "辞海",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(398)->
    #allplayerquestionCfg {
    iD = 398,
    question = "哪位历史人物最欠扁？",
    answer1 = "苏武",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(399)->
    #allplayerquestionCfg {
    iD = 399,
    question = "麒麟飞到北极会变成什么？",
    answer1 = "冰淇淋",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(400)->
    #allplayerquestionCfg {
    iD = 400,
    question = "抽刀断水水更流，下一句是？",
    answer1 = "举杯消愁愁更愁",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(401)->
    #allplayerquestionCfg {
    iD = 401,
    question = "近水楼台先得月，下一句是？",
    answer1 = "向阳花木易为春",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(402)->
    #allplayerquestionCfg {
    iD = 402,
    question = "举杯消愁愁更愁，上一句是？",
    answer1 = "抽刀断水水更流",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(403)->
    #allplayerquestionCfg {
    iD = 403,
    question = "明日愁来明日愁，上一句是？",
    answer1 = "今朝有酒今朝醉",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(404)->
    #allplayerquestionCfg {
    iD = 404,
    question = "向阳花木易为春，上一句是？",
    answer1 = "近水楼台先得月",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(405)->
    #allplayerquestionCfg {
    iD = 405,
    question = "“氦气”的化学式是？",
    answer1 = "He",
    answer2 = "he",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(406)->
    #allplayerquestionCfg {
    iD = 406,
    question = "“金”的化学式是？",
    answer1 = "Au",
    answer2 = "au",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(407)->
    #allplayerquestionCfg {
    iD = 407,
    question = "“银”的化学式是？",
    answer1 = "Ag",
    answer2 = "ag",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(408)->
    #allplayerquestionCfg {
    iD = 408,
    question = "著名的卢浮宫博物馆在",
    answer1 = "巴黎",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(409)->
    #allplayerquestionCfg {
    iD = 409,
    question = "“给我一个支点，我就能撬动地球”，是谁的名言？",
    answer1 = "阿基米德",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(410)->
    #allplayerquestionCfg {
    iD = 410,
    question = "被称为风车之国的国家是?",
    answer1 = "荷兰",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(411)->
    #allplayerquestionCfg {
    iD = 411,
    question = "壶口瀑布属于那条河流?",
    answer1 = "黄河",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(412)->
    #allplayerquestionCfg {
    iD = 412,
    question = "我国传统节日中最具浪漫色彩的是?",
    answer1 = "七夕",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(413)->
    #allplayerquestionCfg {
    iD = 413,
    question = "电影《魔兽》中吴彦祖饰演了谁？",
    answer1 = "古尔丹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(414)->
    #allplayerquestionCfg {
    iD = 414,
    question = "“卡布达”是日本哪部动漫？",
    answer1 = "铁甲小宝",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(415)->
    #allplayerquestionCfg {
    iD = 415,
    question = "电影“肖申克的救赎”中男主角叫什么名字？",
    answer1 = "蒂姆·罗宾斯",
    answer2 = "摩根·弗里曼",
    answer3 = "罗宾斯",
    answer4 = "弗里曼",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(416)->
    #allplayerquestionCfg {
    iD = 416,
    question = "小说“斗破苍穹”的作者是谁？",
    answer1 = "天蚕土豆",
    answer2 = "李虎",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(417)->
    #allplayerquestionCfg {
    iD = 417,
    question = "歇后语“蛤蟆的眼睛\"下一句？",
    answer1 = "突出",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(418)->
    #allplayerquestionCfg {
    iD = 418,
    question = "七成熟的牛排碰到八成熟的牛排，它们为什么不打招呼？",
    answer1 = "因为它们不熟",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(419)->
    #allplayerquestionCfg {
    iD = 419,
    question = "诗词《离骚》中“路漫漫其修远兮”，下一句是什么？",
    answer1 = "吾将上下而求索",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(420)->
    #allplayerquestionCfg {
    iD = 420,
    question = "小说“神墓”中主角叫什么名字？",
    answer1 = "辰南",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(421)->
    #allplayerquestionCfg {
    iD = 421,
    question = "端午节纪念的是谁？",
    answer1 = "屈原",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(422)->
    #allplayerquestionCfg {
    iD = 422,
    question = "烧水壶中有水渍可以使用什么清理？",
    answer1 = "小苏打",
    answer2 = "醋",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(423)->
    #allplayerquestionCfg {
    iD = 423,
    question = "通常铅笔上的英文字母“B”表示？",
    answer1 = "软质铅笔",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(424)->
    #allplayerquestionCfg {
    iD = 424,
    question = "保温瓶可保温但能保“冷”吗？",
    answer1 = "能",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(425)->
    #allplayerquestionCfg {
    iD = 425,
    question = "“三顾频繁天下计，两朝开济老臣心”歌颂的哪位名人？",
    answer1 = "诸葛亮",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(426)->
    #allplayerquestionCfg {
    iD = 426,
    question = "补牙和拔牙的最好时段是？（早上，下午，晚上）",
    answer1 = "下午",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(427)->
    #allplayerquestionCfg {
    iD = 427,
    question = "电影《大圣归来》中小和尚叫什么名字？",
    answer1 = "江流儿",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(428)->
    #allplayerquestionCfg {
    iD = 428,
    question = "“对你爱爱爱不完”原唱是谁？",
    answer1 = "郭富城",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(429)->
    #allplayerquestionCfg {
    iD = 429,
    question = "小沈阳，刘能，赵四，宋小宝俗称什么组合？",
    answer1 = "东北F4",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(430)->
    #allplayerquestionCfg {
    iD = 430,
    question = "“我的妈呀”是谁的经典口头禅？",
    answer1 = "岳云鹏",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(431)->
    #allplayerquestionCfg {
    iD = 431,
    question = "相声讲究（四字）？",
    answer1 = "说学逗唱",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(432)->
    #allplayerquestionCfg {
    iD = 432,
    question = "“一根木棍,吊个方箱,一把梯子,搭在中央”，打一字",
    answer1 = "面",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(433)->
    #allplayerquestionCfg {
    iD = 433,
    question = "“一撇一竖一点”，打一字",
    answer1 = "压",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(434)->
    #allplayerquestionCfg {
    iD = 434,
    question = "什么昆虫天生刀不离手？",
    answer1 = "螳螂",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(435)->
    #allplayerquestionCfg {
    iD = 435,
    question = "世界上最大的岛？",
    answer1 = "格陵兰岛",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(436)->
    #allplayerquestionCfg {
    iD = 436,
    question = "是哪一种力的存在使你可以向前走动？",
    answer1 = "摩擦力",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(437)->
    #allplayerquestionCfg {
    iD = 437,
    question = "大家常说的\"小苏打\"的化学名是什么？",
    answer1 = "碳酸氢钠",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(438)->
    #allplayerquestionCfg {
    iD = 438,
    question = "中国神话故事中，喻义\"只进不出、可敛财\"的神兽名字是？",
    answer1 = "貔貅",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(439)->
    #allplayerquestionCfg {
    iD = 439,
    question = "本初子午线经过了哪一个天文台？",
    answer1 = "格林威治",
    answer2 = "格林威治天文台",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(440)->
    #allplayerquestionCfg {
    iD = 440,
    question = "十进制的\"522\"换算成十六进制是多少？",
    answer1 = "1314",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(441)->
    #allplayerquestionCfg {
    iD = 441,
    question = "高浓度的吲哚类物质，闻起来是什么味道？",
    answer1 = "臭味",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(442)->
    #allplayerquestionCfg {
    iD = 442,
    question = "四大名著《红楼梦》还有一个名字是？",
    answer1 = "石头记",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(443)->
    #allplayerquestionCfg {
    iD = 443,
    question = "世界著名公司“微软”的全称拼写是？",
    answer1 = "Microsoft",
    answer2 = "microsoft",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(444)->
    #allplayerquestionCfg {
    iD = 444,
    question = "小说中，《六脉神剑》是被收藏在哪个寺庙的？",
    answer1 = "天龙寺",
    answer2 = "崇圣寺",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(445)->
    #allplayerquestionCfg {
    iD = 445,
    question = "世界文学中的四大吝啬鬼除了泼留希金、夏洛克、阿巴贡，还有谁？",
    answer1 = "葛朗台",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(446)->
    #allplayerquestionCfg {
    iD = 446,
    question = "和苹果公司有非常深渊源的一家世界著名动画公司是？",
    answer1 = "皮克斯",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(447)->
    #allplayerquestionCfg {
    iD = 447,
    question = "世界著名动画公司皮克斯的作品中，在结尾都会特别感谢一个人，他是？",
    answer1 = "史蒂夫乔布斯",
    answer2 = "stevejobs",
    answer3 = "SteveJobs",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(448)->
    #allplayerquestionCfg {
    iD = 448,
    question = "《钢铁是怎样练成的》一书中，男主角的名字叫？",
    answer1 = "保尔柯察金",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(449)->
    #allplayerquestionCfg {
    iD = 449,
    question = "\"Bug\"一词现多用于程序中的错误，这个词本来是什么意思？",
    answer1 = "虫子",
    answer2 = "臭虫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(450)->
    #allplayerquestionCfg {
    iD = 450,
    question = "F1方程式比赛中，被人们称为\"车神\"的选手是？",
    answer1 = "舒马赫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(451)->
    #allplayerquestionCfg {
    iD = 451,
    question = "动画片《数码宝贝I》中，天使兽是由什么进化而来？",
    answer1 = "巴达兽",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(452)->
    #allplayerquestionCfg {
    iD = 452,
    question = "接取情缘任务的Npc【Mr.Wang】手上拿的时装武器叫？",
    answer1 = "粉粉十字",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(453)->
    #allplayerquestionCfg {
    iD = 453,
    question = "我们常说的显示器多少寸，这里的寸指的是显示器哪里的长度？",
    answer1 = "对角线",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(454)->
    #allplayerquestionCfg {
    iD = 454,
    question = "-1的0次方是多少",
    answer1 = "1",
    answer2 = "一",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(455)->
    #allplayerquestionCfg {
    iD = 455,
    question = "苹果公司生产的个人计算机全称是？",
    answer1 = "macintosh",
    answer2 = "麦金塔",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(456)->
    #allplayerquestionCfg {
    iD = 456,
    question = "常用的照片处理软件\"PS\"是哪一家公司的产品",
    answer1 = "Adobe",
    answer2 = "奥多比",
    answer3 = "adobe",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(457)->
    #allplayerquestionCfg {
    iD = 457,
    question = "世界著名外设厂商\"罗技\"，是哪里的公司？",
    answer1 = "瑞士",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(458)->
    #allplayerquestionCfg {
    iD = 458,
    question = "动画片《FateStayNight》中，从者\"红A\"生前的名字是？",
    answer1 = "卫宫士郎",
    answer2 = "土狼",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(459)->
    #allplayerquestionCfg {
    iD = 459,
    question = "动画片《中华小当家》中的主角\"小当家\"的本名叫？",
    answer1 = "刘昂星",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(460)->
    #allplayerquestionCfg {
    iD = 460,
    question = "华人设计师贝聿铭先生参与设计的著名博物馆是？",
    answer1 = "卢浮宫",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(461)->
    #allplayerquestionCfg {
    iD = 461,
    question = "颁发给在计算机科学领域有突出贡献者的最高奖项是？",
    answer1 = "图灵奖",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(462)->
    #allplayerquestionCfg {
    iD = 462,
    question = "\"炸药奖\"一共有多少个奖项分类？（只答数字即可）",
    answer1 = "六",
    answer2 = "6",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(463)->
    #allplayerquestionCfg {
    iD = 463,
    question = "\"修道院啤酒\"以哪一个国家出产的最为有名？",
    answer1 = "比利时",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(464)->
    #allplayerquestionCfg {
    iD = 464,
    question = "晁补之称赞北宋哪位画家时说的：文同画竹，早已胸有成竹了。",
    answer1 = "文同",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(465)->
    #allplayerquestionCfg {
    iD = 465,
    question = "除了泰山、华山、衡山、恒山，五岳中还有一座是？",
    answer1 = "嵩山",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(466)->
    #allplayerquestionCfg {
    iD = 466,
    question = "“俺也是从石头里蹦出来的，为啥我不是猴子呢？”出自lol中哪名英雄之口？",
    answer1 = "墨菲特",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(467)->
    #allplayerquestionCfg {
    iD = 467,
    question = "“花谢花飞花满天，红消香断有谁怜？”出自谁的葬花吟？",
    answer1 = "曹雪芹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(468)->
    #allplayerquestionCfg {
    iD = 468,
    question = "长城 The Great Wall 电影的导演是谁？",
    answer1 = "张艺谋",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(469)->
    #allplayerquestionCfg {
    iD = 469,
    question = "吴京导演的什么电影达到了56.81亿票房？",
    answer1 = "战狼2",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(470)->
    #allplayerquestionCfg {
    iD = 470,
    question = "同性相吸引，异性相斥是指什么样的石头？",
    answer1 = "磁石",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(471)->
    #allplayerquestionCfg {
    iD = 471,
    question = "平流层中更靠近地球的空气层称？",
    answer1 = "对流层",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(472)->
    #allplayerquestionCfg {
    iD = 472,
    question = "鲸鱼、鱿鱼、章鱼、墨鱼、鲍鱼、鳄鱼、娃娃鱼，其中哪一个不是鱼类？",
    answer1 = "都不是",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(473)->
    #allplayerquestionCfg {
    iD = 473,
    question = "内华达州南部林肯郡一个机密区域称作什么？",
    answer1 = "51区",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(474)->
    #allplayerquestionCfg {
    iD = 474,
    question = "弗吉尼亚海岸，百慕大群岛和佛罗里大群岛间的魔鬼三角洲称为什么大三角？",
    answer1 = "百慕大三角",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(475)->
    #allplayerquestionCfg {
    iD = 475,
    question = "丝绸之路起源于西汉（前202年—8年）汉武帝派哪位出使西域开辟的？",
    answer1 = "张骞",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(476)->
    #allplayerquestionCfg {
    iD = 476,
    question = "秦灭六国之战，最后一个击破的国家是？",
    answer1 = "齐",
    answer2 = "齐国",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(477)->
    #allplayerquestionCfg {
    iD = 477,
    question = "别名祖龙的千古一帝叫什么名字？",
    answer1 = "嬴政",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(478)->
    #allplayerquestionCfg {
    iD = 478,
    question = "爱新觉罗氏末代皇帝是哪位？",
    answer1 = "傅仪皇帝",
    answer2 = "傅仪",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(479)->
    #allplayerquestionCfg {
    iD = 479,
    question = "人生三大喜事，分别是金榜题名时、洞房花烛夜？",
    answer1 = "他乡遇故知",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(480)->
    #allplayerquestionCfg {
    iD = 480,
    question = "网易公司研发的阴阳师手游中，主角名字为？",
    answer1 = "晴明",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(481)->
    #allplayerquestionCfg {
    iD = 481,
    question = "美国宾夕法尼亚大学诞生世界上第一台通用计算机名字叫？",
    answer1 = "ENIAC",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(482)->
    #allplayerquestionCfg {
    iD = 482,
    question = "计算机机器组成硬件系统中，哪个部位称为计算机大脑（英文简写）？",
    answer1 = "CPU",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(483)->
    #allplayerquestionCfg {
    iD = 483,
    question = "html语言中文全称是？",
    answer1 = "超级文本标记语言",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(484)->
    #allplayerquestionCfg {
    iD = 484,
    question = "游戏中第一个NPC名字叫什么？",
    answer1 = "派诺",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(485)->
    #allplayerquestionCfg {
    iD = 485,
    question = "图鉴激活，是打怪激活还是拍照激活？",
    answer1 = "拍照",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(486)->
    #allplayerquestionCfg {
    iD = 486,
    question = "中国第一部长篇章回体历史演义小说且为中国古典四大名著之一的小说是？",
    answer1 = "三国演义",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(487)->
    #allplayerquestionCfg {
    iD = 487,
    question = "中国哪个地方的东西最不便宜？（脑经急转弯）",
    answer1 = "贵州",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(488)->
    #allplayerquestionCfg {
    iD = 488,
    question = "说唱歌曲”爽翻，巴适的板“前一句是什么 ？",
    answer1 = "老子明天不上班",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(489)->
    #allplayerquestionCfg {
    iD = 489,
    question = "路飞的初吻给谁的？",
    answer1 = "香吉士的姐姐",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(490)->
    #allplayerquestionCfg {
    iD = 490,
    question = "中国四大名著：西游记、红楼梦、水浒传，还有什么？",
    answer1 = "三国演义",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(491)->
    #allplayerquestionCfg {
    iD = 491,
    question = "水浒传作者是？",
    answer1 = "施耐庵",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(492)->
    #allplayerquestionCfg {
    iD = 492,
    question = "“大白天打劫——”歇后语是什么？",
    answer1 = "明目张胆",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(493)->
    #allplayerquestionCfg {
    iD = 493,
    question = "“山无陵，江水为竭。冬雷震震，夏雨雪”下一句是什么？",
    answer1 = "天地和，乃敢与君绝",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(494)->
    #allplayerquestionCfg {
    iD = 494,
    question = "《还珠格格》第一部主题曲是？",
    answer1 = "当",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(495)->
    #allplayerquestionCfg {
    iD = 495,
    question = "《不负如来不负卿》作者是？",
    answer1 = "仓央嘉措",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(496)->
    #allplayerquestionCfg {
    iD = 496,
    question = "“众里寻他千百度，蓦然回首，那人却在，灯火阑珊处”出自哪一首诗？",
    answer1 = "青玉案·元夕",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(497)->
    #allplayerquestionCfg {
    iD = 497,
    question = "“蒹葭苍苍，白露为霜”，蒹葭只指什么？",
    answer1 = "芦苇",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(498)->
    #allplayerquestionCfg {
    iD = 498,
    question = "《繁星》《春水》的作者“冰心”原名叫什么？",
    answer1 = "谢婉莹",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(499)->
    #allplayerquestionCfg {
    iD = 499,
    question = "《假如生活欺骗了你》的作者是？",
    answer1 = "普希金",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(500)->
    #allplayerquestionCfg {
    iD = 500,
    question = "“孔夫子搬家——”歇后语是什么？",
    answer1 = "净是书",
    answer2 = "净是输",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(501)->
    #allplayerquestionCfg {
    iD = 501,
    question = "千古绝唱《钗头凤·世情薄》《钗头凤·红酥手》，是陆游与谁的爱情故事？",
    answer1 = "唐婉",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(502)->
    #allplayerquestionCfg {
    iD = 502,
    question = "“天不老，情难绝，心似双丝网”下一句是什么？",
    answer1 = "中有千千结",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(503)->
    #allplayerquestionCfg {
    iD = 503,
    question = "什么路最窄?",
    answer1 = "冤家路窄",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(504)->
    #allplayerquestionCfg {
    iD = 504,
    question = "《一帘幽梦》、《心有千千结》的作者“琼瑶”原名叫什么？",
    answer1 = "陈喆",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(505)->
    #allplayerquestionCfg {
    iD = 505,
    question = "《射雕英雄传》《神雕侠侣》的作者“金庸”原名叫什么？",
    answer1 = "查良镛",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(506)->
    #allplayerquestionCfg {
    iD = 506,
    question = "“山有木兮木有枝，”下一句是什么？",
    answer1 = "心悦君兮君不知",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(507)->
    #allplayerquestionCfg {
    iD = 507,
    question = "埋在地下一千年的酒,出来以后叫什么？",
    answer1 = "酒精",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(508)->
    #allplayerquestionCfg {
    iD = 508,
    question = "哪种水果视力最差?",
    answer1 = "芒果",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(509)->
    #allplayerquestionCfg {
    iD = 509,
    question = "如果有一辆车,司机是王子,乘客是公主,请问这辆车是谁的呢?",
    answer1 = "如果的",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(510)->
    #allplayerquestionCfg {
    iD = 510,
    question = "我国最北的城市是？",
    answer1 = "漠河",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(511)->
    #allplayerquestionCfg {
    iD = 511,
    question = "“年年岁岁花相似”的后一句是？",
    answer1 = "岁岁年年人不同",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(512)->
    #allplayerquestionCfg {
    iD = 512,
    question = "围攻光明顶的六大门派有“少林，武当，华山，峨嵋，崆峒”和？",
    answer1 = "昆仑",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(513)->
    #allplayerquestionCfg {
    iD = 513,
    question = "在月宫砍树的人是谁？",
    answer1 = "吴刚",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(514)->
    #allplayerquestionCfg {
    iD = 514,
    question = "著名的精卫填海的精卫是谁的女儿？",
    answer1 = "炎帝",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(515)->
    #allplayerquestionCfg {
    iD = 515,
    question = "凤凰里公的是？",
    answer1 = "凤",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(516)->
    #allplayerquestionCfg {
    iD = 516,
    question = "哪吒的师傅是谁？",
    answer1 = "太乙真人",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(517)->
    #allplayerquestionCfg {
    iD = 517,
    question = "新四大发明是指“支付宝、网购、共享单车“和什么？",
    answer1 = "高铁",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(518)->
    #allplayerquestionCfg {
    iD = 518,
    question = "新四大发明是指“高铁、共享单车、网购“和什么？",
    answer1 = "支付宝",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(519)->
    #allplayerquestionCfg {
    iD = 519,
    question = "令狐冲的师傅是？",
    answer1 = "岳不群",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(520)->
    #allplayerquestionCfg {
    iD = 520,
    question = "孙悟空的师傅是？",
    answer1 = "菩提老祖",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(521)->
    #allplayerquestionCfg {
    iD = 521,
    question = "沙僧原为天庭的什么职位？",
    answer1 = "卷帘大将",
    reward_server = [{6,10}],
    reward_client = [{3,10}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240},
    {241},
    {242},
    {243},
    {244},
    {245},
    {246},
    {247},
    {248},
    {249},
    {250},
    {251},
    {252},
    {253},
    {254},
    {255},
    {256},
    {257},
    {258},
    {259},
    {260},
    {261},
    {262},
    {263},
    {264},
    {265},
    {266},
    {267},
    {268},
    {269},
    {270},
    {271},
    {272},
    {273},
    {274},
    {275},
    {276},
    {277},
    {278},
    {279},
    {280},
    {281},
    {282},
    {283},
    {284},
    {285},
    {286},
    {287},
    {288},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {298},
    {299},
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307},
    {308},
    {309},
    {310},
    {311},
    {312},
    {313},
    {314},
    {315},
    {316},
    {317},
    {318},
    {319},
    {320},
    {321},
    {322},
    {323},
    {324},
    {325},
    {326},
    {327},
    {328},
    {329},
    {330},
    {331},
    {332},
    {333},
    {334},
    {335},
    {336},
    {337},
    {338},
    {339},
    {340},
    {341},
    {342},
    {343},
    {344},
    {345},
    {346},
    {347},
    {348},
    {349},
    {350},
    {351},
    {352},
    {353},
    {354},
    {355},
    {356},
    {357},
    {358},
    {359},
    {360},
    {361},
    {362},
    {363},
    {364},
    {365},
    {366},
    {367},
    {368},
    {369},
    {370},
    {371},
    {372},
    {373},
    {374},
    {375},
    {376},
    {377},
    {378},
    {379},
    {380},
    {381},
    {382},
    {383},
    {384},
    {385},
    {386},
    {387},
    {388},
    {389},
    {390},
    {391},
    {392},
    {393},
    {394},
    {395},
    {396},
    {397},
    {398},
    {399},
    {400},
    {401},
    {402},
    {403},
    {404},
    {405},
    {406},
    {407},
    {408},
    {409},
    {410},
    {411},
    {412},
    {413},
    {414},
    {415},
    {416},
    {417},
    {418},
    {419},
    {420},
    {421},
    {422},
    {423},
    {424},
    {425},
    {426},
    {427},
    {428},
    {429},
    {430},
    {431},
    {432},
    {433},
    {434},
    {435},
    {436},
    {437},
    {438},
    {439},
    {440},
    {441},
    {442},
    {443},
    {444},
    {445},
    {446},
    {447},
    {448},
    {449},
    {450},
    {451},
    {452},
    {453},
    {454},
    {455},
    {456},
    {457},
    {458},
    {459},
    {460},
    {461},
    {462},
    {463},
    {464},
    {465},
    {466},
    {467},
    {468},
    {469},
    {470},
    {471},
    {472},
    {473},
    {474},
    {475},
    {476},
    {477},
    {478},
    {479},
    {480},
    {481},
    {482},
    {483},
    {484},
    {485},
    {486},
    {487},
    {488},
    {489},
    {490},
    {491},
    {492},
    {493},
    {494},
    {495},
    {496},
    {497},
    {498},
    {499},
    {500},
    {501},
    {502},
    {503},
    {504},
    {505},
    {506},
    {507},
    {508},
    {509},
    {510},
    {511},
    {512},
    {513},
    {514},
    {515},
    {516},
    {517},
    {518},
    {519},
    {520},
    {521}
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
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    310,
    311,
    312,
    313,
    314,
    315,
    316,
    317,
    318,
    319,
    320,
    321,
    322,
    323,
    324,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    344,
    345,
    346,
    347,
    348,
    349,
    350,
    351,
    352,
    353,
    354,
    355,
    356,
    357,
    358,
    359,
    360,
    361,
    362,
    363,
    364,
    365,
    366,
    367,
    368,
    369,
    370,
    371,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    380,
    381,
    382,
    383,
    384,
    385,
    386,
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
    412,
    413,
    414,
    415,
    416,
    417,
    418,
    419,
    420,
    421,
    422,
    423,
    424,
    425,
    426,
    427,
    428,
    429,
    430,
    431,
    432,
    433,
    434,
    435,
    436,
    437,
    438,
    439,
    440,
    441,
    442,
    443,
    444,
    445,
    446,
    447,
    448,
    449,
    450,
    451,
    452,
    453,
    454,
    455,
    456,
    457,
    458,
    459,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    470,
    471,
    472,
    473,
    474,
    475,
    476,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492,
    493,
    494,
    495,
    496,
    497,
    498,
    499,
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    516,
    517,
    518,
    519,
    520,
    521
    ].

