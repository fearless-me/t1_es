%% coding: latin-1
%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 九月 2018 17:04
%%%-------------------------------------------------------------------
-module(player_gm).
-author("mawenhong").

-include("logger.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").

%% API
-export([is_gm/1, on_gm/1]).
-export([to_doc/0]).

-define(DOC_FILE, "GmDoc.txt").
-define(GM_CMD_LIST, [
    %% 权限等级、 指令、 回调函数、 说明
    {0, "change_map",  fun change_map/1, "切地图 &chang_map $MapId"},
    {0, "change_group",fun change_group/1, "改变角色分组属性 &change_group $GroupId"},
    {0, "add_buff",    fun add_buff/1, "添加buff &add_buff $BuffId [$BuffLevel]"},
    {0, "use_skill",   fun use_skill/1, "使用技能 &use_skill $SkillId $TargetId"},
    {0, "add_bp",      fun add_bp/1, "添加战斗属性 &add_bp $bpId $bpUseType $bpValue"},
    {0, "query_bp",    fun query_bp/1, "查看战斗属性 &query_bp $bpId"},
    {0, "query",       fun query/1, "查看自身当前属性 &query"},
    {0, "goto",        fun goto/1, "跳转到坐标 &goto x y"}
]).



%%-------------------------------------------------------------------
is_gm([$& | _]) -> true;
is_gm(_) -> false.

%%-------------------------------------------------------------------
on_gm([_Mark | Content]) ->
    case string:tokens(Content, " ") of
        [] -> skip;
        [Cmd | Params] -> do_gm(Cmd, Params)
    end,
    ok.
%%-------------------------------------------------------------------
-define(FMT_HEAD, "~-10.ts~.20ts~.150ts~n").
-define(FMT_BODY, "~-10.w~.20ts~.150ts~n").
to_doc() ->
    GenDoc =
        fun() ->
            NewList = lists:sort(fun({AL0, _, _, _}, {AL1, _, _, _}) -> AL0 < AL1 end, ?GM_CMD_LIST),
            file:write_file(?DOC_FILE, io_lib:format(?FMT_HEAD, ["Lv", "Cmd", "Desc"])),
            lists:foreach
            (
                fun({AL, Cmd, _, Desc}) ->
                    file:write_file
                    (
                        ?DOC_FILE,
                        io_lib:format(?FMT_BODY, %%"~p ~s \"~s\" ~n",
                            [AL, Cmd, unicode:characters_to_binary(Desc)]),
                        [append]
                    )
                end,
                NewList
            )
        end,
    erlang:spawn(GenDoc),
    ok.

%%-------------------------------------------------------------------
do_gm(Cmd, Params) ->
    case lists:keyfind(Cmd, 2, ?GM_CMD_LIST) of
        {AccessLevel, _, Fun, _} -> do_gm(999, AccessLevel, Fun, Params);
        _ -> ?WARN("gm command  ~s not define!!", [Cmd])
    end,
    ok.

do_gm(GmLevel, AccessLevel, Call, Params) when GmLevel >= AccessLevel ->
    erlang:apply(Call, [Params]);
do_gm(_, _, _, _) -> skip.
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------

%%-------------------------------------------------------------------
change_map([MapId, LineId | _]) ->
    ID = list_to_integer(MapId),
    LD = list_to_integer(LineId),
    Pos = map_creator_interface:map_init_pos(ID),
    player_pub:change_map_(ID, LD, Pos),
    ok;
change_map([MapId | _]) ->
    ID = list_to_integer(MapId),
    Pos = map_creator_interface:map_init_pos(ID),
    player_pub:change_map_(ID, 0, Pos),
    ok.

%%-------------------------------------------------------------------
change_group([GroupId | _]) ->
%%    Delta = misc:rand(-5, 15) / 1.0,
%%    Pos = vector3:new(324.1, 0, 233.1 ),
    player_pub:change_group_(list_to_integer(GroupId)),
    ok.

%%-------------------------------------------------------------------
add_buff([BuffId, BuffLevel | _]) ->
    Uid = player_rw:get_uid(),
    player_combat:add_buff(
        Uid,
        list_to_integer(BuffId),
        list_to_integer(BuffLevel)
    ),
    ok;
add_buff([BuffId | _]) ->
    Uid = player_rw:get_uid(),
    player_combat:add_buff(
        Uid,
        list_to_integer(BuffId),
        1
    ),
    ok.

%%-------------------------------------------------------------------
use_skill([SkillId, TarUid | _]) ->
    Uid = player_rw:get_uid(),
    player_combat:use_skill(
        list_to_integer(SkillId),
        list_to_integer(TarUid),
        player_interface:get_cur_pos(Uid),
        misc_time:utc_seconds()
    ),
    ok.

%%-------------------------------------------------------------------
add_bp([BattlePropId, BPUseType, Value | _]) ->
    %% 传入值可能不是加算，但是无所谓，是添加就行
    BattlePropUse = {
        list_to_integer(BattlePropId),
        list_to_integer(BPUseType),
        list_to_float(Value)
    },
    player_combat:change_combat_prop([BattlePropUse], []),
    ok.

%%-------------------------------------------------------------------
query_bp([]) ->
    Value = player_combat:query_prop(),
    ?INFO("playerUid:~w use gm query_bp result:~w", [player_rw:get_uid(), Value]),
    ok;
query_bp([BattlePropId | _]) ->
    Value = player_combat:query_prop(list_to_integer(BattlePropId)),
    ?INFO("playerUid:~w use gm query_bp[~ts] result:~w", [player_rw:get_uid(), BattlePropId, Value]),
    ok.

query(_) ->
    Uid = player_rw:get_uid(),
    #m_cache_online_player{
        map_id = MapId, map_pid = MapPid, pos = Pos, hp = Hp
    } = gs_cache_interface:get_online_player(Uid),

    ?WARN("query self uid:~p mapID:~p mapPid:~p Pos:~p hp:~p",
        [Uid, MapId, MapPid, Pos, Hp]),
    ok.

goto([X, Y|_]) ->
    ?ERROR("think more..."),
    ok.