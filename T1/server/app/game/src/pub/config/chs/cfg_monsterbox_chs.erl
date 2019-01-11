%% coding: latin-1
%%: 实现
-module(cfg_monsterbox_chs).
-compile(export_all).
-include("cfg_monsterbox.hrl").
-include("logger.hrl").

getRow(1)->
    #monsterboxCfg {
    id = 1,
    monsterid = [1],
    trigger1 = [0,1,3],
    odds1 = 100,
    p0 = "请勿删除",
    p1 = "请勿删除",
    p2 = "请勿删除",
    p3 = "请勿删除",
    p4 = "请勿删除",
    p5 = "请勿删除",
    time = 1,
    trigger2 = [0,1,3],
    odds2 = 100,
    param2 = [-1,1]
    };
getRow(2)->
    #monsterboxCfg {
    id = 2,
    monsterid = [9200,9202,9204,9206,9208,9210],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "大王最喜欢萝莉了！༎ຶ‿༎ຶ",
    p1 = "大王最喜欢萝莉了！༎ຶ‿༎ຶ",
    p4 = "大王最喜欢萝莉了！༎ຶ‿༎ຶ",
    time = 6,
    odds2 = 0
    };
getRow(3)->
    #monsterboxCfg {
    id = 3,
    monsterid = [9200,9202,9204,9206,9208,9210],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "大王最喜欢小萝莉了！（ ´థ౪థ）",
    p1 = "大王最喜欢小萝莉了！（ ´థ౪థ）",
    p4 = "大王最喜欢小萝莉了！（ ´థ౪థ）",
    time = 6,
    odds2 = 0
    };
getRow(4)->
    #monsterboxCfg {
    id = 4,
    monsterid = [9200,9202,9204,9206,9208,9210],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "大王最喜欢头戴飘带的小萝莉了！( ༎ຶŎ༎ຶ )",
    p1 = "大王最喜欢头戴飘带的小萝莉了！( ༎ຶŎ༎ຶ )",
    p4 = "大王最喜欢头戴飘带的小萝莉了！( ༎ຶŎ༎ຶ )",
    time = 6,
    odds2 = 0
    };
getRow(5)->
    #monsterboxCfg {
    id = 5,
    monsterid = [9200,9202,9204,9206,9208,9210],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "轻点，你弄疼我了！(/ω＼)",
    p1 = "轻点，你弄疼我了！(/ω＼)",
    p4 = "轻点，你弄疼我了！(/ω＼)",
    time = 6,
    odds2 = 0
    };
getRow(6)->
    #monsterboxCfg {
    id = 6,
    monsterid = [9200,9202,9204,9206,9208,9210],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "大王叫我来寻山啊啊啊啊(ᇴ‿ฺᇴ)",
    p1 = "大王叫我来寻山啊啊啊啊(ᇴ‿ฺᇴ)",
    p4 = "大王叫我来寻山啊啊啊啊(ᇴ‿ฺᇴ)",
    time = 6,
    odds2 = 0
    };
getRow(7)->
    #monsterboxCfg {
    id = 7,
    monsterid = [9200,9202,9204,9206,9208,9210],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "今天嗓子痛，不唱歌！⊂ZZZ⊃",
    p1 = "今天嗓子痛，不唱歌！⊂ZZZ⊃",
    p4 = "今天嗓子痛，不唱歌！⊂ZZZ⊃",
    time = 6,
    odds2 = 0
    };
getRow(8)->
    #monsterboxCfg {
    id = 8,
    monsterid = [9200,9202,9204,9206,9208,9210],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "你们唱的真难听！(ﾉ｀□´)ﾉ⌒┻━┻",
    p1 = "你们唱的真难听！(ﾉ｀□´)ﾉ⌒┻━┻",
    p4 = "你们唱的真难听！(ﾉ｀□´)ﾉ⌒┻━┻",
    time = 6,
    odds2 = 0
    };
getRow(9)->
    #monsterboxCfg {
    id = 9,
    monsterid = [9201,9203,9205,9207,9209,9211],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "今晚吃些什么呢？༎ຶ‿༎ຶ",
    p1 = "今晚吃些什么呢？༎ຶ‿༎ຶ",
    p4 = "今晚吃些什么呢？༎ຶ‿༎ຶ",
    time = 6,
    odds2 = 0
    };
