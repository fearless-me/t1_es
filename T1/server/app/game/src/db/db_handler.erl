%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 五月 2018 14:34
%%%-------------------------------------------------------------------
-module(db_handler).
-author("mawenhong").

-include("logger.hrl").
-include("player_record.hrl").
-include("common_record.hrl").
-include("db_record.hrl").
-include("map_obj.hrl").
-include("vector3.hrl").

%% API
-export([do_handle_info/4]).

do_handle_info(account_login, AccName, FromPid, _PoolId) ->
    AccountInfo = #p_account{
        accountID = misc:crc32(AccName),
        platformAccount = AccName,
        platformAccountCrc = misc:crc32(AccName)
    },
    ps:send(FromPid, login_ack, #r_login_ack{account_info = AccountInfo}),
    ok;
do_handle_info(load_player_list, AccId, FromPid, PoolId) ->
    Sql = db_sql:sql(load_player_list),
    Res = db:query(PoolId, Sql, [AccId], infinity),
    PL1 = db:as_record(Res, p_player, record_info(fields, p_player)),
    PL2 = lists:map(
        fun(#p_player{name = Name} = Player) ->
            Player#p_player{name = binary_to_list(Name)}
        end, PL1),
    ps:send(FromPid, load_player_list_ack, PL2),
    ok;
do_handle_info(load_player_data, {_Aid, Uid}, FromPid, PoolId) ->
    Sql = db_sql:sql(load_player),
    Res = db:query(PoolId, Sql, [Uid], infinity),
    PlayerData =
        case db:succeed(Res) of
            true ->
                Rec = db:as_record(Res, p_player, record_info(fields, p_player)),
                case Rec of
                    [#p_player{} = Player] -> Player;
                    Err -> check_res(false, Sql, Err), undefined
                end;
            _ -> check_res(false, Sql, Res), undefined
        end,

    ps:send(FromPid, load_player_data_ack, PlayerData),
    ok;
do_handle_info(create_player, {AccId, Req}, FromPid, PoolId) ->
    #r_create_player_req{
        sid = Sid, name = Name, camp = Camp, career = Career,
        race = Race, sex = Sex, head = Head, mid = Mid,
        x =  X, y = Y
    } = Req,
    Uid = uid_gen:player_uid(),
    Sql = db_sql:sql(insert_player),
    Params = [AccId, Uid, Sid, Name, 1, Sex, Camp, Race, Career, Head,
        Mid, 0, X, Y, Mid, 0, X, Y, misc:milli_seconds()],
    Res = db:query(PoolId, Sql, Params, infinity),

    check_res(db:succeed(Res), Sql, Res),
    ps:send(FromPid, create_player_ack,
        #r_create_player_ack{
            error = 0,
            uid = Uid, acc_id = AccId,
            name = Name, camp = Camp,
            career = Career, race = Race,
            sex = Sex, head = Head
        }
    ),
    ok;
do_handle_info(save_player, Player, _FromPid, PoolId) ->
    #m_player{
        uid = Uid,  career = Career, level = Lv,
        mid = Mid, line = Line, pos = Pos,
        old_mid = OMid, old_line = OLine, old_pos = OPos
    } = Player,
    Sql = db_sql:sql(save_player),
    Params = [Career, Lv, Mid, Line, vector3:x(Pos),vector3:z(Pos),
    OMid, OLine, vector3:x(OPos), vector3:z(OPos), misc:milli_seconds(), Uid],
    Res = db:query(PoolId, Sql, Params),
    check_res(db:succeed(Res), Sql, Res),
    ok;
do_handle_info(MsgId, Msg, FromPid, _PoolId) ->
    ?ERROR("undeal msg ~w ~w from ~p", [MsgId, Msg, FromPid]),
    ok.


%%-------------------------------------------------------------------
check_res(true, Sql, _Res) -> ?DEBUG("[success] ~ts",[Sql]);
check_res(_, Sql, Res) -> ?ERROR("ret: ~p, sql: ~ts", [Res, Sql]).