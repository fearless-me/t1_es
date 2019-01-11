%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 七日目标
%%% http://192.168.2.32:8080/browse/LUNA-2663
%%% @end
%%% Created : 20170620
%%%-------------------------------------------------------------------
-module(playerSevenDayAim).
-author("meitianyang").

-include("playerPrivate.hrl").
-include("cfg_seven_day_aim.hrl").

-define(SevenDayTime, 604800).	%% 七日目标持续时间（秒）

%% MSG
-export([
	reward/1	%% 领取奖励
]).

%% API
-export([
	init/0,				%% 上线初始化
	updateCondition/2,	%% 更新条件值
	queryForGM/1		%% GM用查询进度（返回字符串以在聊天框显示）
]).

%%% ====================================================================
%%% MSG functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 领取奖励
-spec reward(ID::uint()) -> ok.
reward(ID) ->
	case core:isCross() of
		false ->
			?DEBUG("[DebugForSevenDayAim] RoleID:~w ID:~w", [playerState:getRoleID(), ID]),
			%% 功能未开启时忽略
			case playerMainMenu:isOpen(?ModeType_SevenDay) of	%% 58对应七日目标
				true ->
					%% 取消配置时请将type设置为0，新增配置请增加在末尾
					%% 以这种方式保证已有的配置ID不会发生变化，确保服务端记录的已领取奖励是正确的
					ListAlreadyReward = playerPropSync:getProp(?SerProp_SevenDayAimAlreadyReward),
					case lists:member(ID, ListAlreadyReward) of
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimAlreadyReward);
						_ ->
							#seven_day_aimCfg{
								day			= Day,			%% 第几日
								type		= Type,			%% 主题类型，0无效
								subType1	= SubType1,		%% 条件类型 参考类型sevenDayAim() 但是为0时无效
								args1		= Args1,		%% 条件参数 参考类型sevenDayAim()
								subType2	= SubType2,		%% 如同subType1
								args2		= Args2,		%% Args1
								subType3	= SubType3,		%% 如同subType1
								args3		= Args3,		%% Args1
								rewardCoin	= RewardCoin,	%% 货币奖励 [{CoinType, CoinNum}, ...]
								rewardItem	= RewardItem	%% 道具奖励 [{ItemID, ItemNum}, ...]
							} = getCfg:getCfgPStack(cfg_seven_day_aim, ID),
							Ret1 = reward_CheckType(Type),
							Ret2 = reward_checkTime(Ret1, Day),
							Ret3 = reward_checkCondition(Ret2, SubType1, Args1),
							Ret4 = reward_checkCondition(Ret3, SubType2, Args2),
							Ret5 = reward_checkCondition(Ret4, SubType3, Args3),
							case Ret5 of
								1 ->
									playerPropSync:setAny(?SerProp_SevenDayAimAlreadyReward, [ID | ListAlreadyReward]),
									reward_coin(Ret5, RewardCoin),
									reward_item(Ret5, RewardItem),
									playerMsg:sendNetMsg(#pk_GS2U_SevenDayAimReward_Ack{id = ID});
								_ ->
									ok
							end
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%% 检查主题类型（兼有开关功能）
-spec reward_CheckType(Type::uint()) -> 0|1.
reward_CheckType(0) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimClose),
	0;
reward_CheckType(_Type) ->
	1.

%% 检查活动时间与配置时间
%% 第一天不能做第二天的目标，但是第七天可以做第一天的目标
-spec reward_checkTime(Mark::0|1, Day::uint()) -> 0|1.
reward_checkTime(0, _Day) ->
	0;
reward_checkTime(_Mark, Day) ->
	TimeNow = time:getSyncTimeFromDBS(),
	case checkTime() of
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimTimeOut),
			0;
		_ ->
			case ((TimeNow - getTimeBegin()) div 86400) + 1 of
				DayNow when DayNow >= Day ->
					1;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimDayError),
					0
			end
	end.

%% 检查是否满足领奖条件
-spec reward_checkCondition(Mark::0|1, SubType::sevenDayAim(), Args::list()) -> 0|1.
reward_checkCondition(0, _SubType, _Args) ->
	0;
reward_checkCondition(_Mark, 0, _Args) ->
	1;	%% 忽略该条件
reward_checkCondition(_Mark, ?SevenDayAim_CopyMap = SubType, [MapID]) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	case lists:member(MapID, Args) of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_WarriorTrial = SubType, [LayerAim]) ->
	#pk_SevenDayAimUpdate{args = [Layer]} = getCondition(SubType),
	case Layer >= LayerAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Layer]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_ProtectGod = SubType, [MapID]) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	case lists:member(MapID, Args) of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Material = SubType, [MapID]) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	case lists:member(MapID, Args) of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_RoleLevel = SubType, [LevelAim]) ->
	#pk_SevenDayAimUpdate{args = [Level]} = getCondition(SubType),
	case Level >= LevelAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Level]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetCount = SubType, [-1, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	case lists:foldl(fun(A, B) -> A + B end, 0, ListPet) of
		Count when Count >= CountAim ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListPet]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetCount = SubType, [QualityAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	try
		case lists:nth(QualityAim + 1, ListPet) >= CountAim of
			true ->
				1;
			_ ->
				?DEBUG("[DebugForSevenDayAim] Args:~w", [ListPet]),
				playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
				0
		end
	catch
	    _:_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_FashionCount = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Force = SubType, [ForceAim]) ->
	#pk_SevenDayAimUpdate{args = [Force]} = getCondition(SubType),
	case Force >= ForceAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Force]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Ranking = SubType, [RankAim]) ->
	#pk_SevenDayAimUpdate{args = [Rank]} = getCondition(SubType),
	case Rank =< RankAim andalso Rank > 0 of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Rank]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_EquipQuality = SubType, [-1, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	case lists:foldl(fun(A, B) -> A + B end, 0, ListEquip) of
		Count when Count >= CountAim ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListEquip]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_EquipQuality = SubType, [QualityAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	try
		case lists:nth(QualityAim + 1, ListEquip) >= CountAim of
			true ->
				1;
			_ ->
				?DEBUG("[DebugForSevenDayAim] Args:~w", [ListEquip]),
				playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
				0
		end
	catch
		_:_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListEquip]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_EquipStar = SubType, [StarAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun(Star, Count) ->
			case Star >= StarAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListEquip) >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListEquip]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_EquipRefine = SubType, [RefineAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun(Refine, Count) ->
			case Refine >= RefineAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListEquip) >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListEquip]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_GemLevel = SubType, [LevelAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListGem} = getCondition(SubType),
	 ListGemAim =
	 	case LevelAim of
			1 ->
				ListGem;
			_ ->
				{_, ListGemAim_} = lists:split(LevelAim - 1, ListGem),
				ListGemAim_
		end,
	case lists:sum(ListGemAim) >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListGem]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
