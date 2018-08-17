%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 14:09
%%%-------------------------------------------------------------------
-module(mod_player_cache_impl_mnesia).
-author("mawenhong").
-include("pub_rec.hrl").
-include("logger.hrl").
-include("dbs_private.hrl").

%% API
-export([load/1, save/1]).

load(RoleID) ->
    ?TRY_CATCH(load_1(RoleID)).

load_1(PlayerID) ->
    Tab = mnesia_starter:get_mem_table(player_data),
    case mnesia_utils:dirty_read(Tab, PlayerID) of
        [#player_data{} = Rec] -> Rec;
        _ -> load_from_persistent(Tab, PlayerID)
    end.

load_from_persistent(MemTab, PlayerID) ->
    PoolID = mysql_pool_manager:get_player_mysql_pool(PlayerID),
    Res = db:execute_stmt(PoolID, get_player_data, [PlayerID]),
    case db:succeed(Res) of
        true ->
            case db:as_record(Res, player_data, record_info(fields, player_data)) of
                [#player_data{} = Data] ->
                    mnesia_utils:dirty_write(MemTab, Data),
                    Data;
                _ ->
                    undefined
            end;
        _ ->
            undefined
    end.


save(#player_data{player_id = PlayerID, name = Name, data = Data, data_version = Version} = Rec) ->
    PoolID = mysql_pool_manager:get_player_mysql_pool(PlayerID),
    MemTab = mnesia_starter:get_mem_table(player_data),
    ok = mnesia_utils:dirty_write(MemTab, Rec),
    Res = db:execute_stmt(PoolID, insert_player_data, [PlayerID, Name, Data, Version]),
    db:succeed(Res).