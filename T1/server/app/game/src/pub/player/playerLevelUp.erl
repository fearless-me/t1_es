%% @author Administrator
%% @doc 升到某一等级时，升级需要处理的一些事情.


-module(playerLevelUp).

-include("playerPrivate.hrl").

-define(MountFoodNum, 20).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	onFirstLoginEachLevel/1,
	onLevelUp/2
]).

%% 登录时处理
onFirstLoginEachLevel(Levels) ->
	%每升一级都要处理下   （登录有礼）登录时，升级时
	RoleID = playerState:getRoleID(),

	Fun =
		fun(Level) ->
			%% 升级需要处理的一些事情
			psMgr:sendMsg2PS(self(), checkLoginAward, {RoleID, playerState:getAwardTakens(), Level}),

			playerSignIn:onFirstLoginEachLevel(Level),
			playerHolidayTask:onFirstLoginEachLevel(Level),

			skip
		end,
	lists:foreach(Fun, Levels),
	%%中途升级，看能参加BOSS战活动不
	playerWorldBossWar:onLoginRoleCanIn(),
	ok.


%% 游戏中升级时
onLevelUp(OldLevel, NewLevel) ->
	%%自动升级可升级的技能
	lists:foreach(
		fun(Lv) ->
			playerSideTask:onLevelUp(Lv),
			playerSkillLearn:addSkillPointLevelUp(Lv)
		end, lists:seq(OldLevel + 1, NewLevel)),
	playerSkillLearn:autoUpSkill(NewLevel),
	playerSkillLearn:onRoleLevelUpBaseComboSkill(NewLevel),
	saveUnlockNewRace(NewLevel),
%%	playerWing:needInitWingLevel(NewLevel),
	%% 玩家升级检测是否可以领取环任务引导任务
	playerLoopTask:onLevelUp(),
	%%更新成就进度
	%%中途升级，看能参加BOSS战活动不
	playerWorldBossWar:onLoginRoleCanIn(),
	%%playerAchieve:achieveEvent(?Achieve_Level, [NewLevel - OldLevel]),
	playerAchieve:setAchieveEevent(?Achieve_Level,NewLevel),

	playerAchieve:setAchieveEevent(?Achieve_Floating_Level, NewLevel),
	%% mainMenu开关回调
	playerBase:initExpLimit(),
	playerMainMenu:onFuncIsOpenByMainMenu(?MainMenuType_Level, NewLevel, OldLevel),
	%% 刷新装备重铸属性
	playerEquipRecast:equipRecastInitFresh(NewLevel),
	%% 刷新资源相关等级
	playerFindRes:getLastLevel(),
	%% 检查预充值奖励
	AccountID = playerState:getAccountID(),
	case rechargeBackInter:can_check(AccountID) of
		true ->
			psMgr:cast(?PsNameRechargeBackOtp, check_account_recharge_back,
				{AccountID, playerState:getRoleID(), NewLevel});
		_ ->
			skip
	end,
	% 升级时 判断一下是否有新的自动激活的转职被动技能
	playerSkillLearn:initCareerPassiveSkill(),

	%% 触发直购礼包条件更新
	playerDeadlineGift:updateCondition(?DeadlineGift_Update_WhenLevelUP, NewLevel),
	ok.


%% ====================================================================
%% Internal functions
%% ====================================================================
saveUnlockNewRace(NewLevel) ->
	Lv = getUnLockNewRaceLevel(),
	case NewLevel =:= Lv of
		true ->
			gsSendMsg:sendMsg2DBServer(unlockNewRace, playerState:getAccountID(), {playerState:getAccountID(), 1});
		_ ->
			skip
	end.

getUnLockNewRaceLevel() ->
	case getCfg:getCfgByKey(cfg_globalsetup, unlocknewrace_level) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			70
	end.