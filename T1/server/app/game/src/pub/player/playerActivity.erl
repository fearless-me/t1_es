%%%-------------------------------------------------------------------
%%% @author liuyan
%%% @copyright (C) 2017, <COMPANY>
%%% @doc 玩家活动副本
%%%
%%% @end
%%% Created : 26. 四月 2017 10:16
%%%-------------------------------------------------------------------
-module(playerActivity).
%%
%%-author("liuyan").
%%-include("playerPrivate.hrl").
%%-include("../activity/activityPrivate.hrl").
%%-include("../activity/gameactivity/kingbattleall/acKingBattleAllPrivatePrivate.hrl").
%%-include("../activity/gameactivity/activityPhaseDefine.hrl").
%%
%%
%%%%: 1 即将开启阶段（包含3段公告开启文字）
%%%%: 2 报名阶段
%%%%: 3 匹配阶段
%%%%: 4 进行中阶段
%%%%: 5 结算阶段
%%-define(CfgPhase_Wait, 0).
%%-define(CfgPhase_Pre, 1).
%%-define(CfgPhase_Reg, 2).
%%-define(CfgPhase_Match, 3).
%%-define(CfgPhase_Running, 4).
%%-define(CfgPhase_Reward, 5).
%%
%%%% API
%%-export([
%%	init/0,
%%	buyActionCount/1,
%%	inspire/1
%%]).
%%
%%%% check
%%-export([
%%	check_map/2,
%%	check_count/2,
%%	check_level/4,
%%	check_equipment/4,
%%	check_pet/2
%%	%%check_teamMember/6
%%]).
%%
%%%% daily
%%-export([
%%	updateDailyCount/2
%%]).
%%
%%%% cancel
%%-export([
%%	cancel/0
%%]).
%%
%%-export([
%%	synAllActivityState/0,
%%	synAllActivityState/1
%%]).
%%
%%%%%-------------------------------------------------------------------
%%% 上线初始化
%%-spec init() -> no_return().
%%init() ->
%%	% 由于跨服活动下线必然取消报名，因此上线时必然没有报名记录，此处被去掉以减少中心服负载
%%	%%% 向中心服查询自己的报名情况
%%    %case core:isConnectCross() of
%%    %    true ->
%%	%		csInterface:sendMsg2CenterOtp(?PsNameCSActivityMgr, cac_query, playerState:getRoleID());
%%    %    _ ->
%%    %        skip
%%    %end.
%%	ok.
%%
%%%%购买进入副本次数(普通副本和活动副本)
%%buyActionCount(CopyMapID) ->
%%    #mapsettingCfg{type = Type, subtype = Subtype, daily_entercount_group = Daily_entercount_group, buytime = Buytime, buycost = Buycost, daily_entercount=Daily_entercount} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),
%%    Result =
%%        case checkType(Type, Subtype, Daily_entercount) of %%检查类型是否正确
%%            true ->
%%                %% 已经购买的副本次数
%%                BuyNum = case Daily_entercount_group of
%%                             0 ->
%%                                 playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID);
%%                             V ->
%%                                 playerDaily:getDailyCounter(?DailyType_BuyCopyMapGroup_Number, V)
%%                         end,
%%                %%检查次数是否超上限
%%                case checkBuyNumber(BuyNum, Buytime) of
%%                    true ->
%%						{CoinType,Value} = misc:getList3Value(BuyNum + 1, lists:reverse(Buycost)),
%%                        case canUseCoin(Value,CoinType) of
%%                            true ->
%%                                %%扣除钻石并增加购买次数
%%                                case playerMoney:useCoin(CoinType, Value, #recPLogTSMoney{reason = ?CoinBuyActionCount, param = CopyMapID, target = ?PLogTS_BuyActionCount, source = ?PLogTS_PlayerSelf}) of
%%                                    true ->
%%                                        case Daily_entercount_group of
%%                                            0 ->
%%                                                skip;
%%                                            GroupId ->
%%                                                playerDaily:incDailyCounter(?DailyType_BuyCopyMapGroup_Number, GroupId)
%%                                        end,
%%                                        playerDaily:incDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID),
%%                                        ok;
%%                                    _Err1 ->
%%                                        ?ErrorCode_TradeDiamond
%%                                end;
%%                            Err2 ->
%%                                Err2
%%                        end;
%%                    Err3 ->
%%                        Err3
%%                end;
%%            Err4 ->
%%                Err4
%%        end,
%%    case Result of
%%        ok ->
%%            ok;
%%        Err ->
%%            playerMsg:sendErrorCodeMsg(Err)
%%    end.
%%
%%%%首领入侵 鼓舞
%%inspire(UseCoinType) ->
%%    %%判断该类型鼓舞次数是否用完
%%    TypeList = activityCommon:getCompleteValue(worldboss_buyattack),
%%    Result =
%%        case lists:keyfind(UseCoinType,1,TypeList) of
%%            {UseCoinType,Cost,Nums} ->
%%                InspireNum = playerDaily:getDailyCounter(?DailyType_WorldBossInSpire, UseCoinType),
%%                case InspireNum < Nums of
%%                    true->
%%                        %%判断货币是否足够
%%                        case canUseCoin(Cost,UseCoinType) of
%%                            true ->
%%                                %%扣钱，增加鼓舞次数，增加BUFF
%%                                case playerMoney:useCoin(UseCoinType, Cost, #recPLogTSMoney{reason = ?CoinUseWorldBossInspire, param = 0, target = ?PLogTS_Activity_Boss, source = ?PLogTS_PlayerSelf}) of
%%                                    true ->
%%                                        playerDaily:incDailyCounter(?DailyType_WorldBossInSpire, UseCoinType),
%%                                        playerBuff:addBuff(?WoldBossInspire, playerState:getLevel()),
%%                                        ok;
%%                                    _Err1 ->
%%                                        ?ErrorCode_Activety_Coin_Not_Enough
%%                                end;
%%                            _ ->
%%                                ?ErrorCode_Activety_Coin_Not_Enough
%%                        end;
%%                    _ ->
%%                        ?ErrorCode_World_Boss_Inspire_Type_Max
%%                end;
%%            _ ->
%%                ?ERROR("worldboss inspire UseCoinType not :~p,~p", [UseCoinType, TypeList]),
%%                ok
%%        end,
%%    case Result of
%%        ok ->
%%            ok;
%%        Err ->
%%            playerMsg:sendErrorCodeMsg(Err)
%%    end.
%%
%%%% 判断副本类型，是否为可购买次数的副本类型
%%checkType(_Type, ?MapSubTypeChallengeCopy, _Daily_entercount) ->
%%	?ErrorCode_CopyMap_Can_Not_Buy_Count;
%%checkType(Type, _SubType, Daily_entercount) ->
%%    if Daily_entercount=:=9999 ->
%%        ?ErrorCode_CopyMap_Can_Not_Buy_Count;
%%        true ->
%%            case Type of
%%                ?MapTypeCopyMap ->
%%                    true;
%%                ?MapTypeActivity ->
%%                    true;
%%                true ->
%%                    ?ErrorCode_CopyMap_Can_Not_Buy_Count
%%            end
%%    end.
%%
%%%% 判断购买次数是否超上限
%%checkBuyNumber(BuyNum, Buytime) ->
%%    if BuyNum < Buytime ->
%%        true;
%%        true ->
%%            ?ErrorCode_CopyMap_Buy_Max
%%    end.
%%
%%%% 判断货币是否足够
%%canUseCoin(Value,UseCoinType) ->
%%    if Value > 0 ->
%%        case playerMoney:canUseCoin(UseCoinType, Value) of
%%            true ->
%%                true;
%%            _ ->
%%                ?ErrorCode_Activety_Coin_Not_Enough
%%        end;
%%        true ->
%%            ?ErrorCode_CopyMap_Cfg_Error
%%    end.
%%
%%
%%
%%
%%%%%%-------------------------------------------------------------------
%%% api,check:检查所在地图
%%-spec check_map({ErrorCodeIn, ErrorArgsIn}, ListMapID) -> {ErrorCodeOut, ErrorArgsOut} when
%%    ErrorCodeIn :: uint(),
%%    ErrorArgsIn :: list(),
%%    ListMapID :: [uint16(), ...],
%%    ErrorCodeOut :: uint(),
%%    ErrorArgsOut :: list().
%%check_map({ErrorCodeIn, _} = In, _ListMapID) when ErrorCodeIn > 0 ->
%%    In;
%%check_map(_In, ListMapID) ->
%%    case playerState:getGroupID() of
%%        0 ->
%%            case lists:member(playerState:getMapID(), ListMapID) of
%%                true ->
%%                    {0, []};
%%                _ ->
%%                    FunName =
%%                        fun(MapID, Names) ->
%%                            case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
%%                                #mapsettingCfg{show_name = Name} ->
%%                                    "[" ++ Name ++ "]" ++ Names;
%%                                _ ->
%%                                    Names
%%                            end
%%                        end,
%%                    MapNames = lists:foldl(FunName, [], ListMapID),
%%                    ?ERROR_CODE(?ErrorCode_CrossActivity_Apply_InvalidMap, [MapNames]),
%%                    {?ErrorCode_CrossActivity_Apply_InvalidMap, [MapNames]}
%%            end;
%%        _ ->
%%            ?ERROR_CODE(?ErrorCode_CrossActivity_Apply_FromGroup, []),
%%            {?ErrorCode_CrossActivity_Apply_FromGroup, []}
%%    end.
%%
%%%%%%-------------------------------------------------------------------
%%% api,check:检查活动次数
%%-spec check_count({ErrorCodeIn, ErrorArgsIn}, MapID) -> {ErrorCodeOut, ErrorArgsOut} when
%%	ErrorCodeIn :: uint(),
%%	ErrorArgsIn :: list(),
%%	MapID :: uint16(),
%%	ErrorCodeOut :: uint(),
%%	ErrorArgsOut :: list().
%%check_count({ErrorCodeIn, _} = In, _MapID) when ErrorCodeIn > 0 ->
%%	In;
%%check_count(_In, MapID) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
%%		#mapsettingCfg{daily_entercount = 0} ->
%%			{0, []};
%%		#mapsettingCfg{daily_entercount = Max, daily_entercount_group = 0} ->
%%			case playerDaily:getDailyCounter(?DailyType_EnterCopyMap, MapID) < Max of
%%				true ->
%%					{0, []};
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NeedCount, []),
%%					{?ErrorCode_CrossActivity_Apply_NeedCount, []}
%%			end;
%%		#mapsettingCfg{daily_entercount = Max, daily_entercount_group = Group} ->
%%			case playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, Group) < Max of
%%				true ->
%%					{0, []};
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NeedCount, []),
%%					{?ErrorCode_CrossActivity_Apply_NeedCount, []}
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NeedCount, []),
%%			{?ErrorCode_CrossActivity_Apply_NeedCount, []}
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,check:检查角色等级
%%-spec check_level({ErrorCodeIn, ErrorArgsIn}, ActivityType, RoleID, UseErrorCode) -> {ErrorCodeOut, ErrorArgsOut} when
%%    ErrorCodeIn :: uint(),
%%    ErrorArgsIn :: list(),
%%    ActivityType :: uint16(),
%%    RoleID :: uint64(),
%%    UseErrorCode :: ?ErrorCode_YourLevelIsTooLower | ?ErrorCode_CrossActivity_Apply_PartnerLevelTooLow,
%%    ErrorCodeOut :: uint(),
%%    ErrorArgsOut :: list().
%%check_level({ErrorCodeIn, _} = In, _ActivityType, _RoleID, _UseErrorCode) when ErrorCodeIn > 0 ->
%%    In;
%%check_level(_In, _ActivityType, 0, _UseErrorCode) ->
%%    {0, []};	%% 目标不需要被检查
%%check_level(_In, ActivityType, RoleID, UseErrorCode) ->
%%    case getCfg:getCfgPStack(cfg_activity, ActivityType) of
%%        #activityCfg{mapidlist = [MapID|_]} ->
%%            #?RoleKeyRec{level = RoleLevel} =
%%                core:queryRoleKeyInfoByRoleID(RoleID),
%%            case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
%%                #mapsettingCfg{playerEnter_MinLevel = Min} when
%%                    RoleLevel >= Min ->
%%                    {0, []};
%%                _ ->
%%                    ?ERROR_CODE(UseErrorCode),
%%                    {UseErrorCode, []}
%%            end;
%%        _T ->
%%            ?ERROR("invalid cfg_activity.id=~w~n~p", [ActivityType, _T]),
%%            ?ERROR_CODE(UseErrorCode),
%%            {UseErrorCode, []}
%%    end.
%%
%%%%%-------------------------------------------------------------------
%%% api,check:检查角色是否佩戴装备
%%-spec check_equipment({ErrorCodeIn, ErrorArgsIn}, ActivityType, RoleID, UseErrorCode) -> {ErrorCodeOut, ErrorArgsOut} when
%%	ErrorCodeIn :: uint(),
%%	ErrorArgsIn :: list(),
%%	ActivityType :: uint16(),
%%	RoleID :: uint64(),
%%	UseErrorCode :: ?ErrorCode_CrossActivity_Alive_Noweapon,
%%	ErrorCodeOut :: uint(),
%%	ErrorArgsOut :: list().
%%check_equipment({ErrorCodeIn, _} = In, _ActivityType, _RoleID, _UseErrorCode) when ErrorCodeIn > 0 ->
%%	In;
%%check_equipment(_In, _ActivityType, 0, _UseErrorCode) ->
%%	{0, []};	%% 目标不需要被检查
%%check_equipment(_In, ActivityType, _RoleID, UseErrorCode) ->
%%	case getCfg:getCfgPStack(cfg_activity, ActivityType) of
%%		#activityCfg{ } ->
%%			Ret = lists:any(
%%				fun(#recSaveEquip{itemID = ID}) ->
%%					case getCfg:getCfgByKey(cfg_equipment, ID) of
%%						#equipmentCfg{type = ?EquipTypeWeapon} ->
%%							true;
%%						_ ->
%%							false
%%					end
%%				end,
%%				playerState:getPackage(?Item_Location_BodyEquipBag)
%%			),
%%			case Ret of
%%				true ->
%%					{0, []};
%%				_ ->
%%					?ERROR_CODE(UseErrorCode),
%%					{UseErrorCode, []}
%%			end;
%%		_T ->
%%			?ERROR("invalid cfg_activity.id=~w~n~p", [ActivityType, _T]),
%%			?ERROR_CODE(UseErrorCode),
%%			{UseErrorCode, []}
%%	end.
%%
%%
%%%%%-------------------------------------------------------------------
%%% api,check:检查角色骑乘状态
%%-spec check_pet({ErrorCodeIn, ErrorArgsIn}, RoleID) -> {{ErrorCodeOut, ErrorArgsOut}, {MasterRoleID, PetID, GuestRoleID}} when
%%	ErrorCodeIn :: uint(),
%%	ErrorArgsIn :: list(),
%%	RoleID :: uint64(),
%%	ErrorCodeOut :: uint(),
%%	ErrorArgsOut :: list(),
%%	MasterRoleID :: uint64(),
%%	PetID :: uint16(),
%%	GuestRoleID :: uint64().
%%check_pet({ErrorCodeIn, _} = In, _RoleID) when ErrorCodeIn > 0 ->
%%	In;
%%check_pet(_In, RoleID) ->
%%	case playerPetDouble:getDoubleMount() of
%%		#recDoublePetMount{petID = 0} ->
%%			%% 不在双人骑宠状态
%%			case playerState:getPetMounts() of
%%				{PetIDSingle, ?PetOnMount} ->
%%					{{0, []}, {RoleID, PetIDSingle, 0}};
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NeedPet),
%%					{{?ErrorCode_CrossActivity_Apply_NeedPet, []}, {0, 0, 0}}
%%			end;
%%		#recDoublePetMount{petID = PetIDDouble, ownerRoleID = RoleID, guestRoleID = GuestRoleID} ->
%%			%% 双人骑宠状态，当前角色是主人
%%			{{0, []}, {RoleID, PetIDDouble, GuestRoleID}};
%%		#recDoublePetMount{petID = PetIDDouble, ownerRoleID = MasterRoleID, guestRoleID = RoleID} ->
%%			%% 双人骑宠状态，当前角色是乘客
%%			{{0, []}, {MasterRoleID, PetIDDouble, RoleID}};
%%		_T ->
%%			%% 不是主人也不是乘客居然还在双人骑宠上，你是马鞍吗？
%%			?ERROR("check_pet invalid doublepet:~w RoleID:~w~n~p", [_T, RoleID, misc:getStackTrace()]),
%%			?ERROR_CODE(?ErrorCode_CrossActivity_Apply_NeedPet),
%%			{{?ErrorCode_CrossActivity_Apply_NeedPet, []}, {0, 0, 0}}
%%	end.
%%
%%%%%%%-------------------------------------------------------------------
%%%%% api,check:检查队员状态
%%%%-spec check_teamMember({ErrorCodeIn, ErrorArgsIn}, ActivityType, RoleID, ListTeamMemberInfo, ListMapID, TarMapID) -> {ErrorCodeOut, ErrorArgsOut} when
%%%%	ErrorCodeIn :: uint(),
%%%%	ErrorArgsIn :: list(),
%%%%	ActivityType :: activityType(),
%%%%	RoleID :: uint64(),
%%%%	ListTeamMemberInfo :: [#recTeamMemberInfoGS{}, ...],
%%%%	ListMapID :: [uint16(), ...],
%%%%	TarMapID :: uint16(),
%%%%	ErrorCodeOut :: uint(),
%%%%	ErrorArgsOut :: list().
%%%%check_teamMember({ErrorCodeIn, _} = In, _ActivityType, _RoleID, _ListTeamMemberInfo, _ListMapID, _TarMapID) when ErrorCodeIn > 0 ->
%%%%	In;
%%%%check_teamMember(_In, ActivityType, RoleID, ListTeamMemberInfo, ListMapID, TarMapID) ->
%%%%	case getCfg:getCfgPStack(cfg_activity, ActivityType) of
%%%%		#activityCfg{mapidlist = [MapID|_]} ->
%%%%			case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
%%%%				#mapsettingCfg{playerEnter_MinLevel = Min} ->
%%%%					Ret1 = check_teamMember_level({0, []}, ListTeamMemberInfo, Min, RoleID),
%%%%					Ret2 = check_teamMember_mapAndCount(Ret1, ListTeamMemberInfo, RoleID, ListMapID, TarMapID),
%%%%					case teamMemberErrorConvert(Ret2) of
%%%%						{0, _} ->
%%%%							skip;
%%%%						{ErrorCode, Args} ->
%%%%							?ERROR_CODE(ErrorCode, Args)
%%%%					end,
%%%%					Ret2;
%%%%				_ ->
%%%%					?ERROR_CODE(?ErrorCode_CrossActivity_Apply_PartnerLevelTooLow),
%%%%					{?ErrorCode_CrossActivity_Apply_PartnerLevelTooLow, []}
%%%%			end;
%%%%		_T ->
%%%%			?ERROR("invalid cfg_activity.id=~w~n~p", [ActivityType, _T]),
%%%%			?ERROR_CODE(?ErrorCode_CrossActivity_Apply_PartnerLevelTooLow),
%%%%			{?ErrorCode_CrossActivity_Apply_PartnerLevelTooLow, []}
%%%%	end.
%%%%-spec check_teamMember_level({ErrorCodeIn, ErrorArgsIn}, List, Min, RoleID) -> {ErrorCodeOut, ErrorArgsOut} when
%%%%	ErrorCodeIn :: uint(),
%%%%	ErrorArgsIn :: list(),
%%%%	List :: [#recTeamMemberInfoGS{}, ...],
%%%%	Min :: uint16(),
%%%%	RoleID :: uint64(),
%%%%	ErrorCodeOut :: uint(),
%%%%	ErrorArgsOut :: list().
%%%%check_teamMember_level({ErrorCodeIn, _} = In, _List, _Min, _RoleID) when ErrorCodeIn > 0 ->
%%%%	In;
%%%%check_teamMember_level(In, [], _Min, _RoleID) ->
%%%%	In;
%%%%check_teamMember_level(In, [#recTeamMemberInfoGS{roleID = RoleID} | T], Min, RoleID) ->
%%%%	check_teamMember_level(In, T, Min, RoleID);
%%%%check_teamMember_level(_In, [#recTeamMemberInfoGS{level = Level} | _T], Min, _RoleID) when Level < Min ->
%%%%	%?ERROR_CODE(?ErrorCode_CrossActivity_Apply_PartnerLevelTooLow), 在teamMemberErrorConvert之后发送
%%%%	{?ErrorCode_CrossActivity_Apply_PartnerLevelTooLow, []};
%%%%check_teamMember_level(In, [_H | T], Min, RoleID) ->
%%%%	check_teamMember_level(In, T, Min, RoleID).
%%%%-spec check_teamMember_mapAndCount({ErrorCodeIn, ErrorArgsIn}, List, RoleID, ListMapID, TarMapID) -> {ErrorCodeOut, ErrorArgsOut} when
%%%%	ErrorCodeIn :: uint(),
%%%%	ErrorArgsIn :: list(),
%%%%	List :: [#recTeamMemberInfoGS{}, ...],
%%%%	RoleID :: uint64(),
%%%%	ListMapID :: [uint16(), ...],
%%%%	TarMapID :: uint16(),
%%%%	ErrorCodeOut :: uint(),
%%%%	ErrorArgsOut :: list().
%%%%check_teamMember_mapAndCount({ErrorCodeIn, _} = In, _List, _RoleID, _ListMapID, _TarMapID) when ErrorCodeIn > 0 ->
%%%%	In;
%%%%check_teamMember_mapAndCount(In, [], _RoleID, _ListMapID, _TarMapID) ->
%%%%	In;
%%%%check_teamMember_mapAndCount(In, [#recTeamMemberInfoGS{roleID = RoleID} | T], RoleID, ListMapID, TarMapID) ->
%%%%	check_teamMember_mapAndCount(In, T, RoleID, ListMapID, TarMapID);
%%%%check_teamMember_mapAndCount(_In, [#recTeamMemberInfoGS{roleID = RoleID_} | T], RoleID, ListMapID, TarMapID) ->
%%%%	case core:queryOnLineRoleByRoleID(RoleID_) of
%%%%		#rec_OnlinePlayer{pid = Pid} ->
%%%%			Ret = psMgr:call(Pid, cac_checkMap, {ListMapID, TarMapID}, 1000),
%%%%			check_teamMember_mapAndCount(Ret, T, RoleID, ListMapID, TarMapID);
%%%%		_ ->
%%%%			?ERROR_CODE(?ErrorCode_CrossActivity_Apply_PartnerInvalidMap),
%%%%			{?ErrorCode_CrossActivity_Apply_PartnerInvalidMap, []}
%%%%	end.
%%
%%%%%%%-------------------------------------------------------------------
%%%%% internal 转换从队友得来的ErrorCode以正常显示
%%%%-spec teamMemberErrorConvert({uint(), list()}) -> {uint(), list()}.
%%%%teamMemberErrorConvert({0, _} = Ret) ->
%%%%	Ret;
%%%%teamMemberErrorConvert({?ErrorCode_CrossActivity_Apply_NeedCount, Args}) ->
%%%%	{?ErrorCode_CrossActivity_Apply_PartnerNeedCount, Args};
%%%%teamMemberErrorConvert({?ErrorCode_CrossActivity_Apply_InvalidMap, Args}) ->
%%%%	{?ErrorCode_CrossActivity_Apply_PartnerInvalidMap, Args};
%%%%teamMemberErrorConvert({?ErrorCode_CrossActivity_Apply_PartnerLevelTooLow, _} = Ret) ->
%%%%	Ret.
%%
%%%%%-------------------------------------------------------------------
%%% api,daily:改变活动次数
%%-spec updateDailyCount(MapID::uint16(), Value::integer()) -> no_return().
%%updateDailyCount(_MapID, 0) ->
%%	skip;
%%updateDailyCount(MapID, Value) ->
%%	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
%%		#mapsettingCfg{daily_entercount_group = 0} ->
%%			ValueOld = playerDaily:getDailyCounter(?DailyType_EnterCopyMap, MapID),
%%			case Value + ValueOld of
%%				ValueNew when ValueNew =< 0 ->
%%					playerDaily:reduceDailyCounter(?DailyType_EnterCopyMap, MapID, ValueOld);
%%				_ ->
%%					playerDaily:reduceDailyCounter(?DailyType_EnterCopyMap, MapID, -Value)
%%			end;
%%		#mapsettingCfg{daily_entercount_group = Group} ->
%%			ValueOld = playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, Group),
%%			case Value + ValueOld of
%%				ValueNew when ValueNew =< 0 ->
%%					playerDaily:reduceDailyCounter(?DailyType_EnterCopyMapGroup, Group, ValueOld);
%%				_ ->
%%					playerDaily:reduceDailyCounter(?DailyType_EnterCopyMapGroup, Group, -Value)
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,cancel:取消跨服活动报名
%%% 切换地图、下线、进入位面时调用
%%-spec cancel() -> no_return().
%%cancel() ->
%%	case playerState2:raceApply() of
%%		#recRaceApply{} ->
%%			playerRace:msg(#pk_U2GS_RaceCancel{});
%%		_ ->
%%			skip
%%	end,
%%	case playerState2:getCrossApply() of
%%		#recCrossApply{activityType = ?ActivityType_CrossAlive} ->
%%			playerAlive:cancel(),
%%			getCfgAddBuff();
%%		_ ->
%%			skip	%% 忽略没有报名的情况
%%	end.
%%
%%
%%
%%%%%-------------------------------------------------------------------
%%%%同步下发各活动状态
%%-spec synAllActivityState() -> ok.
%%synAllActivityState() ->
%%	Fun =
%%		fun(AID) ->
%%			synAllActivityState(AID)
%%		end,
%%	lists:foreach(Fun, getCfg:get1KeyList(cfg_activity)),
%%	ok.
%%-spec synAllActivityState(AID::uint()) -> ok.
%%synAllActivityState(AID) ->
%%	case canSendToClient(AID) of
%%		true ->
%%			#activityCfg{id = CfgID, mapidlist = ListMapID, stage = StateList} = getCfg:getCfgByArgs(cfg_activity, AID),
%%			MapID =
%%				case ListMapID of
%%					[] -> 0;
%%					[MID | _] -> MID
%%				end,
%%			PhaseValue =
%%				case myEts:lookUpEts(?AcEts, CfgID) of
%%					[#rec_activity{phase = Phase} | _] when Phase > 0 ->
%%						%%活动阶段phase值>0表示活动开启中，其他为没开启
%%						case is_list(StateList) andalso length(StateList) >= Phase of
%%							true ->
%%								case lists:nth(Phase, StateList) of
%%									{RealPhase,_X}->  RealPhase;
%%									_ ->
%%										case Phase =/= ?ActivityPhase_Close of
%%											true -> ?CfgPhase_Running;
%%											_ -> ?CfgPhase_Wait
%%										end
%%								end;
%%							_ ->
%%								case Phase =/= ?ActivityPhase_Close of
%%									true -> ?CfgPhase_Running;
%%									_ -> ?CfgPhase_Wait
%%								end
%%						end;
%%					_ -> ?CfgPhase_Wait
%%				end,
%%			Msg = #pk_GS2U_ActivityState{
%%				activityID = CfgID,
%%				mapID = MapID,
%%				phase = PhaseValue
%%			},
%%			playerMsg:sendNetMsg(Msg);
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%%% 能不能同步给客户端
%%canSendToClient(?ActivityType_Darkness) ->
%%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Darkness) of
%%		true ->
%%			%% 活动是开启的，要同步
%%			true;
%%		_ -> false
%%	end;
%%canSendToClient(?ActivityType_PetBattle) ->
%%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_PetBattle) of
%%		true -> true;
%%		_ -> false
%%	end;
%%canSendToClient(?ActivityType_AnswerPlay) ->
%%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_LuckAnswerBtn) of
%%		true -> true;
%%		_ -> true
%%	end;
%%canSendToClient(?ActivityType_CityMonster) ->
%%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_GuardCityBtn) of
%%		true -> true;
%%		_ -> false
%%	end;
%%canSendToClient(?ActivityType_GuildExpedition) ->
%%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_GuildExpedition) of
%%		true -> true;
%%		_ -> false
%%	end;
%%canSendToClient(?ActivityType_KingBattleAll) ->
%%	acKingBattleAllLogic:globalControlIsOpen();
%%canSendToClient(?ActivityType_EscortGoods) ->
%%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_EscortGoods) of
%%		true -> true;
%%		_ -> false
%%	end;
%%canSendToClient(_AID) ->
%%	true.
%%%%大逃杀报名匹配过程中，传送至其他地图强制中断匹配buff提示
%%getCfgAddBuff() ->
%%	case getCfg:getCfgByArgs(cfg_globalsetup,alive_warningbuff) of
%%		#globalsetupCfg{setpara = [WarningBuff]} ->
%%			playerState2:addCrossAliveCancelBuff(WarningBuff);
%%		_ ->
%%			skip
%%	end.