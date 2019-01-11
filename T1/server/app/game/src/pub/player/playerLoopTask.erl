%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 家族任务_角色接口
%%% 以前叫环任务，也叫过每日任务，后来并入家族系统，叫家族任务
%%% 结构上保持是每X轮Y环的结构
%%% @end
%%% Created : 20160829 从幻想任务重写，后强制取名为家族任务
%%%           20171102 优化方案改动了核心算法，顺便重写了
%%%           20171213 可通过家族索取、捐赠上交任务的任务道具，从此和家族系统紧密相关
%%%           20180310 LUNA-4248
%%%                    1.区分完成轮计数与领取轮计数，前者用于当日的逻辑运算，后者用于资源找回
%%%                    2.重置家族任务时保留已领取的任务和一键五星状态
%%%                    3.重置家族任务时，若有保留的任务，免除一次增加完成轮计数的机会
%%%           20180411 优化随机任务算法
%%%           20180425 LUNA-7006
%%%-------------------------------------------------------------------
-module(playerLoopTask).
-author("meitianyang").
%%
%%-include("playerPrivate.hrl").
%%-include("../guild/guildPrivate.hrl").
%%-include("cfg_guildDonation_reward.hrl").  %% 家族任务相关_捐赠奖励
%%-include("setupLang.hrl").
%%
%%%%%-------------------------------------------------------------------
%%% ?DailyType_LoopTaskNum 计数器子定义
%%-define(DailyType_LoopTaskNum_BEGIN,            0).
%%-define(DailyType_LoopTaskNum_Loop,             0).  %% 完成轮计数，用于模块内逻辑运算
%%-define(DailyType_LoopTaskNum_Process,          1).  %% 单轮进度计数
%%-define(DailyType_LoopTaskNum_RefreshFree,      2).  %% 免费刷新计数
%%-define(DailyType_LoopTaskNum_RefreshCost,      3).  %% 付费刷新计数
%%-define(DailyType_LoopTaskNum_RefreshFive,      4).  %% 单次五星刷新计数
%%-define(DailyType_LoopTaskNum_RefreshAllFive,   5).  %% 一键五星刷新计数
%%-define(DailyType_LoopTaskNum_GuildWantGet,     6).  %% 家族相关索取计数
%%-define(DailyType_LoopTaskNum_LoopAccept,       7).  %% 领取轮计数，用于资源找回
%%-define(DailyType_LoopTaskNum_END,              7).
%%
%%%%%-------------------------------------------------------------------
%%% 环任务状态
%%-define(LoopTaskState_BEGIN,        0).
%%-define(LoopTaskState_Going,        0).  %% 进行中
%%-define(LoopTaskState_Completed,    1).  %% 已完成
%%-define(LoopTaskState_Cancelled,    2).  %% 已放弃
%%-define(LoopTaskState_END,          2).
%%
%%%%%-------------------------------------------------------------------
%%% 同步数据时机
%%-define(SyncTimeState_BEGIN,                0).
%%-define(SyncTimeState_Online,               0).     %% 上线同步
%%-define(SyncTimeState_Reset,                1).     %% 每日重置
%%-define(SyncTimeState_Accept,               2).     %% 领取任务
%%-define(SyncTimeState_Complete,             3).     %% 完成任务
%%-define(SyncTimeState_Cancel,               4).     %% 放弃任务
%%-define(SyncTimeState_Refresh_Free,         5).     %% 免费刷新
%%-define(SyncTimeState_Refresh_Cost,         6).     %% 付费刷新
%%-define(SyncTimeState_Refresh_FiveStar,     7).     %% 单次五星
%%-define(SyncTimeState_Refresh_AllFiveStar,  8).     %% 一键五星
%%-define(SyncTimeState_Complete_LoopAll,     9).     %% 完成当前轮，并完成所有环任务（有奖）
%%-define(SyncTimeState_Complete_LoopPartial, 10).    %% 完成当前轮，但仅有部分环任务（没奖）
%%-define(SyncTimeState_END,                  10).
%%
%%%%%-------------------------------------------------------------------
%%% 客户端对当前正在进行的任务的操作类型
%%-define(OPType_BEGIN,               0).
%%-define(OPType_Cancel,              0).  %% 放弃
%%-define(OPType_Free,                1).  %% 免费刷新
%%-define(OPType_Cost,                2).  %% 付费刷新
%%-define(OPType_FiveStar,            3).  %% 单次五星
%%-define(OPType_AllFiveStar,         4).  %% 一键五星
%%-define(OPType_END,                 4).
%%
%%%%%-------------------------------------------------------------------
%%% 常用星级定义
%%-define(Star_None,  -1).    %% 不限星级
%%-define(Star_Five,  5).     %% 5星（一键五星独家赞助）
%%
%%%%%-------------------------------------------------------------------
%%% 常用返回值定义
%%-define(Mark_False,     0).     %% 标记为失败，后续不处理
%%-define(Mark_True,      1).     %% 标记为成功，继续处理
%%-define(Mark_Others,    2).     %% 标记为特殊情况，另行处理
%%-type mark() :: ?Mark_False .. ?Mark_Others.
%%
%%%%%-------------------------------------------------------------------
%%% 引导玩家去领环任务的引导任务
%%-define(LoopTaskLindID, 1501).
%%
%%%%%-------------------------------------------------------------------
%%% 反馈索取信息的时机（每日重置时没有消息，客户端直接删除）
%%-define(SyncGet_BEGIN,      0).
%%-define(SyncGet_Online,     0).     %% 上线时
%%-define(SyncGet_WantGetAck, 1).     %% 发起索取的反馈
%%-define(SyncGet_GiveSync,   2).     %% 被捐赠时若在线的同步
%%-define(SyncGet_Task,       3).     %% 因任务变动导致的删除索取信息
%%-define(SyncGet_END,        3).
%%
%%%%%-------------------------------------------------------------------
%%% 反馈捐赠结果（反馈捐赠方）状态标记
%%-define(AckGive_BEGIN,          0).
%%-define(AckGive_Success,        0). %% 成功
%%-define(AckGive_NotInGuild,     1). %% 自己不在家族
%%-define(AckGive_NotSameGuild,   2). %% 双方不在同一家族
%%-define(AckGive_Full,           3). %% 已捐赠满
%%-define(AckGive_NotGoods,       4). %% 自己物品不足（id错误）
%%-define(AckGive_CountLess,      5). %% 自己物品不足（数量不足）
%%-define(AckGive_CountZero,      6). %% 自己物品不足（协议传参为0）
%%-define(AckGive_CountMore,      7). %% 捐赠数量溢出（并发冲突）
%%-define(AckGive_Self,           8). %% 捐赠对象是自己
%%-define(AckGive_AlreadyGive,    9). %% 已经捐过了
%%-define(AckGive_END,            9).
%%
%%%% msg
%%-export([
%%	msg/1  %% 协议处理
%%]).
%%
%%%% api,task
%%-export([
%%	init/0,             %% 上线初始化
%%	onReset/0,          %% 重置 用于每日重置
%%	onTaskComplete/2,   %% 完成任务回调
%%	onLevelUp/0,        %% 角色升级回调
%%	onJoinGuild/0,      %% 加入家族回调
%%	onExitGuild/0,      %% 退出家族回调
%%	onMainMenu/0        %% MainMenu事件回调
%%]).
%%
%%%% check config
%%-export([
%%	checkConfig/0,          %% 配置检查
%%	testProbability/0,      %% 测算概率
%%	testProbability_log/1   %% 打印测算结果
%%]).
%%
%%%% gm
%%-export([
%%	gmReset/0,              %% GM重置每日任务
%%	gmAccept/0,             %% GM领取指定任务（依然受角色等级限制）
%%	gmAcceptWithSubType/1,  %% GM领取指定子类型任务（依然受角色等级限制）
%%	gmGlt/2,                %% GM调试索取与捐赠相关接口，参考playerGM:looptask_gg/1
%%	gmLink/1                %% GM测试引导任务错误
%%]).
%%
%%%% api,glt
%%-export([
%%	gltWantGetAck/1,    %% 发起索取反馈
%%	gltGiveForGuild/2,  %% 家族任务相关_捐赠 由家族进程调用
%%	gltGiveAck/1        %% 捐赠反馈
%%]).
%%
%%%% api,fix
%%-export([
%%	%%fixInvalidTask_1_3_0/0  %% LUN-8438 【外网】【家族任务】接取到无法完成的家族任务
%%]).
%%
%%%%%-------------------------------------------------------------------
%%% msg:协议处理
%%-spec msg(Msg::term()) -> no_return().
%%msg(Msg) ->
%%	case core:isCross() of
%%		false ->
%%			realMsg(Msg);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% msg,internal:协议处理
%%-spec realMsg(Msg::term()) -> no_return().
%%realMsg(#pk_U2GS_RequestAcceptLoopTask{}) ->
%%	accept();
%%realMsg(#pk_U2GS_RequestOperateLoopTask{taskID = TaskID, opType = OpType}) ->
%%	operate(TaskID, OpType);
%%realMsg(#pk_U2GS_RequestOneKeyLoopTask{count = Count}) ->
%%	oneKey(Count);
%%realMsg(#pk_U2GS_GuildLoopTask_WantGet_Request{taskID = TaskID}) ->
%%	gltWantGet(TaskID);
%%realMsg(#pk_U2GS_GuildLoopTask_OpenUI_Request{}) ->
%%	gltOpenUI();
%%realMsg(#pk_U2GS_GuildLoopTask_Give_Request{roleID = TargetRoleID, itemID = GoodsID, count = Count}) ->
%%	gltGive(TargetRoleID, GoodsID, Count);
%%realMsg(#pk_U2GS_GuildLoopTask_History_Request{}) ->
%%	gltHistory();
%%realMsg(#pk_U2GS_GuildLoopTask_WantGive_Request{roleID = TargetRoleID, time = Time}) ->
%%	gltWantGive(TargetRoleID, Time).
%%
%%%%%-------------------------------------------------------------------
%%% msg,internal:领取任务
%%-spec accept() -> no_return().
%%accept() ->
%%	RetGuild = check_joinGuild(),                   %% 要求加入家族
%%	RetLevel = check_levelReach(RetGuild),          %% 要求等级达到XX
%%	RetTask = check_unacceptedTask(RetLevel),       %% 要求没有领取家族任务
%%	RetCount = check_canAcceptCount(RetTask),       %% 要求还有领取次数
%%	RetTaskID = randTaskID(RetCount, ?Star_None),   %% 无指定星级随机选取任务
%%	case acceptTask(RetTaskID) of                   %% 使用标准任务系统领取任务
%%		true ->
%%			playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_LoopAccept),  %% 增加领取计数
%%			loopTaskState_go(RetTaskID);    %% 刷新当前轮任务状态并同步
%%		_ ->
%%			skip
%%	end,
%%	onEventEx().     %% 尝试领取引导任务
%%
%%%%%-------------------------------------------------------------------
%%% msg,internal:操作当前任务
%%-spec operate(TaskID::uint16(), OpType::?OPType_BEGIN .. ?OPType_END) -> no_return().
%%operate(0, _OpType) ->
%%	skip;   %% 防乱发协议
%%operate(TaskID, OpType) when OpType >= ?OPType_BEGIN, OpType =< ?OPType_END ->
%%	RetGuild = check_joinGuild(),                   %% 要求加入家族
%%	RetTaskID = check_goingTask(RetGuild, TaskID),  %% 要求正在进行该任务
%%	operate(RetTaskID, TaskID, OpType);
%%operate(_TaskID, _OpType) ->
%%	skip.   %% 防乱发协议
%%
%%-spec operate(Mark::mark(), TaskID::uint16(), OpType::?OPType_BEGIN .. ?OPType_END) -> no_return().
%%% 放弃任务
%%operate(?Mark_True = Mark, TaskID, ?OPType_Cancel) ->
%%	playerTask:cancelTask(TaskID),  %% 使用标准任务系统放弃任务（此处无论标准任务系统是否成功，环任务系统都需要继续处理自己的数据）
%%	gltDelMyWantGet(),              %% 放弃任务后尝试删除已有的索取条目
%%	loopTaskState_cancel(TaskID),   %% 刷新当前轮任务状态并同步
%%	RetProcess = countCancel(Mark), %% 检查并尝试轮进位
%%	loopReward(RetProcess),         %% 发放轮奖励（放弃肯定没奖，这里实际上是判断是否走完了当前轮，需要通知客户端）
%%	autoAccept(RetProcess),         %% 自动领取下一个任务
%%	onEventEx();                    %% 尝试领取引导任务
%%% 免费刷新
%%operate(?Mark_True = Mark, TaskID, ?OPType_Free) ->
%%	case ?Cur_Lang of
%%		?Lang_ENU ->
%%			skip;  %% LUNA-8075 【服务器】【家族任务】北美地区家族任务屏蔽单次刷新的两个入口
%%		_ ->
%%			RetCountAndCD = check_refresh_free(Mark),   %% 检查可刷新次数以及是否冷却
%%			refresh(RetCountAndCD, TaskID, ?Star_None, ?SyncTimeState_Refresh_Free)
%%	end;
%%% 付费刷新
%%operate(?Mark_True = Mark, TaskID, ?OPType_Cost) ->
%%	case ?Cur_Lang of
%%		?Lang_ENU ->
%%			skip;  %% LUNA-8075 【服务器】【家族任务】北美地区家族任务屏蔽单次刷新的两个入口
%%		_ ->
%%			RetCountAndCoin = check_refresh_cost(Mark), %% 检查货币是否足够
%%			refresh(RetCountAndCoin, TaskID, ?Star_None, ?SyncTimeState_Refresh_Cost)
%%	end;
%%% 单次五星
%%operate(?Mark_True = Mark, TaskID, ?OPType_FiveStar) ->
%%	case ?Cur_Lang of
%%		?Lang_ENU ->
%%			skip;  %% LUNA-8075 【服务器】【家族任务】北美地区家族任务屏蔽单次刷新的两个入口
%%		_ ->
%%			RetCoin = check_refresh_fiveStar(Mark), %% 检查货币是否足够
%%			refresh(RetCoin, TaskID, ?Star_Five, ?SyncTimeState_Refresh_FiveStar)
%%	end;
%%% 一键五星
%%operate(?Mark_True = Mark, TaskID, ?OPType_AllFiveStar) ->
%%	RetCoin = check_refresh_fiveStar_All(Mark), %% 检查货币是否足够
%%	refresh(RetCoin, TaskID, ?Star_Five, ?SyncTimeState_Refresh_AllFiveStar);
%%% 没有通过统一检查
%%operate(_Mark, _TaskID, _OPType) ->
%%	skip.
%%
%%%%%-------------------------------------------------------------------
%%% msg,internal:一键完成
%%-spec oneKey(Count::uint()) -> no_return().
%%oneKey(Count) ->
%%	RetGuild = check_joinGuild(),                                   %% 要求加入家族
%%	RetGoing = check_goingTask(RetGuild),                           %% 要求正在执行任意家族任务
%%	{RetCount, CountReal} = check_oneKey_count(RetGoing, Count),    %% 要求本轮可执行的任务数量足够
%%	RetItem = check_oneKey_item(RetCount, CountReal),               %% 要求目标道具数量满足条件
%%	doOneKey(RetItem, CountReal, CountReal).
%%
%%%% 一键完成N个任务，先随机获得（不领取、完成任务）N-1个任务的奖励，再完成最后一个任务
%%-spec doOneKey(mark(), uint(), uint()) -> no_return().
%%doOneKey(?Mark_True, 0, _CountMax) ->
%%	skip;
%%doOneKey(?Mark_False, _Count, _CountMax) ->
%%	skip;
%%doOneKey(_Mark, 1, CountMax) ->
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildLoopTask_OneKey, [CountMax]),
%%	TaskID = findCurrentTaskID(),
%%	playerTask:gmSubmitTask(TaskID);    %% 强制完成任务
%%doOneKey(Mark, Count, CountMax) ->
%%	%% 随机指定一个任务，获得其奖励
%%	TaskID =
%%		case playerPropSync:getProp(?SerProp_LoopTaskState) of
%%			{_, 1, _} ->
%%				randTaskID(?Mark_True, ?Star_Five);
%%			_ ->
%%				randTaskID(?Mark_True, ?Star_None)
%%		end,
%%	playerTask:giveTaskAward(TaskID, 0),
%%	%% 刷新家族/环任务数据（不同特地步客户端）
%%	[H | ListTask] = playerPropSync:getProp(?SerProp_LoopTaskProcess),
%%	ListTaskNew = [H | [{TaskID, ?LoopTaskState_Completed} | ListTask]],
%%	playerPropSync:setAny(?SerProp_LoopTaskProcess, ListTaskNew),
%%	playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Process),
%%	doOneKey(Mark, Count - 1, CountMax).
%%
%%%%%-------------------------------------------------------------------
%%% api:上线初始化
%%-spec init() -> no_return().
%%init() ->
%%	case core:isCross() of
%%		false ->
%%			fixData(false),
%%			%%fixInvalidTask(),   %% 如果标准任务系统的任务与环任务系统中的任务不匹配，则需要修复
%%			syncState2Client(?SyncTimeState_Online),
%%			gltSyncMyWantGet(?SyncGet_Online),
%%			onEventEx();
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% gm:GM重置每日任务
%%-spec gmReset() -> no_return().
%%gmReset() ->
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum),
%%	gltDelMyWantGet(),  %% 正常重置不需要删除索取信息，由时间戳判断索取信息是否有效，此处用于GM指令重置
%%	onReset().
%%
%%%%%-------------------------------------------------------------------
%%% gm:GM领取指定任务（依然受角色等级限制）
%%-spec gmAccept() -> no_return().
%%gmAccept() ->
%%	RetGuild = check_joinGuild(),           %% 要求加入家族
%%	RetLevel = check_levelReach(RetGuild),  %% 要求等级达到XX
%%	case RetLevel of
%%		?Mark_True ->
%%			gmReset(),
%%			case get(looptask_sp) of
%%				undefined ->
%%					skip;
%%				TaskID ->
%%					Level = playerState:getLevel(),
%%					#dailytaskCfg{group = Group} = getCfg:getCfgPStack(cfg_dailytask, Level),
%%					ListTaskID = getCfg:get1KeyList(cfg_task),
%%					gmAccept(ListTaskID, Group, TaskID)
%%			end;
%%		_ ->
%%			skip
%%	end.
%%gmAccept([], Group, _TaskID) ->
%%	erase(looptask_sp),
%%	?ERROR("[TestLoopTask] RoleID:~w EndTest Level:~w Group:~w", [playerState:getRoleID(),  playerState:getLevel(), Group]),
%%	ok;
%%gmAccept([H | T], Group, TaskID) when TaskID > H ->
%%	gmAccept(T, Group, TaskID);
%%gmAccept([H | T], Group, TaskID) ->
%%	case getCfg:getCfgPStack(cfg_task, H) of
%%		#taskCfg{groupid = Group, type = ?TaskMainType_EveryDay} ->
%%			put(looptask_sp, H + 1),
%%			case acceptTask(H) of  %% 使用标准任务系统领取任务
%%				true ->
%%					?ERROR("[TestLoopTask] RoleID:~w Level:~w Group:~w TaskID:~w",
%%						[playerState:getRoleID(),  playerState:getLevel(), Group, H]),
%%					loopTaskState_go(H);  %% 刷新当前轮任务状态并同步
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			gmAccept(T, Group, TaskID)
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%% gm:GM领取指定任务（依然受角色等级限制）
%%-spec gmAcceptWithSubType(SubType::uint()) -> no_return().
%%gmAcceptWithSubType(SubType) ->
%%	RetGuild = check_joinGuild(),                       %% 要求加入家族
%%	RetLevel = check_levelReach(RetGuild),              %% 要求等级达到XX
%%	RetTask = check_unacceptedTask(RetLevel),           %% 要求没有领取家族任务
%%	RetCount = check_canAcceptCount(RetTask),           %% 要求还有领取次数
%%	RetTaskID = gmQueryTaskBySubType(RetCount, SubType),%% 根据指定子类型查找任务
%%	case acceptTask(RetTaskID) of                       %% 使用标准任务系统领取任务
%%		true ->
%%			loopTaskState_go(RetTaskID);                %% 刷新当前轮任务状态并同步
%%		_ ->
%%			skip
%%	end.
%%-spec gmQueryTaskBySubType(Mark::mark(), SubType::uint()) -> MarkNew::mark().
%%gmQueryTaskBySubType(?Mark_True, SubType) ->
%%	Level = playerState:getLevel(),
%%	#dailytaskCfg{group = GroupID} =
%%		getCfg:getCfgPStack(cfg_dailytask, Level),
%%	ListTaskID = getCfg:get1KeyList(cfg_task),
%%	FunFind =
%%		fun(TaskID, Acc) ->
%%			case getCfg:getCfgByKey(cfg_task, TaskID) of
%%				#taskCfg{groupid = GroupID, type = ?TaskMainType_EveryDay, sub_type = SubType} ->
%%					{true, TaskID};
%%				_ ->
%%					Acc
%%			end
%%		end,
%%	{_, TaskID} = misc:foldlEx(FunFind, {false, 0}, ListTaskID),
%%	TaskID;
%%gmQueryTaskBySubType(_Mark, _SubType) ->
%%	0.
%%
%%%%%-------------------------------------------------------------------
%%% gm:GM调试索取与捐赠相关接口，参考playerGM:looptask_gg/1
%%% 索取与捐赠 type[1发起索取 2请求面板数据 3捐赠给选中的角色，若无选中则捐给家族中任意有效索取 4请求历史数据
%%-spec gmGlt(Type::uint(), SelectRoleID::uint64()) -> no_return().
%%gmGlt(1, _SelectRoleID) ->
%%	TaskID =
%%		case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
%%			[{TaskIDMaybeOK, ?LoopTaskState_Going} | _] ->
%%				TaskIDMaybeOK;
%%			_ ->
%%				case playerState:getAcceptedTask() of
%%					[#rec_task{taskID = TaskIDWrong} | _] ->
%%						TaskIDWrong;    %% 没有正确进行的家族任务，随便从已接受任务中找一个，用于调试错误的请求
%%					_ ->
%%						0   %% TaskIDNull 没有进行中的任务，用于调试错误的请求
%%				end
%%		end,
%%	playerLoopTask:msg(#pk_U2GS_GuildLoopTask_WantGet_Request{taskID = TaskID});
%%gmGlt(2, _SelectRoleID) ->
%%	playerLoopTask:msg(#pk_U2GS_GuildLoopTask_OpenUI_Request{});
%%gmGlt(3, SelectRoleID) ->
%%	{TargetRoleID, GoodsID, CountNeed} = gmGlt_queryRole(SelectRoleID),
%%	CountGoods = playerPackage:getGoodsCount(GoodsID),
%%	playerLoopTask:msg(#pk_U2GS_GuildLoopTask_Give_Request{roleID = TargetRoleID, itemID = GoodsID, count = erlang:min(CountGoods, CountNeed)});
%%gmGlt(4, _SelectRoleID) ->
%%	playerLoopTask:msg(#pk_U2GS_GuildLoopTask_History_Request{});
%%gmGlt(_Type, _SelectRoleID) ->
%%	skip.
%%
%%%%%-------------------------------------------------------------------
%%% gm:GM测试引导任务错误
%%-spec gmLink(N::uint()) -> no_return().
%%gmLink(N) when erlang:is_integer(N), N > 0 ->
%%	case findCurrentTaskID() of
%%		0 ->
%%			playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Loop),
%%			accept(),
%%			gmLink(N - 1);
%%		TaskID ->
%%			playerTask:gmSubmitTask(TaskID),
%%			gmLink(N - 1)
%%	end,
%%	ok;
%%gmLink(_) ->
%%	ok.
%%
%%%%%-------------------------------------------------------------------
%%% internal,gm:查找索取对象
%%-spec gmGlt_queryRole(SelectRoleID::uint64()) -> {TargetRoleID::uint64(), GoodsID::uint16()}.
%%gmGlt_queryRole(0) ->
%%	GuildID = playerState:getGuildID(),
%%	L = guildLogic:getGuildMember(GuildID),
%%	FunFind =
%%		fun
%%			(#rec_guild_member{roleID = TargetRoleID}, Acc) ->
%%				case gltQueryGet(TargetRoleID) of
%%					{_, [#pk_GuildLoopTask_Get{isGive = false, itemID = GoodsID, itemM = M, itemN = N}]} when M < N ->
%%						{true, {TargetRoleID, GoodsID, N - M}};
%%					_ ->
%%						Acc
%%				end
%%		end,
%%	case misc:foldlEx(FunFind, {false, 0}, L) of
%%		{true, R} ->
%%			R;
%%		_ ->
%%			{0, 0, 0}   %% 没有可捐赠的索取
%%	end;
%%gmGlt_queryRole(SelectRoleID) ->
%%	case guildLogic:getGuildMemberByRoleID(SelectRoleID) of
%%		{ok, #rec_guild_member{tGoodsID = GoodsID, tGoodsM = M, tGoodsN = N}} ->
%%			{SelectRoleID, GoodsID, N - M};
%%		_ ->
%%			{SelectRoleID, 0, 0}    %% 对象不在家族
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,task:重置 用于每日重置
%%-spec onReset() -> no_return().
%%onReset() ->
%%	case core:isCross() of
%%		false ->
%%			fixData(true),
%%			syncState2Client(?SyncTimeState_Reset),
%%			onEventEx();
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,task:完成任务回调 可能在离开家族后执行了完成任务
%%-spec onTaskComplete(?TaskMainType_EveryDay, TaskID::uint16()) -> no_return().
%%onTaskComplete(?TaskMainType_EveryDay, TaskID) ->
%%	case core:isCross() of
%%		false ->
%%			case get(looptask_sp) of
%%				undefined ->
%%					RetTaskID = check_goingTask(?Mark_True, TaskID),    %% 要求正在进行该任务
%%					gltDelMyWantGet(),                                  %% 完成任务后尝试删除已有的索取条目
%%					loopTaskState_complete(RetTaskID, TaskID),          %% 刷新当前轮任务状态并同步
%%					RetProcess = countProcess(RetTaskID),               %% 当前轮进度计数
%%					loopReward(RetProcess),                             %% 发放轮奖励
%%					autoAccept(RetProcess),                             %% 自动领取下一个任务
%%					onEventEx();                                        %% 尝试领取引导任务
%%				_ ->
%%					gmAccept()
%%			end;
%%		_ ->
%%			skip
%%	end;
%%onTaskComplete(_TaskType, _TaskID) ->
%%	skip.
%%
%%%%%-------------------------------------------------------------------
%%% api,task:角色升级回调
%%-spec onLevelUp() -> no_return().
%%onLevelUp() ->
%%	onEventEx().
%%
%%%%%-------------------------------------------------------------------
%%% api,task:加入家族回调
%%-spec onJoinGuild() -> no_return().
%%onJoinGuild() ->
%%	onEventEx().
%%
%%%%%-------------------------------------------------------------------
%%% api,task:退出家族回调
%%-spec onExitGuild() -> no_return().
%%onExitGuild() ->
%%	onEventEx().
%%
%%%%%-------------------------------------------------------------------
%%% api,task:mainMenu事件回调
%%-spec onMainMenu() -> no_return().
%%onMainMenu() ->
%%	onEventEx().
%%
%%%%%-------------------------------------------------------------------
%%% api:配置检查 for configCheck:startCheckFun/0
%%-spec checkConfig() -> boolean().
%%checkConfig() ->
%%	% 1.检查等级
%%	#globalsetupCfg{setpara = [LevelMin]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, dailytask_levellimit),
%%	#globalsetupCfg{setpara = [LevelMax]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, player_maxlevel),
%%	{IsValidLevel, List_dailytaskCfg} = checkConfig_Level(LevelMin, LevelMax + 1, {true, []}),
%%	% 2.遍历task，要求每个GroupID、每个TaskSubType都能找到至少1个五星级任务
%%	% 并且符合GroupID和TaskSubType条件的任务必须为日常/环/家族任务类型?TaskMainType_EveryDay
%%	List1Key = getCfg:get1KeyList(cfg_task),
%%	IsValidTask = checkConfig_Task(List_dailytaskCfg, List1Key, true),
%%	% 3.所有有效的dailytask中，若tasksub_weight中某个subType有效，则taskstar_weight中必然有对应有效的subType，否则可能无法正确随机到五星任务
%%	IsValidSubType = checkConfig_SubType(List_dailytaskCfg, true),
%%	IsValidLevel andalso IsValidTask andalso IsValidSubType.
%%
%%% 检查等级
%%-spec checkConfig_Level(Level::uint(), LevelEnd::uint(), Acc) -> Ret when
%%	Acc :: [#dailytaskCfg{}, ...],
%%	Ret :: {boolean(), [#dailytaskCfg{}, ...]}.
%%checkConfig_Level(End, End, Acc) ->
%%	Acc;
%%checkConfig_Level(Level, End, {IsValid, ListCfg}) ->
%%	case getCfg:getCfgPStack(cfg_dailytask, Level) of
%%		#dailytaskCfg{} = R ->
%%			checkConfig_Level(Level + 1, End, {IsValid, [R | ListCfg]});
%%		_ ->
%%			%% 此处因为getCfg:getCfgPStack/2已有报错
%%			io:format("~w.~w can not find Level:~w from cfg_dailytask~n", [?MODULE, ?LINE, Level]),
%%			checkConfig_Level(Level + 1, End, {false, ListCfg})
%%	end.
%%
%%% 每个#dailytaskCfg{}都需要遍历一次task
%%-spec checkConfig_Task(List_dailytaskCfg::[#dailytaskCfg{}, ...], ListTaskID::[uint16(), ...], Ret::boolean()) -> boolean().
%%checkConfig_Task([], _ListTaskID, Ret) ->
%%	Ret;
%%checkConfig_Task([#dailytaskCfg{tasksub_weight = ListWeight} = Cfg | T], ListTaskID, Ret) ->
%%	RetNew = checkConfig_Task_(ListTaskID, Cfg, [{SubType, false} || {SubType, _} <- ListWeight]),
%%	checkConfig_Task(T, ListTaskID, RetNew andalso Ret).
%%
%%-spec checkConfig_Task_(ListTaskID::[uint16(), ...], Cfg::#dailytaskCfg{}, [{SubType::uint(), IsFindStarFive::boolean()}, ...]) -> boolean().
%%checkConfig_Task_([], Cfg, Acc) ->
%%	checkConfig_Task_SubType(Acc, Cfg, true);
%%checkConfig_Task_([TaskID | T], #dailytaskCfg{group = GroupID} = Cfg, Acc) ->
%%	case getCfg:getCfgByKey(cfg_task, TaskID) of
%%		#taskCfg{groupid = GroupID, type = Type, sub_type = SubType, task_star = TaskStar} ->
%%			case lists:keyfind(SubType, 1, Acc) of
%%				false ->
%%					checkConfig_Task_(T, Cfg, Acc);  %% 不是目标子类型，忽略
%%				_ when Type =:= ?TaskMainType_Exp ->
%%					checkConfig_Task_(T, Cfg, Acc);  %% 忽略经验环任务
%%				_ when Type =/= ?TaskMainType_EveryDay ->
%%					?ERROR("when GroupID:~w taskID:~w, type:~w must is ~w", [GroupID, TaskID, Type, ?TaskMainType_EveryDay]),
%%					io:format("~w.~w when GroupID:~w taskID:~w, type:~w must is ~w~n", [?MODULE, ?LINE, GroupID, TaskID, Type, ?TaskMainType_EveryDay]),
%%					checkConfig_Task_(T, Cfg, Acc);  %% 主类型错误，报错
%%				_ when TaskStar =/= ?Star_Five ->
%%					checkConfig_Task_(T, Cfg, Acc);  %% 不是五星级，过
%%				_ ->
%%					AccNew = lists:keyreplace(SubType, 1, Acc, {SubType, true}),
%%					checkConfig_Task_(T, Cfg, AccNew)  %% 是五星级，记录
%%			end;
%%		_ ->
%%			checkConfig_Task_(T, Cfg, Acc)  %% 不是目标组，忽略
%%	end.
%%
%%-spec checkConfig_Task_SubType([{SubType::uint(), IsFindStarFive::boolean()}, ...], Cfg::#dailytaskCfg{}, Acc::boolean()) -> Ret::boolean().
%%checkConfig_Task_SubType([], _Cfg, Acc) ->
%%	Acc;
%%checkConfig_Task_SubType([{_, true} | T], Cfg, Acc) ->
%%	checkConfig_Task_SubType(T, Cfg, Acc);
%%checkConfig_Task_SubType([{SubType, _} | T], #dailytaskCfg{level = Level, group = GroupID} = Cfg, _Acc) ->
%%	?ERROR(" when level:~w, groupID:~w subType:~w, can not find task with task_star=~w", [Level, GroupID, SubType, ?Star_Five]),
%%	io:format("~w.~w when level:~w, groupID:~w subType:~w, can not find task with task_star=~w~n", [?MODULE, ?LINE, Level, GroupID, SubType, ?Star_Five]),
%%	checkConfig_Task_SubType(T, Cfg, false).
%%
%%% 检查subtype
%%-spec checkConfig_SubType(List_dailytaskCfg::[#dailytaskCfg{}, ...], Ret::boolean()) -> boolean().
%%checkConfig_SubType([], Ret) ->
%%	Ret;
%%checkConfig_SubType([#dailytaskCfg{level = Level, tasksub_weight = L1, taskstar_weight = L2} | T], Ret) ->
%%	RetNew = checkConfig_SubType(L1, L2, Level, true),
%%	checkConfig_SubType(T, RetNew andalso Ret).
%%-spec checkConfig_SubType([{uint(), uint()}, ...], [{uint(), uint()}, ...], uint(), boolean()) -> boolean().
%%checkConfig_SubType([], _L2, _Level, Ret) ->
%%	Ret;
%%checkConfig_SubType([{SubType, _} | T], L2, Level, Ret) ->
%%	case lists:keyfind(SubType, 1, L2) of
%%		{_, Weight} when Weight > 0 ->
%%			checkConfig_SubType(T, L2, Level, Ret);
%%		_ ->
%%			?ERROR(" when level:~w subType:~w, taskstar_weight is invalid!", [Level, SubType]),
%%			io:format("~w.~w when level:~w subType:~w, taskstar_weight is invalid!~n", [?MODULE, ?LINE, Level, SubType]),
%%			checkConfig_SubType(T, L2, Level, false)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:刷新任务
%%-spec refresh(Mark::mark(), TaskID::uint16(), TaskStar::int(), State::?SyncTimeState_Refresh_Free .. ?SyncTimeState_Refresh_AllFiveStar) -> MarkNew::mark().
%%refresh(?Mark_True = Mark, TaskID, TaskStar, State) ->
%%	playerTask:cancelTask(TaskID),              %% 使用标准任务系统放弃任务
%%	gltDelMyWantGet(),                          %% 放弃任务后尝试删除已有的索取条目
%%	RetTaskID = randTaskID(Mark, TaskStar),     %% 随机选取新的任务
%%	case acceptTask(RetTaskID) of               %% 使用标准任务系统领取任务
%%		true ->
%%			loopTaskState_refresh(RetTaskID, State),    %% 刷新当前轮任务状态并同步
%%			Mark;
%%		_ ->
%%			?Mark_False
%%	end;
%%refresh(_Mark, _TaskID, _TaskStar, _State) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal:自动领取下一个任务
%%% 根据轮进度计算，非进位时必然接下一个任务，否则不接
%%-spec autoAccept(Mark::mark()) -> MarkNew::mark().
%%autoAccept(?Mark_False) ->
%%	RetTaskID =
%%		case playerPropSync:getProp(?SerProp_LoopTaskState) of
%%			{_, 1, _} ->
%%				randTaskID(?Mark_True, ?Star_Five);
%%			_ ->
%%				randTaskID(?Mark_True, ?Star_None)
%%		end,
%%	case acceptTask(RetTaskID) of           %% 使用标准任务系统领取任务
%%		true ->
%%			loopTaskState_go(RetTaskID),    %% 刷新当前轮任务状态并同步
%%			?Mark_True;
%%		_ ->
%%			?Mark_False
%%	end;
%%autoAccept(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal:尝试进位轮进度
%%-spec try2UpdateLoop() -> Mark::mark().
%%try2UpdateLoop() ->
%%	#globalsetupCfg{setpara = [_MaxLoop, MaxProcess]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, dailytask_number),
%%	CountProcess = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Process),
%%	Ret =
%%		case CountProcess >= MaxProcess of
%%			true ->
%%				?Mark_True; %% 轮进度满，进位轮计数
%%			_ ->
%%				case CountProcess + queryCancelTaskCount() >= MaxProcess of
%%					true ->
%%						?Mark_Others;   %% 轮进度+放弃数满，进位轮计数，但是没奖励
%%					_ ->
%%						?Mark_False
%%				end
%%		end,
%%	case Ret of
%%		?Mark_False ->
%%			skip;
%%		_ ->
%%			%% 重置轮进度，进位轮计数
%%			closeThisLoop()
%%	end,
%%	Ret.
%%
%%%%%-------------------------------------------------------------------
%%% internal:关闭当前轮任务状态
%%-spec closeThisLoop() -> no_return().
%%closeThisLoop() ->
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Process),
%%	case playerPropSync:getProp(?SerProp_LoopTaskState) of
%%		{_, _, CountEx} when CountEx > 0 ->
%%			%% 昨天或者更久远，有保留下来的家族任务可以继续做，免除此时进位轮计数的机会
%%			playerPropSync:setAny(?SerProp_LoopTaskState, {time:getSyncTimeFromDBS(), 0, CountEx - 1});
%%		_ ->
%%			playerPropSync:setAny(?SerProp_LoopTaskState, {time:getSyncTimeFromDBS(), 0, 0}),
%%			playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Loop)
%%	end,
%%	playerPropSync:setAny(?SerProp_LoopTaskProcess, []).
%%
%%%%%-------------------------------------------------------------------
%%% internal:当前轮进度计数
%%-spec countProcess(Mark::mark()) -> MarkNew::mark().
%%countProcess(?Mark_True) ->
%%	playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Process),
%%	try2UpdateLoop();
%%countProcess(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal:放弃数计数
%%-spec countCancel(Mark::mark()) -> MarkNew::mark().
%%countCancel(?Mark_True) ->
%%	%% 实际计数行为已在loopTaskState_cancel/1时写入，此处不另行处理
%%	try2UpdateLoop();
%%countCancel(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal:发放轮奖励
%%-spec loopReward(Mark::mark()) -> MarkNew::mark().
%%% 根据countProcess/1返回值，仅?Mark_True时表示有奖励
%%loopReward(?Mark_True = Mark) ->
%%	RoleLevel = playerState:getLevel(),
%%	#dailytaskCfg{reward_exp = RExp, reward_item1 = RItem, reward_money = RCoin, reward_guild = RGuild} =
%%		getCfg:getCfgPStack(cfg_dailytask, RoleLevel),
%%	reward_exp(RExp, RoleLevel),
%%	reward_item(RItem, RoleLevel),
%%	reward_coin(RCoin, RoleLevel),
%%	reward_guild(RGuild, RoleLevel),
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshCost),
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshFive),
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshAllFive),
%%	syncState2Client(?SyncTimeState_Complete_LoopAll),  %% 明确通知客户端
%%	catch playerliveness:onFinishLiveness(?LivenessLoopTask, 1),
%%	Mark;
%%% 根据countProcess/1返回值，?Mark_Others时表示无奖励，但可以进行后续计算，修正为?Mark_True
%%loopReward(?Mark_Others) ->
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshCost),
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshFive),
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshAllFive),
%%	syncState2Client(?SyncTimeState_Complete_LoopPartial),  %% 明确通知客户端
%%	?Mark_True;
%%% 忽略
%%loopReward(_Mark) ->
%%	?Mark_False.
%%
%%-spec reward_exp(RExp::uint(), RoleLevel::uint()) -> no_return().
%%reward_exp(RExp, RoleLevel) when erlang:is_integer(RExp), RExp > 0 ->
%%	playerBase:addExp(RExp, ?ExpSourceLoopTask, RoleLevel);
%%reward_exp(_, _) ->
%%	skip.
%%
%%-spec reward_item([{ItemID::uint16(), ItemCount::uint()}, ...], RoleLevel::uint()) -> no_return().
%%reward_item([], _) ->
%%	ok;
%%reward_item([{ItemID, ItemCount} | T], RoleLevel) ->
%%	PLog = #recPLogTSItem{
%%		new = ItemCount,
%%		change = ItemCount,
%%		source = ?PLogTS_LoopTask,
%%		target = ?PLogTS_PlayerSelf,
%%		changReason = ?ItemSourceLoopTask,
%%		reasonParam = RoleLevel
%%	},
%%	playerPackage:addGoodsAndMail(ItemID, ItemCount, true, 0, PLog),
%%	reward_item(T, RoleLevel);
%%reward_item(_, _) ->
%%	skip.
%%
%%-spec reward_coin([{CoinType::coinType(), CoinCount::uint()}, ...], RoleLevel::uint()) -> no_return().
%%reward_coin([], _) ->
%%	ok;
%%reward_coin([{CoinType, CoinCount} | T], RoleLevel) ->
%%	PLog = #recPLogTSMoney{
%%		reason = ?CoinSourceLoopTask,
%%		param = RoleLevel,
%%		source = ?PLogTS_LoopTask,
%%		target = ?PLogTS_PlayerSelf
%%	},
%%	playerMoney:addCoin(CoinType, CoinCount, PLog),
%%	reward_coin(T, RoleLevel);
%%reward_coin(_, _) ->
%%	skip.
%%
%%-spec reward_guild(List::list(), RoleLevel::uint()) -> no_return().  %% List::[GuildResource::uint(), GuildLiveness::uint()]
%%reward_guild([GuildResource, GuildLiveness], _RoleLevel) ->
%%	GuildID = playerState:getGuildID(),
%%	playerGuild:addguildresource(GuildID, GuildResource),
%%	playerGuild:addguildliveness(GuildID, GuildLiveness);
%%reward_guild(_, _) ->
%%	skip.
%%
%%%%%-------------------------------------------------------------------
%%% internal:任务状态管理 检查通过后方可调用该函数
%%-spec loopTaskState_go(TaskID::uint16()) -> no_return().
%%loopTaskState_go(TaskID) ->
%%	ListTask = playerPropSync:getProp(?SerProp_LoopTaskProcess),
%%	ListTaskNew = [{TaskID, ?LoopTaskState_Going} | ListTask],
%%	playerPropSync:setAny(?SerProp_LoopTaskProcess, ListTaskNew),
%%	syncState2Client(?SyncTimeState_Accept).
%%-spec loopTaskState_complete(Mark::mark(), TaskID::uint16()) -> no_return().
%%loopTaskState_complete(?Mark_True, TaskID) ->
%%	[{TaskID, ?LoopTaskState_Going} | ListTask] = playerPropSync:getProp(?SerProp_LoopTaskProcess),
%%	ListTaskNew = [{TaskID, ?LoopTaskState_Completed} | ListTask],
%%	playerPropSync:setAny(?SerProp_LoopTaskProcess, ListTaskNew),
%%	syncState2Client(?SyncTimeState_Complete);
%%loopTaskState_complete(_Mark, _TaskID) ->
%%	skip.
%%-spec loopTaskState_cancel(TaskID::uint16()) -> no_return().
%%loopTaskState_cancel(TaskID) ->
%%	[{TaskID, ?LoopTaskState_Going} | ListTask] = playerPropSync:getProp(?SerProp_LoopTaskProcess),
%%	ListTaskNew = [{TaskID, ?LoopTaskState_Cancelled} | ListTask],
%%	playerPropSync:setAny(?SerProp_LoopTaskProcess, ListTaskNew),
%%	syncState2Client(?SyncTimeState_Cancel).
%%-spec loopTaskState_refresh(TaskID::uint16(), State::?SyncTimeState_Refresh_Free .. ?SyncTimeState_Refresh_AllFiveStar) -> no_return().
%%loopTaskState_refresh(TaskID, State) ->
%%	playerState2:setLoopTaskRefreshTime(),
%%	[_ | ListTask] = playerPropSync:getProp(?SerProp_LoopTaskProcess),
%%	ListTaskNew = [{TaskID, ?LoopTaskState_Going} | ListTask],
%%	playerPropSync:setAny(?SerProp_LoopTaskProcess, ListTaskNew),
%%	syncState2Client(State).
%%
%%%%%-------------------------------------------------------------------
%%% internal:随机选取任务
%%-spec randTaskID(Mark::mark(), TaskStar::int()) -> TaskID::uint16().
%%randTaskID(?Mark_True, TaskStar) ->
%%	#dailytaskCfg{group = GroupID, tasksub_weight = SubTypeWeights, taskstar_weight = StarWeights} =
%%		getCfg:getCfgPStack(cfg_dailytask, playerState:getLevel()),
%%	SubType = misc:calcOddsByAfterWeightList(SubTypeWeights),
%%	TaskStarReal = randTaskID_star(StarWeights, TaskStar, SubType),
%%	List1Key = playerState2:listLoopTaskID(),
%%	randTaskID(TaskStarReal, GroupID, List1Key, SubType);
%%randTaskID(_Mark, _TaskStar) ->
%%	0.  %% 虽然?Mark_False与0同值，但此处0表示返回了无效的TaskID
%%
%%%%%-------------------------------------------------------------------
%%% internal:随机选取任务_星级修正
%%-spec randTaskID_star(Weights::[{uint(), uint()}, ...], TaskStar::int(), TaskSubType::uint()) -> TaskStarNew::int().
%%randTaskID_star(Weights, ?Star_None, TaskSubType) ->
%%	case lists:keyfind(TaskSubType, 1, Weights) of
%%		{_, Weight} ->
%%			% 李孟反馈，根据权重值的和作为最大权重时，无法使全体五星几率降低，可修改为最大权重固定为10000
%%			%{_List1, List2} = lists:unzip(Weights),
%%			%WeightSum = lists:sum(List2),
%%			case misc:rand(1, 10000) =< Weight of
%%				true ->
%%					?Star_Five;
%%				_ ->
%%					?Star_None
%%			end;
%%		_ ->
%%			?Star_None
%%	end;
%%randTaskID_star(_Weights, TaskStar, _TaskSubType) ->
%%	TaskStar.
%%
%%%%%-------------------------------------------------------------------
%%% internal:随机选取任务_根据指定星级、组ID、子类型获得任务
%%% 没随到，配置错误
%%randTaskID(TaskStar, GroupID, [], _SubType) ->
%%	?ERROR("can not rand task with roleLevel:~w TaskStar:~w GroupID:~w", [playerState:getLevel(), TaskStar, GroupID]),
%%	error;
%%% 无指定星级随机，需要排除五星级任务
%%randTaskID(?Star_None = TaskStar, GroupID, [TaskID | T], SubType) ->
%%	case getCfg:getCfgByKey(cfg_task, TaskID) of
%%		#taskCfg{task_star = ?Star_Five} ->
%%			randTaskID(TaskStar, GroupID, T, SubType);
%%		#taskCfg{type = ?TaskMainType_EveryDay, groupid = GroupID, sub_type = SubType} ->
%%			TaskID;  %% 就是你了，皮卡丘！
%%		_ ->
%%			randTaskID(TaskStar, GroupID, T, SubType)
%%	end;
%%% 指定星级随机
%%randTaskID(TaskStar, GroupID, [TaskID | T], SubType) ->
%%	case getCfg:getCfgByKey(cfg_task, TaskID) of
%%		#taskCfg{type = ?TaskMainType_EveryDay, groupid = GroupID, task_star = TaskStar, sub_type = SubType} ->
%%			TaskID;  %% 就是你了，皮卡丘！
%%		_ ->
%%			randTaskID(TaskStar, GroupID, T, SubType)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:当前轮任务状态同步
%%% 注意如果有每日计数变化需要先刷新每日计数，以便客户端在收到该消息时数据是最新的
%%-spec syncState2Client(?SyncTimeState_BEGIN .. ?SyncTimeState_END) -> no_return().
%%syncState2Client(State) ->
%%	ListTask = playerPropSync:getProp(?SerProp_LoopTaskProcess),
%%	{_, B01_AllFive, _} = playerPropSync:getProp(?SerProp_LoopTaskState),
%%	Msg = #pk_GS2U_SyncStateLoopTask{
%%		list = syncState2Client(ListTask, []),
%%		state = State,
%%		allFive = B01_AllFive
%%	},
%%	playerMsg:sendNetMsg(Msg).
%%
%%% 客户端需要#pk_taskInfo{}用于显示
%%-spec syncState2Client(list(), [#pk_LoopTaskState{}, ...]) -> [#pk_LoopTaskState{}, ...].
%%syncState2Client([], Acc) ->
%%	lists:reverse(Acc);
%%syncState2Client([{TaskID, ?LoopTaskState_Going = State} | T], Acc) ->
%%	AcceptedTask = playerState:getAcceptedTask(),
%%	case lists:keyfind(TaskID, #rec_task.taskID, AcceptedTask) of
%%		#rec_task{
%%			taskTarget = Target,
%%			taskTargetCur = Cur,
%%			taskTargetMax = Max
%%		} ->
%%			Task = #pk_taskInfo{taskID = TaskID, target = Target, curNumber = Cur, maxNumber = Max},
%%			PK = #pk_LoopTaskState{
%%				taskID = TaskID,
%%				state = State,
%%				task = Task
%%			},
%%			syncState2Client(T, [PK | Acc]);
%%		_ ->
%%			%% 此处不允许配置变化导致初始化任务失败，但不能强匹配导致登录初始化中断
%%			syncState2Client(T, Acc)
%%	end;
%%syncState2Client([{TaskID, State} | T], Acc) ->
%%	case playerTask:initTask(TaskID) of
%%		#rec_task{
%%			taskTarget = Target,
%%			taskTargetCur = Cur,
%%			taskTargetMax = Max
%%		} ->
%%			Task = #pk_taskInfo{taskID = TaskID, target = Target, curNumber = Cur, maxNumber = Max},
%%			PK = #pk_LoopTaskState{
%%				taskID = TaskID,
%%				state = State,
%%				task = Task
%%			},
%%			syncState2Client(T, [PK | Acc]);
%%		_ ->
%%			%% 此处不允许配置变化导致初始化任务失败，但不能强匹配导致登录初始化中断
%%			syncState2Client(T, Acc)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:查找当前正在进行的家族任务ID
%%% 该函数以标准系统数据为标准，请参考check_goingTask/0区别调用
%%-spec findCurrentTaskID() -> TaskID::uint16().
%%findCurrentTaskID() ->
%%	AcceptedTask = playerState:getAcceptedTask(),
%%	findCurrentTaskID(AcceptedTask).
%%% 没找到
%%findCurrentTaskID([]) ->
%%	0;
%%% 找到了
%%findCurrentTaskID([#rec_task{taskType = ?TaskMainType_EveryDay, taskID = TaskID} | _T]) ->
%%	TaskID;
%%% 继续找
%%findCurrentTaskID([_ | T]) ->
%%	findCurrentTaskID(T).
%%
%%%%%-------------------------------------------------------------------
%%% internal:计算当前轮已放弃任务数量
%%-spec queryCancelTaskCount() -> Count::uint().
%%queryCancelTaskCount() ->
%%	ListTask = playerPropSync:getProp(?SerProp_LoopTaskProcess),
%%	{_, Count, _} = queryTaskCount(ListTask, {0, 0, 0}),
%%	Count.
%%
%%%%%-------------------------------------------------------------------
%%% internal:计算当前轮任务数量
%%-spec queryTaskCount(list(), tuple()) -> tuple().
%%queryTaskCount([], Counts) ->
%%	Counts;
%%queryTaskCount([{_, ?LoopTaskState_Completed} | T], {CountComplete, CountCancel, CountGo}) ->
%%	queryTaskCount(T, {CountComplete + 1, CountCancel, CountGo});
%%queryTaskCount([{_, ?LoopTaskState_Cancelled} | T], {CountComplete, CountCancel, CountGo}) ->
%%	queryTaskCount(T, {CountComplete, CountCancel + 1, CountGo});
%%queryTaskCount([{_, ?LoopTaskState_Going} | T], {CountComplete, CountCancel, CountGo}) ->
%%	queryTaskCount(T, {CountComplete, CountCancel, CountGo + 1}).
%%
%%%%%-------------------------------------------------------------------
%%% internal:计算当前轮已完成任务数量（用于适配跨天后保留未完成任务
%%-spec queryCompleteTaskCount() -> Count::uint().
%%queryCompleteTaskCount() ->
%%	ListTask = playerPropSync:getProp(?SerProp_LoopTaskProcess),
%%	{Count, _, _} = queryTaskCount(ListTask, {0, 0, 0}),
%%	Count.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 需要加入家族
%%-spec check_joinGuild(Mark::mark()) -> MarkNew::mark().
%%check_joinGuild(?Mark_True = Mark) ->
%%	case playerState:getGuildID() of
%%		0 ->
%%			?ERROR_CODE(?ErrorCode_GuildNotJoin),
%%			?Mark_False;
%%		_ ->
%%			Mark
%%	end;
%%check_joinGuild(_Mark) ->
%%	?Mark_False.
%%% 常常作为第一个条件使用，默认传参?Mark_True
%%-spec check_joinGuild() -> MarkNew::mark().
%%check_joinGuild() ->
%%	check_joinGuild(?Mark_True).
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 需要达到指定等级
%%-spec check_levelReach(Mark::mark()) -> MarkNew::mark().
%%check_levelReach(?Mark_True = Mark) ->
%%	#globalsetupCfg{setpara = [LevelLimit]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, dailytask_levellimit),
%%	case playerState:getLevel() >= LevelLimit of
%%		true ->
%%			Mark;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_RoleLevel, [LevelLimit]),
%%			?Mark_False
%%	end;
%%check_levelReach(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 需要未领取任务
%%-spec check_unacceptedTask(Mark::mark()) -> MarkNew::mark().
%%check_unacceptedTask(?Mark_True = Mark) ->
%%	case findCurrentTaskID() of
%%		0 ->
%%			case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
%%				[{TaskID, ?LoopTaskState_Going} | _] ->
%%					%% 标准任务系统中没有环任务，而环任务系统中有正在进行的任务，逻辑错误
%%					?ERROR("invalid logic RoleID:~w TaskID:~w", [playerState:getRoleID(), TaskID]),
%%					%% 该问题是因为任务数据丢失导致的数据不一致问题，需要修复数据
%%					fix_invalidTaskData(),
%%					Mark;
%%				_ ->
%%					Mark
%%			end;
%%		_ ->
%%			?Mark_False  %% 已领取任务，忽略
%%	end;
%%check_unacceptedTask(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,fix:修复 标准任务系统数据与同步属性数据不匹配
%%%% 删除标准任务系统中的家族任务
%%%% 跳过当前轮任务
%%-spec fix_invalidTaskData() -> no_return().
%%fix_invalidTaskData() ->
%%	fix_invalidTaskData_delTask(),
%%	fix_invalidTaskData_skipLoop(),
%%	ok.
%%
%%%%%-------------------------------------------------------------------
%%% internal,fix:修复 删除在标准任务系统中的错误数据
%%-spec fix_invalidTaskData_delTask() -> no_return().
%%fix_invalidTaskData_delTask() ->
%%	fix_invalidTaskData_delTask(playerState:getAcceptedTask()).
%%fix_invalidTaskData_delTask([]) ->
%%	ok;
%%fix_invalidTaskData_delTask([#rec_task{taskType = ?TaskMainType_EveryDay, taskID = TaskID} | T]) ->
%%	playerTask:cancelTask(TaskID),
%%	fix_invalidTaskData_delTask(T);
%%fix_invalidTaskData_delTask([_H | T]) ->
%%	fix_invalidTaskData_delTask(T).
%%
%%%%%-------------------------------------------------------------------
%%% internal,fix:修复 跳过当前轮家族任务（若不跳过可能因重复丢失导致刷家族任务奖励）
%%% 所谓跳过，是指假装走一次完成的流程，但没有相关奖励及消息的同步
%%-spec fix_invalidTaskData_skipLoop() -> no_return().
%%fix_invalidTaskData_skipLoop() ->
%%	gltDelMyWantGet(),  %% 尝试删除已有的索取条目
%%	closeThisLoop(),  %% 清空当前轮任务状态
%%	%% 清空相关购买计数
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshCost),
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshFive),
%%	playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshAllFive),
%%	ok.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 需要正在做指定任务
%%% 该函数以标准系统数据为标准，请参考findCurrentTaskID/0区别调用
%%-spec check_goingTask(Mark::mark(), TaskID::uint16()) -> MarkNew::mark().
%%check_goingTask(?Mark_True = Mark, TaskID) ->
%%	case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
%%		[{TaskID, ?LoopTaskState_Going} | _] ->
%%			Mark;
%%		_ ->
%%			%?ERROR("invalid logic, want complete unknown LoopTask:~w", [TaskID]),
%%			%?ERROR_CODE(?ErrorCode_System_Error_Unknow),
%%			syncState2Client(?SyncTimeState_Online),  %% 客户端的信息可能已经错乱，重新同步下数据
%%			?Mark_False  %% 非法的完成 绕过环任务系统直接在标准任务系统完成或删除了该任务 或客户端请求放弃或刷新错误的任务
%%	end;
%%check_goingTask(_Mark, _TaskID) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 需要正在做某任务
%%% 该函数以标准系统数据为标准，请参考findCurrentTaskID/0区别调用
%%-spec check_goingTask(Mark::mark()) -> MarkNew::mark().
%%check_goingTask(?Mark_True = Mark) ->
%%	case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
%%		[{_, ?LoopTaskState_Going} | _] ->
%%			Mark;
%%		_ ->
%%			%?ERROR("invalid logic, want complete unknown LoopTask:~w", [TaskID]),
%%			%?ERROR_CODE(?ErrorCode_System_Error_Unknow),
%%			syncState2Client(?SyncTimeState_Online),  %% 客户端的信息可能已经错乱，重新同步下数据
%%			?Mark_False  %% 非法的完成 绕过环任务系统直接在标准任务系统完成或删除了该任务 或客户端请求放弃或刷新错误的任务
%%	end;
%%check_goingTask(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 可领取次数
%%-spec check_canAcceptCount(Mark::mark()) -> MarkNew::mark().
%%check_canAcceptCount(?Mark_True = Mark) ->
%%	#globalsetupCfg{setpara = [MaxLoop, _MaxProcess]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, dailytask_number),
%%	case playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Loop) >= MaxLoop of
%%		true ->
%%			?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_Count),
%%			?Mark_False;
%%		_ ->
%%			Mark
%%	end;
%%check_canAcceptCount(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 免费刷新条件（次数和CD）
%%-spec check_refresh_free(Mark::mark()) -> MarkNew::mark().
%%check_refresh_free(?Mark_True = Mark) ->
%%	#globalsetupCfg{setpara = [MaxCount]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, datask_refreshcost_free),
%%	case playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshFree) >= MaxCount of
%%		true ->
%%			?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_RefreshFreeCount),
%%			?Mark_False;
%%		_ ->
%%			case playerState2:getLoopTaskRefreshCoolDown() of
%%				true ->
%%					playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshFree),
%%					Mark;
%%				_ ->
%%					?Mark_False  %% 服务端对未冷却没有提示，只是防止协议攻击
%%			end
%%	end;
%%check_refresh_free(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 付费刷新条件（仅货币）
%%-spec check_refresh_cost(Mark::mark()) -> MarkNew::mark().
%%check_refresh_cost(?Mark_True = Mark) ->
%%	#globalsetupCfg{setpara = Costs} = getCfg:getCfgPStack(cfg_globalsetup, datask_refreshcost_single),
%%	Number = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshCost) + 1,
%%	{CoinUseType, CoinCount} =
%%		case erlang:length(Costs) >= Number of
%%			true ->
%%				lists:nth(Number, Costs);
%%			_ ->
%%				lists:last(Costs)
%%		end,
%%	case playerMoney:canUseCoin(CoinUseType, CoinCount) of
%%		true ->
%%			PLog =
%%				#recPLogTSMoney{
%%					reason = ?CoinUseLoopTask_Refresh,
%%					param = ?Star_None,
%%					target = ?PLogTS_LoopTask,
%%					source = ?PLogTS_PlayerSelf
%%				},
%%			case playerMoney:useCoin(CoinUseType, CoinCount, PLog) of
%%				true ->
%%					playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshCost),
%%					Mark;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_RefreshCostCoin),
%%					?Mark_False
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_RefreshCostCoin),
%%			?Mark_False
%%	end;
%%check_refresh_cost(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 单次五星条件（仅货币）
%%-spec check_refresh_fiveStar(Mark::mark()) -> MarkNew::mark().
%%check_refresh_fiveStar(?Mark_True = Mark) ->
%%	#globalsetupCfg{setpara = Costs} = getCfg:getCfgPStack(cfg_globalsetup, datask_refreshcost_fivestars),
%%	Number = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshFive) + 1,
%%	{CoinUseType, CoinCount} =
%%		case erlang:length(Costs) >= Number of
%%			true ->
%%				lists:nth(Number, Costs);
%%			_ ->
%%				lists:last(Costs)
%%		end,
%%	case playerMoney:canUseCoin(CoinUseType, CoinCount) of
%%		true ->
%%			PLog =
%%				#recPLogTSMoney{
%%					reason = ?CoinUseLoopTask_Refresh,
%%					param = ?Star_Five,
%%					target = ?PLogTS_LoopTask,
%%					source = ?PLogTS_PlayerSelf
%%				},
%%			case playerMoney:useCoin(CoinUseType, CoinCount, PLog) of
%%				true ->
%%					playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshFive),
%%					Mark;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_FiveStarCoin),
%%					?Mark_False
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_FiveStarCoin),
%%			?Mark_False
%%	end;
%%check_refresh_fiveStar(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 一键五星条件（货币及次数）
%%-spec check_refresh_fiveStar_All(Mark::mark()) -> MarkNew::mark().
%%check_refresh_fiveStar_All(?Mark_True = Mark) ->
%%	#globalsetupCfg{setpara = [{CoinUseType, CoinCount}]} = getCfg:getCfgPStack(cfg_globalsetup, datask_refreshcost_fivestars_all),
%%	Number = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshAllFive) + 1,
%%	case Number > 1 of
%%		false ->
%%			TaskNumber = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Process) + queryCancelTaskCount(),
%%			#globalsetupCfg{setpara = [_MaxLoop, MaxProcess]} =
%%				getCfg:getCfgPStack(cfg_globalsetup, dailytask_number),
%%			CoinCount1 = (MaxProcess - TaskNumber) * CoinCount,
%%			case playerMoney:canUseCoin(CoinUseType, CoinCount1) of
%%				true ->
%%					PLog =
%%						#recPLogTSMoney{
%%							reason = ?CoinUseLoopTask_Refresh,
%%							param = ?Star_Five,
%%							target = ?PLogTS_LoopTask,
%%							source = ?PLogTS_PlayerSelf
%%						},
%%					case playerMoney:useCoin(CoinUseType, CoinCount1, PLog) of
%%						true ->
%%							playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_RefreshAllFive),
%%							{_, _, CountEx} = playerPropSync:getProp(?SerProp_LoopTaskState),
%%							playerPropSync:setAny(?SerProp_LoopTaskState, {time:getSyncTimeFromDBS(), 1, CountEx}),  %% 标记当前轮是一键五星状态
%%							?ERROR_CODE(?ErrorCode_TaskSuccess_LoopTaskAccept_AllFiveStar),
%%							Mark;
%%						_ ->
%%							?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_AllFiveStarCoin),
%%							?Mark_False
%%					end;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_TaskFailed_LoopTaskAccept_AllFiveStarCoin),
%%					?Mark_False
%%			end;
%%		_ ->
%%			?Mark_False
%%	end;
%%check_refresh_fiveStar_All(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 一键完成任务数量满足条件
%%-spec check_oneKey_count(Mark::mark(), Count::uint()) -> {MarkNew::mark(), CountReal::uint()}.
%%check_oneKey_count(?Mark_True = Mark, 0) ->
%%	#globalsetupCfg{setpara = [_MaxLoop, MaxProcess]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, dailytask_number),
%%	CountProcess = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Process),
%%	CountCancel = queryCancelTaskCount(),
%%	CountMax = MaxProcess - CountProcess - CountCancel,
%%	{Mark, CountMax};
%%check_oneKey_count(?Mark_True = Mark, Count) ->
%%	#globalsetupCfg{setpara = [_MaxLoop, MaxProcess]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, dailytask_number),
%%	CountProcess = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Process),
%%	CountCancel = queryCancelTaskCount(),
%%	CountMax = MaxProcess - CountProcess - CountCancel,
%%	case CountMax >= Count of
%%		true ->
%%			{Mark, Count};
%%		_ ->
%%			{?Mark_False, 0}
%%	end;
%%check_oneKey_count(_Mark, _Count) ->
%%	{?Mark_False, 0}.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:检查 一键完成任务道具满足条件
%%-spec check_oneKey_item(Mark::mark(), Count::uint()) -> MarkNew::mark().
%%check_oneKey_item(?Mark_True = Mark, Count) ->
%%	#globalsetupCfg{setpara = [ItemID, CountCell]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, dailytask_finishtask_single),
%%	CountItemNeed = Count * CountCell,
%%	CountItemHad = playerPackage:getGoodsCount(ItemID),
%%	case Count >= CountItemNeed of
%%		true ->
%%			PLog = #recPLogTSItem{
%%				new = CountItemHad - CountItemNeed,
%%				change = -CountItemNeed,
%%				source = ?PLogTS_PlayerSelf,
%%				target = ?PLogTS_LoopTask,
%%				changReason = ?ItemDeleteLoopTaskOneKey,
%%				reasonParam = Count
%%			},
%%			case playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, CountItemNeed, PLog) of
%%				true ->
%%					Mark;
%%				_ ->
%%					?Mark_False
%%			end;
%%		 _ ->
%%			 ?Mark_False
%%	end;
%%check_oneKey_item(_Mark, _Count) ->
%%	?Mark_False.
%%
%%%%%%%-------------------------------------------------------------------
%%%%% internal,check:检查 一键完成道具满足条件
%%%%-spec check_oneKey_item(Mark::mark()) -> MarkNew::mark().
%%%%check_oneKey_item(?Mark_True = Mark) ->
%%%%
%%%%check_oneKey_item(_Mark) ->
%%%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal:数据修复 for init/0, onReset/0
%%% 角色不在线时，非每日计数管理的数据需要重置，因此在上线时需要尝试修复数据
%%% 角色跨天持续在线时，同上原因，需要与每日计数同时重置修复数据
%%-spec fixData(IsForceReset::boolean()) -> no_return().
%%fixData(IsForceReset) ->
%%	case fixData_Time(IsForceReset) of
%%		true ->
%%			%%fixData_Task(findCurrentTaskID()),  不重置已领取的任务
%%			playerPropSync:setAny(?SerProp_LoopTaskGive, []);
%%		_ ->
%%			skip
%%	end.
%%
%%% 每日第一次上线重置
%%-spec fixData_Time(IsForceReset::boolean()) -> boolean().
%%fixData_Time(IsForceReset) ->
%%	{TimeLast, B01_AllFive, _} = playerPropSync:getProp(?SerProp_LoopTaskState),
%%	IsOnDay = core:timeIsOnDay(TimeLast + ?SECS_FROM_0_TO_1970),
%%	if
%%		(IsForceReset =:= true) orelse (IsOnDay =:= false) ->
%%			case findCurrentTaskID() of
%%				0 ->
%%					playerPropSync:setAny(?SerProp_LoopTaskState, {time:getSyncTimeFromDBS(), B01_AllFive, 0});
%%				_ ->
%%					playerPropSync:setAny(?SerProp_LoopTaskState, {time:getSyncTimeFromDBS(), B01_AllFive, 1}),  %% 保留的任务引发了一次额外的轮奖励机会
%%					playerDaily:addDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Process, queryCompleteTaskCount())  %% 保留已完成任务计数
%%			end,
%%			true;
%%		true ->
%%			false
%%	end.
%%
%%%%% 放弃标准任务系统中的家族任务
%%%%-spec fixData_Task(TaskID::uint16()) -> boolean().
%%%%fixData_Task(0) ->
%%%%  playerPropSync:setAny(?SerProp_LoopTaskProcess, []);
%%%%fixData_Task(TaskID) ->
%%%%  playerTask:cancelTask(TaskID),
%%%%  TaskIDNew = findCurrentTaskID(),
%%%%  fixData_Task(TaskIDNew).
%%
%%%%%-------------------------------------------------------------------
%%% internal:使用专供任务接口领取任务，此处忽略TaskID为0的任务，适用于因上文条件判断未过，randTaskID/2返回0的情况
%%% 注：此处TaskID为0不为错误，而是需要忽略处理。对于randTaskID/2执行失败的情况另有报错
%%-spec acceptTask(TaskID::uint16()) -> boolean().
%%acceptTask(0) ->
%%	false;
%%acceptTask(TaskID) ->
%%	Ret = playerTask:acceptTaskForLoopTask(TaskID, 0),
%%	gltDelMyWantGet(),  %% 新接任务后尝试删除已有的索取条目
%%	Ret.
%%
%%%%%-------------------------------------------------------------------
%%% internal:特殊事件处理
%%% 角色上线;角色升级;加入家族;完成家族任务时，需要尝试领取引导任务
%%% 退出家族;接受家族任务时，需要尝试取消引导任务
%%% 若不在线的时候被踢出家族，则上线时，需要尝试取消引导任务
%%-spec onEventEx() -> no_return().
%%onEventEx() ->
%%	case core:isCross() of
%%		false ->
%%			Ret = lists:keyfind(?LoopTaskLindID, #rec_task.taskID, playerState:getAcceptedTask()),
%%			onEventEx(isNeedLink(), Ret =/= false);
%%		_ ->
%%			skip
%%	end.
%%-spec onEventEx(IsNeed::boolean(), IsAccepted::boolean()) -> no_return().
%%onEventEx(Same, Same) ->
%%	skip;
%%onEventEx(true, false) ->
%%	playerTask:acceptTask(?LoopTaskLindID, 0);
%%onEventEx(false, true) ->
%%	playerTask:cancelTask(?LoopTaskLindID).
%%
%%%%%-------------------------------------------------------------------
%%% internal:是否需要引导任务
%%-spec isNeedLink() -> boolean().
%%isNeedLink() ->
%%	case playerMainMenu:isOpen(?ModeType_Guild) of
%%		false ->
%%			false;  %% 没有该任务 判断家族功能未开启，不需要引导
%%		_ ->
%%			#globalsetupCfg{setpara = [LevelLimit]} =
%%				getCfg:getCfgPStack(cfg_globalsetup, dailytask_levellimit),
%%			case playerState:getLevel() >= LevelLimit of
%%				true ->
%%					case findCurrentTaskID() of
%%						0 ->
%%							#globalsetupCfg{setpara = [MaxLoop, _MaxProcess]} =
%%								getCfg:getCfgPStack(cfg_globalsetup, dailytask_number),
%%							case playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_Loop) >= MaxLoop of
%%								true ->
%%									false;  %% 无可领取次数，不需要引导
%%								_ ->
%%									true
%%							end;
%%						_ ->
%%							false  %% 存在未完成的家族任务，不需要引导
%%					end;
%%				_ ->
%%					false  %%  等级不足，不需要引导
%%			end
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:查询指定角色索取状态
%%% 注意这个接口查出来的捐赠进度可能是满的
%%% 自己的信息需要有满的，别人的信息不需要满的
%%-spec gltQueryGet(Role::uint64()) -> {GuildID::uint64(), [#pk_GuildLoopTask_Get{}, ...]}.
%%gltQueryGet(RoleID) ->
%%	case ets:lookup(rec_guild_member, RoleID) of
%%		[#rec_guild_member{guildID = GuildID, power = Power, tTaskID = TaskID, tGoodsID = GoodsID, tGoodsM = GoodsM, tGoodsN = GoodsN, tGoodsTime = GoodsTime}] ->
%%			case core:timeIsOnDay(GoodsTime + ?SECS_FROM_0_TO_1970) andalso TaskID > 0 of
%%				true ->
%%					{GuildID, [gltMakeGet(RoleID, TaskID, Power, GoodsID, GoodsM, GoodsN, GoodsTime)]};
%%				_ ->
%%					{GuildID, []}
%%			end;
%%		_ ->
%%			{0, []}
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:查询是否已经捐赠过了
%%-spec gltIsGive({RoleID::uint64(), GoodsTime::uint64()}) -> boolean().
%%gltIsGive({RoleID, _GoodsTime} = Key) ->
%%	case playerState:getRoleID() of
%%		RoleID ->
%%			true;
%%		_ ->
%%			L = playerPropSync:getProp(?SerProp_LoopTaskGive),
%%			lists:member(Key, L)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:标记已经对其进行了捐赠
%%-spec gltSetIsGive(Key::{uint64(), uint32()}, IsGive::boolean()) -> no_return().
%%gltSetIsGive(_, _) ->
%%	skip.  %% 需求改变，不对捐赠进行次数限制。为防需求再改回来，这个接口先保留
%%% fixme 如果需要开放该接口，则需要将?SerProp_LoopTaskGive添加到?SaveSqlPropList中
%%%gltSetIsGive(Key, true) ->
%%%  L = playerPropSync:getProp(?SerProp_LoopTaskGive),
%%%  case lists:member(Key, L) of
%%%    true ->
%%%      skip;
%%%    _ ->
%%%      playerPropSync:setAny(?SerProp_LoopTaskGive, [Key | L])
%%%  end;
%%%gltSetIsGive(Key, false) ->
%%%  L = playerPropSync:getProp(?SerProp_LoopTaskGive),
%%%  case lists:member(Key, L) of
%%%    true ->
%%%      LNew = lists:delete(Key, L),
%%%      playerPropSync:setAny(?SerProp_LoopTaskGive, LNew);
%%%    _ ->
%%%      skip
%%%  end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:生成索取条目
%%-spec gltMakeGet(RoleID::uint64(), TaskID::uint16(), Power::uint8(), GoodsID::uint16(),
%%	GoodsM::uint16(), GoodsN::uint16(), GoodsTime::uint32()) -> #pk_GuildLoopTask_Get{}.
%%gltMakeGet(RoleID, TaskID, Power, GoodsID, GoodsM, GoodsN, GoodsTime) ->
%%	Pk = #pk_GuildLoopTask_Get{
%%		roleID = RoleID,
%%		roleCode = 0,
%%		roleName = [],
%%		roleGuildLevel = Power,
%%		career = 0,
%%		race = 0,
%%		sex = 0,
%%		head = 0,
%%		frameID = 0,
%%		level = 0,
%%		taskID = TaskID,
%%		itemID = GoodsID,
%%		itemM = GoodsM,
%%		itemN = GoodsN,
%%		isGive = gltIsGive({RoleID, GoodsTime}),
%%		timeWantGet = GoodsTime
%%	},
%%	case core:queryRoleKeyInfoByRoleID(RoleID) of
%%		#?RoleKeyRec{
%%			roleName = Name,
%%			career = Career,
%%			race = Race,
%%			sex = Sex,
%%			head = Head,
%%			level = Level,
%%			frameID = FrameID
%%		} ->
%%			Code =
%%				case core:queryOnLineRoleByRoleID(RoleID) of
%%					#rec_OnlinePlayer{code = Code_} ->
%%						Code_;
%%					_ ->
%%						0
%%				end,
%%			Pk#pk_GuildLoopTask_Get{
%%				roleCode = Code,
%%				roleName = Name,
%%				career = Career,
%%				race = Race,
%%				sex = Sex,
%%				head = Head,
%%				frameID = FrameID,
%%				level = Level
%%			};
%%		_ ->
%%			Pk
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:发起索取反馈
%%-spec gltWantGetAck(boolean()) -> no_return().
%%gltWantGetAck(false) ->
%%	gltSyncMyWantGet(?SyncGet_WantGetAck);
%%gltWantGetAck({true, GoodsTime}) ->
%%	gltSyncMyWantGet(?SyncGet_WantGetAck),
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildLoopTask_WantGetS),
%%	gltWantGetAck_chatMsg(GoodsTime).
%%
%%
%%%%%-------------------------------------------------------------------
%%% internal:发起索取反馈_在家族频道发送消息
%%-spec gltWantGetAck_chatMsg(GoodsTime::uint64()) -> no_return().
%%gltWantGetAck_chatMsg(GoodsTime) ->
%%	RoleID = playerState:getRoleID(),
%%	case gltQueryGet(RoleID) of
%%		{0, _} ->
%%			skip;  %% 无家族
%%		{_GuildID, []} ->
%%			skip;  %% 无索取
%%		{GuildID, [#pk_GuildLoopTask_Get{itemID = GoodsID, itemN = N}]} ->
%%			GoodsName = playerPackage:getGoodsNameFromCfg(GoodsID),
%%			ChatMsg = stringCfg:getString(
%%				guildDonation_get,
%%				[
%%					N,      %% 请求数量
%%					[],      %% <t=2> m_m_param3，无用
%%					GoodsName,  %% <t=2> m_m_param2，物品名
%%					GoodsID,  %% <t=2> m_m_param1，物品ID，小于30000是道具，否则是装备
%%						erlang:integer_to_list(GoodsID)  ++ "_" ++ erlang:integer_to_list(GoodsTime),  %% <t=12> m_m_param3，物品ID，小于30000是道具，否则是装备, 索取发起时间
%%						erlang:integer_to_list(RoleID) ++ "_" ++ playerState:getName(),    %% <t=12> m_m_param2，索取者角色ID_索取者角色名
%%					GuildID    %% <t=12> m_m_param1，索取者家族ID
%%				]
%%			),
%%			playerChat:onPlayerChatMsgSIM(
%%				#pk_U2GS_ChatInfo{
%%					channel = ?CHAT_CHANNEL_GUILD,
%%					receiverID = 0,
%%					content = ChatMsg
%%				}
%%			)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:家族任务相关_捐赠 由家族进程调用
%%-spec gltGiveForGuild(FromPid::pid(), {RoleID::uint64(), TargetRoleID::uint64(), CostItem::term()}) -> no_return().
%%gltGiveForGuild(FromPid, {RoleID, TargetRoleID, CostItem}) ->
%%	{_, CostGoodsID, CostCount, _, _} = CostItem,
%%	{Mark, State, Member, TaskID} =
%%		case ets:lookup(rec_guild_member, RoleID) of
%%			[#rec_guild_member{guildID = GuildID}] ->
%%				case ets:lookup(rec_guild_member, TargetRoleID) of
%%					[#rec_guild_member{guildID = GuildID, tTaskID = TTaskID, tGoodsID = TGoodsID, tGoodsM = TGoodsM, tGoodsN = TGoodsN, tGoodsTime = TGoodsTime} = R] ->
%%						case core:timeIsOnDay(TGoodsTime + ?SECS_FROM_0_TO_1970) andalso TTaskID > 0 of
%%							true when TGoodsM =:= TGoodsN ->
%%								?ERROR_CODE_Ex(RoleID, ?ErrorCode_GuildLoopTask_InvalidWantGet),
%%								{?Mark_False, ?AckGive_Full, 0, 0};      %% 已捐满，删除条目
%%							true when TGoodsN - TGoodsM < CostCount ->
%%								?ERROR_CODE_Ex(RoleID, ?ErrorCode_GuildLoopTask_GiveF_GoodsMore),
%%								{?Mark_False, ?AckGive_CountMore, R, 0};  %% 捐赠数量溢出，同步条目
%%							true when TGoodsID =/= CostGoodsID ->
%%								?ERROR_CODE_Ex(RoleID, ?ErrorCode_GuildLoopTask_InvalidWantGet),
%%								{?Mark_False, ?AckGive_NotGoods, R, 0};    %% 道具不符，同步条目
%%							true ->
%%								{?Mark_True, ?AckGive_Success, R, TTaskID};  %% 可以捐
%%							_ ->
%%								?ERROR_CODE_Ex(RoleID, ?ErrorCode_GuildLoopTask_InvalidWantGet),
%%								{?Mark_False, ?AckGive_NotGoods, 0, 0}    %% 超时导致条目无效，删除条目
%%						end;
%%					_ ->
%%						?ERROR_CODE_Ex(RoleID, ?ErrorCode_GuildLoopTask_NotSameGuild),
%%						{?Mark_False, ?AckGive_NotSameGuild, 0, 0}  %% 不在同一家族，删除条目
%%				end;
%%			_ ->
%%				?ERROR_CODE_Ex(RoleID, ?ErrorCode_GuildNotJoin),
%%				{?Mark_False, ?AckGive_NotInGuild, 0, 0}  %% 不在家族，删除条目
%%		end,
%%	MemberNew_ =
%%		case Mark of
%%			?Mark_True ->
%%				#rec_guild_member{tGoodsID = ID, tGoodsM = M, tGoodsN = N} = Member,
%%				MNew = M + CostCount,
%%				MemberNew = Member#rec_guild_member{tGoodsM = MNew},
%%				ets:insert(rec_guild_member, MemberNew),
%%				guildLogic:saveToMySql(MemberNew),
%%				History = #pk_GuildLoopTaskGiveHistory{
%%					time = time:getSyncTimeFromDBS(),
%%					roleID = RoleID,
%%					tarRoleID = TargetRoleID,
%%					taskID = TaskID,
%%					itemID = ID,
%%					itemM = M,
%%					itemN = N
%%				},
%%				ets:insert(?EtsGoodsHistory, History),
%%				case MNew of
%%					N ->
%%						0;
%%					_ ->
%%						MemberNew
%%				end;
%%			_ ->
%%				Member
%%		end,
%%	psMgr:sendMsg2PS(FromPid, gltGiveAck, {Mark, State, MemberNew_, CostItem, TargetRoleID, TaskID}).
%%
%%%%%-------------------------------------------------------------------
%%% api:捐赠反馈
%%-spec gltGiveAck({Mark::mark(), State::?SyncGet_BEGIN .. ?SyncGet_END, Member::#rec_guild_member{}|0,
%%	CostItem::term(), TargetRoleID::uint64(), TaskID::uint16()}) -> no_return().
%%gltGiveAck({?Mark_True, State, Member, {_, _, GoodsCount, _, _} = CostItem, TargetRoleID, TaskID}) ->
%%	%% 捐赠_发奖
%%	gltGiveAck_reward(TaskID, GoodsCount),
%%	%% 反馈捐赠者
%%	WantGet =
%%		case Member of
%%			#rec_guild_member{} ->
%%				{_, WantGet_} = gltQueryGet(TargetRoleID),
%%				WantGet_;
%%			_ ->
%%				[]  %% 已满，需要删除条目
%%		end,
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildLoopTask_GiveS),
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_GuildLoopTask_Give_Ack{
%%			type = State,
%%			roleID = TargetRoleID,
%%			taskID = TaskID,
%%			listData = WantGet,
%%			count = GoodsCount
%%		}
%%	),
%%	%% 邮件给被捐赠者发送物品并通知在线的被捐赠者
%%	gltGiveAck_mail(CostItem, TargetRoleID);
%%gltGiveAck({_Mark, State, Member, {_, _, GoodsCount, _, _} = CostItem, TargetRoleID, TaskID}) ->
%%	playerBase:backRes([CostItem]),  %% 捐赠失败，返还资源
%%	%% 若条目有效，则还原标记，并取得最新条目
%%	WantGet =
%%		case Member of
%%			#rec_guild_member{tGoodsTime = Time} ->
%%				gltSetIsGive({TargetRoleID, Time}, false),
%%				{_, WantGet_} = gltQueryGet(TargetRoleID),
%%				WantGet_;
%%			_ ->
%%				%% 条目无效时已经没有必要还原标记，新的条目必定不同
%%				[]
%%		end,
%%	%% 反馈协议
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_GuildLoopTask_Give_Ack{
%%			type = State,
%%			roleID = TargetRoleID,
%%			taskID = TaskID,
%%			listData = WantGet,
%%			count = GoodsCount
%%		}
%%	);
%%gltGiveAck(_) ->
%%	gltSyncMyWantGet(?SyncGet_GiveSync).  %% 被捐赠的在线反馈
%%
%%%%%-------------------------------------------------------------------
%%% internal:捐赠_发奖
%%-spec gltGiveAck_reward(TaskID::uint16(), Count::uint()) -> no_return().
%%gltGiveAck_reward(TaskID, Count) ->
%%	case getCfg:getCfgPStack(cfg_task, TaskID) of
%%		#taskCfg{groupid = GroupID, task_star = Star, target_conf = [_, CountMax]} ->
%%			case getCfg:getCfgPStack(cfg_guildDonation_reward, GroupID, Star) of
%%				#guildDonation_rewardCfg{reward_item1 = LG, reward_money = LC} ->
%%					<<Param:64>> = <<TaskID:16, GroupID:16, Star:16, CountMax:16>>,
%%					ForLog = {Param, TaskID, GroupID, Star},
%%					gltGiveAck_reward_goods(LG, ForLog, CountMax, Count),
%%					gltGiveAck_reward_coin(LC, ForLog, CountMax, Count);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:捐赠_发奖（物品）
%%-spec gltGiveAck_reward_goods(term(), ForLog::{Param::uint64(), TaskID::uint16(), GroupID::uint16(), Star::uint16()}, CountMax::uint16(), Count::uint16()) -> no_return().
%%gltGiveAck_reward_goods(undefined, _ForLog, _CountMax, _Count) ->
%%	skip;  %% 配空，没有奖励
%%gltGiveAck_reward_goods([], _ForLog, _CountMax, _Count) ->
%%	ok;  %% 配空，或遍历完，没有奖励
%%gltGiveAck_reward_goods(0, _ForLog, _CountMax, _Count) ->
%%	ok;  %% 配空，没有奖励
%%gltGiveAck_reward_goods("[]", _ForLog, _CountMax, _Count) ->
%%	ok;  %% 意图配空，常见导表错误，没有奖励
%%gltGiveAck_reward_goods([{GoodsID, GoodsCount} | T], ForLog = {Param, _TaskID, _GroupID, _Star}, CountMax, Count) ->
%%	case (GoodsCount * Count) div CountMax of
%%		CountReal when CountReal > 0 ->
%%			PLog = #recPLogTSItem{
%%				new = CountReal,
%%				change = CountReal,
%%				target = ?PLogTS_PlayerSelf,
%%				source = ?PLogTS_GuildLoopTaskGive,
%%				changReason = ?ItemSourceGuildLoopTask_GiveReward,
%%				reasonParam = Param
%%			},
%%			Quality = playerPackage:getQualityFromCfg(GoodsID),
%%			playerPackage:addGoodsAndMail(GoodsID, CountReal, true, Quality, PLog);
%%		_ ->
%%			skip
%%	end,
%%	gltGiveAck_reward_goods(T, ForLog, CountMax, Count);
%%gltGiveAck_reward_goods([H | T], ForLog = {_Param, TaskID, GroupID, Star}, CountMax, Count) ->
%%	?ERROR("invalid cfg_guildDonation_reward TaskID:~w GroupID:~w Star:~w invalidItem:~w", [TaskID, GroupID, Star, H]),
%%	gltGiveAck_reward_goods(T, ForLog, CountMax, Count).
%%
%%%%%-------------------------------------------------------------------
%%% internal:捐赠_发奖（货币）
%%-spec gltGiveAck_reward_coin(term(), ForLog::{Param::uint64(), TaskID::uint16(), GroupID::uint16(), Star::uint16()}, CountMax::uint16(), Count::uint16()) -> no_return().
%%gltGiveAck_reward_coin(undefined, _ForLog, _CountMax, _Count) ->
%%	skip;  %% 配空，没有奖励
%%gltGiveAck_reward_coin([], _ForLog, _CountMax, _Count) ->
%%	ok;  %% 配空，或遍历完，没有奖励
%%gltGiveAck_reward_coin(0, _ForLog, _CountMax, _Count) ->
%%	ok;  %% 配空，没有奖励
%%gltGiveAck_reward_coin("[]", _ForLog, _CountMa, _Countx) ->
%%	ok;  %% 意图配空，常见导表错误，没有奖励
%%gltGiveAck_reward_coin([{CoinType, CoinCount} | T], ForLog = {Param, _TaskID, _GroupID, _Star}, CountMax, Count) ->
%%	case (CoinCount * Count) div CountMax of
%%		CountReal when CountReal > 0 ->
%%			PLog = #recPLogTSMoney{
%%				reason = ?CoinSourceCopyMapReward,
%%				param = Param,
%%				target = ?PLogTS_PlayerSelf,
%%				source = ?PLogTS_GuildLoopTaskGive
%%			},
%%			playerMoney:addCoin(CoinType, CountReal, PLog);
%%		_ ->
%%			skip
%%	end,
%%	gltGiveAck_reward_coin(T, ForLog, CountMax, Count);
%%gltGiveAck_reward_coin([H | T], ForLog = {_Param, TaskID, GroupID, Star}, CountMax, Count) ->
%%	?ERROR("invalid cfg_guildDonation_reward TaskID:~w GroupID:~w Star:~w invalidCoin:~w", [TaskID, GroupID, Star, H]),
%%	gltGiveAck_reward_coin(T, ForLog, CountMax, Count).
%%
%%%%%-------------------------------------------------------------------
%%% internal:捐赠_邮件给被捐赠者发放物品
%%-spec gltGiveAck_mail(CostItem::term(), TargetRoleID::uint64()) -> no_return().
%%gltGiveAck_mail(CostItem, TargetRoleID) ->
%%	{_, GoodsID, GoodsCount, _, _} = CostItem,
%%	Quality = playerPackage:getQualityFromCfg(GoodsID),
%%	GoodsName = playerPackage:getGoodsNameFromCfg(GoodsID),
%%	GiveRoleName = playerNameUID:getPlayerNameByUID(playerState:getRoleID()),
%%	MailItemList = playerMail:createMailGoods(GoodsID, GoodsCount, true, Quality, TargetRoleID, ?ItemSourceGuildLoopTask_Get),
%%	Title = stringCfg:getString(guildDonation_reward_title),
%%	Content = stringCfg:getString(guildDonation_reward_content, [GiveRoleName, GoodsCount, GoodsName]),
%%	mail:sendSystemMail(TargetRoleID, Title, Content, MailItemList, ""),
%%	%% 如果被捐赠者在线则需要从被捐赠者进程发送网络消息
%%	case core:queryOnLineRoleByRoleID(TargetRoleID) of
%%		#rec_OnlinePlayer{pid = Pid} ->
%%			psMgr:sendMsg2PS(Pid, gltGiveAck, 0);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:同步索取信息
%%-spec gltSyncMyWantGet(State::?SyncGet_BEGIN .. ?SyncGet_END) -> no_return().
%%gltSyncMyWantGet(State) ->
%%	{_, MyGet} = gltQueryGet(playerState:getRoleID()),
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_GuildLoopTask_MyGet_Sync{
%%			state = State,
%%			myGet = MyGet
%%		}
%%	).
%%
%%%%%-------------------------------------------------------------------
%%% internal:发起索取
%%-spec gltWantGet(TaskID::uint16()) -> no_return().
%%gltWantGet(TaskID) ->
%%	RetGuild = check_joinGuild(),                       %% 要求加入家族（不然向谁索取？）
%%	RetTask = gltCheck_task(RetGuild, TaskID),          %% 要求正在进行指定任务
%%	RetWantGet = gltCheck_wantGet(RetTask),             %% 要求当前任务尚未索取
%%	RetItem = gltCheck_itemForGet(RetWantGet, TaskID),  %% 要求所需物品不足
%%	RetCount = gltCheck_count(RetItem),                 %% 要求当日索取次数足够
%%	gltWantGetDo(RetCount, TaskID).                     %% 发起索取（执行）
%%
%%%%%-------------------------------------------------------------------
%%% internal:发起索取（执行）
%%-spec gltWantGetDo(Mark::mark(), TaskID::uint16()) -> no_return().
%%gltWantGetDo(?Mark_True, TaskID) ->
%%	case getCfg:getCfgPStack(cfg_task, TaskID) of
%%		#taskCfg{target_conf = [ID, Count]} ->
%%			%% 此处只有极小几率因退出家族、配置热更导致发起索取失败，因此直接添加计数，并不考虑失败后返还
%%			playerDaily:incDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_GuildWantGet),
%%			RoleID = playerState:getRoleID(),
%%			CountN = Count - playerPackage:getGoodsCount(ID),
%%			psMgr:sendMsg2PS(?PsNameGuild, gltWantGet, {RoleID, TaskID, CountN});
%%		_ ->
%%			gltWantGetDo(?Mark_False, TaskID)
%%	end;
%%gltWantGetDo(_Mark, _TaskID) ->
%%	gltWantGetAck(false).
%%
%%%%%-------------------------------------------------------------------
%%% internal:请求面板数据
%%-spec gltOpenUI() -> no_return().
%%gltOpenUI() ->
%%	RoleID = playerState:getGuildID(),
%%	ListGuildMember = guildLogic:getGuildMember(RoleID),
%%	ListWantGet = gltOpenUI(ListGuildMember, RoleID, []),
%%	playerMsg:sendNetMsg(#pk_GS2U_GuildLoopTask_OpenUI_Ack{listData = ListWantGet}).
%%
%%%%%-------------------------------------------------------------------
%%% internal:请求面板数据
%%-spec gltOpenUI(ListGuildMember::[#rec_guild_member{}, ...], RoleID::uint64(),
%%	Acc::[#pk_GuildLoopTask_Get{}, ...]) -> Ret::[#pk_GuildLoopTask_Get{}, ...].
%%gltOpenUI([], _RoleID, Acc) ->
%%	Acc;
%%gltOpenUI([#rec_guild_member{tGoodsTime = GoodsTime} = H | T], RoleID, Acc) ->
%%	case core:timeIsOnDay(GoodsTime + ?SECS_FROM_0_TO_1970) of
%%		true ->
%%			AccNew = gltOpenUI_(H, RoleID, Acc),
%%			gltOpenUI(T, RoleID, AccNew);
%%		_ ->
%%			gltOpenUI(T, RoleID, Acc)
%%	end.
%%gltOpenUI_(#rec_guild_member{roleID = RoleID, power = Power, tTaskID = TaskID, tGoodsID = GoodsID,
%%	tGoodsM = GoodsM, tGoodsN = GoodsN, tGoodsTime = GoodsTime}, RoleID, Acc) ->
%%	[gltMakeGet(RoleID, TaskID, Power, GoodsID, GoodsM, GoodsN, GoodsTime) | Acc];  %% 自己的数据，满了也要给
%%gltOpenUI_(#rec_guild_member{tGoodsM = GoodsN, tGoodsN = GoodsN}, _RoleID, Acc) ->
%%	Acc;  %% 不是自己的数据，满了就不给了
%%gltOpenUI_(#rec_guild_member{roleID = RoleID, power = Power, tTaskID = TaskID, tGoodsID = GoodsID,
%%	tGoodsM = GoodsM, tGoodsN = GoodsN, tGoodsTime = GoodsTime}, _RoleID, Acc) ->
%%	[gltMakeGet(RoleID, TaskID, Power, GoodsID, GoodsM, GoodsN, GoodsTime) | Acc].
%%
%%%%%-------------------------------------------------------------------
%%% internal:捐赠
%%-spec gltGive(TargetRoleID::uint64(), GoodsID::uint16(), Count::uint32()) -> no_return().
%%gltGive(TargetRoleID, GoodsID, Count) ->
%%	RoleID = playerState:getRoleID(),
%%	RetGuild = check_joinGuild(),                                               %% 要求加入家族
%%	{RetTarget, State, WantGet} =                                               %% 要求目标有效
%%		gltCheck_target(RetGuild, RoleID, TargetRoleID, GoodsID, Count),
%%	{RetItem, CostItem} = gltCheck_itemForGive(RetTarget, GoodsID, Count),      %% 要求拥有并扣除所属物品
%%	gltGiveDo(RetItem, CostItem, State, WantGet, RoleID, TargetRoleID, Count).  %% 捐赠（执行）
%%
%%%%%-------------------------------------------------------------------
%%% internal:捐赠（执行）
%%-spec gltGiveDo(Mark::mark(), CostItem::term(), State::?AckGive_BEGIN..?AckGive_END,
%%	WantGet::[#pk_GuildLoopTask_Get{}, ...], RoleID::uint64(), TargetRoleID::uint64(), Count::uint()) -> no_return().
%%gltGiveDo(?Mark_True, CostItem, _State, [#pk_GuildLoopTask_Get{timeWantGet = Time}], RoleID, TargetRoleID, _Count) ->
%%	gltSetIsGive({TargetRoleID, Time}, true),   %% 标记已捐赠
%%	psMgr:sendMsg2PS(?PsNameGuild, gltGive, {RoleID, TargetRoleID, CostItem});
%%gltGiveDo(_Mark, _CostItem, State, WantGet, _RoleID, TargetRoleID, Count) ->
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_GuildLoopTask_Give_Ack{
%%			type = State,
%%			roleID = TargetRoleID,
%%			taskID = 0, %% 这里不是捐赠成功，不需要展示奖励
%%			listData = WantGet,
%%			count = Count
%%		}
%%	).
%%
%%%%%-------------------------------------------------------------------
%%% internal:请求和自己相关的捐赠历史数据
%%-spec gltHistory() -> no_return().
%%gltHistory() ->
%%	RoleID = playerState:getRoleID(),
%%	ListHistory = ets:select(
%%		?EtsGoodsHistory,
%%		ets:fun2ms(
%%			fun(#pk_GuildLoopTaskGiveHistory{roleID = RoleIDA, tarRoleID = RoleIDB} = R)
%%				when RoleIDA =:= RoleID; RoleIDB =:= RoleID ->
%%				R
%%			end
%%		)
%%	),
%%	{ListHistory2, ListRoleID} = gltHistory(ListHistory, RoleID, [], []),
%%	NameTables = [#pk_NameTable2{id = ID, name = playerNameUID:getPlayerNameByUID(ID)} || ID <- ListRoleID],
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_GuildLoopTask_History_Ack{
%%			listHistory = ListHistory2,
%%			nameTables = NameTables
%%		}
%%	).
%%
%%%%%-------------------------------------------------------------------
%%% internal:请求和自己相关的捐赠历史数据_将内存数据转换为网络消息
%%-spec gltHistory([#pk_GuildLoopTaskGiveHistory{}, ...], uint64(), [#pk_GuildLoopTaskGiveHistory2{}, ...], [uint64(), ...]) -> {[#pk_GuildLoopTaskGiveHistory2{}, ...], [uint64(), ...]}.
%%gltHistory([], _RoleID, Acc1, Acc2) ->
%%	{Acc1, lists:usort(Acc2)};
%%gltHistory(
%%	[
%%		#pk_GuildLoopTaskGiveHistory{
%%			roleID = RoleIDA,
%%			tarRoleID = RoleIDB
%%		} = H | T
%%	],
%%	RoleID, Acc1, Acc2
%%) ->
%%	TargetRoleID =
%%		case RoleID of
%%			RoleIDA ->
%%				RoleIDB;
%%			_ ->
%%				RoleIDA
%%		end,
%%	Pk2 = #pk_GuildLoopTaskGiveHistory2{
%%		career = 0,
%%		race = 0,
%%		sex = 0,
%%		head = 0,
%%		level = 0,
%%		history = H
%%	},
%%	Pk2New =
%%		case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
%%			#?RoleKeyRec{
%%				career = Career,
%%				race = Race,
%%				sex = Sex,
%%				head = Head,
%%				level = Level
%%			} ->
%%				Pk2#pk_GuildLoopTaskGiveHistory2{
%%					career = Career,
%%					race = Race,
%%					sex = Sex,
%%					head = Head,
%%					level = Level
%%				};
%%			_ ->
%%				Pk2
%%		end,
%%	gltHistory(T, RoleID, [Pk2New | Acc1], [RoleIDB | [RoleIDA | Acc2]]).
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:要求正在进行指定任务
%%-spec gltCheck_task(Mark::mark(), TaskID::uint16()) -> MarkNew::mark().
%%gltCheck_task(?Mark_True = Mark, TaskID) ->
%%	case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
%%		[{TaskID, ?LoopTaskState_Going} | _] ->
%%			case getCfg:getCfgPStack(cfg_task, TaskID) of
%%				#taskCfg{type = ?TaskMainType_EveryDay, sub_type = ?TaskSubType_HandIn} ->
%%					Mark;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_GuildLoopTask_InvalidTask),
%%					?Mark_False
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_InvalidTask),
%%			?Mark_False
%%	end;
%%gltCheck_task(_Mark, _TaskID) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:要求当前任务尚未索取
%%-spec gltCheck_wantGet(Mark::mark()) -> MarkNew::mark().
%%gltCheck_wantGet(?Mark_True = Mark) ->
%%	RoleID = playerState:getRoleID(),
%%	case gltQueryGet(RoleID) of
%%		{_, []} ->
%%			Mark;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_AlreadyWantGet),
%%			?Mark_False
%%	end;
%%gltCheck_wantGet(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:要求所需物品不足
%%-spec gltCheck_itemForGet(Mark::mark(), TaskID::uint16()) -> MarkNew::mark().
%%gltCheck_itemForGet(?Mark_True = Mark, TaskID) ->
%%	case getCfg:getCfgPStack(cfg_task, TaskID) of
%%		#taskCfg{target_conf = [ID, Count]} ->
%%			case playerPackage:checkGoods(ID, Count) of
%%				true ->
%%					?ERROR_CODE(?ErrorCode_GuildLoopTask_NoNeed),
%%					?Mark_False;
%%				_ ->
%%					Mark
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_NoNeed),
%%			?Mark_False
%%	end;
%%gltCheck_itemForGet(_Mark, _TaskID) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:要求当日索取次数足够
%%-spec gltCheck_count(Mark::mark()) -> MarkNew::mark().
%%gltCheck_count(?Mark_True = Mark) ->
%%	case getCfg:getCfgPStack(cfg_globalsetup, guild_claim_times) of
%%		#globalsetupCfg{setpara = [-1]} ->
%%			Mark;
%%		#globalsetupCfg{setpara = [Max]} ->
%%			Count = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?DailyType_LoopTaskNum_GuildWantGet),
%%			case Count >= Max of
%%				true ->
%%					?ERROR_CODE(?ErrorCode_GuildLoopTask_MaxWantGet),
%%					?Mark_False;
%%				_ ->
%%					Mark
%%			end;
%%		_ ->
%%			%% 配置无效
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_MaxWantGet),
%%			?Mark_False
%%	end;
%%gltCheck_count(_Mark) ->
%%	?Mark_False.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:要求目标有效
%%-spec gltCheck_target(Mark::mark(), RoleID::uint64(), TargetRoleID::uint64(), GoodsID::uint16(), Count::uint32()) ->
%%	{MarkNew::mark(), ?AckGive_BEGIN..?AckGive_END, WantGet::[#pk_GuildLoopTask_Get{}, ...]}.
%%gltCheck_target(?Mark_True, RoleID, RoleID, _GoodsID, _Count) ->
%%	?ERROR_CODE(?ErrorCode_GuildLoopTask_CannotGiveSelf),
%%	{?Mark_False, ?AckGive_Self, []};
%%gltCheck_target(?Mark_True, _RoleID, TargetRoleID, _GoodsID, 0) ->
%%	?ERROR_CODE(?ErrorCode_GuildLoopTask_InvalidWantGet),
%%	{_, WantGet} = gltQueryGet(TargetRoleID),
%%	{?Mark_False, ?AckGive_CountZero, WantGet};
%%gltCheck_target(?Mark_True = Mark, _RoleID, TargetRoleID, GoodsID, Count) ->
%%	GuildID = playerState:getGuildID(),
%%	case gltQueryGet(TargetRoleID) of
%%		{TargetGuildID, _} when GuildID =/= TargetGuildID ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_NotSameGuild),
%%			{?Mark_False, ?AckGive_NotSameGuild, []};
%%		{_, [#pk_GuildLoopTask_Get{isGive = true}] = WantGet} ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_AlreadyGive),
%%			{?Mark_False, ?AckGive_AlreadyGive, WantGet};
%%		{_, [#pk_GuildLoopTask_Get{itemM = ItemN, itemN = ItemN}]} ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_InvalidWantGet),
%%			{?Mark_False, ?AckGive_Full, []};
%%		{_, [#pk_GuildLoopTask_Get{itemM = ItemM, itemN = ItemN}] = WantGet} when ItemN - ItemM < Count ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_GiveF_GoodsMore),  %% 并发导致无法捐赠数量溢出
%%			{?Mark_False, ?AckGive_CountMore, WantGet};
%%		{_, [#pk_GuildLoopTask_Get{itemID = ItemID}] = WantGet} when ItemID =/= GoodsID ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_InvalidWantGet),   %% 客户端传参错误或数据不同步
%%			{?Mark_False, ?AckGive_NotGoods, WantGet};
%%		{_, WantGet} ->
%%			{Mark, ?AckGive_Success, WantGet}
%%	end;
%%gltCheck_target(_Mark, _RoleID, _TargetRoleID, _GoodsID, _Count) ->
%%	?ERROR_CODE(?ErrorCode_GuildNotJoin),
%%	{?Mark_False, ?AckGive_NotInGuild, []}.
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:要求拥有并扣除所属物品
%%-spec gltCheck_itemForGive(Mark::mark(), GoodsID::uint16(), Count::uint32()) -> {MarkNew::mark(), CostItem::term()}.
%%gltCheck_itemForGive(?Mark_True = Mark, GoodsID, Count) ->
%%	{Ret, CostItem} = playerBase:costRes(
%%		?BackType_Item,
%%		GoodsID,
%%		Count,  %% 前文已验证了Count在索取条目的合法性，此处只检测是否有足够的物品
%%		?PLogTS_GuildLoopTaskGive,
%%		?ItemDeleteReasonGuildLoopTask_Give,
%%		?ItemSourceGuildLoopTask_GiveBack
%%	),
%%	case Ret of
%%		false ->
%%			?ERROR_CODE(?ErrorCode_TaskFailed_NeedItem),
%%			{?Mark_False, CostItem};
%%		_ ->
%%			{Mark, CostItem}
%%	end;
%%gltCheck_itemForGive(_Mark, _TaskID, _Count) ->
%%	{?Mark_False, {}}.
%%
%%%%%-------------------------------------------------------------------
%%% internal:任务完成、放弃或刷新任务、新接任务时，都需要删除已有的索取条目
%%-spec gltDelMyWantGet() -> no_return().
%%gltDelMyWantGet() ->
%%	RoleID = playerState:getRoleID(),
%%	case gltQueryGet(RoleID) of
%%		{_, [_]} ->
%%			psMgr:sendMsg2PS(?PsNameGuild, gltDelMyWantGet, playerState:getRoleID()),
%%			playerMsg:sendNetMsg(
%%				#pk_GS2U_GuildLoopTask_MyGet_Sync{
%%					state = ?SyncGet_Task,
%%					myGet = []
%%				}
%%			);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:企图绕过请求面板数据直接捐赠，这里需要刷新对象的索取信息，以支持显示
%%-spec gltWantGive(TargetRoleID::uint64(), Time::uint32()) -> no_return().
%%gltWantGive(TargetRoleID, Time) ->
%%	RoleID = playerState:getRoleID(),
%%	RetGuild = check_joinGuild(),  %% 要求加入家族
%%	{_RetTarget, State, WantGet} =  %% 要求目标有效
%%	gltCheck_target(RetGuild, RoleID, TargetRoleID, Time),
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_GuildLoopTask_WantGive_Ack{
%%			type = State,
%%			roleID = TargetRoleID,
%%			listData = WantGet
%%		}
%%	).
%%
%%%%%-------------------------------------------------------------------
%%% internal,check:要求目标有效
%%-spec gltCheck_target(Mark::mark(), RoleID::uint64(), TargetRoleID::uint64(), Time::uint32()) ->
%%	{MarkNew::mark(), ?AckGive_BEGIN..?AckGive_END, WantGet::[#pk_GuildLoopTask_Get{}, ...]}.
%%gltCheck_target(?Mark_True, RoleID, RoleID, _Time) ->
%%	?ERROR_CODE(?ErrorCode_GuildLoopTask_CannotGiveSelf),
%%	{?Mark_False, ?AckGive_Self, []};
%%gltCheck_target(?Mark_True = Mark, _RoleID, TargetRoleID, Time) ->
%%	GuildID = playerState:getGuildID(),
%%	case gltQueryGet(TargetRoleID) of
%%		{_, []} -> %% 增加此处匹配 为了 匹配发布索取之后换任务之后对索取进行捐赠的情况
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_InvalidWantGet),
%%			{?Mark_False, ?AckGive_Full, []};
%%		{TargetGuildID, _} when GuildID =/= TargetGuildID ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_NotSameGuild),
%%			{?Mark_False, ?AckGive_NotSameGuild, []};
%%		{_, [#pk_GuildLoopTask_Get{isGive = true}] = WantGet} ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_AlreadyGive),
%%			{?Mark_False, ?AckGive_AlreadyGive, WantGet};
%%		{_, [#pk_GuildLoopTask_Get{itemM = ItemN, itemN = ItemN}]} ->
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_InvalidWantGet),
%%			{?Mark_False, ?AckGive_Full, []};
%%		{_, [#pk_GuildLoopTask_Get{timeWantGet = ThisTime}]} when ThisTime =/= Time -> %% 增加此处匹配 为了 匹配发布索取之后换任务再索取之后对之前的索取进行捐赠的情况
%%			?ERROR_CODE(?ErrorCode_GuildLoopTask_InvalidWantGet),
%%			{?Mark_False, ?AckGive_Full, []};
%%		{_, WantGet} ->
%%			{Mark, ?AckGive_Success, WantGet}
%%	end;
%%gltCheck_target(_Mark, _RoleID, _TargetRoleID, _Time) ->
%%	?ERROR_CODE(?ErrorCode_GuildNotJoin),
%%	{?Mark_False, ?AckGive_NotInGuild, []}.
%%
%%%%%-------------------------------------------------------------------
%%% api:测算各等级段的各星级概率
%%-define(TestCountMaxEveryLevel, 100000).  %% 每个级别测试次数，不要太小，样本太小没意义
%%-spec testProbability() -> CountProcess::uint().
%%-ifndef(RELEASE).
%%testProbability() ->
%%	#globalsetupCfg{setpara = [LevelMin]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, dailytask_levellimit),
%%	#globalsetupCfg{setpara = [LevelMax]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, player_maxlevel),
%%	testProbability(LevelMin, LevelMax, ?TestCountMaxEveryLevel, ?TestCountMaxEveryLevel, 0).
%%
%%%% 多进程测算概率（之前单进程写的跑死了都没把结果跑出来，数量级太小了又没意义）
%%-define(TestCountMaxSingle, 1000).  %% 单进程最大计算量
%%-spec testProbability(LevelCur::uint(), LevelMax::uint(), CountCur::uint(), CountMax::uint(), CountProcess::uint()) -> CountProcessEnd::uint().
%%%% 级别遍历完了，结束，返回任务进程数
%%testProbability(LevelCur, LevelMax, _CountCur, _CountMax, CountProcess) when LevelCur > LevelMax ->
%%	CountProcess;
%%%% 计算量大于最大计算量，分配任务
%%testProbability(LevelCur, LevelMax, CountCur, CountMax, CountProcess) when CountCur >= ?TestCountMaxSingle ->
%%	erlang:spawn(fun() -> testProbabilityDo(LevelCur, 0, ?TestCountMaxSingle, []) end),
%%	testProbability(LevelCur, LevelMax, CountCur - ?TestCountMaxSingle, CountMax, CountProcess + 1);
%%%% 残余计算量，分配任务
%%testProbability(LevelCur, LevelMax, CountCur, CountMax, CountProcess) when CountCur > 0 ->
%%	erlang:spawn(fun() -> testProbabilityDo(LevelCur, 0, CountCur, []) end),
%%	testProbability(LevelCur, LevelMax, 0, CountMax, CountProcess + 1);
%%%% 无计算量，下一等级
%%testProbability(LevelCur, LevelMax, _CountCur, CountMax, CountProcess) ->
%%	testProbability(LevelCur + 1, LevelMax, CountMax, CountMax, CountProcess).
%%
%%%% 每个线程的执行函数
%%-spec testProbabilityDo(LevelCur::uint(), CountCur::uint(), CountMax::uint(), Acc::list()) -> no_return().
%%%% 完成任务，发送任务结果
%%testProbabilityDo(LevelCur, CountMax, CountMax, Acc) ->
%%	psMgr:sendMsg2PS(?PublicDataMgr, testProbability, {LevelCur, Acc});
%%%% 执行任务
%%testProbabilityDo(LevelCur, CountCur, CountMax, Acc) ->
%%	AccNew = testProbabilityDo_randStar(LevelCur, Acc),
%%	testProbabilityDo(LevelCur, CountCur + 1, CountMax, AccNew).
%%
%%%% 根据级别随机选择任务并得到任务星级，累积到结果集中
%%-spec testProbabilityDo_randStar(Level::uint(), Acc::list()) -> AccNew::list().
%%testProbabilityDo_randStar(Level, Acc) ->
%%	#dailytaskCfg{group = GroupID, tasksub_weight = SubTypeWeights, taskstar_weight = StarWeights} =
%%		getCfg:getCfgPStack(cfg_dailytask, Level),
%%	SubType = misc:calcOddsByAfterWeightList(SubTypeWeights),
%%	TaskStarReal = randTaskID_star(StarWeights, ?Star_None, SubType),
%%	List1Key = playerState2:listLoopTaskID(),
%%	TaskID = randTaskID(TaskStarReal, GroupID, List1Key, SubType),
%%	#taskCfg{task_star = Star} = getCfg:getCfgPStack(cfg_task, TaskID),
%%	case lists:keyfind(Star, 1, Acc) of
%%		false ->
%%			[{Star, 1} | Acc];
%%		{_, Count} ->
%%			lists:keyreplace(Star, 1, Acc, {Star, Count + 1})
%%	end.
%%
%%-else.  %% RELEASE
%%testProbability() ->
%%	0.
%%-endif.  %% RELEASE
%%
%%%%%-------------------------------------------------------------------
%%% api:打印测算结果
%%-spec testProbability_log(list()) -> no_return().
%%testProbability_log(List) ->
%%	FunSort = fun({A, _}, {B, _}) -> A > B end,
%%	testProbability_log(lists:sort(FunSort, List), FunSort, ?TestCountMaxEveryLevel, []).
%%-spec testProbability_log(ListData1::list(), FunSort::term(), CountMax::uint(), Acc::list()) -> AccNew::list().
%%testProbability_log([], _FunSort, _CountMax, _Acc) ->
%%	ok;
%%testProbability_log([{Level, ListData2} | T], FunSort, CountMax, Acc) ->
%%	AccNew = testProbability_log_(lists:sort(FunSort, ListData2), CountMax, Acc),
%%	AccNew2 = io_lib:format("~n[TestLoopTask] testProbability Level:~w~n", [Level]) ++ AccNew,
%%	?DEBUG(AccNew2),  %% 每个级别写一次
%%	testProbability_log(T, FunSort, CountMax, []).
%%-spec testProbability_log_(ListData2::list(), CountMax::uint(), Acc::list()) -> AccNew::list().
%%testProbability_log_([], _CountMax, Acc) ->
%%	Acc;
%%testProbability_log_([{Star, Count} | T], CountMax, Acc) ->
%%	AccNew = io_lib:format("Star:~w  Count:~w  P:~w~n", [Star, Count, Count / CountMax]) ++ Acc,
%%	testProbability_log_(T, CountMax, AccNew).
%%
%%%%%-------------------------------------------------------------------
%%%% api,fix:LUN-8438 【外网】【家族任务】接取到无法完成的家族任务
%%-spec fixInvalidTask_1_3_0() -> no_return().
%%fixInvalidTask_1_3_0() ->
%%	%% 该问题是因为v1.2.0角色等级限制为75级，但家族任务组75~78属于group16，此时配置为非正式配置
%%	%% 然后v1.3.0对家族任务进行了修改，group16改为正式配置
%%	%% 其中包含两项错误：
%%	%% 1.部分任务group改为1表示无效（李孟确认
%%	%% 2.部分任务依然有效，但任务内容已该表，玩家不能根据界面提示正确地完成任务
%%	%% 对于上述错误，修改方案为，补偿流程中检查当前家族任务是否为group1或group16，如果是，则特殊重置该任务
%%	%% 所谓特殊重置，是指在不增加放弃任务的情况下放弃该任务，然后重新领取一个同星级任务
%%	%% 这个过程中当前任务进度丢失，但不影响家族任务总体进度
%%	%%
%%	case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
%%		[{TaskID, ?LoopTaskState_Going} | T] ->
%%			%% 存在某个正在执行的家族任务
%%			case getCfg:getCfgByKey(cfg_task, TaskID) of
%%				#taskCfg{groupid = GroupID, task_star = Star} when GroupID =:= 1; GroupID =:= 16 ->
%%					%% 当前任务组是1（无效）或16（可能有问题）
%%					playerTask:cancelTask(TaskID),              %% 取消该任务
%%					TaskIDNew = randTaskID(?Mark_True, Star),   %% 重新领取同星级任务
%%					case acceptTask(TaskIDNew) of               %% 使用标准任务系统领取任务
%%						true ->
%%							ListTaskNew = [{TaskIDNew, ?LoopTaskState_Going} | T],
%%							playerPropSync:setAny(?SerProp_LoopTaskProcess, ListTaskNew),
%%							syncState2Client(?SyncTimeState_Online);  %% 重新进行上线同步
%%						_ ->
%%							?Mark_False
%%					end;
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%
%%%% v3.0.0屏蔽旧版补偿
%%%% give11
%%%%%%%-------------------------------------------------------------------
%%%%%% internal,fix:LUN-8438 【外网】【家族任务】接取到无法完成的家族任务
%%%%-spec fixInvalidTask() -> no_return().
%%%%fixInvalidTask() ->
%%%%	case playerPropSync:getProp(?SerProp_LoopTaskProcess) of
%%%%		[{TaskID, ?LoopTaskState_Going} | _] ->
%%%%			fixInvalidTask(playerState:getAcceptedTask(), TaskID);
%%%%		_ ->
%%%%			fixInvalidTask(playerState:getAcceptedTask(), 0)
%%%%	end.
%%%%-spec fixInvalidTask(ListTask::[#rec_task{}, ...], TaskID::uint16()) -> no_return().
%%%%fixInvalidTask([], _TaskID) ->
%%%%	ok;
%%%%fixInvalidTask([#rec_task{taskID = TaskID} | T], TaskID) ->
%%%%	fixInvalidTask(T, TaskID);  %% 忽略指定任务
%%%%fixInvalidTask([#rec_task{taskID = TaskIDInvalid} | T], TaskID) ->
%%%%	case getCfg:getCfgByKey(cfg_task, TaskIDInvalid) of
%%%%		#taskCfg{type = ?TaskMainType_EveryDay} ->
%%%%			?ERROR("invalid logic RoleID:~w TaskIDInvalid:~w TaskID:~w", [playerState:getRoleID(), TaskIDInvalid, TaskID]),
%%%%			playerTask:cancelTask(TaskIDInvalid);  %% 取消异常的环任务
%%%%		_ ->
%%%%			skip
%%%%	end,
%%%%	fixInvalidTask(T, TaskID).
