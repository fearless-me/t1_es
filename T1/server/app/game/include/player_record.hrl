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
    % 玩家进程上线是初始化、运行时更新
    uid, aid, sid, name, sex, career, race, camp, level, pid, sock,
    mid, line, mpid, old_mid, old_line, old_pos,
    % 进入地图进程同步更新
    pos, state=0, hp=0
}).

-endif.
