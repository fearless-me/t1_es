%% @author zhongyuanwei
%% @doc @todo 命名进程间消息通信接口.


-module(gsSendMsg).
-author(zhongyuanwei).

-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	sendMsg2Main/2,
	sendMsg2DBServer/3,
	sendMsg2DBWithDBOPT/3,
	sendMsg2LogDBServer/2,
	sendNetMsg/2,
	sendNetMsgByRoleID/2,
	sendMsg2PublicDataMgr/2,
	sendMsg2PublicDMSaveData/1,
	sendMsg2PlayerDataMgr/2,
	sendRolePidMsgByRoleID/3,
	callRolePidMsgByRoleID/3
]).

%% 跨服相关消息
-export([
	sendMsg2Cross/3,
	sendMsg2AllSource/3,
	sendMsg2OneSource/4,
	sendMsg2NormalServer/4,
	sendMsg2OneNormalServer/4,

	sendMsg2AllServerPlayerOtp/2,	%% 发送消息给跨服范围内全部角色进程
	sendMsg2PlayerOtpFromCross/3	%% 从跨服发送消息给普通服的多个角色，这些角色可能来自不同服
]).

%% 发消息给玩家数据管理进程
-spec sendMsg2PlayerDataMgr(MsgID::atom(), Msg::term()) -> ok.
sendMsg2PlayerDataMgr(MsgID, Msg) ->
	psMgr:sendMsg2PS(?PlayerDataMgr, MsgID, Msg).

%% 发消息给公共数据管理进程
-spec sendMsg2PublicDataMgr(MsgID::atom(), Msg::term()) -> ok.
sendMsg2PublicDataMgr(MsgID, Msg) ->
	psMgr:sendMsg2PS(?PublicDataMgr, MsgID, Msg).

%% 保存公共数据data
-spec sendMsg2PublicDMSaveData(Data::term()) -> ok.
sendMsg2PublicDMSaveData(Data) ->
	sendMsg2PublicDataMgr(savePublicData, Data).

%% 普通服发送消息给跨服
-spec sendMsg2Cross(OtpName::atom(),MsgID::atom(), Msg::term()) ->ok.
sendMsg2Cross(OtpName, MsgID, Msg) ->
	case core:isCross() of
		false ->
			%% 发给跨服进程中转
			psMgr:sendMsg2PS(?PsNameNormalCross, sendDataToCrossServer, {OtpName, MsgID, Msg});
		_ ->
			?ERROR("sendMsg2Cross:~p,~p,~p,~p", [OtpName, MsgID, Msg, misc:getStackTrace()])
	end.

%% 跨服发消息给所有连接的普通服
-spec sendMsg2AllSource(OtpName::atom(), MsgID::atom(), Msg::term()) -> ok.
sendMsg2AllSource(OtpName, MsgID, Msg) ->
	case core:isCross() of
		true ->
			psMgr:sendMsg2PS(?PsNameCrossNormal, sendMsg2AllSource, {OtpName, MsgID, Msg});
		_ ->
			?ERROR("sendMsg2AllSource:~p,~p,~p,~p", [OtpName, MsgID, Msg, misc:getStackTrace()])
	end,
	ok.

%% 跨服发消息给指定的普通服
-spec sendMsg2OneSource(TargetServerID::integer(), OtpName::atom(), MsgID::atom(), Msg::term()) -> ok.
sendMsg2OneSource(TargetServerID, OtpName, MsgID, Msg) ->
	case core:isCross() of
		true ->
			psMgr:sendMsg2PS(?PsNameCrossNormal, sendMsg2OneSource, {TargetServerID, OtpName, MsgID, Msg});
		_ ->
			?ERROR("sendMsg2AllSource:~p,~p,~p,~p,~p", [TargetServerID, OtpName, MsgID, Msg, misc:getStackTrace()])
	end,
	ok.

