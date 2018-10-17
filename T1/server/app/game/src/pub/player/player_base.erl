%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2018 16:04
%%%-------------------------------------------------------------------
-module(player_base).
-author("mawenhong").
-include("logger.hrl").
-include("netmsg.hrl").
-include("rec_rw.hrl").
-include("db_record.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").

%% API
-export([online/1]).
-export([send_init_data/0]).
-export([start_walk/1, stop_move/1]).
%%-------------------------------------------------------------------
online(Player) ->
    #p_player{
        aid = Aid, uid = Uid, sid = Sid,
        name = Name, level = Level, sex = Sex,
        race = Race, career = Career, head = Head,
        map_id = Mid, line = LineId
    } = Player,
    
    RwRec = player_rw:to_record(),
    player_rw:init_default(RwRec#m_player_rw{
        uid = Uid, sid = Sid, aid = Aid,
        name = Name, level = Level, sex = Sex,
        race = Race, career = Career, head = Head,
        map = #m_player_map{map_id = Mid, line_id = LineId}
    }),
    ?DEBUG("player ~p of ~p enter map ~p", [Uid, Aid, Mid]),
    %% todo 设置buff， cd等等
    
    ok.

%%-------------------------------------------------------------------
send_init_data() ->
    send_base_info(),
    player_pub:send_net_msg(#pk_GS2U_GetPlayerInitDataEnd{}),
    ok.

send_base_info() ->
    #m_player_map{map_id = Mid} = player_rw:get_map(),
    Msg = #pk_GS2U_PlayerInitBase{
        %% UInt64 角色
        uid = player_rw:get_uid(),
%% String 角色
        name = player_rw:get_name(),
%% Int32 等级
        level = player_rw:get_level(),
%% SByte 阵营
        camp = 0,
%% SByte 种族
        race = player_rw:get_race(),
%% UInt32 职业
        career = player_rw:get_career(),
%% SByte 性别
        sex = player_rw:get_sex(),
%% Int32 头
        head = player_rw:get_head(),
%% UInt16 角色
        mapID = Mid
    },
    player_pub:send_net_msg(Msg),
    ok.

%%-------------------------------------------------------------------
start_walk(Tar) ->
    #m_player_map{map_pid = MPid} = player_rw:get_map(),
    Uid = player_rw:get_uid(),
    case vector3:valid(Tar) of
        true ->
            Req = #r_player_start_move_req{uid = Uid, tar = Tar},
            player_pub:start_move_(MPid, Req),
%%            ?WARN("player start walk at ~p mapid ~p move to ~w", [Uid, MPid, Tar]),
            ok;
        _ ->
            ?DEBUG("### error walk pos ~w", [Tar])
    end,
    ok.

%%-------------------------------------------------------------------
stop_move(Pos) ->
    #m_player_map{map_pid = MPid} = player_rw:get_map(),
    Uid = player_rw:get_uid(),
    case vector3:valid(Pos) of
        true ->
            Req = #r_player_stop_move_req{uid = Uid, pos = Pos},
            player_pub:stop_move_(MPid, Req),
%%            ?WARN("player ~p mapid ~p stop on ~w", [Uid, MPid, Pos]),
            ok;
        _ ->
            ?DEBUG("### error stop pos ~w", [Pos])
    end,
    ok.
