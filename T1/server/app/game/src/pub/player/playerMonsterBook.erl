%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 怪物图鉴
%%% @end
%%% Created : 20170829
%%%-------------------------------------------------------------------
-module(playerMonsterBook).
-author(meitianyang).

-include("playerPrivate.hrl").
-include("cfg_monster_file.hrl").
-include("cfg_monster_filekey.hrl").

%%%-------------------------------------------------------------------
% 解锁方式
-define(UnlockWay_BEGIN,	1).
-define(UnlockWay_Snap,		1).	%% 拍照解锁
-define(UnlockWay_Kill,		2).	%% 击杀解锁
-define(UnlockWay_END,		2).

-export([
	msg/1	% 客户端请求
]).

-export([
	init/0,			% 上线初始化
	killMonster/1,	% 击杀怪物回调
	enterNewMap/1	% 进入新图回调
]).

-export([
	gmQuery/2,		% 查询地图或怪物状态
	gmSetMonster/3	% 设置怪物状态
]).

%% fix
-export([
	%%checkAndRepairMonsterBookAchieve/0,
	%%checkAndRepairMonsterBookAchieve_1/0
]).

%%%-------------------------------------------------------------------
% 解锁奖励与扩展奖励
-define(RewardType_Unlock,	1).	%% 解锁奖励，经验值和货币
-define(RewardType_Extra,	2).	%% 扩展奖励，永久属性
%-define(RewardType_Map,		3).	%% 地图奖励，多项永久属性（不能直接领取，通过扩展奖励间接激活）

%%%-------------------------------------------------------------------
% 判断是否能领取解锁奖励与扩展奖励的返回值
-define(RewardRet_Cannot,	0).	%% 条件没达到
-define(RewardRet_Can,		1).	%% 能
-define(RewardRet_Already,	2).	%% 已经领过了

%%%-------------------------------------------------------------------


%%成就解锁需要的地图ID
%%%-------------------------------------------------------------------
-define(MapID_UnLock_1, 10).%%解锁东城郊全部的怪物图鉴
-define(MapID_UnLock_2, 3).  %%解锁阿克勒平原全部的怪物图鉴
-define(MapID_UnLock_3, 7).%%解锁苍空雪域全部的怪物图鉴
-define(MapID_UnLock_4, 4).%%解锁苍空之塔全部的怪物图鉴
-define(MapID_UnLock_5, 11).%%解锁精灵故土全部的怪物图鉴
-define(MapID_UnLock_6, 13).%%解锁遗迹谷地全部的怪物图鉴
-define(MapID_UnLock_7, 12).%%解锁精灵避难所全部的怪物图鉴
-define(MapID_UnLock_8, 5).  %%解锁首领禁地全部的怪物图鉴
-define(MapID_UnLock_9, 14).  %%解锁黑暗丛林全部的怪物图鉴
-define(MapID_UnLock_10, 15).  %%解锁幽灵树丛全部的怪物图鉴
-define(MapID_UnLock_11, 16).  %%解锁红魔鬼基地全部的怪物图鉴

%%%-------------------------------------------------------------------

% 假的客户端请求，用于开关过滤
-spec msg(term()) -> no_return().
msg(Msg) ->
	case playerMainMenu:isOpen(?ModeType_Handbook) andalso not core:isCross() of
		true ->
			msg_real(Msg);
		_ ->
			skip
%%			?ERROR_CODE(?ErrorCode_YourLevelIsTooLower)
	end.

