
%% 首领入侵（又叫世界BOSS）
-module(playerWorldBossWar).
-include("playerPrivate.hrl").
%%
%%%%%% ====================================================================
%%%%%% API functions
%%%%%% ====================================================================
%%-export([
%%	noticeClient/1,
%%	onLoginRoleCanIn/0,
%%	tickSecond/0,
%%	activityFlagSync/1,
%%	onEnterMap/1,
%%	peopleSetAwardGetTime/2
%%]).
%%%% 同步tick，只有这里用
%%-define(WorldBossSyncTick, 5).
%%
%%
%%onEnterMap(MapID)->
%%	Phase = activityMgrOtp:getActivityPhase(?ActivityType_GiveIPad),
%%	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
%%		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeWorldBoss} when Phase =/= ?ActivityPhase_Close ->
%%
%%			playerLogAdd:addLogParticipatorInfo(?LogParticipator_Chiefinvasion),
%%			%% 返回场景，添加原层数的鼓舞BUFF
%%			N1 = playerDaily:getDailyCounter(?DailyType_WorldBossInSpire, ?CoinUseTypeGold),
%%			N2 = playerDaily:getDailyCounter(?DailyType_WorldBossInSpire, ?CoinUseTypeDiamond),
%%			case N1 + N2 of
%%				0 -> skip;
%%				N ->
%%					L = lists:seq(1, N),
%%					[playerBuff:addBuff(?WoldBossInspire, playerState:getLevel()) || _ <- L]
%%			end,
%%			% 进入地图时设置 boss奖励剩余领取次数信息{bossID, 个人领取剩余次数，公会剩余领取次数， 时间版本}
%%			NowTime = time:getSyncTime1970FromDBS(),
%%			{{Year, Month, Day}, _SecTuple} = time:convertSec2DateTime(NowTime),
%%			% DayVersion 用于标识当前年月日得出来的唯一值 可以有下面几种求法 考虑效率简便 用最后一种
%%			% DayVersion = {Year, Month, Day},
%%			% DayVersion = time:convertDateTime1970ToSec({{Year, Month, Day}, {0, 0, 0}}),
%%			DayVersion = Year * 10000 + Month * 100 + Day,
%%			CurGuildID = playerState:getGuildID(),
%%			playerState2:setWorldBossMapInfo({0, 0, 0, DayVersion, CurGuildID}),
%%			skip;
%%		_ ->
%%			%% 离开场景删除鼓舞BUFF
%%			playerBuff:delBuff(?WoldBossInspire)
%%	end,
%%	ok.
%%
%%%%新登录玩家自检
%%onLoginRoleCanIn() ->
%%	Flag = openFlag(),
%%	noticeClient(Flag),
%%	ok.
%%
%%activityFlagSync(Flag) ->
%%	noticeClient(Flag),
%%	case Flag of
%%		0 ->
%%			doTickSecond(true),
%%			playerBuff:delBuff(?WoldBossInspire);
%%		_ ->
%%			skip
%%	end.
%%
%%noticeClient(Flag) ->
%%	#mapsettingCfg{playerEnter_MinLevel = MinLevel} = getCfg:getCfgPStack(cfg_mapsetting, ?WorldBossMapID),
%%	noticeClient(playerState:getLevel(), Flag, MinLevel).
%%
%%%%告诉玩家客户端，可以参加boss战
%%noticeClient(Level, Flag, MinLevel) when Level >= MinLevel->
%%	Msg = #pk_GS2U_BossBattleState{
%%		flag = Flag,
%%		mapID = ?WorldBossMapID
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	?DEBUG("noticeClient==Msg=======~w", [Msg]),
%%	ok;
%%noticeClient(_Level, _Flag, _MinLevel) ->
%%	skip.
%%
%%tickSecond() ->
%%	doTickSecond(false).
%%
%%doTickSecond(Force) ->
%%	case playerState:getMapID() of
%%		?WorldBossMapID ->
%%			Flag = openFlag(),
%%			Sync = canSync(Force),
%%			doSync(Flag, Sync);
%%		_ ->
%%			skip
%%	end.
%%
%%doSync(Flag, Sync) when Flag =:= 1 orelse Sync ->
%%	Me = playerState:getRoleID(),
%%	{CurBossID, CPLeftTime, CGLeftTime} = getLeftTimeInfo(),
%%	Damage =
%%		case myEts:readRecord(?WorldBossDamageEts, Me) of
%%			#recWorldBossDamage{damage = V, pLeftTime = CPLeftTime}->
%%				V;
%%			#recWorldBossDamage{damage = V} = OldR ->
%%				NewR = OldR#recWorldBossDamage{pLeftTime = CPLeftTime},
%%				myEts:insertEts(?WorldBossDamageEts, NewR),
%%				V;
%%			_ ->
%%				0
%%		end,
%%	Msg = #pk_UpdataHurtToBoss{
%%		hurt = Damage
%%	},
%%
%%	playerMsg:sendNetMsg(Msg),
%%
%%	L1 =
%%		case myEts:readRecord(?WorldBossTopEts, ?WorldBossKey) of
%%			#recWorldBossDamageTop{list = TL} ->
%%				TL;
%%			_ ->
%%				[]
%%		end,
%%
%%	L3 = [#pk_BossRankInfo{name = getName(RoleID), hurt = Damage1} || #recWorldBossDamage{roleID = RoleID, damage = Damage1} <- L1],
%%	NPos = mePos(Me, L1, 1),
%%
%%	LguildHurtlist =  acWorldBossLogic:sortGuildHurt(),
%%
%%	case ets:lookup(rec_guild_member, Me) of
%%		[#rec_guild_member{guildID = GuildID}] ->
%%			GuildDamage =
%%				case myEts:readRecord(?WorldBossGuilDDamage, GuildID) of
%%					#recWorldBossGuilDamage{damage = V1, gLeftTime = CGLeftTime} ->
%%						V1;
%%					#recWorldBossGuilDamage{damage = V1} = OldG ->
%%						NewG = OldG#recWorldBossGuilDamage{gLeftTime = CGLeftTime},
%%						myEts:insertEts(?WorldBossGuilDDamage, NewG),
%%						V1;
%%					_ ->
%%						0
%%				end,
%%			Msg2 = #pk_UpdataGuildHurtToBoss{
%%				hurt = GuildDamage
%%			},
%%			playerMsg:sendNetMsg(Msg2),
%%			GuildPos =  meGuildPos(GuildID,LguildHurtlist,1),
%%			NewGuildList = 	 lists:sublist(LguildHurtlist, ?WorldBossTenLength),
%%			L4 = [#pk_BossRankInfo{name = GuildName, hurt = Damage2} || #recWorldBossGuilDamage{guildName =GuildName,  damage = Damage2} <- NewGuildList],
%%		    Msg1 = #pk_GS2U_BossBattleRankResult{curBossID = CurBossID, curPLeftTime = CPLeftTime, curGLeftTime = CGLeftTime,
%%			    curRankNum = NPos, curGuildRankNum =GuildPos, rankList = L3,guildrankList = L4},
%%			playerMsg:sendNetMsg(Msg1);
%%		_->
%%			Msg1 = #pk_GS2U_BossBattleRankResult{curBossID = CurBossID, curPLeftTime = CPLeftTime, curGLeftTime = CGLeftTime,
%%				curRankNum = NPos,curGuildRankNum = 0, rankList = L3,guildrankList = []},
%%			playerMsg:sendNetMsg(Msg1)
%%	end,
%%
%%	skip;
%%doSync(_Flag, _Sync) ->
%%	ok.
%%
%%canSync(true) ->
%%	true;
%%canSync(_) ->
%%	case get('SyncWBInfo2Me') of
%%		undefined ->
%%			put('SyncWBInfo2Me', 1),
%%			true;
%%		V ->
%%			case V + 1 >= ?WorldBossSyncTick of
%%				true ->
%%					put('SyncWBInfo2Me', 0),
%%					true;
%%				_ ->
%%					put('SyncWBInfo2Me', V + 1),
%%					false
%%			end
%%	end.
%%
%%
%%mePos(_Me, [], _N) ->
%%	0;
%%mePos(Me, [#recWorldBossDamage{roleID = Me} | _], N) ->
%%	N;
%%mePos(Me, [#recWorldBossDamage{} | L], N) ->
%%	mePos(Me, L, N + 1).
%%
%%meGuildPos(_Me, [], _N) ->
%%	0;
%%meGuildPos(Me, [#recWorldBossGuilDamage{guildID  = Me} | _], N) ->
%%	N;
%%meGuildPos(Me, [#recWorldBossGuilDamage{} | L], N) ->
%%	meGuildPos(Me, L, N + 1).
%%
%%openFlag() ->
%%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_LeaderBtn) of
%%		true ->
%%			case myEts:getCount(?WorldBossEts) > 0 of
%%				true ->
%%					1;
%%				_ ->
%%					0
%%			end;
%%		_ ->
%%			0
%%	end.
%%
%%
%%getName(RoleID) ->
%%	Me = playerState:getRoleID(),
%%	case RoleID of
%%		Me ->
%%			playerState:getName();
%%		_ ->
%%			case core:queryRoleKeyInfoByRoleID(RoleID) of
%%				#?RoleKeyRec{roleName = Name} ->
%%					Name;
%%				_ ->
%%					"???"
%%			end
%%	end.
%%
%%%% 获取领取剩余次数
%%guildCanGetAwardLeftTime(GuildID, BossID, {DayVersion, GuildLimit}) ->
%%	case ets:lookup(rec_guild, GuildID) of
%%		[#rec_guild{worldBossAwardInfo = GetInfoList}] ->
%%			case lists:keyfind(BossID, 1 , GetInfoList) of
%%				{_BossID, OldDayVersion, Count} when OldDayVersion =:= DayVersion ->
%%					max(GuildLimit - Count,0);
%%				{_BossID, OldDayVersion, _Count} when OldDayVersion =/= DayVersion ->
%%					GuildLimit;
%%				false ->
%%					GuildLimit;
%%				_ ->
%%					GuildLimit
%%			end;
%%		_ ->
%%			0
%%	end.
%%
%%%% 设置剩余已经领取次数
%%peopleSetAwardGetTime(BossID, DayVersion) ->
%%	OldInfoList = playerPropSync:getProp(?SerProp_WorldBossAwardGetInfo),
%%	NewInfoList = case lists:keyfind(BossID, 1 , OldInfoList) of
%%		{BossID, OldDayVersion, Count} when OldDayVersion =:= DayVersion ->
%%			lists:keystore(BossID, 1, OldInfoList, {BossID, DayVersion, Count + 1});
%%		{BossID, OldDayVersion, _Count} when OldDayVersion =/= DayVersion ->
%%			lists:keystore(BossID, 1, OldInfoList, {BossID, DayVersion, 1});
%%		false ->
%%			lists:keystore(BossID, 1, OldInfoList, {BossID, DayVersion, 1});
%%		_ ->
%%			[{BossID, DayVersion, 1}]
%%	end,
%%	playerPropSync:setAny(?SerProp_WorldBossAwardGetInfo, NewInfoList).
%%
%%
%%%% 获取领取剩余次数
%%peopleCanGetAwardLeftTime(BossID, {DayVersion, PeopleLimit}) ->
%%	GetInfoList = playerPropSync:getProp(?SerProp_WorldBossAwardGetInfo),
%%	case lists:keyfind(BossID, 1 , GetInfoList) of
%%		{_BossID, OldDayVersion, Count} when OldDayVersion =:= DayVersion ->
%%			max(PeopleLimit - Count,0);
%%		{_BossID, OldDayVersion, _Count} when OldDayVersion =/= DayVersion ->
%%			PeopleLimit;
%%		false ->
%%			PeopleLimit;
%%		_ ->
%%			PeopleLimit
%%	end.
%%
%%getLeftTimeInfo() ->
%%	CurBossID = case myEts:getCount(?WorldBossEts) > 0 of
%%		true ->
%%			case myEts:readRecord(?WorldBossEts, ?WorldBossKey) of
%%				#recWorldBossInfo{dataID = BossID} ->
%%					BossID;
%%				_ ->
%%					0
%%			end;
%%		_ ->
%%			0
%%	end,
%%	CurGuildID = playerState:getGuildID(),
%%	{LastBossID, LPLeftTime, LGLeftTime, DayVersion,OldGuildID} = playerState2:getWorldBossMapInfo(),
%%	case (CurBossID =/= LastBossID orelse CurGuildID =/= OldGuildID) of
%%		true when CurBossID =:= 0  ->
%%			playerState2:setWorldBossMapInfo({CurBossID, 0, 0, DayVersion, CurGuildID}),
%%			{CurBossID, 0, 0};
%%		true ->
%%			% 根据bossID获取领取奖励限制
%%			#globalsetupCfg{setpara = PeopleRankLimitList} = getCfg:getCfgPStack(cfg_globalsetup, bossaward),
%%			#globalsetupCfg{setpara = GuildRankLimitList}  = getCfg:getCfgPStack(cfg_globalsetup, bossguildaward),
%%			PeopleLimit = case lists:keyfind(CurBossID, 1, PeopleRankLimitList) of
%%				{CurBossID, PLimitCount} ->
%%					PLimitCount;
%%				_ ->
%%					0
%%			end,
%%			GuildLimit = case lists:keyfind(CurBossID, 1, GuildRankLimitList) of
%%				{CurBossID, GLimitCount} ->
%%					GLimitCount;
%%				_ ->
%%					0
%%			end,
%%			CPLeftTime = peopleCanGetAwardLeftTime(CurBossID, {DayVersion, PeopleLimit}),
%%			CGLeftTime = guildCanGetAwardLeftTime(CurGuildID, CurBossID, {DayVersion, GuildLimit}),
%%			playerState2:setWorldBossMapInfo({CurBossID, CPLeftTime, CGLeftTime, DayVersion, CurGuildID}),
%%			{CurBossID, CPLeftTime, CGLeftTime};
%%		_ ->
%%			{CurBossID, LPLeftTime, LGLeftTime}
%%	end.
%%
%%
%%
