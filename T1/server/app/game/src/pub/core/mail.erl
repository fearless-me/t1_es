%% @author zhongyunawei
%% @doc @todo Add description to mail.


-module(mail).
-author(zhongyuanwei).

-include("gsInc.hrl").
-include("logRecord.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
    sendSystemMail/5,  % 发送系统邮件
	sendMoneySystemMail/6, %%直接发钱的系统邮件
    sendSimpleMail/5,  % 发送普通邮件
	mailChangeLog/3	   %邮件LOG
]).

-export([
    getPlayerMailCount/1
]).

%% ToRoleName 一定要确保ToRoleName正确
%% Attachment 附件列表[#recMailItem{} 和 #recMailCoin{}]
%% MailSubjoinMsg 邮件标识，默认为[]
%% 如果发送成功则返回正确的邮件ID，失败则返回0
-spec sendSystemMail(ToRoleID, MailTitle, MailContent, Attachment, MailSubjoinMsg) -> uint() when
	ToRoleID::uint(),MailTitle::string(),MailContent::string(),Attachment::list(),MailSubjoinMsg::string().
sendSystemMail(ToRoleID, MailTitle, MailContent, Attachment, MailSubjoinMsg) when erlang:is_list(Attachment) ->
    %% 检查附件
	 BA = checkAttachment(Attachment),
	 NewAttachment = case BA of
		 true ->
			 switchCoinAttachment(ToRoleID, MailTitle, MailContent, Attachment);
		 _ ->
			 Attachment
	 end,
    %% 检查RoleID
    RD = uidMgr:checkUID(?UID_TYPE_Role, ToRoleID),

    if
        BA andalso RD ->
            %% 满足条件
            MailID = uidMgr:makeMailUID(),

            %% 得到附件列表
            Attachments = decAttachment(MailID, NewAttachment, []),

            case sendEmail2(MailID, ?SystemID, ToRoleID, MailTitle, MailContent, Attachments, MailSubjoinMsg) of
				true ->
					MailID;
				_ ->
					0
			end;
        true ->
            ?ERROR("sendSystemMail to:~p, reason:~p,~p,~p", [ToRoleID, BA, RD, Attachment]),
            0
    end.

%%直接发钱的系统邮件
sendMoneySystemMail(ToRoleID, MailTitle, MailContent, MoneyType, MoneyNum, MailSubjoinMsg) ->
	Attachment = [#recMailCoin{
		coinType = MoneyType,
		coinNum = MoneyNum
	}],
	sendSystemMail(ToRoleID, MailTitle, MailContent, Attachment, MailSubjoinMsg).

%% 确保SendRoleID, ToRoleID 均有效
-spec sendSimpleMail(SendRoleID, ToRoleID, MailTitle, MailContent, MailSubjoinMsg) -> MailID | more | false when
	SendRoleID::uint(),ToRoleID::uint(),MailTitle::string(),MailContent::string(),MailSubjoinMsg::string(),MailID::uint64().
sendSimpleMail(_SendRoleID, _ToRoleID, _MailTitle, _MailContent, _MailSubjoinMsg) ->
    false.
%%    %% 检查标题
%%    BT = checkMailtitle(MailTitle),
%%    %% 检查内容
%%    BC = checkMailContent(MailContent),
%%    %% 检查RoleID
%%    RD = uidMgr:checkUID(?UID_TYPE_Role, ToRoleID),
%%    %% 检查对方邮件数量上限
%%    HaveCount = getPlayerMailCount(ToRoleID),
%%    %% 这里减去一个值，做个保护，简单解决一下并发的问题
%%    MC = (HaveCount < (?Mail_Player_Max_Count - 3)),
%%    if
%%        SendRoleID =:= ToRoleID ->
%%            %% 不能给自己发邮件
%%            ?ERROR("sendSimpleMail sender:~p -> to:~p", [SendRoleID, ToRoleID]),
%%            false;
%%        not MC ->
%%            ?ERROR("sendSimpleMail target mail more:~p -> to:~p", [SendRoleID, ToRoleID]),
%%            more;
%%        BT andalso BC andalso RD andalso MC ->
%%            %% 满足条件
%%            MailID = uidMgr:makeMailUID(),
%%            case sendEmail(MailID, SendRoleID, ToRoleID, MailTitle, MailContent, [], MailSubjoinMsg) of
%%                true ->
%%                    MailID;
%%                _ ->
%%                    false
%%            end;
%%        true ->
%%            ?ERROR("sendSimpleMail sender:~p -> to:~p, reason:~p,~p,~p", [SendRoleID, ToRoleID, BT, BC, RD]),
%%            false
%%    end.

