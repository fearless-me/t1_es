%%%-------------------------------------------------------------------
%%% @author liushixue
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%	玩家称号系统
%%% @end
%%% Created : 04. 二月 2015 11:55
%%%-------------------------------------------------------------------
-module(playerTitle).
-author("liushixue").

-include("playerPrivate.hrl").
-include("title.hrl").
-include("../netmsg/netmsgRecords.hrl").
%% ===================================================================
%% API functions
%% ===================================================================
-export([
	initTitle/0,
	addTitle/2,
	changeFitState/1,
	getTitleOwnSolt/0,
	useItemAddTitle/0,
	checkTitleExpired/1,
	changeLimittimeTitle/1,
	useItemToAddTitle/1,
	changeTitleText/1,
	deleteTitleStatus/1,
	modifyTitleStatus/1
]).


%%初始化称号
-spec initTitle() -> ok.
initTitle() ->
	TitleList = playerState:getPlayerTitleList(),
	sendTitleListToClient(TitleList),

	% 由于强制离婚可以在对方不在线的时候操作 需要在玩家上线的时候判断一下婚姻情况和婚姻title的情况
	LastSlot1ID = playerPropSync:getProp(?PubProp_TitleSlot1),
	LastType = case getCfg:getCfgByKey(cfg_titlesystem, LastSlot1ID) of
      #titlesystemCfg{type1 = Type} ->
	      Type;
      _ ->
	      0
   end,
	case LastType of
		?TitleType1_Marriage ->
			RoleID = playerState:getRoleID(),
			case marriageState:queryRelation(RoleID) of
				#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
					skip;
				_ ->
					deleteTitleStatus(?TitleType1_Marriage)
			end;
		_ ->
			skip
	end.

%%增加称号词组或称号效果
-spec addTitle(TitleID::uint(),TitleSource::uint()) -> boolean().
addTitle(TitleID,TitleSource) ->
	OwnTitleList = playerState:getPlayerTitleList(),
	OwnTitleIDList = [Rec#recTitle.titleID || Rec <- OwnTitleList],
	case lists:member(TitleID, OwnTitleIDList) of
		true ->
			TitleCfg = getCfg:getCfgPStack(cfg_titlesystem, TitleID),
			case TitleCfg#titlesystemCfg.type1 of
				?TitleType1_Word ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleWordExist);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleEffectExist)
			end,
			?ERROR("player [~p] addtitle titleid [~p] exist",[playerState:getRoleID(),TitleID]),
			false;
		_ ->
			Time = time:getSyncTimeFromDBS(),
			EndTime = case getCfg:getCfgByArgs(cfg_titlesystem, TitleID) of
						  {}->
							  -1;
						  Cfg ->
							  case Cfg#titlesystemCfg.time =:= 0 of
								  true->
									  0;
								  _ ->
									  Cfg#titlesystemCfg.time + Time
							  end
					  end,
			case EndTime >= 0 of
				true ->
					RecTitle = #recTitle{titleID = TitleID,timestamp = EndTime },
					playerState:setPlayerTitleList([RecTitle | OwnTitleList]),
					playerSave:saveNewTitle(TitleID,EndTime),
					dbLog:sendSaveLogCreateTitle(playerState:getRoleID(),TitleID,TitleSource),
					sendAddTitleToClient(TitleID,EndTime);
				_ ->
					?ERROR("title[~p] cfg not exists",[TitleID])
			end,
			true
	end.


%%改变称号或效果的装配状态
-spec changeFitState(#pk_U2GS_ChangeTitleState{}) -> ok.
changeFitState(#pk_U2GS_ChangeTitleState{
	titleSlot1 = TitleSlot1,
	titleSlot2 = TitleSlot2,
	titleSlot3 = TitleSlot3,
	colorSlot  = ColorSlot,
	floorSlot  = FloorSlot
}) ->
	ChangeIDList = [TitleSlot1,TitleSlot2,TitleSlot3,ColorSlot,FloorSlot],
	NewChangeIDList = checkTitleSlot(ChangeIDList),
	syncVisibleTitleToClient(NewChangeIDList).

