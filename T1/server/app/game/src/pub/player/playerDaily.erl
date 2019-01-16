%%
%% @author zhongyunawei
%% @doc @todo 玩家每日计数器.


-module(playerDaily).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initDailyCounter/1,
	incDailyCounter/2,
	addDailyCounter/3,
	getDailyCounter/2,
	reduceDailyCounter/3,
	zeroDailyCount/2,
	zeroDailyCount/1,
	incCounter/3,
	resetDailyCount/0,

	%% 资源找回相关的计数器需要初始化，否则资源找回功能无法正常重置
	initDailyCounterForFindRes/2
]).

-export([sendToClient/0]).

%%初始化每日计数器
-spec initDailyCounter([#rec_daily_counter0{},...]) -> ok.
initDailyCounter(List) ->
	playerState:setDailyCounterList(List),

	%% 立即重置一次
	resetDailyCount(List),
	ok.

-spec sendToClient() -> ok.
sendToClient() ->
	?DEBUG("[DebugForDaily] playerDaily:sendToClient/0"),
	List = playerState:getDailyCounterList(),
	case List of
		[] ->
			?DEBUG("[DebugForDaily] playerDaily:sendToClient/0 skip"),
			skip;
		_ ->
%%			?DEBUG("[DebugForDaily] playerDaily:sendToClient/0 ListLen:~w", [erlang:length(List)]),
			init2Client(List)
	end,
	ok.

%%增加每日计数
-spec incDailyCounter(Type, ID) -> ok when Type::dailyType(), ID::uint().
incDailyCounter(Type, ID) when Type >= ?DailyType_Min andalso Type =< ?DailyType_Max ->
	addDailyCounter(Type, ID, 1).

%%增加多个每日计数
-spec addDailyCounter(Type, ID, Count) -> ok when Type::dailyType(), ID::uint(), Count::uint().
addDailyCounter(Type, ID, Count) when Type >= ?DailyType_Min andalso Type =< ?DailyType_Max ->
	addDailyCounter2(Type, ID, Count).

%%获取计数器
-spec getDailyCounter(Type, ID) -> uint() when Type::dailyType(),ID::uint().
getDailyCounter(Type, ID) when Type >= ?DailyType_Min andalso Type =< ?DailyType_Max ->
	getCounter(Type, ID).

%%减少每日计数,Count为正数
-spec reduceDailyCounter(Type, ID, Count) -> ok when Type::dailyType(), ID::uint(), Count::uint().
reduceDailyCounter(Type, ID, Count) when erlang:is_integer(Count) andalso Count >= 0 ->
    reduceDailyCounter2(Type, ID, Count);
reduceDailyCounter(Type, ID, Count) ->
	?ERROR("reduceDailyCounter:~p,~p,~p,~p,~p",
		[playerState:getRoleID(), Type, ID, Count, misc:getStackTrace()]),
	ok.

%% 清零某项dailycounter
-spec zeroDailyCount(Type::dailyType(), ID::uint()) -> ok.
zeroDailyCount(Type, ID) ->
	case playerState:getDailyCounterList() of
		[] ->
			skip;
		List ->
			DailyType = getDailyType(Type, ID),
			case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
				#rec_daily_counter0{} ->
					%% 原来有，清零
					NewDaily = #rec_daily_counter0{
						roleID = {playerState:getRoleID(),DailyType},
						dailyType = DailyType,
						lastUpdateTime = misc_time:gregorian_seconds_from_1970( ),
						counter = 0
					},
					NList = lists:keystore(DailyType, #rec_daily_counter0.dailyType, List, NewDaily),
					playerState:setDailyCounterList(NList),

					%% 通知客户端
					NewValue = getCounter(Type, ID),
					change2Client(Type, ID, NewValue),

					ok;
				_ ->
					skip
			end
	end,
	ok.

%% 清零某项dailycounter
-spec zeroDailyCount(Type::dailyType()) -> ok.
zeroDailyCount(Type) ->
	case playerState:getDailyCounterList() of
		[] ->
			skip;
		List ->
			case zeroDailyCount_(Type, List, [], []) of
				{_, []} ->
					skip;
				{ListNew, ListDelete} ->
					playerState:setDailyCounterList(ListNew),
					send2Client([#pk_PlayerDailyCount{dailyType = Type, dailyID = ID, dailyValue = 0} || ID <- ListDelete])
			end
	end,
	ok.
-spec zeroDailyCount_(
	Type::dailyType(),
	List::[#rec_daily_counter0{}, ...],
	ListNew::[#rec_daily_counter0{}, ...],
	ListDelete::[uint(), ...]
) ->
	Ret::{[#rec_daily_counter0{}, ...], [uint(), ...]}.
zeroDailyCount_(_Type, [], ListNew, ListDelete) ->
	{lists:reverse(ListNew), ListDelete};
zeroDailyCount_(Type, [#rec_daily_counter0{dailyType = DailyType_} = Daily | T], ListNew, ListDelete) ->
	<<Type_:10,ID:54>> = <<DailyType_:64>>,
	case Type_ of
		Type ->
			zeroDailyCount_(Type, T, ListNew, [ID | ListDelete]);
		_ ->

			zeroDailyCount_(Type, T, [Daily | ListNew], ListDelete)
	end.

%% 重置计数
-spec resetDailyCount() -> ok.
resetDailyCount() ->
	?DEBUG("resetDailyCount:~p",[playerState:getRoleID()]),
	case playerState:getDailyCounterList() of
		List when erlang:is_list(List) ->
			resetDailyCount(List);
		_ ->
			skip
	end,

	%% 重置其它数据

	%% 玩家在线，登录计数+1
	playerLogin:accLoginDayAll(),

	%% 重置“环任务”状态
	playerLoopTask:onReset(),

	ok.

%% 资源找回相关的计数器需要初始化，否则资源找回功能无法正常重置
-spec initDailyCounterForFindRes(Type::dailyType(), ID::uint()) -> no_return().
initDailyCounterForFindRes(Type, ID) ->
	DailyType = getDailyType(Type, ID),
	List = playerState:getDailyCounterList(),
	case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
		#rec_daily_counter0{} ->
			resetDailyCount(Type, ID);
		_ ->
			TimeNow = misc_time:gregorian_seconds_from_1970( ),
			R = #rec_daily_counter0{
				roleID = {playerState:getRoleID(), DailyType},
				dailyType = DailyType,
				lastUpdateTime = TimeNow,
				counter = 0
			},
			playerState:setDailyCounterList([R | List]),
			playerFindRes:onDailyChange(Type, ID, false, 0, TimeNow)
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec resetDailyCount([#rec_daily_counter0{},...]) -> ok.
resetDailyCount([]) ->
	ok;
resetDailyCount([#rec_daily_counter0{dailyType = DailyType}|List]) ->
	<<Type:10,ID:54>> = <<DailyType:64>>,
	resetDailyCount(Type, ID),

	case playerState:isFirstEnterMap() of
		false ->
			NewValue = getCounter(Type, ID),
			change2Client(Type, ID, NewValue);
		_ ->
			skip
	end,

	resetDailyCount(List).

%%判断计数器是否需要重置，如果需要，则重置，否则什么都不做
-spec resetDailyCount(Type::dailyType(), ID::uint()) -> #rec_daily_counter0{} | 0.
resetDailyCount(Type, ID) ->
	DailyType = getDailyType(Type, ID),
	List = playerState:getDailyCounterList(),
	case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
		#rec_daily_counter0{lastUpdateTime = LastUpdateTime, counter = C} = Daily ->
			NowTime = misc_time:gregorian_seconds_from_1970( ),
			{NewDaily, IsReset} =
				case core:timeIsOnDay(LastUpdateTime, NowTime) of
					true ->
						%% 不需要重置
						{Daily, false};
					_ ->

						%% 需要重置
						NDaily = Daily#rec_daily_counter0{counter = 0, lastUpdateTime = NowTime},
						NL = lists:keystore(DailyType, #rec_daily_counter0.dailyType, List, NDaily),
						playerState:setDailyCounterList(NL),
						{NDaily, true}

				end,

			%% 这个坑爹功能要处理，资源找回
			% 资源找回功能改为：能找回前一天的未参与获取的活动资源（凌晨4点开始算）
			Date = misc_time:gregorian_seconds_to_datetime(NowTime),
			TimeBeginOfDay = misc_time:getDayBeginSeconds(Date) + ?ResetTimeHour * 3600,
			NewC = case LastUpdateTime < TimeBeginOfDay - 86400 of
				true ->
					0;
				_ ->
					C
			end,
			playerFindRes:onDailyChange(Type, ID, IsReset, NewC, NowTime),
			NewDaily;
		_ ->
			0
	end.

%%增加多个每日计数实现fun
-spec addDailyCounter2(Type::dailyType(), ID::uint(), uint()) -> ok.
addDailyCounter2(0, _ID, _Count) ->
	ok;
addDailyCounter2(_Type, _ID, 0) ->
	ok;
addDailyCounter2(Type, ID, Count) when Count > 0 ->
	incCounter2(Type, ID, Count).

%%减少多个每日计数实现
-spec reduceDailyCounter2(Type::dailyType(), ID::uint(), uint()) -> ok.
reduceDailyCounter2(0, _ID, _Count) ->
    ok;
reduceDailyCounter2(_Type, _ID, 0) ->
    ok;
reduceDailyCounter2(Type, ID, Count) when Count > 0 ->
	reduceCounter(Type, ID, Count).

%%减少计数器
-spec reduceCounter(Type,ID,CountVal) -> ok when Type::uint(), ID::uint(), CountVal::uint().
reduceCounter(Type, ID, CountVal) ->
	resetDailyCount(Type, ID),
    DailyType = getDailyType(Type, ID),
    NowTime = misc_time:gregorian_seconds_from_1970( ),
    NL = case playerState:getDailyCounterList() of
             [] ->
                 [#rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = 0}];
             List ->
                 NewDaily =
                     case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
                         #rec_daily_counter0{counter = Count} = Daily when Count > CountVal ->
                             Daily#rec_daily_counter0{counter = Count - CountVal, lastUpdateTime = NowTime};
                         _ ->
                             #rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = 0}
                    end,
                 lists:keystore(DailyType, #rec_daily_counter0.dailyType, List, NewDaily)
         end,
    playerState:setDailyCounterList(NL),
    NewValue = getCounter(Type, ID),
    change2Client(Type, ID, NewValue),
    ok.

%%增加计数器
-spec incCounter(Type,ID,CountVal) -> ok when Type::uint(),ID::uint(),CountVal::uint().
incCounter(Type,ID,CountVal) ->
	%% 根据原来代码语意为重置，所以本处修改为先清零，再设置
	zeroDailyCount(Type, ID),
	incCounter2(Type,ID,CountVal).

incCounter2(Type,ID,CountVal) ->
	resetDailyCount(Type, ID),
	DailyType = getDailyType(Type, ID),
	NowTime = misc_time:gregorian_seconds_from_1970( ),
	NL = case playerState:getDailyCounterList() of
			 [] ->
				 [#rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = 1}];
			 List ->
				 NewDaily =
					 case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
						 #rec_daily_counter0{counter = Count} = Daily ->
							 Daily#rec_daily_counter0{counter = Count + CountVal, lastUpdateTime = NowTime};
						 _ ->
							 #rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = CountVal}
					 end,
				 lists:keystore(DailyType, #rec_daily_counter0.dailyType, List, NewDaily)
		 end,
	playerState:setDailyCounterList(NL),

	NewValue = getCounter(Type, ID),
	change2Client(Type, ID, NewValue),
	ok.

%%获取计数器
-spec getCounter(Type,ID) -> uint() when Type::uint(),ID::uint().
getCounter(0, _ID) -> 0;
getCounter(Type, ID) ->
	%% 优化一下计数器，如果没有取到，则不重置，也不需要保存
	case playerState:getDailyCounterList() of
		[] -> 0;
		List ->
			DailyType = getDailyType(Type, ID),
			case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
				#rec_daily_counter0{} ->
					%% 先重置
					case resetDailyCount(Type, ID) of
						#rec_daily_counter0{counter = Count} -> Count;
						_ -> 0
					end;
				_ -> 0
			end
	end.

%% 获取每日限制类型
-spec getDailyType(Type::dailyType(), ID::uint()) -> uint64().
getDailyType(Type, ID) ->
	<<DailyType:64>> = <<Type:10,ID:54>>,
	%% 18014398509481984 =:= 2的54次方 =:= 16#40000000000000
	case erlang:is_integer(ID) andalso ID >= 0 andalso ID < 16#40000000000000 of
		true ->
			skip;
		_ ->
			?ERROR("getDailyType error roleID=~p,Type=~p,ID=~p", [playerState:getRoleID(), Type, ID])
	end,
	DailyType.

%% 初始化通知
-spec init2Client(List) ->ok when 
  List::[] | [#rec_daily_counter0{},...].
init2Client([]) ->
	send2Client([]);
init2Client([#rec_daily_counter0{}|_] = List) ->
	PlayerDailyCountList = lists:foldl(fun
										  (#rec_daily_counter0{dailyType=TypeAndID },Acc) ->
											   <<Type:10,ID:54>> = << TypeAndID:64 >>,
											   Value = getCounter(Type,ID),
											   
											   [#pk_PlayerDailyCount{
																	 dailyType = Type, 
																	 dailyID = ID, 
																	 dailyValue =Value
																	} | Acc]
									   end, [], List),
	send2Client(PlayerDailyCountList).

%% 计算改变后，通知client
-spec change2Client(Type::integer(),ID::integer(),Value::integer()) ->ok.
change2Client(Type,ID,Value) ->
	PlayerDailyCount = #pk_PlayerDailyCount{
							   dailyType = Type, 
							   dailyID = ID, 
							   dailyValue =Value
							  },
	send2Client([PlayerDailyCount]).

%% 把需要客户端知道的每日计算值通知给client
-spec send2Client(PlayerDailyCountList) ->ok
when PlayerDailyCountList::[#pk_PlayerDailyCount{},...]|[].
send2Client([PlayerDailyCountHD |_] = PlayerDailyCountList) when PlayerDailyCountList==[] orelse erlang:is_record(PlayerDailyCountHD, pk_PlayerDailyCount)->
	Msg = #pk_GS2U_SendPlayerDailyCountList{playerDailyCountList = PlayerDailyCountList},
	playerMsg:sendNetMsg(Msg),
	ok;
send2Client(_PlayerDailyCountList) ->
	ok.











