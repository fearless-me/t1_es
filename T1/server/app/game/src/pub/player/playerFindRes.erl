%%% @author 田诚
%%% @copyright (C) 2016, <haowan123>
%%% @doc
%%% 玩家资源找回
%%% 	核心功能介绍：
%%% 	相关玩法都能直接或间接地对应到每日计数器
%%% 	每日计数在角色上线、玩法进行（或完成）、GM命令改变时，基本会有2个事件发生：
%%% 		1.根据当前时间戳重置计数
%%% 		2.计数的增减
%%% 	基于上述条件，在每日计数重置的时候可以得到昨日（或久远）的计数，其它时候得到今日的计数
%%% 	资源找回就是使用昨日（或久远）的计数进行的玩法
%%% @end
%%% Created : 1. 三月 2016 15:37
%%%           2. 20180226 重写
%%% 			优化了功能触发点，优化了部分算法，对无效的统计项进行安全屏蔽操作
%%%           3. 20180321 因家族任务调整而重新调试，优化了相关每日计数器的用法
%%%-------------------------------------------------------------------

-module(playerFindRes).
-author(tiancheng).

-include("playerPrivate.hrl").

%%%-------------------------------------------------------------------
%% 资源找回定义（下文统一称为ACID）
%% 对应配置find_res.ac_id，配置没配也没有
-define(PlayerFindRes_Start, 1).
-define(PlayerFindRes1, 1).        %%1：保卫小羊（守护女神）
-define(PlayerFindRes2, 2).        %%2：每日任务（循环任务/环任务/日常任务/家族任务）
-define(PlayerFindRes3, 3).        %%3：军团单人本（实际未生效，占位）
-define(PlayerFindRes4, 4).        %%4：荒野护送（单人护送）
-define(PlayerFindRes5, 5).        %%5：勇者试炼（勇者荣耀/女神禁闭室）
-define(PlayerFindRes6, 6).        %%6：惊天喵盗团（金币副本）
-define(PlayerFindRes7, 7).        %%7：竞技场
-define(PlayerFindRes8, 8).        %%8：经验副本（萝莉与绅士/经验升降梯）
-define(PlayerFindRes9, 9).        %%9：港口竞速===============[已废弃，可改名占用]=============
-define(PlayerFindRes10, 10).    %%10：元素保卫战（材料副本）
-define(PlayerFindRes11, 11).    %%11：史莱姆秘秘镜
-define(PlayerFindRes12, 12).    %%12：永不停歇，日常打怪经验
-define(PlayerFindRes13, 13).    %%13：日常任务
-define(PlayerFindRes_End, 13).
-type acid() :: ?PlayerFindRes_Start .. ?PlayerFindRes_End.

%%%-------------------------------------------------------------------
%% ACID对应每日计数器
-define(ListDailyCounter, [
    {?PlayerFindRes1, {?DailyType_EnterCopyMapGroup, 11}},    %% 11为cfg_mapsetting.subtype=1时的cfg_mapsetting.daily_entercount_group
    {?PlayerFindRes2, {?DailyType_LoopTaskNum, 7}},    %% 7为循环任务每日领取轮数计数ID，对应playerLoopTask:?DailyType_LoopTaskNum_LoopAccept
    %%{?PlayerFindRes3, {?DailyType_EnterCopyMapGroup, 0}},	%% 实际未生效，备注占位
    %%{?PlayerFindRes4, {?DailyType_Everyday, ?PlayerEveryDay_Escort_Solo}},	%% fixme 配置上未使用该值，不确定功能是否正常，暂时屏蔽
    %%{?PlayerFindRes5, {?DailyType_WarriorTrial, ?WarriorTrialSchedule}},	%% fixme 配置上未使用该值，不确定功能是否正常，暂时屏蔽
    {?PlayerFindRes6, {?DailyType_EnterCopyMap, 520}},    %% 520为cfg_mapsetting.subtype=1009时的唯一地图ID
    %%{?PlayerFindRes7, {?DailyType_Ladder1v1, 2}},	%% 2为竞技场每日免费挑战次数，对应playerLadder1v1:?DailySubType_TiaoZhan_Normal fixme 配置上未使用该值，不确定功能是否正常，暂时屏蔽。注意：原代码基于该值还累加了每日付费挑战次数?DailySubType_TiaoZhan_Charge
    {?PlayerFindRes8, {?DailyType_EnterCopyMapGroup, 2}},    %% 2为cfg_mapsetting.subtype=5时的cfg_mapsetting.daily_entercount_group
    %%{?PlayerFindRes9, {0, 0}},	%% 实际未生效，备注占位
    {?PlayerFindRes10, {?DailyType_EnterCopyMapGroup, 1}},    %% 2为cfg_mapsetting.subtype=1008时的cfg_mapsetting.daily_entercount_group
    {?PlayerFindRes11, {?DailyType_EnterCopyMapGroup, 4}},    %% 4为cfg_mapsetting.subtype=1013时的cfg_mapsetting.daily_entercount_group
    {?PlayerFindRes12, {?DailyType_KillMonsterExp, 0}},    %% 0为每日击杀怪物获得经验数计数ID
    {?PlayerFindRes13, {?DailyType_ExpTask, 0}}    %% 0为日常任务的计数ID
]).

