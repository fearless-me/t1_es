%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%   player 进程调用
%%% @end
%%% Created : 14. 五月 2018 15:20
%%%-------------------------------------------------------------------
-module(player_priv).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("map_core.hrl").
-include("player_status.hrl").
-include("gs_common_rec.hrl").
-include("db_record.hrl").
-include("gs_cache.hrl").
-include("player_ext_data.hrl").
-include("object.hrl").


%% 逻辑层不要调用这些接口
-export([init/0]).
-export([login/1, login_ack/1]).
-export([loaded_player_list/1]).
-export([create_player/6, create_player_ack/1]).
-export([select_player/1]).
-export([loaded_player/1]).
-export([offline/1]).
-export([delete_player/1, delete_player_ack/1]).

%%-------------------------------------------------------------------
init() ->
    player_rw:init(),
    player_rw:set_status(?PS_INIT),
    ok.

%%-------------------------------------------------------------------
login(#pk_U2LS_Login_Normal{
    platformName = PlatName,
    platformAccount = PlatAccount,
    sign = Token
}) ->
    ?DEBUG("s~p|~ts login", [self(), PlatAccount]),
    player_rw:set_status(?PS_VERIFY),
    login_interface:login_(#r_login_req{
        plat_name = PlatName, plat_account_name = PlatAccount,
        access_token = Token, player_pid = self()
    }),
    ok.

%%-------------------------------------------------------------------
login_ack(#r_login_ack{error = 0, account_info = AccountIfo}) ->
    #p_account{aid = AccId} = AccountIfo,
    %%% fixme errorrororororor
    PsName = gs_interface:ppid_name(AccId),
    loop_check(misc:is_alive(PsName), erlang:whereis(PsName), 5),
    %%% fixme errorrororororor
    Ret = gs_interface:register_ppid(self(), AccId),
    login_ack_success(Ret, AccountIfo),
    ok;
login_ack(#r_login_ack{error = Error}) ->
%%    player_pub:send_net_msg(#pk_GS2U_LoginResult{
%%        result = Error,
%%        msg = io_lib:format("ErrorCode:~p", [Error])
%%    }),
    ok.


loop_check(true, Pid, N) when N > 0, is_pid(Pid) ->
    ?WARN("~p player repeat_login ~p|~p loop check", [self(), Pid, misc:registered_name(Pid)]),
    ps:send(Pid, active_stop, repeat_login),
    timer:sleep(500),
    loop_check(misc:is_alive(Pid), Pid, N - 1);
loop_check(_, _Pid, _N) ->
    ok.

%%-------------------------------------------------------------------
login_ack_success(success, AccountIfo) ->
    Aid = AccountIfo#p_account.aid,
%%    player_pub:send_net_msg(#pk_GS2U_LoginResult{
%%        aid = Aid,
%%        identity = "",
%%        result = 0,
%%        msg = io_lib:format("ErrorCode:~p", [0])
%%    }),
    player_rw:set_aid(Aid),
    player_rw:set_status(?PS_WAIT_LIST),
    hook_player:on_account_login(Aid, self(), player_pub:socket()),
    ok;
login_ack_success(Reason, AccountIfo) ->
    #p_account{aid = Aid} = AccountIfo,
    ?ERROR("acc ~w register process ~p faild with ~w",
        [Aid, self(), Reason]),
%%    player_pub:send_net_msg(#pk_GS2U_LoginResult{
%%        result = -1,
%%        msg = io_lib:format("ErrorCode:~p", [Reason])
%%    }),
    player_rw:set_status(?PS_ERROR),
    player_pub:shutdown(read),
    gs_interface:kick_account(Aid, Reason),
    ok.