%reward_checkCondition(_Mark, ?SevenDayAim_GemMaster = _SubType, _Args) ->
%	0;	% （废弃）
%reward_checkCondition(_Mark, ?SevenDayAim_WingLevel = _SubType, [_LevelAim]) ->
%	#pk_SevenDayAimUpdate{args = [Level]} = getCondition(SubType),
%	case Level >= LevelAim of
%		true ->
%			1;
%		_ ->
%			?DEBUG("[DebugForSevenDayAim] Args:~w", [Level]),
%			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
%			0
%	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetLevel = SubType, [LevelAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	FunCount =
		fun(Level, Count) ->
			case Level >= LevelAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListPet) >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListPet]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetStar = SubType, [StarAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	FunCount =
		fun(Star, Count) ->
			case Star + 1 >= StarAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListPet) >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListPet]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetTurn = SubType, [TurnAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	FunCount =
		fun(Turn, Count) ->
			case Turn >= TurnAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListPet) >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListPet]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetAdd = SubType, [AddAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	FunCount =
		fun(Add, Count) ->
			case Add >= AddAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListPet) >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListPet]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Enchant = SubType, [PosAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPos} = getCondition(SubType),
	FunCount =
		fun(Pos, Count) ->
			case Pos >= PosAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListPos) >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [ListPos]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_GuildIn = SubType, _List) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	case Args of
		[] ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0;
		_ ->
			1
	end;
reward_checkCondition(_Mark, ?SevenDayAim_HomeCreate = SubType, _List) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	case Args of
		[] ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0;
		_ ->
			1
	end;
reward_checkCondition(_Mark, ?SevenDayAim_LSTypeMake = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_FurniSave = SubType, _List) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	case Args of
		[] ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0;
		_ ->
			1
	end;

reward_checkCondition(_Mark, ?SevenDayAim_Dance = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Answer = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_LSTypePlant = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_LSTypeFish = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_LSTypeMine = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_LSTypeHunt = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_WorldBoss = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Trade = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_CopyMapTime = _SubType, [MapID, CountAim]) ->
	Args = playerPropSync:getProp(?SerProp_SevenDayAim_CopyMapTime),
	case lists:keyfind(MapID, 1, Args) of
		{MapID, Count} ->
			case Count >= CountAim of
				true ->
					1;
				_ ->
					?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
					playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
					0
			end;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_GatherBattle = SubType, _List) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	case Args of
		[] ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Args]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0;
		_ ->
			1
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Aruna = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_GuildTask = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_ProtectGodTimes = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_DateTimes = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_GuildDailyTaskTimes = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			?DEBUG("[DebugForSevenDayAim] Args:~w", [Count]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;


reward_checkCondition(_Mark, SubType, Args) ->
	?ERROR("Invalid Argument SubType:~w Args:~w", [SubType, Args]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
	0.

%% 尝试可能的货币奖励
-spec reward_coin(Mark::0|1, RewardCoin::list()) -> ok.
reward_coin(0, _RewardCoin) ->
	ok;
reward_coin(_Mark, RewardCoin) when erlang:is_list(RewardCoin) ->
	reward_coin(RewardCoin),
	ok;
reward_coin(_Mark, _RewardCoin) ->
	ok.
reward_coin([]) ->
	ok;
reward_coin([{CoinType, CoinNum} | T]) ->
	PLog = #recPLogTSMoney{
		reason = ?CoinSourceSevenDayAimReward,
		param = 0,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_SevenDayAim
	},
	playerMoney:addCoin(CoinType, CoinNum, PLog),
	reward_coin(T);
reward_coin([InvalidCfg | T]) ->
	?ERROR("invalid Cfg:~w", [InvalidCfg]),
	reward_coin(T);
reward_coin(_Null) ->
	ok.

%% 尝试可能的道具奖励
-spec reward_item(Mark::0|1, RewardItem::list()) -> ok.
reward_item(0, _RewardItem) ->
	ok;
reward_item(_Mark, RewardItem) when erlang:is_list(RewardItem) ->
	reward_item(RewardItem),
	ok;
reward_item(_Mark, _RewardItem) ->
	ok.
reward_item([]) ->
	ok;
reward_item([{ItemID, ItemNum} | T]) ->
	PLog = #recPLogTSItem{
		old         = 0,
		new         = ItemNum,
		change      = ItemNum,
		target      = ?PLogTS_PlayerSelf,
		source      = ?PLogTS_SevenDayAim,
		gold        = 0,
		goldtype    = 0,
		changReason = ?ItemSourceSevenDayAimReward,
		reasonParam = 0
	},
	playerPackage:addGoodsAndMail(ItemID, ItemNum, false, 0, PLog),
	reward_item(T);
reward_item([InvalidCfg | T]) ->
	?ERROR("invalid Cfg:~w", [InvalidCfg]),
	reward_item(T);
reward_item(_Null) ->
	ok.

%%% ====================================================================
%%% API functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 上线初始化并推送状态
-spec init() -> ok.
init() ->
	%case playerBase:funcIsOpenByMainMenu(58) of	%% 58对应七日目标
	%	true ->
	case core:isCross() of
		false ->
			case playerState2:getSevenDayAimIsInit() of
				true ->
					skip;
				_ ->
					case playerPropSync:getProp(?SerProp_SevenDayAimTimeBegin) of
						0 ->
							%% 取当天凌晨4点时间
							TimeNowUTC = time:getSyncTime1970FromDBS(),
							Date = time:convertSec2DateTime(TimeNowUTC),
							TimeBeginOfDay = time:getDayBeginSeconds(Date) + ?ResetTimeHour * 3600 - ?SECS_FROM_0_TO_1970,
							playerPropSync:setInt(?SerProp_SevenDayAimTimeBegin, TimeBeginOfDay);
						_ ->
							skip
					end,
					Conditions =
						case checkTime() of
							true ->
								[getCondition(Aim, true) || Aim <- ?SevenDayAim_ALL];
							_ ->
								[]
						end,
					Msg = #pk_GS2U_SevenDayAimState_Sync{
						timeBegin = getTimeBegin(),
						conditions = Conditions,
						alreadyReward = playerPropSync:getProp(?SerProp_SevenDayAimAlreadyReward)
					},
