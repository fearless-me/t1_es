%%
%%%游戏地图进程，每张地图一个进程
%%%游戏地图进程主要负责玩家的战斗、怪物及怪物的AI等等功能
-module(gameMapOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("mapPrivate.hrl").
-include("copyMapScheduleDefine.hrl").
-include("activityDef.hrl").

-define(GC_TIME_MIN, 10*60*1000).
-define(GC_TIME_MAX, 20*60*1000).

%% 8小时后强制回收，本宏与gameMapMgrWorkerOtp:ForbidEnterTime宏对应
-define(DestroyNormalTime, 8*3600*1000).
-define(DestroyNormalTime2, 60*1000).
-define(DestroyNormalTimeNumber, 5).
%%-define(DestroyNormalTime2, 20*1000).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).

%% 为了配合GC，暂时写到这里
-export([
	setMapGCTime/1
]).

start_link(#recCreateMapArg{} = CreateMapArg) ->
	myGenServer:start_link2(?MODULE, [CreateMapArg], [{timeout, 60000}]).

init([#recCreateMapArg{mapId = MapID, mapLine = MapLine, createRoleID = CreateRoleID}] = Msg) ->
	%% 对象数据管理ETS
	PlayerEts = ets:new(mapPlayerEts, [public, {keypos, #recMapObject.code}, {write_concurrency, true}, {read_concurrency, true}]),
	MonsterEts = ets:new(mapMonsterEts, [public, {keypos, #recMapObject.code}, {write_concurrency, true}, {read_concurrency, true}]),
	NpcEts = ets:new(mapNcEts, [public, {keypos, #recMapObject.code}, {write_concurrency, true}, {read_concurrency, true}]),
	PetEts = ets:new(mapPetEts, [public, {keypos, #recMapObject.code}, {write_concurrency, true}, {read_concurrency, true}]),
	CollectEts = ets:new(mapCollectEts, [protected, {keypos, #recMapObject.code}, {write_concurrency, true}, {read_concurrency, true}]),
	UseItemEts = ets:new(mapUseItemEts, [protected, {keypos, #recMapObject.code}, {write_concurrency, true}, {read_concurrency, true}]),
	ReviveNumEts = ets:new(mapPlayerReviveEts, [protected, {keypos, #recMapRevive.id}, {write_concurrency, true}, {read_concurrency, true}]),

	%% 同屏策略
	ScreenEts = playerScreen:initINMap(),

	mapState:setMapId(MapID),
	mapBase:setMapType(MapID),
	mapState:setMapLine(MapLine),

	mapState:setMapScreenEts(ScreenEts),
	mapState:setMapPlayerEts(PlayerEts),
	mapState:setMapPetEts(PetEts),
	mapState:setMapMonsterEts(MonsterEts),
	mapState:setMapNpcEts(NpcEts),
	mapState:setMapCollectEts(CollectEts),
	mapState:setMapUseItemEts(UseItemEts),
	mapState:setMapPlayerNum(0),
	mapState:setMapOwnerID(0, CreateRoleID),
	mapState:setMapReviveEts(ReviveNumEts),

	case MapID of
		?GuildFairgroundMapID ->
			case uidMgr:getUIDType(CreateRoleID) of
				?UID_TYPE_Guild ->
					?INFO("create guild map guildid=~p, mapid=~p pid=~p", [CreateRoleID, MapID, self()]),
					ets:insert(?EtsGuildFairground, #recGuildFairground{mapPid = self(), guildID = CreateRoleID, playerEts = PlayerEts});
				_ ->
					?ERROR("create guild map error:~p,~p,~p", [CreateRoleID, MapID, self()]),
					skip
			end;
		_ ->
			skip
	end,

	%% 怪物初始化
	monsterInterface:init(),

	%% 昼夜初始化
	gameMapDayNight:init(MapID),

	?INFO("~p ~p init:mapid=~p, mapline=~p", [?MODULE, self(), MapID, MapLine]),

	%% 延时初始化其它的数据
	erlang:send_after(100, self(), {delay_init_tick, Msg}),
	tickGC(),
	tickDestroy(),
	{ok, {}}.

tickGC() ->
	case mapState:getMapType() of
		?MapTypeNormal ->
			erlang:send_after(getMapGCTime(), self(), delay_gc),
			ok;
		_ ->
			skip
	end,
	ok.

getMapGCTime() ->
	case get('MapGCTime') of
		undefined ->
%%			misc:rand(?GC_TIME_MIN, ?GC_TIME_MAX);
			misc:rand(5*60*1000, 10*60*1000);
%%			misc:rand(30*1000, 60*1000);
		V ->
			V
	end.
setMapGCTime(undefined) ->
	erlang:erase('MapGCTime');
setMapGCTime(GCTime_Minute) ->
	put('MapGCTime', GCTime_Minute * 60 * 1000).

tickDestroy() ->
	case mapState:getMapType() of
		?MapTypeNormal ->
			erlang:send_after(?DestroyNormalTime, self(), tickMaxDestroy);
		_ ->
			skip
	end.

%%handle_call({<<"getMapMonsterEts">>, _}, _From, State) ->
%%	{reply, {ok, mapState:getMapMonsterEts()}, State};
%%handle_call({<<"getMapPlayerEts">>, _}, _From, State) ->
handle_call(_Req, _From, State) ->
	{noreply, State}.

handle_cast({forceModifyMapLineID, _Pid, LineID}, State) ->
	?INFO("forceModifyMapLineID:~p,~p,~p", [self(), mapState:getMapId(), LineID]),
	mapState:setMapLine(LineID),
	{noreply, State};

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_info(Msg, State) ->
	Time1 = time2:getTimestampMS(),
	Ret = handle_info_msg(Msg, State),
	Time2 = time2:getTimestampMS(),

%%	?WARN("handle_info:~p,~p", [Msg, Time2 - Time1]),
	mapState:updateMapTJMsg(Msg, Time2 - Time1),
	Ret.

handle_info_msg({gm_execfun, _Pid, Fun}, State) ->
	Ret = Fun(),
	?INFO("map_execfun ret:~p", [Ret]),
	{noreply, State};

handle_info_msg(starttj, State) ->
	mapState:startMapTJ(),
	{noreply, State};

handle_info_msg({starttick, Int}, State) ->
	mapState:setPrintTickLog(misc:i2b(Int)),
	{noreply, State};

handle_info_msg(printtj, State) ->
	mapState:printTJ(),
	{noreply, State};

%% 注意，这里设置的是毫秒,Tick1是怪物复活处理,Tick2是怪物除复活外的其它处理CD
handle_info_msg({setTick, Tick1, Tick2}, State) ->
	case erlang:is_integer(Tick1) andalso erlang:is_integer(Tick2) of
		true ->
			?INFO("setTick:~p,~p", [Tick1, Tick2]),
			mapState:setMapTickInternal({Tick1, Tick2});
		_ ->
			skip
	end,
	{noreply, State};

handle_info_msg({delay_send_createmapmsg_to_activity, CreateRoleID}, State) ->
	%% 创建地图
	gameMapActivityLogic:createMap(CreateRoleID),
	{noreply, State};

%地图更新
handle_info_msg(tick, State) ->
	mapBase:tick(),
	{noreply, State};

%延时初始化
handle_info_msg({delay_init_tick, Msg}, State) ->
	gameMapLogic:init(Msg),
	%% 创建额外的NPC
	MapID = mapState:getMapId(),
	case rideInterface:canAddRideNpc(MapID) of
		true ->
			psMgr:sendMsg2PS(?RideOtp, createNormalMap, {MapID, self()});
		_ ->
			skip
	end,
	{noreply, State};

handle_info_msg(tickMaxDestroy, State) ->
	?INFO("mapWillDestroySelf tickMaxDestroy:~p,~p, ~p",
		[mapState:getMapId(), self(), ets:info(mapState:getMapPlayerEts(), size)]),
	%% 告诉地图不允许再进人了
	MapID = mapState:getMapId(),
	core:sendMsgToMapMgr(MapID, prepareDestory, {MapID, self()}),

	%% 后强制回收
	Content = stringCfg:getString(changeLine_Tips, [?DestroyNormalTimeNumber]),
	ChatInfo = playerChat:getSystemChatInfo(Content),
	Msg = #pk_GS2U_MsgBoxTips{code = ?GS_2_LS_CHECKACCOUNT_RESULT_CHANGE_MAPLINE, msg = integer_to_list(?DestroyNormalTimeNumber)},
	F =
		fun(#recMapObject{netPid = NetPid}, _) ->
			gsSendMsg:sendNetMsg(NetPid, Msg),
			gsSendMsg:sendNetMsg(NetPid, ChatInfo)
		end,
	ets:foldl(F, 0, mapState:getMapPlayerEts()),

	erlang:send_after(?DestroyNormalTime2, self(), {tickMaxDestroy2, ?DestroyNormalTimeNumber - 1}),
	{noreply, State};

handle_info_msg({tickMaxDestroy2, 0}, State) ->
	%% 时间到，把当前线路仍然存在的玩家强制切换新线路
	?INFO("mapWillDestroySelf tickMaxDestroy2:~p,~p, ~p",
		[mapState:getMapId(), self(), ets:info(mapState:getMapPlayerEts(), size)]),

	F =
		fun(#recMapObject{pid = Pid}, _) ->
			psMgr:sendMsg2PS(Pid, mapWillDestroySelf, 0)
		end,
	ets:foldl(F, 0, mapState:getMapPlayerEts()),
	{noreply, State};

handle_info_msg({tickMaxDestroy2, N}, State) ->
	%% 继续提示
	Content = stringCfg:getString(changeLine_Tips, [N]),
	ChatInfo = playerChat:getSystemChatInfo(Content),
	F =
		fun(#recMapObject{netPid = NetPid}, _) ->
			gsSendMsg:sendNetMsg(NetPid, ChatInfo)
		end,
	ets:foldl(F, 0, mapState:getMapPlayerEts()),

	erlang:send_after(?DestroyNormalTime2, self(), {tickMaxDestroy2, N - 1}),
	{noreply, State};

handle_info_msg(tickFreshWildBoss, State) ->
	mapWildBoss:tick(),
	erlang:send_after(60000, self(), tickFreshWildBoss),
	{noreply, State};

%% 优化：发送消息给可能存在的地图进程进行刷怪，避免心跳误差产生的大概率刷新延迟现象
%% 4.额外执行一次野外BOSS心跳
handle_info_msg({wildbossFresh, _, _}, State) ->
	?DEBUG("[DebugForWildBoss] wildbossFresh"),
	mapWildBoss:tick(),
	{noreply, State};

handle_info_msg({getMonsterProp, Pid, Code}, State) ->
	PropList = creatureBase:getMonsterProp(Code),
	psMgr:sendMsg2PS(Pid, getMonsterPropAck, PropList),
	{noreply, State};

handle_info_msg({spawnCollect, Pid, {ActID, List}}, State) ->
	ObjList = mapBase:spawnAllCollect(List),
	psMgr:sendMsg2PS(Pid, spawnCollectAck, {ActID, mapState:getMapId(), ObjList}),
	{noreply, State};

%% 采集物品
handle_info_msg({requestGatherItem, PidFrom, Msg}, State) ->
	Ret = gatherNpcMgr:requestGatherItem(Msg),
	psMgr:sendMsg2PS(PidFrom, requestGatherItemAck, {Ret, Msg}),
	{noreply, State};

%% 更新NPC出现的坐标位置
handle_info_msg(tickUpdateNpcPos, State) ->
	case npcMove:updateMoveNpcPos() of
		false -> skip;
		CD when erlang:is_integer(CD) ->
			erlang:send_after(CD * 1000, self(), tickUpdateNpcPos)
	end,
	{noreply, State};

%%记录地图线创建者等级和军团ID
handle_info_msg({createRoleLevelAndGuildID, _Pid, {RoleLevel, TeamID, GuildID}}, State) ->
	mapState:setMapLevel(0, RoleLevel),
%%军团副本的话保存军团ID和军团队伍ID
	case GuildID > 0 of
		true ->
			mapState:setGuildID(GuildID),
			mapState:setTeamID(TeamID);
		_ ->
			skip
	end,

	{noreply, State};

%%执行回调（地宫类）
handle_info_msg({mapOtpAfterDo, Fun}, State) when erlang:is_function(Fun, 0) ->
	Fun(),
	{noreply, State};

%%产指定怪（新地宫）
%%handle_info_msg({randAddMonster, _Pid, {LocationInstanceList, MapLevel}}, State) ->
%%	copyMapGoddess:createMonster(LocationInstanceList, MapLevel),
%%	{noreply, State};

%%沙盘PVP，雕像
handle_info_msg({createExpeditionOccGuildStatue, _Pid, Param}, State) ->
	gameMapGuildExpedition:createStatue(Param),
	{noreply, State};

handle_info_msg({createExpeditionPointOwnerGuildBannerNpc, _Pid, Param}, State) ->
	gameMapGuildExpedition:createBannerNpc(Param),
	{noreply, State};

handle_info_msg({tickUpdateMonsterPos, _Pid, {Code, X, Y}}, State) ->
	monsterState:setMonsterPos(Code, X, Y),
	{noreply, State};

%%%%王者战天下结束，广播给参与者
%%handle_info_msg({activityEnd, _Pid}, State) ->
%%  gameMapAcKingBattleAll:activityEnd(),
%%  {noreply, State};

%%王者战天下，产王者雕像
handle_info_msg({createKingStatueToMap, _Pid}, State) ->
	gameMapAcKingBattleAll:createKingStatueToMap(),
	{noreply, State};

%%王者战天下，产王者镜像
handle_info_msg({createKingMirroringToMap, _Pid}, State) ->
	gameMapAcKingBattleAll:createKingMirroringToMap(),
	{noreply, State};

%%将王者虚无
handle_info_msg({addBuff4KingMarror, _Pid, BuffID}, State) ->
	case acKingBattleAllLogic:getCurrentDefenderInfo() of
		{ok, #rec_guard_mirror{
			roleID = RoleID,
			mirrorBuffCfgID = MirrorBiffCfgID
		}} ->
			case getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, MirrorBiffCfgID) of
				#acKingBattleBuyBuffCfg{buffID = BuffID} ->
					case acKingBattleAllLogic:getMirrorInfo(RoleID) of
						{ok, {MonsterID, _X1, _Y1}} ->
							gameMapAcKingBattleAll:addBuffToMirror(MonsterID, BuffID);
						_ ->
							?ERROR(" add buf 2 mirro fail BuffID=~p,RoleID=~p", [BuffID, RoleID]),
							skip
					end;
				Error ->
					?ERROR("addBuff4KingMarror RoleID:~p,BuffID:~p,MirrorBiffCfgID:~p error:~p", [RoleID, BuffID, MirrorBiffCfgID, Error]),
					skip
			end;
		R ->
			?ERROR(" add buf 2 mirro fail BuffID=~p,defender info is none,info=~p", [BuffID, R]),
			skip
	end,
	{noreply, State};

%%cs广播大区伤害前20名
handle_info_msg({boardcastDamageRank, _Pid, _Rank}, State) ->
%%	acWorldBossLogic:boardcastDamageRank(Rank),
	{noreply, State};

%%BOSS战位面根据进度给位面产怪
handle_info_msg({addMonsterBySchedule, ScheduleNum}, State) ->
	?DEBUG("addMonsterBySchedule:~w", [ScheduleNum]),
%%	acWorldBossLogic:initSchedule(ScheduleNum),
	{noreply, State};

%% 初始化位面分组
handle_info_msg({initBitCopyMap, _Pid, {NewGroupID, _GroupMapID, Code, _RolePID}}, State) ->
%% 设置副本的创建者等级
	case myEts:lookUpEts(mapState:getMapPlayerEts(), Code) of
		[#recMapObject{level = Level}] ->
			mapState:setMapLevel(NewGroupID, Level);
		_ ->
			skip
	end,
	gameMapLogic:initHomeBitMapData(NewGroupID),
%% fixme 延时初始化
	mapState:setGroupMapDelayInit(NewGroupID, true),
%% 	gameMapLogic:initCopyMapSchedule(NewGroupID),
	{noreply, State};

%玩家进入地图
handle_info_msg({enterMap, Pid, #recEnterMap{mapId = MapID, x = X, y = Y, id = ID, pid = PID} = EnterMap}, State) ->
	case mapState:getWaitForceDestory() of
		true ->
%%如果玩家进入的普通地图恰好在此时将要销毁，则需要玩家进程重新走流程进入另一条地图线
			case mapState:getMapType() of
				?MapTypeNormal ->
					?ERROR("map[~p][~p] WaitForceDestory, player[~p][~p] try to enter other mapline",
						[mapState:getMapId(), self(), ID, PID]),
					psMgr:sendMsg2PS(Pid, enterMapAck, {waitDestory, MapID, X, Y});
				_ ->
					?ERROR("map[~p][~p] WaitForceDestory, player[~p][~p] cannot enter",
						[mapState:getMapId(), self(), ID, PID]),
					psMgr:sendMsg2PS(Pid, enterMapAck, {waitDestory, MapID, X, Y})
			end;
		_ ->
			mapBase:onEnterMap(EnterMap)
	end,
	{noreply, State};

%% 玩家离开地图
handle_info_msg({leaveMap, PidFrom, #recRequsetEnterMap{code = Code, petCodeList = PetCodeList} = Request}, State) ->
	Ret = mapBase:onLeaveMap(Code, PetCodeList),
	psMgr:sendMsg2PS(PidFrom, leaveMapAck, {Ret, Request}),
	{noreply, State};

%% 管理员玩家离开地图
handle_info_msg({gm_leaveMap, _PidFrom, {Code, PetCodeList}}, State) ->
	mapBase:onLeaveMap(Code, PetCodeList),
	{noreply, State};

handle_info_msg({gm_setmapday, _PidFrom, DayID}, State) ->
	?INFO("gm_setmapday mapID:~p, DayID:~p", [mapState:getMapId(), DayID]),
	NowTime = misc_time:milli_seconds(),
	Day = gameMapDayNight:getMapDay(),
	case DayID of
		0 ->
			mapState:setLastTickDayNightTime(NowTime);
		1 ->
			mapState:setLastTickDayNightTime(NowTime + 3600 * 1000),

%% 强制设置为白天
			case Day of
				false ->
					gameMapDayNight:setMapDay(true),
					gameMapDayNight:changeDayNight(true);
				_ -> skip
			end;
		_ ->
			mapState:setLastTickDayNightTime(NowTime + 3600 * 1000),

%% 强制设置为黑夜
			case Day of
				true ->
					gameMapDayNight:setMapDay(false),
					gameMapDayNight:changeDayNight(false);
				_ -> skip
			end
	end,
	{noreply, State};

%% 玩家真正进入地图了
handle_info_msg({playerEntermap, PID, {PlayerCode, GroupID}}, State) ->
	PlayerEts = mapState:getMapPlayerEts(),
	?INFO("~p ~p playerEntermap:~p, ~p, ~p, ~p", [?MODULE, self(), mapState:getMapType(), PID, PlayerCode, GroupID]),
	case myEts:lookUpEts(PlayerEts, PlayerCode) of
		[#recMapObject{id = RoleID, groupID = GID, netPid = NetPid} = RoleObj] ->
			case GID /= GroupID of
				true ->
					?ERROR("playerEntermap:~p,~p,~p,~p", [PlayerCode, GroupID, GID, myEts:lookUpEts(PlayerEts, PlayerCode)]);
				_ ->
					skip
			end,

%% fixme 判断是否是分组，且是否延时初始化
			case GroupID > 0 of
				true ->
					case mapState:getGroupMapDelayInit(GroupID) of
						false ->
%% 已经初始化过了
							skip;
						_ ->
%% true or undefined
							gameMapLogic:initCopyMapSchedule(GroupID)
					end;
				_ ->
					skip
			end,

			case mapBase:isCopyAndBitMap(GroupID) of
				true ->
%% 发送副本进度信息给这个人
					case copyMapScheduleComplete:getCopyMapProcessRec(GroupID) of
						#pk_GS2U_CopyMapProcess{} = R ->
							psMgr:sendMsg2PS(PID, copymapProcess, {R});
						_ ->
							skip
					end,

%% 发送阻挡NPC状态给这个人
					List = copyMapScheduleState:getOpenBlockList(GroupID),
					Fun = fun(BlockStringID) ->
						#pk_BlockStatusChange{
							blockName = BlockStringID,
							blockStatus = ?BlockNpc_Open
						}
						  end,
					Msg = lists:map(Fun, List),
					psMgr:sendMsg2PS(PID, broadcast, #pk_GS2U_BlockStatusChange{changes = Msg}),

%% 勇士试炼副本特殊处理
					SubMapType = mapState:getMapSubType(),

					case SubMapType =:= ?MapSubTypeWarrior of
						true ->
%%通知玩家已经进入勇士试炼副本
							psMgr:sendMsg2PS(PID, warriorTrialEnterMap, {});
						_ ->
							skip
					end,
					ok;
				_ ->
					skip
			end,
			gameMapLogic:sendMapLeftTimeToMapPlayer(NetPid),
%%			copyMapGoddess:initFirstSchedule4demonBattle(PID),
			gameMapActivityLogic:playerEnterACMap(RoleID, RoleObj),

%% 同步全图血怪给客户端
			FMap =
				fun(#recMapObject{type = OType, id = MID} = Obj, AccList) ->
					case OType of
						?ObjTypeMonster ->
							case monsterInterface:isMonsterShowMapHP(MID) of
								true -> [Obj | AccList];
								_ -> AccList
							end;
						_ -> AccList
					end
				end,
			case ets:foldl(FMap, [], mapState:getMapMonsterEts()) of
				[] -> skip;
				MonsterMapList ->
%% 需要全图血量同步的怪物
					MonsterInfoList = playerMap:findMonsterInfoList(MonsterMapList),
					gsSendMsg:sendNetMsg(NetPid, #pk_GS2U_MonsterList{monster_list = MonsterInfoList})
			end,
			ok;
		_ ->
			?ERROR("~p ~p playerEntermap:code=~p, but not in ets", [?MODULE, self(), PlayerCode]),
			skip
	end,
	{noreply, State};

handle_info_msg({gmTest_riftnpcmove, _Pid, Msg}, State) ->
	npcMove:gmTest_riftnpcmove(Msg),
	{noreply, State};

handle_info_msg({gmTest_freshriftnpcpos, _Pid, _Msg}, State) ->
	npcMove:updateMoveNpcPos(),
	{noreply, State};

handle_info_msg({playerOffline, _Pid, {PlayerCode, PetCodeList}}, State) ->
	PlayerEts = mapState:getMapPlayerEts(),
	case myEts:lookUpEts(PlayerEts, PlayerCode) of
		[#recMapObject{id = RoleID, groupID = GroupID}] ->
			gameMapActivityLogic:playerOffline(RoleID, GroupID);
		_->
			skip
	end,
	mapBase:onLeaveMap(PlayerCode, PetCodeList),
	{noreply, State};

handle_info_msg({delHate_AttackDir, _Pid, {PlayerCode, MonsterCode}}, State) ->
	monsterAttackDir:delHate(PlayerCode, MonsterCode),
	{noreply, State};

handle_info_msg({playerDead, _Pid, {_PlayerCode, GroupID}}, State) ->
	Times = mapState:getAllPlayersDeadTimes(GroupID),
	mapState:setAllPlayersDeadTimes(GroupID, Times + 1),
	{noreply, State};

handle_info_msg({clearBitMapPlayer, _Pid, GroupID}, State) ->
	?INFO("~p ~p clearBitMapPlayer:~p", [?MODULE, self(), GroupID]),
%% 通知这个分组里所有人，离开位面
	gameMapLogic:kickAllPlayer(GroupID),
	{noreply, State};

handle_info_msg({clearMonsterAndCollectObject, _Pid, GroupID}, State) ->
	?INFO("~p ~p clearMonsterAndCollectObject:~p", [?MODULE, self(), GroupID]),
	gameMapLogic:clearGroupAllObject(GroupID),
	{noreply, State};


handle_info_msg({clearGroupAllObject, _Pid, GroupID}, State) ->
	?INFO("~p ~p clearGroupAllObject:~p", [?MODULE, self(), GroupID]),
	gameMapLogic:clearGroupAllObject(GroupID),
	gameMapLogic:kickAllPlayer(GroupID),
%%	acWorldBossLogic:clearGroupID(mapState:getMapId(), GroupID),
	{noreply, State};

handle_info_msg({goonCopyMap, _Pid, Data}, State) ->
	?INFO("~p ~p goonCopyMap:~p,~p", [?MODULE, self(), mapState:getMapId(), Data]),
	mapState:setGoonCopyMapState(true),
	{noreply, State};

%%摧毁地图，只能是自己给自己发摧毁消息
handle_info_msg({destory, Pid, {}}, State) when Pid =:= self() ->
	MapID = mapState:getMapId(),
	?INFO("MapOtp Destory Map[~p, ~p]", [MapID, self()]),

%%	%% 清理野外BOSS
%%	mapWildBoss:mapRestoryWildBossKilled(),

%% 清理地图中的玩家
	gameMapLogic:kickAll(),

%% 通知活动进程地图销毁
	gameMapActivityLogic:destoryMap(),

%% 如果是家园，则销毁家园地图
	homeInterface:destroyHomeMap(MapID, self()),

%% 销毁军团地图
	case MapID of
		?GuildFairgroundMapID ->
			case playerGuildFairground:getGuildFairground(self()) of
				#recGuildFairground{guildID = GuildID} when GuildID > 0 ->
					ets:delete(?EtsGuildFairground, GuildID);
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	psMgr:sendMsg2PS(gameMapBossOtp, destroyMap,{self(), mapState:getMapId(), mapState:getMapLine()}),
%% 留一定时间，让玩家切换出去
	erlang:send_after(?MapRealDestoryTime, self(), reallyDestorySelf),
	{noreply, State};

%% 真正销毁自己
handle_info_msg(reallyDestorySelf, State) ->
	?INFO("reallyDestorySelf Map[~p] Ets:~p,~p,~p,~p",
		[
			self(),
			mapState:getMapPlayerEts(),
			mapState:getMapMonsterEts(),
			mapState:getMapNpcEts(),
			mapState:getMapPetEts()
		]),

	MapID = mapState:getMapId(),
	case rideInterface:canAddRideNpc(MapID) of
		true ->
			psMgr:sendMsg2PS(?RideOtp, mapDestroy, self());
		_ ->
			skip
	end,

	gameMapLogic:eraseGroup(0),

	case mapState:getGoonCopyMapState() of
		true -> skip;
		_ ->
			core:sendMsgToMapMgr(MapID, destoryMap, {MapID, self()})
	end,
	mapBase:reclaimAllCode(),

%% 回收助战地图
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap} ->
%% 删除助战数据
			MS = ets:fun2ms(fun(#recAssistCopyMap{mapPID = MapPID} = Apply) when MapPID =:= self() -> Apply end),
			L = ets:select(ets_recAssistCopyMap, MS),
			[ets:delete_object(ets_recAssistCopyMap, AY) || AY <- L],
			ok;
		_ ->
			skip
	end,
	{stop, normal, State};

handle_info_msg({resetCopyMap, _Pid, _}, State) ->
	?INFO("~p ~p resetCopyMap", [?MODULE, self()]),
	MapID = mapState:getMapId(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap} ->
%%准备销毁本副本进程，并且不再允许玩家进入此地图进程，
%%重置后再进入，则是进入另一个地图进程
			gameMapLogic:prepareDestroy(0, true);
		#mapsettingCfg{type = ?MapTypeActivity} ->
%% 重置活动地图
			gameMapLogic:prepareDestroy(0, true);
		_ ->
			skip
	end,
	{noreply, State};

%% 玩家在副本中采集了一次
handle_info_msg({collectItem, _Pid, {_Code, CollectObjectID, GroupID, Num}}, State) ->
%% 	GroupID = gameMapLogic:getObjGroupID(mapState:getMapCollectEts(), Code),
%% 是副本才处理
	case mapBase:isCopyAndBitMap(GroupID) of
		true ->
			copyMapScheduleComplete:collectItemInCopyMap(GroupID, CollectObjectID, Num);
		_ ->
			skip
	end,
	{noreply, State};

%% 请求查看时空裂痕npc时间
handle_info_msg({requestRiftNpcInfo, PidFrom, NpcCode}, State) ->
	CDTime = npcMove:getNpcChangeMoveCDTime(),
	CHTime = case mapState:getNpcChangePosTime(NpcCode) of
				 undefined ->
					 0;
				 Time ->
					 Time
			 end,
	NowTime = misc_time:utc_seconds(),
	psMgr:sendMsg2PS(PidFrom, requestRiftNpcInfoAck, {NpcCode, erlang:max(0, CDTime - (NowTime - CHTime))}),
	{noreply, State};

%% 地图开始哥布林玩法
handle_info_msg({goblinBegin, TimeGone}, State) ->
%%如果时间已经过了刷boss的时间就直接刷
	case TimeGone >= ?GoblinBossSpawnTime of
		true ->
			goblinLogic:spawnBoss();
		_ ->
			erlang:send_after((?GoblinBossSpawnTime - TimeGone) * 1000, self(), goblinBossBegin)
	end,
	case TimeGone > 60 of
		true ->
			?INFO("goblinBegin TimeGone[~p] > 60, won't spawn goblin!", [TimeGone]),
			skip;
		_ ->
			goblinLogic:spawnGoblin()
	end,
%地图创建时，刷哥布林时间过了一分钟就这次就不再刷了普通哥布林

	erlang:send_after((?GoblinTotalTime - TimeGone) * 1000, self(), goblinEnd),
%%一天后再刷
	erlang:send_after((?One_Day_Second - TimeGone) * 1000, self(), {goblinBegin, 0}),

	{noreply, State};

%% 地图开始产出哥布林boss
handle_info_msg(goblinBossBegin, State) ->
	goblinLogic:spawnBoss(),
	{noreply, State};

%% 哥布林玩法结束
handle_info_msg(goblinEnd, State) ->
	goblinLogic:destoryAllGoblin(),
	{noreply, State};

%% 军团副本发奖励
handle_info_msg({queryCopyMapAwardMemberListAck, _FromPid, {AwardIDList, OtherIDList, Plan, BossName}}, State) ->
	psMgr:sendMsg2PS(?PsNamePlayerMgr, sendGuildCopyAward, {AwardIDList, OtherIDList, Plan, BossName}),
	{noreply, State};

handle_info_msg({initMapConvoy, _Pid, Data}, State) ->
	gameMapConvoy:initMapConvoy(Data),
	{noreply, State};

handle_info_msg({convoyEnd, _Pid, Data}, State) ->
	gameMapConvoy:convoyEnd(Data),
	{noreply, State};

%% 护送按实力刷怪
handle_info_msg({addMonsterToMap_EscortPower, _Pid, Data}, State) ->
	copyMapScheduleInit:addMonsterToMap_EscortPower(Data),
	{noreply, State};

%% 护送马车血量控制
handle_info_msg({addMonsterToMap_EscortGharry, _Pid, Data}, State) ->
	copyMapScheduleInit:addMonsterToMap_EscortGharry(Data),
	{noreply, State};

%% 刷新指定路径的马车怪
handle_info_msg({addMonsterToMap_WayLineTargetPosList, _Pid, {GroupID, MonsterList, TargetPosList}}, State) ->
	List = copyMapScheduleInit:getMapObjDataList(GroupID, MonsterList, ?AddMonsterRange),
	mapBase:spawnAllMonster(List,undefined,0,0,TargetPosList),
	{noreply, State};

%% 刷军团阵营怪
handle_info_msg({addMonsterToMap_GuildMonster, _Pid, {GroupID, Radius, GuildID, MonsterList}}, State) ->
	List = copyMapScheduleInit:getMapObjDataList(GroupID, MonsterList, Radius),
	mapBase:spawnAllMonster(List,undefined,0,GuildID,0),
	{noreply, State};

%% 家园-种植区-操作成功后需要同步给地图上所有角色
handle_info_msg({plantSuccess, _Pid, Msg}, State) ->
	ListPlayer = ets:tab2list(mapState:getMapPlayerEts()),
	homePlantLogic:plantSuccess(ListPlayer, Msg),
	{noreply, State};

%%=============================================
%%以下为从原怪物进程的消息接口
%%调整过来的新的消息接口
%%=============================================
handle_info_msg({destoryFeastBoss, _Pid, {MapID, BossID}}, State) ->
	MonsterEts = mapState:getMapMonsterEts(),
	MS = ets:fun2ms(fun(T) when T#recMapObject.id =:= BossID andalso T#recMapObject.mapId =:= MapID ->
		T
					end),
	case myEts:selectEts(MonsterEts, MS) of
		L when is_list(L) ->
			Fun = fun(#recMapObject{code = Code}) ->
				?INFO("feast boss act close , clear monster spawn [~p]", [Code]),
				monsterInterface:clearSpawn(Code)
				  end,
			lists:foreach(Fun, L);
		_ ->
			skip
	end,
	{noreply, State};

handle_info_msg({spawnAcMonster, _Pid, {MapID, BossID}}, State) ->
	MonsterEts = mapState:getMapMonsterEts(),
	MS = ets:fun2ms(fun(T) when T#recMapObject.id =:= BossID andalso T#recMapObject.mapId =:= MapID ->
		T
					end),
	case myEts:selectEts(MonsterEts, MS) of
		[] ->
			?INFO("map [~p] spawn ac monster [~p]", [MapID, BossID]),
			case getCfg:getCfgPStack(cfg_fightbossActivity, MapID) of
				#fightbossActivityCfg{coordinate = [X1, Y1]} ->
					X = X1,
					Y = Y1;
				_ ->
					X = 0,
					Y = 0
			end,
			PlayerEts = mapState:getMapPlayerEts(),
			PetEts = mapState:getMapPetEts(),
			MapID = mapState:getMapId(),
			Arg = #recSpawnMonster{
				id = BossID,
				mapID = MapID,
				mapPid = self(),
				x = X,
				y = Y,
				playerEts = PlayerEts,
				monsterEts = MonsterEts,
				petEts = PetEts,
				groupID = 0
			},
			monsterInterface:spawnMonster(Arg);
		_ ->
			?INFO("monster [~p] has exist map id [~p]", [BossID, MapID])
	end,
	{noreply, State};

handle_info_msg({queryMapBoss, Pid, {MonsterCode, _} = Data}, State) ->
	psMgr:sendMsg2PS(Pid, queryMapBossAck, {monsterState:getAttackTarget(MonsterCode), Data}),
	{noreply, State};

handle_info_msg({spawnMonster, _Pid, {#recSpawnMonster{} = SpawnArg}}, State) ->
	monsterInterface:spawnMonster(SpawnArg),
	{noreply, State};

handle_info_msg({gm_spawnMonster, _Pid, [#recSpawnMonster{}|_] = List}, State) ->
	MS1 = time2:getTimestampMS(),
	?WARN("tickDead start"),
	Fun =
		fun(#recSpawnMonster{} = SpawnData) ->
			?TRY_CATCH(creatureBase:initCreature(?InitMonster, SpawnData))
		end,
	lists:foreach(Fun, List),
	MS2 = time2:getTimestampMS(),
	Len = erlang:length(List),
	MS = MS2 - MS1,
	?WARN("tickDead start len:~p, time:~p avg:~p", [Len, MS, MS div Len]),
	{noreply, State};

handle_info_msg({spawnMonster_with_notexists, _Pid, {#recSpawnMonster{id = DataID} = SpawnArg}}, State) ->
	Ets = mapState:getMapMonsterEts(),
	MatchSpec = ets:fun2ms(fun(R) when R#recMapObject.id =:= DataID -> R#recMapObject.code end),
	L = myEts:selectEts(Ets, MatchSpec),
	case L of
		[] ->
			PlayerEts = mapState:getMapPlayerEts(),
			PetEts = mapState:getMapPetEts(),
			MapID = mapState:getMapId(),
			MonsterEts = mapState:getMapMonsterEts(),
			Code = monsterInterface:spawnMonster(SpawnArg#recSpawnMonster{
				mapID = MapID,
				mapPid = self(),
				playerEts = PlayerEts,
				monsterEts = MonsterEts,
				petEts = PetEts,
				groupID = 0
			}),
			?DEBUG("mb_mb create[~p][~p][~p][~p]",[MapID, self(), DataID,Code]),
			ok;
		_ ->
			?DEBUG("mb_mb create[~p][~p][~p][~p]",[mapState:getMapId(), self(), DataID, L]),
			ok
	end,
	{noreply, State};


handle_info_msg({spawnCarrier, _Pid, {#recSpawnMonster{} = SpawnArg}}, State) ->
	monsterInterface:spawnCarrier(SpawnArg),
	{noreply, State};

handle_info_msg({spawnPet, _Pid, {#recSpawnPet{} = PetArg}}, State) ->
	monsterInterface:spawnPet(PetArg),
	{noreply, State};

handle_info_msg({clearSpawn, _Pid, CodeList}, State) ->
	[monsterInterface:clearSpawn(Code) || Code <- CodeList],
	{noreply, State};

handle_info_msg({clearCollect, _Pid, CodeList}, State) ->
	[gatherNpcMgr:deleteCollect(Code) || Code <- CodeList],
	{noreply, State};

handle_info_msg({clearNpc, _Pid, {CodeList, GroupID}}, State) ->
	[gameMapLogic:destroyNpc(Code, GroupID) || Code <- CodeList],
	{noreply, State};

%% 远程刷怪
handle_info_msg({addMonsterToMap, _Pid, {GroupID, List}}, State) ->
	copyMapScheduleInit:addMonsterToMap(GroupID, List, ?AddMonsterRange),
	{noreply, State};

%% 远程刷怪
handle_info_msg({addMonsterToMap, _Pid, {GroupID, Radius, List}}, State) ->
	copyMapScheduleInit:addMonsterToMap(GroupID, List, Radius),
	{noreply, State};

%% 远程刷采集物
handle_info_msg({addCollectToMap, _Pid, {GroupID, List}}, State) ->
	copyMapScheduleInit:addCollectToMap(GroupID, List, ?AddMonsterRange),
	{noreply, State};

%% 远程刷NPC
handle_info_msg({addNpcToMap, _Pid, {GroupID, List}}, State) ->
	copyMapScheduleInit:addNpcToMap(GroupID, List, ?AddMonsterRange),
	{noreply, State};

%% 根据ID清理怪物，包含等待复活的怪物
handle_info_msg({cleanMonsterByID, _Pid, {GroupID, IDList}}, State) ->
	gameMapLogic:cleanMonsterByID(GroupID, IDList),
	{noreply, State};

%% 根据ID清理采集物，包含等待刷新的采集物
handle_info_msg({cleanCollectByID, _Pid, {GroupID, IDList}}, State) ->
	gameMapLogic:cleanCollectByID(GroupID, IDList),
	{noreply, State};

%%=============================================
%%以上几个是调整过后的消息接口
%%以下为原怪物进程的消息接口
%%=============================================
%%增加召唤载体信息
handle_info_msg({addCarrierInfo, _Pid, {CasterCode, ID, Code, Pid}}, State) ->
	monsterEffect:addCallInfo(?SpawnCarrier, Code, ID, Pid, CasterCode),
	{noreply, State};

%%删除召唤载体信息
handle_info_msg({delCarrierInfo, _Pid, {CasterCode, Code}}, State) ->
	monsterEffect:delCallInfo(?SpawnCarrier, Code, CasterCode),
	{noreply, State};

%%增加召唤怪物信息
handle_info_msg({addMonsterInfo, _Pid, {CasterCode, ID, Code, Pid}}, State) ->
	monsterEffect:addCallInfo(?SpawnCallMonster, Code, ID, Pid, CasterCode),
	{noreply, State};
handle_info_msg({delMonsterInfo, _Pid, {CasterCode, Code}}, State) ->
	monsterEffect:delCallInfo(?SpawnCallMonster, Code, CasterCode),
	{noreply, State};
%%删除召唤怪物信息
handle_info_msg({clearCallMonster, _Pid, {CasterCode, Code}}, State) ->
	monsterEffect:delCallInfo(?SpawnCallMonster, Code, CasterCode),
	{noreply, State};

%%玩家取女神code(新地宫)
handle_info_msg({requestGoddessCode, _Pid, PlayerNetPid}, State) ->
	Code = mapState:getGoddessCode(),
	R = #pk_GS2U_RequestGoddessCodeAck{goddessCode = Code},
	gsSendMsg:sendNetMsg(PlayerNetPid, R),
	{noreply, State};

handle_info_msg({beAttacked, Pid, {Code, #recBeAttack{} = BeAttack}}, State) ->
	monsterInterface:beAttack(Code, Pid, BeAttack),
	{noreply, State};

handle_info_msg({delHate, _Pid, {MonsterCode, Hate}}, State) ->
	monsterInterface:delHate(MonsterCode, Hate),
	{noreply, State};

handle_info_msg({assistTrigger, _Pid, {Code, SkillID}}, State) ->
	monsterInterface:assistTriggerSkill(Code, SkillID),
	{noreply, State};

handle_info_msg({addHate, _Pid, {MonsterCode, Hate}}, State) ->
	monsterInterface:addHate(MonsterCode, Hate, false),
	{noreply, State};

handle_info_msg({killedTarget, _Pid, {AttackerCode, TargetCode, TargetLevel, Msg, X, Y, BossTargetCode, IsRedName}}, State) ->
	monsterInterface:killedTarget(AttackerCode, TargetCode, TargetLevel, Msg, X, Y, BossTargetCode, IsRedName),
	{noreply, State};

%%技能效果返回结果
handle_info_msg({attackRes, _Pid, {_Code, AttackEffect, DamageMsg, RecEffect, ATD}}, State) ->
	monsterInterface:dealAttackRes(AttackEffect, RecEffect, ATD, DamageMsg),
	{noreply, State};

%%技能加血
handle_info_msg({beTreat, _Pid, {Code, #recBeTreat{} = BeTreat, AHp_Per}}, State) ->
	monsterInterface:addTreat(Code, BeTreat, AHp_Per),
	{noreply, State};

%% 给怪物添加Buff
handle_info_msg({addBuff, _Pid, {Code, BuffID, Level}}, State) ->
	monsterInterface:addBuff(Code, BuffID, Level),
	{noreply, State};

%%清除Buff
handle_info_msg({delBuff, _Pid, {Code, BuffID}}, State) ->
	monsterInterface:delBuff(Code, BuffID),
	{noreply, State};

%%回复玩家地图等级
handle_info_msg({noticeMapLevel, PlayerPid, GroupID}, State) ->
	Level = mapState:getMapLevel(GroupID),
	R = #pk_GS2U_MapLevel{level = Level},
	?DEBUG("zzc========noticeMapLevel============[~p]", [R]),
	psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {R}),
	{noreply, State};
%%创建勇士试炼副本boss
handle_info_msg({createWarriorTrialBoss, _PlayerPid, Data}, State) ->
	gameMapLogic:createWarriorTrialBoss(Data),
	{noreply, State};

%%野外boss设置新的红名玩家
handle_info_msg({wildBossRedNameDead, _PlayerPid, {BossCode, AttackCode}}, State) ->
	monsterBattle:changeNewWildBossTarget(BossCode, AttackCode),
	{noreply, State};
%%在地图内进行消息广播--发送跑马灯消息
handle_info_msg({broadCastPaoMaDengMsgInMap, _FromPid, {Content}}, State) ->
	handle_info_msg({broadCastPaoMaDengMsgInMap, _FromPid, {Content,16#FFFFFF,1}}, State);
%%Content内容，Color 颜色，Number轮播次数
handle_info_msg({broadCastPaoMaDengMsgInMap, _FromPid, {Content,Color,Number}}, State) ->
	Interval = 30,
%% 跑马灯
	NoticeInfo = #pk_NoticeInfo{
		id = 9999999999,
		type = 0,
		pos = 0, %%走马灯
		content = Content,
		color = Color,
		afterSecondStart = 0,
		duration = Interval*Number,
		interval = Interval
	},
	PMDMsg = #pk_GS2U_NoticeAdd{notice =[NoticeInfo]},
	Fun1 =
		fun(#recMapObject{netPid = NetPid}, _AccIn) ->
			gsSendMsg:sendNetMsg(NetPid, PMDMsg)
		end,
	ets:foldl(Fun1, 0, mapState:getMapPlayerEts()),
	{noreply, State};
%% 在活动地图杀掉玩家消息
handle_info_msg({activeMapKillPlayer, _Pid, {AttackRoleID,DeadRoleID, DeadRoleCode}}, State) ->
	gameMapActivityLogic:killPlayer(AttackRoleID,DeadRoleID, DeadRoleCode),
	{noreply, State};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 由幻想的情缘试炼部分代码移植过来再加工，用于创建便于活动进程控制的对象 begin

handle_info_msg({spawnObject, Pid, Msg}, State) ->
	case erlang:is_list(Msg) of
		true ->
			lists:foreach(fun(MsgCell) -> spawnObject(Pid, MsgCell) end, Msg);
		_ ->
			spawnObject(Pid, Msg)
	end,
	{noreply,State};

handle_info_msg({clearObject, _Pid, Msg}, State) ->
	case erlang:is_list(Msg) of
		true ->
			lists:foreach(fun(MsgCell) -> clearObject(MsgCell) end, Msg);
		_ ->
			clearObject(Msg)
	end,
	{noreply,State};

handle_info_msg({clearAllObject, _Pid, Msg}, State) ->
	case erlang:is_list(Msg) of
		true ->
			lists:foreach(fun(MsgCell) -> clearAllObject(MsgCell) end, Msg);
		_ ->
			clearAllObject(Msg)
	end,
	{noreply,State};

%% 由幻想的情缘试炼部分代码移植过来再加工，用于创建便于活动进程控制的对象 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版骑宠领地 begin
handle_info_msg({spawnPetAsMonster, _Pid, Msg}, State) when erlang:is_list(Msg) ->
	[spawnPetAsMonster(MsgCell) || MsgCell <- Msg],
	{noreply,State};
handle_info_msg({spawnPetAsMonster, _Pid, Msg}, State) ->
	spawnPetAsMonster(Msg),
	{noreply,State};
%% 新版骑宠领地 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 快速清除对象，目前仅支持NPC
%% 在服务端的清除效果如同clearObject，但会通知客户端立即删除对象而非放在队列里慢慢删除
handle_info_msg({clearObjectFast, _Pid, Msg}, State) ->
	clearObjectFast(Msg),
	{noreply,State};

handle_info_msg({'CreateMonster1By1', _Pid, Msg}, State) ->
	gameMapMaterial:newMonsterData(Msg),
	{noreply,State};

handle_info_msg({createTowerMonsetr, _Pid, Msg}, State) ->
	gameMapMaterial:createTower(Msg),
	{noreply,State};

%% 特殊情况下让Monster使用一次技能
handle_info_msg({monsterUseSkill, _Pid, {MonsterCode, SkillID, TargetCode}}, State) ->
	?DEBUG("[DebugForMonsterSkill] ~p", [{MonsterCode, SkillID, TargetCode}]),
	SN = monsterState:getAttackSN(MonsterCode),
	monsterState:setAttackSN(MonsterCode, SN + 1),
	monsterSkill:useSkill(MonsterCode, SkillID, SN, TargetCode, true),
	{noreply,State};

%% 创建游乐NPC
handle_info_msg({createRideNpcToMap, Pid, {SpawnNpc, Data}}, State) ->
	Code = mapBase:npcSpawn(SpawnNpc),
	psMgr:sendMsg2PS(Pid, createRideNpcToMapAck, {Code, self(), mapState:getMapPlayerEts(), Data}),
	{noreply,State};

%% 动画
handle_info_msg({animationPlayTimeout, GroupID, AN}, State) ->
	copyMapScheduleComplete:animationOver(GroupID, AN),
	{noreply,State};
handle_info_msg({animationPlayOver, _Pid, {GroupID, AN}}, State) ->
	copyMapScheduleComplete:animationOver(GroupID, AN),
	{noreply,State};

handle_info_msg({characterPlayTimeout, GroupID, Schedule}, State) ->
	copyMapScheduleComplete:characterOver(GroupID, Schedule),
	{noreply,State};
handle_info_msg({characterPlayOver, _Pid, {GroupID, Schedule}}, State) ->
	copyMapScheduleComplete:characterOver(GroupID, Schedule),
	{noreply,State};
%% ====================================================================
handle_info_msg({createWorldBoss, _Pid, Msg}, State) ->
	gameMapWorldBoss:createBoss(Msg),
	{noreply,State};
handle_info_msg({worldBossDie, _Pid, DataID}, State) ->
	gameMapWorldBoss:goDie(DataID),
	{noreply,State};
handle_info_msg({worldBossSetHp, _Pid, {DataID, HP}}, State) ->
	gameMapWorldBoss:setHp(DataID, HP),
	{noreply,State};
%% ====================================================================
handle_info_msg({show2, _Pid, {_GroupID, _ConfigID, _Show2ID, true} = Msg}, State) ->
	copyMapScheduleInit:show2(Msg),
	{noreply,State};
handle_info_msg({show2, _Pid, {_GroupID, _ConfigID, _Show2ID, false} = Msg}, State) ->
	copyMapScheduleComplete:show2(Msg),
	{noreply,State};

handle_info_msg({addRingBuff, _Pid, Msg}, State) ->
	monsterBuff:addRingBuff(Msg),
	{noreply, State};

handle_info_msg({clearRingBuffOfMe, _Pid, Msg}, State) ->
	monsterBuff:clearRingBuffFromOther(Msg),
	{noreply, State};

%%
handle_info_msg({monsterTrigger, _Pid, Msg}, State) ->
	monsterEventTrigger:monsterTrigger(Msg),
	{noreply, State};
handle_info_msg({monsterDelayTrigger, Msg}, State) ->
	monsterEventTrigger:monsterTrigger(Msg),
	{noreply, State};


handle_info_msg({createGuildBoss, _Pid, Msg}, State) ->
	gameMapAcGuildBoss:createBoss(Msg),
	{noreply,State};

%% 复活相关
%% ====================================================================
handle_info_msg({getPlayerReviveNum_Cost, FromPid, Msg}, State) ->
	Num = gameMapRevive:getPlayerRevive(Msg),
	psMgr:sendMsg2PS(FromPid, getPlayerReviveNum_Ack_Cost, Num),
	{noreply, State};

handle_info_msg({getPlayerReviveNum_Dead, FromPid, {RoleID, AttackerCode, AttackRoleID, AttackName, IsBattleLearn}}, State) ->
	Num = gameMapRevive:getPlayerRevive(RoleID),
	psMgr:sendMsg2PS(FromPid, getPlayerReviveNum_Ack_Dead, {Num, AttackerCode, AttackRoleID, AttackName, IsBattleLearn}),
	{noreply, State};

handle_info_msg({getPlayerReviveNum_Normal, FromPid, Msg}, State) ->
	Num = gameMapRevive:getPlayerRevive(Msg),
	psMgr:sendMsg2PS(FromPid, getPlayerReviveNum_Ack_Normal, Num),
	{noreply, State};

handle_info_msg({getPlayerReviveNum_Local, FromPid, {RoleID, Type}}, State) ->
	Num = gameMapRevive:getPlayerRevive(RoleID),
	psMgr:sendMsg2PS(FromPid, getPlayerReviveNum_Ack_Local, {Num, Type}),
	{noreply, State};

handle_info_msg({playerRevive, _Pid, RoleID}, State) ->
	Times = gameMapRevive:getPlayerRevive(RoleID),
	gameMapRevive:setPlayerRevive({RoleID, Times + 1}),
	{noreply, State};

handle_info_msg({laterTime, _Pid}, State) ->
	gameMapLogic:laterTime_DestoryCopyMap(),
	{noreply, State};

handle_info_msg({setReviveNum, _Pid, {RoleID, Num}}, State) ->
	gameMapRevive:setPlayerRevive({RoleID, Num}),
	{noreply, State};

handle_info_msg({getReviveNum, FromPid, RoleID}, State) ->
	Num = gameMapRevive:getPlayerRevive(RoleID),
	psMgr:sendMsg2PS(FromPid, getPlayerReviveNum_Ack, Num),
	{noreply, State};
%% ====================================================================
%%复活end

%% 副本结束后，地图统一收集所有队员的伤害统计信息，再推动结算流程
handle_info_msg({teamStatHurt, Pid, Data}, State) ->
	copyMapScheduleComplete:teamStatHurt(Pid, Data),
	{noreply, State};
%% 收集所有队员的伤害信息时超时，推动结算
handle_info_msg(teamStatHurtEnd, State) ->
	copyMapScheduleComplete:teamStatHurtEnd(),
	{noreply, State};
handle_info_msg(delay_gc, State) ->
	tickGC(),
	Self = self(),

	Str = io_lib:format("delay_gc playernumber:~p, monsterNumber:~p npcNumber:~p, DeadList:~p, DeadDelList:~p, AIList:~p",
		[ets:info(mapState:getMapPlayerEts(), size), ets:info(mapState:getMapMonsterEts(), size), ets:info(mapState:getMapNpcEts(), size),
			erlang:length(monsterState:getDeadMonsterList()), erlang:length(monsterState:getDelMonster()), erlang:length(libBstAI:getAIList())]),

	MapID = mapState:getMapId(),
	erlang:spawn(fun()-> delay_gc(Self, MapID, Str) end),
	{noreply, State};


handle_info_msg({initWeddingMap,_Pid,MapInfo}, State) ->
	gameMapMarriageWedding:init(MapInfo),
	{noreply, State};

handle_info_msg(weddingMapTick, State) ->
	gameMapMarriageWedding:weddingMapTick(),
	{noreply, State};

handle_info_msg(Info, State) ->
	?ERROR("unhandle info:[~p] in [~p] [~p,~p]", [Info, node(), ?MODULE, self()]),
	{noreply, State}.

delay_gc(Pid, MapID, Str) ->
	Time1 = time2:getTimestampMS(),
	?INFO("map delay_gc [~p,~p] gc start", [MapID, Pid]),
	garbage_collect(Pid),
	Time2 = time2:getTimestampMS(),
	?INFO("map delay_gc [~p,~p] gc end:~p, Str:~ts", [MapID, Pid, Time2 - Time1, Str]),
	ok.

terminate(_Reason, _State) ->
	DelMonsterList = monsterState:getDelMonster(),
	?INFO("~p DelMonsterList:~p", [self(), DelMonsterList]),
	ets:delete(?MapInfoEts, self()),
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type, Why, State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% 反馈消息
-spec ack(FromPid::pid(), ActivityType::activityType()|0, MsgType::atom(), Code::uint64(), ExParam::term()) -> ok.
ack(_, 0, _, _, _) ->
	ok;
ack(_FromPid, ActivityType, MsgType, Code, ExParam) ->
	core:sendMsgToActivity(ActivityType, MsgType, {Code, ExParam}),
	ok.

%% 创建用于活动进程针对管理的对象
-spec spawnObject(
	FromPid::pid(),                     % 活动进程ID
	{
		Arg::term(),                      % 创建对象参数
		{
			ActivityType::activityType()|0, % 活动类型，用于消息回复，为0时无效
			MsgType::atom(),                % 消息类型，用于消息回复
			ExParam::term()                 % 扩展参数，用于消息回复
		}
	}
) ->
	ok.
%% 创建NPC
spawnObject(FromPid, {#recSpawnNpc{} = Arg, ActivityType, MsgType, ExParam}) ->
	%%?DEBUG("[DebugForDate] spawnObject Npc ~p", [Arg]),
	ack(FromPid, ActivityType, MsgType, mapBase:npcSpawn(Arg), ExParam),
	ok;
%% 创建采集物
spawnObject(FromPid, {#recSpawnCollect{} = Arg, ActivityType, MsgType, ExParam}) ->
	%%?DEBUG("[DebugForDate] spawnObject Collect ~p", [Arg]),
	ack(FromPid, ActivityType, MsgType, mapBase:collectSpawn(Arg), ExParam),
	ok;
%% 创建怪物
spawnObject(FromPid, {#recSpawnMonster{} = Arg, ActivityType, MsgType, ExParam}) ->
	%%?DEBUG("[DebugForDate] spawnObject Monster ~p", [Arg]),
	ArgNew =
		Arg#recSpawnMonster{
			playerEts       = mapState:getMapPlayerEts(),
			monsterEts      = mapState:getMapMonsterEts(),
			petEts          = mapState:getMapPetEts()
		},
	ack(FromPid, ActivityType, MsgType, monsterInterface:spawnMonster(ArgNew), ExParam),
	ok.

%% 根据对象类型执行清除操作
-spec clearObject({CodeType::code_type(), CodeList::[uint64(), ...]}) -> ok.
%% 清除NPC
clearObject({?CodeTypeNPC, CodeList}) ->
	%%?DEBUG("[DebugForDate] clearObjec Npc ~p", [CodeList]),
	NpcEts = mapState:getMapNpcEts(),
	[gatherNpcMgr:deleteObject(NpcEts, Code) || Code <- CodeList],
	ok;
%% 清除采集物
clearObject({?CodeTypeCollect, CodeList}) ->
	%%?DEBUG("[DebugForDate] clearObjec Collect ~p", [CodeList]),
	[gatherNpcMgr:deleteCollect(Code) || Code <- CodeList],
	ok;
%% 清除怪物
clearObject({?CodeTypeMonster, CodeList}) ->
	%%?DEBUG("[DebugForDate] clearObjec Monster ~p", [CodeList]),
	[monsterInterface:clearSpawn(Code) || Code <- CodeList],
	ok.

%% 根据对象类型执行清除操作
-spec clearAllObject(CodeType::code_type()) -> ok.
%% 清除NPC
clearAllObject(?CodeTypeNPC) ->
	%%?DEBUG("[DebugForDate] clearAllObject Npc"),
	NpcEts = mapState:getMapNpcEts(),
	FunGetCodeList =
		fun(#recMapObject{code = Code}, L) ->
			[Code | L]
		end,
	CodeList = ets:foldl(FunGetCodeList, [], NpcEts),
	[gatherNpcMgr:deleteObject(NpcEts, Code) || Code <- CodeList],
	ok;
%% 清除采集物
clearAllObject(?CodeTypeCollect) ->
	%%?DEBUG("[DebugForDate] clearAllObject Collect"),
	CollectEts = mapState:getMapCollectEts(),
	FunGetCodeList =
		fun(#recMapObject{code = Code}, L) ->
			[Code | L]
		end,
	CodeList = ets:foldl(FunGetCodeList, [], CollectEts),
	[gatherNpcMgr:deleteCollectFast(Code) || Code <- CodeList],
	mapState:setGatherWaitReliveList([]),	%% 清空复活列表
	ok;
%% 清除怪物
clearAllObject(?CodeTypeMonster) ->
	%%?DEBUG("[DebugForDate] clearAllObject Monster"),
	MonsterEts = mapState:getMapMonsterEts(),
	FunGetCodeList =
		fun(#recMapObject{code = Code}, L) ->
			[Code | L]
		end,
	CodeList = ets:foldl(FunGetCodeList, [], MonsterEts),
	[monsterInterface:clearSpawn(Code) || Code <- CodeList],
	monsterState:setDeadMonsterList([]),	%% 清空复活列表
	ok.

%% 根据对象类型执行清除操作
%% 快速清除对象，目前仅支持NPC、Collect
%% 在服务端的清除效果如同clearObject，但会通知客户端立即删除对象而非放在队列里慢慢删除
-spec clearObjectFast({CodeType::code_type(), CodeList::[uint64(), ...]}) -> ok.
%% 清除NPC
clearObjectFast({?CodeTypeNPC, CodeList}) ->
	NpcEts = mapState:getMapNpcEts(),
	[gatherNpcMgr:deleteObjectFast(NpcEts, Code) || Code <- CodeList],
	ok;
%% 清除采集物
clearObjectFast({?CodeTypeCollect, CodeList}) ->
	[gatherNpcMgr:deleteCollectFast(Code) || Code <- CodeList],
	ok.


%% 新版骑宠领地
%% 创建怪物
-spec spawnPetAsMonster({Arg::#recSpawnMonster{}, Pet::#rec_player_territory_pet{}}) -> ok.
spawnPetAsMonster({#recSpawnMonster{camp = _Camp} = Arg, #rec_player_territory_pet{prop = Prop, skill = Skill, raw = RawLvl}}) ->
	%% 1.创建怪物
	ArgNew =
		Arg#recSpawnMonster{
			playerEts       = mapState:getMapPlayerEts(),
			monsterEts      = mapState:getMapMonsterEts(),
			petEts          = mapState:getMapPetEts(),
			level = RawLvl + 1
		},
	%% 2.添加技能
	Code = monsterInterface:spawnMonster(ArgNew),
	[monsterSkill:addTempSkill(Code, SkillID, SkillLevel) || {SkillID, SkillLevel} <- Skill],
	%% 3.重置属性
	monsterInterface:updatePetTotalProp(Code, Prop),
	%% 4.重置血量（添加属性后导致当前血量小于最大血量）
	monsterState:setCurHp(Code, monsterState:getBattlePropTotal(Code, ?Prop_MaxHP)),
	?DEBUG("[DebugForPetTerritoryFight] pid:~w camp:~w~n~p", [self(), _Camp, Prop]),
	?DEBUG("[DebugForPetTerritoryFight] pid:~w camp:~w ~w:~w", [self(), _Camp, ?Prop_MaxHP, monsterState:getBattlePropTotal(Code, ?Prop_MaxHP)]),
	?DEBUG("[DebugForPetTerritoryFight] pid:~w camp:~w ~w:~w", [self(), _Camp, ?Prop_PhysicalAttack, monsterState:getBattlePropTotal(Code, ?Prop_PhysicalAttack)]),
	?DEBUG("[DebugForPetTerritoryFight] pid:~w camp:~w ~w:~w", [self(), _Camp, ?Prop_MagicAttack, monsterState:getBattlePropTotal(Code, ?Prop_MagicAttack)]),
	?DEBUG("[DebugForPetTerritoryFight] pid:~w camp:~w ~w:~w", [self(), _Camp, ?Prop_PhysicalDefence, monsterState:getBattlePropTotal(Code, ?Prop_PhysicalDefence)]),
	?DEBUG("[DebugForPetTerritoryFight] pid:~w camp:~w ~w:~w", [self(), _Camp, ?Prop_MagicDefence, monsterState:getBattlePropTotal(Code, ?Prop_MagicDefence)]),
	ok.

