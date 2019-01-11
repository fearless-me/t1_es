%%%-------------------------------------------------------------------
%%% @author 田诚
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家补偿系统
%%% @end
%%% Created : 12. 五月 2015 17:30
%%%-------------------------------------------------------------------
-module(playerGive).
-author(tiancheng).

-include("playerPrivate.hrl").
-include("setupLang.hrl").
-include("cfg_monster_file.hrl").
-include("cfg_monster_filekey.hrl").

-export([
	giveReward/0
]).

%% 所有
-define(All, all).

%% 补偿子项
-record(recExtGive,{
	index,						%%补偿的Index
	langList = [],              %%补偿语言版本
	adbIDList = [],				%%补偿的地区，如（台湾，韩国）
	dbIDList = [],				%%哪些服务器需要补偿
	roleIDList = [],			%%需要补偿的玩家列表
	itemList = []				%%补偿的道具列表[{itemID,number},...]
}).

%% 补偿编号(唯一索引)
-define(PlayerGiveIndex1, 1).
-define(PlayerGiveIndex2, 2).
-define(PlayerGiveIndex3, 3).	%% 已完成任务状态丢失，导致功能UI丢失（因为主线任务涉及功能开关）
-define(PlayerGiveIndex4, 4).
-define(PlayerGiveIndex5, 5).	%% 针对1~6服，2018年4月17日9时30分之前有过充值的角色，发放道具29601
-define(PlayerGiveIndex6, 6).	%% LUN-8021
-define(PlayerGiveIndex7, 7).	%% LUN-8030
-define(PlayerGiveIndex8, 8).	%% LUN-8185 【外网】【成就】部分玩家有几率，成就里的图鉴解锁奖励无法领取
-define(PlayerGiveIndex9, 9).	%% 无JR 【外网】【家园】玩家华丽度虚高
-define(PlayerGiveIndex10, 10).	%% JR http://192.168.2.32:8080/browse/LUN-8381 上次修复家园华丽度，没写入数据库。。
-define(PlayerGiveIndex11, 11).	%% LUN-8438 【外网】【家族任务】接取到无法完成的家族任务
-define(PlayerGiveIndex12, 12).	%% LUN-8597 【外网】【成就】红魔基地，怪物无法解锁成就
-define(PlayerGiveIndex13, 13).	%% LUN-8630 【外网】【成就】有几率精炼和女神禁闭室成就完成条件都已达成，但成就奖励无法领取
-define(PlayerGiveIndex14, 14).	%% LUN-8636 【外网】【升星】外服角色有几率鞋子部位升星至紫色皇冠5星后，星级消失战力下跌
-define(PlayerGiveIndex15, 15).	%% LUN-8892 【外网】【技能】使用重置药水后有几率技能点数翻倍
-define(PlayerGiveIndex16, 16).	%% LUN-9072 【韩国】【充值】14日更新后，钻石显示负数
-define(PlayerGiveIndex17, 17).	%% 20181011 【北美】 发现1服商业化活动版本号重置，需要还原荣耀礼赞积累值
%% 20181016 【韩国】 1、首充第二档版本号异常，可能导致重置。2、消费返利预约配置断档，可能导致清空全部商业化内容。
%% 解决可能全部还原的BUG，并且修复首充数据。
-define(PlayerGiveIndex18, 18).

%% 补偿列表(如果index重复，将导致相同index只有一个可以被调用)
-define(PlayerGiveList, [
	#recExtGive{index = ?PlayerGiveIndex1},
	#recExtGive{index = ?PlayerGiveIndex2, langList = [?All], adbIDList = [5], dbIDList = [1,2,3,4,5,6]},
	#recExtGive{index = ?PlayerGiveIndex3, langList = [?All], adbIDList = [5], dbIDList = [1,2,3,4,5,6]},
	#recExtGive{index = ?PlayerGiveIndex4, langList = [?All], adbIDList = [5], dbIDList = [1,2,3,4,5,6]},
	#recExtGive{index = ?PlayerGiveIndex5, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex6, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex7, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex8, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex9, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex10, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex11, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex12, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex13, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex14, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex15, langList = [?All], adbIDList = [5], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex16, langList = [?All], adbIDList = [8], dbIDList = [?All]},
	#recExtGive{index = ?PlayerGiveIndex17, langList = [?All], adbIDList = [11], dbIDList = [1, 999]},   %% 仅1服BUG，填999是便于测试服测试
	#recExtGive{index = ?PlayerGiveIndex18, langList = [?All], adbIDList = [8], dbIDList = [?All]}
]).

%% 具体补偿实现
dispatchCompensate(?PlayerGiveIndex1, _RoleID, _RoleList, _ItemList) -> ok;
dispatchCompensate(?PlayerGiveIndex2, _RoleID, _RoleList, _ItemList) ->
	%% 补偿任务
	%%playerTask:modifyMainTask(),
	ok;
dispatchCompensate(?PlayerGiveIndex3, _RoleID, _RoleList, _ItemList) ->
	%%playerTask:fixCompletedMainTask(),
	ok;
