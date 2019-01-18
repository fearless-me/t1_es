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

%% @doc
%% 玩家部分数据的一个快照,提供给**本服务器*所有模块**访问
%%　
%% 包括服务器删给所有角色的信息
%% 这部分数据是玩家进程更新过来的
-define(ETS_CACHE_PLAYER_PUB, ets_cache_player_pub).
-record(m_cache_player_pub, {
    uid, aid, sid, name, sex, career, race, camp, head, level
}).

%% @doc
%% 在线玩家的实时数据（这部分数据是在线提供给**本服务器*所有模块**访问用的）
%% 玩家私有数据**不要**存到这里
%% 部分数据是由玩家进程更新
%% 部分数据是由地图进程更新（包括战斗相关的）
-define(ETS_CACHE_PLAYER_ONLINE, ets_cache_player_online).
-record(m_cache_player_online, {
    %-------------------------------------------------------------------
    %% 这些基础信息有玩家进程来更新
    uid, aid, pid, pid_send, pid_bg, socket, level=1, sid=0,
    name="", sex=0, career=1, race=1, camp=0, head=0,
    map_id = -1, line = 0, map_pid, old_map_id = -1, old_line = 0, old_pos,
    
    %-------------------------------------------------------------------
    %% 玩家移动时的实时位置由地图进程更新，其他情况下由玩家进程来更新
    pos,

    %-------------------------------------------------------------------
    %% 地图进程来维护的信息 这部分主要牵涉到战斗信息
    state = 0, %% 状态
    hp = 0, battle_props, buff_list = []
    %-------------------------------------------------------------------
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

%% 地图上所有对象的共享ETS(基础逻辑需要这个,其他逻辑使用object_rw模块)
-record(m_cache_map_object_priv, {uid = 0, pid = 0, data_id = 0, map_id = 0, line_id = 0, map_pid, owner = 0, type = 0}).
-define(ETS_CACHE_MAP_PET_PRIV, ets_cache_map_pet_priv).
-define(ETS_CACHE_MAP_NPC_PRIV, ets_cache_map_npc_priv).
-define(ETS_CACHE_MAP_PLAYER_PRIV, ets_cache_map_player_priv).
-define(ETS_CACHE_MAP_MONSTER_PRIV, ets_cache_map_monster_priv).

-record(m_cache_rate_control, {role_key, latest=0}).
-record(m_cache_rate_control_key, {key, limit=0}).
-define(ETS_CACHE_RATE_CONTROL_PRIV, ets_rate_control_priv).
-define(ETS_CACHE_RATE_CONTROL_KEY_PRIV, ets_rate_control_key_priv).








-endif.
