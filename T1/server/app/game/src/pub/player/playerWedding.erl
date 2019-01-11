%%%-------------------------------------------------------------------
%%% @author cxl
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 婚礼
%%% @end
%%% Created : 15. 六月 2018 11:41
%%%-------------------------------------------------------------------
-module(playerWedding).
-author("cxl").
%%
%%-include("playerPrivate.hrl").
%%-include("../marriage/marriagePrivate.hrl").
%%
%%%% API
%%-export([msg/1,
%%		 receivedInvitationCard/1,
%%	     loginCheck/0,
%%		 weddingLotterySucc/1,
%%		 marriageWeddingbuyLuckyBagSucc/1,
%%	     playerOffline/0,
%%		 requestEnterWeddingMapACK/1,
%%		 gmDeleteApointmentWedding/1,
%%         deleteRole/1,
%%		 robWeddingRedSucc/1]).
%%
%%-define(Week, 7).
%%
%%
%%
%%msg(#pk_U2GS_appointmentWedding{startTime = StartTime,level = Level}) ->
%%	appointmentWedding({StartTime,Level}),
%%	ok;
%%
%%msg(#pk_U2GS_InvitedPerson{invitedPerson = InverRoleID}) ->
%%
%%	invitedPerson(InverRoleID),
%%	ok;
%%
%%msg(#pk_U2GS_Openketubba{itemUID  = ItemUID,type = Type}) ->
%%
%%	openInvitationCard({ItemUID,Type}),
%%	ok;
%%
%%msg(#pk_U2GS_Givegifs{roleId = RoleID,gifts = GiftsLevel}) ->
%%
%%	giveIfts({RoleID,GiftsLevel}),
%%	ok;
%%
%%msg(#pk_U2GS_OpenInvitePanel{}) ->
%%	sendHasinvitedData(),
%%	ok;
%%
%%msg(#pk_U2GS_EnterWeddingMap{targetRoleID = RoleID}) ->
%%
%%	requestEnterMap(RoleID),
%%	ok;
%%
%%msg(#pk_U2GS_BuyLuckyBag{level = Level,roleID = RoleID}) ->
%%
%%	buyLuckyBag(RoleID,Level),
%%	ok;
%%
%%msg(#pk_U2GS_UseNpcInteractive{isUp = IsUp,npcCode = NpcCode}) ->
%%	weddingInteractive(IsUp,NpcCode),
%%
%%	ok;
%%
%%msg(#pk_U2GS_WeddingLottery{roleID = RoleID,level = Level}) ->
%%	weddingLottery(RoleID,Level),
%%	ok;
%%msg(#pk_U2GS_RobWeddingRed{roleID = RoleID}) ->
%%	robWeddingRed(RoleID),
%%	ok;
%%msg(Msg) ->
%%	?ERROR("recv error msg:~p,~p", [playerState:getRoleID(), Msg]).
%%
%%
%%
%%
%%robWeddingRedSucc({Value})->
%%	playerMoney:addCoin(
%%		?CoinTypeBindDiamond
%%		, erlang:trunc(Value)
%%		, #recPLogTSMoney{
%%			reason = ?CoinSourceWeddingRed,
%%			param = [],
%%			target = ?PLogTS_PlayerSelf,
%%			source = ?PLogTS_PlayerSelf
%%		}),
%%	ok.
%%
%%robWeddingRed(RoleID)->
%%	MyRoleID =  playerState:getRoleID(),
%%	case marriageState:queryWedding(RoleID,0) of
%%		#rec_marriage_wedding{weddingState = ?WeddingState_2,inviteListInfo = InviteListInfo} ->
%%			OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%			case lists:keyfind(MyRoleID,#rec_ketubba.beInviteRoleID,OldInviteListInfo) of
%%				false->
%%					?INFO("Is not invite you:,~p", [RoleID]);
%%				_->
%%					core:sendMsgToActivity(?ActivityType_MarrigeWedding, playerRobWeddingRed,
%%						{RoleID,MyRoleID,self(),playerState:getNetPid()})
%%			end;
%%		_->
%%			skip
%%	end,
%%	ok.
%%
%%gmDeleteApointmentWedding(RoleID)->
%%
%%	core:sendMsgToActivity(?ActivityType_MarrigeWedding, gmDeleteApointmentWedding,
%%		{RoleID}),
%%	ok.
%%
%%%%删除角色
%%deleteRole(RoleID)->
%%
%%	case marriageState:queryRelation(RoleID) of
%%		#rec_marriage{targetRoleID = PartnerRoleID} when PartnerRoleID > 0 ->
%%			case marriageState:queryWedding(RoleID,PartnerRoleID) of
%%				#rec_marriage_wedding{roleID = RoleID_A,weddingState = WeddingState , weddingLevel = Level,
%%					targetRoleID = RoleID_B,inviteListInfo = InviteListInfo}=Old ->
%%					OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%					case WeddingState >= ?WeddingState_2 of
%%						  true->skip;
%%						 _->
%%
%%							 case RoleID of
%%								 RoleID_B ->
%%									 Listcost = ceremony_cost(),
%%									 case lists:keyfind(Level,1,Listcost) of
%%										 {_,CostItemID,Num}->
%%											 Name1 =  core:queryRoleNameByRoleID(RoleID_B),
%%											 case playerMail:createMailGoods(CostItemID, Num, true, 0, RoleID_B, ?ItemSourceWedding) of
%%												 [#recMailItem{}|_] = MailItemList ->
%%													 Title =stringCfg:getString(ceremony_payback_title),
%%													 Content = stringCfg:getString(ceremony_payback_mail, [binToString(Name1)]),
%%													 mail:sendSystemMail(RoleID_B, Title, Content, MailItemList, "");
%%												 _ ->
%%													 ?ERROR("build ItemID=~p, rec=~p", [CostItemID, {RoleID, PartnerRoleID}])
%%
%%											 end;
%%										 _->
%%											 skip
%%									end;
%%								 _->
%%									 skip
%%							 end,
%%							 F = fun
%%									 (#rec_ketubba{itemUID = ItemUID})->
%%										 ets:delete(?EtsketubbaData,ItemUID)
%%								 end,
%%							 lists:foreach(F,OldInviteListInfo),
%%							 ets:delete(?EtsWeddingData,RoleID_A),
%%							 marriageState:saveMarriageWeddingData({delete,Old})
%%					end;
%%
%%				_->
%%					skip
%%					%%invitePlayerDeleteRole()
%%			end;
%%		_->
%%			skip
%%	end,
%%
%%	ok.
%%
%%
%%%%%%邀请人删号
%%%%invitePlayerDeleteRole(BeInviteRoleID)->
%%%%	[_,InviteID] = ceremony_invitation_itemid(),
%%%%	ItemGoodList = playerPackage:getGoodsByID( InviteID,?Item_Location_Bag),
%%%%	Fun = fun
%%%%			  (#rec_item{itemUID = UID})->
%%%%				  case marriageState:queryInviteInfo(UID) of
%%%%					  #rec_ketubba{roleID = RoleID}->
%%%%						  case marriageState:queryWedding(RoleID,0) of
%%%%							  #rec_marriage_wedding{inviteListInfo = InviteListInfo} =Old ->
%%%%
%%%%								  OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%%%								  NewInviteListInfo = lists:keydelete(UID,#rec_ketubba.itemUID,OldInviteListInfo),
%%%%								  StrDataNew  =misc:term_to_string(NewInviteListInfo),
%%%%								  NewWedding =Old#rec_marriage_wedding{inviteListInfo = StrDataNew},
%%%%								  ets:delete(?EtsketubbaData,UID),
%%%%								  ets:insert(?EtsWeddingData, NewWedding),
%%%%								  marriageState:saveMarriageWeddingData(NewWedding);
%%%%							  _->
%%%%								  skip
%%%%						  end;
%%%%					  _->
%%%%						  skip
%%%%				  end
%%%%		  end,
%%%%	lists:foreach(Fun, ItemGoodList),
%%%%	ok.
%%
%%
%%%%请求进入地图
%%requestEnterMap(TargetRoleID)->
%%
%%	RoleID =  playerState:getRoleID(),
%%	case marriageState:queryWedding(TargetRoleID,0) of
%%		#rec_marriage_wedding{weddingState = WeddingState,inviteListInfo = InviteListInfo} ->
%%			case WeddingState == ?WeddingState_2 of
%%				true->
%%					OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%					case lists:keyfind(RoleID,#rec_ketubba.beInviteRoleID,OldInviteListInfo) of
%%						false->
%%							?INFO("Is not invite you:,~p", [RoleID]);
%%						_->
%%							core:sendMsgToActivity(?ActivityType_MarrigeWedding, requestEnterWeddingMap,
%%								{TargetRoleID,RoleID,self()})
%%					end;
%%				_->
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_youaretooearly)
%%			end;
%%			_->
%%				skip
%%	end,
%%	ok.
%%
%%requestEnterWeddingMapACK({MapID,MapPID})->
%%	enterTryAck({MapID,MapPID}),
%%	ok.
%%
%%-spec playerOffline() -> ok.
%%playerOffline() ->
%%	MapID =  playerState:getMapID(),
%%	case marriageState:isWeddingMap(MapID) of
%%		  ttrue->MapPID  = playerState:getMapPid(),
%%			  RoleID =  playerState:getRoleID(),
%%			  core:sendMsgToActivity(?ActivityType_MarrigeWedding, weddingplayerOffline,
%%				  {MapPID,RoleID});
%%		_->
%%			skip
%%    end,
%%	ok.
%%
%%%%婚礼交互 啥子坐板凳，这些
%%weddingInteractive(IsUp, Code)->
%%	MapPID =  playerState:getMapPid(),
%%	RoleID = playerState:getRoleID(),
%%	core:sendMsgToActivity(?ActivityType_MarrigeWedding, weddingInteractive,
%%		{IsUp,Code,MapPID, RoleID}),
%%	ok.
%%
%%%%购买福袋
%%buyLuckyBag(WeddingRoleID,Level)->
%%	SelfRoleID = playerState:getRoleID(),
%%	PLog = #recPLogTSMoney{reason = ?CoinUseReasonWedding, param = [], target = ?PLogTS_Marriage, source = ?PLogTS_PlayerSelf},
%%	case marriageState:queryWedding(WeddingRoleID,0) of
%%		#rec_marriage_wedding{weddingState = WeddingState,inviteListInfo = InviteListInfo} ->
%%			OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%
%%			BuyNum = playerDaily:getDailyCounter(?DailyType_ceremony_bag_limit,0),
%%			MaxNum = ceremony_bag_dailylimit(),
%%			case WeddingState == ?WeddingState_2 andalso BuyNum < MaxNum of
%%				true->
%%					case lists:keyfind(SelfRoleID,#rec_ketubba.beInviteRoleID,OldInviteListInfo) of
%%						false->
%%							?INFO("You is not in this wedding ~p",[SelfRoleID]);
%%						#rec_ketubba{} ->
%%							case getCfg:getCfgByKey(cfg_ceremonybag, Level) of
%%								#ceremonybagCfg{announce = Announce,price = [CostType,PirceNum],
%%									reward1 = Reward1,limit = Limit,weight1 = Weight1,
%%									reward2 = Reward2,limit2 = Limit2,weight2 = Weight2,
%%									reward3 = Reward3,limit3 = Limit3,weight3 = Weight3} ->
%%									case playerMoney:canUseCoin(CostType,PirceNum) of
%%										true ->
%%											case playerMoney:useCoin(CostType,PirceNum, PLog) of
%%												true->
%%													AllWeight = Weight1 +Weight2 +Weight3,
%%													RandWeight =  misc:rand(1, AllWeight),
%%
%%													{Reward,ItemNum}=
%%														if
%%															RandWeight =< Weight1->
%%																[Min,Max] = Limit,
%%																Num=misc:rand(Min, Max),
%%																{Reward1,Num};
%%															RandWeight =< Weight1 +Weight2 ->
%%
%%																[Min,Max] = Limit2,
%%																Num=misc:rand(Min, Max),
%%																{Reward2,Num};
%%															true ->
%%																[Min,Max] = Limit3,
%%																Num=misc:rand(Min, Max),
%%																{Reward3,Num}
%%
%%														end,
%%													Plog1 =  #recPLogTSItem{
%%														old = 0,
%%														new = ItemNum,
%%														change = ItemNum,
%%														target = ?PLogTS_PlayerSelf,
%%														source = ?PLogTS_Marriage,
%%														gold = 0,
%%														goldtype = 0,
%%														changReason = ?ItemSourceWedding,
%%														reasonParam = Reward
%%													},
%%													{BindDiamondNum,NeedDiamondNum} = calculateDiamondTypeUseNum(CostType,PirceNum),
%%													playerDaily:incDailyCounter(?DailyType_ceremony_bag_limit, 0),
%%													playerPackage:addGoodsAndMail(Reward, ItemNum, true, 0, Plog1),
%%													core:sendMsgToActivity(?ActivityType_MarrigeWedding, marriageWeddingbuyLuckyBag,
%%														{WeddingRoleID, SelfRoleID,PirceNum,Level,Announce,Reward,ItemNum,{BindDiamondNum,NeedDiamondNum}});
%%												_->
%%													playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotEnoughMoney)
%%											end;
%%										_ ->
%%											playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotEnoughMoney)
%%									end;
%%								_->
%%									skip
%%							end
%%					end;
%%
%%				_->
%%				skip
%%			end;
%%		_->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_disappear)
%%	end,
%%	ok.
%%
%%marriageWeddingbuyLuckyBagSucc({_Level})->
%%
%%	ok.
%%
%%%%婚礼抽奖
%%weddingLottery(WeddingRoleID,Level)->
%%
%%	SelfRoleID = playerState:getRoleID(),
%%	BuyNum = playerDaily:getDailyCounter(?DailyType_ceremony_plate_limit,0),
%%	case marriageState:queryWedding(WeddingRoleID,0) of
%%		#rec_marriage_wedding{weddingState = WeddingState,inviteListInfo = InviteListInfo} ->
%%			BuyNum = playerDaily:getDailyCounter(?DailyType_ceremony_plate_limit,0),
%%			MaxNum = ceremony_plate_dailylimit(),
%%			case WeddingState == ?WeddingState_2 andalso BuyNum < MaxNum of
%%				true->
%%					OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%
%%					case lists:keyfind(SelfRoleID,#rec_ketubba.beInviteRoleID,OldInviteListInfo) of
%%						false->
%%							?INFO("You is not in this wedding ~p",[SelfRoleID]);
%%						#rec_ketubba{}->
%%
%%							Ceremony_platecost =   ceremony_platecost(),
%%							case lists:keyfind(Level,1,Ceremony_platecost) of
%%								false->
%%									?INFO("lottery index is not in ceremony_platecost ~p",[SelfRoleID]);
%%								{Index,CostType,CostNum} ->
%%									PLog = #recPLogTSMoney{reason = ?CoinUseReasonWedding, param = [], target = ?PLogTS_Marriage, source = ?PLogTS_PlayerSelf},
%%									case playerMoney:canUseCoin(CostType,CostNum) of
%%										true ->
%%											case playerMoney:useCoin(CostType, CostNum, PLog) of
%%												true->
%%													{RewarList,Plateannounce} =
%%													case Index of
%%														  1->{ceremony_plate1(),ceremony_plateannounce1()};
%%														  2->{ceremony_plate2(),ceremony_plateannounce2()};
%%														  _-> {[],[]}
%%													end,
%%													Len = erlang:length(RewarList),
%%													Idx=misc:rand(1, Len),
%%													case lists:keyfind(Idx,1,RewarList) of
%%														{_,RItemID,Nu}->
%%
%%															Isbroadcast =
%%															case lists:keyfind(Idx,1,Plateannounce) of
%%																  false->false;
%%																  _->
%%																	  true
%%															end,
%%															Plog1 =  #recPLogTSItem{
%%																old = 0,
%%																new = Nu,
%%																change = Nu,
%%																target = ?PLogTS_PlayerSelf,
%%																source = ?PLogTS_Marriage,
%%																gold = 0,
%%																goldtype = 0,
%%																changReason = ?ItemSourceWedding,
%%																reasonParam = RItemID
%%															},
%%															{BindDiamondNum,NeedDiamondNum} = calculateDiamondTypeUseNum(CostType,CostNum),
%%															playerDaily:incDailyCounter(?DailyType_ceremony_plate_limit, 0),
%%															playerPackage:addGoodsAndMail(RItemID, Nu, true, 0, Plog1),
%%															core:sendMsgToActivity(?ActivityType_MarrigeWedding, marriageWeddingLottery,
%%																{WeddingRoleID, SelfRoleID,RItemID,CostNum,Idx,Isbroadcast,Level,Nu,{BindDiamondNum,NeedDiamondNum}});
%%														_->
%%															?INFO("Not find this indx ~p",[Idx])
%%													end;
%%												_->
%%													playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotEnoughMoney)
%%											end;
%%										_ ->
%%											playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotEnoughMoney)
%%									end
%%							end
%%				    end;
%%				_->
%%					skip
%%			end;
%%		_->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_disappear)
%%	end,
%%
%%	ok.
%%
%%weddingLotterySucc(_Data)->
%%
%%	ok.
%%
%%
%%%%送礼
%%giveIfts({RoleID,Gifts})->
%%
%%	Ceremony_giftList =  marriageState:ceremony_gift(),
%%	MyRoleID = playerState:getRoleID(),
%%	case marriageState:queryRelation(RoleID) of
%%		#rec_marriage{targetRoleID = PartnerRoleID} when PartnerRoleID > 0 ->
%%			case MyRoleID =/=RoleID andalso MyRoleID =/= PartnerRoleID of
%%				true->
%%					case marriageState:queryWedding(RoleID,PartnerRoleID) of
%%						#rec_marriage_wedding{inviteListInfo = InviteListInfo} ->
%%							OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%							case lists:keyfind(MyRoleID,#rec_ketubba.beInviteRoleID,OldInviteListInfo) of
%%								false->
%%									skip;
%%								#rec_ketubba{ givegifts = Givegifts}  ->
%%
%%									case  Givegifts >0of
%%										true->skip;
%%										_->
%%											case lists:keyfind(Gifts,1,Ceremony_giftList) of
%%												fasle->?INFO("this gifts is not in Ceremony_giftList ~p",[Gifts]);
%%												{ItemID,ComondType,Pirce}->
%%													case playerMoney:canUseCoin(ComondType,Pirce) of
%%														true ->
%%															PLog = #recPLogTSMoney{reason = ?CoinUseReasonWedding, param = [], target = ?PLogTS_Marriage, source = ?PLogTS_PlayerSelf},
%%															case playerMoney:useCoin(ComondType, Pirce, PLog) of
%%																true->
%%
%%																	{BindDiamondNum,NeedDiamondNum} = calculateDiamondTypeUseNum(ComondType,Pirce),
%%																	RoleName1 = core:queryRoleNameByRoleID(RoleID),
%%																	RoleName2 = core:queryRoleNameByRoleID(PartnerRoleID),
%%																	Title =stringCfg:getString(ceremony_gift_title),
%%																	Content = stringCfg:getString(ceremony_gift_mail, [binToString(RoleName1),binToString(RoleName2)]),
%%																	marriageWeddingLogic:sendMailReward({ItemID,MyRoleID,Title,Content}),
%%																	core:sendMsgToActivity(?ActivityType_MarrigeWedding, marriagegiveIfts,
%%																		{RoleID, MyRoleID, Gifts,{BindDiamondNum,NeedDiamondNum}});
%%																_->
%%																	skip
%%															end;
%%														_ ->
%%															playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotEnoughMoney)
%%													end
%%											end
%%									end
%%							end;
%%						_->
%%							skip
%%					end;
%%				_->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end,
%%
%%	ok.
%%
%%%%登录检查
%%loginCheck()->
%%	[MarrigeID,InviteID] = ceremony_invitation_itemid(),
%%	ItemGoodList_1 = playerPackage:getGoodsByID( MarrigeID,?Item_Location_Bag),
%%	ItemGoodList_2 = playerPackage:getGoodsByID( InviteID,?Item_Location_Bag),
%%	ItemGoodList = ItemGoodList_1 ++ ItemGoodList_2,
%%	Fun = fun
%%			  (#rec_item{itemUID = UID}, Acc)->
%%				  case marriageState:queryInviteInfo(UID) of
%%					  #rec_ketubba{type = Type,roleID = RoleID}->
%%						  case marriageState:queryWedding(RoleID,0) of
%%							  #rec_marriage_wedding{targetRoleID = PartnerID, startTime = StartTime,weddingState = WeddingState} ->
%%
%%								  TargetName =  core:queryRoleNameByRoleID(RoleID),
%%								  PartnerName =  core:queryRoleNameByRoleID(PartnerID),
%%								  Ketubba= #pk_KetubbaData{roleId =RoleID,partnerRoleId =PartnerID,startTime =StartTime,
%%									  itemUID = UID,type = Type, name = TargetName,partnerName =PartnerName,weddingState = WeddingState },
%%								  [Ketubba|Acc];
%%							  _->
%%								  Acc
%%						  end;
%%					  _->
%%						  Acc
%%				  end
%%		  end,
%%	NewInvitCardList =  lists:foldl(Fun, [], ItemGoodList),
%%	Msg = #pk_GS2U_LoginInitWeddingKetubba{ketubbaList = NewInvitCardList},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%
%%%%收到请帖婚书
%%receivedInvitationCard(#rec_item{itemID = ItemID,itemUID = ItemUID})->
%%	[ItemID_1,ItemID_2] = ceremony_invitation_itemid(),
%%	case ItemID ==ItemID_1 orelse ItemID == ItemID_2   of
%%		 true ->	case marriageState:queryInviteInfo(ItemUID) of
%%						#rec_ketubba{type = Type,roleID = RoleID}->
%%							case marriageState:queryWedding(RoleID,0) of
%%								#rec_marriage_wedding{weddingState =WeddingState, targetRoleID =PartnerRoleId,startTime =StartTime} ->
%%
%%									TargetName =  core:queryRoleNameByRoleID(RoleID),
%%									PartnerName =  core:queryRoleNameByRoleID(PartnerRoleId),
%%									Ketubba= #pk_KetubbaData{roleId =RoleID,partnerRoleId =PartnerRoleId,startTime =StartTime,itemUID = ItemUID,type = Type,
%%										name = TargetName,partnerName =PartnerName,weddingState = WeddingState },
%%
%%									Msg = #pk_GS2U_receivedInvitationCard{ketubba = Ketubba},
%%									playerMsg:sendNetMsg(Msg);
%%								_->
%%									?INFO("not find wedding for this roleID ~p",[RoleID])
%%							end;
%%						_->
%%							skip
%%					end;
%%		_->
%%			skip
%%	end,
%%
%%	ok.
%%%%打开请帖
%%openInvitationCard({ItemUID,Type})->
%%
%%	case marriageState:queryInviteInfo(ItemUID) of
%%		#rec_ketubba{type = Type,givegifts = Givegifts,roleID = TargetRoleID}->
%%			case marriageState:queryWedding(TargetRoleID,0) of
%%				#rec_marriage_wedding{weddingLevel = Level,weddingState = WeddingState,
%%					allGifts =AllGifts, bindGifts = BindGifts,inviteListInfo = InviteListInfo}  ->
%%					case WeddingState == ?WeddingState_3 of
%%						  true->
%%							  playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_disappear),
%%							  deleteItemForUid(ItemUID);
%%						_->
%%							IsGivegifts =
%%							case Givegifts>0 of
%%								  true->true;
%%								_->
%%									false
%%							end,
%%							case Type  of
%%								 1 ->
%%									 Msg = #pk_GS2U_OpenketubbaResult{roleId =TargetRoleID,type = Type,level = Level,
%%										 givegifts  = AllGifts , bindGivegifts = BindGifts,
%%										 isGivegifs = IsGivegifts,givegiftsList = [] },
%%									 playerMsg:sendNetMsg(Msg);
%%
%%								 2 ->
%%									 OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%									 F = fun
%%											 (#rec_ketubba{type = 2 },Arr)->
%%												 Arr;
%%											 (#rec_ketubba{beInviteRoleID  = InvRoleID,giftsItemID = GiftsItemID },Arr)->
%%												 case GiftsItemID>0 of
%%													   true-> [marriageState:createInvitedPlayerData(InvRoleID,GiftsItemID)|Arr];
%%												   		_->
%%															Arr
%%												  end
%%
%%										 end,
%%									 GivegiftsList  = lists:foldl(F,[],OldInviteListInfo),
%%									 Msg1 = #pk_GS2U_OpenketubbaResult{roleId =TargetRoleID,type = Type,level = Level,
%%										 givegifts  = AllGifts , bindGivegifts = BindGifts,
%%										 isGivegifs = IsGivegifts,givegiftsList = GivegiftsList },
%%									 playerMsg:sendNetMsg(Msg1);
%%								 _->skip
%%							end
%%					end;
%%				_->
%%
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_disappear),
%%					deleteItemForUid(ItemUID)
%%			end;
%%		_->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_disappear),
%%			deleteItemForUid(ItemUID)
%%	end,
%%	ok.
%%
%%
%%%%邀请
%%invitedPerson(InviteRoleID)->
%%
%%	RoleID = playerState:getRoleID(),
%%	case marriageState:queryRelation(RoleID) of
%%		#rec_marriage{targetRoleID = PartnerRoleID} when PartnerRoleID > 0 ->
%%			case InviteRoleID =/=RoleID andalso InviteRoleID =/= PartnerRoleID of
%%				  true->
%%					  case marriageState:queryWedding(RoleID,PartnerRoleID) of
%%						  #rec_marriage_wedding{ roleID = TargetRoleID,weddingState = WeddingState, weddingLevel = Level,startTime =StartTime,  inviteListInfo = InviteListInfo} = OldWedding ->
%%							  case WeddingState < ?WeddingState_2 of
%%								    true->
%%										OldInviteListInfo =  misc:string_to_term(InviteListInfo),
%%										InviteLen =  erlang:length(OldInviteListInfo),
%%										MaxNumList =  ceremony_maxnum(),
%%										case lists:keyfind(Level,1,MaxNumList) of
%%											false->?INFO("this Level is Not in MaxNumList ~p",[Level]);
%%											{_,MaxNum}->
%%												%%这里配置的最大人数不包括新人，所以+2
%%												case InviteLen>=MaxNum+2 of
%%													true->playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_full);
%%													_->
%%														case lists:keyfind(InviteRoleID,#rec_ketubba.beInviteRoleID,OldInviteListInfo) of
%%															false->
%%																[_,ItemID] = ceremony_invitation_itemid(),
%%
%%																Name =  core:queryRoleNameByRoleID(InviteRoleID),
%%																Name1 =  core:queryRoleNameByRoleID(RoleID),
%%																Name2 =  core:queryRoleNameByRoleID(PartnerRoleID),
%%																ItemUID=
%%																	case playerMail:createMailGoods(ItemID, 1, true, 0, InviteRoleID, ?ItemSourceWedding) of
%%																		[#recMailItem{itemUID = Uid}|_] = MailItemList ->
%%
%%																			MailTime =	time2:secToMysqlTimeStr(StartTime),
%%																			Title =stringCfg:getString(ceremony_invite_title),
%%																			Content = stringCfg:getString(ceremony_invite_mail,
%%																				[binToString(Name1),binToString(Name2), MailTime]),
%%																			mail:sendSystemMail(InviteRoleID, Title, Content, MailItemList, ""),
%%																			Uid;
%%																		_ ->
%%																			?ERROR("build ItemID=~p, rec=~p", [ItemID, {RoleID, PartnerRoleID}]),
%%																			0
%%																	end,
%%
%%
%%																Newketubba =   #rec_ketubba{itemUID =ItemUID,name = Name, itemID = ItemID, roleID = TargetRoleID,beInviteRoleID =InviteRoleID,
%%																	time =StartTime,givegifts = 0,giftsItemID = 0,type = 1},
%%																NewnviteListInfo = [Newketubba|OldInviteListInfo],
%%																StrDataNew = misc:term_to_string(NewnviteListInfo),
%%
%%																NewWedding =OldWedding#rec_marriage_wedding{inviteListInfo = StrDataNew},
%%																ets:insert(?EtsketubbaData, Newketubba),
%%																ets:insert(?EtsWeddingData, NewWedding),
%%																marriageState:saveMarriageWeddingData(NewWedding),
%%																InvitedData = marriageState:createInvitedPlayerData(InviteRoleID,0),
%%																Msg = #pk_GS2U_InvitedPersonResult{result = true,data = InvitedData},
%%																playerMsg:sendNetMsg(Msg);
%%															_->
%%																playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_alredyinvited)
%%														end
%%												end
%%										end;
%%								    _->
%%										playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_toolatetoinvite)
%%                              end;
%%						  _->
%%							  skip
%%					  end;
%%					_->
%%						playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_selfinvite)
%%			end;
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%%%发被邀请了人的信息
%%sendHasinvitedData()->
%%	HasinvitedData = createHasinvitedData(),
%%	Msg = #pk_GS2U_OpenInvitePanelResult{invitedPlayerList = HasinvitedData},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%createHasinvitedData()->
%%
%%	RoleID = playerState:getRoleID(),
%%	case marriageState:queryRelation(RoleID) of
%%		#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
%%			case marriageState:queryWedding(RoleID,TargetRoleID) of
%%				#rec_marriage_wedding{inviteListInfo = InviteListInfo} ->
%%					OldInviteListInfo = misc:string_to_term(InviteListInfo),
%%					F =
%%						fun(#rec_ketubba{type = 2},Arr)->
%%							Arr;
%%						  (#rec_ketubba{beInviteRoleID =BeInviteRoleID,giftsItemID =  GiftsItemID },Arr)->
%%							case core:queryRoleKeyInfoByRoleID(BeInviteRoleID) of
%%								{} ->
%%									InviteData = #pk_InvitedPlayerData{roleId =BeInviteRoleID,name = "",level = 0,career =?Career_10_Warrior,
%%									                      race = 0,sex = 0,head = 0,giveGiftsID = GiftsItemID},
%%									[InviteData|Arr];
%%								#?RoleKeyRec{roleName = Name, career = Career, level = Lvl,
%%									race = Race, sex = Sex, head = Head} ->
%%									InviteData = #pk_InvitedPlayerData{roleId =BeInviteRoleID,name = Name,level = Lvl,career =Career,
%%										race = Race,sex = Sex,head =Head,giveGiftsID = GiftsItemID },
%%									[InviteData|Arr]
%%							end
%%						end,
%%
%%					lists:foldl(F,[],OldInviteListInfo);
%%				_->
%%					[]
%%			end ;
%%		_ ->
%%			[]
%%	end.
%%
%%%%预约婚礼
%%appointmentWedding({StartTime,Level})->
%%
%%	case core:isCross() of
%%		true ->
%%			skip;
%%		_ ->
%%			case playerMainMenu:isOpen(?ModeType_Marriage) andalso variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_WeddingSite) of
%%				true ->
%%					RoleID = playerState:getRoleID(),
%%					case marriageState:queryRelation(RoleID) of
%%						#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
%%							case marriageState:queryWedding(RoleID,TargetRoleID) of
%%								#rec_marriage_wedding{} ->
%%									playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_alreadybooked),
%%									Msg =  #pk_GS2U_AppointmentWeddingResult{result = false},
%%									playerMsg:sendNetMsg(Msg);
%%								_->
%%
%%									{{_, _, _}, {Hour, _, _}} = time:convertSec2DateTime(StartTime),
%%									LastSeconds =   StartTime- time:getSyncTime1970FromDBS(),
%%									LastDay = LastSeconds /?DayOfSeconds,
%%									case LastSeconds >0 andalso LastDay =<?Week andalso Hour >9 of
%%										true ->
%%											Listcost = ceremony_cost(),
%%											case lists:keyfind(Level,1,Listcost) of
%%												{Lv,CostItemID,Num}->
%%
%%													case  playerPackage:getGoodsNumByID(?Item_Location_Bag,CostItemID)>=Num of
%%														true ->
%%															PLog = #recPLogTSItem{
%%																old = 0,
%%																new = 0,
%%																change = -Num,
%%																target = ?PLogTS_PlayerSelf,
%%																source = ?PLogTS_PlayerSelf,
%%																gold = 0,
%%																goldtype = 0,
%%																changReason = ?ItemDeleteWedding,
%%																reasonParam = CostItemID
%%															},
%%															case playerPackage:delGoodsByID(?Item_Location_Bag, CostItemID, Num, PLog) of
%%																true ->
%%																	Data_1 = createMarriageContract({RoleID,TargetRoleID,StartTime,Lv,RoleID}),
%%																	Data_2 = createMarriageContract({RoleID,TargetRoleID,StartTime,Lv,TargetRoleID}),
%%																	KetubbaList =Data_1 ++Data_2,
%%																	StrDataNew = misc:term_to_string(KetubbaList),
%%																	NewWedding = #rec_marriage_wedding{roleID = RoleID,targetRoleID = TargetRoleID,
%%																		weddingLevel = Lv,allGifts = 0,weddingState = ?WeddingState_1,
%%																		startTime = StartTime,inviteListInfo = StrDataNew},
%%																	ets:insert(?EtsketubbaData, KetubbaList),
%%																	ets:insert(?EtsWeddingData, NewWedding),
%%																	marriageState:saveMarriageWeddingData({insert,NewWedding}),
%%
%%																	Msg =  #pk_GS2U_AppointmentWeddingResult{result = true},
%%																	playerMsg:sendNetMsg(Msg);
%%																_->
%%																	skip
%%															end;
%%														_->
%%															playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_lackofitem)
%%
%%													end;
%%												_->
%%													?INFO("this level is not in ceremony_cost ~p",[Level])
%%											end;
%%										_->
%%
%%											playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_validtime),
%%											Msg =  #pk_GS2U_AppointmentWeddingResult{result = false},
%%											playerMsg:sendNetMsg(Msg)
%%									end
%%							end ;
%%						_ ->
%%							playerMsg:sendErrorCodeMsg(?ErrorCode_ceremony_unmarried)
%%					end;
%%				_ ->
%%					skip
%%			end
%%	end.
%%
%%
%%%%创建婚书
%%createMarriageContract({ RoleID,TargetRoleID,StartTime,Lv,SendRoleID}) ->
%%
%%
%%	[MarriageItemID,_] = ceremony_invitation_itemid(),
%%	BookgiftList = ceremony_bookgift(),
%%	RewardList =
%%	case lists:keyfind(Lv,1,BookgiftList) of
%%		{_,ID,N}->playerMail:createMailGoods(ID, N, true, 0, TargetRoleID, ?ItemSourceWedding);
%%		_->
%%			[]
%%	end,
%%	ItemUID1=
%%	case playerMail:createMailGoods(MarriageItemID, 1, true, 0, TargetRoleID, ?ItemSourceWedding) of
%%		[#recMailItem{itemUID = Uid}|_] = MailItemList ->
%%			Name1 =  core:queryRoleNameByRoleID(RoleID),
%%			Name2 =  core:queryRoleNameByRoleID(TargetRoleID),
%%			MailTime =time2:secToMysqlTimeStr(StartTime),
%%			Title =stringCfg:getString(ceremony_book_title),
%%			Content = stringCfg:getString(ceremony_book_mail, [binToString(Name1),binToString(Name2), MailTime]),
%%			mail:sendSystemMail(SendRoleID, Title, Content, MailItemList++RewardList, ""),
%%			Uid;
%%		_ ->
%%			?ERROR("build ItemID=~p, rec=~p", [MarriageItemID, {RoleID, TargetRoleID}]),
%%			0
%%	end,
%%	TargetName =  core:queryRoleNameByRoleID(TargetRoleID),
%%	[#rec_ketubba{itemUID =ItemUID1,itemID = MarriageItemID,
%%	roleID = RoleID,beInviteRoleID =SendRoleID, name = TargetName,
%%		time =StartTime,givegifts = 0,type = 2}].
%%
%%
%%%% 尝试进入反馈
%%%% 地图已存在，可以直接进入
%%enterTryAck({MapID, MapPid}) ->
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
%%% 此处为{}表示尚未指定需要进入的MapID，跳过checkMyMap/1中的第0项检查
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
%%deleteItemForUid(ItemUid)->
%%	case playerPackage:getGoodsByUID(ItemUid, ?Item_Location_Bag) of
%%		#rec_item{itemID = ItemID} ->
%%			Plog = #recPLogTSItem{
%%				old = 0,
%%				new = 0,
%%				change = 0,
%%				target = ?PLogTS_System,
%%				source = ?PLogTS_PlayerSelf,
%%				gold = 0,
%%				goldtype = 0,
%%				changReason = ?ItemDeleteWedding,
%%				reasonParam = ItemID
%%			},
%%			playerPackage:deleteGoodsByUID(?Item_Location_Bag, ItemUid, Plog);
%%
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%binToString(BinStr) when erlang:is_list(BinStr) ->
%%	BinStr;
%%binToString(BinStr) ->
%%	erlang:binary_to_list(BinStr).
%%
%%calculateDiamondTypeUseNum(?CoinUseTypeDiamond,Num)->
%%	%BindDiamondNum = playerState:getCoin(?CoinTypeBindDiamond),
%%	%case BindDiamondNum >= Num of
%%	%	true ->
%%	%		{Num,0};
%%	%	_ ->
%%	%		#globalsetupCfg{setpara = [ValueRatio]} = getCfg:getCfgPStack(cfg_globalsetup, star_moon_exchange),
%%	%		NeedDiamondNum = trunc((Num - BindDiamondNum) / ValueRatio),
%%	%		{BindDiamondNum,NeedDiamondNum}
%%	%end;
%%	{Num, 0};
%%calculateDiamondTypeUseNum(?CoinUseTypeDiamondJustNotBind,Num)->
%%	{0,Num};
%%calculateDiamondTypeUseNum(_,_)->
%%
%%	{0,0}.
%%
%%
%%%%预约成功的奖励
%%ceremony_bookgift() ->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_bookgift),
%%	List.
%%
%%%%婚书请帖ID
%%ceremony_invitation_itemid() ->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_invitation_itemid),
%%	List.
%%
%%%%预约消耗
%%ceremony_cost() ->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_cost),
%%	List.
%%
%%%%最大人数
%%ceremony_maxnum()->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_maxnum),
%%	List.
%%
%%
%%%%转盘1
%%ceremony_plate1()->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_plate1),
%%	List.
%%%%转盘2
%%ceremony_plate2()->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_plate2),
%%	List.
%%
%%%%使用消费类型
%%ceremony_platecost()->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_platecost),
%%	List.
%%
%%%%广播索引1
%%ceremony_plateannounce1()->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_plateannounce1),
%%	List.
%%
%%%%广播索引1
%%ceremony_plateannounce2()->
%%	#globalsetupCfg{setpara = List} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_plateannounce2),
%%	List.
%%
%%
%%%%福袋购买次数
%%ceremony_bag_dailylimit()->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_bag_dailylimit),
%%	List.
%%
%%%%抽奖次数限制
%%ceremony_plate_dailylimit()->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, ceremony_plate_dailylimit),
%%	List.
