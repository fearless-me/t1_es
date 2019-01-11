%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 六月 2018 16:52
%%%-------------------------------------------------------------------
-module(playerAwakeBuffSyncOtp).
-author("Administrator").

-behaviour(myGenServer).

-include("playerPrivate.hrl").
-include("gsInc.hrl").
-include("main.hrl").

-record(state,{
}).

%% ====================================================================
%% API functions
%% ====================================================================
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


start_link() ->
	myGenServer:start_link({local,?PsNameDealAwakeBuff},?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?INFO("playerMgrOtp init"),
	process_flag(trap_exit, true),


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

handle_info({dealAwakeBuffTime, _Pid, {RoleID,NewLeftTime} = Data}, State) ->
	case core:queryPlayerPidByRoleID(RoleID) of
		offline ->
			% 角色不在线，公共进程帮忙改写内存值并写入DB
			case ets:lookup(ets_rec_playerdata, RoleID) of
				[#rec_playerdata{rec_player_prop = LP0}] ->
					case lists:keyfind(?SerProp_AwakeBuffTimeInfo, #rec_player_prop.propIndex, LP0) of
							false ->
								skip;
							#rec_player_prop{propValue = Value} = OldInfo ->
								{UpdateTime,_LeftTime} = misc:string_to_term(Value),
								NewInfo = OldInfo#rec_player_prop{propValue =misc:term_to_string({UpdateTime,NewLeftTime})},
								NewLP = lists:keystore(?SerProp_AwakeBuffTimeInfo, #rec_player_prop.propIndex, LP0,NewInfo),
								%% 写入同步属性的内存数据
								ets:update_element(ets_rec_playerdata, RoleID, [{#rec_playerdata.rec_player_prop, NewLP}]),
								%% 通知DB写入
								gsSendMsg:sendMsg2DBServer(commonSavePlayerProp, 0, [NewInfo])
						end;
				_ ->
					skip
			end;
		Pid ->
			%% 在线，发给玩家模块去处理
			psMgr:sendMsg2PS(Pid, dealAwakeBuffTime, Data)
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

deal_call(Req,_From,_State) ->
	?ERROR("unhandled call Req[~p] in Mudule[~p]",[Req,?MODULE]),
	ok.

deal_info(Info) ->
	?ERROR("unhandled handle info[~p] in Mudule[~p]",[Info,?MODULE]),
	ok.