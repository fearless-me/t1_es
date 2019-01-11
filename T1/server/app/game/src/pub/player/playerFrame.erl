%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%   玩家头像外框模块
%%%   对配置的要求:
%%%     1.需要条件达成的建议设置成永久, 一旦过期, 下次判断又会达成, 浪费算力
%%%     2.默认头像框ID必须为1, 期限必须是永久, 且配置中必须含有默认头像框
%%% @end
%%% Created : 05. 九月 2018 16:11
%%%-------------------------------------------------------------------
-module(playerFrame).
-author("Administrator").

-include("gsInc.hrl").
-include("playerPrivate.hrl").
-include("cfg_portraitFrame.hrl").
%% API
-export([
	msg/1, 				%% 协议处理
	init/0,				%% 上线初始化
	checkCondition/1,  %% 触发检查
	gm_get_frame/1,
	gm_get_frame_all/0,
	getFrame/1 %% 获取头像框(1.useItem)
]).

msg(Msg) ->
	msgReal(Msg).

init() ->
%% 当玩家上线时去除拥有的但已过期的头像框
	checkTimeOut(),

	%% 当玩家上线时判断是否有头像框功能上线前已达成但未拥有的头像框
	checkCondition(0),

	%% 发送所有已经获取的头像框
	sendOwnFrameMsg(?PlayerFrameOwnStateAll, playerState:getPlayerFrameListWithDefault()),

	ok.

