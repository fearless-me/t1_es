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
-include("player_ext_data.hrl").

%% API
-export([online/1]).
-export([send_init_data/0]).
-export([start_walk/2, stop_move/1]).
%%-------------------------------------------------------------------
online(Player) ->
    #p_player{
        version = _Version,
        aid = Aid, uid = Uid, sid = Sid,
        name = Name, level = Level, sex = Sex,
        race = Race, career = Career, head = Head,
        map_id = Mid, line = LineId,
        data = Data
    } = Player,

    FullData =
        case catch data_pack:unmarshal(Data) of
            #p_player_full_data{} = Ext -> Ext;
            _ -> #p_player_full_data{}
        end,
    RwRec = player_rw:get(),
    player_rw:init(RwRec#m_player_rw{
        uid = Uid, sid = Sid, aid = Aid,
        name = Name, level = Level, sex = Sex,
        race = Race, career = Career, head = Head,
        map = #m_player_map{map_id = Mid, line_id = LineId}
    }),
    ?DEBUG("player ~p of ~p enter map ~p, full data ~p", [Uid, Aid, Mid, FullData]),
    %% todo 设置buff， cd等等
    
    ok.

%%-------------------------------------------------------------------
send_init_data() ->
    send_base_info(),
    player_pub:send_net_msg(#pk_GS2U_GetPlayerInitDataEnd{}),
    ok.

send_base_info() ->
    #m_player_map{map_id = Mid} = player_rw:get_map(),
    Uid = player_rw:get_uid(),
    Msg = #pk_GS2U_PlayerInitBase{
        %% UInt64 角色
        uid = Uid,
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
        mapID = Mid,
        skill_list = player_skill:get_skill_info_list()
    },
    player_pub:send_net_msg(Msg),
    %% init combat
    BattleProps = gs_cache_interface:read_player_online_element(
        Uid, #m_cache_player_online.battle_props),
    MsgCombat = prop_interface:battleProps2NetMsg(Uid, BattleProps),
    player_pub:send_net_msg(MsgCombat),
    ok.

%%-------------------------------------------------------------------
start_walk(Tar, Speed) ->
    Uid = player_rw:get_uid(),
    case vector3:valid(Tar) of
        true ->
            Req = #r_player_start_move_req{uid = Uid, tar = Tar, speed = Speed},
            player_pub:start_move_(Req),
%%            ?WARN("player start walk at ~p mapid ~p move to ~w", [Uid, MPid, Tar]),
            ok;
        _ ->
            ?DEBUG("### error walk pos ~w", [Tar])
    end,
    ok.

%%-------------------------------------------------------------------
stop_move(Pos) ->
    Uid = player_rw:get_uid(),
    case vector3:valid(Pos) of
        true ->
            Req = #r_player_stop_move_req{uid = Uid, pos = Pos},
            player_pub:stop_move_(Req),
%%            ?WARN("player ~p stop on ~w", [Uid, Pos]),
            ok;
        _ ->
            ?DEBUG("### error stop pos ~w", [Pos])
    end,
    ok.
