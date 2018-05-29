%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 五月 2018 14:22
%%%-------------------------------------------------------------------
-module(lib_db).
-author("mawenhong").
-include("logger.hrl").
-include("player_record.hrl").
-include("common_record.hrl").
-include("db_record.hrl").
-include("map_obj.hrl").

%% API
-export([load_account_info/1]).
-export([load_player_list_/1]).
-export([load_player_data_/3]).
-export([create_player_/3]).

load_account_info(AccName) ->
    #p_account{
        accountID = misc:crc32(AccName),
        platformAccount = AccName,
        platformAccountCrc = misc:crc32(AccName)
    }.

load_player_list_(AccId) ->
    PoolID = mod_db:get_pool(),
    Sql = "select * from player where aid = ?",
    Res = mysql_interface:query(PoolID, Sql, [AccId], infinity),
    PL1 = mysql_interface:as_record(Res, p_player, record_info(fields, p_player)),
    PL2 = lists:map(
        fun(#p_player{name = Name} = Player)->
            Player#p_player{name = binary_to_list(Name)}
        end , PL1),
    ps:send(self(), load_player_list_ack, PL2).



load_player_data_(Pid, _AId, Uid) ->
    Sql = "select * from player where uid = ?",
    Res = mysql_interface:query(mod_db:get_pool(), Sql, [Uid], infinity),
    PlayerData =
    case mysql_interface:succeed(Res) of
        true ->
            case mysql_interface:as_record(Res, p_player, record_info(fields, p_player)) of
                [#p_player{} = Player] -> Player;
                Err -> check_and_log(false, Sql, Err) , undefined
            end;
        _ -> check_and_log(false, Sql, Res), undefined
    end,

    ps:send(Pid, load_player_data_ack, PlayerData),
    ok.

create_player_(Pid, AccId, Req) ->
    #r_create_player_req{
        name = Name,
        camp = Camp,
        career = Career,
        race = Race,
        sex = Sex,
        head = Head
    } = Req,
    Uid =  uid_gen:player_uid(),
    Sql = "insert player(aid, uid, name, level, sex, camp, race,
    career, head, map_id, old_map_id, version) values(?,?,?,?,?,?,?,?,?,?,?,?)",
    Res = mysql_interface:query(
        mod_db:get_pool(),
        Sql,
        [AccId, Uid, Name, 1, Sex, Camp, Race, Career, Head, 1,1, misc:milli_seconds()],
        infinity),
    
    check_and_log(mysql_interface:succeed(Res), Sql, Res),
    ps:send(
        Pid,
        create_player_ack,
        #r_create_player_ack{
            error = 0,
            uid = Uid,
            acc_id = AccId,
            name = Name,
            camp = Camp,
            career = Career,
            race = Race,
            sex = Sex,
            head = Head
        }
    ),

    ok.


check_and_log(true, _Sql, _Res) -> skip;
check_and_log(_, Sql, Res) ->   ?ERROR("sql: ~ts ret: ~w", [Sql, Res]).