%%%-------------------------------------------------------------------
% 真的客户端请求，用于分流逻辑
-spec msg_real(term()) -> no_return().
msg_real(#pk_U2GS_MonsterBook_Request{}) ->
	msg_all();
msg_real(#pk_U2GS_MonsterBookSnap_Request{id = MonsterID}) ->
	msg_snap(MonsterID);
msg_real(#pk_U2GS_MonsterBookUnlock_Request{id = MonsterID}) ->
	msg_unlock(MonsterID);
msg_real(#pk_U2GS_MonsterBookReward_Request{id = MonsterID}) ->
	msg_reward(MonsterID);
msg_real(Unknown) ->
	?ERROR("invalid msg:~w RoleID:~w", [Unknown, playerState:getRoleID()]).

%%%-------------------------------------------------------------------
% 反馈全列表
-spec msg_all() -> no_return().
msg_all() ->
	ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
	Msg = #pk_GS2U_MonsterBook_Ack{
		listMapID = playerPropSync:getProp(?SerProp_AlreadyEnterNormalMapJustForMonsterBook),
		listMonster = db2msg(ListMonsterBook)
	},
	playerMsg:sendNetMsg(Msg).

%%%-------------------------------------------------------------------
% 照相请求
-spec msg_snap(MonsterID::uint16()) -> no_return().
msg_snap(MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_filekey, MonsterID) of
		#monster_filekeyCfg{file_id = FileID}->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{} ->
					ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
					Ret =
						case lists:keyfind(FileID, #rec_player_monster_book.monsterID, ListMonsterBook) of
							false ->
								%% 没有数据
								MonsterBook = #rec_player_monster_book{roleID = playerState:getRoleID(), monsterID = FileID},
								MonsterBookNew = MonsterBook#rec_player_monster_book{isSnap = 1},
								ListMonsterBookNew = [MonsterBookNew | ListMonsterBook],
								{MonsterBook, MonsterBookNew, ListMonsterBookNew};
							#rec_player_monster_book{isSnap = 0} = MonsterBook ->
								%% 有数据，没有拍照
								MonsterBookNew = MonsterBook#rec_player_monster_book{isSnap = 1},
								ListMonsterBookNew = lists:keyreplace(
									FileID,
									#rec_player_monster_book.monsterID,
									ListMonsterBook,
									MonsterBookNew
								),
								{MonsterBook, MonsterBookNew, ListMonsterBookNew};
							_ ->
								%% 重复拍照 此处不提示ErrorCode，因为难免会拍到已经拍过的怪
								%?ERROR_CODE(?ErrorCode_MonsterBook_AlreadySnap)
								skip
						end,
					case Ret of
						{Old, New, ListNew} ->
							%% 刷新数据
							playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListNew),
							%% 通知客户端
							playerMsg:sendNetMsg(#pk_GS2U_MonsterBookSnap_Ack{id = FileID}),
							%% 检查是否要通知解锁或领奖
							case checkRewardSingle(Old, New) of
								{[], []} ->
									skip;
								{ListUnlockID, ListRewardID} ->
									playerMsg:sendNetMsg(#pk_GS2U_MonsterBookNeed_Sync{
										listUnlockID = ListUnlockID,
										listRewardID = ListRewardID
									})
							end;
						_ ->
							skip
					end;
				_ ->
					?WARN("msg_snap can not find id:~w from cfg_monster_file RoleID:~w", [FileID, playerState:getRoleID()]),
					skip	%% 不在配置中，忽略请求
			end;
		_ ->
			?WARN("msg_snap can not find id:~w from cfg_monster_filekey RoleID:~w", [MonsterID, playerState:getRoleID()]),
			skip
	end.

%%%-------------------------------------------------------------------
% 解锁请求
-spec msg_unlock(MonsterID::uint16()) -> no_return().
msg_unlock(MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_filekey,MonsterID) of
		#monster_filekeyCfg{file_id =  FileID}->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{area = MapID} = Cfg ->
					ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
					case lists:keyfind(FileID, #rec_player_monster_book.monsterID, ListMonsterBook) of
						false ->
							?ERROR_CODE(?ErrorCode_MonsterBook_Locked);	%% 没有达到解锁条件
						MonsterBook ->
							case checkReward(?RewardType_Unlock, MonsterBook) of
								?RewardRet_Cannot ->
									?ERROR_CODE(?ErrorCode_MonsterBook_Locked);	%% 没有达到解锁条件
								?RewardRet_Already ->
									?ERROR_CODE(?ErrorCode_MonsterBook_UnLocked);	%% 已经解锁过了
								?RewardRet_Can ->
									%% 标记为已解锁，同时清除击杀数，以便额外奖励时重新计数
									MonsterBookNew = MonsterBook#rec_player_monster_book{isUnlock = 1, countKill = 0},
									ListMonsterBookNew = lists:keyreplace(
										FileID,
										#rec_player_monster_book.monsterID,
										ListMonsterBook,
										MonsterBookNew
									),
									playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListMonsterBookNew),
									%% 解锁奖励
									rewardForUnlock(Cfg),
									%% 通知客户端
									playerMsg:sendNetMsg(#pk_GS2U_MonsterBookUnlock_Ack{id = FileID}),
									addachieveMapUnLock(MapID);
								_ ->
									skip
							end
					end;
				_ ->
					?WARN("msg_unlock can not find id:~w from cfg_monster_file RoleID:~w", [FileID, playerState:getRoleID()]),
					skip	%% 不在配置中，忽略请求
			end;
		_ ->
			?WARN("msg_unlock can not find id:~w from cfg_monster_filekey RoleID:~w", [MonsterID, playerState:getRoleID()]),
			skip	%% 不在配置中，忽略请求
	end.

%%新增 解锁地图成就
addachieveMapUnLock(0) ->
	ok;
addachieveMapUnLock(?MapID_UnLock_1) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_1,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_2) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_2,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_3) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_3,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_4) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_4,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_5) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_5,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_6) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_6,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_7) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_7,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_9) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_9,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_10) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_10,[1]),
	ok;
addachieveMapUnLock(?MapID_UnLock_11) ->
	playerAchieve:achieveEvent(?Achieve_UnlockMap_11,[1]),
	ok;


addachieveMapUnLock(_) ->
	ok.

