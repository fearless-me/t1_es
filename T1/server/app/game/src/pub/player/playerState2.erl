%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% playerState太大了，再写一个
%%% @end
%%% Created : 23. 九月 2016 10:34
%%%-------------------------------------------------------------------
-module(playerState2).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-compile(export_all).

getPlayerDataElement(Index) ->
    case getPlayerData() of
        #rec_playerdata{} = Data ->
            erlang:element(Index, Data);
        undefined ->
            undefined
    end.

setPlayerDataElement(Index, Value) ->
    case getPlayerData() of
        #rec_playerdata{} = Data ->
            NewData = erlang:setelement(Index, Data, Value),
            setPlayerData(NewData);
        undefined ->
            ?ERROR("set element:~p,~p,~p", [playerState:getRoleID(), Index, Value]),
            undefined
    end.

%% 设置获取玩家数据库 ets:ets_rec_playerdata  rec:rec_playerdata
-spec setPlayerData(#rec_playerdata{}) -> undefined | #rec_playerdata{}.
setPlayerData(#rec_playerdata{} = Data) ->
    put(rec_playerdata, Data).

-spec getPlayerData() -> undefined | #rec_playerdata{}.
getPlayerData() ->
    get(rec_playerdata).

%% 能否增加同步人数
-spec canAddLookPlayer() -> boolean().
canAddLookPlayer() ->
	canAddLookPlayer(playerState:getPlayerCode()).
-spec canAddLookPlayer(Code::uint64()) -> boolean().
canAddLookPlayer(Code) ->
	Number = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_ClientVar_ScreenPlayerNumber),	% 这个值为客户端自行设置
	LimitNumber = erlang:max(Number, 1),
	playerScreen:getLookPlayerNumber(Code) < LimitNumber.

canFreshScreen() ->
	NowTime = time2:getTimestampSec(),
	LastTime = getFreshScreenTime(),
	case NowTime - LastTime > 10 of
		true ->
			setFreshScreenTime(NowTime),
			true;
		_ -> false
	end.
setFreshScreenTime(Time) ->
	put('FreshScreenTime', Time).
getFreshScreenTime() ->
	case get('FreshScreenTime') of
		undefined -> 0;
		Time -> Time
	end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 身份证系统 begin

%% 照片上传下载任务缓存
setIdentityUporDownLoadTaskInfo(TaskInfo) ->
    put(identity_UpOrDwonLoadTaskOutTime, TaskInfo).
getIdentityUporDownLoadTaskInfo() ->
    get(identity_UpOrDwonLoadTaskOutTime).

%% 身份证系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版好友系统 begin

%% 添加好友间隔时间
setFriend2CD(Key) ->
	put({'Friend2CD', Key}, time:getSyncTimeFromDBS()).
getFriend2CD(Key) ->
	case get({'Friend2CD', Key}) of
		undefined ->
			true;
		Time ->
			#globalsetupCfg{setpara = [CD]} =
				getCfg:getCfgPStack(cfg_globalsetup, friend2_add_cd),
			case Time + CD - time:getSyncTimeFromDBS() of
				Sec when Sec > 0 ->
					case (Sec + 1) rem 60 > 0 of
						true ->
							(Sec + 1) div 60 + 1;
						_ ->
							(Sec + 1) div 60
					end;
				_ ->
					true
			end
	end.

%% 添加跨服好友间隔时间
setFriend2CDCross(Key) ->
	put({'Friend2CDCross', Key}, time:getSyncTimeFromDBS()).
getFriend2CDCross(Key) ->
	case get({'Friend2CDCross', Key}) of
		undefined ->
			true;
		Time ->
			#globalsetupCfg{setpara = [CD]} =
				getCfg:getCfgPStack(cfg_globalsetup, friends_crossapplycd),
			case Time + CD - time:getSyncTimeFromDBS() of
				Sec when Sec > 0 ->
					case (Sec + 1) rem 60 > 0 of
						true ->
							(Sec + 1) div 60 + 1;
						_ ->
							(Sec + 1) div 60
					end;
				_ ->
					true
			end
	end.

%% 最后查询的页码记录
setFriend2PageApp(Page) ->
    put('Friend2PageApp', Page).
getFriend2PageApp() ->
    case get('Friend2PageApp') of
        undefined -> 0;
        Page -> Page
    end.
setFriend2PageTemp(Page) ->
    put('Friend2PageTemp', Page).
getFriend2PageTemp() ->
    case get('Friend2PageTemp') of
        undefined -> 0;
        Page -> Page
    end.
setFriend2PageFormal(Page) ->
    put('Friend2PageFormal', Page).
getFriend2PageFormal() ->
    case get('Friend2PageFormal') of
        undefined -> 0;
        Page -> Page
    end.
setFriend2PageBlack(Page) ->
    put('Friend2PageBlack', Page).
getFriend2PageBlack() ->
    case get('Friend2PageBlack') of
        undefined -> 0;
        Page -> Page
    end.

%% 语音传输任务缓存
setFriend2VoiceCache(ListCache) ->
    put('Friend2VoiceCache', ListCache).
getFriend2VoiceCache() ->
    case get('Friend2VoiceCache') of
        undefined ->
            [];
        ListCache ->
            ListCache
    end.

%% 黑名单满时拉黑好友，缓存好友ID，等待解除好友关系成功后再执行拉黑
setFriend2WantBanFormal(ListCache) ->
    put('Friend2WantBanFormal', ListCache).
getFriend2WantBanFormal() ->
    case get('Friend2WantBanFormal') of
        undefined ->
            [];
        ListCache ->
            ListCache
    end.

%% 缓存未使用的在线角色ID以支持推荐好友功能
setFriend2OnlineListRoleID(List) ->
    put('Friend2OnlineListRoleID', List).
getFriend2OnlineListRoleID() ->
    case get('Friend2OnlineListRoleID') of
        undefined ->
            [];
        L ->
            L
    end.

%% 缓存未使用的在线角色ID以支持推荐好友功能（仅限根据距离筛选时使用）
setFriend2OnlineListRoleIDNear(List) ->
    put('Friend2OnlineListRoleIDNear', List).
getFriend2OnlineListRoleIDNear() ->
    case get('Friend2OnlineListRoleIDNear') of
        undefined ->
            [];
        L ->
            L
    end.

%% 新版好友系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 七日目标
%% 上线初始化之前条件更新不发送消息
setSevenDayAimIsInit(Is) ->
    put('SevenDayAimIsInit', Is).
getSevenDayAimIsInit() ->
    case get('SevenDayAimIsInit') of
        undefined ->
            false;
        Is ->
            Is
    end.
%%%-------------------------------------------------------------------
%% 直购礼包 玩家最新礼包信息
setDeadlineGiftState(State) ->
	put('DeadlineGiftState', State).
getDeadlineGiftState() ->
	case get('DeadlineGiftState') of
		undefined ->
			[];
		State ->
			State
	end.
%%%-------------------------------------------------------------------

%%%-------------------------------------------------------------------
% 跨服报名缓存
setCrossApply(0) ->
	erase(crossApply);
setCrossApply(#recCrossApply{} = Apply) ->
	put(crossApply, Apply).
getCrossApply() ->
	get(crossApply).

%%%-------------------------------------------------------------------
% 骑宠竞速，司机报名后来了乘客，需要重新报名，这里记录下取消报名的报名组ID，收到取消报名的反馈后再执行报名
setRaceCrossApplyID(ID) ->
	put(raceCrossApplyID, ID).
getRaceCrossApplyID() ->
	get(raceCrossApplyID).

%%%-------------------------------------------------------------------
% 临时存储竞技场挑战目标列表
setArenaTargetList(List) ->
	put(arenaTargetList, List).
getArenaTargetList() ->
	get(arenaTargetList).

%%%-------------------------------------------------------------------
% 种植区下次需要刷新时间
setHomePlantRefreshTime(Time) ->
	put(homePlantRefreshTime, Time).
getHomePlantRefreshTime() ->
	case get(homePlantRefreshTime) of
		undefined ->
			0;
		Time ->
			Time
	end.

% 家园升级下次需要刷新时间
setHomeUpgradeRefreshTime(Time) ->
	put(homeUpgradeRefreshTime, Time).
getHomeUpgradeRefreshTime() ->
	case get(homeUpgradeRefreshTime) of
		undefined ->
			0;
		Time ->
			Time
	end.
%%%-------------------------------------------------------------------
% 环任务刷新相关按钮CD
setLoopTaskRefreshTime() ->
	put(refreshTime, time:getSyncTimeFromDBS()).
getLoopTaskRefreshCoolDown() ->
	case get(refreshTime) of
		undefined ->
			true;
		TimeLast ->
			TimeNow = time:getSyncTimeFromDBS(),
			TimeNow - TimeLast >= 2	%% 固定2s
	end.

%%%-------------------------------------------------------------------
% 经验环任务缓存随机任务ID
listExpTaskID() ->
	[#recKV{v = V}] = ets:lookup(listExpTaskID, misc:rand(0, 7)),
	V.

%%%-------------------------------------------------------------------
% 家族环任务缓存随机任务ID
listLoopTaskID() ->
	[#recKV{v = V}] = ets:lookup(listLoopTaskID, misc:rand(0, 7)),
	V.
%%listLoopTaskID() ->
%%	listLoopTaskID(get(listLoopTaskID)).
%%listLoopTaskID(undefined) ->
%%	listLoopTaskID({0, []});
%%listLoopTaskID({20, _}) ->
%%	listLoopTaskID({0, []});
%%listLoopTaskID({0, _}) ->
%%	L0 = getCfg:get1KeyList(cfg_task),
%%	L1 = [getCfg:getCfgByKey(cfg_task, Key) || Key <- L0],
%%	L2 = [Key || #taskCfg{id = Key, type = Type} <- L1, Type =:= ?TaskMainType_EveryDay],
%%	L3 = misc:shuffle(L2),
%%	put(listLoopTaskID, {1, L3}),
%%	L3;
%%listLoopTaskID({Count, L}) ->
%%	put(listLoopTaskID, {Count + 1, L}),
%%	L.

%%%-------------------------------------------------------------------
%% 跨服返回间隔
%% 活动、副本完成后，有次主动返回的请求，此时可能带有返回数据
%% 其它异常情况将角色踢回，此时多半没有返回数据
%% 两个请求可能几乎同时触发，导致普通服数据覆盖
%% 因此在跨服角色即将返回时（跨服上的角色进程）和普通服迎接角色返回时（普通服角色管理进程）做CD限制，排除短时间内的频繁请求造成的异常
-spec canBackFromCross(RoleID::uint64()) -> boolean().
canBackFromCross(RoleID) ->
	case get({canBackFromCross, RoleID}) of
		undefined ->
			put({canBackFromCross, RoleID}, time:getSyncTimeFromDBS()),
			true;
		TimeLast ->
			case time:getSyncTimeFromDBS() - TimeLast >= 3 of
				true ->
					put({canBackFromCross, RoleID}, time:getSyncTimeFromDBS()),
					true;
				_ ->
					false
			end
	end.

%%%-------------------------------------------------------------------
% lbs内存数据
setLBS(NeedUpdate, Lat, Lng) ->
	put(lbs, {NeedUpdate, Lat, Lng}).
getLBS() ->
	case get(lbs) of
		undefined ->
			{false, 999.0, 999.0};	%% 超出取值范围的无效值，表示不参与计算
		V ->
			V
	end.

addCrossAliveCancelBuff(BuffID) ->
	put('CrossAliveCancelBuff', BuffID).
getCrossAliveCancelBuff() ->
	get('CrossAliveCancelBuff').
delCrossAliveCancelBuff() ->
	erlang:erase('CrossAliveCancelBuff').

putAnswerPid(0) ->
	erase(answerPid);
putAnswerPid(AnserPid)->
	put(answerPid, AnserPid).

getAnswerPid() ->
	case get(answerPid) of
		undefined ->
			false;
		Pid->
			Pid
	end.

getCacheMailIDList() ->
	case get('CacheMailIDList') of
		undefined -> [];
		L -> L
	end.
setCacheMailIDList(List) ->
	put('CacheMailIDList', List),
	List.
addCacheMailID(MailID) ->
	L = getCacheMailIDList(),
	case lists:member(MailID, L) of
		true -> false;
		_ ->
			setCacheMailIDList([MailID | L]),
			true
	end.
%%%-------------------------------------------------------------------
%% 生活技能-钓鱼
%% 统计时长用自增计数
lifeSkill_fish_count() ->
	case get(lifeSkill_fish_count) of
		undefined ->
			0;
		Count ->
			Count
	end.
lifeSkill_fish_count(Count) ->
	put(lifeSkill_fish_count, Count).

%%%-------------------------------------------------------------------
%% 跨服时需要延时添加的Buff
crossDelayAddBuff() ->
	case get(crossDelayAddBuff) of
		undefined ->
			[];
		L ->
			L
	end.
crossDelayAddBuff(L) ->
	put(crossDelayAddBuff, L).

%%%-------------------------------------------------------------------
%% 暂存杀戮模式，用于活动结束或退出活动后切换回原本的杀戮模式
pkModeCache() ->
	case get(pkModeCache) of
		undefined ->
			?PlayerPeaceStatus;	%% 默认和平
		PK ->
			PK
	end.
pkModeCache(PK) ->
	put(pkModeCache, PK).

%%%-------------------------------------------------------------------
%% 暂存广播消息，进入地图后要正确发放给客户端
buffInfoCache() ->
	case put(buffInfoCache, []) of
		undefined ->
			[];
		L ->
			L
	end.
buffInfoCache(Info) ->
	put(buffInfoCache, [Info | buffInfoCache()]).

%%%-------------------------------------------------------------------
%% 集字活动后台开关
%% 如果在普通服，直接取开关变量，如果不在普通服，取进程字典
isOpenCollectionWords() ->
	case core:isCross() of
		true ->
			case get(isOpenCollectionWords) of
				undefined ->
					false;
				B ->
					B
			end;
		_ ->
			variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_CollectionWords)
	end.
isOpenCollectionWords(B) ->
	put(isOpenCollectionWords, B).

%%%-------------------------------------------------------------------
%% 集字活动运算开关
%% 将开关缓存于进程字典，优化运算
%% 跨服上的开关由普通服带入，由时间或回来时刷新，不受GM后台影响（因为跨服可能有开着和关着的角色同时进入）
isOpenCollectionWords2() ->
	case get(isOpenCollectionWords2) of
		undefined ->
			B = playerDrop:isOpen(),
			put(isOpenCollectionWords2, B),
			B;
		B ->
			B
	end.
isOpenCollectionWords2(B) ->
	put(isOpenCollectionWords2, B).

%%%-------------------------------------------------------------------
%% 是否可以保存永不停歇到数据库
%% 主要以下线保存的数据为主，设置10分钟间隔是为了防止意外情况数据丢失过多
canSaveYBTX2DB() ->
	TimeNow = time:getSyncTimeFromDBS(),
	TimeOld =
		case put(canSaveYBTX2DB, TimeNow) of
			undefined ->
				time:getSyncTimeFromDBS();
			TO ->
				TO
		end,
	TimeNow - 600 >= TimeOld.	%% 10分钟内不可重复保存

%%%-------------------------------------------------------------------
%% 追查骑宠竞速问题的日志开关
-spec isTestLogForRace() -> boolean().
isTestLogForRace() ->
	case get(isTestLogForRace) of
		undefined ->
			false;
		B ->
			B
	end.
-spec isTestLogForRace(boolean()) -> no_return().
isTestLogForRace(B) ->
	put(isTestLogForRace, B).

%%%-------------------------------------------------------------------
%% 情缘任务中召唤功能CD，仅召唤者（队长）有效
-spec marriageTask_together_getCD() -> uint().
marriageTask_together_getCD() ->
	#globalsetupCfg{setpara = [Sec]} =
		getCfg:getCfgPStack(cfg_globalsetup, marriage_task_beckon_cd),
	Diff =
		case get(marriage_task_beckon_cd) of
			undefined ->
				Sec;
			V ->
				time:getSyncTimeFromDBS() - V
		end,
	erlang:max(Sec - Diff, 0).
-spec marriageTask_together_setCD() -> no_return().
marriageTask_together_setCD() ->
	put(marriage_task_beckon_cd, time:getSyncTimeFromDBS()).

%%%-------------------------------------------------------------------
%% 情缘任务中召唤功能操作时效，召唤者和被召唤者通用
-spec marriageTask_together_timeout() -> boolean().
marriageTask_together_timeout() ->
	case get(marriageTask_together_timeout) of
		undefined ->
			true;
		Last ->
			#globalsetupCfg{setpara = [Sec]} =
				getCfg:getCfgPStack(cfg_globalsetup, marriage_tas_cancel_time),
			time:getSyncTimeFromDBS() - Last >= Sec
	end.
-spec marriageTask_together_timeout(uint32()) -> no_return().
marriageTask_together_timeout(Time) ->
	put(marriageTask_together_timeout, Time).

%%%-------------------------------------------------------------------
%% 情缘任务中召唤功能，被召唤者缓存召唤者信息
-spec marriageTask_together_target() -> term().
marriageTask_together_target() ->
	get(marriageTask_together_target).
-spec marriageTask_together_target(term()) -> no_return().
marriageTask_together_target(Term) ->
	put(marriageTask_together_target, Term).

addUseGatherBattlePointSerial() ->
	V = getUseGatherBattlePointSerial(),
	setUseGatherBattlePointSerial(V + 1).
setUseGatherBattlePointSerial(V) ->
	put('UseGatherBattlePointSerial', V),
	V.
getUseGatherBattlePointSerial() ->
	case get('UseGatherBattlePointSerial') of
		undefined -> 0;
		V -> V
	end.
isEqualUseGatherBattlePointSerial(V) ->
	getUseGatherBattlePointSerial() =:= V.

%%%-------------------------------------------------------------------
%% 本次死亡是否允许自动复活？
-spec autoRevive() -> boolean().
autoRevive() ->
	case get(autoRevive) of
		undefined ->
			false;
		B ->
			B
	end.
-spec autoRevive(B::boolean()) -> no_return().
autoRevive(B) ->
	put(autoRevive, B).

setIsHasAruna(B) ->
	put(pd_isHasAruna, B).

getIsHasAruna() ->
	case get(pd_isHasAruna) of
		undefined ->
			false;
		B ->
			B
	end.

getIsHasRoleAwake() ->
	case get(pd_isHasRoleAwake) of
		undefined ->
			false;
		B ->
			B
	end.

setIsHasRoleAwake(B) ->
	put(pd_isHasRoleAwake, B).

getIsCareerPass() ->
	case get(pd_isHasCareerPass) of
		undefined ->
			false;
		B ->
			B
	end.

setIsCareerPass(B) ->
	put(pd_isHasCareerPass, B).

setWorldBossMapInfo(B) ->
	put(pd_WorldBossMapInfo, B).

getWorldBossMapInfo() ->
	case get(pd_WorldBossMapInfo) of
		undefined ->
			{0, 0, 0, 0, 0};
		B ->
			B
	end.

setCurFsValidID(B) ->
	put(pd_CurFsValidID, B).

getCurFsValidID() ->
	case get(pd_CurFsValidID) of
		undefined ->
			{0, 0};
		B ->
			B
	end.


setMonsterBookProp(B) ->
	put(pd_MonsterBookProp, B).

getMonsterBookProp() ->
	case get(pd_MonsterBookProp) of
		undefined ->
			[];
		B ->
			B
	end.

setCurEnterFsParam(B) ->
	put(pd_CurEnterFsParam, B).

getCurEnterFsParam() ->
	case get(pd_CurEnterFsParam) of
		undefined ->
			0;
		B ->
			B
	end.

%% 在跨服上，保存来源服的DBID
setScrServerID(SrcServerID) ->
	put('ScrServerID', SrcServerID).
getScrServerID() ->
	get('ScrServerID').

%% 仅一个地方调用，不允许随便调用
setServerBattleState() ->
	put('ServerBattleState', true).
getServerBattleState() ->
	get('ServerBattleState').

getServerBattleStateGuildID() ->
	case getServerBattleState() of
		true ->
			getScrServerID();
		_ ->
			playerState:getGuildID()
	end.

getCareerPassiveSkill() ->
	case get(pd_careerPassiveSkill) of
		undefined ->
			{0,0};
		B ->
			B
	end.

setCareerPassiveSkill(B) ->
	put(pd_careerPassiveSkill, B).

setWorldMaxLevel(Max) ->
	put('WorldMaxLevel', Max).
getWorldMaxLevel() ->
	case get('WorldMaxLevel') of
		undefined -> 1;
		V -> V
	end.

%%圣物附加技能
putRuneSkillProp(SkilID,Level) ->
	CurLevel = getRuneSkillProp(SkilID),
	put({'runeAddSkillLevel', SkilID}, CurLevel+Level),
	Level.

getRuneSkillProp(SkilID) ->
	case get({'runeAddSkillLevel', SkilID}) of
		undefined ->0;
		V->
			V
	end.

%%%-------------------------------------------------------------------
%% 从普通服登录的时候设置一个标记，用于首次成功进入场景后记录日志
loginNormal(B) ->
	put(loginNormal, B).
loginNormal() ->
	case get(loginNormal) of
		undefined ->
			false;
		B ->
			B
	end.


%%圣物熔炼存一个零时结果
getRuneMelt()->
	get(runeMelt).
putRuneMelt(Result)->
	put(runeMelt, Result).


%%家园BOSS相关
setBitHomeCardUid(UID)->
	put(bitHomeCardUid, UID).
getBitHomeCardUid()->
	get(bitHomeCardUid).
%%家园BOSS相关


%%%-------------------------------------------------------------------
%% 骑宠竞速报名状态
raceApply(0) ->
	erase(raceApply);
raceApply(undefined) ->
	erase(raceApply);
raceApply(#recRaceApply{} = Apply) ->
	put(raceApply, Apply).
raceApply() ->
	get(raceApply).

%%%-------------------------------------------------------------------
%% 骑宠竞速角色进程缓存活动状态，用于角色进程优先判断条件
raceRule(#recRaceRule{} = RaceRule) ->
	put(raceRule, RaceRule).
raceRule() ->
	case get(raceRule) of
		undefined ->
			%% 未初始化时反馈空结构
			#recRaceRule{};
		RaceRule ->
			RaceRule
	end.

%%%-------------------------------------------------------------------
%% 骑宠竞速邀请用Ets，不包括自己当前所在地图
-spec raceListEtsPlayer() -> list().
raceListEtsPlayer() ->
	case get(raceListEtsPlayer) of
		undefined ->
			[];
		List ->
			List
	end.
-spec raceListEtsPlayer(list()) -> no_return().
raceListEtsPlayer(ListEtsPlayer) ->
	ListEtsPlayerReal = lists:delete(playerState:getMapPlayerEts(), ListEtsPlayer),
	put(raceListEtsPlayer, ListEtsPlayerReal),
	ok.

%%%-------------------------------------------------------------------
%% 骑宠竞速多用途时间戳缓存
-spec raceTimeStamp(Type::term()) -> uint32().
raceTimeStamp(Type) ->
	case get({raceTimeStamp, Type}) of
		undefined ->
			0;
		Time ->
			Time
	end.
-spec raceTimeStamp(Type::term(), Time::uint32()) -> no_return().
raceTimeStamp(Type, Time) ->
	put({raceTimeStamp, Type}, Time).

%%%-------------------------------------------------------------------
%% 骑宠竞速缓存伙伴信息，用于快速计算
-spec racePartner() -> term().  %% #recRacePartner{} | undefined.
racePartner() ->
	get(racePartner).
-spec racePartner(term()) -> no_return().   %% #recRacePartner{}.
racePartner(0) ->
	erase(racePartner),
	ok;
racePartner(RacePartner) ->
	put(racePartner, RacePartner),
	ok.

%%%-------------------------------------------------------------------
%% 骑宠竞速缓存可邀请列表，避免频繁生成造成的性能问题
-spec raceListCanBeInvite() -> [#pk_RaceCanBeInvite{}, ...].
raceListCanBeInvite() ->
	case get(raceListCanBeInvite) of
		undefined ->
			[];
		L ->
			L
	end.
-spec raceListCanBeInvite([#pk_RaceCanBeInvite{}, ...]) -> no_return().
raceListCanBeInvite(L) ->
	put(raceListCanBeInvite, L),
	ok.

%%%-------------------------------------------------------------------
%% 骑宠竞速缓存被邀请信息
-spec raceBeInviteInfo() ->
	{FromRoleID::uint64(), FromGuildID::uint64(), PetID::uint16(), TimeOut::uint32()} | undefined.
raceBeInviteInfo() ->
	get(raceBeInviteInfo).
-spec raceBeInviteInfo(
	{FromRoleID::uint64(), FromGuildID::uint64(), PetID::uint16(), TimeOut::uint32()}
) ->
	no_return().
raceBeInviteInfo(0) ->
	erase(raceBeInviteInfo),
	ok;
raceBeInviteInfo(BeInviteInfo) ->
	put(raceBeInviteInfo, BeInviteInfo),
	ok.

%%%-------------------------------------------------------------------
%% 骑宠竞速缓存正在邀请的信息，便于反馈时处理
-spec raceInviting() -> #pk_RaceCanBeInvite{}.
raceInviting() ->
	get(raceInviting).
-spec raceInviting(#pk_RaceCanBeInvite{}) -> no_return().
raceInviting(0) ->
	erase(raceInviting),
	ok;
raceInviting(CanBeInvite) ->
	put(raceInviting, CanBeInvite),
	ok.