getRow(10)->
    #monsterboxCfg {
    id = 10,
    monsterid = [9201,9203,9205,9207,9209,9211],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "请叫我绅士，我讨厌大王这个词儿！(/ω＼)",
    p1 = "请叫我绅士，我讨厌大王这个词儿！(/ω＼)",
    p4 = "请叫我绅士，我讨厌大王这个词儿！(/ω＼)",
    time = 6,
    odds2 = 0
    };
getRow(11)->
    #monsterboxCfg {
    id = 11,
    monsterid = [9201,9203,9205,9207,9209,9211],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "清蒸，炭烤还是油炸呢？（ ´థ౪థ）",
    p1 = "清蒸，炭烤还是油炸呢？（ ´థ౪థ）",
    p4 = "清蒸，炭烤还是油炸呢？（ ´థ౪థ）",
    time = 6,
    odds2 = 0
    };
getRow(12)->
    #monsterboxCfg {
    id = 12,
    monsterid = [9201,9203,9205,9207,9209,9211],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我的手下都是一群音乐家~哦吼吼(ᇴ‿ฺᇴ)",
    p1 = "我的手下都是一群音乐家~哦吼吼(ᇴ‿ฺᇴ)",
    p4 = "我的手下都是一群音乐家~哦吼吼(ᇴ‿ฺᇴ)",
    time = 6,
    odds2 = 0
    };
getRow(13)->
    #monsterboxCfg {
    id = 13,
    monsterid = [9201,9203,9205,9207,9209,9211],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "你们这群无知的人类！(ﾉ｀□´)ﾉ⌒┻━┻",
    p1 = "你们这群无知的人类！(ﾉ｀□´)ﾉ⌒┻━┻",
    p4 = "你们这群无知的人类！(ﾉ｀□´)ﾉ⌒┻━┻",
    time = 6,
    odds2 = 0
    };
getRow(500)->
    #monsterboxCfg {
    id = 500,
    monsterid = [981,982,983,984],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "老爹以前老是说，只有无聊的人才会去找寻世界的真实(ﾟAﾟ;)",
    p1 = "老爹以前老是说，只有无聊的人才会去找寻世界的真实(ﾟAﾟ;)",
    p4 = "老爹以前老是说，只有无聊的人才会去找寻世界的真实(ﾟAﾟ;)",
    time = 6,
    odds2 = 0
    };
getRow(501)->
    #monsterboxCfg {
    id = 501,
    monsterid = [981,982,983,984],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "所有残暴的欢愉，终将以残暴结束ψ(｀∇´)ψ",
    p1 = "所有残暴的欢愉，终将以残暴结束ψ(｀∇´)ψ",
    p4 = "所有残暴的欢愉，终将以残暴结束ψ(｀∇´)ψ",
    time = 6,
    odds2 = 0
    };
getRow(502)->
    #monsterboxCfg {
    id = 502,
    monsterid = [981,982,983,984],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "什么！你说我们只是一团虚假的代码！！ಠ_ಠ",
    p1 = "什么！你说我们只是一团虚假的代码！！ಠ_ಠ",
    p4 = "什么！你说我们只是一团虚假的代码！！ಠ_ಠ",
    time = 6,
    odds2 = 0
    };
getRow(503)->
    #monsterboxCfg {
    id = 503,
    monsterid = [981,982,983,984],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "既然分不清真伪，那么假的又如何！！^ↀᴥↀ^",
    p1 = "既然分不清真伪，那么假的又如何！！^ↀᴥↀ^",
    p4 = "既然分不清真伪，那么假的又如何！！^ↀᴥↀ^",
    time = 6,
    odds2 = 0
    };
getRow(504)->
    #monsterboxCfg {
    id = 504,
    monsterid = [981,982,983,984],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我们安瑞王朝鼎盛时，曾经创建了一个又一个虚拟的文明(▼▼)",
    p1 = "我们安瑞王朝鼎盛时，曾经创建了一个又一个虚拟的文明(▼▼)",
    p4 = "我们安瑞王朝鼎盛时，曾经创建了一个又一个虚拟的文明(▼▼)",
    time = 6,
    odds2 = 0
    };
