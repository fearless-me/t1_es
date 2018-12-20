#!/usr/bin/env escript
%% vim: ts=4 sw=4 et ft=erlang

%% ====================================================================
%% API functions
%% ====================================================================
-include("mapCfgPrivate.hrl").
-include("../src/pub/config/cfg_map.hrl").

-define(ERROR_OUT(F, A), error_log("[Error][~p]"++F, [?LINE] ++ A)).
-define(ERROR_OUT(F), error_log("[Error][~p]"++F, [?LINE]))).
-define(WARN_OUT(F, A), warn_log("[Warn][~p]"++F, [?LINE] ++ A)).
-define(WARN_OUT(F), warn_log("[Warn][~p]"++F, [?LINE] )).
-define(LOG_OUT(F, A),info_log("[Info][~p]"++F, [?LINE] ++ A)).
-define(LOG_OUT(F), info_log("[Info][~p]"++F, [?LINE])).
-define(DEBUG_OUT(F, A), info_log("[Debug][~p]"++F, [?LINE] ++ A)).
-define(DEBUG_OUT(F), info_log("[Debug][~p]"++F, [?LINE]))).

-compile(nowarn_unused_vars).
%% ====================================================================
%% API functions
%% ====================================================================
main(_) ->
	Reg = regExpTolist(),
	Maps = listMap(Reg, []),
	writeToCfgModule(Maps),
	ArCfg = array:new(),
	put(mapsettingArCfg, ArCfg),
	c:cd("../game/data/"),
 	{ok, Array} = loadAllMaps(Maps),
	c:cd("../"),
   	writeInfoToFile(Array, Maps),ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec listMap(Arg, Acc) -> list() when
	Arg :: list(), Acc :: list().
listMap([H, S, W | T], Acc) ->
	I = string:str(H, "="),
	Id = string:substr(H, I + 2),
	L = string:str(S, "="),
	PathGridRes = "maps/map" ++ string:substr(S, L + 2) ++ "_PathGrid.bytes",
	V = string:str(W, "="),
	MapInfoRes = "maps/map" ++ string:substr(W, V + 2) ++ "_MapInfo.bytes",

	Mapid = erlang:list_to_integer(Id),
	listMap(T, [{Mapid, PathGridRes, MapInfoRes} | Acc]);
listMap([], Acc) ->
	lists:reverse(Acc).

-spec regExpTolist() -> list().
regExpTolist() ->
	FileMapSet = "src/pub/config/chs/cfg_map_chs.erl",
	MapBinary = readFile(FileMapSet),
	Math1 = "\\bid = .+|\\bres_barrier = .+|\\bres_mapinfo = .+",
	{ok, Mp} = re:compile(Math1),
	{match, Captured} = re:run(MapBinary, Mp, [global, {capture, all, list}]),
	Ls = re:split(Captured, "\r", [{return, list}]),
	Lt = re:split(Ls, "\"", [{return, list}]),
	List = lists:flatten(Lt),
	RE = string:tokens(List, ","),
	RE.

-spec writeInfoToFile(ArCfg, MapId) -> term() when
	ArCfg :: array:array(), MapId :: list().
writeInfoToFile(ArCfg, Maps) ->
	Fun =
		fun({Mapid, _, _}) ->
			case Mapid > 0 of
				true ->
					MapCfgs = array:get(Mapid, ArCfg),
					NewList = writeToFile(MapCfgs),
					fileAddHead(NewList, Mapid);
				_ ->
					?ERROR_OUT("Mapid=~p", [Mapid]),
					skip
			end
		end,
	lists:foreach(Fun, Maps).

writeToCfgModule(Maps) ->
    {ok, Cwd} = file:get_cwd(),
    ?LOG_OUT("~ts~n",[Cwd]),
	FileName = io_lib:format("./src/pub/mapcfgs/gameMapCfg.erl",[]),
	file:write_file(FileName, ""),
	Mod = io_lib:format("-module(gameMapCfg).\n",[]),
	Com = "-compile(export_all).\n",
	Fun =
		lists:foldl(
			fun({Mapid, _, _}, Acc) ->
				MapFun = formatMapCfgFunc(Mapid),
				io_lib:format("~ts~ts",[Acc, MapFun])
			end, "\n", Maps),

	LastContent = Mod ++ Com ++ Fun ++ formatMapCfgFuncTail(),
	checkFileContent(FileName, LastContent),
	ok.