%%%-------------------------------------------------------------------
% 领奖请求
-spec msg_reward(MonsterID::uint16()) -> no_return().
msg_reward(MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_filekey,MonsterID) of
		#monster_filekeyCfg{file_id =  FileID}->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{} ->
					ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
					case lists:keyfind(FileID, #rec_player_monster_book.monsterID, ListMonsterBook) of
						false ->
							?ERROR_CODE(?ErrorCode_MonsterBook_NoReward);	%% 没有达到领奖条件
						MonsterBook ->
							case checkReward(?RewardType_Extra, MonsterBook) of
								?RewardRet_Cannot ->
									?ERROR_CODE(?ErrorCode_MonsterBook_NoReward);	%% 没有达到领奖条件
								?RewardRet_Already ->
									?ERROR_CODE(?ErrorCode_MonsterBook_Rewarded);	%% 已经领过了
								?RewardRet_Can ->
									%% 标记为已领奖
									MonsterBookNew = MonsterBook#rec_player_monster_book{isReward = 1},
									ListMonsterBookNew = lists:keyreplace(
										FileID,
										#rec_player_monster_book.monsterID,
										ListMonsterBook,
										MonsterBookNew
									),
									playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListMonsterBookNew),
									%% 刷新属性
									refreshProp(),
									%% 通知客户端
									playerMsg:sendNetMsg(#pk_GS2U_MonsterBookReward_Ack{id = FileID})
							end
					end;
				_ ->
					?WARN("msg_reward can not find id:~w from cfg_monster_file RoleID:~w", [FileID, playerState:getRoleID()]),
					skip	%% 不在配置中，忽略请求
			end;
		_->
			?WARN("msg_reward can not find id:~w from cfg_monster_filekey RoleID:~w", [MonsterID, playerState:getRoleID()]),
			skip	%% 不在配置中，忽略请求
	end.

%%%-------------------------------------------------------------------
% 上线初始化
-spec init() -> no_return().
init() ->
	case core:isCross() of
		false ->
			case playerMainMenu:isOpen(?ModeType_Handbook) of
				true ->
					L = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
					LFix = init_fix(L, []),
					playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, LFix),
					case checkRewardOnline(LFix, [], []) of
						{[], []} ->
							skip;	%% 没有数据
						{ListUnlockID, ListRewardID} ->
							%% LUN-7805 【图鉴】每张地图的最终图鉴奖励解锁后，未获得属性何战力加成
							%% 坑爹的设计，原本方案是客户端手动领奖，后来口头修改为自动领奖。两端交互中可能会有遗漏
							[msg_reward(MonsterID) || MonsterID <- ListRewardID],
							playerMsg:sendNetMsg(#pk_GS2U_MonsterBookNeed_Sync{
								listUnlockID = ListUnlockID,
								listRewardID = []
							})
					end;
				_ ->
					skip	%% 功能开放前没有数据
			end,
			refreshProp();
		_ ->
			MBookListProp = playerState2:getMonsterBookProp(),
			case MBookListProp of
				[] ->
					skip;
				_ ->
					playerCalcProp:changeProp_AddMulti([], [], MBookListProp, [], true),
					playerForce:calcPlayerForce(true)
			end
	end.

%%%-------------------------------------------------------------------
% 修复错误的数据
init_fix([], Acc) ->
	lists:reverse(Acc);
