%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 六月 2018 10:23
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(MEM_RECORD_HRL).
-define(MEM_RECORD_HRL, true).

%% 玩家部分数据的一个快照
-record(m_player,{
    % 玩家进程上线是初始化、运行时更新
    uid, aid, sid, name, sex, career, race, camp, level, pid, sock,
    % 进入地图进程同步更新
    mid, line, mpid, old_mid, old_line, old_pos,
    pos, state=0, hp=0
}).

%% 在线玩家的socket列表
-record(m_player_pid_sock,{uid, aid, pid, sock}).

%% 玩家数据预警
-record(m_alarm_policy, {id, limit, warn}).
-record(m_alarm_player, {uid, alarm_data}).




-endif.
