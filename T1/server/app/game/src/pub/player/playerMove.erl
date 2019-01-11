%%
%% @author zhongyunawei
%% @doc @todo Add description to playerMove.


-module(playerMove).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	onPlayerMoveTo/1,
	tickMove/1,
	stopMove/1,
	clientStopMove/2,
	requirePosAck/4
]).

%玩家移动到某点
-spec onPlayerMoveTo(#pk_U2GS_MoveTo{}) -> ok.
onPlayerMoveTo(#pk_U2GS_MoveTo{posInfos = MoveList} = PkMoveTo)->
	PlayerCode = playerState:getPlayerCode(),
	case isCanMove() of
		true ->
			{X,Y} = playerState:getPos(),
			%%?DEBUG("player Speed[~p] moveList~p",[playerState:getMoveSpeed(),MoveList]),
			%%?DEBUG("Move From Grid:~p",[mapView:getGridXYByPos(X, Y)]),
			[#pk_PosInfo{x = SX,y = SY} | _] = MoveList,
			SQ = misc:calcDistSquare(X, Y, SX, SY),
%%			case SQ > 225 of
			case SQ > ?AllowErrorPosRangeSquare of
				true ->
					%%检查客户端的起点与服务器当前位置是否在一个允许的范围内，
					%%如果不在允许的范围，则该次移动失效，并把客户端拉扯到服务器所在位置
					Msg = #pk_GS2U_StopMove{
						code = PlayerCode,
						posX = X,
						posY = Y
					},
					playerMsg:sendMsgToNearPlayer(Msg, true),
%%					stopMove2(true),
					ok;
				_ ->
					%%如果是在允许的范围内，则把服务器的当前位置强制设置为客户端当前所在位置
					playerState:setPos(SX, SY),
					playerMoveTo(PkMoveTo)
			end,

			%% 移动回调
			moveCallBack();
		false ->
			stopMove(true)
	end,
	ok.

moveCallBack() ->
	%% 解除冥想
	playerOfflineExp:endMeditation(),

	case playerPetDouble:isDoubleMountType(?DoublePetGuest) of
		true ->
			playerPetDouble:doubleMountOff();
		_ ->
			skip
	end,

	%% 打断跳舞
	playerDance:breakDance(),
	ok.

%%玩家移动
-spec tickMove(DiffTime) -> ok when
	DiffTime :: uint().
tickMove(DiffTime) ->
	case isCanMove() of
		true ->
			updatePlayerMove(DiffTime);
		_ ->
			stopMove(true)
	end.

%%服务器主动停止移动
-spec stopMove(IsIncludeSelf) -> ok when
	IsIncludeSelf::boolean().
stopMove(IsIncludeSelf) ->
	ActStatus = playerState:getActionStatus(),

	if
		ActStatus =:= ?CreatureActionStatusMove ->
			stopMove2(IsIncludeSelf);
		true ->
			%%{FX,FY} = playerState:getPos(),
			%%?DEBUG("skip player Recv Client StopMove0[~p,~p]",[FX,FY]),
			skip
	end,
	ok.

%% 强制停在客户端所在点
stopMove2(IsIncludeSelf) ->
	playerState:setActionStatus(?CreatureActionStatusStand),
	playerState:setMoveTargetList([]),
	playerState:setMoveDir(0),
	playerState:setMoveOverDist(0),
	PlayerCode = playerState:getPlayerCode(),
	{FX,FY} = playerState:getPos(),
	Msg = #pk_GS2U_StopMove{
		code = PlayerCode,
		posX = FX,
		posY = FY
	},
	playerMsg:sendMsgToNearPlayer(Msg, IsIncludeSelf),
	ok.

%%客户端发送过来的停止消息
-spec clientStopMove(X,Y) -> ok when
	X::number(),Y::number().
clientStopMove(X,Y) ->
	%%?DEBUG("Recv Client StopMove2[~p,~p]",[X,Y]),
	case playerState:getActionStatus() of
		?CreatureActionStatusMove ->
			playerState:setActionStatus(?CreatureActionStatusStand);
		_Status ->
			%%?ERROR("Player[~ts] Client Stop Move,Server Status[~p]",[playerState:getName(),Status])
			skip
	end,

	playerState:setMoveTargetList([]),
	playerState:setMoveDir(0),
	%playerState:setMoveRealDir({1.0, 0.0}), %% 停止的时候不重置方向
	playerState:setMoveOverDist(0),
	PlayerCode = playerState:getPlayerCode(),
	{SX,SY} = playerState:getPos(),
%% 	SQ = misc:calcDistSquare(X, Y, SX, SY),
%% 	case SQ > ?AllowErrorPosRangeSquare of
%% 		true ->
%% 			%%检查客户端的起点与服务器当前位置是否在一个允许的范围内，
%% 			%%如果不在允许的范围，则该次移动失效，并把客户端拉扯到服务器所在位置
%% 			Msg = #pk_GS2U_StopMove{
%% 									code = PlayerCode,
%% 									posX = SX,
%% 									posY = SY
%% 								   },
%% 			PlayerEts = playerState:getMapPlayerEts(),
%% 			mapView:sendMsg2NearPlayer(PlayerEts, Msg, PlayerCode, true),
%% 			ok;
%% 		_ ->
	%%如果在允许范围内，则服务器强制设置为客户端所在位置
	playerState:setPos(X,Y),
	Msg = #pk_GS2U_StopMove{
		code = PlayerCode,
		posX = X,
		posY = Y
	},
	playerMsg:sendMsgToNearPlayer(Msg, false),
%%			ok
%% 	end,
	ok.

