%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2018 16:04
%%%-------------------------------------------------------------------
-module(lib_player_base).
-author("mawenhong").
-include("logger.hrl").
-include("netmsg.hrl").
-include("db_record.hrl").
-include("mem_record.hrl").
-include("common_record.hrl").

%% API
-export([init/1]).
-export([send_init_data/0]).
-export([start_walk/1, stop_move/1]).
%%-------------------------------------------------------------------
init(Player) ->
    #p_player{
        uid = Uid, sid = Sid,
        name = Name, level = Level, sex = Sex,
        race = Race, career=Career, head = Head,
        map_id = Mid, line = LineId
    } = Player,
    lib_player_rw:set_uid(Uid),
    lib_player_rw:set_sid(Sid),
    lib_player_rw:set_name(Name),
    lib_player_rw:set_level(Level),
    lib_player_rw:set_sex(Sex),
    lib_player_rw:set_race(Race),
    lib_player_rw:set_career(Career),
    lib_player_rw:set_head(Head),
    lib_player_rw:set_map(#m_player_map{map_id = Mid, line_id = LineId}),
    ok.
%%-------------------------------------------------------------------
send_init_data() ->
    send_base_info(),
    lib_player_pub:send(#pk_GS2U_GetPlayerInitDataEnd{}),
    ok.

send_base_info() ->
    #m_player_map{map_id = Mid} = lib_player_rw:get_map(),
    Msg = #pk_GS2U_PlayerInitBase{
        %% UInt64 角色
        uid = lib_player_rw:get_uid(),
%% String 角色
        name = lib_player_rw:get_name(),
%% Int32 等级
        level = lib_player_rw:get_level(),
%% SByte 阵营
        camp = 0,
%% SByte 种族
        race = lib_player_rw:get_race(),
%% UInt32 职业
        career = lib_player_rw:get_career(),
%% SByte 性别
        sex = lib_player_rw:get_sex(),
%% Int32 头
        head = lib_player_rw:get_head(),
%% UInt16 角色
        mapID = Mid
    },
    lib_player_pub:send(Msg),
    ok.

start_walk(Tar) ->
    #m_player_map{map_pid = Mpid} = lib_player_rw:get_map(),
    Uid = lib_player_rw:get_uid(),
    case vector3:valid(Tar) of
        true ->
            Req = #r_player_start_move_req{uid = Uid, tar = Tar},
            lib_player_pub:start_move_(Mpid, Req),
            ?WARN("player ~p mapid ~p move to ~w", [Uid, Mpid, Tar]),
            ok;
        _ ->
            ?DEBUG("### error walk pos ~w",[Tar])
    end,
    ok.

stop_move(Pos) ->
    #m_player_map{map_pid = Mpid} = lib_player_rw:get_map(),
    Uid = lib_player_rw:get_uid(),
    case vector3:valid(Pos) of
        true ->
            Req = #r_player_stop_move_req{uid = Uid, pos = Pos},
            lib_player_pub:stop_move_(Mpid, Req),
            ?WARN("player ~p mapid ~p stop on ~w", [Uid, Mpid, Pos]),
            ok;
        _ ->
            ?DEBUG("### error stop pos ~w",[Pos])
    end,
    ok.
