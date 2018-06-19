%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%   player 进程调用
%%% @end
%%% Created : 14. 五月 2018 15:20
%%%-------------------------------------------------------------------
-module(lib_player_priv).
-author("mawenhong").

-include("logger.hrl").
-include("netmsg.hrl").
-include("map.hrl").
-include("player_status.hrl").
-include("common_record.hrl").
-include("map_obj.hrl").
-include("db_record.hrl").
-include("mem_record.hrl").
-include("vector3.hrl").
-include("pub_common.hrl").

%% 逻辑层不要调用这些接口
-export([init/0]).
-export([login_ack/1]).
-export([loaded_player_list/1]).
-export([create_player_/1, create_player_ack/1]).
-export([select_player/1]).
-export([loaded_player/1]).
-export([offline/1]).

%%-------------------------------------------------------------------
init() ->
    lib_player_rw:set_status(?PS_INIT),
    ok.

%%-------------------------------------------------------------------
login_ack(#r_login_ack{error = 0, account_info = AccountIfo}) ->
    #p_account{aid = AccId} = AccountIfo,
    Ret = gcore:register_ppid(self(), AccId),
    login_ack_success(Ret, AccountIfo),
    ok;
login_ack(#r_login_ack{error = Error}) ->
    lib_player_pub:send(#pk_GS2U_LoginResult{
        result = Error,
        msg = io_lib:format("ErrorCode:~p", [Error])
    }),
    ok.

%%-------------------------------------------------------------------
login_ack_success(sucess, AccountIfo) ->
    Aid = AccountIfo#p_account.aid,
    lib_player_pub:send(#pk_GS2U_LoginResult{
        aid = Aid,
        identity = "",
        result = 0,
        msg = io_lib:format("ErrorCode:~p", [0])
    }),
    lib_player_rw:set_aid(Aid),
    lib_player_rw:set_status(?PS_WAIT_LIST),
    hook_player:on_account_login(Aid, self(), lib_player_pub:socket()),
    ok;
login_ack_success(Reason, AccountIfo) ->
    #p_account{aid = Aid} = AccountIfo,
    ?ERROR("acc ~w register process ~p faild with ~w",
        [Aid, self(), Reason]),
    lib_player_pub:send(#pk_GS2U_LoginResult{
        result = -1,
        msg = io_lib:format("ErrorCode:~p", [Reason])
    }),
    lib_player_rw:set_status(?PS_ERROR),
    lib_player_pub:shutdown(read),
    gcore:kick_account(Aid, Reason),
    ok.

%%-------------------------------------------------------------------
loaded_player_list([]) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    lib_player_pub:send(#pk_GS2U_UserPlayerList{}),
    ok;
loaded_player_list(RoleList) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    Info = lists:map(
        fun(#p_player{
            uid = Uid,
            name = Name,
            level = Lv,
            wing_level = Wlv,
            sex = Sex,
            camp = Camp,
            race = Race,
            career = Career,
            head = Head,
            map_id = MapId,
            old_map_id = OldMapId
        }) ->
            #pk_UserPlayerData{
                uid = Uid, name = Name,
                level = Lv, wingLevel = Wlv,
                camp = Camp, career = Career,
                race = Race, sex = Sex, head = Head,
                mapID = MapId, oldMapID = OldMapId
            }
        end, RoleList),
    lib_player_pub:send(#pk_GS2U_UserPlayerList{info = Info}),
    ok.

%%-------------------------------------------------------------------
create_player_(Req) ->
    Aid = lib_player_rw:get_aid(),
    lib_player_rw:set_status(?PS_CREATING),
    lib_db:action_p_(Aid, create_player, {Aid, Req}),
    ok.

%%-------------------------------------------------------------------
create_player_ack(#r_create_player_ack{error = 0, uid = Uid}) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    hook_player:on_create(Uid),
    ok;
create_player_ack(#r_create_player_ack{error = Err}) ->
    lib_player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    lib_player_pub:send(#pk_GS2U_CreatePlayerResult{errorCode = Err}).

%%-------------------------------------------------------------------
select_player(Uid) ->
    Aid = lib_player_rw:get_aid(),
    lib_player_rw:set_status(?PS_WAIT_LOAD),
    lib_player_rw:set_uid(Uid),
    lib_db:action_p_(Aid, load_player_data, {Aid, Uid}),
    ok.

%%-------------------------------------------------------------------
loaded_player(undefined) ->
    Aid = lib_player_rw:get_aid(),
    Uid = lib_player_rw:get_uid(),
    ?ERROR("~p load player ~p failed", [Aid, Uid]),
    lib_player_rw:set_uid(0),
    ok;
loaded_player(Player) ->
    lib_player_rw:set_status(?PS_WAIT_ENTER),
    hook_player:on_login(Player),
    ok.

%%%-------------------------------------------------------------------
offline(Reason) ->
    ?TRY_CATCH(offline_1(lib_player_rw:get_status()), Err0, St0),
    ?TRY_CATCH(flush_cache(Reason), Err1, St1),
    ok.

offline_1(Status)
    when Status =:= ?PS_GAME; Status =:= ?PS_CHANGE_MAP ->
    Uid = lib_player_rw:get_uid_def(0),
    lib_player_rw:set_status(?PS_OFFLINE),
    Player = lib_cache:get_player_pub(Uid),
    ?TRY_CATCH(hook_player:on_offline(Player)),
    lib_player_save:save(Player),
    ?INFO("player ~p pid ~p sock ~p player ~w offline status ~p",
        [Uid, self(), lib_player_pub:socket(), Uid, Status]),
    ok;
offline_1(Status) ->
    Uid = lib_player_rw:get_uid_def(0),
    Aid = lib_player_rw:get_aid_def(0),
    lib_player_rw:set_status(?PS_OFFLINE),
    lib_cache:offline(Aid, Uid),
    ?INFO("player ~p pid ~p sock ~p player ~w offline status ~p",
        [Uid, self(), lib_player_pub:socket(), Uid, Status]),

    ok.

%%%-------------------------------------------------------------------
flush_cache(transfer_to_cross) -> ok;
flush_cache(_) -> skip.


