%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(netmsg).

-compile(nowarn_unused_vars).

-include("netmsg.hrl").
-include("type.hrl").
-import(binary_lib, [
	read_int64/1,
	read_int32/1,
	read_int16/1,
	read_int8/1,
	read_uint64/1,
	read_uint32/1,
	read_uint16/1,
	read_uint8/1,
	read_bool/1,
	read_float/1,
	read_double/1,
	read_string/1,
	read_array/2,
	write_int64/1,
	write_int32/1,
	write_int16/1,
	write_int8/1,
	write_uint64/1,
	write_uint32/1,
	write_uint16/1,
	write_uint8/1,
	write_bool/1,
	write_float/1,
	write_double/1,
	write_string/1,
	write_array/2
]).

-export([
	decode/2,
	encode/1,
	name/1
]).

%GENERATED from file:LS2User.h => GS2U_ChangeLineResponse
decode(?GS2U_ChangeLineResponse,Bin0) ->
	{ V_gameServers, Bin1 } = read_array(Bin0, fun(X) -> decode_GameServerInfo( X ) end),
	{ V_identity, Bin2 } = read_string( Bin1 ),
	{ #pk_GS2U_ChangeLineResponse {
		gameServers = V_gameServers,
		identity = V_identity
		},
	Bin2 };

%GENERATED from file:LS2User.h => GS2U_GoNewMap
decode(?GS2U_GoNewMap,Bin0) ->
	{ V_tarMapID, Bin1 } = read_int32( Bin0 ),
	{ V_fX, Bin2 } = read_float( Bin1 ),
	{ V_fY, Bin3 } = read_float( Bin2 ),
	{ #pk_GS2U_GoNewMap {
		tarMapID = V_tarMapID,
		fX = V_fX,
		fY = V_fY
		},
	Bin3 };

%GENERATED from file:LS2User.h => LS2U_GameLineServerList
decode(?LS2U_GameLineServerList,Bin0) ->
	{ V_gameServers, Bin1 } = read_array(Bin0, fun(X) -> decode_GameServerInfo( X ) end),
	{ #pk_LS2U_GameLineServerList {
		gameServers = V_gameServers
		},
	Bin1 };

%GENERATED from file:LS2User.h => LS2U_LoginQue
decode(?LS2U_LoginQue,Bin0) ->
	{ V_currentNumber, Bin1 } = read_uint64( Bin0 ),
	{ #pk_LS2U_LoginQue {
		currentNumber = V_currentNumber
		},
	Bin1 };

%GENERATED from file:LS2User.h => LS2U_LoginResult
decode(?LS2U_LoginResult,Bin0) ->
	{ V_result, Bin1 } = read_int8( Bin0 ),
	{ V_accountID, Bin2 } = read_uint64( Bin1 ),
	{ V_identity, Bin3 } = read_string( Bin2 ),
	{ V_msg, Bin4 } = read_string( Bin3 ),
	{ #pk_LS2U_LoginResult {
		result = V_result,
		accountID = V_accountID,
		identity = V_identity,
		msg = V_msg
		},
	Bin4 };

%GENERATED from file:LS2User.h => U2GS_ChangeMap
decode(?U2GS_ChangeMap,Bin0) ->
	{ V_newMapID, Bin1 } = read_int32( Bin0 ),
	{ V_fX, Bin2 } = read_float( Bin1 ),
	{ V_fY, Bin3 } = read_float( Bin2 ),
	{ #pk_U2GS_ChangeMap {
		newMapID = V_newMapID,
		fX = V_fX,
		fY = V_fY
		},
	Bin3 };

