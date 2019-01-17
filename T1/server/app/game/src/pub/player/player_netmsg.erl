%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 16:06
%%%-------------------------------------------------------------------
-module(player_netmsg).
-author("mawenhong").
-include("logger.hrl").
-include("netmsg.hrl").
-include("map_core.hrl").
-include("gsInc.hrl").
-include("playerPrivate.hrl").

-include("player_status.hrl").
-include("gs_common_rec.hrl").
-include("gs_cache.hrl").


%% API
-export([handle/2]).

%%handle(#pk_U2GS_ExitGame{}) ->
%%    player_pub:stop(client_req_exit),
%%    ok;
%%handle(#pk_U2GS_HearBeat{}) ->
%%    player_pub:send_net_msg(#pk_GS2U_HearBeat{now = misc_time:localtime_seconds()}),
%%    ok;
handle(_, #pk_U2LS_Login_Normal{} = Pk) ->
    player_priv:login(Pk),
    ok;
handle(_, #pk_U2GS_RequestLogin{accountID = AccountID, key = Key} = Pk) ->
    ?ERROR("pk_U2GS_RequestLogin:~p,~p", [AccountID]),
    ok;
handle(_Cmd, #pk_U2GS_ChangeLineLoginRequest{
    accountID = AccountID,
    roleID = RoleID
}) ->
    ?ERROR("pk_U2GS_ChangeLineLoginRequest:~p,~p", [RoleID, AccountID]),
    ok;
%%充值前，取出玩家是否已经有过双倍活动参与
handle(?U2GS_RequestRechargeHasGiftIDList, #pk_U2GS_RequestRechargeHasGiftIDList{}) ->
%%	RoleID = playerState:getRoleID(),
%%	Sql = qlc:q(
%%		[X || X <- mnesia:table(?EtsRechargeRebateTaken),
%%			X#recSaveRechargeRebateTaken.roleID =:= RoleID andalso
%%				(X#recSaveRechargeRebateTaken.rebateIdAndType band 16#ff) =:= ?RechargeRebateFirstDouble]),
%%	TakenIDList = edb:selectRecord(Sql),
%%
%%	ConfIDList = edb:readAllRecord(rec_recharge_double_conf),
%%	Msg = #pk_GS2U_RequestRechargeHasGiftIDListAck{
%%		takenIDList = [misc:toInteger(RID) || #recSaveRechargeRebateTaken{rebateIdAndType = RID} <- TakenIDList],
%%		confIDList = [
%%			#pk_RechargeDoubleConf{payMoney = misc:toFloat(PayMoney), id = RID1} ||
%%			#rec_recharge_double_conf{rebateID = RID1, funcellPayItemID = PayMoney} <- ConfIDList]
%%	},
%%	player_pub:send_net_msg(Msg),
    ok;

%%充值角色(钻石)
handle(?U2GS_RequestRecharge, #pk_U2GS_RequestRecharge{
    funcellOrderID = FeOrderID
}) ->
    AID = playerState:getAccountID(),
    RID = playerState:getRoleID(),
   ?INFO("xxxxxxxxxxxxxxxxxxxxxxx废弃xxxxxxxCMD_U2GS_RequestRecharge accountid[~w]role[~w],funcellOrderID[~ts]", [AID, RID, FeOrderID]),
%%
%%	dbLog:sendSaveLogEventID(RID,AID,?RechargeEventOnGettingCilent, time:getUTCNowSec(), FeOrderID),
%%	psMgr:sendMsg2PS(?PsNamePreRecharge, checkCSHas,{self(),Msg} ),
    ok;

%%领取我以前的预充值币
handle(?U2GS_RechargeGettingEvent, #pk_U2GS_RechargeGettingEvent{type = Type, grade = _Grade}) when
    Type =:= 10 ->
%%	playerRecharge:requestGetMyPreRecharge(),
    ok;


%%7日累充，普通累充礼品领取
handle(?U2GS_RechargeGettingEvent, #pk_U2GS_RechargeGettingEvent{}) ->

%%	playerRecharge:getChargeGift(Type, Grade),
    ok;

%%领取商业化奖励
handle(?U2GS_RequestGetGift, #pk_U2GS_RequestGetGift{id = ID}) ->
    
    playerRecharge2:requestGetGift(ID),
    ok;

%%请求商业化内容
handle(?U2GS_RequestBusinessInfo, #pk_U2GS_RequestBusinessInfo{activityType = ActivityType}) ->
    
    playerRecharge2:requestBusinessInfo(ActivityType),
    ok;

%%请求自己的转盘信息(打开转盘)
handle(?U2GS_RequestSelfDialInfo, Msg) ->
    
    playerDialBox:msg(Msg),
    ok;
%%请求转转转
handle(?U2GS_RequestJqueryrotate, Msg) ->
    
    playerDialBox:msg(Msg),
    ok;

%%请求领宝箱
handle(?U2GS_RequestGetBox, Msg) ->
    playerDialBox:msg(Msg),
    ok;

handle(?U2GS_BuyBuff, #pk_U2GS_BuyBuff{id = ID}) ->
    playerBuff:buyBuff(ID),
    ok;

%% ----------------------幽界探险，跨服采集资源争夺战----------------------
handle(?U2GS_GBLockGather, Msg) ->
    playerGatherBattle:msg(Msg),
    ok;
handle(?U2GS_GBLeaveRange, Msg) ->
    playerGatherBattle:msg(Msg),
    ok;
handle(?U2GS_RequestGBList, Msg) ->
    
    playerGatherBattle:msg(Msg),
    ok;
handle(?U2GS_GBRequestEnterMapLine, Msg) ->
    
    playerGatherBattle:msg(Msg),
    ok;
handle(?U2GS_BuyTime, Msg) ->
    
    playerGatherBattle:msg(Msg),
    ok;
%% ----------------------幽界探险，跨服采集资源争夺战----------------------

%% ----------------------Aruna，世界大战，服务器大战----------------------
handle(?U2GS_RequestWWLineList, Msg) ->
    
    playerAruna:msg(Msg),
    ok;
handle(?U2GS_WWRequestEnterMapLine, Msg) ->
    
    playerAruna:msg(Msg),
    ok;
handle(?U2GS_RequestWWPlayerInfo, Msg) ->
    playerAruna:msg(Msg),
    ok;
handle(?U2GS_SubmitSamplePoint, Msg) ->
    playerAruna:msg(Msg),
    ok;
handle(?U2GS_RequestWWForm, Msg) ->
    
    playerAruna:msg(Msg),
    ok;
handle(?U2GS_GetLastReward, Msg) ->
    
    playerAruna:msg(Msg),
    ok;
handle(?U2GS_GetPhaseReward, Msg) ->
    
    playerAruna:msg(Msg),
    ok;
handle(?U2GS_AtuoSubmitTask, Msg) ->
    
    playerAruna:msg(Msg),
    ok;
%% ----------------------Aruna，世界大战，服务器大战----------------------

%%系统内部购买 （功能型购买）
handle(?U2GS_Buy4System, #pk_U2GS_Buy4System{costID = CostID, number = Number}) ->
    
    playerBuy4System:buy4System(CostID, Number),
    ok;

%%月卡 礼品领取
handle(?U2GS_MonthCardGettingEvent, #pk_U2GS_MonthCardGettingEvent{type = _Type}) ->
    
%%	playerMonthCard:getGiftMsg(),
    ok;

%%申请进入活动
handle(?U2GS_RequestInActivity, #pk_U2GS_RequestInActivity{activityID = AID, mapID = _MapID}) ->
    ?DEBUG("=======requestInKingMap=============AID=~p~n", [AID]),
    ok;

%%申请进入活动(取王者战天下名额)
handle(?U2GS_AttackDefenderQuotaNumber, #pk_U2GS_AttackDefenderQuotaNumber{activityID = AID, mapID = MapID} = P) ->
    ?DEBUG("----CMD_U2GS_AttackDefenderQuotaNumber--~p", [P]),
    ok;

%%王者战天下 购买镜像buff
handle(?U2GS_KingBattleBuyMirrorBuff, #pk_U2GS_KingBattleBuyMirrorBuff{}) ->
    
    playerAcKingBattleAll:defender_buy_mirror_buff();
%%王者战天下 一键购买镜像buff
handle(?U2GS_KingBattleBuyMirrorBuffOneKey, #pk_U2GS_KingBattleBuyMirrorBuffOneKey{}) ->
    
    playerAcKingBattleAll:defender_buy_mirror_buff_one_key();
%%王者战天下 购买进攻方buff
handle(?U2GS_KingBattleBuyAttackerBuff, #pk_U2GS_KingBattleBuyAttackerBuff{}) ->
    
    playerAcKingBattleAll:attacker_buy_buff(),
    ok;
%%王者战天下 一键购买进攻方buff
handle(?U2GS_KingBattleBuyAttackerBuffOneKey, #pk_U2GS_KingBattleBuyAttackerBuffOneKey{}) ->
    
    playerAcKingBattleAll:attacker_buy_buff_one_key(),
    ok;

%%王者战天下 一键购买守护者buff
handle(?U2GS_KingBattleBuyDeffenderBuff, #pk_U2GS_KingBattleBuyDeffenderBuff{}) ->
    
    playerAcKingBattleAll:defender_buy_buff(),
    ok;
%%王者战天下 一键购买守护者buff
handle(?U2GS_KingBattleBuyDeffenderBuffOneKey, #pk_U2GS_KingBattleBuyDeffenderBuffOneKey{}) ->
    
    playerAcKingBattleAll:defender_buy_buff_one_key(),
    ok;
%% //王者战天下 修复镜像
handle(?U2GS_KingBattleRepairMirror, #pk_U2GS_KingBattleRepairMirror{isRepairAll = IsRepairAll}) ->
    
    playerAcKingBattleAll:repair_mirror(IsRepairAll);


%% //王者战天下 守护宣言
handle(?U2GS_GuardianDeclaration, #pk_U2GS_GuardianDeclaration{declaration = Declaration}) ->
    
    playerAcKingBattleAll:setKingDeclaration(Declaration);


%% //王者战天下 防守方获取自己的信息
handle(?U2GS_KingBattleGetBuffInfo, #pk_U2GS_KingBattleGetBuffInfo{}) ->
    playerAcKingBattleAll:flashBuffInfo();

%%///////////////////////////////////////////////////////////////////////////////////////
%%红包(发红包
handle(?U2GS_SendRedEnvelope, #pk_U2GS_SendRedEnvelope{
    type = Type,
    targetType = TargetType,
    targetUID = TargetUID,
    allNumber = AllNumber,
    allMoney = AllMoney,
    luckContent = LuckContent
}) ->
    
    playerRedEnvelope:sendRedEnvelope(Type, TargetType, TargetUID, AllNumber, AllMoney, LuckContent),
    ok;

%%红包(抢红包
handle(?U2GS_RobRedEnvelope, #pk_U2GS_RobRedEnvelope{redUID = RedUID}) ->
    
    playerRedEnvelope:robRedEnvelope(RedUID),
    ok;

%%红包(与我相关的红包日志
handle(?U2GS_RedEnvelopeHistory, #pk_U2GS_RedEnvelopeHistory{}) ->
    
    playerRedEnvelope:redEnvelopeHistory(),
    ok;

%%红包(取出指定红包信息
handle(?U2GS_RedEnvelopeInfo, #pk_U2GS_RedEnvelopeInfo{redUID = RedUID}) ->
    
    playerRedEnvelope:redEnvelopeInfo(RedUID),
    ok;

%%查询可用红包
handle(?U2GS_RedEnvelopeQuery, #pk_U2GS_RedEnvelopeQuery{targetType = TargetType}) ->
    
    playerRedEnvelope:redEnvelopeQuery(TargetType),
    ok;
%%玩家放弃抢本轮红包
handle(?U2GS_GiveUpRedEnvelope, #pk_U2GS_GiveUpRedEnvelope{}) ->
%%    case core:isCross() of
%%        true -> skip;
%%        _ -> playerPropSync:setInt(?PriProp_WorldRedEnvelope, 0)
%%    end,
    ok;
%%///////////////////////////////////////////////////////////////////////////////////////
%%取王者雕像的数据
handle(?U2GS_RequestMarrorInfo, #pk_U2GS_RequestMarrorInfo{}) ->
    playerAcKingBattleAll:flashMirrorInfo(true),
    ok;

%%取王者雕像的点赞
handle(?U2GS_GiveMarrorFlower, #pk_U2GS_GiveMarrorFlower{}) ->
    
    playerAcKingBattleAll:giveMarrorFlower(),
    ok;


%%接收client的事件日志记录（充值各环节）
handle(?U2GS_RecClientEvent, #pk_U2GS_RecClientEvent{
    eventID = EventID,
    eventTime = EventTime,
    eventArgs = EventArgs}) ->
    dbLog:sendSaveLogEventID(playerState:getRoleID(), playerState:getAccountID(), EventID, EventTime, EventArgs),
    ok;

%%创建角色
handle(?U2GS_RequestCreatePlayer, #pk_U2GS_RequestCreatePlayer{name = Name} = Pk) ->
    
    RealName = string:strip(Name),
   ?INFO("accountID[~p] Code[~p] try to create role[~ts]",
        [playerState:getAccountID(), playerState:getPlayerCode(), RealName]),
    playerLogin:onCreateRole(Pk#pk_U2GS_RequestCreatePlayer{name = RealName}),
    ok;

%%进入游戏
handle(?U2GS_SelPlayerEnterGame, #pk_U2GS_SelPlayerEnterGame{roleID = Uid}) ->
    player_priv:select_player(Uid),
    ok;

%%删除角色
handle(?U2GS_RequestDeletePlayer, #pk_U2GS_RequestDeletePlayer{} = Pk) ->
    
    RoleID = Pk#pk_U2GS_RequestDeletePlayer.roleID,
   ?INFO("player accountID[~p] code[~p] delete roleID: ~p",
        [playerState:getAccountID(), playerState:getPlayerCode(), RoleID]),
%%    RoleList = playerState:getRoleList(),
%%    case lists:keymember(RoleID, #recRoleListInfo.roleID, RoleList) of
%%        true ->
%%            playerLogin:onDeleteRole(RoleID);
%%        _ ->
%%            skip
%%    end,
    ok;

%%客户端装载地图完成,发送玩家数据过去
handle(?U2GS_EnteredMap, #pk_U2GS_EnteredMap{}) ->
    playerMap:playerRealEnterMap(),
    ok;

%% 玩家剧情播放结束
handle(?U2GS_PlotDialogueEnd, #pk_U2GS_PlotDialogueEnd{}) ->
%%    GroupID = playerState:getGroupID(),
%%    %%?DEBUG("U2GS_PlotDialogueEnd:~p,~p", [playerState:getRoleID(),GroupID]),
%%    case GroupID > 0 of
%%        true ->
%%            %% fixme 这里特殊处理分组中的情况，剧情播放结束，移除给玩家添加的虚化以及禁止操作的buff，开始其它正常流程
%%            playerBuff:delBuff(?OUTOFCONTROL),
%%            playerBuff:delBuff(?PLAYERBLUR),
%%
%%            MapPid = playerState:getMapPid(),
%%            Code = playerState:getPlayerCode(),
%%            psMgr:sendMsg2PS(MapPid, playerEntermap, {Code, GroupID});
%%        _ ->
%%            skip
%%    end,
    ok;

%%冲刺到某点
handle(?U2GS_DashTo, #pk_U2GS_DashTo{posX = X, posY = Y}) ->
    playerSkill:onUseDashSkill(X, Y),
    ok;


handle(?U2GS_UseLifeSkill, #pk_U2GS_UseLifeSkill{type = Type, npcCode = Code, param = Param, times = Times}) ->
    
    playerLifeSkill:start(Type, Code, Param, Times),
    ok;
handle(?U2GS_GiveReward, #pk_U2GS_GiveReward{type = Type, npcCode = Code, param = Param}) ->
    
    playerLifeSkill:giveReward(Type, Code, Param, 1),
    ok;
handle(?U2GS_FinishLifeSkill, #pk_U2GS_FinishLifeSkill{type = Type}) ->
    
    playerLifeSkill:finish(Type),
    ok;
handle(?U2GS_LifeSkillBuyCount, #pk_U2GS_LifeSkillBuyCount{type = Type, count = Count}) ->
    
    playerLifeSkill:buyCount(Type, Count),
    ok;
handle(?U2GS_BuySpirit, #pk_U2GS_BuySpirit{}) ->
    
    playerSpirit:buy(),
    ok;


handle(?U2GS_ChangeWingLevel, #pk_U2GS_ChangeWingLevel{}) ->
%%	playerWing:changeWingLevel(NewWingLevel),
    ok;

%%设置时装可视的公共属性
handle(?U2GS_IsDisplayFashion, #pk_U2GS_IsDisplayFashion{flag = Value}) ->
    playerPropSync:setInt(?PubProp_FashionVisibleFlag, Value),
    ok;

%% 删除buff （据彭望解释：发动觉醒技能会有变大效果，玩家可以主动中止变大效果，此时客户端请求删除BUFF
%%			但是我没有找到觉醒技能对应的变大效果，只有带属性的变身效果
handle(?U2GS_DelBuff, #pk_U2GS_DelBuff{code = Code, buffID = BuffID}) ->
    case playerState:getPlayerCode() of
        Code ->
            case getCfg:getCfgByKey(cfg_buff, BuffID) of
                #buffCfg{buffEffect = ?Transformation} ->
                    playerBuff:delBuff(BuffID);
                _ ->
                    skip
            end,
            ok;
        _ ->
            skip
    end,
    ok;

%移动到某点
handle(?U2GS_MoveTo, #pk_U2GS_MoveTo{code = Code, posX = X, posY = Y, posInfos = PosInfos} = Pk) ->
    case codeMgr:isCodeType(?CodeTypePet, Code) andalso playerState:getActionStatus() =/= ?CreatureActionStatusChangeMap of
        true ->
            case lists:member(Code, playerState:getCallPetCodeList()) of
                true ->
                    case playerPet:getPetMountStatus(Code) of
                        ?CreatrueActionStatusStealth ->
                            skip;
                        ?CreatureActionStatusDead ->
                            skip;
                        _ ->
                            monsterInterface:petMoveTo(Code, X, Y, PosInfos)
                    end;
                _ ->
                    skip
            end;
        _ ->
            playerMove:onPlayerMoveTo(Pk)
    end,
    ok;

%%停止移动
handle(?U2GS_StopMove, #pk_U2GS_StopMove{code = Code, posX = X, posY = Y}) ->
    case codeMgr:isCodeType(?CodeTypePet, Code) of
        true ->
            case lists:member(Code, playerState:getCallPetCodeList()) of
                true ->
                    case playerPet:getPetMountStatus(Code) of
                        ?CreatrueActionStatusStealth ->
                            skip;
                        ?CreatureActionStatusDead ->
                            skip;
                        _ ->
                            monsterInterface:stopMove(Code, X, Y)
                    end;
                _ ->
                    skip
            end;
        _ ->
            %%如果客户端正在切换地图，则不能处理StopMove消息，不能相信它
            case playerState:getActionStatus() =/= ?CreatureActionStatusChangeMap of
                true ->
                    playerMove:clientStopMove(X, Y);
                _ ->
                    skip
            end
    end,
    ok;

%% 请求详细信息
handle(?U2GS_RequestObjInfo, #pk_U2GS_RequestObjInfo{obj_type = _Type, codes = _Codes}) ->
    ok;

%%使用技能
handle(?C2S_PlayerUseSkill, #pk_C2S_PlayerUseSkill{code = Code, skillId = SkillID, serial = SN, targetCodeList = TargetCodeList}) ->
    TargetCodeList1 = camp:countLimitFilter(SkillID, TargetCodeList),
    TargetCodeList2 = modifySkillTargetCodeList(TargetCodeList1),
    case codeMgr:isCodeType(?CodeTypePet, Code) of
        true ->
            case lists:member(Code, playerState:getCallPetCodeList()) of
                true ->
                    monsterInterface:useSkill(Code, SkillID, TargetCodeList2, SN);
                _ ->
                    skip
            end;
        _ ->
            {X, Y} = playerState:getPos(),
            playerSkill:onUseSkill(SkillID, TargetCodeList2, SN, X, Y)
    end,
    ok;

%%使用带位移技能
handle(?C2S_PlayerUseShiftSkill, #pk_C2S_PlayerUseShiftSkill{code = Code, skillId = SkillID, serial = SN, targetCodeList = TargetCodeList, x = X, y = Y}) ->
    TargetCodeList1 = camp:countLimitFilter(SkillID, TargetCodeList),
    TargetCodeList2 = modifySkillTargetCodeList(TargetCodeList1),
    case codeMgr:isCodeType(?CodeTypePet, Code) of
        true ->
            ListPet = playerState:getCallPet(),
            case lists:keyfind(Code, #recCallPet.pet_code, ListPet) of
                #recCallPet{pet_id = PetID} ->
                    ?ERROR("pet can not use ShiftSkill petID:~w skillID:~w", [PetID, SkillID]);
                _ ->
                    ?ERROR("pet can not use ShiftSkill skillID:~w", [SkillID])
            end;
        _ ->
            playerSkill:onUseSkill(SkillID, TargetCodeList2, SN, X, Y)
    end,
    ok;

%%请求npc对话
handle(?U2GS_TalkToNpc, #pk_U2GS_TalkToNpc{} = Pk) ->
    playerTask:requestTalkToNpc(Pk#pk_U2GS_TalkToNpc.code),
    %%?DEBUG("request npc talk, npcActorID: ~p", [Pk#pk_U2GS_TalkToNpc.code]),
    ok;

%%请求npc对话
handle(?U2GS_RequestGoddessCode, #pk_U2GS_RequestGoddessCode{} = _Pk) ->
    MapPid = playerState:getMapPid(),
    NetPid = playerState:getNetPid(),
    psMgr:sendMsg2PS(MapPid, requestGoddessCode, NetPid),
    ok;

%% 家族/环/日常任务
handle(?U2GS_RequestAcceptLoopTask, #pk_U2GS_RequestAcceptLoopTask{} = Msg) ->
    
    playerLoopTask:msg(Msg);
handle(?U2GS_RequestOperateLoopTask, #pk_U2GS_RequestOperateLoopTask{} = Msg) ->
    
    playerLoopTask:msg(Msg);
handle(?U2GS_RequestOneKeyLoopTask, #pk_U2GS_RequestOneKeyLoopTask{} = Msg) ->
    
    playerLoopTask:msg(Msg);
handle(?U2GS_GuildLoopTask_WantGet_Request, #pk_U2GS_GuildLoopTask_WantGet_Request{} = Msg) ->
    
    playerLoopTask:msg(Msg);
handle(?U2GS_GuildLoopTask_OpenUI_Request, #pk_U2GS_GuildLoopTask_OpenUI_Request{} = Msg) ->
    
    playerLoopTask:msg(Msg);
handle(?U2GS_GuildLoopTask_Give_Request, #pk_U2GS_GuildLoopTask_Give_Request{} = Msg) ->
    
    playerLoopTask:msg(Msg);
handle(?U2GS_GuildLoopTask_History_Request, #pk_U2GS_GuildLoopTask_History_Request{} = Msg) ->
    
    playerLoopTask:msg(Msg);
handle(?U2GS_GuildLoopTask_WantGive_Request, #pk_U2GS_GuildLoopTask_WantGive_Request{} = Msg) ->
    
    playerLoopTask:msg(Msg);

%% 上交物品任务，请求上交物品
handle(?U2GS_RequestHandIn, #pk_U2GS_RequestHandIn{taskID = TaskID, itemID = ItemID, itemCount = ItemCount, npcCode = Code}) ->
    playerTask:handIn(TaskID, ItemID, ItemCount, Code);

%%请求接取任务
handle(?U2GS_RequestAcceptTask, #pk_U2GS_RequestAcceptTask{} = Pk) ->
    TaskID = Pk#pk_U2GS_RequestAcceptTask.taskID,
    Code = Pk#pk_U2GS_RequestAcceptTask.code,
    case getCfg:getCfgByKey(cfg_task, TaskID) of
        #taskCfg{type = ?TaskMainType_Marriage} ->
            skip; %% 不能使用该接口接受情缘任务
        #taskCfg{type = ?TaskMainType_EveryDay} ->
            skip; %% 不能使用该接口接受家族环任务
        #taskCfg{type = ?TaskMainType_Exp} ->
            skip; %% 不能使用该接口接受经验环任务
        _ ->
            playerTask:acceptTask(TaskID, Code)
    end,
    %%?DEBUG("request accept task, roleID: ~p, code: ~p, taskID: ~p", [RoleID, Code, TaskID]),
    ok;

%%请求放弃任务
handle(?U2GS_DropTask, #pk_U2GS_DropTask{} = Pk) ->
    TaskID = Pk#pk_U2GS_DropTask.taskID,
    ?ERROR("MsgCancelTask RoleID:~w TaskID:~w", [playerState:getRoleID(), TaskID]),
    playerTask:cancelTask(TaskID),
    ok;

%%提交任务
handle(?U2GS_SumbitTask, #pk_U2GS_SumbitTask{} = Pk) ->
    
    TaskID = Pk#pk_U2GS_SumbitTask.taskID,
    Code = Pk#pk_U2GS_SumbitTask.code,
    case getCfg:getCfgByKey(cfg_task, TaskID) of
        #taskCfg{type = ?TaskMainType_Marriage} ->
            playerMarriageTask:leaderSubmitTask(Code);
        _ ->
            playerTask:submitTask(TaskID, Code, 0)
    end,
    ok;

%%重置任务
handle(?U2GS_ResetTask, #pk_U2GS_ResetTask{taskID = TaskID}) ->
    
    playerTask:resetTask(TaskID),
    ok;

%%触发任务BUFF
handle(?U2GS_TriggerTaskBuff, #pk_U2GS_TriggerTaskBuff{taskID = TaskID}) ->
    playerTask:triggerTaskBuff(TaskID),
    ok;

%%请求通过NPC进入活动地图
handle(?U2GS_EnterActiveMap, #pk_U2GS_EnterActiveMap{npcCode = NpcCode, activeID = ActiveID}) ->
    playerNpc:enterActiveMap(ActiveID, NpcCode),
    ok;

%%请求活动地图的活动榜单
handle(?U2GS_RequestActivityMapRank, #pk_U2GS_RequestActivityMapRank{type = ?ActivityType_KingBattleAll}) ->
    core:sendMsgToActivity(?ActivityType_KingBattleAll,
        requestKingBattleDamageRank,
        {
            playerState:getRoleID()
        }),
    ok;

%%取出充值、消费活动配置
handle(?U2GS_RequestOPActivityConfList, #pk_U2GS_RequestOPActivityConfList{type = Type})
    when Type == ?OperateActType_DiamonCharge orelse Type == ?OperateActType_DiamonUse ->
    
    playerACChargeOrUse:getChargeOrUseList(Type),
    ok;

%%领取充值、消费活动奖励
handle(?U2GS_GetChargeOrUseGift, #pk_U2GS_GetChargeOrUseGift{type = Type, ruleID = RuleID}) ->
    playerACChargeOrUse:getChargeOrUseGift(Type, RuleID),
    ok;

%地图切换
handle(?C2S_ChangeMap, #pk_C2S_ChangeMap{mapId = NewMapId, waypointName = WaypointName}) ->
    case core:isCross() of
        false ->
            %% 如果当前在副本或者位面中，不允许切换地图
            MapID = playerState:getMapIDGroup(),
            {MapType, SubType} =
                case getCfg:getCfgPStack(cfg_mapsetting, NewMapId) of
                    #mapsettingCfg{type = Type, subtype = SType} ->
                        {Type, SType};
                    _ ->
                        {999, 999}
                end,
            ?DEBUG("handle(?C2S_ChangeMap from ~w to ~w", [MapID, NewMapId]),
            case playerScene:getMapType(MapID) of
                ?MapTypeNormal ->
                    if
                        MapType =:= ?MapTypeNormal ->
                            playerScene:onRequestEnterMap(NewMapId, WaypointName);
                        MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeDarknessReady ->
                            playerDarkness:requestEnterDarknessPrepareMap(NewMapId);
                        MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeGuildExpedition ->
                            playerGuildExpedition:requestEnterMap(NewMapId, WaypointName);
                        true ->
                            playerScene:onRequestEnterMap(NewMapId, WaypointName)
                    end;
                ?MapTypeActivity ->
                    if
                        MapType =:= ?MapTypeNormal ->
                            playerScene:onRequestEnterMap(NewMapId, WaypointName);
                        MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeGuildExpedition ->
                            playerGuildExpedition:requestEnterMap(NewMapId, WaypointName);
                    %MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeWeddingSite ->
                    %	sendErrorCodeMsg(?ErrorCode_Marriage_WS_FromInvalidMap);
                        true ->
                            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
                    end;
                _ ->
                    sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
            end;
        _ ->
            ?ERROR("CMD_C2S_ChangeMap:~p,~p", [playerState:getRoleID(), NewMapId]),
            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
    end,
    ok;

% 循环刷本
handle(?U2GS_GoonCopyMap, #pk_U2GS_GoonCopyMap{mapID = TMapID}) ->
    
    ?DEBUG("CMD_U2GS_GoonCopyMap"),
    case getCfg:getCfgPStack(cfg_mapsetting, TMapID) of
        #mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeWarrior} ->
            case playerCopyMap:canEnterCopyMap(TMapID) of
                true ->
                    playerCopyMap:goonCopyMap(TMapID);
                ErrorCode ->
                    sendErrorCodeMsg(ErrorCode)
            end;
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;

%%地图传送
handle(?U2GS_TransferMap, #pk_U2GS_TransferMap{mapId = NewMapId, waypointName = WaypointName}) ->
    case core:isCross() of
        false ->
            MapID = playerState:getMapIDGroup(),
            {MapType, SubType} =
                case getCfg:getCfgPStack(cfg_mapsetting, NewMapId) of
                    #mapsettingCfg{type = Type, subtype = SType} ->
                        {Type, SType};
                    _ ->
                        {999, 999}
                end,

            case playerScene:getMapType(MapID) of
                ?MapTypeNormal ->
                    if
                        MapType =:= ?MapTypeNormal ->
                            case playerScene:canTransferMapAndSetNewTransferInfo() of
                                true -> playerScene:onRequestEnterMap(NewMapId, WaypointName);
                                _ -> sendErrorCodeMsg(?ErrorCode_SystemTransferMapCD)
                            end;
                        MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeGuildExpedition ->
                            playerGuildExpedition:requestEnterMap(NewMapId, WaypointName);
                        true ->
                            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
                    end;
                ?MapTypeActivity ->
                    if
                        MapType =:= ?MapTypeNormal ->
                            case playerScene:canTransferMapAndSetNewTransferInfo() of
                                true -> playerScene:onRequestEnterMap(NewMapId, WaypointName);
                                _ -> sendErrorCodeMsg(?ErrorCode_SystemTransferMapCD)
                            end;
                        MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeGuildExpedition ->
                            playerGuildExpedition:requestEnterMap(NewMapId, WaypointName);
                        true ->
                            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
                    end;
                _ ->
                    sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
            end;
        _ ->
            ?ERROR("CMD_U2GS_TransferMap:~p,~p", [playerState:getRoleID(), NewMapId]),
            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
    end,
    ok;

%%挖宝地图传送
handle(?U2GS_DigTransferMap, #pk_U2GS_DigTransferMap{mapId = NewMapId, waypointName = WayPointName}) ->
    case core:isCross() of
        false ->
            MapID = playerState:getMapIDGroup(),
            case playerScene:getMapType(MapID) of
                ?MapTypeNormal ->
%%					case playerScene:getMapType(NewMapId) of
%%						?MapTypeNormal ->
%%							playerScene:onRequestEnterMap(NewMapId, WayPointName);
%%						_ ->
%%							sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
%%					end;
                    %% 还原回来
                    case playerScene:getMapSubType(NewMapId) of
                        ?MapSubTypeGuildFairground ->
                            playerGuildFairground:enter_try(playerState:getGuildID());
                        _ ->
                            playerScene:onRequestEnterMap(NewMapId, WayPointName)
                    end;
                _ ->
                    sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
            end;
        _ ->
            ?ERROR("CMD_U2GS_DigTransferMap:~p,~p", [playerState:getRoleID(), NewMapId]),
            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
    end,
    ok;

%% 获取好友坐标
handle(?U2GS_getFriendPos, #pk_U2GS_getFriendPos{friendID = FriendID}) ->
    ActStatus = playerState:getActionStatus(),
    case ActStatus =:= ?CreatureActionStatusDead orelse playerState:isPlayerBattleStatus() of
        true -> %%战斗和死亡状态不让传送
            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailedPlayerDeadOrBattle);
        _ ->
            case ActStatus =/= ?CreatureActionStatusChangeMap of
                true ->
                    playerMap:tryGetFriendPos(FriendID);
                _ ->
                    sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
            end
    end,
    ok;

%%坐标传送
handle(?U2GS_Transfer2NewPos, #pk_U2GS_Transfer2NewPos{mapID = MapID, x = PosX, y = PosY} = _PK) ->
    case core:isCross() of
        false ->
            ActStatus = playerState:getActionStatus(),
            case ActStatus =:= ?CreatureActionStatusDead orelse playerState:isPlayerBattleStatus() of
                true ->  %%战斗和死亡状态不让传送
                    sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailedPlayerDeadOrBattle);
                _ ->
                    case playerScene:canTransferMapAndSetNewTransferInfo() of
                        true ->
                            playerMap:transfer2NewPos(MapID, PosX, PosY);
                        false ->
                            sendErrorCodeMsg(?ErrorCode_SystemTransferMapCD)
                    end
            end;
        _ ->
            ?ERROR("CMD_U2GS_Transfer2NewPos:~p,~p", [playerState:getRoleID(), MapID]),
            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
    end,
    ok;

%%瞬间移动
handle(?U2GS_Telesport, #pk_U2GS_Telesport{x = Tx, y = Ty}) ->
    playerMap:telesport(Tx, Ty),
    ok;

%%聊天
handle(?U2GS_ChatInfo, #pk_U2GS_ChatInfo{} = P) ->
    playerChat:onPlayerChatMsg(P),
    ok;

%% 请求npc商店商品列表
handle(?U2GS_LookInfoItemListAtNpcStore, #pk_U2GS_LookInfoItemListAtNpcStore{npccode = NpcCode}) ->
    
    R = playerShop:getItemList(NpcCode),
    ?DEBUG("R===============~p~n", [R]),
    ok;

%% 请求指定商店商品列表
handle(?U2GS_LookInfoItemListAtShopID, #pk_U2GS_LookInfoItemListAtShopID{shopID = ShopID}) ->
    
    R = playerShop:sendStoreToClient(ShopID),
    ?DEBUG("R===============~p~n", [R]),
    ok;

%% 购买npc商店商品
handle(?U2GS_BuyItemAtNpcStoreRequest, #pk_U2GS_BuyItemAtNpcStoreRequest{npccode = NpcCode, itemid = ItemID, number = Number}) ->
    
    playerShop:buyItem(NpcCode, ItemID, Number),
    ok;

%% 购买指定商店商品
handle(?U2GS_BuyItemAtShopIDRequest, #pk_U2GS_BuyItemAtShopIDRequest{shopID = ShopID, itemid = ItemID, number = Number}) ->
    
    playerShop:buyItemWithShopID(ShopID, ItemID, Number),
    ok;

%% 购买军团商品
handle(?U2GS_BuyItemAtGuildShopRequest, #pk_U2GS_BuyItemAtGuildShopRequest{itemid = ItemID, number = Number}) ->
    
    playerShop:buyGuildItem(ItemID, Number),
    ok;

%% 便捷购买道具
handle(?U2GS_ConvenientBuyItem, #pk_U2GS_ConvenientBuyItem{itemid = ItemID, buynumber = Number}) ->
    
    playerShop:buyConvenientItem(ItemID, Number),
    ok;

%% 请求神秘商店商品列表
handle(?U2GS_RequestMysteriousShop, #pk_U2GS_RequestMysteriousShop{}) ->
    
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_SecretShopBtn) of
        true ->
            playerMSShop:requestMysteriousShop();
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;

%% 请求购买神秘商店商品
handle(?U2GS_BuyMysteriousShopItem, #pk_U2GS_BuyMysteriousShopItem{} = Pk) ->
    
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_SecretShopBtn) of
        true ->
            playerMSShop:buyMysteriousShopItem(Pk);
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;

%% 请求刷新神秘商店
handle(?U2GS_FreshMSShop, #pk_U2GS_FreshMSShop{} = _Pk) ->
    
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_SecretShopBtn) of
        true ->
            playerMSShop:freshMSShop();
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;

%% 技能槽技能改变
handle(?U2GS_ChangeSkillSlotRequest, #pk_U2GS_ChangeSkillSlotRequest{changeType = Type,
    changeSkillInfo = SkillInfo} = _Data) ->
%%	?WARN_OUT("CMD_U2GS_ChangeSkillSlotRequest roleid:~p msg:~p",[playerState:getRoleID(),Data]),
    playerSkillLearn:operateSlot(Type, SkillInfo),
    ok;

%%改变限时称号装备
handle(?U2GS_ChangeLimiteTitleState, #pk_U2GS_ChangeLimiteTitleState{titleID = TitleID} = _Pk) ->
    playerTitle:changeLimittimeTitle(TitleID),
    ok;

%%改变称号或效果的装配状态
handle(?U2GS_ChangeTitleState, #pk_U2GS_ChangeTitleState{} = Pk) ->
    playerTitle:changeFitState(Pk),
    ok;

%%改变自定义称号的内容
handle(?U2GS_ChangeCustomTitleText, #pk_U2GS_ChangeCustomTitleText{} = Pk) ->
    playerTitle:changeTitleText(Pk),
    ok;
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
handle(?U2GS_TeamOp, #pk_U2GS_TeamOp{operateType = Type, operatedID = ID, param1 = P1}) ->
%%	
    playerTeam:teamOperate(Type, ID, P1),
    ok;
handle(?U2GS_NoticeLeader, #pk_U2GS_NoticeLeader{}) ->
%%	
    playerTeam:noticeLeader(),
    ok;
handle(?U2GS_AckInviteJoinTeam, #pk_U2GS_AckInviteJoinTeam{inviterPlayerID = InviteID, isAgree = Ack}) ->
%%	
    playerTeam:ackInviteMeJoin(InviteID, Ack),
    ok;
handle(?U2GS_QuickTeamMatch, #pk_U2GS_QuickTeamMatch{mapList = MapList}) ->
    
    playerTeam:matchTeam(MapList),
    ok;
handle(?U2GS_QueryTeamList, #pk_U2GS_QueryTeamList{mapIDList = MapList}) ->
%%	
    playerTeam:queryTeamList(MapList),
    ok;
handle(?U2GS_QueryTeamListThisLine, #pk_U2GS_QueryTeamListThisLine{}) ->
%%	
    playerTeam:queryTeamListThisLine(),
    ok;
handle(?U2GS_QueryRoleList, #pk_U2GS_QueryRoleList{queryType = Type}) ->
%%	
    playerTeam:queryRole(Type),
    ok;
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 队伍操作
%%handle(?U2GS_OperateTeam, #pk_U2GS_OperateTeam{teamType = TeamType, operateType = OperateType, operatedID = OperatedID}) ->
%%	playerTeam2:handleTeamRequest(TeamType, OperateType, OperatedID),
%%	ok;
%%
%%%% 队伍邀请回复
%%handle(?U2GS_AckInviteTeam, #pk_U2GS_AckInviteTeam{teamType = TeamType, isAgree = Agree,
%%	inviteType = InviteType, inviterPlayerID = InviterID}) ->
%%	?DEBUG("agree ~p, inviteType ~p, inviterPlayerID ~p", [Agree, InviteType, InviterID]),
%%	playerTeam2:handleTeamRequestAck(TeamType, InviteType, Agree, InviterID),
%%	ok;
%%%% 客户端请求队友战斗力
%%handle(?U2GS_RequestFightingCapacity, #pk_U2GS_RequestFightingCapacity{}) ->
%%	playerTeam2:sendFightingCapacity(),
%%	ok;
%%%%
%%handle(?U2GS_IsOpenMapPanel, #pk_U2GS_IsOpenMapPanel{isOpen = IsOpen}) ->
%%	playerState:setIsOpenMapPanel(IsOpen),
%%	ok;
%%%% 队员离队
%%handle(?U2GS_LeaveAwayTeam, #pk_U2GS_LeaveAwayTeam{teamType = TeamType}) ->
%%	?DEBUG("CMD_U2GS_LeaveAwayTeam ~p", [?U2GS_LeaveAwayTeam]),
%%	playerTeam2:leaveTeam(TeamType),
%%	ok;
%%%% 发起快速组队
%%handle(?U2GS_QuickTeamStart, #pk_U2GS_QuickTeamStart{mapID = MapID}) ->
%%	playerTeam2:quickTeamStart(MapID),
%%	ok;
%%%%% 快速加队伍
%%handle(?U2GS_QuickJoinTeam, #pk_U2GS_QuickJoinTeam{roleID = RoleID, mapID = MapID}) ->
%%	playerTeam2:quickJoin(RoleID, MapID),
%%	ok;
%%%% 查询附近队伍
%%handle(?U2GS_RequestNearByTeamInfo, #pk_U2GS_RequestNearByTeamInfo{teamType = TeamType}) ->
%%	?DEBUG("CMD_U2GS_RequestNearByTeamInfo ~p", [?U2GS_RequestNearByTeamInfo]),
%%	playerTeam2:getNearByTeam(TeamType),
%%	ok;
%%%% 查询附近玩家（用于组队）
%%handle(?U2GS_NearbyPlayer_Request, #pk_U2GS_NearbyPlayer_Request{}) ->
%%	?DEBUG("CMD_U2GS_NearbyPlayer_Request", []),
%%	playerTeam2:getNearByPlayer(),
%%	ok;
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%移动物品处理
handle(?MoveGoods, #pk_MoveGoods{itemUID = ItemUID, target = TargetType, source = SourceType}) ->
    playerPackage:goodsMove(ItemUID, TargetType, SourceType),
    ok;

%%一键出售装备
handle(?U2GS_SellAllEquip, #pk_U2GS_SellAllEquip{}) ->
    
    playerPackage:sellAllPoorEquip(),
    %%策划设定一键出售装备后整理一次装备背包
    playerPackage:sortBag(?Item_Location_Equip_Bag),
    ok;

%%翅膀升级，本来是走物品使用的，但客户端取uid等困难，所以包装了个入口
handle(?U2GS_WingRise, #pk_U2GS_WingRise{itemID = ItemID, itemNum = ItemNum, firstBind = IsOnlyBindInt}) ->
    
    OldExp = playerState:getWingExpAccPerItemUse(),
    %%0是混合使用；1是只绑定
    IsOnlyBind = IsOnlyBindInt =:= 1,

    playerPackage:useItemByID(ItemID, ItemNum, IsOnlyBind),
    NewExp = playerState:getWingExpAccPerItemUse(),
    player_pub:send_net_msg(#pk_GS2U_WingRise{
        itemID = ItemID,
        expChange = NewExp - OldExp
    }),
    %%重置
    playerState:setWingExpAccPerItemUse(0),
    ok;

%使用背包物品
handle(?U2GS_UseItem, #pk_U2GS_UseItem{itemUID = UID, useNum = Num}) ->
    case erlang:is_integer(Num) andalso Num > 0 of
        true ->
            playerItem:useBagItem(UID, Num, ?ItemUseReasonPlayer, UID);
        _ ->
            skip
    end,
    ok;

%使用增加婚姻title的道具
handle(?U2GS_UseMarriageTitleItem, #pk_U2GS_UseMarriageTitleItem{useNum = Num} = Pk) ->
    case erlang:is_integer(Num) andalso Num > 0 of
        true ->
            playerTitle:useItemToAddTitle(Pk);
        _ ->
            skip
    end,
    ok;

handle(?U2GS_PetLevelUp, #pk_U2GS_PetLevelUp{petID = PetID, itemUID = ItemID, useNum = Num}) ->
    
    case Num > 0 andalso PetID > 0 of
        true ->
            playerPet:petLevelUp(PetID, ItemID, Num);
%%			playerState:setLevelUpPetID(PetID),
%%			playerItem:useBagItem(UID, Num, ?ItemUseReasonPlayer, UID);
        _ ->
            skip
    end,
    ok;
%使用星月秘盒
handle(?U2GS_UseStarMoonBox, #pk_U2GS_UseStarMoonBox{itemUID = UID, useNum = Num}) ->
    
    case erlang:is_integer(Num) andalso Num > 0 andalso playerPackage:getBagIdleSlotNum(?Item_Location_Bag) >= Num of
        true ->

            [{CostItemId, _CostNum}] =
                case getCfg:getCfgByArgs(cfg_globalsetup, starmoonbox_cost) of
                    #globalsetupCfg{setpara = V} ->
                        V;
                    _ ->
                        []
                end,

            KeyNum = playerPackage:getItemNumByID(CostItemId),
            PLog_0 = #recPLogTSItem{
                old = KeyNum,
                new = KeyNum - Num,
                change = Num,
                target = ?PLogTS_StarMoon,
                source = ?PLogTS_PlayerSelf,
                gold = 0,
                goldtype = 0,
                changReason = ?ItemUseReasonPlayer,
                reasonParam = CostItemId
            },

            case playerPackage:getGoodsNumByID(?Item_Location_Bag, CostItemId) >= Num of
                true ->
                    case playerItem:useBagItem(UID, Num, ?ItemDeleteReasonUsed, UID) of
                        ok ->
                            playerPackage:delGoodsByID(?Item_Location_Bag, CostItemId, Num, PLog_0);
                        _ ->
                            skip
                    end;
                _ ->
                    false
            end;
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag)
    end,
    ok;


%% 背包开启空格子
handle(?OpenNewBagSlot, #pk_OpenNewBagSlot{bagType = BagType, openNum = OpenNum}) ->
    
    ?DEBUG("open new bag type ~p slot num ~p", [BagType, OpenNum]),
    playerPackage:openSlot(BagType, OpenNum),
    ok;

%% 背包整理
handle(?U2GS_SortItem, #pk_U2GS_SortItem{type = BagType}) ->
    playerPackage:sortBag(BagType),
    ok;

%%采集物品请求
handle(?U2GS_CollectObj, #pk_U2GS_CollectObj{code = Code}) ->
    case playerBattle:canGainDropGoods() of
        true ->
            GatherID = playerTask:getCollectObjectIDByCode(Code),
            case GatherID > 0 of
                true ->
                    case getCfg:getCfgPStack(cfg_object, GatherID) of
                        #objectCfg{} ->
                            playerGather:requestGatherItem(Code, GatherID);
                        _ ->
                            skip
                    end;
                _Error ->
                    skip
            end;
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemGatherFailed)
    end,
    ok;

%%任务使用物品请求
handle(?U2GS_UseItemObj, #pk_U2GS_UseItemObj{code = Code}) ->
%%	playerTask2:updateUseItemTask(Code),
    
    playerTask:updateTask(?TaskSubType_UseItem, Code),
    ok;

%%装备重铸和替换
handle(?U2GS_EquipRecast, #pk_U2GS_EquipRecast{equipPos = EquipPos}) ->
    
    playerEquipRecast:equipRecast(EquipPos),
    ok;
%%符石重铸
handle(?U2GS_EquipRecastAdvance, #pk_U2GS_EquipRecastAdvance{equipPos = EquipPos, pos = PropPos}) ->
    
    playerEquipRecast:equipRecast(EquipPos, PropPos),
    ok;

%%装备精炼
handle(?U2GS_EquipRefine, #pk_U2GS_EquipRefine{type = Type, goodluckCharmId = GoodluckCharmId}) ->
    
    case playerMainMenu:isOpen(?ModeType_Intensify) of
        true ->
            playerEquip:equipRefine(Type, true, GoodluckCharmId);
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;

%%装备一键精炼(策划说去掉http://192.168.2.32:8080/browse/LUNA-4639)
handle(?U2GS_EquipRefineOneKey, #pk_U2GS_EquipRefineOneKey{}) ->
%%	case playerMainMenu:isOpen(?ModeType_Intensify) of
%%		true ->
%%			playerEquip:equipRefineOneKey();
%%		_ ->
%%			sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
%%	end,
    ok;

%%装备冲星
handle(?U2GS_EquipUpStar, #pk_U2GS_EquipUpStar{pos = Pos, type = Type}) ->
    
    case playerMainMenu:isOpen(?ModeType_UpStar) andalso variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_equipStar) of
        true ->
            playerEquip:allEquipUpStar(Pos, Type);
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;

%%装备荣誉成长
handle(?U2GS_HonorLevel, #pk_U2GS_HonorLevel{}) ->
    %%playerEquip:equipHonorLevel(),
    ok;

%%玩家共享装备
handle(?U2GS_SharedEquip, #pk_U2GS_SharedEquip{equipUIDs = EquipUIDs}) ->
    playerEquip:sharedEquip(EquipUIDs),
    ok;

%%共享装备的查看
handle(?U2GS_QueryEquipByUID, #pk_U2GS_QueryEquipByUID{} = Pk) ->
    playerItemTips:queryItemTips(Pk),
    ok;

%%装备分解
handle(?U2GS_EquipResolve, #pk_U2GS_EquipResolve{equipUIDs = EquipUIDList}) ->
    
    Fun =
        fun(EquipUID, [PurpleEssenceCfg, GoldenEssenceCfg, List]) ->
            case playerEquip:equipResolve(EquipUID) of
                [PurpleEssence, GoldenEssence, ItemList] ->
                    [PurpleEssence + PurpleEssenceCfg, GoldenEssence + GoldenEssenceCfg, ItemList ++ List];
                _ ->
                    [PurpleEssenceCfg, GoldenEssenceCfg, List]
            end
        end,
    [PurpleEssenceNum, GoldenEssenceNum, ReturnItemList] = lists:foldl(Fun, [0, 0, []], EquipUIDList),
    case PurpleEssenceNum =/= 0 orelse GoldenEssenceNum =/= 0 orelse ReturnItemList =/= [] of
        true ->
            %%添加装备分解成就统计
            playerAchieve:achieveEvent(?Achieve_BreakDown, [length(EquipUIDList)]),
            PkItemList = [#pk_washReturnItemInfo{itemID = ItemID, itemNum = ItemNum} || {ItemID, ItemNum} <- ReturnItemList],
            player_pub:send_net_msg(#pk_GS2U_GetEssenceNum{purpleEssence = PurpleEssenceNum, goldenEssence = GoldenEssenceNum, itemList = PkItemList});
        false ->
            sendErrorCodeMsg(?ErrorCode_BagEquipResolvefailed)  %%分解失败
    end,
    ok;
handle(?U2GS_WashEquip, #pk_U2GS_WashEquip{equipPos = Pos, propID = PropID, propValue = PV, index = Index}) ->
    
    %% playerEquipWash:equipWash(Pos, PropID, PV, Index), LUNA-9072
    ok;
%%资源兑换列表
handle(?U2GS_RequestExchangeResource, #pk_U2GS_RequestExchangeResource{}) ->
    
    playerShop:sendAllExchangeResource(),
    ok;

%%请求资源交换中，玩家已经兑换过的终身限兑的配置id
handle(?U2GS_RequestExchangeResourceForeverLimitID, #pk_U2GS_RequestExchangeResourceForeverLimitID{}) ->
    
    IDList = playerShop:getMyHasForeverLimitID(),
    Msg = #pk_GS2U_RequestExchangeResourceForeverLimitIDAck{iDList = IDList},
    player_pub:send_net_msg(Msg),
    ok;

%%请求记录的标志配置id(可复用)
handle(?U2GS_RequesForeverLimitID, #pk_U2GS_RequesForeverLimitID{type = Type}) ->
    IDList = playerShop:getMyHasForeverLimitID(Type),
    Msg = #pk_GS2U_RequestForeverLimitIDAck{type = Type, iDList = IDList},
    player_pub:send_net_msg(Msg),
    
    ok;

%%请求爵位购买配置id项(可复用)
handle(?U2GS_RequesBuyID, #pk_U2GS_RequesBuyID{}) ->
    ok;

%%请求装备合成操作
handle(?U2GS_EqupmentCombin, #pk_U2GS_EqupmentCombin{combinID = ID, combinNum = CombinNum, equpmentUIDList = EqupmentUIDList}) ->
    
    Succ = playerShop:resourceExchange4Equpment(ID, CombinNum, EqupmentUIDList),
    case Succ of
        ok ->
            skip;
        _ ->
            player_pub:send_net_msg(#pk_GS2U_EqupmentCombinAck{
                combinID = ID,
                success = Succ,
                items = []
            })
    end,
    ok;

%%远程玩家属性查看
handle(?U2GS_LookRPInfo_Request, #pk_U2GS_LookRPInfo_Request{roleID = RoleID, view_type = Type}) ->
    playerRPView:queryRPInfo(RoleID, Type),
    ok;

%%天梯1v1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 打开天梯1v1
handle(?U2GS_OpenLadder1v1, #pk_U2GS_OpenLadder1v1{}) ->
    
    playerLadder1v1:openLadder1v1(),
    ok;

%% 刷新对手(返回 GS2U_LadderTargetList)
handle(?U2GS_FreshLadderTargetList, #pk_U2GS_FreshLadderTargetList{}) ->
    
    playerLadder1v1:freshLadderList(),
    ok;

%% 按排名挑战对手
handle(?U2GS_ChallengeTargetByRank, #pk_U2GS_ChallengeTargetByRank{ranksort = RankSort, name = TargetName}) ->
    
    case playerState:getCurHp() =< 0 of
        true ->
            sendErrorCodeMsg(?ErrorCode_Ladder1v1_PleaseWait);
        _ ->
            playerLadder1v1:protocol_ChallengeTargetByRank(RankSort, TargetName)
    end,
    ok;

%% 按对象挑战对手
handle(?U2GS_ChallengeTargetByRoleID, #pk_U2GS_ChallengeTargetByRoleID{roleID = RoleID}) ->
    
    case playerState:getCurHp() =< 0 of
        true ->
            sendErrorCodeMsg(?ErrorCode_Ladder1v1_PleaseWait);
        _ ->
            playerLadder1v1:challengeTargetByRoleID(RoleID)
    end,
    ok;

%% 放弃挑战
handle(?U2GS_GiveUpChallenge, #pk_U2GS_GiveUpChallenge{}) ->
    
    playerLadder1v1:giveUpChallenge(),
    ok;

%% 获取对象的模型相关信息(返回rank.h GS2U_SendPropList 这个协议)
handle(?U2GS_RequestPlayerInfo, #pk_U2GS_RequestPlayerInfo{roleID = RID}) ->
    playerLadder1v1:requestPlayerInfo(RID),
    ok;

%% 请求王者列表
handle(?U2GS_RequestKingList, #pk_U2GS_RequestKingList{}) ->
    
    playerLadder1v1:requestKingList(),
    ok;

%% 膜拜王者
handle(?U2GS_WorshipTarget, #pk_U2GS_WorshipTarget{roleID = RID, roleName = RoleName}) ->
    
    playerLadder1v1:worshipTarget(RID, RoleName),
    ok;

%% 请求对战记录
handle(?U2GS_RequestBattleNotes, #pk_U2GS_RequestBattleNotes{}) ->
    
    playerLadder1v1:requestBattleNotes(),
    ok;

%%天梯1v1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 申请单人护送
handle(?U2GS_RequestEscortSolo, #pk_U2GS_RequestEscortSolo{}) ->
    
    playerEscort:requestEscortSolo(),
    ok;
%% 申请多人护送
handle(?U2GS_RequestEscortTeam, #pk_U2GS_RequestEscortTeam{}) ->
    
    playerEscort:requestEscortTeam(),
    ok;
%% 申请劫掠
handle(?U2GS_RequestEscortRob, #pk_U2GS_RequestEscortRob{sequenceNumber = Number}) ->
    
    playerEscort:requestEscortRob(Number),
    ok;
%% 请求多人护送列表
handle(?U2GS_RequestEscortList, #pk_U2GS_RequestEscortList{}) ->
    
    playerEscort:requestEscortTeamList(),
    ok;
%% 触发了一个事件(服务器通知客户端触发一个事件，客户端响应则回复同样的协议)
handle(?GS2U_TriggerEvent, #pk_GS2U_TriggerEvent{}) ->
    
    playerEscort:acceptTriggerEvent(),
    ok;

%% 请求黑暗之地初始信息(打开界面)
handle(?U2GS_RequestDarknessInfo, #pk_U2GS_RequestDarknessInfo{}) ->
    
    playerDarkness:requestDarknessInfo(),
    ok;
%% 请求入口列表
handle(?U2GS_RequestEntrance, #pk_U2GS_RequestEntrance{}) ->
    
    playerDarkness:requestEntrance(),
    ok;
%% 进入黑暗之地(进入失败，自动加入排队)
handle(?U2GS_RequestEnterDarkness, #pk_U2GS_RequestEnterDarkness{entrance = Entrance}) ->
    
    playerDarkness:requestEnterDarkness(Entrance),
    ok;
%% 请求自己的信息
handle(?U2GS_SelfDarkness, #pk_U2GS_SelfDarkness{}) ->
    
    playerDarkness:selfDarkness(),
    ok;
%% 请求打开势力选择界面
handle(?U2GS_OpenSelectCamp, #pk_U2GS_OpenSelectCamp{}) ->
    playerDarkness:openSelectCamp(),
    ok;
%% 选择势力
handle(?U2GS_SelectCamp, #pk_U2GS_SelectCamp{camp = Camp}) ->
    
    playerDarkness:selectCamp(Camp),
    ok;
%% 请求黑暗之地排行榜
handle(?U2GS_DarknessRank, #pk_U2GS_DarknessRank{}) ->
    
    playerDarkness:darknessRank(),
    ok;

%% 打开占卜界面
handle(?U2GS_OpenLotteryForm, #pk_U2GS_OpenLotteryForm{}) ->
    
    playerLottery:openLotteryForm(),
    ok;

%% 占卜
handle(?U2GS_RequestLottery, #pk_U2GS_RequestLottery{isGold = IsGold, isFree = IsFree, number = N}) ->
    
    playerLottery:requestLottery(IsGold, IsFree, N),
    ok;

%%
handle(?U2GS_RequestLotteryResetTime, #pk_U2GS_RequestLotteryResetTime{}) ->
    
    playerLottery:sendResetTime(),
    ok;

%%资源兑换
handle(?U2GS_ResourceExchange, #pk_U2GS_ResourceExchange{id = ID, itemCount = ItemCount, opType = OpType}) ->
    
    ?DEBUG("roleID=~p,ID=~p,ItemCount=~p,OpType=~p", [playerState:getRoleID(), ID, ItemCount, OpType]),
    playerShop:resourceExchange(ID, ItemCount, OpType),
    ok;

%%请求线路列表
handle(?U2GS_RequestMapLineList, #pk_U2GS_RequestMapLineList{mapID = MapID}) ->
    playerScene:requestMapLineList(MapID),
    ok;

%%请求切线
handle(?U2GS_RequestEnterMapLine, #pk_U2GS_RequestEnterMapLine{mapID = MapID, lineID = 0}) ->
    case core:isCross() of
        false ->
            playerScene:requestEnterMapLine(MapID, 0);
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_ChangeMapLineFailed)
    end,
    ok;

handle(?U2GS_RequestEnterMapLine, #pk_U2GS_RequestEnterMapLine{mapID = MapID, lineID = LineID}) ->
    CD = playerPropSync:getProp(?PriProp_ChangeLineCD),
    case time2:getLocalTimestampSec() >= CD of
        true ->
            case core:isCross() of
                false ->
                    playerScene:requestEnterMapLine(MapID, LineID);
                _ ->
                    playerMsg:sendErrorCodeMsg(?ErrorCode_ChangeMapLineFailed)
            end;
        _ ->
            %% 提示切换线路CD中
            playerMsg:sendErrorCodeMsg(?ErrorCode_ForbidChangeMapLine)
    end,
    ok;

%%阅读邮件
handle(?U2GS_ReadMail, #pk_U2GS_ReadMail{mailID = MailID}) ->
    
    playerMail:readMail(MailID),
    ok;

%%玩家发送邮件
handle(?U2GS_SendMail, #pk_U2GS_SendMail{}) ->
    %%客户端发的名字有可能前后有空格，这里需要处理一下
    
%%	Name = string:strip(ToRoleName, both, 32),
%%	playerMail:newMail(Name, Title, Content, ""),
    ok;

%%锁定邮件
handle(?U2GS_LockMail, #pk_U2GS_LockMail{}) ->
    
    %% LUNA-7721 【服务器】移除邮件锁定功能
    %%playerMail:lockMail(MailID),
    ok;

%%解锁邮件
handle(?U2GS_UnlockMail, #pk_U2GS_UnlockMail{}) ->
    
    %% LUNA-7721 【服务器】移除邮件锁定功能
    %%playerMail:unlockMail(MailID),
    ok;

%%获取邮件附件中的货币
handle(?U2GS_GetMailCoin, #pk_U2GS_GetMailCoin{mailID = MailID}) ->
    
    case playerMail:inGetMailAttachMentCD() of
        false ->
            playerMail:getMailCoin(MailID);
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnErrorCd)
    end,
    ok;

%%获取邮件附件中的道具
handle(?U2GS_GetMailItem, #pk_U2GS_GetMailItem{mailID = MailID, itemUID = _ItemUID}) ->
    
    case playerMail:inGetMailAttachMentCD() of
        false ->
            playerMail:getMailItem(MailID);
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnErrorCd)
    end,
    ok;

%%一健提取
handle(?U2GS_GetMailItemAll, #pk_U2GS_GetMailItemAll{}) ->
    
%%	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
    case playerMail:inGetMailAttachMentCD() of
        false ->
            playerMail:getMailItemAll();
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnErrorCd)
    end,
    ok;

%%删除一键提取的邮件
handle(?U2GS_GetDeleteMails, #pk_U2GS_GetDeleteMails{mailIDs = MailIDs}) ->
    
    playerMail:deleteAllMails(MailIDs),
    ok;


%%删除指定邮件
handle(?U2GS_DeleteMail, #pk_U2GS_DeleteMail{mailID = MailID}) ->
    
    playerMail:deleteMail(MailID),
    ok;

%%删除所有已读且无附件的邮件
handle(?U2GS_DeleteAllReadMail, #pk_U2GS_DeleteAllReadMail{}) ->
    
    playerMail:deleteAllReadMail(),
    ok;

%%选中某个对象
handle(?U2GS_SelectTarget, #pk_U2GS_SelectTarget{code = SelectCode}) ->
    %%?DEBUG("~ts [~p] select target ~p", [playerState:getName(),playerState:getPlayerCode(), SelectCode]),
    playerState:setSelectTargetCode(SelectCode),
    ok;

%%单独请求某个看不见的对象
handle(?U2GS_QueryTargetObject, #pk_U2GS_QueryTargetObject{targetCode = _TargetCode}) ->
%%	playerMap:querySyncTargetCode(TargetCode),
    ok;

%% 宠物升星
handle(?U2GS_UpStartPet, #pk_U2GS_UpStartPet{petID = PetID}) ->
    
    playerPet:petUpStar(PetID);

%% 宠物洗炼技能
handle(?U2GS_PetSkillCast, #pk_U2GS_PetSkillCast{petID = PetID, skillIDs = SkillIDs}) ->
    
    playerPet:petSkillCast(PetID, SkillIDs);

%% 宠物技能替换
handle(?PetSkillReplace, #pk_PetSkillReplace{petID = PetID}) ->
    
    playerPet:petSkillReplace(PetID);

%% 宠物切换
handle(?PetSwitch, #pk_PetSwitch{petId = PetID}) ->
    playerPet:petSwitch(PetID);

%%宠物装备强化
handle(?U2GS_PetStr, #pk_U2GS_PetStr{equipID = EquipID, type = Type}) ->
    
    case Type of
        0 -> %%普通强化
            playerPet:petSEquipStr(EquipID);
        1 -> %%一键强化
            playerPet:petQEquipStr(EquipID)
    end;

%%宠物改名
handle(?PetReName, #pk_PetReName{petID = PetID, name = Name}) ->
    
    playerPet:petReName(PetID, Name);

%%宠物转生
handle(?U2GS_RawPet, #pk_U2GS_RawPet{petID = PetID}) ->
    
    playerPet:petTurnRaw(PetID);

%%宠物属性提升
handle(?U2GS_PetAddAtta, #pk_U2GS_PetAddAtta{petID = PetID, num = Num}) ->
    
    %% playerPet:petAttaAdd(PetID, Num); LUNA-9069
    skip;

%%宠物属性保存
handle(?U2GS_PetAttaSave, #pk_U2GS_PetAttaSave{petID = PetID}) ->
    %% playerPet:petAttaSave(PetID); LUNA-9069
    skip;

%%% 宠物精灵
%handle(?U2GS_QueryPetFairyInfo, #pk_U2GS_QueryPetFairyInfo{}) ->
%	playerPetFairy:queryFairy();

%% 上坐骑
handle(?U2GS_OnMountPet, #pk_U2GS_OnMountPet{}) ->
    case playerState:getActionStatus() of
        ?CreatureActionStatusChangeMap ->
            ?ERROR("[DebugForPet] roleID:~w want pk_U2GS_OnMountPet when ChangeMap MapID:~w", [playerState:getRoleID(), playerState:getMapID()]),
            skip;
        _ ->
            playerPet:petOnMount()
    end;

%% 下坐骑
handle(?U2GS_OffMountPet, #pk_U2GS_OffMountPet{}) ->
    case playerState:getActionStatus() of
        ?CreatureActionStatusChangeMap ->
            ?ERROR("[DebugForPet] roleID:~w want pk_U2GS_OffMountPet when ChangeMap MapID:~w", [playerState:getRoleID(), playerState:getMapID()]),
            skip;
        _ ->
            playerPet:petOffMount(true)
    end;
%% 下坐骑
handle(?U2GS_DoublePetMountInvite, #pk_U2GS_DoublePetMountInvite{tarRoleID = RoleID}) ->
    case playerState:getActionStatus() of
        ?CreatureActionStatusChangeMap ->
            ?ERROR("[DebugForPet] roleID:~w want pk_U2GS_DoublePetMountInvite when ChangeMap MapID:~w tarRoleID:~w", [playerState:getRoleID(), playerState:getMapID(), RoleID]),
            skip;
        _ ->
            playerPetDouble:inviteDoubleMount(RoleID)
    end;
handle(?U2GS_DoublePetMountInviteAck, #pk_U2GS_DoublePetMountInviteAck{agree = Agree, srcRoleID = RoleID}) ->
    case playerState:getActionStatus() of
        ?CreatureActionStatusChangeMap ->
            ?ERROR("[DebugForPet] roleID:~w want pk_U2GS_DoublePetMountInviteAck when ChangeMap MapID:~w agree:~w srcRoleID:~w", [playerState:getRoleID(), playerState:getMapID(), Agree, RoleID]),
            skip;
        _ ->
            playerPetDouble:inviteDoubleMountAck(RoleID, Agree)
    end;

%% 显示坐骑
handle(?U2GS_ShowMountPet, #pk_U2GS_ShowMountPet{}) ->
    playerPet:petShow();

%% 隐藏坐骑
handle(?U2GS_HideMountPet, #pk_U2GS_HideMountPet{}) ->
    playerPet:petHide();

%% 宠物助战
handle(?U2GS_PetAssistBattle, #pk_U2GS_PetAssistBattle{slot = Slot, petID = PetID, status = Status}) ->
    
    playerPet:petAssistBattle(Slot, PetID, Status);

%% 使用宠物技能书
handle(?U2GS_UsePetSkillBook, #pk_U2GS_UsePetSkillBook{petID = PetID, petSkillId = SkillID, itemid = ItemID}) ->
    
    playerPet:petFixCast(PetID, SkillID, ItemID);


%% 宠物强制消失
handle(?U2GS_PetDisapear, #pk_U2GS_PetDisapear{code = Code}) ->
    playerPet:petDisapear(Code);

%% 宠物技能操作
handle(?U2GS_PetSkillOperate, #pk_U2GS_PetSkillOperate{operationType = Type, petID = PetID, petSkillId = SkillID}) ->
    
    playerPetSkill:petSkillOperate(Type, PetID, SkillID);

%% 宠物重置
handle(?U2GS_ResetPet, #pk_U2GS_ResetPet{petID = PetID}) ->
    
    playerPetReset:resetPet(PetID);

%%进入副本
handle(?U2GS_EnterCopyMap, #pk_U2GS_EnterCopyMap{copyMapID = CopyMapID}) ->
    case playerCopyMap:canEnterCopyMap(CopyMapID) of
        true ->
            playerCopyMap:enterCopyMap(CopyMapID);
        ErrorCode ->
            sendErrorCodeMsg(ErrorCode)
    end,
    ok;

%%离开副本
handle(?U2GS_LeaveCopyMap, #pk_U2GS_LeaveCopyMap{type = Type}) ->
    playerAcKingBattleAll:onLevelKingBattleMap(),
    Ret = playerCopyMap:leaveCopyMap(),
    case Ret =:= true andalso Type =:= 1 of
        true ->
            playerTeamCopyMap:leaveCopyMapInitiative(false);
        _ ->
            skip
    end,
    ok;

%%重置副本
handle(?U2GS_ResetCopyMap, #pk_U2GS_ResetCopyMap{copyMapID = CopyMapID}) ->
    playerCopyMap:resetCopyMap(CopyMapID),
    ok;

%%副本动画结束
handle(?U2GS_CopyMapSchedulePlayAnimationOver, #pk_U2GS_CopyMapSchedulePlayAnimationOver{animationID = AN}) ->
    playerCopyMap:playAnimationOver(AN),
    ok;

handle(?U2GS_CopyMapSchedulePlayCharacterOver, #pk_U2GS_CopyMapSchedulePlayCharacterOver{schedule = Schedule}) ->
    psMgr:sendMsg2PS(playerState:getMapPid(), characterPlayOver, {playerState:getGroupID(), Schedule}),
    ok;

%% 请求目标副本的最高分数
handle(?U2GS_RequestTargetCopyMapScore, #pk_U2GS_RequestTargetCopyMapScore{targetCopyMapID = TCopyMapID}) ->
    Score = playerCopyMapReward:getCopyMapMaxScore(TCopyMapID),
    player_pub:send_net_msg(#pk_GS2U_RequestTargetCopyMapScore{targetCopyMapID = TCopyMapID, highestScore = Score}),
    ok;

%% 玩家请求时空裂痕npc的信息
handle(?U2GS_RequestRiftNpcInfo, #pk_U2GS_RequestRiftNpcInfo{npcCode = _Code}) ->
    %%playerCopyMapRift:requestRiftNpcInfo(Code),
    ok;

%% 玩家请求进入时空裂痕
handle(?U2GS_RequestEnterRift, #pk_U2GS_RequestEnterRift{groupID = _GroupID, bitplaneMapID = _BMapID}) ->
    %%playerCopyMapRift:requestEnterRift(GroupID, BMapID),
    ok;

%% 请求加入混沌战场
handle(?U2GS_RequestJoinHDBattle, #pk_U2GS_RequestJoinHDBattle{}) ->
    case core:isCross() of
        false ->
            ?DEBUG("requestJoinHDBattle:~p", [playerState:getRoleID()]),
            MapID = playerState:getMapIDGroup(),
            case playerScene:getMapType(MapID) of
                ?MapTypeNormal ->
                    core:sendMsgToActivity(?ActivityType_HDBattle,
                        requestJoinHDBattle,
                        {
                            playerState:getRoleID(),
                            playerState:getName(),
                            playerState:getLevel(),
                            self(),
                            playerState:getNetPid(),
                            playerPropSync:getProp(?PriProp_PetForce) + playerPropSync:getProp(?PriProp_PlayerForce)
                        });
                _ ->
                    %% 不能从副本或者位面中进入混沌战场
                    sendErrorCodeMsg(?ErrorCode_ActivityHDEnterBattleFailed)
            end;
        _ ->
            ?ERROR("CMD_U2GS_RequestJoinHDBattle:~p", [playerState:getRoleID()]),
            sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
    end,
    ok;

%% 获取混沌战场击杀玩家排行榜数据
handle(?U2GS_KillRank, #pk_U2GS_KillRank{}) ->
    ?DEBUG("requestHDKillRank:~p", [playerState:getRoleID()]),
    core:sendMsgToActivity(?ActivityType_HDBattle, requestHDKillRank,
        {playerState:getRoleID(), playerState:getNetPid()}),
    ok;
%% 请求混沌战场当前状态
handle(?U2GS_RequestQueueNumber, #pk_U2GS_RequestQueueNumber{}) ->
    core:sendMsgToActivity(?ActivityType_HDBattle, requestQueueNumber,
        {playerState:getRoleID(), playerState:getNetPid()}),
    ok;

%% 取消报名混沌战场
handle(?U2GS_CancelApply, #pk_U2GS_CancelApply{}) ->
    core:sendMsgToActivity(?ActivityType_HDBattle, cancelApply,
        {playerState:getRoleID(), playerState:getNetPid()}),
    ok;

%%宝石镶嵌
handle(?U2GS_GemEmbedOn, #pk_U2GS_GemEmbedOn{}) ->
%%	playerPackage:gemEmbedOn(GemEmbedInfo),
    ok;

%%宝石拆卸
handle(?U2GS_GemEmbedOff, #pk_U2GS_GemEmbedOff{}) ->
%%	playerPackage:gemEmbedOff(GemUIDList),
    ok;

%%宝石合成(废弃)
handle(?U2GS_GemEmbedMake, #pk_U2GS_GemEmbedMake{}) ->
%%	Flg = case Flag of
%%			  0 ->
%%				  false;
%%			  _ ->
%%				  true
%%		  end,
%%	playerPackage:gemComposition(ItemID, Count, Flg),
    ok;


%%%%宝石合成(废弃)
handle(?U2GS_GemEmbedMakeOnce, #pk_U2GS_GemEmbedMakeOnce{id = ItemID}) ->
%%	playerPackage:gemCompositionOnce(ItemID, BindCount, UnBindCount),
    
    playerGem:gemOperate(4, 0, 0, ItemID),
    ok;

handle(?U2GS_GemOperate, #pk_U2GS_GemOperate{opType = Op, equipPos = EquipPos, gemPos = Slot, params = Params}) ->
    
    playerGem:gemOperate(Op, EquipPos, Slot, Params),
    ok;


%% 查询交易行订单
handle(?U2GS_QueryTrade, #pk_U2GS_QueryTrade{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
%% 查询最新交易订单
handle(?U2GS_QueryNewestTrade, #pk_U2GS_QueryNewestTrade{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
%% 查看上次搜索的订单的某一页
handle(?U2GS_NextResult, #pk_U2GS_NextResult{} = Pk) ->
    %% 这个不需要排序
    
    playerTrade:request(Pk),
    ok;
%% 排序
handle(?U2GS_ResultSort, #pk_U2GS_ResultSort{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
%% 查询自己的交易订单
handle(?U2GS_QuerySelfTrade, #pk_U2GS_QuerySelfTrade{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
%% 购买
handle(?U2GS_TradeBuy, #pk_U2GS_TradeBuy{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
%% 拒绝购买
handle(?U2GS_TradeRefuse, #pk_U2GS_TradeRefuse{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
%% 上架
handle(?U2GS_PutTrade, #pk_U2GS_PutTrade{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
%% 下架
handle(?U2GS_DownTrade, #pk_U2GS_DownTrade{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
handle(?U2GS_RequestDealRecord, #pk_U2GS_RequestDealRecord{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;
handle(?U2GS_ReferenceItem, #pk_U2GS_ReferenceItem{} = Pk) ->
    
    playerTrade:request(Pk),
    ok;

%% 请求指定公会信息
handle(?U2GS_RequestGuildInfo_Request, #pk_U2GS_RequestGuildInfo_Request{guildID = GuildID}) ->
    
    playerGuild:queryGuildInfo(GuildID, false),
    ok;

%% 请求指定角色的家族信息
handle(?U2GS_QueryGuildInfoByRoleID_Request, #pk_U2GS_QueryGuildInfoByRoleID_Request{roleID = RoleID}) ->
    
    playerGuild:queryGuildInfoByRoleID(RoleID),
    ok;

%% 查询允许快速加入的战力条件
handle(?U2GS_Guild_FastJoin_Get_Request, #pk_U2GS_Guild_FastJoin_Get_Request{guildID = GuildID}) ->
    
    playerGuild:fastJoin_Get(GuildID),
    ok;

%% 设置允许快速加入的战力条件
handle(?U2GS_Guild_FastJoin_Set_Request, #pk_U2GS_Guild_FastJoin_Set_Request{guildID = GuildID, force = Force}) ->
    
    playerGuild:fastJoin_Set(GuildID, Force),
    ok;

%% 快速加入请求
handle(?U2GS_Guild_FastJoin_Request, #pk_U2GS_Guild_FastJoin_Request{}) ->
    
    playerGuild:fastJoin(),
    ok;

%% 公会招募榜
handle(?U2GS_GuildList, #pk_U2GS_GuildList{requestPageNumber = Page} = _Pk) ->
    
    playerGuild:guildList(Page),
    ok;

%% 创建公会
handle(?U2GS_CreateGuild, #pk_U2GS_CreateGuild{guildName = GuildName, denoter = Denoter, guildNotice = Notice} = _Pk) ->
    
    playerGuild:createGuild(GuildName, Denoter, Notice),
    ok;

%% 解散公会
handle(?U2GS_DeleteGuild, #pk_U2GS_DeleteGuild{} = _Pk) ->
    
    playerGuild:deleteGuild(),
    ok;

%% 打开公会界面，获取数据
handle(?U2GS_OpenGuildForm, #pk_U2GS_OpenGuildForm{} = _Pk) ->
    
    playerGuild:openGuildForm(),
    ok;

%% 打开申请列表界面
handle(?U2GS_RequestJoinGuildList, #pk_U2GS_RequestJoinGuildList{} = _Pk) ->
    
    playerGuild:requestJoinGuildList(),
    ok;

%% 成员列表
handle(?U2GS_RequestLookMemberList, #pk_U2GS_RequestLookMemberList{requestPageNumber = Page} = _Pk) ->
    
    playerGuild:memberList(Page),
    ok;

%% 招募成员
handle(?U2GS_Recruit, #pk_U2GS_Recruit{targetCode = TargetCode} = _Pk) ->
    
    playerGuild:recruitPlayer(TargetCode),
    ok;

%% 招募结果
handle(?U2GS_AgreeRecruit, #pk_U2GS_AgreeRecruit{roleID = ZMRoleID, guildID = GuildID, agree = IsAgree} = _Pk) ->
    
    playerGuild:agreeRecruit(GuildID, ZMRoleID, IsAgree),
    ok;

%% 申请加入工会
handle(?U2GS_OneKeyRecruit_Request, #pk_U2GS_OneKeyRecruit_Request{} = _Pk) ->
    
    playerGuild:oneKeyRecruit(),
    ok;

%% 发布招募
handle(?U2GS_RequestJoinGuild, #pk_U2GS_RequestJoinGuild{guildID = GuildID} = _Pk) ->
    
    playerGuild:requestJoinGuild(GuildID),
    ok;

%% 同意或者拒绝申请者的加入
handle(?U2GS_DealRequestJoin, #pk_U2GS_DealRequestJoin{guildID = GuildID, roleIDs = RoleIDList, agree = IsAgree} = _Pk) ->
    
    playerGuild:dealRequestJoin(GuildID, RoleIDList, IsAgree),
    ok;

%% 退出工会
handle(?U2GS_ExitGuild, #pk_U2GS_ExitGuild{} = _Pk) ->
    
    playerGuild:exitGuild(),
    ok;

%% 踢出工会
handle(?U2GS_KickGuild, #pk_U2GS_KickGuild{targetRoleID = TargetID} = _Pk) ->
    
    playerGuild:kickGuild(TargetID),
    ok;

%% 赋予权限
handle(?U2GS_GivePower, #pk_U2GS_GivePower{targetRoleID = TargetID, guileLevel = TargetLvl} = _Pk) ->
    
    playerGuild:giveGuildPower(TargetID, TargetLvl),
    ok;

%% 修改公告
handle(?U2GS_ChangeNotice, #pk_U2GS_ChangeNotice{guildNotice = Notice} = _Pk) ->
    
    playerGuild:changeGuildNotice(Notice),
    ok;

%% 修改公会名字
handle(?U2GS_ChangeGuildName, #pk_U2GS_ChangeGuildName{newGuildName = NewGuildName} = _Pk) ->
    
    playerGuild:changeGuildName(NewGuildName),
    ok;

%% 修改标志
handle(?U2GS_ChangeDenoter, #pk_U2GS_ChangeDenoter{guildID = GuildID, denoter = Denoter} = _Pk) ->
    
    playerGuild:changeDenoter(GuildID, Denoter),
    ok;
%% 军团升级
handle(?U2GS_Upgrade, #pk_U2GS_Upgrade{guildID = GuildID} = _Pk) ->
    
    playerGuild:upgrade(GuildID),
    ok;
%% 军团商店升级
handle(?U2GS_ShopUpgrade, #pk_U2GS_ShopUpgrade{guildID = GuildID} = _Pk) ->
    
    playerGuild:shopUpgrade(GuildID),
    ok;

%% 权限移交
handle(?U2GS_ChangeLeader, #pk_U2GS_ChangeLeader{targetRoleID = TargetRoleID} = _Pk) ->
    
    playerGuild:changeLeader(TargetRoleID),
    ok;

%% 军团捐献
handle(?U2GS_DonateMoney, #pk_U2GS_DonateMoney{} = Pk) ->
    
    playerGuild:playerDonateMoney(Pk),
    ok;

%% 请求军团捐献次数
handle(?U2GS_RequestDonateTimes, #pk_U2GS_RequestDonateTimes{moneyType = Type}) ->
    
    playerGuild:requestDonateTimes(Type),
    ok;

%% 军团商店
handle(?U2GS_OpenGuildShop, #pk_U2GS_OpenGuildShop{}) ->
    
    case playerGuild:getGuildShopID() of
        0 -> skip;
        ShopID ->
            playerShop:sendStoreToClient(ShopID)
    end,
    ok;

%%% 打开军团任务界面，请求军团任务列表，返回GS2U_GuildTask
%handle(?U2GS_RequestGuildTask, #pk_U2GS_RequestGuildTask{}) ->
%	playerGuildHome:requestGuildTask(),
%	ok;
%%% 领取军团工资
%handle(?U2GS_GuildReward, #pk_U2GS_GuildReward{}) ->
%	playerGuildHome:guildReward(),
%	ok;

%% 领取军团津贴(最新)
handle(?U2GS_GetGuildPrize, #pk_U2GS_GetGuildPrize{}) ->
    
    ?ERROR("please ask tiacheng..."),
    ok;

%% 打开军团战报名界面
handle(?U2GS_GuildBattleApply, #pk_U2GS_GuildBattleApply{}) ->
    
    playerGuildBattle:openGuildApplyForm(),
    ok;

%% 进入军团战或者报名
handle(?U2GS_EnterGuildBattle, #pk_U2GS_EnterGuildBattle{}) ->
    
    playerGuildBattle:applyOrEnterBattle(),
    ok;
%% 请求军团战积分信息
handle(?U2GS_RequestGuildBattleResult, #pk_U2GS_RequestGuildBattleResult{}) ->
    
    playerGuildBattle:requestGuildBattleResult(),
    ok;

%%% 召唤神兽
%handle(?U2GS_SummonMonster, #pk_U2GS_SummonMonster{}) ->
%	playerGuildHome:summonMonster(),
%	ok;
%%% 接取军团驻地任务
%handle(?U2GS_AcceptGuildTask, #pk_U2GS_AcceptGuildTask{taskType = TaskType}) ->
%	playerGuildHome:acceptGuildTask(TaskType),
%	ok;
%%% 放弃任务
%handle(?U2GS_GiveUpGuildTask, #pk_U2GS_GiveUpGuildTask{taskType = TaskType}) ->
%	playerGuildHome:giveUpGuildTask(TaskType),
%	ok;
%% 进入军团驻地
handle(?U2GS_Guild_FairgroundEnter_Request, #pk_U2GS_Guild_FairgroundEnter_Request{targetGuildID = TargetGuildID}) ->
    
    playerGuildFairground:enter_try(TargetGuildID),
    ok;
%%% 领取奖励
%handle(?U2GS_GetGuildHomeReward, #pk_U2GS_GetGuildHomeReward{taskType = TaskType}) ->
%	playerGuildHome:getGuildHomeReward(TaskType),
%	ok;
%%% 召唤幻象(刺探专有)
%handle(?U2GS_SummonHX, #pk_U2GS_SummonHX{}) ->
%	playerGuildHome:summonHX(),
%	ok;
%% 使用游乐场设备请求
%%handle(?U2GS_Guild_FairgroundRide_Request, #pk_U2GS_Guild_FairgroundRide_Request{id = ID, type = Type}) ->
%%	
%%	playerGuildFairground:onUseRide(ID, Type),
%%	ok;

handle(?RequestUse, #pk_RequestUse{} = Pk) ->
    
    ?DEBUG("Ride:~p", [Pk]),
    playerRide:msg(Pk),
    ok;
handle(?RequestRecycle, #pk_RequestRecycle{} = Pk) ->
    
    ?DEBUG("Ride:~p", [Pk]),
    playerRide:msg(Pk),
    ok;
handle(?RequestUpRide, #pk_RequestUpRide{} = Pk) ->
    
    ?DEBUG("Ride:~p", [Pk]),
    playerRide:msg(Pk),
    ok;
handle(?RequestDownRide, #pk_RequestDownRide{} = Pk) ->
    
    ?DEBUG("Ride:~p", [Pk]),
    playerRide:msg(Pk),
    ok;

%% 请求竞价军团列表与自己军团信息和分组信息
handle(?U2GS_RequestGuildWar, #pk_U2GS_RequestGuildWar{} = _Pk) ->
    
    playerGuildWar:requestGuildWar(),
    ok;

%% 竞价
handle(?U2GS_Bidding, #pk_U2GS_Bidding{guildID = GuildID} = _Pk) ->
    
    playerGuildWar:bidding(GuildID),
    ok;

%% 使用大炮
handle(?U2GS_UseCannon, #pk_U2GS_UseCannon{targetGuildID = TGuildID, selectCode = Code} = _Pk) ->
    
    playerGuildWar:useCannon(Code, TGuildID),
    ok;
%% 打开军团技能界面
handle(?U2GS_RequestGuildSkill, #pk_U2GS_RequestGuildSkill{} = _Pk) ->
    
    playerGuildSkillAndBuff:requestGuildSkill(),
    ok;
%% 研究技能
handle(?U2GS_ResearchGuildSkill, #pk_U2GS_ResearchGuildSkill{confId = ConfID} = _Pk) ->
    
    playerGuildSkillAndBuff:researchGuildSkill(ConfID),
    ok;
%% 学习技能
handle(?U2GS_StudyGuildSkill, #pk_U2GS_StudyGuildSkill{confId = ConfID} = _Pk) ->
    
    playerGuildSkillAndBuff:studyGuildSkill(ConfID),
    ok;
%% 打开军团福利BUFF界面
handle(?U2GS_RequestGuildBuff, #pk_U2GS_RequestGuildBuff{} = _Pk) ->
    
    playerGuildSkillAndBuff:requestGuildBuff(),
    ok;
%% 购买BUFF
handle(?U2GS_BuyGuildBuff, #pk_U2GS_BuyGuildBuff{confId = ConfID} = _Pk) ->
    
    playerGuildSkillAndBuff:buyGuildBuff(ConfID),
    ok;
%% 领取BUFF
handle(?U2GS_getGuildBuff, #pk_U2GS_getGuildBuff{confId = ConfID} = _Pk) ->
    
    playerGuildSkillAndBuff:getGuildBuff(ConfID),
    ok;

%% 家族系统-女神祈福
handle(?U2GS_Guild_GodBless_Request, #pk_U2GS_Guild_GodBless_Request{type = Type}) ->
    
    playerGuild:godBless(Type),
    ok;

%% 家族系统-女神祈福-查询祈福进度
handle(?U2GS_Guild_GodBless_Schedule_Request, #pk_U2GS_Guild_GodBless_Schedule_Request{}) ->
    
    playerGuild:godBless_Schedule(),
    ok;

%% 家族系统-女神祈福-领取祈福进度奖励
handle(?U2GS_Guild_GodBless_Schedule_Reward_Request, #pk_U2GS_Guild_GodBless_Schedule_Reward_Request{id = ID}) ->
    
    playerGuild:godBless_Schedule_Reward(ID),
    ok;

%% 家族系统-家族商店
handle(?U2GS_Guild_ShopBuy_Request, #pk_U2GS_Guild_ShopBuy_Request{id = ID, count = Count}) ->
    
    playerGuild:shopBuy(ID, Count),
    ok;

%% 家族系统-兑换功能
handle(?U2GS_Guild_Exchange_Request, #pk_U2GS_Guild_Exchange_Request{id = ID, level = Level}) ->
    
    playerGuild:exchange(ID, Level),
    ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 家族系统-堆雪人活动 begin

%% 查看当前雪人进度
handle(?U2GS_Guild_SnowmanCheck_Request, #pk_U2GS_Guild_SnowmanCheck_Request{}) ->
    
    playerGuildSnowman:checkSnowman(),
    ok;

%% 捐献材料
handle(?U2GS_Guild_SnowmanDonate_Request, #pk_U2GS_Guild_SnowmanDonate_Request{id = ID, snowmanID = SnowmanID}) ->
    
    playerGuildSnowman:donate({ID, SnowmanID}),
    ok;

% 20170223 废弃客户端主动请求领奖，改为活动结算时主动发奖
%%% 领取雪人礼盒请求
%handle(?U2GS_Guild_SnowmanReward_Request, #pk_U2GS_Guild_SnowmanReward_Request{id = ID}) ->
%	playerGuildSnowman:reward(ID),
%	ok;

%% 家族系统-堆雪人活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 家族系统-碎片祈愿 begin

%% 打开祈愿界面请求列表
handle(?U2GS_Guild_OpenSupplication_Request, #pk_U2GS_Guild_OpenSupplication_Request{}) ->
    
    playerGuild:suppList(),
    ok;

%% 发布祈愿
handle(?U2GS_Guild_Supplicate_Request, #pk_U2GS_Guild_Supplicate_Request{itemID = ItemID}) ->
    
    playerGuild:suppSupp(ItemID),
    ok;

%% 赠送碎片
handle(?U2GS_Guild_SupplicateGive_Request, #pk_U2GS_Guild_SupplicateGive_Request{roleID = RoleID, itemID = ItemID}) ->
    
    playerGuild:suppGive(RoleID, ItemID),
    ok;

%% 家族系统-碎片祈愿 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%% 商城数据请求
%%handle(?U2GS_MallInfo, #pk_U2GS_MallInfo{seed = Seed} = _Pk) ->
%%
%%    playerMall:requestMallInfo(Seed, ?MallSendType_Mall),
%%    ok;
%%
%%%% 商城数据请求(推送使用)
%%handle(?U2GS_MallInfo2, #pk_U2GS_MallInfo2{seed = Seed} = _Pk) ->
%%
%%    playerMall:requestMallInfo(Seed, ?MallSendType_PushBuy),
%%    ok;
%%
%%%% 商城购买请求
%%handle(?U2GS_ItemBuyRequest, #pk_U2GS_ItemBuyRequest{} = _Pk) ->
%%
%%    playerMall:mallBuyRequest(_Pk, ?MallSendType_Mall),
%%    ok;
%%
%%%% 商城购买请求(推送使用)
%%handle(?U2GS_ItemBuyRequest2, #pk_U2GS_ItemBuyRequest2{} = Pk) ->
%%
%%    playerMall:mallBuyRequest(Pk, ?MallSendType_PushBuy),
%%    ok;
%%
%%%%PK状态转换
%%handle(?U2GS_RequestChangePKMode, #pk_U2GS_RequestChangePKMode{pkMode = PkMode}) ->
%%    Can =
%%        case core:isCross() andalso (gatherBattleInter:getGatherBattleMapID() =:= playerState:getMapID()
%%            orelse playerNightNvasion:checkMapIsNvasion()) of
%%            true -> true;
%%            _ -> not playerState:getIsInActivityMap()
%%        end,
%%    case Can of
%%        true ->
%%            playerPk:tranState(PkMode);
%%        _ ->
%%            sendErrorCodeMsg(?ErrorCode_KillModeActivityMap)
%%    end,
%%    ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%家园%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
handle(?U2GS_EnterHome, #pk_U2GS_EnterHome{} = Msg) ->
    
    playerHome:msg(Msg),
    ok;
handle(?U2GS_RequestHomeInfo, #pk_U2GS_RequestHomeInfo{} = Msg) ->
    
    playerHome:msg(Msg),
    ok;
handle(?U2GS_ChangeHomeName, #pk_U2GS_ChangeHomeName{} = Msg) ->
    
    playerHome:msg(Msg),
    ok;
handle(?U2GS_CreateHome, #pk_U2GS_CreateHome{} = Msg) -> 
    
    playerHome:msg(Msg),
    ok;
handle(?U2GS_UpgradeHomeArea, #pk_U2GS_UpgradeHomeArea{} = Msg) ->
    
    playerHome:msg(Msg),
    ok;
handle(?U2GS_HomePlantOperate_Request, #pk_U2GS_HomePlantOperate_Request{} = Msg) ->
    
    playerHomePlant:msg(Msg),
    ok;
handle(?U2GS_PutPetInFarming, #pk_U2GS_PutPetInFarming{} = Msg) ->
    
    playerHomeFarming:msg(Msg),
    ok;
handle(?U2GS_PutOutPetFarming, #pk_U2GS_PutOutPetFarming{} = Msg) ->
    
    playerHomeFarming:msg(Msg),
    ok;
handle(?U2GS_GetPetFood, #pk_U2GS_GetPetFood{} = Msg) ->
    
    playerHomeFarming:msg(Msg),
    ok;
handle(?U2GS_HomeVisit, #pk_U2GS_HomeVisit{} = Msg) ->
    
    playerHome:msg(Msg),
    ok;
handle(?U2GS_RequestVisitRecord, #pk_U2GS_RequestVisitRecord{} = Msg) ->
    
    playerHome:msg(Msg),
    ok;
handle(?U2GS_UpgradeHome, #pk_U2GS_UpgradeHome{} = Msg) ->
    
    playerHome:msg(Msg),
    ok;
handle(?U2GS_EnterBitHome, #pk_U2GS_EnterBitHome{} = Msg) ->
    
    playerHome:msg(Msg),
    ok;


%%%家园小屋
handle(?U2GS_SetGreetings, #pk_U2GS_SetGreetings{} = Msg) -> playerHomeFurniTrue:msg(Msg), ok;
handle(?U2GS_SaveFurniTrueScheme, #pk_U2GS_SaveFurniTrueScheme{} = Msg) -> playerHomeFurniTrue:msg(Msg), ok;
handle(?U2GS_LoadFurniTrueScheme, #pk_U2GS_LoadFurniTrueScheme{} = Msg) -> playerHomeFurniTrue:msg(Msg), ok;
handle(?U2GS_ExtendArea, #pk_U2GS_ExtendArea{} = Msg) -> playerHomeFurniTrue:msg(Msg), ok;
handle(?U2GS_DelSenceTheFurniTrue, #pk_U2GS_DelSenceTheFurniTrue{} = Msg) -> playerHomeFurniTrue:msg(Msg), ok;
handle(?U2GS_GivingFurniTrueForPartner, #pk_U2GS_GivingFurniTrueForPartner{} = Msg) -> playerHomeFurniTrue:msg(Msg),
    ok;
handle(?U2GS_ChangedecorateModel, #pk_U2GS_ChangedecorateModel{} = Msg) -> playerHomeFurniTrue:msg(Msg), ok;
handle(?U2GS_UseFurnitrue, #pk_U2GS_UseFurnitrue{} = Msg) -> playerHomeFurniTrue:msg(Msg), ok;
handle(?U2GS_Invitefriendstobed, #pk_U2GS_Invitefriendstobed{} = Msg) -> playerHomeFurniTrue:msg(Msg), ok;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%家园%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%获取杀戮值
handle(?U2GS_KillValueRequest, #pk_U2GS_KillValueRequest{}) ->
    %%playerPk:noticeKillValue(),
    ok;

%%玩家复活
handle(?U2GS_RequestRevive, #pk_U2GS_RequestRevive{reviveType = ReviveType}) ->
    playerRevive:revive(ReviveType),
    ok;

%%玩家重置位置到本地图复活点
handle(?U2GS_ResetPosToRevivePt, #pk_U2GS_ResetPosToRevivePt{}) ->
    playerMap:resetPosToRevivePt(),
    ok;

%%低级副本扫荡
handle(?U2GS_RequestAutoDeal, #pk_U2GS_RequestAutoDeal{mapID = CopyMapID}) ->
    
    playerLowCopyMapAuto:getLowCopyMapReward(CopyMapID),
    ok;

%% 老线路client请求换线
handle(?U2GS_ChangeLineRequest, #pk_U2GS_ChangeLineRequest{type = _Type}) ->
    
    ?ERROR("ChangeLineRequest, accountID:~p, roleID:~p", [playerState:getAccountID(), playerState:getRoleID()]),
    ok;

%% 老线路client确认换线换线
handle(?U2GS_ChangeLineRequestAck, #pk_U2GS_ChangeLineRequestAck{yes = Type}) ->
    
   ?INFO("CMD_U2GS_ChangeLineRequestAck[~p] playerPid[~p]", [Type, self()]),
    case Type of
        ?ChangeLineAckYes -> %确定换线
            psMgr:sendMsg2PS(self(), quitAfter, 1000 * 30), %玩家进程30s后无消息自杀。断线重连
            ok;
        ?ChangeLineAckNo -> %放弃换线
            playerState:setOffLineFlag(?OffLineTypeNormal),%%重置为正常状态
            playerState:setRunStep(?PlayerStateRun),%%重置为正常状态
            ok
    end,
    ok;

%% 符文
handle(?U2GS_OpenRuneGrid, #pk_U2GS_OpenRuneGrid{ownerID = TargetID, openNumber = Num}) ->
    
    playerRune:openRuneGrid(TargetID, Num),
    ok;
handle(?DeleteRunes, #pk_DeleteRunes{runeUIDS = UIDS}) ->
    
    playerRune:deleteRunes(UIDS),
    ok;
handle(?U2GS_RequestSuitProp, #pk_U2GS_RequestSuitProp{ownerID = TargetID}) ->
    
    playerRune:requestSuitProp(TargetID),
    ok;
handle(?U2GS_RuneEmbedOff, #pk_U2GS_RuneEmbedOff{runeUIDs = UIDS}) ->
    
    playerRune:runeEmbedOff(UIDS),
    ok;
handle(?RuneEmbedOn, #pk_RuneEmbedOn{targetID = TargetID, runeUIDs = UIDs}) ->
    
    playerRune:runeEmbedOn(TargetID, UIDs),
    ok;

%% 圣物出售
handle(?U2GS_SellRune, #pk_U2GS_SellRune{targetRuneUID = TargetUID}) ->
    
    playerRune:sellRune(TargetUID),
    ok;
%% 符文熔炼
handle(?U2GS_RuneMelt, #pk_U2GS_RuneMelt{targetRuneUID = TargetUID}) ->
    
    playerRune:runeMelt(TargetUID),
    ok;

handle(?U2GS_RuneReserve, #pk_U2GS_RuneReserve{isReserve = IsReserve}) ->
    
    playerRune:meltIsReserve(IsReserve),
    ok;

%%%% 符文洗练
%%handle(?U2GS_RuneCast, #pk_U2GS_RuneCast{targetUID = TargetUID, indexNumber = IndexNumber, materialUID = MaterialUID}) ->
%%	
%%	playerRune:runeCast(TargetUID, IndexNumber, MaterialUID),
%%	ok;
%%%% 符文洗练确认
%%handle(?U2GS_RuneCastAffirm, #pk_U2GS_RuneCastAffirm{flagID = FlagID, isAffirm = IsAffirm}) ->
%%	
%%	playerRune:runeCastAffirm(FlagID, IsAffirm),
%%	ok;
%% 符文合成
handle(?U2GS_RuneCompound, #pk_U2GS_RuneCompound{quality = Quality, level = Level, materialUIDS = MaterialUIDS}) ->
    
    playerRune:runeCompound({Quality, Level, MaterialUIDS}),
    ok;
%% 圣物部位转换
handle(?U2GS_RuneTurnPos, #pk_U2GS_RuneTurnPos{targetRuneUID = TargetUID}) ->
    
    playerRune:runeTurnPos(TargetUID),
    ok;
%% 圣物融合
handle(?U2GS_RuneFuse, #pk_U2GS_RuneFuse{targetRuneUID = TargetUID, materialUID = MaterialUID, fuseType = FuseType,
    targetPropKey = TargetPropKey, materialPropKey = MaterialKey, isUseFuseStone = IsUseStone}) ->
    
    playerRune:runeFuse({TargetUID, MaterialUID, FuseType, TargetPropKey, MaterialKey, IsUseStone}),
    ok;


%%共享装备的查看
handle(?U2GS_QueryRuneTips, #pk_U2GS_QueryRuneTips{runeUID = UID} = _Pk) ->
    playerRune:queryRuneTips(UID),
    ok;

%% 更新数值变量
handle(?Any_UpdateVariant, #pk_Any_UpdateVariant{updateVariantList = VariantList}) ->
    playerVariant:clientUpdatePlayerVariant(VariantList),
    ok;

%%更新开关变量
handle(?Any_UpdateBitVariant, #pk_Any_UpdateBitVariant{updateVariantList = VariantList}) ->
    playerVariant:clientUpdatePlayerBitVariant(VariantList),
    ok;

%%客户端正常退出
handle(?Any_PlayerLogout, #pk_Any_PlayerLogout{code = Code, reason = Reason}) ->
    case playerState:getPlayerCode() of
        Code ->
           ?INFO("Any_PlayerLogout roleID:~p,Code:~p,Reason:~p",
                [playerState:getRoleID(), Code, Reason]),
            playerBase:onPlayerQuit({normal, Reason}),
            psMgr:sendMsg2PS(self(), netQuit, "logout");
        _ ->
            skip
    end,
    ok;

%%玩家反馈消息
handle(?U2GS_PlayerCoupleBack, #pk_U2GS_PlayerCoupleBack{cbType = Type, cbContent = Content} = _PK) ->
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Hide_BugReport) of
        true ->
            Len = str:get_utf8_char_count(Content),
            case Len =< 256 of
                true ->
                    {Fgi, _FedID, _PlatformName} = playerState:getFuncellInfo(),
                    R = #recLogPlayerCB{
                        accountID = playerState:getAccountID(),
                        roleID = playerState:getRoleID(),
                        platformAccountID = Fgi,
                        mapid = playerState:getMapID(),
                        playerlevel = playerState:getLevel(),
                        playercareer = playerState:getCareer(),
                        cbtype = Type,
                        cbcontent = Content},
                    dbLog:sendSaveLogPlayerCoupleBack(R),
                    sendErrorCodeMsg(?ErrorCode_SystemPlayerCoupleBack),
                   ?INFO("recv PlayerCoupleBack:~p,~p", [Len, R]);
                _ ->
                    ?DEBUG("recv PlayerCoupleBack Len:~p,~p", [Len, Content]),
                    skip
            end;
        _ ->
            sendTipsErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;

%%gs中获取游戏中公告列表(走马灯)
handle(?U2GS_NoticeRequest, #pk_U2GS_NoticeRequest{md5 = Md5} = _PK) ->
    ?DEBUG("CMD_U2LS_NoticeRequest", []),
    psMgr:sendMsg2PS(?PsNameLS, getGameNotice, {Md5}),
    ok;

%%gs中获取公告列表（更新、活动）
handle(?U2GS_XmlNoticeRequest, #pk_U2GS_XmlNoticeRequest{type = Type, sign = Md5} = _PK) ->
    
    ?DEBUG("CMD_U2GS_XmlNoticeRequest", []),
    psMgr:sendMsg2PS(?PsNameLS, getXmlNotice, {Type, Md5}),
    ok;

%%保存语音消息
handle(?U2GS_ChatVoice, Msg) ->
    playerChat:storeVoice(Msg),
    ok;

%%获取语音消息
handle(?U2GS_ReqChatVoice, #pk_U2GS_ReqChatVoice{key = Key, playerID = PlayerID}) ->
    playerChat:getVoice({PlayerID, Key}),
    ok;

handle(?U2GS_ShowHeadEmoticonIcon, #pk_U2GS_ShowHeadEmoticonIcon{iconIndex = IconIndex}) ->
    CanUse =
        case lists:member(IconIndex, playerChat:getPlayerPerformanceIDList(1)) of
            true -> true;
            _ -> lists:member(IconIndex, playerPropSync:getProp(?SerProp_PlayerBQs))
        end,
    case CanUse of
        true -> playerChat:showHeadEmoticonIcon(IconIndex);
        _ -> skip
    end,
    ok;

handle(?U2GS_ShowAction, #pk_U2GS_ShowAction{actionIndex = ActionIndex}) ->
%%    CanUse =
%%        case lists:member(ActionIndex, playerChat:getPlayerPerformanceIDList(2)) of
%%            true -> true;
%%            _ -> lists:member(ActionIndex, playerPropSync:getProp(?SerProp_PlayerDZs))
%%        end,
%%    case CanUse of
%%        true ->
%%            playerAchieve:achieveEvent(?Achieve_Social_Event2, [1]),
%%            Code = playerState:getPlayerCode(),
%%            Msg = #pk_GS2U_ShowAction{playerCode = Code, actionIndex = ActionIndex},
%%            sendMsgToNearPlayer(Msg, true);
%%        _ -> skip
%%    end,
    ok;

%% 报名广场舞
handle(?U2GS_ApplyDance, #pk_U2GS_ApplyDance{type = Type} = _PK) ->
    
    playerDance:applyDance(Type),
    ok;
%% 广场舞区域
handle(?U2GS_DanceArea, #pk_U2GS_DanceArea{type = Type} = _PK) ->
    
    playerDance:danceArea(Type),
    ok;
%% 选择一种舞蹈
handle(?U2GS_SelectDanceID, #pk_U2GS_SelectDanceID{danceID = DanceID} = _PK) ->
    
    playerDance:selectDanceID(DanceID),
    ok;
%% 打断舞蹈
handle(?U2GS_BreakDance, #pk_U2GS_BreakDance{} = _PK) ->
    
    playerDance:breakDance(),
    ok;

%%激活码领取
handle(?U2GS_ActiveCodeRequest, #pk_U2GS_ActiveCodeRequest{code = Code} = _PK) ->
    
    playerActiveCode:getActiveCodeRequest(Code),
    ok;

%% 每日签到功能转由协议CMD_U2GS_SignIn与模块playerDailySignIn实现
%%%每日签到
%handle(?EveryDaySignIn, #pk_EveryDaySignIn{}) ->
%	?ERROR("invalid msg CMD_EveryDaySignIn"),
%  playerSignIn:playerEveryDaySignIn(),
%  ok;

%%七日签到
handle(?SevenDaySignIn, #pk_SevenDaySignIn{dayCount = DayCount} = _PK) ->
    
    ?DEBUG("[DebugForSignIn] CMD_SevenDaySignIn DayCount(~p)", [DayCount]),
    playerSignIn:playerSevenDaySignIn(DayCount),
    ok;

%% 请求资源找回列表
handle(?RefindResList, #pk_RefindResList{} = _PK) ->
    
    playerFindRes:requestFindRes(),
    ok;

%% 开始找回
handle(?U2GS_RefindResOne, #pk_U2GS_RefindResOne{id = ID, type = Type} = _PK) ->
    
    playerFindRes:refindResOne(ID, Type),
    ok;

%% 开始找回（一健）
handle(?U2GS_RefindResAll, #pk_U2GS_RefindResAll{type = Type} = _PK) ->
    
    playerFindRes:refindResAll(Type),
    ok;

%%觉醒成长
handle(?U2GS_UpWakeInfo, #pk_U2GS_UpWakeInfo{}) ->
    ok;
%%	playerGoddess:upWake(CardID, Num);
%%觉醒升级
handle(?U2GS_UpGradeWakeInfo, #pk_U2GS_UpGradeWakeInfo{}) ->
%%	playerGoddess:upGradeWake(CardID);
    ok;
%%觉醒一键升级
handle(?U2GS_OnKeyUpWakeInfo, #pk_U2GS_OnKeyUpWakeInfo{}) ->
%%	playerGoddess:onKeyUpWakeInfo(CardID);
    ok;
handle(?U2GS_UnlockState, #pk_U2GS_UnlockState{}) ->
%%	playerGoddess:unlockGoddessState(CardID, State),
    ok;
handle(?U2GS_ChangeState, #pk_U2GS_ChangeState{}) ->
%%	playerGoddess:changeGoddessState(CardID, State),
    ok;
handle(?U2GS_CallGoddess, #pk_U2GS_CallGoddess{}) ->
%%	playerGoddess:callGoddess(CardID),
    ok;
handle(?U2GS_UnlockCard, #pk_U2GS_UnlockCard{}) ->
%%	playerGoddess:unlockGoddess(CardID),
    ok;

%% 请求排行榜
handle(?U2GS_RequestRank, #pk_U2GS_RequestRank{type = Type}) ->
    
    playerRank:sendRankInfo(Type),
    ok;

handle(?U2GS_QueryDevilCopyMapRankList, #pk_U2GS_QueryDevilCopyMapRankList{instanceGroup = IG}) ->
    
    playerCopyMap:queryCopyRankList(IG),
    ok;
%% 请求排行榜上玩家的装备列表
handle(?U2GS_RequestPropList, #pk_U2GS_RequestPropList{type = Type, roleID = RoleID}) ->
    
    playerRank:sendPropList(Type, RoleID),
    ok;

%% 请求领取指定排行榜的奖励
handle(?U2GS_RequestRankAward, #pk_U2GS_RequestRankAward{type = Type}) ->
    
    playerRank:requestRankAward(Type),
    ok;

%% 请求领取更新资源奖励
handle(?U2GS_GetUpdateReward, #pk_U2GS_GetUpdateReward{}) ->
%%	playerUpdateReward:getUpdateReward(Count),
    sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
    ok;

%%玩家请求当前地图的等级
handle(?U2GS_GetMapLevel, #pk_U2GS_GetMapLevel{}) ->
    MapPid = playerState:getMapPid(),
    psMgr:sendMsg2PS(MapPid, noticeMapLevel, playerState:getGroupID()),
    ok;

%%玩家请求当前地图进入大区BOSS战位面
handle(?U2GS_EnterBossBattle, #pk_U2GS_EnterBossBattle{}) ->
%%	playerWorldBossWar:enterParallelUniverseRequest(),
    ok;

%%首领入侵 鼓舞
handle(?GS2U_WorldBossBuyBuff, #pk_GS2U_WorldBossBuyBuff{type = Type}) ->
    
    playerActivity:inspire(Type),
    ok;

handle(?U2GS_QueryMapBossInfo, #pk_U2GS_QueryMapBossInfo{targetCode = TargetCode}) ->
    
    playerWildBoss:queryMapBoss(TargetCode),
    ok;

%%玩家请求购买时装
handle(?U2GS_BuyFashion, #pk_U2GS_BuyFashion{itemID = ItemID, fashionID = FashionID, time = BuySecond}) ->
    
    playerFashion:buyFashion(ItemID, FashionID, BuySecond),
    ok;
%%
handle(?U2GS_FashionRoomLevelUp, #pk_U2GS_FashionRoomLevelUp{}) ->
    
    playerFashion:roomLevelUp(),
    ok;
%%玩家请求激活或者取消
handle(?U2GS_ActiveFashionSuit, #pk_U2GS_ActiveFashionSuit{}) ->
%%	playerFashion:activeFashionSuit(SuitID, Flag),
    ok;

%%玩家请求穿卸时装
handle(?U2GS_OperateFashion, #pk_U2GS_OperateFashion{fashionID = FashionID, flag = Flag}) ->
    playerFashion:operateFashionPosition(FashionID, Flag),
    ok;

%%请求切磋
handle(?U2GS_BattleLearn, #pk_U2GS_BattleLearn{code = Code}) ->
    
    playerBattleLearn:requestBattleLearn(Code);

%%拒绝或者接受请求切磋
handle(?U2GS_BattleLearnAck, #pk_U2GS_BattleLearnAck{code = Code, result = Result}) ->
    
    playerBattleLearn:responseBattleLearn(Code, Result);

%%成就系统
%%领取成就值
handle(?U2GS_ReceiveAchieveValue, #pk_U2GS_ReceiveAchieveValue{achieveID = AchieveID}) ->
    
    playerAchieve:receiveAchieve(AchieveID),
    ok;

%%领取爵位等级奖励
handle(?U2GS_GetVipReward, #pk_U2GS_GetVipReward{}) ->
%%	
%%	playerVip:getVipReward(VipLevel),
    ok;

%%锁定道具
handle(?U2GS_LockGoods, #pk_U2GS_LockGoods{goodsUID = GoodsUID, bagType = BagType}) ->
    
    playerPackage:lockGoods(GoodsUID, BagType);

%%绑定手机
handle(?U2GS_BindPhone, #pk_U2GS_BindPhone{funcellCilentID = FuncellCilentID, accessToken = AccToken, phoneNum = PhoneNum, verifyid = Verifyid, content = Content}) ->
    
    ?ERROR("invalid msg CMD_U2GS_BindPhone"),
    playerSignIn:bindPhone(FuncellCilentID, AccToken, PhoneNum, Verifyid, Content);

handle(?BindPhoneAwardGet, #pk_BindPhoneAwardGet{}) ->
    
    ?ERROR("invalid msg CMD_BindPhoneAwardGet"),
    playerSignIn:onBindPhoneAwardGet();

%%激活军团副本
handle(?ActiveGuildCopy, #pk_ActiveGuildCopy{mapID = MapID}) ->
    
    ?DEBUG("ActiveGuildCopy"),
    playerGuildCopy:activeGuildCopy(MapID);
%%进入军团副本
handle(?U2GS_EnterGuildCopy, #pk_U2GS_EnterGuildCopy{mapID = MapID}) ->
    
    ?DEBUG("EnterGuildCopy"),
    playerGuildCopy:enterGuildCopy(MapID);
%% 天赋凝练初始化
handle(?U2GS_TalentInit, #pk_U2GS_TalentInit{}) ->
    
    playerTalent:sendTalentInfoToClient(),
    ok;
%% 天赋凝练技能升级
handle(?U2GS_TalentLevelUp, #pk_U2GS_TalentLevelUp{id = ID}) ->
    
    playerTalent:talentLevelUp(ID),
    ok;
%% 勇士试炼/勇者荣耀/女神禁闭室初始化
handle(?U2GS_WarriorTrialInit, #pk_U2GS_WarriorTrialInit{}) ->
    
    playerWarriorTrial:sendWarriorTrialInfoToClient(),
    ok;
%% 勇士试炼/勇者荣耀/女神禁闭室挑战开始
handle(?U2GS_BeginWarriorTrial, #pk_U2GS_BeginWarriorTrial{}) ->
    
    ?DEBUG("beginWarriorTrial"),
    playerWarriorTrial:beginWarriorTrial(),
    ok;
%% 勇士试炼/勇者荣耀/女神禁闭室扫荡开始
handle(?U2GS_SweepWarriorTrial, #pk_U2GS_SweepWarriorTrial{mapID = _MapID}) ->
    
    case playerWarriorTrial:beginSweepMission() of
        skip ->
            skip;
        R -> player_pub:send_net_msg(R)
    end,
    ok;
%% 勇士试炼/勇者荣耀/女神禁闭室扫荡开始
handle(?U2GS_CompleteWarriorTrail, #pk_U2GS_CompleteWarriorTrail{mapID = MapID}) ->
    
    playerWarriorTrial:playerCompleteAllMissions(MapID),
    ok;
%% 勇士试炼/勇者荣耀/女神禁闭室请求领取首杀奖励
handle(?U2GS_WarriorFirstKillReward_Request, #pk_U2GS_WarriorFirstKillReward_Request{id = ID}) ->
    
    playerWarriorTrial:firstKillReward(ID),
    ok;
%% 勇士试炼/勇者荣耀/女神禁闭一键扫荡
handle(?U2GS_SweepWarriorTrial_OneKey_Request, #pk_U2GS_SweepWarriorTrial_OneKey_Request{}) ->
    
    playerWarriorTrial:oneKeySweep(),
    ok;


%%开始灵力冥想
handle(?U2GS_StartMeditation, #pk_U2GS_StartMeditation{istart = false}) ->
    
    playerOfflineExp:endMeditation(),
    ok;
handle(?U2GS_StartMeditation, #pk_U2GS_StartMeditation{istart = true}) ->
    
    playerOfflineExp:startMeditation(),
    ok;

%%领取玩家离线经验
handle(?U2GS_GetLeavedExp, #pk_U2GS_GetLeavedExp{getType = Type}) ->
    
    playerOfflineExp:getOfflineReward(Type),
    ok;

%%复制世界消息
handle(?U2GS_CopyChat, #pk_U2GS_CopyChat{}) ->
    
    %% 复制世界消息增加成就
    playerAchieve:achieveEvent(?Achieve_Social_Event3, [1]),
    ok;
%%改名
handle(?U2GS_ChangeName, #pk_U2GS_ChangeName{roleID = RoleID, name = Name}) ->
    
    RealName = string:strip(Name),
    ?DEBUG("RoleID = ~p, Name = ~ts", [RoleID, RealName]),
    playerLogin:changeName(RoleID, RealName),
    ok;
%%神器升级
handle(?U2GS_LevelUpGodWeapon, #pk_U2GS_LevelUpGodWeapon{weaponID = WeaponID}) ->
    
    ?DEBUG("LevelUpGodWeapon WeaponID = ~p", [WeaponID]),
    playerGodWeapon:levelupWeapon(WeaponID),
    ok;
%%%神器技能升级
%handle(?U2GS_LevelUpGodWeaponSkill, #pk_U2GS_LevelUpGodWeaponSkill{weaponID = WeaponID}) ->
%	?DEBUG("LevelUpGodWeaponSkill WeaponID = ~p", [WeaponID]),
%	playerGodWeapon:levelupWeaponskill(WeaponID),
%	ok;

%%全名答题

handle(?U2GS_ApplyAnswer, #pk_U2GS_ApplyAnswer{}) ->
    playerAnswer:applyAnswer(),
    ok;

handle(?U2GS_PlayerAnswer, #pk_U2GS_PlayerAnswer{questionID = QuestionID, isright = Isright, answers = Answers, isVoice = IsVoice}) ->
    playerAnswer:answerResult(QuestionID, Isright, Answers, IsVoice),
    ok;

handle(?U2GS_PlayerAnswerQuestion, #pk_U2GS_PlayerAnswerQuestion{questionID = QuestionID, answers = Answers}) ->
    playerAnswer:answerResult(QuestionID, Answers),
    ok;

%%刷新运营搞的兑换活动
handle(?U2GS_OperateExchangeRefresh, #pk_U2GS_OperateExchangeRefresh{}) ->
%%	psMgr:sendMsg2PS(?PsNameOperateExchange, refreshExchange, {playerState:getRoleID(), playerState:getNetPid()}),
    ok;
%%兑换运营搞的兑换活动
handle(?U2GS_OperateExchange, #pk_U2GS_OperateExchange{}) ->
%%	playerOperateExchange:exchange(ExchangeID),
    ok;

%%宠物远征领奖
handle(?U2GS_RequstReward, #pk_U2GS_RequstReward{}) ->
    
    playerPetPvE:petPveReward();

%%宠物远征位置调整
handle(?U2GS_StandSort, #pk_U2GS_StandSort{petList = PetList}) ->
    
    playerPetPvE:petPvePos(PetList);

%%宠物远征购买体力
handle(?U2GS_BuyPower, #pk_U2GS_BuyPower{}) ->
    
    playerPetPvE:petPvePhys();

%%宠物远征购战战斗
handle(?U2GS_RequestBattle, #pk_U2GS_RequestBattle{id = DunID}) ->
    
    playerPetPvE:petPveBattle(DunID);

%%宠物远征请求数据包
handle(?U2GS_RequestBattleAck, #pk_U2GS_RequestBattleAck{num = Num}) ->
    
    playerTurnBattle:sendBattleResList(Num);

%%宠物远征请求战斗结束
handle(?U2GS_RequestBattleEnd, #pk_U2GS_RequestBattleEnd{type = Type}) ->
    
    playerTurnBattle:sendRequestBattleEnd(Type);

%%宠物远征副本扫荡
handle(?U2GS_PetPveSweep, #pk_U2GS_PetPveSweep{id = ID}) ->
    
    playerPetPvE:petPveSweep(ID);

%%宠物争夺战信息获取
handle(?U2GS_PvpBattleInfo, #pk_U2GS_PvpBattleInfo{}) ->
    
    playerPetPvP:petPvpInit();

%%宠物争夺战宠物信息保存
handle(?U2GS_PvpPosSave, #pk_U2GS_PvpPosSave{petList = PL}) ->
    
    playerPetPvP:petPvpPos(PL);

%%宠物争夺战战斗
handle(?U2GS_RequestPvpBattle, #pk_U2GS_RequestPvpBattle{cityID = CityID, roleID = RoleID}) ->
    
    playerPetPvP:petPvpBattle(CityID, RoleID);

%%购买抢夺令
handle(?U2GS_BuyReel, #pk_U2GS_BuyReel{}) ->
    
    playerPetPvP:petPvpReel();

%%跨服混沌战场

%%请求战功
handle(?U2GS_RequestHDBattleExploits, #pk_U2GS_RequestHDBattleExploits{}) ->
    
    psMgr:sendMsg2PS(?PsNameCrosHd, getExploits, {playerState:getMapPid(), playerState:getNetPid()}),
    ok;

%%请求倒计时
handle(?U2GS_RequestHDBattleCD, #pk_U2GS_RequestHDBattleCD{}) ->
    
    psMgr:sendMsg2PS(?PsNameCrosHd, getCD, {playerState:getNetPid()}),
    ok;

%%请求进入战场
handle(?U2GS_RequestHDBattle, #pk_U2GS_RequestHDBattle{}) ->
    
    RoleID = playerState:getRoleID(),
    RankList = myEts:lookUpEts(?TABLE_RankInfo, ?PlayerRankType_FightingCapacity),
    Force = case lists:keyfind(RoleID, #recPlayerRank.roleID, RankList) of
                #recPlayerRank{value1 = Value} ->
                    Value;
                _ ->
                    playerPropSync:getProp(?PriProp_PetForce) + playerPropSync:getProp(?PriProp_PlayerForce)
            end,
    HistoryForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
    case global:whereis_name(?PsNameCrosHd) of
        undefined ->
            sendErrorCodeMsg(?ErrorCode_CrosBattle_AlreadyClose);
        _ ->
            psMgr:sendMsg2PS(?PsNameCrosHd, allocMapLine, {
                RoleID,
                playerState:getName(),
                self(),
                playerState:getNetPid(),
                playerState:getCareer(),
                gsMainLogic:getDBID4GS(),
                gsMainLogic:getAreaName(),
                Force,
                HistoryForce,
                playerState:getLevel()
            })
    end;

%%请求排行榜
handle(?U2GS_RequestCrosRanks, #pk_U2GS_RequestCrosRanks{}) ->
    
    L = ets:tab2list(rec_cros_rank),
    Fun = fun(#recCrosRank{} = R, Acc) ->
        PK = #pk_CrosBattleExploit{
            rankID = R#recCrosRank.rankID,
            roleID = R#recCrosRank.roleID,
            name = R#recCrosRank.name,
            servername = R#recCrosRank.sname,
            exploit = R#recCrosRank.record,
            career = R#recCrosRank.carrer,
            force = R#recCrosRank.force
        },
        [PK | Acc]
          end,
    L1 = lists:foldl(Fun, [], L),
    player_pub:send_net_msg(#pk_GS2U_CrosBattleExploits{ranks = L1});


handle(?U2GS_ReceiveDailyActiveAward, #pk_U2GS_ReceiveDailyActiveAward{dailyActivityValue = LivenessValue}) ->
    
    playerliveness:onPlayerDrewLivenessGift(LivenessValue);

handle(?U2GS_CancelFastTeam, #pk_U2GS_CancelFastTeam{}) ->
%%	playerTeam2:cancelFastTeam(),
    ok;

%%跨服竞技场邀请玩家
handle(?U2GS_AddArenaTeamMember, #pk_U2GS_AddArenaTeamMember{id = ID}) ->
    
    playerCrosTeam:inviteFriend(ID),
    ok;

%%跨服竞技场玩家是否接受邀请
handle(?U2GS_AddArenaTeamMemberAck, #pk_U2GS_AddArenaTeamMemberAck{roleID = RoleID, result = Result}) ->
    
    playerCrosTeam:inviteAck(RoleID, Result),
    ok;

%%跨服竞技场删除组队
handle(?DeleteArenaTeamMember, #pk_DeleteArenaTeamMember{isMyself = IsMyself, id = ID}) ->
    
    playerCrosTeam:kick(IsMyself, ID),
    ok;

%%跨服竞技场组队准备
handle(?ArenaTeamMemberPrepare, #pk_ArenaTeamMemberPrepare{isPrepare = IsPrepare, id = ID}) ->
    
    playerCrosTeam:ready(IsPrepare, ID),
    ok;

%%跨服准备匹配
handle(?U2GS_ReadyArena, #pk_U2GS_ReadyArena{}) ->
    
    Level = playerState:getLevel(),
    case Level < 45 of
        true ->
            sendErrorCodeMsg(?ErrorCode_BagEquipOnPlayerLevelNotMeet);
        _ ->
            playerCrosTeam:readyMatch()
    end,
    ok;

%%跨服准备匹配
handle(?U2GS_StartArena, #pk_U2GS_StartArena{}) ->
    
    playerCrosTeam:startMatch(),
    ok;

%%跨服竞技场排行榜
handle(?U2GS_RequestCrosArenaRanks, #pk_U2GS_RequestCrosArenaRanks{type = 0}) ->
    
    L = ets:tab2list(?EtsCrosArenaRank),
    Fun = fun(#recCrosArenaRank{} = R, Acc) ->
        PK = #pk_CrosArenaBattleRank{
            rankID = R#recCrosArenaRank.rankID,
            roleID = R#recCrosArenaRank.roleID,
            name = R#recCrosArenaRank.name,
            servername = R#recCrosArenaRank.sname,
            arenaVal = R#recCrosArenaRank.record,
            career = R#recCrosArenaRank.carrer,
            force = R#recCrosArenaRank.force,
            win = 0,
            fail = 0
        },
        [PK | Acc]
          end,
    L1 = lists:foldl(Fun, [], L),
    player_pub:send_net_msg(#pk_GS2U_CrosArenaBattleRanks{ranks = L1});
handle(?U2GS_RequestCrosArenaRanks, #pk_U2GS_RequestCrosArenaRanks{type = _}) ->
    
    L = ets:tab2list(?EtsCrosArenaHightRank),
    Fun = fun(#recCrosArenaHightRank{} = R, Acc) ->
        PK = #pk_CrosArenaBattleHighRank{
            roleID = R#recCrosArenaHightRank.roleID,
            name = R#recCrosArenaHightRank.name,
            servername = R#recCrosArenaHightRank.sname,
            arenaVal = R#recCrosArenaHightRank.record,
            career = R#recCrosArenaHightRank.carrer,
            force = R#recCrosArenaHightRank.force,
            time = R#recCrosArenaHightRank.time,
            win = 0,
            fail = 0
        },
        [PK | Acc]
          end,
    L1 = lists:foldl(Fun, [], L),
    player_pub:send_net_msg(#pk_GS2U_CrosArenaBattleHighRanks{ranks = L1});

%%取消匹配
handle(?CrosArenaMatch, #pk_CrosArenaMatch{isMatch = false}) ->
    
    playerCrosTeam:cancelMatch();

handle(?U2GS_AcceptHolidayTask, #pk_U2GS_AcceptHolidayTask{}) ->
    
    playerHolidayTask:acceptHolidayTask(),
    ok;

handle(?U2GS_CommonditiesPush, #pk_U2GS_CommonditiesPush{}) ->
    
    playerLimitSales:onRequestPushInfo(),
    ok;

handle(?U2GS_BuyLimitSales, #pk_U2GS_BuyLimitSales{sku = Sku}) ->
    
    playerLimitSales:onRequestBuyItem(Sku),
    ok;

handle(?PlayerLevelReward, #pk_PlayerLevelReward{}) ->
    case core:isCross() of
        true -> skip;
        _ -> playerLevelReward:get_receive_reward_level()
    end,
    ok;

handle(?U2GS_ReceivePlayerLevelReward, #pk_U2GS_ReceivePlayerLevelReward{} = R) ->
    
    playerLevelReward:receive_reward(R),
    ok;

handle(?U2GS_SignIn, #pk_U2GS_SignIn{}) ->
    
    ?DEBUG("[DebugForSignIn] CMD_U2GS_SignIn"),
    playerDailySignIn:sign(),
    ok;

handle(?GetPlayerOnlineReward, #pk_GetPlayerOnlineReward{timeID = TimeID}) ->
    
    playerOnlineReward:get(TimeID),
    ok;

handle(?U2GS_AccuReward, #pk_U2GS_AccuReward{id = ID}) ->
    
    ?DEBUG("[DebugForSignIn] CMD_U2GS_AccuReward"),
    playerDailySignIn:accuReward(ID),
    ok;

handle(?U2GS_UpSkill, #pk_U2GS_UpSkill{id = Id}) ->
    
    playerSkillLearn:upSkill(Id, 1),
    ok;
handle(?U2GS_ResetSkill, #pk_U2GS_ResetSkill{}) ->
    
    playerSkillLearn:resetSkill(),
    ok;

%% 七日任务
handle(?U2GS_QuerySevenMissionData, #pk_U2GS_QuerySevenMissionData{}) ->
%%	
%%	playerSevenDays:querySevenMissionData(),
    ok;

handle(?U2GS_SevenMissionCompletion, #pk_U2GS_SevenMissionCompletion{missionid = MissionID}) ->
    
    playerSevenDays:sevenMissionCompletion(MissionID),
    ok;

%% 天使投资
handle(?U2GS_QueryAngelInvestment, #pk_U2GS_QueryAngelInvestment{}) ->
%%	
%%	playerSevenDays:queryInvestment(),
    ok;

handle(?U2GS_AngelInvestment, #pk_U2GS_AngelInvestment{}) ->
%%	
%%	playerSevenDays:angelInvestmentBuy(ID),
    ok;

handle(?U2GS_AngelInvestmentGet, #pk_U2GS_AngelInvestmentGet{}) ->
%%	
%%	playerSevenDays:angelInvestmentGet(ID),
    ok;

%%
handle(?U2GS_QueryExpeditionMapInfo, #pk_U2GS_QueryExpeditionMapInfo{}) ->
    
    playerGuildExpedition:requestTotalInfo(),
    ok;

handle(?U2GS_QueryExpeditionGlobalMapInfo, #pk_U2GS_QueryExpeditionGlobalMapInfo{}) ->
    
    playerGuildExpedition:requestGlobalInfo(),
    ok;

handle(?U2GS_QueryExpeditionMapBattleInfo, #pk_U2GS_QueryExpeditionMapBattleInfo{mapid = MapID}) ->
    
    playerGuildExpedition:requestMapInfo(MapID),
    ok;

handle(?U2GS_ExpeditionBroadcastPos, #pk_U2GS_ExpeditionBroadcastPos{type = Type}) ->
    
    playerGuildExpedition:leaderBroadcastPos(Type),
    ok;

handle(?U2GS_QueryExpeditionFinalInfo, #pk_U2GS_QueryExpeditionFinalInfo{}) ->
    
    playerGuildExpedition:requestFinalInfo(),
    ok;

handle(?U2GS_GiveMeExpeditionRewardEverDay, #pk_U2GS_GiveMeExpeditionRewardEverDay{mapid = MapID}) ->
    
    playerGuildExpedition:requestGetExpeditionEverydayReward(MapID),
    ok;

handle(?U2GS_LotteryForTowerRandonAward, #pk_U2GS_LotteryForTowerRandonAward{} = Msg) ->
    
    playerLotteryForTower:random_award(Msg),
    ok;

handle(?U2GS_LotteryForTowerInfo, #pk_U2GS_LotteryForTowerInfo{} = Msg) ->
    
    playerLotteryForTower:flush_lottery_tower_info(Msg),
    ok;

handle(?U2GS_GoToExpMap, #pk_U2GS_GoToExpMap{} = _Msg) ->
    
    RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
    MapIdArgu = logicArguLib:getCurrentMapId(),
    logicLib:runLogicGroup(?LOGIC_GROUP_ID_ENTER_EXP_MAP, [RoleBaseArgu, MapIdArgu]),
    ok;

handle(?U2GS_get_lottery_sys_info, #pk_U2GS_get_lottery_sys_info{} = _Msg) ->
    
    lotterySys:flush_lottery_info_2_client(),
    ok;

handle(?U2GS_lottery_start, #pk_U2GS_lottery_start{type = LogicGroupID} = _Msg) ->
    case variant:getGlobalBitVariant(?Setting_GGlobalBitVarReadOnly_Hide_LOTTERY_SYS) of
        true ->
            
%%			?DEBUG("=========LogicGroupID========~p~n", [LogicGroupID]),
%%			RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
%%			LottertLogicGroupIDs = [?LOGIC_GROUP_LOTTERY_GOBLIN_FREE, ?LOGIC_GROUP_LOTTERY_GOBLIN_ONCE_PAY_MONEY,
%%				?LOGIC_GROUP_LOTTERY_GOBLIN_TEN_TIME_PAY_MONEY, ?LOGIC_GROUP_LOTTERY_TREASURE_FREE,
%%				?LOGIC_GROUP_LOTTERY_TREASURE_ONCE_PAY_MONEY, ?LOGIC_GROUP_LOTTERY_TREASURE_TEN_TIME_PAY_MONEY],
%%			case lists:member(LogicGroupID, LottertLogicGroupIDs) of
%%				true ->
%%					logicLib:runLogicGroup(LogicGroupID, [RoleBaseArgu]);
%%				false ->W
%%					ok
%%			end;
            lotterySys:lotteryStart(LogicGroupID);
        _ -> skip
    end,

    ok;
handle(?U2GS_Join_lsbattlefield, #pk_U2GS_Join_lsbattlefield{} = _Msg) ->
    
    playerLSBattlefield:join_active();
handle(?U2GS_get_action_point_info, #pk_U2GS_get_action_point_info{} = _Msg) ->
    case core:isCross() of
        true -> skip;
        _ -> playerActionPoint:queryActionPoint()
    end,
    ok;
handle(?U2GS_buy_action_point, #pk_U2GS_buy_action_point{} = _Msg) ->
    
    playerActionPoint:buyActionPoint();
handle(?U2GS_buy_action_count, #pk_U2GS_buy_action_count{copyMapID = CopyMapID} = _Msg) ->
    
    playerActivity:buyActionCount(CopyMapID);
handle(?U2GS_get_copy_map_destory_time, #pk_U2GS_get_copy_map_destory_time{} = _Msg) ->
    
    playerCopyMap:sendCopyMapDestroy2Client(),
    ok;
handle(?U2GS2U_BuyCopyReward, #pk_U2GS2U_BuyCopyReward{mapSubType = MapSubType} = _Msg) ->
    
    playerCopyMapReward:buyChallengeCopyReward(MapSubType),
    ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 身份证系统 begin

%% 请求身份证信息
handle(?U2GS_Identity_Request, #pk_U2GS_Identity_Request{id = IdentityID} = _Msg) ->
    %?DEBUG("[DebugForIdentity] CMD_U2GS_Identity_Request"),
    playerIdentity:queryIdentity(IdentityID),
    ok;

%% 编辑身份证信息_年龄
handle(?U2GS2U_IdentityEditAge, #pk_U2GS2U_IdentityEditAge{idi_age = Age} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS2U_IdentityEditAge"),
    playerIdentity:editIdentity(?IDIT_AGE, Age),
    ok;

%% 编辑身份证信息_生日
handle(?U2GS2U_IdentityEditBirth, #pk_U2GS2U_IdentityEditBirth{idi_birthmonth = Month, idi_birthday = Day} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS2U_IdentityEditBirth"),
    playerIdentity:editIdentity(?IDIT_BIRTH, {Month, Day}),
    ok;

%% 编辑身份证信息_星座
handle(?U2GS2U_IdentityEditZodiac, #pk_U2GS2U_IdentityEditZodiac{idi_zodiac = Zodiac} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS2U_IdentityEditZodiac"),
    playerIdentity:editIdentity(?IDIT_ZODIAC, Zodiac),
    ok;

%% 编辑身份证信息_血型
handle(?U2GS2U_IdentityEditBloodType, #pk_U2GS2U_IdentityEditBloodType{idi_bloodType = BloodType} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS2U_IdentityEditBloodType"),
    playerIdentity:editIdentity(?IDIT_BLOOD, BloodType),
    ok;

%% 编辑身份证信息_故乡
handle(?U2GS2U_IdentityEditHometown, #pk_U2GS2U_IdentityEditHometown{idi_hometown1 = Hometown1, idi_hometown2 = Hometown2} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS2U_IdentityEditHometown"),
    playerIdentity:editIdentity(?IDIT_HOMETOWN, {Hometown1, Hometown2}),
    ok;

%% 编辑身份证信息_所在地
handle(?U2GS2U_IdentityEditLocation, #pk_U2GS2U_IdentityEditLocation{idi_location1 = Location1, idi_location2 = Location2} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS2U_IdentityEditLocation"),
    playerIdentity:editIdentity(?IDIT_LOCATION, {Location1, Location2}),
    ok;

%% 编辑身份证信息_头像
handle(?U2GS2U_IdentityEditFace, #pk_U2GS2U_IdentityEditFace{idi_face = Face} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS2U_IdentityEditFace"),
    playerIdentity:editIdentity(?IDIT_FACE, Face),
    ok;

%% 编辑身份证信息_签名
handle(?U2GS2U_IdentityEditSign, #pk_U2GS2U_IdentityEditSign{idi_sign = Sign} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS2U_IdentityEditSign"),
    playerIdentity:editIdentity(?IDIT_SIGN, Sign),
    ok;

%% 添加标签
handle(?U2GS_IdentityEditTagAdd_Request, #pk_U2GS_IdentityEditTagAdd_Request{idi_listTag = Tags} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS_IdentityEditTagAdd_Request"),
    playerIdentity:editIdentity_Tags(true, Tags),
    ok;

%% 删除标签
handle(?U2GS_IdentityEditTagDel_Request, #pk_U2GS_IdentityEditTagDel_Request{idi_tag = Tag} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS_IdentityEditTagDel_Request"),
    playerIdentity:editIdentity_Tags(false, Tag),
    ok;

%% 上传图片请求_开始
handle(?U2GS_IdentityPicUploadBegin_Request, #pk_U2GS_IdentityPicUploadBegin_Request{md5 = MD5, size = Size, opType = OpType, pos = Pos} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS_IdentityPicUploadBegin_Request"),
    playerIdentity:editIdentity_Pics(OpType, MD5, Size, Pos),
    ok;

%% 上传图片请求_数据
handle(?U2GS_IdentityPicUploadData_Request, #pk_U2GS_IdentityPicUploadData_Request{md5 = MD5, count = Count, index = Index, data = Data} = _Msg) ->
    
    %?DEBUG("[DebugForIdentity] CMD_U2GS_IdentityPicUploadData_Request"),
    playerIdentity:picUpload({MD5, Count, Index, Data}),
    ok;

%% 下载图片请求_开始
handle(?U2GS_IdentityPicDownloadBegin_Request, #pk_U2GS_IdentityPicDownloadBegin_Request{md5 = MD5, id = ID} = _Msg) ->
    %?DEBUG("[DebugForIdentity] CMD_U2GS_IdentityPicDownloadBegin_Request"),
    playerIdentity:picDownloadBegin({MD5, ID}),
    ok;

%% 下载图片请求_继续
handle(?U2GS_IdentityPicDownloadContinue_Request, #pk_U2GS_IdentityPicDownloadContinue_Request{md5 = MD5} = _Msg) ->
    %?DEBUG("[DebugForIdentity] CMD_U2GS_IdentityPicDownloadContinue_Request"),
    playerIdentity:picDownloadContinue({MD5}),
    ok;

%% 请求角色图片
handle(?U2GS2U_RequestRoleHeadPic, #pk_U2GS2U_RequestRoleHeadPic{heads = Heads} = _Msg) ->
    %?DEBUG("[DebugForIdentity] CMD_U2GS_IdentityPicDownloadContinue_Request"),
    case playerIdentity:requestRoleHeadPic(Heads, []) of
        [] -> skip;
        List ->
            player_pub:send_net_msg(#pk_U2GS2U_RequestRoleHeadPic{heads = List})
    end,
    ok;

%% 身份证系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 梳理好友系统（本地好友+跨服好友） begin
handle(?U2GS_Friend2SimpleList_Requets, #pk_U2GS_Friend2SimpleList_Requets{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Search_Request, #pk_U2GS_Friend2Search_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2LimitSearch_Request, #pk_U2GS_Friend2LimitSearch_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Recommend_Request, #pk_U2GS_Friend2Recommend_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Add_Request, #pk_U2GS_Friend2Add_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2AddFromBlack_Reply, #pk_U2GS_Friend2AddFromBlack_Reply{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2ApplicantUse_Request, #pk_U2GS_Friend2ApplicantUse_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2ApplicantUseOneKey_Request, #pk_U2GS_Friend2ApplicantUseOneKey_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Del_Request, #pk_U2GS_Friend2Del_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Applicant_Request, #pk_U2GS_Friend2Applicant_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Formal_Request, #pk_U2GS_Friend2Formal_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Temp_Request, #pk_U2GS_Friend2Temp_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Black_Request, #pk_U2GS_Friend2Black_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Ban_Request, #pk_U2GS_Friend2Ban_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2BanWithUnban_Reply, #pk_U2GS_Friend2BanWithUnban_Reply{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2BanWithDel_Reply, #pk_U2GS_Friend2BanWithDel_Reply{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2BanWithUnbanAndDel_Reply, #pk_U2GS_Friend2BanWithUnbanAndDel_Reply{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2Unban_Request, #pk_U2GS_Friend2Unban_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2FormalOP_Request, #pk_U2GS_Friend2FormalOP_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2FormalChat_Request, #pk_U2GS_Friend2FormalChat_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2FormalChatVoice_Request, #pk_U2GS_Friend2FormalChatVoice_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2ForLook_Request, #pk_U2GS_Friend2ForLook_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2WantChat_Request, #pk_U2GS_Friend2WantChat_Request{} = Msg) ->
    playerFriend:msg(Msg);
%% 以上主要是本地好友相关协议，部分兼容跨服好友
%% 以下是纯粹跨服好友相关协议
handle(?U2GS_Friend2CrossAll_Request, #pk_U2GS_Friend2CrossAll_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2CrossAdd_Request, #pk_U2GS_Friend2CrossAdd_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2CrossAdd2_Request, #pk_U2GS_Friend2CrossAdd2_Request{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2CrossDel_Request, #pk_U2GS_Friend2CrossDel_Request{} = Msg) ->
    playerFriend:msg(Msg);
%% 跨服好友找回相关协议
handle(?U2GS_Friend2GetBack_Ignore, #pk_U2GS_Friend2GetBack_Ignore{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2GetBack_Add, #pk_U2GS_Friend2GetBack_Add{} = Msg) ->
    playerFriend:msg(Msg);
handle(?U2GS_Friend2GetBack_OneKeyToAdd, #pk_U2GS_Friend2GetBack_OneKeyToAdd{} = Msg) ->
    playerFriend:msg(Msg);
%% 梳理好友系统（本地好友+跨服好友） end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 赠礼（以前把点赞做到CMD_U2GS_Friend2FormalOP_Requestle了，类似的赠礼功能很尴尬地在边边望着）
handle(?U2GS_Gift_Request, #pk_U2GS_Gift_Request{tarRoleID = TarRoleID, itemID = ItemID, itemCount = ItemCount, content = Content}) ->
    
    playerIdentity:giveGift(TarRoleID, ItemID, ItemCount, Content),
    ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 约会地下城 begin

%% 进入地图
handle(?U2GS_DateEnter_Request, #pk_U2GS_DateEnter_Request{id = ID} = _Msg) ->
    
    %?DEBUG("[DebugForDate] CMD_U2GS_DateEnter_Request ~p", [_Msg]),
    playerDate:enterTry(ID, false),
    ok;

%% 手动重置宝石阵请求
handle(?U2GS_DateLink_ResetGem_Request, #pk_U2GS_DateLink_ResetGem_Request{} = _Msg) ->
    
    %?DEBUG("[DebugForDate] CMD_U2GS_DataLink_ResetGem_Request"),
    playerDate:link_reshuffle(false),
    ok;

%% 宝石的选中与取消请求
handle(?U2GS_DateLink_Select_Request, #pk_U2GS_DateLink_Select_Request{x = X, y = Y, index = Index, isSelect = IsSelect} = _Msg) ->
    
    %?DEBUG("[DebugForDate] CMD_U2GS_DateLink_Select_Request ~p", [_Msg]),
    playerDate:link(Index, {X, Y}, IsSelect, 0),
    ok;

%% 放弃游戏
handle(?U2GS_DateLink_Giveup_Requset, #pk_U2GS_DateLink_Giveup_Requset{} = _Msg) ->
    
    %?DEBUG("[DebugForDate] CMD_U2GS_DateLink_Giveup_Requset ~p", [_Msg]),
    playerDate:link_giveup(true),
    ok;


%% 约会地下城 --- 推箱子 begin

%% 碰到箱子请求
handle(?U2GS_DatePushBox_Request, #pk_U2GS_DatePushBox_Request{code = Code, x = X, z = Z, isDelete = IsDelte} = _Msg) ->
    
    %?DEBUG("[DebugForDate] CMD_U2GS_DateLink_Select_Request ~p", [_Msg]),
    playerDate:touchBox(Code, {X, Z}, IsDelte, 0),
    ok;


%% 约会地下城 --- 泳池派对 begin
%% 碰到箱子请求
handle(?U2GS_DateShooting_Over, #pk_U2GS_DateShooting_Over{} = _Msg) ->
    
    %?DEBUG("[DebugForDate] CMD_U2GS_DateLink_Select_Request ~p", [_Msg]),
    playerDate:poolShooting(0),
    ok;


%% 约会地下城 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 材料副本 begin

handle(?U2GS_UpTower, #pk_U2GS_UpTower{dataID = DataID, type = Type}) ->
    playerMaterialCopy:updateTower(DataID, Type),
    ok;

%% 材料副本 begin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 金币副本 begin

%% 放弃游戏
handle(?U2GS_MoneyDungeonGiveup, #pk_U2GS_MoneyDungeonGiveup{} = _Msg) ->
    %?DEBUG("[DebugForMoneyDungeon] CMD_U2GS_MoneyDungeonGiveup ~p", [_Msg]),
    playerMoneyDungeon:giveup(),
    ok;

%% 手动下一波
handle(?U2GS_MoneyDungeonNext, #pk_U2GS_MoneyDungeonNext{} = _Msg) ->
    %?DEBUG("[DebugForMoneyDungeon] CMD_U2GS_MoneyDungeonNext ~p", [_Msg]),
    playerMoneyDungeon:next(),
    ok;

%% 金币副本 begin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 姻缘系统 begin

%% 查询好友列表（姻缘系统专供）
handle(?U2GS_Friend2FormalForMarriage_Request, #pk_U2GS_Friend2FormalForMarriage_Request{page = Page} = _Msg) ->
    
    playerMarriage:queryList_Formal(Page),
    ok;

%% 求婚请求
handle(?U2GS_MarriagePropose_Request, #pk_U2GS_MarriagePropose_Request{id = ID, item = Item, manifesto = Manifesto} = _Msg) ->
    
    playerMarriage:wantBuild(ID, Item, Manifesto),
    ok;

%% 被求婚者反馈
handle(?U2GS_MarriagePropose_Reply, #pk_U2GS_MarriagePropose_Reply{id = ID, isAgreed = IsAgreed} = _Msg) ->
    
    playerMarriage:beBuild(ID, IsAgreed),
    ok;

%% 离婚请求
handle(?U2GS_MarriageBreak_Request, #pk_U2GS_MarriageBreak_Request{isTeam = IsTeam} = _Msg) ->
    
    playerMarriage:break(IsTeam),
    ok;

%% 夫妻技能升级
handle(?U2GS_MarriageSkillUp_Request, #pk_U2GS_MarriageSkillUp_Request{cost = Cost, id = ID} = _Msg) ->
    
%%	playerMarriage:skillUp(Cost, ID),
    ok;

%% 婚戒升级
handle(?U2GS_MarriageRingUp_Request, #pk_U2GS_MarriageRingUp_Request{cost = Cost} = _Msg) ->
    
    playerMarriage:ringUp(Cost),
    ok;

%% 情缘任务_接受
handle(?U2GS_MarriageAcceptTask_Request, #pk_U2GS_MarriageAcceptTask_Request{} = _Msg) ->
    
    playerMarriageTask:acceptTask(),
    ok;

%% 情缘任务_提交
handle(?U2GS_MarriageSubmitTask_Request, #pk_U2GS_MarriageSubmitTask_Request{} = _Msg) ->
%%	playerMarriageTask:leaderSubmitTask(),
    ok;

%% 情缘任务_队长反馈是否要召唤
handle(?U2GS_MarriageTask_Together_Reply1, #pk_U2GS_MarriageTask_Together_Reply1{isAgreed = IsAgreed} = _Msg) ->
    playerMarriageTask:mc_LeaderReply(IsAgreed),
    ok;

%% 情缘任务_队员反馈是否接受召唤
handle(?U2GS_MarriageTask_Together_Reply2, #pk_U2GS_MarriageTask_Together_Reply2{isAgreed = IsAgreed} = _Msg) ->
    playerMarriageTask:mc_partnerReply(IsAgreed),
    ok;

%% 姻缘系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版骑宠领地 begin

%% 查询自己的领地信息
handle(?U2GS_QueryTerritoryInfo_Request, #pk_U2GS_QueryTerritoryInfo_Request{isOpenPanel = IsOpenPanel} = _Msg) ->
    
    ok;

%% 查询自己的攻防记录
handle(?U2GS_QueryTerritoryHistory_Request, #pk_U2GS_QueryTerritoryHistory_Request{attackOrDefense = _AOD} = _Msg) ->
    
    %% playerPetTerritory:queryHistory(AOD), LUNA-8656 【服务器】骑宠领地掠夺玩法功能屏蔽
    ok;

%% 开采请求
handle(?U2GS_TerritoryExploit_Request, #pk_U2GS_TerritoryExploit_Request{territoryID = TerritoryID, listPetID = ListPetID, cfgTime = CfgTime, cfgLevel = CfgLevel} = _Msg) ->
    
    playerPetTerritory:exploit(TerritoryID, ListPetID, CfgTime, CfgLevel),
    ok;

%% 搜索请求
handle(?U2GS_FindTerritory_Request, #pk_U2GS_FindTerritory_Request{roleID = _RoleID} = _Msg) ->
    
    %%playerPetTerritory:search(RoleID),  LUNA-8656 【服务器】骑宠领地掠夺玩法功能屏蔽
    ok;

%% 掠夺请求
handle(?U2GS_TerritoryPlunder_Request, #pk_U2GS_TerritoryPlunder_Request{} = _Msg) ->
    
    %%playerPetTerritory:plunder(RoleID, TerritoryID, ListPetID),  LUNA-8656 【服务器】骑宠领地掠夺玩法功能屏蔽
    ok;

%% 精力查询
handle(?U2GS_TerritoryVigor_Request, #pk_U2GS_TerritoryVigor_Request{} = _Msg) ->
    
    playerPetTerritory:queryVigor(),
    ok;

%% 新版骑宠领地 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 怪物图鉴 begin
handle(?U2GS_MonsterBook_Request, #pk_U2GS_MonsterBook_Request{} = Msg) ->
    
    playerMonsterBook:msg(Msg);
handle(?U2GS_MonsterBookSnap_Request, #pk_U2GS_MonsterBookSnap_Request{} = Msg) ->
    
    playerMonsterBook:msg(Msg);
handle(?U2GS_MonsterBookUnlock_Request, #pk_U2GS_MonsterBookUnlock_Request{} = Msg) ->
    
    playerMonsterBook:msg(Msg);
handle(?U2GS_MonsterBookReward_Request, #pk_U2GS_MonsterBookReward_Request{} = Msg) ->
    
    playerMonsterBook:msg(Msg);
%% 怪物图鉴 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

handle(?U2GS_SevenDayAimReward_Request, #pk_U2GS_SevenDayAimReward_Request{id = ID}) ->
    
    playerSevenDayAim:reward(ID),
    ok;

handle(?U2GS_ThirtyDayLoginGift_Request, #pk_U2GS_ThirtyDayLoginGift_Request{id = ID}) ->
    
    playerThirtyDayLoginGift:reward(ID),
    ok;

handle(?U2GS_MoneyTree, #pk_U2GS_MoneyTree{}) ->
    
    playerMoneyTree:giveMeMoney(),
    ok;

handle(?U2GS2U_CopyMapScheduleShow2, #pk_U2GS2U_CopyMapScheduleShow2{mapID = MapID, show2ID = Show2ID, groupID = GroupID, scheduleID = ScheduleID, isInit = IsInit}) ->
    ?DEBUG("[DebugForShow2] CMD_U2GS2U_CopyMapScheduleShow2 MapID:~w Show2ID:~w GroupID:~w ScheduleID:~w IsInit:~w", [MapID, Show2ID, GroupID, ScheduleID, IsInit]),
    playerCopyMap:show2(MapID, Show2ID, GroupID, ScheduleID, IsInit),
    ok;

handle(?U2GS_HisoryForce_Request, #pk_U2GS_HisoryForce_Request{}) ->
    Msg = #pk_GS2U_HisoryForce_Ack{
        maxAll = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
        maxNotPet = playerPropSync:getProp(?SerProp_PlayerHistoryForceNoPet)
    },
    player_pub:send_net_msg(Msg),
    ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

handle(?U2GS_RenewChangeCarrer, #pk_U2GS_RenewChangeCarrer{newCareer = NewCareer} = _Msg) ->
    
    playerCareerChange:rechooseChangeCareer(NewCareer),
    ok;


handle(?U2GS_ChangeCarrer, #pk_U2GS_ChangeCarrer{newCareer = NewCareer} = _Msg) ->
    
    playerCareerChange:change(NewCareer),
    ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 跨服骑宠竞速 begin
%%handle(?U2GS_RaceApply_Request, #pk_U2GS_RaceApply_Request{} = Msg) -> playerRace:msg(Msg);    %% 废弃旧协议
%%handle(?U2GS_RaceCancel_Request, #pk_U2GS_RaceCancel_Request{} = Msg) -> playerRace:msg(Msg);  %% 废弃旧协议
handle(?U2GS_RaceMapItem_Request, #pk_U2GS_RaceMapItem_Request{} = Msg) -> playerRace:msg(Msg);  %% 保留旧协议
%% 下述新协议
handle(?U2GS_RaceSelectPet, #pk_U2GS_RaceSelectPet{} = Msg) -> playerRace:msg(Msg);
handle(?U2GS2U_RaceAutoMatch, #pk_U2GS2U_RaceAutoMatch{} = Msg) -> playerRace:msg(Msg);
handle(?U2GS_RaceInviteList, #pk_U2GS_RaceInviteList{} = Msg) -> playerRace:msg(Msg);
handle(?U2GS_RaceInvite_A2S, #pk_U2GS_RaceInvite_A2S{} = Msg) -> playerRace:msg(Msg);
handle(?U2GS_RaceInvite_B2S, #pk_U2GS_RaceInvite_B2S{} = Msg) -> playerRace:msg(Msg);
handle(?U2GS_RaceApply, #pk_U2GS_RaceApply{} = Msg) -> playerRace:msg(Msg);
handle(?U2GS_RaceCancel, #pk_U2GS_RaceCancel{} = Msg) -> playerRace:msg(Msg);
%% 跨服骑宠竞速 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 跨服活动-大逃杀 begin
handle(?U2GS_AliveApply_Request, #pk_U2GS_AliveApply_Request{} = Msg) -> playerAlive:msg(Msg);
handle(?U2GS_AliveCancel_Request, #pk_U2GS_AliveCancel_Request{} = Msg) -> playerAlive:msg(Msg);
handle(?U2GS_AliveEnterSafeArea_Request, #pk_U2GS_AliveEnterSafeArea_Request{} = Msg) -> playerAlive:msg(Msg);
%% 跨服活动-大逃杀 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 家族BOSS begin
handle(?U2GS_RequestGuildBossInfo, #pk_U2GS_RequestGuildBossInfo{}) ->
    
    playerGuildBoss:requestGuildBossPanelInfo();
handle(?U2GS_RequestEnterGuildBoss, #pk_U2GS_RequestEnterGuildBoss{rquestBosslevel = RquestBosslevel}) ->
    
    playerGuildBoss:requestInGuildBossMap(RquestBosslevel);
handle(?U2GS_RequestGuildRank, #pk_U2GS_RequestGuildRank{}) ->
    
    playerGuildBoss:requestGuildRank();
handle(?U2GS_GuildBossBuyBuff, #pk_U2GS_GuildBossBuyBuff{buffID = BuffID}) ->
    
    playerGuildBoss:buyGuildBossBuff(BuffID);
handle(?U2GS_MyGuildKllBossRank, #pk_U2GS_MyGuildKllBossRank{guildLevel = GuildLevel}) ->
    
    playerGuildBoss:requestMyGuildKillBossRank(GuildLevel);

%% 家族BOSS end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 体力领取 start
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
handle(?U2GS_EveryDayGetPower, #pk_U2GS_EveryDayGetPower{}) ->
    %%
    %%playerGetPower:getPower(Stata);
    ok;


%% 体力领取 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 集字活动 begin
handle(?U2GS_RequestCollectionWordsAward, #pk_U2GS_RequestCollectionWordsAward{requestAwardID = AwardID}) ->
    
    playerCollectionWords:requestCollectionWordsAward(AwardID);
%% 集字活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 头像举报 begin
handle(?U2GS_Report_Request, #pk_U2GS_Report_Request{tarRoleID = TarRoleID}) ->
    
    playerReport:requestReport(TarRoleID);
%% 头像举报 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 团购活动 begin

handle(?U2GS_GroupBuyWhenOpen, #pk_U2GS_GroupBuyWhenOpen{} = Msg) -> playerGroupBuy:msg(Msg);  %%打开团购活动请求
handle(?U2GS_GroupBuyGoodsBuyRequest, #pk_U2GS_GroupBuyGoodsBuyRequest{} = Msg) ->
    playerGroupBuy:msg(Msg);  %%团购活动购买请求
handle(?U2GS_GroupBuyRewardBuyRequest, #pk_U2GS_GroupBuyRewardBuyRequest{} = Msg) ->
    playerGroupBuy:msg(Msg);  %%积分领取奖励请求

%% 团购活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 时装新品折扣活动 begin

handle(?U2GS_FashionBuyRequest, #pk_U2GS_FashionBuyRequest{} = Msg) -> playerFashion:msg(Msg);  %%时装新品折扣活动请求购买/赠送
handle(?U2GS_FashionThanksMail, #pk_U2GS_FashionThanksMail{} = Msg) -> playerFashion:msg(Msg);  %%玩家收到奖励发送感谢邮件

%% 时装新品折扣活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 限时礼包/直购礼包 begin

handle(?U2GS_DeadLineGiftBuy, #pk_U2GS_DeadLineGiftBuy{} = Msg) -> playerDeadlineGift:msg(Msg);  %%直购礼包商品购买请求
handle(?U2GS_DeadLineGiftOpen, #pk_U2GS_DeadLineGiftOpen{} = Msg) -> playerDeadlineGift:msg(Msg);  %%直购礼包界面打开请求

%% 限时礼包/直购礼包 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 玩家头像框 begin

handle(?U2GS_GetPortraitFrameList, #pk_U2GS_GetPortraitFrameList{} = Msg) -> playerFrame:msg(Msg);  %%获取所有头像框
handle(?U2GS_OperatePortraitFrame, #pk_U2GS_OperatePortraitFrame{} = Msg) -> playerFrame:msg(Msg);  %%操作某个头像

%% 玩家头像框 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 韩国naver论坛独立需求活动 begin

handle(?U2GS_KoreaNaverRewardGetRequest, #pk_U2GS_KoreaNaverRewardGetRequest{} = Msg) ->
    playerKoreaNave:msg(Msg);  %% 奖励领取请求

%% 韩国naver论坛独立需求活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% lbs start
handle(?U2GS_LBS_Request, #pk_U2GS_LBS_Request{} = Msg) -> playerLBS:msg(Msg);
handle(?U2GS_LBS_BesideRole_Request, #pk_U2GS_LBS_BesideRole_Request{} = Msg) -> playerLBS:msg(Msg);

%% lbs end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

handle(?U2GS_BusinessSupperGift_Request, #pk_U2GS_BusinessSupperGift_Request{}) ->
    playerRecharge:signIn(),
    ok;

handle(?U2GS_BusinessCashDailyGift_Request, #pk_U2GS_BusinessCashDailyGift_Request{}) ->
    playerRecharge:getCashDailyGift(),
    ok;

handle(?U2GS_save_current_guide_id, #pk_U2GS_save_current_guide_id{guideID = _CurrentGuideID}) ->
    ok;
handle(?U2GS_IsOpenMapPanel, #pk_U2GS_IsOpenMapPanel{}) ->
    ok;
handle(?U2GS_RequestFloatingAward, #pk_U2GS_RequestFloatingAward{pieceID = PieceID}) ->
    playerFloatingManual:requstFloatingAward({PieceID});

handle(?U2GS_RequestEnterNvasionMap, #pk_U2GS_RequestEnterNvasionMap{} = Msg) -> playerNightNvasion:msg(Msg);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 角色觉醒 start
handle(?U2GS_ExpToVigour, #pk_U2GS_ExpToVigour{useExpValue = UseExpVlaue}) ->
    
    case playerAwake:isHasOpen() of
        true ->
            playerAwake:expToVigour(UseExpVlaue);
        _ ->
            skip
    end;


handle(?U2GS_RoleAwakeing, #pk_U2GS_RoleAwakeing{stage = Stage, stone = Stone, awakeParam = Param}) ->
    
    case playerAwake:isHasOpen() of
        true ->
            playerAwake:roleAwakeing(Stage, Stone, Param);
        _ ->
            skip
    end;

handle(?U2GS_ResetRoleAwake, #pk_U2GS_ResetRoleAwake{}) ->
    
    case playerAwake:isHasOpen() of
        true ->
            playerAwake:resetRoleAwake();
        _ ->
            skip
    end;

handle(?U2GS_UseTheAwakeBuff, #pk_U2GS_UseTheAwakeBuff{}) ->
    case playerAwake:isHasOpen() of
        true ->
            playerAwake:useTheAwakeBuff();
        _ ->
            skip
    end;

handle(?U2GS_StopTheAwakeBuff, #pk_U2GS_StopTheAwakeBuff{}) ->
    case playerAwake:isHasOpen() of
        true ->
            playerAwake:stopTheAwakeBuff();
        _ ->
            skip
    end;

%% 角色觉醒 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 问卷调查领奖 start
handle(?U2GS_GetQuestionnaireSurveyAward, #pk_U2GS_GetQuestionnaireSurveyAward{}) ->
    playerKoreaNave:getQuestionnaireSurveyAward(),
    ok;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 问卷调查 end


%% 节日活动 start
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
handle(?U2GS_EnterFestivalCopy, #pk_U2GS_EnterFestivalCopy{festivalID = FestivalID, type = Type}) ->
    
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_FestivalCopy) of
        true ->
            playerFestivalCopy:requestEnterFestivalCopy(FestivalID, Type);
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;

handle(?U2GS_BuyFestivalPacket, #pk_U2GS_BuyFestivalPacket{festivalID = FestivalID, packetID = PacketID, buynum = BuyNum}) ->
    
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_FestivalCopy) of
        true ->
            playerFestivalCopy:requestBuyFestivalGift(FestivalID, PacketID, BuyNum);
        _ ->
            sendErrorCodeMsg(?ErrorCode_SystemNotOpen)
    end,
    ok;
%% 节日活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 转职被动技能 start
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
handle(?U2GS_PassiveUpSkill, #pk_U2GS_PassiveUpSkill{id = Id}) ->
    
    case playerSkillLearn:isCareerPassHasOpen() of
        true ->
            playerSkillLearn:upPassiveSkill(Id);
        _ ->
            skip
    end,

    ok;
%% 转职被动技能 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


handle(?U2GS_appointmentWedding, #pk_U2GS_appointmentWedding{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_InvitedPerson, #pk_U2GS_InvitedPerson{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_Openketubba, #pk_U2GS_Openketubba{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_Givegifs, #pk_U2GS_Givegifs{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_OpenInvitePanel, #pk_U2GS_OpenInvitePanel{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_EnterWeddingMap, #pk_U2GS_EnterWeddingMap{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_UseNpcInteractive, #pk_U2GS_UseNpcInteractive{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_BuyLuckyBag, #pk_U2GS_BuyLuckyBag{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_WeddingLottery, #pk_U2GS_WeddingLottery{} = Msg) -> playerWedding:msg(Msg);
handle(?U2GS_RobWeddingRed, #pk_U2GS_RobWeddingRed{} = Msg) -> playerWedding:msg(Msg);


%%over
%% ~~~~~~~婚礼

handle(_Cmd, _Msg) ->
    ?ERROR("playerOtp receive socket undefined, cmd:~p msg:~p", [_Cmd, _Msg]),
    ok.
%%handle(#pk_U2GS_RequestCreatePlayer{
%%    name = Name, camp = Camp,
%%    career = Career, race = Race,
%%    sex = Sex, head = Head
%%}) ->
%%    player_priv:create_player(Name, Career, Race, Sex, Head, Camp),
%%    ok;
%%handle(#pk_U2GS_RequestDeletePlayer{uid = Uid}) ->
%%    player_priv:delete_player(Uid),
%%    ok;
%%handle(#pk_U2GS_SelPlayerEnterGame{uid = Uid}) ->
%%    player_priv:select_player(Uid),
%%    ok;
%%handle(#pk_U2GS_GetPlayerInitData{}) ->
%%%%    lib_player_base:send_init_data(),
%%    ok;
%%handle(#pk_U2GS_PlayerWalk{dst_x = DX, dst_y = DY, speed = Speed}) ->
%%    Tar = vector3:new(DX, 0, DY),
%%    player_base:start_walk(Tar, Speed),
%%    %% 移动_同步_调试日志
%%    %% ?DEBUG("~p move to ~w",[player_rw:get_uid(), Tar]),
%%    ok;
%%handle(#pk_U2GS_PlayerStopWalk{cur_x = X, cur_y = Y}) ->
%%    Pos = vector3:new(X, 0, Y),
%%    player_base:stop_move(Pos),
%%    %% 移动_同步_调试日志
%%    %% ?DEBUG("~p client stop ~w",[player_rw:get_uid(), Pos]),
%%    ok;
%%handle(#pk_U2GS_UseSkill{tar_uids = Tar, x = X, y = Y, skill_id = SkillId, serial = Serial}) ->
%%    Pos = vector3:new(X, 0, Y),
%%    player_combat:use_skill(SkillId, Tar, Pos, Serial),
%%    ok;
%%handle(#pk_U2GS_SkillInterrupt{}) ->
%%    ok;
%%handle(#pk_U2GS_ChangeMap{map_id = MapId, x = X, y = Y}) ->
%%    Pos = vector3:new(X, 0, Y),
%%    ?DEBUG("### client request change to map ~p", [MapId]),
%%    player_pub:change_map_(MapId, 0, Pos),
%%    ok;
%%handle(#pk_U2GS_GetRemoteObjInfo{uids = UidList}) ->
%%    Uid = player_rw:get_uid(),
%%    #m_player_map{map_pid = MapPid} = player_rw:get_map(),
%%    ps:send(MapPid, net_msg_get_remote_obj_info, {Uid, UidList, self()}),
%%    ok;
%%handle(#pk_U2GS_Chat{content = Content}) ->
%%    case player_gm:is_gm(Content) of
%%        true -> player_gm:on_gm(Content);
%%        _Any -> skip
%%    end,
%%    ok;
%%handle(#pk_U2GS_Revive{}) ->
%%    player_revive:revive(),
%%    ok;
%%handle(_Msg) ->
%%    ?DEBUG("~p", [Msg]),
%%    ok.


sendTipsErrorCodeMsg(ErrorCode) when ErrorCode > 0 andalso erlang:is_integer(ErrorCode) ->
    sendErrorCodeMsg(ErrorCode).

sendErrorCodeMsg(ErrorCode) when ErrorCode > 0 andalso erlang:is_integer(ErrorCode) ->
    sendErrorCodeMsg(ErrorCode, []).

sendErrorCodeMsg(undefined, _ErrorCode) ->
    ok;
sendErrorCodeMsg(NetPid, ErrorCode) when erlang:is_integer(ErrorCode) andalso ErrorCode > 0 andalso erlang:is_pid(NetPid) ->
    sendErrorCodeMsg(NetPid, ErrorCode, []);
sendErrorCodeMsg(ErrorCode, Params) when erlang:is_list(Params) ->
    case getErrorCodeMsg(ErrorCode, Params) of
        #pk_GS2U_Error{} = ErrorMsg ->
            player_pub:send_net_msg(ErrorMsg);
        _Error ->
            ok
    end.

-spec sendErrorCodeMsg(NetPid :: pid(), ErrorCode :: uint(), Params :: list()) -> ok.
sendErrorCodeMsg(NetPid, ErrorCode, Params) ->
    case getErrorCodeMsg(ErrorCode, Params) of
        #pk_GS2U_Error{} = ErrorMsg ->
            player_pub:send_net_msg(ErrorMsg);
        _Error ->
            ok
    end.

getErrorCodeMsg(ErrorCode) ->
    getErrorCodeMsg(ErrorCode, []).

-spec getErrorCodeMsg(ErrorCode :: uint(), Params :: list()) -> #pk_GS2U_Error{} | error.
getErrorCodeMsg(ErrorCode, Params) when erlang:is_list(Params) ->
    case lists:keyfind(ErrorCode, 1, ?ErrorCodeParams) of
        {ErrorCode, []} ->
            #pk_GS2U_Error{errorCode = ErrorCode, params = []};
        {ErrorCode, NeedParams} ->
            case erlang:length(Params) =:= erlang:length(NeedParams) of
                true ->
                    RealParams = [to_string(Need, Term) || {Need, Term} <- lists:zip(NeedParams, Params)],
                    #pk_GS2U_Error{errorCode = ErrorCode, params = RealParams};
                false ->
                    ?ERROR("not match params:code=~p,~p,~p", [ErrorCode, Params, misc:getStackTrace()]),
                    #pk_GS2U_Error{errorCode = ?ErrorCode_SystemGatherSuccess, params = []}
            end;
        false ->
            ?ERROR(" ==>　no this errorCode:~p,bt=~p", [ErrorCode, misc:getStackTrace()]),
            #pk_GS2U_Error{errorCode = ?ErrorCode_System_Error_Unknow, params = []}
    end;
getErrorCodeMsg(ErrorCode, Params) ->
    ?ERROR("error params{~p:~p}", [ErrorCode, Params]),
    #pk_GS2U_Error{errorCode = ?ErrorCode_System_Error_Unknow, params = []}.

-spec to_string(i|d|u|s|f|l, int()|uint()|string()|float()) ->
    string().
to_string(i, Int) when erlang:is_integer(Int) ->
    misc:term_to_string(Int);
to_string(d, Int) ->
    to_string(i, Int);
to_string(u, Uint) when Uint >= 0 ->
    to_string(i, Uint);
to_string(l, Uint64) when Uint64 >= 0 ->
    to_string(i, Uint64);
to_string(s, Str) when erlang:is_list(Str) ->
    Str;
to_string(f, Float) when erlang:is_float(Float) ->
    misc:term_to_string(Float);
to_string(TermFlag, Term) ->
    ?ERROR("param error, flag, Term{~p, ~p}~n~p", [TermFlag, Term, misc:getStackTrace()]).




modifySkillTargetCodeList(TargetCodeList) ->
    PlayerEts = playerState:getMapPlayerEts(),
    PetEts = playerState:getMapPetEts(),
    MonsterEts = playerState:getMapMonsterEts(),
    F =
        fun(Code, {AccCodes, DisableCodes}) ->
            case codeMgr:getObjectTypeByCode(Code) of
                ?ObjTypePlayer ->
                    case ets:lookup(PlayerEts, Code) of
                        [#recMapObject{} | _] ->
                            {[Code | AccCodes], DisableCodes};
                        _ ->
                            {AccCodes, [Code | DisableCodes]}
                    end;
                ?ObjTypeMonster ->
                    case ets:lookup(MonsterEts, Code) of
                        [#recMapObject{} | _] ->
                            {[Code | AccCodes], DisableCodes};
                        _ ->
                            {AccCodes, [Code | DisableCodes]}
                    end;
                ?ObjTypePet ->
                    case ets:lookup(PetEts, Code) of
                        [#recMapObject{} | _] ->
                            {[Code | AccCodes], DisableCodes};
                        _ ->
                            {AccCodes, [Code | DisableCodes]}
                    end;
                _ ->
                    {AccCodes, DisableCodes}
            end
        end,
    case lists:foldl(F, {[], []}, lists:reverse(TargetCodeList)) of
        {TargetCodeList, _} ->
            TargetCodeList;
        {Codes, DisableCodeList} ->
            playerMap:syncDisableViewObj(DisableCodeList),
            % fixme 此处应是数据不同步的问题，但日志量较大，暂时屏蔽掉，需要尽早解决
            %?ERROR_OUT("checkSkillTargetCodeList ~p -> ~p [DisableCodeList:~p]",
            %	[TargetCodeList, Codes, DisableCodeList]),
            Codes
    end.