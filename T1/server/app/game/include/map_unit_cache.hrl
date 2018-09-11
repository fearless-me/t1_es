%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 九月 2018 11:17
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(MAP_UNIT_CACHE_HRL).
-define(MAP_UNIT_CACHE_HRL, true).

-record(m_cache_map_unit, {uid = 0, pid = 0, data_id = 0, name = "", map_id=0, line_id=0, owner = 0, type =0}).

-endif.