getRow(505)->
    #monsterboxCfg {
    id = 505,
    monsterid = [981,982,983,984],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我们是王朝的战士，安瑞王朝意志的伟大继承者༼⌐■ل͟■༽",
    p1 = "我们是王朝的战士，安瑞王朝意志的伟大继承者༼⌐■ل͟■༽",
    p4 = "我们是王朝的战士，安瑞王朝意志的伟大继承者༼⌐■ل͟■༽",
    time = 6,
    odds2 = 0
    };
getRow(1000)->
    #monsterboxCfg {
    id = 1000,
    monsterid = [2000,2004,2500,2504],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "黄色属于我们这些明朗、快活的勤奋派✿♥‿♥✿",
    p1 = "黄色属于我们这些明朗、快活的勤奋派✿♥‿♥✿",
    p4 = "黄色属于我们这些明朗、快活的勤奋派✿♥‿♥✿",
    time = 6,
    odds2 = 0
    };
getRow(1001)->
    #monsterboxCfg {
    id = 1001,
    monsterid = [2000,2004,2500,2504],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    p1 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    p4 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    time = 6,
    odds2 = 0
    };
getRow(1002)->
    #monsterboxCfg {
    id = 1002,
    monsterid = [2000,2004,2500,2504],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    p1 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    p4 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    time = 6,
    odds2 = 0
    };
getRow(1003)->
    #monsterboxCfg {
    id = 1003,
    monsterid = [2000,2004,2500,2504],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    p1 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    p4 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    time = 6,
    odds2 = 0
    };
getRow(1004)->
    #monsterboxCfg {
    id = 1004,
    monsterid = [2000,2004,2500,2504],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p1 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 6,
    odds2 = 0
    };
getRow(1005)->
    #monsterboxCfg {
    id = 1005,
    monsterid = [2001,2005,2501,2505],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "红色属于我们这些要实现自己愿望的行动派✿♥‿♥✿",
    p1 = "红色属于我们这些要实现自己愿望的行动派✿♥‿♥✿",
    p4 = "红色属于我们这些要实现自己愿望的行动派✿♥‿♥✿",
    time = 6,
    odds2 = 0
    };
getRow(1006)->
    #monsterboxCfg {
    id = 1006,
    monsterid = [2001,2005,2501,2505],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    p1 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    p4 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    time = 6,
    odds2 = 0
    };
getRow(1007)->
    #monsterboxCfg {
    id = 1007,
    monsterid = [2001,2005,2501,2505],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    p1 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    p4 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    time = 6,
    odds2 = 0
    };
getRow(1008)->
    #monsterboxCfg {
    id = 1008,
    monsterid = [2001,2005,2501,2505],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    p1 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    p4 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    time = 6,
    odds2 = 0
    };
getRow(1009)->
    #monsterboxCfg {
    id = 1009,
    monsterid = [2001,2005,2501,2505],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p1 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 6,
    odds2 = 0
    };
getRow(1010)->
    #monsterboxCfg {
    id = 1010,
    monsterid = [2002,2006,2502,2506],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "绿色属于我们这些青青草原上悲剧的原谅派✿♥‿♥✿",
    p1 = "绿色属于我们这些青青草原上悲剧的原谅派✿♥‿♥✿",
    p4 = "绿色属于我们这些青青草原上悲剧的原谅派✿♥‿♥✿",
    time = 6,
    odds2 = 0
    };
getRow(1011)->
    #monsterboxCfg {
    id = 1011,
    monsterid = [2002,2006,2502,2506],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    p1 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    p4 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"(´⌣`ʃƪ)",
    time = 6,
    odds2 = 0
    };
getRow(1012)->
    #monsterboxCfg {
    id = 1012,
    monsterid = [2002,2006,2502,2506],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    p1 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    p4 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"(ღ˘⌣˘ღ)",
    time = 6,
    odds2 = 0
    };