%GENERATED from file:LS2User.h => U2LS_Login_Normal
decode(?U2LS_Login_Normal,Bin0) ->
	{ V_platformAccount, Bin1 } = read_string( Bin0 ),
	{ V_platformName, Bin2 } = read_string( Bin1 ),
	{ V_platformNickName, Bin3 } = read_string( Bin2 ),
	{ V_time, Bin4 } = read_int64( Bin3 ),
	{ V_sign, Bin5 } = read_string( Bin4 ),
	{ V_deviceId, Bin6 } = read_string( Bin5 ),
	{ V_imei, Bin7 } = read_string( Bin6 ),
	{ V_idfa, Bin8 } = read_string( Bin7 ),
	{ V_mac, Bin9 } = read_string( Bin8 ),
	{ V_extParam, Bin10 } = read_string( Bin9 ),
	{ V_versionRes, Bin11 } = read_int32( Bin10 ),
	{ V_versionExe, Bin12 } = read_int32( Bin11 ),
	{ V_versionGame, Bin13 } = read_int32( Bin12 ),
	{ V_versionPro, Bin14 } = read_int32( Bin13 ),
	{ #pk_U2LS_Login_Normal {
		platformAccount = V_platformAccount,
		platformName = V_platformName,
		platformNickName = V_platformNickName,
		time = V_time,
		sign = V_sign,
		deviceId = V_deviceId,
		imei = V_imei,
		idfa = V_idfa,
		mac = V_mac,
		extParam = V_extParam,
		versionRes = V_versionRes,
		versionExe = V_versionExe,
		versionGame = V_versionGame,
		versionPro = V_versionPro
		},
	Bin14 };

%GENERATED from file:LS2User.h => U2LS_RequestGSLine
decode(?U2LS_RequestGSLine,Bin0) ->
	{ #pk_U2LS_RequestGSLine {

		},
	Bin0 }.

%GENERATED from file:LS2User.h => GameServerInfo
-spec decode_GameServerInfo(Bin0) -> { #pk_GameServerInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_GameServerInfo(Bin0) ->
	{ V_lineid, Bin1 } = read_int16( Bin0 ),
	{ V_name, Bin2 } = read_string( Bin1 ),
	{ V_ip, Bin3 } = read_string( Bin2 ),
	{ V_port, Bin4 } = read_int16( Bin3 ),
	{ V_state, Bin5 } = read_int8( Bin4 ),
	{ #pk_GameServerInfo {
		lineid = V_lineid,
		name = V_name,
		ip = V_ip,
		port = V_port,
		state = V_state
		},
	Bin5 }.

