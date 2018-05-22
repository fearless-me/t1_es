%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 五月 2018 10:15
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(RECORD_HRL).
-define(RECORD_HRL, true).

%%
-record(m_player,{
    uid,                                    %% 用户ID
    aid = 0,                                %% 平台账号ID
    acc = "",                               %% 平台账号
    name = "",                              %% 玩家名
    status = 0,                             %% 玩家状态（0正常、1禁止、2战斗中、3死亡、4蓝名、5挂机、6打坐、7凝神修炼8采矿,9答题）,
    reg_time = 0,                           %% 注册时间
    last_login_time = 0,                    %% 最后登陆时间
    last_login_ip = "",                     %% 最后登陆IP
    sex = 1,                                %% 性别 1男 2女
    career = 0,                             %% 职业 1，2，3，4，5（分别是玄武--战士、白虎--刺客、青龙--弓手、朱雀--牧师、麒麟--武尊）
    gold = 0,                               %% 元宝
    scene = 0,                              %% 场景ID
    x = 0,                                  %% X坐标
    y = 0,                                  %% Y坐标
    lv = 1,                                 %% 等级
    exp = 0,                                %% 经验
    hp = 0,                                 %% 气血
    mp = 0,                                 %% 内息
    max_attack = 0,                         %% 最大攻击力
    min_attack = 0,                         %% 最小攻击力
    mount = 0,                              %% 坐骑ID
    other,                                  %% 其他附加数据集
    sn = 0,                                 %% 服务器标识
    skill_list = [],
    lock_pid = []
}).

%%
-record(r_player_other, {
    uid = 0,
    pid = undefined,
    map_id = 0,
    map_pid = undefined,
    old_map_id = 0,
    old_map_pid = undefined,
    pos = undefined
}).


-endif.