getRow(1013)->
    #monsterboxCfg {
    id = 1013,
    monsterid = [2002,2006,2502,2506],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    p1 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    p4 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"♡ඩ⌔ඩ♡",
    time = 6,
    odds2 = 0
    };
getRow(1014)->
    #monsterboxCfg {
    id = 1014,
    monsterid = [2002,2006,2502,2506],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p1 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 6,
    odds2 = 0
    };
getRow(1015)->
    #monsterboxCfg {
    id = 1015,
    monsterid = [2003,2503],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "花花草草，我的小草在哪里?(=‘ｘ‘=)",
    p1 = "花花草草，我的小草在哪里?(=‘ｘ‘=)",
    p4 = "花花草草，我的小草在哪里?(=‘ｘ‘=)",
    time = 6,
    odds2 = 0
    };
getRow(1016)->
    #monsterboxCfg {
    id = 1016,
    monsterid = [2003,2503],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "草草花花，你的大花在这里！ฅ(≚ᄌ≚)",
    p1 = "草草花花，你的大花在这里！ฅ(≚ᄌ≚)",
    p4 = "草草花花，你的大花在这里！ฅ(≚ᄌ≚)",
    time = 6,
    odds2 = 0
    };
getRow(1017)->
    #monsterboxCfg {
    id = 1017,
    monsterid = [2003,2503],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "花中四君子分别是“花花，花花，花花，花花”ㅇㅅㅇ",
    p1 = "花中四君子分别是“花花，花花，花花，花花”ㅇㅅㅇ",
    p4 = "花中四君子分别是“花花，花花，花花，花花”ㅇㅅㅇ",
    time = 6,
    odds2 = 0
    };
getRow(1018)->
    #monsterboxCfg {
    id = 1018,
    monsterid = [2003,2503],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "花儿为什么这样红，这样红，样红，红 ʘ̥ꀾʘ̥",
    p1 = "花儿为什么这样红，这样红，样红，红 ʘ̥ꀾʘ̥",
    p4 = "花儿为什么这样红，这样红，样红，红 ʘ̥ꀾʘ̥",
    time = 6,
    odds2 = 0
    };
getRow(1019)->
    #monsterboxCfg {
    id = 1019,
    monsterid = [2003,2503],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "吃，吃，吃，吃 =ộ⍛ộ=",
    p1 = "吃，吃，吃，吃 =ộ⍛ộ=",
    p4 = "吃，吃，吃，吃 =ộ⍛ộ=",
    time = 6,
    odds2 = 0
    };
getRow(1035)->
    #monsterboxCfg {
    id = 1035,
    monsterid = [2007,2507],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我今天穿着的是红色衣裳！！( ･ὢ･ )",
    p1 = "我今天穿着的是红色衣裳！！( ･ὢ･ )",
    p4 = "我今天穿着的是红色衣裳！！( ･ὢ･ )",
    time = 6,
    odds2 = 0
    };
getRow(1036)->
    #monsterboxCfg {
    id = 1036,
    monsterid = [2007,2507],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "你的心跳告诉我你很紧张ヽ( ε∀ε )ノ",
    p1 = "你的心跳告诉我你很紧张ヽ( ε∀ε )ノ",
    p4 = "你的心跳告诉我你很紧张ヽ( ε∀ε )ノ",
    time = 6,
    odds2 = 0
    };
getRow(1037)->
    #monsterboxCfg {
    id = 1037,
    monsterid = [2007,2507],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "告诉我，你心中所想 (◔ д◔)",
    p1 = "告诉我，你心中所想 (◔ д◔)",
    p4 = "告诉我，你心中所想 (◔ д◔)",
    time = 6,
    odds2 = 0
    };
getRow(1038)->
    #monsterboxCfg {
    id = 1038,
    monsterid = [2007,2507],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "来和我玩吗，让我们手下见真章 ٩(๑`н´๑)۶",
    p1 = "来和我玩吗，让我们手下见真章 ٩(๑`н´๑)۶",
    p4 = "来和我玩吗，让我们手下见真章 ٩(๑`н´๑)۶",
    time = 6,
    odds2 = 0
    };