%%					?ERROR("huping msg: ~p",[Msg]),
					playerMsg:sendNetMsg(Msg),
					playerState2:setSevenDayAimIsInit(true)
			end;
		_ ->
			skip
	end,
	%	_ ->
	%		skip
	%end,
	ok.

%%% --------------------------------------------------------------------
%% 更新条件值
-spec updateCondition(ID::sevenDayAim(), Args::list()) -> ok.
updateCondition(ID, Args) ->
	case core:isCross() of
		false ->
			case checkTime() of
				false ->
					ok;	%% 不在活动时间，忽略
				_ ->
					case updateCondition_(ID, Args) of
						#pk_GS2U_SevenDayAimUpdate_Sync{} = Msg ->
							case playerState2:getSevenDayAimIsInit() of
								true ->
									?DEBUG("[DebugForSevenDayAim] updateCondition ID:~w Args:~w~n~w", [ID, Args, Msg]),
									playerMsg:sendNetMsg(Msg);
								_ ->
									ok	%% 未初始化，不发送消息
							end;
						_ ->
							ok	%% 无效更新
					end
			end;
		_ ->
			skip
	end.

%% 通关指定副本
updateCondition_(?SevenDayAim_CopyMap = ID, [MapID]) ->
	ListMapIDOld = playerPropSync:getProp(?SerProp_SevenDayAim_CopyMap),
	case lists:member(MapID, ListMapIDOld) of
		true ->
			ok;	%% 已通关，忽略
		_ ->
			ListMapIDNew = [MapID | ListMapIDOld],
			playerPropSync:setAny(?SerProp_SevenDayAim_CopyMap, ListMapIDNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListMapIDNew}
	end;

%% 勇者荣耀通过第N层
updateCondition_(?SevenDayAim_WarriorTrial = ID, [Layer]) ->
	LayerOld = playerPropSync:getProp(?SerProp_SevenDayAim_WarriorTrial),
	case Layer =< LayerOld of
		true ->
			ok;	%% 已通关，忽略
		_ ->
			playerPropSync:setInt(?SerProp_SevenDayAim_WarriorTrial, Layer),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [Layer]}
	end;

%% 守护女神通过指定关卡
updateCondition_(?SevenDayAim_ProtectGod = ID, [MapID]) ->
	ListMapIDOld = playerPropSync:getProp(?SerProp_SevenDayAim_ProtectGod),
	case lists:member(MapID, ListMapIDOld) of
		true ->
			ok;	%% 已通关，忽略
		_ ->
			ListMapIDNew = [MapID | ListMapIDOld],
			playerPropSync:setAny(?SerProp_SevenDayAim_ProtectGod, ListMapIDNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListMapIDNew}
	end;

%% 材料副本/元素保卫战通过指定关卡
updateCondition_(?SevenDayAim_Material = ID, [MapID]) ->
	ListMapIDOld = playerPropSync:getProp(?SerProp_SevenDayAim_Material),
	case lists:member(MapID, ListMapIDOld) of
		true ->
			ok;	%% 已通关，忽略
		_ ->
			ListMapIDNew = [MapID | ListMapIDOld],
			playerPropSync:setAny(?SerProp_SevenDayAim_Material, ListMapIDNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListMapIDNew}
	end;

%% 角色达到指定等级（客户端本地获取）
updateCondition_(?SevenDayAim_RoleLevel = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 指定品质（等于）的骑宠达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_PetCount = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 拥有时装达到指定数量
updateCondition_(?SevenDayAim_FashionCount = ID, [FashionID]) ->
	ListFashionIDOld = playerPropSync:getProp(?SerProp_SevenDayAim_FashionCount),
	case lists:member(FashionID, ListFashionIDOld) of
		true ->
			ok;	%% 已拥有，忽略
		_ ->
			ListFashionIDNew = [FashionID | ListFashionIDOld],
			playerPropSync:setAny(?SerProp_SevenDayAim_FashionCount, ListFashionIDNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [erlang:length(ListFashionIDNew)]}
	end;

%% 战力达到指定数量
updateCondition_(?SevenDayAim_Force = ID, [Force]) ->
	playerPropSync:setInt64(?SerProp_SevenDayAim_Force, Force),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [Force]};

%% 竞技场排名达到前N
updateCondition_(?SevenDayAim_Ranking = ID, [RankMin]) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [RankMin]};

