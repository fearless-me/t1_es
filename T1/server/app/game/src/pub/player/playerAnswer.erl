%% @author wagnjie
%% @doc @todo 答题玩法


-module(playerAnswer).

-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([answerQuestionInit/0,
	answerResult/4,
	answerResultAck/1,
	getAnswerRewardFirst/2,
	getAnswerRewardLucky/2,
	applyAnswer/0,
	answer_right_addreward/1,
	sendAnswerReward/1,
	answer_applySucc/0
]).

-define(DanceLevel, 15).



-spec applyAnswer() -> ok.
applyAnswer() ->
	case isPlayerLevelCondition() of
		true ->
			RoleID = playerState:getRoleID(),
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{roleName = Name, level = Ll, career = Cr, race = Re, sex = Sx, head = Hd} ->
					% {FromPid, center, Target, MsgID, Msg}
					%csInterface:sendMsg2CenterServer(transit, reqAnwerApply, {self(), center, }),

					gsCsInterface:sendMsg2CenterServer(transit, {self(), center, ?PsNameCSAnswer,
						reqAnwerApply, {RoleID, self(), playerState:getNetPid(), Name, Re, Cr, Sx, Ll, Hd}});
				%%%psMgr:sendMsg2PS(
				%%%	?PsNameCSAnswer,
				%%%	reqAnwerApply,
				%%%	{RoleID,self(), playerState:getNetPid(),Name,Re,Cr,Sx,Ll,Hd}
				%%%);
				_ ->
					skip
			end;
%%			core:sendMsgToActivity(?ActivityType_AnswerPlay, applyAnswer,
%%				{playerState:getRoleID(), self(), playerState:getNetPid()});
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_ApplyDanceFailedPlayerLevel, [?DanceLevel])
	end,

	ok.

answer_applySucc()->
	playerDaily:incDailyCounter(?DailyType_Answer_Count, 0),
	ok.

%%玩家上线获取答题信息
-spec answerQuestionInit() -> ok.
answerQuestionInit() ->
	core:sendMsgToActivity(?ActivityType_AnswerPlay,
		getAnswerInfo,
		{
			playerState:getRoleID(),
			playerState:getNetPid()
		}),
	ok.

%% 玩家答题结果
-spec answerResult(QuestionID :: uint(), IsRight :: boolean(), Answers :: string(), IsVoice :: boolean()) -> ok.
answerResult(0, 0, 0, _) ->
	?ERROR("error answerResult:~s", [playerState:getName()]),
	ok;
answerResult(QuestionID, IsRight, Answers, IsVoice) ->

	case playerState2:getAnswerPid() of
		false ->
			skip;
		PID ->
			psMgr:sendMsg2PS(PID, answerResult, {playerState:getRoleID(),
				playerState:getName(),
				playerState:getLevel(),
				QuestionID,
				IsRight,
				Answers,
				IsVoice,
				playerPropSync:getProp(?PubProp_PlayerFrameID)}),
%%	core:sendMsgToActivity(PID,
%%		answerResult,
%%		{
%%			playerState:getRoleID(),
%%			playerState:getName(),
%%			playerState:getLevel(),
%%			QuestionID,
%%			IsRight,
%%			Answers,
%%			IsVoice
%%		}),
			case IsRight of
				true -> playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_QuanMingDaTi);
				_ -> skip
			end
	end,
	ok.

%% 活动进程处理答题结果
-spec answerResultAck(term()) -> ok.
answerResultAck({0, 0, 0, 0, 0, 0, 0}) ->
	ok;