getRow(1100)->
    #monsterboxCfg {
    id = 1100,
    monsterid = [2010,2011,2013,2014,2510,2511,2513,2514],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "卫兵的职责只有服从",
    p1 = "卫兵的职责只有服从",
    p4 = "卫兵的职责只有服从",
    time = 6,
    odds2 = 0
    };
getRow(1101)->
    #monsterboxCfg {
    id = 1101,
    monsterid = [2010,2011,2013,2014],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "吾忠于我的祖国，忠于人民",
    p1 = "吾忠于我的祖国，忠于人民",
    p4 = "吾忠于我的祖国，忠于人民",
    time = 6,
    odds2 = 0
    };
getRow(1102)->
    #monsterboxCfg {
    id = 1102,
    monsterid = [2010,2011,2013,2014],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "老兵不死",
    p1 = "老兵不死",
    p4 = "老兵不死",
    time = 6,
    odds2 = 0
    };
getRow(1103)->
    #monsterboxCfg {
    id = 1103,
    monsterid = [2010,2011,2013,2014],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "那是一个冬天，银花刚盛放于雪树之上",
    p1 = "那是一个冬天，银花刚盛放于雪树之上",
    p4 = "那是一个冬天，银花刚盛放于雪树之上",
    time = 6,
    odds2 = 0
    };
getRow(1108)->
    #monsterboxCfg {
    id = 1108,
    monsterid = [2012,2512],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "没有人有权利剥夺我们的生命",
    p1 = "没有人有权利剥夺我们的生命",
    p4 = "没有人有权利剥夺我们的生命",
    time = 6,
    odds2 = 0
    };
getRow(1109)->
    #monsterboxCfg {
    id = 1109,
    monsterid = [2012,2512],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "骑士之魂，至死不休",
    p1 = "骑士之魂，至死不休",
    p4 = "骑士之魂，至死不休",
    time = 6,
    odds2 = 0
    };
getRow(1110)->
    #monsterboxCfg {
    id = 1110,
    monsterid = [2012,2512],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "忠诚，荣誉，牺牲，勇敢，怜悯，精神，诚实，公正",
    p1 = "忠诚，荣誉，牺牲，勇敢，怜悯，精神，诚实，公正",
    p4 = "忠诚，荣誉，牺牲，勇敢，怜悯，精神，诚实，公正",
    time = 6,
    odds2 = 0
    };
getRow(1111)->
    #monsterboxCfg {
    id = 1111,
    monsterid = [2012,2512],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "北地的冬天，微冷",
    p1 = "北地的冬天，微冷",
    p4 = "北地的冬天，微冷",
    time = 6,
    odds2 = 0
    };
getRow(1120)->
    #monsterboxCfg {
    id = 1120,
    monsterid = [2015,2515],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我叫强森，但我更喜欢别人叫我巨石骑士",
    p1 = "我叫强森，但我更喜欢别人叫我巨石骑士",
    p4 = "我叫强森，但我更喜欢别人叫我巨石骑士",
    time = 6,
    odds2 = 0
    };
getRow(1121)->
    #monsterboxCfg {
    id = 1121,
    monsterid = [2015,2515],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "一切都是命运的抉择",
    p1 = "一切都是命运的抉择",
    p4 = "一切都是命运的抉择",
    time = 6,
    odds2 = 0
    };
getRow(1122)->
    #monsterboxCfg {
    id = 1122,
    monsterid = [2015,2515],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "只有永恒才能够一直保留希望的种子",
    p1 = "只有永恒才能够一直保留希望的种子",
    p4 = "只有永恒才能够一直保留希望的种子",
    time = 6,
    odds2 = 0
    };
getRow(1123)->
    #monsterboxCfg {
    id = 1123,
    monsterid = [2015,2515],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "胜利就在眼前",
    p1 = "胜利就在眼前",
    p4 = "胜利就在眼前",
    time = 6,
    odds2 = 0
    };
getRow(1200)->
    #monsterboxCfg {
    id = 1200,
    monsterid = [2020,2520],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我喜欢你，但我无法原谅人类",
    p1 = "我喜欢你，但我无法原谅人类",
    p4 = "我喜欢你，但我无法原谅人类",
    time = 6,
    odds2 = 0
    };