formatMapCfgFunc(MapID)->
	io_lib:format("getMapCfg(~p)-> cfg_gamemapcfg~p ;\n",[MapID, MapID]).
	
formatMapCfgFuncTail()->
    io_lib:format("getMapCfg(_)-> undefined.\n",[]).

-spec fileAddHead(FileList, Mapid) -> ok | {error, Reason} when
	FileList :: list(), Mapid :: uint(), Reason :: term().
fileAddHead(FileList, Mapid) ->
	Filename = io_lib:format("./src/pub/mapcfgs/cfg_gamemapcfg~p.erl", [Mapid]),
	Mod = io_lib:format("-module(cfg_gamemapcfg~p).\n", [Mapid]),
	Com = "-export([getRow/1]).\n",
	Head = "-include(\"gameMap.hrl\").\n\n",
	MapCfgList = Mod ++ Com ++ Head ++ FileList,
	checkFileContent(Filename, MapCfgList).

-spec writeToFile(MapCfg) -> list() when
	MapCfg :: term().
writeToFile(MapCfg) ->
	MapId = MapCfg#recGameMapCfg.mapID,
	MaxPlayerNum = MapCfg#recGameMapCfg.maxPlayerNum,
	WorldPos = MapCfg#recGameMapCfg.worldPos,
	ColCellNum = MapCfg#recGameMapCfg.colCellNum,
	RowCellNum = MapCfg#recGameMapCfg.rowCellNum,
	ColGridNum = MapCfg#recGameMapCfg.colGridNum,
	RowGridNum = MapCfg#recGameMapCfg.rowGridNum,
	CellSize = MapCfg#recGameMapCfg.cellSize,
	InitX = MapCfg#recGameMapCfg.initX,
	InitY = MapCfg#recGameMapCfg.initY,
	Block = MapCfg#recGameMapCfg.block,
	DropInfo = MapCfg#recGameMapCfg.dropInfo,


	MapObjRelivePt1 = MapCfg#recGameMapCfg.mapRelivePt,
	MapObjTrigger1 = MapCfg#recGameMapCfg.mapTrigger,
	MapObjMonster1 = MapCfg#recGameMapCfg.mapMonster,
	MapObjNpc1 = MapCfg#recGameMapCfg.mapNpc,
	MapObjWayPt1 = MapCfg#recGameMapCfg.mapWayPt,
	MapObjCollect1 = MapCfg#recGameMapCfg.mapCollect,
	MapObjUseItem1 = MapCfg#recGameMapCfg.mapUseItem,

	Str = io_lib:format("getRow(~p) ->
		#recGameMapCfg{
		mapID = ~p,
		maxPlayerNum = ~p,
		worldPos = ~p,
		colCellNum = ~p,
		rowCellNum = ~p,
		colGridNum = ~p,
		rowGridNum = ~p,
		cellSize = ~p,
		initX = ~p,
		initY = ~p,
		block = ~p,
		dropInfo = ~p,
		mapRelivePt = ~p,
		mapTrigger = ~p,
		mapMonster = ~p,
		mapNpc = ~p,
		mapWayPt = ~p,
		mapCollect = ~p,
		mapUseItem = ~p
		}.\n\n", [MapId, MapId, MaxPlayerNum, WorldPos, ColCellNum, RowCellNum, ColGridNum, RowGridNum, CellSize,
		InitX, InitY, Block, DropInfo, MapObjRelivePt1, MapObjTrigger1, MapObjMonster1,
		MapObjNpc1, MapObjWayPt1, MapObjCollect1, MapObjUseItem1]),
	Str.

-spec loadAllMaps(Reg) -> {ok, array:array()} | {false, Why} when
	Reg :: list(), Why :: string().
loadAllMaps([]) ->
	FinalArCfg = get(mapsettingArCfg),
	{ok, FinalArCfg};
loadAllMaps([{MapId, Res1, Res2} | T]) ->
	try
		NewArCfg = readMap(MapId, Res1, get(mapsettingArCfg)),
		RetArCfg = readMapInfo(MapId, Res2, NewArCfg),
		put(mapsettingArCfg, RetArCfg),
		loadAllMaps(T)
	catch _:Error:ST -> ?ERROR_OUT("~p,~p",[Error, ST])
	end.

