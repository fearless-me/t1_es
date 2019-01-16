%%%-------------------------------------------------------------------
%%% @author xiangqin
%%% @copyright (C) 2018, <COMPANY>
%%% @doc玩家举报头像功能
%%%
%%% @end
%%% Created : 22. 二月 2018 11:54
%%%-------------------------------------------------------------------
-module(playerReport).
-include("playerPrivate.hrl").
%% API
-export([requestReport/1,
        requestReport1/1,
        setNum/0,
        sendReportNumToClient/0,
        saveGMReportLog/3,
        reOpened/0,
        bolckPhoto/1,
        delIsResetPhoto/0
]).

-define(InitNum, 0).
%%玩家请求举报头像
-spec requestReport(TarRoleID :: uint64()) -> no_return().
requestReport(TarRoleID) ->
    RoleID = playerState:getRoleID(),
    case RoleID =:= TarRoleID of
        true ->
            skip;
        _ ->
            ReportRoleInfo = getRoleInfo(RoleID),
            case core:queryPlayerPidByRoleID(TarRoleID) of
                offline ->
                    playerMsg:sendErrorCodeMsg(?ErrorCode_Head_Report_Offline);%%角色离线中，举报无效
                Pid ->
                    case playerIdentity:queryFace(TarRoleID) == [] orelse playerIdentity:queryFace(TarRoleID) == "" of
                        false ->
                            case canReportSameRole(TarRoleID) of
                                true ->
                                    case canReportOtherRole() of
                                        true ->
                                            addReportList(TarRoleID),
                                            sendReportNumToClient(),
                                            psMgr:sendMsg2PS(Pid, reportPic, [TarRoleID,getPlayerNetPid(),ReportRoleInfo]),
                                            playerMsg:sendErrorCodeMsg(?ErrorCode_Head_Report_Success);%%举报成功
                                        ErrorCode ->
                                            playerMsg:sendErrorCodeMsg(ErrorCode)%%举报过于频繁，请稍事休息…
                                    end;
                                ErrorCode ->
                                    playerMsg:sendErrorCodeMsg(ErrorCode)%% 您已经举报过这位玩家，待工作人员核实后进行处理…
                            end;
                        _ ->
                            playerMsg:sendErrorCodeMsg(?ErrorCode_Head_Report_NoHead)%%该玩家无自定义头像，举报无效
                    end
            end
    end.
requestReport1([TarRoleID,_PlayerNetPid,ReportRoleInfo]) ->
    BeReportRoleInfo = getRoleInfo(TarRoleID),
    OldProp = playerPropSync:getProp(?SerProp_ReportPic),
    NewProp =
        case OldProp of
            [] ->
                [misc_time:localtime_seconds(),?InitNum + 1];
            [_OldTime,OldNum] ->
                [misc_time:localtime_seconds(),OldNum + 1]
        end,
    [_NewTime,NewNum] = NewProp,
    playerPropSync:setAny(?SerProp_ReportPic,NewProp),
    ?DEBUG("_NewTime:~w,NewNum:~w",[_NewTime,NewNum]),
    case NewNum >= getCfgNum() of
        true ->
            %%setNum(),%%举报次数清零
            playerIdentity:editIdentity(?IDIT_FACE, []),%%将玩家的自定义头像替换为系统头像
            TimeCfg = getCfgTime(),
            TimeNext = misc_time:localtime_seconds() + TimeCfg,
            playerPropSync:setInt64(?PriProp_Report_Time, TimeNext),
            TimeHour = erlang:trunc(TimeCfg/3600),%%将秒转换为小时
            ?DEBUG("TimeCfg:~w,TimeNext:~w,TimeHour~w",[TimeCfg,TimeNext,TimeHour]),
            Info = saveReportLog(ReportRoleInfo,BeReportRoleInfo,time2:getTimestampSec() + TimeCfg),
            gsSendMsg:sendMsg2DBServer(updatePlayerReportToDB, 0, {insert, Info}),
            MailTitle = stringCfg:getString(head_Report_eamil_1),
            MailContent = stringCfg:getString(head_Report_eamil_2,[TimeHour]),
            mail:sendSystemMail(TarRoleID, MailTitle, MailContent, [], []);
        _ ->
            Info = saveReportLog(ReportRoleInfo,BeReportRoleInfo,0),
            gsSendMsg:sendMsg2DBServer(updatePlayerReportToDB, 0, {insert, Info}),
            skip
    end.

%%获取被举报的上限次数
getCfgNum() ->
    #globalsetupCfg{setpara = [Num]} =
        getCfg:getCfgPStack(cfg_globalsetup, head_Report_num),
    Num.

%%获取惩罚时间,单位秒
getCfgTime() ->
    #globalsetupCfg{setpara = [Time]} =
        getCfg:getCfgPStack(cfg_globalsetup, head_Report_time),
    Time.
