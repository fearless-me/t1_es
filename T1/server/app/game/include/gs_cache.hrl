%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 六月 2018 10:23
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(GS_CACHE_INC_HRL).
-define(GS_CACHE_INC_HRL, true).

%% 玩家部分数据的一个快照
-define(ETS_CACHE_PLAYER_PUB, ets_cache_player_pub).
-record(m_cache_player_pub, {
    % 玩家进程上线是初始化、运行时更新
    uid, aid, sid, name, sex, career, race, camp, level
}).

%% 在线玩家的实时数据
-define(ETS_CACHE_ONLINE_PLAYER, ets_cache_player_online).
-record(m_cache_online_player, {
    uid, aid, pid, socket, level, career = 0,
    old_map_id = -1, old_line = 0, old_pos, map_id = -1, line = 0, map_pid, pos,
    state = 0, hp = 0, attr = [], buff_list = []
}).

%% 记录跨服玩家
-define(ETS_CACHE_PLAYER_CROSS, ets_cache_player_cross).
-record(m_cache_player_cross, {uid, time}).

%% 在线账号
-define(ETS_CACHE_ACCOUNT_PID_SOCK, ets_cache_account_pid_sock).
-record(m_cache_account_pid_sock, {aid, pid, sock}).

%% 玩家数据预警
-define(ETS_CACHE_ALARM_POLICY, ets_cache_alarm_policy).
-record(m_cache_alarm_policy, {id, limit, warn}).

-define(ETS_CACHE_ALARM_PLAYER, ets_cache_alarm_player).
-record(m_cache_alarm_player, {uid, alarm_data}).

%% 地图上所有对象的共享ETS
-record(m_cache_map_object, {uid = 0, pid = 0, data_id = 0, map_id = 0, line_id = 0, owner = 0, type = 0}).
-define(ETS_CACHE_MAP_PET, m_cache_map_pet).
-define(ETS_CACHE_MAP_NPC, m_cache_map_npc).
-define(ETS_CACHE_MAP_PLAYER, m_cache_map_player).
-define(ETS_CACHE_MAP_MONSTER, m_cache_map_monster).








-endif.
