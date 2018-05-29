%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 20:05
%%%-------------------------------------------------------------------
-module(mod_player_cache_impl_ets).
-author("mawenhong").

-include("pub_common.hrl").
-include("dbs_private.hrl").
-include("logger.hrl").
%%-include("emysql.hrl").

%% API
%% API
-export([
    load/1, save/1
%%    load_emysql/1, save_emysql/1
]).



load(RoleID) ->
    ?TRY_CATCH(load_1(RoleID)).

load_1(PlayerID) ->
    case cache:get(player_cache, PlayerID) of
        #player_data{} = Rec -> Rec;
        _ -> load_from_persistent(PlayerID)
    end.

%%load_emysql(RoleID) ->
%%    ?TRY_CATCH(load_emysql_1(RoleID)).
%%
%%load_emysql_1(PlayerID) ->
%%    case cache:get(player_cache, PlayerID) of
%%        #player_data{} = Rec -> Rec;
%%        _ -> load_from_persistent_emysql(PlayerID)
%%    end.


%%load_from_persistent_emysql(PlayerID) ->
%%    PoolID = dbs_mysql_pool_manager:get_mysql_pool_(PlayerID),
%%    Res = emysql:execute(PoolID, format_load_sql(PlayerID)),
%%    case db_utils:succeed(Res) of
%%        true ->
%%            case emysql:as_record(Res, player_data, record_info(fields, player_data)) of
%%                [#player_data{} = Data] ->
%%                    cache:put(player_cache, PlayerID, Data),
%%                    Data;
%%                _ ->
%%                    undefined
%%            end;
%%        _ ->
%%            logger:error("db_interface:execute(~w,get_player_data,[~w]), ret=~w",
%%                [PoolID, PlayerID, Res]),
%%            undefined
%%    end.

load_from_persistent(PlayerID) ->
    PoolID = mysql_pool_manager:get_player_mysql_pool_(PlayerID),
    Res = db:query(PoolID, mod_sql_format:format_load_sql(PlayerID), infinity),
    case db:succeed(Res) of
        true ->
            case db:as_record(Res, player_data, record_info(fields, player_data)) of
                [#player_data{} = Data] ->
                    cache:put(player_cache, PlayerID, Data),
                    Data;
                _ ->
                    undefined
            end;
        _ ->
            ?ERROR("db_interface:execute(~w,get_player_data,[~w]), ret=~w",
                [PoolID, PlayerID, Res]),
            undefined
    end.

%%save_emysql(#player_data{player_id = PlayerID, name = Name, worker = Worker, data_version = Version, data = Data} = Rec) ->
%%    PoolID = dbs_mysql_pool_manager:get_mysql_pool_(PlayerID),
%%    cache:put(player_cache, PlayerID, Rec),
%%    true = db_utils:succeed(emysql:execute(PoolID, format_save_sql_del(PlayerID))),
%%    Res = emysql:execute(PoolID, format_save_sql_insert(PlayerID), [PlayerID, Name, Worker, Version, Data], infinity),
%%    case db_utils:succeed(Res) of
%%        true -> true;
%%        _ ->
%%            logger:error("[~p][~w]insert(~w), ret=~p",
%%                [erlang:process_info(self(),registered_name), PoolID, {PlayerID, Name, Worker, Version, Data}, Res]),
%%            cache:delete(player_cache, PlayerID),
%%            false
%%    end.

save(#player_data{player_id = PlayerID, name = Name, worker = Worker, data_version = Version, data = Data} = Rec) ->
    PoolID = mysql_pool_manager:get_player_mysql_pool_(PlayerID),
    OldData = cache:lookup(player_cache, PlayerID),
    cache:put(player_cache, PlayerID, Rec),
%%    Res = db_interface:execute(PoolID, insert_player_data, [PlayerID, Name, Data, Version]),
%%    true = mysql_interface:succeed(mysql_interface:query(PoolID, mod_sql_format:format_sql_del(PlayerID))),
    Res =
        case OldData of
            #player_data{data_version = OldVersion} when OldVersion >= Version ->
                ok;
            #player_data{} ->
                db:query(
                    PoolID,
                    mod_sql_format:format_sql_update(PlayerID, Data, Version),
                    infinity
                );
            _ ->
                SqlIns = mod_sql_format:format_sql_insert(PlayerID),
                db:query(
                    PoolID,
                    SqlIns,
                    [PlayerID, Name, Version, Data], infinity
                )
        end,
    case db:succeed(Res) of
        true -> true;
        _ ->
            ?ERROR("[~p][~w],ret=~p,insert(~w)",
                [erlang:process_info(self(), registered_name), PoolID,  Res, {PlayerID, Name, Worker, Version, Data}]),
            cache:delete(player_cache, PlayerID),
            false
    end.
