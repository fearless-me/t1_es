%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 好友系统_角色进程_接口
%%% @end
%%% Created : 20161115
%%%           20171129 因跨服结构改变进行调整
%%%-------------------------------------------------------------------
-module(playerFriend).
-author("meitianyang").

-include("playerPrivate.hrl").
%%
%%% api,msg
%%-export([
%%	msg/1,					%% 协议处理
%%	% 主要在普通服使用
%%	queryList/2,			%% 请求各种列表信息（兼容跨服）
%%	queryListForMarriage/1,	%% 婚姻专供（跨服上不可用）
%%	simple/1,				%% 请求精简信息（兼容跨服）
%%	search/1,				%% 根据完整昵称搜索目标角色（跨服上不可用）
%%	limitSearch/1,			%% 根据完整昵称搜索目标角色但是会根据配置限制结果（跨服上不可用）
%%	recommend/3,			%% 推荐好友（跨服上不可用）
%%	add/1,					%% 申请添加好友（兼容跨服好友）
%%	addFromBlack/1,			%% 从黑名单中添加好友（跨服上不可用）
%%	refuse/1,				%% 拒绝本地好友申请（跨服上不可用）
%%	applyOneKey/1,			%% 一键处理本地好友申请（跨服上不可用）
%%	del/1,					%% 删除好友（跨服上不可用）
%%	ban/2,					%% 拉黑（跨服上不可用）
%%	banWithUnban/2,			%% 移除黑名单A，然后拉黑B（跨服上不可用）
%%	banWithUnbanAndDel/2,	%% 黑名单满时拉黑好友（跨服上不可用）
%%	unban/1,				%% 移除黑名单（跨服上不可用）
%%	formalOP/2,				%% 伪周边功能，有些和好友其实没啥关系（跨服上不可用）
%%	forLook/1,				%% 用于客户端显示(兼容跨服）
%%	wantChat/1,				%% 用于客户端显示（兼容跨服）
%%	chat/1,					%% 好友聊天，含语音（跨服上部分兼容，因为跨服上界面不对）
%%	% 主要在跨服使用
%%	add_cross/1,			%% 请求添加跨服好友（兼容普通服）
%%	add_cross2/2,			%% 同意或拒绝跨服申请者（兼容普通服）
%%	del_cross/1				%% 请求删除跨服好友（兼容普通服）
%%]).
%%
%%% api 主要在普通服使用
%%-export([
%%	init/0,					%% 上线初始化
%%	relationAck/1,			%% 请求反馈或数据同步
%%	addTemp/1,				%% 添加临时好友（跨服上不可用，但不会提示客户端）
%%	closenessAdd/4,			%% 增加友好度（跨服上不可用）
%%	sendOfflineMsg/0,		%% 发送离线消息（跨服上不可用）
%%	deleteRole/1,			%% 删除角色回调（跨服上不可用）
%%	enterCross/1,			%% 进入跨服初始化（仅跨服）
%%	exitCross/1				%% 退出跨服数据清理（仅跨服）
%%]).
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:协议处理
%%-spec msg(Msg::term()) -> no_return().
%%msg(#pk_U2GS_Friend2SimpleList_Requets{type = Type}) ->
%%	playerFriend:simple(Type);
%%msg(#pk_U2GS_Friend2Search_Request{name = Name}) ->
%%	playerFriend:search(Name);
%%msg(#pk_U2GS_Friend2LimitSearch_Request{name = Name}) ->
%%	playerFriend:limitSearch(Name);
%%msg(#pk_U2GS_Friend2Recommend_Request{sex = Sex, isNear = IsNear, isPush = IsPush}) ->
%%	playerFriend:recommend(Sex, IsNear, IsPush);
%%msg(#pk_U2GS_Friend2Add_Request{id = ID}) ->
%%	playerFriend:add(ID);
%%msg(#pk_U2GS_Friend2AddFromBlack_Reply{isAgreed = false}) ->
%%	skip;	%% 不同意就算了，当初设计协议真是失误啊
%%msg(#pk_U2GS_Friend2AddFromBlack_Reply{id = ID}) ->
%%	playerFriend:addFromBlack(ID);
%%msg(#pk_U2GS_Friend2ApplicantUse_Request{id = ID, isAgreed = true}) ->
%%	playerFriend:add(ID);	%% 同意好友申请时如同添加好友逻辑
%%msg(#pk_U2GS_Friend2ApplicantUse_Request{id = ID}) ->
%%	playerFriend:refuse(ID);
%%msg(#pk_U2GS_Friend2ApplicantUseOneKey_Request{isAgreed = IsAgreed}) ->
%%	playerFriend:applyOneKey(IsAgreed);
%%msg(#pk_U2GS_Friend2Del_Request{id = ID}) ->
%%	playerFriend:del(ID);
%%msg(#pk_U2GS_Friend2Applicant_Request{page = Page}) ->
%%	playerFriend:queryList(?FRT_Apply, Page);
%%msg(#pk_U2GS_Friend2Formal_Request{page = Page}) ->
%%	playerFriend:queryList(?FRT_Formal, Page);
%%msg(#pk_U2GS_Friend2Temp_Request{page = Page}) ->
%%	playerFriend:queryList(?FRT_Temp, Page);
%%msg(#pk_U2GS_Friend2Black_Request{page = Page}) ->
%%	playerFriend:queryList(?FRT_Black, Page);
%%msg(#pk_U2GS_Friend2Ban_Request{id = ID}) ->
%%	playerFriend:ban(ID, false);
%%msg(#pk_U2GS_Friend2BanWithUnban_Reply{isAgreed = false}) ->
%%	skip;	%% 不同意就算了，当初设计协议真是失误啊
%%msg(#pk_U2GS_Friend2BanWithUnban_Reply{idBan = IDBan, idUnban = IDUnBan}) ->
%%	playerFriend:banWithUnban(IDUnBan, IDBan);
%%msg(#pk_U2GS_Friend2BanWithDel_Reply{isAgreed = false}) ->
%%	skip;	%% 不同意就算了，当初设计协议真是失误啊
%%msg(#pk_U2GS_Friend2BanWithDel_Reply{id = ID}) ->
%%	playerFriend:ban(ID, true);
%%msg(#pk_U2GS_Friend2BanWithUnbanAndDel_Reply{isAgreed = false}) ->
%%	skip;	%% 不同意就算了，当初设计协议真是失误啊
%%msg(#pk_U2GS_Friend2BanWithUnbanAndDel_Reply{idUnban = IDUnban, idDel = IDDel}) ->
%%	playerFriend:banWithUnbanAndDel(IDUnban, IDDel);
%%msg(#pk_U2GS_Friend2Unban_Request{id = ID}) ->
%%	playerFriend:unban(ID);
%%msg(#pk_U2GS_Friend2FormalOP_Request{id = ID, opType = OpType}) ->
%%	playerFriend:formalOP(ID, OpType);
%%msg(#pk_U2GS_Friend2FormalChat_Request{} = Msg) ->
%%	playerFriend:chat(Msg);
%%msg(#pk_U2GS_Friend2FormalChatVoice_Request{} = Msg) ->
%%	playerFriend:chat(Msg);
%%msg(#pk_U2GS_Friend2ForLook_Request{id = ID}) ->
%%	playerFriend:forLook(ID);
%%msg(#pk_U2GS_Friend2WantChat_Request{id = ID}) ->
%%	playerFriend:wantChat(ID);
%%msg(#pk_U2GS_Friend2CrossAll_Request{type = ?LT_Cross}) ->
%%	playerFriend:queryList(?FRT_Cross, 0);
%%msg(#pk_U2GS_Friend2CrossAll_Request{type = ?LT_Apply}) ->
%%	playerFriend:queryList(?FRT_CApply, 0);
%%msg(#pk_U2GS_Friend2CrossAdd_Request{id = ID}) ->
%%	playerFriend:add_cross(ID);
%%msg(#pk_U2GS_Friend2CrossAdd2_Request{id = ID, isAgreed = IsAgreed}) ->
%%	playerFriend:add_cross2(ID, IsAgreed);
%%msg(#pk_U2GS_Friend2CrossDel_Request{id = ID}) ->
%%	playerFriend:del_cross(ID);
%%
%%msg(#pk_U2GS_Friend2GetBack_Ignore{id = ID}) ->
%%	ignore_getBack(ID);
%%msg(#pk_U2GS_Friend2GetBack_Add{id = ID}) ->
%%	add_getBack(ID);
%%msg(#pk_U2GS_Friend2GetBack_OneKeyToAdd{}) ->
%%	oneKeyAdd_getBack();
%%msg(Unknown) ->
%%	?ERROR("Unknown:~w", [Unknown]).
%%
%%%%%-------------------------------------------------------------------
%%% internal,msg:大多数接口通用检查
%%% 用于检查是否可以在跨服上调用
%%% 屏蔽对自己的非法操作
%%-spec apiCheck(AllowCross::boolean(), NoticeCross::boolean(), TargetRoleID::uint64()) -> boolean().
%%apiCheck(true, _, TargetRoleID) ->
%%	case playerMainMenu:isOpen(?ModeType_Social) of
%%		true ->
%%			playerState:getRoleID() =/= TargetRoleID;
%%		_ ->
%%			false
%%	end;
%%apiCheck(false, NoticeCross, TargetRoleID) ->
%%	case core:isCross() of
%%		true ->
%%			case NoticeCross of
%%				true ->
%%					playerCross:disableOnCross();
%%				_ ->
%%					false
%%			end;
%%		_ ->
%%			apiCheck(true, false, TargetRoleID)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:请求各种列表信息（兼容跨服）
%%-spec queryList(FRT::type_frt(), Page::uint8()) -> no_return().
%%queryList(FRT, Page) ->
%%	case apiCheck(true, false, 0) of
%%		true ->
%%			doQueryList(FRT, Page);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal,msg:请求各种列表信息
%%-spec doQueryList(FRT::type_frt(), Page::uint8()) -> no_return().
%%doQueryList(?FRT_Temp = FRT, Page) ->
%%	RoleID = playerState:getRoleID(),
%%	L0 = cgsFriendInterface:queryListSort(RoleID, FRT),
%%	#globalsetupCfg{setpara = [CountPage]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_temp_page_count),
%%	{PageValid, L1} = getListByPage(Page, CountPage, L0),
%%	playerState2:setFriend2PageTemp(PageValid),
%%	Msg = #pk_GS2U_Friend2TempReset_Sync{
%%		count = erlang:length(L0),
%%		page = PageValid,
%%		listInfo = [createInfoBase(R) || R <- L1]
%%	},
%%	playerMsg:sendNetMsg(Msg);
%%doQueryList(?FRT_Formal = FRT, Page) ->
%%	RoleID = playerState:getRoleID(),
%%	L0 = cgsFriendInterface:queryListSort(RoleID, FRT),
%%	#globalsetupCfg{setpara = [CountPage]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_formal_page_count),
%%	{PageValid, L1} = getListByPage(Page, CountPage, L0),
%%	playerState2:setFriend2PageFormal(PageValid),
%%	Msg = #pk_GS2U_Friend2FormalReset_Sync{
%%		count = erlang:length(L0),
%%		hasAP = cgsFriendState:queryUnGainAP(RoleID),
%%		page = PageValid,
%%		listInfo = [createInfoFormal(R) || R <- L1]
%%	},
%%	playerMsg:sendNetMsg(Msg);
%%doQueryList(?FRT_Black = FRT, Page) ->
%%	RoleID = playerState:getRoleID(),
%%	L0 = cgsFriendInterface:queryListSort(RoleID, FRT),
%%	#globalsetupCfg{setpara = [CountPage]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_black_page_count),
%%	{PageValid, L1} = getListByPage(Page, CountPage, L0),
%%	playerState2:setFriend2PageBlack(PageValid),
%%	Msg = #pk_GS2U_Friend2BlackReset_Sync{
%%		count = erlang:length(L0),
%%		page = PageValid,
%%		listInfo = [createInfoBase(R) || R <- L1]
%%	},
%%	playerMsg:sendNetMsg(Msg);
%%doQueryList(?FRT_Apply = FRT, Page) ->
%%	RoleID = playerState:getRoleID(),
%%	L0 = cgsFriendInterface:queryListSort(RoleID, FRT),
%%	#globalsetupCfg{setpara = [CountPage]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_add_applicant_page_count),
%%	{PageValid, L1} = getListByPage(Page, CountPage, L0),
%%	playerState2:setFriend2PageApp(PageValid),
%%	Msg = #pk_GS2U_Friend2ApplicantReset_Sync{
%%		count = erlang:length(L0),
%%		page = PageValid,
%%		listInfo = [createInfoBase(R) || R <- L1]
%%	},
%%	playerMsg:sendNetMsg(Msg);
%%doQueryList(?FRT_Cross = FRT, _Page) ->
%%	RoleID = playerState:getRoleID(),
%%	L = cgsFriendInterface:queryList(RoleID, FRT),
%%	Msg =
%%		#pk_GS2U_Friend2CrossAll_Sync{
%%			type = ?LT_Cross,
%%			listAll = [friendCommon:createInfoCross(R) || R <- L]
%%		},
%%	playerMsg:sendNetMsg(Msg);
%%doQueryList(?FRT_CApply = FRT, _Page) ->
%%	RoleID = playerState:getRoleID(),
%%	L = cgsFriendInterface:queryList(RoleID, FRT),
%%	Msg =
%%		#pk_GS2U_Friend2CrossAll_Sync{
%%			type = ?LT_Apply,
%%			listAll = [friendCommon:createInfoCross(R) || R <- L]
%%		},
%%	playerMsg:sendNetMsg(Msg).
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:请求各种列表信息（跨服上不可用）
%%-spec queryListForMarriage(Page::uint8()) -> no_return().
%%queryListForMarriage(Page) ->
%%	case apiCheck(true, false, 0) of
%%		true ->
%%			case playerMainMenu:isOpen(?ModeType_Marriage) andalso variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_WeddingSite) of
%%				true ->
%%					RoleID = playerState:getRoleID(),
%%					L0 = cgsFriendInterface:queryListSortForMarriage(RoleID),
%%					#globalsetupCfg{setpara = [CountPage]} =
%%						getCfg:getCfgPStack(cfg_globalsetup, friend2_formal_page_count),
%%					{PageValid, L1} = getListByPage(Page, CountPage, L0),
%%					Msg =
%%						#pk_GS2U_Friend2FormalForMarriage_Sync{
%%							count = erlang:length(L0),
%%							hasAP = cgsFriendState:queryUnGainAP(RoleID),
%%							page = PageValid,
%%							listInfo = [createInfoFormal(ID) || ID <- L1]
%%						},
%%					playerMsg:sendNetMsg(Msg);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal,msg:获取第N页的数据
%%-spec getListByPage(Page::uint8(), CountPage::uint8(), ListIn::list()) -> {PageValid::uint8(), ListOut::list()}.
%%getListByPage(Page, CountPage, ListIn) ->
%%	Length2 =
%%		case erlang:length(ListIn) of
%%			0 ->
%%				0;
%%			Length1 ->
%%				Length1 - 1
%%		end,
%%	PageMax = erlang:trunc(Length2 / CountPage),
%%	PageValid =
%%		case Page > PageMax of
%%			true ->
%%				PageMax;
%%			_ ->
%%				Page
%%		end,
%%	Nth = PageValid * CountPage,
%%	List1 = lists:nthtail(Nth, ListIn),
%%	ListOut =
%%		case erlang:length(List1) > CountPage of
%%			true ->
%%				{List2, _} = lists:split(CountPage, List1),
%%				List2;
%%			_ ->
%%				List1
%%		end,
%%	{PageValid, ListOut}.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:请求精简信息（兼容跨服）
%%-spec simple(FRT::type_frt()) -> no_return().
%%simple(FRT) ->
%%	RoleID = playerState:getRoleID(),
%%	L0 = cgsFriendInterface:queryListSort(RoleID, FRT),
%%	L1 = simple_msg_create(L0, []),
%%	%% 该协议支持将过大的消息包分段发送，但长期实践中并没有一张图片大，所以还是一次性发送过去了
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_Friend2SimpleList_Ack{
%%			type = FRT,
%%			count = erlang:length(L1),
%%			index = 0,
%%			listInfo = L1
%%		}
%%	).
%%
%%%%%-------------------------------------------------------------------
%%% internal,msg:生成精简信息
%%-spec simple_msg_create([Data, ...], [#pk_Friend2InfoSimple{}, ...]) -> [#pk_Friend2InfoSimple{}, ...] when
%%	Data :: #rec_friend2_relation{} | #rec_friend2_interaction{} | #rec_friend2_cross{} | #recFriend2Cross{}.
%%simple_msg_create([], Acc) ->
%%	Acc;
%%simple_msg_create([#rec_friend2_relation{targetRoleID = ID} | T], Acc) ->
%%	simple_msg_create([ID | T], Acc);
%%simple_msg_create([#rec_friend2_interaction{targetRoleID = ID} | T], Acc) ->
%%	simple_msg_create([ID | T], Acc);
%%simple_msg_create([#rec_friend2_cross{tarRoleID = ID} | T], Acc) ->
%%	simple_msg_create([ID | T], Acc);
%%simple_msg_create(
%%	[
%%		#recFriend2Cross{
%%			tarRoleID = ID,
%%			tarRoleName = Name,
%%			tarLevel = Level,
%%			tarCareer = Career,
%%			tarRace = Race,
%%			tarSex = Sex,
%%			tarHead = Head,
%%			tarFrame = FrameID
%%		} | T
%%	], Acc
%%) ->
%%	Simple = #pk_Friend2InfoSimple{
%%		id = ID,
%%		name = Name,
%%		level = Level,
%%		career = Career,
%%		race = Race,
%%		sex = Sex,
%%		head = Head,
%%		frameID = FrameID
%%	},
%%	simple_msg_create(T, [Simple | Acc]);
%%simple_msg_create([ID | T], Acc) ->
%%	case core:queryRoleKeyInfoByRoleID(ID) of
%%		#?RoleKeyRec{
%%			roleName = Name,
%%			level = Level,
%%			career = Career,
%%			race = Race,
%%			sex = Sex,
%%			head = Head,
%%			frameID = FrameID
%%		} ->
%%			Simple = #pk_Friend2InfoSimple{
%%				id = ID,
%%				name = Name,
%%				level = Level,
%%				career = Career,
%%				race = Race,
%%				sex = Sex,
%%				head = Head,
%%				frameID = FrameID
%%			},
%%			simple_msg_create(T, [Simple | Acc]);
%%		_ ->
%%			simple_msg_create(T, Acc)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:根据完整昵称搜索目标角色（跨服上不可用）
%%-spec search(Name::string()) -> no_return().
%%search(Name) ->
%%	case apiCheck(false, true, 0) of
%%		true ->
%%			case playerState:getName() of
%%				Name ->
%%					skip; %% 忽略自己
%%				[] ->
%%					skip; %% 忽略空
%%				_ ->
%%					case playerNameUID:getPlayerUIDByName(Name) of
%%						0 ->
%%							?ERROR_CODE(?ErrorCode_Friend2_None);
%%						TargetRoleID ->
%%							Msg = #pk_GS2U_Friend2Search_Ack{
%%								listInfo = [createInfoBase(TargetRoleID)]
%%							},
%%							playerMsg:sendNetMsg(Msg)
%%					end
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%% api,msg:根据完整昵称搜索目标角色 但是会根据配置限制结果（跨服上不可用）
%%-spec limitSearch(Name::string()) -> no_return().
%%limitSearch(Name) ->
%%	case apiCheck(false, true, 0) of
%%		true ->
%%			case playerState:getName() of
%%				Name ->
%%					skip; %% 忽略自己
%%				[] ->
%%					skip; %% 忽略空
%%				_ ->
%%					case playerNameUID:getPlayerUIDByName(Name) of
%%						0 ->
%%							?ERROR_CODE(?ErrorCode_Friend2_None);
%%						TargetRoleID ->
%%							SelfRoleID = playerState:getRoleID(),
%%							Present_Condition = case getCfg:getCfgByKey(cfg_globalsetup, present_condition) of
%%								#globalsetupCfg{setpara = [N]} ->
%%									N;
%%								#globalsetupCfg{setpara = []} ->
%%									0;  %% globalsetup表配置为0时，导表工具导出服务端配置为[]，因此此时[]等价于[0]
%%								_ ->
%%									0	%% 默认不限制
%%							end,
%%							case Present_Condition =:= 0 of
%%								true ->
%%									Msg = #pk_GS2U_Friend2Search_Ack{
%%										listInfo = [createInfoBase(TargetRoleID)]
%%									},
%%									playerMsg:sendNetMsg(Msg);
%%								_ ->
%%									case cgsFriendState:queryRelation(SelfRoleID, TargetRoleID) of
%%										#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
%%											Msg = #pk_GS2U_Friend2Search_Ack{
%%												listInfo = [createInfoBase(TargetRoleID)]
%%											},
%%											playerMsg:sendNetMsg(Msg);
%%										_ ->
%%											% 不是正式好友
%%											?ERROR_CODE(?ErrorCode_GiveGift_searchcondition)
%%									end
%%							end
%%					end
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% api,msg:推荐好友
%%-spec recommend(Sex::uint8(), IsNear::boolean(), IsPush::boolean()) -> no_return().
%%recommend(Sex, IsNear, IsPush) ->
%%	case apiCheck(false, true, 0) of
%%		true ->
%%			case IsPush of
%%				true ->
%%					Level = playerState:getLevel(),
%%					#globalsetupCfg{setpara = [LevelMin, LevelMax]} =
%%						getCfg:getCfgPStack(cfg_globalsetup, friends_pushlevelmax),
%%					case Level < LevelMin orelse Level > LevelMax of
%%						true ->
%%							skip;	%% 等级区间外，不推送
%%						_ ->
%%							RoleID = playerState:getRoleID(),
%%							ListFormal = cgsFriendInterface:queryList(RoleID, ?FRT_Formal),
%%							#globalsetupCfg{setpara = [PushFriendCountMax]} =
%%								getCfg:getCfgPStack(cfg_globalsetup, friends_listconfine),
%%							case erlang:length(ListFormal) >= PushFriendCountMax of
%%								true ->
%%									skip;	%% 好友太多，不推送
%%								_ ->
%%									recommendDo(Sex, IsNear, IsPush)	%% 推送型推荐
%%							end
%%					end;
%%				_ ->
%%					recommendDo(Sex, IsNear, IsPush)	%% 请求型推荐
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg:推荐好友_条件判断后的执行
%%-spec recommendDo(Sex::uint8(), IsNear::boolean(), IsPush::boolean()) -> no_return().
%%recommendDo(Sex, IsNear, IsPush) ->
%%	RoleID = playerState:getRoleID(),
%%	ListID = recommend_get({RoleID, Sex, IsNear, IsPush}, false),
%%	Msg = #pk_GS2U_Friend2Recommend_Ack{
%%		isPush = IsPush,
%%		listInfo = [createInfoBase(ID) || ID <- ListID]
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	case IsPush of
%%		true ->
%%			%% 定时推送，记录当日推送次数
%%			playerDaily:incDailyCounter(?DailyType_AutoRecommend, 0);
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg:推荐好友（获得筛选的角色ID）
%%-spec recommend_get({RoleID::uint64(), Sex::uint8(), IsNear::boolean(), IsPush::boolean()}, IsRecursion::boolean()) -> [uint64(), ...].
%%recommend_get(PA = {RoleID, Sex, IsNear, IsPush}, IsRecursion) ->
%%	CountMax =
%%		case IsPush of
%%			true ->
%%				#globalsetupCfg{setpara = [MinPush, MaxPush]} =
%%					getCfg:getCfgPStack(cfg_globalsetup, friends_pushnum),
%%				misc:rand(MinPush, MaxPush);
%%			_ ->
%%				#globalsetupCfg{setpara = [CountMax_NotPush]} =
%%					getCfg:getCfgPStack(cfg_globalsetup, friend2_recommend_count),
%%				CountMax_NotPush
%%		end,
%%	List1 =
%%		case IsNear of
%%			true ->
%%				%% fixme 由于新的lbs系统与旧系统差别过大，就近查询的功能需要调整
%%				playerState2:getFriend2OnlineListRoleIDNear();
%%			_ ->
%%				playerState2:getFriend2OnlineListRoleID()
%%		end,
%%	Friend2DataMine = cgsFriendState:queryFriend2Data(RoleID),
%%	case recommend_getR({0, [], List1}, {Friend2DataMine, CountMax, Sex}) of
%%		{CountGet, ListID, List2} when CountGet >= CountMax ->
%%			playerState2:setFriend2OnlineListRoleID(List2),
%%			ListID; %% 得到了足够的数据，返回
%%		{_, ListID, List2} when IsRecursion =:= true ->
%%			playerState2:setFriend2OnlineListRoleID(List2),
%%			ListID; %% 没有得到足够的数据，但根据传参直接返回结果
%%		_ ->
%%			%% 没有得到足够的数据，重置随机列表后强制返回结果
%%			%% 强制返回结果是防止在线人数始终不足造成的数据始终不足
%%			%% 在线人数不足时频繁重置也不会造成什么消耗
%%			recommend_reset(IsNear),
%%			recommend_get(PA, true)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg:推荐好友（重置随机列表）
%%-spec recommend_reset(IsNear::boolean()) -> no_return().
%%recommend_reset(true) ->
%%	playerState2:setFriend2OnlineListRoleIDNear([]);	%% fixme 由于lbs系统改动，这里需要调整
%%	%#mainMenuCfg{parameters = LevelMin, type = 1} =	%% #mainMenuCfg.type必须为1表示等级
%%	%	getCfg:getCfgPStack(cfg_mainMenu, ?ModeType_Social),
%%	%RoleIDMine = playerState:getRoleID(),
%%	%FunCreate =
%%	%	fun(#rec_OnlinePlayer{roleID = RoleID}, Result) ->
%%	%		case core:queryBaseRoleByRoleID(RoleID) of
%%	%			#rec_base_role{level = Level} when Level >= LevelMin, RoleIDMine =/= RoleID ->
%%	%				Distance = friend2LBSOtp:queryDistance(RoleIDMine, RoleID),
%%	%				case Distance < 120.0 of  %% 此处限制就达到120千米的数据参与计算，具体数据需要策划进行配置 friend2LBSOtp ?DistanceMax
%%	%					true ->
%%	%						[{Distance, RoleID} | Result];
%%	%					_ ->
%%	%						Result
%%	%				end;
%%	%			_ ->
%%	%				Result  %% 等级不足、是自己、数据延时
%%	%		end
%%	%	end,
%%	%List = ets:foldl(FunCreate, [], ets_rec_OnlinePlayer),
%%	%playerState2:setFriend2OnlineListRoleIDNear(lists:keysort(1, List)),
%%	%ok;
%%recommend_reset(false) ->
%%	#mainMenuCfg{parameters = LevelMin, type = 1} =	%% #mainMenuCfg.type必须为1表示等级
%%		getCfg:getCfgPStack(cfg_mainMenu, ?ModeType_Social),
%%	Count = ets:info(ets_rec_OnlinePlayer, size),
%%	RoleIDMine = playerState:getRoleID(),
%%	FunCreate =
%%		fun(#rec_OnlinePlayer{roleID = RoleID}, Result) ->
%%			case core:queryBaseRoleByRoleID(RoleID) of
%%				#rec_base_role{level = Level} when Level >= LevelMin, RoleIDMine =/= RoleID ->
%%					[{misc:rand(1, Count), RoleID} | Result];
%%				_ ->
%%					Result  %% 等级不足、是自己、数据延时
%%			end
%%		end,
%%	List = ets:foldl(FunCreate, [], ets_rec_OnlinePlayer),
%%	playerState2:setFriend2OnlineListRoleID(lists:keysort(1, List)).
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg:推荐好友（获得筛选的角色ID） 递归
%%-spec recommend_getR(
%%	{CountGet::uint(), ListID::[uint64(), ...], ListSrc::[{term(), uint64()}, ...]},
%%	{FriendDataMine::#recFriend2Data{}, CountMax::uint(), Sex::uint8()}
%%) ->
%%	{uint(), [uint64(), ...], [{term(), uint64()}, ...]}.
%%recommend_getR({CountGet, ListID, ListSrc}, {_, CountMax, _}) when CountGet >= CountMax ->
%%	{CountGet, ListID, ListSrc};	%% 获取量达到满足条件，成功返回
%%recommend_getR({CountGet, ListID, []}, _) ->
%%	{CountGet, ListID, []};			%% 数据源不足，返回，外部判断是否可用
%%recommend_getR({CountGet, ListID, [{_, TargetRoleID} | ListSrcTail]}, {Friend2DataMine, CountMax, Sex}) ->
%%	%% 缓存列表时的在线者可能此时不在线，需要再次验证在线状态
%%	TargetRoleIDValid1 =
%%		case core:queryOnLineRoleByRoleID(TargetRoleID) of
%%			#rec_OnlinePlayer{} ->
%%				%% 需要验证双方关系
%%				#recFriend2Data{roleID = RoleID} = Friend2DataMine,
%%				case cgsFriendState:queryRelation(Friend2DataMine, RoleID, TargetRoleID) of
%%					#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
%%						0;  %% 已经是正式好友
%%					#rec_friend2_relation{relation = ?RELATION_BLACK} ->
%%						0;  %% 对方已被自己拉黑
%%					_ ->
%%						case cgsFriendState:queryRelation(TargetRoleID, RoleID) of
%%							#rec_friend2_relation{relation = ?RELATION_BLACK} ->
%%								0;  %% 自己已被对方拉黑
%%							_ ->
%%								TargetRoleID  %% 有效的参选者
%%						end
%%				end;
%%			_ ->
%%				0   %% 对方不在线
%%		end,
%%	%% 根据性别要求进行筛选（0男，1女，否则不限制）
%%	TargetRoleIDValid2 =
%%		case TargetRoleIDValid1 > 0 of
%%			true ->
%%				case Sex > 1 of
%%					true ->
%%						TargetRoleIDValid1; %% 无性别限制，直接通过
%%					_ ->
%%						case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
%%							#?RoleKeyRec{sex = Sex} ->
%%								TargetRoleIDValid1; %% 性别符合，通过
%%							_ ->
%%								0 %% 性别不符，不通过
%%						end
%%				end;
%%			_ ->
%%				0 %% 上一次筛选未通过，不进行性别筛选
%%		end,
%%	%% 根据筛选结果决定返回值
%%	case TargetRoleIDValid2 > 0 of
%%		true ->
%%			recommend_getR({CountGet + 1, [TargetRoleIDValid2 | ListID], ListSrcTail}, {Friend2DataMine, CountMax, Sex});
%%		_ ->
%%			recommend_getR({CountGet, ListID, ListSrcTail}, {Friend2DataMine, CountMax, Sex})
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:申请添加好友（兼容跨服好友）
%%-spec add(TargetRoleID::uint64()) -> no_return().
%%add(TargetRoleID) ->
%%	case playerMainMenu:isOpen(?ModeType_Social) of
%%		true ->
%%			%% 客户端加好友和加跨服好友都是一个按钮，因此这里做个分支判断，如果是跨服关系则走跨服逻辑
%%			RoleID = playerState:getRoleID(),
%%			case cgsFriendInterface:queryFRT(RoleID, TargetRoleID) of
%%				?FRT_NoneC ->
%%					add_cross(TargetRoleID);
%%				?FRT_CApply ->
%%					add_cross(TargetRoleID);
%%				?FRT_Cross ->
%%					?ERROR_CODE(?ErrorCode_Friend2CrossAdd_AlreadyIs);
%%				?FRT_Self ->
%%					skip;
%%				_ ->
%%					case core:isCross() of
%%						true ->
%%							setCrossAddFriend(TargetRoleID);%% 设定本地回调数据
%%						_ ->
%%							add_local(RoleID, TargetRoleID)
%%					end
%%			end;
%%		_ ->
%%			skip	%% 功能未开放
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal,msg:申请添加本地好友
%%-spec add_local(uint64(), uint64()) -> no_return().
%%add_local(RoleID, RoleID) ->
%%	skip;
%%add_local(RoleID, TargetRoleID) ->
%%	%% 如果对象玩家是自己的申请者，则忽略冷却时间限制
%%	IsContinue =
%%		case cgsFriendState:queryInteraction(RoleID, TargetRoleID) of
%%			#rec_friend2_interaction{timeBeApply = TimeBeApply} when TimeBeApply > 0 ->
%%				true;
%%			_ ->
%%				false
%%		end,
%%	case playerState2:getFriend2CD(TargetRoleID) of
%%		Minute when IsContinue =:= false, Minute =/= true ->
%%			?ERROR_CODE(?ErrorCode_Friend2Add_NotCoolDown, [Minute]);
%%		_ ->
%%			OP = {?RELATION_FORMAL, RoleID, TargetRoleID},
%%			case cgsFriendInterface:check(OP) of
%%				{?CONTINUE_NONE, {0, _}} ->
%%					playerState2:setFriend2CD(TargetRoleID),
%%					skip;
%%				{?CONTINUE_NONE, {ErrorCode, Args}} ->
%%					playerState2:setFriend2CD(TargetRoleID),
%%					?ERROR_CODE(ErrorCode, Args);
%%				{?CONTINUE_AddFromBlackAsk, _} ->
%%					relationAck({?CONTINUE_AddFromBlackAsk, TargetRoleID});
%%				{?CONTINUE_AddDo, _} ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP);
%%				{?CONTINUE_AddApply, _} ->
%%					addTemp(TargetRoleID),  %% 申请成为好友时自动结为临时好友关系
%%					playerState2:setFriend2CD(TargetRoleID),
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP);
%%				Ret ->
%%					% 若添加的人已经被删或者中途修改了好友添加的配置就会返回下面这个
%%					% {?ErrorCode_Friend2Level, [LevelMin]}
%%					% 匹配一下  防止报错
%%					?ERROR("add_local friend error: ~p ~n", [Ret]),
%%					skip
%%			end
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:从黑名单中添加好友（跨服上不可用）
%%-spec addFromBlack(TargetRoleID::uint64()) -> no_return().
%%addFromBlack(TargetRoleID) ->
%%	case apiCheck(false, true, TargetRoleID) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			OP = {?RELATION_FORMAL, RoleID, TargetRoleID},
%%			case cgsFriendInterface:check(OP) of
%%				{?CONTINUE_NONE, {0, _}} ->
%%					skip;
%%				{?CONTINUE_NONE, {ErrorCode, Args}} ->
%%					?ERROR_CODE(ErrorCode, Args);
%%				{?CONTINUE_AddFromBlackAsk, _} ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation2, {?CONTINUE_AddApplyFromBlack, {RoleID, TargetRoleID}});
%%				{?CONTINUE_AddDo, _} ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP);
%%				{?CONTINUE_AddApply, _} ->
%%					addTemp(TargetRoleID),  %% 申请成为好友时自动结为临时好友关系
%%					playerState2:setFriend2CD({friend2_add_cd, TargetRoleID}),
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP)
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:拒绝本地好友申请（跨服上不可用）
%%-spec refuse(TargetRoleID::uint64()) -> no_return().
%%refuse(TargetRoleID) ->
%%	case apiCheck(false, true, TargetRoleID) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			OP = {?RELATION_NONE, RoleID, TargetRoleID, 0},
%%			case cgsFriendInterface:check(OP) of
%%				{?CONTINUE_NONE, {0, _}} ->
%%					skip;
%%				{?CONTINUE_NONE, {ErrorCode, Args}} ->
%%					?ERROR_CODE(ErrorCode, Args);
%%				{?CONTINUE_DelApply, _} ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP);
%%				_ ->
%%					%% 已经不是申请者，同步一下当前页申请者信息
%%					doQueryList(?FRT_Apply, playerState2:getFriend2PageApp())
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:一键处理本地好友申请（跨服上不可用）
%%-spec applyOneKey(IsAgreed::boolean()) -> no_return().
%%applyOneKey(IsAgreed) ->
%%	case apiCheck(false, true, 0) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_applyOneKey, {RoleID, IsAgreed});
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:删除好友
%%-spec del(TargetRoleID::uint64()) -> no_return().
%%del(TargetRoleID) ->
%%	case apiCheck(false, true, TargetRoleID) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			OP = {?RELATION_NONE, RoleID, TargetRoleID},
%%			case cgsFriendInterface:check(OP) of
%%				{?CONTINUE_NONE, {0, _}} ->
%%					skip;
%%				{?CONTINUE_NONE, {ErrorCode, Args}} ->
%%					?ERROR_CODE(ErrorCode, Args);
%%				{?CONTINUE_DelFormal, _} ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP);
%%				_ ->
%%					%% 已经不是好友，同步一下当前页好友信息
%%					doQueryList(?FRT_Formal, playerState2:getFriend2PageApp())
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:拉黑（跨服上不可用）
%%-spec ban(TargetRoleID::uint64(), IsFriend::boolean()) -> no_return().
%%ban(TargetRoleID, IsFriend) ->
%%	case apiCheck(false, true, TargetRoleID) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			case RoleID of
%%				TargetRoleID ->
%%					skip; %% 忽略自己加自己
%%				_ ->
%%					OP = {?RELATION_BLACK, RoleID, TargetRoleID},
%%					case cgsFriendInterface:check(OP) of
%%						{?CONTINUE_NONE, {0, _}} ->
%%							skip;
%%						{?CONTINUE_NONE, {ErrorCode, Args}} ->
%%							?ERROR_CODE(ErrorCode, Args);
%%						{?CONTINUE_BanFromFormal, _} ->
%%							%% 由于验证的先后顺序问题，这里需要再次验证自己的黑名单数量是否已达上限
%%							L = cgsFriendInterface:queryList(RoleID, ?FRT_Black),
%%							#globalsetupCfg{setpara = [CountBlackMax]} =
%%								getCfg:getCfgPStack(cfg_globalsetup, friend2_black_count),
%%							case erlang:length(L) >= CountBlackMax of
%%								true ->
%%									%% 黑名单满的情况下，试图拉黑好友
%%									relationAck({?CONTINUE_BanWithUnBanAndDel, TargetRoleID});
%%								_ ->
%%									case IsFriend of
%%										true ->
%%											%% 已确认对方是好友，执行删除
%%											psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation2, {?CONTINUE_BanFromFormalDo, {RoleID, TargetRoleID}});
%%										_ ->
%%											%% 不知道对方是否是好友，需要确认
%%											relationAck({?CONTINUE_BanFromFormal, TargetRoleID})
%%									end
%%							end;
%%						{?CONTINUE_BanWithUnBan, _} ->
%%							relationAck({?CONTINUE_BanWithUnBan, TargetRoleID});
%%						{?CONTINUE_Ban, _} ->
%%							psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP)
%%					end
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:移除黑名单A，然后拉黑B（跨服上不可用）
%%-spec banWithUnban(TargetRoleID_A::uint64(), TargetRoleID_B::uint64()) -> no_return().
%%banWithUnban(TargetRoleID_A, TargetRoleID_B) ->
%%	case apiCheck(false, true, TargetRoleID_A) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			case RoleID of
%%				TargetRoleID_B ->
%%					skip; %% 忽略自己操作自己，A已在apiCheck/3中验证
%%				_ when TargetRoleID_A =:= TargetRoleID_B ->
%%					skip; %% 忽略解除对象与拉黑对象相同的情况
%%				_ ->
%%					OP1 = {?RELATION_NONE, RoleID, TargetRoleID_A},
%%					case cgsFriendInterface:check(OP1) of
%%						{?CONTINUE_DelBlack, _} ->
%%							%% 验证B是否是好友
%%							case cgsFriendState:queryRelation(RoleID, TargetRoleID_B) of
%%								#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
%%									%% B是好友，移除A的黑名单再走走另外的流程
%%									psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP1),
%%									relationAck({?CONTINUE_BanFromFormal, TargetRoleID_B});
%%								_ ->
%%									psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation2, {?CONTINUE_DelBlackAndBan, {RoleID, TargetRoleID_A, TargetRoleID_B}})
%%							end;
%%						_ ->
%%							%% A已经不是黑名单用户，直接拉黑B
%%							OP2 = {?RELATION_BLACK, RoleID, TargetRoleID_B},
%%							case cgsFriendInterface:check(OP2) of
%%								{?CONTINUE_NONE, {0, _}} ->
%%									skip;
%%								{?CONTINUE_NONE, {ErrorCode, Args}} ->
%%									?ERROR_CODE(ErrorCode, Args);
%%								{?CONTINUE_BanFromFormal, _} ->
%%									%% B是好友，需要走另外的流程
%%									relationAck({?CONTINUE_BanFromFormal, TargetRoleID_B});
%%								{?CONTINUE_BanWithUnBan, _} ->
%%									%% 黑名单依然很满，继续走流程
%%									relationAck({?CONTINUE_BanWithUnBan, TargetRoleID_B});
%%								{?CONTINUE_Ban, _} ->
%%									psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP2)
%%							end
%%					end
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:黑名单满时拉黑好友（跨服上不可用）
%%-spec banWithUnbanAndDel(IDUnban::uint64(), IDDel::uint64()) -> no_return().
%%banWithUnbanAndDel(IDUnban, IDDel) ->
%%	case apiCheck(false, true, IDUnban) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			case RoleID of
%%				IDUnban ->
%%					skip; %% 忽略自己操作自己，IDUnban已在apiCheck/3中验证
%%				_ when IDUnban =:= IDDel ->
%%					skip; %% 忽略操作对象一致
%%				_ ->
%%					%% 解除好友关系和解除黑名单关系这两个动作可以同时进行
%%					del(IDDel),
%%					unban(IDUnban),
%%					%% 缓存希望拉黑的好友，等待解除好友关系后再拉黑
%%					List = playerState2:getFriend2WantBanFormal(),
%%					ListNew = lists:keystore(IDDel, 1, List, {IDDel}),
%%					playerState2:setFriend2WantBanFormal(ListNew)
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:移除黑名单（跨服上不可用）
%%-spec unban(TargetRoleID::uint64()) -> no_return().
%%unban(TargetRoleID) ->
%%	case apiCheck(false, true, TargetRoleID) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			OP = {?RELATION_NONE, RoleID, TargetRoleID},
%%			case cgsFriendInterface:check(OP) of
%%				{?CONTINUE_DelBlack, _} ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP);
%%				_ ->
%%					%% 已经不是黑名单用户，同步一下当前页黑名单信息
%%					doQueryList(?FRT_Black, playerState2:getFriend2PageBlack())
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:伪周边功能，有些和好友其实没啥关系（跨服上不可用）
%%-spec formalOP(TargetRoleID::uint64(), EXOP::type_exop()) -> no_return().
%%formalOP(TargetRoleID, EXOP) ->
%%	case apiCheck(false, true, TargetRoleID) of
%%		true ->
%%			doFormalOP(TargetRoleID, EXOP);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal,msg:伪周边功能
%%-spec doFormalOP(TargetRoleID::uint64(), EXOP::type_exop()) -> no_return().
%%doFormalOP(TargetRoleID, ?EXOP_Like) ->
%%	RoleID = playerState:getRoleID(),
%%	LikeToday = playerDaily:getDailyCounter(?DailyType_Friend2_Like, 0),
%%	#globalsetupCfg{setpara = [LikeMax]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_formal_like_count),
%%	case LikeToday < LikeMax of
%%		true ->
%%			case daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2Like) of
%%				0 ->
%%					playerDaily:incDailyCounter(?DailyType_Friend2_Like, 0),
%%					daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_S_Friend2Like, 1}),
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_formalOP, {?EXOP_Like, RoleID, TargetRoleID});
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_Friend2Formal_LikeSame, [playerNameUID:getPlayerNameByUID(TargetRoleID)])
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_Friend2Formal_LikeMax, [LikeMax])
%%	end;
%%doFormalOP(TargetRoleID, ?EXOP_GiveAP) ->
%%	RoleID = playerState:getRoleID(),
%%	APToday = playerDaily:getDailyCounter(?DailyType_Friend2_Action_Point_Give, 0),
%%	#globalsetupCfg{setpara = [APMax]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_formal_give_ap_count),
%%	case APToday < APMax of
%%		true ->
%%			case daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GiveAP) of
%%				0 ->
%%					case cgsFriendState:queryRelation(RoleID, TargetRoleID) of
%%						#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
%%							playerDaily:incDailyCounter(?DailyType_Friend2_Action_Point_Give, 0),
%%							daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_S_Friend2GiveAP, 1}),
%%							psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_formalOP, {?EXOP_GiveAP, RoleID, TargetRoleID}),
%%
%%							playerAchieve:achieveEvent(?Achieve_formalOP,[1]),
%%							playerliveness:onFinishLiveness(?LivenessFriendActionPoint, 1);
%%						_ ->
%%							?ERROR_CODE(?ErrorCode_Friend2NeedFormal, [])
%%					end;
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_Friend2Formal_GiveAPSame, [playerNameUID:getPlayerNameByUID(TargetRoleID)])
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_Friend2Formal_GiveAPMax, [APMax])
%%	end;
%%doFormalOP(TargetRoleID, ?EXOP_GainAP) ->
%%	RoleID = playerState:getRoleID(),
%%	APToday = playerDaily:getDailyCounter(?DailyType_Friend2_Action_Point_Gain, 0),
%%	#globalsetupCfg{setpara = [APMax]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_formal_gain_ap_count),
%%	case APToday < APMax of
%%		true ->
%%			case daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GiveAP) of
%%				0 ->
%%					skip;
%%				_ ->
%%					case daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GainAP) of
%%						0 ->
%%							case cgsFriendState:queryRelation(RoleID, TargetRoleID) of
%%								#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
%%									#globalsetupCfg{setpara = [APMaxMax]} =
%%										getCfg:getCfgPStack(cfg_globalsetup, player_action_point_max),
%%									#globalsetupCfg{setpara = [APEveryGain]} =
%%										getCfg:getCfgPStack(cfg_globalsetup, friend2_formal_gain_ap_value),
%%									APOld = playerActionPoint:getActionPoint(),
%%									case APOld + APEveryGain > APMaxMax of
%%										true ->
%%											?ERROR_CODE(?ErrorCode_Friend2AP_Max, []);
%%										_ ->
%%											playerActionPoint:addActionPoint(APEveryGain),
%%											playerDaily:incDailyCounter(?DailyType_Friend2_Action_Point_Gain, 0),
%%											daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_S_Friend2GainAP, 1}),
%%											psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_formalOP, {?EXOP_GainAP, RoleID, TargetRoleID})
%%									end;
%%								_ ->
%%									?ERROR_CODE(?ErrorCode_Friend2NeedFormal, [])
%%							end;
%%						_ ->
%%							?ERROR_CODE(?ErrorCode_Friend2Formal_GainAPSame, [playerNameUID:getPlayerNameByUID(TargetRoleID)])
%%					end
%%			end;
%%		_ ->
%%			?ERROR_CODE(?ErrorCode_Friend2Formal_GainAPMax, [APMax])
%%	end;
%%doFormalOP(TargetRoleID, ?EXOP_Transmit) ->
%%	%% 1.战斗和死亡状态不让传送
%%	ActStatus = playerState:getActionStatus(),
%%	case ActStatus =:= ?CreatureActionStatusDead orelse playerState:isPlayerBattleStatus() of
%%		true ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailedPlayerDeadOrBattle);
%%		_ ->
%%			%% 2.正在切换地图中不能传送
%%			case ActStatus =/= ?CreatureActionStatusChangeMap of
%%				true ->
%%					%%% 3.vip等级不足不能传送
%%					#globalsetupCfg{setpara = [_VipLvLimit, TransmitCD]} =
%%						getCfg:getCfgPStackWithDefaultValue(
%%							cfg_globalsetup,
%%							#globalsetupCfg{setpara = [1, 15]},
%%							friend2_Transmit
%%						),
%%					TimeNow = time:getSyncUTCTimeFromDBS(),
%%					LeftTime = TransmitCD - (TimeNow - playerState:getVipLastTransmit()),
%%					case LeftTime =< 0 of
%%						true ->
%%							playerMap:tryGetFriendPos(TargetRoleID);
%%						_ ->
%%							playerMsg:sendErrorCodeMsg(?ErrorCode_VipTranmitCD, [LeftTime])
%%					end;
%%				_ ->
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
%%			end
%%	end,
%%	ok.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:用于客户端显示(兼容跨服）
%%-spec forLook(TargetRoleID::uint64()) -> no_return().
%%forLook(TargetRoleID) ->
%%	RoleID = playerState:getRoleID(),
%%	case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
%%		#?RoleKeyRec{
%%			like = Like,
%%			charm = Charm,
%%			roleName = Name,
%%			level = Level
%%		} ->
%%			FRT = cgsFriendInterface:queryFRT(RoleID, TargetRoleID),
%%			IsGiveLike = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2Like) > 0,
%%			playerMsg:sendNetMsg(
%%				#pk_GS2U_Friend2ForLook_Ack{
%%					id = TargetRoleID,
%%					name = Name,
%%					relation = FRT,
%%					like = Like,
%%					isGiveLike = IsGiveLike,
%%					level = Level,
%%					charm = Charm
%%				}
%%			);
%%		_ ->
%%			gsCsInterface:transitMsg2CenterOtp(?PsNameCSFriend, forLook, {playerState:getNetPid(), RoleID, TargetRoleID})
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:用于客户端显示(兼容跨服）
%%-spec wantChat(TargetRoleID::uint64()) -> no_return().
%%wantChat(TargetRoleID) ->
%%	RoleID = playerState:getRoleID(),
%%	FRT = cgsFriendInterface:queryFRT(RoleID, TargetRoleID),
%%	case core:isCross() of
%%		true ->
%%			playerMsg:sendNetMsg(
%%				#pk_GS2U_Friend2WantChat_Ack{
%%					id = TargetRoleID,
%%					info = createInfoBase(TargetRoleID),
%%					relation = FRT,
%%					count = 0,
%%					hasAP = false,
%%					page = 0,
%%					listInfo = []
%%				}
%%			);
%%		_ ->
%%			{{Page, List}, Length} = wantChat(RoleID, TargetRoleID, FRT),
%%			playerMsg:sendNetMsg(
%%				#pk_GS2U_Friend2WantChat_Ack{
%%					id = TargetRoleID,
%%					info = createInfoBase(TargetRoleID),
%%					relation = FRT,
%%					count = Length,
%%					hasAP = cgsFriendState:queryUnGainAP(RoleID),
%%					page = Page,
%%					listInfo = [createInfoFormal(ID) || ID <- List]
%%				}
%%			)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:用于客户端显示(兼容跨服）_根据不同关系获取数据
%%-spec wantChat(RoleID::uint64(), TargetRoleID::uint64(), FRT::type_frt()) -> {{Page::uint8(), List::[uint64(), ...]}, Length::uint()}.
%%wantChat(RoleID, TargetRoleID, ?FRT_Formal = FRT) ->
%%	#globalsetupCfg{setpara = [CountPage]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_formal_page_count),
%%	List = cgsFriendInterface:queryListSort(RoleID, FRT),
%%	Ret = {{Page, _}, _} = {getListByRoleID(TargetRoleID, CountPage, List), erlang:length(List)},
%%	playerState2:setFriend2PageFormal(Page),
%%	Ret;
%%wantChat(RoleID, TargetRoleID, ?FRT_Temp = FRT) ->
%%	#globalsetupCfg{setpara = [CountPage]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_temp_page_count),
%%	List = cgsFriendInterface:queryListSort(RoleID, FRT),
%%	Ret = {{Page, _}, _} = {getListByRoleID(TargetRoleID, CountPage, List), erlang:length(List)},
%%	playerState2:setFriend2PageTemp(Page),
%%	Ret;
%%wantChat(RoleID, TargetRoleID, ?FRT_Black = FRT) ->
%%	#globalsetupCfg{setpara = [CountPage]} =
%%		getCfg:getCfgPStack(cfg_globalsetup, friend2_black_page_count),
%%	List = cgsFriendInterface:queryListSort(RoleID, FRT),
%%	Ret = {{Page, _}, _} = {getListByRoleID(TargetRoleID, CountPage, List), erlang:length(List)},
%%	playerState2:setFriend2PageBlack(Page),
%%	Ret;
%%wantChat(RoleID, TargetRoleID, _FRT) ->
%%	wantChat(RoleID, TargetRoleID, ?FRT_Temp).
%%
%%%%%-------------------------------------------------------------------
%%% internal,msg:用于客户端显示(兼容跨服）_根据不同关系获取数据_获取目标所在的页码及数据
%%-spec getListByRoleID(TargetRoleID::uint64(), CountPage::uint8(), ListIn::[uint64(), ...]) -> {Page::uint8(), ListOut::list()}.
%%getListByRoleID(TargetRoleID, CountPage, ListIn) ->
%%	getListByRoleID(TargetRoleID, CountPage, ListIn, 0).
%%getListByRoleID(TargetRoleID, CountPage, ListIn, Page) ->
%%	case erlang:length(ListIn) > CountPage of
%%		true ->
%%			{ListA, ListB} = lists:split(CountPage, ListIn),
%%			case lists:member(TargetRoleID, ListA) of
%%				true ->
%%					{Page, ListA};
%%				_ ->
%%					getListByRoleID(TargetRoleID, CountPage, ListB, Page + 1)
%%			end;
%%		_ ->
%%			case lists:member(TargetRoleID, ListIn) of
%%				true ->
%%					{Page, ListIn};
%%				_ ->
%%					{0, []}
%%			end
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% api,msg:好友聊天，含语音（跨服上部分兼容，因为跨服上界面不对）
%%-spec chat(term()) -> ok.
%%chat(
%%	#pk_U2GS_Friend2FormalChat_Request{
%%		receiverID = ID,
%%		content = Content,
%%		time = Time
%%	} = Rec
%%) ->
%%	case apiCheck(false, true, ID) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			FRT = cgsFriendInterface:queryFRT(ID, RoleID),
%%			Msg = #pk_GS2U_Friend2FormalChat_Ack{
%%				senderID = RoleID,
%%				receiverID = ID,
%%				time = Time,
%%				content = Content,
%%				relation = FRT
%%			},
%%			playerMsg:sendNetMsg(Msg),		%% 反馈自己发送成功
%%			case FRT of
%%				?FRT_Cross ->
%%					chat_text_cross(Msg);	%% 跨服处理
%%				?FRT_Black ->
%%					skip;
%%				?FRT_CApply ->
%%					skip;
%%				?FRT_NoneC ->
%%					skip;
%%				_ ->
%%					chat_text_local(ID, Content, FRT, RoleID, Msg, Rec)
%%			end;
%%		_ ->
%%			skip
%%	end;
%%chat(
%%	#pk_U2GS_Friend2FormalChatVoice_Request{
%%		receiverID = ID,
%%		time = Time,
%%		duration = Duration,
%%		count = Count,
%%		index = Index
%%	} = Rec
%%) when Duration =< 12.0 ->	%% 抛弃大于12秒的数据
%%	case apiCheck(false, true, ID) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			FRT = cgsFriendInterface:queryFRT(ID, RoleID),
%%			case FRT of
%%				?FRT_Black ->
%%					case Index =:= Count of
%%						true ->
%%							playerMsg:sendNetMsg(
%%								#pk_GS2U_Friend2FormalChatVoice_AckS{
%%									senderID = playerState:getRoleID(),
%%									receiverID = ID,
%%									time = Time
%%								}
%%							);
%%						_ ->
%%							skip
%%					end;
%%				_ ->
%%					case Index of
%%						1 ->
%%							%% 索引为1时视为新的消息直接覆盖
%%							playerState2:setFriend2VoiceCache([Rec]);
%%						_ ->
%%							%% 索引不为1时需要与缓存的消息头部时间戳匹配，索引紧邻
%%							ListCache = playerState2:getFriend2VoiceCache(),
%%							IndexLast = Index - 1,
%%							case ListCache of
%%								[#pk_U2GS_Friend2FormalChatVoice_Request{time = Time, index = IndexLast}|_] ->
%%									playerState2:setFriend2VoiceCache([Rec | ListCache]);
%%								_ ->
%%									skip
%%							end
%%					end,
%%					%% 缓存了完整了语音消息时尝试发送等后续操作
%%					case playerState2:getFriend2VoiceCache() of
%%						[#pk_U2GS_Friend2FormalChatVoice_Request{index = Same, count = Same}|_] = ListCacheAll ->
%%							case FRT of
%%								?FRT_Cross ->
%%									chat_voice_cross(RoleID, ID, ListCacheAll, Time);
%%								%%?FRT_Black -> 已于上文处理
%%								%%	skip;
%%								?FRT_CApply ->
%%									skip;
%%								?FRT_NoneC ->
%%									skip;
%%								_ ->
%%									chat_voice_local(ID, FRT, RoleID, ListCacheAll, Time)
%%							end,
%%							playerState2:setFriend2VoiceCache([]);
%%						_ ->
%%							skip
%%					end
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg:本地好友聊天（文本）
%%chat_text_local(ID, Content, FRT, RoleID, Msg, Rec) ->
%%	%% 保存聊天记录
%%	playerChat:sendLogChatInfo(
%%		#pk_U2GS_ChatInfo{
%%			receiverID  = ID,
%%			content     = Content,
%%			channel     = ?CHAT_CHANNEL_PRIVATE
%%		}
%%	),
%%	%% 聊天特别处理，将相关列表页码重置，以便目标用户排序调整后能显示在开头
%%	case FRT of
%%		?FRT_Temp ->
%%			playerState2:setFriend2PageTemp(0);
%%		?FRT_Formal ->
%%			playerState2:setFriend2PageFormal(0);
%%		_ ->
%%			skip
%%	end,
%%	addTemp(ID),  %% 尝试加对方为临时好友
%%	case core:queryOnLineRoleByRoleID(ID) of
%%		#rec_OnlinePlayer{netPid = NetPid} ->
%%			%% 每日第一次与在线好友聊天增加1点亲密度
%%			closenessAdd(?ClosenessAddType_Chat, RoleID, ID, 1),
%%			playerMsg:sendNetMsg(NetPid, Msg);
%%		_ ->
%%			psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_offlineMsg, {RoleID, ID, [Rec]})
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg:跨服好友聊天（文本）
%%chat_text_cross(
%%	#pk_GS2U_Friend2FormalChat_Ack{
%%		content = Content,
%%		senderID = RoleID,
%%		receiverID = TarRoleID
%%	} = Msg
%%) ->
%%	playerChat:sendLogChatInfo(
%%		#pk_U2GS_ChatInfo{
%%			receiverID  = TarRoleID,
%%			content     = Content,
%%			channel     = ?CHAT_CHANNEL_PRIVATE
%%		}
%%	),
%%	case friendCommon:queryFriend2CrossF(RoleID, TarRoleID) of
%%		{?FRT_Cross, #recFriend2Cross{netPid = NetPid}} when erlang:is_pid(NetPid) ->
%%			playerMsg:sendNetMsg(NetPid, Msg);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg:本地好友聊天（语音）
%%chat_voice_local(ID, FRT, RoleID, ListCacheAll, Time) ->
%%	%% 聊天特别处理，将相关列表页码重置，以便目标用户排序调整后能显示在开头
%%	case FRT of
%%		?FRT_Temp ->
%%			playerState2:setFriend2PageTemp(0);
%%		?FRT_Formal ->
%%			playerState2:setFriend2PageFormal(0);
%%		_ ->
%%			skip
%%	end,
%%	addTemp(ID),  %% 尝试加对方为临时好友
%%	case core:queryOnLineRoleByRoleID(ID) of
%%		#rec_OnlinePlayer{netPid = NetPid} ->
%%			FunSend =
%%				fun(#pk_U2GS_Friend2FormalChatVoice_Request{
%%					receiverID = ID_,
%%					time = Time_,
%%					duration = Duration_,
%%					count = Count_,
%%					index = Index_,
%%					data = Data_
%%				}) ->
%%					Msg =
%%						#pk_GS2U_Friend2FormalChatVoice_AckR{
%%							senderID = playerState:getRoleID(),
%%							receiverID = ID_,
%%							duration = Duration_,
%%							time = Time_,
%%							count = Count_,
%%							index = Index_,
%%							data = Data_,
%%							relation = FRT
%%						},
%%					playerMsg:sendNetMsg(NetPid, Msg)
%%				end,
%%			%% 每日第一次与在线好友聊天增加1点亲密度
%%			closenessAdd(?ClosenessAddType_Chat, RoleID, ID, 1),
%%			lists:foreach(FunSend, lists:reverse(ListCacheAll));
%%		_ ->
%%			psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_offlineMsg, {RoleID, ID, ListCacheAll})
%%	end,
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_Friend2FormalChatVoice_AckS{
%%			senderID = playerState:getRoleID(),
%%			receiverID = ID,
%%			time = Time
%%		}
%%	).
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg:跨服好友聊天（语音）
%%chat_voice_cross(RoleID, TarRoleID, ListCacheAll, Time) ->
%%	ListCacheAllR = lists:reverse(ListCacheAll),
%%	Msg = [
%%		#pk_GS2U_Friend2FormalChatVoice_AckR{
%%			senderID = RoleID,
%%			receiverID = TarRoleID,
%%			duration = Duration_,
%%			time = Time_,
%%			count = Count_,
%%			index = Index_,
%%			data = Data_,
%%			relation = ?FRT_Cross
%%		} ||
%%		#pk_U2GS_Friend2FormalChatVoice_Request{
%%			time = Time_,
%%			duration = Duration_,
%%			count = Count_,
%%			index = Index_,
%%			data = Data_
%%		} <- ListCacheAllR
%%	],
%%	case friendCommon:queryFriend2CrossF(RoleID, TarRoleID) of
%%		{?FRT_Cross, #recFriend2Cross{netPid = NetPid}} when erlang:is_pid(NetPid) ->
%%			[playerMsg:sendNetMsg(NetPid, MsgCell) || MsgCell <- Msg];
%%		_ ->
%%			skip
%%	end,
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_Friend2FormalChatVoice_AckS{
%%			senderID = playerState:getRoleID(),
%%			receiverID = TarRoleID,
%%			time = Time
%%		}
%%	).
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:请求添加跨服好友
%%-spec add_cross(TarRoleID::uint64()) -> no_return().
%%add_cross(TarRoleID) ->
%%	%% 这里是A的角色进程
%%	%% A：RoleID；B：TarRoleID
%%	%% A将申请成为B的申请者
%%	RoleID = playerState:getRoleID(),
%%	case cgsFriendInterface:queryFRT(RoleID, TarRoleID) of
%%		?FRT_NoneC ->
%%			case playerState2:getFriend2CDCross(TarRoleID) of
%%				true ->
%%					playerState2:setFriend2CDCross(TarRoleID),
%%					?DEBUG("[DebugForFriendCross] apply step1 ~w ~w", [RoleID, TarRoleID]),
%%					gsCsInterface:transitMsg2CenterOtp(?PsNameCSFriend, friend2Cross_1_add, {RoleID, TarRoleID});
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_Friend2CrossAdd_Wait)
%%			end;
%%		?FRT_CApply ->
%%			%% B已经是A的申请者，此时申请如同同意
%%			add_cross2(TarRoleID, true);
%%		?FRT_Cross ->
%%			?ERROR_CODE(?ErrorCode_Friend2CrossAdd_AlreadyIs);
%%		_T ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:同意或拒绝跨服申请者
%%-spec add_cross2(TarRoleID::uint64(), IsAgreed::boolean()) -> no_return().
%%% 一键同意
%%add_cross2(0, true) ->
%%	RoleID = playerState:getRoleID(),
%%	case cgsFriendInterface:queryList(RoleID, ?FRT_CApply) of
%%		[] ->
%%			skip;	%% 没有申请者，忽略
%%		L ->
%%			[add_cross2(C, true) || C <- L]
%%	end;
%%% 一键拒绝
%%add_cross2(0, false) ->
%%	RoleID = playerState:getRoleID(),
%%	case cgsFriendInterface:queryList(RoleID, ?FRT_CApply) of
%%		[] ->
%%			skip;	%% 没有申请者，忽略
%%		_ ->
%%			?DEBUG("[DebugForFriendCross] cancel step1 ~w ~w", [RoleID, 0]),
%%			gsCsInterface:transitMsg2CenterOtp(?PsNameCSFriend, friend2Cross_1_add2, {RoleID, 0})
%%	end;
%%% 同意或拒绝的参数转换
%%add_cross2(#rec_friend2_cross{tarRoleID = TarRoleID}, IsAgreed) ->
%%	add_cross2(TarRoleID, IsAgreed);
%%add_cross2(#recFriend2Cross{tarRoleID = TarRoleID}, IsAgreed) ->
%%	add_cross2(TarRoleID, IsAgreed);
%%% 同意
%%add_cross2(TarRoleID, true) when erlang:is_integer(TarRoleID) ->
%%	%% 这里是A的角色进程
%%	%% A：RoleID；B：TarRoleID
%%	%% A将同意申请者B成为跨服好友
%%	RoleID = playerState:getRoleID(),
%%	case cgsFriendInterface:queryFRT(RoleID, TarRoleID) of
%%		?FRT_CApply ->
%%			?DEBUG("[DebugForFriendCross] add step1 ~w ~w", [RoleID, TarRoleID]),
%%			gsCsInterface:transitMsg2CenterOtp(?PsNameCSFriend, friend2Cross_1_add2, {RoleID, TarRoleID});
%%		_T ->
%%			skip	%% 对方不是申请者，无法执行同意
%%	end;
%%% 拒绝
%%add_cross2(TarRoleID, false) when erlang:is_integer(TarRoleID) ->
%%	%% 这里是A的角色进程
%%	%% A：RoleID；B：TarRoleID
%%	%% A将拒绝申请者B成为跨服好友
%%	RoleID = playerState:getRoleID(),
%%	case cgsFriendInterface:queryFRT(RoleID, TarRoleID) of
%%		?FRT_CApply ->
%%			?DEBUG("[DebugForFriendCross] cancel step1 ~w ~w", [RoleID, TarRoleID]),
%%			gsCsInterface:transitMsg2CenterOtp(?PsNameCSFriend, friend2Cross_1_add2, {RoleID, TarRoleID, 0});
%%		_T ->
%%			skip	%% 对方不是申请者，无法执行拒绝
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api,msg:请求删除跨服好友
%%-spec del_cross(TarRoleID::uint64()) -> no_return().
%%del_cross(TarRoleID) ->
%%	%% 这里是A的角色进程
%%	%% A：RoleID；B：TarRoleID
%%	%% A将删除跨服好友B
%%	RoleID = playerState:getRoleID(),
%%	case cgsFriendInterface:queryFRT(RoleID, TarRoleID) of
%%		?FRT_Cross ->
%%			?DEBUG("[DebugForFriendCross] delete step1 ~w ~w", [RoleID, TarRoleID]),
%%			gsCsInterface:transitMsg2CenterOtp(?PsNameCSFriend, friend2Cross_1_del, {RoleID, TarRoleID});
%%		_T ->
%%			skip	%% 对方不是好友，无法执行删除
%%	end.
%%
%%-spec ignore_getBack(TarRoleID::uint64()) -> no_return().
%%ignore_getBack(TarRoleID) ->
%%	% 直接删除数据
%%	RoleID = playerState:getRoleID(),
%% 	Msg = friendCommon:delFriend2CrossGetBack(#rec_friend2_get_back{roleID = RoleID, tarRoleID = TarRoleID}),
%%	cgsFriendLogic:filterInvalidDBMsg(friend2GetBack_dbsave, [Msg], []),
%%	playerMsg:sendNetMsg(#pk_GS2U_Friend2GetBack_IgnoreRet{id = TarRoleID}).
%%
%%-spec dealOneGetBackInfo(#rec_friend2_get_back{} | [#rec_friend2_get_back{} , ...]) -> uint8().
%%dealOneGetBackInfo(#rec_friend2_get_back{roleID = RoleID, tarRoleID = TarRoleID} = Data) ->
%%	% 由于某种原因可能导致目标玩家不存在 这里再验证一波
%%	case core:queryRoleKeyInfoByRoleID(TarRoleID) of
%%		#?RoleKeyRec{} ->
%%			{IsDel,ErrorCode} = case cgsFriendInterface:queryFRT(RoleID, TarRoleID) of
%%				?FRT_Self ->
%%					{true, ?ErrorCode_Friend2CrossGetBack_Self};
%%				?FRT_Formal ->
%%					{true, ?ErrorCode_Friend2CrossGetBack_AlreadyFriend};
%%				?FRT_Black ->
%%					{true, ?ErrorCode_Friend2CrossGetBack_Black};
%%				_ ->
%%					%% 判断己方的好友上限
%%					#globalsetupCfg{setpara = [CountFormalMax]} =
%%						getCfg:getCfgPStack(cfg_globalsetup, friend2_formal_count),
%%					LA = cgsFriendInterface:queryList(RoleID, ?FRT_Formal),
%%					case erlang:length(LA) >= CountFormalMax of
%%						true ->
%%							{false, ?ErrorCode_Friend2Add_MyCountMax};
%%						_ ->
%%							add_local(RoleID, TarRoleID),
%%							{true, 0}
%%					end
%%		   end,
%%			case ErrorCode > 0 of
%%				true -> ?ERROR_CODE(ErrorCode);
%%				_ ->
%%					skip
%%			end,
%%			case IsDel of
%%				true ->
%%					Msg = friendCommon:delFriend2CrossGetBack(Data),
%%					{true,Msg};
%%				_ ->
%%					{false,{?DBOPT_ERROR, Data}}
%%			end;
%%		_ ->
%%			{true,{?DBOPT_DELETE, Data}}
%%	end.
%%
%%-spec add_getBack(TarRoleID::uint64()) -> no_return().
%%add_getBack(TarRoleID) ->
%%	RoleID = playerState:getRoleID(),
%%	#recFriend2CrossGetBack{getBack = L} = friendCommon:queryFriend2CrossGetBackData(RoleID),
%%	ClientIsDel = case lists:keyfind(TarRoleID, #rec_friend2_get_back.tarRoleID , L) of
%%		false ->
%%			true;
%%		Data ->
%%			{IsDel,Msg} = dealOneGetBackInfo(Data),
%%			cgsFriendLogic:filterInvalidDBMsg(friend2GetBack_dbsave, [Msg], []),
%%			IsDel
%%	end,
%%	case ClientIsDel of
%%		true ->
%%			playerMsg:sendNetMsg(#pk_GS2U_Friend2GetBack_AddRet{id = TarRoleID});
%%		_ ->
%%			skip
%%	end.
%%
%%oneKeyAdd_getBack() ->
%%	RoleID = playerState:getRoleID(),
%%	#recFriend2CrossGetBack{getBack = L} = friendCommon:queryFriend2CrossGetBackData(RoleID),
%%	FunAdd = fun(#rec_friend2_get_back{} = Data,MsgList) ->
%%		{_IsDel,Msg} = dealOneGetBackInfo(Data),
%%		case Msg of
%%			{?DBOPT_DELETEAll, _Info} ->
%%				[Msg];
%%			_ ->
%%				[Msg] ++ MsgList
%%		end
%%	end,
%%	SaveMsg = lists:foldl(FunAdd,[],L),
%%	cgsFriendLogic:filterInvalidDBMsg(friend2GetBack_dbsave, SaveMsg, []),
%%	sendCrossGetBackList().
%%
%%%%%-------------------------------------------------------------------
%%% api:上线初始化
%%-spec init() -> no_return().
%%init() ->
%%	sendOfflineMsg(),
%%	sendCrossGetBackList(), % 临时取消发送
%%	sendCrossList().
%%
%%%%%-------------------------------------------------------------------
%%%% internal:发送离线消息（跨服上不可用）
%%-spec sendOfflineMsg() -> no_return().
%%sendOfflineMsg() ->
%%	case core:isCross() of
%%		true ->
%%			skip;
%%		_ ->
%%			RoleID = playerState:getRoleID(),
%%			Friend2Data = cgsFriendState:queryFriend2Data(RoleID),
%%			FunSend2 =
%%				fun(Msg, SenderID) ->
%%					FRT = cgsFriendInterface:queryFRT(RoleID, SenderID),
%%					case Msg of
%%						#pk_U2GS_Friend2FormalChat_Request{
%%							receiverID = ID,
%%							content = Content,
%%							time = Time
%%						} ->
%%							MsgChat =
%%								#pk_GS2U_Friend2FormalChat_Ack{
%%									senderID = SenderID,
%%									receiverID = ID,
%%									time = Time,
%%									content = Content,
%%									relation = FRT
%%								},
%%							playerMsg:sendNetMsg(MsgChat);
%%						#pk_U2GS_Friend2FormalChatVoice_Request{
%%							receiverID = ID_,
%%							time = Time_,
%%							duration = Duration_,
%%							count = Count_,
%%							index = Index_,
%%							data = Data_
%%						} ->
%%							MsgVoice =
%%								#pk_GS2U_Friend2FormalChatVoice_AckR{
%%									senderID = SenderID,
%%									receiverID = ID_,
%%									time = Time_,
%%									duration = Duration_,
%%									count = Count_,
%%									index = Index_,
%%									data = Data_,
%%									relation = FRT
%%								},
%%							playerMsg:sendNetMsg(MsgVoice)
%%					end,
%%					SenderID
%%				end,
%%			FunSend1 =
%%				fun(#recFriend2Chat{targetRoleID = TargetRoleID, chatMsgs = Msgs}) ->
%%					lists:foldl(FunSend2, TargetRoleID, lists:reverse(Msgs))
%%				end,
%%			lists:foreach(FunSend1, Friend2Data#recFriend2Data.chatMsgs),
%%			psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_offlineMsgClear, RoleID)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:初始化跨服好友列表
%%-spec sendCrossList() -> no_return().
%%sendCrossList() ->
%%	RoleID = playerState:getRoleID(),
%%	#recFriend2CrossData{friends = LF, applys = LA} =
%%		friendCommon:queryFriend2CrossData(RoleID),
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_Friend2CrossInit_Sync{
%%			listCross = [friendCommon:createInfoCross(R) || R <- LF],
%%			listApply = [friendCommon:createInfoCross(R) || R <- LA]
%%		}
%%	).
%%
%%%%%-------------------------------------------------------------------
%%%% internal:初始化跨服好友找回列表
%%-spec sendCrossGetBackList() -> no_return().
%%sendCrossGetBackList() ->
%%	case core:isCross() of
%%		true ->
%%			skip;
%%		_ ->
%%			RoleID = playerState:getRoleID(),
%%			#recFriend2CrossGetBack{getBack = L} = friendCommon:queryFriend2CrossGetBackData(RoleID),
%%			FunPk = fun(#rec_friend2_get_back{roleID = _RoleID, tarRoleID = TarRoleID} = Data, OriList) ->
%%				case core:queryRoleKeyInfoByRoleID(TarRoleID) of
%%					#?RoleKeyRec{
%%						roleName = PlayerName,
%%						level    = PlayerLevel,
%%						career   = PlayerCareer,
%%						race     = PlayerRace,
%%						sex      = PlayerSex,
%%						head     = PlayerHead,
%%						playerForce    = PlayerForce,
%%						face = PlayerFace} ->
%%						OnePk    = #pk_Friend2GetBackInfo{id = TarRoleID, name = PlayerName, level =PlayerLevel, career = PlayerCareer,
%%							race = PlayerRace, sex = PlayerSex, head = PlayerHead,force = PlayerForce, face = PlayerFace},
%%						[OnePk] ++ OriList;
%%					_ ->
%%						% 查找不到 就删除
%%						Msg = friendCommon:delFriend2CrossGetBack(Data),
%%						cgsFriendLogic:filterInvalidDBMsg(friend2GetBack_dbsave, [Msg], []),
%%						OriList
%%				end
%%         end,
%%			PkList = lists:foldl(FunPk, [], L),
%%			playerMsg:sendNetMsg(#pk_GS2U_Friend2GetBack_SyncInfo{getBackList = PkList})
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:请求反馈或数据同步
%%-spec relationAck({Continue::type_continue(), TargetRoleID::uint64()}) -> no_return().
%%relationAck({?CONTINUE_AddFromBlackAsk, TargetRoleID}) ->
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_Friend2AddFromBlack_Ask{
%%			id = TargetRoleID,
%%			name = playerNameUID:getPlayerNameByUID(TargetRoleID)
%%		}
%%	);
%%relationAck({?CONTINUE_BanFromFormal, TargetRoleID}) ->
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_Friend2BanFromFormal_Ask{
%%			id = TargetRoleID,
%%			name = playerNameUID:getPlayerNameByUID(TargetRoleID)
%%		}
%%	);
%%relationAck({?CONTINUE_BanWithUnBan, _}) ->
%%	RoleID = playerState:getRoleID(),
%%	ListBlack = cgsFriendInterface:queryListSort(RoleID, ?FRT_Black),
%%	BlackRoleID = lists:nth(erlang:length(ListBlack), ListBlack),
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_Friend2BanWithUnban_Ask{
%%			id = BlackRoleID,
%%			name = playerNameUID:getPlayerNameByUID(BlackRoleID)
%%		}
%%	);
%%relationAck({?CONTINUE_BanWithUnBanAndDel, TargetRoleID}) ->
%%	RoleID = playerState:getRoleID(),
%%	ListBlack = cgsFriendInterface:queryListSort(RoleID, ?FRT_Black),
%%	BlackRoleID = lists:nth(erlang:length(ListBlack), ListBlack),
%%	playerMsg:sendNetMsg(
%%		#pk_GS2U_Friend2BanWithUnbanAndDel_Ask{
%%			idUnban = BlackRoleID,
%%			nameUnban = playerNameUID:getPlayerNameByUID(BlackRoleID),
%%			idDel = TargetRoleID,
%%			nameDel = playerNameUID:getPlayerNameByUID(TargetRoleID)
%%		}
%%	);
%%relationAck({?CONTINUE_DelFormalS, TargetRoleID}) ->
%%	List = playerState2:getFriend2WantBanFormal(),
%%	case lists:keyfind(TargetRoleID, 1, List) of
%%		false ->
%%			skip;
%%		_ ->
%%			ListNew = lists:keydelete(TargetRoleID, 1, List),
%%			playerState2:setFriend2WantBanFormal(ListNew),
%%			ban(TargetRoleID, false)
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:添加临时好友（跨服上不可用，但不会提示客户端）
%%%% 不由玩家消息控制，由系统调用的
%%%% 如果是正式好友则刷新交互时间
%%-spec addTemp(TargetRoleID::uint64()) -> no_return().
%%addTemp(TargetRoleID) ->
%%	case apiCheck(false, false, TargetRoleID) of
%%		true ->
%%			RoleID = playerState:getRoleID(),
%%			OP = {?RELATION_TEMP, RoleID, TargetRoleID},
%%			case cgsFriendInterface:check(OP) of
%%				{?CONTINUE_NONE, {0, _}} ->
%%					skip;
%%				{?CONTINUE_NONE, {ErrorCode, Args}} ->
%%					?ERROR_CODE(ErrorCode, Args);
%%				{?CONTINUE_FreshInteraction, _} ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP);
%%				{?CONTINUE_AddDoTemp, _} ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_relation, OP)
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:增加亲密度（跨服上不可用，但不会提示客户端）
%%-spec closenessAdd(CAT::type_cat(), RoleID::uint64(), TargetRoleID::uint64(), ClosenessAdd::int32()) -> no_return().
%%closenessAdd(_CAT, _RoleID, _TargetRoleID, 0) ->
%%	skip;
%%closenessAdd(_CAT, SameID, SameID, _ClosenessAdd) ->
%%	skip;
%%closenessAdd(CAT, RoleID, TargetRoleID, ClosenessAdd) ->
%%	case core:isCross() of
%%		true ->
%%			skip;
%%		_ ->
%%			Relation = cgsFriendState:queryRelation(RoleID, TargetRoleID),
%%			ClosenessAddOld = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_C_AddFriendliness),
%%			ClosenessAddWill = cgsFriendInterface:checkCAT(ClosenessAdd, CAT, Relation, ClosenessAddOld),
%%			case ClosenessAddWill > 0 of
%%				true ->
%%					psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_closenessAdd, {CAT, RoleID, TargetRoleID, ClosenessAddWill});
%%				_ ->
%%					skip
%%			end
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:删除角色（跨服上不可用）
%%-spec deleteRole(RoleID::uint64()) -> no_return().
%%deleteRole(RoleID) ->
%%	?INFO("deleteRole ~p", [RoleID]),
%%	case core:isCross() of
%%		false ->
%%			psMgr:sendMsg2PS(?PsNameCGSFriend, friend2_deleteRole, RoleID),
%%			core:sendMsgToActivity(?ActivityType_Date, date_deleteRole, RoleID);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:进入跨服初始化（仅跨服）
%%-spec enterCross(#recFriend2CrossData{}) -> no_return().
%%enterCross(Data) ->
%%	case core:isCross() of
%%		true ->
%%			psMgr:sendMsg2PS(?PsNameCGSFriend, enterCross, Data);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% api:退出跨服数据清理（仅跨服）
%%-spec exitCross(uint64()) -> no_return().
%%exitCross(RoleID) ->
%%	case core:isCross() of
%%		true ->
%%			psMgr:sendMsg2PS(?PsNameCGSFriend, exitCross, RoleID);
%%		_ ->
%%			skip
%%	end.
%%
%%%%%-------------------------------------------------------------------
%%% internal:构建基础信息（需要兼容跨服）
%%-spec createInfoBase(uint64() | #rec_friend2_relation{} | #rec_friend2_interaction{}) -> #pk_Friend2InfoBase{}.
%%createInfoBase(#rec_friend2_relation{targetRoleID = TargetRoleID}) ->
%%	createInfoBase(TargetRoleID);
%%createInfoBase(#rec_friend2_interaction{targetRoleID = TargetRoleID}) ->
%%	createInfoBase(TargetRoleID);
%%createInfoBase(TargetRoleID) ->
%%	%% 获取家族名（跨服上为空）
%%	FamilyName =
%%		case ets:lookup(rec_guild_member, TargetRoleID) of
%%			[#rec_guild_member{guildID = GuildID}] ->
%%				case ets:lookup(rec_guild, GuildID) of
%%					[#rec_guild{guildName = GuildName}] ->
%%						GuildName;
%%					_ ->
%%						[]
%%				end;
%%			_ ->
%%				[]
%%		end,
%%	%% 从roleKeyInfo获取大部分信息（fixme 跨服上也有效，但与目标不在同一服时无效）
%%	{Name, Level, Career, Race, Sex, Head, TimeLastOnline, VipLv, Force, Face, Like, Charm, FrameID} =
%%		case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
%%			#?RoleKeyRec{roleName = NameK, level = LevelK, career = CareerK, race = RaceK,
%%				sex = SexK, head = HeadK, vipLv = VipLvK, playerForce = PlayerForceK,
%%				petForce = PetForceK, offlineTime = TimeLastOnlineK, face = FaceK,	%% TimeLastOnlineK :: time:getSyncTime1970FromDBS()
%%				like = LikeK, charm = CharmK, frameID = FrameIDK} ->
%%				%% PlayerForceK和PetForceK可能因数据同步导致不为数字，导致后续计算错误
%%				PlayerForceK_ =
%%					case erlang:is_number(PlayerForceK) of
%%						true ->
%%							PlayerForceK;
%%						_ ->
%%							0
%%					end,
%%				PetForceK_ =
%%					case erlang:is_number(PetForceK) of
%%						true ->
%%							PetForceK;
%%						_ ->
%%							0
%%					end,
%%				{NameK, LevelK, CareerK, RaceK, SexK, HeadK, friendCommon:fromGetSyncTime1970FromDBS(TimeLastOnlineK),
%%					VipLvK, (PlayerForceK_ + PetForceK_), FaceK, LikeK, CharmK, FrameIDK};
%%			_ ->
%%				{[], 0, 0, 0, 0, 0, 0, 0, 0, [], 0, 0, 0}
%%		end,
%%	%% 获取在线情况（跨服时不准确）
%%	Code =
%%		case core:queryOnLineRoleByRoleID(TargetRoleID) of
%%			#rec_OnlinePlayer{code = Code_} ->
%%				Code_;
%%			_ ->
%%				0
%%		end,
%%	%% 好友系统关系信息提供（跨服不支持本地好友）
%%	RoleID = playerState:getRoleID(),
%%	#rec_friend2_relation{timeRelation = TimeRelation, timeLastInteractive = TimeLastInteractive} =
%%		cgsFriendState:queryRelation(RoleID, TargetRoleID),
%%	%% 是否点赞与被点赞（跨服无数据）
%%	IsGiveLike = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2Like) > 0,
%%	IsBeGiveLike = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2Like) > 0,
%%	%% 是否已婚（跨服不支持婚姻）
%%	IsMarried =
%%		case marriageState:queryRelation(TargetRoleID) of
%%			#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
%%				true;
%%			_ ->
%%				false
%%		end,
%%	%% 查询两者距离 fixme 该字段暂废弃，需要新的LBS系统综合考虑
%%	Distance = 0.0,
%%	%% 构建
%%	Simple =
%%		#pk_Friend2InfoSimple{
%%			id = TargetRoleID,
%%			name = Name,
%%			level = Level,
%%			career = Career,
%%			race = Race,
%%			sex = Sex,
%%			head = Head,
%%			frameID = FrameID
%%		},
%%	#pk_Friend2InfoBase{
%%		simple = Simple,
%%		code = Code,
%%		face = Face,
%%		vipLv = VipLv,
%%		familyName = FamilyName,
%%		force = Force,
%%		timeRelation = TimeRelation,
%%		timeLastOnline = TimeLastOnline,
%%		timeLastInteractive = TimeLastInteractive,
%%		like = Like,
%%		charm = Charm,
%%		isGiveLike = IsGiveLike,
%%		isBeGiveLike = IsBeGiveLike,
%%		isMarried = IsMarried,
%%		distance = Distance
%%	}.
%%
%%%%%-------------------------------------------------------------------
%%%% internal:构建正式好友信息
%%-spec createInfoFormal(uint64() | #rec_friend2_relation{}) -> #pk_Friend2InfoFormal{}.
%%createInfoFormal(#rec_friend2_relation{roleID = RoleID, targetRoleID = TargetRoleID, closeness = Closeness, relation = ?RELATION_FORMAL}) ->
%%	%% 是否赠送与被赠送
%%	IsGiveAP = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GiveAP) > 0,
%%	IsBeGiveAP = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GiveAP) > 0,
%%	IsGainAP = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GainAP) > 0,
%%	IsBeGainAP = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GainAP) > 0,
%%	%% 构建
%%	#pk_Friend2InfoFormal{
%%		base = createInfoBase(TargetRoleID),
%%		closeness = Closeness,
%%		isGiveAP = IsGiveAP,
%%		isGainAP = IsGainAP,
%%		isBeGiveAP = IsBeGiveAP,
%%		isBeGainAP = IsBeGainAP
%%	};
%%createInfoFormal(TargetRoleID) ->
%%	%% 亲密度来自关系模块
%%	RoleID = playerState:getRoleID(),
%%	#rec_friend2_relation{closeness = Closeness} =
%%		cgsFriendState:queryRelation(RoleID, TargetRoleID),
%%	%% 是否赠送与被赠送
%%	IsGiveAP = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GiveAP) > 0,
%%	IsBeGiveAP = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GiveAP) > 0,
%%	IsGainAP = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GainAP) > 0,
%%	IsBeGainAP = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GainAP) > 0,
%%	%% 构建
%%	#pk_Friend2InfoFormal{
%%		base = createInfoBase(TargetRoleID),
%%		closeness = Closeness,
%%		isGiveAP = IsGiveAP,
%%		isGainAP = IsGainAP,
%%		isBeGiveAP = IsBeGiveAP,
%%		isBeGainAP = IsBeGainAP
%%	}.
%%
%%%%设定跨服回到本服后的添加本地好友数据
%%setCrossAddFriend(TargerRoleID) ->
%%	Targets = playerState:getCrossAddFriend(),
%%	case lists:member(TargerRoleID,Targets) of
%%		false ->%%已添加过的不再添加
%%			playerState2:setFriend2CDCross(TargerRoleID),
%%			NewList = [TargerRoleID|Targets],
%%			playerState:setCrossAddFriend(NewList),
%%			playerState:setAddFriendCallBack({add_LocalFriend_InCross,NewList});%%添加跨服回去后的回调设置
%%		_ ->
%%			case playerState2:getFriend2CDCross(TargerRoleID) of
%%				true ->%%添加过程中的时间检测
%%					playerState2:setFriend2CDCross(TargerRoleID);
%%				_ ->
%%					?ERROR_CODE(?ErrorCode_Friend2CrossAdd_Wait)
%%			end
%%	end.