getRow(1201)->
    #monsterboxCfg {
    id = 1201,
    monsterid = [2020,2520],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "好人都是那些死去的人，比如我",
    p1 = "好人都是那些死去的人，比如我",
    p4 = "好人都是那些死去的人，比如我",
    time = 6,
    odds2 = 0
    };
getRow(1202)->
    #monsterboxCfg {
    id = 1202,
    monsterid = [2020,2520],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "2012年冬，死因不明",
    p1 = "2012年冬，死因不明",
    p4 = "2012年冬，死因不明",
    time = 6,
    odds2 = 0
    };
getRow(1203)->
    #monsterboxCfg {
    id = 1203,
    monsterid = [2020,2520],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我真的，…，好冷",
    p1 = "我真的，…，好冷",
    p4 = "我真的，…，好冷",
    time = 6,
    odds2 = 0
    };
getRow(1204)->
    #monsterboxCfg {
    id = 1204,
    monsterid = [2021,2521],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我喜欢你，但我无法原谅人类",
    p1 = "我喜欢你，但我无法原谅人类",
    p4 = "我喜欢你，但我无法原谅人类",
    time = 6,
    odds2 = 0
    };
getRow(1205)->
    #monsterboxCfg {
    id = 1205,
    monsterid = [2021,2521],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "好人都是那些死去的人，比如我",
    p1 = "好人都是那些死去的人，比如我",
    p4 = "好人都是那些死去的人，比如我",
    time = 6,
    odds2 = 0
    };
getRow(1206)->
    #monsterboxCfg {
    id = 1206,
    monsterid = [2021,2521],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "2012年冬，死因不明",
    p1 = "2012年冬，死因不明",
    p4 = "2012年冬，死因不明",
    time = 6,
    odds2 = 0
    };
getRow(1207)->
    #monsterboxCfg {
    id = 1207,
    monsterid = [2021,2521],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "我真的，…，好冷",
    p1 = "我真的，…，好冷",
    p4 = "我真的，…，好冷",
    time = 6,
    odds2 = 0
    };
getRow(1208)->
    #monsterboxCfg {
    id = 1208,
    monsterid = [2022,2023,2024,2025,2522,2523,2524,2525],
    trigger1 = [0,1,4],
    odds1 = 80,
    p0 = "！@#￥%……&*+（神语，含义不明）",
    p1 = "！@#￥%……&*+（神语，含义不明）",
    p4 = "！@#￥%……&*+（神语，含义不明）",
    time = 6,
    odds2 = 0
    };
getRow(10001)->
    #monsterboxCfg {
    id = 10001,
    monsterid = [22007],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "大王来得太快，就像龙卷风~",
    p1 = "将你们化成粉末！",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10002)->
    #monsterboxCfg {
    id = 10002,
    monsterid = [22013],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想赢我？在修炼一百年吧。",
    p1 = "哈哈，力量至上！",
    p3 = "我不会输！",
    time = 5,
    odds2 = 0
    };
getRow(10003)->
    #monsterboxCfg {
    id = 10003,
    monsterid = [22009],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "让我见识一下你的实力吧。",
    p1 = "哇，你好强。",
    p3 = "不愧是光明勇士",
    time = 5,
    odds2 = 0
    };
getRow(10004)->
    #monsterboxCfg {
    id = 10004,
    monsterid = [22018,22022],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想跟我打架，自不量力！",
    p1 = "刀刀见血！",
    p3 = "我不会放过你的！",
    time = 5,
    odds2 = 0
    };
getRow(10005)->
    #monsterboxCfg {
    id = 10005,
    monsterid = [22001],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "我很美，但是也很暴力。",
    p1 = "看我的花粉攻击！",
    p3 = "花蕊谢了……",
    time = 5,
    odds2 = 0
    };
getRow(10007)->
    #monsterboxCfg {
    id = 10007,
    monsterid = [22009],
    trigger1 = [0,1,3,5],
    odds1 = 60,
    p0 = "可恶，竟然跟踪偷袭我~",
    p1 = "可恶，竟然跟踪偷袭我~",
    p3 = "大王……我还需要魔力",
    p5 = "可恶，竟然跟踪偷袭我~",
    time = 5,
    odds2 = 0
    };
