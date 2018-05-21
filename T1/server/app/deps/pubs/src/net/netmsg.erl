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

%GENERATED from file:msg.h => GS2U_CreatePlayerResult
decode(?GS2U_CreatePlayerResult,Bin0) ->
	{ V_errorCode, Bin1 } = read_int32( Bin0 ),
	{ V_roleID, Bin2 } = read_uint64( Bin1 ),
	{ #pk_GS2U_CreatePlayerResult {
		errorCode = V_errorCode,
		roleID = V_roleID
		},
	Bin2 };

%GENERATED from file:msg.h => GS2U_DeletePlayerResult
decode(?GS2U_DeletePlayerResult,Bin0) ->
	{ V_roleID, Bin1 } = read_uint64( Bin0 ),
	{ V_errorCode, Bin2 } = read_int32( Bin1 ),
	{ #pk_GS2U_DeletePlayerResult {
		roleID = V_roleID,
		errorCode = V_errorCode
		},
	Bin2 };

%GENERATED from file:msg.h => GS2U_GoNewMap
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

%GENERATED from file:msg.h => GS2U_LoginResult
decode(?GS2U_LoginResult,Bin0) ->
	{ V_result, Bin1 } = read_int8( Bin0 ),
	{ V_accountID, Bin2 } = read_uint64( Bin1 ),
	{ V_identity, Bin3 } = read_string( Bin2 ),
	{ V_msg, Bin4 } = read_string( Bin3 ),
	{ #pk_GS2U_LoginResult {
		result = V_result,
		accountID = V_accountID,
		identity = V_identity,
		msg = V_msg
		},
	Bin4 };

%GENERATED from file:msg.h => GS2U_LookInfoPlayer
decode(?GS2U_LookInfoPlayer,Bin0) ->
	{ V_player_list, Bin1 } = read_array(Bin0, fun(X) -> decode_LookInfoPlayer( X ) end),
	{ #pk_GS2U_LookInfoPlayer {
		player_list = V_player_list
		},
	Bin1 };

%GENERATED from file:msg.h => GS2U_MonsterList
decode(?GS2U_MonsterList,Bin0) ->
	{ V_monster_list, Bin1 } = read_array(Bin0, fun(X) -> decode_LookInfoMonster( X ) end),
	{ #pk_GS2U_MonsterList {
		monster_list = V_monster_list
		},
	Bin1 };

%GENERATED from file:msg.h => GS2U_SelPlayerResult
decode(?GS2U_SelPlayerResult,Bin0) ->
	{ V_result, Bin1 } = read_int32( Bin0 ),
	{ #pk_GS2U_SelPlayerResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:msg.h => GS2U_UserPlayerList
decode(?GS2U_UserPlayerList,Bin0) ->
	{ V_info, Bin1 } = read_array(Bin0, fun(X) -> decode_UserPlayerData( X ) end),
	{ #pk_GS2U_UserPlayerList {
		info = V_info
		},
	Bin1 };

%GENERATED from file:msg.h => U2GS_ChangeMap
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

%GENERATED from file:msg.h => U2GS_Login_Normal
decode(?U2GS_Login_Normal,Bin0) ->
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
	{ #pk_U2GS_Login_Normal {
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

%GENERATED from file:msg.h => U2GS_RequestCreatePlayer
decode(?U2GS_RequestCreatePlayer,Bin0) ->
	{ V_name, Bin1 } = read_string( Bin0 ),
	{ V_camp, Bin2 } = read_int8( Bin1 ),
	{ V_career, Bin3 } = read_uint32( Bin2 ),
	{ V_race, Bin4 } = read_int8( Bin3 ),
	{ V_sex, Bin5 } = read_int8( Bin4 ),
	{ V_head, Bin6 } = read_int32( Bin5 ),
	{ #pk_U2GS_RequestCreatePlayer {
		name = V_name,
		camp = V_camp,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head
		},
	Bin6 };

%GENERATED from file:msg.h => U2GS_RequestDeletePlayer
decode(?U2GS_RequestDeletePlayer,Bin0) ->
	{ V_roleID, Bin1 } = read_uint64( Bin0 ),
	{ #pk_U2GS_RequestDeletePlayer {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:msg.h => U2GS_SelPlayerEnterGame
decode(?U2GS_SelPlayerEnterGame,Bin0) ->
	{ V_roleID, Bin1 } = read_uint64( Bin0 ),
	{ #pk_U2GS_SelPlayerEnterGame {
		roleID = V_roleID
		},
	Bin1 }.

