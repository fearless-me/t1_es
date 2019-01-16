%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 从playerMarriage提取出来的，只是整理部分代码
%%% @end
%%% Created : 23. 五月 2017 10:38
%%%-------------------------------------------------------------------
-module(playerMarriageTask).
-author("Administrator").

%%%% API
%%-export([
%%	resetTask/1,
%%	acceptTask/0,
%%	leaderSubmitTask/1,
%%	submitTask/1,
%%	canSubmitTask/1,
%%	onEventEx/0,
%%	onAcceptTask/1,
%%	onRoundTaskFinish/0,
%%
%%	%% 情缘任务期间长长长长长的召唤流程
%%	mc_partnerBeCalled/2,
%%	mc_askLeader/1,
%%	mc_LeaderReply/1,
%%	mc_partnerBeCalled2/2,
%%	recordTime/0,
%%	mc_partnerReply/1
%%]).
%%
%%-include("playerPrivate.hrl").
%%-include("../marriage/marriagePrivate.hrl").
%%
%%-define(MarriageTask_ID, 3001).
%%-define(MarriageTask_ActivityID, 32).
%%
%%onAcceptTask(TaskID)->
%%	RoleID = playerState:getRoleID(),
%%	activityCommon:addLogParticipatore(RoleID,?LogParticipator_MarriageTask),
%%	case playerTask:isAcceptedTaskByID(TaskID) of
%%		false ->
%%			 playerTask:acceptTask(TaskID, 0),
%%			case playerPropSync:getProp(?SerProp_MarriageTaskInfo) of
%%				{0, _} ->
%%					playerPropSync:setAny(?SerProp_MarriageTaskInfo, {TaskID, misc_time:gregorian_seconds_from_1970( )});
%%				_ ->
%%					ok
%%			end;
%%		_ ->
%%			skip
%%	end,
%%	onEventEx(),
%%	ok.
%%
%%%%% --------------------------------------------------------------------
%%%% 重置情缘任务
%%-spec resetTask(NextDay :: boolean()) -> ok.
%%resetTask(NextDay) ->
%%	FunCancel =
%%		fun(#rec_task{taskID = ID}) ->
%%			case getCfg:getCfgByKey(cfg_task, ID) of
%%				#taskCfg{type = ?TaskMainType_Marriage} ->
%%					playerTask:cancelTask(ID);
%%				_ ->
%%					skip
%%			end
%%		end,
%%	lists:foreach(FunCancel, playerState:getAcceptedTask()),
%%	case NextDay of
%%		true ->
%%			playerPropSync:setAny(?SerProp_MarriageTaskInfo, {0, 0});
%%		_ ->
%%			skip
%%	end,
%%	onEventEx(),
%%	ok.
%%
%%%%% --------------------------------------------------------------------
%%%% 接受情缘任务
%%-spec acceptTask() -> ok.
%%
%%queryCoupleID() ->
%%	RoleID = playerState:getRoleID(),
%%	SweetheartID =
%%		case marriageState:queryRelation(RoleID) of
%%			#rec_marriage{targetRoleID = TargetRoleID1} ->
%%				TargetRoleID1;
%%			_ ->
%%				0
%%		end,
%%
%%	SweetheartIDPid = case core:queryPlayerPidByRoleID(SweetheartID) of
%%		                  offline ->
%%			                  undefined;
%%		                  Pid ->
%%			                  Pid
%%	                  end,
%%	{SweetheartID, SweetheartIDPid}.
%%
%%checkMarriageTaskShip() ->
%%	RoleID = playerState:getRoleID(),
%%	PlayerEts = playerState:getMapPlayerEts(),
%%	{SweetheartID, SweetheartIDPid} = queryCoupleID(),
%%
%%	SameMapRoleList = gsTeamInterface:getTeamMemberRoleIDListInSameMapWithPlayerCode(
%%		playerState:getPlayerCode()
%%		, PlayerEts
%%		, true),
%%
%%	MemberLen = length(SameMapRoleList),
%%	TeamMemberCount = gsTeamInterface:getTeamMemberCountWithRoleID(RoleID),
%%	IsInSameTeam = gsTeamInterface:isInSameTeam(RoleID, SweetheartID),
%%	IsTeamLeader = gsTeamInterface:isTeamLeader(RoleID),
%%
%%	if
%%		SweetheartID =:= 0 ->
%%			{false, ?ErrorCode_Marriage_AcceptTask};
%%		not IsTeamLeader ->
%%			{false, ?ErrorCode_Marriage_AcceptTaskLeader};
%%		TeamMemberCount =/= 2 ->
%%			{false, ?ErrorCode_Marriage_AcceptTask};
%%		not IsInSameTeam ->
%%			{false, ?ErrorCode_Marriage_AcceptTask};
%%		SweetheartIDPid =:= undefined ->
%%			{false, ?ErrorCode_Marriage_AcceptTask};
%%		MemberLen =/= 2 ->
%%			{call, SweetheartIDPid};
%%		true ->
%%			{true, SweetheartID, SweetheartIDPid}
%%	end.
%%
%%checkHasMarriageTaskState() ->
%%	case playerPropSync:getProp(?SerProp_MarriageTaskInfo) of
%%		{TaskIDCache, _} when TaskIDCache > 0 ->
%%			FunIsAccept =
%%				fun(#rec_task{taskID = ID}, {_, _}) ->
%%					case getCfg:getCfgByKey(cfg_task, ID) of
%%						#taskCfg{type = ?TaskMainType_Marriage} ->
%%							{true, 0};
%%						_ ->
%%							{false, 0}
%%					end
%%				end,
%%			case misc:foldlEx(FunIsAccept, {false, 0}, playerState:getAcceptedTask()) of
%%				{true, _} ->
%%					{false, ?ErrorCode_Marriage_AlreadyAcceptTask};
%%				_ ->
%%					{false, ?ErrorCode_Marriage_AcceptTaskDaily}
%%			end;
%%		_ ->
%%			case getTaskRound() >= getMaxRoundCfg() of
%%				true ->
%%					{false, ?ErrorCode_Marriage_AcceptTaskDaily};
%%				_ ->
%%					{true, 0}
%%			end
%%	end.
%%
%%acceptTask() ->
%%	case checkMarriageTaskShip() of
%%		{true, _SweetheartID, SweetheartPid} ->
%%			case checkHasMarriageTaskState() of
%%				{true, _} ->
%%					psMgr:sendMsg2PS(SweetheartPid, marriage_acceptTaskAsk, 0);
%%				{_, ErrorCode1} ->
%%					playerMsg:sendErrorCodeMsg(ErrorCode1)
%%			end;
%%		{call, SweetheartPid} ->
%%			mc_leaderCallPartner(SweetheartPid);
%%		{_, ErrorCode} ->
%%			playerMsg:sendErrorCodeMsg(ErrorCode)
%%	end,
%%	ok.
%%
%%%%% --------------------------------------------------------------------
%%%% 提交情缘任务
%%-spec leaderSubmitTask(Code :: uint()) -> ok.
%%leaderSubmitTask(Code) ->
%%	case checkMarriageTaskShip() of
%%		{true, _SweetheartID, SweetheartPid} ->
%%			%% 检查双方是否完成任务
%%			case canSubmitTask(Code) of
%%				{true, TaskID} ->
%%					psMgr:sendMsg2PS(SweetheartPid, marriage_askTask, {TaskID, Code});
%%				_E ->
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_NotComplete) %% 未完成不能提交
%%			end;
%%		{call, SweetheartPid} ->
%%			mc_leaderCallPartner(SweetheartPid);
%%		{_, ErrorCode} ->
%%			playerMsg:sendErrorCodeMsg(ErrorCode)
%%	end.
%%
%%-spec submitTask({Pid :: pid(), TaskID :: uint(), Code:: uint()}) -> ok.
%%submitTask({Pid, TaskID, Code}) ->
%%	case canSubmitTask(Code) of
%%		{true, TaskID} ->
%%			psMgr:sendMsg2PS(Pid, marriage_submitTask, TaskID),
%%			#rec_marriage{targetRoleID = PartnerRoleID} = marriageState:queryRelation(playerState:getRoleID()),
%%			playerTask:submitTask(TaskID, 0, PartnerRoleID),
%%			case getCfg:getCfgByKey(cfg_task, TaskID) of
%%				#taskCfg{auto_next = [TaskIDNext | _]} when erlang:is_integer(TaskIDNext), TaskIDNext > 0 ->
%%					onAcceptTask(TaskIDNext),
%%					psMgr:sendMsg2PS(Pid, marriage_acceptTask, TaskIDNext);
%%				_ ->
%%					psMgr:sendMsg2PS(Pid, marriage_completeTask, TaskID),
%%					activityCommon:addLogParticipatore(playerState:getRoleID(),?LogParticipator_CompleteMarriageTask),
%%					activityCommon:addLogParticipatore(PartnerRoleID,?LogParticipator_CompleteMarriageTask),
%%					onRoundTaskFinish()  %% 完成本轮情缘任务！
%%			end;
%%		_E ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_NotComplete) %% 未完成不能提交
%%	end,
%%	ok.
%%
%%%% 完成一轮
%%onRoundTaskFinish()->
%%	%% 完成本轮情缘任务！
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_CompleteTask),
%%	incTaskRound(),
%%	onEventEx(),
%%	ok.
%%
%%%%% --------------------------------------------------------------------
%%%% 是否能提交情缘任务
%%-spec canSubmitTask( Code ::uint() ) -> {boolean(), uint()}.
%%canSubmitTask(Code) ->
%%	FunCheck =
%%		fun(#rec_task{taskID = ID}, {_, {_, _}}) ->
%%			case getCfg:getCfgByKey(cfg_task, ID) of
%%				#taskCfg{type = ?TaskMainType_Marriage} ->
%%					case playerTask:canSubmitTask(ID, Code) of
%%						{true,_}->
%%							{true,{true, ID}};
%%						_ ->
%%							{true,{false, ID}}
%%					end;
%%				_ ->
%%					{false, {false, 0}}
%%			end
%%		end,
%%	case misc:foldlEx(FunCheck, {false, {false, 0}}, playerState:getAcceptedTask()) of
%%		{true, {true, ID}} ->
%%			{true, ID};
%%		{_, {_, ID2}} ->
%%			{false, ID2}
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:特殊事件处理
%%% 角色上线;角色升级;完成任务时，需要尝试领取引导任务
%%% 接受情缘任务;离婚时，需要尝试取消引导任务
%%-spec onEventEx() -> no_return().
%%onEventEx() ->
%%	case core:isCross() of
%%		false ->
%%			Ret = lists:keyfind(?MarriageTask_ID, #rec_task.taskID, playerState:getAcceptedTask()),
%%			onEventEx(isNeedLink(), Ret =/= false);
%%		_ ->
%%			skip
%%	end.
%%-spec onEventEx(IsNeed::boolean(), IsAccepted::boolean()) -> no_return().
%%onEventEx(Same, Same) ->
%%	skip;
%%onEventEx(true, false) ->
%%	playerTask:acceptTask(?MarriageTask_ID, 0);
%%onEventEx(false, true) ->
%%	playerTask:cancelTask(?MarriageTask_ID).
%%
%%%%%-------------------------------------------------------------------
%%% internal:是否需要引导任务
%%-spec isNeedLink() -> boolean().
%%isNeedLink() ->
%%	case playerMainMenu:isOpen(?ModeType_Marriage) andalso variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_WeddingSite) of
%%		true ->
%%			%%% 未婚时不需要 LUNA-5532 未婚时可能需要领取情缘任务，由客户端进一步提示
%%			%case marriageState:queryMarriageRoleID(playerState:getRoleID()) of
%%			%	0 ->
%%			%		false;
%%			%	_ ->
%%			%% 已经领取情缘任务了，不需要
%%				case isAccepted() of
%%					true ->
%%						false;
%%					_ ->
%%						%% 已经完成了情缘任务，不需要
%%						getMaxRoundCfg() > getTaskRound()
%%				end;
%%			%end
%%		_ ->
%%			false
%%	end.
%%
%%getMaxRoundCfg()->
%%	case getCfg:getCfgByKey(cfg_globalsetup, marriage_task_number) of
%%		#globalsetupCfg{setpara = [V]}->
%%			V;
%%		_ ->
%%			1
%%	end.
%%
%%getTaskRound()->
%%	playerDaily:getDailyCounter(?DailyType_MarriageTask, 1).
%%
%%incTaskRound()->
%%	playerDaily:incDailyCounter(?DailyType_MarriageTask, 1).
%%
%%
%%-spec isAccepted() -> true|false.
%%isAccepted() ->
%%	lists:foldl(
%%		fun(#rec_task{taskID = TaskID}, Acc) ->
%%			case getCfg:getCfgByKey(cfg_task, TaskID) of
%%				#taskCfg{type = ?TaskMainType_Marriage} ->
%%					true;
%%				_ ->
%%					Acc
%%			end
%%
%%		end, false, playerState:getAcceptedTask()).
%%
%%%getLinkMinLevel()->
%%%	case getCfg:getCfgByKey(cfg_dailyInterface,?MarriageTask_ActivityID) of
%%%		#dailyInterfaceCfg{parameter = Level} ->
%%%			Level;
%%%		_ ->
%%%			99999
%%%	end.
%%
%%
%%
%%%%%-------------------------------------------------------------------
%%% internal:队长交接任务时，如果队员不在同一地图线，则需要走一个很长的流程，希望能将队员召唤到身边
%%-spec mc_leaderCallPartner(PartnerPid::pid()) -> no_return().
%%mc_leaderCallPartner(PartnerPid) ->
%%	?DEBUG("[DebugForMarraigeTask] self:~w mc_leaderCallPartner", [self()]),
%%	psMgr:sendMsg2PS(PartnerPid, mc_leaderCallPartner, {playerState:getRoleID(), playerState:getNetPid()}).
%%
%%%%%-------------------------------------------------------------------
%%% api:响应 mc_leaderCallPartner/1 产生的消息（进程
%%-spec mc_partnerBeCalled(LeaderPid::pid(), {LeaderRoleID::uint64(), LeaderNetPid::pid()}) -> no_return().
%%mc_partnerBeCalled(LeaderPid, {_LeaderRoleID, LeaderNetPid}) ->
%%	%% 需要在普通地图且不在位面中
%%	GroupID = playerState:getGroupID(),
%%	case playerScene:getMapType(playerState:getMapID()) of
%%		?MapTypeNormal when GroupID =:= 0 ->
%%			?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerBeCalled", [self()]),
%%			psMgr:sendMsg2PS(LeaderPid, mc_partnerBeCalled, {playerState:getRoleID(), playerState:getName()});
%%		_ ->
%%			?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerBeCalled", [self()]),
%%			playerMsg:sendErrorCodeMsg(LeaderNetPid, ?ErrorCode_Marriage_Together_coordinateNotallow)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:响应 mc_partnerBeCalled/2 产生的消息（进程
%%-spec mc_askLeader({PartnerRoleID::uint64(), PartnerRoleName::string()}) -> no_return().
%%mc_askLeader({PartnerRoleID, PartnerRoleName}) ->
%%	?DEBUG("[DebugForMarraigeTask] self:~w mc_askLeader", [self()]),
%%	playerState2:marriageTask_together_timeout(misc_time:localtime_seconds()),
%%	playerMsg:sendNetMsg(#pk_GS2U_MarriageTask_Together_Ask1{roleID = PartnerRoleID, roleName = PartnerRoleName}).
%%
%%%%%-------------------------------------------------------------------
%%% api:响应 mc_askLeader/1 产生的消息（网络
%%-spec mc_LeaderReply(IsAgreed::boolean()) -> no_return().
%%mc_LeaderReply(false) ->
%%	?DEBUG("[DebugForMarraigeTask] self:~w mc_LeaderReply", [self()]),
%%	skip;
%%mc_LeaderReply(true) ->
%%	case playerState2:marriageTask_together_timeout() of
%%		true ->
%%			?DEBUG("[DebugForMarraigeTask] self:~w mc_LeaderReply", [self()]),
%%			?ERROR_CODE(?ErrorCode_Marriage_Together_OutTime1);
%%		_ ->
%%			case playerState2:marriageTask_together_getCD() of
%%				0 ->
%%					%% 因为玩家操作期间数据可能又有变化，因此重新检查一遍逻辑
%%					case checkMarriageTaskShip() of
%%						{call, SweetheartPid} ->
%%							RoleInfo = {playerState:getRoleID(), playerState:getName(), playerState:getNetPid()},
%%							PosInfo = {playerState:getMapID(), playerState:getMapPid(), playerState:getPos()},
%%							?DEBUG("[DebugForMarraigeTask] self:~w mc_LeaderReply", [self()]),
%%							psMgr:sendMsg2PS(SweetheartPid, mc_leaderCallPartner2, {RoleInfo, PosInfo});
%%						_ ->
%%							?DEBUG("[DebugForMarraigeTask] self:~w mc_LeaderReply", [self()]),
%%							?ERROR_CODE(?ErrorCode_Marriage_Together_coordinateNotallow)
%%					end;
%%				_ ->
%%					?DEBUG("[DebugForMarraigeTask] self:~w mc_LeaderReply", [self()]),
%%					?ERROR_CODE(?ErrorCode_marriage_Together_Beckon_cd)
%%			end
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:响应 mc_LeaderReply/1 产生的消息（进程
%%-spec mc_partnerBeCalled2(LeaderPid::pid(), {{LeaderRoleID::uint64(), LeaderRoleName::string(), LeaderNetPid::pid()}, {TargetMapID::uint16(), TargetMapPid::pid(), TargetPos::{float(), float()}}}) -> no_return().
%%mc_partnerBeCalled2(LeaderPid, {{LeaderRoleID, LeaderRoleName, LeaderNetPid}, Data}) ->
%%	%% 经历了玩家操作，需要再次判断在普通地图且不在位面中
%%	GroupID = playerState:getGroupID(),
%%	case playerScene:getMapType(playerState:getMapID()) of
%%		?MapTypeNormal when GroupID =:= 0 ->
%%			?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerBeCalled2", [self()]),
%%			psMgr:sendMsg2PS(LeaderPid, mc_partnerBeCalled2, true),	%% 反馈队长进程记录发动召唤的时间点
%%			playerState2:marriageTask_together_target(Data),
%%			playerState2:marriageTask_together_timeout(misc_time:localtime_seconds()),
%%			playerMsg:sendNetMsg(#pk_GS2U_MarriageTask_Together_Ask2{roleID = LeaderRoleID, roleName = LeaderRoleName});
%%		_ ->
%%			?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerBeCalled2", [self()]),
%%			playerMsg:sendErrorCodeMsg(LeaderNetPid, ?ErrorCode_Marriage_Together_coordinateNotallow)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:响应 mc_partnerBeCalled2/2 产生的消息（进程
%%-spec recordTime() -> no_return().
%%recordTime() ->
%%	?DEBUG("[DebugForMarraigeTask] self:~w recordTime", [self()]),
%%	playerState2:marriageTask_together_setCD().
%%
%%%%%-------------------------------------------------------------------
%%% api:响应 mc_partnerBeCalled2/2 产生的消息（网络
%%-spec mc_partnerReply(IsAgreed::boolean()) -> no_return().
%%mc_partnerReply(IsAgreed) ->
%%	%% 重新获取伴侣进程信息
%%	LeaderNetPid =
%%		case marriageState:queryMarriageRoleID(playerState:getRoleID()) of
%%			0 ->
%%				?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerReply", [self()]),
%%				skip;	%% 伴侣已失效
%%			PartnerRoleID ->
%%				case core:queryOnLineRoleByRoleID(PartnerRoleID) of
%%					#rec_OnlinePlayer{netPid = NetPid} ->
%%						?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerReply", [self()]),
%%						NetPid;
%%					_ ->
%%						?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerReply", [self()]),
%%						skip	%% 伴侣已不在线
%%				end
%%		end,
%%	case erlang:is_pid(LeaderNetPid) of
%%		true when IsAgreed =:= false ->
%%			?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerReply", [self()]),
%%			playerMsg:sendErrorCodeMsg(LeaderNetPid, ?ErrorCode_Marriage_Together_Disagree);
%%		true ->
%%			case playerState2:marriageTask_together_timeout() of
%%				true ->
%%					?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerReply", [self()]),
%%					?ERROR_CODE(?ErrorCode_Marriage_Together_OutTime2),
%%					playerMsg:sendErrorCodeMsg(LeaderNetPid, ?ErrorCode_Marriage_Together_Disagree);
%%				_ ->
%%					%% 经历了玩家操作，需要再次判断在普通地图且不在位面中
%%					GroupID = playerState:getGroupID(),
%%					case playerScene:getMapType(playerState:getMapID()) of
%%						?MapTypeNormal when GroupID =:= 0 ->
%%							{MapID, MapPid, {PosX, PosY}} = playerState2:marriageTask_together_target(),
%%							case playerState:getMapPid() of
%%								MapPid ->
%%									%% 同地图时沿用原逻辑（客户端执行寻路前往）
%%									playerState:setVipLastTransmit(misc_time:utc_seconds()),
%%									Msg = #pk_GS2U_returnFriendPos{
%%										mapID   = MapID,
%%										x       = PosX,
%%										y       = PosY
%%									},
%%									?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerReply", [self()]),
%%									playerMsg:sendNetMsg(Msg);
%%								_ ->
%%									%% 不同地图时将角色传送到目标地图的指定坐标
%%									?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerReply", [self()]),
%%									playerScene:onRequestEnterMap(MapID, MapPid, PosX, PosY)
%%							end;
%%						_ ->
%%							?DEBUG("[DebugForMarraigeTask] self:~w mc_partnerReply", [self()]),
%%							?ERROR_CODE(?ErrorCode_Marriage_Together_OutTime2),
%%							playerMsg:sendErrorCodeMsg(LeaderNetPid, ?ErrorCode_Marriage_Together_Disagree)
%%					end
%%			end;
%%		_ ->
%%			skip
%%	end.