%% 指定品质（等于）的装备达到指定数量
updateCondition_(?SevenDayAim_EquipQuality = ID, _Args) ->
	EquipsBody = playerState:getPackage(?Item_Location_BodyEquipBag),
	EquipsBag = playerState:getPackage(?Item_Location_Equip_Bag),
	EquipsStorage = playerState:getPackage(?Item_Location_Equip_Storage),
	FunSum =
		fun
			(#recSaveEquip{quality = ?EquipColorTypeWhite}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0 + 1, Count1, Count2, Count3, Count4, Count5];
			(#recSaveEquip{quality = ?EquipColorTypeGreen}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1 + 1, Count2, Count3, Count4, Count5];
			(#recSaveEquip{quality = ?EquipColorTypeBlue}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2 + 1, Count3, Count4, Count5];
			(#recSaveEquip{quality = ?EquipColorTypeRed}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3 + 1, Count4, Count5];
			(#recSaveEquip{quality = ?EquipColorTypePurple}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3, Count4 + 1, Count5];
			(#recSaveEquip{quality = ?EquipColorTypeOrange}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3, Count4, Count5 + 1];
			(_, L) ->
				L
		end,
	[Count0, Count1, Count2, Count3, Count4, Count5] = L0 =
		playerPropSync:getProp(?SerProp_SevenDayAim_EquipQuality),
	L1 = lists:foldl(FunSum, [0, 0, 0, 0, 0, 0], EquipsBody),
	L2 = lists:foldl(FunSum, L1, EquipsBag),
	[Count0_, Count1_, Count2_, Count3_, Count4_, Count5_] =
		lists:foldl(FunSum, L2, EquipsStorage),
	case [
		erlang:max(Count0, Count0_),
		erlang:max(Count1, Count1_),
		erlang:max(Count2, Count2_),
		erlang:max(Count3, Count3_),
		erlang:max(Count4, Count4_),
		erlang:max(Count5, Count5_)
	] of
		L0 ->
			ok;	%% 未变化，忽略
		L4 ->
			playerPropSync:setAny(?SerProp_SevenDayAim_EquipQuality, L4),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = L4}
	end;

%% 满足星级要求（大于等于）的装备（槽位）达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_EquipStar = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足精炼要求（大于等于）的装备（槽位）达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_EquipRefine = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足等级要求（大于等于）的纹章镶嵌达到指定数量
updateCondition_(?SevenDayAim_GemLevel = ID, Args) ->
	%% 根据配置表cfg_gemproperty获取纹章最大等级，以便生成合适长度的列表
	FunGetGemLevelMax =
		fun(Key1, Max0) ->
			ListMax1 = getCfg:get2KeyList(cfg_gemproperty, Key1),
			Max1 = lists:max(ListMax1),
			erlang:max(Max0, Max1)
		end,
	GemLevelMax = lists:foldl(FunGetGemLevelMax, 0, getCfg:get1KeyList(cfg_gemproperty)),
	ListGem0 = [{Level, 0} || Level <- lists:seq(1, GemLevelMax)],
	%% 根据当前装备的纹章（来自传参），计算出当前的各等级纹章数量
	FunCount =
		fun
			(0, ListGemAcc) ->
				ListGemAcc;
			(GemID, ListGemAcc) ->
				#itemCfg{useParam3 = Level} = getCfg:getCfgPStack(cfg_item, GemID),
				case lists:keyfind(Level, 1, ListGemAcc) of
					false ->
						[{Level, 1} | ListGemAcc];
					{_, Count} ->
						lists:keyreplace(Level, 1, ListGemAcc, {Level, Count + 1})
				end
		end,
	ListGem1 = lists:foldl(FunCount, ListGem0, Args),
	%% 比较旧有数据，保留较大值
	ListGemOld = playerPropSync:getProp(?SerProp_SevenDayAim_GemCount),
	FunMax =
		fun(Count, {Level, ListGemAcc}) ->
			case lists:keyfind(Level, 1, ListGemAcc) of
				false ->
					{Level + 1, [{Level, Count} | ListGemAcc]};
				{_, CountMin} when Count > CountMin ->
					{Level + 1, lists:keyreplace(Level, 1, ListGemAcc, {Level, Count})};
				_ ->
					{Level + 1, ListGemAcc}
			end
		end,
	{_, ListGem2} = lists:foldl(FunMax, {1, ListGem1}, ListGemOld),
	%% 按等级升序排序，再去掉等级值
	ListGem3 = lists:sort(fun({L1, _}, {L2, _}) -> L1 < L2 end, ListGem2),
	case [Count || {_, Count} <- ListGem3] of
		ListGemOld ->
			ok;	%% 未变化，忽略
		ListGem4 ->
			playerPropSync:setAny(?SerProp_SevenDayAim_GemCount, ListGem4),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListGem4}
	end;

%%% 满足等级要求（大于等于）的纹章大师达到指定数量（纹章系统重新开发中，此处暂不支持）
%updateCondition_(?SevenDayAim_GemMaster = ID, _Args) ->
%	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};
%
%%% 翅膀达到指定阶级（客户端本地获取）
%updateCondition_(?SevenDayAim_WingLevel = ID, _Args) ->
%	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足等级要求（大于等于）的器灵达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_PetLevel = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足星级要求（大于等于）的骑宠达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_PetStar = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足转生要求（大于等于）的骑宠达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_PetTurn = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足提升要求（大于等于）的骑宠达到指定数量
updateCondition_(?SevenDayAim_PetAdd = ID, [PetID, Count]) ->
	ListOld = playerPropSync:getProp(?SerProp_SevenDayAim_PetAdd),
	ListNew =
		case lists:keyfind(PetID, 1, ListOld) of
			{_, CountOld} ->
				lists:keyreplace(PetID, 1, ListOld, {PetID, CountOld + Count});
			_ ->
				[{PetID, Count} | ListOld]
		end,
	playerPropSync:setAny(?SerProp_SevenDayAim_PetAdd, ListNew),
	FunMsg =
		fun({_PetID, AddCount}, R) ->
			[AddCount | R]
		end,
	ListMsg = lists:foldl(FunMsg, [], ListNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListMsg};

%% 满足提升要求（大于等于）的附魔部位，精度
updateCondition_(?SevenDayAim_Enchant = ID, [EquipPos, Recast]) ->
	ListOld = playerPropSync:getProp(?SerProp_SevenDayAim_Enchant),
	ListNew =
		case lists:keyfind(EquipPos, 1, ListOld) of
			{_, _RecastOld} ->
				lists:keyreplace(EquipPos, 1, ListOld, {EquipPos, Recast});
			_ ->
				[{EquipPos, Recast} | ListOld]
		end,
	playerPropSync:setAny(?SerProp_SevenDayAim_Enchant, ListNew),
	FunMsg =
		fun({_EquipPos, AddCount}, R) ->
			[AddCount | R]
		end,
	ListMsg = lists:foldl(FunMsg, [], ListNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListMsg};

%% 加入或创建一个家族
updateCondition_(?SevenDayAim_GuildIn = ID, [GuildID]) ->
	ListOld = playerPropSync:getProp(?SerProp_SevenDayAim_GuildIn),
	case lists:member(GuildID, ListOld) of
		true ->
			ok;	%% 已加入，忽略
		_ ->
			ListNew = [GuildID | ListOld],
			playerPropSync:setAny(?SerProp_SevenDayAim_GuildIn, ListNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListNew}
	end;

%% 创建一个家园
updateCondition_(?SevenDayAim_HomeCreate = ID, [HomeID]) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [HomeID]};

%% 合成X次家具
updateCondition_(?SevenDayAim_LSTypeMake = ID, [_]) ->
	ItemNumOld = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypeMake),

	ItemNumNew = ItemNumOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_LSTypeMake, ItemNumNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [ItemNumNew]};

