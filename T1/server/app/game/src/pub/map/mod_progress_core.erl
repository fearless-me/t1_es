%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十二月 2018 15:12
%%%-------------------------------------------------------------------
-module(mod_progress_core).
-author("tiancheng").

-include("map_progress_private.hrl").
-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").

%% API
-export([
    init/0,
    tick/1
]).

-export([
    add_progress/2,

    break_progress_by_flag/2,
    break_progress_by_type/2
]).

-export([
    get_progress_main/1,
    get_progress_list/1,

    get_flag_id/0,

    get_progress_type/2,
    have_progress_type/2
]).

init() ->
    save_progress_list([]).

tick(Now) ->
    F =
        fun(#m_progress_main{src_uid = SrcUid, progress_list = List} = Main, AccL) ->
            case tick_progress(Now, SrcUid, List) of
                [] ->
                    AccL;
                RetList ->
                    [Main#m_progress_main{progress_list = RetList} | AccL]
            end
        end,
    List = lists:foldl(F, [], lists:reverse(get_progress_list())),
    save_progress_list(List),
    ok.

add_progress(SrcUid, #m_progress_details{progress_type = PT} = Details) ->
    case can_add_progress_type(SrcUid, PT) of
        true ->
            List = get_progress_list(),
            NewList =
                case lists:keyfind(SrcUid, #m_progress_main.src_uid, List) of
                    false ->
                        [#m_progress_main{src_uid = SrcUid, progress_list = [Details]} | List];
                    #m_progress_main{progress_list = OL} = Main ->
                        lists:keyreplace(SrcUid, #m_progress_main.src_uid, List, Main#m_progress_main{progress_list = [Details | OL]})
                end,
            save_progress_list(NewList),
            true;
        _ ->
            false
    end.

break_progress_by_type(SrcUid, ProgressType) ->
    List = get_progress_list(),
    case lists:keyfind(SrcUid, #m_progress_main.src_uid, List) of
        false ->
            skip;
        #m_progress_main{progress_list = L} = Main ->
            List2 =
                case lists:keydelete(ProgressType, #m_progress_details.progress_type, L) of
                    [] ->
                        lists:keydelete(SrcUid, #m_progress_main.src_uid, List);
                    NL ->
                        lists:keystore(SrcUid, #m_progress_main.src_uid, List, Main#m_progress_main{progress_list = NL})
                end,
            save_progress_list(List2)
    end,
    true.

break_progress_by_flag(SrcUid, FlagId) ->
    List = get_progress_list(),
    case lists:keyfind(SrcUid, #m_progress_main.src_uid, List) of
        false ->
            skip;
        #m_progress_main{progress_list = L} = Main ->
            List2 =
                case lists:keydelete(FlagId, #m_progress_details.flag_id, L) of
                    [] ->
                        lists:keydelete(SrcUid, #m_progress_main.src_uid, List);
                    NL ->
                        lists:keystore(SrcUid, #m_progress_main.src_uid, List, Main#m_progress_main{progress_list = NL})
                end,
            save_progress_list(List2)
    end,
    true.

tick_progress(Now, SrcUid, [#m_progress_details{}|_] = List) ->
    F =
        fun
            (#m_progress_details{
                next_node_time = NextTime, node_time_list = TimeList, times = Times} = Details, AccL) when Now >= NextTime ->
                case TimeList of
                    [] ->
                        Details2 = Details#m_progress_details{next_node_time = Now, times = Times + 1},
                        progress_callback(Details2, Now, SrcUid, ?PROGRESS_PHASE_HIT_AND_END),
                        AccL;
                    [Time|OtherList] ->
                        Details2 = Details#m_progress_details{
                            next_node_time = Now + Time,
                            node_time_list = OtherList,
                            times = Times + 1},
                        progress_callback(Details2, Now, SrcUid, ?PROGRESS_PHASE_HIT),
                        [Details2 | AccL]
                end,
                AccL;
            (D, AccL) ->
                [D | AccL]
        end,
    lists:foldl(F, [], List).

progress_callback(#m_progress_details{} = Details, Now, SrcUid, Phase) ->
    case Details#m_progress_details.broadcast_client of
        true ->
            NetMsg = #pk_GS2U_ProgressSync{
                %% UInt64
                uid = SrcUid,
                %% UInt64
                object_uid = Details#m_progress_details.object_uid,
                %% UInt32
                flag_id = Details#m_progress_details.flag_id,
                %% UInt16
                progress_type = Details#m_progress_details.progress_type,
                %% UInt32 进度持续时间，毫秒
                time_ms = Details#m_progress_details.next_node_time - Now,
                %% Byte 阶段，1start，2break，3hit
                phase = Phase,
                %% UInt32 参数，可能是技能ID，采集物ID等
                param = Details#m_progress_details.object_param
            },
            mod_view:send_net_msg_to_visual(SrcUid, NetMsg),
            ok;
        _ ->
            skip
    end,

    case lists:keyfind(Phase, #m_progress_func.phase, Details#m_progress_details.trigger_list) of
        #m_progress_func{func = undefined} ->
            skip;
        #m_progress_func{func = Fun, params = Params} ->
            ?TRY_CATCH(Fun(Params, {Details#m_progress_details.times, Details#m_progress_details.all_times}),
                Err1, Stk1);
        _ ->
            skip
    end,
    ok.

save_progress_list(List) ->
    put(progress_list, List),
    List.
get_progress_list() ->
    get(progress_list).

get_flag_id() ->
    case get(progress_flag_id) of
        undefined ->
            ID = misc:rand(1, 1000),
            put(progress_flag_id, ID),
            ID;
        V ->
            put(progress_flag_id, V + 1),
            V + 1
    end.

get_progress_list(SrcUid) ->
    #m_progress_main{progress_list = List} = get_progress_main(SrcUid),
    List.

get_progress_main(SrcUid) ->
    case lists:keyfind(SrcUid, #m_progress_main.src_uid, get_progress_list()) of
        false ->
            #m_progress_main{src_uid = SrcUid, progress_list = []};
        #m_progress_main{} = Main ->
            Main
    end.

can_add_progress_type(_SrcUid, ?PROGRESS_TYPE_KERNEL) ->
    true;
can_add_progress_type(SrcUid, _AddType) ->
    L = get_progress_list(SrcUid),
    case [Type || #m_progress_details{progress_type = Type} <- L, Type /= ?PROGRESS_TYPE_KERNEL] of
        [] -> true;
        _ -> false
    end.

get_progress_type(SrcUid, AddType) ->
    L = get_progress_list(SrcUid),
    lists:keyfind(AddType, #m_progress_details.progress_type, L).

have_progress_type(SrcUid, AddType) ->
    case get_progress_type(SrcUid, AddType) of
        #m_progress_details{} ->
            true;
        _ ->
            false
    end.