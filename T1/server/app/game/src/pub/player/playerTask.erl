%%
%% @doc @todo 玩家任务模块模块.

%% 新增任务类型
%% 1.task.hrl 增加定义
%% 2.initTask_type
%% 3.initTask_subtype_common / initTask_subtype_**
%% 4.updateTask
%% 5.addPlusNumber
-module(playerTask).

-include("playerPrivate.hrl").
-include("cfg_dailytask_Cycle.hrl").


%%: 接任务时给的buff；完成或者放弃时自动删除
%%: 如果有buff，填写buffID
%%: 【buff给予时机，buff id】
%%: 任务阶段
%%: 1.任务开始
%%: 2.到达任务目标（采集、npc...等）
%%: 3.任务完成
%%: [{任务阶段，对话groupID}}
%%: buff id-buff表的id
-define(BuffEventAny, 0).
-define(BuffEventOnAccept, 1).
-define(BuffEventOnDoing, 2).
-define(BuffEventOnSubmit, 3).
-define(BuffEventOnCancel, 4).
-define(BuffEventOnReset, 5).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
%%	onLogin/1,
	triggerTaskBuff/1,
	acceptTask/2,
	acceptTaskForLoopTask/2,
	acceptTaskForExpTask/2,
	cancelTask/1,
	submitTask/3,
	updateFloatIngTask/1,
	sendAllCompleteTaskMsg/0,
	sendAllAcceptedTaskMsg/0,
	requestTalkToNpc/1,
	isAcceptedTaskByID/1,
	isSubmittedTaskByID/1,
	getCollectObjectIDByCode/1,
	canSubmitTask/2,
	resetTask/1,
	handIn/4,        % 上交物品任务，请求上交物品
	initTask/1,        % 初始化任务数据
	giveTaskAward/2,
	autoSubmitArunaTask/0
]).

-export([
	gmSubmitTask/1,
	gmAddCompleteTask/1,
	gmCancelTask/1,
	gmForceAddTask/1,
	gmAddTaskWithoutAchieve/2
]).


-export([
	updateTask/2,
	updateTask/3,
	updateTaskCount/3,
	taskTriggerEventOnEnterMap/1
]).

-export([
	%%modifyMainTask/0,		%% 补偿1，补偿丢失的主线任务
	%%fixCompletedMainTask/0,	%% 补偿2，基于已领取的主线任务，修复丢失的已完成主线任务状态
	%%fixMainTask/0,			%% 由于补偿1和2仅会有效执行1次，若玩家持续丢失主线任务，则由此发起在上线后延时处理补偿
	%%onFixMainTask/1,		%% 响应fixMainTask/0发起的延时事件
	%%fixMultiMainTask/0,		%% 修复同时存在多个主线任务产生的异常逻辑
	%%fixAchieveTaskIsComplete/0	%% 修复已领取成就任务（目前仅有漂浮之石任务）未完成的错误
]).

%% expTask
-export([
	updateExpTask/0,
	gmSubmitExpTaskCur/0
]).

triggerTaskBuff(TaskID) ->
	case getTaskFromAcceptedListByID(TaskID) of
		#rec_task{} ->
			dealTaskBuff(?BuffEventOnDoing, getTaskCfgByID(TaskID)),
			ok;
		_ ->
			skip
	end,
	ok.

gmAddCompleteTask(TaskID) ->
	IsSubmitted = isSubmittedTaskByID(TaskID),
	addSubmittedTask(TaskID),
	deleteTask(TaskID, ?TaskLogSubmit),
	playerMainMenu:onFuncIsOpenByMainMenu(?MainMenuType_TaskIDS, TaskID, IsSubmitted),
	ok.

-spec gmSubmitTask(TaskID :: uint()) -> uint().
gmSubmitTask(TaskID) when erlang:is_integer(TaskID) andalso TaskID > 0 ->
	%% GM命令目前仅能提交单人任务
	Task = getTaskFromAcceptedListByID(TaskID),
	case Task of
		#rec_task{} ->
			completeTask(Task, 0);
		_ ->
			skip
	end,
	Task.

%% 更新任务
-spec updateFloatIngTask(TaskID :: uint()) -> uint().
updateFloatIngTask(TaskID) ->
	Task = getTaskFromAcceptedListByID(TaskID),
	case Task of
		#rec_task{} ->
			updateTask2(Task, 1);
		_ ->
			skip
	end,
	Task.
