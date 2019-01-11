%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 七月 2018 16:57
%%%-------------------------------------------------------------------
-module(playerKoreaNave).
-author("Administrator").
%%
%%-include("playerPrivate.hrl").
%%-include("../KoreaNaver/koreaNaverPrivate.hrl").
%%
%%%% api
%%-export([
%%	msg/1, 				%% 协议处理
%%	init/0,				%% 上线初始化
%%%%	refreshPlayerData/0,%% 刷新个人数据
%%	koreanaveUpdate/0,	%% 活动数据改变
%%	getQuestionnaireSurveyAward/0     %%国内版本问卷调查领奖
%%]).
%%
%%
%%%%%-------------------------------------------------------------------
%%%% api,msg
%%-spec msg(Msg::term()) -> no_return().
%%msg(#pk_U2GS_KoreaNaverRewardGetRequest{id = ID, ver = Ver, menuID = MenuID, articleID = ArticleID} = Msg) ->
%%	msgReal(Msg, koreaNaverLogic:isOpen(ID, Ver, MenuID, ArticleID)).
%%
%%%%%-------------------------------------------------------------------
%%%% internal,msg
%%msgReal(#pk_U2GS_KoreaNaverRewardGetRequest{id = ID, ver = Ver, naverAccountID = NaverAccountID} = _Msg, ?KoreanaverState_InMoment) ->
%%	koreaNaverRewardGetRequest(ID, Ver, NaverAccountID);
%%msgReal(#pk_U2GS_KoreaNaverRewardGetRequest{id = ID, ver = Ver}, ?KoreanaverState_OutMoment) ->
%%
%%	Msg = #pk_GS2U_KoreaNaverRewardGetAck{
%%		%% Int32 0兑奖失败 1成功 其他待定
%%		getCode = 0,
%%		%% Int32发起领奖请求时对应活动ID
%%		id = ID,
%%		%% Int32发起领奖请求时活动版本号
%%		ver = Ver,
%%		%% KoreaNaverIdAndVer玩家已领取奖励(含版本号)
%%		rewardGetList = getRewardGetList()
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%
%%%%-spec koreanaveUpdate() -> no_return().
%%%%koreanaveUpdate() ->
%%%%	ok.
%%
%%init() ->
%%	sendKoreaNaverConfigInfo(?KoreanaverSyncDataState_Online).
%%
%%koreanaveUpdate() ->
%%	sendKoreaNaverConfigInfo(?KoreanaverSyncDataState_Change).
%%
%%
%%koreaNaverRewardGetRequest(ID, Ver, NaverAccountID) ->
%%	Already = checkAlready(ID, Ver),
%%	RewardInfo = getRewardInfo(Already, ID),
%%	IsOk = doRewardGet(Already, RewardInfo, NaverAccountID), %% 执行领奖
%%	Msg = #pk_GS2U_KoreaNaverRewardGetAck{
%%		%% Int32 0兑奖失败 1成功 其他待定
%%		getCode = case IsOk of true -> 1; _ -> 0 end,
%%		%% Int32发起领奖请求时对应活动ID
%%		id = ID,
%%		%% Int32发起领奖请求时活动版本号
%%		ver = Ver,
%%		%% KoreaNaverIdAndVer玩家已领取奖励(含版本号)
%%		rewardGetList = getRewardGetList()
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%sendKoreaNaverConfigInfo(Moment) ->
%%	Msg = #pk_GS2U_KoreaNaverConfigInfo{
%%		%% Int321.当玩家上线时/2.当活动配置该改变时
%%		state = Moment,
%%		%% KoreaNaverConfigInfo活动信息列表(有且只有3个)
%%		configInfoList = getConfigInfoList(),
%%		%% KoreaNaverIdAndVer玩家已领取奖励(含版本号)
%%		rewardGetList = getRewardGetList()
%%	},
%%	playerMsg:sendNetMsg(Msg),
%%	ok.
%%
%%getConfigInfoList() ->
%%	Fun =
%%		fun(#rec_koreanaver{
%%			id = ID,				%%活动ID tinyint(4)
%%			name = Name,				%%活动名 varchar(50)
%%			beginTime = BeginTime,				%%活动开始时间 int(4)
%%			endTime = EndTime,				%%活动结束时间 int(4)
%%			itemID = ItemID,				%%奖励道具ID int(4)
%%			itemCount = ItemCount,				%%奖励道具数量 int(4)
%%			param = Param,				%%活动参数 varchar(255)
%%			ver = Ver,								%%版本号 int(4)
%%			id_num = ID_num,				%%活动序号 int(4)
%%			menuID = MenuID,				%%论坛板块ID int(11)
%%			articleID = ArticleID				%%留言板ID int(11)
%%		}) ->
%%			#pk_KoreaNaverConfigInfo{
%%				%% Int32活动ID(只有1/2/3 三种)
%%				id = ID,
%%				%% String活动名
%%				name = Name,
%%				%% Int32活动开始时间
%%				beginTime = BeginTime,
%%				%% Int32活动结束时间
%%				endTime = EndTime,
%%				%% Int32奖励道具ID
%%				itemID = ItemID,
%%				%% Int32奖励道具数量
%%				itemCount = ItemCount,
%%				%% String活动参数(只有OnJoined/OnPostedArticle/OnPostedComment三种)
%%				param = Param,
%%				%% Int32版本号(仅当活动领取记录重置时改变(+1))
%%				ver = Ver,
%%				%% Int32活动序号(修改活动内容之后原活动不会删除, 只会新增一个活动需要+1的活动, 客户端不需要关注此参数, 每次只会把最新的活动内容发给客户端)
%%				id_num = ID_num,
%%				%% Int32论坛板块ID(当论坛调用OnPostedArticleListener接口时需要判断是否符合, 用来过滤多余请求)
%%				menuID = MenuID,
%%				%% Int32留言板ID(当论坛调用OnPostedCommentListener接口时需要判断是否符合, 用来过滤多余请求)
%%				articleID = ArticleID
%%			}
%%		end,
%%	lists:map(Fun, ets:tab2list(?EtsKoreanaverConfig)).
%%
%%getRewardGetList() ->
%%	[
%%		#pk_KoreaNaverIdAndVer{id = ID, ver = Ver} ||
%%		{ID, Ver} <- playerPropSync:getProp(?SerProp_KoreanaverRewardGet)
%%	].
%%
%%%% 检查是否领过了
%%checkAlready(Id, Ver) ->
%%	List = playerPropSync:getProp(?SerProp_KoreanaverRewardGet),
%%	not lists:member({Id, Ver}, List).
%%
%%%% 获取奖励信息
%%getRewardInfo(false, _ID) ->
%%	[];
%%getRewardInfo(_, ID) ->
%%	koreaNaverLogic:getRewardInfo(ID).
%%
%%%% 执行领奖
%%doRewardGet(false, #rec_koreanaver{} = R, NaverAccountID) ->
%%	%% 记录日志
%%	sendSaveLog(0, R, NaverAccountID),
%%	false;
%%doRewardGet(_, [], NaverAccountID) ->
%%	%% 记录日志
%%	sendSaveLog(0, #rec_koreanaver{}, NaverAccountID),
%%	false;
%%doRewardGet(_, #rec_koreanaver{
%%		id = ID,				%%活动ID tinyint(4)
%%		itemID = ItemID,				%%奖励道具ID int(4)
%%		itemCount = ItemCount,				%%奖励道具数量 int(4)
%%		mailTitle = MailTitle,				%%发送奖励邮件的标题 varchar(128)
%%		mailContent = MailContent,				%%发送奖励邮件的内容 varchar(255)
%%		ver = Ver				%%版本号 int(4)
%%	} = R, NaverAccountID) ->
%%
%%
%%%%	Quality = playerPackage:getQualityFromCfg(ItemID),
%%%%	PLog = #recPLogTSItem{
%%%%		target = ?PLogTS_PlayerSelf,
%%%%		source = ?PLogTS_Koreanaver,
%%%%		changReason = ?ItemSourceKoreanaverRewardGet,
%%%%		new = ItemCount,
%%%%		change = ItemCount
%%%%	},
%%%%	mail:sendSystemMail(RoleID, MailTitle, MailContent, MailItemList, ""),
%%%%	playerPackage:addGoodsAndMail(ItemID, ItemCount, false, Quality, PLog),
%%
%%	%% 增加玩家领奖记录
%%	List = playerPropSync:getProp(?SerProp_KoreanaverRewardGet),
%%	playerPropSync:setAny(?SerProp_KoreanaverRewardGet,[{ID, Ver} | List]),
%%
%%	%% 发送奖励邮件
%%	RoleID = playerState:getRoleID(),
%%	case playerMail:createMailGoods(ItemID, ItemCount, true, 0, RoleID, ?ItemSourceKoreanaverRewardGet) of
%%		[#recMailItem{} | _] = MailItemList ->
%%			mail:sendSystemMail(RoleID, MailTitle, MailContent, MailItemList, []);
%%		_ ->
%%			?ERROR("~p, role=~p, item=~p,num=~p, reason=~p",
%%				[?MODULE, RoleID, ItemID, ItemCount, ?ItemSourceKoreanaverRewardGet]),
%%			skip
%%	end,
%%
%%
%%
%%	%% 记录日志
%%	sendSaveLog(1, R, NaverAccountID),
%%	true.
%%
%%sendSaveLog(IsSend, #rec_koreanaver{
%%		id = ID,				%%活动ID tinyint(4)
%%		name = Name,
%%		beginTime = BeginTime,				%%活动开始时间 int(4)
%%		endTime = EndTime,				%%活动结束时间 int(4)
%%		itemID = ItemID,				%%奖励道具ID int(4)
%%		itemCount = ItemCount,				%%奖励道具数量 int(4)
%%		mailTitle = MailTitle,				%%发送奖励邮件的标题 varchar(128)
%%		mailContent = MailContent,				%%发送奖励邮件的内容 varchar(255)
%%		param = Param,				%%活动参数 varchar(255)
%%		ver = Ver,				%%版本号 int(4)
%%		opUser = OpUser,				%%操作者 varchar(128)
%%		id_num = ID_Num,				%%活动序号 int(4)
%%		menuID = MenuId,				%%论坛板块ID int(11)
%%		articleID = ArticleId				%%留言板ID int(11)
%%	}, NaverAccountID) ->
%%	%% 记录日志
%%	Log = #rec_log_koreanaver_reward_get{
%%		playerID = playerState:getRoleID(),				%%角色ID bigint(8) unsigned
%%		accountID = playerState:getAccountID(),				%%账号ID bigint(8) unsigned
%%		state = IsSend,				%%领取成功与否(0失败,1成功) tinyint(4) unsigned
%%		id = ID,				%%应领取的活动ID tinyint(4) unsigned
%%		name = Name,				%%应领取的活动名 varchar(50)
%%		beginTime = BeginTime,				%%应领取的活动开始时间 int(4) unsigned
%%		endTime = EndTime,				%%应领取的活动结束时间 int(4) unsigned
%%		itemID = ItemID,				%%应领取物品ID int(4) unsigned
%%		itemCount = ItemCount,				%%应领取物品数量 int(4) unsigned
%%		mailTitle = MailTitle,				%%发送奖励邮件的标题 varchar(128)
%%		mailContent = MailContent,				%%发送奖励邮件的内容 varchar(255)
%%		param = Param,				%%应领取的活动参数 varchar(255)
%%		ver = Ver,				%%应领取的活动版本 int(4) unsigned
%%		naver_accountID = NaverAccountID, %%Naver论坛账号 varchar(255)
%%		opUser = OpUser,				%%应领取操作者 varchar(128)
%%		id_num = ID_Num,				%%活动序号 int(4)
%%		menuID = MenuId,				%%论坛板块ID int(11)
%%		articleID = ArticleId				%%留言板ID int(11)
%%	},
%%
%%
%%	dbLog:sendSaveKoreaNaver(Log),
%%	ok.
%%
%%getQuestionnaireSurveyAward() ->
%%	case core:isCross() of
%%		false ->
%%			IsOpen = variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Hide_BugReport),
%%			case playerPropSync:getProp(?SerProp_QuestionnaireSurveyAwardCnt) of
%%				0 when ?Cur_Lang =:= ?Lang_CHS andalso IsOpen =:= true ->
%%					case getCfg:getCfgPStack(cfg_globalsetup, questionnaire_investigation_reward) of
%%						#globalsetupCfg{setpara = [{ItemID, ItemNum}]} when ItemNum > 0 ->
%%							Title = stringCfg:getString(questionnaire_investigation_title),
%%							Content = stringCfg:getString(questionnaire_investigation_content),
%%							playerMail:sendGoodsMailTitleAndContent(ItemID, ItemNum, false, 0, Title, Content, ?ItemSourceQuestionnaireSurvey),
%%							playerPropSync:setInt(?SerProp_QuestionnaireSurveyAwardCnt, 1);
%%						_ ->
%%							skip
%%					end;
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end.
%%
