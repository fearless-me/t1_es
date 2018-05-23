%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:06
%%%-------------------------------------------------------------------
-module(mod_map_creator).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("map.hrl").
-include("pub_common.hrl").
-include("vector3.hrl").

-record(map_mgr_r, {
    map_id = 0,
    mgr = undefined
}).
-define(MAP_MGR_ETS, map_mgr_ets__).

%% API
-export([take_over_player_online/2]).
-export([player_change_map/1]).
-export([player_offline/3]).
-export([map_conf/1]).
-export([broadcast_all/0, broadcast_map/1]).

%%
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%-------------------------------------------------------------------
take_over_player_online(MapID, Req) ->
    Mgr = map_mgr(MapID),
    take_1(Mgr, Req),
    ok.

take_1(undefined, Req) ->
    kick_to_born_map(Req);
take_1(Mgr, Req) ->
    case mod_map_mgr:player_join_map(Mgr, Req) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> kick_to_born_map(Req)
    end.

%%%-------------------------------------------------------------------
player_offline(Uid, MapID, MapPid) ->
    Mgr = map_mgr(MapID),
    mod_map_mgr:player_exit_map(
        Mgr,
        #r_exit_map_req{
            map_id = MapID,
            map_pid = MapPid,
            uid = Uid
        }
    ),
    ok.

%%%-------------------------------------------------------------------
player_change_map(Req) ->
    CurMgr = map_mgr(Req#r_change_map_req.map_id),
    TarMgr = map_mgr(Req#r_change_map_req.tar_map_id),
    ?INFO("player ~p, changeMap ~p:~p -> ~p:~p",
        [
            Req#r_change_map_req.uid,
            Req#r_change_map_req.map_id,
            CurMgr,
            Req#r_change_map_req.tar_map_id,
            TarMgr
        ]
    ),
    case CurMgr of
        undefined -> ?FATAL("player[~p] cur map[~p] not exists",
            [Req#r_change_map_req.uid, Req#r_change_map_req.map_id]);
        _ ->
            mod_map_mgr:player_exit_map(
                CurMgr,
                #r_exit_map_req{
                    map_id = Req#r_change_map_req.map_id,
                    map_pid = Req#r_change_map_req.map_pid,
                    uid = Req#r_change_map_req.uid
                }
            )
    end,
    case TarMgr of
        undefined ->
            ?ERROR("player[~p] tar map[~p] not exists",
                [Req#r_change_map_req.uid, Req#r_change_map_req.tar_map_id]),
            kick_to_born_map(Req);
        _ ->
            case mod_map_mgr:player_join_map(TarMgr, Req) of
                #r_change_map_ack{} = Ack -> Ack;
                _ -> kick_to_born_map(Req)
            end
    end.

%%%-------------------------------------------------------------------
kick_to_born_map(Req) ->
    Mid = born_map_id(),
    Pos = born_map_pos(),
    Mgr = map_mgr( Mid ),
    ?WARN("kick player[~p] to born map",
        [Req#r_change_map_req.uid]),
    
    case mod_map_mgr:player_join_map(
        Mgr,
        Req#r_change_map_req{
           tar_map_id = Mid,
            tar_pos = Pos
        }
     ) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> ?FATAL("fatal error, player[~p]can not enter the born map",
            [Req#r_change_map_req.uid])
    end.

%%%-------------------------------------------------------------------
broadcast_all() ->
    ok.

%%%-------------------------------------------------------------------
broadcast_map(_MapID) ->
    ok.

%%%-------------------------------------------------------------------
map_mgr(MapID) ->
    case ets:lookup(?MAP_MGR_ETS, MapID) of
        [#map_mgr_r{mgr = Mgr} | _] -> Mgr;
        _ -> undefined
    end.

%%%-------------------------------------------------------------------
map_conf(MapID) -> gameMapCfg:getMapCfg(MapID).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),

    ets:new(?MAP_MGR_ETS, [protected, named_table, {keypos, #map_mgr_r.map_id}, ?ETSRC]),

    load_all_map(),

    ?INFO("map_creator started"),
    {ok, {}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
load_all_map() ->
    L = getCfg:get1KeyList(cfg_mapsetting),
    _ = [load_one_map(MapID) || MapID <- L],
    ok.

load_one_map(MapID) ->
    {ok, Pid} = mod_map_mgr_supervisor:start_child(MapID),
    ets:insert(
        ?MAP_MGR_ETS,
        #map_mgr_r{
            map_id = MapID,
            mgr = Pid
        }),
    ok.


born_map_id()   -> 1.
born_map_pos()  -> #vector3{x = 323.19, z = 255.8}.