%%%-------------------------------------------------------------------
%% 数据插入类型
-define(InsertType_Add, 0).    %% 新增
-define(InsertType_Update, 1).    %% 修改

%%%-------------------------------------------------------------------
%% #rec_player_find_res{}结构额外备注
%% param1为今日剩余多少次
%% param2为今日还可以找回多少次
%% 根据需求LUNA-5922，param1和param2对应的角色等级可能是不一样的

%%%-------------------------------------------------------------------
%% 关于“最后等级”的描述
%% 基于需求LUNA-5922，角色在进行资源找回时，应当是前一日最后的等级，而不是当前等级
%% 而角色可能在前一日没有登录，则推导为上次登录后的最后等级
%% 对于新创建的角色，最后等级固定为1

%% ====================================================================
%% API functions
%% ====================================================================

%% api
-export([
    init/0,                %% 角色加载后的初始化
    initFindResList/0,    %% 角色首次进入地图后的初始化
    onDailyChange/5,    %% 重置每日计数时若角色在线时的重置
    getLastLevel/0,        %% 刷新并获取角色的最后等级（详见上文备注）
    saveYBTX/0            %% 下线时强制保存永不停歇的数据
]).

%% msg
-export([
    requestFindRes/0,    %% 请求资源找回列表
    refindResOne/2,        %% 请求单个资源找回
    refindResAll/1        %% 请求全部资源找回
]).

%%%-------------------------------------------------------------------
%% api:角色加载后的初始化
-spec init() -> no_return().
init() ->
    %% 角色的资源找回单独存db表player_find_res
    %% 此处将从db加载的数据拷贝至同步属性?SerProp_playerFindRes中
    %% 便于下文计算
    IsPlayer = playerState:getIsPlayer(),
    IsCross = core:isCross(),
    case IsPlayer andalso not IsCross of
        true ->
            RoleID = playerState:getRoleID(),
            Match = #rec_player_find_res{roleID = {RoleID, _ = '_'}, _ = '_'},
            Res = edb:dirtyMatchRecord(rec_player_find_res, Match),
            playerPropSync:setAny(?SerProp_playerFindRes, Res);
        _ ->
            skip
    end.

%%%-------------------------------------------------------------------
%% api:角色首次进入地图后的初始化
-spec initFindResList() -> no_return().
initFindResList() ->
    IsPlayer = playerState:getIsPlayer(),
    IsCross = core:isCross(),
    case IsPlayer andalso not IsCross of
        true ->
            case playerState:isFirstEnterMap() of
                true ->
                    %% 如果是首次进入地图，则延时初始化
                    erlang:send_after(1000, self(), initFindResList);
                _ ->
                    getLastLevel(),    %% 初始化旧有等级
                    freshFindRes()    %% 刷新资源找回数据
            end;
        _ ->
            skip
    end.

%%%-------------------------------------------------------------------
%% api:每日计数变化的时候触发
-spec onDailyChange(DailyType :: dailyType(), DailyID :: uint(), IsReset :: boolean(), Count :: uint(), TimeNow :: uint64()) -> no_return().
onDailyChange(DailyType, DailyID, IsReset, Count, TimeNow) ->
    IsPlayer = playerState:getIsPlayer(),
    IsCross = core:isCross(),
    case IsPlayer andalso not IsCross of
        true ->
            case lists:keyfind({DailyType, DailyID}, 2, ?ListDailyCounter) of
                {ACID, _} ->
                    freshFindRes(ACID, IsReset, Count, TimeNow);
                _ ->
                    skip
            end;
        _ ->
            skip
    end.

