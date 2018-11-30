%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 九月 2018 11:41
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(COMMON_CROSS_INC_HRL).
-define(COMMON_CROSS_INC_HRL, true).

%% 跨服玩家信息
%% 玩家跨服信息,

-define(MNESIA_PLAYER_CROSS, m_share_player_cross_lock).
-record(m_share_player_cross_lock, {uid = 0, src_sid = 0, cross_sid = 0, assign_time = 0}).

-record(r_to_cross_data, {aid, uid, pid, player_pub, player_online}).
-record(r_from_cross_data, {uid, pos, buff_list, battle_props}).


-endif.