%GENERATED from file:msg.h => LookInfoMonster
-spec decode_LookInfoMonster(Bin0) -> { #pk_LookInfoMonster{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_LookInfoMonster(Bin0) ->
	{ V_code, Bin1 } = read_uint64( Bin0 ),
	{ V_id, Bin2 } = read_uint32( Bin1 ),
	{ V_x, Bin3 } = read_float( Bin2 ),
	{ V_y, Bin4 } = read_float( Bin3 ),
	{ V_rotW, Bin5 } = read_float( Bin4 ),
	{ V_targetX, Bin6 } = read_float( Bin5 ),
	{ V_targetY, Bin7 } = read_float( Bin6 ),
	{ V_move_speed, Bin8 } = read_float( Bin7 ),
	{ V_attack_speed, Bin9 } = read_float( Bin8 ),
	{ V_moveStatus, Bin10 } = read_uint8( Bin9 ),
	{ V_type, Bin11 } = read_uint8( Bin10 ),
	{ V_hp_per, Bin12 } = read_uint8( Bin11 ),
	{ V_camp, Bin13 } = read_int8( Bin12 ),
	{ V_usercode, Bin14 } = read_uint64( Bin13 ),
	{ V_groupID, Bin15 } = read_uint64( Bin14 ),
	{ V_guildID, Bin16 } = read_uint64( Bin15 ),
	{ V_name, Bin17 } = read_string( Bin16 ),
	{ V_level, Bin18 } = read_uint16( Bin17 ),
	{ #pk_LookInfoMonster {
		code = V_code,
		id = V_id,
		x = V_x,
		y = V_y,
		rotW = V_rotW,
		targetX = V_targetX,
		targetY = V_targetY,
		move_speed = V_move_speed,
		attack_speed = V_attack_speed,
		moveStatus = V_moveStatus,
		type = V_type,
		hp_per = V_hp_per,
		camp = V_camp,
		usercode = V_usercode,
		groupID = V_groupID,
		guildID = V_guildID,
		name = V_name,
		level = V_level
		},
	Bin18 }.

%GENERATED from file:msg.h => LookInfoPlayer
-spec decode_LookInfoPlayer(Bin0) -> { #pk_LookInfoPlayer{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_LookInfoPlayer(Bin0) ->
	{ V_code, Bin1 } = read_uint64( Bin0 ),
	{ V_roleID, Bin2 } = read_uint64( Bin1 ),
	{ V_name, Bin3 } = read_string( Bin2 ),
	{ V_x, Bin4 } = read_float( Bin3 ),
	{ V_y, Bin5 } = read_float( Bin4 ),
	{ V_race, Bin6 } = read_int8( Bin5 ),
	{ V_career, Bin7 } = read_uint32( Bin6 ),
	{ V_sex, Bin8 } = read_int8( Bin7 ),
	{ V_camp, Bin9 } = read_int8( Bin8 ),
	{ V_head, Bin10 } = read_int32( Bin9 ),
	{ V_move_speed, Bin11 } = read_float( Bin10 ),
	{ V_level, Bin12 } = read_int16( Bin11 ),
	{ V_hp_per, Bin13 } = read_uint8( Bin12 ),
	{ V_petID, Bin14 } = read_uint16( Bin13 ),
	{ V_otherCode, Bin15 } = read_uint64( Bin14 ),
	{ V_servername, Bin16 } = read_string( Bin15 ),
	{ V_myServerName, Bin17 } = read_string( Bin16 ),
	{ V_isInCross, Bin18 } = read_bool( Bin17 ),
	{ V_pkMode, Bin19 } = read_uint8( Bin18 ),
	{ #pk_LookInfoPlayer {
		code = V_code,
		roleID = V_roleID,
		name = V_name,
		x = V_x,
		y = V_y,
		race = V_race,
		career = V_career,
		sex = V_sex,
		camp = V_camp,
		head = V_head,
		move_speed = V_move_speed,
		level = V_level,
		hp_per = V_hp_per,
		petID = V_petID,
		otherCode = V_otherCode,
		servername = V_servername,
		myServerName = V_myServerName,
		isInCross = V_isInCross,
		pkMode = V_pkMode
		},
	Bin19 }.