%%%-------------------------------------------------------------------
%% api:刷新并获取角色的最后等级
%% 需要在角色上线、角色升级时调用
-spec getLastLevel() -> LastLevel :: uint16().
getLastLevel() ->
    [{_LastTimeOld, LastLevelOld} = DataOld, {LastTimeNew, LastLevelNew} = DataNew] =
        playerPropSync:getProp(?SerProp_playerFindResLastLevel),
    DataNow = {time:getSyncTimeFromDBS(), erlang:max(playerState:getLevel(), 1)},
    %% 新数据是今日时间，则刷新今日数据，保留旧数据，返回旧数据
    case core:timeIsOnDay(LastTimeNew + ?SECS_FROM_0_TO_1970) of
        true ->
            playerPropSync:setAny(?SerProp_playerFindResLastLevel, [DataOld, DataNow]),
            LastLevelOld;
        _ ->
            %% 新数据不是今日时间，则使用新数据替换旧数据，使用今日时间替换新数据，返回上文新数据
            playerPropSync:setAny(?SerProp_playerFindResLastLevel, [DataNew, DataNow]),
            LastLevelNew
    end.

%%%-------------------------------------------------------------------
%% msg:请求资源找回列表
-spec requestFindRes() -> no_return().
requestFindRes() ->
    IsPlayer = playerState:getIsPlayer(),
    IsCross = core:isCross(),
    case IsPlayer andalso not IsCross of
        true ->
            freshFindRes(),
            LevelLast = getLastLevel(),
            ListKey = getCfg:get1KeyList(cfg_find_res),
            ListCfg = [getCfg:getCfgByKey(cfg_find_res, Key) || Key <- ListKey],
            ListRes = playerPropSync:getProp(?SerProp_playerFindRes),
            GuildID = playerState:getGuildID(),
            ListResForMsg = requestFindRes(ListRes, [], ListCfg, LevelLast, GuildID),
            ?DEBUG("[DebugForFindRes] requestFindRes ~w", [ListResForMsg]),
            playerMsg:sendNetMsg(#pk_RefindResList{resList = ListResForMsg});
        _ ->
            skip
    end.
-spec requestFindRes([#rec_player_find_res{}, ...], [#pk_RefindResInfo{}, ...], ListCfg :: [#find_resCfg{}, ...], LevelLast :: uint16(), GuildID :: uint64()) -> [#pk_RefindResInfo{}, ...].
requestFindRes([], Acc, _ListCfg, _LevelLast, _GuildID) ->
    Acc;
requestFindRes([#rec_player_find_res{activityID = ?PlayerFindRes2} | T], Acc, ListCfg, LevelLast, 0) ->
    requestFindRes(T, Acc, ListCfg, LevelLast, 0);    %% 特殊处理家族任务，需要在家族中才可见
requestFindRes([#rec_player_find_res{activityID = ACID, param2 = P2} | T], Acc, ListCfg, LevelLast, GuildID) ->
    case getFindResConfByLevel(ListCfg, ACID, LevelLast) of
        #find_resCfg{id = ID} ->
            requestFindRes(T, [#pk_RefindResInfo{id = ID, number = P2} | Acc], ListCfg, LevelLast, GuildID);
        _ ->
            requestFindRes(T, Acc, ListCfg, LevelLast, GuildID)
    end.


%%%-------------------------------------------------------------------
%% msg:请求单个资源找回
%%-spec refindResOne(ID :: uint16(), Type :: bool01()|boolean()) -> no_return().
refindResOne(ID, Type) ->
    IsPlayer = playerState:getIsPlayer(),
    IsCross = core:isCross(),
    case IsPlayer andalso not IsCross of
        true ->
            freshFindRes(),
            case getCfg:getCfgByKey(cfg_find_res, ID) of
                #find_resCfg{ac_id = ACID} ->
                    refindRes(ACID, misc:convertBoolFromInt(Type), 1);
                _ ->
                    skip
            end,
            requestFindRes();    %% 向客户端刷新数据
        _ ->
            skip
    end.

%%%-------------------------------------------------------------------
%% msg:请求全部资源找回

refindResAll(Type) ->
    IsPlayer = playerState:getIsPlayer(),
    IsCross = core:isCross(),
    case IsPlayer andalso not IsCross of
        true ->
            freshFindRes(),
            LevelLast = getLastLevel(),
            ListKey = getCfg:get1KeyList(cfg_find_res),
            ListCfg = [getCfg:getCfgByKey(cfg_find_res, Key) || Key <- ListKey],
            ListRes = playerPropSync:getProp(?SerProp_playerFindRes),
            GuildID = playerState:getGuildID(),
            ListResForMsg = requestFindRes(ListRes, [], ListCfg, LevelLast, GuildID),
            TypeReal = misc:convertBoolFromInt(Type),
            [refindRes(ID, TypeReal, Count) || #pk_RefindResInfo{id = ID, number = Count} <- ListResForMsg],
            requestFindRes();    %% 向客户端刷新数据
        _ ->
            skip
    end.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%%-------------------------------------------------------------------
%% internal:批量查询相关每日计数器，间接达到刷新资源找回数据的目的
-spec freshFindRes() -> no_return().
freshFindRes() ->
    List = playerPropSync:getProp(?SerProp_playerFindRes),
    TimeNow = time:getSyncTime1970FromDBS(),
    freshFindRes(?ListDailyCounter, List, TimeNow).
freshFindRes([], _List, _TimeNow) ->
    ok;
freshFindRes([{_, {DailyType, DailyID}} | T], List, TimeNow) ->
    %% 计数器可能没有初始化，初始化之，后面逻辑才正常
    playerDaily:initDailyCounterForFindRes(DailyType, DailyID),
    freshFindRes(T, List, TimeNow).

%%%-------------------------------------------------------------------
%% internal:刷新资源找回数据
%% IsReset不需要重置时，Count为今日的次数，需要重置时，Count为上一次的次数（上一次可能是昨天，也可能是久远）
-spec freshFindRes(ACID :: uint16(), IsReset :: boolean(), Count :: uint(), TimeNow :: uint()) -> no_return().
freshFindRes(ACID, IsReset, Count, TimeNow) ->
    RetCfg = getFindResConfByLevel(ACID),
    RetMax = getMaxTimes(RetCfg),
    List = playerPropSync:getProp(?SerProp_playerFindRes),
    Res = lists:keyfind(ACID, #rec_player_find_res.activityID, List),
    freshFindRes(Res, ACID, RetMax, IsReset, Count, TimeNow),
    %%?DEBUG("[DebugForFindRes] freshFindRes:~w~nRet:~w~n~p",
    %%	[
    %%		{Res, ACID, RetMax, IsReset, Count, TimeNow},
    %%		lists:keyfind(ACID, #rec_player_find_res.activityID, playerPropSync:getProp(?SerProp_playerFindRes)),
    %%		misc:getStackTrace()
    %%	]
    %%),
    ok.

%%%-------------------------------------------------------------------
%% internal:刷新资源找回数据（核心函数）
-spec freshFindRes(
    Res :: #rec_player_find_res{}|false,    %% 为false表示当前没有ACID对应的资源找回数据，需要新建，否则传入的是旧有数据
    ACID :: acid(),                            %% 标识不同的资源找回类型
    RetMax :: {uint(), uint()},                %% 最后等级和当前等级分别对应的资源找回最大次数
    IsResetDaily :: boolean(),                %% 每日计数是否发生了重置
    Count :: uint(),                            %% 若IsResetDaily为true，则Count为最后等级对应消耗计数；否则，Count为当前等级对应消耗计数
    TimeNow :: uint()                            %% 当前时间戳，来自time:getSyncTime1970FromDBS/0
) ->
    no_return().
%% 没有数据，新建数据；外部判断不需要重置
freshFindRes(false, ACID, {_MaxLast, MaxNow}, false, Count, TimeNow) ->
    ResNew = #rec_player_find_res{
        roleID = {playerState:getRoleID(), ACID},
        activityID = ACID,
        param1 = erlang:max(0, MaxNow - Count),
        param2 = 0,
        freshtime = TimeNow
    },
    saveRes(true, ResNew, ?InsertType_Add);
%% 有数据；外部判断不需要重置
freshFindRes(Res, _ACID, {_MaxLast, MaxNow}, false, Count, TimeNow) ->
    ResNew = Res#rec_player_find_res{
        param1 = erlang:max(0, MaxNow - Count),
        freshtime = TimeNow
    },
    saveRes(Res =/= ResNew, ResNew, ?InsertType_Update);
%% 有数据；外部判断需要重置
freshFindRes(#rec_player_find_res{} = Res, _ACID, {MaxLast, MaxNow}, _IsReset, Count, TimeNow) ->
    ResNew = Res#rec_player_find_res{
        param1 = MaxNow,
        param2 = erlang:max(0, MaxLast - Count),
        freshtime = TimeNow
    },
    saveRes(Res =/= ResNew, ResNew, ?InsertType_Update);
%% 没有数据；外部判断需要重置
freshFindRes(false, ACID, {MaxLast, MaxNow}, true, Count, TimeNow) ->
    ResNew = #rec_player_find_res{
        roleID = {playerState:getRoleID(), ACID},
        activityID = ACID,
        param1 = MaxNow,
        param2 = erlang:max(0, MaxLast - Count),
        freshtime = TimeNow
    },
    saveRes(true, ResNew, ?InsertType_Add).

%%%-------------------------------------------------------------------
%% internal:根据ACID获取配置
%% 返回最后等级和当前等级对应的配置
-spec getFindResConfByLevel(ACID :: acid()) -> {#find_resCfg{}|term(), #find_resCfg{}|term()}.
getFindResConfByLevel(ACID) ->
    LevelLast = getLastLevel(),
    ListKey = getCfg:get1KeyList(cfg_find_res),
    getFindResConfByLevel(ListKey, ACID, LevelLast, playerState:getLevel(), {{}, {}}).
getFindResConfByLevel([], _ACID, _LevelLast, _LevelNew, Acc) ->
    Acc;    %% 遍历结束
getFindResConfByLevel(_, _ACID, _LevelLast, _LevelNew, {#find_resCfg{}, #find_resCfg{}} = Acc) ->
    Acc;    %% 得出结果
getFindResConfByLevel([ID | T], ACID, Level, Level, Acc) ->
    case getCfg:getCfgByKey(cfg_find_res, ID) of
        #find_resCfg{ac_id = ACID, open_level = OLvl, lvl_s = LvlS, lvl_e = LvlE} = Cfg when
            Level >= OLvl, Level >= LvlS, Level =< LvlE ->
            {Cfg, Cfg};    %% 新旧等级相同得到同一配置
        _ ->
            getFindResConfByLevel(T, ACID, Level, Level, Acc)
    end;
getFindResConfByLevel([ID | T], ACID, LevelLast, LevelNew, {CfgLast, CfgNew} = Acc) ->
    case getCfg:getCfgByKey(cfg_find_res, ID) of
        #find_resCfg{ac_id = ACID, open_level = OLvl, lvl_s = LvlS, lvl_e = LvlE} = Cfg when
            LevelLast >= OLvl, LevelLast >= LvlS, LevelLast =< LvlE ->
            getFindResConfByLevel(T, ACID, LevelLast, LevelNew, {Cfg, CfgNew});
        #find_resCfg{ac_id = ACID, open_level = OLvl, lvl_s = LvlS, lvl_e = LvlE} = Cfg when
            LevelNew >= OLvl, LevelNew >= LvlS, LevelNew =< LvlE ->
            getFindResConfByLevel(T, ACID, LevelLast, LevelNew, {CfgLast, Cfg});
        _ ->
            getFindResConfByLevel(T, ACID, LevelLast, LevelNew, Acc)
    end.

%%%-------------------------------------------------------------------
%% internal:根据ACID和角色等级获取配置
-spec getFindResConfByLevel(ListCfg :: [#find_resCfg{}, ...], ACID :: acid(), Level :: uint16()) -> #find_resCfg{}|term().
getFindResConfByLevel([], _ACID, _Level) ->
    {};
getFindResConfByLevel([#find_resCfg{ac_id = ACID, open_level = OLvl, lvl_s = LvlS, lvl_e = LvlE} = Cfg | _T], ACID, Level)
    when Level >= OLvl, Level >= LvlS, Level =< LvlE ->
    Cfg;
getFindResConfByLevel([_H | T], ACID, Level) ->
    getFindResConfByLevel(T, ACID, Level).

%%%-------------------------------------------------------------------
%% internal:根据配置获取最大次数
-spec getMaxTimes(RetCfg :: {#find_resCfg{}|term(), #find_resCfg{}|term()}) -> RetMax when
    RetMax :: {uint(), uint()}.
getMaxTimes({CfgLast, CfgNow}) ->
    {getMaxTimesBuyCfg(CfgLast), getMaxTimesBuyCfg(CfgNow)}.

%%%-------------------------------------------------------------------
%% internal:根据配置获取最大次数
-spec getMaxTimesBuyCfg(#find_resCfg{}|term()) -> uint().
getMaxTimesBuyCfg(#find_resCfg{max_times = Max}) ->
    Max;
getMaxTimesBuyCfg(_) ->
    0.

%%%-------------------------------------------------------------------
%% internal:保存资源找回数据
-spec saveRes(boolean(), #rec_player_find_res{}, ?InsertType_Add | ?InsertType_Update) -> no_return().
saveRes(true, #rec_player_find_res{activityID = Key} = Res, Type) ->
    case core:isCross() of
        false ->
            %% 同步属性
            List = playerPropSync:getProp(?SerProp_playerFindRes),
            NewList = lists:keystore(Key, #rec_player_find_res.activityID, List, Res),
            playerPropSync:setAny(?SerProp_playerFindRes, NewList),
            %% 数据库与ets
            case Type of
                ?InsertType_Add ->
                    saveRes(Res, Type);
                _ ->
                    %% 刷新的都不存，改为领取和下线的时候存
                    skip
            end,
            ok;
        _ ->
            skip
    end;
saveRes(_, _Res, _Type) ->
    skip.

%%%-------------------------------------------------------------------
%% internal:间断保存需要更新而非新建的永不停歇，实时保存其它数据
-spec saveRes(#rec_player_find_res{}, ?InsertType_Add | ?InsertType_Update) -> no_return().
%%saveRes(#rec_player_find_res{activityID = ?PlayerFindRes12} = Res, ?InsertType_Update) ->
%%	case playerState2:canSaveYBTX2DB() of
%%		true ->
%%			edb:writeRecord(Res),
%%			gsSendMsg:sendMsg2DBServer(savePlayerFindRes, playerState:getAccountID(), {Res, ?InsertType_Update});
%%		_ ->
%%			skip
%%	end;
saveRes(Res, Type) ->
    edb:writeRecord(Res),
    gsSendMsg:sendMsg2DBServer(savePlayerFindRes, playerState:getAccountID(), {Res, Type}).

%%%-------------------------------------------------------------------
%% internal:执行资源找回
-spec refindRes(ACID :: acid(), CanUseMoney :: boolean(), FindNum :: uint()) -> {boolean(), Cost :: uint()}.
refindRes(ACID, CanUseMoney, FindNum) ->
    case getFindResConfByLevel(ACID) of
        {#find_resCfg{
            id = ID,
            max_times = MaxTimes,    %% 最大召回次数
            use_diamond = Diamond,    %% 若使用钻石找回，消耗钻石数，对应?CoinUseTypeDiamond
            diamonds_find = Ber,    %% 若使用钻石找回，奖励的倍率
            reward_exp = Exp,        %% 经验奖励 uint
            type_number = MoneysArg,%% 货币奖励[{coinType(), uint()}, ...]
            value = Liveness,        %% 活跃度 playerLiveness
            ext_item = ItemRewardArg%% 道具奖励[{ItemID::uint16(), Count::uint()}, ...]
        }, _} when FindNum > 0 ->
            %% 参数格式修正
            {Moneys, ItemReward} = refindRes_checkArgs(ID, MoneysArg, ItemRewardArg),
            %% 验证资源找回数是否足够
            ListRes = playerPropSync:getProp(?SerProp_playerFindRes),
            case lists:keyfind(ACID, #rec_player_find_res.activityID, ListRes) of
                #rec_player_find_res{param2 = P2} = Res when P2 >= FindNum, P2 > 0 ->
                    %% 修正计算参数，包含对永不停歇的特殊处理
                    {Number, Number2, DecDiamond, RExp, RewardValue} =
                        refindRes_spec2YBTX(ACID, P2, MaxTimes, FindNum, Exp),
                    %% 扣除货币
                    case refindRes_useCoin(Diamond, DecDiamond, CanUseMoney, ACID) of
                        {false, _} = Ret ->
                            Ret;
                        {true, _} = Ret ->
                            refindRes_costP2(Res, Number),    %% 扣除次数
                            refindRes_rewardExp(CanUseMoney, ACID, RExp, Ber, Number, RewardValue),    %% 经验奖励
                            refindRes_rewardLiveness(CanUseMoney, Liveness, Ber, Number2),    %% 奖励活跃度
                            refindRes_rewardCoin(Moneys, CanUseMoney, ACID, Ber, Number2),    %% 奖励货币
                            refindRes_rewardItem(ItemReward, CanUseMoney, Ber, Number2),    %% 奖励道具
                            Ret
                    end;
                _ ->
                    {false, 0}
            end;
        _ ->
            {false, 0}
    end.

%% 参数格式检查
-spec refindRes_checkArgs(ID :: uint16(), MoneysArg :: term(), ItemRewardArg :: term()) ->
    {Moneys :: [{coinType(), uint()}, ...], ItemReward :: [{uint16(), uint()}, ...]}.
refindRes_checkArgs(ID, MoneysArg, ItemRewardArg) ->
    Moneys =
        case MoneysArg of
            [{_, _} | _] ->
                MoneysArg;
            [] ->
                [];
            undefined ->
                [];
            _ ->
                ?ERROR("invalid cfg id=~w find_res.type_number=~w", [ID, MoneysArg]),
                []
        end,
    ItemReward =
        case ItemRewardArg of
            [{_, _} | _] ->
                ItemRewardArg;
            [] ->
                [];
            undefined ->
                [];
            _ ->
                ?ERROR("invalid cfg id=~w find_res.ext_item=~w", [ID, ItemRewardArg]),
                []
        end,
    {Moneys, ItemReward}.

%% 修正计算参数，包含对永不停歇的特殊处理
%% FIXME 如果是永不停歇经验找回，一串特殊处理，傻逼策划
%% 特别保留上述特殊处理提示
%% 看见我写的那么多备注没？理解成本高不高？
-spec refindRes_spec2YBTX(ACID :: acid(), P2 :: uint(), Max :: uint(), FindNum :: uint(), Exp :: uint()) ->
    {Number :: uint(), Number2 :: uint(), DecDiamond :: number(), RExp :: uint(), RewardValue :: number()}.
refindRes_spec2YBTX(?PlayerFindRes12, P2, Max, _FindNum, _Exp) ->
    {
        P2,            %% 找回操作消耗所有次数 对应经验值奖励
        1,            %% 所有次数被视为1次找回操作 对应其它奖励
        P2 / Max,    %% 可找回次数占总次数比率，用于计算消耗以及收益
        1,            %% Number对应每单位经验值奖励
        0.5            %% 经验奖励修正比率
    };
refindRes_spec2YBTX(_ACID, _P2, _Max, FindNum, Exp) ->
    {
        FindNum,    %% 找回操作消耗次数为指定次数
        FindNum,    %% 找回次数等价于消耗次数
        FindNum,    %% 奖励倍率等价于消耗次数
        Exp,        %% Number对应每单位经验值奖励
        1            %% 经验奖励修正比率
    }.

%% 扣除货币
-spec refindRes_useCoin(Diamond :: uint(), DecDiamond :: number(), CanUseMoney :: boolean(), ACID :: acid()) -> {boolean(), uint()}.
refindRes_useCoin(_Diamond, _DecDiamond, false, _ACID) ->
    {true, 0};    %% 不需要花钱
refindRes_useCoin(Diamond, DecDiamond, _CanUseMoney, ACID) ->
    NeedDiamond = misc:ceil(Diamond * DecDiamond),
    Go =
        case playerMoney:canUseCoin(?CoinUseTypeDiamond, NeedDiamond) of
            true ->
                PLog = #recPLogTSMoney{
                    reason = ?CoinUseFindRes,
                    param = ACID,
                    target = ?PLogTS_FindRes,
                    source = ?PLogTS_PlayerSelf
                },
                playerMoney:useCoin(?CoinUseTypeDiamond, NeedDiamond, PLog);
            _ ->
                playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond),
                false
        end,
    {Go, NeedDiamond}.

%% 扣除次数
-spec refindRes_costP2(#rec_player_find_res{}, uint()) -> no_return().
refindRes_costP2(#rec_player_find_res{param2 = P2} = Res, Number) ->
    NowTime = time:getSyncTime1970FromDBS(),
    NewRes = Res#rec_player_find_res{param2 = P2 - Number, freshtime = NowTime},
    case Res /= NewRes of
        true ->
            %% 更新内存
            saveRes(Res /= NewRes, NewRes, ?InsertType_Update),
            %% 更新数据库
            saveRes(NewRes, ?InsertType_Update);
        _ ->
            skip
    end,
    ok.

%% 经验奖励
-spec refindRes_rewardExp(CanUseMoney :: boolean(), ACID :: acid(), RExp :: uint(), Ber :: number(), Number :: uint(), RewardValue :: number()) -> no_return().
refindRes_rewardExp(CanUseMoney, ACID, RExp, Ber, Number, RewardValue) ->
    AddExp =
        case CanUseMoney of
            true ->
                erlang:trunc(RExp * Ber * Number * RewardValue);
            _ ->
                erlang:trunc(RExp * Number * RewardValue)
        end,
    case AddExp > 0 of
        true ->
            playerBase:addExp(AddExp, ?ExpSourceFindRes, ACID);
        _ ->
            skip
    end.

%% 奖励活跃度
-spec refindRes_rewardLiveness(CanUseMoney :: boolean(), Liveness :: uint(), Ber :: number(), Number2 :: uint()) -> no_return().
refindRes_rewardLiveness(CanUseMoney, Liveness, Ber, Number2) ->
    AddLiveness =
        case CanUseMoney of
            true ->
                trunc(Liveness * Ber * Number2);
            _ ->
                trunc(Liveness * Number2)
        end,
    playerliveness:addTotalLivenessValue(AddLiveness).

%% 奖励货币
-spec refindRes_rewardCoin(Moneys :: list(), CanUseMoney :: boolean(), ACID :: acid(), Ber :: number(), Number2 :: uint()) -> no_return().
refindRes_rewardCoin(Moneys, CanUseMoney, ACID, Ber, Number2) ->
    PLogCoin = #recPLogTSMoney{
        reason = ?CoinSourceFindRes,
        param = ACID,
        target = ?PLogTS_PlayerSelf,
        source = ?PLogTS_FindRes
    },
    refindRes_rewardCoin_(Moneys, CanUseMoney, Ber, Number2, PLogCoin).
-spec refindRes_rewardCoin_(Moneys :: list(), CanUseMoney :: boolean(), Ber :: number(), Number2 :: uint(), PLogCoin :: #recPLogTSMoney{}) -> no_return().
refindRes_rewardCoin_([], _CanUseMoney, _Ber, _Number2, _PLogCoin) ->
    ok;
refindRes_rewardCoin_([{MoneyType, Money} | T], CanUseMoney, Ber, Number2, PLogCoin) ->
    AddMoney =
        case CanUseMoney of
            true ->
                trunc(Money * Ber * Number2);
            _ ->
                (Money * Number2)
        end,
    playerMoney:addCoin(MoneyType, erlang:trunc(AddMoney), PLogCoin),
    refindRes_rewardCoin_(T, CanUseMoney, Ber, Number2, PLogCoin).

%% 奖励道具
-spec refindRes_rewardItem(ItemReward :: list(), CanUseMoney :: boolean(), Ber :: number(), Number2 :: uint()) -> no_return().
refindRes_rewardItem(ItemReward, CanUseMoney, Ber, Number2) ->
    PLogItem = #recPLogTSItem{
        target = ?PLogTS_PlayerSelf,
        source = ?PLogTS_FindRes,
        changReason = ?ItemSourceFindRes
    },
    refindRes_rewardItem_(ItemReward, CanUseMoney, Ber, Number2, PLogItem).
-spec refindRes_rewardItem_(Moneys :: list(), CanUseMoney :: boolean(), Ber :: number(), Number2 :: uint(), PLogItem :: #recPLogTSItem{}) -> no_return().
refindRes_rewardItem_([], _CanUseMoney, _Ber, _Number2, _PLogItem) ->
    ok;
refindRes_rewardItem_([{ItemId, Num} | T], CanUseMoney, Ber, Number2, PLogItem) ->
    AddItemNum =
        case CanUseMoney of
            true ->
                trunc(Ber * Num * Number2);
            _ ->
                Num * Number2
        end,
    PLogItem2 = PLogItem#recPLogTSItem{new = AddItemNum, change = AddItemNum, reasonParam = ItemId},
    playerPackage:addGoodsAndMail(ItemId, AddItemNum, true, 0, PLogItem2),
    refindRes_rewardItem_(T, CanUseMoney, Ber, Number2, PLogItem).

%%%-------------------------------------------------------------------
%% api:强制保存永不停歇
-spec saveYBTX() -> no_return().
saveYBTX() ->
    case core:isCross() of
        false ->
            List = playerPropSync:getProp(?SerProp_playerFindRes),
            F =
                fun(Res) ->
                    saveRes(Res, ?InsertType_Update)
                end,
            lists:foreach(F, List);
%%			case lists:keyfind(?PlayerFindRes12, #rec_player_find_res.activityID, List) of
%%				false ->
%%					skip;
%%				Res ->
%%					edb:writeRecord(Res),
%%					gsSendMsg:sendMsg2DBServer(savePlayerFindRes, playerState:getAccountID(), {Res, ?InsertType_Update})
%%			end;
        _ ->
            skip
    end.
