%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:15
%%%-------------------------------------------------------------------
-module(gmem).
-author("mawenhong").
-include("logger.hrl").
-include("pub_common.hrl").
-include("mem_record.hrl").
-include("gdef.hrl").

%% API
-export([init_mem_db/0]).

%%-------------------------------------------------------------------
init_mem_db() ->
    ets:new(?ETS_PLAYER_PUB,   [named_table, public, {keypos, #m_player.uid},           ?ETSRC, ?ETSWC]),
    ets:new(?ETS_PLAYER_PSOCK, [named_table, public, {keypos, #m_player_pid_sock.uid},  ?ETSRC, ?ETSWC]),
    ok.