%% 摆放一次家具
updateCondition_(?SevenDayAim_FurniSave = ID, [HomeID]) ->
	ListOld = playerPropSync:getProp(?SerProp_SevenDayAim_FurniSave),
	case ListOld of
		[] ->
			ListNew = [HomeID],
			playerPropSync:setAny(?SerProp_SevenDayAim_FurniSave, ListNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListNew};
		_ ->
			%% 已摆放一次，忽略
			ok
	end;
%%	FurniSaveTimeOld = playerPropSync:getProp(?SerProp_SevenDayAim_FurniSave),
%%
%%	FurniSaveTimeNew = FurniSaveTimeOld + 1,
%%	playerPropSync:setAny(?SerProp_SevenDayAim_FurniSave, FurniSaveTimeNew),
%%	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [FurniSaveTimeNew]};

%% 完成X次限时广场舞
updateCondition_(?SevenDayAim_Dance = ID, []) ->
	DanceTimeOld = playerPropSync:getProp(?SerProp_SevenDayAim_Dance),
	DanceTimeNew =
	case playerDaily:getDailyCounter(?DailyType_SevenDayAim_Dance, 1) of
		0 ->
			playerDaily:incDailyCounter(?DailyType_SevenDayAim_Dance, 1),
			DanceTimeOld + 1;
		_ ->
			DanceTimeOld
	end,
	playerPropSync:setInt(?SerProp_SevenDayAim_Dance, DanceTimeNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [DanceTimeNew]};

%% 完成X次全民答题
updateCondition_(?SevenDayAim_Answer = ID, []) ->
	AnswerNumOld = playerPropSync:getProp(?SerProp_SevenDayAim_Answer),

	AnswerNumNew = AnswerNumOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_Answer, AnswerNumNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [AnswerNumNew]};

%% 进行种植X次
updateCondition_(?SevenDayAim_LSTypePlant = ID, []) ->
	PlantNumOld = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypePlant),

	PlantNumNew = PlantNumOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_LSTypePlant, PlantNumNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [PlantNumNew]};

%% 进行钓鱼X次
updateCondition_(?SevenDayAim_LSTypeFish = ID, []) ->
	FishNumOld = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypeFish),

	FishNumNew = FishNumOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_LSTypeFish, FishNumNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [FishNumNew]};

%% 进行采矿X次
updateCondition_(?SevenDayAim_LSTypeMine = ID, []) ->
	MineNumOld = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypeMine),

	MineNumNew = MineNumOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_LSTypeMine, MineNumNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [MineNumNew]};

%% 进行打猎X次
updateCondition_(?SevenDayAim_LSTypeHunt = ID, []) ->
	HuntNumOld = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypeHunt),

	HuntNumNew = HuntNumOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_LSTypeHunt, HuntNumNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [HuntNumNew]};

%% 完成X次首领入侵
updateCondition_(?SevenDayAim_WorldBoss = ID, []) ->
	TimesOld = playerPropSync:getProp(?SerProp_SevenDayAim_WorldBoss),

	TimesNew = TimesOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_WorldBoss, TimesNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [TimesNew]};

%% 交易行上架X次道具
updateCondition_(?SevenDayAim_Trade = ID, []) ->
	TradeUpOld = playerPropSync:getProp(?SerProp_SevenDayAim_Trade),

	TradeUpNew = TradeUpOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_Trade, TradeUpNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [TradeUpNew]};

%% 通关副本ID的挑战副本X次
updateCondition_(?SevenDayAim_CopyMapTime = ID, [MapID]) ->
	ListMapIDAndTimeOld = playerPropSync:getProp(?SerProp_SevenDayAim_CopyMapTime),
	NewTuple =
		case lists:keyfind(MapID, 1, ListMapIDAndTimeOld) of
			{MapID, Count} ->
				{MapID, Count+1};
			_ ->
				{MapID, 1}
		end,

	ListMapIDAndTimeNew = lists:keystore(MapID, 1, ListMapIDAndTimeOld, NewTuple),
	playerPropSync:setAny(?SerProp_SevenDayAim_CopyMapTime, ListMapIDAndTimeNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = lists:flatmap(fun({MapID, Count}) -> [MapID, Count] end, ListMapIDAndTimeNew)};

%% 参与一次幽界探险 进地图就算
updateCondition_(?SevenDayAim_GatherBattle = ID, [MapSubtype]) ->
	ListOld = playerPropSync:getProp(?SerProp_SevenDayAim_GatherBattle),
	case ListOld of
		[] ->
			ListNew = [MapSubtype],
			playerPropSync:setAny(?SerProp_SevenDayAim_GatherBattle, ListNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListNew};
		_ ->
			%% 已参与一次，忽略
			ok
	end;

%% 完成X个阿露娜世界的任务
updateCondition_(?SevenDayAim_Aruna = ID, []) ->
	ArunaOld = playerPropSync:getProp(?SerProp_SevenDayAim_Aruna),

	ArunaNew = ArunaOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_Aruna, ArunaNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [ArunaNew]};

%% 完成X次家族战/家族雪人/家族首领
updateCondition_(?SevenDayAim_GuildTask = ID, []) ->
	GuildTaskOld = playerPropSync:getProp(?SerProp_SevenDayAim_GuildTask),

	GuildTaskNew = GuildTaskOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_GuildTask, GuildTaskNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [GuildTaskNew]};

%% 通关X次守护女神
updateCondition_(?SevenDayAim_ProtectGodTimes = ID, []) ->
	ProtectGodTimeOld = playerPropSync:getProp(?SerProp_SevenDayAim_ProtectGodTimes),

	ProtectGodTimeNew = ProtectGodTimeOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_ProtectGodTimes, ProtectGodTimeNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [ProtectGodTimeNew]};

%% 完成X次约会地下城
updateCondition_(?SevenDayAim_DateTimes = ID, []) ->
	DateTimeOld = playerPropSync:getProp(?SerProp_SevenDayAim_DateTimes),

	DateTimeNew = DateTimeOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_DateTimes, DateTimeNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [DateTimeNew]};

%% 完成X次家族任务
updateCondition_(?SevenDayAim_GuildDailyTaskTimes = ID, []) ->
	TaskTimeOld = playerPropSync:getProp(?SerProp_SevenDayAim_GuildTaskTimes),

	TaskTimeNew = TaskTimeOld + 1,
	playerPropSync:setInt(?SerProp_SevenDayAim_GuildTaskTimes, TaskTimeNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [TaskTimeNew]}.