%%将目标对象举报次数清零
setNum() ->
   playerPropSync:setAny(?SerProp_ReportPic,[misc_time:localtime_seconds(),?InitNum]).

%%获取举报同一角色CD 单位小时
getCfgSameRoleCD() ->
    #globalsetupCfg{setpara = [CD]} =
        getCfg:getCfgPStack(cfg_globalsetup, head_report_Z),
    CD.

%%同一角色Z小时内不可重复举报同一角色
canReportSameRole(TarRoleID) ->
    NowTime = misc_time:localtime_seconds(),
    ReportList = playerPropSync:getProp(?SerProp_ReportList),
    case lists:keyfind(TarRoleID, 1, ReportList) of
        {_RoleID,Time} ->
            TimeDiff = NowTime - Time,
            case TimeDiff > getCfgSameRoleCD() * 3600 of
                true->
                    true;
                _ ->
                    ?ErrorCode_Head_Report_SameCD
            end;
        _ ->
            true
    end.
%%添加到举报列表
addReportList(TarRoleID) ->
    ReportList = playerPropSync:getProp(?SerProp_ReportList),
    NewReportList = lists:keystore(TarRoleID, 1, ReportList,{TarRoleID,misc_time:localtime_seconds()}),
    playerPropSync:setAny(?SerProp_ReportList,NewReportList).
%%连续举报次数
getCfgReportNum() ->
    #globalsetupCfg{setpara = [Num]} =
        getCfg:getCfgPStack(cfg_globalsetup, head_report_Y),
    Num.

%%同一角色X分钟举报过多玩家
canReportOtherRole() ->
    case playerPropSync:getProp(?SerProp_ReportVersionNum) of
        [TimeVersion,ReportNum] ->
            CurTimeVersion = getCurTimeVersion(),
            case TimeVersion =:= CurTimeVersion of
                true ->
                    case ReportNum > getCfgReportNum() of
                        true ->
                            ?ErrorCode_Head_Report_DiffrentCD;
                        _ ->
                            playerPropSync:setAny(?SerProp_ReportVersionNum,[TimeVersion,ReportNum + 1]),
                           true
                    end;
                _ ->
                    playerPropSync:setAny(?SerProp_ReportVersionNum,[CurTimeVersion,?InitNum + 1]),
                    true
            end
    end.

%%获取当前举报周期
getCurTimeVersion() ->
    #globalsetupCfg{setpara = [Time]} =
        getCfg:getCfgPStack(cfg_globalsetup, head_report_X),
    NowTime = misc_time:localtime_seconds(),
    CurTimeVersion = NowTime div (Time * 3600),
    CurTimeVersion.

%%获取举报者的进程pid
getPlayerNetPid() ->
   playerState:getNetPid().

%%玩家上线发送举报头像次数
sendReportNumToClient() ->
    case playerPropSync:getProp(?SerProp_ReportVersionNum) of
        [_TimeVersion,ReportNum] ->
            playerMsg:sendNetMsg(#pk_GS2U_BeReportNum{num = ReportNum});
        _ ->
            playerMsg:sendNetMsg(#pk_GS2U_BeReportNum{num = ?InitNum})
    end.
%%获取举报者信息
getRoleInfo(RoleID) ->
    case core:queryRoleKeyInfoByRoleID(RoleID) of
        #?RoleKeyRec{accountID = AccountID,roleID = RoleID,roleName = RoleName} ->
            [AccountID,RoleID,RoleName];
        _ ->
            [0,0,""]
    end.

%%记录举报日志
saveReportLog(ReportRoleInfo,BeReportRoleInfo,EndTime) ->
    [AccountID,RoleID,RoleName] = ReportRoleInfo,
    [BeAccountID,BeRoleID,BeRoleName] = BeReportRoleInfo,
    Info = #rec_player_report{
        accountID = AccountID,
        roleID = RoleID,
        roleName = RoleName,
        beAccountID = BeAccountID,
        beRoleID = BeRoleID,
        beRoleName = BeRoleName,
        reportTime = time2:getTimestampSec(),
        endTime = EndTime
        },
    Info.

%%记录GM平台操作信息
saveGMReportLog(IsModify,BeRoleID,Status) ->
%%    TimeCfg = getCfgTime(),
    CurTime= time2:getTimestampSec(),
    EndTime = getEndTime(Status),%%平台使用时间
    TimeCfg = getCfgTime(),
    BlockTime = misc_time:localtime_seconds() + TimeCfg,%%延用之前的时间
        case Status of
            1 ->
                %%封禁操作
                %% 通知公共进程修改属性(设置为默认图片)
                case core:queryPlayerPidByRoleID(BeRoleID) of
                    offline ->
                        setOfflineTime(BeRoleID,BlockTime),
                        setIsReset(BeRoleID);
                    Pid ->
                        %% 在线，发给玩家模块去处理封禁
                        psMgr:sendMsg2PS(Pid, bolckPhoto, {BlockTime})
                end;
            0 ->
                case core:queryPlayerPidByRoleID(BeRoleID) of
                    offline ->
                        setOfflineTime(BeRoleID,0);
                    Pid ->
                        %% 在线，发给玩家模块去处理解封
                        psMgr:sendMsg2PS(Pid, reOpened, {})
                end
        end,
    {BeAccountID,BeRoleName} =
        case core:queryRoleKeyInfoByRoleID(BeRoleID) of
            #?RoleKeyRec{accountID = AccountID,roleName = RoleName} ->
                {AccountID,RoleName};
            _ ->
                ?DEBUG("role is notfound:~p"),
                {0,""}
        end,
    Info =
        case IsModify of
            0 ->
                #rec_player_report{
                    accountID = 0,
                    roleID = 0,
                    roleName = "",
                    beAccountID = BeAccountID,
                    beRoleID = BeRoleID,
                    beRoleName = BeRoleName,
                    reportTime = CurTime,%%此处相当于操作时间
                    endTime = EndTime
                };
            1 ->
                #rec_player_report{
                    beRoleID = BeRoleID,
                    endTime = EndTime
                }
        end,
    Info.