-spec readMap(MapID, FileName, ArCfg) -> array:array() when
	MapID :: mapId(), FileName :: string(), ArCfg :: array:array().
readMap(MapID, FileName, ArCfg) when erlang:is_integer(MapID) andalso MapID > 0 andalso MapID =< 65535 ->
	Ret = loadMapFromFile(MapID, FileName),
	case Ret of
		{ok, #recGameMapCfg{} = Cfg} ->
			array:set(MapID, Cfg, ArCfg);
		Other ->
			?ERROR_OUT("throw~p~n", [Other]),
			throw(Other)
	end.

-spec readMapInfo(MapID, FileName, ArCfg) -> array:array() when
	MapID :: mapId(), FileName :: string(), ArCfg :: array:array().
readMapInfo(MapID, FileName, ArCfg) when erlang:is_integer(MapID) andalso MapID > 0 andalso MapID =< 65535 ->
	RetInfo = loadMapInfoFromFile(MapID, FileName),
	case RetInfo of
		{ok, {MapID, Info}} ->
			MapCfg = array:get(MapID, ArCfg),
			WayPtList = array:get(?MapObjWayPt, Info),
			case erlang:length(WayPtList) =< 0 of
				true ->
					?ERROR_OUT("地图[~p]没有路点信息，无法设置地图初始点 fileName:~s", [MapID, FileName]),
					throw("Map No Way Point, Can't Set Map Init Pos");
				_ ->
					skip
			end,
			[MapWayPt | _] = WayPtList,
			InitX = MapWayPt#recMapWayPt.x,
			InitY = MapWayPt#recMapWayPt.y,
			RelivePt = array:get(?MapObjRelivePt, Info),
			Trigger = array:get(?MapObjTrigger, Info),
			Monster = array:get(?MapObjMonster, Info),
			Npc = array:get(?MapObjNpc, Info),
			Collect = array:get(?MapObjCollect, Info),
			UseItem = array:get(?MapObjUseItem, Info),
			NewMapCfg = MapCfg#recGameMapCfg{
				initX = InitX,
				initY = InitY,
				mapRelivePt = RelivePt,
				mapTrigger = Trigger,
				mapMonster = Monster,
				mapNpc = Npc,
				mapWayPt = WayPtList,
				mapCollect = Collect,
				mapUseItem = UseItem
			},

			array:set(MapID, NewMapCfg, ArCfg);
		OtherInfo ->
			?ERROR_OUT("Read MapID[~p] File[~s] Error~p",[MapID,FileName, OtherInfo]),
			throw(OtherInfo)
	end.

