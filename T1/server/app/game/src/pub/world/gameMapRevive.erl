-module(gameMapRevive).
-compile(export_all).
-include("cfg_mapsetting.hrl").
-include("type.hrl").
-include("gameMap.hrl").
-include("logger.hrl").

%%设置当前地图玩家已经复活次数
-spec setPlayerRevive({RoleID, Index})->term() when RoleID::uint(),Index::integer().
setPlayerRevive({RoleID, Index}) ->
    PlayerReviveEts = mapState:getMapReviveEts(),
    ets:insert(PlayerReviveEts, #recMapRevive{id = RoleID, reviveCount = Index}).

%%获取当前已经复活次数
-spec getPlayerRevive(RoleID::uint()) -> integer().
getPlayerRevive(RoleID) ->
    PlayerReviveEts = mapState:getMapReviveEts(),
    case ets:lookup(PlayerReviveEts, RoleID) of
        [#recMapRevive{reviveCount = Index}] ->
            Index;
        _ ->
            0
    end.

%%检查玩家是否还有复活次数
-spec canPlayerRevive(RoleID::integer()) -> boolean().
canPlayerRevive(RoleID) ->
    MapID = mapState:getMapId(),
    case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
        #mapsettingCfg{resurrection_times = Num} when Num < 0 ->
            true;
        #mapsettingCfg{resurrection_times = Num} ->
            PlayerReviveEts = mapState:getMapReviveEts(),
            Index =
                case ets:lookup(PlayerReviveEts, RoleID) of
                    [#recMapRevive{reviveCount = Index_}] ->
                        Index_;
                    _ ->
                        0
                end,
            Index < Num;
        _ ->
            false
    end.