%%% --------------------------------------------------------------------
%% GM用查询进度（返回字符串以在聊天框显示）
-spec queryForGM(ID::uint()) -> string().
queryForGM(ID) ->
	case core:isCross() of
		false ->
			case getCfg:getCfgByKey(cfg_seven_day_aim, ID) of
				#seven_day_aimCfg{} = Cfg ->
					q1(Cfg);
				_ ->
					queryForGM_format("invalid id:~w of cfg_seven_day_aim", [ID])
			end;
		_ ->
			"can not use it in cross"
	end.

queryForGM_format(F) ->
	lists:flatten(io_lib:format(F, [])).
queryForGM_format(F, A) ->
	lists:flatten(io_lib:format(F, A)).

-spec q1(#seven_day_aimCfg{}) -> string().
q1(#seven_day_aimCfg{id = ID, subType1 = SubType1, args1 = Args1, subType2 = SubType2, args2 = Args2, subType3 = SubType3, args3 = Args3}) ->
	Ret1 = q2(SubType1, Args1),
	Ret2 = q2(SubType2, Args2),
	Ret3 = q2(SubType3, Args3),
	SubType1_ = makeString(SubType1),
	Args1_ = makeString(Args1),
	SubType2_ = makeString(SubType2),
	Args2_ = makeString(Args2),
	SubType3_ = makeString(SubType3),
	Args3_ = makeString(Args3),
	queryForGM_format(
		"ID:~w~nsubType1:~ts,args1:~ts~n~ts~nsubType2:~ts,args2:~ts~n~ts~nsubType3:~ts,args3:~ts~n~ts",
		[ID, SubType1_, Args1_, Ret1, SubType2_, Args2_, Ret2, SubType3_, Args3_, Ret3]
	).

%% 由于unity使用[整形]来标记文本颜色，因此聊天框输出字符时带有仅含1个整形元素的数组需要特殊处理以保证显示内容正确
%% 这里的目的是为了显示数组中的参数，因此在上述情况时，在前中括号和内容中插入一个空格来进行特殊处理
-spec makeString(Content::term()) -> string().
makeString([Value]) when erlang:is_integer(Value), Value > 0 ->
	queryForGM_format("[ ~w]", [Value]);
makeString(Content) ->
	queryForGM_format("~w", [Content]).

-spec q2(SubType::sevenDayAim(), Args::list()) -> string().
q2(0, _Args) ->
	"skip";
q2(?SevenDayAim_CopyMap = SubType, [MapID] = Args) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{} = MapCfg ->
			case MapCfg of
				#mapsettingCfg{type = ?MapTypeCopyMap, subtype = SubType} when
					SubType =:= ?MapSubTypeMoneyDungeon;	%% 金币副本/惊天喵盗团
					SubType =:= ?MapSubTypeSpiritArea;		%% 灵界活动/原初灵界
					SubType =:= ?MapSubTypeMaterial ->		%% 材料副本/元素保卫战
					%% 这些是走副本逻辑的活动，不是真正的副本
					"is not copymap when mapsetting.subtype is 1008,1009,1011";
				#mapsettingCfg{type = ?MapTypeCopyMap} ->
					#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
					case lists:member(MapID, Args) of
						true ->
							"1/1";
						_ ->
							"0/1"
					end;
				_ ->
					"is not copymap"
			end;
		_ ->
			queryForGM_format("invalid MapID:~w", [MapID])
	end;
q2(?SevenDayAim_WarriorTrial = SubType, [LayerAim]) ->
	#pk_SevenDayAimUpdate{args = [Layer]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Layer, LayerAim]);
q2(?SevenDayAim_ProtectGod = SubType, [MapID]) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{} = MapCfg ->
			case MapCfg of
				#mapsettingCfg{subtype = ?MapSubTypeDemonBattle} ->
					#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
					case lists:member(MapID, Args) of
						true ->
							"1/1";
						_ ->
							"0/1"
					end;
				_ ->
					"is not ProtectGod"
			end;
		_ ->
			queryForGM_format("invalid MapID:~w", [MapID])
	end;
q2(?SevenDayAim_Material = SubType, [MapID]) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{} = MapCfg ->
			case MapCfg of
				#mapsettingCfg{subtype = ?MapSubTypeMaterial} ->
					#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
					case lists:member(MapID, Args) of
						true ->
							"1/1";
						_ ->
							"0/1"
					end;
				_ ->
					"is not Material"
			end;
		_ ->
			queryForGM_format("invalid MapID:~w", [MapID])
	end;
q2(?SevenDayAim_RoleLevel = SubType, [RoleLevelAim]) ->
	#pk_SevenDayAimUpdate{args = [RoleLevel]} = getCondition(SubType),
	queryForGM_format("~w/~w", [RoleLevel, RoleLevelAim]);
q2(?SevenDayAim_PetCount = SubType, [QualityAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	Count =
		case QualityAim of
			-1 ->
				lists:foldl(fun(A, B) -> A + B end, 0, ListPet);
			_ ->
				lists:nth(QualityAim + 1, ListPet)
		end,
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_FashionCount = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_Force = SubType, [ForceAim]) ->
	#pk_SevenDayAimUpdate{args = [Force]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Force, ForceAim]);
q2(?SevenDayAim_Ranking = SubType, [RankAim]) ->
	#pk_SevenDayAimUpdate{args = [Rank]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Rank, RankAim]);
q2(?SevenDayAim_EquipQuality = SubType, [QualityAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	Count =
		case QualityAim of
			-1 ->
				lists:foldl(fun(A, B) -> A + B end, 0, ListEquip);
			_ ->
				lists:nth(QualityAim + 1, ListEquip)
		end,
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_EquipStar = SubType, [StarAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun(Star, Count) ->
			case Star >= StarAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	Count = lists:foldl(FunCount, 0, ListEquip),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_EquipRefine = SubType, [RefineAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun(Refine, Count) ->
			case Refine >= RefineAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	Count = lists:foldl(FunCount, 0, ListEquip),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_GemLevel = SubType, [LevelAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListGem} = getCondition(SubType),
	ListGemAim =
		case LevelAim of
			1 ->
				ListGem;
			_ ->
				{_, ListGemAim_} = lists:split(LevelAim - 1, ListGem),
				ListGemAim_
		end,
	Count = lists:sum(ListGemAim),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_GemMaster, _Args) ->
	"not support";
q2(?SevenDayAim_WingLevel = _SubType, [_LevelAim]) ->
	"not support";	%（废弃）
	%#pk_SevenDayAimUpdate{args = [Level]} = getCondition(SubType),
	%queryForGM_format("~w/~w", [Level, LevelAim]);
q2(?SevenDayAim_PetLevel = SubType, [LevelAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	FunCount =
		fun(Level, Count) ->
			case Level >= LevelAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	Count = lists:foldl(FunCount, 0, ListPet),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_PetStar = SubType, [StarAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	FunCount =
		fun(Star, Count) ->
			case Star + 1 >= StarAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	Count = lists:foldl(FunCount, 0, ListPet),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_PetTurn = SubType, [TurnAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	FunCount =
		fun(Turn, Count) ->
			case Turn >= TurnAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	Count = lists:foldl(FunCount, 0, ListPet),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_PetAdd = SubType, [AddAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	FunCount =
		fun(Add, Count) ->
			case Add >= AddAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	Count = lists:foldl(FunCount, 0, ListPet),
	queryForGM_format("~w/~w", [Count, CountAim]);

q2(?SevenDayAim_Enchant = SubType, [PosAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPos} = getCondition(SubType),
	FunCount =
		fun(Add, Count) ->
			case Add >= PosAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	Count = lists:foldl(FunCount, 0, ListPos),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_GuildIn = SubType, [_]) ->
	#pk_SevenDayAimUpdate{args = GuildID} = getCondition(SubType),
	queryForGM_format("~w", [GuildID]);
q2(?SevenDayAim_HomeCreate = SubType, [_]) ->
	#pk_SevenDayAimUpdate{args = HomeID} = getCondition(SubType),
	queryForGM_format("~w", [HomeID]);
q2(?SevenDayAim_LSTypeMake = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_FurniSave = SubType, [_]) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	queryForGM_format("~w", [Args]);
q2(?SevenDayAim_Dance = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_Answer = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_LSTypePlant = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_LSTypeFish = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_LSTypeMine = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_LSTypeHunt = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_WorldBoss = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_Trade = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_CopyMapTime = SubType, [MapID, CountAim] = Args) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{} = MapCfg ->
			case MapCfg of
				#mapsettingCfg{type = ?MapTypeCopyMap, subtype = SubType} when
					SubType =:= ?MapSubTypeMoneyDungeon;	%% 金币副本/惊天喵盗团
					SubType =:= ?MapSubTypeSpiritArea;		%% 灵界活动/原初灵界
					SubType =:= ?MapSubTypeMaterial ->		%% 材料副本/元素保卫战
					%% 这些是走副本逻辑的活动，不是真正的副本
					"is not copymap when mapsetting.subtype is 1008,1009,1011";
				#mapsettingCfg{type = ?MapTypeCopyMap} ->
					#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
					PassTime =
						case lists:keyfind(MapID, 1, Args) of
							{MapID, Count} ->
								Count;
							_ ->
								0
						end,
					queryForGM_format("~w/~w", [PassTime, CountAim]);
				_ ->
					"is not copymap"
			end;
		_ ->
			queryForGM_format("invalid MapID:~w", [MapID])
	end;
q2(?SevenDayAim_GatherBattle = SubType, [_]) ->
	#pk_SevenDayAimUpdate{args = GuildID} = getCondition(SubType),
	queryForGM_format("~w", [GuildID]);
q2(?SevenDayAim_Aruna = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_GuildTask = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_ProtectGodTimes = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_DateTimes = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(?SevenDayAim_GuildDailyTaskTimes = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	queryForGM_format("~w/~w", [Count, CountAim]);
q2(_SubType, _Args) ->
	queryForGM_format("invalid subType or invalid args").

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%% --------------------------------------------------------------------\
%% 获取活动开始时间
-spec getTimeBegin() -> Sec::uint32().
getTimeBegin() ->
	playerPropSync:getProp(?SerProp_SevenDayAimTimeBegin).

%%% --------------------------------------------------------------------
%% 检查活动时间
-spec checkTime() -> boolean().
checkTime() ->
	TimeNow = time:getSyncTimeFromDBS(),
	case playerPropSync:getProp(?SerProp_SevenDayAimTimeBegin) + ?SevenDayTime =< TimeNow of
		true ->
			false;
		_ ->
			true
	end.

%%% --------------------------------------------------------------------
%% 获取条件
-spec getCondition(ID::sevenDayAim()) -> #pk_SevenDayAimUpdate{}.
getCondition(ID) ->
	getCondition(ID, false).
-spec getCondition(ID::sevenDayAim(), IsInit::boolean()) -> #pk_SevenDayAimUpdate{}.
getCondition(?SevenDayAim_CopyMap = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_CopyMap)
	};
getCondition(?SevenDayAim_WarriorTrial = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [playerPropSync:getProp(?SerProp_SevenDayAim_WarriorTrial)]
	};
getCondition(?SevenDayAim_ProtectGod = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_ProtectGod)
	};
getCondition(?SevenDayAim_Material = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_Material)
	};
getCondition(?SevenDayAim_RoleLevel = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_RoleLevel = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [playerState:getLevel()]
	};
getCondition(?SevenDayAim_PetCount = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_PetCount = ID, _IsInit) ->
	FunSum1 =
		fun
			(?PetQualityWhite, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0 + 1, Count1, Count2, Count3, Count4, Count5];
			(?PetQualityGreen, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1 + 1, Count2, Count3, Count4, Count5];
			(?PetQualityBlue, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2 + 1, Count3, Count4, Count5];
			(?PetQualityPurple, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3 + 1, Count4, Count5];
			(?PetQualityOrange, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3, Count4 + 1, Count5];
			(?PetQualityRed, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3, Count4, Count5 + 1]
		end,
	FunSum2 =
		fun(#recPetInfo{pet_id = ID_}, Args) ->
			case getCfg:getCfgByKey(cfg_pet, ID_) of
				#petCfg{petquality = Quality} ->
					FunSum1(Quality, Args);
				_ ->
					Args
			end
		end,
	Args = lists:foldl(FunSum2, [0, 0, 0, 0, 0, 0], playerState:getPets()),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = Args
	};
getCondition(?SevenDayAim_FashionCount = ID, _IsInit) ->
	ListFashionID = playerPropSync:getProp(?SerProp_SevenDayAim_FashionCount),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [erlang:length(ListFashionID)]
	};
getCondition(?SevenDayAim_Force = ID, _IsInit) ->
	Force = playerPropSync:getProp(?SerProp_SevenDayAim_Force),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Force]
	};
getCondition(?SevenDayAim_Ranking = ID, _IsInit) ->
	RoleID = playerState:getRoleID(),
	MS = ets:fun2ms(fun(#rec_ladder_1v1{} = T) when T#rec_ladder_1v1.roleID =:= RoleID -> T end),
	case ets:select(ets_rec_ladder_1v1, MS) of
		[#rec_ladder_1v1{rankMin = RankMin}] ->
			#pk_SevenDayAimUpdate{
				type = ID,
				args = [RankMin]
			};
		_ ->
			#pk_SevenDayAimUpdate{
				type = ID,
				args = [0]
			}
	end;
getCondition(?SevenDayAim_EquipQuality = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_EquipQuality)
	};
getCondition(?SevenDayAim_EquipStar = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_EquipStar = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Star || #recEquipStar{star = Star} <- playerState:getEquipStarList()]
	};
getCondition(?SevenDayAim_EquipRefine = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_EquipRefine = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Lv || #recEquipRefine{level = Lv} <- playerState:getEquipRefine()]
	};
getCondition(?SevenDayAim_GemLevel = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_GemCount)
	};
%getCondition(?SevenDayAim_WingLevel = ID, true) ->
%	#pk_SevenDayAimUpdate{
%		type = ID,
%		args = [0]
%	};
%getCondition(?SevenDayAim_WingLevel = ID, _IsInit) ->
%	#pk_SevenDayAimUpdate{
%		type = ID,
%		args = [0]%%[playerWing:getWingMaxLevel()]
%	};
getCondition(?SevenDayAim_PetLevel = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_PetLevel = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Level || #recPetInfo{pet_level = Level} <- playerState:getPets()]
	};
getCondition(?SevenDayAim_PetStar = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_PetStar = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Star || #recPetInfo{pet_star = Star} <- playerState:getPets()]
	};
getCondition(?SevenDayAim_PetTurn = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_PetTurn = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Turn || #recPetInfo{pet_raw = Turn} <- playerState:getPets()]
	};
getCondition(?SevenDayAim_PetAdd = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Count || {_PetID, Count} <- playerPropSync:getProp(?SerProp_SevenDayAim_PetAdd)]
	};
getCondition(?SevenDayAim_Enchant = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Count || {_EuipPos, Count} <- playerPropSync:getProp(?SerProp_SevenDayAim_Enchant)]
	};
getCondition(?SevenDayAim_GuildIn = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_GuildIn)
	};
getCondition(?SevenDayAim_HomeCreate = ID, _IsInit) ->
	Args =
		case homeInterface:queryHome(playerState:getRoleID()) of
			false ->
				[];
			#rec_home{homeID = HomeID} ->
				[HomeID]
		end,
	#pk_SevenDayAimUpdate{
		type = ID,
		args = Args
	};