%% ====================================================================
%%同步已经完成的所有任务到客户端
-spec sendAllCompleteTaskMsg() -> ok.
sendAllCompleteTaskMsg() ->
	L = playerState:getSubmittedTask(),
	Fun =
		fun({Slot, V}, AccIn) ->
			[#pk_SubmittedTaskInfo{slot = Slot, value = V} | AccIn]
		end,
	List = lists:foldl(Fun, [], L),
	playerMsg:sendNetMsg(#pk_GS2U_CompleteTaskList{list = List}),
	ok.
%% ====================================================================
%%同步已经接取的所有任务到客户端
-spec sendAllAcceptedTaskMsg() -> ok.
sendAllAcceptedTaskMsg() ->
	AllAcceptedTask = playerState:getAcceptedTask(),
	InfoList = [makeMsgInfoFromRec(Task) || Task <- AllAcceptedTask],
	playerMsg:sendNetMsg(#pk_GS2U_TaskList{list = InfoList}),
	ok.
%% ====================================================================
%%处理对话任务
-spec requestTalkToNpc(Code) -> ok when Code :: uint().
requestTalkToNpc(Code) ->
	playerMsg:sendNetMsg(#pk_GS2U_TalkToNpcResult{
		result = ?TaskLogAccept,
		code = Code
	}),

	case playerState:getNpcByCode(Code) of
		#recMapObject{id = NpcID} ->
			updateTask(?TaskSubType_Talk, NpcID);
		_ ->
			skip
	end,
	ok.

%% ====================================================================
taskTriggerEventOnEnterMap(0) ->
	ok;
taskTriggerEventOnEnterMap(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			ok;
		#mapsettingCfg{} ->
			playerConvoy:giveUpConvoy(false),
			triggerEventOnEnterMap(MapID);
		_ ->
			ok
	end.
%% ====================================================================
triggerEventOnEnterMap(MapID) ->
	L = filterAcceptTask(?TaskSubType_Convoy, MapID),
	doTriggerEventOnEnterMap(L),
	ok.

doTriggerEventOnEnterMap([]) ->
	ok;
doTriggerEventOnEnterMap([#rec_task{taskSubType = ?TaskSubType_Convoy, taskID = TaskID} | L]) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{target_conf = [_CopyMapID, _MonsterID, _StartWID, _EndWID]} = Cfg ->
			triggerEvent(Cfg);
		_ ->
			ok
	end,
	doTriggerEventOnEnterMap(L).
%% ====================================================================
updateTask(Type, Key, Target) ->
	updateTask0(Type, Key, Target).

updateTask(?TaskSubType_UseItem, Code) ->
	case playerState:getUseItemByCode(Code) of
		#recMapObject{id = UseObjID} ->
			updateTask0(?TaskSubType_UseItem, UseObjID, 0);
		_ ->
			skip
	end;
updateTask(?TaskSubType_Monster, Target) ->
	updateTask0(?TaskSubType_Monster, Target, Target),
	if
		Target =:= 1105 ->  %% 特殊处理野外首领任务
			updateTask0(?TaskSubType_Active, 19, 19);
		true ->
			skip
	end,
	ok;
updateTask(Type, Target) ->
	updateTask0(Type, Target, Target).

updateTaskCount(Type, Target, Count) ->
	updateTask0Count(Type, Target, Target, Count).

updateTask0(Type, Key, Target) ->
	L = filterAcceptTask(Type, Key, Target),
	updateTask1(L).

updateTask0Count(Type, Key, Target, Count) ->
	L = filterAcceptTask(Type, Key, Target),
	updateTask1Count(L, Count).

updateTask1([]) ->
	ok;
updateTask1([#rec_task{} = Task | L]) ->
	updateTask2(Task),
	updateTask1(L).

updateTask1Count([], _Count) ->
	ok;
updateTask1Count([#rec_task{} = Task | L], Count) ->
	updateTask2(Task, Count),
	updateTask1Count(L, Count).

updateTask2(
	#rec_task{
		taskID = TaskID,
		taskSubType = SubType,
		taskTargetCur = Cur,
		taskTargetMax = Max
	} = Task
) ->
	%%
	case canAddPlus(TaskID) of
		true ->
			NewCur = curNumber(0, SubType, TaskID, Cur, Max),
			NewTask = Task#rec_task{taskTargetCur = NewCur},
			%%
			L1 = playerState:getAcceptedTask(),
			L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
			playerState:setAcceptedTask(L2),
			%%
			playerMsg:sendNetMsg(#pk_GS2U_UpdateTask{info = makeMsgInfoFromRec(NewTask)}),

			%% 特殊的处理
			try
			    playerAruna:updateArunaCrossTask(NewTask)
			catch
			    _:Why ->
					?ERROR("update task error info:~p,~p,~p",
						[playerState:getRoleID(), NewTask, Why])
			end,
			ok;
		_ ->
			0
	end.
%% 增加指定数量的进度
updateTask2(
	#rec_task{
		taskID = TaskID,
		taskTargetCur = Cur
	} = Task, Count
) ->
	%%
	case canAddPlus(TaskID) of
		true ->
			NewCur = Cur + Count,
			NewTask = Task#rec_task{taskTargetCur = NewCur},
			%%
			L1 = playerState:getAcceptedTask(),
			L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
			playerState:setAcceptedTask(L2),
			%%
			playerMsg:sendNetMsg(#pk_GS2U_UpdateTask{info = makeMsgInfoFromRec(NewTask)}),

			%% 特殊的处理
			try
				playerAruna:updateArunaCrossTask(NewTask)
			catch
				_:Why ->
					?ERROR("update task error info:~p,~p,~p",
						[playerState:getRoleID(), NewTask, Why])
			end,
			ok;
		_ ->
			0
	end.



filterAcceptTask(Type, FilterKey) ->
	L1 = playerState:getAcceptedTask(),
	lists:filter(
		fun(R) ->
			#rec_task{
				taskSubType = SubType,
				taskKey = TaskKey,
				taskTargetCur = Cur,
				taskTargetMax = Max
			} = R,
			SubType =:= Type andalso
				TaskKey =:= FilterKey andalso
				Cur < Max

		end, L1).

filterAcceptTask(Type, FilterKey, FilterTarget) ->
	L1 = playerState:getAcceptedTask(),
	lists:filter(
		fun(R) ->
			#rec_task{
				taskTarget = TaskTarget,
				taskSubType = SubType,
				taskKey = TaskKey,
				taskTargetCur = Cur,
				taskTargetMax = Max
			} = R,
			SubType =:= Type andalso
				TaskKey =:= FilterKey andalso
				Cur < Max andalso
				(TaskTarget =:= 0 orelse TaskTarget =:= FilterTarget)

		end, L1).

canAddPlus(TaskID) ->
	PlayerLevel = playerState:getLevel(),

	case getTaskCfgByID(TaskID) of
		#taskCfg{level_limit = LevelLimit} ->
			PlayerLevel >= LevelLimit;
		_ ->
			false
	end.

curNumber(TC, _Type, _TID, _Cur, _Max) when TC > 0 ->
	TC;
curNumber(_TC, ?TaskSubType_CollectItem, TaskID, Cur, Max) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{target_conf = Params} ->
			case Params of
				[_MonsterID, _ItemID, CMin, CMax] ->
					RX = misc:rand(CMin, CMax),
					Cur + misc:clamp(RX, 1, Max - Cur);
				_ ->
					Cur + 1
			end;
		_ ->
			Cur
	end;
curNumber(_TC, ?TaskSubType_Drop, TaskID, Cur, Max) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{target_conf = Params} ->
			case Params of
				[_] ->
					Cur + misc:clamp(1, 1, Max - Cur);
				_ ->
					Cur + 1
			end;
		_ ->
			Cur
	end;
curNumber(_TC, _Type, _TID, Cur, _Max) ->
	Cur + 1.


%% ====================================================================
%%gm放弃任务
-spec gmCancelTask(TaskID) -> ok when TaskID :: uint().
gmCancelTask(TaskID) ->
	case isAcceptedTaskByID(TaskID) of
		true ->
			%% 1取消任务,2通知client ,3保存log
			deleteTask(TaskID, ?TaskLogCancel);
		_ ->
			skip
	end,
	ok.
%% ====================================================================
%%领取任务但不触发成就任务的完成检查
-spec gmAddTaskWithoutAchieve(TaskID, Notify) -> ok when Notify::boolean(), TaskID :: uint().
gmAddTaskWithoutAchieve(TaskID, Notify) ->
	Task = initTask(TaskID),

	NewList = lists:keystore(TaskID,
		#rec_task.taskID,
		playerState:getAcceptedTask(),
		Task),
	playerState:setAcceptedTask(NewList),

	%%2通知client
	case Notify of
		true ->
			playerMsg:sendNetMsg(#pk_GS2U_AcceptTask{
				info = makeMsgInfoFromRec(Task)});
		false ->
			skip
	end,

	%%3保存log
	dbLog:sendSaveLogTask(
		playerState:getRoleID(),
		TaskID,
		playerState:getLevel(),
		?TaskLogAccept),

	onAddNewTask(TaskID),
	addOrDeletePet(TaskID),

	sync2Ets(),
	ok.
%% ====================================================================
%%gm强制领任务
-spec gmForceAddTask(TaskID) -> ok when TaskID :: uint().
gmForceAddTask(TaskID) ->
	Task = initTask(TaskID),
	addNewTask(Task, true),
	ok.
%% ====================================================================
%%放弃任务
-spec cancelTask(TaskID) -> ok when TaskID :: uint().
cancelTask(TaskID) ->
	case canCancelTask(TaskID) of
		{true, _} ->
			%% 1取消任务,2通知client ,3保存log
			deleteTask(TaskID, ?TaskLogCancel),
			sync2Ets();
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

canCancelTask(TaskID) ->
	case isAcceptedTaskByID(TaskID) of
		true ->
			#taskCfg{type = TaskType} = getTaskCfgByID(TaskID),
			{canCancelTask1(TaskType), -2};
		_ ->
			{false, ?ErrorCode_TaskFailed_IsNotExit}
	end.

canCancelTask1(?TaskMainType_Main) ->
	false;
canCancelTask1(_) ->
	true.

%%
resetTask(TaskID) ->
	case isAcceptedTaskByID(TaskID) of
		true ->
			doResetTask(TaskID);
		_ ->
			{false, ?ErrorCode_TaskFailed_IsNotExit}
	end.

doResetTask(TaskID) ->
	L1 = playerState:getAcceptedTask(),
	Task = lists:keyfind(TaskID, #rec_task.taskID, L1),
	NewTask = Task#rec_task{taskTargetCur = 0},
	L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
	playerState:setAcceptedTask(L2),
	%%
	playerMsg:sendNetMsg(#pk_GS2U_UpdateTask{info = makeMsgInfoFromRec(NewTask)}),
	dealTaskBuff(?BuffEventOnReset, getTaskCfgByID(TaskID)),
	taskTriggerEventImmediately(getTaskCfgByID(TaskID)).

%% ====================================================================
%% api:上交物品任务，请求上交物品
-spec handIn(TaskID :: uint16(), ItemID :: uint16(), ItemCount :: uint32(), Code :: uint64()|gm) -> no_return().
handIn(0, _ItemID, _ItemCount, _Code) ->
	skip;
handIn(_TaskID, 0, _ItemCount, _Code) ->
	skip;
handIn(_TaskID, _ItemID, 0, _Code) ->
	skip;
handIn(TaskID, ItemID, ItemCount, gm) ->    %% gm说不检测NPC距离
	L1 = playerState:getAcceptedTask(),
	case lists:keyfind(TaskID, #rec_task.taskID, L1) of
		#rec_task{taskSubType = ?TaskSubType_HandIn, taskTarget = ItemID, taskTargetCur = Cur, taskTargetMax = Max} = Task when Cur < Max ->
			ItemCountNeed = erlang:min(ItemCount, Max - Cur),
			case playerPackage:checkAndCostGoods(ItemID, ItemCountNeed, ?PLogTS_Task, ?ItemDeleteReasonTaskHandIn, TaskID) of
				true ->
					updateTask2(Task, ItemCountNeed);
				_ ->
					?ERROR_CODE(?ErrorCode_TaskFailed_NeedItem),
					skip    %% 道具不足
			end;
		_ ->
			skip    %% 没有该任务信息，忽略
	end;
handIn(TaskID, ItemID, ItemCount, Code) ->
	L1 = playerState:getAcceptedTask(),
	case lists:keyfind(TaskID, #rec_task.taskID, L1) of
		#rec_task{taskSubType = ?TaskSubType_HandIn, taskTarget = ItemID, taskTargetCur = Cur, taskTargetMax = Max} = Task when Cur < Max ->
			#taskCfg{target_conf_params = [NpcID, _]} = getTaskCfgByID(TaskID),
			case checkNpcDist(NpcID, Code) of
				{true, _} ->
					ItemCountNeed = erlang:min(ItemCount, Max - Cur),
					case playerPackage:checkAndCostGoods(ItemID, ItemCountNeed, ?PLogTS_Task, ?ItemDeleteReasonTaskHandIn, TaskID) of
						true ->
							updateTask2(Task, ItemCountNeed);
						_ ->
							?ERROR_CODE(?ErrorCode_TaskFailed_NeedItem),
							skip    %% 道具不足
					end;
				{_, ErrorCode} ->
					?ERROR_CODE(ErrorCode),
					skip
			end;
		_ ->
			skip    %% 没有该任务信息，忽略
	end.

%% ====================================================================
%%接收任务（专供家族/日常/环任务）
-spec acceptTaskForLoopTask(TaskID, NPCCode) -> boolean()
	when TaskID :: uint(), NPCCode :: uint().
acceptTaskForLoopTask(0, _) ->
	?ERROR("Player:~p Error AcceptTaskID:0", [playerState:getRoleID()]),
	false;
acceptTaskForLoopTask(TaskID, _NPCCode) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{type = ?TaskMainType_EveryDay} ->
			doAcceptTask(TaskID);
		_ ->
			%?ERROR("Player:~p Error AcceptTaskID:~w from~n~p", [playerState:getRoleID(), TaskID, misc:getStackTrace()]),
			false    %% 不能使用专供任务接口领取 非 家族/日常/环任务
	end.

%% ====================================================================
%%接收任务（专供经验环任务）
-spec acceptTaskForExpTask(TaskID, NPCCode) -> boolean()
	when TaskID :: uint(), NPCCode :: uint().
acceptTaskForExpTask(0, _) ->
	?ERROR("Player:~p Error AcceptTaskID:0", [playerState:getRoleID()]),
	false;
acceptTaskForExpTask(TaskID, _NPCCode) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{type = ?TaskMainType_Exp} ->
			doAcceptTask(TaskID);
		_ ->
			%?ERROR("Player:~p Error AcceptTaskID:~w from~n~p", [playerState:getRoleID(), TaskID, misc:getStackTrace()]),
			false    %% 不能使用专供任务接口领取 非 家族/日常/环任务
	end.

%% ====================================================================
%%接收任务
-spec acceptTask(TaskID, NPCCode) -> boolean()
	when TaskID :: uint(), NPCCode :: uint().
acceptTask(0, _) ->
	?ERROR("Player:~p Error AcceptTaskID:0", [playerState:getRoleID()]),
	false;
acceptTask(TaskID, _NPCCode) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{type = ?TaskMainType_EveryDay} ->
			%?ERROR("Player:~p Error AcceptTaskID:~w from~n~p", [playerState:getRoleID(), TaskID, misc:getStackTrace()]),
			false;    %% 不能使用标准任务接口领取家族/日常/环任务
		#taskCfg{type = ?TaskMainType_Exp} ->
			%?ERROR("Player:~p Error AcceptTaskID:~w from~n~p", [playerState:getRoleID(), TaskID, misc:getStackTrace()]),
			false;    %% 不能使用标准任务接口领取经验环任务
		_ ->
			doAcceptTask(TaskID)
	end.

%%getNextMainTask(NextList) when erlang:is_list(NextList) ->
%%	F =
%%		fun(TaskID, _) ->
%%			case getTaskCfgByID(?FirstTaskID) of
%%				#taskCfg{type = ?TaskMainType_Main} ->
%%					{true, TaskID};
%%				_ ->
%%					{false, 0}
%%			end
%%		end,
%%	case misc:foldlEx(F, {false, 0}, NextList) of
%%		{true, TID} -> TID;
%%		_ -> 0
%%	end;
%%getNextMainTask(_) ->
%%	0.
%% v3.0.0屏蔽旧版补偿
%% give2
%%modifyMainTask() ->
%%	#taskCfg{} = LTask = getTaskCfgByID(?FirstTaskID),
%%	case isSubmittedTaskByID(?FirstTaskID) of
%%		false ->
%%			acceptTaskList([?FirstTaskID]);
%%		true ->
%%			modifyMainTask(LTask, LTask)
%%	end.
%%modifyMainTask(#taskCfg{auto_next = AutoNext}, #taskCfg{id = ID, auto_next = Next} = RTask) ->
%%	case isSubmittedTaskByID(ID) of
%%		false ->
%%			%% 没提交过
%%			acceptTaskList(AutoNext);
%%		true ->
%%			%% 提交过，继续遍历下一个
%%			case getNextMainTask(Next) of
%%				0 ->
%%					?ERROR("modifyMainTask:~p,~p,~p", [playerState:getRoleID(), ID, Next]),
%%					skip;
%%				MID ->
%%					RTask2 = getTaskCfgByID(MID),
%%					modifyMainTask(RTask, RTask2)
%%			end
%%	end.
%%
%%acceptTaskList(TaskList) ->
%%	F =
%%		fun(TaskID) ->
%%			case canAcceptTask(TaskID) of
%%				{true, Task} ->
%%					addNewTask(Task, true),
%%					true;
%%				_ ->
%%					false
%%			end
%%		end,
%%	lists:foreach(F, TaskList).

doAcceptTask(TaskID) ->
	case canAcceptTask(TaskID) of
		{true, Task} ->
			addNewTask(Task, true),
			true;
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode),
			false
	end.

canAcceptTask(TaskID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{type = Type} ->
			%% 主线任务可以直接接
			%% 支线任务个数单独判断，不能超过?TaskAcceptedSideMax
			%% 总任务个数不能超过?TaskAcceptedMax
			{CurSideAccepted, CurAccepted} = getAcceptedTaskCurCount(),
			CanAccept =
				case Type of
					?TaskMainType_Side ->
						CurSideAccepted < ?TaskAcceptedSideMax;
					_ ->
						true
				end,
			case Type =:= ?TaskMainType_Main
				orelse (CanAccept andalso CurAccepted < ?TaskAcceptedMax) of
				true ->
					IsAccepted = isAcceptedTaskByID(TaskID),
					IsCompleted =
						case Type of
							?TaskMainType_Main ->
								isSubmittedTaskByID(TaskID);
							_ ->
								false
						end,
					case IsAccepted =:= false andalso IsCompleted =:= false of
						true ->
							Task = initTask(TaskID),
							case Task of
								#rec_task{} ->
									{true, Task};
								_ ->
									{false, ?ErrorCode_TaskFailed_AcceptFail}
							end;
						_ ->
							{false, ?ErrorCode_TaskFailed_IsExit}
					end;
				_ ->
					?ERROR(
						"canAcceptTask failed_isMax RoleID:~w TaskID:~w CurSideAccepted:~w CurAccepted:~w",
						[playerState:getRoleID(), TaskID, CurSideAccepted, CurAccepted]
					),
					{false, ?ErrorCode_TaskFailed_IsMax}
			end;
		_ ->
			{false, ?ErrorCode_TaskFailed_IsNotExit}
	end.
%% ====================================================================

%%提交完成任务
-spec submitTask(TaskID, Code, PartnerRoleID) -> ok
	when TaskID :: uint(), Code :: uint(), PartnerRoleID :: uint64().
submitTask(TaskID, Code, PartnerRoleID) ->
	case canSubmitTask(TaskID, Code) of
		{true, Task} ->
			%%远程提交任务
			completeTask(Task, PartnerRoleID);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

%% 是否能完成指定任务
-spec canSubmitTask(TaskID :: uint(), Code :: uint()) -> {boolean(), uint()}.
canSubmitTask(TaskID, Code) ->
	#taskCfg{submit_task_npc = NpcID1, type = TaskType} = getTaskCfgByID(TaskID),
	%% LUN-4475 【协议测试】【家族任务】在角色未加入家族情况下，可以使用协议直接发送请求接收家族任务和完成家族任务
	canSubmitTask(TaskID, Code, NpcID1, TaskType).

-spec canSubmitTask(TaskID :: uint(), Code :: uint(), NpcID1 :: uint(), TaskType :: uint()) -> {boolean(), uint()}.
canSubmitTask(TaskID, Code, NpcID1, TaskType) ->
	CanSubmit =
		case TaskType of
			?TaskMainType_Main ->
				%% 主线任务不允许重复提交刷奖励
				not isSubmittedTaskByID(TaskID);
			_ ->
				true
		end,
	case CanSubmit of
		true ->
			case isAcceptedTaskByID(TaskID) of
				true ->
					%%近程提交
					NpcID =
						case TaskType of
							?TaskMainType_Marriage ->
								0;  %%情缘任务忽略距离
							_ ->
								NpcID1
						end,
					case checkNpcDist(NpcID, Code) of
						{true, _} ->
							Task = getTaskFromAcceptedListByID(TaskID),
							case isCanSubmit(Task) of
								true ->
									{true, Task};
								_ ->
									{false, ?ErrorCode_TaskFailed_NotCondition}
							end;
						{false, ErrorCode} ->
							%%此处不能提交任务,返回错误码
							{false, ErrorCode}
					end;
				false ->
					{false, ?ErrorCode_TaskFailed_NotAccept}
			end;
		_ ->
			{false, ?ErrorCode_TaskFailed_Completed}
	end.

%%判断任务个数是否达到提交个数
-spec isCanSubmit(Task) -> boolean() when Task :: term().
isCanSubmit(Task) ->
	case Task of
		#rec_task{taskTargetCur = Cur, taskTargetMax = Max} ->
			Cur >= Max;
		_ ->
			false
	end.
%% ====================================================================

%%创建任务数据
-spec initTask(TaskID) -> undefined | #rec_task{}
	when TaskID :: uint().
initTask(TaskID) when TaskID > 0 ->
	Cfg = getTaskCfgByID(TaskID),
	case Cfg of
		#taskCfg{} ->
			TaskRec = #rec_task{
				roleID = playerState:getRoleID(),
				taskID = Cfg#taskCfg.id,
				taskType = Cfg#taskCfg.type,
				taskSubType = Cfg#taskCfg.sub_type
			},
			initTask_type(Cfg#taskCfg.type, TaskRec, Cfg);
		_E ->
			undefined
	end;
initTask(TaskID) ->
	?ERROR("makeTask taskId:~p", [TaskID]),
	undefined.

%%%-------------------------------------------------------------------
initTask_type(?TaskMainType_Main, TaskRec, Cfg) ->
	initTask_subtype_common(TaskRec, Cfg);
initTask_type(?TaskMainType_EveryDay, TaskRec, Cfg) ->
	initTask_subtype_common(TaskRec, Cfg);
initTask_type(?TaskMainType_Marriage, TaskRec, Cfg) ->
	initTask_subtype_common(TaskRec, Cfg);
initTask_type(?TaskMainType_Link, TaskRec, Cfg) ->
	initTask_subtype_link(TaskRec, Cfg);
initTask_type(_Type, TaskRec, Cfg) ->
	initTask_subtype_common(TaskRec, Cfg).

%%
initTask_subtype_link(TaskRec, _Cfg) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = 0}.

%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{type = ?TaskMainType_Float, sub_type = ?TaskSubType_System, target_conf_params = [_AchieveID]}
) ->
	TaskRec#rec_task{taskKey = ?TaskSubType_System_Sub_Floating, taskTarget = 0, taskTargetMax = 1};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Monster, target_conf = [MonsterID, MonsterNum]}
) ->
	TaskRec#rec_task{taskKey = MonsterID, taskTarget = MonsterID, taskTargetMax = MonsterNum};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_ArunaConvoy, target_conf = [_, _, ArunaConvoyNum]}
) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = ArunaConvoyNum};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_ArunaKillPlayer, target_conf = [KillNum]}
) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = KillNum};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_ArunaSubmitSample, target_conf = [_, SampleValue]}
) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = SampleValue};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Talk, target_conf_params = [0, _]}
) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = 0};

initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Talk, target_conf_params = [NpcDataID, _]}
) ->
	TaskRec#rec_task{taskKey = NpcDataID, taskTarget = NpcDataID, taskTargetMax = 1};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{
		sub_type = ?TaskSubType_CollectItem,
		target_conf = [_ItemID, Num, _RandMin, _RandMax],
		target_conf_params = [CollectionID, _]}
) ->
	TaskRec#rec_task{taskKey = CollectionID, taskTarget = 0, taskTargetMax = Num};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Drop, target_conf = [MonsterID, _ItemID, Num, _Rate]}
) ->
	TaskRec#rec_task{taskKey = MonsterID, taskTarget = 0, taskTargetMax = Num};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_UseItem, target_conf = [ItemID, Num]}
) ->
	TaskRec#rec_task{taskKey = ItemID, taskTarget = ItemID, taskTargetMax = Num};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_CopyMap, target_conf = [CopyMapID]}
) ->
	TaskRec#rec_task{taskKey = CopyMapID, taskTarget = CopyMapID, taskTargetMax = 1};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_MiniCopy, target_conf = [MiniMapID]}
) ->
	TaskRec#rec_task{taskKey = MiniMapID, taskTarget = MiniMapID, taskTargetMax = 1};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Operation, target_conf = [ItemID | _]}
) ->
	TaskRec#rec_task{taskKey = ItemID, taskTarget = ItemID, taskTargetMax = 0};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_CareerChang, target_conf = [ChangeState]}
) ->
	TaskRec#rec_task{taskKey = ChangeState, taskTarget = ChangeState, taskTargetMax = 1};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Active, target_conf = [ActiveID, Num]}
) ->
	TaskRec#rec_task{taskKey = ActiveID, taskTarget = ActiveID, taskTargetMax = Num};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_System, target_conf = [?TaskSubType_System_Sub_Tinker, Quality]}
) ->
	TaskRec#rec_task{taskKey = ?TaskSubType_System_Sub_Tinker, taskTarget = Quality, taskTargetMax = 1};
%%装备精炼 支线
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_System, target_conf = [?TaskSubType_System_Sub_EquipRedefine], target_conf_params = [Num]}
) ->
	RefineList = playerState:getEquipRefine(),
	RefineSuitLevel = playerEquip:getSuitRefineLevel(RefineList),
	TaskRec#rec_task{taskKey = ?TaskSubType_System_Sub_EquipRedefine, taskTarget = ?TaskSubType_System_Sub_EquipRedefine, taskTargetCur = RefineSuitLevel, taskTargetMax = Num};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_System, target_conf = [EventID], target_conf_params = [Num]}
) ->
	TaskRec#rec_task{taskKey = EventID, taskTarget = EventID, taskTargetMax = Num};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Convoy, target_conf = [0, MonsterID, 0, 0]} = Cfg
) ->
	TaskRec#rec_task{taskKey = MonsterID, taskTarget = MonsterID, taskTargetMax = convoyTaskTargetNumber(Cfg)};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Convoy, target_conf = [CopyMapID, MonsterID, _SW, _EW]} = Cfg
) ->
	TaskRec#rec_task{taskKey = CopyMapID, taskTarget = MonsterID, taskTargetMax = convoyTaskTargetNumber(Cfg)};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_HandIn, target_conf = [NeedItemIDOrEquipID, NeedItemCount]}
) ->
	TaskRec#rec_task{taskKey = NeedItemIDOrEquipID, taskTarget = NeedItemIDOrEquipID, taskTargetMax = NeedItemCount};