%GENERATED from file:LS2User.h => GS2U_ChangeLineResponse
encode(#pk_GS2U_ChangeLineResponse{} = P) ->
	Bin_gameServers = write_array(P#pk_GS2U_ChangeLineResponse.gameServers, fun(X) -> encode_GameServerInfo( X ) end),
	Bin_identity = write_string( P#pk_GS2U_ChangeLineResponse.identity ),
	[
		<<?GS2U_ChangeLineResponse:?U16>>,
		Bin_gameServers,
		Bin_identity
	];

%GENERATED from file:LS2User.h => GS2U_GoNewMap
encode(#pk_GS2U_GoNewMap{} = P) ->
	Bin_tarMapID = write_int32( P#pk_GS2U_GoNewMap.tarMapID ),
	Bin_fX = write_float( P#pk_GS2U_GoNewMap.fX ),
	Bin_fY = write_float( P#pk_GS2U_GoNewMap.fY ),
	[
		<<?GS2U_GoNewMap:?U16>>,
		Bin_tarMapID,
		Bin_fX,
		Bin_fY
	];

%GENERATED from file:LS2User.h => LS2U_GameLineServerList
encode(#pk_LS2U_GameLineServerList{} = P) ->
	Bin_gameServers = write_array(P#pk_LS2U_GameLineServerList.gameServers, fun(X) -> encode_GameServerInfo( X ) end),
	[
		<<?LS2U_GameLineServerList:?U16>>,
		Bin_gameServers
	];

%GENERATED from file:LS2User.h => LS2U_LoginQue
encode(#pk_LS2U_LoginQue{} = P) ->
	Bin_currentNumber = write_uint64( P#pk_LS2U_LoginQue.currentNumber ),
	[
		<<?LS2U_LoginQue:?U16>>,
		Bin_currentNumber
	];

%GENERATED from file:LS2User.h => LS2U_LoginResult
encode(#pk_LS2U_LoginResult{} = P) ->
	Bin_result = write_int8( P#pk_LS2U_LoginResult.result ),
	Bin_accountID = write_uint64( P#pk_LS2U_LoginResult.accountID ),
	Bin_identity = write_string( P#pk_LS2U_LoginResult.identity ),
	Bin_msg = write_string( P#pk_LS2U_LoginResult.msg ),
	[
		<<?LS2U_LoginResult:?U16>>,
		Bin_result,
		Bin_accountID,
		Bin_identity,
		Bin_msg
	];

%GENERATED from file:LS2User.h => U2GS_ChangeMap
encode(#pk_U2GS_ChangeMap{} = P) ->
	Bin_newMapID = write_int32( P#pk_U2GS_ChangeMap.newMapID ),
	Bin_fX = write_float( P#pk_U2GS_ChangeMap.fX ),
	Bin_fY = write_float( P#pk_U2GS_ChangeMap.fY ),
	[
		<<?U2GS_ChangeMap:?U16>>,
		Bin_newMapID,
		Bin_fX,
		Bin_fY
	];

%GENERATED from file:LS2User.h => U2LS_Login_Normal
encode(#pk_U2LS_Login_Normal{} = P) ->
	Bin_platformAccount = write_string( P#pk_U2LS_Login_Normal.platformAccount ),
	Bin_platformName = write_string( P#pk_U2LS_Login_Normal.platformName ),
	Bin_platformNickName = write_string( P#pk_U2LS_Login_Normal.platformNickName ),
	Bin_time = write_int64( P#pk_U2LS_Login_Normal.time ),
	Bin_sign = write_string( P#pk_U2LS_Login_Normal.sign ),
	Bin_deviceId = write_string( P#pk_U2LS_Login_Normal.deviceId ),
	Bin_imei = write_string( P#pk_U2LS_Login_Normal.imei ),
	Bin_idfa = write_string( P#pk_U2LS_Login_Normal.idfa ),
	Bin_mac = write_string( P#pk_U2LS_Login_Normal.mac ),
	Bin_extParam = write_string( P#pk_U2LS_Login_Normal.extParam ),
	Bin_versionRes = write_int32( P#pk_U2LS_Login_Normal.versionRes ),
	Bin_versionExe = write_int32( P#pk_U2LS_Login_Normal.versionExe ),
	Bin_versionGame = write_int32( P#pk_U2LS_Login_Normal.versionGame ),
	Bin_versionPro = write_int32( P#pk_U2LS_Login_Normal.versionPro ),
	[
		<<?U2LS_Login_Normal:?U16>>,
		Bin_platformAccount,
		Bin_platformName,
		Bin_platformNickName,
		Bin_time,
		Bin_sign,
		Bin_deviceId,
		Bin_imei,
		Bin_idfa,
		Bin_mac,
		Bin_extParam,
		Bin_versionRes,
		Bin_versionExe,
		Bin_versionGame,
		Bin_versionPro
	];

%GENERATED from file:LS2User.h => U2LS_RequestGSLine
encode(#pk_U2LS_RequestGSLine{}) ->
	[
		<<?U2LS_RequestGSLine:?U16>>

	];

encode(_) -> noMatch.

%GENERATED from file:LS2User.h => GameServerInfo
encode_GameServerInfo( #pk_GameServerInfo{} = P ) ->
	Bin_lineid = write_int16( P#pk_GameServerInfo.lineid ),
	Bin_name = write_string( P#pk_GameServerInfo.name ),
	Bin_ip = write_string( P#pk_GameServerInfo.ip ),
	Bin_port = write_int16( P#pk_GameServerInfo.port ),
	Bin_state = write_int8( P#pk_GameServerInfo.state ),
	[
		Bin_lineid,
		Bin_name,
		Bin_ip,
		Bin_port,
		Bin_state	].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
name(?GS2U_ChangeLineResponse) -> "GS2U_ChangeLineResponse";
name(?GS2U_GoNewMap) -> "GS2U_GoNewMap";
name(?LS2U_GameLineServerList) -> "LS2U_GameLineServerList";
name(?LS2U_LoginQue) -> "LS2U_LoginQue";
name(?LS2U_LoginResult) -> "LS2U_LoginResult";
name(?U2GS_ChangeMap) -> "U2GS_ChangeMap";
name(?U2LS_Login_Normal) -> "U2LS_Login_Normal";
name(?U2LS_RequestGSLine) -> "U2LS_RequestGSLine";
name(MsgID) -> "ErrorNetMsg_" ++ erlang:integer_to_list(MsgID).