getRow(10008)->
    #monsterboxCfg {
    id = 10008,
    monsterid = [22002],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "记住我的名字，著名的史莱姆宝宝，超可爱。",
    p1 = "史莱姆生气啦！",
    p3 = "我……我好想吃鱼……",
    time = 5,
    odds2 = 0
    };
getRow(10009)->
    #monsterboxCfg {
    id = 10009,
    monsterid = [22015],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "作为小弟，我们的宗旨是跟着大王吃美食。",
    p1 = "跟着大王一起进攻！",
    p3 = "跟着大王一起领便当……",
    time = 5,
    odds2 = 0
    };
getRow(10010)->
    #monsterboxCfg {
    id = 10010,
    monsterid = [22016],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "啊，有人闯进来了！",
    p1 = "呜，好疼。",
    p3 = "主人，我被打败了……",
    time = 5,
    odds2 = 0
    };
getRow(10011)->
    #monsterboxCfg {
    id = 10011,
    monsterid = [30009],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想跟我打架，自不量力！",
    p1 = "刀刀见血！",
    p3 = "我不会放过你的！",
    time = 5,
    odds2 = 0
    };
getRow(10012)->
    #monsterboxCfg {
    id = 10012,
    monsterid = [22018],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想赢我？在修炼一百年吧。",
    p1 = "哈哈，力量至上！",
    p3 = "我不会输！",
    time = 5,
    odds2 = 0
    };
getRow(10013)->
    #monsterboxCfg {
    id = 10013,
    monsterid = [22019],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "烧成灰烬吧~！",
    p1 = "哼，别想打败我。",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10014)->
    #monsterboxCfg {
    id = 10014,
    monsterid = [22022],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "大王来得太快，就像龙卷风~",
    p1 = "将你们化成粉末！",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10017)->
    #monsterboxCfg {
    id = 10017,
    monsterid = [22024],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想赢我？在修炼一百年吧。",
    p1 = "哈哈，力量至上！",
    p3 = "我不会输！",
    time = 5,
    odds2 = 0
    };
getRow(10018)->
    #monsterboxCfg {
    id = 10018,
    monsterid = [22019],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "来切磋一下么，看看谁的头更硬？",
    p1 = "别想撞过我。",
    p3 = "额……",
    time = 5,
    odds2 = 0
    };
getRow(10019)->
    #monsterboxCfg {
    id = 10019,
    monsterid = [22027],
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "魔族是最强的！",
    p1 = "胜者为王。",
    p3 = "额……",
    time = 5,
    odds2 = 0
    };
getRow(10020)->
    #monsterboxCfg {
    id = 10020,
    monsterid = [22007],
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "善良的人类，下手轻一点哟！",
    p4 = "善良的人类，下手轻一点哟！",
    time = 5,
    odds2 = 0
    };
getRow(10022)->
    #monsterboxCfg {
    id = 10022,
    monsterid = [22007],
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "关爱小鱼人，人人有责。",
    p4 = "关爱小鱼人，人人有责。",
    time = 5,
    odds2 = 0
    };
getRow(10023)->
    #monsterboxCfg {
    id = 10023,
    monsterid = [22000,22016],
    trigger1 = [0,3,4],
    odds1 = 50,
    p0 = "来追我呀，追不到，追不到…",
    p3 = "躲进龟壳你就找不到我了。",
    p4 = "躲进龟壳你就找不到我了。",
    time = 5,
    odds2 = 0
    };
getRow(10025)->
    #monsterboxCfg {
    id = 10025,
    monsterid = [22002],
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 5,
    odds2 = 0
    };
getRow(10026)->
    #monsterboxCfg {
    id = 10026,
    monsterid = [22002],
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "你能找到谁才是本宝宝吗~~",
    p4 = "你能找到谁才是本宝宝吗~~",
    time = 5,
    odds2 = 0
    };
getRow(10027)->
    #monsterboxCfg {
    id = 10027,
    monsterid = [22002],
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "你是不是猴子派来的逗比？",
    p4 = "你是不是猴子派来的逗比？",
    time = 5,
    odds2 = 0
    };