%%某些操作导致 自定义称号失效 比如婚姻称号离婚
-spec deleteTitleStatus(TitleType::uint()) -> ok.
deleteTitleStatus(TitleType) ->
	OldSlot1ID = playerPropSync:getProp(?PubProp_TitleSlot1),
	case getCfg:getCfgByKey(cfg_titlesystem, OldSlot1ID) of
		#titlesystemCfg{type1 = Type1} ->
			case Type1 of
				TitleType ->
					ColorSlot  = playerPropSync:getProp(?PubProp_TitleColorSlot),
					FloorSlot  = playerPropSync:getProp(?PubProp_TitleFloorSlot),
					ChangeIDList = [?NoneTitle,?NoneTitle,?NoneTitle,ColorSlot,FloorSlot],
					NewChangeIDList = checkTitleSlot(ChangeIDList),
					syncVisibleTitleToClient(NewChangeIDList);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%某些操作导致 自定义称号内容改变 比如婚姻称号在mr.王那里重新设置了内容
-spec modifyTitleStatus(TitleType::uint()) -> ok.
modifyTitleStatus(TitleType) ->
	OldSlot1ID = playerPropSync:getProp(?PubProp_TitleSlot1),
	case getCfg:getCfgByKey(cfg_titlesystem, OldSlot1ID) of
		#titlesystemCfg{type1 = Type1} ->
			case Type1 of
				TitleType ->
					OldSlot2ID = playerPropSync:getProp(?PubProp_TitleSlot2),
					OldSlot3ID = playerPropSync:getProp(?PubProp_TitleSlot3),
					ColorSlot  = playerPropSync:getProp(?PubProp_TitleColorSlot),
					FloorSlot  = playerPropSync:getProp(?PubProp_TitleFloorSlot),
					ChangeIDList = [OldSlot1ID,OldSlot2ID,OldSlot3ID,ColorSlot,FloorSlot],
					NewChangeIDList = checkTitleSlot(ChangeIDList),
					syncVisibleTitleToClient(NewChangeIDList);
				_ ->
					skip
			end
	end.

-spec getTitleOwnSolt() -> list().
getTitleOwnSolt() ->
	Slot1 = playerPropSync:getProp(?PubProp_TitleSlot1),
	Slot2 = playerPropSync:getProp(?PubProp_TitleSlot2),
	Slot3 = playerPropSync:getProp(?PubProp_TitleSlot3),
	ColorSlot = playerPropSync:getProp(?PubProp_TitleColorSlot),
	FloorSlot = playerPropSync:getProp(?PubProp_TitleFloorSlot),
	[Slot1, Slot2,Slot3, ColorSlot,FloorSlot].

useItemAddTitle() ->
	AllTitleIDList = getCfg:get1KeyList(cfg_titlesystem),

	%%从所有称号ID或者已获得的称号ID中取得可供随机获得的普通ID列表
	Fun = fun(ID,AccIn) ->
		Cfg = getCfg:getCfgPStack(cfg_titlesystem, ID),
		case Cfg#titlesystemCfg.special =:= ?Title_General of
			true ->
				[ID | AccIn];
			_ ->
				AccIn
		end
		  end,
	AllGeneralIDList = lists:foldl(Fun, [], AllTitleIDList),
	OwnTitleList = playerState:getPlayerTitleList(),
	OwnGeneralIDList = case OwnTitleList of
						   [] ->
							   [];
						   _ ->
							   Fun1 = fun(Rec) ->
								   Rec#recTitle.titleID
									  end,
							   OwnIDList = lists:map(Fun1, OwnTitleList),
							   lists:foldl(Fun, [], OwnIDList)
					   end,
	case erlang:length(OwnGeneralIDList) < erlang:length(AllGeneralIDList) of
		true ->
			LeftIDList = AllGeneralIDList -- OwnGeneralIDList,
			N = random:uniform(erlang:length(LeftIDList)),
			NewTitleID = lists:nth(N, LeftIDList),
			addTitle(NewTitleID,?TitleSourceGeneralScroll),
			true;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleWordIsFull),
			false
	end.


%% ===================================================================
%% Internal functions
%% ===================================================================

