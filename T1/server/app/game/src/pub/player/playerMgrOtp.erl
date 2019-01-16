%%
%% @author zhongyunawei
%% @doc @todo 玩家管理进程.


-module(playerMgrOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("playerPrivate.hrl").
-include("gsInc.hrl").
-include("main.hrl").

-record(state,{
}).

-define(OnlinePlayersTime,1000*60).%%60秒存储一次在线玩家数量

-define(DailyCounterTick, 60000).

-define(PlayerTickCheck, 15 * 60 * 1000).%%玩家心跳检测
%% ====================================================================
%% API functions
%% ====================================================================

-export([
	getOnlinePlayerInfoByCode/1,
	getOnlinePlayerInfoByName/1,
	getOnlinePlayerInfoByID/1,
	getOnlinePlayerInfoByAccountID/1,
	getOnlineAccountID/1,
	getAllPlayerPidInfo/0,
	getAllPlayerPidInfoForChat/0,
	sendMsgToAllPlayer/1,
	castMsgToAllPlayerOtp/2,
	getAllPlayerNumAndModifyData/0,
	kickOutAllPlayer/0
]).

-export([start_link/0]).

-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3,
	handle_exception/3
]).

%% ====================================================================
%% API functions
%% ====================================================================

%%通过code获取玩家信息
-spec getOnlinePlayerInfoByCode(PlayerCode)-> #rec_OnlinePlayer{} | undefined when PlayerCode :: uint().
getOnlinePlayerInfoByCode(PlayerCode) when PlayerCode > 0 andalso erlang:is_integer(PlayerCode) ->
	MS = ets:fun2ms(fun(Info) when Info#rec_OnlinePlayer.code =:= PlayerCode ->
		Info
					end),
	case ets:select(ets_rec_OnlinePlayer, MS) of
		[#rec_OnlinePlayer{} = PlayerInfo] ->
			PlayerInfo;
		_ ->
			undefined
	end.

%%通过Name获取玩家信息
-spec getOnlinePlayerInfoByName(PlayerName)-> #rec_OnlinePlayer{} | undefined when
	PlayerName :: string().
getOnlinePlayerInfoByName(PlayerName) when erlang:is_list(PlayerName) ->
	RoleID = playerNameUID:getPlayerUIDByName(PlayerName),
	getOnlinePlayerInfoByID(RoleID).

%%通过Name获取玩家信息
-spec getOnlinePlayerInfoByID(PlayerID)->  #rec_OnlinePlayer{} | undefined when
	PlayerID :: uint().
getOnlinePlayerInfoByID(PlayerID) when erlang:is_integer(PlayerID) andalso PlayerID > 0 ->
	case core:queryOnLineRoleByRoleID(PlayerID) of
		{} -> undefined;
		V -> V
	end.

%%通过账号获取玩家信息
-spec getOnlinePlayerInfoByAccountID(AccountID) -> #rec_OnlinePlayer{} | undefined when
	AccountID :: uint().
getOnlinePlayerInfoByAccountID(AccountID) when erlang:is_integer(AccountID) andalso AccountID > 0 ->
	MS = ets:fun2ms(fun(Info) when Info#rec_OnlinePlayer.accountID =:= AccountID ->
		Info
					end),
	case myEts:selectEts(ets_rec_OnlinePlayer,MS) of
		[#rec_OnlinePlayer{} = PlayerInfo] ->
			PlayerInfo;
		_ ->
			undefined
	end.

%%通过账号获取玩家信息
-spec getOnlineAccountID(AccountID) -> #rec_OnlineAccount{} | undefined when
	AccountID :: uint().
getOnlineAccountID(AccountID) when erlang:is_integer(AccountID) andalso AccountID > 0 ->
	case ets:lookup(ets_rec_OnlineAccount, AccountID) of
		[#rec_OnlineAccount{} = Online] ->
			Online;
		_ ->
			undefined
	end.


%%获取所有在线玩家的Pid信息
-spec getAllPlayerPidInfoForChat()-> PlayersInfo::list().
getAllPlayerPidInfoForChat()->
	Fun =
		fun(#rec_OnlinePlayer{pid = PlayerPid}, AccPlayerPid) ->
			[PlayerPid | AccPlayerPid]
		end,
	ets:foldl(Fun, [], ets_rec_OnlinePlayer).

%%获取所有在线玩家的Pid信息
-spec getAllPlayerPidInfo()-> PlayersInfo::list().
getAllPlayerPidInfo()->
	Fun =
		fun(#rec_OnlinePlayer{pid = PlayerPid}, AccPlayerPid) ->
			case misc:is_process_alive(PlayerPid) of
				true ->
					[PlayerPid | AccPlayerPid];
				false ->
					AccPlayerPid
			end
		end,
	ets:foldl(Fun, [], ets_rec_OnlinePlayer).

%% 发送消息给全服玩家，不验证网络进程是否存在
sendMsgToAllPlayer([Msg]) ->
	%% 单个消息
	Fun =
		fun(#rec_OnlinePlayer{netPid = PlayerNetPid}, _) ->
			gsSendMsg:sendNetMsg(PlayerNetPid, Msg)
		end,
	ets:foldl(Fun, 0, ets_rec_OnlinePlayer),
	ok;
sendMsgToAllPlayer(MsgList) ->
	%% 多个消息
	Fun =
		fun(#rec_OnlinePlayer{netPid = PlayerNetPid}, _) ->
			[gsSendMsg:sendNetMsg(PlayerNetPid, Msg) || Msg <- MsgList]
		end,
	ets:foldl(Fun, 0, ets_rec_OnlinePlayer),
	ok.

castMsgToAllPlayerOtp(Msg, MsgData) ->
	Fun =
		fun(#rec_OnlinePlayer{pid = PlayerPid}, _) ->
			psMgr:cast(PlayerPid, Msg, MsgData)
		end,
	ets:foldl(Fun, 0, ets_rec_OnlinePlayer),
	ok.

%%获取在线人数
-spec getAllPlayerNumAndModifyData()-> uint().
getAllPlayerNumAndModifyData()->
	Now = misc_time:milli_seconds(),
	Fun =
		fun(#rec_OnlinePlayer{
			accountID = AccountID,
			playerSaveTime = SaveTime,
			pid = PlayerPid,
			roleID = PlayerID}, {AccIn, AccL}) ->
			case Now - SaveTime >= ?PlayerTickCheck of
				true when PlayerID > 0 ->
					psMgr:sendMsg2PS(PlayerPid, kickOutAccount, {undefined, gmKickOut, undefined}),
					?ERROR("player heart has dead, kick out player [~p]", [{AccountID, PlayerID}]),
					{AccIn, [{AccountID, PlayerID} | AccL]};
				_ ->
					case misc:is_process_alive(PlayerPid) of
						true ->
							{AccIn + 1, AccL};
						false ->
							?ERROR("player pid is dead:~p,~p", [{AccountID, PlayerID}, PlayerPid]),
							{AccIn, [{AccountID, PlayerID} | AccL]}
					end
			end
		end,
	{OnlineNumber, ProblemRoles} = ets:foldl(Fun, {0, []}, ets_rec_OnlinePlayer),

	%% 删除有问题的角色
	case ProblemRoles of
		[] -> skip;
		_ ->
			?ERROR("ProblemRoles:~p", [ProblemRoles]),
			F =
				fun({AccountID, PlayerID}) ->
					?ERROR("delete account:~p, role:~p", [AccountID, PlayerID]),
					ets:delete(ets_rec_OnlineAccount, AccountID),
					ets:delete(ets_rec_OnlinePlayer, PlayerID)
				end,
			lists:foreach(F, ProblemRoles)
	end,
	OnlineNumber.

%% =============================================================================================


start_link() ->
	myGenServer:start_link({local,?PsNamePlayerMgr},?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?INFO("playerMgrOtp init"),
	process_flag(trap_exit, true),

	erlang:send_after(?OnlinePlayersTime, self(), {saveOnlinePlayers,self(),{}} ),

	erlang:send_after(1000*5, self(), {refreshLoginAwardConf,self(),{ }}),

	%% 重置dailycounter
	erlang:send_after(?DailyCounterTick, self(), dailyCounterTick),

	?INFO("playerMgrOtp init ok"),
	{ok,#state{}}.


handle_call(Req,From,State) ->
	?DEBUG("call ~p",[Req]),
	Ret = deal_call(Req,From,State),
	?DEBUG("deal call ~p",[Ret]),
	case Ret of
		{true,Reply,NewState} ->
			{reply,Reply,NewState};
		_ ->
			{noreply, State}
	end.

handle_cast(_Msg, State) ->
	{noreply, State}.

%% 重置dailycounter
handle_info(dailyCounterTick, State) ->
	NowTime = misc_time:gregorian_seconds_from_1970( ),
	{{Year, Month, Day}, {Hour, Minute, Second}} = misc_time:gregorian_seconds_to_datetime(NowTime),
	if
		Hour =:= ?ResetTimeHour andalso Minute >= 0 andalso Minute < 3 ->
			?INFO("newDayTick: [~p-~p-~p ~p:~p:~p] [~p,~p]", [Year,Month,Day,Hour,Minute,Second,?MODULE,self()]),
			case core:isCross() of
				false ->
					arunaNormal:checkScheduleValueAndTurnPhase();
				_ ->
					skip
			end,

			PidList = getAllPlayerPidInfo(),
			psMgr:sendMsg2PS(?PsNameMain, reset, {}),
			[psMgr:sendMsg2PS(Pid, resetPlayerDailyCounter, {}) || Pid <- PidList],
			psMgr:sendMsg2PS(?PsNameMall,requestRestSeed, {}),
			psMgr:sendMsg2PS(?PsNameDaily2, daily2_reset, 0),
			psMgr:sendMsg2PS(?PsNameIdentity, identity_picUnactive, 0),
			psMgr:sendMsg2PS(?PsNameGuild, dailyreset, 0),
			core:sendMsgToActivity(?ActivityType_WorldWar, dailyreset, 0),
			core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_dailyReset, 0),
			erlang:send_after(?DailyCounterTick * 10, self(), dailyCounterTick),	%% 防止短时间内重复触发
			case ?Cur_Lang  of
				?Lang_CHT ->
					rechargeBackLogic:checkIFCanRebate();
				_ ->
					skip
			end;
	%% 每日签到所需凌晨0点重置时间
	%% 原本打算仅在玩家请求时判断是否需要重置时间
	%% 但客户端依赖于同步属性进行显示，因此需要服务端主动重置
		Hour =:= 0 andalso Minute >= 0 andalso Minute < 3 ->
			PidList = getAllPlayerPidInfo(),
			[psMgr:sendMsg2PS(Pid, resetPlayerDailyCounter0, {}) || Pid <- PidList],
			erlang:send_after(?DailyCounterTick * 10, self(), dailyCounterTick);	%% 防止短时间内重复触发
		true ->
			erlang:send_after(?DailyCounterTick, self(), dailyCounterTick)	%% 正常心跳
	end,
	{noreply, State};

%% 连上db了
handle_info({alreadyConnectDBServer, _Pid, _Msg}, State) ->
	alreadyConnectDBServer(),
	{noreply, State};

%% 登录有礼配置更新(给dbs发请求)
handle_info({refreshLoginAwardConf,_FromPid,{ }},State) ->
	?DEBUG("refreshLoginAwardConf",[]),
	gsSendMsg:sendMsg2DBServer(selLoginAwardConf, 0, {}),
	{noreply,State};

%% 登录有礼配置更新(dbs返回)
handle_info({selLoginAwardConfAck,_FromPid,{ LoginAwardConfList }},State) ->
	loadAwardConfFromDBAck(LoginAwardConfList),
	%%发在线的玩家
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {onLineCheckLoginAward, {} }),
	{noreply,State};

%% 倒计时关服踢人
handle_info({gs2MinuteStop,_FromPid,{NumSecond} },State) when NumSecond>=0 ->
	try
		Content = stringCfg:getString(gs2MinuteStop,[NumSecond]),
		?INFO("gs2MinuteStop:~ts",[Content]),
		systemChatAllPlayer( Content )
	catch
		_:Why ->
			?ERROR("gs2MinuteStop notify exception:~p by remmain Sec:~p",[Why,NumSecond])
	end,

	AfterSecondAgain = NumSecond-10,
	case AfterSecondAgain =< 0 of
		true ->
			%% 0秒倒计时
			Content2 = stringCfg:getString(gs2MinuteStop, [0]),
			?INFO("gs2MinuteStop:~ts",[Content2]),
			systemChatAllPlayer(Content2),

			kickOutAllPlayer();
		false ->
			erlang:send_after(1000*10, self(), {gs2MinuteStop,_FromPid,{AfterSecondAgain}})
	end,
	{noreply,State};

%% 在线玩家数量定时log
handle_info({saveOnlinePlayers,_FromPid,{}},State) ->
	%%检查玩家心跳
	erlang:send_after(?OnlinePlayersTime, self(), {saveOnlinePlayers,self(),{}}),

	%% 使用Num2更准确
	Num = playerMgrOtp:getAllPlayerNumAndModifyData(),
	Num2 =
		case ets:info(?SocketProcessEts, size) of
			undefined ->
				0;
			Num2_ ->
				Num2_
		end,
	?INFO("OnlinePlayersNumber online:~p, netline:~p", [Num, Num2]),

	biInterface:acuToBi(Num2, ?OnlinePlayersTime),
	%% 发消息给DBMain检查心跳是否还存活
	psMgr:sendMsg2PS(?PsNameDBMain, checkSyncToDBIsAlive, 0),

	%% 发消息给LS更新人数
	case core:isCross() of
		true ->
			dbLog:sendSaveLogOnlinePlayer(Num),
			psMgr:sendMsg2PS(?PsNameLS, gsRefreshOnlineCount, Num);
		_ ->
			dbLog:sendSaveLogOnlinePlayer(Num2),
			psMgr:sendMsg2PS(?PsNameLS, gsRefreshOnlineCount, Num2)
	end,

	%% 发消息给chatOtp更新人数
	psMgr:sendMsg2PS(?ChatOtp, freshOnlinePlayerNumber, Num2),
	{noreply,State};

%%根据playerID给在线的玩家进程发消息
handle_info({send2OnlinePlayerPid,_FromPid,{PlayerID,MsgID,Msg}},State) ->
	case core:queryPlayerPidByRoleID(PlayerID) of
		offline -> skip;
		PlayerPid ->
			psMgr:sendMsg2PS(PlayerPid,MsgID,Msg)
	end,
	{noreply,State};

%% 向在线的玩家发送哥布林玩法相关公告
handle_info({goblin, SubType, BeginTime},State) ->
	?DEBUG("公告类型~p",[SubType]),
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_StealBtn) of
		true ->
			{MapNameList, MapList} = getNoticeContent(BeginTime),
			case SubType of
				goblinBeginNotice ->
					systemChatAllPlayerByECode(?ErrorCode_CnTextGoblinWarningNotice),
					%%一天后再刷新
					erlang:send_after(?One_Day_Second*1000, self(), {goblin, goblinBeginNotice, BeginTime}),

					erlang:send_after(?GoblinAheadTime*1000, self(), {goblin, goblinBegin, BeginTime});
				goblinBegin ->
					%%通知所有在线玩家，哥布林玩法开启
					psMgr:sendMsg2PS(self(), pidMsg2AllOLPlayer, {sendGoblinOpenState, {true, MapList}}),
					CnText1 = case erlang:length(MapNameList) of
								  1 ->
									  ?ErrorCode_CnTextGoblinBeginNotice1;
								  2 ->
									  ?ErrorCode_CnTextGoblinBeginNotice2;
								  3 ->
									  ?ErrorCode_CnTextGoblinBeginNotice3;
								  4 ->
									  ?ErrorCode_CnTextGoblinBeginNotice4
							  end,
					systemChatAllPlayerByECode(CnText1,MapNameList),
					erlang:send_after(?GoblinInProcessTime * 1000, self(), {goblin, goblinInProcess, BeginTime}),
					erlang:send_after(?GoblinBossSpawnTime * 1000, self(), {goblin, goblinBoss, BeginTime}),
					erlang:send_after(?GoblinTotalTime * 1000, self(), {goblin, goblinEnd, BeginTime});
				goblinInProcess ->
					%%如果当前时间离结束已经不到三分钟不再提示玩家活动在进行
					NowTime = misc_time:gregorian_seconds_from_1970( ),
					{{Y, M, D}, {_H, _Min, _S}} = misc_time:gregorian_seconds_to_datetime(NowTime),
					EndTime = misc_time:convertDateTime1970ToSec({{Y, M, D}, {BeginTime, 0, 0}}) + ?GoblinTotalTime,

					?INFO("EndTime = ~p, NowTime = ~p", [EndTime, NowTime]),

					case EndTime - NowTime >= ?GoblinInProcessTime of
						true ->
							CnText2 = case erlang:length(MapNameList) of
										  1 ->
											  ?ErrorCode_CnTextGoblinInProcessNotice1;
										  2 ->
											  ?ErrorCode_CnTextGoblinInProcessNotice2;
										  3 ->
											  ?ErrorCode_CnTextGoblinInProcessNotice3;
										  4 ->
											  ?ErrorCode_CnTextGoblinInProcessNotice4
									  end,
							systemChatAllPlayerByECode(CnText2,MapNameList);
						_ ->
							skip
					end;
				goblinBoss ->
					systemChatAllPlayerByECode(?ErrorCode_CnTextGoblinBossNotice);
				goblinEnd ->
					%%通知所有在线玩家，哥布林玩法开启
					psMgr:sendMsg2PS(self(), pidMsg2AllOLPlayer, {sendGoblinOpenState, {false, MapList}}),
					systemChatAllPlayerByECode(?ErrorCode_CnTextGoblinEndNotice)
			end;
		_ ->
			skip
	end,
	{noreply,State};

handle_info({goblinBeginNoticeMsg}, State) ->
	alreadyConnectDBServer(),
	{noreply, State};

%% 向在线的所有玩家广播  进程消息
handle_info({pidMsg2AllOLPlayer,FromPid, Msg },State) ->
	%%?DEBUG("pidMsg2AllOLPlayer ~p  ~p",[FromPid,MsgID]),
	Send2AllOLPlayerPidFun =
		fun(One,_) ->
			case One of
				#rec_OnlinePlayer{pid = PPid} ->
					case Msg of
						{MsgID,TransMsg} ->
							psMgr:sendMsg2PS(PPid, MsgID, FromPid, TransMsg);
						{MsgID} ->
							psMgr:sendMsg2PS(PPid, MsgID);
						_ ->
							skip
					end;
				_ ->
					skip
			end
		end,
	ets:foldl(Send2AllOLPlayerPidFun, [], ets_rec_OnlinePlayer),
	{noreply,State};
%% 发放军团副本奖励
handle_info({sendGuildCopyAward, _FromPid, {AwardIDList, OtherIDList, Plan, BossName}}, State) ->
	sendGuildCopyAward(AwardIDList, OtherIDList, Plan, BossName),
	{noreply, State};
%% 解散系统队伍
handle_info({disbandSysTeam, _FromPid, _TeamID}, State) ->
%%	playerTeam2:disbandSysTeam(TeamID),
	{noreply, State};
%% 野外boss死了
handle_info({wildBossDead, _FromPid, {MapID, MapPid, BossId, TargetCode, TarRoleID, TarTeamID, ListRoleID}}, State) ->
	PlayerName =
		case getOnlinePlayerInfoByCode(TargetCode) of
			#rec_OnlinePlayer{roleID = RoleID} -> playerNameUID:getPlayerNameByUID(RoleID);
			_ ->
				?ERROR("wildBossChangeTarget not find player TargetCode[~p]",[TargetCode]),
				[]
		end,
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {wildBossDead, {MapID, MapPid, BossId, TargetCode, PlayerName, TarRoleID, TarTeamID, ListRoleID}}),
	{noreply, State};
%% 野外boss刷新了
handle_info({wildBossRefresh, _FromPid, Content}, State) ->
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {sendSystemChatMsg, {Content}}),
	{noreply, State};
handle_info({addTitle, _FromPid, PlayerTitleList},State) ->%增加称号
	%% 获得称号，打印日志
	?INFO("addTitle:~p", [PlayerTitleList]),
	Fun =
		fun({PlayerID, TitleID})->
			case TitleID > 0 of
				true ->
					case getOnlinePlayerInfoByID(PlayerID) of
						#rec_OnlinePlayer{pid = Pid} ->
							case is_process_alive(Pid) of
								true ->
									psMgr:sendMsg2PS(Pid,addTitle,{TitleID});
								_ ->
									?INFO("add express title fail: pid not alive ~p", [Pid]),
									playerSave:saveInSertTitle(PlayerID,TitleID)
							end;
						_ ->
							playerSave:saveInSertTitle(PlayerID,TitleID)
					end;
				_ ->
					skip
			end
		end,
	lists:foreach(Fun, PlayerTitleList),
	{noreply, State};

%%增加限时宠物
handle_info({addExpressPet, _, PlayerPetList}, State) ->
	%% 获得称号，打印日志
	?ERROR("addExpressPet:~p", [PlayerPetList]),
%%	Fun =
%%		fun({RoleID, PetID}) ->
%%			case PetID > 0 of
%%				true ->
%%					case getOnlinePlayerInfoByID(RoleID) of
%%						#rec_OnlinePlayer{pid = Pid} ->
%%							case is_process_alive(Pid) of
%%								true ->
%%									psMgr:sendMsg2PS(Pid, addExpressPet, {PetID});
%%								_ ->
%%									?INFO("add express pet fail: pid not alive ~p", [Pid]),
%%									{PetInfo, SL} = playerPet:initExpressPet(PetID),
%%									playerSave:savePet(RoleID, PetInfo),
%%									lists:foreach(fun(#recPetSkill{} = Skill) -> playerSave:savePetSkill(RoleID, PetID, Skill) end, SL)
%%							end;
%%						_ ->
%%							{PetInfo, SL} = playerPet:initExpressPet(PetID),
%%							playerSave:savePet(RoleID, PetInfo),
%%							lists:foreach(fun(#recPetSkill{} = Skill) -> playerSave:savePetSkill(RoleID, PetID, Skill) end, SL)
%%					end;
%%				_ ->
%%					skip
%%			end
%%		end,
%%	lists:foreach(Fun, PlayerPetList),
	{noreply, State};


%% 从别的服转发消息给当前服角色进程
handle_info({transit, _, {MsgID, ListRoleID, Msg}}, State) ->
	FunTransit =
		fun(RoleID) ->
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{pid = Pid} ->
					psMgr:sendMsg2PS(Pid, MsgID, Msg);
				_ ->
					skip
			end
		end,
	lists:foreach(FunTransit, ListRoleID),
	{noreply, State};

handle_info({playerCrossUseItem, _Pid, {RoleID, ItemID, UsedNum} = Data}, State) ->
	case core:queryPlayerPidByRoleID(RoleID) of
		offline ->
			playerCrossUseItem(RoleID, ItemID, UsedNum),
			skip;
		Pid ->
			%% 在线，发给玩家模块去处理
			psMgr:sendMsg2PS(Pid, playerCrossUseItem, Data)
	end,
	{noreply, State};

handle_info({playerCrossCost, _Pid, {RoleID, AccountID, Gold, Diamond, BindDiamond, PLog} = Data}, State) ->
	?INFO("playerCrossCost Data:~p", [Data]),
	case core:queryPlayerPidByRoleID(RoleID) of
		offline ->
			%% 不在线，直接处理掉！注意，当前情况下，依靠钻石消耗的模块（如累计消耗）就会有问题！
			playerCrossCost(RoleID, AccountID, ?CoinTypeGold, Gold, PLog),
			playerCrossCost(RoleID, AccountID, ?CoinTypeDiamond, Diamond, PLog),
			playerCrossCost(RoleID, AccountID, ?CoinTypeBindDiamond, BindDiamond, PLog),
			skip;
		Pid ->
			%% 在线，发给玩家模块去处理
			psMgr:sendMsg2PS(Pid, playerCrossCost, Data)
	end,
	{noreply, State};

handle_info(Info, State) ->
	deal_info(Info),
	{noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================

startPlayerOtp(NetPid, AccountID) ->
	{ok,Pid} = playerOtp:start_link([NetPid, AccountID, player]),
	Pid.

%% 根据accountID查找玩家进程
%% deal_call({getPlayerPid,AccountID},_From,_State) ->
%% 	{ok,#onlinePlayerInfo{playerPid=PlayerPid}} = getOnlinePlayerInfoByAccountID(AccountID),
%% 	PlayerPid;

deal_call(Req,_From,_State) ->
	?ERROR("unhandled call Req[~p] in Mudule[~p]",[Req,?MODULE]),
	ok.

%%网络进程连接
%%2.如果不是断线重连，则开启一个新的玩家进程，将之与网络进程进行关联
deal_info({login,FromPid,{Cmd,#pk_U2GS_RequestLogin{accountID = AccountID} = Login} }) ->
	case getPlayer(AccountID,FromPid) of
		{exist,_OldNetPid,Pid} ->
			case misc:is_process_alive(Pid) of
				true ->
					%%帐号已经存在玩家进程，统一都quit再新建
					?ERROR("self:~w want target:~w quit because login too many", [self(), Pid]),
%%					Pid ! quit,
					psMgr:sendMsg2PS(Pid, kickOutAccount, {undefined, ?OffLineTypeRobKickOut, undefined}),
					%%如果玩家还有进程存在，通知原来的进程退出需要一点时间，否则后面新注册的进程会因原进程还在而注册失败
					erlang:send_after(1000,self(),{createPlayerOtp,FromPid,AccountID,Cmd,Login});
				_ ->
					createPlayerOtp(FromPid,AccountID,Cmd,Login)
			end;
		_ ->
			createPlayerOtp(FromPid,AccountID,Cmd,Login)
	end,
	ok;

deal_info({createPlayerOtp,FromPid,AccountID,Cmd,Login}) ->
	createPlayerOtp(FromPid,AccountID,Cmd,Login);

%%deal_info({createCrossPlayerOtp,FromPid,RoleData}) ->
%%	playerCrossLogic:createCrossPlayerOtp(FromPid,RoleData);

deal_info({createGSPlayerOtp, _FromPid, Data}) ->
	playerCrossPrivateSrc:createGSPlayerOtp(Data);



%%deal_info({changeLinelogin,FromPid,{_Cmd,#pk_U2GS_ChangeLineLoginRequest{accountID = AccountID}} }) ->
%%	case getPlayer(AccountID,FromPid) of
%%		undefined ->
%%			%%没有进程，新建一个进程
%%%%			RetPid = startPlayerOtp(FromPid),
%%%%			ets:insert(ets_rec_OnlinePlayer, #rec_OnlinePlayer{accountID = AccountID, pid = RetPid, netPid = FromPid}),
%%%%			psMgr:sendMsg2PS(RetPid, netmsg,{Cmd,Login}),
%%			%%通知网络进程绑定玩家进程
%%			?DEBUG("changeLinelogin Bind FromPid[~p]AccountID[~p]",[FromPid,AccountID]),
%%%%			psMgr:sendMsg2PS(FromPid, bindPid, RetPid);
%%			ok;
%%		_ ->
%%			%%换线应该只会出现 没有当前玩家进程的情况
%%			?ERROR("changeLinelogin err,GS already has the PlayerPid")
%%	end,
%%	ok;

%%网络进程断线
deal_info({logout,_FromPid,AccountID}) ->
	case getOnlinePlayerInfoByAccountID(AccountID) of
		#rec_OnlinePlayer{roleID = RoleID} ->
			%%清除绑定的NetPid
			myEts:updateEts(ets_rec_OnlinePlayer, RoleID, {#rec_OnlinePlayer.netPid,undefined});
		_ ->
			skip
	end;

%%玩家进程退出
deal_info({'EXIT',PlayerPid,_Type}) ->
	Match = ets:fun2ms(
		fun(#rec_OnlinePlayer{pid =EtsPlayerPid}=Row) when EtsPlayerPid=:=PlayerPid ->
			Row
		end),
	case ets:select(ets_rec_OnlinePlayer, Match) of
		[#rec_OnlinePlayer{roleID = RoleID, accountID=AccountID} |_] ->
			ets:delete(ets_rec_OnlineAccount, AccountID),
			?DEBUG("==>delete oneline account id [~p]",[AccountID]),
			DelStat = ets:delete(ets_rec_OnlinePlayer, RoleID),

			%% 通知CS玩家下线
			?INFO("PlayerMgrOtp:~p notify AccountID:~p RoleID[~p] die,status[~w]",[self(),AccountID,RoleID,DelStat]),
			ok;
		[] ->
			?INFO("playerpid already offline[~w]",[PlayerPid]),
			skip
	end,
	ok;
deal_info(Info) ->
	?ERROR("unhandled handle info[~p] in Mudule[~p]",[Info,?MODULE]),
	ok.
alreadyConnectDBServer() ->
	%% 屏蔽废弃的玩法入口
	%%%%哥布林玩法初始化，要通过PlayerMgr发公告给所有玩家
	%%case misc_time:gregorian_seconds_from_1970( ) > 0 of
	%%	true ->
	%%		countBeginTime();
	%%	_ ->
	%%		erlang:send_after(1000*10, self(), {goblinBeginNoticeMsg})
	%%end,
	ok.
-spec createPlayerOtp(FromPid,AccountID,Cmd,Login) -> ok when
	FromPid::pid(),AccountID::uint(),Cmd::atom(),Login::term().
createPlayerOtp(FromPid,AccountID,Cmd,Login) ->
	%%没有进程，新建一个进程
	PlayerOtpName = playerOtp:getPlayerOtpRegName(AccountID),
	case catch whereis(PlayerOtpName) of
		Pid when is_pid(Pid) ->
			psMgr:sendMsg2PS(Pid, kickOutAccount, {undefined, ?OffLineTypeRobKickOut, undefined}),
			?WARN("kick out account[~p] old pid[~p]",[AccountID, Pid]);
		_ ->
			RetPid = startPlayerOtp(FromPid, AccountID),
			ets:insert(ets_rec_OnlineAccount, #rec_OnlineAccount{
				accountID = AccountID,
				pid = RetPid,
				netPid = FromPid
			}),
			?DEBUG("==>insert oneline account id [~p][~p]",[AccountID,RetPid]),
			psMgr:sendMsg2PS(RetPid, netmsg,{Cmd,Login}),
			%%通知网络进程绑定玩家进程
			?DEBUG("Bind FromPid[~p] PlayerPid[~p] AccountID[~p]",[FromPid,RetPid, AccountID]),
			psMgr:sendMsg2PS(FromPid, bindPid, {RetPid, AccountID}),
			ok
	end,
	ok.


%%根据账号ID获取玩家的进程ID
-spec getPlayer(AccountID,NetPid) -> pid() | undefined | {exist,OldNetPid::pid(),PlayerPid::pid()} when
	AccountID::uint(),NetPid::pid().
getPlayer(AccountID,NetPid) when erlang:is_integer(AccountID) andalso AccountID > 0 ->
	case getOnlinePlayerInfoByAccountID(AccountID) of
		#rec_OnlinePlayer{} = PidInfo ->
			dealPidInfo(PidInfo,NetPid);
		_ ->
			undefined
	end;
getPlayer(AccountID,NetPid) ->
	?ERROR("Error getPlayer by accountID[~p],NetPid[~p]",[AccountID,NetPid]),
	undefined.

dealPidInfo(#rec_OnlinePlayer{accountID = AccountID, pid = Pid, netPid = OldNetPid}, NetPid) ->
	case misc:is_process_alive(Pid) of
		true ->
			case misc:is_process_alive(OldNetPid) of
				true ->
					%%当前还有玩家正在玩游戏，没有掉线
					{exist,OldNetPid,Pid};
				_ ->
					%%已经有的网络进程死了，断网重连是要走重登录流程
					?ERROR("reconnect error aid[~p],playerpid[~p],oldNetPid[~p],newNetPid[~p]",
						[AccountID,Pid,OldNetPid,NetPid]),
%% 					myEts:updateEts(?TABLE_PlayerInfo, AccountID, {#onlinePlayerInfo.playerNetPid,NetPid}),
					erlang:send(self(), {'EXIT',Pid,undefined}),
					undefined
			end;
		_ ->
			%%进程不存在了，删除
			erlang:send(self(), {'EXIT',Pid,undefined}),
			undefined
	end.

%%dbs返回数据，然后更新ets
-spec loadAwardConfFromDBAck( Lists ) -> ok when
	Lists::[#rec_login_award_conf{},...] | [].
loadAwardConfFromDBAck( [#rec_login_award_conf{} | _] = Lists ) ->
	Size = ets:info(?TABLE_PlayerLoginAwardConf,size),
	?DEBUG("size ~p",[Size]),
	if
		erlang:is_integer(Size) andalso Size > 0 ->
			ets:delete_all_objects(?TABLE_PlayerLoginAwardConf);
		true ->
			skip
	end,
	ets:insert(?TABLE_PlayerLoginAwardConf, Lists),
	ok;
loadAwardConfFromDBAck( [] ) ->
	ets:delete_all_objects(?TABLE_PlayerLoginAwardConf);

loadAwardConfFromDBAck( Args ) ->
	?ERROR("loadConfFromDBAck err:~p",[Args]),
	ok.


%%踢所有人下线
kickOutAllPlayer() ->
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {kickOutAccount, {undefined, serverDownKickOut, undefined}}).

%%系统聊天功能广播在线玩家
systemChatAllPlayer( Content ) ->
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {sendSystemChatMsg, {Content}}).
%%系统聊天功能广播在线玩家,通过ErrorCode
-spec systemChatAllPlayerByECode(ErrorCode :: uint32()) -> ok.
systemChatAllPlayerByECode(ErrorCode) ->
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {sendSystemChatMsgByECode, {ErrorCode, []}}),
	ok.
%%系统聊天功能广播在线玩家,通过ErrorCode
-spec systemChatAllPlayerByECode(ErrorCode :: uint32(), Params :: list()) -> ok.
systemChatAllPlayerByECode(ErrorCode, Params) ->
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {sendSystemChatMsgByECode, {ErrorCode, Params}}),
	ok.

%%%%*******************哥布林玩法逻辑开始**************************************%%
%%%%计算广播开始时间
%%countBeginTime() ->
%%	RetList = createNoticeInfo(),
%%	playerState:setGoblinNoticeInfo(RetList),
%%	Fun1 = fun({BeginTime, _MapList}) ->
%%		Time = misc_time:gregorian_seconds_from_1970( ),
%%		{{Y, M, D}, {_H, _Min, _S}} = misc_time:convertSec2DateTime(Time),
%%		RefreshTime = misc_time:convertDateTime1970ToSec({{Y, M, D}, {BeginTime, 0, 0}}) - ?GoblinAheadTime,
%%
%%		case RefreshTime < Time of
%%			true ->
%%				?INFO("[1]~p点的还有~p秒发公告[~p][~p]", [BeginTime,RefreshTime + ?One_Day_Second - Time, RefreshTime, Time]),
%%				%% 发消息给PlayerMgrOtp
%%				erlang:send_after((RefreshTime + ?One_Day_Second - Time) * 1000, self(), {goblin, goblinBeginNotice, BeginTime});
%%			_ ->
%%				?INFO("[2]~p点的还有~p秒发公告[~p][~p]", [BeginTime,RefreshTime - Time, RefreshTime, Time]),
%%				erlang:send_after((RefreshTime - Time + 1) * 1000, self(), {goblin, goblinBeginNotice, BeginTime})
%%		end
%%		   end,
%%%%	lists:foreach(Fun1, RetList).
%%
%%%%从配置获得哥布林活动时间
%%-spec getBeginTimeList() -> List when
%%	List :: list().
%%getBeginTimeList() ->
%%	MapList = getCfg:get1KeyList(cfg_goblin),
%%	Fun = fun(MapID, AccList) ->
%%		case getCfg:getCfgPStack(cfg_goblin, MapID) of
%%			#goblinCfg{refreshtime = TimeList} ->
%%				AccList1 = lists:umerge(TimeList, AccList),
%%				AccList1;
%%			_ ->
%%				AccList
%%		end
%%		  end,
%%	lists:usort(lists:foldl(Fun, [], MapList)).
%%%%生成[{时间，[地图1，地图2]}]的列表保存,同时返回该列表。
%%-spec createNoticeInfo() -> List when
%%	List::list().
%%createNoticeInfo() ->
%%	TimeList = getBeginTimeList(),
%%	%%?DEBUG("TimeList = ~p", [TimeList]),
%%	Fun1 = fun(Time, AccList1) ->
%%		MapList = getCfg:get1KeyList(cfg_goblin),
%%		%%?DEBUG("MapList = ~p", [MapList]),
%%		%%找该时间点要刷怪的地图
%%		Fun2 = fun(MapID, Acclist2) ->
%%			case getCfg:getCfgPStack(cfg_goblin, MapID) of
%%				#goblinCfg{refreshtime = TimeList1} ->
%%					Fun3 = fun(E) ->
%%						E =:= Time
%%						   end,
%%					case lists:any(Fun3, TimeList1) of
%%						false ->
%%							Acclist2;
%%						_ ->
%%							[MapID | Acclist2]
%%					end
%%			end
%%			   end,
%%		ResMapList = lists:foldl(Fun2, [], MapList),
%%		%%?DEBUG("ResMapList = ~p", [ResMapList]),
%%		[{Time, ResMapList} | AccList1]
%%		   end,
%%	ResList = lists:foldl(Fun1, [], TimeList),
%%	%%?DEBUG("ResList = ~p", [ResList]),
%%	ResList.

-spec getNoticeContent(Time) -> {MapNameList, MapList} when
	Time :: integer(),
	MapNameList :: list(),
	MapList :: list().
%%通过时间去获取地图名列表
getNoticeContent(Time) ->
	List = playerState:getGoblinNoticeInfo(),
	{_Time,MapList} = lists:keyfind(Time, 1, List),
	Fun = fun(MapID, AccList) ->
		case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
			#mapsettingCfg{desc = MapName} ->
				[MapName|AccList];
			_ ->
				AccList
		end
		  end,
	MapNameList = lists:foldl(Fun, [], MapList),
	{MapNameList, MapList}.
%%*******************哥布林玩法逻辑结束**************************************%%
%%*******************军团多人副本逻辑开始**************************************%%
%% 发邮件奖品
%% 根据进度发奖给所有玩家
-spec sendGuildCopyAward(AwardIDList::list(), OtherIDList::list(), Plan::atom(), BossName::string) -> ok.
sendGuildCopyAward(AwardIDList, OtherIDList, Plan, BossName) ->
	?INFO("sendGuildCopyAward send award[~p]Plan[~p]",[AwardIDList, Plan]),
	?INFO("sendGuildCopyAward can get award[~p]",[OtherIDList]),
	%%进度共有5关
	SetType = case Plan of
				  1 ->
					  'guild_boss1';
				  2 ->
					  'guild_boss2';
				  3 ->
					  'guild_boss3';
				  4 ->
					  'guild_boss4';
				  5 ->
					  'guild_boss5'
			  end,
	#globalsetupCfg{setpara = [ItemID]} = getCfg:getCfgPStack(cfg_globalsetup, SetType),
%% 	#itemCfg{name = ItemName} =  getCfg:getCfgPStack(cfg_item, ItemID),
	MailContent1 = stringCfg:getString(cnTextGuildCopyAwardContent, [BossName]),
	%%给军团所有满足条件玩家发送
	Fun1 = fun(ToRoleID1) ->
		case playerMail:createMailGoods(ItemID, 1, true, 0, ToRoleID1, ?ItemSourceGuildCopyAward) of
			[#recMailItem{}|_] = MailItemList ->
				mail:sendSystemMail(ToRoleID1, stringCfg:getString(cnTextGuildCopyAwardTitle), MailContent1, MailItemList, "");
			_ ->
				?ERROR("player add item by mail failed,ItemID:~p",[ItemID]),
				false
		end
		   end,
	lists:foreach(Fun1,AwardIDList),
	%%给军团所有不满足条件玩家发送
	Fun2 = fun(ToRoleID2) ->
		mail:sendSystemMail(ToRoleID2, stringCfg:getString(cnTextGuildCopyAwardTitle), stringCfg:getString(cnTextGuildCopyNoticeContent), [], "")
		   end,
	lists:foreach(Fun2, OtherIDList),
	ok.
%%*******************军团多人副本逻辑结束**************************************%%
playerCrossCost(_RoleID, _AccountID, _CoinType, 0, _PLog) ->
%%	?ERROR("playerCrossCost 0 RoleID:~p, CoinType:~p,~p", [RoleID, CoinType, PLog]),
	ok;
playerCrossCost(RoleID, AccountID, CoinType, CoinNumber, PLog) ->
	Key = {RoleID, CoinType},
	case edb:readRecord(rec_player_coin, Key) of
		[#rec_player_coin{coinNumber = OldNumber}] ->
			NewNumber = erlang:max(0, OldNumber - CoinNumber),
			Rec = #rec_player_coin{roleID = Key, coinType = CoinType, coinNumber = NewNumber},
			edb:dirtySave(rec_player_coin, Key, Rec, new_rec_player_coin, update_rec_player_coin),
			?INFO("playerCrossCost success roleID=~p,CoinType=~p,CoinNumber=~p,[~p -> ~p]", [RoleID, CoinType, CoinNumber, OldNumber, NewNumber]),
			playerMoney:addLog(CoinType, NewNumber, -CoinNumber, OldNumber, PLog, "", RoleID, AccountID),
			ok;
		_ ->
			?ERROR("playerCrossCost failed roleID=~p,CoinType=~p,CoinNumber=~p", [RoleID, CoinType, CoinNumber])
	end,
	ok.

playerCrossUseItem(RoleID, ItemID, UsedNum) ->
	List = mnesia:dirty_index_read(rec_item,RoleID,#rec_item.roleID),
	Fun =
		fun
			(#rec_item{itemUID = UID, itemID = ItemID2, pileNum = Num} = Item, {_, AccNum}) when ItemID =:= ItemID2 ->
				case AccNum > 0 of
					true ->
						case Num > AccNum of
							true ->
								playerSave:saveItemData(rec_item, UID, Item#rec_item{pileNum = Num - AccNum}),
								%%记录删除日志，这个是在跨服上使用的道具，账号ID记录为角色ID
								LogRec = #recLogGoodsChange{
									itemUID = UID, itemID = ItemID2,
									playerID = RoleID, accountID = RoleID
								},
								dbLog:sendSaveLogChangeGoods(LogRec,
									#recPLogTSItem{changReason = ?ItemUseReasonPlayer, reasonParam = 7777, old = Num, new = Num - AccNum, change = AccNum}),
								{true, 0};
							_ ->
								playerSave:deleteGoods(UID),
								%%记录删除日志，这个是在跨服上使用的道具，账号ID记录为角色ID
								LogRec = #recLogGoodsChange{
									itemUID = UID, itemID = ItemID2,
									playerID = RoleID, accountID = RoleID
								},
								dbLog:sendSaveLogChangeGoods(LogRec,
									#recPLogTSItem{changReason = ?ItemUseReasonPlayer, reasonParam = 7777, old = Num, new = 0, change = AccNum}),
								{false, AccNum - Num}
						end;
					_ ->
						{true, 0}
				end;
			(_, {_, AccNum}) ->
				{false, AccNum}
		end,
	case misc:foldlEx(Fun, {false, UsedNum}, List) of
		{_, 0} ->
			ok;
		Error ->
			?ERROR("playerCrossUseItem RoleID:~p,ItemID:~p,UsedNum:~p,Error:~p,List:~p", [RoleID, ItemID, UsedNum, Error, List])
	end,
	ok.