getCondition(?SevenDayAim_LSTypeMake = ID, _IsInit) ->
	ItemNum = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypeMake),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [ItemNum]
	};
getCondition(?SevenDayAim_FurniSave = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_FurniSave)
	};
getCondition(?SevenDayAim_Dance = ID, _IsInit) ->
	DanceTime = playerPropSync:getProp(?SerProp_SevenDayAim_Dance),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [DanceTime]
	};
getCondition(?SevenDayAim_Answer = ID, _IsInit) ->
	AnswerTime = playerPropSync:getProp(?SerProp_SevenDayAim_Answer),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [AnswerTime]
	};
getCondition(?SevenDayAim_LSTypePlant = ID, _IsInit) ->
	PlantTime = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypePlant),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [PlantTime]
	};
getCondition(?SevenDayAim_LSTypeFish = ID, _IsInit) ->
	FishTime = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypeFish),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [FishTime]
	};
getCondition(?SevenDayAim_LSTypeMine = ID, _IsInit) ->
	MineTime = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypeMine),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [MineTime]
	};
getCondition(?SevenDayAim_LSTypeHunt = ID, _IsInit) ->
	HuntTime = playerPropSync:getProp(?SerProp_SevenDayAim_LSTypeHunt),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [HuntTime]
	};