getEndTime(Status) ->
    TimeCfg = getCfgTime(),
    CurTime= time2:getTimestampSec(),
    EndTime =
        case Status of
            1 ->
                %%封禁操作
                TimeNext = CurTime + TimeCfg,
                TimeNext;
            0 ->
                %%解封操作
                0
        end,
    EndTime.

%%玩家不在线时设置玩家处罚时长
setOfflineTime(BeRoleID,EndTime) ->
    case ets:lookup(ets_rec_playerdata, BeRoleID) of
        [#rec_playerdata{rec_player_prop = LP0}] ->
            NewInfo =
                case lists:keyfind(?PriProp_Report_Time,#rec_player_prop.propIndex, LP0) of
                    false ->
                        #rec_player_prop{roleID = BeRoleID, propIndex = ?PriProp_Report_Time, propValue = misc:term_to_string(EndTime)};
                    #rec_player_prop{propValue = _Value} = OldInfo ->
%%                                            NewValue =  misc:string_to_term(Value),
                        OldInfo#rec_player_prop{propValue = misc:term_to_string(EndTime)}
                end,
            %% 写入同步属性的内存数据
            NewLP = lists:keystore(?PriProp_Report_Time, #rec_player_prop.propIndex, LP0,NewInfo),
            ets:update_element(ets_rec_playerdata, BeRoleID, [{#rec_playerdata.rec_player_prop, NewLP}]),
            %% 通知DB写入
            gsSendMsg:sendMsg2DBServer(commonSavePlayerProp, 0, [NewInfo]);
        _ ->
            skip
    end.

%%玩家不在线时设置玩家是否需要被重置头像
setIsReset(BeRoleID) ->
    case ets:lookup(ets_rec_playerdata, BeRoleID) of
        [#rec_playerdata{rec_player_prop = LP0}] ->
            NewInfo =
                case lists:keyfind(?SerProp_ReportReset,#rec_player_prop.propIndex, LP0) of
                    false ->
                        #rec_player_prop{roleID = BeRoleID, propIndex = ?SerProp_ReportReset, propValue = misc:term_to_string(1)};
                    #rec_player_prop{propValue = _Value} = OldInfo ->
%%                                            NewValue =  misc:string_to_term(Value),
                        OldInfo#rec_player_prop{propValue = misc:term_to_string(1)}
                end,
            %% 写入同步属性的内存数据
            NewLP = lists:keystore(?SerProp_ReportReset, #rec_player_prop.propIndex, LP0,NewInfo),
            ets:update_element(ets_rec_playerdata, BeRoleID, [{#rec_playerdata.rec_player_prop, NewLP}]),
            %% 通知DB写入
            gsSendMsg:sendMsg2DBServer(commonSavePlayerProp, 0, [NewInfo]);
        _ ->
            skip
    end.


%%玩家在线时解封玩家头像
reOpened() ->
    playerPropSync:setInt64(?PriProp_Report_Time, 0).

%%玩家在线时封禁玩家头像
bolckPhoto({BlockTime}) ->
    BeRoleID = playerState:getRoleID(),
    psMgr:sendMsg2PS(?PsNameIdentity, identity_edit, {?IDIT_FACE , BeRoleID, []}),
    playerPropSync:setInt64(?PriProp_Report_Time, BlockTime).
%%玩家上线时处理玩家头像问题(是否需要重置)
delIsResetPhoto() ->
    BeRoleID = playerState:getRoleID(),
    IsReset = playerPropSync:getProp(?SerProp_ReportReset),
    case IsReset of
        1 ->
            %%需要重置
            psMgr:sendMsg2PS(?PsNameIdentity, identity_edit, {?IDIT_FACE , BeRoleID, []});
        _ ->
            skip
    end.