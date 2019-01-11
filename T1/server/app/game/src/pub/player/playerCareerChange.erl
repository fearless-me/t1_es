%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 二月 2017 14:42
%%%-------------------------------------------------------------------
-module(playerCareerChange).
-author("Administrator").
-include("playerPrivate.hrl").

%% API
-export([
	change/1,
	change/2,
	rechooseChangeCareer/1
]).


rechooseChangeCareer(NewCareer)->
	%% 该职业ID是由客户端发放的，存在安全问题
	%% 需要限制只能同系列职业平行转职
	OldCareer = playerState:getCareer(),
	Check =
		case OldCareer of
			NewCareer ->
				false;	%% 相同职业无法转职
			_ ->
				case ?Career2CareerMain(NewCareer) =:= ?Career2CareerMain(OldCareer) of
					true ->
						%% 限制为平行转职
						?Career2CareerStage(NewCareer) =:= ?Career2CareerStage(OldCareer);
					_ ->
						false	%% 不同主职业无法转职
				end
		end,
	case Check of
		true ->
			case checkAndDelRechooseItem() of
				true ->try
						   changeCareer(NewCareer)
					   catch
						   _ : Why ->
							   playerMsg:sendErrorCodeMsg(?ErrorCode_CareerChangeConfig),
							   ?ERROR("player[~p] change2[~p], now[~p], why=~p, stack=~p",
								   [playerState:getRoleID(), NewCareer, OldCareer, Why, erlang:get_stacktrace()])
					   end;
				_->
					playerMsg:sendErrorCodeMsg(?ErrorCode_ActExchange_ItemNotEnough)
			end;
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
change(NewCareer) ->
	change(NewCareer, false).
change(NewCareer, false) ->
	case canChange(NewCareer) of
		{true, _} ->
			case consumeItems(NewCareer) of
				{true, _} ->
					try
						changeCareer(NewCareer)
					catch
						_ : Why ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_CareerChangeConfig),
							?ERROR("player[~p] change2[~p], now[~p], why=~p, stack=~p",
								[playerState:getRoleID(), NewCareer, playerState:getCareer(), Why, erlang:get_stacktrace()])
					end;
				{_, Code1} ->
					playerMsg:sendErrorCodeMsg(Code1)
			end;
		{_, Code} ->
			playerMsg:sendErrorCodeMsg(Code)
	end;
change(NewCareer, true) ->
	try
		changeCareer(NewCareer)
	catch
		_ : Why ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CareerChangeConfig),
			?ERROR("player[~p] change2[~p], now[~p], why=~p, stack=~p",
				[playerState:getRoleID(), NewCareer, playerState:getCareer(), Why, erlang:get_stacktrace()])
	end.

%%%-------------------------------------------------------------------
changeCareer(NewCareer) ->
	OldCareer = playerState:getCareer(),
	ok = changeCareerSkill(OldCareer, NewCareer),
	ok = changeCareerProperty(OldCareer, NewCareer),
	ok = changeCareerBase(OldCareer, NewCareer),
	ok = onChangeCareerSuccess(OldCareer, NewCareer),
	catch addCareerAchieve(?Career2CareerStage(NewCareer)),
	catch addCareerChangeLog(OldCareer, NewCareer),
	ok.

addCareerChangeLog(OldCareer, NewCareer)->
	Log = #rec_log_player_changecareer{
		playerID = playerState:getRoleID(),
		'Name' = playerState:getName(),
		accountID = playerState:getAccountID(),
		sex = playerState:getSex(),
		camp = playerState:getCamp(),
		race = playerState:getRace(),
		careerFrom = OldCareer,
		careerTo = NewCareer,
		time = time:getLogTimeSec()
	},
	dbLog:sendSaveLogCareerChange(Log),
	ok.


addCareerAchieve(0)->
	ok;
addCareerAchieve(1)->
	playerAchieve:achieveEvent(?Achieve_changeCareer_1,[1]),
	ok;
addCareerAchieve(2)->
	playerAchieve:achieveEvent(?Achieve_changeCareer_2,[1]),
	ok;
addCareerAchieve(3)->
	playerAchieve:achieveEvent(?Achieve_changeCareer_3,[1]),
	ok;
addCareerAchieve(_)->
	ok.

changeCareerBase(_OldCareer, NewCareer) ->
	playerState:setCareer(NewCareer).

changeCareerSkill(OldCareer, NewCareer) ->
	playerSkillLearn:initSkillChangeCareer(OldCareer, NewCareer),
	ok.
changeCareerProperty(_OldCareer, NewCareer) ->
	Level = playerState:getLevel(),
	playerCalcProp:initBaseProp(Level, NewCareer),
	playerCalcProp:calcBattleProp(),
	ok.