getCondition(?SevenDayAim_WorldBoss = ID, _IsInit) ->
	Times = playerPropSync:getProp(?SerProp_SevenDayAim_WorldBoss),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Times]
	};
getCondition(?SevenDayAim_Trade = ID, _IsInit) ->
	TradeUpTime = playerPropSync:getProp(?SerProp_SevenDayAim_Trade),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [TradeUpTime]
	};
getCondition(?SevenDayAim_CopyMapTime = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = lists:flatmap(fun({MapID, Count}) -> [MapID, Count] end, playerPropSync:getProp(?SerProp_SevenDayAim_CopyMapTime))
	};
getCondition(?SevenDayAim_GatherBattle = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_GatherBattle)
	};
getCondition(?SevenDayAim_Aruna = ID, _IsInit) ->
	ArunaTime = playerPropSync:getProp(?SerProp_SevenDayAim_Aruna),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [ArunaTime]
	};
getCondition(?SevenDayAim_GuildTask = ID, _IsInit) ->
	GuildTaskTime = playerPropSync:getProp(?SerProp_SevenDayAim_GuildTask),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [GuildTaskTime]
	};
getCondition(?SevenDayAim_ProtectGodTimes = ID, _IsInit) ->
	ProtectGodTime = playerPropSync:getProp(?SerProp_SevenDayAim_ProtectGodTimes),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [ProtectGodTime]
	};
getCondition(?SevenDayAim_DateTimes = ID, _IsInit) ->
	DateTime = playerPropSync:getProp(?SerProp_SevenDayAim_DateTimes),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [DateTime]
	};
getCondition(?SevenDayAim_GuildDailyTaskTimes = ID, _IsInit) ->
	DateTime = playerPropSync:getProp(?SerProp_SevenDayAim_GuildTaskTimes),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [DateTime]
	}.