%%-------------------------------------------------------------------
loaded_player_list([]) ->
    player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    player_pub:send_net_msg(#pk_GS2U_UserPlayerList{}),
    ok;
loaded_player_list(RoleList) ->
    player_rw:set_status(?PS_WAIT_SELECT_CREATE),
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
                roleID = Uid, name = Name,
                level = Lv, wingLevel = Wlv,
                camp = Camp, career = Career,
                race = Race, sex = Sex, head = Head,
                mapID = MapId, oldMapID = OldMapId
            }
        end, RoleList),
    player_pub:send_net_msg(#pk_GS2U_UserPlayerList{info = Info}),
    ok.

%%-------------------------------------------------------------------
create_player(Name, Career, Race, Sex, Head, Camp) ->
    player_rw:set_status(?PS_CREATING),

    Aid = player_rw:get_aid(),
    Mid = map_creator_interface:born_map_id(),
    Pos = map_creator_interface:map_init_pos(Mid),
    Req = #r_create_player_req{
        version = misc_time:milli_seconds(),
        name = Name, camp = Camp, career = ?CAREER_DETAIL(Career, 0, 1), race = Race, sex = Sex,
        head = Head, mid = Mid, x = vector3:x(Pos), y = vector3:z(Pos),
        sid = gs_interface:get_sid(),
        data = data_pack:marshal(#p_player_full_data{})
    },
    gs_db_interface:action_data_(Aid, create_player, {Aid, Req}),
    ok.

%%-------------------------------------------------------------------
create_player_ack(#r_create_player_ack{error = 0} = Ack) ->
    player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    hook_player:on_create(Ack),
    ok;
create_player_ack(#r_create_player_ack{error = Err}) ->
    player_rw:set_status(?PS_WAIT_SELECT_CREATE),
    player_pub:send_net_msg(#pk_GS2U_CreatePlayerResult{errorCode = Err}).

%%-------------------------------------------------------------------
select_player(Uid) ->
    Aid = player_rw:get_aid(),
    player_rw:set_status(?PS_WAIT_LOAD),
    player_rw:set_uid(Uid),
    gs_db_interface:action_data_(Aid, load_player_data, {Aid, Uid}),

    ok.

%%-------------------------------------------------------------------
loaded_player(undefined) ->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    ?ERROR("~p load player ~p failed", [Aid, Uid]),
    player_rw:set_uid(0),
    ok;
loaded_player(Player) ->
    player_rw:set_status(?PS_WAIT_ENTER),
    hook_player:on_login(Player),
    ok.

%%-------------------------------------------------------------------
offline(Reason) ->
    ?TRY_CATCH(offline_1(player_rw:get_status(), Reason), Err0, St0),
    ?TRY_CATCH(flush_cache(Reason), Err1, St1),
    ok.

offline_1(Status, Reason)
    when Status =:= ?PS_GAME; Status =:= ?PS_CHANGE_MAP ->
    Uid = player_rw:get_uid_def(0),
    player_rw:set_status(?PS_OFFLINE),
    ?TRY_CATCH(hook_player:on_offline()),
    ?INFO("player ~p pid ~p sock ~p offline status ~p reason ~p",
        [Uid, self(), player_pub:socket(), Status, Reason]),
    ok;
offline_1(Status, Reason) ->
    Uid = player_rw:get_uid_def(0),
    Aid = player_rw:get_aid_def(0),
    player_rw:set_status(?PS_OFFLINE),
    gs_cache_interface:offline(Aid, Uid),
    ?INFO("player ~p pid ~p sock ~p offline status ~p reason ~p",
        [Uid, self(), player_pub:socket(), Status, Reason]),

    ok.


%%-------------------------------------------------------------------
delete_player(Uid) ->
    catch ?WARN("player ~p pid ~p sock ~p will be deleted",
        [Uid, self(), player_pub:socket()]),

    %%TODO 要做安全性检查
    Aid = player_rw:get_aid(),
    gs_db_interface:action_data_(Aid, delete_player, #r_delete_player_req{aid = Aid, uid = Uid}),
    ok.

delete_player_ack(#r_delete_player_ack{uid = Uid, res = true}) ->
    hook_player:on_delete(Uid),
    player_pub:send_net_msg(#pk_GS2U_DeletePlayerResult{uid = Uid, errorCode = 0}),
    catch ?WARN("player ~p pid ~p sock ~p is deleted",
        [Uid, self(), player_pub:socket()]),
    ok;
delete_player_ack(#r_delete_player_ack{uid = Uid}) ->
    player_pub:send_net_msg(#pk_GS2U_DeletePlayerResult{uid = Uid, errorCode = -1}),
    ok.


%%-------------------------------------------------------------------
flush_cache(transfer_to_cross) -> ok;
flush_cache(_) -> skip.


