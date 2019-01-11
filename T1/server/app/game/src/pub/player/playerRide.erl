%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 三月 2018 10:38
%%%-------------------------------------------------------------------
-module(playerRide).
-author("tiancheng").
%%
%%-include("playerPrivate.hrl").
%%-include("../ride/ridePrivate.hrl").
%%
%%%% 使用游乐场距离
%%-define(RideNpcDist, 1000).
%%
%%-define(RideOpen, 1).
%%-define(RideClose, 0).
%%
%%%% API
%%-export([
%%	getItem/1,
%%	enterMapReal/1,
%%	playerOnline/0,
%%	msg/1
%%]).
%%
%%-export([
%%	recyclePlayerRideItem/1,
%%	leaveRide/0,
%%	deleteItem/2,
%%	gm_deleteAllRideItem/0,
%%	gm_recycleride/0
%%]).
%%
%%%% 使用游乐设施
%%msg(#pk_RequestUse{itemUID = ItemUID, useLimit = UseLimit}) ->
%%	ErrorCode =
%%		case rideInterface:canAddRideNpc(playerState:getMapID()) of
%%			true ->
%%				RoleID = playerState:getRoleID(),
%%				case rideInterface:queryRide(ItemUID) of
%%					[#rec_ride{number = 0}] ->
%%						?ErrorCode_RideItemNoTimes;
%%					[#rec_ride{roleID = RoleID, useLimit = ?UseLimitNone, itemID = ItemID}] ->
%%						case getCfg:getCfgByKey(cfg_ride, ItemID) of
%%							#rideCfg{open = ?RideOpen} = Config ->
%%								psMgr:sendMsg2PS(?RideOtp, requestUse,
%%									{
%%										playerState:getRoleID(),
%%										playerState:getNetPid(),
%%										playerState:getName(),
%%										ItemUID, UseLimit,
%%										Config,
%%										playerState:getMapID(), playerState:getPos()
%%									});
%%							_ ->
%%								?ErrorCode_ForbiddenRideItem
%%						end;
%%					_ ->
%%						?ErrorCode_RideItemIsIngUse
%%				end;
%%			_ ->
%%				?ErrorCode_NotAllowUseRideItemScene
%%		end,
%%	case erlang:is_integer(ErrorCode) of
%%		true ->
%%			playerMsg:sendErrorCodeMsg(ErrorCode);
%%		_ ->
%%			skip
%%	end,
%%	ok;
%%%% 回收游乐设施
%%msg(#pk_RequestRecycle{itemUID = ItemUID}) ->
%%	RoleID = playerState:getRoleID(),
%%	case rideInterface:queryRide(ItemUID) of
%%		[#rec_ride{roleID = RoleID, useLimit = UseLimit}] when UseLimit > ?UseLimitNone ->
%%			psMgr:sendMsg2PS(?RideOtp, requestRecycle,
%%				{
%%					RoleID,
%%					playerState:getNetPid(),
%%					ItemUID
%%				});
%%		_ ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_RideItemNotUse)
%%	end,
%%	ok;
%%%% 请求使用游乐设施
%%msg(#pk_RequestUpRide{npcCode = NpcCode}) ->
%%	NpcEts = playerState:getMapNpcEts(),
%%	ErrorCode =
%%		case ets:lookup(NpcEts, NpcCode) of
%%			[#recMapObject{x = X, y = Y}] ->
%%				{PX, PY} = playerState:getPos(),
%%				%% 检查距离
%%				case mapView:getObjDist(PX, PY, 0, X, Y, 0) < ?RideNpcDist of
%%					true ->
%%						case rideInterface:queryRideNpcRec(NpcCode) of
%%							[#rideNpcRec{itemUID = ItemUID, playerList = PlayerList} = Npc] ->
%%								case rideInterface:queryRide(ItemUID) of
%%									[#rec_ride{number = Number, useLimit = Limit, roleID = OwnerID, itemID = ItemID} = Ride]
%%										when Number > 0 ->
%%										#rideCfg{playerMax = PlayerMax, open = Open} = RideConfig = getCfg:getCfgByKey(cfg_ride, ItemID),
%%										case Open of
%%											?RideOpen ->
%%												case PlayerMax > erlang:length(PlayerList) of
%%													true ->
%%														case checkRelation(Limit, OwnerID) of
%%															true ->
%%																%% 检查钱是否足够
%%																IsSelf = OwnerID =:= playerState:getRoleID(),
%%																case IsSelf orelse haveMoney(RideConfig) of
%%																	true ->
%%																		%% 检查还有没有使用名额，有就扣钱使用！
%%																		requestUpRide(Ride, Npc, RideConfig);
%%																	ErrorC ->
%%																		ErrorC
%%																end;
%%															ErrorC1 ->
%%																ErrorC1
%%														end;
%%													_ ->
%%														?ErrorCode_RideHaveMorePlayer
%%												end;
%%											_ ->
%%												?ErrorCode_ForbiddenRideItem
%%										end;
%%									_ ->
%%										?ErrorCode_RideItemNoTimes
%%								end;
%%							_ ->
%%								?ErrorCode_MailTargetNouFound
%%						end;
%%					_ ->
%%						?ErrorCode_PetDoubleMountFarFrom
%%				end;
%%			_ ->
%%				?ErrorCode_System_Error_Unknow
%%		end,
%%	playerMsg:sendErrorCodeMsg(ErrorCode),
%%	ok;
%%%% 请求离开游乐设施
%%msg(#pk_RequestDownRide{}) ->
%%	leaveRide(),
%%	ok;
%%msg(_) ->
%%	ok.
%%
%%leaveRide() ->
%%	RoleID = playerState:getRoleID(),
%%	MapPid = playerState:getMapPid(),
%%	MapID = playerState:getMapID(),
%%	case rideInterface:canAddRideNpc(MapID) of
%%		true ->
%%			case rideInterface:queryRideInfoListByMapPID(MapPid) of
%%				[#rideNpcRec{}|_] = List ->
%%					F =
%%						fun(#rideNpcRec{npcCode = NpcCode, playerList = PlayerList}) ->
%%							case lists:keyfind(RoleID, #ridePlayerInfo.roleID, PlayerList) of
%%								#ridePlayerInfo{} ->
%%									psMgr:sendMsg2PS(?RideOtp, requestDownRide, {NpcCode, RoleID, playerState:getNetPid()}),
%%									ok;
%%								_ ->
%%									skip
%%							end
%%						end,
%%					lists:foreach(F, List);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%deleteItem(ItemUID, ItemID) ->
%%	case getCfg:getCfgByKey(cfg_item, ItemID) of
%%		#itemCfg{itemType = ?ItemTypeRide} ->
%%			?INFO("deleteItem:~p,~p,~p", [playerState:getRoleID(), ItemUID, ItemID]),
%%			psMgr:sendMsg2PS(?RideOtp, recyclePlayerRideItemSuccess, {playerState:getNetPid(), ItemUID}),
%%			ok;
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%recyclePlayerRideItem({ItemUID, ItemID}) ->
%%	case playerPackage:getGoodsByUID(ItemUID) of
%%		#rec_item{itemID = ItemID, pos = BagType, pileNum = Num} ->
%%			case playerPackage:deleteGoodsByUID(BagType, ItemUID,
%%					#recPLogTSItem{
%%						old = Num,
%%						new = 0,
%%						change = -Num,
%%						target = ?PLogTS_Ride,
%%						source = ?PLogTS_PlayerSelf,
%%						gold = 0,
%%						goldtype = 0,
%%						changReason = ?ItemDeleteReasonRideNoTimes,
%%						reasonParam = 0
%%					}) of
%%				true ->
%%					%% 删除成功，删除变形道具项
%%					psMgr:sendMsg2PS(?RideOtp, recyclePlayerRideItemSuccess, {playerState:getNetPid(), ItemUID}),
%%					ok;
%%				Error2 ->
%%					?ERROR("recyclePlayerRideItem roleID:~p,itemUID:~p,itemID:~p, Error:~p",
%%						[playerState:getRoleID(), ItemUID, ItemID, Error2]),
%%					skip
%%			end;
%%		Error ->
%%			?ERROR("recyclePlayerRideItem roleID:~p,itemUID:~p,itemID:~p, Error:~p",
%%				[playerState:getRoleID(), ItemUID, ItemID, Error]),
%%			skip
%%	end,
%%	ok.
%%
%%haveMoney(Config) ->
%%	case Config of
%%		#rideCfg{costType = ?CoinUseTypeGold, costValue = CostValue} ->
%%			case playerMoney:canUseCoin(?CoinUseTypeGold, CostValue) of
%%				true -> true;
%%				_ -> ?ErrorCode_TradeGold
%%			end;
%%		#rideCfg{costType = ?CoinUseTypeDiamond, costValue = CostValue} ->
%%			case playerMoney:canUseCoin(?CoinUseTypeDiamond, CostValue) of
%%				true -> true;
%%				_ -> ?ErrorCode_TradeDiamond
%%			end;
%%		#rideCfg{costType = ?CoinUseTypeDiamondJustNotBind, costValue = CostValue} ->
%%			case playerMoney:canUseCoin(?CoinUseTypeDiamondJustNotBind, CostValue) of
%%				true -> true;
%%				_ -> ?ErrorCode_TradeDiamond
%%			end;
%%		_ ->
%%			?ERROR("haveMoney:~p,~p", [playerState:getRoleID(), Config]),
%%			?ErrorCode_System_Error_Unknow
%%	end.
%%
%%requestUpRide(#rec_ride{itemUID = ItemUID, roleID = OwnerID}, #rideNpcRec{npcCode = NpcCode}, RideConfig) ->
%%	RoleID = playerState:getRoleID(),
%%	case psMgr:call(?RideOtp, requestUpRide,
%%		{ItemUID, NpcCode, RoleID, self(), playerState:getNetPid(), RideConfig}, ?Start_Link_TimeOut_ms) of
%%		true ->
%%			%% 扣钱
%%			#rideCfg{costType = CoinType,type = Type, costValue = CostValue, rewardBuff = BuffID, rewardCost = RewardCostPer} = RideConfig,
%%			PLog = #recPLogTSMoney{
%%				reason = ?CoinUseGuildFairgroundRide,
%%				param = CostValue,
%%				target = ?PLogTS_Ride,
%%				source = ?PLogTS_PlayerSelf
%%			},
%%
%%			IsSelf = (RoleID =:= OwnerID),
%%
%%			Ret =
%%				case IsSelf of
%%					true -> true;
%%					_ ->
%%						playerMoney:useCoin(CoinType, CostValue, PLog)
%%				end,
%%
%%			case Ret of
%%				true ->
%%					%% 发奖
%%					playerBuff:addBuff(BuffID, 1),
%%
%%					%% 给所有者发钱
%%					case IsSelf =:= false andalso OwnerID /= 0 of
%%						true ->
%%							{RewardCoinType, RewardCoinValue} =
%%								case CoinType of
%%									?CoinUseTypeMin ->
%%										{?CoinTypeGold, erlang:trunc(CostValue * RewardCostPer)};
%%									?CoinUseTypeDiamond ->
%%										{?CoinTypeBindDiamond, erlang:trunc(CostValue * RewardCostPer)};
%%									?CoinUseTypeDiamondJustNotBind ->
%%										{?CoinTypeBindDiamond, erlang:trunc(CostValue * RewardCostPer)}
%%								end,
%%							case RewardCoinValue > 0 of
%%								true ->
%%									Title = stringCfg:getString(ride_income_1),
%%									Content = stringCfg:getString(ride_income_2),
%%									Coin = #recMailCoin{coinType = RewardCoinType, coinNum = RewardCoinValue},
%%									mail:sendSystemMail(OwnerID, Title, Content, [Coin], "");
%%								_ ->
%%									skip
%%							end;
%%						_ ->
%%							skip
%%					end;
%%				_ ->
%%					skip
%%			end,
%%			addRideAchieve(Type),
%%			?ErrorCode_RideSuccess;
%%		_ ->
%%			?ErrorCode_RideHaveMorePlayer
%%	end.
%%
%%%%//1旋转木马;2飞椅;3摩天轮;4海盗船;5青龙列车;6冰淇淋车
%%addRideAchieve(Type)->
%%
%%
%%	case Type of
%%		1 ->playerAchieve:achieveEvent(?Achieve_RideUp_1,[1]);
%%		2 ->playerAchieve:achieveEvent(?Achieve_RideUp_4,[1]);
%%		3 ->playerAchieve:achieveEvent(?Achieve_RideUp_2,[1]);
%%		4 ->playerAchieve:achieveEvent(?Achieve_RideUp_3,[1]);
%%		5 ->
%%			playerTask:updateTask(?TaskSubType_Active,?TaskSubType_Active_Sub_Youlechang),
%%			playerAchieve:achieveEvent(?Achieve_RideUp_5,[1]);
%%		_->
%%			skip
%%	end,
%%	ok.
%%
%%checkRelation(?UseLimitAll, _OwnerID) -> true;
%%checkRelation(?UseLimitFriend, OwnerID) ->
%%	RoleID = playerState:getRoleID(),
%%	case RoleID =:= OwnerID of
%%		true -> true;
%%		_ ->
%%			case cgsFriendInterface:queryFRT(RoleID, OwnerID) of
%%				?FRT_Formal -> true;
%%				?FRT_Cross -> true;
%%				_ ->
%%					%% 再检查是不是家族好友
%%					GuildID = playerState:getGuildID(),
%%					case GuildID > 0 of
%%						true ->
%%							MemberList = playerGuild:getGuildMember(GuildID),
%%							case lists:keyfind(OwnerID, #rec_guild_member.roleID, MemberList) of
%%								#rec_guild_member{} -> true;
%%								_ -> ?ErrorCode_RideCodnDition3
%%							end;
%%						_ ->
%%							?ErrorCode_RideCodnDition3
%%					end
%%			end
%%	end;
%%checkRelation(?UseLimitSelf, OwnerID) ->
%%	case playerState:getRoleID() =:= OwnerID of
%%		true -> true;
%%		_ -> ?ErrorCode_RideCodnDition2
%%	end;
%%checkRelation(_Limit, _OwnerID) -> ?ErrorCode_RideCodnDition1.
%%
%%playerOnline() ->
%%	%% 清理没有次数的游乐设施道具
%%	RoleID = playerState:getRoleID(),
%%	L = rideInterface:queryRideByRoleID(RoleID),
%%
%%	F =
%%		fun(#rec_ride{number = Number, itemUID = ItemUID, itemID = ItemID}) ->
%%			case Number =:= 0 of
%%				true ->
%%					recyclePlayerRideItem({ItemUID, ItemID}),
%%					ok;
%%				_ ->
%%					skip
%%			end
%%		end,
%%	lists:foreach(F, L),
%%
%%	%% 刷新tips
%%	rideInterface:sendRideItemInfos(playerState:getNetPid(), RoleID),
%%	ok.
%%
%%enterMapReal(MapID) ->
%%	case rideInterface:canAddRideNpc(MapID) of
%%		true ->
%%			%% 同步游乐设施数据
%%			rideInterface:sendRideInfos(playerState:getNetPid(), playerState:getMapPid());
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%%% 获得一个道具
%%getItem([#rec_item{itemUID = ItemUID, itemID = ItemID}|List]) ->
%%	case getCfg:getCfgByKey(cfg_item, ItemID) of
%%		#itemCfg{itemType = ?ItemTypeRide} ->
%%			getItem(ItemUID, ItemID),
%%			getItem(List);
%%		_ ->
%%			skip
%%	end;
%%getItem(_) ->
%%	ok.
%%
%%getItem(ItemUID, ItemID) ->
%%	case rideInterface:queryRide(ItemUID) of
%%		[] ->
%%			case getCfg:getCfgByKey(cfg_ride, ItemID) of
%%				#rideCfg{maxTimes = MaxTimes} ->
%%					R = #rec_ride{
%%						itemUID = ItemUID,				%% bigint(20) unsigned
%%						itemID = ItemID,				%% int(10) unsigned
%%						roleID = playerState:getRoleID(),				%% bigint(20) unsigned
%%						number = MaxTimes,				%%剩余次数 int(11) unsigned
%%						useLimit = 0				%%使用目标限制 smallint(5) unsigned
%%					},
%%					psMgr:sendMsg2PS(?RideOtp, playerGetRideItem, {playerState:getNetPid(), R}),
%%					ok;
%%				_ ->
%%					?ERROR("config error:~p,~p,~p", [playerState:getRoleID(), ItemUID, ItemID])
%%			end;
%%		Error ->
%%			?ERROR("getItem ride:~p,~p,~p,~p", [playerState:getRoleID(), ItemUID, ItemID, Error])
%%	end,
%%	ok.
%%
%%gm_deleteAllRideItem() ->
%%	L = getCfg:get1KeyList(cfg_ride),
%%	F =
%%		fun(ItemID) ->
%%			case playerPackage:getItemNumByID(ItemID) of
%%				0 -> skip;
%%				Num ->
%%					playerPackage:delGoodsByID(
%%						?Item_Location_Bag,
%%						ItemID,
%%						Num,
%%						#recPLogTSItem{
%%							old = ItemID,
%%							new = 0,
%%							change = -ItemID,
%%							target = ?PLogTS_Ride,
%%							source = ?PLogTS_PlayerSelf,
%%							gold = 0,
%%							goldtype = 0,
%%							changReason = ?ItemDeleteReasonPlayer,
%%							reasonParam = 0
%%						})
%%			end
%%		end,
%%	lists:foreach(F, L),
%%	ok.
%%
%%gm_recycleride() ->
%%	RoleID = playerState:getRoleID(),
%%	MS = ets:fun2ms(
%%		fun(#rec_ride{roleID = RID} = Info) when RID =:= RoleID ->
%%			Info
%%		end
%%	),
%%	case ets:select(ets_rec_ride, MS) of
%%		[#rec_ride{}|_] = List ->
%%			[psMgr:sendMsg2PS(?RideOtp, gm_requestRecycle, ItemUID) || #rec_ride{itemUID = ItemUID} <- List];
%%		_ ->
%%			[]
%%	end,
%%	ok.