msgReal(#pk_U2GS_GetPortraitFrameList{}) ->
	sendOwnFrameMsg(?PlayerFrameOwnStateAll, playerState:getPlayerFrameListWithDefault()),
	ok;
msgReal(#pk_U2GS_OperatePortraitFrame{state = State, id = ID}) ->
	operatePortraitFrame(State, ID),
%%	sendOwnFrameMsg(?PlayerFrameOwnStateAll, playerState:getPlayerFrameList()),
	ok.

%% 触发更新流程:根据Type获取Type相等的配置依次判断是否达到条件
checkCondition(Type) ->
	FrameList = playerState:getPlayerFrameListWithDefault(),

	Fun =
		fun(#portraitFrameCfg{id = ID} = Cfg, Acc) ->
			case doCheckCondition(Cfg) of
				true ->
					[ID | Acc];
				_ ->
					Acc
			end
		end,

	NewFrameList = lists:foldl(Fun, [], getCfgList(Type, FrameList)),

	reward(NewFrameList),
	ok.

doCheckCondition(#portraitFrameCfg{type = ?PlayerFrame_Type_4}) ->
	%% 默认头像框默认就有
	false;
doCheckCondition(#portraitFrameCfg{type = ?PlayerFrame_Type_WarriorTrials, type_num = TypeNum}) ->
	Value = getWarriorTrialLevel(),
%%	checkReward(TypeNum, Value);
	Value >= TypeNum;
doCheckCondition(#portraitFrameCfg{type = ?PlayerFrame_Type_ArenaRank, type_num = TypeNum}) ->
	Value = playerPropSync:getProp(?SerProp_Ladder1v1BestScort),
	%%	checkReward(TypeNum, Value);
	Value > 0 andalso Value =< TypeNum; %% 排名为小于等于则达到
doCheckCondition(#portraitFrameCfg{type = ?PlayerFrame_Type_Like, type_num = TypeNum}) ->
	Value = playerIdentity:queryLike(playerState:getRoleID()),
	%%	checkReward(TypeNum, Value);
	Value >= TypeNum;
doCheckCondition(#portraitFrameCfg{type = ?PlayerFrame_Type_Recharge, type_num = TypeNum}) ->
	Value = publicDataMgrLogic:getPlayerRechargeCount(playerState:getRoleID()),
	%%	checkReward(TypeNum, Value);
	Value >= TypeNum;
doCheckCondition(#portraitFrameCfg{type = ?PlayerFrame_Type_Item}) ->
	false;
doCheckCondition(Cfg) ->
	?ERROR("can't match this playerFrame cfg. Cfg:~p",[Cfg]),
	false.

gm_get_frame(ID) ->
	getFrame(ID).

getFrame(ID) ->
	case lists:keymember(ID, #recPlayerFrame.frameID, playerState:getPlayerFrameListWithDefault()) of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerFrame_Error_AlreadyExist),
			false;
		_ ->
			reward([ID])
	end.

gm_get_frame_all() ->
	Fun =
		fun(#portraitFrameCfg{id = ID}) ->
			getFrame([ID])
		end,
	lists:map(Fun, getCfgList(0, playerState:getPlayerFrameListWithDefault())),
	ok.

reward([]) ->
	ok;
reward(NewIDList) ->
	TimeNow = time2:getLocalTimestampSec(),

	%% 形成新列表的过程顺便存入数据库
	Fun =
		fun(ID) ->
			%% 1.存入数据库
			playerSave:saveNewFrame(ID,TimeNow),
			#recPlayerFrame{frameID = ID, time = TimeNow}
		end,

	NewFrameList = lists:map(Fun, NewIDList),

	%% 2.存入内存(此处不存入默认头像框)
	playerState:setPlayerFrameList(NewFrameList ++ playerState:getPlayerFrameList()),

	%% 3.发送头像框奖励消息
	sendOwnFrameMsg(?PlayerFrameOwnStateNew, NewFrameList),
	ok.

sendOwnFrameMsg(State, FrameList) ->
	Fun =
		fun(#recPlayerFrame{frameID = ID, time = StartTime}, Acc) ->
			case getCfg:getCfgByKey(cfg_portraitFrame, ID) of
				#portraitFrameCfg{time = 0} ->
					[#pk_PortraitFrame{id = ID, endTime = 0} | Acc];
				#portraitFrameCfg{time = KeepTime} ->
					[#pk_PortraitFrame{id = ID, endTime = KeepTime * 24 * 3600 + StartTime} | Acc];
				_ ->
					Acc
			end
		end,

	PortraitFrameList = lists:foldl(Fun, [], FrameList),

	case PortraitFrameList of %% 此处头像框列表, 如果State是新增, 则内容为空时不发送; 如果State是拥有, 逻辑上限制了列表不会为空
		[] ->
			skip;
		_ ->
		  Msg = #pk_GS2u_OwnPortraitFrame{
			  state = State,
			  portraitFrameList = PortraitFrameList
		  },
		  playerMsg:sendNetMsg(Msg)
	end,

	ok.

%% 装配或取下头像框
operatePortraitFrame(?PlayerFrameUseStateOn, ID) -> %% 装配头像框

	case lists:keymember(ID, #recPlayerFrame.frameID, playerState:getPlayerFrameListWithDefault()) of
		true ->
			playerPropSync:setInt(?PubProp_PlayerFrameID, ID),
			playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerFrameUse_Success),
			gsSendMsg:sendMsg2PublicDMSaveData({?RoleKeyRec, playerState:getRoleID(), [{#?RoleKeyRec.frameID, ID}]}); %% 此处更新#?RoleKeyRec
	_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerFrameUse_Error_DoNotHave)
	end;
operatePortraitFrame(?PlayerFrameUseStateOff, _ID) -> %% 取下头像框
	playerPropSync:setInt(?PubProp_PlayerFrameID, 0),
	playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerFrameUse_Success),
	gsSendMsg:sendMsg2PublicDMSaveData({?RoleKeyRec, playerState:getRoleID(), [{#?RoleKeyRec.frameID, 0}]}), %% 此处更新#?RoleKeyRec
	ok;
operatePortraitFrame(_, _) ->

	ok.

%% 根据Type 获取配置列表 并且 根据HaveList 去除已有的配置
%% 当Type = 0 时 获取所有配置列表 并且 根据HaveList 去除已有的配置
getCfgList(Type, HaveList) ->
	Fun =
		fun(ID, Acc) ->
			case lists:keymember(ID, #recPlayerFrame.frameID, HaveList) of
				false ->
					case getCfg:getCfgByKey(cfg_portraitFrame, ID) of
						#portraitFrameCfg{id = ID, type = ThisType} = Cfg when Type =:= 0 orelse Type =:= ThisType ->
							[Cfg | Acc];
						_ ->
							Acc
					end;
				_ ->
					Acc
			end

		end,

	lists:foldl(Fun, [], getCfg:get1KeyList(cfg_portraitFrame)).

checkTimeOut() ->
	FrameList = playerState:getPlayerFrameList(),
	TimeNow = time2:getLocalTimestampSec(),
	RoleID = playerState:getRoleID(),
	NowFrame = playerPropSync:getProp(?PubProp_PlayerFrameID),

	Fun =
		fun(#recPlayerFrame{frameID = FrameID, time = StartTime} = Frame, Acc) ->
			case getCfg:getCfgByKey(cfg_portraitFrame, FrameID) of
				#portraitFrameCfg{time = KeepTime} when KeepTime =:= 0 orelse StartTime + KeepTime > TimeNow ->
					[Frame | Acc];
				#portraitFrameCfg{id = NowFrame} ->
					%% 0.找到过期的并且正装配着的头像框 先从数据库中删除 再设置为默认头像框 最后发送错误码
					playerSave:deleteFrame(RoleID, FrameID),
					playerPropSync:setInt(?PubProp_PlayerFrameID, 0),
					playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerFrameUse_Error_UsingOutOfTime),
					gsSendMsg:sendMsg2PublicDMSaveData({?RoleKeyRec, playerState:getRoleID(), [{#?RoleKeyRec.frameID, 0}]}), %% 此处更新#?RoleKeyRec
					ok;
				_ ->
					%% 1.找到过期的 先从数据库中删除
					playerSave:deleteFrame(RoleID, FrameID),
					Acc
			end
		end,

	KeepFrameList = lists:foldl(Fun, [], FrameList),

	%% 2.去除过期的 再更新内存中的数据 (此处不存入默认头像框)
	playerState:setPlayerFrameList(KeepFrameList),
	ok.

%% 获取当前勇者试练最高层数
getWarriorTrialLevel() ->
	case playerState:getWarriorTrialInfo() of
		#rec_warrior_trial{trialSchedule = T} ->
			T;
		_ ->
			0
	end.

