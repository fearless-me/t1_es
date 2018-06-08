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

%% API
-export([send_init_data/0]).

send_init_data() ->
    send_base_info(),
    ok.

send_base_info() ->
    Msg = #pk_GS2U_PlayerInitBase{
        %% UInt64 角色
        uid = lib_player_rw:get_uid(),
%% String 角色
        name = lib_player_rw:,
%% Int32 等级
        level = 0,
%% SByte 阵营
        camp = 0,
%% SByte 种族
        race = 0,
%% UInt32 职业
        career = 0,
%% SByte 性别
        sex = 0,
%% Int32 头
        head = 0,
%% UInt16 角色
        mapID = 0
    },
    lib_player_priv:send(Msg),
    ok.
