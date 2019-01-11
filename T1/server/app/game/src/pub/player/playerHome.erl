%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家家园系统
%%% @end
%%% Created : 21. 八月 2017 11:48
%%%-------------------------------------------------------------------
-module(playerHome).
-author(tiancheng).

-include("gsInc.hrl").
-include("playerPrivate.hrl").

%% 请求拜访记录的条数
-define(VisitRecordNumber, 20).

%% MSG
-export([
	msg/1
]).

%% API
-export([
	createHome/2,
	createHomeAck/1,
	enterHomeAck/1,
	addStylish/1,
	addStylish/2,
	addComfort/1,
	addComfort/2,
	addPopularity/1,
	addPopularity/2,
	enterHomeMap/1,
	init/0,
	tick/0,
	enterBitHomeAck/0,
	receivedHomeLetterCard/1,
	enterHomeMap/1,
	enterHomeMap/1,
	cleanHomeUpCD/0,
	gm_createLetter/0,
	gm_homeLetterOverDue/1
]).

%% gm
-export([
	enterHome/1,
	gm_homeup/1,
	upgradeHome/1
]).

-define(RequestFriendNum,10 ).
-define(Direct_Access_ToHome,100).

msg(#pk_U2GS_CreateHome{adminAreaID = AreaID, homeName = HomeName}) ->
	%% 进入房屋
	case playerMainMenu:isOpen(?ModeType_Home) of
		true ->
			createHome(AreaID, HomeName);
		_ ->
			skip
	end,
	ok;
msg(#pk_U2GS_EnterHome{roleID = RoleID, flag = ?Home_House}) ->

	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->

			case playerHomeFurniTrue:checkHomeIsDecorate(HomeID) of
				  false ->%% 进入房屋
					  enterHome(RoleID, ?Home_House);
				_->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Home_isBuilding)
			end;

		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_TargetHavaNotHome)
	end,
	ok;

%%这里特殊处理，人气榜排行前三，玩家点击雕像，可以直接进来不用好友判断
msg(#pk_U2GS_EnterHome{roleID = RoleID,flag= ?Direct_Access_ToHome}) ->

	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->

			case playerHomeFurniTrue:checkHomeIsDecorate(HomeID) of
				false ->%% 进入房屋
					enterHome(RoleID, ?Direct_Access_ToHome);
				_->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Home_isBuilding)
			end;

		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_TargetHavaNotHome)
	end,
	ok;
msg(#pk_U2GS_EnterHome{roleID = RoleID, flag = ?Home_Courtyard}) ->
	%% 进入庭院
	enterHome(RoleID, ?Home_Courtyard),
	ok;
msg(#pk_U2GS_RequestHomeInfo{roleID = RoleID,isShowErrCode = IsShowErrCode}) ->
	%% 请求家园信息
	case homeInterface:queryHome(RoleID) of
		#rec_home{} = Home ->
			sendHomeInfo(Home);
		false ->
			playerMsg:sendNetMsg(makeHomeInfo()),
				case IsShowErrCode of
					  true->
							playerMsg:sendErrorCodeMsg(?ErrorCode_TargetHavaNotHome);
					_->
					skip
				end,
			ok
	end,
	ok;
msg(#pk_U2GS_ChangeHomeName{homeID = HomeID, homeName = HomeName}) ->
	RoleID = playerState:getRoleID(),
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{roleID = RID,homeName = OldHomeName}] ->
			MarriageID = marriageState:queryMarriageRoleID(RID),
			case (MarriageID =:= RoleID orelse RID =:=RoleID) andalso OldHomeName =/=HomeName of
					true  ->
					  case str:get_utf8_char_count(HomeName) < 32 andalso  str:get_utf8_char_count(HomeName) >0 of
					  	   true ->
					  		   case getCfg:getCfgByKey(cfg_globalsetup, home_namefix) of
					  			   #globalsetupCfg{setpara = [MoneyType, Number]} ->
									   %% 扣钱
									   PLog = #recPLogTSMoney{
										   reason = ?CoinUseHome,
										   param = Number,
										   target = ?PLogTS_Home,
										   source = ?PLogTS_PlayerSelf
									   },
									   case playerMoney:useCoin(MoneyType, Number, PLog) of
										   true ->
											   psMgr:sendMsg2PS(?HomeOtp, changeHomeName, {HomeID, RoleID, HomeName, playerState:getNetPid()});
										   _ ->
											   playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin)
									   end;
					  			   _ ->
					  				   skip
					  		   end;
					  	   _ ->
					  		   playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNameNotUse)
					  end;
					_->
						playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNameNotUse)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNotExist)
	end,
	ok;
