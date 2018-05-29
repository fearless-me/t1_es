%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 五月 2018 14:04
%%%-------------------------------------------------------------------
-module(db_msg).
-author("mawenhong").

%% API
-export([do_handle_info/1]).
do_handle_info({load_player_list, AccId, PidFrom}) ->
    mod_player_load_save:load_player(),
    PoolID = mysql_pool_manager:get_player_mysql_pool_(AccId),
    Res = db:query(PoolID, mod_sql_format:format_load_role_list_sql(AccId), infinity),
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

ok.
