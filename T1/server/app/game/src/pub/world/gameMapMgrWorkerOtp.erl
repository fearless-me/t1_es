%%
%%%游戏地图管理进程
%%%负责游戏地图的读取，创建、删除等等功能
%%%
%%%地图管理器在服务器启动时即创建所有地图，并生成所有NPC及怪物，
%%%当该地图没有玩家时，NPC及怪物的AI及所有Timer都停止工作，
%%%直到有玩家进入该地图，则触发NPC及怪物AI及其它Timer继续工作，
%%%这样做可以极大的减小地图动态创建与删除的开销。
%%%
-module(gameMapMgrWorkerOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).
%%普通地图线创建多少时间后不再自动分配到该线路，但是可以手动切换，本宏与gameMapOtp:DestroyNormalTime宏对应
-define(ForbidEnterTime, 21600).
-include("mapPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).


start_link(Name,Index) ->
	RealName = erlang:atom_to_list(Name) ++ erlang:integer_to_list(Index),
	myGenServer:start_link(
		{local,list_to_atom(RealName)},
		?MODULE,
		[],
		[{timeout,?Start_Link_TimeOut_ms}]
	).

init([]) ->
	erlang:process_flag(trap_exit, true),
	erlang:process_flag(priority, high),
	?INFO("~p init OK",[?MODULE]),
	{ok,{}}.

%%请勿调用此处call代码，请直接调用mapMgrState
handle_call({getLineInfo, {MapPid}}, _From, State) ->
	RecMapInfo = mapMgrState:getMapInfo(MapPid),
	{reply, {ok, RecMapInfo}, State};

%%请勿调用此处call代码，请直接调用mapMgrState
handle_call({getLineList, {MapID}}, _Form, State) ->
	List = mapMgrState:getMapInfoByMapID(MapID),
	{reply, {ok, List}, State};

%% 玩家请求直接进入地图（用于处理，玩家进入副本，但是最后一次，没有次数了的情况）
handle_call({requestEnterMap_ByDirect, #recRequsetEnterMap{} = Request}, _Form, State) ->
	Ret =
		case canEnterCopyMap(Request) of
			ok ->
				true;
			_ ->
				false
		end,
	{reply, {ok, Ret}, State};

handle_call(Req, _From,State) ->
	?ERROR("[~p] unhandle call ~p", [?MODULE, Req]),
	{reply, ok, State}.

handle_cast(Msg, State) ->
	?ERROR("[~p] unhandle cast ~p", [?MODULE, Msg]),
	{noreply, State}.

handle_info({gm_setmlpm, _Pid, {MapID, MaxPlayerNumber}}, State) ->
	case MaxPlayerNumber > 0 of
		true ->
			mapMgrState:setSpecialMaxPlayerNumber(MapID, MaxPlayerNumber);
		_ ->
			mapMgrState:delSpecialMaxPlayerNumber(MapID)
	end,
	{noreply, State};

handle_info({gm_setmapday, _Pid, {MapID, Day}}, State) ->
	case mapMgrState:getMapInfoByMapID(MapID) of
		[] ->
			skip;
		[#recMapInfo{pid = Pid}|_] ->
			psMgr:sendMsg2PS(Pid, gm_setmapday, Day)
	end,
	{noreply, State};

handle_info({gm_execfun, _Pid, Fun}, State) ->
	F =
		fun(#recKeyValue{value = MapInfo}, _) ->
			case MapInfo of
				#recMapInfo{pid = Pid} ->
					psMgr:sendMsg2PS(Pid, gm_execfun, Fun);
				_ ->
					skip
			end
		end,
	ets:foldl(F, 0, mapMgrState:getWorkInfoEts()),
	?INFO("mapMgrWorker_execfun"),
	{noreply, State};

%% 优化：发送消息给可能存在的地图进程进行刷怪，避免心跳误差产生的大概率刷新延迟现象
%% 3.向存在的第一个地图进程转发刷新消息
handle_info({wildbossFresh, _Pid, ListMapID}, State) ->
	FunSend =
		fun(MapID) ->
			case mapMgrState:getMapInfoByMapID(MapID) of
				[] ->
					skip;
				[#recMapInfo{pid = Pid} | _] ->
					psMgr:sendMsg2PS(Pid, wildbossFresh, 0)
			end
		end,
	lists:foreach(FunSend, ListMapID),
	{noreply, State};

%% 创建指定活动地图(只能创建活动地图)
handle_info({createActivityMap, PidFrom, {MapID, CreateNumber, Data}}, State) ->
	case playerScene:getMapType(MapID) of
		?MapTypeActivity ->
			L = lists:seq(1, CreateNumber),
			Fun =
				fun(_, PIDList) ->
					case createMapLine(MapID, 0, 0) of
						MapPid when erlang:is_pid(PidFrom) ->
							[MapPid | PIDList];
						Error ->
							?ERROR("createActivityMap.createMapLine:mapid=~p,~p", [MapID, Error]),
							PIDList
					end
				end,
			LL = lists:foldl(Fun, [], L),
			?INFO("createActivityMap:mapid=~p, number=~p, from=~p, pidlist=~p", [MapID, CreateNumber, PidFrom, LL]),
			psMgr:sendMsg2PS(PidFrom, createActivityMapAck, {MapID, LL, Data}),
			ok;
		ErrorType ->
			?ERROR("createActivityMap:from=~p, mapid=~p,type=~p,number=~p", [PidFrom, MapID, ErrorType, CreateNumber])
	end,
	{noreply, State};

%% 为了确保活动进程能够先收到createActivityMapAck，再收到ACMapMsg_CreateMap
handle_info({activityMapMsg, _PidFrom, {ActivityID, Args}}, State) ->
	core:sendMsgToActivity(ActivityID, activityMapMsg, Args),
	{noreply, State};

%% 玩家请求进入地图
handle_info({requestEnterMap, _Pid, #recRequsetEnterMap{} = Request}, State) ->
	onRequestEnterMap(Request),
	{noreply, State};

%% 玩家请求直接进入地图（用于处理，玩家进入副本，但是最后一次，没有次数了的情况）
handle_info({requestEnterMap_ByDirect, Pid, {#recRequsetEnterMap{} = Request, Data}}, State) ->
	Ret =
		case canEnterCopyMap(Request) of
			ok ->
				true;
			_ ->
				false
		end,
	psMgr:sendMsg2PS(Pid, requestEnterMap_ByDirectAck, {Ret, Data}),
	{noreply, State};

%% 离开地图结果
handle_info({leaveMapAck, _Pid, {_BooleanOrErrorCode, #recRequsetEnterMap{}} = Msg}, State) ->
	leaveMapAck(Msg),
	{noreply, State};

%% 玩家进入地图成功
handle_info({playerEnterMapSuccess, MapPid, {RoleID, RolePID, MapID, Num}}, State) ->
	gameMapMgrWorkerLogic:playerEnterMapSuccess(RoleID, RolePID, MapID, MapPid, Num),
	{noreply, State};

%% 玩家普通方式离开地图
handle_info({playerLeaveMapNormal, _Pid, {RoleID, MapID, MapPid, PlayerNum}}, State) ->
	gameMapMgrWorkerLogic:playerLeaveMapNormal(RoleID, MapID, MapPid, PlayerNum),
	{noreply, State};

%% 重置副本
handle_info({resetCopyMap, PidFrom, {RoleID, TeamID, CopyMapID}}, State) ->
	Ret = gameMapMgrWorkerLogic:resetCopyMap(RoleID, TeamID, CopyMapID),
	psMgr:sendMsg2PS(PidFrom, resetCopyMapAck, Ret),
	{noreply, State};

%% 玩家主动离开副本
handle_info({playerLeaveCopyMap, _PidFrom, {RoleID, CopyMapID, MapPID} = Data}, State) ->
	case gameMapMgrWorkerLogic:getCopyMapInfo(MapPID) of
		#recCopyMapInfo{mapID = CopyMapID, ownerMemberIDList = OList, enteredMemberIDList = EList} = Info ->
			NewOList =
				case lists:member(RoleID, OList) andalso lists:member(RoleID, EList) of
					true ->
						OList2 = lists:delete(RoleID, OList),
						mapMgrState:setCopyMap(Info#recCopyMapInfo{ownerMemberIDList = OList2}),
						?INFO("player leave copymap:~p oldOwnerlist:~p newlist:~p", [Data, OList, OList2]),
						OList2;

					_ ->
						OList
				end,
			case NewOList of
				[] ->
					?INFO("the copymap no owner, resetcopymap id=~p, mappid=~p", [CopyMapID, MapPID]),
					psMgr:sendMsg2PS(MapPID, resetCopyMap, {});
				_ ->
					skip
			end,
			ok;
		Error ->
			?ERROR("playerLeaveCopyMap data:~p, error:~p", [Data, Error])
	end,
	{noreply, State};

%% 地图准备销毁，这时许出不许进了
handle_info({prepareDestory, _Pid, {MapID, MapPid}}, State) ->
	gameMapMgrWorkerLogic:prepareDestroy(MapID, MapPid),
	{noreply, State};

%% 地图销毁
handle_info({destoryMap, _Pid, {MapID, MapPid}}, State) ->
	gameMapMgrWorkerLogic:destroyMap(MapID, MapPid),
	{noreply, State};

%% 地图销毁(循环刷本，只删除工作者进程中的缓存数据)
handle_info({destoryMap_goonCopyMap, _Pid, {MapID, MapPid, RolePID, RoleID} = Data}, State) ->
	?INFO("destoryMap_goonCopyMap:~p", [Data]),
	gameMapMgrWorkerLogic:destroyMap(MapID, MapPid),
	psMgr:sendMsg2PS(MapPid, goonCopyMap, MapID),
	psMgr:sendMsg2PS(RolePID, destoryMap_goonCopyMap_Ack, {MapID, RoleID}),
	{noreply, State};

%% 创建军团副本
handle_info({leaderCreateGuildCopyMap, PidFrom, {MapID, RoleID, GuildID}}, State) ->
	MapType = playerScene:getMapType(MapID),
	MapSubType = playerScene:getMapSubType(MapID),
	case MapType =:= ?MapTypeCopyMap andalso MapSubType =:= ?MapSubTypeGuild of
		true ->

			NowTime = time:getSyncTime1970FromDBS(),
			#mapsettingCfg{all_time = AllTime} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
			MaxOverTime = NowTime + AllTime,

			Code =
				case myEts:lookUpEts(recGuildMemory, GuildID) of
					[#recGuildMemory{isOpen = IsOpen}] ->
						case IsOpen of
							true ->
								?ErrorCode_GuildCopy_Already_Active;
							_->
								?ErrorCode_GuildCopy_Open
						end;
					_ ->
						?ErrorCode_GuildCopy_Open
				end,

			case Code of
				?ErrorCode_GuildCopy_Open ->
					myEts:insertEts(recGuildMemory,
						#recGuildMemory{guildID = GuildID, guildCopyMaxOverTime = MaxOverTime, isOpen = true, ownerID = RoleID});
				_ ->
					skip
			end,

			?INFO("leaderCreateGuildCopyMap,mapid=~p, from=~p, owner=~p, guildid=~p, code=~p",
				[MapID, PidFrom, RoleID, GuildID, Code]),
			psMgr:sendMsg2PS(PidFrom, leaderCreateGuildCopyMapAck, {MapID, MaxOverTime, Code}),
			ok;
		_ ->
			skip
	end,

	{noreply, State};

handle_info({guildCopyMapOver, PidFrom, {MapID,GuildID}}, State) ->
	NowTime = time:getSyncTime1970FromDBS(),
	case myEts:lookUpEts(recGuildMemory, GuildID) of
		[#recGuildMemory{ownerID = OwnerID}] ->
			myEts:updateEts(recGuildMemory, GuildID,
				[{#recGuildMemory.guildCopyMaxOverTime, 0}, {#recGuildMemory.isOpen, false},{#recGuildMemory.ownerID, 0}]),

			?INFO("guildCopyMapOver,mapid=~p, from=~p, owner=~p, guildid=~p, time=~p",
				[MapID, PidFrom, OwnerID, GuildID, NowTime]);
		_ ->
			?ERROR("guildCopyMapOver,not in ets, mapid=~p, from=~p,guildid=~p, time=~p",
				[MapID, PidFrom, GuildID, NowTime])
	end,

	{noreply, State};

handle_info(Info,State) ->
	?ERROR("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================
%% 请求进入地图
-spec onRequestEnterMap(#recRequsetEnterMap{}) -> ok.
onRequestEnterMap(#recRequsetEnterMap{roleID = RoleID,
	targetMapID = TargetMapID,
	targetMapPID = TargetMapPid,
	oldMapID = OldMapID,
	oldMapPID = OldMapPID
} = Request) ->
	?INFO("RoleID:~p onRequestEnterMap TMap:~p SMap:~p SMapPid:~p", [RoleID,TargetMapID,OldMapID,OldMapPID]),
	case playerScene:getMapType(TargetMapID) of
		?MapTypeNormal ->
			%% 普通地图不用设置进度
			%% 如果是申请切线，这里的判断，只能在某种程度上确定正确，因为并发原因，这里判断通过，但是在玩家离开现有地图之后，再判断就不一定成功了！
			case canEnterNormalMapLine(TargetMapID, Request#recRequsetEnterMap.targetLine) of
				true ->
					%%指定地图Pid的普通地图
					case TargetMapPid of
						undefined ->
							checkAndLeaveMap(Request);
						_ ->
							Request2 =
								case erlang:is_pid(TargetMapPid) andalso erlang:is_process_alive(TargetMapPid) of
									true ->
										case mapMgrState:getMapInfo(TargetMapPid) of
											#recMapInfo{} = MapInfo ->
												case canEnterNormalTargetPid(MapInfo) of
													true -> Request;
													EC -> EC
												end;
											_ ->
												%% 地图不存在
												?ERROR("not found mapinfo:~p", [Request]),
												Request#recRequsetEnterMap{targetMapPID = undefined}
										end;
									_ ->
										%% 地图已经销毁了
										?ERROR("target map is destory:~p", [Request]),
										Request#recRequsetEnterMap{targetMapPID = undefined}
								end,
							case Request2 of
								#recRequsetEnterMap{} ->
									checkAndLeaveMap(Request2);
								_ ->
									%% 错误提示
									psMgr:sendMsg2PS(Request#recRequsetEnterMap.rolePID, requestEnterMapAck, {enterNormalTargetPid, Request2})
							end
					end;
				_ ->
					psMgr:sendMsg2PS(Request#recRequsetEnterMap.rolePID, enterNormalMapLineFailed, Request#recRequsetEnterMap.oldMapPID)
			end;
		?MapTypeActivity ->
			%% 活动地图
			case TargetMapID of
				?GuildFairgroundMapID ->
					case canEnterGuildFairground(Request) of
						true ->
							checkAndLeaveMap(Request);
						_ ->
							sendErrorCodeToRole(Request#recRequsetEnterMap.roleID, ?ErrorCode_GuildHome_PlayerMoreEnterFailed)
					end;
				_ ->
					checkAndLeaveMap(Request)
			end;
		?MapTypeCopyMap ->
			?INFO("RoleID:~p onRequestEnterMap enter rec=~p",[RoleID, Request]),

			%% 副本地图，需要判断进度
			CanEnter =
				case canEnterCopyMap(Request) of
					waitDestory ->
						?EnterMapErrorCode_CopyMapIsForceDestroy;
					ok ->
						true;
					?EnterMapErrorCode_TargetMapNotExist ->
						%% 其它条件满足，但是副本地图不存在，需要创建
						case createSelfCopyMap(Request) of
							Pid when erlang:is_pid(Pid) ->
								MapSubType = playerScene:getMapSubType(TargetMapID),
								MaxNum = getMaxNumber(TargetMapID),
								%%如果是军团副本或者单人副本不发消息
								case MapSubType =:= ?MapSubTypeGuild orelse MaxNum =< 1 of
									true->
										skip;
									_ ->
										%% 是组队进入副本，发消息给队长，副本创建成功
										psMgr:sendMsg2PS(
											Request#recRequsetEnterMap.rolePID,
											teamCopyMapCreateSuccess,
											{TargetMapID, Pid})
								end,
								true;
							_ ->
								?EnterMapErrorCode_CopyMapCreateFailed
						end;
					Other ->
						Other
				end,

			case CanEnter of
				true ->
					[
						MapInfo = #recCopyMapInfo{enteredMemberIDList = EnterList}
					] = gameMapMgrWorkerLogic:getCopyMapInfo(
						Request#recRequsetEnterMap.roleID,
						Request#recRequsetEnterMap.teamID,
						TargetMapID
					),
					NewMapInfo = case lists:member(RoleID,EnterList) of
									 false ->
										 %% 记录新成员
										 NMapInfo = MapInfo#recCopyMapInfo{enteredMemberIDList = [RoleID | EnterList]},
										 mapMgrState:setCopyMap(NMapInfo),
										 NMapInfo;
									 _ ->
										 MapInfo
								 end,
					?INFO("onRequestEnterMap new mapID:~p MapPid:~p,teamID:~p,isWaitDestroy:~p,enteredIDList:~w",
						[
							NewMapInfo#recCopyMapInfo.mapID,
							NewMapInfo#recCopyMapInfo.mapPid,
							NewMapInfo#recCopyMapInfo.teamID,
							NewMapInfo#recCopyMapInfo.isWaitDestroy,
							NewMapInfo#recCopyMapInfo.enteredMemberIDList
						]),
					checkAndLeaveMap(Request);
				ErrorCode ->
					leaveMapAck({ErrorCode, Request})
			end;
		ErrorType ->
			?ERROR("onRequestEnterMap error MapType:~p,~p", [Request, ErrorType])
	end,
	ok.

checkAndLeaveMap(#recRequsetEnterMap{roleID = RoleID,isRequireLeaveMap = IsRequireLeaveMap,oldMapID = OldMapID,oldMapPID = OldMapPID} = Request) ->
	case IsRequireLeaveMap andalso misc:is_process_alive(OldMapPID) of
		true ->
			%% 原来存在地图
			?INFO("Role:~p Leave OldMapID:~p Pid:~p",[RoleID,OldMapID,OldMapPID]),
			psMgr:sendMsg2PS(OldMapPID, leaveMap, Request);
		_ ->
			%% 原来的地图不存在
			leaveMapAck({true, Request})
	end,
	ok.

%% 能否进入家族游乐场地图
-spec canEnterGuildFairground(#recRequsetEnterMap{}) -> boolean().
canEnterGuildFairground(#recRequsetEnterMap{targetMapID = MapID, enterGuildFairgroundID = EnterGuildID}) ->
	case ets:lookup(?EtsGuildFairground, EnterGuildID) of
		[#recGuildFairground{mapPid = MapPid}] ->
			canEnterGuildFairground(MapID, MapPid);
		_ ->
			true
	end.
-spec canEnterGuildFairground(MapID::uint(), MapPid::pid()) -> boolean().
canEnterGuildFairground(MapID, MapPid) ->
	MaxPlayerNum = getMaxNumber(MapID),
	CurPlayerNum =
		case mapMgrState:getMapInfo(MapPid) of
			#recMapInfo{willEnterRoleIDList = List, totalPlayerNum = Num} ->
				erlang:length(List) + Num;
			_ ->
				0
		end,
	CurPlayerNum < MaxPlayerNum.

%% 离开地图结果
leaveMapAck({true, #recRequsetEnterMap{targetMapID = MapID, enterGuildFairgroundID = EnterGuildID} = Request}) when EnterGuildID > 0 ->
	MapPid =
		case MapID of
			?GuildFairgroundMapID ->
				case ets:lookup(?EtsGuildFairground, EnterGuildID) of
					[#recGuildFairground{mapPid = MapPid_} = V] ->
						case misc:is_process_alive(MapPid_) of
							true ->
								MapPid_;
							_ ->
								?ERROR("guild map destory, but in memory:~p,~p", [V, Request]),
								createMapLine(MapID, EnterGuildID, Request#recRequsetEnterMap.targetLine)
						end;
					[] ->
						createMapLine(MapID, EnterGuildID, Request#recRequsetEnterMap.targetLine)
				end;
			_ ->
				Request#recRequsetEnterMap.targetMapPID
		end,

	case MapID =:= ?GuildFairgroundMapID andalso MapPid =/= undefined of
		true ->
			case canEnterGuildFairground(MapID, MapPid) of
				true ->
					checkAndSendLeaveMapAck(MapPid, Request);
				_ ->
					psMgr:sendMsg2PS(Request#recRequsetEnterMap.rolePID, requestEnterMapAck, {?EnterMapErrorCode_EnterGuildHomeMap, Request})
			end;
		_ ->
			checkAndSendLeaveMapAck(MapPid, Request)
	end,
	ok;
leaveMapAck({true, #recRequsetEnterMap{roleID = RoleID, targetMapID = MapID, targetMapPID = TargetMapPid, targetLine = TargetLine} = Request}) ->
	case playerScene:getMapType(MapID) of
		?MapTypeNormal ->
			case erlang:is_pid(TargetMapPid) of
				true ->
					%%指定地图Pid，注意，这里是已经成功离开原地图的情况，那么必须给他创建一条普通地图线路进入，否则会卡住
					MPid =
						case mapMgrState:getMapInfo(TargetMapPid) of
							#recMapInfo{} = Info ->
								checkMapLine(MapID, RoleID, Info, TargetLine);
							_ ->
								?ERROR("cur line has destory:~p", [Request]),
								false
						end,
					case erlang:is_pid(MPid) of
						true ->
							checkAndSendLeaveMapAck(MPid, Request);
						_ ->
							%% 重新分配一个线路
							?INFO("leaveMapAck Success, but enter targetPid failed:~p,~p", [mapMgrState:getMapInfo(TargetMapPid), Request]),
							MapPID = allocMapLine(MapID, RoleID, true, Request#recRequsetEnterMap.targetLine),
							checkAndSendLeaveMapAck(MapPID, Request)
					end;
				_ ->
					%% 进入普通地图，分配一条地图线
					MapPID = allocMapLine(MapID, RoleID, true, Request#recRequsetEnterMap.targetLine),
					checkAndSendLeaveMapAck(MapPID, Request)
			end;
		?MapTypeActivity ->
			TargetPID = case Request#recRequsetEnterMap.targetMapPID of
							undefined ->
%% 								?ERROR("activity not found:~p", [Request]),
								allocMapLine(MapID, RoleID, false, Request#recRequsetEnterMap.targetLine);
							PID ->
								PID
						end,
			checkAndSendLeaveMapAck(TargetPID, Request);
		?MapTypeCopyMap ->
			leaveCopyMap(Request)
	end,
	ok;
leaveMapAck({_, #recRequsetEnterMap{rolePID = PID}} = Result) ->
	%% 返回给玩家进入，能否进入地图
	psMgr:sendMsg2PS(PID, requestEnterMapAck, Result),
	ok.

%% 能否进入指定普通地图的线路
canEnterNormalMapLine(_MapID, 0) ->
	true;
canEnterNormalMapLine(MapID, TargetLineID) ->
	MaxPlayerNum = getMaxNumber(MapID),
	case MaxPlayerNum > 0 of
		true ->
			case mapMgrState:getMapInfoByMapID(MapID) of
				[] ->
					false;
				MapInfoList ->
					case lists:keyfind(TargetLineID, #recMapInfo.line, MapInfoList) of
						#recMapInfo{
							isWaitDestroy = IsWaitDestroy,
							totalPlayerNum = Num,
							willEnterRoleIDList = WERList
%%							isReachMaxNum = IsReachMaxNum,
%%							createTime = CreateTime
						} ->
%%							Now = time:getUTCNowSec(),
							IsWaitDestroy =:= false
%%								andalso IsReachMaxNum =:= false
								andalso (Num + erlang:length(WERList)) < MaxPlayerNum;
%%								andalso Now - CreateTime < ?ForbidEnterTime;
						_ ->
							false
					end
			end;
		_ ->
			%%没有相应的地图配置
			false
	end.

canEnterNormalTargetPid(#recMapInfo{isWaitDestroy = true}) ->
	?ErrorCode_KingBattleNotHaveQuota;	%% 等待销毁
canEnterNormalTargetPid(#recMapInfo{
	id = MapID,
	willEnterRoleIDList = WillEnterList,
	totalPlayerNum = TotalPlayerNum}) ->
	MaxPlayerNum = getMaxNumber(MapID),
	case MaxPlayerNum > 0 of
		true ->
			case erlang:length(WillEnterList) + TotalPlayerNum < MaxPlayerNum of
				true ->
					true;
				_ ->
					%% 已经达到线路最大人数
					?ErrorCode_ChangeMapLineFailedCount
			end;
		_ ->
			?ErrorCode_ChangeMapLineFailed	%%没有相应的地图配置
	end.

leaveCopyMap(#recRequsetEnterMap{roleID = RoleID, targetMapID = MapID, teamID = TeamID} = Request) ->
	case canEnterCopyMap(Request) of
		ok ->
			%% 这里强制匹配了
			[
				#recCopyMapInfo{
					isWaitDestroy = false,
					mapPid = NewMapPid
				}
			] = gameMapMgrWorkerLogic:getCopyMapInfo(RoleID, TeamID, MapID),
			checkAndSendLeaveMapAck(NewMapPid, Request),
			ok;
		_ ->
			%% 这里不能创建新地图让他进！
			checkAndSendLeaveMapAck(undefined, Request)
	end,
	ok.

checkAndSendLeaveMapAck(MapPID, #recRequsetEnterMap{roleID = RoleID, rolePID = PID, targetMapID = MapID} = Request) ->
	%% 这里判定是否是PID，如果是PID则一定存活
	case erlang:is_pid(MapPID) of
		false ->
			ErrorCode =
				case MapPID of
					error ->
						?EnterMapErrorCode_CRITIAL;
					_ ->
						MapPID
				end,
			?WARN("RoleID [~p],leaveMapAck create new mapPid failed:~p,~p",[RoleID,MapPID,Request]),
			psMgr:sendMsg2PS(PID, requestEnterMapAck, {ErrorCode, Request});
		_ ->
			?INFO("RoleID [~p],leaveMapAck OK,TMap:~p,~p,SMap:~p,~p",
				[RoleID,MapID,MapPID,Request#recRequsetEnterMap.oldMapID,Request#recRequsetEnterMap.oldMapPID]),
			psMgr:sendMsg2PS(PID, requestEnterMapAck, {true, Request#recRequsetEnterMap{targetMapPID = MapPID}})
	end,
	ok.

%% 查看能否进入当前指定的副本
-spec canEnterCopyMap(#recRequsetEnterMap{}) -> ok | waitDestory | ErrorCode when ErrorCode::uint().
canEnterCopyMap(#recRequsetEnterMap{teamID = 0, targetMapID = CopyMapID, isFirstEnterMap = IsFirstEnterMap} = Request) ->
	case core:isSingleCopyMap(CopyMapID) of
		true ->
			canEnterSingleCopyMap(Request);
		_ ->
			case IsFirstEnterMap of
				true ->
					?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
				_ ->
					?EnterMapErrorCode_NoTeam
			end
	end;
canEnterCopyMap(
	#recRequsetEnterMap{
		teamID = TeamID,
		roleID = RoleID,
		targetMapID = CopyMapID,
		teamLeaderRoleID = LeaderID,
		isFirstEnterMap = IsFirstEnterMap
	} = Request) ->
	case gameMapMgrWorkerLogic:getCopyMapInfo(RoleID, TeamID, CopyMapID) of
		[#recCopyMapInfo{isWaitDestroy = true}] when IsFirstEnterMap =:= true ->
			?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
		[#recCopyMapInfo{isWaitDestroy = true}] ->
			waitDestory;
		[#recCopyMapInfo{mapPid = MapPID, ownerMemberIDList = RoleList, enteredMemberIDList = EnterList}] ->
			case lists:member(RoleID, RoleList) of
				true ->
					%% 队伍有这个副本的进度，再判断进入人数
					AllowMaxNum = getMaxNumber(CopyMapID),
					Len = length(EnterList),
					case AllowMaxNum >= Len of
						true ->
							?INFO("~p enterCopyMap teamID:~p, MapPid:~p, mapID:~p", [RoleID, TeamID, MapPID, CopyMapID]),
							ok;
						_ ->
							%% 人数已满
							?ERROR("~p enterCopyMap teamID:~p mapPid:~p,~p AllowMaxNum:~p, OwnerList:~p EnterList:~p",
								[RoleID, TeamID, CopyMapID, MapPID, AllowMaxNum, RoleList, EnterList]),

							case IsFirstEnterMap of
								true ->
									?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
								_ ->
									?EnterMapErrorCode_CopyMapMaxNum
							end
					end;
				_ ->
					%% 玩家所在的队伍拥有这个副本，但是玩家本身不属于这个副本，不允许进入
					?EnterMapErrorCode_PlayerNoBelongCopyMap
			end;
		[] ->
			case IsFirstEnterMap of
				true ->
					?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
				_ ->
					case RoleID =:= LeaderID of
						true ->
							?EnterMapErrorCode_TargetMapNotExist;
						_ ->
							?EnterMapErrorCode_CopyMapLeaderNotStart
					end
			end;
		Error ->
			?ERROR("canEnterCopyMap Request:~p,Error:~p", [Request, Error]),
			?EnterMapErrorCode_CRITIAL
	end.

canEnterSingleCopyMap(
	#recRequsetEnterMap{
		teamID = 0,
		roleID = RoleID,
		targetMapID = CopyMapID,
		isFirstEnterMap = IsFirstEnterMap
	} = Request) ->
	%% 单人副本，需要用角色ID+地图ID为组合Key，复用TeamID
	case gameMapMgrWorkerLogic:getCopyMapInfo(RoleID, 0, CopyMapID) of
		[#recCopyMapInfo{isWaitDestroy = true}] when IsFirstEnterMap =:= true ->
			?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
		[#recCopyMapInfo{isWaitDestroy = true}] ->
			waitDestory;
		[#recCopyMapInfo{mapPid = MapPID, ownerMemberIDList = [RoleID]}] ->
			?INFO("~p canEnterSingleCopyMap teamID:0, MapPid:~p, mapID:~p", [RoleID, MapPID, CopyMapID]),
			ok;
		[#recCopyMapInfo{mapPid = MapPID} = Info] ->
			%% 人数已满
			?ERROR("~p canEnterSingleCopyMap teamID:0, mapPid:~p,~p recCopyMapInfo:~p",
				[RoleID, CopyMapID, MapPID, Info]),

			case IsFirstEnterMap of
				true ->
					?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
				_ ->
					?EnterMapErrorCode_CopyMapMaxNum
			end;
		[] ->
			case IsFirstEnterMap of
				true ->
					?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
				_ ->
					?EnterMapErrorCode_TargetMapNotExist
			end;
		Error ->
			?ERROR("canEnterSingleCopyMap Request:~p,Error:~p", [Request, Error]),
			?EnterMapErrorCode_CRITIAL
	end.

%% 创建一个副本，并记录自己的进度
-spec createSelfCopyMap(Request::#recRequsetEnterMap{}) -> pid() | error.
createSelfCopyMap(
	#recRequsetEnterMap{
		roleID = RoleID,
		targetMapID = CopyMapID,
		roleLevel = RoleLevel,
		teamID = TeamID,
		guildID = GuildID} = Request) ->
	{SingleID, RoleIDList} =
		case core:isSingleCopyMap(CopyMapID) of
			true ->
				{gameMapMgrWorkerLogic:getSingleID(RoleID, CopyMapID), [RoleID]};
			_ ->
				{TeamID, gsTeamInterface:getTeamMemberRoleIDListWithTeamID(TeamID)}
%%				{TeamID, team2:getTeamRoleIDList(TeamID)}
		end,


	case RoleIDList of
		[] ->
			?ERROR("createSelfCopyMap no team:~p", [Request]),
			error;
		_ ->
			%% 保存副本拥有者
			MapPid = createMapLine(CopyMapID, RoleID, Request#recRequsetEnterMap.targetLine),
			case erlang:is_pid(MapPid) of
				true ->
					psMgr:sendMsg2PS(MapPid,createRoleLevelAndGuildID,{RoleLevel, TeamID, GuildID}),%把地图创建者等级和军团ID发给地图线PID

					?INFO("RoleID:~p createSelfCopyMap:~p,~p", [RoleID,CopyMapID,MapPid]),
					#mapsettingCfg{all_time = AT} = getCfg:getCfgByArgs(cfg_mapsetting, CopyMapID),

					%% 保存地图数据
					MapInfo = #recCopyMapInfo{
						mapID = CopyMapID,
						mapPid = MapPid,
						teamID = SingleID,
						isWaitDestroy = false,
						enteredMemberIDList = [],
						ownerMemberIDList = RoleIDList,
						destroyTime = time2:getUTCDateTimeSec() + AT
					},
					mapMgrState:setCopyMap(MapInfo),
					MapPid;
				_ ->
					?ERROR("createSelfCopyMap:~p,~p,~p SingleID:~p", [RoleID, CopyMapID, RoleLevel, SingleID]),
					error
			end
	end.

%% 换线时检查线路
%% 参照分配线路allocMapLine/3中对地图信息的验证
%% 主要区别是，这里指定地图尝试进入，如果地图满则不要创建新的地图，而是返回进入失败
-spec checkMapLine(MapID, RoleID, MapInfo, TargetLine) -> MapPid | ErrorCode when
	MapID::uint16(), RoleID::uint64(), MapInfo::#recMapInfo{}, MapPid::pid(), ErrorCode::uint(), TargetLine::uint().
checkMapLine(_MapID, _RoleID, #recMapInfo{isWaitDestroy = true}, _TargetLine) ->
	false;	%% 等待销毁
checkMapLine(MapID, RoleID, #recMapInfo{
	createTime = CreateTime,
	willEnterRoleIDList = WillEnterList,
	totalPlayerNum = TotalPlayerNum} = MapInfo, TargetLine) ->
	MaxPlayerNum = getMaxNumber(MapID),
	case MaxPlayerNum > 0 of
		true ->
			CanIn =
				case TargetLine of
					0 -> time:getUTCNowSec() - CreateTime < ?ForbidEnterTime;
					_ -> true
				end,
			case CanIn of
				true ->
					Len = erlang:length(WillEnterList) + TotalPlayerNum,
					case Len < MaxPlayerNum of
						true ->
							WEList =
								case lists:member(RoleID, WillEnterList) of
									true ->
										WillEnterList;
									_ ->
										[RoleID | WillEnterList]
								end,
							NewMapInfo =
								case Len + 1 >= MaxPlayerNum of
									true ->
										MapInfo#recMapInfo{
											willEnterRoleIDList = WEList,
											isReachMaxNum = true
										};
									_ ->
										MapInfo#recMapInfo{
											willEnterRoleIDList = WEList
										}
								end,
							MapPid = MapInfo#recMapInfo.pid,
							mapMgrState:setMapInfo(MapPid, NewMapInfo),
							case misc:is_process_alive(MapPid) of
								false ->
									mapMgrState:deleteMapInfo(MapPid),
									?ERROR("map pid is dead,delete:~p,~p,~p,~p",
										[MapID, RoleID, MapInfo, TargetLine]),
									false;	%% 线路无效
								_ ->
									MapPid
							end;
						_ ->
							%% 已经达到线路最大人数
							false
					end;
				_ ->
					false %% 地图生命周期将近
			end;
		_ ->
			false	%%没有相应的地图配置
	end.

%分配线路
-spec allocMapLine(MapID, RoleID,IsCheckRecycle,TargetLineID) -> MapPid | error when
	MapID::uint(),RoleID::uint(),MapPid::pid(),IsCheckRecycle::boolean(),TargetLineID::uint().
allocMapLine(MapID, RoleID, IsCheckRecycle, TargetLineID) ->
	MaxPlayerNum = getMaxNumber(MapID),
	case MaxPlayerNum > 0 of
		true ->
			case mapMgrState:getMapInfoByMapID(MapID) of
				[] ->
					%%之前还没有创建线路，现在创建
					createMapLine(MapID, RoleID, TargetLineID);
				MapInfoList ->
					%分配到人数最多的线
					Now = time:getUTCNowSec(),
					Func =
						fun(#recMapInfo{pid = Pid,
							isWaitDestroy = IsWaitDestroy,
							totalPlayerNum = Num,
							willEnterRoleIDList = WERList,
							isReachMaxNum = IsReachMaxNum,
							createTime = CreateTime,
							line = LineID
						}, {MapPid,N} = AccIn) ->
							case TargetLineID =:= 0 orelse TargetLineID =:= LineID of
								true ->
									%%这里检查是否达到过最大人数上限，以及是否是3天内创建的60 * 60 * 24 * 3 = 259200线路
									CanIn =
										case IsWaitDestroy of
											false ->
												case IsCheckRecycle of
													true ->
														%% 需要检查
														case TargetLineID of
															0 ->
																%% 没有指定线路时，需要检查是否过第一阶段
																Now - CreateTime < ?ForbidEnterTime;
															_ ->
																%% 有指定线路时，不需要检查是否过第一阶段
																true
														end;
													_ ->
														%% 不检查
														true
												end;
											_ ->
												%% 正在销毁了，不准切
												false
										end,
%%									case IsWaitDestroy =:= false andalso (not IsCheckRecycle orelse (IsCheckRecycle andalso Now - CreateTime < ?ForbidEnterTime)) of
									case CanIn of
										true ->
											?DEBUG("Pid[~p]IsCheckRecycle[~p]IsReachMaxNum[~p]Now - CreateTime[~p]",[Pid,IsCheckRecycle,IsReachMaxNum,Now - CreateTime]),
											WEPN = erlang:length(WERList),
											%%Num为当前地图人数，N为之前查找到的地图的最大人数
											%%优先往人数少的线路分配 2018-5-7 tiancheng
											case Num + WEPN >= MaxPlayerNum of
												false ->
													%% 可以进
													%% 优先进入人数少的地图
													case Num < N of
														true ->
															{Pid, Num};
														_ ->
															case MapPid of
																0 ->
																	{Pid, Num};
																_ ->
																	AccIn
															end
													end;
												_ ->
													%% 线路人数已满
													AccIn
											end;
										_ ->
											%%地图将要销毁或者不允许再进入
											AccIn
									end;
								_ ->
									AccIn
							end
						end,
					{MapPid, _} = lists:foldl(Func, {0, 0}, MapInfoList),
					case lists:keyfind(MapPid, #recMapInfo.pid, MapInfoList) of
						#recMapInfo{willEnterRoleIDList = WillEnterList, totalPlayerNum = TotalPlayerNum} = MapInfo ->
							WEList = case lists:member(RoleID, WillEnterList) of
										 true ->
											 WillEnterList;
										 _ ->
											 [RoleID | WillEnterList]
									 end,
							%%如果人数达到最大人数限制，则设置标志，此地图线不再让玩家进入，让此地图线的玩家慢慢离开了就销毁，以回收资源
							NewMapInfo = case IsCheckRecycle andalso erlang:length(WEList) + TotalPlayerNum >= MaxPlayerNum of
											 true ->
												 ?DEBUG("MapPid[~p]IsCheckRecycle[~p]Length[~p]TotalPlayerNum[~p]", [MapPid, IsCheckRecycle, erlang:length(WEList), TotalPlayerNum]),
												 MapInfo#recMapInfo{
													 willEnterRoleIDList = WEList,
													 isReachMaxNum = true
												 };
											 _ ->
												 MapInfo#recMapInfo{
													 willEnterRoleIDList = WEList
												 }
										 end,
							mapMgrState:setMapInfo(MapPid, NewMapInfo);
						_ ->
							skip
					end,
					case misc:is_process_alive(MapPid) of
						false ->
							case TargetLineID =:= 0 of
								true ->
									mapMgrState:deleteMapInfo(MapPid),
									%%如果分配线路失败（可能所有线路都已经达到最大数），则创建一新线
									createMapLine(MapID, RoleID, 0);
								_ ->
									error
							end;
						_ ->
							MapPid
					end
			end;
		_ ->
			%%没有相应的地图配置
			error
	end.

%创建地图新线，不管该地图上的线是否承载已经满
-spec createMapLine(MapID, RoleID, LineID) -> MapPid when
	MapID::uint(),RoleID::uint(),MapPid::pid() | error,LineID::uint().
createMapLine(MapID, RoleID, LineID) when erlang:is_integer(MapID) ->
	MapCfg = core:getMapCfg(MapID),
	MaxLine = mapMgrState:getMapMaxLine(MapID),
	Line = case LineID =:= 0 of
%%			   true -> allocLineID(MapID);
			   true -> MaxLine + 1;
			   _ -> LineID
		   end,
	Args = #recCreateMapArg{
		mapId = MapID,
		mapLine = Line,
		createRoleID = RoleID,
		mapCfg = MapCfg
	},

	Ret = gameMapSup:start_child(Args),
	case Ret of
		{ok,Pid0} ->
			?INFO("~p CreateMap[~p] Pid:~p",[self(),MapID,Pid0]),
			MapInfo = #recMapInfo{
				id = MapID,
				pid = Pid0,
				line = Line,
				totalPlayerNum = 0,
				isReachMaxNum = false,
				createTime = time:getUTCNowSec()
			},
			mapMgrState:setMapMaxLine(MapID,erlang:max(Line, MaxLine)),
			mapMgrState:setMapInfo(Pid0, MapInfo),
			Name = erlang:list_to_atom(lists:concat(["mapOtp",integer_to_list(MapID),"_",integer_to_list(Line)])),
			try
				ets:insert(?MapInfoEts,#recMapPidInfo{pid = Pid0,mapID = MapID}),
				psMgr:sendMsg2PS(?PsNameOperateActivity,createNewMap,{MapID,Pid0}),
				erlang:register(Name,Pid0)
			catch
				_:_ ->
					?ERROR("MapPid:~p register Name:~p failed",[Pid0,Name])
			end,
			Pid0;
		_ ->
			?ERROR("Create Map[~p] Line:~p Failed,Ret:~p",[MapID,Line,Ret]),
			error
	end.

%allocLineID(MapID) ->
%	case mapMgrState:getMapInfoByMapID(MapID) of
%		[] -> 1;
%		[#recMapInfo{}|_] = List ->
%			Len = erlang:length(List),
%			F =
%				fun(#recMapInfo{line = LineID}, AccL) ->
%					lists:delete(LineID, AccL)
%				end,
%			case lists:foldl(F, lists:seq(1, Len + 1), List) of
%				[LID|_] -> LID;
%				_ ->
%					mapMgrState:getMapMaxLine(MapID) + 1
%			end
%	end.

getMaxNumber(MapID) ->
	case mapMgrState:getSpecialMaxPlayerNumber(MapID) of
		undefined ->
			case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				#mapsettingCfg{maxnum = MaxNum} ->
					MaxNum;
				_ ->
					0
			end;
		Num ->
			Num
	end.

sendErrorCodeToRole(RoleID, ErrorCode) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode);
		_ ->
			skip
	end,
	ok.