msg(#pk_U2GS_UpgradeHomeArea{homeID = HomeID, areaID = AreaID}) ->
	upgradeHomeArea(HomeID, AreaID),
	ok;
%% 请求家园可拜访列表
msg(#pk_U2GS_HomeVisit{paga = 0}) ->
	%% 邻居
	RetMsg =
		case homeInterface:queryHome(playerState:getRoleID()) of
			#rec_home{} = Home ->
				makeNeighborHomeVisit(Home);
			false ->
				makeNullHomeVisit()
		end,
	playerMsg:sendNetMsg(RetMsg),
	ok;
msg(#pk_U2GS_HomeVisit{paga = Page}) ->
	%% 好友
	RetMsg = makeFriendHomeVisit(Page, ?RequestFriendNum),
	playerMsg:sendNetMsg(RetMsg),
	ok;
%% 请求拜访记录
msg(#pk_U2GS_RequestVisitRecord{roleID = RoleID}) ->
%%	SelfID = playerState:getRoleID(),
	sendVisitRecord(RoleID),
	ok;
%%升级家园
msg(#pk_U2GS_UpgradeHome{upgredeDataList = UpgredeDataList}) ->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{upgradeHomeCD =UpgradeHomeCD} = Home ->
			TimeNow  = time:getSyncTimeFromDBS(),
			case TimeNow >= UpgradeHomeCD of
				true ->
					upgradeHomeNew(Home,UpgredeDataList);
				 _->
					 playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnErrorCd)
			end;

		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNotExist)
	end,
	ok;

%% 请求进入家园位面
msg(#pk_U2GS_EnterBitHome{itemUID = ItemUID}) ->
%%	SelfID = playerState:getRoleID(),
	enterBitHomeMap(ItemUID),
	ok;
msg(Msg) ->
	?ERROR("receive error msg:~p,~p", [playerState:getRoleID(), Msg]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
	ok.


gm_createLetter()->
	BossLetterList = playerPropSync:getProp(?SerProp_HomeBossLetter),
	#globalsetupCfg{setpara = [Openhomelv]} = getCfg:getCfgPStack(cfg_globalsetup, thief_openhomelv),
	case  homeInterface:queryHome(playerState:getRoleID())  of
		#rec_home{homeLvl = HomeLevel} when HomeLevel>=Openhomelv ->
			case erlang:length(BossLetterList) >=1 of
				true->
					[#recLetter{itemUID = ItemUid}|_]=BossLetterList,
					deleteItemForUid(ItemUid);
				_->
					skip
			end,
			#globalsetupCfg{setpara = [Min,Max]} =
				getCfg:getCfgPStack(cfg_globalsetup, thief_triggertimer),
			Value = misc:rand(Min,Max),
			NextSendTime =time:getSyncTime1970FromDBS() +  Value*60,
			createLetter(),
			playerPropSync:setInt64(?PriProp_PlayerHomeOnlineTime, NextSendTime);
		_->
			skip
	end,
	ok.

gm_homeLetterOverDue(Time)->
	BossLetterList = playerPropSync:getProp(?SerProp_HomeBossLetter),
	case erlang:length(BossLetterList) >=1 of
		true->
			[#recLetter{itemUID = ItemUid} = Old|_]=BossLetterList,
			NowTime = time:getSyncTime1970FromDBS(),
			New = Old#recLetter{overTime =NowTime +Time},
			playerPropSync:setAny(?SerProp_HomeBossLetter,[New]),
			Msg =  #pk_GS2U_SendHomeLetter{letter = #pk_HomeLetter{itemUID = ItemUid,overTime =NowTime +Time }},
			playerMsg:sendNetMsg(Msg);
		_->
			skip
	end,
	ok.

deleteItemForUid(ItemUid)->
	BossLetterList = playerPropSync:getProp(?SerProp_HomeBossLetter),
	New = lists:keydelete(ItemUid,#recLetter.itemUID,BossLetterList),
	playerPropSync:setAny(?SerProp_HomeBossLetter,New),
	case playerPackage:getGoodsByUID(ItemUid, ?Item_Location_Bag) of
		#rec_item{itemID = ItemID} ->
			Plog = #recPLogTSItem{
				old = 0,
				new = 0,
				change = 0,
				target = ?PLogTS_System,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemDeleteReasonHome,
				reasonParam = ItemID
			},
			playerPackage:deleteGoodsByUID(?Item_Location_Bag, ItemUid, Plog);
		_ ->
			skip
	end,
	ok.

%%登录初始化一些平凡读取的配置表 存入 playerstate2进程
init()->
	case playerPropSync:getProp(?SerProp_HomeBossLetter) of
		 [] ->Msg =  #pk_GS2U_SendHomeLetter{letter = #pk_HomeLetter{itemUID = 0,overTime =0 }},
			 playerMsg:sendNetMsg(Msg);
		 [#recLetter{itemUID = ItemUID,overTime = OverTime}|_]->
			 Msg =  #pk_GS2U_SendHomeLetter{letter = #pk_HomeLetter{itemUID = ItemUID,overTime =OverTime }},
			 playerMsg:sendNetMsg(Msg)
	end,
	ok.

createLetter()->
	RoleID = playerState:getRoleID(),
	NowTime = time:getSyncTime1970FromDBS(),
	#globalsetupCfg{setpara = [Time]} = getCfg:getCfgPStack(cfg_globalsetup, thief_ddltimer),
	Thief_ddltimer = Time*60,
	#globalsetupCfg{setpara = [Thief_letterid]} = getCfg:getCfgPStack(cfg_globalsetup, thief_letterid),
	ItemUID=
		case playerMail:createMailGoods(Thief_letterid, 1, true, 0, RoleID, ?ItemSourceHomeBossRewardGet) of
			[#recMailItem{itemUID = Uid}|_] = MailItemList ->
				Name =  core:queryRoleNameByRoleID(RoleID),
				Title =stringCfg:getString(thief_notice_title),
				Content = stringCfg:getString(thief_notice_mail, [binToString(Name)]),
				mail:sendSystemMail(RoleID, Title, Content, MailItemList, ""),
				Uid;
			_ ->
				?ERROR("build ItemID=~p, rec=~p", [Thief_letterid, {RoleID, RoleID}]),
				0
		end,
	NewList = [#recLetter{itemUID =ItemUID,itemID =Thief_letterid,overTime=NowTime+Thief_ddltimer}],
	playerPropSync:setAny(?SerProp_HomeBossLetter,NewList),
	Msg =  #pk_GS2U_SendHomeLetter{letter = #pk_HomeLetter{itemUID = ItemUID,overTime =NowTime+Thief_ddltimer }},
	playerMsg:sendNetMsg(Msg),
	ok.
%%收到预告函判断下是否过期
receivedHomeLetterCard(#rec_item{itemUID = ItemUID,itemID = ItemID})->
	#globalsetupCfg{setpara = [Thief_letterid]} = getCfg:getCfgPStack(cfg_globalsetup, thief_letterid),
	case ItemID of
		Thief_letterid->
			BossLetterList = playerPropSync:getProp(?SerProp_HomeBossLetter),
			case lists:keyfind(ItemUID,#recLetter.itemUID,BossLetterList) of
				false -> deleteItemForUid(ItemUID) ;
				_->
					skip
			end;
		_->
			skip
	end,
	ok.

%%分钟TICK
tick()->
	case core:isCross() of
		false ->
			BossLetterList = playerPropSync:getProp(?SerProp_HomeBossLetter),
			tickLetter(BossLetterList);
		_->
			skip
	end,
ok.
tickLetter(BossLetterList) when erlang:length(BossLetterList) >=1 ->
	%%这里处理逾期预告函
	NowTime = time:getSyncTime1970FromDBS(),
	[#recLetter{itemUID = ItemUid, overTime = OverTime}|_]=BossLetterList,
	case NowTime > OverTime of
		true ->
			Title =stringCfg:getString(thief_deadline_title),
			Content = stringCfg:getString(thief_deadline_mail),
			mail:sendSystemMail(playerState:getRoleID(), Title, Content, [], ""),
			Msg =  #pk_GS2U_SendHomeLetter{letter = #pk_HomeLetter{itemUID = 0,overTime =0 }},
			playerMsg:sendNetMsg(Msg),
			deleteItemForUid(ItemUid);
		_->
			skip
	end,
	ok;
tickLetter([])->
	#globalsetupCfg{setpara = [Openhomelv]} = getCfg:getCfgPStack(cfg_globalsetup, thief_openhomelv),
	case  homeInterface:queryHome(playerState:getRoleID())  of
		#rec_home{homeLvl = HomeLevel} when HomeLevel>=Openhomelv ->
			NowTime = time:getSyncTime1970FromDBS(),
			CurValue = playerPropSync:getProp(?PriProp_PlayerHomeOnlineTime),
			case NowTime > CurValue of
				  true->
					  #globalsetupCfg{setpara = [Min,Max]} =
						  getCfg:getCfgPStack(cfg_globalsetup, thief_triggertimer),
					  Value = misc:rand(Min,Max),
					  NextSendTime =NowTime +  Value*60,
					  createLetter(),
					  playerPropSync:setInt64(?PriProp_PlayerHomeOnlineTime, NextSendTime);
				 _->
					 skip
			end;
		_->
			skip
	end,
	ok.
enterBitHomeAck()->
	case playerState2:getBitHomeCardUid() of
		undefined->skip;
		Uid->
			playerState2:setBitHomeCardUid(0),
			Msg =  #pk_GS2U_SendHomeLetter{letter = #pk_HomeLetter{itemUID = 0,overTime =0 }},
			playerMsg:sendNetMsg(Msg),
			deleteItemForUid(Uid),
			playerPet:petAutoShowWhenEnterBitHome()
	end,
	ok.

%%进入家园位面
enterBitHomeMap(ItemUID)->
	RoleID =  playerState:getRoleID(),
	MyMapID = playerState:getMapID(),
	BossLetterList = playerPropSync:getProp(?SerProp_HomeBossLetter),
	case gsTeamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfoGS{memberList = ML, leaderID = LeaderID, copyMapID = CopyMapID} ->
			case RoleID of
				LeaderID->
					case lists:keyfind(ItemUID,#recLetter.itemUID,BossLetterList) of
						#recLetter{}->
							case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
								#mapsettingCfg{type = ?MapTypeBitplane,subtype = ?MapSubTypeHome,belongto = MyMapID}->
									enter(RoleID,ML,ItemUID,MyMapID);
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_HomeBoss_validmap)
							end;
						_->
							deleteItemForUid(ItemUID),
							playerMsg:sendErrorCodeMsg(?ErrorCode_HomeBoss_noletter)
					end;
				_->
					?ERROR("Must be Leader start")
			end;
		_ ->
			?ERROR("no  team ")
	end,
	ok.
enter(RoleID,ML,ItemUID,MyMapID)->
	MyMapPid =playerState:getMapPid(),
	case  homeInterface:queryHomeMap(MyMapID,MyMapPid) of
		#rec_home_map{homeID = {HomeID,_}} ->
			case homeInterface:queryHome(RoleID) of
				#rec_home{homeID = HomeID}->
					TeamLen = erlang:length(ML),
					F = fun(#recTeamMemberInfoGS{mapPid = MapPid,pid = PlayerPid},Num)->
						psMgr:sendMsg2PS(PlayerPid, kickUseFurnitruePlayer,0),
						case MapPid==MyMapPid of
							true->  Num+1;
							_->
								Num
						end
						end,
					case lists:foldl(F,0,ML) >= TeamLen of
						true->
							playerState2:setBitHomeCardUid(ItemUID),
							playerTeam:teamOperate(?TeamOP_StartCopyMap, 0, 0);

						_->
							playerMsg:sendErrorCodeMsg(?ErrorCode_HomeBoss_notallinhome)
					end;
				_->
					playerMsg:sendErrorCodeMsg(?ErrorCode_HomeBoss_notselfhome)
			end;
		_->
			?ERROR("this Map is not home ~p",[MyMapID])
	end.


upgradeHome(#rec_home{homeLvl = Lvl, homeID = HomeID}) ->
	case getCfg:getCfgByKey(cfg_home_level, Lvl) of
		#home_levelCfg{cost_coin = Coins} ->
			case checkCost(Coins) of
				true ->
					%% 扣钱
					FDecCoin =
						fun
							({_MoneyType, 0}) ->
								skip;	%% 可能配置为0表示不消耗
							({MoneyType, Number}) ->
								PLog = #recPLogTSMoney{
									reason = ?CoinUseHome,
									param = Lvl,
									target = ?PLogTS_Home,
									source = ?PLogTS_PlayerSelf
								},
								playerMoney:useCoin(MoneyType, Number, PLog)
						end,
					lists:foreach(FDecCoin, Coins),

					playerAchieve:achieveEvent(?Achieve_UpdateHome,[Lvl+1,1]),
					%% 告诉公告进程开始升级
					psMgr:sendMsg2PS(?HomeOtp, upgradeHome, {HomeID, Lvl + 1, playerState:getNetPid(),0}),
					ok;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_NotMatchUpgradeCondition)
	end,
	ok.

%%新增的 家园升级
upgradeHomeNew(#rec_home{homeLvl = Lvl, homeID = HomeID},UpgredeDataList) ->

	case getCfg:getCfgByKey(cfg_home_level, Lvl+1) of
		#home_levelCfg{} ->
			case getCfg:getCfgByKey(cfg_home_level, Lvl) of
				#home_levelCfg{cost_coin = Coins,cost_item1 = CostItem,build_cd = Build_CD} ->


					%%筛选材料 和配置表的是否一致并且 检测背包是否足够
					Fun =
						fun({_,ItemID,Num}, {_,{ID, Count}}) ->

							case ItemID =:= ID andalso Num=:=Count of
								true ->

									case playerPackage:getItemNumByID(ItemID) >= Num of
										true ->
											{true,{ItemID,Num}};
										_ ->
											playerMsg:sendErrorCodeMsg(?ErrorCode_LifeSkill_NoItems),
											{false, {ID, Count}}
									end;
								_->
									{false, {ID, Count}}
							end

						end,
					Fun1 =
						fun(#pk_UpgradeHomeData{itemID = NeedItemID,num = NeedNum}, {_, _}) ->

							case misc:foldlEx(Fun, {false,{NeedItemID, NeedNum}},CostItem) of
								{true,_}->
									{false,0};
								_->
									{true,0}
							end

						end,
					case misc:foldlEx(Fun1, {false, 0},UpgredeDataList) of
						{true, _} ->
							skip;
						_ ->
							case checkCost(Coins) of
								true ->


									%%扣道具
									F = fun(#pk_UpgradeHomeData{itemID = Iid,num = N}) ->
										PLog = #recPLogTSItem{
											old = 0,
											change = N,
											target = ?PLogTS_GiveGift,
											source = ?PLogTS_PlayerSelf,
											changReason = ?ItemDeleteReasonGiveGift,
											reasonParam = playerState:getRoleID()
										},
										PayItemType = playerPackage:getItemType(Iid),
										PacketType = playerPackage:getPackageType(PayItemType),
										playerPackage:delGoodsByID(PacketType, Iid, N, PLog)
										end,
									lists:foreach(F,UpgredeDataList),
									%% 扣钱
									FDecCoin =
										fun({_MoneyType, 0}) ->
												skip;	%% 可能配置为0表示不消耗
										   ({MoneyType, Number}) ->
											PLog = #recPLogTSMoney{
												reason = ?CoinUseHome,
												param = Lvl,
												target = ?PLogTS_Home,
												source = ?PLogTS_PlayerSelf
											},
											playerMoney:useCoin(MoneyType, Number, PLog)
										end,
									lists:foreach(FDecCoin, Coins),

									playerAchieve:achieveEvent(?Achieve_UpdateHome,[Lvl+1,1]),
									%%设置下次升级的时间
									TimeNow  = time:getSyncTimeFromDBS(),
									UpgredeTime =  TimeNow + Build_CD*60,

									%% 告诉公告进程开始升级
									psMgr:sendMsg2PS(?HomeOtp, upgradeHome, {HomeID, Lvl + 1, playerState:getNetPid(),UpgredeTime}),
									ok;

								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin)
							end
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_NotMatchUpgradeCondition)
			end;
			_->
				skip
	end,
	ok.

cleanHomeUpCD() ->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{homeID = HomeID,upgradeHomeCD = UpgredeTime} ->
			case UpgredeTime > 0 of
				true ->
					%% 告诉公告进程清除家园升级CD
					psMgr:sendMsg2PS(?HomeOtp, cleanHomeUpCD, {HomeID, playerState:getNetPid(),UpgredeTime});
				_ ->
					true
			end;
		_ ->
			skip
	end.

sendVisitRecord(RoleID) ->
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID, roleID = OwnerID} ->
			List = ets:lookup(?HomeVisitEts, HomeID),
			List2 = lists:reverse(lists:keysort(#rec_home_visit.timestamp, List)),
			List3 = lists:sublist(List2, ?VisitRecordNumber),
			SelfID = playerState:getRoleID(),
			F =
				fun(#rec_home_visit{visitID = VisitID} = Visit, Acc) ->
					case VisitID =:= OwnerID of
						true ->
							Acc;
						_ ->
							[#pk_VisitRecord{
								%% UInt64
								roleID = VisitID,
								%% String
								roleName = playerNameUID:getPlayerNameByUID(VisitID),
								%% Byte 关系类型：1好友，2伴侣男，3伴侣女，4陌生人
								relationType = getRelationType(SelfID, HomeID, VisitID),
								%% Byte 操作记录：1拜访，2收菜，3...
								opType = Visit#rec_home_visit.opType,
								%% UInt32
								opParam1 = Visit#rec_home_visit.opParam1,
								%% UInt32
								opParam2 = Visit#rec_home_visit.opParam2,
								%% UInt32
								opParam3 = Visit#rec_home_visit.opParam3,
								%% UInt64 时间戳
								timestamp = Visit#rec_home_visit.timestamp
							} | Acc]
					end
				end,
			List4 = lists:foldl(F, [], List3),
			playerMsg:sendNetMsg(#pk_GS2U_VisitRecord{lists = List4}),
			ok;
		_ ->
			skip
	end,
	ok.

getRelationType(SelfID, _SelfHomeID, SelfID) -> ?HomeRelationType_Self;
getRelationType(SelfID, SelfHomeID, TargetID) ->
	%% 优先检测是不是邻居
	IsNeighbor =
		case SelfHomeID > 0 of
			true ->
				%% 左邻
				RoleIDLeft = homeInterface:getNeighborLeftRoleID(SelfHomeID),
				%% 右舍
				RoleIDRight = homeInterface:getNeighborRightRoleID(SelfHomeID),
				TargetID =:= RoleIDLeft orelse TargetID =:= RoleIDRight;
			_ ->
				false
		end,

	case IsNeighbor of
		true ->
			?HomeRelationType_Neighbor;
		_ ->
			case cgsFriendInterface:queryFRT(SelfID, TargetID) of
				?FRT_Formal ->
					?HomeRelationType_Friend;
				_ ->
					case marriageState:queryMarriageRoleID(SelfID) of
						TargetID ->
							case core:queryRoleKeyInfoByRoleID(TargetID) of
								#?RoleKeyRec{sex = ?SexWoman} -> ?HomeRelationType_PartnerWoman;
								#?RoleKeyRec{sex = ?SexMan} -> ?HomeRelationType_PartnerMan;
								_ ->
									?HomeRelationType_Stranger
							end;
						_ ->
							?HomeRelationType_Stranger
					end
			end
	end.

makeFriendHomeVisit(Page, Number) ->
	L = getListCheckCD(),
	Start = (Page - 1) * Number + 1,
	case Start >= 1 andalso Start =< erlang:length(L) + 1 of
		true ->
			RL = lists:sublist(L, Start, Number),
			#pk_GS2U_HomeVisitList{allnumber = erlang:length(L), paga = Page, visits = RL};
		_ ->
			#pk_GS2U_HomeVisitList{allnumber = erlang:length(L), paga = Page, visits = []}
	end.

getListCheckCD() ->
	NowSec = time2:getTimestampSec(),
	case get(cacheFriendHomeVisit) of
		undefined ->
			L = getHomeVisitList(),
			put(cacheFriendHomeVisit, {NowSec, L}),
			L;
		{V, List} ->
			case NowSec - V >= 60 of
				true ->
					L = getHomeVisitList(),
					put(cacheFriendHomeVisit, {NowSec, L}),
					L;
				_ ->
					List
			end
	end.

getHomeVisitList() ->
	RoleID = playerState:getRoleID(),
	Relations = cgsFriendInterface:queryList(RoleID, ?FRT_Formal),
	L = lists:keysort(#rec_friend2_relation.closeness, Relations),
	L2 = lists:map(fun(#rec_friend2_relation{targetRoleID = TRoleID}) -> TRoleID end, L),
	makeHomeVisit(L2, []).

makeNeighborHomeVisit(#rec_home{homeID = HomeID}) ->
	%% 左邻
	RoleIDLeft = homeInterface:getNeighborLeftRoleID(HomeID),
	%% 右舍
	RoleIDRight = homeInterface:getNeighborRightRoleID(HomeID),
	L = makeHomeVisit([RoleIDLeft, RoleIDRight], []),
	#pk_GS2U_HomeVisitList{allnumber = erlang:length(L), paga = 0, visits = L}.

makeHomeVisit(0, RetList) -> RetList;
makeHomeVisit([], RetList) -> RetList;
makeHomeVisit([RoleID | List], RetList) ->
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID,stylish = Stylish} ->
			SelfID = playerState:getRoleID(),
			IsCanPick =  playerHomePlant:isCanPickVegetables(HomeID),
			HouseState =  playerHomeFurniTrue:getHomeHouseState(HomeID,?Home_House),
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{roleName = Name, level = Level,frameID = FrameID} = RoleKey ->
					R = #pk_HomeVisit{
						%% UInt64
						roleID = RoleID,
						%% String
						roleName = Name,
						frameID = FrameID,
						%% UInt32 玩家等级
						level = Level,
						%% UInt64
						homeID = HomeID,
						career = RoleKey#?RoleKeyRec.career,
						race = RoleKey#?RoleKeyRec.race,
						sex = RoleKey#?RoleKeyRec.sex,
						head = RoleKey#?RoleKeyRec.head,
						%% Int32 亲密度，非好友为-1
						closeness = cgsFriendInterface:queryFriendCloseness(SelfID, RoleID),
						%% Byte 自定义头像MD5(16byte)
						face = playerIdentity:queryFace(RoleID),
						stylish = Stylish,
						isCanPick = IsCanPick,
						isdecorate = HouseState
					},
					makeHomeVisit(List, [R | RetList]);
				_ ->
					makeHomeVisit(List, RetList)
			end;
		false ->
			makeHomeVisit(List, RetList)
	end.

makeNullHomeVisit() ->
	#pk_GS2U_HomeVisitList{allnumber = 0, paga = 0, visits = []}.

enterHomeMap(MapID) ->
	case homeInterface:isHomeMap(MapID) of
		true ->
			%% 发送家园信息给客户端
			MapPID =playerState:getMapPid(),
			case homeInterface:queryHomeMap(MapID, MapPID) of
				#rec_home_map{homeID = {HomeID, Flag}} ->
					[#rec_home{roleID = OwnerID}] = ets:lookup(?HomeEts, HomeID),
					%% 先发送一个当前家园的主人信息
					Msg = #pk_GS2U_EnterHome{homeID = HomeID, ownerID = OwnerID, mapID = MapID},
					playerMsg:sendNetMsg(Msg),

					sendHomeInfo(HomeID),
					playerHomePlant:sendHomePlantInfo(HomeID, Flag, true),
					playerHomeFarming:sendHomeFarmingInfo(HomeID, Flag),
					playerHomeFurniTrue:sendHomeFurniTureInfo(HomeID, Flag),

					%% 隐藏可能放出的骑宠
					playerPet:petAutoHide(true),

					%% 拜访记录
					Visit = #rec_home_visit{
						homeID = HomeID,
						opType = ?HomeOpType_Visit,
						visitID = playerState:getRoleID(),	%% 访客ID
						areaID = Flag,		%% 区域ID
						timestamp = time2:getLocalTimestampSec()	%% 时间戳
					},
					ets:insert(?HomeVisitEts, Visit),
					SelfID = playerState:getRoleID(),
					%%运营打点需求(关于家园拜访)
					case cgsFriendInterface:queryFRT(SelfID, OwnerID) of
						?FRT_Self ->
							skip;
						_ ->
							LogHomeVisit = #rec_log_home_visit{
								homeID = HomeID,
								visitID = playerState:getRoleID(),	%% 访客ID
								opType = ?HomeOpType_Visit,
								time = time:getLogTimeSec()
							},
							dbLog:sendSaveLogHomeVisit(LogHomeVisit)
					end,

					%% 增加好感度和人气值
					case cgsFriendInterface:queryFRT(SelfID, OwnerID) of
						?FRT_Formal ->

							%% 为家园主人增加人气值
							#globalsetupCfg{setpara = [AddV, _]} = getCfg:getCfgPStack(cfg_globalsetup, home_interview_addpopularity),
							addPopularity(HomeID, AddV),

							#globalsetupCfg{setpara = [Add, Max]} = getCfg:getCfgPStack(cfg_globalsetup, home_interview_addlikability),
							V = daily2State:queryDaily2(SelfID, OwnerID, ?Daily2Type_HomeVisitAddCloseness),
							AddReal =
								case V + Add > Max of
									true ->
										Max - V;
									_ ->
										Add
								end,
							case AddReal > 0 of
								true ->
									playerFriend:closenessAdd(?ClosenessAddType_HomeVisit, SelfID, OwnerID, AddReal),
									daily2Logic:saveDaily2({SelfID, OwnerID, ?Daily2Type_HomeVisitAddCloseness, AddReal + V});
								_ ->
									skip
							end,
							ok;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

upgradeHomeArea(HomeID, AreaID) when AreaID >= ?Home_AreaID_Min andalso AreaID =< ?Home_AreaID_Max ->
	RoleID = playerState:getRoleID(),
	?DEBUG("upgradeHomeArea:~p,~p,~p", [RoleID, HomeID, AreaID]),
	case canModifyHomeData(HomeID) of
		true ->
			%% 如果没有区域，则开垦，有则升级
			L = homeInterface:queryHomeArea(HomeID),
			AreaLvl =
				case lists:keyfind(AreaID, #rec_home_area.areaID, L) of
					#rec_home_area{areaLvl = Lvl} ->
						%% 升级
						Lvl;
					_ ->
						%% 开垦
						0
				end,
			[#rec_home{homeLvl = HLvl}] = ets:lookup(?HomeEts, HomeID),
			case getCfg:getCfgByKey(cfg_home_area, AreaID, AreaLvl) of
				#home_areaCfg{materials = Materials, coin_cost = Costs, homelevel = HomeLvl}
					when HLvl >= HomeLvl andalso Materials /= undefined andalso Costs /= undefined ->
					%% 检查材料与货币是否足够
					C = checkCost(Costs),
					M = checkMaterial(Materials),
					case C andalso M of
						true ->
							%% call，先消耗，再升级或者开垦
							%% 扣钱
							FDecCoin =

							     fun({_MoneyType, 0}) ->
										skip;	%% 可能配置为0表示不消耗
									({MoneyType, Number}) ->
									PLog = #recPLogTSMoney{
										reason = ?CoinUseHome,
										param = AreaID,
										target = ?PLogTS_Home,
										source = ?PLogTS_PlayerSelf
									},
									playerMoney:useCoin(MoneyType, Number, PLog)
								end,
							lists:foreach(FDecCoin, Costs),

							%% 扣除道具
							FDecItem =
								fun({ItemID, NeedNumber}) ->
									PayItemType = playerPackage:getItemType(ItemID),
									PacketType = playerPackage:getPackageType(PayItemType),
									PLogItem = #recPLogTSItem{
										old = NeedNumber,
										new = 0,
										change = -NeedNumber,
										target = ?PLogTS_Home,
										source = ?PLogTS_PlayerSelf,
										gold = 0,
										goldtype = ?CoinTypeGold,
										changReason = ?ItemDeleteReasonHome,
										reasonParam = HomeID
									},
									playerPackage:delGoodsByID(PacketType, ItemID, NeedNumber, PLogItem)
								end,
							lists:foreach(FDecItem, Materials),

							psMgr:sendMsg2PS(?HomeOtp, upgradeHomeArea, {HomeID, RoleID, playerState:getNetPid(), AreaID, AreaLvl}),
							ok;
						_ ->
							%% 货币或者材料不够
							if
								M =:= false ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_NotEnoughRuneMaterial);
								C =:= false ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin);
								true -> skip
							end
					end;
				_ ->
					%% 不满足升级或者开垦条件
					case AreaLvl of
						0 ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_NotMatchOpenCondition);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_NotMatchUpgradeCondition)
					end
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNotExist)
	end,
	ok;
upgradeHomeArea(_, _) ->
	ok.

checkMaterial([]) -> true;
checkMaterial({ItemID, NeedNumber}) ->
	playerPackage:getItemNumByID(ItemID) >= NeedNumber;
checkMaterial([Needs | List]) ->
	case checkMaterial(Needs) of
		true ->
			checkMaterial(List);
		_ ->
			false
	end.

checkCost([]) -> true;
checkCost({MoneyType, Number}) ->
	playerMoney:canUseCoin(MoneyType, Number);
checkCost([Needs | List]) ->
	case checkCost(Needs) of
		true ->
			checkCost(List);
		_ ->
			false
	end.

gm_homeup(0) ->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{homeLvl = Lvl} ->
			gm_homeup(Lvl + 1);
		_ ->
			false
	end;
gm_homeup(Lvl) ->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{homeLvl = Lvl} ->
			true;
		#rec_home{homeID = HomeID, homeLvl = OldLvl} when OldLvl < Lvl ->
			HomeLevelList = getCfg:get1KeyList(cfg_home_level),
			Level = OldLvl + 1,
			case Level > lists:max(HomeLevelList) of
				true ->
					false;
				_ ->
					playerAchieve:achieveEvent(?Achieve_UpdateHome,[Lvl+1,1]),
					%% 告诉公告进程开始升级
					psMgr:sendMsg2PS(?HomeOtp, upgradeHome, {HomeID, Level, playerState:getNetPid(),0}),
					timer:sleep(500),
					gm_homeup(Lvl)
			end;
		_ ->
			false
	end.

enterHome(Flag) ->
	enterHome(playerState:getRoleID(), Flag).


enterHome(TargetRoleID, ?Direct_Access_ToHome) ->
	SelfID = playerState:getRoleID(),
		case homeInterface:queryHome(SelfID) of
			#rec_home{} ->
				case homeInterface:queryHome(TargetRoleID) of
					#rec_home{homeID = HomeID} ->
						?INFO("enterHome selfID:~p,roleID:~p, homeID:~p,~p", [SelfID, TargetRoleID, HomeID, ?Home_House]),
						%% 如果地图存在，则直接进入，否则，告诉公共进程
						case ets:lookup(?HomeMapEts, {HomeID, ?Home_House}) of
							[#rec_home_map{mapID = MapID, mapPID = MapPID}] ->
								playerScene:onRequestEnterActivityMap(MapID, MapPID);
							_ ->
								psMgr:sendMsg2PS(?HomeOtp, enterHome, {HomeID, SelfID, ?Home_House})
						end;
					false ->
						playerMsg:sendErrorCodeMsg(?ErrorCode_TargetHavaNotHome)
				end;
			false ->
				skip
		end,
	ok;
enterHome(TargetRoleID, Flag) ->
	CanEnter = case Flag of
				   ?Home_House -> true;
				   ?Home_Courtyard -> true;
				   _ ->
					   false
			   end,
	SelfID = playerState:getRoleID(),
	CanEnter2 =
		case CanEnter of
			true ->
				%% TODO 检测关系
				SelfHomeID =
					case homeInterface:queryHome(SelfID) of
						#rec_home{homeID = HID} -> HID;
						false -> 0
					end,

				case getRelationType(SelfID, SelfHomeID, TargetRoleID) of
					?HomeRelationType_Neighbor ->
						true;
					?HomeRelationType_Stranger ->
						false;
					?HomeRelationType_Friend ->
						%% 检查好感度
						Need =
							case getCfg:getCfgByKey(cfg_globalsetup, interview_likability) of
								#globalsetupCfg{setpara = [N]} -> N;
								_ -> 0	%% 默认不限制
							end,
						case cgsFriendInterface:queryFriendCloseness(SelfID, TargetRoleID) >= Need of
							  true ->true;
							_->
								playerMsg:sendErrorCodeMsg(?ErrorCode_Home_FriendnessLack),
								false
						end;
					_ ->
						true
				end;
			_ ->
				false
		end,

	case CanEnter2 of
		true ->
			case homeInterface:queryHome(TargetRoleID) of
				#rec_home{homeID = HomeID} ->
					?INFO("enterHome selfID:~p,roleID:~p, homeID:~p,~p", [SelfID, TargetRoleID, HomeID, Flag]),
					%% 如果地图存在，则直接进入，否则，告诉公共进程
					case ets:lookup(?HomeMapEts, {HomeID, Flag}) of
						[#rec_home_map{mapID = MapID, mapPID = MapPID}] ->
							playerScene:onRequestEnterActivityMap(MapID, MapPID);
						_ ->
							psMgr:sendMsg2PS(?HomeOtp, enterHome, {HomeID, SelfID, Flag})
					end;
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TargetHavaNotHome)
			end;
		_ ->
			skip
	end,
	ok.

createHome(AreaID, HomeName) ->
	RoleID = playerState:getRoleID(),
	RusNameLen = str:get_utf8_char_count(HomeName),
	case RusNameLen >= 1 andalso RusNameLen =< 30 of
		true ->
			case homeInterface:queryHome(RoleID) of
				#rec_home{} ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CreateHomeFailed);
				false ->
					psMgr:sendMsg2PS(?HomeOtp, createHome, {RoleID, AreaID, HomeName})
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CreateHomeFailed)
	end,
	ok.

%% 增加华丽度
addStylish(Value) ->
	RoleID = playerState:getRoleID(),
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->
			addStylish(HomeID, Value);
		_ ->
			skip
	end.
addStylish(HomeID, Value) ->
	psMgr:sendMsg2PS(?HomeOtp, addStylish, {HomeID, Value, playerState:getNetPid()}).

%% 增加舒适度
addComfort(Value) ->
	RoleID = playerState:getRoleID(),
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->
			addComfort(HomeID, Value);
		_ ->
			skip
	end.
addComfort(HomeID, Value) ->
	psMgr:sendMsg2PS(?HomeOtp, addComfort, {HomeID, Value, playerState:getNetPid()}).

%% 增加人气
addPopularity(Value) ->
	RoleID = playerState:getRoleID(),
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->
			addPopularity(HomeID, Value);
		_ ->
			skip
	end.
addPopularity(HomeID, Value) ->
	psMgr:sendMsg2PS(?HomeOtp, addPopularity, {HomeID, Value, playerState:getNetPid()}).

createHomeAck({false, 0}) ->
	%% 生成HomeID失败
	playerMsg:sendErrorCodeMsg(?ErrorCode_System_Error_Unknow),
	ok;
createHomeAck({false, #rec_home{} = Home}) ->
	%% 已经存在家园
	sendHomeInfo(Home),
	ok;
createHomeAck({true, #rec_home{homeID = HomeID} = Home}) ->
	%% 创建成功
	playerAchieve:achieveEvent(?Achieve_CreateHome,[1]),
	playerSevenDayAim:updateCondition(?SevenDayAim_HomeCreate, [HomeID]),

	sendHomeInfo(Home),
	ok.

enterHomeAck({RoleID, MapID, MapPID} = Data) ->
	case playerState:getRoleID() of
		RoleID ->
			playerScene:onRequestEnterActivityMap(MapID, MapPID);
		E ->
			?ERROR("enterHomeAck:~p,~p", [E, Data]),
			skip
	end.

makeHomeInfo() ->
	RoleID = playerState:getRoleID(),

	%% 同居者
	MarriageID = marriageState:queryMarriageRoleID(RoleID),

	#pk_GS2U_HomeInfo{
		%% UInt64 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
		homeID = 0,
		%% String 为空则表示默认名字，由客户端自行拼接
		homeName = "",
		%% String 服务器名字
		serverName = "",
		%% UInt64 家园拥有者ID
		ownerID = RoleID,
		%% String 名字
		ownerName = playerNameUID:getPlayerNameByUID(RoleID),
		%% UInt64 同居者，配偶ID
		mateID = MarriageID,
		%% String 配偶名字
		mateName = playerNameUID:getPlayerNameByUID(MarriageID),
		%% UInt32 华丽度
		stylish = 0,
		%% UInt32 舒适度
		comfort = 0,
		%% UInt32 家园等级
		homeLvl = 0,
		%% UInt32 人气值
		popularity = 0,
		%% UInt64 左邻ID
		leftID = 0,
		%% String 名字
		leftName = "",
		%% UInt64 右舍ID
		rightID = 0,
		%% String 名字
		rightName = "",
		%% HomeArea 开放的区域
		areas = [],
		%% Home升级CD
		homeUpCd = 0
	}.

sendHomeInfo(#rec_home{} = Home) ->
	Msg = homeInterface:makeHomeInfo(Home),


	playerMsg:sendNetMsg(Msg),
	ok;
sendHomeInfo(HomeID) when erlang:is_integer(HomeID) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{} = Home] ->
			sendHomeInfo(Home);
		_ ->
			?ERROR("not found home roleID:~p, homeID:~p", [playerState:getRoleID(), HomeID]),
			skip
	end.

canModifyHomeData(HomeID) ->
	RoleID = playerState:getRoleID(),
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{roleID = RID}] ->
			MarriageID = marriageState:queryMarriageRoleID(RID),
			RoleID =:= RID orelse RoleID =:= MarriageID;
		false ->
			false
	end.
binToString(BinStr) when erlang:is_list(BinStr) ->
	BinStr;
binToString(BinStr) ->
	erlang:binary_to_list(BinStr).