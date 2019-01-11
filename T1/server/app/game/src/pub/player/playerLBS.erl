%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% lbs系统_角色接口
%%% @end
%%% Created : 20171114
%%%-------------------------------------------------------------------
-module(playerLBS).
-author("meitianyang").

-include("playerPrivate.hrl").

%% msg
-export([
	msg/1			%% 协议处理
]).

%% api
-export([
	getLBSForSync2Center/0	%% 获取向中心服同步的LBS数据
]).

%%%-------------------------------------------------------------------
% msg
-spec msg(Msg::term()) -> no_return().
msg(Msg) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_LBS) of
		true ->
			realMsg(Msg);
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% internal,msg
-spec realMsg(Msg::term()) -> no_return().
realMsg(#pk_U2GS_LBS_Request{lat = Lat, lng = Lng}) ->
	updateMyPos(Lat, Lng);
realMsg(#pk_U2GS_LBS_BesideRole_Request{lat = Lat, lng = Lng, dist = Dist}) ->
	queryLBSRole({Lat, Lng}, Dist).

%%%-------------------------------------------------------------------
% internal,msg:更新自己的坐标
-spec updateMyPos(Lat::float(), Lng::float()) -> no_return().
updateMyPos(Lat, Lng) ->
	{_, LatOld, LngOld} = playerState2:getLBS(),
	IsValidNew = lbsCommon:isValidLatAndLng({Lat, Lng}),
	IsValidOld = lbsCommon:isValidLatAndLng({LatOld, LngOld}),
	updateMyPos({Lat, Lng}, {LatOld, LngOld}, IsValidNew, IsValidOld).
updateMyPos(_, _, false, false) ->
	skip;	%% 原来就是无效值，刷新无效值依然是无效值
updateMyPos({Lat, Lng}, _, false, true) ->
	ets:update_element(ets_rec_OnlinePlayer, playerState:getRoleID(), [{#rec_OnlinePlayer.lat, Lat}, {#rec_OnlinePlayer.lng, Lng}]),
	playerState2:setLBS(true, Lat, Lng);	%% 原来有效，新设置值无效，表示关闭功能
updateMyPos({Lat, Lng}, _, true, false) ->
	ets:update_element(ets_rec_OnlinePlayer, playerState:getRoleID(), [{#rec_OnlinePlayer.lat, Lat}, {#rec_OnlinePlayer.lng, Lng}]),
	playerState2:setLBS(true, Lat, Lng);	%% 原来无效，新设置值有效，表示开启功能
updateMyPos({Lat, Lng}, {LatOld, LngOld}, true, true) when
	Lat > LatOld + 0.0001; Lat < LatOld - 0.0001; Lng > LngOld + 0.0001; Lng < LngOld - 0.0001 ->
	ets:update_element(ets_rec_OnlinePlayer, playerState:getRoleID(), [{#rec_OnlinePlayer.lat, Lat}, {#rec_OnlinePlayer.lng, Lng}]),
	playerState2:setLBS(true, Lat, Lng);	%% 原来有效，新设置值有效，变化较大，允许修改
updateMyPos(_, _, _, _) ->
	skip.	%% 忽略其它

%%%-------------------------------------------------------------------
% api:获取向中心服同步的LBS数据
-spec getLBSForSync2Center() -> list().
getLBSForSync2Center() ->
	case playerState2:getLBS() of
		{true, Lat, Lng} ->
			playerState2:setLBS(false, Lat, Lng),
			[{#recPlayerInfo.lat, Lat}, {#recPlayerInfo.lng, Lng}];
		_ ->
			[]
	end.

%%%-------------------------------------------------------------------
% internal,msg:请求LBS相关角色数据
-spec queryLBSRole(Pos::{float(), float()}, Dist::float()) -> no_return().
queryLBSRole({Lat, Lng} = Pos, Dist) ->
	%% 获取大致范围内所有格子
	L = lbsCommon:queryGrids(Pos, Dist),
	%% 打包为网路数据
	ListRole0 = makeLBSRole(L, [], Pos),
	%% 按距离升序排序
	ListRole1 = lists:sort(fun sortLBSRole/2, ListRole0),
	%% 去掉因计算精度产生的距离外结果，去掉自己
	ListRole2 = filterLBSRole(ListRole1, Dist, [], playerState:getRoleID()),
	%% 根据配置随机保留最多N个结果
	#globalsetupCfg{setpara = [N]} =
		getCfg:getCfgPStack(cfg_globalsetup, friend_NearbyPlayerMax),
	ListRole3 = randLBSRole(ListRole2, N, []),
	%% 发送消息
	Msg = #pk_GS2U_LBS_BesideRole_Ack{lat = Lat, lng = Lng, dist = Dist, listRole = ListRole3},
	playerMsg:sendNetMsg(Msg).

%%%-------------------------------------------------------------------
% internal:生成#pk_LBSRole{}
-spec makeLBSRole([uint64()|#recPlayerInfo{}|#recGrid{}, ...], Acc::[#pk_LBSRole{}, ...], Pos::{float(), float()}) -> Ret::[#pk_LBSRole{}, ...].
makeLBSRole([], Acc, _Pos) ->
	Acc;
makeLBSRole([
	#recPlayerInfo{
		roleID = ID,
		roleName = Name,
		level = Level,
		career = Career,
		race = Race,
		sex = Sex,
		head = Head,
		face = Face,
		maxForce = MaxForceAll,
		lat = Lat,
		lng = Lng
	} | T], Acc, Pos
) ->
	ServerName = core:queryServerNameByUID(ID),
	FRT = cgsFriendInterface:queryFRT(playerState:getRoleID(), ID),
	Msg = #pk_LBSRole{
		id = ID,
		name = Name,
		server = ServerName,
		level = Level,
		career = Career,
		race = Race,
		sex = Sex,
		head = Head,
		face = Face,
		maxForceAll = MaxForceAll,
		frt = FRT,
		homeID = 0,
		lat = Lat,
		lng = Lng,
		dist = lbsCommon:distance(Pos, {Lat, Lng})
	},
	makeLBSRole(T, [Msg | Acc], Pos);
makeLBSRole([#recGrid{listRoleID = ListRole} | T], Acc, Pos) ->
	makeLBSRole(ListRole ++ T, Acc, Pos);
makeLBSRole([ID | T], Acc, Pos) ->
	case core:queryRoleKeyInfoByRoleID(ID) of
		#?RoleKeyRec{
			roleName = Name,
			level = Level,
			career = Career,
			race = Race,
			sex = Sex,
			head = Head,
			face = Face,
			maxForce = MaxForceAll
		} ->
			FRT = cgsFriendInterface:queryFRT(playerState:getRoleID(), ID),
			{Lat, Lng} =
				case core:queryOnLineRoleByRoleID(ID) of
					#rec_OnlinePlayer{lat = Lat_, lng = Lng_} ->
						{Lat_, Lng_};
					_ ->
						R = #rec_OnlinePlayer{},
						{R#rec_OnlinePlayer.lat, R#rec_OnlinePlayer.lng}
				end,
			Msg = #pk_LBSRole{
				id = ID,
				name = Name,
				server = globalSetup:getServerName(),
				level = Level,
				career = Career,
				race = Race,
				sex = Sex,
				head = Head,
				face = Face,
				maxForceAll = MaxForceAll,
				frt = FRT,
				homeID = 0,
				lat = Lat,
				lng = Lng,
				dist = lbsCommon:distance(Pos, {Lat, Lng})
			},
			makeLBSRole(T, [Msg | Acc], Pos);
		_ ->
			makeLBSRole(T, Acc, Pos)
	end.

%%%-------------------------------------------------------------------
% internal:排序#pk_LBSRole{}
-spec sortLBSRole(#pk_LBSRole{}, #pk_LBSRole{}) -> boolean().
sortLBSRole(#pk_LBSRole{dist = Dist1}, #pk_LBSRole{dist = Dist2}) ->
	Dist1 < Dist2.

%%%-------------------------------------------------------------------
% internal:筛选#pk_LBSRole{}
-spec filterLBSRole(List::[#pk_LBSRole{}, ...], Dist::float(), Acc::[#pk_LBSRole{}, ...], MyRoleID::uint64()) -> Ret::[#pk_LBSRole{}, ...].
filterLBSRole([], _Dist, Acc, _MyRoleID) ->
	Acc;
filterLBSRole([#pk_LBSRole{id = MyRoleID} | T], Dist, Acc, MyRoleID) ->
	filterLBSRole(T, Dist, Acc, MyRoleID);
filterLBSRole([#pk_LBSRole{dist = Dist_} | T], Dist, Acc, MyRoleID) when Dist_ > Dist ->
	filterLBSRole(T, Dist, Acc, MyRoleID);
filterLBSRole([H | T], Dist, Acc, MyRoleID) ->
	filterLBSRole(T, Dist, [H | Acc], MyRoleID).

%%%-------------------------------------------------------------------
% internal:随机选取N个#pk_LBSRole{}
-spec randLBSRole(List::[#pk_LBSRole{}, ...], N::uint(), Default::[#pk_LBSRole{}, ...]) -> Ret::[#pk_LBSRole{}, ...].
randLBSRole([], _N, Default) ->
	Default;
randLBSRole(_List, 0, Default) ->
	Default;
randLBSRole(List, N, _Default) ->
	Len = erlang:length(List),
	Min = erlang:min(Len, N),
	List0 = lists:seq(1, Len),
	List1 = misc:shuffle(List0),
	List2 = lists:sublist(List1, Min),
	[lists:nth(N_, List) || N_ <- List2].
