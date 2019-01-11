%%%-------------------------------------------------------------------
%%% @author chenxiaolong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%家族BOss
%%% @end
%%% Created : 11. 九月 2017 16:22
%%%-------------------------------------------------------------------
-module(playerGuildBoss).
-author("chenxiaolong").
%%
%%-include("playerPrivate.hrl").
%%-include("../activity/activityPrivate.hrl").
%%-include("../activity/gameactivity/activityPhaseDefine.hrl").
%%-include("../activity/gameactivity/guildBoss/acGuildBossPrivate.hrl").
%%-include("cfg_price.hrl").
%%
%%
%%-define(GuildBossBuffID, 63030).
%%-define(BuyBufMaxTimes,10 ).
%%%% API
%%-export([requestInGuildBossMap/1,
%%	enterTryAck/1,
%%	buyGuildBossBuff/1,
%%	requestGuildRank/0,
%%	requestGuildBossPanelInfo/0,
%%	requestMyGuildKillBossRank/1,
%%	onEnterMap/1]).
%%
%%
%%
%%
%%onEnterMap(MapID)->
%%	Phase = activityMgrOtp:getActivityPhase(?ActivityType_GuildBoss),
%%	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
%%		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeGuildBoss} when Phase =/= ?ActivityPhase_Close ->
%%			RoleID =  playerState:getRoleID(),
%%			playerLogAdd:addLogParticipatorInfo(?LogParticipator_GuildBoss),
%%			%% 返回场景，添加原层数的鼓舞BUFF
%%			case acGuildBossLogic:findGuildBossInfoForRoleID(RoleID)  of
%%				#enter_guild_boss{buffNum = BuffNum, bp = BpList} ->
%%					case BuffNum of
%%						0 -> skip;
%%						N ->
%%							L = lists:seq(1, N),
%%							[playerBuff:addBuff(?GuildBossBuffID, playerState:getLevel()) || _ <- L]
%%					end,
%%
%%					enter_group(RoleID, BpList),
%%					ok;
%%				_->
%%					skip
%%			end;
%%		_ ->
%%			%% 离开场景删除鼓舞BUFF
%%			playerBuff:delBuff(?GuildBossBuffID)
%%	end,
%%	ok.
%%
%%enter_group(_RoleID, []) -> false;
%%enter_group(RoleID, #r_bit_plane{groupID = GroupID, roleIDList = List}) ->
%%	case lists:member(RoleID, List) of
%%		true ->
%%			playerScene:onEnterGroup(GroupID),
%%			true;
%%		_ ->
%%			false
%%	end;
%%enter_group(RoleID, [Bp|List]) ->
%%	case enter_group(RoleID, Bp) of
%%		true ->
%%			true;
%%		_ ->
%%			enter_group(RoleID, List)
%%	end.
%%
%%%%请求打开家族BOSS战 界面，所需要的数据
%%-spec requestGuildBossPanelInfo() -> ok.
%%requestGuildBossPanelInfo() ->
%%
%%	core:sendMsgToActivity(?ActivityType_GuildBoss,
%%		requestGuildBossPanelInfo,
%%		{
%%			playerState:getRoleID()
%%		}),
%%	ok.
%%
%%%%申请进入 家族BOSS战
%%requestInGuildBossMap(GuildBossLevel) ->
%%	core:sendMsgToActivity(?ActivityType_GuildBoss,
%%		requestJoinGuildBossMap,
%%		{
%%			playerState:getRoleID(),GuildBossLevel
%%		}),
%%	ok.
%%
%%
%%
%%%% 尝试进入反馈
%%%% 地图已存在，可以直接进入
%%enterTryAck({MapID, MapPid}) ->
%%	%?DEBUG("[DebugForDate] enterTryAck MapID(~p) MapPid(~p) DateActiveID(~p) AnotherRoleID(~p) at RoleID(~p)", [MapID, MapPid, _DateActiveID, _AnotherRoleID, playerState:getRoleID()]),
%%	case checkMyMap(MapID) of
%%		skip ->
%%			skip;
%%		ok ->
%%			playerScene:onRequestEnterActivityMap(MapID, MapPid);
%%		ErrorCode ->
%%			playerMsg:sendErrorCodeMsg(ErrorCode)
%%	end,
%%	ok.
%%
%%
%%
%%% 此处为{}表示尚未指定需要进入的MapID，跳过checkMyMap/1中的第0项检查
%%-spec checkMyMap(MapID::uint()) -> uint() | ok | skip.
%%checkMyMap(MapID) ->
%%	case playerState:getMapID() of
%%		MapID ->
%%			skip; %% 0.不能原地跳跃
%%		MapIDNow ->
%%			case playerState:getGroupID() =/= 0 of
%%				true ->
%%					?ErrorCode_Date_Map_NotGroup; %% 1.不能从位面进入
%%				_ ->
%%					case getCfg:getCfgByArgs(cfg_mapsetting, MapIDNow) of
%%						#mapsettingCfg{type = ?MapTypeNormal, subtype = ?MapSubTypeNormal} ->
%%							ok;
%%						#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeGuildFairground} ->
%%							ok;
%%						_ ->
%%							?ErrorCode_Date_Map_NeedNormal %% 2.不能从非普通地图进入
%%					end
%%			end
%%	end.
%%
%%%%请求排行榜数据
%%-spec requestGuildRank() -> ok.
%%requestGuildRank() ->
%%	core:sendMsgToActivity(?ActivityType_GuildBoss,
%%		requestGuildRankInfo,
%%		{
%%			playerState:getRoleID()
%%		}),
%%	ok.
%%
%%requestMyGuildKillBossRank(GuildLevel)->
%%	core:sendMsgToActivity(?ActivityType_GuildBoss,
%%		requestMyGuildKillBossRank,
%%		{
%%			playerState:getRoleID(),GuildLevel
%%		}),
%%	ok.
%%
%%
%%%%购买buff
%%buyGuildBossBuff(BuffID) when BuffID == ?GuildBossBuffID ->
%%	case acGuildBossLogic:activeStateIsOpen() of
%%		  true->
%%			  RoleID = playerState:getRoleID(),
%%			  PlayerEtsList =  ets:tab2list(playerState:getMapPlayerEts()),
%%
%%			  {InspireNum ,BossInfo}=
%%			  case acGuildBossLogic:findGuildBossInfoForRoleID(RoleID)  of
%%				  #enter_guild_boss{buffNum = BuffNum} = Info ->
%%					  {BuffNum ,Info};
%%				   _->
%%					   {-1,[]}
%%              end,
%%			  Result =
%%				  case InspireNum < ?BuyBufMaxTimes andalso InspireNum >=0 of
%%					  true->
%%						  case getCfg:getCfgByArgs(cfg_price, InspireNum+1) of
%%							  #priceCfg{guild_boss_buffprice   =  CoinBuy} ->
%%								  %%判断货币是否足够
%%								  case canUseCoin(CoinBuy,?CoinUseTypeDiamond) of
%%									  true ->
%%										  %%扣钱，增加鼓舞次数，增加BUFF
%%										  case playerMoney:useCoin(?CoinUseTypeDiamond, CoinBuy, #recPLogTSMoney{reason = ?CoinUseGuildBossOP, param = 0, target = ?PLogTS_Activity_Boss, source = ?PLogTS_PlayerSelf}) of
%%											  true ->
%%
%%												  %%向地图所有玩家 发送BUFF加成
%%												  F1= fun(#recMapObject{pid = RolePid,level = Lv} )->
%%													  psMgr:sendMsg2PS(RolePid, addBuff, {Lv,BuffID})
%%													  %%gsSendMsg:sendRolePidMsgByRoleID(RoleID, addBuff,{Lv,BuffID}),
%%												      end,
%%
%%												  #buffCfg{buffName = Name} = getCfg:getCfgPStack(cfg_buff, BuffID),
%%												  lists:foreach(F1,PlayerEtsList),
%%												  Str = stringCfg:getString(mail_guildboss_12, [playerState:getName(),Name]),
%%												  guildChatNotice(Str),
%%												  NewGuildInfo = BossInfo#enter_guild_boss
%%												  {
%%													  buffNum =InspireNum+1
%%												  },
%%												  ets:insert(enter_guild_boss,NewGuildInfo),
%%												  ok;
%%											  _Err1 ->
%%												  ?ErrorCode_Activety_Coin_Not_Enough
%%										  end;
%%									  _ ->
%%										  ?ErrorCode_Activety_Coin_Not_Enough
%%								  end;
%%							  _ ->
%%								  ?ErrorCode_Activety_Coin_Not_Enough
%%						  end;
%%					  _ ->
%%						  ?ErrorCode_World_Boss_Inspire_Type_Max
%%				  end,
%%			  case Result of
%%				  ok ->
%%					  ok;
%%				  Err ->
%%					  playerMsg:sendErrorCodeMsg(Err)
%%			  end;
%%		  _->
%%			  skip
%%	end,
%%
%%	ok;
%%buyGuildBossBuff(_)->
%%		ok.
%%
%%%% 判断货币是否足够
%%canUseCoin(Value,UseCoinType) ->
%%	if Value >= 0 ->
%%		case playerMoney:canUseCoin(UseCoinType, Value) of
%%			true ->
%%				true;
%%			_ ->
%%				?ErrorCode_Activety_Coin_Not_Enough
%%		end;
%%		true ->
%%			?ErrorCode_CopyMap_Cfg_Error
%%	end.
%%
%%guildChatNotice(Chat) ->
%%	playerChat:onChannelSystemChatMsg(?CHAT_CHANNEL_GUILD, Chat).
%%