%% 普通服发消息给其它普通服
-spec sendMsg2NormalServer(OtpName::atom(), MsgID::atom(), Msg::term(), IncludeSelf::boolean()) -> ok.
sendMsg2NormalServer(OtpName, MsgID, Msg, IncludeSelf) ->
	case core:isCross() of
		false ->
			case IncludeSelf of
				true ->
					psMgr:sendMsg2PS(OtpName, MsgID, self(), Msg);
				_ ->
					skip
			end,
			psMgr:sendMsg2PS(?PsNameCrossNormal, sendMsg2NormalServer,
				{core:getServerID(), OtpName, MsgID, Msg});
		_ ->
			?ERROR("sendMsg2NormalServer:~p,~p,~p,~p",
				[OtpName, MsgID, Msg, misc:getStackTrace()])
	end,
	ok.

%% 普通服发消息给其它普通服
-spec sendMsg2OneNormalServer(TargetServerID::integer(), OtpName::atom(), MsgID::atom(), Msg::term()) -> ok.
sendMsg2OneNormalServer(TargetServerID, OtpName, MsgID, Msg) ->
	case core:isCross() of
		false ->
			case core:getServerID() of
				TargetServerID ->
					psMgr:sendMsg2PS(OtpName, MsgID, self(), Msg);
				_ ->
					psMgr:sendMsg2PS(?PsNameCrossNormal, sendMsg2OneNormalServer,
						{TargetServerID, OtpName, MsgID, Msg})
			end;
		_ ->
			?ERROR("sendMsg2OneNormalServer:~p,~p,~p,~p,~p",
				[TargetServerID, OtpName, MsgID, Msg, misc:getStackTrace()])
	end,
	ok.

-spec sendMsg2Main(MsgID,Msg) -> ok when
	MsgID :: atom(), Msg :: tuple().
sendMsg2Main(MsgID,Msg) ->
	psMgr:sendMsg2PS(?PsNameMain, MsgID, Msg),
	ok.

-spec sendMsg2DBServer(MsgID,AccountID,Msg) -> ok when
	MsgID :: atom(), AccountID::uint(), Msg :: term().
sendMsg2DBServer(MsgID,AID,Msg) when erlang:is_atom(MsgID) andalso erlang:is_integer(AID) andalso AID < 1000 ->
	AccountID =
		case playerState:getAccountID() of
			undefined ->
				%% 不是玩家进程，用他的PID
				misc:pid_to_integer(self());
			V ->
				%% 是玩家，直接用他的账号ID
				V
		end,
	dbSendMsg:sendMsg2DBPID(MsgID, {self(), AccountID, Msg}),
	ok;
sendMsg2DBServer(MsgID,AccountID,Msg) when erlang:is_atom(MsgID) ->
%%	psMgr:sendMsg2PS(?PsNameDBS, gsMsgToDBserver, {AccountID,MsgID,Msg}),
%%	?PsNameGS ! {gsMsgToDB, {AccountID,MsgID,self(),Msg}},
	dbSendMsg:sendMsg2DBPID(MsgID, {self(), AccountID, Msg}).

-spec sendMsg2DBWithDBOPT(MsgID,AccountID,Msg) -> ok when
	MsgID :: atom(), AccountID::uint(), Msg :: list().
sendMsg2DBWithDBOPT(MsgID,AccountID,Msg) when erlang:is_atom(MsgID) ->
	FunFilter =
		fun({DBOPT, Data}, R) ->
			case DBOPT of
				?DBOPT_ERROR ->
					R;
				_ ->
					[{DBOPT, Data} | R]
			end
		end,
	case lists:foldl(FunFilter, [], Msg) of
		[] ->
			ok;
		MsgNew ->
			dbSendMsg:sendMsg2DBPID(MsgID, {self(), AccountID, MsgNew})
	end.

-spec sendMsg2LogDBServer(MsgID,Msg) -> ok when
	MsgID::uint(),Msg::tuple().
sendMsg2LogDBServer(MsgID,Msg) when erlang:is_integer(MsgID) ->
	psMgr:sendMsg2PS(?LogDBPID, MsgID, Msg),
	ok.

%%发送网络消息
-spec sendNetMsg(NetPid,Msg) -> ok when
	NetPid::pid(),Msg::tuple().
sendNetMsg(offline,Msg) ->
	?ERROR("sendNetMsg offline:~p,~p", [Msg, misc:getStackTrace()]),
	ok;
sendNetMsg(undefined,Msg) ->
	%% 这个日志屏蔽掉
%%	?ERROR("sendNetMsg undefined:~p,~p", [Msg, misc:getStackTrace()]),
	ok;