onChangeCareerSuccess(OldCareer, NewCareer) ->
	Now = time:getUTCNowMS(),
	playerSave:savePlayer(Now),

	%% 变更技能前通知转职成功，以便客户端合理匹配职业ID
	Msg = #pk_GS2U_ChangeCarrer{result = true, newCareer = NewCareer},
	playerMsg:sendNetMsg(Msg),

	playerSkillLearn:openWakeSkill(),
	% 增加觉醒技能
	playerSkill:addAwakeSkill(),
	playerSkillLearn:sendSkillSlotInfo(),
	playerSkillLearn:sendSkillSlotSkillInfo2Client(),
	playerSkillLearn:sendSkillInfo2Client(),
	playerSkillLearn:autoUpSkill(playerState:getLevel()),

	playerTask:updateTask(?TaskSubType_CareerChang, ?Career2CareerStage(NewCareer)),
	?INFO("player[~p] changeCareer[~p -> ~p] ok",
		[playerState:getRoleID(), OldCareer, NewCareer]),

	%% 此处包含邮件奖励，可能因超时异常导致后续流程中断，因此将更新任务进度的语句提前
	returnSkillPoint(playerState:getLevel()),
	playerForce:calcPlayerForce(true),
	giveNewCareerGift(NewCareer),
	returnSkillCost(),

	%转职后需要处理转职技能相关
	playerSkillLearn:dealPassiveSkillWhenCareerChange(),

	%% 自动填充技能槽
	playerSkillLearn:autoFillSkill(),
	ok.

giveNewCareerGift(NewCareer) ->
	case getCfg:getCfgByArgs(cfg_player_desc, NewCareer) of
		#player_descCfg{gift = ItemLists} ->
			lists:foreach(
				fun({ItemID, ItemNum}) ->
					PLog = #recPLogTSItem{
						old = 0,
						new = ItemNum,
						change = ItemNum,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_System,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourceVipLevelAward,
						reasonParam = ItemID
					},
					playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, PLog)
				end, ItemLists);
		_ ->
			skip
	end,
	ok.

returnSkillCost()->
	RoleID = playerState:getRoleID(),
	L = playerPropSync:getProp(?SerProp_UpSkill_CostList),
	playerPropSync:setAny(?SerProp_UpSkill_CostList, []),
	Title = stringCfg:getString(career_transfer_email_1),
	Content = stringCfg:getString(career_transfer_email_2),
	lists:foreach(
		fun({MoneyType, MoneyNumber}) ->
			mail:sendMoneySystemMail(
				RoleID
				, Title
				, Content
				, MoneyType
				, MoneyNumber
				, []
			)
		end, L),
	ok.

returnSkillPoint(Level) ->
	NewSkillPoint = calcTotalSkillPoint(0, 1, Level),
	playerPropSync:setInt64(?PriProp_SkillPoint, NewSkillPoint).

calcTotalSkillPoint(SkillPoint, CurLevel, MaxLevel) when CurLevel > MaxLevel ->
	SkillPoint;
calcTotalSkillPoint(SkillPoint, CurLevel, MaxLevel) ->
	New =
		case getCfg:getCfgByArgs(cfg_indexGrowth, CurLevel) of
			#indexGrowthCfg{index62 = V} ->
				V;
			_ ->
				1
		end,
	calcTotalSkillPoint(SkillPoint + New, CurLevel + 1, MaxLevel).


%%%-------------------------------------------------------------------
consumeItems(_) -> {true, 0}.

%%%-------------------------------------------------------------------
canChange(NewCareer) ->
	case checkCareer(NewCareer) of
		{true, _} ->
			checkConfig(NewCareer);
		V ->
			V
	end.

checkConfig(NewCareer) ->
	case getCfg:getCfgByArgs(cfg_player_desc, NewCareer) of
		#player_descCfg{
			zhanli_limit = PlayerForce,
			level_limit = LevelLimit,
			task_need = TaskID,
			item_cost = Items
		} ->
			case checkPlayerForce(PlayerForce) of
				{true, _} ->
					case checkPlayerLevel(LevelLimit) of
						{true, _} ->
							case checkTask(TaskID) of
								{true, _} ->
									checkItem(Items);
								V2 ->
									V2
							end;
						V1 ->
							V1
					end;
				V ->
					V
			end;
		_ ->
			{false, ?ErrorCode_CareerChangeConfig}
	end.

%%%-------------------------------------------------------------------
checkCareer(NewCareer) ->
	Career = playerState:getCareer(),
	MainCareer = ?Career2CareerMain(Career) =:= ?Career2CareerMain(NewCareer),
	SubCareer = ?Career2CareerStage(Career) + 1 =:= ?Career2CareerStage(NewCareer),
	{MainCareer andalso SubCareer, ?ErrorCode_CareerChangeTargetError}.

%%%-------------------------------------------------------------------
checkPlayerForce(Force) ->
	{playerPropSync:getProp(?PriProp_PlayerForce) >= Force, ?ErrorCode_CareerChangeForce}.
checkPlayerLevel(Limit) ->
	{playerState:getLevel() >= Limit, ?ErrorCode_CareerChangeLevel}.

checkTask(0) -> {true, 0};
checkTask(TaskID) -> {playerTask:isAcceptedTaskByID(TaskID), ?ErrorCode_CareerChangeTask}.

checkItem(undefined) -> {true, 0};
checkItem([]) -> {true, 0};
checkItem(_) -> {false, ?ErrorCode_CareerChangeItems}.

checkAndDelRechooseItem()->
	[ItemID, Num] = configRechoosse_career_item(),
	case playerPackage:getGoodsCount(ItemID) >= Num of
		true ->
			PLog = #recPLogTSItem{
				old = 0,
				new = 0,
				change = -1,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemUseReasonPlayer,
				reasonParam = Num
			},
			case playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, Num, PLog) of
				true ->
					true;
				_->
					?ERROR("delRechooseItem  fail  ~p",[ItemID]),
					false
			end;
		_->
			false
	end.

configRechoosse_career_item()->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, rechoose_career_item),
	List.
