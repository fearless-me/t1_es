%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 九月 2018 14:44
%%%-------------------------------------------------------------------
-module(cross_selector).
-author("mawenhong").

-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("common_def.hrl").
-include("common_rec.hrl").
%% API

-export([
    init/0,        %% 初始化
    rand_select/0, %% 随机选
    full_select/0, %% 优先填满人数
    turn_select/0, %% 随机选
    try_select/2   %% 优先尝试选择目标服务器
]).



%%-------------------------------------------------------------------
rand_select() -> select_cross(?SelectPolicy_Rand).
full_select() -> select_cross(?SelectPolicy_Full).
turn_select() -> select_cross(?SelectPolicy_Turn).
try_select(Sid, Policy) -> select_cross(Policy, Sid).


%%-------------------------------------------------------------------
-define(CROSS_SELECT_POLICY_ETS, cross_selector_ets).
init() ->
    my_ets:new(?CROSS_SELECT_POLICY_ETS, [public, named_table, {keypos, #pub_kv.key}, ?ETS_WC, ?ETS_RC]),
    my_ets:write(?CROSS_SELECT_POLICY_ETS, #pub_kv{key = ?SelectPolicy_Turn, value = 0}),
    my_ets:write(?CROSS_SELECT_POLICY_ETS, #pub_kv{key = ?SelectPolicy_Full, value = 0}),
    my_ets:write(?CROSS_SELECT_POLICY_ETS, #pub_kv{key = ?SelectPolicy_Rand, value = 0}),
    ok.

%%-------------------------------------------------------------------
select_cross(?SelectPolicy_Turn) ->
    L = common_interface:sel_server_id(?SERVER_TYPE_CGS),
    N = my_ets:update_counter(?CROSS_SELECT_POLICY_ETS, ?SelectPolicy_Turn, {#pub_kv.value, 1}),
    get_n(L, N);
select_cross(?SelectPolicy_Full) ->
    Q = ets:fun2ms(
        fun(#m_share_server_info{online = OL, max_online = Max, type = Type} = Info) when OL < Max, Type =:= ?SERVER_TYPE_CGS ->
            {Info#m_share_server_info.online, Info#m_share_server_info.sid}
        end
    ),
    L = mne_ex:dirty_select(?ShareServerInfoName, Q),
    S = lists:sort(fun({OL1, _S1}, {OL2, _S2}) -> OL1 > OL2 end, L),
    E =
        case lists:reverse(S) of
            [] ->
                [0];
            [{_OL, ServerID} | _] ->
                [ServerID]
        end,
    get_n(E, 1);
select_cross(_) ->
    L = common_interface:sel_server_id(?SERVER_TYPE_CGS),
    get_n(L, misc:rand(1, 1000)).

get_n([], _N) ->
    0;
get_n([S | _], 1) ->
    S;
get_n(L, N) ->
    RN = N rem length(L) + 1,
    lists:nth(RN, L).

%%%-------------------------------------------------------------------
select_cross(Policy, 0) ->
    select_cross(Policy);
select_cross(Policy, DstServerID) ->
    case common_interface:get_server_info(DstServerID) of
        #m_share_server_info{type = ?SERVER_TYPE_CGS} ->
            DstServerID;
        _ ->
            select_cross(Policy)
    end.