%%
initTask_subtype_common(TaskRec, TaskCfg) ->
	?ERROR("TaskRec:~p,TaskCfg:~p", [TaskRec, TaskCfg]),
	undefined.


convoyTaskTargetNumber(#taskCfg{target_conf = [CopyMapID, _MonsterID, _SW, _EW]}) when CopyMapID > 0 ->
	1;
convoyTaskTargetNumber(_) ->
	0.
%% ====================================================================

%%保存新接取的任务
-spec addNewTask(TaskAccepted, Notify) -> ok
	when TaskAccepted :: #rec_task{}, Notify :: boolean().
addNewTask(#rec_task{taskID = TaskID} = Task, Notify) ->
	%% 1添加任务
	?DEBUG("addNewTask(~p,~p)", [playerState:getRoleID(), TaskID]),
	NewList = lists:keystore(TaskID,
		#rec_task.taskID,
		playerState:getAcceptedTask(),
		Task),
	playerState:setAcceptedTask(NewList),

	%%2通知client
	case Notify of
		true ->
			playerMsg:sendNetMsg(#pk_GS2U_AcceptTask{
				info = makeMsgInfoFromRec(Task)});
		false ->
			skip
	end,

	%%3保存log
	dbLog:sendSaveLogTask(
		playerState:getRoleID(),
		TaskID,
		playerState:getLevel(),
		?TaskLogAccept),

	onAddNewTask(TaskID),
	addOrDeletePet(TaskID),

	%% 检测是否完成任务
	case checkAchieveIsComplete(getTaskCfgByID(TaskID)) of
		true ->
			%% 立即完成任务
			?DEBUG("addNewTask:~p,~p", [playerState:getRoleID(), TaskID]),
			psMgr:sendMsg2PS(self(), delayDealMsg, {fun playerTask:updateFloatIngTask/1, TaskID});
		_ ->
			ok
	end,
	sync2Ets(),
	ok.

addOrDeletePet(TaskID) ->
	case getCfg:getCfgPStack(cfg_globalsetup, temporary_pet_taskid) of
		#globalsetupCfg{setpara = TaskPetList} ->
			case lists:keyfind(TaskID, 1, TaskPetList) of
				{TaskID, OP, PetID} ->
					case OP of
						1 ->
							%% 获得骑宠并出战上马
							case playerPet:checkPetIsExist(PetID) of
								false ->
									case playerPet:petMake(PetID) of
										false ->
											?ERROR("addOrDeletePet:~p,~p", [playerState:getRoleID(), TaskID]),
											ok;
										_ ->
											playerPet:petOnMount(),
											ok
									end,
									playerMsg:sendNetMsg(#pk_GS2U_AddTempPet{petID = PetID}),
									ok;
								_ -> skip
							end;
						2 ->
							%% 删除骑宠
							playerPet:delPetByID(PetID);
						3 ->
							%% 上马
							playerPet:petSwitch(PetID);
						4 ->
							%% 下马
							playerPet:petOffMount(false);
						_ -> skip
					end;
				_ -> skip
			end;
		[] -> skip
	end,
	ok.

%% ====================================================================
dealTaskBuff(?BuffEventOnAccept, #taskCfg{give_buff = AddBuffList, del_buff = DelBuffList}) ->
	addBuffWithFilter(true, ?BuffEventOnAccept, AddBuffList),
	addBuffWithFilter(false, ?BuffEventOnAccept, DelBuffList),
	ok;

dealTaskBuff(?BuffEventOnSubmit, #taskCfg{give_buff = AddBuffList, del_buff = DelBuffList}) ->
	addBuffWithFilter(true, ?BuffEventOnSubmit, AddBuffList),
	addBuffWithFilter(false, ?BuffEventOnSubmit, DelBuffList),
	ok;
dealTaskBuff(?BuffEventOnDoing, #taskCfg{give_buff = AddBuffList, del_buff = DelBuffList}) ->
	addBuffWithFilter(true, ?BuffEventOnDoing, AddBuffList),
	addBuffWithFilter(false, ?BuffEventOnDoing, DelBuffList),
	ok;
%% 下面两种是特殊情况
dealTaskBuff(?BuffEventOnCancel, #taskCfg{give_buff = AddBuffList}) ->
	addBuffWithFilter(false, ?BuffEventAny, AddBuffList),
	ok;
dealTaskBuff(?BuffEventOnReset, #taskCfg{give_buff = AddBuffList}) ->
	addBuffWithFilter(false, ?BuffEventAny, AddBuffList),
	ok;
dealTaskBuff(_Op, #taskCfg{}) ->
	ok.

addBuffWithFilter(true, EventID, BuffList) when is_list(BuffList) ->
	Level = playerState:getLevel(),
	[playerBuff:addBuff(BuffID, Level) ||
		{Event, BuffID} <- BuffList
		, Event =:= EventID orelse EventID =:= ?BuffEventAny],
	ok;
addBuffWithFilter(false, EventID, BuffList) when is_list(BuffList) ->
	[playerBuff:delBuff(BuffID) ||
		{Event, BuffID} <- BuffList
		, Event =:= EventID orelse EventID =:= ?BuffEventAny],
	ok;
addBuffWithFilter(_IsAdd, _EventID, _BuffList) ->
	ok.


%% ====================================================================
onAddNewTask(TaskID) ->
	#taskCfg{type = TaskType} = Cfg = getTaskCfgByID(TaskID),
	case TaskType of
		?TaskMainType_Marriage ->
			playerDaily:incDailyCounter(?DailyType_MarriageTask, 0);
		_ ->
			skip
	end,
	dealTaskBuff(?TaskLogAccept, Cfg),
	taskTriggerEventImmediately(Cfg),
	IsSubmitted = isSubmittedTaskByID(TaskID),
	playerMainMenu:onFuncIsOpenByMainMenu(?MainMenuType_TaskIDA, TaskID, IsSubmitted),
	ok.
%% ====================================================================
taskTriggerEventImmediately(#taskCfg{sub_type = ?TaskSubType_Convoy, target_conf = [0, _MonsterID, 0, 0]} = Cfg) ->
	triggerEvent(Cfg),
	ok;
taskTriggerEventImmediately(_Cfg) ->
	ok.


%% ====================================================================
triggerEvent(#taskCfg{
	id = TaskID,
	sub_type = ?TaskSubType_Convoy,
	target_conf = [0, MonsterID, 0, 0]
}) ->
	playerConvoy:init(MonsterID, {task, TaskID});
triggerEvent(#taskCfg{
	sub_type = ?TaskSubType_Convoy,
	target_conf = [_CopyMapID, MonsterID, StartWID, EndWID]
}) ->
	playerConvoy:init(MonsterID, {waypoint, StartWID, EndWID});
triggerEvent(_) ->
	skip.

%% ====================================================================

%%NPC检查
checkNpcDist(0, _NpcCode) ->
	{true, 0};
checkNpcDist(NpcDataID, NpcCode) ->
	{X, Y} = playerState:getPos(),
	Npc = playerState:getNpcByCode(NpcCode),
	case Npc of
		notFound ->
			{false, ?ErrorCode_TaskFailed_TooFarFromNpc};
		#recMapObject{id = NpcDataID} ->

			DistSQ = misc:calcDistSquare(X, Y, Npc#recMapObject.x, Npc#recMapObject.y),
			case DistSQ > ?TalkToNpc_Distance * ?TalkToNpc_Distance of
				true ->
					{false, ?ErrorCode_TaskFailed_TooFarFromNpc};
				false ->
					{true, 0}
			end;
		_ ->
			{false, ?ErrorCode_TaskFailed_TooFarFromNpc}
	end.
%% ====================================================================

%%保存新完成的任务
-spec completeTask(TaskAccepted, PartnerRoleID) -> ok
	when TaskAccepted :: #rec_task{}, PartnerRoleID :: uint64().
completeTask(#rec_task{taskID = TaskID, taskType = TaskType}, PartnerRoleID) ->
	?DEBUG("completeTask(~p,~p)", [playerState:getRoleID(), TaskID]),
	try
		catch onCompleteTask(getTaskCfgByID(TaskID)),

		%%漂浮只石
		playerFloatingManual:updateFloating({TaskType, TaskID}),
		IsSubmitted = isSubmittedTaskByID(TaskID),
		addSubmittedTask(TaskID),
		deleteTask(TaskID, ?TaskLogSubmit),
		playerMainMenu:onFuncIsOpenByMainMenu(?MainMenuType_TaskIDS, TaskID, IsSubmitted),
		giveTaskAward(TaskID, PartnerRoleID),
%%		playerGoddess:autoActiveCard(TaskID),
		%% 本处暂时没有屏蔽，如果策划配置错误，则可能出现死循环
		playerAchieve:achieveEvent(?Achieve_Task, [1]),
		%%如果是日常任务，则自动接取下一个任务
		playerLoopTask:onTaskComplete(TaskType, TaskID),
		playerSideTask:onTaskComplete(TaskType, TaskID),
%%		playerWing:needInitWingLevel(playerState:getLevel()),
%%		if
%%			TaskSubType =:= ?TaskSubType_ArunaConvoy;
%%			TaskSubType =:= ?TaskSubType_ArunaKillPlayer;
%%			TaskSubType =:= ?TaskSubType_ArunaSubmitSample ->
%%				playerSevenDayAim:updateCondition(?SevenDayAim_Aruna, []);
%%			true ->
%%				skip
%%		end,

		case TaskType of
			?TaskMainType_Aruna ->
			playerSevenDayAim:updateCondition(?SevenDayAim_Aruna, []);
			?TaskMainType_Exp ->
                playerliveness:onFinishLiveness(?LivenessExpTask, 1);
			_ ->
				skip
		end,
		ok
	catch
		_ : Error ->
			?ERROR("RoleID:~w,PartnerRoleID:~w,TaskID:~w,Error:~p", [playerState:getRoleID(), PartnerRoleID, TaskID, Error])
	end,
	%%添加任务完成log
	addNextTask(TaskID),
	sync2Ets(),
	ok.

addNextTask(TaskID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{auto_next = L} when is_list(L) ->
			[doAcceptTask(NextTask) || NextTask <- L, NextTask > 0];
		_ ->
			skip
	end.

checkAchieveIsComplete(#taskCfg{type = ?TaskMainType_Float, target_conf_params = [AchieveID]}) ->
	case playerAchieve:isCompleteAchieve(AchieveID) of
		true -> true;
		_ -> false
	end;
checkAchieveIsComplete(_TaskConfig) ->
	false.

onCompleteTask(#taskCfg{id = TaskID, type = Type, sub_type = SubType}) ->
	case SubType of
		?TaskSubType_Convoy ->
			playerConvoy:convoySuccess();
		_ ->
			skip
	end,
	case Type of
		?TaskMainType_Hunt ->
			playerLifeSkill:onFinishHuntTask(TaskID);
		_ ->
			skip
	end,
	ok;
onCompleteTask(_) ->
	skip.

%% ====================================================================
%%添加提交任务
-spec addSubmittedTask(TaskID) -> ok when TaskID :: uint16().
addSubmittedTask(TaskID) ->
	justSetSubmittedTask(TaskID),
	playerMsg:sendNetMsg(#pk_GS2U_AddNewCompleteTask{taskID = TaskID, result = 1}),
	ok.

%% ====================================================================
deleteTask(TaskID, Reason) ->
	L = lists:keydelete(TaskID, #rec_task.taskID, playerState:getAcceptedTask()),
	playerState:setAcceptedTask(L),
	playerMsg:sendNetMsg(#pk_GS2U_DeleteAcceptTask{
		taskID = TaskID, result = Reason}),
	%%添加任务完成log
	dealTaskBuff(Reason, getTaskCfgByID(TaskID)),
	dbLog:sendSaveLogTask(playerState:getRoleID(), TaskID, playerState:getLevel(), Reason).

%% ====================================================================
%%任务奖励
-spec giveTaskAward(TaskID, PartnerRoleID) -> ok
	when TaskID :: uint(), PartnerRoleID :: uint64()|0.
giveTaskAward(TaskID, PartnerRoleID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{
			reward_exp = Exp,
			reward_coins = CoinList,
			reward_item = RewardItemList,
			reward_equips = RewardEquipList,
			reward_spcials = SpecialList,
			type = Type
		} ->
			%% 判断是否为家族任务进行添加七日大奖计数
			case Type of
				?TaskMainType_EveryDay ->
					playerSevenDayAim:updateCondition(?SevenDayAim_GuildDailyTaskTimes, []);
					_ ->
					skip
			end,

			%%奖励经验(策划可能会不填，不填则表示不奖励)
			case erlang:is_integer(Exp) andalso Exp > 0 of
				true ->
					playerBase:addExp(Exp, ?ExpSourceTask, TaskID);
				_ ->
					skip
			end,
			rewardCoin(TaskID, CoinList),
			rewardItem(TaskID, RewardItemList),
			rewardEquip(TaskID, RewardEquipList),
			rewardSpecial(TaskID, SpecialList, PartnerRoleID),
			ok;
		_ ->
			skip
	end,
	ok.

rewardCoin(TaskID, CoinList) when is_list(CoinList) ->
	Fun =
		fun({CoinType, CoinNumber}) ->
			case CoinType of
				?CoinTypeDiamond ->
					?ERROR("taskID:~p, reward unbind diamond", [TaskID]);
				_ ->
					playerMoney:addCoin(abs(CoinType), CoinNumber,
						#recPLogTSMoney{
							reason = ?CoinSourceTask,
							param = TaskID,
							target = ?PLogTS_PlayerSelf,
							source = ?PLogTS_Task
						}
					)
			end
		end,
	lists:foreach(Fun, CoinList);
rewardCoin(_, _) -> skip.

rewardItem(TaskID, RewardItemList) when is_list(RewardItemList) ->

	Fun = fun({ItemID, ItemNum}) ->
		case erlang:is_integer(ItemID) andalso ItemNum > 0 of
			true ->
				PLog = #recPLogTSItem{
					old = 0,
					new = ItemNum,
					change = ItemNum,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_Task,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceTask,
					reasonParam = TaskID
				},
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, PLog);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, RewardItemList);
rewardItem(_, _) -> skip.
%%装备奖励处理函数
rewardEquip(TaskID, RewardList) when is_list(RewardList) ->
	PlayerCareer = playerState:getCareer(),
	Fun = fun({EquipCareer, EquipID}) ->
		case PlayerCareer =:= EquipCareer orelse EquipCareer =:= 0 of
			true ->
				Quality = playerPackage:getQualityFromCfg(EquipID),
				playerPackage:addGoodsAndMail(EquipID, 1, true, Quality,
					#recPLogTSItem{
						old = 0,
						new = 1,
						change = 1,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_Task,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourceTask,
						reasonParam = TaskID
					});
			false ->
				skip
		end
	      end,
	lists:foreach(Fun, RewardList),
	ok;
rewardEquip(_, _) -> skip.

rewardSpecial(_TaskID, SpecialList, PartnerRoleID) when is_list(SpecialList) ->
	lists:foreach(
		fun(Params) ->
			rewardSpecial1(Params, PartnerRoleID)
		end, SpecialList);
rewardSpecial(_, _, _) -> skip.

rewardSpecial1({?TaskReward_SPT_Buff, _P1, _P2}, _PartnerRoleID) ->
	ok;
rewardSpecial1({?TaskReward_SPT_Liveness, _P1, Value}, _PartnerRoleID) ->
	playerliveness:addTotalLivenessValue(Value);
rewardSpecial1({?TaskReward_SPT_MarriageCloseness, _P1, _Value}, 0) ->
	?ERROR("?TaskReward_SPT_MarriageCloseness PartnerRoleID is 0");
rewardSpecial1({?TaskReward_SPT_MarriageCloseness, _P1, Value}, PartnerRoleID) ->
	%% LUN-4100 【情缘任务】完成一个情缘任务后，玩家实际亲密度增加值是配置表中的2倍
	%% 排查原因：情缘任务的实现方式为，伴侣双方各领取、完成同样的任务，但增加亲密度时，必须是双方一起增加
	%% 解决方法：仅在队长提交任务时处理增加亲密度
	RoleID = playerState:getRoleID(),
	case gsTeamInterface:isTeamLeader(RoleID) of
		true ->
			?DEBUG("[DebugForMarriage] RoleID:~w Task Reward Value:~w with PartnerRoleID:~w", [RoleID, Value, PartnerRoleID]),
			playerMarriage:closenessAdd({RoleID, PartnerRoleID, Value, ?ClosenessSource_MarriageTask});
		_ ->
			skip
	end;
rewardSpecial1({?TaskReward_SPT_GuildResource, _P1, Value}, _PartnerRoleID) ->
	%% LUNA-2897 [服务器][每日任务（公会的委托）]每日任务移动到家族中改为家族任务
	%% 新增家族资金奖励，仅在有家族时有效
	case playerState:getGuildID() of
		0 ->
			skip;
		GuildID ->
			playerGuild:addguildresource(GuildID, Value)
	end;
rewardSpecial1({?TaskReward_SPT_GuildLiveness, _P1, Value}, _PartnerRoleID) ->
	%% LUNA-3155 【服务器】【家族任务（原每日任务）】增加单次任务与十环奖励家族活跃配置
	%% 新增家族活跃奖励，仅在有家族时有效
	case playerState:getGuildID() of
		0 ->
			skip;
		GuildID ->
			playerGuild:addguildliveness(GuildID, Value)
	end;
rewardSpecial1({?TaskReward_SPT_Contribution, _P1, Contribution}, _PartnerRoleID) ->
	playerAruna:submitSamplePoint(0, Contribution),
	ok;
rewardSpecial1({_P0, _P1, _P2}, _PartnerRoleID) ->
	ok.

%-----------------------------------------------------------------------------
makeMsgInfoFromRec(#rec_task{
	taskID = ID,
	taskTarget = Target,
	taskTargetCur = Cur,
	taskTargetMax = Max
}) ->
	#pk_taskInfo{taskID = ID, target = Target, curNumber = Cur, maxNumber = Max}.

%-----------------------------------------------------------------------------

%%根据任务ID获取任务配置
-spec getTaskCfgByID(TaskID) -> undefined | #taskCfg{}
	when TaskID :: uint().
getTaskCfgByID(TaskID) ->
	case getCfg:getCfgPStack(cfg_task, TaskID) of
		#taskCfg{} = TaskCfg ->
			TaskCfg;
		_ ->
			undefined
	end.

%%当前已接取任务数量
-spec getAcceptedTaskCurCount() -> {non_neg_integer(), non_neg_integer()}.
getAcceptedTaskCurCount() ->
	FunFind =
		fun(#rec_task{taskID = TaskID}, {SideCount, Count} = Result) ->
			case getTaskCfgByID(TaskID) of
				#taskCfg{type = ?TaskMainType_Side} ->
					{SideCount + 1, Count + 1};
				#taskCfg{} ->
					{SideCount, Count + 1};
				_ ->
					Result
			end
		end,
	lists:foldl(FunFind, {0, 0}, playerState:getAcceptedTask()).

%%是否已接取某个任务
-spec isAcceptedTaskByID(TaskID) -> boolean()
	when TaskID :: non_neg_integer().
isAcceptedTaskByID(TaskID) ->
	AcceptedTask = playerState:getAcceptedTask(),
	case lists:keyfind(TaskID, #rec_task.taskID, AcceptedTask) of
		#rec_task{} ->
			true;
		_ ->
			false
	end.

%%是否已完成某个任务
-spec isSubmittedTaskByID(TaskID) -> boolean()
	when TaskID :: non_neg_integer().
isSubmittedTaskByID(TaskID) ->
	CompletedTask = playerState:getSubmittedTask(),
	Slot = TaskID div 64,
	case lists:keyfind(Slot, 1, CompletedTask) of
		{Slot, V} ->
			Mod = TaskID rem 64,
			(V band (1 bsl Mod)) > 0;
		_ ->
			false
	end.

%%从接取列表中取出指定的任务
-spec getTaskFromAcceptedListByID(TaskID) -> #rec_task{} | undefined
	when TaskID :: non_neg_integer().
getTaskFromAcceptedListByID(TaskID) ->
	AcceptedTask = playerState:getAcceptedTask(),
	case lists:keyfind(TaskID, #rec_task.taskID, AcceptedTask) of
		#rec_task{} = V ->
			V;
		_ ->
			undefined
	end.

getCollectObjectIDByCode(Code) ->
	CollectItemEts = playerState:getMapCollectEts(),
	case myEts:lookUpEts(CollectItemEts, Code) of
		[#recMapObject{id = ObjectID} | _] ->
			ObjectID;
		_ ->
			0
	end.

%% v3.0.0屏蔽旧版补偿
%% give3
%% 修复丢失的已完成主线任务状态
%%-spec fixCompletedMainTask() -> no_return().
%%fixCompletedMainTask() ->
%%	%% 获取已领取的主线任务（可能因异常有多个）
%%	ListAcceptedTask = playerState:getAcceptedTask(),
%%	ListAcceptedMainTaskID = [TaskID || #rec_task{taskID = TaskID, taskType = Type} <- ListAcceptedTask, Type =:= ?TaskMainType_Main],
%%	%% 从起始任务开始，设置任务为完成状态，直到遍历到已领取的主线任务中的最后的任务
%%	setSubmittedTask(ListAcceptedMainTaskID, ?FirstTaskID).
%%
%%%% 遍历强制设置任务为完成状态
%%-spec setSubmittedTask(ListAcceptedMainTaskID :: [uint16(), ...], TaskIDCur :: uint16()) -> no_return().
%%setSubmittedTask(_, 0) ->
%%	error;    %% 任务ID异常，遍历被迫结束
%%setSubmittedTask([], _TaskIDCur) ->
%%	skip;    %% 没有已领取的主线任务，跳过
%%setSubmittedTask([TaskID], TaskID) ->
%%	ok;        %% 仅剩一个已领取的主线任务，且与遍历到的任务ID相同，则遍历结束
%%setSubmittedTask(ListAcceptedMainTaskID, TaskIDCur) ->
%%	%% 首先标记遍历到的任务未提交状态
%%	justSetSubmittedTask(TaskIDCur),
%%	%% 如果遍历到的任务是已领取的任务，则假装完成了该任务
%%	ListAcceptedMainTaskIDNew =
%%		case lists:member(TaskIDCur, ListAcceptedMainTaskID) of
%%			true ->
%%				ListAcceptedTask = lists:keydelete(TaskIDCur, #rec_task.taskID, playerState:getAcceptedTask()),
%%				playerState:setAcceptedTask(ListAcceptedTask),
%%				dbLog:sendSaveLogTask(playerState:getRoleID(), TaskIDCur, playerState:getLevel(), ?TaskLogSubmit),
%%				lists:delete(TaskIDCur, ListAcceptedMainTaskID);
%%			_ ->
%%				ListAcceptedMainTaskID
%%		end,
%%	%% 最后根据下一个主线任务ID继续遍历
%%	TaskIDNext =
%%		case getCfg:getCfgPStack(cfg_task, TaskIDCur) of
%%			#taskCfg{auto_next = NextList} ->
%%				getNextMainTask(NextList);
%%			_ ->
%%				0
%%		end,
%%	setSubmittedTask(ListAcceptedMainTaskIDNew, TaskIDNext).



sync2Ets() ->
	playerSave:saveAcceptedTaskList(),

	%% 定时保存重要数据 FIXME 这个一定要放在最后处理
	ets:update_element(
		ets_rec_playerdata, playerState:getRoleID(),
		[
			{#rec_playerdata.rec_task_accepted, playerState2:getPlayerDataElement(#rec_playerdata.rec_task_accepted)},
			{#rec_playerdata.rec_task_submitted, playerState2:getPlayerDataElement(#rec_playerdata.rec_task_submitted)}
		]
	),
	ok.



%%%%	fixMainTask/0,			%% 由于补偿1和2仅会有效执行1次，若玩家持续丢失主线任务，则由此发起在上线后延时处理补偿
%%%%	onFixMainTask/1			%% 响应fixMainTask/0发起的延时事件
%%%%	onFixAcceptMainTask/2	%% 在fixMainTask/0和playerSave:saveAcceptedTaskList/0中执行，以期在上线、下线时修复主线任务数据
%%-spec fixMainTask() -> no_return().
%%fixMainTask() ->
%%	case core:isCross() of
%%		false ->
%%			%% 客户端会将两次收到的已领取任务列表叠加起来，所以需要传入旧有的列表进行排除
%%			ListAcceptedTask = playerState:getAcceptedTask(),
%%			erlang:send_after(500, self(), {fixMainTask, ListAcceptedTask});
%%		_ ->
%%			skip
%%	end.
%%-spec onFixMainTask(List::list()) -> no_return().
%%onFixMainTask(List) ->
%%	case core:isCross() of
%%		false ->
%%			onFixAcceptMainTask(true, List);
%%		_ ->
%%			skip
%%	end.
%%-spec onFixAcceptMainTask(OnlineOrOffline::boolean(), ListAcceptedTaskOld::list()) -> no_return().
%%onFixAcceptMainTask(OnlineOrOffline, _ListAcceptedTaskOld) ->
%%	?DEBUG("[DebugForFixTask] onFixAcceptMainTask Level:~w OnlineOrOffline:~w", [playerState:getLevel(),OnlineOrOffline]),
%%	ListAcceptedTask = playerState:getAcceptedTask(),
%%	ListAcceptedMainTaskID = [TaskID || #rec_task{taskID = TaskID, taskType = Type} <- ListAcceptedTask, Type =:= ?TaskMainType_Main],
%%	#taskCfg{auto_next = AutoNext} = CfgFirst = getCfg:getCfgByKey(cfg_task, ?FirstTaskID),
%%	onFixAcceptMainTask(ListAcceptedMainTaskID, CfgFirst, CfgFirst, playerState:getLevel()),
%%	%%case OnlineOrOffline of	%% 已修改为上线同步列表前执行，故此处不再发送消息
%%	%%	true ->
%%	%%		%% 仅上线流程中再次同步列表
%%	%%		ListAcceptedTaskNew = playerState:getAcceptedTask(),
%%	%%		FunDel =
%%	%%			fun(#rec_task{taskID = ID}, Acc) ->
%%	%%				lists:keydelete(ID, #rec_task.taskID, Acc)
%%	%%			end,
%%	%%		ListAcceptedTaskNewNew = lists:foldl(FunDel, ListAcceptedTaskNew, ListAcceptedTaskOld),
%%	%%		playerTask:sendAllCompleteTaskMsg(),
%%	%%		InfoList = [makeMsgInfoFromRec(Task) || Task <- ListAcceptedTaskNewNew],
%%	%%		playerMsg:sendNetMsg(#pk_GS2U_TaskList{list = InfoList});	%% 客户端对该消息是叠加而不是覆盖，故此处排除掉传入的id
%%	%%	_ ->
%%	%%		skip
%%	%%end,
%%	%% 20180418补充：如果已接受任务列表中没有9~11任务，则删除任务骑宠飞空艇（50101）
%%	ListAcceptedTaskNew = playerState:getAcceptedTask(),
%%	FunCheck =
%%		fun
%%			(#rec_task{taskID = 9}) -> true;
%%			(#rec_task{taskID = 10}) -> true;
%%			(#rec_task{taskID = 11}) -> true;
%%			(_) -> false
%%		end,
%%	case lists:any(FunCheck, ListAcceptedTaskNew) of
%%		true ->
%%			skip;
%%		_ ->
%%			playerPet:delPetByID(50101)
%%	end,
%%	%% 20180419补充：修复漂浮之石相关任务状态
%%	fixFloatingSubTask(AutoNext),
%%	playerFloatingManual:checkUnlockNow(),
%%	ok.
%%
%%-spec onFixAcceptMainTask(ListAcceptedMainTaskID :: [uint16(), ...], CfgCur :: #taskCfg{}, CfgLast :: #taskCfg{}, Level :: uint16()) -> no_return().
%%%% 没有已领取的主线任务，则使用第一个等级超过自己等级的任务作为主线任务
%%%% 判定上一个主线任务是否完成，如果已完成则领取当前遍历到的主线任务，如果未完成则领取上一个主线任务
%%%% 结束遍历
%%onFixAcceptMainTask(
%%	[],
%%	#taskCfg{level_limit = LevelLimit} = CfgCur,
%%	#taskCfg{id = TaskIDLast} = CfgLast,
%%	Level
%%) when LevelLimit > Level ->
%%	?DEBUG("[DebugForFixTask] onFixAcceptMainTask Level:~w Cur:~w Last:~w", [Level, CfgCur#taskCfg.id, TaskIDLast]),
%%	CfgNeed =
%%		case isSubmittedTaskByID(TaskIDLast) of
%%			true ->
%%				CfgCur;
%%			_ ->
%%				CfgLast
%%		end,
%%	Task = initTask_type(
%%		CfgNeed#taskCfg.type,
%%		#rec_task{
%%			roleID = playerState:getRoleID(),
%%			taskID = CfgNeed#taskCfg.id,
%%			taskType = CfgNeed#taskCfg.type,
%%			taskSubType = CfgNeed#taskCfg.sub_type
%%		},
%%		CfgNeed
%%	),
%%	addNewTask(Task, false);
%%
%%%% 没有已领取的主线任务，遍历结果是转职任务（1000）
%%%% 标记上一个任务未完成状态；如果自己是基础职业，则需要领取转职任务（1000），然后结束遍历
%%%% 如果自己不是基础职业，则继续遍历
%%onFixAcceptMainTask(
%%	[],
%%	#taskCfg{id = 1000, auto_next = AutoNext} = CfgCur,
%%	#taskCfg{id = TaskIDLast},
%%	Level
%%) ->
%%	?DEBUG("[DebugForFixTask] onFixAcceptMainTask Level:~w Cur:~w Last:~w", [Level, CfgCur#taskCfg.id, TaskIDLast]),
%%	justSetSubmittedTask(TaskIDLast),
%%	case ?Career2CareerStage(playerState:getCareer()) of
%%		0 ->
%%			addNewTask(initTask(1000), false);
%%		_ ->
%%			TaskIDNext = getNextMainTask(AutoNext),
%%			onFixAcceptMainTask([], getCfg:getCfgByKey(cfg_task, TaskIDNext), CfgCur, Level)
%%	end;
%%
%%%% 没有已领取的主线任务，遍历结果是任务元素
%%%% 标记上一个任务未完成状态
%%%% 继续遍历
%%onFixAcceptMainTask(
%%	[],
%%	#taskCfg{auto_next = AutoNext} = CfgCur,
%%	#taskCfg{id = TaskIDLast},
%%	Level
%%) ->
%%	?DEBUG("[DebugForFixTask] onFixAcceptMainTask Level:~w Cur:~w Last:~w", [Level, CfgCur#taskCfg.id, TaskIDLast]),
%%	justSetSubmittedTask(TaskIDLast),
%%	TaskIDNext = getNextMainTask(AutoNext),
%%	onFixAcceptMainTask([], getCfg:getCfgByKey(cfg_task, TaskIDNext), CfgCur, Level);
%%
%%%% 没有已领取的主线任务，但遍历到了非任务元素，则认为已经遍历到了尽头
%%%% 判定上一个主线任务是否完成，如果已完成则忽略，否则领取上一个主线任务
%%%% 结束遍历
%%onFixAcceptMainTask(
%%	[],
%%	_CfgCur,
%%	#taskCfg{id = TaskIDLast} = CfgLast,
%%	_Level
%%) ->
%%	?DEBUG("[DebugForFixTask] onFixAcceptMainTask Level:~w Cur:~w Last:~w", [_Level, _CfgCur, TaskIDLast]),
%%	case isSubmittedTaskByID(TaskIDLast) of
%%		true ->
%%			skip;
%%		_ ->
%%			Task = initTask_type(
%%				CfgLast#taskCfg.type,
%%				#rec_task{
%%					roleID = playerState:getRoleID(),
%%					taskID = CfgLast#taskCfg.id,
%%					taskType = CfgLast#taskCfg.type,
%%					taskSubType = CfgLast#taskCfg.sub_type
%%				},
%%				CfgLast
%%			),
%%			addNewTask(Task, false)
%%	end;
%%
%%%% 存在唯一已领取的主线任务，与遍历到的任务相同
%%%% 遍历结束
%%onFixAcceptMainTask(
%%	[TaskID],
%%	#taskCfg{id = TaskID},
%%	_CfgLast,
%%	_Level
%%) ->
%%	?DEBUG("[DebugForFixTask] onFixAcceptMainTask Level:~w Cur:~w Last:~w LAMT:~w", [_Level, TaskID, _CfgLast#taskCfg.id, [TaskID]]),
%%	ok;
%%
%%%% 存在唯一已领取的主线任务，与遍历到的任务不同
%%%% 标记遍历到的任务为完成状态
%%%% 继续遍历
%%onFixAcceptMainTask(
%%	ListAcceptedMainTaskID,
%%	#taskCfg{id = TaskIDCur, auto_next = AutoNext} = CfgCur,
%%	_CfgLast,
%%	Level
%%) when erlang:length(ListAcceptedMainTaskID) =:= 1 ->
%%	?DEBUG("[DebugForFixTask] onFixAcceptMainTask Level:~w Cur:~w Last:~w LAMT:~w", [Level, TaskIDCur, _CfgLast#taskCfg.id, ListAcceptedMainTaskID]),
%%	justSetSubmittedTask(TaskIDCur),
%%	TaskIDNext = getNextMainTask(AutoNext),
%%	onFixAcceptMainTask(ListAcceptedMainTaskID, getCfg:getCfgByKey(cfg_task, TaskIDNext), CfgCur, Level);
%%
%%%% 存在多个已领取的主线任务
%%%% 判断当前任务是否在已领取的主线任务中，若不是则标记其为完成状态
%%%% 继续遍历
%%onFixAcceptMainTask(
%%	ListAcceptedMainTaskID,
%%	#taskCfg{id = TaskIDCur, auto_next = AutoNext} = CfgCur,
%%	_CfgLast,
%%	Level
%%) ->
%%	?DEBUG("[DebugForFixTask] onFixAcceptMainTask Level:~w Cur:~w Last:~w LAMT:~w", [Level, TaskIDCur, _CfgLast#taskCfg.id, ListAcceptedMainTaskID]),
%%	ListAcceptedMainTaskIDNew =
%%		case lists:member(TaskIDCur, ListAcceptedMainTaskID) of
%%			false ->
%%				justSetSubmittedTask(TaskIDCur),
%%				ListAcceptedMainTaskID;
%%			_ ->
%%				lists:delete(TaskIDCur, ListAcceptedMainTaskID)
%%		end,
%%	TaskIDNext = getNextMainTask(AutoNext),
%%	onFixAcceptMainTask(ListAcceptedMainTaskIDNew, getCfg:getCfgByKey(cfg_task, TaskIDNext), CfgCur, Level);
%%
%%%% 存在1个或多个任务已领取的主线任务，遍历结果不是任务元素
%%%% 遍历结束
%%%% 结束遍历
%%onFixAcceptMainTask(
%%	_ListAcceptedMainTaskID,
%%	_CfgCur,
%%	_CfgLast,
%%	_Level
%%) ->
%%	ok.

%% internal:仅标记任务为完成状态，不做通知
justSetSubmittedTask(TaskID) ->
	Slot = TaskID div 64,
	Mod = TaskID rem 64,
	L = playerState:getSubmittedTask(),
	V = case lists:keyfind(Slot, 1, L) of
			{Slot, Value} ->
				Value;
			_ ->
				0
		end,
	V1 = V bor (1 bsl Mod),
	L1 = lists:keystore(Slot, 1, L, {Slot, V1}),
	playerState:setSubmittedTask(L1).

%%%% 修复漂浮之石相关支线任务
%%%% 王仕宇确认，除了引导类任务，支线任务的来源都是主线任务或其它支线任务
%%%% 则，根据任务树，对已完成的任务刷新漂浮之石，以期修复以前任务丢失导致的漂浮之石阻断
%%%% 注：playerFloatingManual:updateFloating/2的执行应包含主线任务
%%-spec fixFloatingSubTask(ListTaskID::[uint16(), ...]) -> no_return().
%%fixFloatingSubTask(undefined) ->
%%	ok;
%%fixFloatingSubTask([]) ->
%%	ok;
%%fixFloatingSubTask([TaskID | T]) ->
%%	case getCfg:getCfgByKey(cfg_task, TaskID) of
%%		#taskCfg{type = ?TaskMainType_Main, auto_next = AutoNext} ->
%%			case playerTask:isSubmittedTaskByID(TaskID) of
%%				true ->
%%					fixFloatingSubTask(AutoNext);
%%				_ ->
%%					skip
%%			end;
%%		#taskCfg{type = ?TaskMainType_Float, auto_next = AutoNext} ->
%%			case playerTask:isSubmittedTaskByID(TaskID) of
%%				true ->
%%					%% 若已完成该任务，则刷新漂浮之石数据，并继续遍历
%%					playerFloatingManual:updateFloating({?TaskMainType_Float, TaskID}, false),
%%					fixFloatingSubTask(AutoNext);
%%				_ ->
%%					%% 否则检查是否领取了该任务，没有则领取
%%					case isAcceptedTaskByID(TaskID) of
%%						false ->
%%							addNewTask(initTask(TaskID), false);
%%						_ ->
%%							skip
%%					end
%%			end;
%%		#taskCfg{auto_next = AutoNext} ->
%%			fixFloatingSubTask(AutoNext);
%%		_ ->
%%			skip
%%	end,
%%	fixFloatingSubTask(T).
%%
%%%% internal:仅标记任务为未完成状态，不做通知
%%justSetNotSubmittedTask(TaskID) ->
%%	Slot = TaskID div 64,
%%	Mod = TaskID rem 64,
%%	L = playerState:getSubmittedTask(),
%%	V = case lists:keyfind(Slot, 1, L) of
%%			{Slot, Value} ->
%%				Value;
%%			_ ->
%%				0
%%		end,
%%	Mark = 1 bsl Mod,
%%	case V band Mark > 0 of
%%		true ->
%%			V1 = V bxor Mark,
%%			L1 = lists:keystore(Slot, 1, L, {Slot, V1}),
%%			playerState:setSubmittedTask(L1);
%%		_ ->
%%			skip
%%	end.


%% v3.0.0屏蔽旧版补偿
%% give6
%%%% LUN-8021
%%%% 修复同时存在多个主线任务产生的异常逻辑
%%-spec fixMultiMainTask() -> no_return().
%%fixMultiMainTask() ->
%%	%% 获取当前主线任务列表
%%	ListAcceptedTask = playerState:getAcceptedTask(),
%%	ListAcceptedMainTaskID = [TaskID || #rec_task{taskID = TaskID, taskType = Type} <- ListAcceptedTask, Type =:= ?TaskMainType_Main],
%%	%% 如果含有第一个转职任务，则删除其它主线任务，再执行修复
%%	Length = erlang:length(ListAcceptedMainTaskID),
%%	case lists:member(1000, ListAcceptedMainTaskID) andalso Length > 1 of
%%		true ->
%%			FunDel =
%%				fun(TaskID, Acc) ->
%%					lists:keydelete(TaskID, #rec_task.taskID, Acc)
%%				end,
%%			ListAcceptedMainTaskID1 = lists:delete(1000, ListAcceptedMainTaskID),
%%			ListAcceptedTask1 = lists:foldl(FunDel, ListAcceptedTask, ListAcceptedMainTaskID1),
%%			playerState:setAcceptedTask(ListAcceptedTask1),
%%			fixMultiMainTask(1000, 1, [1000], true);
%%		_ ->
%%			fixMultiMainTask(?FirstTaskID, Length, ListAcceptedMainTaskID, lists:member(?FirstTaskID, ListAcceptedMainTaskID))
%%	end.
%%%% IsAfter：TaskIDCur是否是ListAcceptedMainTaskID中最后一个主线任务或更后面的主线任务，如果是，则需要标记为未完成
%%-spec fixMultiMainTask(TaskIDCur::uint16(), LengthOfLAMT::uint(), ListAcceptedMainTaskID::[uint16(), ...], IsAfter::boolean()) -> no_return().
%%fixMultiMainTask(0, _, _, _) ->
%%	ok;		%% 遍历结束
%%fixMultiMainTask(_, 0, _, _) ->
%%	skip;	%% 没有正在进行的主线任务，忽略
%%fixMultiMainTask(TaskIDCur, 1, ListAcceptedMainTaskID, true) ->
%%	%% 仅领取了一个主线任务时
%%	%% 遍历到的任务是已领取任务或已领取任务后面的任务
%%	%% 标记后面的主线任务为未完成状态，以便流程通畅
%%	justSetNotSubmittedTask(TaskIDCur),
%%	#taskCfg{auto_next = AutoNext} = getTaskCfgByID(TaskIDCur),
%%	TaskIDNext = getNextMainTask(AutoNext),
%%	fixMultiMainTask(TaskIDNext, 1, ListAcceptedMainTaskID, true);
%%fixMultiMainTask(TaskIDCur, 1, ListAcceptedMainTaskID, false) ->
%%	%% 仅领取了一个主线任务时
%%	%% 遍历到的任务不是已领取任务或已领取任务后面的任务
%%	%% 继续遍历
%%	#taskCfg{auto_next = AutoNext} = getTaskCfgByID(TaskIDCur),
%%	TaskIDNext = getNextMainTask(AutoNext),
%%	fixMultiMainTask(TaskIDNext, 1, ListAcceptedMainTaskID, lists:member(TaskIDNext, ListAcceptedMainTaskID));
%%fixMultiMainTask(TaskIDCur, Length, ListAcceptedMainTaskID, _IsAfter) ->
%%	%% 领取了多个主线任务时
%%	%% 遍历到的任务已经领取，则标记为完成
%%	%% 继续遍历
%%	#taskCfg{auto_next = AutoNext} = getTaskCfgByID(TaskIDCur),
%%	TaskIDNext = getNextMainTask(AutoNext),
%%	case lists:member(TaskIDCur, ListAcceptedMainTaskID) of
%%		true ->
%%			ListAcceptedTask = lists:keydelete(TaskIDCur, #rec_task.taskID, playerState:getAcceptedTask()),
%%			playerState:setAcceptedTask(ListAcceptedTask),
%%			ListAcceptedMainTaskIDNew = lists:delete(TaskIDCur, ListAcceptedMainTaskID),
%%			fixMultiMainTask(TaskIDNext, erlang:length(ListAcceptedMainTaskIDNew), ListAcceptedMainTaskIDNew, lists:member(TaskIDNext, ListAcceptedMainTaskIDNew));
%%		_ ->
%%			fixMultiMainTask(TaskIDNext, Length, ListAcceptedMainTaskID, lists:member(TaskIDNext, ListAcceptedMainTaskID))
%%	end.


%% v3.0.0屏蔽旧版补偿
%% give7
%%%% LUN-8030
%%-spec fixAchieveTaskIsComplete() -> no_return().
%%fixAchieveTaskIsComplete() ->
%%	fixAchieveTaskIsComplete(playerState:getAcceptedTask()).
%%fixAchieveTaskIsComplete([]) ->
%%	ok;
%%fixAchieveTaskIsComplete([#rec_task{taskID = TaskID, taskType = ?TaskMainType_Float} = Task | T]) ->
%%	case getTaskCfgByID(TaskID) of
%%		#taskCfg{target_conf_params = [AchieveID]} ->
%%			case playerAchieve:isCompleteAchieve(AchieveID) of
%%				true ->
%%					updateTask2ForFix(Task, 1);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end,
%%	fixAchieveTaskIsComplete(T);
%%fixAchieveTaskIsComplete([_H | T]) ->
%%	fixAchieveTaskIsComplete(T).
%%updateTask2ForFix(
%%	#rec_task{
%%		taskID = TaskID,
%%		taskTargetCur = Cur
%%	} = Task, Count
%%) ->
%%	case canAddPlus(TaskID) of
%%		true ->
%%			NewCur = Cur + Count,
%%			NewTask = Task#rec_task{taskTargetCur = NewCur},
%%			L1 = playerState:getAcceptedTask(),
%%			L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
%%			playerState:setAcceptedTask(L2),
%%			ok;
%%		_ ->
%%			0
%%	end.

%%%-------------------------------------------------------------------
%% 刷新经验环任务
-spec updateExpTask() -> no_return().
updateExpTask() ->
	?DEBUG(
		"[DebugForExpTask] updateExpTask RoleID:~w",
		[playerState:getRoleID()]
	),
	RetMainMenu = playerMainMenu:isOpen(?ModeType_Task),
	RetCountCfg = updateExpTask_countCfg(RetMainMenu),
	RetCountDaily = playerDaily:getDailyCounter(?DailyType_ExpTask, 0),
	updateExpTask(RetCountCfg, RetCountDaily).

%% 检查配置计数
-spec updateExpTask_countCfg(true) -> uint().
updateExpTask_countCfg(true) ->
	case getCfg:getCfgByKey(cfg_globalsetup, expTaskCount) of
		#globalsetupCfg{setpara = [CountMax]}
			when erlang:is_integer(CountMax)
			andalso CountMax > 0 ->
			CountMax;
		InvalidCfg ->
			?ERROR("invalid cfg globalsetup.expTaskCount ~w", [InvalidCfg]),
			0
	end;
updateExpTask_countCfg(_) ->
	0.

%% 查找已有任务
-spec updateExpTask_find() -> uint().
updateExpTask_find() ->
	ListTask = playerState:getAcceptedTask(),
	updateExpTask_find(ListTask).
updateExpTask_find([]) ->
	0;  %% 没找到
updateExpTask_find([#rec_task{taskType = ?TaskMainType_Exp, taskID = TaskID} | _T]) ->
	TaskID; %% 找到了
updateExpTask_find([_ | T]) ->
	updateExpTask_find(T).   %% 继续找

%% 尝试刷新
-spec updateExpTask(RetCountCfg::uint(), RetCountDaily::uint()) -> no_return().
updateExpTask(0, _) ->
	skip;   %% 配置不允许生成任务
updateExpTask(RetCountCfg, RetCountDaily) when RetCountDaily >= RetCountCfg ->
	skip;   %% 今日已经领取足够多的任务
updateExpTask(_RetCountCfg, 0) ->
	?DEBUG(
		"[DebugForExpTask] updateExpTask RoleID:~w",
		[playerState:getRoleID()]
	),
	updateExpTask_cancel(), %% 今日未领取，表示已经重置，需要放弃已有任务
	updateExpTask_rand();   %% 领取新的任务
updateExpTask(_RetCountCfg, _RetCountDaily) ->
	?DEBUG(
		"[DebugForExpTask] updateExpTask RoleID:~w",
		[playerState:getRoleID()]
	),
	case updateExpTask_find() of
		0 ->
			%% 仅没有现存任务时领取新的任务
			?DEBUG(
				"[DebugForExpTask] updateExpTask RoleID:~w",
				[playerState:getRoleID()]
			),
			updateExpTask_rand();   %% 领取新的任务
		_ ->
			skip
	end.

%% 放弃已有任务
-spec updateExpTask_cancel() -> no_return().
updateExpTask_cancel() ->
	case updateExpTask_find() of
		0 ->
			skip;
		TaskID ->
			playerTask:cancelTask(TaskID)
	end.

%% 随机领取新的任务
-spec updateExpTask_rand() -> no_return().
updateExpTask_rand() ->
	?DEBUG(
		"[DebugForExpTask] updateExpTask RoleID:~w",
		[playerState:getRoleID()]
	),
	List1Key = getCfg:get1KeyList(cfg_dailytask_Cycle),
	Level = playerState:getLevel(),
	case updateExpTask_rand_level(List1Key, Level, 0) of
		0 ->
			skip;   %% 不满足任何等级要求，跳过
		TarLevel ->
			?DEBUG(
				"[DebugForExpTask] updateExpTask RoleID:~w",
				[playerState:getRoleID()]
			),
			#dailytask_CycleCfg{group = GroupID} =
				getCfg:getCfgByKey(cfg_dailytask_Cycle, TarLevel),
			%% 由于经验环任务可能比家族环任务更频繁领取，因此此处需要加入随机因素
			%% 防止设计上10/7分钟刷新一次的随机列表导致重复领取相同任务的概率过高
			case updateExpTask_rand_taskID(GroupID, misc:rand(0, 2)) of
				0 ->
					skip;   %% 没有找到任务，忽略
				TaskID ->
					?DEBUG(
						"[DebugForExpTask] will accept RoleID:~w TaskID:~w ",
						[playerState:getRoleID(), TaskID]
					),
					playerDaily:incDailyCounter(?DailyType_ExpTask, 0),
					playerTask:acceptTaskForExpTask(TaskID, 0)
			end
	end.

%% 根据角色等级取得等级区间键值
-spec updateExpTask_rand_level([uint16(), ...], uint16(), uint16()) -> uint16().
updateExpTask_rand_level([], _Level, Acc) ->
	Acc;
updateExpTask_rand_level([H | T], Level, _Acc) when Level >= H ->
	updateExpTask_rand_level(T, Level, H);
updateExpTask_rand_level(_, _Level, Acc) ->
	Acc.

%% 根据组ID随机查找一个任务
-spec updateExpTask_rand_taskID(GroupID::uint(), RandCount::uint()) -> TaskID::uint().
updateExpTask_rand_taskID(0, _RandCount) ->
	0;  %% GroupID为0表示功能关闭
updateExpTask_rand_taskID(GroupID, RandCount) ->
	ListTaskID = playerState2:listExpTaskID(),
	updateExpTask_rand_taskID(ListTaskID, GroupID, RandCount, 0).
updateExpTask_rand_taskID([], GroupID, _RandCount, 0) ->
	?ERROR("can not rand task with roleLevel:~w GroupID:~w", [playerState:getLevel(), GroupID]),
	0;      %% 没随到，配置错误
updateExpTask_rand_taskID([], _GroupID, _RandCount, Acc) ->
	Acc;    %% 找完，使用缓存结果
updateExpTask_rand_taskID([TaskID | T], GroupID, 0, Acc) ->
	case getCfg:getCfgByKey(cfg_task, TaskID) of
		#taskCfg{type = ?TaskMainType_Exp, groupid = GroupID} ->
			TaskID;  %% 就是你了，皮卡丘！
		_ ->
			updateExpTask_rand_taskID(T, GroupID, 0, Acc)
	end;
updateExpTask_rand_taskID([TaskID | T], GroupID, RandCount, Acc) ->
	case getCfg:getCfgByKey(cfg_task, TaskID) of
		#taskCfg{type = ?TaskMainType_Exp, groupid = GroupID} ->
			updateExpTask_rand_taskID(T, GroupID, RandCount - 1, TaskID);   %% 缓存你了，皮卡丘备用！
		_ ->
			updateExpTask_rand_taskID(T, GroupID, RandCount, Acc)
	end.

%% gm:完成当前经验环任务
-spec gmSubmitExpTaskCur() -> no_return().
gmSubmitExpTaskCur() ->
	case updateExpTask_find() of
		0 ->
			skip;
		TaskID ->
			playerTask:gmSubmitTask(TaskID)
	end.

%% aruna小号不用完成任务就提交任务
-spec autoSubmitArunaTask() -> no_return().
autoSubmitArunaTask() ->
	AcceptedTask = playerState:getAcceptedTask(),
	FunSubmitTask = fun(#rec_task{taskID = TaskID, taskType = TaskType} = Task) when TaskType =:= ?TaskMainType_Aruna ->
		case getCfg:getCfgByKey(cfg_task, TaskID) of
			#taskCfg{type = ?TaskMainType_Aruna, reward_exp = Reward_Exp} when Reward_Exp > 0  ->
				completeTask(Task, 0),
				% 额外在经验
				ExpMul = case getCfg:getCfgPStack(cfg_globalsetup, aruna_config_21) of
					#globalsetupCfg{setpara = [Mul]} ->
						Mul;
					_ ->
						1
				end,
				playerBase:addExp(Reward_Exp * ExpMul, ?ExpSourceTask, TaskID);
			_ ->
				skip
		end;
	(_) ->
			skip
	end,
	lists:foreach(FunSubmitTask, AcceptedTask),
	ok.