requirePosAck(?RequestTargetPlayerPos_GMWrapTo,MapID,X,Y) ->
	case playerState:getGmLevel() > 0 of
		true ->
			playerScene:onRequestEnterMap(MapID,X,Y);
		_ ->
			skip
	end,
	ok;
requirePosAck(RequestType,MapID,X,Y) ->
	?WARN("Unhandle RequestTargetPosType:~p Pos:~p,~p,~p",[RequestType,MapID,X,Y]),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%根据状态判断是否可以移动
-spec isCanMove() -> boolean().
isCanMove() ->
	case getCfg:getCfgByKey(cfg_mapsetting, playerState:getMapID()) of
		%% 特殊地图不能移动
		#mapsettingCfg{type = ?MapSubTypeRift, subtype = ?MapSubTypePetTerritory} ->
			false;
		_ ->
			ActionStatus = playerState:getActionStatus(),
			CurHp = playerState:getCurHp(),
			if
			%%死亡不能移动
				ActionStatus =:= ?CreatureActionStatusDead ->
					false;
			%%切换地图不能移动
				ActionStatus =:= ?CreatureActionStatusChangeMap ->
					false;
			%%死亡不能移动
				CurHp =:= 0 ->
					false;
				true ->
					Status = playerState:getStatus(),
					Flag = ?CreatureSpeStatusComa bor ?CreatureSpeStautsFixed bor ?CreatureSpeStautsFreeze bor ?CreatureSpeStautsNoControl,
					case misc:testBit(Status, Flag) of
						true ->
							false;
						_ ->
							true
					end
			end
	end.

-spec playerMoveTo(#pk_U2GS_MoveTo{}) -> ok.
playerMoveTo(#pk_U2GS_MoveTo{posX = FX,posY = FY,posInfos = MoveList}) ->
	PlayerCode = playerState:getPlayerCode(),
	%%计算目标点与当前位置的距离平方
	%%{X,Y} = playerState:getPos(),
	%%DirX = FX - X,
	%%DirY = FY - Y,
	%%LSquare = DirX * DirX + DirY * DirY,
	[_H|T] = MoveList,
	playerState:setMoveTargetList(T),
	playerState:setActionStatus(?CreatureActionStatusMove),
	%%移动打断技能施法
	case playerState:getCurUseSlowSkill() of
		#recCurUseSkill{skillID = SkillID} ->
			case skill:isBreakSkill(SkillID) of
				true ->
					playerSkill:breakUseSkill(true);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	%%广播移动消息
	Msg = #pk_GS2U_MoveInfo{
		code = PlayerCode,
		posX = FX,
		posY = FY,
		posInfos = MoveList
	},
	playerMsg:sendMsgToNearPlayer(Msg, true),
	%% 打印这个日志没啥意义，因为客户端本身可能想走很远
%%	case LSquare < ?AllowErrorPosRangeSquare of
%%		true ->
%%			ok;
%%		false ->
%%			RoleID = playerState:getRoleID(),
%%			?ERROR("onPlayerMoveTo pos check failed id=~p, posX=~p, posY=~p", [RoleID, FX,FY])
%%	end,
	ok.

-spec updatePlayerMove(DiffTime) -> ok when
	DiffTime::uint().
updatePlayerMove(DiffTime) when erlang:is_integer(DiffTime) ->
	MoveList = playerState:getMoveTargetList(),
	case MoveList of
		[] ->
			case playerState:getActionStatus() =:= ?CreatureActionStatusMove of
				true ->
					playerState:setActionStatus(?CreatureActionStatusStand);
				_ ->
					skip
			end;
		[H|T] ->
			case H of
				#pk_PosInfo{x = FX,y = FY} ->
					case calcPlayerPos(FX,FY,DiffTime) of
						true ->
							playerState:setMoveTargetList(T);
						_ ->
							skip
					end;
				_ ->
					skip
			end
	end,
	ok.

-spec calcPlayerPos(DstX,DstY,DiffTime) -> boolean() when
	DstX::float(),DstY::float(),DiffTime::uint().
calcPlayerPos(DstX,DstY,DiffTime)
	when erlang:is_float(DstX) andalso erlang:is_float(DstY)->
	{SX,SY} = playerState:getPos(),
	%%目标方向向量
	DirX = DstX - SX,
	DirY = DstY - SY,
	%%目标距离
	L = math:sqrt(DirX * DirX + DirY * DirY),
	Speed = playerState:getMoveSpeed(),
	LastOverDist = playerState:getMoveOverDist(),
	%%本次时间片的移动距离（加了上次已经移动超过的距离）
	Dist = Speed * DiffTime / 1000 + LastOverDist,
	{DX, DY} =
		case misc:isZero(L) of
			false ->
				%%计算本次将要移动到的坐标点
				{SX + DirX / L * Dist, SY + DirY / L * Dist};
			true ->
				{SX, SY}
		end,

	playerState:setFaceDir(DirX,DirY),			%% 设置新的朝向
	playerState:setMoveRealDir({DirX, DirY}),	%% 设置新的朝向

	%%将要移动的距离Dist与最终距离L的差值，大于0则表示走过了，小于0则表示还没到目标点
	OverDist = Dist - L,
	{IsReached,NewPosX, NewPosY} =
		case misc:isZero(OverDist) of
			true ->
				%%到达目标位置
				playerState:setMoveOverDist(0.0),
				{true,DstX,DstY};
			false ->
				case OverDist > 0 of
					true ->
						%%到达目标位置，且已经超过目标位置
						playerState:setMoveOverDist(OverDist),
						{true,DstX,DstY};
					_ ->
						%%还没有到达目标位置
						playerState:setMoveOverDist(0.0),
						{false,DX,DY}
				end
		end,
	playerState:setPos(NewPosX, NewPosY),
	IsReached.