%%发送已获得称号的列表到客户端
-spec sendTitleListToClient(TitleList::[#recTitle{},...]) -> ok.
sendTitleListToClient(TitleList) ->
	Fun = fun(#recTitle{
		titleID = TitleID,
		timestamp = Time
	}) ->
%%		EndTime = case getCfg:getCfgPStack(cfg_titlesystem, TitleID) of
%%					  #titlesystemCfg{time = T} ->
%%						  case T =:= 0 of
%%							  true -> 0;
%%							  _ -> T + Time
%%						  end;
%%			          _ -> 0
%%				  end,
		#pk_TitleInfo{
			titleID = TitleID,
			endTime = Time		}
		  end,
	List = lists:map(Fun, TitleList),
	Msg = #pk_GS2U_OwnTitleList{
		titleInfoList = List
	},
	playerMsg:sendNetMsg(Msg).

% 如果由自定义称号转为非自定义称号时 清空一下自定义称号的公共属性(目前只有婚姻自定义称号)
toResetPPropCustomTitle(LastType) ->
	case LastType of
		?TitleType1_Marriage ->
			playerPropSync:setString(?PubProp_CustomTitle,"");
		_ ->
			skip
	end.

%%判断能否装配 如果可以装配就同步已装配的称号到客户端
-spec syncVisibleTitleToClient(NewChangeIDList :: list()) -> ok.
syncVisibleTitleToClient(NewChangeIDList) ->
	LastSlot1ID = playerPropSync:getProp(?PubProp_TitleSlot1),
	LastType = case getCfg:getCfgByKey(cfg_titlesystem, LastSlot1ID) of
      #titlesystemCfg{type1 = Type} ->
	      Type;
      _ ->
	      0
   end,
	% 在这处理特殊一些自定义称号 目前只有婚姻自定义称号
	NewSlot1ID = lists:nth(?TitleSlot1,NewChangeIDList),
	IsCanSync = case getCfg:getCfgByKey(cfg_titlesystem, NewSlot1ID) of
		#titlesystemCfg{type1 = Type1} ->
			case Type1 of
				?TitleType1_Marriage ->
					RoleID = playerState:getRoleID(),
					case marriageState:queryRelation(RoleID) of
						#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
							TarName = core:queryRoleNameByRoleID(TargetRoleID),
							#serverstringsCfg{chs = Content} = getCfg:getCfgPStack(cfg_serverstrings, ceremony_titlestring),
							CustomStr = playerPropSync:getProp(?PriProp_MarriageTitle),
							playerPropSync:setString(?PubProp_CustomTitle,TarName ++ Content ++ CustomStr),
							true;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleUseTitleNotMarriage),
							false
					end;
				% 这样写是为了标识扩展新增自定义称号的写法方式 如果后面自定义称号太多了 就拆分函数匹配方式
				% ?OtherCustomTitle...
				_ ->
					% 非自定义称号时需要判断是否由自定义称号转为非自定义称号
					toResetPPropCustomTitle(LastType),
					true
			end;
		_ ->
			toResetPPropCustomTitle(LastType),
			true
	end,

	case IsCanSync of
		true ->
			playerPropSync:setInt(?PubProp_TitleSlot1,lists:nth(?TitleSlot1,NewChangeIDList)),
			playerPropSync:setInt(?PubProp_TitleSlot2,lists:nth(?TitleSlot2,NewChangeIDList)),
			playerPropSync:setInt(?PubProp_TitleSlot3,lists:nth(?TitleSlot3,NewChangeIDList)),
			playerPropSync:setInt(?PubProp_TitleColorSlot,lists:nth(?TitleColorSlot,NewChangeIDList)),
			playerPropSync:setInt(?PubProp_TitleFloorSlot,lists:nth(?TitleFloorSlot,NewChangeIDList));
		_ ->
			skip
	end,
	ok.

%%发送新增称号信息到客户端
-spec sendAddTitleToClient(TitleID :: uint(),EndTime :: int()) ->ok.
sendAddTitleToClient(TitleID,EndTime) ->
	Msg = #pk_GS2U_AddTitle{
		titleID = TitleID,
		endTime = EndTime
	},
	playerMsg:sendNetMsg(Msg).

