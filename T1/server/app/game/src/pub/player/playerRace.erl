%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 跨服骑宠竞速_角色接口
%%% Created : 20170901 build
%%%           20180910 rebuild
%%% @end
%%%-------------------------------------------------------------------
-module(playerRace).
-author("meitianyang").
%%
%%-include("playerPrivate.hrl").
%%-include("../crossActivity/cacRace/cacRacePrivate.hrl").
%%
%%%%%-------------------------------------------------------------------
%%%% 结果码定义
%%-define(RaceRetInfo_BEGIN,              -20).
%%-define(RaceRetInfo_ApplyInvalidMap_A2, -20).   %% 失败：A报名时，伙伴不在指定地图
%%-define(RaceRetInfo_ApplyInvalidPet_A,  -19).   %% 失败：A报名时，无效的骑宠
%%-define(RaceRetInfo_ApplyInvalidMap_A,  -18).   %% 失败：A报名时，不在指定地图
%%-define(RaceRetInfo_ApplyInvalidTime_A, -17).   %% 失败：A报名时，不在报名时间
%%-define(RaceRetInfo_ApplyPassenger_A,   -16).   %% 失败：A报名时，自己是乘客没有操作权限
%%-define(RaceRetInfo_InviteTimeOut_A,    -15).   %% 失败：A邀请时，超时没有收到对方反馈
%%-define(RaceRetInfo_InviteOffline_A,    -14).   %% 失败：A邀请时，对方不在线
%%-define(RaceRetInfo_ReplyFailed_B,      -13).   %% 失败：B回应邀请时超时等原因失败
%%-define(RaceRetInfo_Passenger_A2,       -12).   %% 失败：A邀请时，被邀请人已有乘客或是别人的乘客
%%-define(RaceRetInfo_InvalidMap_A2,      -11).   %% 失败：A邀请时，被邀请人不在有效地图
%%-define(RaceRetInfo_Inviting_A2,        -10).   %% 失败：A邀请时，被邀请人正在处理其它邀请
%%-define(RaceRetInfo_InvalidInvite_A,    -9).    %% 失败：A邀请时，邀请人不在邀请列表中
%%-define(RaceRetInfo_Passenger_A,        -8).    %% 失败：A邀请时，已有乘客或自己是乘客
%%-define(RaceRetInfo_NeedPetDouble_A,    -7).    %% 失败：A邀请时，指定骑宠不是双人骑宠
%%-define(RaceRetInfo_InvalidPet_A,       -6).    %% 失败：A邀请时，指定骑宠无效
%%-define(RaceRetInfo_InvalidMap_A,       -5).    %% 失败：A邀请时，不在指定地图
%%-define(RaceRetInfo_InvalidTime_A,      -4).    %% 失败：A邀请时，不在活动时间
%%-define(RaceRetInfo_CD_Invite_A,        -3).    %% 失败：A邀请时，行为CD中
%%-define(RaceRetInfo_PetIsNotExists,     -2).    %% 失败：选择骑宠时，骑宠不存在或已失效
%%-define(RaceRetInfo_Failed,             -1).    %% 通用的失败
%%-define(RaceRetInfo_Success,            0).     %% 通用的成功
%%-define(RaceRetInfo_ApplySuccess,       1).     %% 报名成功
%%-define(RaceRetInfo_CancelSuccess,      2).     %% 取消报名成功
%%-define(RaceRetInfo_InviteSuccess,      3).     %% 邀请成功
%%-define(RaceRetInfo_BeInviteSuccess,    4).     %% 被邀请成功
%%-define(RaceRetInfo_END,                4).
%%-type raceRetInfo() :: ?RaceRetInfo_BEGIN .. ?RaceRetInfo_END.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% 请求可邀请列表延时与邀请行为延时（秒）
%%%% 罗成认为并没有改动该设置的需要，因此没必要做成配置
%%-define(CD_InviteList,  10).
%%-define(CD_Invite,      10).
%%
%%
%%%% api
%%-export([
%%	init/0,         %% 上线初始化
%%	msg/1			%% 协议处理
%%]).
%%
%%%% api
%%-export([
%%	acMod/1,        %% 刷新活动信息
%%	acEts/1,        %% 刷新角色ETS
%%	raceInviteA2B/2,%% 邀请乘客（A2B）
%%	raceInviteB2A/1,%% 乘客反馈（B2A）
%%	raceInviteOK/1, %% 邀请成功
%%	raceApplyA2B/2, %% 报名（A2B）
%%	raceApplyB2A/1, %% 报名失败（B2A）
%%	raceApplyOK/1,  %% 报名成功
%%	raceCancelOK/1  %% 取消报名成功
%%]).
%%
%%%% api,match
%%-export([
%%	onNoticeEnter/1,    %% 通知进入
%%	gatherSuccess/3,    %% 采集成功
%%	onGiveUp/0,		    %% 下马时弃赛
%%	onBuff/1,		    %% 需要添加BUFF
%%	onTryMount/1,	    %% 尝试上马
%%	onEnter/1,		    %% 进入地图（本来可以和onTryMount/1放在一起，万一后来哪个大神改得可以骑着马跨服了呢？
%%	onTryGiveUp/0,	    %% 准备倒计时结束后被通知如果没有骑乘则需要放弃比赛
%%	onBlock/0,		    %% 解除空气墙
%%	onPassengerLeave/1  %% 乘客离开解除双人骑乘buff
%%]).
%%
%%%% gm
%%-export([
%%	gm00/1  %% 强状态控制
%%]).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api:上线初始化
%%-spec init() -> no_return().
%%init() ->
%%	case core:isCross() of
%%		false ->
%%			%% 请求初始化规则
%%			core:sendMsgToActivity(?ActivityType_CrossRace, acMod, 0);
%%		_ ->
%%			%% 进入跨服时，如果自己不在骑宠竞速的地图，且已报名，则需要告诉客户端已经取消报名
%%			case playerState2:raceApply() of
%%				#recRaceApply{} ->
%%					case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%						#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
%%							skip;
%%						_ ->
%%							msgCancel()
%%					end;
%%				_ ->
%%					skip
%%			end
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,msg:协议处理
%%-spec msg(term()) -> no_return().
%%msg(Msg) ->
%%	case core:isCross() of
%%		false ->
%%			case activity:queryActivitySwitch(?ActivityType_CrossRace) of
%%				true ->
%%					msg_real(Msg);
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NotOpen)
%%			end;
%%		_ ->
%%			case Msg of
%%				#pk_U2GS_RaceMapItem_Request{itemID = ItemID} ->
%%					msgUseItem(ItemID);
%%				_ ->
%%					skip
%%			end
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% api,msg:协议处理_查询
%%-spec msg_real(term()) -> no_return().
%%msg_real(#pk_U2GS_RaceSelectPet{petID = PetID}) ->
%%	msgSelectPet(PetID);
%%msg_real(#pk_U2GS2U_RaceAutoMatch{autoMatch = AutoMatch}) ->
%%	msgAutoMatch(AutoMatch);
%%msg_real(#pk_U2GS_RaceInviteList{}) ->
%%	msgInviteList(0);   %% 此处填0表示没有指定需要排除的角色
%%msg_real(#pk_U2GS_RaceInvite_A2S{id = TarRoleID}) ->
%%	msgInvite(TarRoleID);
%%msg_real(#pk_U2GS_RaceInvite_B2S{isAgree = IsAgree, id = MasterRoleID, petID = PetID}) ->
%%	msgInviteB2S(IsAgree, MasterRoleID, PetID);
%%msg_real(#pk_U2GS_RaceApply{}) ->
%%	msgApply();
%%msg_real(#pk_U2GS_RaceCancel{}) ->
%%	msgCancel().
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:选择骑宠
%%-spec msgSelectPet(PetID::uint16()) -> no_return().
%%msgSelectPet(PetID) ->
%%	%% 重复请求的骑宠ID也可能已失效，因此不能忽略重复的ID
%%	{RetInfo, PetIDReal, RetNew} =
%%		case check_pet(true, PetID) of
%%			true ->
%%				%% 检查通过，设置新的骑宠并返回
%%				setting(?CRLS_PetID, PetID),
%%				#petCfg{petName = PetName} = getCfg:getCfgPStack(cfg_pet, PetID),
%%				{?RaceRetInfo_Success, PetID, {?ErrorCode_Race_SelectPet, [PetName]}};
%%			Ret ->
%%				%% 检查未通过，检查旧有骑宠是否有效，无效时重置，否则返回旧骑宠
%%				PetIDOld = setting(?CRLS_PetID),
%%				case check_pet(true, PetIDOld) of
%%					true ->
%%						{?RaceRetInfo_PetIsNotExists, PetIDOld, Ret};
%%					_ ->
%%						{?RaceRetInfo_PetIsNotExists, 0, Ret}
%%				end
%%		end,
%%	%% 返回操作结果
%%	Msg = #pk_GS2U_RaceSeletPet{
%%		retInfo = RetInfo,
%%		errorInfo = makeError(RetNew),
%%		petID = PetIDReal
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	%% 尝试自动报名
%%	tryAutoApply().
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:设置自动匹配
%%-spec msgAutoMatch(AutoMatch::raceAutoMatch()) -> no_return().
%%msgAutoMatch(AutoMatch)
%%	when erlang:is_integer(AutoMatch)
%%	andalso AutoMatch >= ?RaceAutoMatch_BEGIN
%%	andalso AutoMatch =< ?RaceAutoMatch_END ->
%%	setting(?CRLS_AutoMatch, AutoMatch),
%%	playerMsg:sendNetMsg(
%%		#pk_U2GS2U_RaceAutoMatch{autoMatch = AutoMatch}
%%	),
%%	ErrorCode =
%%		case AutoMatch of
%%			?RaceAutoMatch_None -> ?ErrorCode_Race_AutoMatch_0;
%%			?RaceAutoMatch_Auto -> ?ErrorCode_Race_AutoMatch_1;
%%			?RaceAutoMatch_Master -> ?ErrorCode_Race_AutoMatch_2
%%		end,
%%	playerMsg:sendErrorCodeMsg(ErrorCode),
%%	%% 尝试自动报名
%%	tryAutoApply().
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:查询邀请名单
%%-spec msgInviteList(Exclusive::uint64()) -> no_return().
%%msgInviteList(Exclusive) ->
%%	Ret1 = check_time_inviteList(true, true),
%%	Ret2 = check_time(Ret1, true),
%%	Ret3 = check_map(Ret2, true),
%%	Ret4 = check_pet(Ret3, true, setting(?CRLS_PetID)),
%%	Ret5 = check_pet_double(Ret4, true),
%%	Ret6 = check_partner_invite(Ret5, true),
%%	doInviteList(Ret6, Exclusive).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:查询邀请名单（执行）
%%-spec doInviteList(Ret::checkResult(), Exclusive::uint64()) -> no_return().
%%doInviteList(true, _Exclusive) ->
%%	%% 检查都通过时生成最新列表
%%	%% 较高性能消耗，需要减少调用频率，因此有CD限制
%%	playerState2:raceTimeStamp(?RaceTimeStamp_InviteList, cacRaceState:now() + ?CD_InviteList),
%%	List2Role = doInviteList_map(),
%%	List2RoleFilter = doInviteList_filter_apply(List2Role),
%%	ListInfo = doInviteList_make(List2RoleFilter),
%%	playerState2:raceListCanBeInvite(ListInfo),
%%	?DEBUG("[DebugForRace] doInviteList ~p", [{_Exclusive, ListInfo}]),
%%	Msg = #pk_GS2U_RaceInviteList{
%%		retInfo = ?RaceRetInfo_Success,
%%		errorInfo = [],
%%		listInfo = ListInfo
%%	},
%%	playerMsg:sendNetMsg(Msg);
%%doInviteList({?ErrorCode_Race_CD_InviteList_A, _}, Exclusive) ->
%%	%% CD限制时返回缓存的列表
%%	ListInfo = lists:keydelete(Exclusive, #pk_RaceCanBeInvite.id, playerState2:raceListCanBeInvite()),
%%	playerState2:raceListCanBeInvite(ListInfo),
%%	?DEBUG("[DebugForRace] doInviteList ~p", [{Exclusive, ListInfo}]),
%%	Msg = #pk_GS2U_RaceInviteList{
%%		retInfo = ?RaceRetInfo_Success,
%%		errorInfo = [],
%%		listInfo = ListInfo
%%	},
%%	playerMsg:sendNetMsg(Msg);
%%doInviteList(Ret, _Exclusive) ->
%%	%% 其它情况返回具体错误
%%	Msg = #pk_GS2U_RaceInviteList{
%%		retInfo = ?RaceRetInfo_Failed,
%%		errorInfo = makeError(Ret),
%%		listInfo = []
%%	},
%%	playerMsg:sendNetMsg(Msg).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:查询邀请名单（执行）_获取地图上的名单
%%-spec doInviteList_map() -> [[{uint64(), uint64()}, ...], ...].
%%doInviteList_map() ->
%%	%% 将自己所在的地图信息放在头部，后续特殊处理
%%	ListEtsPlayer = playerState2:raceListEtsPlayer(),
%%	EtsPlayer = playerState:getMapPlayerEts(),
%%	ListEtsPlayerOthers = lists:delete(EtsPlayer, ListEtsPlayer),
%%	Q = ets:fun2ms(fun(#recMapObject{groupID = 0, id = ID, guild = GuildID}) -> {ID, GuildID} end),
%%	FunSelect =
%%		fun(Ets) ->
%%			case ets:info(Ets, size) of
%%				undefined ->
%%					[];
%%				_ ->
%%					ets:select(Ets, Q)
%%			end
%%		end,
%%	ListRoleID = lists:keydelete(playerState:getRoleID(), 1, FunSelect(EtsPlayer)),
%%	[ListRoleID | lists:map(FunSelect, ListEtsPlayerOthers)].
%%
%%%%%-------------------------------------------------------------------
%%%% internal:查询邀请名单（执行）_排除已报名的选手
%%-spec doInviteList_filter_apply(
%%	[[{uint64(), uint64()}, ...], ...]
%%) ->
%%	[[{uint64(), uint64()}, ...], ...].
%%doInviteList_filter_apply(List2Role) ->
%%	Ets = ets:new(etsTemp, [{keypos, #recKV.k}, private, set]),
%%	ets:insert(Ets, ets:tab2list(?EtsRaceApplyHelper)),
%%	List2RoleFilter = doInviteList_filter_apply(List2Role, Ets, []),
%%	ets:delete(Ets),
%%	List2RoleFilter.
%%
%%-spec doInviteList_filter_apply(
%%	[[{uint64(), uint64()}, ...], ...],
%%	etsTab(),
%%	[[{uint64(), uint64()}, ...], ...]
%%) ->
%%	[[{uint64(), uint64()}, ...], ...].
%%doInviteList_filter_apply([], _Ets, Acc) ->
%%	Acc;    %% 注意！自己所在的地图信息已在尾部
%%doInviteList_filter_apply([H | T], Ets, Acc) ->
%%	HNew = doInviteList_filter_apply_(H, Ets, []),
%%	doInviteList_filter_apply(T, Ets, [HNew | Acc]).
%%
%%-spec doInviteList_filter_apply_(
%%	[{uint64(), uint64()}, ...], etsTab(), [{uint64(), uint64()}, ...]
%%) ->
%%	[{uint64(), uint64()}, ...].
%%doInviteList_filter_apply_([], _Ets, Acc) ->
%%	Acc;    %% 注意！自己所在的地图信息已在尾部
%%doInviteList_filter_apply_([{RoleID, _GuildID} = H | T], Ets, Acc) ->
%%	case ets:lookup(Ets, RoleID) of
%%		[] ->
%%			doInviteList_filter_apply_(T, Ets, [H | Acc]);
%%		_ ->
%%			doInviteList_filter_apply_(T, Ets, Acc)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:查询邀请名单（执行）_生成详细信息途中
%%-spec doInviteList_make([[{uint64(), uint64()}, ...], ...]) -> [#pk_RaceCanBeInvite{}, ...].
%%doInviteList_make(List2RoleFilter) ->
%%	RoleIDMy = playerState:getRoleID(),
%%	RoleIDCouple = marriageState:queryMarriageRoleID(RoleIDMy),
%%	GuildIDMy = playerState:getGuildID(),
%%	#recFriend2Data{relations = Relations} = cgsFriendState:queryFriend2Data(RoleIDMy),
%%	doInviteList_make(List2RoleFilter, RoleIDMy, RoleIDCouple, Relations, GuildIDMy, []).
%%
%%-spec doInviteList_make(
%%	[[{uint64(), uint64()}, ...], ...], uint64(), uint64(), [#rec_friend2_relation{}, ...],
%%	uint64(), [#pk_RaceCanBeInvite{}, ...]
%%) ->
%%	[#pk_RaceCanBeInvite{}, ...].
%%doInviteList_make([], _RoleIDMy, _RoleIDCouple, _Relations, _GuildIDMy, Acc) ->
%%	%% 全部生成完毕，排序
%%	lists:sort(fun doInviteList_make_sort/2, Acc);
%%doInviteList_make([H], RoleIDMy, RoleIDCouple, Relations, GuildIDMy, Acc) ->
%%	%% 根据前文逻辑，最后一个元素为当前地图包含元素，需要包含陌生人
%%	doInviteList_make_make(H, RoleIDMy, RoleIDCouple, Relations, GuildIDMy, true, Acc);
%%doInviteList_make([H | T], RoleIDMy, RoleIDCouple, Relations, GuildIDMy, Acc) ->
%%	%% 根据前文逻辑，非最后一个元素不需要包含陌生人信息
%%	AccNew = doInviteList_make_make(H, RoleIDMy, RoleIDCouple, Relations, GuildIDMy, false, Acc),
%%	doInviteList_make(T, RoleIDMy, RoleIDCouple, Relations, GuildIDMy, AccNew).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:查询邀请名单（执行）_生成详细信息途中_生成详细信息
%%-spec doInviteList_make_make(
%%	[uint64(), ...], uint64(), uint64(), [#rec_friend2_relation{}, ...],
%%	uint64(), boolean(), [#pk_RaceCanBeInvite{}, ...]
%%) ->
%%	[#pk_RaceCanBeInvite{}, ...].
%%doInviteList_make_make([], _RoleIDMy, _RoleIDCouple, _Relations, _GuildIDMy, _IsInMyMap, Acc) ->
%%	Acc;
%%doInviteList_make_make([{RoleID, GuildID} | T], RoleIDMy, RoleIDCouple, Relations, GuildIDMy, IsInMyMap, Acc) ->
%%	case makeCanBeInvite(RoleIDMy, GuildIDMy, RoleID, GuildID, RoleIDCouple, IsInMyMap, Relations) of
%%		0 ->
%%			doInviteList_make_make(T, RoleIDMy, RoleIDCouple, Relations, GuildIDMy, IsInMyMap, Acc);
%%		HNew ->
%%			doInviteList_make_make(T, RoleIDMy, RoleIDCouple, Relations, GuildIDMy, IsInMyMap, [HNew | Acc])
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:查询邀请名单（执行）_生成详细信息途中_排序
%%%% 优先级备注
%%%% 1.伴侣
%%%% 2.好友：友好度降序
%%%% 3.家族成员：历史贡献降序
%%%% 4.陌生人：升序
%%-spec doInviteList_make_sort(#pk_RaceCanBeInvite{}, #pk_RaceCanBeInvite{}) -> boolean().
%%doInviteList_make_sort(#pk_RaceCanBeInvite{isCouple = true}, _) ->
%%	true;   %% 伴侣始终居于首位
%%doInviteList_make_sort(
%%	#pk_RaceCanBeInvite{
%%		isFriend = IsFriendA,
%%		isGuildMember = IsGuildMemberA,
%%		friendliness = FriendlinessA,
%%		liveness = LivenessA,
%%		level = LevelA
%%	},
%%	#pk_RaceCanBeInvite{
%%		isFriend = IsFriendB,
%%		isGuildMember = IsGuildMemberB,
%%		friendliness = FriendlinessB,
%%		liveness = LivenessB,
%%		level = LevelB
%%	}
%%) ->
%%	case IsFriendA of
%%		IsFriendB ->
%%			case IsGuildMemberA of
%%				IsGuildMemberB ->
%%					if
%%						IsFriendA =:= true ->
%%							FriendlinessA >= FriendlinessB; %% 都是好友，友好度高的排前面
%%						IsGuildMemberA =:= true ->          %% 都是家族成员，历史贡献高的排前面
%%							LivenessA >= LivenessB;
%%						true ->
%%							LevelA >= LevelB                %% 都是陌生人，等级高的排前面
%%					end;
%%				_ ->
%%					IsGuildMemberA  %% 家族成员排前面
%%			end;
%%		_ ->
%%			IsFriendA   %% 好友排前面
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:邀请乘客
%%-spec msgInvite(TarRoleID::uint64()) -> no_return().
%%msgInvite(0) ->
%%	skip;   %% 忽略明显错误的传参
%%msgInvite(TarRoleID) ->
%%	case playerState:getRoleID() of
%%		TarRoleID ->
%%			?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%			skip;   %% 忽略对自己的邀请
%%		_ ->
%%			?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%			PetID = setting(?CRLS_PetID),
%%			Ret1 = check_time_invite(true, true),
%%			Ret2 = check_time(Ret1, true),
%%			Ret3 = check_map(Ret2, true),
%%			Ret4 = check_pet(Ret3, true, PetID),
%%			Ret5 = check_pet_double(Ret4, true),
%%			Ret6 = check_partner_invite(Ret5, true),
%%			Ret7 = check_invite_target(Ret6, true, TarRoleID),  %% 注：该条至少在CD检查后
%%			doInviteA2S(Ret7, TarRoleID, PetID)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:邀请乘客（A2S）
%%-spec doInviteA2S(Ret::checkResult(), TarRoleID::uint64(), PetID::uint16()) -> no_return().
%%doInviteA2S(true, TarRoleID, PetID) ->
%%	case core:queryOnLineRoleByRoleID(TarRoleID) of
%%		#rec_OnlinePlayer{pid = Pid} ->
%%
%%			?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%			Msg = {
%%				playerState:getRoleID(),
%%				playerState:getGuildID(),
%%				PetID,
%%				cacRaceState:now() + ?CD_Invite
%%			},
%%			psMgr:sendMsg2PS(Pid, raceInviteA2B, Msg),
%%			%% 延时消息处理超时
%%			MsgDelay = {false, TarRoleID, {?ErrorCode_Race_InviteTimeOut_A, []}},
%%			erlang:send_after(?CD_Invite * 1000, self(), {raceInviteB2A, self(), MsgDelay});
%%		_ ->
%%			doInviteA2S({?ErrorCode_Race_InviteOffline_A, []}, TarRoleID, PetID)
%%	end;
%%doInviteA2S(Ret, _TarRoleID, _PetID) ->
%%	%% 其它错误需要提示
%%	?DEBUG("[DebugForRace] RoleID:~w Ret:~w", [playerState:getRoleID(), Ret]),
%%	ApplyState = makeApplyState(),
%%	Msg = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = doInviteA2S_E2R(Ret),
%%		errorInfo = makeError(Ret)
%%	},
%%	playerMsg:sendNetMsg(Msg).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:邀请乘客（A2S）_逻辑错误码对应，用于客户端逻辑
%%-spec doInviteA2S_E2R(checkResult()) -> raceRetInfo().
%%doInviteA2S_E2R({?ErrorCode_Race_CD_Invite_A, _}) ->
%%	?RaceRetInfo_CD_Invite_A;
%%doInviteA2S_E2R({?ErrorCode_Race_IsNotTimeToApply, _}) ->
%%	?RaceRetInfo_InvalidTime_A;
%%doInviteA2S_E2R({?ErrorCode_Race_IsInGroup_A, _}) ->
%%	?RaceRetInfo_InvalidMap_A;
%%doInviteA2S_E2R({?ErrorCode_Race_IsNotInMap_A, _}) ->
%%	?RaceRetInfo_InvalidMap_A;
%%doInviteA2S_E2R({?ErrorCode_Race_PetIsNotExists_A, _}) ->
%%	?RaceRetInfo_InvalidPet_A;
%%doInviteA2S_E2R({?ErrorCode_Race_NeedPetDouble_A, _}) ->
%%	?RaceRetInfo_NeedPetDouble_A;
%%doInviteA2S_E2R({?ErrorCode_Race_CannotInviteWithPassenger_A, _}) ->
%%	?RaceRetInfo_Passenger_A;
%%doInviteA2S_E2R({?ErrorCode_Race_CannotInviteBeingPassenger_A, _}) ->
%%	?RaceRetInfo_Passenger_A;
%%doInviteA2S_E2R({?ErrorCode_Race_InviteWithoutList_A, _}) ->
%%	?RaceRetInfo_InvalidInvite_A;
%%doInviteA2S_E2R({?ErrorCode_Race_InviteOffline_A, _}) ->
%%	?RaceRetInfo_InviteOffline_A.
%%
%%%%%-------------------------------------------------------------------
%%%% api:邀请乘客（A2B）
%%-spec raceInviteA2B(
%%	FromPid::pid(), {FromRoleID::uint64(), FromGuildID::uint64(), PetID::uint16(), TimeOut::uint32()}
%%) ->
%%	no_return().
%%raceInviteA2B(FromPid, Msg) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	Ret1 = check_beInviteInfo(true, false),
%%	Ret2 = check_map(Ret1, false),
%%	Ret3 = check_partner_beInvite(Ret2, false),
%%	doInviteA2B(Ret3, FromPid, Msg).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:邀请乘客（A2B）
%%-spec doInviteA2B(
%%	checkResult(), FromPid::pid(), {FromRoleID::uint64(), FromGuildID::uint64(), PetID::uint16(), TimeOut::uint32()}
%%) ->
%%	no_return().
%%doInviteA2B(true, _FromPid, {FromRoleID, FromGuildID, PetID, TimeOut}) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	playerState2:raceBeInviteInfo({FromRoleID, FromGuildID, PetID, TimeOut}),
%%	RoleIDMy = playerState:getRoleID(),
%%	GuildIDMy = playerState:getGuildID(),
%%	RoleIDCouple = marriageState:queryMarriageRoleID(RoleIDMy),
%%	Master = makeCanBeInvite(RoleIDMy, GuildIDMy, FromRoleID, FromGuildID, RoleIDCouple, true),
%%	Msg = #pk_GS2U_RaceInvite_S2B{
%%		master = Master,
%%		petID = PetID,
%%		timeout = TimeOut - 1   %% 客户端超时时间比服务端超时时间更短，便于处理延时等问题
%%	},
%%	playerMsg:sendNetMsg(Msg);
%%doInviteA2B(Ret, FromPid, _Msg) ->
%%	?DEBUG("[DebugForRace] RoleID:~w Ret:~w", [playerState:getRoleID(), Ret]),
%%	Msg = {
%%		false,
%%		playerState:getRoleID(),
%%		Ret
%%	},
%%	psMgr:sendMsg2PS(FromPid, raceInviteB2A, Msg).
%%
%%%%%-------------------------------------------------------------------
%%%% api:邀请乘客（B2A）
%%-spec raceInviteB2A(term()) -> no_return().
%%raceInviteB2A({false, RoleID, Ret}) ->
%%	case playerState2:raceInviting() of
%%		#pk_RaceCanBeInvite{id = RoleID} ->
%%			?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%			%% 收到了正在邀请的人的拒绝消息，立即处理
%%			playerState2:raceTimeStamp(?RaceTimeStamp_Invite, 0),
%%			ApplyState = makeApplyState(),
%%			ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%				retInfo = raceInviteB2A_false_E2R(Ret),
%%				errorInfo = makeError(Ret)
%%			},
%%			playerMsg:sendNetMsg(ApplyStateNew),
%%			%% 以排除该角色的方式刷新列表，但不同步客户端，因客户端已自行处理
%%			playerState2:raceInviting(0),
%%			ListInfo = lists:keydelete(RoleID, #pk_RaceCanBeInvite.id, playerState2:raceListCanBeInvite()),
%%			playerState2:raceListCanBeInvite(ListInfo);
%%		_ ->
%%			?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%			%% 该角色已经不在正在邀请缓冲里，属于超时，则忽略
%%			skip
%%	end;
%%raceInviteB2A({true, TarRoleID, PetID, TarPid, TarNetPid, TarApplyState}) ->
%%	case {playerState2:raceInviting(), setting(?CRLS_PetID)} of
%%		{#pk_RaceCanBeInvite{id = TarRoleID} = CanBeInvite, PetID} ->
%%			?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%			Ret2 = check_time(true, true),
%%			Ret3 = check_map(Ret2, true),
%%			Ret4 = check_pet(Ret3, true, PetID),
%%			Ret5 = check_pet_double(Ret4, true),
%%			Ret6 = check_partner_invite(Ret5, true),
%%			doInviteB2A(Ret6, CanBeInvite, TarPid, TarNetPid);
%%		_ ->
%%			?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%			%% 这里通知目标而不是自己，请求超时
%%			NetMsg = TarApplyState#pk_GS2U_RaceApplyState{
%%				retInfo = ?RaceRetInfo_ReplyFailed_B,
%%				errorInfo = makeError({?ErrorCode_Race_InviteTimeOut_B, []})
%%			},
%%			playerMsg:sendNetMsg(TarNetPid, NetMsg)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:邀请乘客（B2A）_拒绝后的逻辑码
%%-spec raceInviteB2A_false_E2R(checkResult()) -> raceRetInfo().
%%raceInviteB2A_false_E2R({?ErrorCode_Race_Inviting_B, _}) ->
%%	?RaceRetInfo_Inviting_A2;
%%raceInviteB2A_false_E2R({?ErrorCode_Race_IsInGroup_B, _}) ->
%%	?RaceRetInfo_InvalidMap_A2;
%%raceInviteB2A_false_E2R({?ErrorCode_Race_IsNotInMap_B, _}) ->
%%	?RaceRetInfo_InvalidMap_A2;
%%raceInviteB2A_false_E2R({?ErrorCode_Race_InviteFailed_B, _}) ->
%%	?RaceRetInfo_Passenger_A2;
%%raceInviteB2A_false_E2R({?ErrorCode_Race_InviteTimeOut_A, _}) ->
%%	?RaceRetInfo_InviteTimeOut_A.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:邀请乘客（B2A）
%%-spec doInviteB2A(
%%	Ret::checkResult(), CanBeInvite::#pk_RaceCanBeInvite{}, TarPid::pid(), TarNetPid::pid()
%%) ->
%%	no_return().
%%doInviteB2A(true, #pk_RaceCanBeInvite{id = TarRoleID} = CanBeInvite, TarPid, TarNetPid) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	%% 记录伙伴信息
%%	RaceRole = makeRaceRole(CanBeInvite, TarPid, TarNetPid),
%%	Partner = #recRacePartner{
%%		type = ?RacePartner_Passenger,
%%		forServer = RaceRole,
%%		forClient = CanBeInvite,
%%		petID = setting(?CRLS_PetID),
%%		autoMatch = setting(?CRLS_AutoMatch)
%%	},
%%	playerState2:racePartner(Partner),
%%	%% 同步客户端状态
%%	playerState2:raceTimeStamp(?RaceTimeStamp_Invite, 0),
%%	ApplyState = makeApplyState(),
%%	ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = ?RaceRetInfo_InviteSuccess
%%	},
%%	playerMsg:sendNetMsg(ApplyStateNew),
%%	%% 同步伙伴状态
%%	TarGuildID =
%%		case ets:lookup(rec_guild_member, TarRoleID) of
%%			#rec_guild_member{guildID = GuildID_} ->
%%				GuildID_;
%%			_ ->
%%				0
%%		end,
%%	CanBeInvite2 = makeCanBeInvite(
%%		TarRoleID,
%%		TarGuildID,
%%		playerState:getRoleID(),
%%		playerState:getGuildID(),
%%		marriageState:queryMarriageRoleID(TarRoleID),
%%		true
%%	),
%%	RaceRole2 = makeRaceRole(CanBeInvite2, self(), playerState:getNetPid()),
%%	Partner2 = Partner#recRacePartner{
%%		type = ?RacePartner_Master,
%%		forServer = RaceRole2,
%%		forClient = CanBeInvite2
%%	},
%%	psMgr:sendMsg2PS(TarPid, raceInviteOK, Partner2);
%%doInviteB2A(Ret, _TarRoleID, _TarPid, _TarNetPid) ->
%%	?DEBUG("[DebugForRace] RoleID:~w Ret:~w", [playerState:getRoleID(), Ret]),
%%	%% 收到了邀请人的同意，但自己出了问题，此处同步自己信息
%%	playerState2:raceTimeStamp(?RaceTimeStamp_Invite, 0),
%%	ApplyState = makeApplyState(),
%%	ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = doInviteB2A_true_E2R(Ret),
%%		errorInfo = makeError(Ret)
%%	},
%%	playerMsg:sendNetMsg(ApplyStateNew).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:邀请乘客（B2A）_同意后的逻辑码
%%-spec doInviteB2A_true_E2R(checkResult()) -> raceRetInfo().
%%doInviteB2A_true_E2R(Ret) ->
%%	doInviteA2S_E2R(Ret).
%%
%%%%%-------------------------------------------------------------------
%%%% api:邀请乘客（B2S）
%%-spec msgInviteB2S(IsAgree::boolean(), MasterRoleID::uint64(), PetID::uint16()) -> no_return().
%%msgInviteB2S(IsAgree, MasterRoleID, PetID) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	Ret1 = check_invite_timeout(true, false, MasterRoleID, PetID),
%%	Ret2 = check_map(Ret1, false),
%%	Ret3 = check_partner_beInvite(Ret2, false),
%%	doInviteB2S(Ret3, IsAgree, MasterRoleID, PetID).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:邀请乘客（B2S）
%%-spec doInviteB2S(Ret::checkResult(), IsAgree::boolean(), MasterRoleID::uint64(), PetID::uint16()) -> no_return().
%%doInviteB2S(true, IsAgree, MasterRoleID, PetID) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	case core:queryOnLineRoleByRoleID(MasterRoleID) of
%%		#rec_OnlinePlayer{pid = Pid} ->
%%			Msg = {
%%				IsAgree,
%%				playerState:getRoleID(),
%%				PetID,
%%				self(),
%%				playerState:getNetPid(),
%%				makeApplyState()
%%			},
%%			psMgr:sendMsg2PS(Pid, raceInviteB2A, Msg);
%%		_ ->
%%			doInviteB2S({?ErrorCode_Race_InviteOffline_B, []}, IsAgree, MasterRoleID, PetID)
%%	end;
%%doInviteB2S(Ret, _IsAgree, _MasterRoleID, _PetID) ->
%%	?DEBUG("[DebugForRace] RoleID:~w Ret:~w", [playerState:getRoleID(), Ret]),
%%	ApplyState = makeApplyState(),
%%	ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = ?RaceRetInfo_ReplyFailed_B,
%%		errorInfo = makeError(Ret)
%%	},
%%	playerMsg:sendNetMsg(ApplyStateNew).
%%
%%%%%-------------------------------------------------------------------
%%%% api:邀请成功
%%-spec raceInviteOK(Partner::#recRacePartner{}) -> no_return().
%%raceInviteOK(Partner) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	playerState2:racePartner(Partner),
%%	ApplyState = makeApplyState(),
%%	ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = ?RaceRetInfo_BeInviteSuccess
%%	},
%%	playerMsg:sendNetMsg(ApplyStateNew).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:报名
%%-spec msgApply() -> no_return().
%%msgApply() ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	Ret1 = check_partner_master(true, true, 0),
%%	Ret2 = check_time(Ret1, true),
%%	Ret3 = check_map(Ret2, true),
%%	Ret4 = check_pet(Ret3, true, setting(?CRLS_PetID)),
%%	doApply(Ret4).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:因其它事件触发的自动报名
%%-spec tryAutoApply() -> no_return().
%%tryAutoApply() ->
%%	case playerState2:raceApply() of
%%		#recRaceApply{} ->
%%			doApply(true);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:报名
%%-spec doApply(Ret::checkResult()) -> no_return().
%%doApply(true) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	case playerState2:racePartner() of
%%		#recRacePartner{forServer = #recRaceRole{pid = Pid}} ->
%%			psMgr:sendMsg2PS(Pid, raceApplyA2B, playerState:getRoleID());
%%		RacePartner ->
%%			core:sendMsgToActivity(?ActivityType_CrossRace, raceApply, makeRaceApply(RacePartner))
%%	end;
%%doApply(Ret) ->
%%	?DEBUG("[DebugForRace] RoleID:~w Ret:~w", [playerState:getRoleID(), Ret]),
%%	ApplyState = makeApplyState(),
%%	ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = doApply_E2R(Ret),
%%		errorInfo = makeError(Ret)
%%	},
%%	playerMsg:sendNetMsg(ApplyStateNew).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:报名
%%-spec doApply_E2R(checkResult()) -> raceRetInfo().
%%doApply_E2R({?ErrorCode_Race_ApplyByPassenger_A, _}) ->
%%	?RaceRetInfo_ApplyPassenger_A;
%%doApply_E2R({?ErrorCode_Race_IsNotTimeToApply, _}) ->
%%	?RaceRetInfo_ApplyInvalidTime_A;
%%doApply_E2R({?ErrorCode_Race_IsInGroup_A, _}) ->
%%	?RaceRetInfo_ApplyInvalidMap_A;
%%doApply_E2R({?ErrorCode_Race_IsNotInMap_A, _}) ->
%%	?RaceRetInfo_ApplyInvalidMap_A;
%%doApply_E2R({?ErrorCode_Race_PetIsNotExists_A, _}) ->
%%	?RaceRetInfo_ApplyInvalidPet_A.
%%
%%%%%-------------------------------------------------------------------
%%%% api:报名（A2B)
%%-spec raceApplyA2B(FromPid::pid(), FromRoleID::uint64()) -> no_return().
%%raceApplyA2B(FromPid, FromRoleID) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	Ret1 = check_partner_master(true, false, FromRoleID),
%%	Ret2 = check_map(Ret1, true),
%%	doApplyA2B(Ret2, FromPid).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:报名（A2B)
%%-spec doApplyA2B(Ret::checkResult(), FromPid::pid()) -> no_return().
%%doApplyA2B(true, _FromPid) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	RacePartner = playerState2:racePartner(),
%%	core:sendMsgToActivity(?ActivityType_CrossRace, raceApply, makeRaceApply(RacePartner));
%%doApplyA2B(Ret, FromPid) ->
%%	?DEBUG("[DebugForRace] RoleID:~w Ret:~w", [playerState:getRoleID(), Ret]),
%%	psMgr:sendMsg2PS(FromPid, raceApplyB2A, Ret).
%%
%%%%%-------------------------------------------------------------------
%%%% api:报名（B2A)
%%-spec raceApplyB2A(Ret::checkResult()) -> no_return().
%%raceApplyB2A({?ErrorCode_Race_ApplyByPassenger_B, _}) ->
%%	%% B认为不是A的乘客，此时数据不同步，需要执行取消报名以重置状态
%%	msgCancel();
%%raceApplyB2A(Ret) ->
%%	?DEBUG("[DebugForRace] RoleID:~w Ret:~w", [playerState:getRoleID(), Ret]),
%%	ApplyState = makeApplyState(),
%%	ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = ?RaceRetInfo_ApplyInvalidMap_A2,
%%		errorInfo = makeError(Ret)
%%	},
%%	playerMsg:sendNetMsg(ApplyStateNew).
%%
%%%%%-------------------------------------------------------------------
%%%% api:报名成功
%%-spec raceApplyOK(RaceApply::#recRaceApply{}) -> no_return().
%%raceApplyOK(RaceApply) ->
%%	?DEBUG("[DebugForRace] RoleID:~w", [playerState:getRoleID()]),
%%	playerState2:raceApply(RaceApply),
%%	ApplyState = makeApplyState(),
%%	ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = ?RaceRetInfo_ApplySuccess,
%%		errorInfo = makeError({?ErrorCode_Race_ApplySuccess, []})
%%	},
%%	playerLogAdd:addLogParticipatorInfo(?LogParticipator_PetRace),
%%	playerMsg:sendNetMsg(ApplyStateNew).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:取消报名
%%-spec msgCancel() -> no_return().
%%msgCancel() ->
%%	%% 不管有没有报名状态，取消自己的伙伴信息
%%	playerState2:raceInviting(0),   %% 清空正在邀请信息
%%	playerState2:raceApply(0),      %% 清空报名信息
%%	playerState2:racePartner(0),    %% 清空伙伴信息
%%	%% 无论是否有报名状态，可能因为自己信息不同步，都要向活动进程申请取消
%%	core:sendMsgToActivity(?ActivityType_CrossRace, raceCancel, playerState:getRoleID()),
%%	%% 无报名状态时刷新状态，有报名状态时请求取消报名
%%	case playerState2:raceApply() of
%%		undefined ->
%%			ApplyState = makeApplyState(),
%%			ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%				retInfo = ?RaceRetInfo_CancelSuccess,
%%				errorInfo = makeError({?ErrorCode_Race_CancelSuccess, []})
%%			},
%%			playerMsg:sendNetMsg(ApplyStateNew);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:使用道具（虚拟的
%%-spec msgUseItem(ItemID::uint8()) -> no_return().
%%msgUseItem(ItemID) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
%%			case getCfg:getCfgByKey(cfg_race_item, ItemID) of
%%				#race_itemCfg{} ->
%%					?DEBUG("[DebugForRace] item RoleID:~w ItemID:~w", [playerState:getRoleID(), ItemID]),
%%					core:sendMsgToActivity(?ActivityType_CrossRace, race_item, {playerState:getRoleID(), ItemID});
%%				_ ->
%%					?DEBUG("[DebugForRace] item RoleID:~w ItemID:~w", [playerState:getRoleID(), ItemID]),
%%					skip
%%			end;
%%		_ ->
%%			?DEBUG("[DebugForRace] item RoleID:~w ItemID:~w", [playerState:getRoleID(), ItemID]),
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% api:取消报名成功
%%-spec raceCancelOK(RoleID::uint64()) -> no_return().
%%raceCancelOK(_RoleID) ->
%%	playerState2:raceInviting(0),   %% 清空正在邀请信息
%%	playerState2:raceApply(0),      %% 清空报名信息
%%	playerState2:racePartner(0),    %% 清空伙伴信息
%%	ApplyState = makeApplyState(),
%%	ApplyStateNew = ApplyState#pk_GS2U_RaceApplyState{
%%		retInfo = ?RaceRetInfo_CancelSuccess,
%%		errorInfo = makeError({?ErrorCode_Race_CancelSuccess, []})
%%	},
%%	playerMsg:sendNetMsg(ApplyStateNew).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api:刷新活动信息
%%-spec acMod({RaceRule::#recRaceRule{}, NeedCancel::boolean()}) -> no_return().
%%acMod({#recRaceRule{mods = [Mod | _]} = RaceRule, NeedCancel}) ->
%%	?DEBUG("[DebugForRace] RaceRule:~w", [RaceRule]),
%%	playerState2:raceRule(RaceRule),
%%	Msg = #pk_GS2U_RaceInit{
%%		type = Mod,
%%		petID = setting(?CRLS_PetID),
%%		autoMatch = setting(?CRLS_AutoMatch)
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	%% 由于活动结束的刷新，需要告诉客户端取消了报名
%%	case NeedCancel of
%%		true ->
%%			raceCancelOK(playerState:getRoleID());
%%		_ ->
%%			skip
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api:刷新角色Ets
%%-spec acEts(ListEtsPlayer::list()) -> no_return().
%%acEts(ListEtsPlayer) ->
%%	playerState2:raceListEtsPlayer(ListEtsPlayer).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:生成计算用角色信息
%%-spec makeRaceRole(#pk_RaceCanBeInvite{}, pid(), pid()) -> #recRaceRole{}.
%%makeRaceRole(
%%	#pk_RaceCanBeInvite{
%%		id = ID,
%%		name = Name,
%%		level = Level,
%%		career = Career,
%%		race = Race,
%%		sex = Sex,
%%		head = Head,
%%		frameID = FrameID,
%%		face = Face
%%	}, Pid, NetPid
%%) ->
%%	#recRaceRole{
%%		id = ID,
%%		name = Name,
%%		level = Level,
%%		career = Career,
%%		race = Race,
%%		sex = Sex,
%%		head = Head,
%%		frameID = FrameID,
%%		face = Face,
%%		serverID = globalSetup:getDBID(),
%%		pid = Pid,
%%		netPid = NetPid
%%	}.
%%
%%%%%-------------------------------------------------------------------
%%%% api:生成当前角色信息
%%-spec makeRaceRole() -> #recRaceRole{} | term().
%%makeRaceRole() ->
%%	makeRaceRole(playerState:getRoleID()).
%%
%%%%%-------------------------------------------------------------------
%%%% api:生成指定角色信息
%%-spec makeRaceRole(RoleID::uint64()) -> #recRaceRole{} | term().
%%makeRaceRole(0) ->
%%	badarg;
%%makeRaceRole(RoleID) ->
%%	DBID = globalSetup:getDBID(),
%%	case core:getRealDBIDByUID(RoleID) of
%%		DBID ->
%%			case core:queryRoleKeyInfoByRoleID(RoleID) of
%%				#?RoleKeyRec{
%%					roleID = RoleID,
%%					roleName = RoleName,
%%					level = Level,
%%					career = Career,
%%					race = Race,
%%					sex = Sex,
%%					head = Head,
%%					frameID = FrameID,
%%					face = Face
%%				} ->
%%					{Pid, NetPid} =
%%						case playerState:getRoleID() of
%%							RoleID ->
%%								{self(), playerState:getNetPid()};
%%							_ ->
%%								case core:queryOnLineRoleByRoleID(RoleID) of
%%									#rec_OnlinePlayer{pid = Pid_, netPid = NetPid_} ->
%%										{Pid_, NetPid_};
%%									_ ->
%%										{0, 0}
%%								end
%%						end,
%%					#recRaceRole{
%%						id          = RoleID,
%%						name        = RoleName,
%%						level       = Level,
%%						career      = Career,
%%						race        = Race,
%%						sex         = Sex,
%%						head        = Head,
%%						frameID     = FrameID,
%%						face        = Face,
%%						serverID    = globalSetup:getDBID(),
%%						pid         = Pid,
%%						netPid      = NetPid
%%					};
%%				_ ->
%%					not_found
%%			end;
%%		_ ->
%%			other
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:设置（读
%%-spec setting(crls()) -> term().
%%setting(CRLS)
%%	when erlang:is_integer(CRLS)
%%	andalso CRLS >= ?CRLS_BEGIN
%%	andalso CRLS =< ?CRLS_END ->
%%	List = playerPropSync:getProp(?SerProp_cacRaceLastSetting),
%%	case lists:keyfind(CRLS, 1, List) of
%%		false ->
%%			{_, Default} = lists:keyfind(CRLS, 1, ?CRLS_Default),
%%			Default;
%%		{_, Value} ->
%%			Value
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:设置（写
%%-spec setting(crls(), term()) -> no_return().
%%setting(CRLS, Value)
%%	when erlang:is_integer(CRLS)
%%	andalso CRLS >= ?CRLS_BEGIN
%%	andalso CRLS =< ?CRLS_END ->
%%	List = playerPropSync:getProp(?SerProp_cacRaceLastSetting),
%%	ListNew = lists:keystore(CRLS, 1, List, {CRLS, Value}),
%%	playerPropSync:setAny(?SerProp_cacRaceLastSetting, ListNew).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:生成错误信息
%%-spec makeError(checkResult()) -> list().
%%makeError(true) ->
%%	[];
%%makeError({ErrorCode, Params}) ->
%%	#pk_GS2U_Error{errorCode = ErrorCode2, params = Params2} =
%%		playerMsg:getErrorCodeMsg(ErrorCode, Params),
%%	[#pk_Error{errorCode = ErrorCode2, params = Params2}].
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_是否存在指定骑宠（不需要对乘客进行该项检查）
%%-spec check_pet(IsSelf::boolean(), PetID::uint16()) -> Ret::checkResult().
%%check_pet(true, PetID) ->
%%	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
%%		false ->
%%			{?ErrorCode_Race_PetIsNotExists_A, []};
%%		_ ->
%%			true
%%	end.
%%-spec check_pet(Mark::checkResult(), IsSelf::boolean(), PetID::uint16()) -> Ret::checkResult().
%%check_pet(true, IsSelf, PetID) ->
%%	check_pet(IsSelf, PetID);
%%check_pet(Mark, _IsSelf, _PetID) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_是否位于指定非位面地图
%%-spec check_map(IsSelf::boolean()) -> Ret::checkResult().
%%check_map(IsSelf) ->
%%	case playerState:getGroupID() > 0 of
%%		true when IsSelf =:= true ->
%%			{?ErrorCode_Race_IsInGroup_A, []};
%%		true ->
%%			{?ErrorCode_Race_IsInGroup_B, []};
%%		_ ->
%%			MapID = playerState:getMapID(),
%%			case getCfg:getCfgPStack(cfg_globalsetup, race_apply_map) of
%%				#globalsetupCfg{setpara = [MapID]} ->
%%					true;
%%				#globalsetupCfg{setpara = [MapIDReal]} ->
%%					#mapsettingCfg{name = MapName} =
%%						getCfg:getCfgPStack(cfg_mapsetting, MapIDReal),
%%					case IsSelf of
%%						true ->
%%							{?ErrorCode_Race_IsNotInMap_A, [MapName]};
%%						_ ->
%%							{?ErrorCode_Race_IsNotInMap_B, [MapName]}
%%					end
%%			end
%%	end.
%%-spec check_map(Mark::checkResult(), IsSelf::boolean()) -> Ret::checkResult().
%%check_map(true, IsSelf) ->
%%	check_map(IsSelf);
%%check_map(Mark, _IsSelf) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_是否在活动状态（不需要对乘客进行该项检查）
%%-spec check_time(IsSelf::boolean()) -> Ret::checkResult().
%%check_time(true) ->
%%	TimeNow = cacRaceState:now(),
%%	case playerState2:raceRule() of
%%		#recRaceRule{timeBegin = TimeBegin, timeEnd = TimeEnd}
%%			when TimeNow >= TimeBegin andalso TimeNow < TimeEnd ->
%%			true;
%%		_ ->
%%			?DEBUG("[DebugForRace] RoleID:~w Rule:~w Time:~w", [playerState:getRoleID(), playerState2:raceRule(), TimeNow]),
%%			playerState2:raceListCanBeInvite([]),   %% 不在活动时间调用到检查时需要清空可邀请列表
%%			{?ErrorCode_Race_IsNotTimeToApply, []}
%%	end.
%%-spec check_time(Mark::checkResult(), IsSelf::boolean()) -> Ret::checkResult().
%%check_time(true, IsSelf) ->
%%	check_time(IsSelf);
%%check_time(Mark, _IsSelf) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_请求邀请列表时间是否冷却
%%-spec check_time_inviteList(IsSelf::boolean()) -> Ret::checkResult().
%%check_time_inviteList(true) ->
%%	TimeNow = cacRaceState:now(),
%%	TimeOK = playerState2:raceTimeStamp(?RaceTimeStamp_InviteList),
%%	case TimeOK - TimeNow of
%%		Diff when Diff > 0 ->
%%			{?ErrorCode_Race_CD_InviteList_A, [Diff]};
%%		_ ->
%%			true
%%	end.
%%-spec check_time_inviteList(Mark::checkResult(), IsSelf::boolean()) -> Ret::checkResult().
%%check_time_inviteList(true, IsSelf) ->
%%	check_time_inviteList(IsSelf);
%%check_time_inviteList(Mark, _IsSelf) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_指定骑宠是否为双人骑宠
%%-spec check_pet_double(IsSelf::boolean()) -> Ret::checkResult().
%%check_pet_double(true) ->
%%	PetID = setting(?CRLS_PetID),
%%	case getCfg:getCfgByKey(cfg_pet, PetID) of
%%		#petCfg{doubleType = 1} ->
%%			true;
%%		_ ->
%%			{?ErrorCode_Race_NeedPetDouble_A, []}
%%	end.
%%-spec check_pet_double(Mark::checkResult(), IsSelf::boolean()) -> Ret::checkResult().
%%check_pet_double(true, IsSelf) ->
%%	check_pet_double(IsSelf);
%%check_pet_double(Mark, _IsSelf) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_邀请行为需要没有乘客且自己不是乘客
%%-spec check_partner_invite(IsSelf::boolean()) -> Ret::checkResult().
%%check_partner_invite(true) ->
%%	case playerState2:racePartner() of
%%		undefined ->
%%			true;
%%		#recRacePartner{type = ?RacePartner_Passenger} ->
%%			{?ErrorCode_Race_CannotInviteWithPassenger_A, []};
%%		#recRacePartner{type = ?RacePartner_Master} ->
%%			{?ErrorCode_Race_CannotInviteBeingPassenger_A, []}
%%	end.
%%-spec check_partner_invite(Mark::checkResult(), IsSelf::boolean()) -> Ret::checkResult().
%%check_partner_invite(true, IsSelf) ->
%%	check_partner_invite(IsSelf);
%%check_partner_invite(Mark, _IsSelf) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_请求邀请时间是否冷却
%%-spec check_time_invite(IsSelf::boolean()) -> Ret::checkResult().
%%check_time_invite(true) ->
%%	TimeNow = cacRaceState:now(),
%%	TimeOK = playerState2:raceTimeStamp(?RaceTimeStamp_Invite),
%%	case TimeOK - TimeNow of
%%		Diff when Diff > 0 ->
%%			{?ErrorCode_Race_CD_Invite_A, [Diff]};
%%		_ ->
%%			true
%%	end.
%%-spec check_time_invite(Mark::checkResult(), IsSelf::boolean()) -> Ret::checkResult().
%%check_time_invite(true, IsSelf) ->
%%	check_time_invite(IsSelf);
%%check_time_invite(Mark, _IsSelf) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_检查是否有正在处理的邀请
%%-spec check_beInviteInfo(IsSelf::boolean()) -> Ret::checkResult().
%%check_beInviteInfo(false) ->
%%	case playerState2:raceBeInviteInfo() of
%%		undefined ->
%%			true;
%%		{_FromRoleID, _FromGuildID, _PetID, TimeOut} ->
%%			case cacRaceState:now() >= TimeOut of
%%				true ->
%%					playerState2:raceBeInviteInfo(0),
%%					true;
%%				_ ->
%%					{?ErrorCode_Race_Inviting_B, []}
%%			end
%%	end.
%%-spec check_beInviteInfo(Mark::checkResult(), IsSelf::boolean()) -> Ret::checkResult().
%%check_beInviteInfo(true, IsSelf) ->
%%	check_beInviteInfo(IsSelf);
%%check_beInviteInfo(Mark, _IsSelf) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_被邀请时需要被邀请者不是乘客且没有乘客
%%-spec check_partner_beInvite(IsSelf::boolean()) -> Ret::checkResult().
%%check_partner_beInvite(false) ->
%%	case playerState2:racePartner() of
%%		undefined ->
%%			true;
%%		#recRacePartner{} ->
%%			{?ErrorCode_Race_InviteFailed_B, []}
%%	end.
%%-spec check_partner_beInvite(Mark::checkResult(), IsSelf::boolean()) -> Ret::checkResult().
%%check_partner_beInvite(true, IsSelf) ->
%%	check_partner_beInvite(IsSelf);
%%check_partner_beInvite(Mark, _IsSelf) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_邀请时需要检查目标角色是否在自己的可邀请列表中
%%-spec check_invite_target(IsSelf::boolean(), TarRoleID::uint64()) -> Ret::checkResult().
%%check_invite_target(true, TarRoleID) ->
%%	case lists:keyfind(TarRoleID, #pk_RaceCanBeInvite.id, playerState2:raceListCanBeInvite()) of
%%		false ->
%%			{?ErrorCode_Race_InviteWithoutList_A, []};
%%		CanBeInvite ->
%%			%% 缓存即将邀请的人，用于后续反馈
%%			%% 注意！因为这个设计，所以尽量将该条检查放在最后，避免其它无效项此处导致错误记录
%%			playerState2:raceInviting(CanBeInvite),
%%			true
%%	end.
%%-spec check_invite_target(Mark::checkResult(), IsSelf::boolean(), TarRoleID::uint64()) -> Ret::checkResult().
%%check_invite_target(true, IsSelf, TarRoleID) ->
%%	check_invite_target(IsSelf, TarRoleID);
%%check_invite_target(Mark, _IsSelf, _TarRoleID) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_被邀请时检查被邀请信息是否过期
%%-spec check_invite_timeout(IsSelf::boolean(), MasterRoleID::uint64(), PetID::uint16()) -> Ret::checkResult().
%%check_invite_timeout(false, MasterRoleID, PetID) ->
%%	case playerState2:raceBeInviteInfo() of
%%		{MasterRoleID, _FromGuildID, PetID, TimeOut} ->
%%			case cacRaceState:now() < TimeOut of
%%				true ->
%%					true;
%%				_ ->
%%					{?ErrorCode_Race_InviteTimeOut_B, []}
%%			end;
%%		_ ->
%%			{?ErrorCode_Race_InviteTimeOut_B, []}
%%	end.
%%-spec check_invite_timeout(
%%	Mark::checkResult(), IsSelf::boolean(), MasterRoleID::uint64(), PetID::uint16()
%%) ->
%%	Ret::checkResult().
%%check_invite_timeout(true, IsSelf, MasterRoleID, PetID) ->
%%	check_invite_timeout(IsSelf, MasterRoleID, PetID);
%%check_invite_timeout(Mark, _IsSelf, _MasterRoleID, _PetID) ->
%%	Mark.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:在被检查者角色进程执行_是否是队长
%%-spec check_partner_master(IsSelf::boolean(), RoleID::uint64()) -> Ret::checkResult().
%%check_partner_master(true, _RoleID) ->
%%	case playerState2:racePartner() of
%%		#recRacePartner{type = ?RacePartner_Passenger} ->
%%			true;
%%		undefined ->
%%			true;   %% 没有伙伴时认为自己是队长
%%		_ ->
%%			{?ErrorCode_Race_ApplyByPassenger_A, []}
%%	end;
%%check_partner_master(false, RoleID) ->
%%	case playerState2:racePartner() of
%%		#recRacePartner{type = ?RacePartner_Master, forClient = #pk_RaceCanBeInvite{id = RoleID}} ->
%%			true;
%%		Partner ->
%%			?DEBUG("[DebugForRace] RoleID:~w TarRoleID:~w Partner:~w", [playerState:getRoleID(), RoleID, Partner]),
%%			{?ErrorCode_Race_ApplyByPassenger_B, []}
%%	end.
%%-spec check_partner_master(
%%	Mark::checkResult(), IsSelf::boolean(), RoleID::uint64()
%%) ->
%%	Ret::checkResult().
%%check_partner_master(true, IsSelf, RoleID) ->
%%	check_partner_master(IsSelf, RoleID);
%%check_partner_master(Mark, _IsSelf, _RoleID) ->
%%	Mark.
%%
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:生成报名时客户端显示信息
%%-spec makeCanBeInvite(
%%	RoleIDMy::uint64(), GuildIDMy::uint64(), RoleID::uint64(), GuildID::uint64(),
%%	RoleIDCouple::uint64(), IsInMyMap::boolean(), Relations::[#rec_friend2_relation{}, ...]
%%) ->
%%	#pk_RaceCanBeInvite{} | 0.
%%makeCanBeInvite(RoleIDMy, GuildIDMy, RoleID, GuildID, RoleIDCouple, IsInMyMap, Relations) ->
%%	case core:queryRoleKeyInfoByRoleID(RoleID) of
%%		#?RoleKeyRec{
%%			roleName = Name,
%%			level = Level,
%%			career = Career,
%%			race = Race,
%%			sex = Sex,
%%			head = Head,
%%			frameID = FrameID,
%%			face = Face,
%%			maxForce = MaxForce
%%		} ->
%%			{IsFriend, Friendliness} =
%%				cgsFriendInterface:queryFormalAndCloseness(Relations, RoleIDMy, RoleID),
%%			{IsGuildMember, Liveness} =
%%				case GuildIDMy of
%%					0 ->
%%						{false, 0}; %% 无家族
%%					GuildID ->
%%						case ets:lookup(rec_guild_member, RoleID) of
%%							#rec_guild_member{guildID = GuildIDMy, liveness = Liveness_} ->
%%								{true, Liveness_};
%%							_ ->
%%								{false, 0}   %% 进程不同步导致的不同家族
%%						end;
%%					_ ->
%%						{false, 0}  %% 不同家族
%%				end,
%%			IsCouple = RoleID =:= RoleIDCouple,
%%			%% 如果不是当前地图，则忽略陌生人数据
%%			%% 陌生人是指 不是伴侣 且 不是好友 且 不是家族成员
%%			case IsInMyMap of
%%				false when IsCouple =:= false andalso IsFriend =:= false
%%					andalso IsGuildMember =:= false ->
%%					0;
%%				_ ->
%%					#pk_RaceCanBeInvite{
%%						id = RoleID,
%%						name = Name,
%%						level = Level,
%%						career = Career,
%%						race = Race,
%%						sex = Sex,
%%						head = Head,
%%						frameID = FrameID,
%%						face = Face,
%%						maxForce = MaxForce,
%%						isCouple = RoleID =:= RoleIDCouple,
%%						isFriend = IsFriend,
%%						isGuildMember = IsGuildMember,
%%						friendliness = Friendliness,
%%						liveness = Liveness
%%					}
%%			end;
%%		_ ->
%%			0
%%	end.
%%-spec makeCanBeInvite(
%%	RoleIDMy::uint64(), GuildIDMy::uint64(), RoleID::uint64(), GuildID::uint64(),
%%	RoleIDCouple::uint64(), IsInMyMap::boolean()
%%) ->
%%	#pk_RaceCanBeInvite{} | 0.
%%makeCanBeInvite(RoleIDMy, GuildIDMy, RoleID, GuildID, RoleIDCouple, IsInMyMap) ->
%%	#recFriend2Data{relations = Relations} = cgsFriendState:queryFriend2Data(RoleIDMy),
%%	makeCanBeInvite(RoleIDMy, GuildIDMy, RoleID, GuildID, RoleIDCouple, IsInMyMap, Relations).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:生成当前报名状态
%%-spec makeApplyState() -> no_return().
%%makeApplyState() ->
%%	RoleID = playerState:getRoleID(),
%%	IsApply =   %% fixme 此处可能因进程不同步生成的数据略有误差，小几率仅有显示问题，忽略
%%		case playerState2:raceApply() of
%%			undefined ->
%%				false;
%%			_ ->
%%				true
%%		end,
%%	MyInfo =    %% 适配通用结构塞个指定格式的数据进去
%%	#pk_RaceCanBeInvite{
%%		id = RoleID,
%%		name = playerState:getName(),
%%		level = playerState:getLevel(),
%%		career = playerState:getCareer(),
%%		race = playerState:getRace(),
%%		sex = playerState:getSex(),
%%		head = playerState:getHead(),
%%		frameID = playerPropSync:getProp(?PubProp_PlayerFrameID),
%%		face = playerIdentity:queryFace(RoleID),
%%		maxForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
%%		isCouple = false,       %% 自己，略
%%		isFriend = false,       %% 自己，略
%%		isGuildMember = false,  %% 自己，略
%%		friendliness = 0,       %% 自己，略
%%		liveness = 0            %% 自己，略
%%	},
%%	{Type, Master, Passenger, PetID, AutoMatch} =
%%		case playerState2:racePartner() of
%%			undefined ->
%%				{?RacePartner_Master, MyInfo, [], setting(?CRLS_PetID), setting(?CRLS_AutoMatch)};
%%			#recRacePartner{
%%				type = ?RacePartner_Passenger,
%%				forClient = Passenger_
%%			} ->
%%				{?RacePartner_Master, MyInfo, [Passenger_], setting(?CRLS_PetID), setting(?CRLS_AutoMatch)};
%%			#recRacePartner{
%%				type = ?RacePartner_Master,
%%				forClient = Master_,
%%				petID = PetID_,
%%				autoMatch = AutoMatch_
%%			} ->
%%				{?RacePartner_Passenger, Master_, [MyInfo], PetID_, AutoMatch_}
%%		end,
%%	#pk_GS2U_RaceApplyState{
%%		retInfo = ?RaceRetInfo_Success,     %% 默认，由外部处理
%%		errorInfo = [],                     %% 默认，由外部处理
%%		master = Master,
%%		passenger = Passenger,
%%		petID = PetID,
%%		type = Type,
%%		isApply = IsApply,
%%		autoMatch = AutoMatch
%%	}.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% internal:生成报名信息
%%-spec makeRaceApply(#recRacePartner{}) -> #recRaceApply{}.
%%makeRaceApply(
%%	#recRacePartner{
%%		type = ?RacePartner_Master,
%%		forServer = Master,
%%		petID = PetID,
%%		autoMatch = AutoMatch
%%	}
%%) ->
%%	#petCfg{mountSpeed = PetSpeed, doubleType = DoubleType} =
%%		getCfg:getCfgPStack(cfg_pet, PetID),
%%	#recRaceApply{
%%		applyID = Master#recRaceRole.id,
%%		time = cacRaceState:now(),
%%		master = Master,
%%		passenger = makeRaceRole(),
%%		petID = PetID,
%%		petSpeed = PetSpeed,
%%		isDouble = DoubleType =:= 1,
%%		autoMatch = AutoMatch
%%	};
%%makeRaceApply(
%%	#recRacePartner{
%%		type = ?RacePartner_Passenger,
%%		forServer = Passenger,
%%		petID = PetID,
%%		autoMatch = AutoMatch
%%	}
%%) ->
%%	Master = makeRaceRole(),
%%	#petCfg{mountSpeed = PetSpeed, doubleType = DoubleType} =
%%		getCfg:getCfgPStack(cfg_pet, PetID),
%%	#recRaceApply{
%%		applyID = Master#recRaceRole.id,
%%		time = cacRaceState:now(),
%%		master = Master,
%%		passenger = Passenger,
%%		petID = PetID,
%%		petSpeed = PetSpeed,
%%		isDouble = DoubleType =:= 1,
%%		autoMatch = AutoMatch
%%	};
%%makeRaceApply(_) ->
%%	PetID = setting(?CRLS_PetID),
%%	AutoMatch = setting(?CRLS_AutoMatch),
%%	Master = makeRaceRole(),
%%	#petCfg{mountSpeed = PetSpeed, doubleType = DoubleType} =
%%		getCfg:getCfgPStack(cfg_pet, PetID),
%%	#recRaceApply{
%%		applyID = Master#recRaceRole.id,
%%		time = cacRaceState:now(),
%%		master = Master,
%%		petID = PetID,
%%		petSpeed = PetSpeed,
%%		isDouble = DoubleType =:= 1,
%%		autoMatch = AutoMatch
%%	}.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:收到通知进入消息
%%-spec onNoticeEnter({ServerID::uint(), MapPid::pid(), X::float(), Y::float()}) -> no_return().
%%onNoticeEnter({ServerID, MapPid, X, Y} = Data) ->
%%	case core:isCross() of
%%		false ->
%%			%% 未进入跨服，需要先进入跨服
%%			playerInterface:reqEnterCrossGS(ServerID, ?CrossRaceMapID, {race_enter, Data});
%%		true ->
%%			%% 已经在跨服，进入地图
%%			playerScene:onRequestEnterActivityMap(?CrossRaceMapID, MapPid, erlang:float(X), erlang:float(Y))
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:收到采集成功消息
%%-spec gatherSuccess(GatherID::uint32(), Pos::{float(), float()}, Code::uint64()) -> no_return().
%%gatherSuccess(GatherID, Pos, Code) ->
%%	case getCfg:getCfgByKey(cfg_object, GatherID) of
%%		#objectCfg{type = ?GatherType_Race} ->
%%			core:sendMsgToActivity(?ActivityType_CrossRace, race_gather, {playerState:getRoleID(), GatherID, Pos, Code});
%%		_ ->
%%			skip
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:需要添加BUFF
%%-spec onBuff(BuffID::uint16()) -> no_return().
%%onBuff(BuffID) ->
%%	#globalsetupCfg{setpara = ListInvincible} =
%%		getCfg:getCfgPStack(cfg_globalsetup, race_invincible),
%%	#buffCfg{buffType = BuffType} =
%%		getCfg:getCfgPStack(cfg_buff, BuffID),
%%	ListBuff = playerState:getBuffList(),
%%	onBuff(BuffID, ListInvincible, BuffType, ListBuff, lists:member(BuffID, ListInvincible)).
%%onBuff(BuffID, _ListInvincible, _BuffType, ListBuff, true) ->
%%	onBuffDel(ListBuff), %% 添加了无敌BUFF，需要清除负面BUFF
%%	playerBuff:addBuff(BuffID, 1);
%%onBuff(BuffID, ListInvincible, ?BuffTypeSub, ListBuff, _) ->
%%	case lists:any(fun(#recBuff{buffID = BuffID_}) -> lists:member(BuffID_, ListInvincible) end, ListBuff) of
%%		true ->
%%			skip;	%% 存在无敌BUFF，不能添加负面BUFF
%%		_ ->
%%			playerBuff:addBuff(BuffID, 1)
%%	end;
%%onBuff(BuffID, _BuffID_invincible, _BuffType, _ListBuff, _) ->
%%	playerBuff:addBuff(BuffID, 1).	%% 不过滤正面BUFF
%%onBuffDel([]) ->
%%	ok;
%%onBuffDel([#recBuff{buffID = BuffID} | T]) ->
%%	case getCfg:getCfgPStack(cfg_buff, BuffID) of
%%		#buffCfg{buffType = ?BuffTypeSub} ->
%%			playerBuff:delBuff(BuffID);
%%		_ ->
%%			skip
%%	end,
%%	onBuffDel(T).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:尝试上马
%%-spec onTryMount({IsLeader::boolean(), PetID::uint16(), ListRoleID::[uint64(), ...], ExData::term()}) -> no_return().
%%% 活动进程或乘客角色进程通知主人上马
%%% 主人直接上马，成功上马后通知乘客
%%onTryMount({true, PetID, ListRoleID, _ExData}) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
%%			%% 确认目标骑宠处于出战与骑乘状态
%%			MyCode = playerState:getPlayerCode(),
%%			case playerPet:getPetBattle() of
%%				#recPetInfo{pet_id = PetID, pet_status = ?PetState_Battle_Mount} ->
%%					skip;	%% 已经骑乘，忽略
%%				#recPetInfo{pet_id = PetID} ->
%%					case playerPetDouble:getDoubleMount() of
%%						#recDoublePetMount{ownerCode = MyCode} ->
%%							skip;
%%						_ ->
%%							playerPet:petOnMount()
%%					end;
%%				_ ->
%%					%% 不是这个骑宠，切换出来再骑乘
%%					playerPet:petSwitch(PetID),
%%					case playerPetDouble:getDoubleMount() of
%%						#recDoublePetMount{ownerCode = MyCode} ->
%%							skip;
%%						_ ->
%%							playerPet:petOnMount()
%%					end
%%			end,
%%			%% 如果是双人坐骑则需要通知乘客上马
%%			case erlang:length(ListRoleID) of
%%				2 ->
%%					[_MasterRoleID | [GuestRoleID]] = ListRoleID,
%%					case core:queryOnLineRoleByRoleID(GuestRoleID) of
%%						#rec_OnlinePlayer{pid = Pid} ->
%%							Msg = {race_tryMount, self(), {false, PetID, ListRoleID, playerState:getPos()}},
%%							erlang:send_after(1000, Pid, Msg);
%%						_ ->
%%							skip
%%					end,
%%					%% 添加双人坐骑特有BUFF
%%					#globalsetupCfg{setpara = [BuffID]} =
%%						getCfg:getCfgPStack(cfg_globalsetup, race_both_otherbuff),
%%					playerBuff:addBuff(BuffID, 1);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end;
%%% 活动进程通知乘客上马
%%% 乘客不知道有没有马可以上，所以先通知主人上马
%%onTryMount({false, PetID, [MasterRoleID, _GuestRoleID] = ListRoleID, true}) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
%%			%% 乘客不在副驾驶时添加定身BUFF以禁止移动，避免乱跑导致后面流程上不了双人坐骑
%%			MyCode = playerState:getPlayerCode(),
%%			case playerPetDouble:getDoubleMount() of
%%				#recDoublePetMount{guestCode = MyCode} ->
%%					skip;
%%				_ ->
%%					playerBuff:addBuff(?HoldPlayerBuff, 1)
%%			end,
%%			playerPet:petAutoHide(false),
%%			case core:queryOnLineRoleByRoleID(MasterRoleID) of
%%				#rec_OnlinePlayer{pid = Pid} ->
%%					Msg = {race_tryMount, self(), {true, PetID, ListRoleID, false}},
%%					erlang:send_after(1000, Pid, Msg);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end;
%%% 主人通知乘客上马
%%% 乘客二话不说就上了马，并顺手收回了自己可能召唤出来的骑宠
%%onTryMount({false, _PetID, [MasterRoleID, _GuestRoleID], {X, Y}}) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
%%			%% 收回可能召唤出来的骑宠
%%			playerPet:petAutoHide(false),
%%			%% 瞬移到主人坐标通知主人要上马
%%			{SX, SY} = playerState:getPos(),
%%			case SX =/= X orelse SY =/= Y of
%%				true ->
%%					MapID = playerState:getMapID(),
%%					playerMap:onLaterTransferPosAck(MapID, X, Y);
%%				_ ->
%%					skip
%%			end,
%%			timer:sleep(1000),
%%			playerBuff:delBuff(?HoldPlayerBuff),					%% 解除定身
%%			playerPetDouble:inviteDoubleMountAck(MasterRoleID, 1),	%% 参数2非0即可
%%			%% 添加双人坐骑特有BUFF
%%			#globalsetupCfg{setpara = [BuffID]} =
%%				getCfg:getCfgPStack(cfg_globalsetup, race_both_otherbuff),
%%			playerBuff:addBuff(BuffID, 1);
%%		_ ->
%%			skip
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:进入地图
%%-spec onEnter(MapID::uint16()) -> no_return().
%%onEnter(MapID) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
%%			#globalsetupCfg{setpara = ListBuffID} =
%%				getCfg:getCfgPStack(cfg_globalsetup, race_enter_buffid),
%%			[playerBuff:addBuff(BuffID, 1) || BuffID <- ListBuffID];
%%		_ ->
%%			skip
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:准备倒计时结束后被通知如果没有骑乘则需要放弃比赛
%%-spec onTryGiveUp() -> no_return().
%%onTryGiveUp() ->
%%	case playerActivity:check_pet({0, []}, playerState:getRoleID()) of
%%		{{0, []}, _} ->
%%			skip;	%% 正常，不需要放弃比赛
%%		_ ->
%%			onGiveUp()
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:解除空气墙
%%-spec onBlock() -> no_return().
%%onBlock() ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
%%			#globalsetupCfg{setpara = ListBlock} =
%%				getCfg:getCfgPStack(cfg_globalsetup, race_block),
%%			Msg = #pk_GS2U_BlockStatusChange{
%%				changes = [
%%					#pk_BlockStatusChange{blockName = erlang:atom_to_list(NameAtom), blockStatus = ?BlockNpc_Open} ||
%%					NameAtom <- ListBlock
%%				]
%%			},
%%			playerMsg:sendNetMsg(Msg);
%%		_ ->
%%			skip
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:解除空气墙
%%-spec onPassengerLeave(TarRoleID::uint64()) -> no_return().
%%onPassengerLeave(_TarRoleID) ->
%%	#globalsetupCfg{setpara = [BuffID]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, race_both_otherbuff),
%%	playerBuff:delBuff(BuffID).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,match:下马时弃赛
%%-spec onGiveUp() -> no_return().
%%onGiveUp() ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%%		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
%%			core:sendMsgToActivity(?ActivityType_CrossRace, race_giveUp, {playerState:getRoleID(), ?GiveUpReason_Dismount});
%%		_ ->
%%			skip
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%%% gm:强状态控制
%%-spec gm00(term()) -> no_return().
%%gm00(1 = Args) ->
%%	gsCsInterface:transitMsg2CenterOtp(?PsNameCSRace, gm, {gm00, Args}),  %% 通知中心服强制结束
%%	playerGM:startac(["16", "0"]);  %% 通用GM指令结束活动
%%gm00(2 = _Args) ->
%%	gm00(1),
%%	timer:sleep(1000),
%%	Stage = erlang:integer_to_list(?ActivityPhase_RaceStart),
%%	playerGM:startac(["16", Stage]).  %% 通用GM指令开始活动
