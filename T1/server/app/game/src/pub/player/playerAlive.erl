%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 跨服活动-大逃杀 角色功能接口
%%% @end
%%% Created : 20171006
%%%-------------------------------------------------------------------
-module(playerAlive).
-author("meitianyang").
%%
%%-include("playerPrivate.hrl").
%%-include("../crossActivity/cacAlive/cacAlivePrivate.hrl").
%%
%%%% msg
%%-export([
%%	msg/1			%% 协议处理
%%]).
%%
%%%% api
%%-export([
%%	init/0,				%% 初始化：用于上线处理未处理的成就
%%	apply/0,			%% 报名参加活动
%%	apply/3, 			%% 此处导出是为了能够指定模块调用，因为不小心和默认函数erlang:apply/3重名了
%%	cancel/0,        	%% 取消报名（注意需要在切换地图、进入位面、下线、下坐骑时取消报名
%%	enterSafeArea/0,	%% 客户端请求进入安全区
%%
%%	gmSafeArea/0		%% 创建安全区
%%]).
%%
%%%% callback
%%-export([
%%	onQueryAck/1,   	%% 收到查询报名情况（仅上线请求回调）
%%	onApplyAck/1,   	%% 收到报名结果
%%	onCancelAck/1,  	%% 收到取消报名结果
%%	onNoticeEnter/1,	%% 收到通知进入跨服
%%	onSwitchPKMod/1,	%% 收到切换PK模式的消息
%%	gatherSuccess/1,	%% 收到采集成功消息
%%	onUpdateBS/1,		%% 活动要求刷新BUFF和技能
%%	getRevivePos/0,		%% 复活时获取出生点
%%	tick/0,				%% 心跳修复进入次数
%%	aliveKill/1,		%% 结算时击杀数记录
%%	resetAliveKill/0	%% 排行榜结算重置击杀数记录
%%]).
%%
%%%%%-------------------------------------------------------------------
%%% msg:协议处理
%%-spec msg(term()) -> no_return().
%%msg(Msg) ->
%%	case activity:queryActivitySwitch(?ActivityType_CrossAlive) of
%%		true ->
%%			msg_real(Msg);
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NotOpen)
%%	end.
%%
%%-spec msg_real(term()) -> no_return().
%%msg_real(#pk_U2GS_AliveApply_Request{}) ->
%%	playerAlive:apply();
%%msg_real(#pk_U2GS_AliveCancel_Request{}) ->
%%	playerAlive:cancel();
%%msg_real(#pk_U2GS_AliveEnterSafeArea_Request{}) ->
%%	playerAlive:enterSafeArea();
%%msg_real(Unknown) ->
%%	?ERROR("invalid msg:~w RoleID:~w", [Unknown, playerState:getRoleID()]).
%%
%%%%%-------------------------------------------------------------------
%%% api:初始化：用于上线处理未处理的成就
%%-spec init() -> no_return().
%%init() ->
%%	case core:isCross() of
%%		false ->
%%			case playerPropSync:getProp(?SerProp_CrossAliveAchieve) of
%%				0 ->
%%					skip;
%%				N ->
%%					playerPropSync:setInt(?SerProp_CrossAliveAchieve, 0),
%%					playerAchieve:achieveEvent(?Achieve_crossAlive_kill, [N])
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:报名参加活动
%%-spec apply() -> no_return().
%%apply() ->
%%	case playerState2:getCrossApply() of
%%		#recCrossApply{} ->
%%			?DEBUG("[DebugForAlive] apply"),
%%			skip;	%% 忽略重复的报名请求
%%		_ ->
%%			RoleID = playerState:getRoleID(),
%%			#globalsetupCfg{setpara = L} =
%%				getCfg:getCfgPStack(cfg_globalsetup, alive_apply_map),
%%			Ret0 = playerActivity:check_map({0, []}, L),						                                        %% 检查当前角色所在地图是否合法
%%			Ret1 = playerActivity:check_level(Ret0, ?ActivityType_CrossAlive, RoleID, ?ErrorCode_YourLevelIsTooLower),	%% 检查当前角色等级是否满足要求
%%			Ret2 = playerActivity:check_equipment(Ret1, ?ActivityType_CrossAlive, RoleID, ?ErrorCode_CrossActivity_Alive_Noweapon),  %%检查当前角色是否装备武器
%%			Ret3 = playerActivity:check_count(Ret2, ?CrossAliveMapID),													%% 检查当前角色是否有进入次数
%%			case playerState:getTeamID() of
%%				0 ->
%%					%% 没有组队，自己报名
%%					playerAlive:apply(Ret3, RoleID, [RoleID]);
%%				_TeamID ->
%%					?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NeedAlone)	%% 禁止组队报名
%%					%% 有组队，判断是否是队长
%%					%%case gsTeamInterface:getLeaderIDWithTeamID(_TeamID) of
%%					%%	RoleID ->
%%					%%		%% 队长带大家一起报名
%%					%%		ListTeamMemberInfo = gsTeamInterface:getTeamMemberInfoListWithTeamID(_TeamID),
%%					%%		Ret3 = playerActivity:check_teamMember(Ret3, ?ActivityType_CrossAlive, RoleID, ListTeamMemberInfo, L, ?CrossAliveMapID),
%%					%%		playerAlive:apply(Ret3, RoleID, [ID || #recTeamMemberInfoGS{roleID = ID} <- ListTeamMemberInfo]);
%%					%%	_ ->
%%					%%		?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NeedLeader)
%%					%%end
%%			end
%%	end.
%%
%%%% 检测通过，执行报名
%%-spec apply({ErrorCodeIn, ErrorArgsIn}, LeaderRoleID, ListRoleID) -> {ErrorCodeOut, ErrorArgsOut} when
%%	ErrorCodeIn :: uint(),
%%	ErrorArgsIn :: list(),
%%	LeaderRoleID :: uint64(),
%%	ListRoleID :: [uint64(), ...],
%%	ErrorCodeOut :: uint(),
%%	ErrorArgsOut :: list().
%%apply({ErrorCodeIn, _} = In, _LeaderRoleID, _ListRoleID) when ErrorCodeIn > 0 ->
%%	?DEBUG("[DebugForAlive] apply"),
%%	In;
%%apply(_In, LeaderRoleID, ListRoleID) ->
%%	Data = #recCrossApply{
%%		applyID = 0,
%%		activityType = ?ActivityType_CrossAlive,
%%		leader = LeaderRoleID,
%%		applicant = playerState:getRoleID(),
%%		members = [core:queryCrossRoleBase(RoleID) || RoleID <- ListRoleID],
%%		paramEx = 0
%%	},
%%	?DEBUG("[DebugForAlive] apply"),
%%	gsCsInterface:sendMsg2CenterServer(transit, {self(), center, ?PsNameCSActivityMgr, cac_apply, Data}).
%%
%%%%%-------------------------------------------------------------------
%%% callback:收到查询报名情况（仅上线请求回调）
%%-spec onQueryAck(#recCrossApply{}|0) -> no_return().
%%onQueryAck(#recCrossApply{activityType = ?ActivityType_CrossAlive} = Apply) ->
%%	onApplyAck({0, Apply});
%%onQueryAck(_) ->
%%	skip.
%%
%%%%%-------------------------------------------------------------------
%%% callback:收到报名结果
%%-spec onApplyAck({ErrorCode::uint(), Apply::#recCrossApply{}}) -> no_return().
%%% 报名成功
%%onApplyAck({0, #recCrossApply{
%%	applyID = ApplyID,
%%	leader = LeaderID,
%%	members = Members
%%} = Apply}) ->
%%	?DEBUG("[DebugForAlive] onApplyAck ~s", [playerState:getName()]),
%%	playerState2:setCrossApply(Apply),
%%	Msg = #pk_GS2U_AliveApply_Ack{
%%		applyID = ApplyID,
%%		leaderID = LeaderID,
%%		members = Members
%%	},
%%	playerLogAdd:addLogParticipatorInfo(?LogParticipator_Battleroyale),
%%	playerMsg:sendNetMsg(Msg),
%%	?DEBUG("[DebugForAlive] onApplyAck ~s", [playerState:getName()]);
%%% 活动尚未开启
%%onApplyAck({?ErrorCode_CrossActivity_Apply_NotOpen = ErrorCode, #recCrossApply{}}) ->
%%	?DEBUG("[DebugForAlive] onApplyAck"),
%%	playerState2:setCrossApply(0),
%%	playerMsg:sendErrorCodeMsg(ErrorCode);
%%% 不在报名时间
%%onApplyAck({?ErrorCode_CrossActivity_Apply_NotTime = ErrorCode, #recCrossApply{}}) ->
%%	?DEBUG("[DebugForAlive] onApplyAck"),
%%	playerState2:setCrossApply(0),
%%	playerMsg:sendErrorCodeMsg(ErrorCode).
%%
%%%%%-------------------------------------------------------------------
%%% api:取消报名
%%% 切换地图、下线、进入位面时 从playerActivity:cancel/0统一调用
%%% 加入队伍、退出队伍时需要单独调用
%%% 有人加入了自己的队伍时需要单独调用
%%-spec cancel() -> no_return().
%%cancel() ->
%%	%?DEBUG("[DebugForAlive] cancel ~p", [misc:getStackTrace()]),
%%	case playerState2:getCrossApply() of
%%		#recCrossApply{applyID = ApplyID, activityType = ?ActivityType_CrossAlive} ->
%%			?DEBUG("[DebugForAlive] cancel"),
%%			Msg = {?ActivityType_CrossAlive, {ApplyID, playerState:getRoleID()}},
%%			gsCsInterface:sendMsg2CenterServer(transit, {self(), center, ?PsNameCSActivityMgr, cac_cancel, Msg});
%%		_ ->
%%			?DEBUG("[DebugForAlive] cancel"),
%%			skip	%% 忽略没有报名的情况
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:客户端请求进入安全区
%%-spec enterSafeArea() -> no_return().
%%enterSafeArea() ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossAlive} ->
%%			core:sendMsgToActivity(?ActivityType_CrossAlive, enterSafeArea, {playerState:getRoleID(), playerState:getPos(), playerState:getPlayerCode()});
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:创建安全区
%%-spec gmSafeArea() -> no_return().
%%gmSafeArea() ->
%%	case core:isCross() of
%%		true ->
%%			core:sendMsgToActivity(?ActivityType_CrossAlive, gm, {gmSafeArea, playerState:getRoleID()});
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% callback:收到取消报名结果
%%-spec onCancelAck({IsSilent::boolean(), Apply::#recCrossApply{}}) -> no_return().
%%onCancelAck({false, #recCrossApply{
%%	activityType = ?ActivityType_CrossAlive,
%%	applicant = RoleID,
%%	members = Members
%%}}) ->
%%	?DEBUG("[DebugForAlive] onCancelAck"),
%%	Msg = #pk_GS2U_AliveCancel_Ack{
%%		role = lists:keyfind(RoleID, #pk_CrossRoleBase.id, Members)
%%	},
%%	playerMsg:sendNetMsg(Msg);
%%onCancelAck(_) ->
%%	?DEBUG("[DebugForAlive] onCancelAck"),
%%	skip.
%%
%%%%%-------------------------------------------------------------------
%%% callback:收到通知进入消息
%%-spec onNoticeEnter({ServerID::uint(), MapPid::pid(), X::float(), Y::float(), Count::uint()}) -> no_return().
%%onNoticeEnter({ServerID, MapPid, X, Y, Count} = Data) ->
%%	?DEBUG("[DebugForAlive] onNoticeEnter ~w", [Data]),
%%	case core:isCross() of
%%		false ->
%%			%% 未进入跨服，需要先进入跨服
%%			playerPet:petAutoHide(true),
%%			CountRealOld = playerDaily:getDailyCounter(?DailyType_EnterCopyMap, ?CrossAliveMapID),
%%			playerDaily:incDailyCounter(?DailyType_EnterCopyMap, ?CrossAliveMapID),	%%  通知进入时已经消耗次数
%%			playerInterface:reqEnterCrossGS(ServerID, ?CrossAliveMapID, {alive_enter, {ServerID, MapPid, X, Y, CountRealOld + 1}});
%%		true ->
%%			%% 已经在跨服，进入地图
%%			playerScene:onRequestEnterActivityMap(?CrossAliveMapID, MapPid, erlang:float(X), erlang:float(Y)),
%%			%% 通知活动进程记录自己的进入计数便于发奖（角色可能在本场结束之前参与了下一场，因此需要活动来管理）
%%			core:sendMsgToActivity(?ActivityType_CrossAlive, alive_count, {playerState:getRoleID(), Count})
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% callback:收到切换PK模式的消息
%%-spec onSwitchPKMod(PKMode::uint()) -> no_return().
%%onSwitchPKMod(PKMode) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossAlive} ->
%%			case playerState:getPkStatus() of
%%				PKMode ->
%%					skip;
%%				_ ->
%%					playerPk:fotceTranState(PKMode)
%%			end;
%%		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeWorldWar} ->
%%			case playerState:getPkStatus() of
%%				PKMode ->
%%					skip;
%%				_ ->
%%					playerPk:fotceTranState(PKMode)
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% callback:收到采集成功消息
%%-spec gatherSuccess(GatherID::uint32()) -> no_return().
%%gatherSuccess(GatherID) ->
%%	case getCfg:getCfgByKey(cfg_object, GatherID) of
%%		#objectCfg{type = ?GatherType_Alive} ->
%%			core:sendMsgToActivity(?ActivityType_CrossAlive, alive_gather, {playerState:getRoleID(), GatherID});
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% callback:活动要求刷新BUFF和技能
%%-spec onUpdateBS({list(), list(), list(), list()}) -> no_return().
%%onUpdateBS({ListBD, ListBA, ListSD, ListSA} = _Data) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossAlive} ->
%%			?DEBUG("[DebugForAlive] onUpdateBS ~w", [_Data]),
%%			[playerBuff:delBuff(BuffID) || BuffID <- ListBD],
%%			[playerBuff:addBuff(BuffID, 1) || BuffID <- ListBA],
%%			[playerSkill:delSysSkill(SkillID) || SkillID <- ListSD],
%%			[playerSkill:addSysSkill(SkillID, 1) || SkillID <- ListSA];
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% callback:获取复活坐标
%%-spec getRevivePos() -> {float(), float()} | false.
%%getRevivePos() ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossAlive} ->
%%			#globalsetupCfg{setpara = ListPos} =
%%				getCfg:getCfgPStack(cfg_globalsetup, alive_pos_player),
%%			NTH = misc:rand(1, erlang:length(ListPos)),
%%			lists:nth(NTH, ListPos);
%%		_ ->
%%			false
%%	end.
%%
%%%-------------------------------------------------------------------
%%% callback:心跳修复进入次数
%%-spec tick() -> no_return().
%%tick() ->
%%	case core:isCross() of
%%		false ->
%%			RoleID = playerState:getRoleID(),
%%			TimeOld = variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_CrossActivityAlive_Time),
%%			case TimeOld of
%%				0 ->
%%					skip;
%%				_ ->
%%					case core:timeIsOnDay(TimeOld + ?SECS_FROM_0_TO_1970) of
%%						true ->
%%							CountOld = variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_CrossActivityAlive_Count),
%%							playerActivity:updateDailyCount(?CrossAliveMapID, -CountOld),
%%							variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_CrossActivityAlive_Count, 0);
%%						_ ->
%%							skip
%%					end,
%%					variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_CrossActivityAlive_Time, 0)
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% callback:结算时击杀数计数
%%-spec aliveKill(AliveKill::uint()) -> no_return().
%%aliveKill(AliveKill) ->
%%	AliveKillNew = playerPropSync:getProp(?SerProp_CrossAliveKill) + AliveKill,
%%	playerPropSync:setInt(?SerProp_CrossAliveKill, AliveKillNew),
%%	#globalsetupCfg{setpara = [N]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, alive_achieve),
%%	case AliveKill >= N of
%%		true ->
%%			playerAchieve:achieveEvent(?Achieve_crossAlive_kill, [1]);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% callback:排行榜结算重置击杀数记录
%%-spec resetAliveKill() -> no_return().
%%resetAliveKill() ->
%%	?DEBUG("[DebugForAlive] resetAliveKill:~w", [playerState:getRoleID()]),
%%	playerPropSync:setInt(?SerProp_CrossAliveKill, 0).