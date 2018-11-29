%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 十一月 2018 14:47
%%%-------------------------------------------------------------------
-author("Administrator").

-ifndef(PLAYER_FULL_HRL).
-define(PLAYER_FULL_HRL, true).

-record(p_player_save,{
    %%-------------------------------------------------------------------
    %% 验证值，先这样
    version,
    %%-------------------------------------------------------------------
    %% 基础值
    uid, race, career, level, map_id, line, pos, old_map_id, old_line, old_pos,

    %%-------------------------------------------------------------------
    %% 扩展信息，其他所有逻辑
    data
}).

-record(p_player_full_data,{
    %%-------------------------------------------------------------------
    %% 其他逻辑系统
    buff_version, buffs,
    skill_version, skills
}).

-record(p_buff,{id, lifetime, level, layer, source, latest}).
-record(p_skill,{id,level, cd, exp}).

-endif.