%% ====================================================================
%% Internal functions
%% ====================================================================
%%%% 发送邮件
%%-spec sendEmail(MailID, SenderRoleID, ToRoleID, MailTitle, MailContent, Attachment, MailSubjoinMsg) -> boolean() when
%%	MailID::uint(), SenderRoleID::uint(), ToRoleID::uint(), MailTitle::string(), MailContent::string(), Attachment::list(), MailSubjoinMsg::string().
%%sendEmail(MailID, SenderRoleID, ToRoleID, MailTitle, MailContent, Attachment, MailSubjoinMsg) ->
%%    Mail = #recMail{
%%        mailID          = MailID,
%%        mailSendTime    = misc_time:gregorian_seconds_from_1970( ),
%%        senderRoleID    = SenderRoleID,
%%        toRoleID        = ToRoleID,
%%        mailTitle       = MailTitle,
%%        mailContent     = MailContent,
%%        mailSubjoinMsg  = MailSubjoinMsg,
%%        attachment      = Attachment
%%    },
%%
%%    %% 需要用call的方式，失敗則記錄日志
%%    case psMgr:call(?PsNameMail, newMail, {Mail}, 5000) of
%%        {newMail, Code} ->
%%            case Code of
%%                0 ->
%%                    %% 发送成功
%%                    true;
%%                Reason ->
%%                    %% 发送失败
%%                    ?ERROR("sendEmail failed:~p,~p,~p", [Code, Mail, Reason]),
%%					false
%%            end;
%%        _ ->
%%            false
%%    end.

%% 发送邮件
-spec sendEmail2(MailID, SenderRoleID, ToRoleID, MailTitle, MailContent, Attachment, MailSubjoinMsg) -> boolean() when
	MailID::uint(), SenderRoleID::uint(), ToRoleID::uint(), MailTitle::string(), MailContent::string(), Attachment::list(), MailSubjoinMsg::string().
sendEmail2(MailID, SenderRoleID, ToRoleID, MailTitle, MailContent, Attachment, MailSubjoinMsg) ->
    Mail = #recMail{
        mailID          = MailID,
        mailSendTime    = misc_time:gregorian_seconds_from_1970( ),
        senderRoleID    = SenderRoleID,
        toRoleID        = ToRoleID,
        mailTitle       = MailTitle,
        mailContent     = MailContent,
        mailSubjoinMsg  = MailSubjoinMsg,
        attachment      = Attachment
    },

    %% 需要用call的方式，失敗則記錄日志
    psMgr:sendMsg2PS(?PsNameMailSend, newMail, {Mail}),
    true.

%% 扣除附件，拼装附件
-spec decAttachment(MailID, MailItemList, Attachment) -> AttachmentList when
	MailID::uint(),MailItemList::list(),Attachment::list(),AttachmentList::list().