answerResultAck({True, TrueAnswer, _Answers, TotalExp, TotalCoin, TrueNum, _NewAnswerNum}) ->
	case playerDaily:getDailyCounter(?DailyType_Answer, 0) of
		0 ->
			playerLogAdd:addLogParticipatorInfo(?LogParticipator_PlayerUseAnswer);
		_ ->
			skip
	end,
	playerDaily:incDailyCounter(?DailyType_Answer, 0),
	#indexFunctionCfg{question_exp = Qexp, question_money = Qmoney} = getCfg:getCfgPStack(cfg_indexFunction, playerState:getLevel()),
	if
		True =:= 1 ->
			playerBase:addExp(Qexp, ?ExpSourceAnswerPlay, 0),
			playerMoney:addCoin(?CoinTypeGold, Qmoney,
				#recPLogTSMoney{reason = ?CoinSourceAnswerReward, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AnswerReward});
		True =:= 0 ->
			playerBase:addExp(erlang:round(Qexp / 2), ?ExpSourceAnswerPlay, 0),
			playerMoney:addCoin(?CoinTypeGold, erlang:round(Qmoney / 2),
				#recPLogTSMoney{reason = ?CoinSourceAnswerReward, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AnswerReward});
		true ->
			skip
	end,
	Msg = #pk_GS2U_PlayerAnswerResult{result = True, trueAnswer = TrueAnswer},
	playerMsg:sendNetMsg(Msg),
	Msg1 = #pk_GS2U_PlayerAnswerInfo{trueNum = TrueNum, totalExp = erlang:round(TotalExp), totalCoin = erlang:round(TotalCoin)},
	playerMsg:sendNetMsg(Msg1),
	ok.

%% 抢题王奖励
-spec getAnswerRewardFirst(Exp :: uint(), Coin :: uint()) -> ok.
getAnswerRewardFirst(Exp, Coin) ->
	ItemID = getglobValue(question_gift_n1),
	GemMailTitle = stringCfg:getString(answerReswardFirstTitle),
	GemMailContent = stringCfg:getString(answerReswardFirstContent),
	playerMail:sendGoodsMailTitleAndContent(ItemID, 1, true, 0, GemMailTitle, GemMailContent, ?ItemSourceAnswerReward),
	playerBase:addExp(round(Exp * 3), ?ExpSourceAnswerPlay, 0),
	playerMoney:addCoin(?CoinTypeGold, round(Coin * 3),
		#recPLogTSMoney{reason = ?CoinSourceAnswerReward, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AnswerReward}),
	playerGameNotice:sendSystemChatByECode(?ErrorCode_CnTextAnswerRewardFirst, [round(Exp * 3), round(Coin * 3)]),
	ok.

%% 幸运玩家奖励
-spec getAnswerRewardLucky(Exp :: uint(), Coin :: uint()) -> ok.
getAnswerRewardLucky(Exp, Coin) ->
	playerBase:addExp(round(Exp * 2), ?ExpSourceAnswerPlay, 0),
	playerMoney:addCoin(?CoinTypeGold, round(Coin * 2),
		#recPLogTSMoney{reason = ?CoinSourceAnswerReward, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AnswerReward}),
	playerGameNotice:sendSystemChatByECode(?ErrorCode_CnTextAnswerRewardLucky, [round(Exp * 2), round(Coin * 2)]),
	ok.


answer_right_addreward({RoleID, MoneyType, MoneyNum}) ->
	Answer_Count = playerDaily:getDailyCounter(?DailyType_Answer_Count,0),
	case Answer_Count < quanmin_noreward_starttimes() of
		  true->
			  case playerState:getRoleID() of
					RoleID ->
						playerAchieve:achieveEvent(?Achieve_AnswerQuistion, [1]),
						playerMoney:addCoin(
							MoneyType
							, erlang:trunc(MoneyNum)
							, #recPLogTSMoney{
								reason = ?ItemSourceLuckDraw,
								param = [],
								target = ?PLogTS_PlayerSelf,
								source = ?PLogTS_PlayerSelf
							});
					RID ->
						?ERROR("answer__addreward self=~p, role=~p, correct=~p", [RID, RoleID, MoneyType])
				end;
		   _->
				skip
	end.

sendAnswerReward({RoleID, RewardID, Rank}) ->

	playerLogAdd:addLogParticipatorInfo(?LogParticipator_CompletePeopleAnswer),
	playerState2:putAnswerPid(0),
	case playerMail:createMailGoods(RewardID, 1, true, 0, RoleID, ?ItemSourceLuckDraw) of
		[#recMailItem{} | _] = MailItemList ->
			Content = stringCfg:getString(allplayerquestion_mail_2, [Rank]),
			Title = stringCfg:getString(allplayerquestion_mail_1),

			mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
		_ ->
			?ERROR("settle_Reward RewardID(~p)", [RewardID])
	end,
	ok.
%% ====================================================================
%% Internal functions
%% ====================================================================
getglobValue(Key) ->
	case getCfg:getCfgPStack(cfg_globalsetup, Key) of
		#globalsetupCfg{setpara = [Para]} ->
			Para;
		[] ->
			undefined
	end.


isPlayerLevelCondition() ->
	case getCfg:getCfgPStack(cfg_globalsetup, allplayerquestion_lv) of
		#globalsetupCfg{setpara = [Para]} ->
			playerState:getLevel() >= Para;
		_->
			false
	end.
%%答题次数奖励限制
quanmin_noreward_starttimes() ->
	#globalsetupCfg{setpara = [Para]} =
		getCfg:getCfgPStack(cfg_globalsetup, quanmin_noreward_starttimes),
	Para.
