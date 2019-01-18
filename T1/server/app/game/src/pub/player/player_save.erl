%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 五月 2018 9:51
%%%-------------------------------------------------------------------
-module(player_save).
-author("mawenhong").
-include("logger.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("player_ext_data.hrl").
-include("combat.hrl").

%% API
-export([save/1]).

full_save_data() ->
    #p_player_full_data{
        buff_version  = data_pack:version(record_info(fields, p_buff)),
        buffs = [],
        skill_version = data_pack:version(record_info(fields, p_skill)),
        skills = []
    }.

%%-------------------------------------------------------------------
save(Uid) ->
    #m_cache_player_online
    {
        aid = Aid, uid = Uid, race = Race, career = Career, level = Level,
        map_id = Mid, map_pid = MPid, line = LineId, pos = Pos,
        old_map_id = OldMid, old_line = OldLine, old_pos = OldPos
    } = gs_cache_interface:get_player_online(Uid),
    ?DEBUG("save player aid ~w uid ~w in map ~w|~w", [Aid, Uid, Mid, MPid]),
    NewPos =
        case vector3:valid(Pos) of
            true -> Pos;
            _Any -> map_creator_interface:map_init_pos(Mid)
        end,
    PlayerExt = #p_player_save{
        %%-------------------------------------------------------------------
        %% 验证值，先这样
        version = misc_time:milli_seconds(),

        %%-------------------------------------------------------------------
        %% 基础值
        uid = Uid, race = Race, career = Career, level = Level,
        map_id = Mid, line = LineId, pos = NewPos,
        old_map_id = OldMid, old_line = OldLine, old_pos = OldPos,

        %%-------------------------------------------------------------------
        %% 扩展信息，其他所有逻辑
        data = data_pack:marshal( full_save_data() )

    },

    gs_db_interface:action_data_(Aid, save_player, PlayerExt),
    ok.