%GENERATED from file:msg.h => UserPlayerData
-spec decode_UserPlayerData(Bin0) -> { #pk_UserPlayerData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_UserPlayerData(Bin0) ->
	{ V_roleID, Bin1 } = read_uint64( Bin0 ),
	{ V_name, Bin2 } = read_string( Bin1 ),
	{ V_level, Bin3 } = read_int32( Bin2 ),
	{ V_wingLevel, Bin4 } = read_int32( Bin3 ),
	{ V_camp, Bin5 } = read_int8( Bin4 ),
	{ V_race, Bin6 } = read_int8( Bin5 ),
	{ V_career, Bin7 } = read_uint32( Bin6 ),
	{ V_sex, Bin8 } = read_int8( Bin7 ),
	{ V_head, Bin9 } = read_int32( Bin8 ),
	{ V_mapID, Bin10 } = read_uint16( Bin9 ),
	{ V_oldMapID, Bin11 } = read_uint16( Bin10 ),
	{ #pk_UserPlayerData {
		roleID = V_roleID,
		name = V_name,
		level = V_level,
		wingLevel = V_wingLevel,
		camp = V_camp,
		race = V_race,
		career = V_career,
		sex = V_sex,
		head = V_head,
		mapID = V_mapID,
		oldMapID = V_oldMapID
		},
	Bin11 }.

