%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 17:33
%%%-------------------------------------------------------------------
-module(mysql_instance_loader).
-author("mawenhong").
-include("dbs_private.hrl").

%% API
-export([load_db_conf/0]).

load_db_conf()->
    {ok, Pid} = init_instance_pool(),
    L1 = load_all_player_instance(Pid),
    _  = [mysql_pool_manager:set_player_data_mysql_instance(Instance) || Instance<- L1],
    gen_server:stop(Pid),
    ok.

%%%-------------------------------------------------------------------
load_all_player_instance(Pid)->
    Res = mysql:execute(Pid, get_player_db_instance_conf,[]),
    Ins = mysql_interface:as_record(Res, player_db_instance_info, record_info(fields, player_db_instance_info)),
    [modify_record(Instance) || Instance <- Ins].

%%%-------------------------------------------------------------------
modify_record(#player_db_instance_info{
    id = Id,
    host = Host, port = Port,
    user = User, password = Password, database = Database
})->
    #player_db_instance_info{
        id = Id,
        host = erlang:binary_to_list(Host),
        port = Port,
        user = erlang:binary_to_list(User),
        password = erlang:binary_to_list(Password),
        database = erlang:binary_to_list(Database)
    }.

%%%-------------------------------------------------------------------
init_instance_pool()->
    {_PoolOptions, MySqlOptions} = get_all_db_conf(),
    mysql:start_link(MySqlOptions).


%%%-------------------------------------------------------------------
get_all_db_conf() ->
    PoolOptions  = [{size, 1}, {max_overflow, 1}],
    Conf1 = [ {erlang:list_to_atom(K),V} || {K,V}<- mod_ini_conf:get_db_conf()],
    Conf2 = case lists:keyfind(port, 1, Conf1) of
                {port, Port} when is_number(Port) ->
                    Conf1;
                {port, Port} when is_list(Port) ->
                    lists:keyreplace(port, 1, Conf1, {port, erlang:list_to_integer(Port)});
                _ ->
                    Conf1
            end,
    MySqlOptions = Conf2 ++ [
        {
            prepare,
            [
                {get_player_db_instance_conf, "select * from player_db_instance"},
                {get_public_db_instance_conf, "select * from public_db_instance"}
            ]
        }
    ],
    {PoolOptions, MySqlOptions}.