decAttachment(MailID, [#recMailItem{itemUID = ItemUID, itemID = ItemID} | Other], Attachment) ->
    Item = #recMailAttachMent{
                mailID  = MailID,
                mtype   = 0,
                mvalue  = ItemUID,
                mvalue2 = ItemID},
    decAttachment(MailID, Other, Attachment ++ [Item]);
decAttachment(MailID, [#recMailCoin{coinType = CoinType, coinNum = CoinNum} | Other], Attachment) ->
    Coin = #recMailAttachMent{
                mailID  = MailID,
                mtype   = CoinType,
                mvalue  = CoinNum,
                mvalue2 = 0},
    decAttachment(MailID, Other, Attachment ++ [Coin]);
decAttachment(_MailID, [], Attachment) ->
    Attachment.

%% 检查附件
-spec checkAttachment(Attachment) -> boolean() when
	Attachment::list().
checkAttachment(Attachment) ->
    Len = length(Attachment),
	 if
        Len < 0 orelse Len > (?AttachmentItemNumber + ?AttachmentCoinNumber) ->
            false;
        true ->
            %% 获取道具的个数
            FunItem = fun(Rec) ->
                case Rec of
                    #recMailItem{} ->
                        true;
	                 #recMailCoin{} ->
                        false
                end
            end,
            LenItem = length(lists:filter(FunItem, Attachment)),
            LenCoin = Len - LenItem,

            if
                LenItem < 0 orelse LenItem > ?AttachmentItemNumber ->
                    false;
                LenCoin < 0 orelse LenCoin > ?AttachmentCoinNumber ->
                    false;
                true ->
                    true
            end
    end.

%%检查附件中是否有金币类型 判断数量是否过大需要转换成金币卡
-spec switchCoinAttachment(ToRoleID,MailTitle, MailContent, Attachment) -> list() when
	ToRoleID::uint(),MailTitle::string(),MailContent::string(),Attachment::list().
switchCoinAttachment(ToRoleID,MailTitle, MailContent, Attachment) ->
	#globalsetupCfg{setpara = [ItemID]} = getCfg:getCfgByKey(cfg_globalsetup, emaill_money_1),
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{useParam2 = Value, quality = Quality}  ->
			%% 获取道具的个数
			FunLen = fun(OneRec) ->
				case OneRec of
					#recMailItem{} ->
						true;
					#recMailCoin{} ->
						false
				end
			end,
			LenItem = length(lists:filter(FunLen, Attachment)),
			FunItem = fun(Rec,{ItemNum, AList}) ->
				case Rec of
					#recMailCoin{coinType = CoinType, coinNum = CoinNum} when CoinType =:= ?CoinTypeGold andalso Value > 0 andalso CoinNum >= Value ->
						NewItemNum = CoinNum div Value,
						LastCoinNum = CoinNum rem Value,
						{LastItemNum, TemList} = case LenItem < ?AttachmentItemNumber of
							true ->
								% 当原来的附件小于规定数量时 附件新转换出来的金币卡到原来的邮件中去
								case playerMail:createMailGoods(ItemID, NewItemNum, true, Quality, ToRoleID, ?ItemSourceMailCoinToItem) of
									[#recMailItem{}] = MailItemList ->
										{0, AList ++ MailItemList};
									[#recMailItem{} | #recMailItem{}] = MailItemList when LenItem =:= 0 ->
										{0, AList ++ MailItemList};
									_ ->
										{NewItemNum, AList}
									end;
							_ ->
								{NewItemNum, AList}
						end,
						case LastCoinNum > 0 of
							true ->
								NewList = TemList ++ [#recMailCoin{coinType = CoinType, coinNum = LastCoinNum}],
								{LastItemNum, NewList};
							_ ->
								{LastItemNum, TemList}
						end;
					#recMailItem{} = OneItem ->
						{ItemNum, AList ++ [OneItem]};
					#recMailCoin{} = OneMoney ->
						{ItemNum, AList ++ [OneMoney]}
				end
			end,
			{CoinToItemNum, NewAttachment} = lists:foldl(FunItem, {0, []},Attachment),
			case CoinToItemNum > 0 of
				true ->
					case playerMail:createMailGoods(ItemID, CoinToItemNum, true, Quality, ToRoleID, ?ItemSourceMailCoinToItem) of
						[#recMailItem{}|_] = MailItemList ->
							?ERROR("Maybe there is something to optimization when send mial ~p ~p ~p ~n",[MailTitle, ItemID, ToRoleID]),
							sendSystemMail(ToRoleID, MailTitle, MailContent, MailItemList, "");
						_ ->
							?ERROR("player coin to item and add item by mail failed,ItemID:~p ~p ~n",[ItemID, CoinToItemNum])
					end,
					NewAttachment;
				_ ->
					NewAttachment
			end;
		_ ->
			Attachment
	end.

%% %%%% 验证标题是否正确，包括过滤
%%-spec checkMailtitle(MailTitle) -> boolean() when
%%	MailTitle::string().
%%checkMailtitle(MailTitle) ->
%%    Len = length(MailTitle),
%%    if
%%        Len < 0 orelse Len > ?Mail_Title_Max_Len ->
%%            false;
%%        true ->
%%            %% 检查屏蔽字
%%            true
%%    end.
%%
%%%% 验证内容是否正确，包括过滤
%%-spec checkMailContent(MailContent) -> boolean() when
%%	MailContent::string().
%%checkMailContent(MailContent) ->
%%    Len = length(MailContent),
%%    if
%%        Len < 0 orelse Len > ?Mail_Content_Max_Len ->
%%            false;
%%        true ->
%%            %% 检查屏蔽字
%%            true
%%    end.

%%邮件修改LOG
mailChangeLog(Playerid, MailUID, ChangeType)->
    dbLog:sendSaveLogMailChange(Playerid, MailUID, ChangeType).

getPlayerMailCount(RoleID) ->
    %% 系统邮件
    Match1 = #?MnesiaSysMail{toRoleID = RoleID, _ = '_'},
    Results1 = edb:dirtyMatchRecord(?MnesiaSysMail, Match1),

    %% 私人邮件
    Match2 = #?MnesiaMail{toRoleID = RoleID, _ = '_'},
    Results2 = edb:dirtyMatchRecord(?MnesiaMail, Match2),
    erlang:length(Results1) + erlang:length(Results2).