init_fix([#rec_player_monster_book{monsterID = MonsterID} = H | T], Acc) ->
	case getCfg:getCfgByKey(cfg_monster_filekey, MonsterID) of
		#monster_filekeyCfg{file_id =  FileID}->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{} ->
					init_fix(T, [H | Acc]);
				_ ->
					?ERROR("init_fix invalid monster:~w RoleID:~w", [H, playerState:getRoleID()]),
					init_fix(T, Acc)
			end;
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% 击杀怪物回调
-spec killMonster(MonsterID::uint16()) -> no_return().
killMonster(MonsterID) ->
	case playerMainMenu:isOpen(?ModeType_Handbook) andalso not core:isCross() of
		true ->
			case getCfg:getCfgByKey(cfg_monster_filekey,MonsterID) of
				#monster_filekeyCfg{file_id = FileID} ->
					case getCfg:getCfgByKey(cfg_monster_file, FileID) of
						#monster_fileCfg{unlock_way = UnlockWay, extra_target = CountKillAimReward} ->
							%% 获取旧值
							ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
							Old = #rec_player_monster_book{isUnlock = IsUnlock, countKill = CountOld} =
								case lists:keyfind(FileID, #rec_player_monster_book.monsterID, ListMonsterBook) of
									false ->
										#rec_player_monster_book{roleID = playerState:getRoleID(), monsterID = FileID};
									Old_ ->
										Old_
								end,
							%% 如果未解锁，取解锁所需击杀数作为击杀数最大值
							%% 若已解锁，取额外奖励所需击杀数作为击杀数最大值
							CountKillAimMax =
								case IsUnlock of
									0 ->
										case UnlockWay of
											[?UnlockWay_Kill, CountKillAimUnlock] ->
												CountKillAimUnlock;
											_ ->
												0
										end;
									_ ->
										CountKillAimReward
								end,
							%% 比较最大值判断是否需要记录新值
							case CountOld >= CountKillAimMax of
								true ->
									skip;	%% 已经是最大值，不需要刷新
								_ ->
									New = Old#rec_player_monster_book{countKill = CountOld + 1},
									ListMonsterBookNew = lists:keystore(
										FileID,
										#rec_player_monster_book.monsterID,
										ListMonsterBook,
										New
									),
									%% 刷新数据
									playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListMonsterBookNew),
									%% 检查是否要通知解锁或领奖
									case checkRewardSingle(Old, New) of
										{[], []} ->
											skip;
										{ListUnlockID, ListRewardID} ->
											playerMsg:sendNetMsg(#pk_GS2U_MonsterBookNeed_Sync{
												listUnlockID = ListUnlockID,
												listRewardID = ListRewardID
											})
									end
							end;
						_ ->
							skip	%% 该怪物不是图鉴中的怪物
					end;
				_ ->
					skip
			end;
		_ ->
			skip	%% 功能开放前不计数
	end.

%%%-------------------------------------------------------------------
% 进入新图回调
-spec enterNewMap(MapId::uint16()) -> no_return().
enterNewMap(MapId) ->
	case playerMainMenu:isOpen(?ModeType_Handbook) andalso not core:isCross() of
		true ->
			case getCfg:getCfgByKey(cfg_mapsetting, MapId) of
				#mapsettingCfg{type = ?MapTypeNormal, show_name = MapName} ->
					L = playerPropSync:getProp(?SerProp_AlreadyEnterNormalMapJustForMonsterBook),
					case lists:member(MapId, L) of
						true ->
							skip;	%% 已经进入过了
						_ ->
							playerPropSync:setAny(?SerProp_AlreadyEnterNormalMapJustForMonsterBook, [MapId | L]),
							List1Key = getCfg:get1KeyList(cfg_monster_file),
							FunFind =
								fun(Key, Acc) ->
									case getCfg:getCfgByKey(cfg_monster_file, Key) of
										#monster_fileCfg{area = MapId} ->
											?ERROR_CODE(?ErrorCode_MonsterBook_NewMap, [MapName]),
											playerMsg:sendNetMsg(#pk_GS2U_MonsterBookEnterNewMap_Sync{mapid = MapId}),
											{true, 0};
										_ ->
											Acc
									end
								end,
							misc:foldlEx(FunFind, {false, 0}, List1Key)
					end;
				_ ->
					skip	%% 不是普通地图
			end;
		_ ->
			skip	%% 功能未开启
	end.

%%%-------------------------------------------------------------------
% db2msg
-spec db2msg(#rec_player_monster_book{} | [#rec_player_monster_book{}, ...]) -> #pk_MonsterBook{} | [#pk_MonsterBook{}, ...].
db2msg(#rec_player_monster_book{
	monsterID = ID,
	countKill = Kill,
	isSnap = IsSnap,
	isUnlock = IsUnlock,
	isReward = IsReward
}) ->
	#pk_MonsterBook{
		id = ID,
		kill = Kill,
		isSnap = misc:i2b(IsSnap),
		isUnlock = misc:i2b(IsUnlock),
		isReward = misc:i2b(IsReward)
	};
db2msg([]) ->
	[];
db2msg(ListDB) ->
	db2msg(ListDB, []).
db2msg([], Acc) ->
	Acc;
db2msg([H | T], Acc) ->
	Msg = db2msg(H),
	db2msg(T, [Msg | Acc]).

%%%-------------------------------------------------------------------
% 判断是否可以领奖（解锁奖励和扩展奖励）
-spec checkReward(uint(), #rec_player_monster_book{}, #rec_player_monster_book{}) -> {uint(), uint()}.
checkReward(RewardType, MonsterBookOld, MonsterBookNew) ->
	{checkReward(RewardType, MonsterBookOld), checkReward(RewardType, MonsterBookNew)}.

-spec checkReward(uint(), #rec_player_monster_book{}) -> uint().
% 已经解锁了
checkReward(?RewardType_Unlock, #rec_player_monster_book{isUnlock = 1}) ->
	?RewardRet_Already;
% 解锁奖励
checkReward(?RewardType_Unlock, #rec_player_monster_book{monsterID = MonsterID, countKill = CountKill, isSnap = IsSnap}) ->
	case getCfg:getCfgByKey(cfg_monster_filekey, MonsterID) of
		#monster_filekeyCfg{file_id = FileID }->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{unlock_way = [?UnlockWay_Snap, _]} ->
					case IsSnap of
						0 ->
							?RewardRet_Cannot;
						_ ->
							?RewardRet_Can
					end;
				#monster_fileCfg{unlock_way = [?UnlockWay_Kill, CountKillAim]} ->
					case CountKill >= CountKillAim of
						false ->
							?RewardRet_Cannot;
						_ ->
							?RewardRet_Can
					end;
				#monster_fileCfg{unlock_way = Invalid} ->
					?ERROR("?RewardType_Unlock checkReward invalid unlock_way:~w id:~w RoleID:~w", [Invalid, FileID, playerState:getRoleID()]),
					?RewardRet_Cannot;	%% 配置格式错误
				_ ->
					?ERROR("?RewardType_Unlock checkReward can not find id:~w from cfg_monster_file RoleID:~w", [FileID, playerState:getRoleID()]),
					?RewardRet_Cannot	%% 不在配置中
			end;
		_->
			?ERROR("?RewardType_Unlock checkReward can not find id:~w from cfg_monster_filekey RoleID:~w", [MonsterID, playerState:getRoleID()]),
			?RewardRet_Cannot	%% 不在配置中
	end;
% 已经领奖了
checkReward(?RewardType_Extra, #rec_player_monster_book{isReward = 1}) ->
	?RewardRet_Already;
% 扩展奖励
checkReward(?RewardType_Extra, #rec_player_monster_book{monsterID = MonsterID, countKill = CountKill}) ->
	case getCfg:getCfgByKey(cfg_monster_filekey,MonsterID) of
		#monster_filekeyCfg{file_id = FileID} ->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{extra_target = CountKillAim} ->
					case CountKill >= CountKillAim of
						false ->
							?RewardRet_Cannot;
						_ ->
							?RewardRet_Can
					end;
				_ ->
					?ERROR("?RewardType_Extra checkReward can not find id:~w from cfg_monster_file RoleID:~w", [FileID, playerState:getRoleID()]),
					?RewardRet_Cannot	%% 不在配置中，不能领奖
			end;
		_ ->
			?ERROR("?RewardType_Extra checkReward can not find id:~w from cfg_monster_filekey RoleID:~w", [MonsterID, playerState:getRoleID()]),
			?RewardRet_Cannot	%% 不在配置中，不能领奖
	end;
% 无法处理的情况
checkReward(RewardType, Cfg) ->
	?ERROR("checkReward invalid args RewardType:~w RoleID:~w Cfg:~w~n~p", [RewardType, playerState:getRoleID(), Cfg, misc:getStackTrace()]),
	?RewardRet_Cannot.

%%%-------------------------------------------------------------------
% 基于checkReward/2和checkReward/3封装一些常用的场景

% 单个图鉴数据变化时检查是否需要各种领奖
-spec checkRewardSingle(#rec_player_monster_book{}, #rec_player_monster_book{}) -> {[MonsterIDUnlock::uint16()], [MonsterIDReward::uint16()]}.
checkRewardSingle(#rec_player_monster_book{monsterID = MonsterID} = MonsterBookOld, MonsterBookNew) ->
	ListUnlock =
		case checkReward(?RewardType_Unlock, MonsterBookOld, MonsterBookNew) of
			{?RewardRet_Cannot, ?RewardRet_Can} ->
				[MonsterID];
			_ ->
				[]
		end,
	ListReward =
		case checkReward(?RewardType_Extra, MonsterBookOld, MonsterBookNew) of
			{?RewardRet_Cannot, ?RewardRet_Can} ->
				%% [MonsterID];
				%% LUN-7805 【图鉴】每张地图的最终图鉴奖励解锁后，未获得属性何战力加成
				%% 坑爹的设计，原本方案是客户端手动领奖，后来口头修改为自动领奖。两端交互中可能会有遗漏
				msg_reward(MonsterID),
				[];
			_ ->
				[]
		end,
	{ListUnlock, ListReward}.

% 上线时检查是否需要各种领奖
-spec checkRewardOnline([#rec_player_monster_book{}, ...], [uint16(), ...], [uint16(), ...]) -> {[uint16(), ...], [uint16(), ...]}.
checkRewardOnline([], AccUnlock, AccReward) ->
	{AccUnlock, AccReward};
checkRewardOnline([#rec_player_monster_book{monsterID = MonsterID} = H | T], AccUnlock, AccReward) ->
	AccUnlockNew =
		case checkReward(?RewardType_Unlock, H) of
			?RewardRet_Can ->
				[MonsterID | AccUnlock];
			_ ->
				AccUnlock
		end,
	AccRewardNew =
		case checkReward(?RewardType_Extra, H) of
			?RewardRet_Can ->
				[MonsterID | AccReward];
			_ ->
				AccReward
		end,
	checkRewardOnline(T, AccUnlockNew, AccRewardNew).

%%%-------------------------------------------------------------------
% 解锁奖励
-spec rewardForUnlock(#monster_fileCfg{}) -> no_return().
% 经验奖励
rewardForUnlock(#monster_fileCfg{monster_id = ID, unlock_reward = [1, Exp, _]})
	when erlang:is_integer(Exp), Exp > 0 ->
	playerBase:addExp(Exp, ?ExpSourceMonsterBook, ID);
rewardForUnlock(#monster_fileCfg{monster_id = ID, unlock_reward = [1, Exp]})
	when erlang:is_integer(Exp), Exp > 0 ->
	playerBase:addExp(Exp, ?ExpSourceMonsterBook, ID);
% 货币奖励
rewardForUnlock(#monster_fileCfg{monster_id = ID, unlock_reward = [2, CoinType, CoinCount]})
	when erlang:is_integer(CoinType), CoinType >= ?CoinTypeMin, CoinType =< ?CoinTypeMax,
	erlang:is_integer(CoinCount), CoinCount > 0 ->
	PLog = #recPLogTSMoney{
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_MonsterBook,
		reason = ?CoinSourceMonsterBook,
		param = ID
	},
	playerMoney:addCoin(CoinType, CoinCount, PLog);
% 错误的格式
rewardForUnlock(#monster_fileCfg{monster_id = ID, unlock_reward = Invalid}) ->
	?ERROR("rewardForUnlock invalid unlock_reward:~w id:~w RoleID:~w", [Invalid, ID, playerState:getRoleID()]).

%%%-------------------------------------------------------------------
% 刷新属性
-spec refreshProp() -> no_return().
refreshProp() ->
	ListPropOld = playerPropSync:getProp(?SerProp_MonsterBookProp),
	{MapIDCount, ListPropMonster} = refreshProp_1_filterMonster(),
	ListPropAll = refreshProp_2_map(MapIDCount, ListPropMonster),
	case refreshProp_3_combine(ListPropAll, []) of
		ListPropOld ->
			skip;	%% 属性无变化，忽略
		ListPropNew ->
			playerPropSync:setAny(?SerProp_MonsterBookProp, ListPropNew),
			ListPropDel = lists:foldl(fun({Type, Value}, Acc) -> [{Type, -Value} | Acc] end, [], ListPropOld),
			playerCalcProp:changeProp_AddMulti(ListPropDel, [], ListPropNew, [], true),
			playerForce:calcPlayerForce(true)
	end.

% 计算新属性1_筛选出已达到扩展奖励条件的怪物数据
-spec refreshProp_1_filterMonster() -> {MapIDCount::[{uint16(), uint()}, ...], Prop::[{uint(), float()}, ...]}.
refreshProp_1_filterMonster() ->
	ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
	refreshProp_1_filterMonster(ListMonsterBook, {[], []}).

refreshProp_1_filterMonster([], Acc) ->
	Acc;
refreshProp_1_filterMonster([#rec_player_monster_book{monsterID = ID, isReward = 1} | T], {MapIDCount, Prop} = Acc) ->
	case getCfg:getCfgByKey(cfg_monster_file, ID) of
		#monster_fileCfg{area = MapID, extra_bonus = [PropType, PropValue]} ->
			% 地图ID计数，用于后续计算地图相关的属性奖励
			MapIDCountNew =
				case lists:keyfind(MapID, 1, MapIDCount) of
					false ->
						[{MapID, 1} | MapIDCount];
					{_, Count} ->
						lists:keyreplace(MapID, 1, MapIDCount, {MapID, Count + 1})
				end,
			% 累计怪物给的属性奖励
			PropNew = [{PropType, erlang:float(PropValue)} | Prop],
			refreshProp_1_filterMonster(T, {MapIDCountNew, PropNew});
		#monster_fileCfg{} ->
			refreshProp_1_filterMonster(T, Acc);	%% 不符合奖励要求，忽略
		_ ->
			?ERROR(
				"refreshProp_1_filterMonster can not find cfg_monster_file.id:~w RoleID:~w",
				[ID, playerState:getRoleID()]
			),
			refreshProp_1_filterMonster(T, Acc)		%% 配置错误，无法找到配置
	end;
refreshProp_1_filterMonster([_ | T], Acc) ->
	refreshProp_1_filterMonster(T, Acc).	%% 未领奖，忽略

% 计算新属性2_根据地图ID计数获取地图相关的属性奖励
-spec refreshProp_2_map(MapIDCount::[{uint16(), uint()}, ...], Acc::[{uint(), float()}, ...]) -> Result::[{uint(), float()}, ...].
refreshProp_2_map([], Acc) ->
	Acc;
refreshProp_2_map([{MapID, Count} | T], Acc) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal, monster_collect = undefined} ->
			refreshProp_2_map(T, Acc);	%% 没有配置地图奖励
		#mapsettingCfg{type = ?MapTypeNormal, monster_collect = ListAim} ->
			refreshProp_2_map_(ListAim, Count, Acc);
		#mapsettingCfg{} ->
			?ERROR(
				"refreshProp_2_map not normal map:~w RoleID:~w",
				[MapID, playerState:getRoleID()]
			),
			refreshProp_2_map(T, Acc);	%% 配置错误，不是普通地图
		_ ->
			?ERROR(
				"refreshProp_2_map can not find map:~w RoleID:~w",
				[MapID, playerState:getRoleID()]
			),
			refreshProp_2_map(T, Acc)	%% 配置错误，无法找到配置
	end.
refreshProp_2_map_([], _Count, Acc) ->
	Acc;
refreshProp_2_map_([{CountAim, PropType, PropValue} | T], Count, Acc) when
	Count >= CountAim ->
	refreshProp_2_map_(T, Count, [{PropType, erlang:float(PropValue)} | Acc]);
refreshProp_2_map_([_ | T], Count, Acc) ->
	refreshProp_2_map_(T, Count, Acc).

% 计算新属性3_合并重复属性
-spec refreshProp_3_combine(Prop::[{uint(), float()}, ...], Acc::[{uint(), float()}, ...]) -> Result::[{uint(), float()}, ...].
refreshProp_3_combine([], Acc) ->
	Acc;
refreshProp_3_combine([{PropType, PropValue} | T], Acc) ->
	AccNew =
		case lists:keyfind(PropType, 1, Acc) of
			{_, PropValueAcc} ->
				lists:keyreplace(PropType, 1, Acc, {PropType, PropValue + PropValueAcc});
			false ->
				[{PropType, PropValue} | Acc]
		end,
	refreshProp_3_combine(T, AccNew).

%%%-------------------------------------------------------------------
% 查询地图或怪物状态
% type[1查询怪物配置 2查询怪物状态 3查询地图配置 4查询地图状态] id[怪物ID或者地图ID]
-spec gmQuery(uint(), uint16()) -> string() | skip.
gmQuery(1, MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_filekey,MonsterID) of
		#monster_filekeyCfg{file_id = FileID}->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{unlock_way = UnlockWay, unlock_reward = UnlockReward,
					extra_target = ExTarget, extra_bonus = ExBonus} ->
					io_lib:format(
						"MonsterID:~w UnlockWay:~w UnlockReward:~w ExTarget:~w ExBonus:~w",
						[FileID, UnlockWay, UnlockReward, ExTarget, ExBonus]
					);
				_ ->
					io_lib:format("can not find:~w from cfg_monster_file", [FileID])
			end;
		_->
			io_lib:format("can not find:~w from cfg_monster_filekey", [MonsterID])
	end;
gmQuery(2, MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_filekey,MonsterID) of
		#monster_filekeyCfg{file_id = FileID}->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{} ->
					ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
					#rec_player_monster_book{
						isSnap = IsSnap,
						isUnlock = IsUnlock,
						isReward = IsReward,
						countKill = CountKill
					} = MonsterBook =
						case lists:keyfind(FileID, #rec_player_monster_book.monsterID, ListMonsterBook) of
							false ->
								#rec_player_monster_book{
									roleID = playerState:getRoleID(),
									monsterID = FileID
								};
							Rec ->
								Rec
						end,
					CanUnlock = checkReward(?RewardType_Unlock, MonsterBook),
					CanReward = checkReward(?RewardType_Extra, MonsterBook),
					io_lib:format(
						"MonsterID:~w IsSnap:~w IsUnlock:~w IsReward:~w CountKill:~w CanUnlock:~w CanReward:~w",
						[FileID, IsSnap, IsUnlock, IsReward, CountKill, CanUnlock, CanReward]
					);
				_ ->
					io_lib:format("can not find:~w from cfg_monster_file", [FileID])
			end;
		_ ->
			io_lib:format("can not find:~w from cfg_monster_filekey", [MonsterID])
	end;
gmQuery(3, MapID) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal, monster_collect = ListAim} ->
			io_lib:format(
				"MapID:~w monster_collect:~w",
				[MapID, ListAim]
			);
		#mapsettingCfg{} ->
			io_lib:format("is not normal map:~w from cfg_mapsetting", [MapID]);
		_ ->
			io_lib:format("can not find:~w from cfg_mapsetting", [MapID])
	end;
gmQuery(4, MapID) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			FunSum =
				fun(#rec_player_monster_book{monsterID = ID, isReward = IsReward}, Acc) ->
					case getCfg:getCfgPStack(cfg_monster_file, ID) of
						#monster_fileCfg{area = MapID} when IsReward =:= 1 ->
							Acc + 1;
						_ ->
							Acc
					end
				end,
			ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
			Count = lists:foldl(FunSum, 0, ListMonsterBook),
			io_lib:format(
				"MapID:~w Count:~w",
				[MapID, Count]
			);
		#mapsettingCfg{} ->
			io_lib:format("is not normal map:~w from cfg_mapsetting", [MapID]);
		_ ->
			io_lib:format("can not find:~w from cfg_mapsetting", [MapID])
	end;
gmQuery(_, _) ->
	skip.

%%%-------------------------------------------------------------------
% 设置怪物状态
% type[1是否拍照 2是否解锁 3是否领奖 4击杀数量] value 1表示是，0表示否，数量任意
-spec gmSetMonster(uint16(), uint(), uint()) -> ok | skip.
gmSetMonster(MonsterID, Type, Value) ->
	case getCfg:getCfgByKey(cfg_monster_filekey, MonsterID) of
		#monster_filekeyCfg{file_id = FileID}->
			case getCfg:getCfgByKey(cfg_monster_file, FileID) of
				#monster_fileCfg{} ->
					ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
					MonsterBook =
						case lists:keyfind(FileID, #rec_player_monster_book.monsterID, ListMonsterBook) of
							false ->
								#rec_player_monster_book{roleID = playerState:getRoleID(), monsterID = FileID};
							Rec ->
								Rec
						end,
					case gmSetMonster_(Type, Value, MonsterBook) of
						MonsterBook ->
							skip;
						skip ->
							skip;
						MonsterBookNew ->
							ListMonsterBookNew = lists:keystore(FileID, #rec_player_monster_book.monsterID, ListMonsterBook, MonsterBookNew),
							playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListMonsterBookNew),
							ok
					end;
				_ ->
					skip
			end;
		_->
			skip
	end.
gmSetMonster_(1, 0, #rec_player_monster_book{isSnap = 0}) ->
	skip;
gmSetMonster_(1, 0, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isSnap = 0};
gmSetMonster_(1, _, #rec_player_monster_book{isSnap = 1}) ->
	skip;
gmSetMonster_(1, _, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isSnap = 1};
gmSetMonster_(2, 0, #rec_player_monster_book{isUnlock = 0}) ->
	skip;
gmSetMonster_(2, 0, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isUnlock = 0};
gmSetMonster_(2, _, #rec_player_monster_book{isUnlock = 1}) ->
	skip;
gmSetMonster_(2, _, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isUnlock = 1};
gmSetMonster_(3, 0, #rec_player_monster_book{isReward = 0}) ->
	skip;
gmSetMonster_(3, 0, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isReward = 0};
gmSetMonster_(3, _, #rec_player_monster_book{isReward = 1}) ->
	skip;
gmSetMonster_(3, _, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isReward = 1};
gmSetMonster_(4, Value, #rec_player_monster_book{} = Rec) when
	erlang:is_integer(Value), Value >= 0 ->
	Rec#rec_player_monster_book{countKill = Value};
gmSetMonster_(_, _, #rec_player_monster_book{}) ->
	skip.


%% v3.0.0屏蔽旧版补偿
%% give8
%%%%%-------------------------------------------------------------------
%%%% api,fix:LUN-8185 补偿逻辑
%%%%登录时候检查 阿克勒东郊的图鉴解锁数量，从新设置成就~~~~做一个补修机制，外网有玩家 解锁完了，成就数量少1
%%checkAndRepairMonsterBookAchieve()->
%%	ListMonsterBook =
%%		case playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book) of
%%			undefined -> [];
%%			L -> L
%%		end,
%%	F =  fun(#rec_player_monster_book{monsterID = MonsterID,isUnlock = IsUnlock},Num)->
%%		case IsUnlock of
%%			1->
%%				case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
%%					#monster_fileCfg{area = ?MapID_UnLock_1}->
%%						Num+1;
%%					_->
%%						Num
%%				end;
%%			_->
%%				Num
%%		end
%%		 end,
%%	UnlockNum =  lists:foldl(F, 0,ListMonsterBook),
%%	playerAchieve:setAchieveEevent(?Achieve_UnlockMap_1,UnlockNum),
%%	ok.


%% v3.0.0屏蔽旧版补偿
%% give12
%%
%%%%登录时候检查 修补红魔基地成就没计数，从新设置成就~~~~
%%checkAndRepairMonsterBookAchieve_1()->
%%	ListMonsterBook =
%%		case playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book) of
%%			undefined -> [];
%%			L -> L
%%		end,
%%	F =  fun(#rec_player_monster_book{monsterID = MonsterID,isUnlock = IsUnlock},Num)->
%%		case IsUnlock of
%%			1->
%%				case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
%%					#monster_fileCfg{area = ?MapID_UnLock_11}->
%%						Num+1;
%%					_->
%%						Num
%%				end;
%%			_->
%%				Num
%%		end
%%		 end,
%%	UnlockNum =  lists:foldl(F, 0,ListMonsterBook),
%%	playerAchieve:setAchieveEevent(?Achieve_UnlockMap_11,UnlockNum),
%%	ok.
