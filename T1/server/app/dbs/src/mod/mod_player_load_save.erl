%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 19:56
%%%-------------------------------------------------------------------
-module(mod_player_load_save).
-author("mawenhong").
-include("dbs_private.hrl").

%% API
-export([
    load_player/1, save_player/1,
    load_player_/1, save_player_/1
]).

load_player(PlayerID) ->
    Pid = dbs_worker_manager:get_worker_pid_(PlayerID),
    dbs_worker:load_player_data(Pid, PlayerID).

save_player(#player_data{player_id = PlayerID} = Data) ->
    Pid = dbs_worker_manager:get_worker_pid_(PlayerID),
    dbs_worker:save_player_data(Pid, Data).

load_player_(PlayerID) ->
    Pid = dbs_worker_manager:get_worker_pid_(PlayerID),
    dbs_worker:load_player_data_(Pid, PlayerID).

save_player_(#player_data{player_id = PlayerID} = Data) ->
    Pid = dbs_worker_manager:get_worker_pid_(PlayerID),
    dbs_worker:save_player_data_(Pid, Data).
    
