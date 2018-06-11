%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:15
%%%-------------------------------------------------------------------
-module(serv_cache_logic).
-author("mawenhong").
-include("logger.hrl").
-include("pub_common.hrl").
-include("mem_record.hrl").
-include("gdef.hrl").

%% API
-export([init/0]).

%%-------------------------------------------------------------------
init() ->
    ets:new(?ETS_PLAYER_PUB,   [named_table, public, {keypos, #m_player.uid},           ?ETSRC, ?ETSWC]),
    ets:new(?ETS_PLAYER_PSOCK, [named_table, public, {keypos, #m_player_pid_sock.uid},  ?ETSRC, ?ETSWC]),
    ets:new(?ETS_ACCOUNT_PSOCK,[named_table, public, {keypos, #m_account_pid_sock.aid},  ?ETSRC, ?ETSWC]),
    ok.


