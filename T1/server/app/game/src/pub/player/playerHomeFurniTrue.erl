%%%-------------------------------------------------------------------
%%% @author chenxiaolong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%%% 家园小屋
%%% @end
%%% Created : 17. 十一月 2017 17:25
%%%-------------------------------------------------------------------
-module(playerHomeFurniTrue).
-author("chenxiaolong").
-include("gsInc.hrl").
-include("playerPrivate.hrl").
%%
%%%% API
%%-export([msg/1,
%%	sendHomeFurniTureInfo/2,
%%	getAwardsEachMonday/1,
%%	getHomeHouseState/2,
%%	playerOffline/0,
%%	checkHomeIsDecorate/1,
%%	homeSleepOver/1
%%	%%homeStylishRepair/0
%%]).

%%
%%-define(Monday, 1).
%%-define(RewardNum, 1).
%%
%%
%%msg(#pk_U2GS_SetGreetings{homeID = HomeID,areaType = AreaType,greetings = Greetings}) ->
%%	%% 设置问候语
%%	setGreetings(HomeID,AreaType,Greetings),
%%	ok;
%%
%%msg(#pk_U2GS_SaveFurniTrueScheme{homeID = HomeID,areaType = AreaType,change_wallID = Change_wallID,chang_floorID = Chang_floorID, add_furnitrueData  =
%%AddfurnitrueData,change_furnitrueData = Change_furnitrueData}) ->
%%	%% 保存小屋设计方案
%%	saveFurniTrueScheme(HomeID,AreaType,AddfurnitrueData,Change_wallID,Chang_floorID,Change_furnitrueData),
%%	ok;
%%
%%msg(#pk_U2GS_DelSenceTheFurniTrue{homeID = HomeID,areaType = AreaType,uid = Uid}) ->
%%	%% 删除
%%	delSenceTheFurniTrue(HomeID,AreaType,Uid),
%%	ok;
%%
%%msg(#pk_U2GS_LoadFurniTrueScheme{homeID = HomeID,areaType = AreaType}) ->
%%	%% 加载小屋 设计方案
%%	loadFurniTrueScheme(HomeID,AreaType,0),
%%	ok;
%%
%%msg(#pk_U2GS_ExtendArea{homeID = HomeID,areaType = AreaType}) ->
%%	%% 扩展面积高度
%%	extendArea(HomeID,AreaType),
%%	ok;
%%
%%msg(#pk_U2GS_GivingFurniTrueForPartner{homeID = HomeID,areaType = AreaType,partherRoleID = PartherRoleID,itemID = ItemID,num = Num}) ->
%%	%% 赠送伴侣
%%	givingFurniTrueForPartner({HomeID,AreaType,PartherRoleID,ItemID,Num}),
%%	ok;
%%
%%msg(#pk_U2GS_ChangedecorateModel{homeID = HomeID,areaType = AreaType,isDecorate = IsDecorate}) ->
%%	%% 改变小屋 状态模式  装修，和未装修
%%	changedecorateModel({HomeID,AreaType,IsDecorate}),
%%	ok;
%%
%%msg(#pk_U2GS_UseFurnitrue{homeID = HomeID,itemUID = ItemUID,areaType = AreaType,isUp = IsUp}) ->
%%%% 使用家具
%%useFurnitrue({HomeID,AreaType,ItemUID,IsUp}),
%%ok;
%%
%%msg(#pk_U2GS_Invitefriendstobed{roleID = TargetRoleID, homeID = HomeID,itemUID = ItemUID,areaType = AreaType}) ->
%%	invitefriendstobed(TargetRoleID,HomeID,ItemUID,AreaType),
%%	ok;
%%
%%
%%
%%
%%msg(Msg) ->
%%	?ERROR("receive error msg:~p,~p", [playerState:getRoleID(), Msg]),
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
%%	ok.
%%
%%
%%
%%homeSleepOver({Time})->
%%	playerDaily:addDailyCounter(?DailyType_HomeSleep_AllTime,0,Time ),
%% ok;
%%homeSleepOver(_)->
%%	ok.
%%
%%%%邀请好友
%%invitefriendstobed(TargetRoleID,HomeID,ItemUID,AreaType)->
%%
%%	InviteID = playerState:getRoleID(),
%%	case InviteID =/= TargetRoleID of
%%		  true->
%%			  case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
%%				  #?RoleKeyRec{} ->
%%					  Msg = #pk_GS2U_Invitefriendstobed
%%					  {
%%						  roleID = InviteID,
%%						  homeID = HomeID,
%%						  itemUID = ItemUID,
%%						  areaType = AreaType
%%					  },
%%					  case core:queryNetPidByRoleID(TargetRoleID) of
%%						  NetPid when erlang:is_pid(NetPid) ->
%%							  playerMsg:sendNetMsg(NetPid, Msg);
%%						  _ ->
%%							  skip
%%					  end,
%%					  playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaJoinSucc);
%%				  _ ->
%%					  playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaPlayerNotOnline)
%%			  end;
%%		_->
%%			?ERROR("You can't inviter youerself")
%%	end,
%%
%%	ok.
%%
%%%%使用家具交互
%%useFurnitrue({HomeID,AreaType,ItemUID,IsUp})
%%	when AreaType == ?Home_House ->
%%	RoleID = playerState:getRoleID(),
%%	CumulativeTime =   playerDaily:getDailyCounter(?DailyType_HomeSleep_AllTime,0),
%%	psMgr:sendMsg2PS(?HomeOtp, useFurnitrue, {HomeID,AreaType,ItemUID,IsUp,RoleID,playerState:getMapPlayerEts(),CumulativeTime}),
%%	ok;
%%useFurnitrue(_)->
%%
%%	ok.
%%
%%
%%%%切换家具 装修模式
%%changedecorateModel({HomeID,AreaType,IsDecorate})
%%	when AreaType == ?Home_House->
%%	RoleID = playerState:getRoleID(),
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master of
%%		true ->
%%
%%			case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%				[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						[] ->
%%							skip;
%%						_->
%%							case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								false ->
%%									skip;
%%								#recHomeFurniTrue{isdecorate = OldDecorate} = OldFurniTure ->
%%									case OldDecorate =:= IsDecorate of
%%										  true-> skip;
%%
%%										   _->
%%											   NewData =  OldFurniTure#recHomeFurniTrue{isdecorate =IsDecorate },
%%											   ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%											   StrDataNew = misc:term_to_string(ListDataNew),
%%											   AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%											   ets:insert(?HomeAreaEts, AreaNew),
%%											   homeInterface:saveHome(AreaNew),
%%
%%											   case IsDecorate of
%%												    true ->
%%														PlayerCode = playerState:getPlayerCode(),
%%														Msg = #pk_GS2U_ChangedecorateModelResult{isSucc = true },
%%														EtsPlayer = playerState:getMapPlayerEts(),
%%														ets:foldl(fun(#recMapObject{netPid = NetPid,code = Code}, _) ->
%%																	case Code =/=PlayerCode of
%%																		 true -> playerMsg:sendNetMsg(NetPid, Msg);
%%																		_->
%%																			skip
%%																	end
%%																  end, 0, EtsPlayer),
%%
%%														playerMsg:sendNetMsg(Msg);
%%												   _->
%%													   skip
%%											   end
%%									end
%%							end
%%					end;
%%
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%			end;
%%		_->
%%			skip
%%	end,
%%	ok;
%%
%%changedecorateModel(_)->
%%
%%	ok.
%%
%%
%%%% 赠送伴侣
%%givingFurniTrueForPartner({HomeID,AreaType,PartherRoleID,ItemID,Num})
%%	when AreaType == ?Home_House->
%%	RoleID = playerState:getRoleID(),
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	PartNerRole = homeInterface:queryHomeRole(HomeID, PartherRoleID),
%%	case HomeRole =:= ?HomeRole_Partner andalso PartNerRole =:= ?HomeRole_Master of
%%		true ->
%%
%%			case  playerPackage:getGoodsNumByID(?Item_Location_FurniTrue,ItemID)>=Num of
%%				true ->
%%					PLog = #recPLogTSItem{
%%						old = 0,
%%						new = 0,
%%						change = -1,
%%						target = ?PLogTS_PlayerSelf,
%%						source = ?PLogTS_PlayerSelf,
%%						gold = 0,
%%						goldtype = 0,
%%						changReason = ?ItemUseReasonPlayer,
%%						reasonParam = ItemID
%%					},
%%					case playerPackage:delGoodsByID(?Item_Location_FurniTrue, ItemID, Num, PLog) of
%%						true ->
%%
%%							TempMailItems=playerMail:createMailGoods(ItemID, Num, true,0, RoleID, ?ItemDeleteReasonHome),
%%							Title = stringCfg:getString(home_gift_title),
%%							Content =stringCfg:getString(home_gift_mail,[playerState:getName()]),
%%							mail:sendSystemMail(PartherRoleID, Title, Content, TempMailItems,""),
%%
%%
%%						%%#globalsetupCfg{setpara = [Add, Max]} = getCfg:getCfgPStack(cfg_globalsetup, home_interview_addlikability),
%%						%%V = daily2State:queryDaily2(RoleID, PartherRoleID, ?Daily2Type_HomeVisitAddCloseness),
%%						%%AddReal =
%%						%%	case V + Add > Max of
%%						%%		true ->
%%						%%			Max - V;
%%						%%		_ ->
%%						%%			Add
%%						%%	end,
%%						%%case AddReal > 0 of
%%						%%	true ->
%%						%%		playerFriend:closenessAdd(?ClosenessAddType_HomeGiving, RoleID, PartherRoleID, AddReal),
%%						%%		daily2Logic:saveDaily2({RoleID, PartherRoleID, ?Daily2Type_HomeVisitAddCloseness, AddReal + V});
%%						%%	_ ->
%%						%%		skip
%%						%%end,
%%							Msg = #pk_GS2U_GivingFurniTrueForPartnerResult{isSucc  = true,itemID =ItemID,num = Num },
%%							playerMsg:sendNetMsg(Msg);
%%							%%playerPackage:addGoodsAndMail(ItemID, Num, true, 0, PLog1);
%%						_->
%%							skip
%%					end;
%%				_->
%%					skip
%%			end;
%%		_->
%%			skip
%%	end,
%%
%%	ok;
%%
%%
%%givingFurniTrueForPartner(_)->
%%	ok.
%%%%购买家具
%%%%buyFurniture(HomeID,?Home_House,Poolid)->
%%%%	RoleID = playerState:getRoleID(),
%%%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%%%	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
%%%%		true ->
%%%%			case ets:lookup(?HomeFurnitrueEts,RoleID ) of
%%%%				[#rec_home_furnitrue{furniTrueData = FurnitruePackData} = AreaOld] ->
%%%%					ListFurnitruePackDataOld = misc:string_to_term(FurnitruePackData),
%%%%					case getCfg:getCfgByKey(cfg_lifeskill_info, Poolid) of
%%%%						#lifeskill_infoCfg{item_id = ItemID ,coin_cost = [Type,NeedMoney]} ->
%%%%							case checkCost({Type,NeedMoney}) of
%%%%								true ->
%%%%									PLog = #recPLogTSMoney{
%%%%										reason = ?CoinUseHome,
%%%%										param = 0,
%%%%										target = ?PLogTS_Home,
%%%%										source = ?PLogTS_PlayerSelf
%%%%									},
%%%%									playerMoney:decCoin(Type, NeedMoney, PLog),
%%%%									FurnitureInfo =  #hasFurnitureInfo{uid = uidMgr:makeFurnitrueUID(),time =time:getSyncTimeFromDBS() ,itemID = ItemID},
%%%%									NewFurniTrueList =misc:term_to_string( [FurnitureInfo|ListFurnitruePackDataOld]),
%%%%									NewArea =   AreaOld#rec_home_furnitrue{roleID =  RoleID, furniTrueData = NewFurniTrueList},
%%%%									ets:insert(?HomeFurnitrueEts, NewArea),
%%%%									homeInterface:saveHome(NewArea),
%%%%									Msg = #pk_GS2U_BuyFurnitureiResult_Sync{isSucc  = true,
%%%%										data = #pk_FurnitruePackData{uid = uidMgr:makeFurnitrueUID(),time =time:getSyncTimeFromDBS() ,itemID = ItemID}},
%%%%									playerMsg:sendNetMsg(Msg);
%%%%								_->
%%%%									playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin)
%%%%							end;
%%%%						_->
%%%%							skip
%%%%					end;
%%%%				_->
%%%%
%%%%					case getCfg:getCfgByKey(cfg_lifeskill_info, Poolid) of
%%%%						#lifeskill_infoCfg{item_id = ItemID ,coin_cost = [Type,NeedMoney]} ->
%%%%							case checkCost({Type,NeedMoney}) of
%%%%								true ->
%%%%									PLog = #recPLogTSMoney{
%%%%										reason = ?CoinUseHome,
%%%%										param = 0,
%%%%										target = ?PLogTS_Home,
%%%%										source = ?PLogTS_PlayerSelf
%%%%									},
%%%%									playerMoney:decCoin(Type, NeedMoney, PLog),
%%%%									FurnitureInfo =  [#hasFurnitureInfo{uid = uidMgr:makeFurnitrueUID(),time =time:getSyncTimeFromDBS() ,itemID = ItemID}],
%%%%									FurnitureInfoNew =  misc:term_to_string(FurnitureInfo),
%%%%									A1 = #rec_home_furnitrue{roleID =  RoleID, furniTrueData = FurnitureInfoNew},
%%%%									ets:insert(?HomeFurnitrueEts, A1),
%%%%									homeInterface:saveHome({insert, A1}),
%%%%
%%%%									Msg = #pk_GS2U_BuyFurnitureiResult_Sync{isSucc  = true,
%%%%										data = #pk_FurnitruePackData{uid = uidMgr:makeFurnitrueUID(),time =time:getSyncTimeFromDBS() ,itemID = ItemID}},
%%%%									playerMsg:sendNetMsg(Msg);
%%%%								_->
%%%%									playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin)
%%%%							end;
%%%%						_->
%%%%							skip
%%%%					end
%%%%			end;
%%%%		_->
%%%%			skip
%%%%	end,
%%%%	ok;
%%%%
%%%%buyFurniture(_,_,_)->
%%%%
%%%%	ok.
%%
%%
%%%% 扩展面积
%%extendArea(HomeID,AreaType) when AreaType == ?Home_House->
%%
%%	RoleID = playerState:getRoleID(),
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
%%		true ->
%%			case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%				[#rec_home_area{areaLvl = AreaLvl,areaData = StrDataOld} = AreaOld] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						[] ->
%%							Msg = #pk_GS2U_ExtendAreaResult_Sync{isSuccuss = false,extendLevel = 0},
%%							playerMsg:sendNetMsg(Msg);
%%						_->
%%							case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								false ->
%%									Msg = #pk_GS2U_ExtendAreaResult_Sync{isSuccuss = false,extendLevel = 0},
%%									playerMsg:sendNetMsg(Msg);
%%								#recHomeFurniTrue{extendLevel  = ExtendLevel} = OldFurniTure ->
%%
%%									[#rec_home{homeLvl = HLvl}] = ets:lookup(?HomeEts, HomeID),
%%									case getCfg:getCfgByKey(cfg_home_area, AreaType, AreaLvl) of
%%										#home_areaCfg{ area_cost = [Type,Money,Add], homelevel = HomeLvl,area_limit = [Start,Max]}
%%											when HLvl>=HomeLvl andalso ExtendLevel >=Start andalso ExtendLevel =< Max ->
%%											NeedMoney =  Money +(ExtendLevel - Start)*Add,
%%											case checkCost({Type,NeedMoney}) of
%%												true ->
%%													case NeedMoney > 0 of
%%														true ->
%%															PLog = #recPLogTSMoney{
%%																reason = ?CoinUseHome,
%%																param = ExtendLevel,
%%																target = ?PLogTS_Home,
%%																source = ?PLogTS_PlayerSelf
%%															},
%%															playerMoney:useCoin(Type, NeedMoney, PLog);
%%														_ ->
%%															skip
%%													end,
%%													NewData = OldFurniTure#recHomeFurniTrue{extendLevel = ExtendLevel+1},
%%													ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%													StrDataNew = misc:term_to_string(ListDataNew),
%%													AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%													ets:insert(?HomeAreaEts, AreaNew),
%%													homeInterface:saveHome(AreaNew),
%%													Msg = #pk_GS2U_ExtendAreaResult_Sync{isSuccuss = true,extendLevel = ExtendLevel+1},
%%													sendMsgToMapPlayer(playerState:getMapPlayerEts(),Msg);
%%												_->
%%													playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin)
%%
%%											end;
%%										_->
%%											Msg = #pk_GS2U_ExtendAreaResult_Sync{isSuccuss = false,extendLevel =0},
%%											playerMsg:sendNetMsg(Msg)
%%
%%									end
%%							end
%%					end;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%			end;
%%		_->
%%			skip
%%	end;
%%
%%extendArea(_,_)->
%%	ok.
%%
%%%% 加载小屋 设计方案
%%loadFurniTrueScheme(_HomeID,AreaType,0)
%%	when AreaType == ?Home_House->
%%%%
%%	%%RoleID = playerState:getRoleID(),
%%	%%HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	%%case HomeRole =:= ?HomeRole_Master  of
%%	%%	true ->
%%	%%		case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%	%%			[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
%%	%%				ListDataOld = misc:string_to_term(StrDataOld),
%%	%%				case ListDataOld of
%%	%%					[] ->
%%%%
%%	%%						Msg = #pk_GS2U_LoadFurniTrueResult_Sync{isSucc = false},
%%	%%						playerMsg:sendNetMsg(Msg);
%%	%%					_->
%%	%%						case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%	%%							false ->
%%	%%								Msg = #pk_GS2U_LoadFurniTrueResult_Sync{isSucc = false,betweenExamplID =0 },
%%	%%								playerMsg:sendNetMsg(Msg);
%%	%%							#recHomeFurniTrue{betweenExampleData = BetweenExampleData} = OldFurniTure ->
%%	%%								case BetweenExampleData of
%%	%%									 [] ->
%%	%%										 Msg = #pk_GS2U_LoadFurniTrueResult_Sync{isSucc = false,betweenExamplID =0 },
%%	%%										 playerMsg:sendNetMsg(Msg);
%%	%%									#betweenExampleInfo{}->
%%	%%										NewData = OldFurniTure#recHomeFurniTrue{},
%%	%%										ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%	%%										StrDataNew = misc:term_to_string(ListDataNew),
%%	%%										AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%	%%										ets:insert(?HomeAreaEts, AreaNew),
%%	%%										homeInterface:saveHome(AreaNew),
%%	%%										Msg = #pk_GS2U_LoadFurniTrueResult_Sync{isSucc = true,betweenExamplID =0 },
%%	%%										sendMsgToMapPlayer(playerState:getMapPlayerEts(),Msg);
%%	%%									_->
%%	%%										skip
%%	%%								end
%%	%%						end
%%	%%				end;
%%	%%			_ ->
%%	%%				?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%	%%		end;
%%	%%	_->
%%	%%		skip
%%	%%end,
%%	ok;
%%loadFurniTrueScheme(_,_,_)->
%%	ok.
%%
%%
%%
%%%%删除场景中家具
%%delSenceTheFurniTrue(HomeID,AreaType,Uid)
%%	when AreaType == ?Home_House->
%%
%%	RoleID = playerState:getRoleID(),
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master of
%%		true ->
%%
%%			case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%				[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						[] ->
%%							skip;
%%						_->
%%							case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								false ->
%%									skip;
%%								#recHomeFurniTrue{betweenExampleData = BetweenExampleData,sytlish = OldFurniTrueLish,interactFurnitTrueList = OldInterList,furniTrueItemNumList = OldItemNumList} = OldFurniTure ->
%%									#rec_home{homeLvl = Homelevel,stylish = OldHomeStylish}= OldeHome= homeInterface:queryHome(playerState:getRoleID()),
%%									%%删除的家具
%%									{NewExampleData,NewInterList,IsDel,FuritrueStylish,LastItemNumList} =
%%										case lists:keyfind(Uid,#recHomeLayoutInfo.uid,BetweenExampleData) of
%%											#recHomeLayoutInfo{itemID = ItemID,type = Type} ->
%%												#home_levelCfg{stylish_limit = Stylish_limit } = getCfg:getCfgByKey(cfg_home_level, Homelevel),
%%												#home_furnitureCfg{stylish = Sty,function_Param2 = OpenSlotNum } = getCfg:getCfgByKey(cfg_home_furniture, ItemID),
%%												%%是家具的时候判断是否可以删除仓库
%%												case Type =/= ?FurniTure_Storage orelse playerPackage:openSlot(?Item_Location_FurniTrue_Storage,OpenSlotNum,false) of
%%													true ->%%删除计数
%%													NewItemNumList=
%%													case lists:keyfind(ItemID,#furniTrueItemNum.itemID,OldItemNumList) of
%%														#furniTrueItemNum{num = ItemNum} =OldItem ->
%%															case ItemNum >0 of
%%																  true->
%%																	  NewItem = OldItem#furniTrueItemNum{num = ItemNum -1} ,
%%																	  lists:keystore(ItemID,#furniTrueItemNum.itemID,OldItemNumList,NewItem);
%%																_->
%%																	OldItemNumList
%%															end;
%%														_->
%%															OldItemNumList
%%													end,
%%
%%													PLog = #recPLogTSItem{
%%														old         = 0 ,
%%														new         = 1 ,
%%														change      = 1 ,
%%														target      = ?PLogTS_PlayerSelf ,
%%														source      = ?PLogTS_Snow ,
%%														gold        = 0,
%%														goldtype    = 0,
%%														changReason = ?ItemSourceHomeFurniTrue,
%%														reasonParam = 0
%%													},
%%
%%													%%撤回家具时候同时 删除之前的华丽度
%%													NewFurniTrueLish =
%%													case OldHomeStylish >OldFurniTrueLish of
%%														true -> OldHomeStylish - Sty ;
%%														_->
%%															OldFurniTrueLish - Sty
%%													end,
%%													LastSty =
%%													case NewFurniTrueLish  > Stylish_limit of
%%														  true->  Stylish_limit;
%%														_->
%%															 NewFurniTrueLish
%%													end,
%%													ets:update_element(?HomeEts, HomeID, {#rec_home.stylish, LastSty}),
%%													NewHome = OldeHome#rec_home{stylish = LastSty},
%%													homeInterface:saveHome(NewHome),
%%
%%													Info = homeInterface:makeHomeBaseInfo(NewHome),
%%													gsSendMsg:sendNetMsg(playerState:getNetPid(), Info),
%%													%----------------------------
%%
%%													%%撤回家具的时候，检测家具上是否有种植物种，有就清除
%%													case homeInterface:queryHomePlant({HomeID,?Home_Plantation_A,Uid}) of
%%														#recHomePlant{} ->
%%															playerHomePlant:plant(?HomePlant_Grubbing,RoleID,{HomeID,?Home_Plantation_A,Uid},0);
%%														_->
%%															skip
%%													end,
%%
%%													%%撤回家具的时候
%%											  		case Type =:=  ?FurniTure_Breed of
%%														true->%%饲养中取出宠物
%%															playerHomeFarming:putOutFarming({HomeID,Type,RoleID,Uid});
%%														_->
%%															skip
%%											  		end,
%%													%%--------------------------
%%
%%													playerPackage:addGoodsAndMail(ItemID, 1, true, 0, PLog),
%%													New = lists:keydelete(Uid,#recHomeLayoutInfo.uid,BetweenExampleData),
%%
%%													NewInList =  lists:keydelete(Uid,#furniInteractTrueData.itemUID,OldInterList),
%%													{New,NewInList,true,OldFurniTrueLish -Sty,NewItemNumList };
%%													_ ->
%%														{BetweenExampleData,OldInterList,false,OldFurniTrueLish,OldItemNumList}
%%												end;
%%											_->
%%												{BetweenExampleData,OldInterList,false,OldFurniTrueLish,OldItemNumList}
%%										end,
%%
%%									case IsDel of
%%								  		true->
%%											NewData =  OldFurniTure#recHomeFurniTrue{betweenExampleData  = NewExampleData,
%%												interactFurnitTrueList = NewInterList,sytlish = FuritrueStylish,furniTrueItemNumList = LastItemNumList},
%%											ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%											StrDataNew = misc:term_to_string(ListDataNew),
%%											AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%											ets:insert(?HomeAreaEts, AreaNew),
%%											homeInterface:saveHome(AreaNew),
%%											Msg = #pk_GS2U_DelSenceTheFurniTrueResult{isSucc = true,uid =Uid },
%%											playerMsg:sendNetMsg(Msg);
%%										_->
%%											Msg = #pk_GS2U_DelSenceTheFurniTrueResult{isSucc = false,uid =Uid },
%%											playerMsg:sendNetMsg(Msg)
%%									end
%%							end
%%					end;
%%
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%			end;
%%		_->
%%			skip
%%	end,
%%	ok.
%%
%%%%改变墙纸
%%changeWall(Chnge_WallID,WallID)->
%%
%%	case Chnge_WallID>0 andalso Chnge_WallID=/= WallID of
%%		true ->
%%			case  playerPackage:getGoodsNumByID(?Item_Location_FurniTrue,Chnge_WallID)>0 of
%%				true ->
%%					PLog = #recPLogTSItem{
%%						old = 0,
%%						new = 0,
%%						change = -1,
%%						target = ?PLogTS_PlayerSelf,
%%						source = ?PLogTS_PlayerSelf,
%%						gold = 0,
%%						goldtype = 0,
%%						changReason = ?ItemUseReasonPlayer,
%%						reasonParam = Chnge_WallID
%%					},
%%					case playerPackage:delGoodsByID(?Item_Location_FurniTrue, Chnge_WallID, 1, PLog) of
%%						true ->
%%							%%将以前的墙纸 还原回背包
%%							case WallID> 0 of
%%								true ->
%%									PLog1 = #recPLogTSItem{
%%										old         = 0 ,
%%										new         = 1 ,
%%										change      = 1 ,
%%										target      = ?PLogTS_PlayerSelf ,
%%										source      = ?PLogTS_Snow ,
%%										gold        = 0,
%%										goldtype    = 0,
%%										changReason = ?ItemSourceHomeFurniTrue,
%%										reasonParam = WallID
%%									},
%%									playerPackage:addGoodsAndMail(WallID, 1, true, 0, PLog1);
%%								_->
%%									skip
%%							end,
%%							Chnge_WallID;
%%
%%						_->
%%							WallID
%%					end;
%%				_->
%%					WallID
%%			end;
%%
%%		_->
%%			WallID
%%	end.
%%
%%
%%%%改变地板
%%changeFloor(Change_FloorID,FloorID)->
%%	case Change_FloorID>0 andalso Change_FloorID=/=FloorID of
%%		true ->
%%			case  playerPackage:getGoodsNumByID(?Item_Location_FurniTrue,Change_FloorID)>0 of
%%				true ->
%%					P = #recPLogTSItem{
%%						old = 0,
%%						new = 0,
%%						change = -1,
%%						target = ?PLogTS_PlayerSelf,
%%						source = ?PLogTS_PlayerSelf,
%%						gold = 0,
%%						goldtype = 0,
%%						changReason = ?ItemUseReasonPlayer,
%%						reasonParam = Change_FloorID
%%					},
%%					case playerPackage:delGoodsByID(?Item_Location_FurniTrue, Change_FloorID, 1, P) of
%%						true ->
%%							%%将以前的地板 还原回背包
%%							case FloorID> 0 of
%%								true ->
%%									PLog2 = #recPLogTSItem{
%%										old         = 0 ,
%%										new         = 1 ,
%%										change      = 1 ,
%%										target      = ?PLogTS_PlayerSelf ,
%%										source      = ?PLogTS_Snow ,
%%										gold        = 0,
%%										goldtype    = 0,
%%										changReason = ?ItemSourceHomeFurniTrue,
%%										reasonParam = FloorID
%%									},
%%									playerPackage:addGoodsAndMail(FloorID, 1, true, 0, PLog2);
%%								_->
%%									skip
%%							end,
%%							Change_FloorID;
%%
%%						_->
%%							FloorID
%%					end;
%%				_->
%%					FloorID
%%			end;
%%		_->
%%			FloorID
%%	end.
%%
%%%%修改的家具
%%changeFurnitrue(BetweenExampleData,Change_furnitrueData)->
%%
%%	F1 = fun(#pk_HomeLayoutInfo{uid = Uid,roleID = RoleID,itemID = ItemId,gridID = GridID,rotationY = Ry,type = Type}
%%		= HomeLayoutInfo,{ExampleDataList,ArrList})->
%%		case lists:keyfind(Uid,#recHomeLayoutInfo.uid,ExampleDataList) of
%%			#recHomeLayoutInfo{} ->
%%
%%				NewExampleDataList =  lists:keystore(Uid,#recHomeLayoutInfo.uid,ExampleDataList,#recHomeLayoutInfo{uid =Uid,roleID = RoleID,
%%					itemID =ItemId,gridID = GridID,rotationY = Ry ,type = Type }),
%%
%%				{NewExampleDataList,[HomeLayoutInfo|ArrList]};
%%
%%			_->
%%				{ExampleDataList,ArrList}
%%		end
%%		 end,
%%	lists:foldl(F1,{BetweenExampleData,[]},Change_furnitrueData).
%%
%%
%%%%往场景中添加的的家具
%%addFurnitrue(ChangeExampleData,AllOldsytlish,OldItemNumList,AddfurnitrueData,#rec_home{homeLvl =  Homelevel},#home_levelCfg{area =[Width,High]})->
%%
%%	%%这里算使用面积
%%	Usingarea = Width*Width+2*Width*High,
%%
%%	%%增加的家具
%%	F2 = fun(#pk_HomeLayoutInfo{uid = _Uid,roleID = RoleID,itemID = ItemId,gridID = GridID,rotationY = Ry,type = Type} =
%%		HomeLayoutInfo,{AddArrList,AddListSucc,NowStylish,OldItemNumData})->
%%
%%		case getCfg:getCfgByKey(cfg_home_furniture, ItemId) of
%%			#home_furnitureCfg{stylish = Sty,limit = Limit,function_Param2 = SlotOpenNum}->
%%				case GridID > Usingarea of
%%					true ->{AddArrList,AddListSucc,NowStylish,OldItemNumData};
%%					_->
%%
%%						PLog3 = #recPLogTSItem{
%%							old = 0,
%%							new = 0,
%%							change = -1,
%%							target = ?PLogTS_PlayerSelf,
%%							source = ?PLogTS_PlayerSelf,
%%							gold = 0,
%%							goldtype = 0,
%%							changReason = ?ItemUseReasonPlayer,
%%							reasonParam = ItemId
%%						},
%%
%%						%%限制摆放个数字段 []代表 不限制
%%						case Limit of
%%							[] ->
%%								case playerPackage:delGoodsByID(?Item_Location_FurniTrue, ItemId, 1, PLog3) of
%%									true ->
%%										Uid =  uidMgr:makeFurnitrueUID(),
%%										NewDataInfo = #recHomeLayoutInfo{uid =Uid,roleID = RoleID, itemID =ItemId,gridID = GridID,rotationY = Ry,type = Type  },
%%										NewAddList =   lists:keystore(Uid,#recHomeLayoutInfo.uid,AddArrList,NewDataInfo),
%%										{NewAddList,[HomeLayoutInfo#pk_HomeLayoutInfo{uid =Uid }|AddListSucc],NowStylish+Sty,OldItemNumData};
%%									_->
%%										?ERROR("clc Not Find in Package ~p",[ItemId]),
%%										{AddArrList,AddListSucc,NowStylish,OldItemNumData}
%%								end;
%%							[Multiple,LimitNum,Max]->
%%
%%								Num_1 =  Homelevel* Multiple +LimitNum,
%%								MaxNum =
%%								case  Num_1 > Max of
%%									   true-> Max;
%%									 _-> Num_1
%%								end,
%%								case lists:keyfind(ItemId,#furniTrueItemNum.itemID,OldItemNumData) of
%%									#furniTrueItemNum{num = OldNum} = OldItemNum ->
%%										case MaxNum > OldNum of
%%											true->
%%												case playerPackage:delGoodsByID(?Item_Location_FurniTrue, ItemId, 1, PLog3) of
%%													true ->
%%														%%判定是否是仓库类型家具，需要开启对应数量的仓库格子
%%														case Type of
%%													   		?FurniTure_Storage ->
%%													   		playerPackage:openSlot(?Item_Location_FurniTrue_Storage,SlotOpenNum,true);
%%															_ ->
%%																skip
%%													   	end,
%%														NewItemNumList= lists:keystore(ItemId,#furniTrueItemNum.itemID,OldItemNumData,OldItemNum#furniTrueItemNum{num = OldNum+1 }),
%%														Uid =  uidMgr:makeFurnitrueUID(),
%%														NewDataInfo = #recHomeLayoutInfo{uid =Uid,roleID = RoleID, itemID =ItemId,gridID = GridID,rotationY = Ry,type = Type  },
%%														NewAddList =   lists:keystore(Uid,#recHomeLayoutInfo.uid,AddArrList,NewDataInfo),
%%														{NewAddList,[HomeLayoutInfo#pk_HomeLayoutInfo{uid =Uid }|AddListSucc],NowStylish+Sty,NewItemNumList};
%%													_->
%%														?ERROR("clc Not Find in Package ~p",[ItemId]),
%%														{AddArrList,AddListSucc,NowStylish,OldItemNumData}
%%												end;
%%											_->
%%												?ERROR_CODE(?ErrorCode_HomeFurniture_maxcount),
%%												{AddArrList,AddListSucc,NowStylish,OldItemNumData}
%%										end;
%%									_->
%%
%%										case playerPackage:delGoodsByID(?Item_Location_FurniTrue, ItemId, 1, PLog3) of
%%											true ->
%%												%%判定是否是仓库类型家具，需要开启对应数量的仓库格子
%%												case Type of
%%													?FurniTure_Storage ->
%%														playerPackage:openSlot(?Item_Location_FurniTrue_Storage,SlotOpenNum,true);
%%													_ ->
%%														skip
%%												end,
%%												NewItemNumList= [#furniTrueItemNum{itemID =ItemId,num = 1 }|OldItemNumList],
%%												Uid =  uidMgr:makeFurnitrueUID(),
%%												NewDataInfo = #recHomeLayoutInfo{uid =Uid,roleID = RoleID, itemID =ItemId,gridID = GridID,rotationY = Ry,type = Type  },
%%												NewAddList =   lists:keystore(Uid,#recHomeLayoutInfo.uid,AddArrList,NewDataInfo),
%%												{NewAddList,[HomeLayoutInfo#pk_HomeLayoutInfo{uid =Uid }|AddListSucc],NowStylish+Sty,NewItemNumList};
%%											_->
%%												?ERROR("clc Not Find in Package ~p",[ItemId]),
%%												{AddArrList,AddListSucc,NowStylish,OldItemNumData}
%%										end
%%
%%								end;
%%							_->
%%								?ERROR("cfgHome_Furniture.ID = ~p; Limit is Empty!",[ItemId])
%%						end
%%				end;
%%			_->
%%				{AddArrList,AddListSucc,NowStylish,OldItemNumData}
%%		end
%%		 end,
%%	lists:foldl(F2,{ChangeExampleData,[],AllOldsytlish,OldItemNumList},AddfurnitrueData).
%%
%%
%%
%%%% 保存小屋设计方案
%%saveFurniTrueScheme(HomeID,AreaType,AddfurnitrueData ,Chnge_WallID,Change_FloorID,Change_furnitrueData)
%%	    when AreaType == ?Home_House->
%%
%%		RoleID = playerState:getRoleID(),
%%		HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%		case HomeRole =:= ?HomeRole_Master of
%%			true ->
%%				case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%					[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
%%						ListDataOld = misc:string_to_term(StrDataOld),
%%						case ListDataOld of
%%							[] ->
%%								skip;
%%							_->
%%								case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%									false ->
%%										skip;
%%									#recHomeFurniTrue{betweenExampleData = BetweenExampleData,wallID = WallID,sytlish = AllOldsytlish,floorID = FloorID,furniTrueItemNumList = OldItemNumList } = OldFurniTure ->
%%
%%
%%										%%检查墙纸
%%										NewWallID =changeWall(Chnge_WallID,WallID),
%%
%%										%%检查地板
%%										NewFloorID =changeFloor(Change_FloorID,FloorID),
%%
%%										%%修改的家具
%%										{ChangeExampleData,ChangeSussList} = changeFurnitrue(BetweenExampleData,Change_furnitrueData),
%%
%%										%%这里算使用面积
%%										#rec_home{homeLvl =  Homelevel,stylish = Oldstylish}= OldeHome= homeInterface:queryHome(playerState:getRoleID()),
%%										#home_levelCfg{stylish_limit = Stylish_limit }= CfgHomeLevel = getCfg:getCfgByKey(cfg_home_level, Homelevel),
%%
%%										%%增加的家具
%%										{NewAddList,AddSuccList,NStylish,LastItemNumList} = addFurnitrue(ChangeExampleData,AllOldsytlish,OldItemNumList,AddfurnitrueData,OldeHome,CfgHomeLevel),
%%
%%										playerSevenDayAim:updateCondition(?SevenDayAim_FurniSave, [HomeID]),
%%
%%										%%华丽度
%%										Addstylish =  NStylish - AllOldsytlish,
%%										LastSytlish =
%%										case Addstylish + Oldstylish > Stylish_limit of
%%											 true ->Stylish_limit ;
%%											_->
%%												Addstylish + Oldstylish
%%										end,
%%										ets:update_element(?HomeEts, HomeID, {#rec_home.stylish, LastSytlish}),
%%										NewHome = OldeHome#rec_home{stylish =  LastSytlish},
%%										homeInterface:saveHome(NewHome),
%%										Info = homeInterface:makeHomeBaseInfo(NewHome),
%%										gsSendMsg:sendNetMsg(playerState:getNetPid(), Info),
%%										%%--------
%%										NewData =  OldFurniTure#recHomeFurniTrue{isdecorate = false,floorID = NewFloorID,wallID = NewWallID,
%%											sytlish = NStylish,betweenExampleData  = NewAddList,furniTrueItemNumList = LastItemNumList},
%%										ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%										StrDataNew = misc:term_to_string(ListDataNew),
%%										AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%										ets:insert(?HomeAreaEts, AreaNew),
%%										homeInterface:saveHome(AreaNew),
%%										%%playerState:getMapPlayerEts()
%%										Msg = #pk_GS2U_SaveFurniTrueResult_Sync{isSucc = true, add_furnitrueData =
%%										AddSuccList,change_wallID = NewWallID,chang_floorID = NewFloorID,
%%											change_furnitrueData = ChangeSussList},
%%										playerMsg:sendNetMsg(Msg)
%%								end
%%						end;
%%
%%					_ ->
%%						?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%				end;
%%			_->
%%				skip
%%		end,
%%	ok;
%%saveFurniTrueScheme(_,_,_,_,_,_)->
%%
%%	ok.
%%
%%
%%%%%% 删除留言
%%%%deleteMessage(HomeID,AreaType,DeleteRoleID,DTime)->
%%%%	%%RoleID = playerState:getRoleID(),
%%%%	%%HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%%%	%%case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
%%%%	%%	true ->
%%%%	%%		case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%%%	%%			[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
%%%%	%%				ListDataOld = misc:string_to_term(StrDataOld),
%%%%	%%				case ListDataOld of
%%%%	%%					[] ->
%%%%	%%						Msg = #pk_GS2U_DeleteMessageResult_Sync{isSucc = false,roleID  = DeleteRoleID},
%%%%	%%						playerMsg:sendNetMsg(Msg);
%%%%	%%					_->
%%%%	%%						case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%%%	%%							false ->
%%%%	%%								Msg = #pk_GS2U_DeleteMessageResult_Sync{isSucc = false,roleID  = DeleteRoleID},
%%%%	%%								playerMsg:sendNetMsg(Msg);
%%%%	%%							#recHomeFurniTrue{message = Message} = OldFurniTure ->
%%%%	%%								NewMessage = lists:keydelete({DeleteRoleID,DTime}, #recHomeFurniMessage.roleID, Message),
%%%%	%%								NewData =   OldFurniTure#recHomeFurniTrue{message  = NewMessage},
%%%%	%%								ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%%%	%%								StrDataNew = misc:term_to_string(ListDataNew),
%%%%	%%								AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%%%	%%								ets:insert(?HomeAreaEts, AreaNew),
%%%%	%%								homeInterface:saveHome(AreaNew),
%%%%	%%								Msg = #pk_GS2U_DeleteMessageResult_Sync{isSucc = true,roleID  = DeleteRoleID,time = DTime},
%%%%	%%								sendMsgToMapPlayer(playerState:getMapPlayerEts(),Msg)
%%%%	%%						end
%%%%	%%				end;
%%%%%%
%%%%	%%			_ ->
%%%%	%%				?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%%%	%%		end;
%%%%	%%	_->
%%%%	%%		skip
%%%%	%%end.
%%%%	ok.
%%%%%% 设置留言
%%%%setMessage(HomeID,?Home_House,Message)->
%%%%	%%Name = playerState:getName(),
%%%%	%%RoleID = playerState:getRoleID(),
%%%%	%%case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%%%	%%	[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
%%%%	%%		ListDataOld = misc:string_to_term(StrDataOld),
%%%%	%%		case ListDataOld of
%%%%	%%			[] ->
%%%%	%%				skip;
%%%%	%%			_->
%%%%	%%				case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%%%	%%					false ->
%%%%	%%						skip;
%%%%	%%					#recHomeFurniTrue{message = MessageOldList} = OldFurniTure ->
%%%%	%%						MessageTime =  time:getSyncTimeFromDBS(),
%%%%	%%						New = #recHomeFurniMessage{roleID = {RoleID,MessageTime} ,name =Name,time = MessageTime ,content = base64:encode_to_string(Message)},
%%%%	%%						NewMessageList = [New |MessageOldList ],
%%%%	%%						AscSortHomeFurniList =lists:keysort(#recHomeFurniMessage.time, NewMessageList),
%%%%	%%						NewData =  OldFurniTure#recHomeFurniTrue{message = AscSortHomeFurniList},
%%%%	%%						ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%%%	%%						StrDataNew = misc:term_to_string(ListDataNew),
%%%%	%%						AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%%%	%%						ets:insert(?HomeAreaEts, AreaNew),
%%%%	%%						homeInterface:saveHome(AreaNew),
%%%%	%%						HomeFurniMessage =  #pk_HomeFurniMessage{roleID  = RoleID,name =Name,time =
%%%%	%%						time:getSyncTimeFromDBS() ,content = Message},
%%%%	%%						Msg = #pk_GS2U_SendmessageResult_Sync{message = HomeFurniMessage},
%%%%	%%						sendMsgToMapPlayer(playerState:getMapPlayerEts(),Msg)
%%%%	%%				end
%%%%	%%		end;
%%%%%%
%%%%	%%	_ ->
%%%%	%%		?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%%%	%%end;
%%%%	ok;
%%%%setMessage(_,_,_)->
%%%%
%%%%	ok.
%%
%%%%设置问候语
%%setGreetings(HomeID,?Home_House,Greetings)->
%%	RoleID = playerState:getRoleID(),
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
%%		true ->
%%			case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%				[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						 [] ->
%%
%%							 skip;
%%
%%						 _->
%%							 case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								 false ->
%%									 Msg = #pk_GS2U_SetGreetingsResult_Sync{isSuccuss = false},
%%									 playerMsg:sendNetMsg(Msg);
%%								 #recHomeFurniTrue{} = OldFurniTure ->
%%									 NewData =  OldFurniTure#recHomeFurniTrue{greetings = base64:encode_to_string(Greetings)},
%%									 ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%									 StrDataNew = misc:term_to_string(ListDataNew),
%%									 AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%									 ets:insert(?HomeAreaEts, AreaNew),
%%									 homeInterface:saveHome(AreaNew),
%%									 Msg = #pk_GS2U_SetGreetingsResult_Sync{isSuccuss = true,greetings = Greetings},
%%									 sendMsgToMapPlayer(playerState:getMapPlayerEts(),Msg)
%%							 end
%%					end;
%%
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
%%			end;
%%		_->
%%			skip
%%	end;
%%
%%setGreetings(_,_,_)->
%%	ok.
%%%%%-------------------------------------------------------------------
%%% 初始化家园小屋数据，向客服端发送数据
%%-spec sendHomeFurniTureInfo(HomeID::uint64(), Flag::uint()) -> no_return().
%%sendHomeFurniTureInfo(HomeID, ?Home_House) ->
%%
%%	%%初始化小屋领奖次数
%%	%%initHomeFurniTrueReward(HomeID),
%%	%%FurnitruePackDataList =
%%	%%case ets:lookup(?HomeFurnitrueEts,playerState:getRoleID() ) of
%%	%%	[#rec_home_furnitrue{furniTrueData = FurnitruePackData}] ->
%%	%%		ListFurnitruePackDataOld = misc:string_to_term(FurnitruePackData),
%%	%%		F =
%%	%%		fun(#hasFurnitureInfo{uid = Uid,time = Time,itemID = ItemID},Arr)->
%%	%%			[#pk_FurnitruePackData{uid = Uid,time = Time,itemID = ItemID}|Arr]
%%	%%		end,
%%	%%		lists:foldl(F,[], ListFurnitruePackDataOld);
%%	%%	_->
%%	%%		[]
%%	%%end,
%%
%%
%%	case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%		[#rec_home_area{areaLvl =  AreaLvl,areaData = StrDataOld} = OldArea] ->
%%			ListDataOld = misc:string_to_term(StrDataOld),
%%			case ListDataOld of
%%				 [] ->
%%
%%					 ListDataNew = [#recHomeFurniTrue{homeID = HomeID,furniTrueLevel = AreaLvl,wallID =0,floorID = 0, extendLevel = confighome_area_0(),
%%						 greetings = "",isdecorate = false,sytlish = 0, betweenExampleData =[],interactFurnitTrueList = [],furniTrueItemNumList = []}],
%%					 StrDataNew = misc:term_to_string(ListDataNew),
%%					 AreaNew = OldArea#rec_home_area{areaData = StrDataNew},
%%					 ets:insert(?HomeAreaEts, AreaNew),
%%					 homeInterface:saveHome(AreaNew),
%%
%%					 Msg = #pk_GS2U_SendAllFurniInfo_Sync{greetings = "",furniTrueLevel = AreaLvl,extendLevel = confighome_area_0(),wallID = 0,floorID = 0,
%%						isdecorate  = false, betweenExampleData = [],interactList = []},
%%					 playerMsg:sendNetMsg(Msg) ;
%%				_->
%%
%%					F5 =
%%						fun(#furniTruePlayerInfo{roleID = RlID,seatID = Sid},Arr1)->
%%							[#pk_FurniTruePlayerInfo{roleID = RlID,seatID = Sid}|Arr1]
%%						end,
%%
%%					F3 =
%%						fun(#recHomeLayoutInfo{uid = Uid,roleID = RoldeID,itemID = ItemID,gridID = GruiID ,rotationY = RotationY,type = Type},Arr1)->
%%							[#pk_HomeLayoutInfo{uid = Uid,roleID = RoldeID,itemID = ItemID,gridID = GruiID,rotationY = RotationY,type = Type}|Arr1]
%%						end,
%%					F4 =
%%						fun(#furniInteractTrueData{itemUID = ItemUid,playerList = PlayerList,roleID = RID},Arr2)->
%%							FurniTruePlayerInfoList  = lists:foldl(F5,[], PlayerList),
%%							[#pk_FurniInteractTrueData{itemUID = ItemUid,playerList = FurniTruePlayerInfoList, roleID = RID}|Arr2]
%%						end,
%%					F1 =
%%						fun(#recHomeFurniTrue{ extendLevel = ExtendLevel,greetings = Greetings,wallID = WallID,floorID = FloorID,furniTrueLevel = AreaLvl_,
%%							isdecorate = Isdecorate,betweenExampleData =BetweenExampleData,interactFurnitTrueList = FurnitTrueList})->
%%
%%							BetweenExampleDataList = lists:foldl(F3,[], BetweenExampleData),
%%							InteractFurnitTrue = lists:foldl(F4,[], FurnitTrueList),
%%							Msg = #pk_GS2U_SendAllFurniInfo_Sync{greetings = base64:decode_to_string(Greetings),extendLevel = ExtendLevel,furniTrueLevel = AreaLvl_
%%								,wallID = WallID,floorID = FloorID,isdecorate = Isdecorate,betweenExampleData = BetweenExampleDataList,interactList = InteractFurnitTrue},
%%							playerMsg:sendNetMsg(Msg)
%%
%%						end,
%%					lists:foreach(F1, ListDataOld)
%%			end;
%%		_->
%%			skip
%%	end,
%%
%%
%%	ok;
%%sendHomeFurniTureInfo(_,_) ->
%%	ok.
%%
%%
%%%%领取小屋每周奖励
%%getAwardsEachMonday(_HomeID)->
%%
%%%%RoleID = playerState:getRoleID(),
%%%%HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%%%case HomeRole =:= ?HomeRole_Master of
%%%%	true ->
%%%%		case homeInterface:queryHome(RoleID) of
%%%%			#rec_home{homeID = HomeID,homeLvl = Homelevel,stylish = Stylish}->
%%
%%%%				{AwardsEachMondayNum,_} = playerPropSync:getProp(?SerProp_HomeFurniTrueReward),
%%%%				case  AwardsEachMondayNum < ?RewardNum of
%%%%					true->
%%
%%%%						case getCfg:getCfgByKey(cfg_home_level, Homelevel) of
%%%%							#home_levelCfg{stylish = Sty,stylish_gift =DropID} when Stylish >= Sty->
%%
%%%%								ItemList =
%%%%									case playerDrop:goodsDrop(DropID, 0, ?ItemSourceHomeFurniTrue ) of
%%%%										[{_, [#rec_item{}| _]}| _] = DropItemList ->
%%%%											[#pk_FurniTrueDropItem{itemUID  = ItemUID,itemID = ItemID,number = DropNum,quality = Quality,isBind =IsBind } ||
%%%%												{DropNum,[#rec_item{itemUID = ItemUID,itemID = ItemID,quality = Quality,
%%%%													isBind = IsBind} | _]} <- DropItemList];
%%%%										_ ->
%%%%											[]
%%%%									end,
%%
%%%%								CurTime =  time:getSyncTime1970FromDBS(),
%%%%								DateTimeNow = time:convertSec2DateTime(CurTime),
%%%%								TimeWeekStart_LocalFrom0 = time:getWeekBeginSecondsByDay(DateTimeNow),
%%%%								NewGetAwardTime = TimeWeekStart_LocalFrom0 +7 *24 *3600,
%%%%								playerPropSync:setProp(?SerProp_HomeFurniTrueReward,{1,NewGetAwardTime}),
%%
%%%%								Msg = #pk_GS2U_GetFurniTrueAward_Sync{isSucc = true,furniTrueDropItemList = ItemList},
%%%%								playerMsg:sendNetMsg(Msg),
%%%%								Msg = #pk_GS2U_HomeFurniTrueReward_Sync{isCanGet = 1},
%%%%								playerMsg:sendNetMsg(Msg);
%%%%							_->
%%%%								Msg = #pk_GS2U_GetFurniTrueAward_Sync{isSucc = false,furniTrueDropItemList = []},
%%%%								playerMsg:sendNetMsg(Msg)
%%%%						end;
%%%%					_->
%%%%						playerMsg:sendErrorCodeMsg(?ErrorCode_UseSkillErrorNoUseCounter)
%%%%				end;
%%%%			_->
%%%%				skip
%%%%		end;
%%%%	_->
%%%%		skip
%%  %% end,
%%	ok.
%%
%%
%%%%%%初始化小屋领奖次数
%%%%initHomeFurniTrueReward(HomeID)->
%%%%
%%%%%%RoleID = playerState:getRoleID(),
%%%%%%HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%%%%%case homeInterface:queryHome(playerState:getRoleID()) of
%%%%%%	#rec_home{homeID = HomeID} when HomeRole =:= ?HomeRole_Master->
%%%%%%		{AwardsEachMondayNum,Time} = playerPropSync:getProp(?SerProp_HomeFurniTrueReward),
%%%%%%		case AwardsEachMondayNum >0 of
%%%%%%			true->
%%%%%%				CurTime =  time:getSyncTime1970FromDBS(),
%%%%%%				case CurTime > Time of
%%%%%%					true->
%%%%%%						Msg = #pk_GS2U_HomeFurniTrueReward_Sync{isCanGet = 0},
%%%%%%						playerMsg:sendNetMsg(Msg),
%%%%%%						playerPropSync:setProp(?SerProp_HomeFurniTrueReward,{0,0});
%%%%%%					_->
%%%%%%						Msg = #pk_GS2U_HomeFurniTrueReward_Sync{isCanGet = 1},
%%%%%%						playerMsg:sendNetMsg(Msg)
%%%%%%				end;
%%%%%%			_->
%%%%%%				Msg = #pk_GS2U_HomeFurniTrueReward_Sync{isCanGet = 0},
%%%%%%				playerMsg:sendNetMsg(Msg)
%%%%%%		end;
%%%%%%	_->
%%%%%%		Msg = #pk_GS2U_HomeFurniTrueReward_Sync{isCanGet = 0},
%%%%%%		playerMsg:sendNetMsg(Msg)
%%%%%%end,
%%%%	ok.
%%
%%
%%%%是否处于建造模式
%%checkHomeIsDecorate(HomeID)->
%%	HomeRole = homeInterface:queryHomeRole(HomeID, playerState:getRoleID()),
%%	case HomeRole =:=?HomeRole_Master of
%%		true ->
%%			false;
%%		_->
%%			case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%				[#rec_home_area{areaData = StrDataOld}] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%					case ListDataOld of
%%						[] ->
%%							false;
%%						_->
%%							case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%								false ->
%%									false;
%%								#recHomeFurniTrue{isdecorate = IsDecorate}  ->
%%									case IsDecorate of
%%										 true ->
%%											 true;
%%										_->
%%											false
%%									end
%%							end
%%					end;
%%				_->
%%					false
%%			end
%%
%%	end.
%%
%%
%%getHomeHouseState(HomeID,?Home_House)->
%%	case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%		[#rec_home_area{areaData = StrDataOld}] ->
%%			ListDataOld = misc:string_to_term(StrDataOld),
%%			case ListDataOld of
%%				[] ->
%%					false;
%%				_->
%%					case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%						false ->
%%							false;
%%						#recHomeFurniTrue{isdecorate = IsDecorate}  ->
%%							IsDecorate
%%					end
%%			end;
%%		_->
%%			false
%%	end;
%%
%%getHomeHouseState(_HomeID,_)->
%%	false.
%%
%%
%%
%%
%%-spec playerOffline() -> ok.
%%playerOffline() ->
%%	MapID =  playerState:getMapID(),
%%	MapPID  = playerState:getMapPid(),
%%	RoleID =  playerState:getRoleID(),
%%
%%	psMgr:sendMsg2PS(?HomeOtp, playerOffline, {MapID,MapPID,RoleID,playerState:getMapPlayerEts()}),
%%	ok.
%%
%%
%%%% v3.0.0屏蔽旧版补偿
%%%% give9
%%%% give10
%%%%%%家园华丽度修复
%%%%homeStylishRepair()->
%%%%	RoleID =  playerState:getRoleID(),
%%%%	case homeInterface:queryHome(RoleID) of
%%%%		#rec_home{homeID = HomeID} =OldHome ->
%%%%
%%%%			case ets:lookup(?HomeAreaEts, {HomeID, ?Home_House}) of
%%%%				[#rec_home_area{areaData = StrDataOld}=AreaOld] ->
%%%%					ListDataOld = misc:string_to_term(StrDataOld),
%%%%					case ListDataOld of
%%%%						[] ->
%%%%							false;
%%%%						_->
%%%%						case lists:keyfind(HomeID, #recHomeFurniTrue.homeID, ListDataOld) of
%%%%							 false ->
%%%%							 	skip;
%%%%						#recHomeFurniTrue{betweenExampleData = FurnitureList}=OldFurniTure->
%%%%							AllStylish =  getAllFurnitureStylish(FurnitureList,0),
%%%%							NewData =  OldFurniTure#recHomeFurniTrue{sytlish = AllStylish},
%%%%							ListDataNew = lists:keystore(HomeID, #recHomeFurniTrue.homeID, ListDataOld,NewData),
%%%%							StrDataNew = misc:term_to_string(ListDataNew),
%%%%							AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%%%							ets:insert(?HomeAreaEts, AreaNew),
%%%%							homeInterface:saveHome(AreaNew),
%%%%							NewHome = OldHome#rec_home{stylish =AllStylish },
%%%%							ets:update_element(?HomeEts, HomeID, {#rec_home.stylish, AllStylish}),
%%%%							homeInterface:saveHome(NewHome)
%%%%						end
%%%%					end;
%%%%				_->
%%%%					false
%%%%			end;
%%%%		false ->
%%%%			skip
%%%%	end,
%%%%	ok.
%%
%%getAllFurnitureStylish([],Score)->
%%	Score;
%%
%%getAllFurnitureStylish([#recHomeLayoutInfo{itemID = ItemID}|FurnitureList],Score)->
%%
%%	NewScore =
%%	case getCfg:getCfgByKey(cfg_home_furniture, ItemID) of
%%		#home_furnitureCfg{stylish = Sty}->
%%			Sty+Score;
%%		_->
%%			Score
%%	end,
%%	getAllFurnitureStylish(FurnitureList,NewScore).
%%
%%
%%
%%
%%%%小屋初始化面积等级
%%confighome_area_0() ->
%%	#globalsetupCfg{setpara = [List]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, home_area_0),
%%	List.
%%
%%
%%%%检测 货币是否足够
%%checkCost([]) -> true;
%%checkCost({MoneyType, Number}) ->
%%	CoinUseType = playerMoney:coinType2CoinUseType(MoneyType),
%%	playerMoney:canUseCoin(CoinUseType, Number);
%%checkCost([Needs | List]) ->
%%	case checkCost(Needs) of
%%		true ->
%%			checkCost(List);
%%		_ ->
%%			false
%%	end.
%%
%%
%%%%像地图上的玩家同步下数据
%%sendMsgToMapPlayer([], _Msg) ->
%%	ok;
%%sendMsgToMapPlayer([#recMapObject{netPid = NetPid} | T], Msg) ->
%%	playerMsg:sendNetMsg(NetPid, Msg),
%%	sendMsgToMapPlayer(T, Msg).
