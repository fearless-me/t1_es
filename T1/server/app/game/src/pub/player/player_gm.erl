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

%% API
-export([is_gm/1, on_gm/1]).
-export([to_doc/0]).

-define(DOC_FILE, "GmCmd.txt").
-define(GM_CMD_LIST, [
    %% 权限等级、 指令、 回调函数、 说明
    {0, "change_map",  fun change_map/1,   "切地图 &chang_map $MapId"},
    {0, "change_group",  fun change_group/1, "改变角色分组属性 &change_group $GroupId"}
]).



%%-------------------------------------------------------------------
is_gm([$&|_]) -> true;
is_gm(_) -> false.

%%-------------------------------------------------------------------
on_gm([_Mark|Content]) ->
    case string:tokens(Content, " ") of
    [] -> skip;
    [Cmd | Params] -> do_gm(Cmd, Params)
    end,
    ok.
%%-------------------------------------------------------------------
to_doc() ->
    GenDoc =
        fun()->
            NewList = lists:sort(fun({AL0,_,_,_}, {AL1,_,_,_})-> AL0 < AL1 end, ?GM_CMD_LIST),
            file:write_file(?DOC_FILE, ""),
            lists:foreach(
                fun({AL, Cmd,_,Desc})->
                    file:write_file(
                        ?DOC_FILE,
                        io_lib:format("~p ~s \"~s\" ~n",
                            [AL, Cmd, unicode:characters_to_binary(Desc)]),
                        [append]
                    )
                end, NewList)
        end,
    erlang:spawn(GenDoc),
    ok.

%%-------------------------------------------------------------------
do_gm(Cmd, Params) ->
    case lists:keyfind(Cmd, 2, ?GM_CMD_LIST) of
        {AccessLevel, _, Fun, _} -> do_gm(999, AccessLevel, Fun, Params);
        _ -> ?WARN("gm command  ~s not define!!",[Cmd])
    end,
    ok.

do_gm(GmLevel, AccessLevel, Call, Params) when GmLevel >= AccessLevel ->
    erlang:apply(Call, [Params]);
do_gm(_,_,_,_) -> skip.

change_map([MapId | _]) ->
%%    Delta = misc:rand(-5, 15) / 1.0,
    Pos = vector3:new(324.1, 0, 233.1 ),
    player_pub:change_map_(list_to_integer(MapId), 0, Pos),
    ok.

change_group([GroupId | _]) ->
%%    Delta = misc:rand(-5, 15) / 1.0,
%%    Pos = vector3:new(324.1, 0, 233.1 ),
    player_pub:change_group_(list_to_integer(GroupId)),
    ok.