%%检查称号装配情况
-spec checkTitleSlot(ChangeIDList :: list()) -> list().
checkTitleSlot(ChangeIDList) ->
	TitleList = playerState:getPlayerTitleList(),
	Fun = fun(ID) ->
		case ID =:= ?NoneTitle of
			true ->
				?NoneTitle;
			_ ->
				%%检查要装配的称号ID玩家是否拥有
				case lists:keyfind(ID,#recTitle.titleID,TitleList) of
					false ->
						?ERROR("player[~ts] not own title: ~p",[playerState:getName(),ID]),
						?NoneTitle;
					_ ->
						ID
				end
		end
		  end,
	lists:map(Fun,checkRepeat(ChangeIDList)).

%%检查一个称号重复装到多个槽位的情况，重复的设为?NoneTitle（会保留最后一个）
-spec checkRepeat(IDList :: list()) -> list().
checkRepeat([H|T]) ->
	case lists:member(H,T) of
		true ->
			[?NoneTitle|checkRepeat(T)];
		_ ->
			[H|checkRepeat(T)]
	end;
checkRepeat([]) ->
	[].

-spec checkLimitTitleSlot(TitleList :: list() ) -> ok.
checkLimitTitleSlot(TitleList)->
	SlotTitleID = playerPropSync:getProp(?PubProp_TitleOutDate),
	case SlotTitleID of
		0 ->ok; %未装备称号
		_ ->
			case lists:keyfind(SlotTitleID,#recTitle.titleID,TitleList) of
				false->
					playerMsg:sendNetMsg(#pk_GS2U_DelTitle{ titleID = SlotTitleID }),
					playerPropSync:setInt(?PubProp_TitleOutDate,?NoneTitle );
				_ ->ok
			end
	end,
	ok.

-spec checkTitleExpired(TitleList :: list() ) -> ok.
checkTitleExpired(TitleList)->
	checkLimitTitleSlot(TitleList),
	case TitleList of
		[]->[];
		_ ->
			OutDateTitle =
				lists:filter(
					fun(Title)->
						case getCfg:getCfgByKey(cfg_titlesystem, Title#recTitle.titleID) of
							#titlesystemCfg{time = 0} ->
								false;
							#titlesystemCfg{} ->
								CurrTime = time:getSyncTimeFromDBS(),
								case CurrTime > Title#recTitle.timestamp of
									true->true;
									false->false
								end;
							_ ->
								?ERROR("title is delete:~p,~p", [playerState:getRoleID(), Title#recTitle.titleID]),
								false
						end
					end,TitleList),
			case OutDateTitle of
				[]->ok;
				_ ->
					lists:foreach(
						fun(Title)->
							?DEBUG("pk_GS2U_DelTitle [~p]",[Title#recTitle.titleID]),
							?INFO("player [~p] has title [~p] out of date",[playerState:getRoleID(),Title#recTitle.titleID]),
							playerMsg:sendNetMsg(#pk_GS2U_DelTitle{ titleID = Title#recTitle.titleID}),
							case Title#recTitle.titleID =:= playerPropSync:getProp(?PubProp_TitleOutDate) of
								true->
									playerPropSync:setInt(?PubProp_TitleOutDate,?NoneTitle );
								_ ->ok
							end,
							playerSave:deleteTitle(playerState:getRoleID(),Title#recTitle.titleID),
							playerState:setPlayerTitleList(lists:keydelete(Title#recTitle.titleID,#recTitle.titleID,TitleList))
						end,OutDateTitle)
			end,
			ok

	end,
	ok.

-spec changeLimittimeTitle(TitleID :: int() ) -> ok.
changeLimittimeTitle(TitleID)->
	case TitleID of
		0 ->
			playerPropSync:setInt(?PubProp_TitleOutDate,TitleID );
		_ ->
			TitleList = playerState:getPlayerTitleList(),
			LimitTitle = lists:filter(fun(Title)->
				case getCfg:getCfgPStack(cfg_titlesystem, Title#recTitle.titleID ) of
					{}->false;
					TitleCfg->TitleCfg#titlesystemCfg.time > 0
				end
									  end,TitleList),
			case lists:keyfind(TitleID,#recTitle.titleID,LimitTitle) of
				#recTitle{}->
					playerPropSync:setInt(?PubProp_TitleOutDate,TitleID );
				false->ok
			end
	end,
	ok.

-spec getTitleIdByItemUID(UID :: uint() ) -> uint32().
getTitleIdByItemUID(UID) ->
	Item = playerPackage:getGoodsByUID(UID,?Item_Location_Bag),
	case Item of
		#rec_item{itemID = ItemID} ->
			#itemCfg{useParam1 = UseParam1} = getCfg:getCfgPStack(cfg_item, ItemID),
			UseParam1;
		_ ->
			0
	end.

-spec useItemToAddTitle(#pk_U2GS_UseMarriageTitleItem{} ) -> ok.
useItemToAddTitle(#pk_U2GS_UseMarriageTitleItem{itemUID = UID, useNum = Num, text = Text}) ->
	% 检查玩家是否用过
	TitleID = getTitleIdByItemUID(UID),
	case playerPropSync:getProp(?PriProp_MarriageTitle) =:= "" of
		true when TitleID > 0 ->
			#globalsetupCfg{setpara = [LenMax]} = getCfg:getCfgByKey(cfg_globalsetup, coupletitle_limit),
			% 检查子自定义内容长度
			NameLen = str:get_utf8_char_count(Text),
			case NameLen =< LenMax of
				true ->
					% 检查玩家是否结婚
					RoleID =playerState:getRoleID(),
					case marriageState:queryRelation(RoleID) of
						#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
							% 可以用道具了 这就走使用道具流程 检查是否使用成功
							% 由于自定义内容不好传进去 不能再使用物品回调函数处理加title
							case playerItem:useBagItem(UID, Num, ?ItemUseReasonPlayer, UID) of
								failed ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleUseItemFailed);
								_ ->
									% 成功时 加title 设置玩家婚姻称号内容
									addTitle(TitleID,?TitleSourceMarriageTitle),
									playerPropSync:setString(?PriProp_MarriageTitle,Text)
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleUseItemNotMarriage)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleUseItemTextTooLong)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleEffectExist)
	end,
ok.

-spec changeTitleText(#pk_U2GS_ChangeCustomTitleText{} ) -> ok.
changeTitleText(#pk_U2GS_ChangeCustomTitleText{titleID = _TitleID, type = ?TitleType1_Marriage, text = Text}) ->
	case playerPropSync:getProp(?PriProp_MarriageTitle) =:= "" of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleMarriageTextNotHave);
		_ ->
			#globalsetupCfg{setpara = [LenMax]} = getCfg:getCfgByKey(cfg_globalsetup, coupletitle_limit),
			% 检查子自定义内容长度
			NameLen = str:get_utf8_char_count(Text),
			case NameLen =< LenMax of
				true ->
					% 检查玩家是否结婚
					RoleID =playerState:getRoleID(),
					case marriageState:queryRelation(RoleID) of
						#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
							% 扣钱
							#globalsetupCfg{setpara = [CoinUseType, NeedMoney]} = getCfg:getCfgPStack(cfg_globalsetup, coupletitle_resetcost),
							case playerMoney:canUseCoin(CoinUseType, NeedMoney) of
								true ->
									PLog = #recPLogTSMoney{
										reason = ?CoinUseMarriageTitleText,
										param  = NeedMoney,
										target = ?PLogTS_AchieveSystem,
										source = ?PLogTS_PlayerSelf},
									playerMoney:useCoin(CoinUseType, NeedMoney,PLog),
									playerPropSync:setString(?PriProp_MarriageTitle,Text),
									modifyTitleStatus(?TitleType1_Marriage);
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleMarriageTextNotEnoughMoney)
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleMarriageTextNotMarriage)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleMarriageTextTooLong)
			end
	end;
changeTitleText(#pk_U2GS_ChangeCustomTitleText{titleID = _TitleID, type = _type, text = _Text}) ->
ok.


