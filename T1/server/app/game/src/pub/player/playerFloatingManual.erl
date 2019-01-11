%%%-------------------------------------------------------------------
%%% @author chenxiaolong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%漂浮手册
%%% @end
%%% Created : 27. 十二月 2017 11:00
%%%-------------------------------------------------------------------
-module(playerFloatingManual).
-author("Administrator").

-include("gsInc.hrl").
-include("playerPrivate.hrl").

%% API
-export([initFloatingManual/0,
         initCrossFloatingManual/0,
         requstFloatingAward/1,
         updateFloating/1,
         updateFloating/2,
        checkUnlockNow/0,
        checkFloatingConfig/0]).


-define(CondType_1,1).%%任务
-define(CondType_2,7).%%支线任务
-define(CondType_3,3).%%成就
-define(CondType_4,4).%%其他

%%登录初始化
-spec initFloatingManual() -> ok.
initFloatingManual()->

     FloatingProgress =   playerPropSync:getProp(?SerProp_FloatingProgress),
     FloatingRewardList =   playerPropSync:getProp(?SerProp_FloatingReward),
     %%奖励列表发送
     case  FloatingRewardList of
       []->
         Msg = #pk_GS2U_FloatingAward{rewardList = []},
         playerMsg:sendNetMsg(Msg);
       _->
         F= fun(#recFloatingAward{pieceID = Pieid,isGeted = Igeted})->
           case  Igeted  of
             true ->
               case getCfg:getCfgByKey(cfg_floatingPiece,Pieid) of
                 #floatingPieceCfg{ piecereward  = PieceReward} ->

                   F1= fun({Type,ID,Num})->
                     case Type  of
                       %%类型为三是 加属性，1,2都是发Item
                       3 ->
                         playerCalcProp:changeProp_AddMulti([], [], [{ID,Num}], [], true) ;
                       _->
                         skip
                     end
                       end,
                   lists:foreach(F1,PieceReward);
                 _->
                   skip
               end;
             _->
               skip
           end
            end,
         lists:foreach(F,FloatingRewardList),
         playerForce:calcPlayerForce(true),
         NewgRewardList = [#pk_FloatingAward{pieceID = PieID,isGeted = IsGeted}||#recFloatingAward{pieceID =  PieID,isGeted = IsGeted} <-FloatingRewardList],
         Msg = #pk_GS2U_FloatingAward{rewardList = NewgRewardList},
         playerMsg:sendNetMsg(Msg)
     end,

     %%漂浮进度发送
     case  FloatingProgress of
       []->
         checkCurFloatingList(1,1,[],[],true);
       #recFloating{cluesID = Cid,condtion = CondList}->
         NewCondList = [#pk_Conditions{cluesID =  ClueID,condComplete = Complete}||#recConditions{clueID = ClueID ,condComplete = Complete} <-CondList],
         Msg2= #pk_GS2U_FloatingSchedule{lastcluesID  = Cid,isInit = true,condList =NewCondList },
         playerMsg:sendNetMsg(Msg2);
       _->
         skip
     end.

%%跨服登录初始化
-spec initCrossFloatingManual() -> ok.
initCrossFloatingManual()->
   FloatingRewardList = playerPropSync:getProp(?SerProp_FloatingReward),
   %%属性加成
   case FloatingRewardList of
      []->
         skip;
      _->
         F= fun(#recFloatingAward{pieceID = Pieid,isGeted = Igeted},PropList)->
            case  Igeted  of
               true ->
                  case getCfg:getCfgByKey(cfg_floatingPiece,Pieid) of
                     #floatingPieceCfg{ piecereward  = PieceReward} ->
                        F1= fun({Type,ID,Num},PropList1)->
                           case Type  of
                              %%类型为三是 加属性，1,2都是发Item
                              3 ->
                                case lists:keyfind(ID,1,PropList1) of
                                  {_ProID,ProNum} ->
                                    lists:keystore(ID,1,PropList1,{ID,Num+ProNum});
                                  false ->
                                    [{ID,Num}|PropList1]
                                end;
                              _->
                                PropList1
                           end
                        end,
                        lists:foldl(F1,PropList,PieceReward);
                     _->
                       PropList
                  end;
               _->
                 PropList
            end
         end,
         AddPropList = lists:foldl(F,[],FloatingRewardList),
         playerCalcProp:changeProp_AddMulti([], [], AddPropList, [], true),
         playerForce:calcPlayerForce(true)
   end,
   ok.


updatedataLastFlotaing(ClueID,PieceID,ConditionList,RecConditions,IsInit)->
  updatedataLastFlotaing(ClueID,PieceID,ConditionList,RecConditions,IsInit,true).
updatedataLastFlotaing(ClueID,PieceID,ConditionList,RecConditions,IsInit,IsNotify)->

  FloatingPro =#recFloating{cluesID = ClueID,pieceID = PieceID,condtion =RecConditions},
  playerPropSync:setAny(?SerProp_FloatingProgress,FloatingPro ),
  case IsNotify of
    true ->
      Msg1 = #pk_GS2U_FloatingSchedule{lastcluesID  =ClueID,isInit =IsInit, condList =ConditionList },
      playerMsg:sendNetMsg(Msg1);
    _ ->
      skip
  end,
  F= fun(#recConditions{condComplete = Comlete},{IsAllComplete,_})->
    case Comlete of
      false ->
        {true,{}};
      _->
        {IsAllComplete,{}}

    end
     end,
  case  misc:foldlEx(F,{false,{}},RecConditions) of
    {false,{}}->

      FloatingRewardList =   playerPropSync:getProp(?SerProp_FloatingReward),
      case lists:keyfind(PieceID, #recFloatingAward.pieceID, FloatingRewardList) of
        #recFloatingAward{} ->
            skip;
        _->
          NewFloatingRewardList =  [#recFloatingAward{pieceID =PieceID,isGeted = false }|FloatingRewardList],
          playerPropSync:setAny(?SerProp_FloatingReward,NewFloatingRewardList ),
          case IsNotify of
            true ->
              NewgRewardList = [#pk_FloatingAward{pieceID = PieID,isGeted = IsGeted}||#recFloatingAward{pieceID =  PieID,isGeted = IsGeted} <-NewFloatingRewardList],
              Msg = #pk_GS2U_FloatingAward{rewardList = NewgRewardList},
              playerMsg:sendNetMsg(Msg);
            _ ->
              skip
          end
      end;
    _->
      skip
  end,
  ok.
%%检测当前碎片进度列表
checkCurFloatingList(ClueID,PieceID,ConditionList,RecConditions,IsInit)->
  checkCurFloatingList(ClueID,PieceID,ConditionList,RecConditions,IsInit, true).
checkCurFloatingList(ClueID,PieceID,ConditionList,RecConditions,IsInit,IsNotify)->
 case getCfg:getCfgByKey(cfg_floatingClue, ClueID) of
   #floatingClueCfg{ pieceid = Pid,type = Type1, condid  = CondID1} ->

     case Pid > PieceID of
         true ->

           FloatingPro =#recFloating{cluesID = ClueID-1,pieceID = PieceID,condtion =RecConditions},
           playerPropSync:setAny(?SerProp_FloatingProgress,FloatingPro ),
           case IsNotify of
             true ->
               Msg1 = #pk_GS2U_FloatingSchedule{lastcluesID  =ClueID-1, isInit =IsInit,condList =ConditionList },
               playerMsg:sendNetMsg(Msg1);
             _ ->
               skip
           end,
           F= fun(#recConditions{condComplete = Comlete},{IsAllComplete,_})->
             case Comlete of
               false ->
                 {true,{}};
               _->
                 {IsAllComplete,{}}

             end
              end,
           case  misc:foldlEx(F,{false,{}},RecConditions) of
             {false,{}}->

               FloatingRewardList =   playerPropSync:getProp(?SerProp_FloatingReward),
               NewFloatingRewardList =  [#recFloatingAward{pieceID =PieceID,isGeted = false }|FloatingRewardList],
               playerPropSync:setAny(?SerProp_FloatingReward,NewFloatingRewardList ),
               case IsNotify of
                 true ->
                   NewgRewardList = [#pk_FloatingAward{pieceID = PieID,isGeted = IsGeted}||#recFloatingAward{pieceID =  PieID,isGeted = IsGeted} <-NewFloatingRewardList],
                   Msg = #pk_GS2U_FloatingAward{rewardList = NewgRewardList},
                   playerMsg:sendNetMsg(Msg);
                 _ ->
                   skip
               end,

               checkCurFloatingList(ClueID,Pid,[],[],IsInit,IsNotify);
             _->
               skip
           end;
       _->
         ConditionList1 =  [#pk_Conditions{cluesID =ClueID, condComplete = conditional({Type1,CondID1})}|ConditionList],
         RecConditions1 =  [#recConditions{clueID = ClueID, condType =Type1,condID =  CondID1,condComplete = conditional({Type1,CondID1})}|RecConditions],

         case getCfg:getCfgByKey(cfg_floatingClue, ClueID+1) of
           #floatingClueCfg{ } ->
             checkCurFloatingList(ClueID +1,PieceID,ConditionList1,RecConditions1,IsInit,IsNotify);
           _->
             updatedataLastFlotaing(ClueID,PieceID,ConditionList1,RecConditions1,IsInit),
             ?DEBUG(" clc IsLastOne is ")
         end
     end;
   _->
     ?ERROR("cfg_floatingClue key:~w", [ClueID])
 end.

%%请求领奖
requstFloatingAward({PieceID})->


     FloatingRewardList =   playerPropSync:getProp(?SerProp_FloatingReward),
     F= fun(#recFloatingAward{pieceID =  Pieid,isGeted = Igeted} = Award,{IsIn,{FindPid,_}})->
       case  Pieid =:= FindPid andalso Igeted == false of
         true ->
           {true,{FindPid,Award}};
         _->
           {IsIn,{FindPid,Award}}

       end
        end,
     case  misc:foldlEx(F,{false,{PieceID,[]}},FloatingRewardList) of
       {true,{Pid,FloatingAward}}->
         %%发奖 到背包
         case getCfg:getCfgByKey(cfg_floatingPiece, Pid) of
           #floatingPieceCfg{ piecereward = PieceReward} ->
             F1= fun({Type,ID,Num})->
               if
                 Type == 1 orelse Type == 2 ->
                   Plog = #recPLogTSItem{
                     old = 0,
                     new = Num,
                     change = Num,
                     target = ?PLogTS_PlayerSelf,
                     source = ?PLogTS_Rank,
                     gold = 0,
                     goldtype = 0,
                     changReason = ?ItemSourceRank,
                     reasonParam = ?ItemSourceFloating_GiveReward
                   },
                   playerPackage:addGoodsAndMail(ID, Num, true, 0, Plog);
                 Type == 3 ->
                   playerCalcProp:changeProp_AddMulti([], [], [{ID,Num}], [], true);

                 true ->
                   skip
               end
                 end,
             lists:foreach(F1,PieceReward),
             playerForce:calcPlayerForce(true);
           _->
             skip
         end,

         NewFloatingAward =  FloatingAward#recFloatingAward{isGeted = true},
         NewSendToClientData =  #pk_FloatingAward{pieceID = Pid,isGeted = true},
         NewFloatingRewardList =  lists:keystore(Pid,#recFloatingAward.pieceID,FloatingRewardList,NewFloatingAward),

         Msg = #pk_GS2U_ReceiveFloatingAward{isSuccss = true,reward = NewSendToClientData},
         playerMsg:sendNetMsg(Msg),
         playerPropSync:setAny(?SerProp_FloatingReward,NewFloatingRewardList );
       _->
         skip
     end.


%%进度更新
updateFloating(Data) ->
  updateFloating(Data, true).
updateFloating({Type,CondID}, IsNotify) ->


     FloatingProgress =   playerPropSync:getProp(?SerProp_FloatingProgress),
     FloatingRewardList =   playerPropSync:getProp(?SerProp_FloatingReward),

     case  FloatingProgress of
       #recFloating{cluesID = Cid,pieceID = PiceID,condtion = CondList}->

         F1= fun(#recConditions{condType = CondType,condID = ID, condComplete = Comlete} =  Conditions,{IsAllComplete,_})->
              case CondType =:=Type andalso ID =:= CondID andalso Comlete =:= false of
                true ->
                  {true,Conditions};
                _->
                  {IsAllComplete,{}}

              end
            end,
         case misc:foldlEx(F1,{false,{}},CondList) of
           {true,#recConditions{} = CondArr} ->

             NewCond = CondArr#recConditions{condComplete = true} ,
             NewCondList = lists:keystore(NewCond#recConditions.condID,#recConditions.condID,CondList,NewCond),
             NewFloatingProgress =  FloatingProgress#recFloating{condtion = NewCondList},
             playerPropSync:setAny(?SerProp_FloatingProgress,NewFloatingProgress ),
             case IsNotify of
               true ->
                 NewClientCondList = [#pk_Conditions{cluesID = CluId , condComplete = Complete}||#recConditions{clueID = CluId,condComplete = Complete} <-NewCondList],
                 Msg = #pk_GS2U_FloatingSchedule{lastcluesID  = Cid,isInit =false,condList =NewClientCondList },
                 playerMsg:sendNetMsg(Msg);
               _ ->
                 skip
             end,
             F= fun(#recConditions{condComplete = Comlete},{IsAllComplete,_})->
               case Comlete of
                 false ->
                   {true,{}};
                 _->
                   {IsAllComplete,{}}

               end
                end,
             case  misc:foldlEx(F,{false,{}},NewCondList) of
               {false,{}}->

                 NewFloatingRewardList =  [#recFloatingAward{pieceID =PiceID,isGeted = false }|FloatingRewardList],
                 playerPropSync:setAny(?SerProp_FloatingReward,NewFloatingRewardList ),
                 case IsNotify of
                   true ->
                     NewgRewardList = [#pk_FloatingAward{pieceID = PieID,isGeted = IsGeted}||#recFloatingAward{pieceID =  PieID,isGeted = IsGeted} <-NewFloatingRewardList],
                     Msg1 = #pk_GS2U_FloatingAward{rewardList = NewgRewardList},
                     playerMsg:sendNetMsg(Msg1);
                   _ ->
                     skip
                 end,

                 case getCfg:getCfgByKey(cfg_floatingClue, Cid+1) of
                   #floatingClueCfg{ pieceid = NewPid} ->
                     checkCurFloatingList(Cid+1,NewPid,[],[],false);
                   _->
                     ?DEBUG(" clc IsLastOne is ")
                end;
               _->
                 ?DEBUG(" clc IsComplete is  ~p ",[true])
             end;
             _->
               ?DEBUG(" clc CondID ~p is Not in CondList ~p ",[CondID,CondList])
         end;
       _->
         ?DEBUG("clc  recConditions  is [] ")
     end.


%%条件判断是否达成
  conditional({Type,CondID})->
    case Type of
       0->
         true;
      ?CondType_1  ->
         case playerTask:isSubmittedTaskByID(CondID) of
           false ->
             false;
           _ ->
             true
         end;
      ?CondType_2 ->
        case playerTask:isSubmittedTaskByID(CondID) of
          false ->
            false;
          _ ->
            true
        end;
      ?CondType_3->
        case playerAchieve:isCompleteAchieve(CondID) of
          true->
            true;
          _ ->
            false
        end;
      _->
        false
     end;
  conditional(_)->
    false.

%%发送线索完成奖励
%%endCondtionRward(Cid)->
%% case getCfg:getCfgByKey(cfg_floatingClue, Cid) of
%%   #floatingClueCfg{ cluereward = Cluereward} ->
%%     F1= fun({Type,ID,Num})->
%%       if
%%         Type == 1 orelse Type == 2 ->
%%           Plog = #recPLogTSItem{
%%             old = 0,
%%             new = Num,
%%             change = Num,
%%             target = ?PLogTS_PlayerSelf,
%%             source = ?PLogTS_Rank,
%%             gold = 0,
%%             goldtype = 0,
%%             changReason = ?ItemSourceRank,
%%             reasonParam = ?ItemSourceFloating_GiveReward
%%           },
%%           playerPackage:addGoodsAndMail(ID, Num, true, 0, Plog);
%%         Type == 3 ->
%%           playerCalcProp:changeProp_AddMulti([], [], [{ID,Num}], [], true);
%%         true ->
%%           skip
%%       end
%%      end,
%%     lists:foreach(F1,Cluereward);
%%   _->
%%     skip
%% end,
%% ok.

%%Clue表 配置检测
-spec checkFloatingConfig() -> boolean().
checkFloatingConfig() ->
  L = getCfg:get1KeyList(cfg_floatingClue),
  check(L, true).

check([], Ret) ->
  Ret;
check([ClueID = Key | T], Ret) ->
  case getCfg:getCfgByArgs(cfg_floatingClue, ClueID) of
    #floatingClueCfg{ pieceid = Cfg_Pid} ->

      case getCfg:getCfgByArgs(cfg_floatingPiece, Cfg_Pid) of
        #floatingPieceCfg{ piecereward  = _PieceReward} ->

          check(T, Ret);
        _ ->
          ?ERROR("cfg_floatingPiece key:~w", [Key]),
          check(T, false)
      end;
    _ ->
      ?ERROR("cfg_floatingClue key:~w", [Key]),
      check(T, false)
  end.


%% 主动检查当前进度是否解锁
-spec checkUnlockNow() -> no_return().
checkUnlockNow() ->
  case playerPropSync:getProp(?SerProp_FloatingProgress) of
    #recFloating{condtion = []} ->
      skip;
    #recFloating{pieceID = PieceID, condtion = Condition} ->
      [#recConditions{clueID = Min} | _] =
        lists:sort(fun(#recConditions{clueID = A}, #recConditions{clueID = B}) -> A < B end, Condition),

      checkCurFloatingList(Min, PieceID, [], [], true),
      ok;
    _ ->
      skip
  end.