sendNetMsg(NetPid,Msg) ->
	psMgr:sendMsg2PS(NetPid, sendPackage, core:packNetMsg(Msg)),
	ok.

%%通过角色id给指定的角色发送网络消息
%%ok|fail
sendNetMsgByRoleID(RoleID,Msg)->
	case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
		[#rec_OnlinePlayer{netPid = NetPid}] ->
			case is_process_alive(NetPid) of
				true ->
					sendNetMsg(NetPid, Msg);
				_ ->
					fail
			end;
		_R ->
			fail
	end.
%%给玩家进程发送消息
sendRolePidMsgByRoleID(RoleID,MsgID,Msg)->
	case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
		[#rec_OnlinePlayer{pid = RolePid}] ->
			case is_process_alive(RolePid) of
				true ->
					psMgr:sendMsg2PS(RolePid, MsgID, Msg);
				_ ->
					fail
			end;
		_R ->
			fail
	end.
callRolePidMsgByRoleID(RoleID,MsgID,Msg)->
	case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
		[#rec_OnlinePlayer{pid = RolePid}] ->
			case is_process_alive(RolePid) of
				true ->
					gen_server:call(RolePid,{MsgID, Msg},1000);
				_ ->
					fail
			end;
		_R ->
			fail
	end.
%%%%发送消息给所有其它GS
%%-spec sendMsg2OtherGS(MsgID,Msg) -> ok when
%%	MsgID::atom(),Msg::term().
%%sendMsg2OtherGS(MsgID,Msg) ->
%%	sendMsg2CSServer(send2OtherGS,{MsgID,Msg}).

%%%-------------------------------------------------------------------
% api:发送消息给跨服范围内全部角色进程
-spec sendMsg2AllServerPlayerOtp(MsgID::term(), Msg::term()) -> no_return().
sendMsg2AllServerPlayerOtp(MsgID, Msg) ->
	case core:isCross() of
		true ->
			psMgr:sendMsg2PS(?PsNameCrossNormal, pidMsg2AllOLPlayer, {MsgID, Msg});
		_ ->
			gsSendMsg:sendMsg2Cross(?PsNameCrossNormal, pidMsg2AllOLPlayer, {MsgID, Msg})
	end.

%%%-------------------------------------------------------------------
% api:从跨服发送消息给普通服的多个角色，这些角色可能来自不同服
% 将同服的角色合并到一起进行发送，以减少消息数量
% 注意！如果该角色在跨服，则不会收到消息。该函数通常用作角色不在跨服时的消息反馈
-spec sendMsg2PlayerOtpFromCross(ListRole, MsgID::term(), Msg::term()) -> no_return() when
	ListRole :: [uint64(), ...] | [#recCrossApply{}, ...].
sendMsg2PlayerOtpFromCross(ListRole, MsgID, Msg) ->
	sendMsg2PlayerOtpFromCross(ListRole, MsgID, Msg, []).
% 按真实DBID分类完毕，逐个发送消息
sendMsg2PlayerOtpFromCross([], MsgID, Msg, Acc) ->
	[
		gsSendMsg:sendMsg2OneSource(DBID, ?PsNamePlayerMgr, transit, {MsgID, ListRoleID, Msg}) ||
		{DBID, ListRoleID} <- Acc
	];
% 将#pk_CrossRoleBase{}转换为RoleID
sendMsg2PlayerOtpFromCross([#pk_CrossRoleBase{id = RoleID} | T], MsgID, Msg, Acc) ->
	sendMsg2PlayerOtpFromCross([RoleID | T], MsgID, Msg, Acc);
% 将RoleID按真实DBID分类存放
sendMsg2PlayerOtpFromCross([RoleID | T], MsgID, Msg, Acc) ->
	DBID = core:getRealDBIDByUID(RoleID),
	case lists:keyfind(DBID, 1, Acc) of
		false ->
			sendMsg2PlayerOtpFromCross(T, MsgID, Msg, [{DBID, [RoleID]} | Acc]);
		{_, ListRoleID} ->
			AccNew = lists:keyreplace(DBID, 1, Acc, {DBID, [RoleID | ListRoleID]}),
			sendMsg2PlayerOtpFromCross(T, MsgID, Msg, AccNew)
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================