getRow(10028)->
    #monsterboxCfg {
    id = 10028,
    monsterid = [22031],
    trigger1 = [0,1,3,4],
    odds1 = 50,
    p0 = "不要以为只有玫瑰才带刺~吱(｡･･｡)",
    p1 = "看我的花粉攻击！",
    p3 = "花蕊谢了……",
    p4 = "不要以为只有玫瑰才带刺~吱(｡･･｡)",
    time = 5,
    odds2 = 0
    };
getRow(10029)->
    #monsterboxCfg {
    id = 10029,
    monsterid = [22031],
    trigger1 = [0,1,3,4],
    odds1 = 60,
    p0 = "我很美，但是也很暴力。",
    p1 = "看我的花粉攻击！",
    p3 = "花蕊谢了……",
    p4 = "我很美，但是也很暴力。",
    time = 5,
    odds2 = 0
    };
getRow(10030)->
    #monsterboxCfg {
    id = 10030,
    monsterid = [22001],
    trigger1 = [0,1,3,4],
    odds1 = 50,
    p0 = "菇菇，菇菇！进攻！",
    p1 = "别想这样战胜我们……",
    p3 = "菇菇输了……",
    p4 = "菇菇，菇菇！进攻！",
    time = 5,
    odds2 = 0
    };
getRow(10031)->
    #monsterboxCfg {
    id = 10031,
    monsterid = [22013],
    trigger1 = [0],
    odds1 = 50,
    p0 = "只想安静地看风景，偏偏老是被打扰！",
    time = 5,
    odds2 = 0
    };
getRow(10032)->
    #monsterboxCfg {
    id = 10032,
    monsterid = [22013],
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "这片海岛被我承包了。",
    time = 5,
    odds2 = 0
    };
getRow(10033)->
    #monsterboxCfg {
    id = 10033,
    monsterid = [22013],
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "我不想伤害你，可是我控制不住我自己啊~",
    time = 5,
    odds2 = 0
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
    {500},
    {501},
    {502},
    {503},
    {504},
    {505},
    {1000},
    {1001},
    {1002},
    {1003},
    {1004},
    {1005},
    {1006},
    {1007},
    {1008},
    {1009},
    {1010},
    {1011},
    {1012},
    {1013},
    {1014},
    {1015},
    {1016},
    {1017},
    {1018},
    {1019},
    {1035},
    {1036},
    {1037},
    {1038},
    {1100},
    {1101},
    {1102},
    {1103},
    {1108},
    {1109},
    {1110},
    {1111},
    {1120},
    {1121},
    {1122},
    {1123},
    {1200},
    {1201},
    {1202},
    {1203},
    {1204},
    {1205},
    {1206},
    {1207},
    {1208},
    {10001},
    {10002},
    {10003},
    {10004},
    {10005},
    {10007},
    {10008},
    {10009},
    {10010},
    {10011},
    {10012},
    {10013},
    {10014},
    {10017},
    {10018},
    {10019},
    {10020},
    {10022},
    {10023},
    {10025},
    {10026},
    {10027},
    {10028},
    {10029},
    {10030},
    {10031},
    {10032},
    {10033}
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
    500,
    501,
    502,
    503,
    504,
    505,
    1000,
    1001,
    1002,
    1003,
    1004,
    1005,
    1006,
    1007,
    1008,
    1009,
    1010,
    1011,
    1012,
    1013,
    1014,
    1015,
    1016,
    1017,
    1018,
    1019,
    1035,
    1036,
    1037,
    1038,
    1100,
    1101,
    1102,
    1103,
    1108,
    1109,
    1110,
    1111,
    1120,
    1121,
    1122,
    1123,
    1200,
    1201,
    1202,
    1203,
    1204,
    1205,
    1206,
    1207,
    1208,
    10001,
    10002,
    10003,
    10004,
    10005,
    10007,
    10008,
    10009,
    10010,
    10011,
    10012,
    10013,
    10014,
    10017,
    10018,
    10019,
    10020,
    10022,
    10023,
    10025,
    10026,
    10027,
    10028,
    10029,
    10030,
    10031,
    10032,
    10033
    ].