dispatchCompensate(?PlayerGiveIndex4, _RoleID, _RoleList, _ItemList) ->
%%	RoleID = playerState:getRoleID(),
%%	MS = ets:fun2ms(
%%		fun(RechargeInfo) when RechargeInfo#recRecharge.roleID =:= RoleID andalso RechargeInfo#recRecharge.currencyMoneyAmount =:= undefined ->
%%			RechargeInfo
%%		end
%%	),
%%	case ets:select(rechargeEts, MS) of
%%		[#recRecharge{}|_] = List ->
%%			F =
%%				fun(#recRecharge{gameMoneyAmount = Coin, businessID = BID}) ->
%%					?INFO("give:~p,~p,~p", [RoleID, Coin, BID]),
%%					playerRecharge2:recharge(BID, Coin div 2, Coin)
%%				end,
%%			lists:foreach(F, List);
%%		_ ->
%%			skip
%%	end,
	ok;
dispatchCompensate(?PlayerGiveIndex5, _RoleID, _RoleList, _ItemList) ->
%%	?DEBUG("[DebugForGive] 5 RoleID:~w Self:~w", [playerState:getRoleID(), self()]),
%%	gsSendMsg:sendMsg2DBServer(dispatchCompensate_5, playerState:getAccountID(), playerState:getRoleID());
	skip;
dispatchCompensate(?PlayerGiveIndex6, _RoleID, _RoleList, _ItemList) ->
	%%playerTask:fixMultiMainTask();
	skip;
dispatchCompensate(?PlayerGiveIndex7, _RoleID, _RoleList, _ItemList) ->
	%%playerTask:fixAchieveTaskIsComplete();
	skip;
dispatchCompensate(?PlayerGiveIndex8, _RoleID, _RoleList, _ItemList) ->
	%%playerMonsterBook:checkAndRepairMonsterBookAchieve();
	skip;
dispatchCompensate(?PlayerGiveIndex9, _RoleID, _RoleList, _ItemList) ->
	%%playerHomeFurniTrue:homeStylishRepair();
	skip;
%%在修复一次 。。。。
dispatchCompensate(?PlayerGiveIndex10, _RoleID, _RoleList, _ItemList) ->
	%%playerHomeFurniTrue:homeStylishRepair();
	skip;
dispatchCompensate(?PlayerGiveIndex11, _RoleID, _RoleList, _ItemList) ->
	%%playerLoopTask:fixInvalidTask_1_3_0();
	skip;
dispatchCompensate(?PlayerGiveIndex12, _RoleID, _RoleList, _ItemList) ->
	%%playerMonsterBook:checkAndRepairMonsterBookAchieve_1();
	skip;
dispatchCompensate(?PlayerGiveIndex13, _RoleID, _RoleList, _ItemList) ->
	%%playerEquip:checkAndRepairRefineAchieve(),
	%%playerWarriorTrial:checkAndRepairBraveTriedAchieve();
	skip;
dispatchCompensate(?PlayerGiveIndex14, _RoleID, _RoleList, _ItemList) ->
	%%playerEquip:fixLUN8636();
	skip;
dispatchCompensate(?PlayerGiveIndex15, _RoleID, _RoleList, _ItemList) ->
	%%playerSkillLearn:checkAndDoResetSkill();
	skip;
dispatchCompensate(?PlayerGiveIndex16, _RoleID, _RoleList, _ItemList) ->
	playerMoney:fixLockDiamond();
dispatchCompensate(?PlayerGiveIndex17, _RoleID, _RoleList, _ItemList) ->
	playerRecharge2:fixLostBusiness10();
dispatchCompensate(?PlayerGiveIndex18, _RoleID, _RoleList, _ItemList) ->
	playerRecharge2:fixLostBusiness1();
dispatchCompensate(GiveType, _RoleID, _RoleList, _ItemList) ->
	?ERROR("dispatchCompensate:~p,~p", [playerState:getRoleID(), GiveType]),
	ok.

%% 调用加载补偿
-spec giveReward() -> ok.
giveReward() ->
	ADBID = gsMainLogic:getADBID4GS(),
	DBID = gsMainLogic:getDBID4GS(),
	giveReward(playerState:getRoleID(),ADBID,DBID),
	ok.
giveReward(RoleID, ADBID, DBID) ->
	F =
		fun(#recExtGive{index = Index, langList = LangList, adbIDList = ADBIDList, dbIDList = DBIDList} = Give, NowIndex) ->
			case Index > NowIndex of
				true ->
					?WARN("Compensate check[roleID:~p,index:~p]", [RoleID, Index]),
					%% 先保存索引
					case playerPropSync:getProp(?SerProp_LoadGiveEndIndex) < Index of
						true -> playerPropSync:setInt(?SerProp_LoadGiveEndIndex, Index);
						_ -> skip
					end,
					%% ==============调用补偿==============
					%% 检测大区
					case ADBIDList =:= [?All] orelse lists:member(ADBID, ADBIDList) of
						true ->
							%% 检测语言
							case LangList =:= [?All] orelse lists:member(?Cur_Lang, LangList) of
								true ->
									%% 检测DBID是否在指定的DBID列表中
									case DBIDList =:= [?All] orelse lists:member(DBID, DBIDList) of
										true ->
											?WARN("Compensate Real[roleID:~p,index:~p]", [RoleID, Index]),
											dispatchCompensate(Index, RoleID, Give#recExtGive.roleIDList, Give#recExtGive.itemList);
										_ -> skip
									end;
								_ -> skip
							end;
						_ -> skip
					end,
					Index;
				_ -> NowIndex
			end
		end,
	lists:foldl(F, playerPropSync:getProp(?SerProp_LoadGiveEndIndex), lists:keysort(#recExtGive.index, ?PlayerGiveList)).