%GENERATED from file:msg.h => GS2U_CreatePlayerResult
encode(#pk_GS2U_CreatePlayerResult{} = P) ->
	Bin_errorCode = write_int32( P#pk_GS2U_CreatePlayerResult.errorCode ),
	Bin_roleID = write_uint64( P#pk_GS2U_CreatePlayerResult.roleID ),
	[
		<<?GS2U_CreatePlayerResult:?U16>>,
		Bin_errorCode,
		Bin_roleID
	];

%GENERATED from file:msg.h => GS2U_DeletePlayerResult
encode(#pk_GS2U_DeletePlayerResult{} = P) ->
	Bin_roleID = write_uint64( P#pk_GS2U_DeletePlayerResult.roleID ),
	Bin_errorCode = write_int32( P#pk_GS2U_DeletePlayerResult.errorCode ),
	[
		<<?GS2U_DeletePlayerResult:?U16>>,
		Bin_roleID,
		Bin_errorCode
	];

%GENERATED from file:msg.h => GS2U_GoNewMap
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

%GENERATED from file:msg.h => GS2U_LoginResult
encode(#pk_GS2U_LoginResult{} = P) ->
	Bin_result = write_int8( P#pk_GS2U_LoginResult.result ),
	Bin_accountID = write_uint64( P#pk_GS2U_LoginResult.accountID ),
	Bin_identity = write_string( P#pk_GS2U_LoginResult.identity ),
	Bin_msg = write_string( P#pk_GS2U_LoginResult.msg ),
	[
		<<?GS2U_LoginResult:?U16>>,
		Bin_result,
		Bin_accountID,
		Bin_identity,
		Bin_msg
	];

%GENERATED from file:msg.h => GS2U_LookInfoPlayer
encode(#pk_GS2U_LookInfoPlayer{} = P) ->
	Bin_player_list = write_array(P#pk_GS2U_LookInfoPlayer.player_list, fun(X) -> encode_LookInfoPlayer( X ) end),
	[
		<<?GS2U_LookInfoPlayer:?U16>>,
		Bin_player_list
	];

%GENERATED from file:msg.h => GS2U_MonsterList
encode(#pk_GS2U_MonsterList{} = P) ->
	Bin_monster_list = write_array(P#pk_GS2U_MonsterList.monster_list, fun(X) -> encode_LookInfoMonster( X ) end),
	[
		<<?GS2U_MonsterList:?U16>>,
		Bin_monster_list
	];

%GENERATED from file:msg.h => GS2U_SelPlayerResult
encode(#pk_GS2U_SelPlayerResult{} = P) ->
	Bin_result = write_int32( P#pk_GS2U_SelPlayerResult.result ),
	[
		<<?GS2U_SelPlayerResult:?U16>>,
		Bin_result
	];

%GENERATED from file:msg.h => GS2U_UserPlayerList
encode(#pk_GS2U_UserPlayerList{} = P) ->
	Bin_info = write_array(P#pk_GS2U_UserPlayerList.info, fun(X) -> encode_UserPlayerData( X ) end),
	[
		<<?GS2U_UserPlayerList:?U16>>,
		Bin_info
	];

%GENERATED from file:msg.h => U2GS_ChangeMap
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

%GENERATED from file:msg.h => U2GS_Login_Normal
encode(#pk_U2GS_Login_Normal{} = P) ->
	Bin_platformAccount = write_string( P#pk_U2GS_Login_Normal.platformAccount ),
	Bin_platformName = write_string( P#pk_U2GS_Login_Normal.platformName ),
	Bin_platformNickName = write_string( P#pk_U2GS_Login_Normal.platformNickName ),
	Bin_time = write_int64( P#pk_U2GS_Login_Normal.time ),
	Bin_sign = write_string( P#pk_U2GS_Login_Normal.sign ),
	Bin_deviceId = write_string( P#pk_U2GS_Login_Normal.deviceId ),
	Bin_imei = write_string( P#pk_U2GS_Login_Normal.imei ),
	Bin_idfa = write_string( P#pk_U2GS_Login_Normal.idfa ),
	Bin_mac = write_string( P#pk_U2GS_Login_Normal.mac ),
	Bin_extParam = write_string( P#pk_U2GS_Login_Normal.extParam ),
	Bin_versionRes = write_int32( P#pk_U2GS_Login_Normal.versionRes ),
	Bin_versionExe = write_int32( P#pk_U2GS_Login_Normal.versionExe ),
	Bin_versionGame = write_int32( P#pk_U2GS_Login_Normal.versionGame ),
	Bin_versionPro = write_int32( P#pk_U2GS_Login_Normal.versionPro ),
	[
		<<?U2GS_Login_Normal:?U16>>,
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

%GENERATED from file:msg.h => U2GS_RequestCreatePlayer
encode(#pk_U2GS_RequestCreatePlayer{} = P) ->
	Bin_name = write_string( P#pk_U2GS_RequestCreatePlayer.name ),
	Bin_camp = write_int8( P#pk_U2GS_RequestCreatePlayer.camp ),
	Bin_career = write_uint32( P#pk_U2GS_RequestCreatePlayer.career ),
	Bin_race = write_int8( P#pk_U2GS_RequestCreatePlayer.race ),
	Bin_sex = write_int8( P#pk_U2GS_RequestCreatePlayer.sex ),
	Bin_head = write_int32( P#pk_U2GS_RequestCreatePlayer.head ),
	[
		<<?U2GS_RequestCreatePlayer:?U16>>,
		Bin_name,
		Bin_camp,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head
	];

%GENERATED from file:msg.h => U2GS_RequestDeletePlayer
encode(#pk_U2GS_RequestDeletePlayer{} = P) ->
	Bin_roleID = write_uint64( P#pk_U2GS_RequestDeletePlayer.roleID ),
	[
		<<?U2GS_RequestDeletePlayer:?U16>>,
		Bin_roleID
	];

%GENERATED from file:msg.h => U2GS_SelPlayerEnterGame
encode(#pk_U2GS_SelPlayerEnterGame{} = P) ->
	Bin_roleID = write_uint64( P#pk_U2GS_SelPlayerEnterGame.roleID ),
	[
		<<?U2GS_SelPlayerEnterGame:?U16>>,
		Bin_roleID
	];

encode(_) -> noMatch.

%GENERATED from file:msg.h => LookInfoMonster
encode_LookInfoMonster( #pk_LookInfoMonster{} = P ) ->
	Bin_code = write_uint64( P#pk_LookInfoMonster.code ),
	Bin_id = write_uint32( P#pk_LookInfoMonster.id ),
	Bin_x = write_float( P#pk_LookInfoMonster.x ),
	Bin_y = write_float( P#pk_LookInfoMonster.y ),
	Bin_rotW = write_float( P#pk_LookInfoMonster.rotW ),
	Bin_targetX = write_float( P#pk_LookInfoMonster.targetX ),
	Bin_targetY = write_float( P#pk_LookInfoMonster.targetY ),
	Bin_move_speed = write_float( P#pk_LookInfoMonster.move_speed ),
	Bin_attack_speed = write_float( P#pk_LookInfoMonster.attack_speed ),
	Bin_moveStatus = write_uint8( P#pk_LookInfoMonster.moveStatus ),
	Bin_type = write_uint8( P#pk_LookInfoMonster.type ),
	Bin_hp_per = write_uint8( P#pk_LookInfoMonster.hp_per ),
	Bin_camp = write_int8( P#pk_LookInfoMonster.camp ),
	Bin_usercode = write_uint64( P#pk_LookInfoMonster.usercode ),
	Bin_groupID = write_uint64( P#pk_LookInfoMonster.groupID ),
	Bin_guildID = write_uint64( P#pk_LookInfoMonster.guildID ),
	Bin_name = write_string( P#pk_LookInfoMonster.name ),
	Bin_level = write_uint16( P#pk_LookInfoMonster.level ),
	[
		Bin_code,
		Bin_id,
		Bin_x,
		Bin_y,
		Bin_rotW,
		Bin_targetX,
		Bin_targetY,
		Bin_move_speed,
		Bin_attack_speed,
		Bin_moveStatus,
		Bin_type,
		Bin_hp_per,
		Bin_camp,
		Bin_usercode,
		Bin_groupID,
		Bin_guildID,
		Bin_name,
		Bin_level	].

%GENERATED from file:msg.h => LookInfoPlayer
encode_LookInfoPlayer( #pk_LookInfoPlayer{} = P ) ->
	Bin_code = write_uint64( P#pk_LookInfoPlayer.code ),
	Bin_roleID = write_uint64( P#pk_LookInfoPlayer.roleID ),
	Bin_name = write_string( P#pk_LookInfoPlayer.name ),
	Bin_x = write_float( P#pk_LookInfoPlayer.x ),
	Bin_y = write_float( P#pk_LookInfoPlayer.y ),
	Bin_race = write_int8( P#pk_LookInfoPlayer.race ),
	Bin_career = write_uint32( P#pk_LookInfoPlayer.career ),
	Bin_sex = write_int8( P#pk_LookInfoPlayer.sex ),
	Bin_camp = write_int8( P#pk_LookInfoPlayer.camp ),
	Bin_head = write_int32( P#pk_LookInfoPlayer.head ),
	Bin_move_speed = write_float( P#pk_LookInfoPlayer.move_speed ),
	Bin_level = write_int16( P#pk_LookInfoPlayer.level ),
	Bin_hp_per = write_uint8( P#pk_LookInfoPlayer.hp_per ),
	Bin_petID = write_uint16( P#pk_LookInfoPlayer.petID ),
	Bin_otherCode = write_uint64( P#pk_LookInfoPlayer.otherCode ),
	Bin_servername = write_string( P#pk_LookInfoPlayer.servername ),
	Bin_myServerName = write_string( P#pk_LookInfoPlayer.myServerName ),
	Bin_isInCross = write_bool( P#pk_LookInfoPlayer.isInCross ),
	Bin_pkMode = write_uint8( P#pk_LookInfoPlayer.pkMode ),
	[
		Bin_code,
		Bin_roleID,
		Bin_name,
		Bin_x,
		Bin_y,
		Bin_race,
		Bin_career,
		Bin_sex,
		Bin_camp,
		Bin_head,
		Bin_move_speed,
		Bin_level,
		Bin_hp_per,
		Bin_petID,
		Bin_otherCode,
		Bin_servername,
		Bin_myServerName,
		Bin_isInCross,
		Bin_pkMode	].

%GENERATED from file:msg.h => UserPlayerData
encode_UserPlayerData( #pk_UserPlayerData{} = P ) ->
	Bin_roleID = write_uint64( P#pk_UserPlayerData.roleID ),
	Bin_name = write_string( P#pk_UserPlayerData.name ),
	Bin_level = write_int32( P#pk_UserPlayerData.level ),
	Bin_wingLevel = write_int32( P#pk_UserPlayerData.wingLevel ),
	Bin_camp = write_int8( P#pk_UserPlayerData.camp ),
	Bin_race = write_int8( P#pk_UserPlayerData.race ),
	Bin_career = write_uint32( P#pk_UserPlayerData.career ),
	Bin_sex = write_int8( P#pk_UserPlayerData.sex ),
	Bin_head = write_int32( P#pk_UserPlayerData.head ),
	Bin_mapID = write_uint16( P#pk_UserPlayerData.mapID ),
	Bin_oldMapID = write_uint16( P#pk_UserPlayerData.oldMapID ),
	[
		Bin_roleID,
		Bin_name,
		Bin_level,
		Bin_wingLevel,
		Bin_camp,
		Bin_race,
		Bin_career,
		Bin_sex,
		Bin_head,
		Bin_mapID,
		Bin_oldMapID	].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
name(?GS2U_CreatePlayerResult) -> "GS2U_CreatePlayerResult";
name(?GS2U_DeletePlayerResult) -> "GS2U_DeletePlayerResult";
name(?GS2U_GoNewMap) -> "GS2U_GoNewMap";
name(?GS2U_LoginResult) -> "GS2U_LoginResult";
name(?GS2U_LookInfoPlayer) -> "GS2U_LookInfoPlayer";
name(?GS2U_MonsterList) -> "GS2U_MonsterList";
name(?GS2U_SelPlayerResult) -> "GS2U_SelPlayerResult";
name(?GS2U_UserPlayerList) -> "GS2U_UserPlayerList";
name(?U2GS_ChangeMap) -> "U2GS_ChangeMap";
name(?U2GS_Login_Normal) -> "U2GS_Login_Normal";
name(?U2GS_RequestCreatePlayer) -> "U2GS_RequestCreatePlayer";
name(?U2GS_RequestDeletePlayer) -> "U2GS_RequestDeletePlayer";
name(?U2GS_SelPlayerEnterGame) -> "U2GS_SelPlayerEnterGame";
name(MsgID) -> "ErrorNetMsg_" ++ erlang:integer_to_list(MsgID).

