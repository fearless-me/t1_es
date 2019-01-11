%% @author zhengzhichun
%% @doc @todo Add description to loginQueue.


-module(loginQueue).
-include("setup.hrl").
-include("lsInc.hrl").
-include("loginQueue.hrl").
-include("cgsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	dealInfo/2
]).

%%玩家进入，看需要排队不
dealInfo({inQueue, PlayerPid, AccountID}, #state{loginQueue = Que, maxNum = MaxNum} = State) ->
	NewQue =
		case ets:lookup(?ETSOnlineAccount, AccountID) of
			[#recLoginAccount{gsLineID = ServerID}|_] when ServerID > 0 ->
				%% 直接进入登录流程
				?INFO("inQueue online AccountID:~p", [AccountID]),
				noticePlayerPidToLogin(PlayerPid, AccountID),
				Que;
			_ ->
				%% 判断人数
				Online = getOnlineQueueNumber(),
				case queue:is_empty(Que) andalso Online < MaxNum of
					true ->
						%% 直接进入登录流程
						?DEBUG("AccountID:~p queue empty,CurNum:~p",[AccountID, Online + 1]),
						noticePlayerPidToLogin(PlayerPid,AccountID),
						Que;
					_ ->
						%% 加入队列
						?DEBUG("AccountID:~p login in queue,CurNum:~p",[AccountID, Online]),
						Que1 = queue:in({PlayerPid,AccountID}, Que),
%%						CurNumFix = getOnlineQueueNumber(),
						Que1
				end
		end,
	?INFO("account inQueue[~w][~w],NewCurNum[~p]",
		[PlayerPid,AccountID,getOnlineQueueNumber()]),
	{noreply, State#state{loginQueue = NewQue}};

%%有人下线，在线人数减1
dealInfo({logout, _pid, AccountID}, #state{} = State) ->
	?INFO("logout[~p] event,current curNum[~w-1]", [AccountID, getOnlineQueueNumber()]),
%%	{noreply, State#state{curNum = erlang:max(CurNum - 1, 0)}};
	{noreply, State};

%%GS注册成功，初始化该GS的可登录名额
dealInfo({canLoginNumInit, _pid, {Number, ServerName}}, #state{maxNum = MaxNum} = State) ->
	?WARN("canLoginNumInit[~p --> ~p, add=~p] curnum[~p]",
		[MaxNum, Number, Number - MaxNum, getOnlineQueueNumber()]),

	ServerID = core:getServerID(),
	Ret =
		case ets:lookup(?ETSGameServerInfo, ServerID) of
			[#recGameServer{}|_] ->
				ets:update_element(?ETSGameServerInfo, ServerID, [{#recGameServer.maxPlayer, Number}]),
				ets:update_element(?ETSGameServerInfo, ServerID, [{#recGameServer.gameServerName, ServerName}]),
				globalSetup:insert(?GSKey_serverName, ServerName),
				lsSendMsg:sendMsg2DBServer(updateDBInfo, {Number, ServerName}),
				gsCsInterface:sendMsg2CenterServer(updateServerInfo, {#recServerInfo.maxNum, Number}),
				{noreply, State#state{maxNum = Number}};
			_ ->
				?ERROR("canLoginNumInit failed!"),
				{noreply, State}
		end,

	case getTickTimeRef() of
		undefined ->
			%% 第一次设置登陆人数，开始心跳
			setTickTimeRef(erlang:send_after(?QueTickFrequenceMillSec, self(), tick));
		_ ->
			skip
	end,
	Ret;

%%有人成功上线
dealInfo({logon, _pid, AccountID}, State) ->
	?INFO("===logon success=~w", [AccountID]),
	ets:delete(?QueCanLoginUserEts, AccountID),
	{noreply, State};

%%tick 公告排队中的玩家序号
dealInfo(tick, #state{loginQueue = Que, maxNum = MaxNum} = State) ->
	erlang:send_after(?QueTickFrequenceMillSec * 2, self(), tick),
	NewState =
		case lsMainOtp:getCanReachGSList(true) of
			false ->
				%% 没有GS，告诉队列中的所有玩家
				?ERROR("tick no gs list"),
				L = queue:to_list(Que),
				[psMgr:sendMsg2PS(PlayerPid, noGSList) || {PlayerPid, _AccountID} <- L],
				State#state{loginQueue = queue:new()};
			_ ->
				Now = time:getUTCNowMS(),
				%% 移除登录超时的人
%%				CurNum2 = erlang:max(CurNum - tickDelTimeLoginIng(Now), 0),
				tickDelTimeLoginIng(Now),

				%% 队列中的人开始进入登录 NewCurNum 应该大于 CurNum
				Online = getOnlineQueueNumber(),
				{NewQue, _NewOnline} = tickQueOut(Que, Online, MaxNum),

				%% 广播队列中的人序号，并且去掉已经断线的玩家
				NewQue2 = tickBroadcastQueNum(Now, NewQue),

				%% 等待下一次进入
				State#state{loginQueue = NewQue2}
		end,
	{noreply, NewState};

dealInfo(Info, State) ->
	?ERROR("~p ~p @~w handle_info ~p", [?MODULE, self(), node(), Info] ),
	{noreply, State}.

%%公告玩家排队的序号(清除网络进程不在的队列)
-spec tickBroadcastQueNum(Now::integer(),Que::tuple()) ->ok|skip.
tickBroadcastQueNum(Now, Que) ->
	case loginQueueState:get(?DictBroadcastSecond) of
		Val when (erlang:is_integer(Val) andalso Val > Now) orelse Val =:= undefined ->
			loginQueueState:set(?DictBroadcastSecond, Now + ?BroadcastMillSecond),
			List = queue:to_list(Que),
			NewListReverse = broadcastQueNum(List, 1, []),
			queue:from_list(lists:reverse(NewListReverse));
		_ ->
			Que
	end.

%%tick是否有可登录名额与排队中是否有玩家，条件满足让人登录
-spec tickQueOut(Que::tuple(),CurNum::integer(),MaxNum::integer()) ->{NewQue::tuple(),NewCurNum::integer()}.
tickQueOut(Que, CurNum, MaxNum) when CurNum < MaxNum ->
	case queue:out(Que) of
		{empty, Q1} ->
			{Q1, CurNum};
		{{value, {PlayerPid,AccountID}}, Q2} ->
			case erlang:is_process_alive(PlayerPid) of
				true ->
					noticePlayerPidToLogin(PlayerPid, AccountID),
					tickQueOut(Q2, CurNum + 1, MaxNum);
				_ ->
					tickQueOut(Q2, CurNum, MaxNum)
			end
	end;
tickQueOut(Que, _CurNum, MaxNum) ->
	{Que, MaxNum}.

%%遍历队列的玩家，并告知序号
-spec broadcastQueNum(QueList::list(),Num::integer(),NewList::list()) ->list().
broadcastQueNum([],_Num,NewList) ->
	NewList;
broadcastQueNum([{PlayerPid,_Account} | QueList],Num,NewList) ->
	RealNewList =
		case erlang:is_process_alive(PlayerPid) of
			true ->
				psMgr:sendMsg2PS(PlayerPid, playerSequenceNumber, {Num}),
				[{PlayerPid,_Account} | NewList];
			false ->
				NewList
		end,
	broadcastQueNum(QueList, Num + 1, RealNewList).

%%通知玩家可以登录，并记录他的起始时间，(方便超时后归还队列数)
-spec noticePlayerPidToLogin(PlayerPid::pid(),AccountID::integer()) ->boolean().
noticePlayerPidToLogin(PlayerPid,AccountID) ->
	%% 缓存正在登录的人
	EndTime = time:getUTCNowSec() + ?LSKeyExpiresSeco,
	ets:insert_new(?QueCanLoginUserEts, #recQueCanLoginUserEts{endTime=EndTime,accountID=AccountID}),

	%% 去登录
	psMgr:sendMsg2PS(PlayerPid, canLogin),
	true.

%%清除过期的登录者，暂时不归还名额
-spec tickDelTimeLoginIng(NowArg::integer()) -> DelNum::integer().
tickDelTimeLoginIng(NowArg) ->
	Now = NowArg div 1000,%%把毫秒转到秒
	MatchSpec =
		ets:fun2ms(
			fun(Row) when Row#recQueCanLoginUserEts.endTime < Now ->
				Row#recQueCanLoginUserEts.accountID
			end
		),
	case ets:select(?QueCanLoginUserEts, MatchSpec) of
		[] ->
			0;
		ExpiresList ->
			?DEBUG("delTimeLogining====~w",[ExpiresList]),
			lists:foreach(
				fun(Item) ->
					ets:delete(?QueCanLoginUserEts, Item)
				end, ExpiresList),
			erlang:length(ExpiresList)
	end.

%%修正并打印日志
-spec getOnlineQueueNumber() ->uint().
getOnlineQueueNumber() ->
%%	{AllOnlineNum, AllConfNum} =
%%		case ets:lookup(?ETSGameServerInfo, core:getServerID()) of
%%			[#recGameServer{gameServerState = ?GameServer_State_Running} = GSRow|_] ->
%%				{GSRow#recGameServer.gameServerPlayerCount, GSRow#recGameServer.maxPlayer};
%%			_ ->
%%				{0, 0}
%%		end,
	WaitLoginNum = ets:info(?QueCanLoginUserEts,size),
	AllOnlineNum = usrOtpHandler:getCurOnlinePlayer(),
	AllOnlineNum + WaitLoginNum.
%%	?INFO("fixAndLogQueue AllOnlineNum[~p] WaitLoginEtsNum[~p] CurNum[~p] RemainNum[~p]",
%%		[AllOnlineNum, WaitLoginNum, CurNum, RemainNum]),
%%
%%	case RemainNum /= CurNum of
%%		true ->
%%			?ERROR("RemainNum[~p] /= CurNum[~p]", [RemainNum, CurNum]),
%%			RemainNum;
%%		false ->
%%			CurNum
%%	end.

setTickTimeRef(TimeRef) ->
	put('TickTimeRef', TimeRef).
getTickTimeRef() ->
	get('TickTimeRef').