%%从指定文件中读取地图阻挡信息
-spec loadMapFromFile(MapID, Filename) -> {ok, #recGameMapCfg{}} | {error, Why} when
	MapID :: integer(),
	Filename :: string(),
	Why :: term().
loadMapFromFile(MapID, Filename) when erlang:is_list(Filename) ->
	?LOG_OUT("Load Map[ID:~p] File ~p", [MapID, Filename]),
	Ret = file:read_file(Filename),
	case Ret of
		{ok, Bin} ->
			Cfg = loadMapFromBinary(MapID, Bin),
			{ok, Cfg};
		Error ->
			?ERROR_OUT("Load Map[ID:~p] File[~ts] Failed ", [MapID, Filename]),
			Error
	end.

%从指定文件中读取地图物件信息
-spec loadMapInfoFromFile(MapID, FileName) -> {ok, {MapID, array:array()}} | Error when
	MapID :: integer(),
	FileName :: string(),
	Error :: term().
loadMapInfoFromFile(MapID, FileName) when erlang:is_list(FileName) ->
	Ret = file:read_file(FileName),
	case Ret of
		{ok, Bin} ->
			Info = loadMapInfoFromBinary(Bin, FileName),
			{ok, {MapID, Info}};
		Error ->
			Error
	end.

%从二进制数据中根据版本号读取地图阻挡信息
-spec loadMapFromBinary(MapID, Bin) -> #recGameMapCfg{} | Error when
	MapID :: non_neg_integer(),
	Bin :: binary(),
	Error :: string().
loadMapFromBinary(MapID, Bin) when erlang:is_integer(MapID) andalso MapID > 0 andalso erlang:is_binary(Bin) ->
	?GameMapBinFile = Bin,
	case Tag of
		<<"PATH">> ->
			skip;
		_ ->
			%%文件不是PathGrid文件，策划配置填错了
			?ERROR_OUT("Error Cfg of Map[~p] PathFile", [MapID]),
			throw("Error Cfg of Map Path File")
	end,
	%检查文件大小
	BinSize = erlang:byte_size(Bin),
	case FileSize =:= BinSize of
		true ->
			ok;
		false ->
		    ?ERROR_OUT("FileSize =:= BinSize, ~p = ~p~n",[FileSize, BinSize]),
			throw("Error Map Data")
	end,

	%检查文件头大小
	RemainDataSize = erlang:byte_size(RemainData),
	case (FileSize - RemainDataSize) == HeaderSize of
		true ->
			ok;
		false ->
		    ?ERROR_OUT("(FileSize - RemainDataSize) =:= HeaderSize, ~p - ~p= ~p~n",[FileSize, RemainDataSize, HeaderSize]),
			throw("Error Map Data")
	end,

	%检查数据偏移
	Offset1 = BlockInfoOffset + BlockInfoLen,
	Offset2 = HeightInfoOffset + HeightInfoLen,
	Offset3 = BakedDataOffset + BakedDataLen,
	Offset4 = UserDataOffset + UserDataLen,
	Offset5 = WeightMergeDataOffset + MergeWeightDataLength,

	if
		Offset1 > BinSize ->
		    ?ERROR_OUT("Offset1 > BinSize, ~p = ~p~n",[Offset1, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset2 > BinSize ->
		    ?ERROR_OUT("Offset2 > BinSize, ~p = ~p~n",[Offset2, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset3 > BinSize ->
		    ?ERROR_OUT("Offset3 > BinSize, ~p = ~p~n",[Offset3, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset4 > BinSize ->
		    ?ERROR_OUT("Offset4 > BinSize, ~p = ~p~n",[Offset4, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset5 > BinSize ->
		    ?ERROR_OUT("Offset5 > BinSize, ~p = ~p~n",[Offset5, BinSize]),
			throw("Map File Internal Error,Overflow!");
		true ->
			ok
	end,
	TotalCellNum = TotalColCellNum * TotalRowCellNum,
	if
		BlockInfoLen /= TotalCellNum ->
		    ?ERROR_OUT("BlockInfoLen /= (TotalColCellNum * TotalRowCellNum), ~p = ~p*~p~n",[BlockInfoLen, TotalColCellNum, TotalRowCellNum]),
			throw("Map File Internal Logic Error");
%%		(HeightInfoLen / 4) /= TotalCellNum ->
%%		    ?ERROR_OUT("(HeightInfoLen / 4) /= TotalCellNum, ~p = ~p~n",[HeightInfoLen, TotalCellNum]),
%%			throw("Map File Internal Logic Error");
		true ->
			ok
	end,
	loadMapByVersion(Version, MapID, Bin, ?GameMapBinFile).

%读取1号版本的地图阻挡信息
-spec loadMapByVersion(1, MapID, Bin, FileHeader) -> #recGameMapCfg{} when
	Bin :: binary(), MapID :: non_neg_integer(), FileHeader :: binary().
loadMapByVersion(1, MapID, Bin, ?GameMapBinFile) ->
	%阻挡信息
	<<BlockBin/binary>> = binary:part(Bin, BlockInfoOffset, BlockInfoLen),
	%高度信息
	<<HeightBin/binary>> = binary:part(Bin, HeightInfoOffset, HeightInfoLen),

	#recGameMapCfg{
		mapID = MapID,
		worldPos = {X, Y, Z},
		colCellNum = TotalColCellNum,
		rowCellNum = TotalRowCellNum,
		colGridNum = myceil(TotalColCellNum / ?MaxGridCellColNum),
		rowGridNum = myceil(TotalRowCellNum / ?MaxGridCellRowNum),
		cellSize = CellSize,
		block = BlockBin,
		height = HeightBin
	}.

%从二进制数据中读取地图物件信息
-spec loadMapInfoFromBinary(Bin, FileName) -> array:array() when
	Bin :: binary(), FileName :: term().
loadMapInfoFromBinary(Bin, FileName) ->
	?GameMapInfoBinFile = Bin,
	case Tag of
		<<"SCEN">> ->
			skip;
		_ ->
			%%不是MapInfo文件，策划配置填错了
			?ERROR_OUT("Error Cfg of Map MapInfo File ~ts", [FileName]),
			throw("Error Cfg of Map MapInfo File")
	end,
	%检查文件大小
	BinSize = erlang:byte_size(Bin),
	case FileSize =:= BinSize of
		true ->
			ok;
		false ->
			?ERROR_OUT("error Filesize:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Error Map Info Data FileSize")
	end,

	%检查文件头大小
	RemainDataSize = erlang:byte_size(RemainData),
	case (FileSize - RemainDataSize) =:= HeaderSize of
		true ->
			ok;
		false ->
			?ERROR_OUT("error HeaderSize:~s, HeaderSize:~p, RemainDataSize:~p ", [FileName, HeaderSize, RemainDataSize]),
			throw("Error Map Info Data HeaderSize")
	end,

	%检查数据偏移
	Offset1 = TriggerOffset + TriggerDataLen,
	Offset2 = NpcOffset + NpcDataLen,
	Offset3 = MonsterOffset + MonsterDataLen,
	Offset4 = RelivePtOffset + RelivePtDataLen,
	Offset5 = WayPtOffset + WayPtDataLen,
	Offset6 = CollectDataOffset + CollectDataLength,
	Offset7 = UseItemDataOffset + UseItemDataLength,
	EOFFlag = binary:part(Bin, BinSize - 4, 4),

	if
		Offset1 > BinSize ->
			?ERROR_OUT("error Overflow:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset2 > BinSize ->
			?ERROR_OUT("error Overflow:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset3 > BinSize ->
			?ERROR_OUT("error Overflow:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset4 > BinSize ->
			?ERROR_OUT("error Overflow:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset5 > BinSize ->
			?ERROR_OUT("error Overflow:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset6 > BinSize ->
			?ERROR_OUT("error Overflow:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Map File Internal Error,Overflow!");
		Offset7 > BinSize ->
			?ERROR_OUT("error Overflow:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Map File Internal Error,Overflow!");
		<<"EOF", 0>> /= EOFFlag ->
			?ERROR_OUT("error EOF Flag:~s, FileSize:~p, BinSize:~p ", [FileName, FileSize, BinSize]),
			throw("Map File Error, No EOF Flag");
		true ->
			ok
	end,
	loadMapInfoByVersion(Version, Bin, ?GameMapInfoBinFile).

%根据版本号读取地图物件信息
-spec loadMapInfoByVersion(1, Bin, FileHeader) -> array:array() when
	Bin :: binary(), FileHeader :: binary().
loadMapInfoByVersion(1, Bin, ?GameMapInfoBinFile) ->
	Ar = array:new([{size, 7}, {fixed, true}]),

	%%触发器
	AllTriggerData = binary:part(Bin, TriggerOffset, TriggerDataLen),
	NewArTrigger = binaryReadTriggerData(AllTriggerData, []),
	Ar1 = array:set(?MapObjTrigger, NewArTrigger, Ar),

	%%NPC
	NpcData = binary:part(Bin, NpcOffset, NpcDataLen),
	NpcList = loadMapStubData(NpcData, NpcNum),
	Ar2 = array:set(?MapObjNpc, NpcList, Ar1),

	%%怪物
	MonsterData = binary:part(Bin, MonsterOffset, MonsterDataLen),
	MonsterList = loadMapStubData(MonsterData, MonsterNum),
	Ar3 = array:set(?MapObjMonster, MonsterList, Ar2),

	%%复活点
	RelivePtData = binary:part(Bin, RelivePtOffset, RelivePtDataLen),
	RelivePtList = loadMapStubData(RelivePtData, RelivePtNum),
	Ar4 = array:set(?MapObjRelivePt, RelivePtList, Ar3),

	%%路点
	WayPtData = binary:part(Bin, WayPtOffset, WayPtDataLen),
	WayPtList = loadMapWayPtData(WayPtData, [], WayPtNum),
	Ar5 = array:set(?MapObjWayPt, WayPtList, Ar4),

	%%地图中的采集数据
	CollectData = binary:part(Bin, CollectDataOffset, CollectDataLength),
	CollectList = loadMapStubData(CollectData, CollectNum),
	Ar6 = array:set(?MapObjCollect, CollectList, Ar5),

	%%地图中的采集数据
	UseItemData = binary:part(Bin, UseItemDataOffset, UseItemDataLength),
	UseItemList = loadMapStubData(UseItemData, UseItemNum),
	Ar7 = array:set(?MapObjUseItem, UseItemList, Ar6),

	Ar7.

-spec loadMapWayPtData(Bin, List, Num) -> list() when
	Bin :: binary(), List :: list(), Num :: uint().
loadMapWayPtData(<<>>, List, 0) when erlang:is_list(List) ->
	lists:reverse(List);
loadMapWayPtData(Bin, List, Num) when erlang:is_list(List) ->
%% 	<<Data1:64/bytes,LL/bytes>>=Bin,
%% 	<<Data2:28/bytes,Name22:32/bytes,ID22:?U32>>=Data1,
	?MapWayPtData = Bin,
	{NeighborIdList, Remain1} = loadNeighborIds(Remain, [], 0, NeighborCount),
	{Remain2, _CostList} = loadMinCost(Remain1),
	LowerName = string:to_lower(erlang:binary_to_list(Name)),
	StrName = string:strip(LowerName, right, 0),
	WayPt = #recMapWayPt{
		x = MapX,
		y = MapZ,
		name = StrName,
		id = ID,
		neighborCount = NeighborCount,
		neighborIds = NeighborIdList
	},
	loadMapWayPtData(Remain2, [WayPt | List], Num - 1).

-spec loadNeighborIds(Bin, Result, I, N) -> {Result, Bin} when
	Bin :: binary(), Result :: list(), I :: uint(), N :: uint().
loadNeighborIds(Bin, Result, N, N) ->
	{Result, Bin};
loadNeighborIds(Bin, Result, I, N) ->
	{ID, Remain} = binary_read_int(Bin),
	loadNeighborIds(Remain, [ID | Result], I + 1, N).

-spec loadMinCost(Bin) -> {Bin, list()} when
	Bin :: binary().
loadMinCost(Bin) ->
	<<MinCostCount:?S32, Remain/bytes>> = Bin,
	loadMinCost(MinCostCount, Remain, []).

-spec loadMinCost(MinCostCount, Bin, Result) -> {Bin, list()} when
	MinCostCount :: uint(), Bin :: binary(), Result :: list().
loadMinCost(0, Bin, Result) ->
	{Bin, lists:reverse(Result)};
loadMinCost(MinCostCount, Bin, Result) ->
	<<Cost:?S32, Remain/bytes>> = Bin,
	loadMinCost(MinCostCount - 1, Remain, [Cost | Result]).


-spec loadMapStubData(Bin, Num) -> list() when
	Bin :: binary(), Num :: non_neg_integer().
loadMapStubData(Bin, Num) ->
	binaryReadStubData(Bin, [], Num).

-spec binaryReadStubData(Bin, List, Num) -> list() when
	Bin :: binary(), List :: list(), Num :: uint().
binaryReadStubData(<<>>, List, 0) ->
	List;
binaryReadStubData(Bin, List, Num) when erlang:is_binary(Bin) ->
	?MapStubData = Bin,
	Data = #recMapObjData{
		id = ID,                                   %ID
		name = Name,                               %名字
		mapX = MapX,                               %地图坐标X
		mapY = MapZ,                               %地图坐标Y
		rotW = RotW,
		groupID = 0 %% 默认把物件的分组ID设为0
	},
	binaryReadStubData(Left, [Data | List], Num - 1).

-spec binaryReadTriggerData(Bin, TriggerList) -> TriggerList when
	Bin :: binary(), TriggerList :: list().
binaryReadTriggerData(<<>>, TriggerList) ->
	TriggerList;
binaryReadTriggerData(Bin, TriggerList) when erlang:is_binary(Bin) ->
	?MapTriggerBaseData = Bin,
	{InStrCount, R1} = binary_read_int16(Left),
	{InArgs, Left1} = binaryReadTriggerStringList(InStrCount, [], R1),
	{OutStrCount, R2} = binary_read_int16(Left1),
	{OutArgs, Left2} = binaryReadTriggerStringList(OutStrCount, [], R2),
	TriggerArea = case VolumeType of
		              1 ->
			              ?MapTriggerVolumeBox = Left2,
			              #recMapTriggerVolumeBox{
				              centerX = CenterX,
				              centerY = CenterZ,
				              width = SizeX,
				              height = SizeZ
			              };
		              2 ->
			              ?MapTriggerVolumeSphere = Left2,
			              #recMapTriggerVolumeSphere{
				              centerX = CenterX,
				              centerY = CenterZ,
				              r = R
			              };
		              _ ->
			              Remain = Left2,
			              throw("Error VolumeType")
	              end,
	Data = #recMapTriggerData{
		mapX = MapX,                                 %地图坐标X
		mapY = MapZ,                                 %地图坐标Y
		name = Name,                                 %该触发数据的名字
		id = ID,                                     %该触发数据的ID
		volumeType = VolumeType,                     %触发器区域形状，可能是box或者是sphere
		inTriggerName = InTriggerName,               %走入触发区域调用的触发器名称
		inTriggerArgFormat = InTriggerArgFormat,     %走入触发区域调用触发器的参数格式
		outTriggerName = OutTriggerName,             %走出触发区域调用的触发器名称
		outTriggerArgFormat = OutTriggerArgFormat,   %走出触发区域调用触发器的参数格式
		inDelayTime = InDelayTime,                   %走入触发区域调用触发器的延迟时间
		outDelayTime = OutDelayTime,                 %走出触发区域调用触发器的延迟时间
		totalTriggerCount = TotalTriggerCount,       %总共可触发多少次
		inArgs = InArgs,                             %走入触发区域调用触发器时的参数
		outArgs = OutArgs,                           %走出触发区域调用触发器时的参数
		triggerArea = TriggerArea                    %触发区域
	},
	binaryReadTriggerData(Remain, [Data | TriggerList]).

-spec binaryReadTriggerStringList(StrCount, StringList, Bin) -> {list(), Bin} when
	StrCount :: uint(), StringList :: list(), Bin :: binary().
binaryReadTriggerStringList(0, StringList, Bin) ->
	{lists:reverse(StringList), Bin};
binaryReadTriggerStringList(StrCount, StringList, Bin) ->
	{Args, Remain} = binary_read_string(Bin),
	binaryReadTriggerStringList(StrCount - 1, [Args | StringList], Remain).

%%读取原始文件
-spec readFile(FileName :: string()) -> list() | [].
readFile(FileName) ->
	case file:read_file(FileName) of
		{ok, Binary} ->
			Binary;
		Ret ->
			?ERROR_OUT("Read File:~p failed By:~p!~n", [FileName, Ret]),
			[]
	end.

checkFileContent(FileName, Content) ->
	Bin = erlang:list_to_binary(Content),
	case file:read_file(FileName) of
		{ok, Bin} ->
			?LOG_OUT("...~s no change~n", [FileName]);
		_Other ->
			%% 加入编译方式
			%% "%% coding: latin-1\r\n"
			Title = <<37, 37, 32, 99, 111, 100, 105, 110, 103, 58, 32, 108, 97, 116, 105, 110, 45, 49, 13, 10>>,
			Bin2 = <<Title/binary, Bin/binary>>,
			case file:write_file(FileName, Bin2) of
				ok ->
					?LOG_OUT("Write File:~s OK~n", [FileName]);
				{error, Reason} ->
					?ERROR_OUT("Write File:~s Failed by:~p~n", [FileName, Reason])
			end
	end,
	ok.

%%返回大于或者等于指定表达式的最小整数，即向上取整函数
-spec myceil(Number) -> int() when
	Number :: number().
myceil(Number) ->
	Int = erlang:trunc(Number),
	case Number == Int of
		true ->
			Int;
		_ ->
			erlang:round(Number + 0.5)
	end.

%binary_read_int16(Bin) -> {Short,LeftBin}
%@spec读取Bin中的一个Short
-spec binary_read_int16(Bin :: binary()) -> {int16(), Left} when
	Left :: binary().
binary_read_int16(Bin) when erlang:is_binary(Bin) ->
	<<C:?S16, Left/binary>> = Bin,
	{C, Left}.

%@spec binary_read_string(Bin) -> {String,LeftBin} | {[],LeftBin} | {[],Bin}
%从Bin中提取字符串，成功返回{String,LeftBin},失败返回{[],LeftBin}
%如果Bin中包括的字符串长度超过Bin本身的长度，则返回{[],Bin}
-spec binary_read_string(Bin) -> {string(), Remain} when
	Bin :: binary(), Remain :: binary().
binary_read_string(Bin) when erlang:is_binary(Bin) ->
	<<Len:16/little, Left/binary>> = Bin,
	Size = erlang:byte_size(Left),
	if
		Len =< Size ->
			case Len of
				0 ->
					{[], Left};
				_ ->
					{Str, LeftData} = split_binary(Left, Len),
					{binary_to_list(Str), LeftData}
			end;
		true ->
			{[], Bin}
	end.
-spec binary_read_int(Bin :: binary()) -> {C, Left} when
	C :: int(), Left :: binary().
binary_read_int(Bin) when erlang:is_binary(Bin) ->
	<<C:?S32, Left/binary>> = Bin,
	{C, Left}.

%%-spec logout(F, A) -> string() when F :: string(), A :: list().
%%logout(F, A) ->
%%	{Date, Time} = erlang:localtime(),
%%	{YYYY, MM, DD} = Date,
%%	{Hour, Min, Sec} = Time,
%%	String = io_lib:format(F, A),
%%	io:format("[~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w] ~ts ~n",
%%		[YYYY, MM, DD, Hour, Min, Sec, String]).



%%info_log(Fmt)-> info_log(Fmt, []).
info_log(Fmt, Args)-> io:format("~ts~n", [green(io_lib:format(Fmt,Args))]).

%%warn_log(Fmt)-> warn_log(Fmt, []).
warn_log(Fmt, Args) -> io:format("~ts~n", [yellow(io_lib:format(Fmt,Args))]).

%%error_log(Fmt) -> error_log(Fmt, []).
error_log(Fmt, Args)-> io:format("~ts~n", [red(io_lib:format(Fmt,Args))]).

%% ====================================================================
-define(ESC, <<"\e[">>).
-define(RST, <<"0">>).
-define(BOLD, <<"1">>).
-define(SEP, <<";">>).
-define(END, <<"m">>).

%% Colors
-define(BLACK, <<"30">>).
-define(RED, <<"31">>).
-define(GREEN, <<"32">>).
-define(YELLOW, <<"33">>).
-define(BLUE, <<"34">>).
-define(MAGENTA, <<"35">>).
-define(CYAN, <<"36">>).
-define(WHITE, <<"37">>).
-define(DEFAULT, <<"39">>).

%% Background colors
-define(BLACK_BG, <<"40">>).
-define(RED_BG, <<"41">>).
-define(GREEN_BG, <<"42">>).
-define(YELLOW_BG, <<"43">>).
-define(BLUE_BG, <<"44">>).
-define(MAGENTA_BG, <<"45">>).
-define(CYAN_BG, <<"46">>).
-define(WHITE_BG, <<"47">>).
-define(DEFAULT_BG, <<"49">>).

%% RGB
-define(RGB_FG, [<<"38">>, ?SEP, <<"5">>]).
-define(RGB_BG, [<<"48">>, ?SEP, <<"5">>]).

%% True 24-bit colors
-define(TRUE_COLOR_FG, [<<"38">>, ?SEP, <<"2">>]).
-define(TRUE_COLOR_BG, [<<"48">>, ?SEP, <<"2">>]).




red(Text)        -> [color(?RED),        Text, reset()].
green(Text)      -> [color(?GREEN),      Text, reset()].
yellow(Text)     -> [color(?YELLOW),     Text, reset()].

%% Internal
color(Color) ->
	<<?ESC/binary, Color/binary, ?END/binary>>.

reset() ->
	<<?ESC/binary, ?RST/binary, ?END/binary>>.

