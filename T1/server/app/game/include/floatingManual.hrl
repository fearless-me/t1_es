%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%漂浮手册
%%% @end
%%% Created : 27. 十二月 2017 11:21
%%%-------------------------------------------------------------------
-author("chenxiaolong").



-record(recConditions,{
  clueID = 0,           %%线索的索引ID
  condType = 0,		    %%条件类型
  condID = 0,		    %%条件ID
  condComplete = false 	%%是否完成
}).
-record(recFloatingAward,{
  pieceID = 0, 				%%属于哪个石头进度
  isGeted = false 	%%是否领取
}).
-record(recFloating,{
  pieceID = 0,		    %%属于哪个碎片进度
  cluesID = 0,		    %%一个碎片的最后一个线索ID
  condtion = []     ::[#recConditions{},...]  %%条件达成
}).



