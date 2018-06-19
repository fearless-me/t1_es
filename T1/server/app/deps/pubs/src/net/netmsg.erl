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

%GENERATED from file:login.h => GS2U_CreatePlayerResult
decode(?GS2U_CreatePlayerResult,Bin0) ->
	{ V_errorCode, Bin1 } = read_int32( Bin0 ),
	{ V_uid, Bin2 } = read_uint64( Bin1 ),
	{ #pk_GS2U_CreatePlayerResult {
		errorCode = V_errorCode,
		uid = V_uid
		},
	Bin2 };

%GENERATED from file:login.h => GS2U_DeletePlayerResult
decode(?GS2U_DeletePlayerResult,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_errorCode, Bin2 } = read_int32( Bin1 ),
	{ #pk_GS2U_DeletePlayerResult {
		uid = V_uid,
		errorCode = V_errorCode
		},
	Bin2 };

%GENERATED from file:login.h => GS2U_GetPlayerInitDataEnd
decode(?GS2U_GetPlayerInitDataEnd,Bin0) ->
	{ #pk_GS2U_GetPlayerInitDataEnd {

		},
	Bin0 };

%GENERATED from file:login.h => GS2U_GotoNewMap
decode(?GS2U_GotoNewMap,Bin0) ->
	{ V_map_id, Bin1 } = read_uint16( Bin0 ),
	{ V_x, Bin2 } = read_float( Bin1 ),
	{ V_y, Bin3 } = read_float( Bin2 ),
	{ #pk_GS2U_GotoNewMap {
		map_id = V_map_id,
		x = V_x,
		y = V_y
		},
	Bin3 };

%GENERATED from file:login.h => GS2U_LoginResult
decode(?GS2U_LoginResult,Bin0) ->
	{ V_result, Bin1 } = read_int8( Bin0 ),
	{ V_aid, Bin2 } = read_uint64( Bin1 ),
	{ V_identity, Bin3 } = read_string( Bin2 ),
	{ V_msg, Bin4 } = read_string( Bin3 ),
	{ #pk_GS2U_LoginResult {
		result = V_result,
		aid = V_aid,
		identity = V_identity,
		msg = V_msg
		},
	Bin4 };

%GENERATED from file:login.h => GS2U_LookInfoPlayer
decode(?GS2U_LookInfoPlayer,Bin0) ->
	{ V_player_list, Bin1 } = read_array(Bin0, fun(X) -> decode_LookInfoPlayer( X ) end),
	{ #pk_GS2U_LookInfoPlayer {
		player_list = V_player_list
		},
	Bin1 };

%GENERATED from file:login.h => GS2U_MonsterList
decode(?GS2U_MonsterList,Bin0) ->
	{ V_monster_list, Bin1 } = read_array(Bin0, fun(X) -> decode_LookInfoMonster( X ) end),
	{ #pk_GS2U_MonsterList {
		monster_list = V_monster_list
		},
	Bin1 };

%GENERATED from file:login.h => GS2U_PlayerInitBase
decode(?GS2U_PlayerInitBase,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_name, Bin2 } = read_string( Bin1 ),
	{ V_level, Bin3 } = read_int32( Bin2 ),
	{ V_camp, Bin4 } = read_int8( Bin3 ),
	{ V_race, Bin5 } = read_int8( Bin4 ),
	{ V_career, Bin6 } = read_uint32( Bin5 ),
	{ V_sex, Bin7 } = read_int8( Bin6 ),
	{ V_head, Bin8 } = read_int32( Bin7 ),
	{ V_mapID, Bin9 } = read_uint16( Bin8 ),
	{ #pk_GS2U_PlayerInitBase {
		uid = V_uid,
		name = V_name,
		level = V_level,
		camp = V_camp,
		race = V_race,
		career = V_career,
		sex = V_sex,
		head = V_head,
		mapID = V_mapID
		},
	Bin9 };

%GENERATED from file:login.h => GS2U_RemoteMonster
decode(?GS2U_RemoteMonster,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_did, Bin2 } = read_uint32( Bin1 ),
	{ V_level, Bin3 } = read_int32( Bin2 ),
	{ V_cur_x, Bin4 } = read_float( Bin3 ),
	{ V_cur_y, Bin5 } = read_float( Bin4 ),
	{ #pk_GS2U_RemoteMonster {
		uid = V_uid,
		did = V_did,
		level = V_level,
		cur_x = V_cur_x,
		cur_y = V_cur_y
		},
	Bin5 };

%GENERATED from file:login.h => GS2U_RemotePet
decode(?GS2U_RemotePet,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_owner, Bin2 } = read_uint64( Bin1 ),
	{ V_did, Bin3 } = read_uint32( Bin2 ),
	{ V_level, Bin4 } = read_int32( Bin3 ),
	{ V_cur_x, Bin5 } = read_float( Bin4 ),
	{ V_cur_y, Bin6 } = read_float( Bin5 ),
	{ #pk_GS2U_RemotePet {
		uid = V_uid,
		owner = V_owner,
		did = V_did,
		level = V_level,
		cur_x = V_cur_x,
		cur_y = V_cur_y
		},
	Bin6 };

%GENERATED from file:login.h => GS2U_RemotePlayer
decode(?GS2U_RemotePlayer,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_level, Bin2 } = read_int32( Bin1 ),
	{ V_cur_x, Bin3 } = read_float( Bin2 ),
	{ V_cur_y, Bin4 } = read_float( Bin3 ),
	{ #pk_GS2U_RemotePlayer {
		uid = V_uid,
		level = V_level,
		cur_x = V_cur_x,
		cur_y = V_cur_y
		},
	Bin4 };

%GENERATED from file:login.h => GS2U_RemoveRemote
decode(?GS2U_RemoveRemote,Bin0) ->
	{ V_uid_list, Bin1 } = read_array(Bin0, fun(X) -> read_uint64( X ) end),
	{ #pk_GS2U_RemoveRemote {
		uid_list = V_uid_list
		},
	Bin1 };

%GENERATED from file:login.h => GS2U_SelPlayerResult
decode(?GS2U_SelPlayerResult,Bin0) ->
	{ V_result, Bin1 } = read_int32( Bin0 ),
	{ #pk_GS2U_SelPlayerResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:login.h => GS2U_SyncStand
decode(?GS2U_SyncStand,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_cur_x, Bin2 } = read_float( Bin1 ),
	{ V_cur_y, Bin3 } = read_float( Bin2 ),
	{ #pk_GS2U_SyncStand {
		uid = V_uid,
		cur_x = V_cur_x,
		cur_y = V_cur_y
		},
	Bin3 };

%GENERATED from file:login.h => GS2U_SyncWalk
decode(?GS2U_SyncWalk,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_src_x, Bin2 } = read_float( Bin1 ),
	{ V_src_y, Bin3 } = read_float( Bin2 ),
	{ V_dst_x, Bin4 } = read_float( Bin3 ),
	{ V_dst_y, Bin5 } = read_float( Bin4 ),
	{ V_move_time, Bin6 } = read_int32( Bin5 ),
	{ V_speed, Bin7 } = read_float( Bin6 ),
	{ #pk_GS2U_SyncWalk {
		uid = V_uid,
		src_x = V_src_x,
		src_y = V_src_y,
		dst_x = V_dst_x,
		dst_y = V_dst_y,
		move_time = V_move_time,
		speed = V_speed
		},
	Bin7 };

%GENERATED from file:login.h => GS2U_UserPlayerList
decode(?GS2U_UserPlayerList,Bin0) ->
	{ V_info, Bin1 } = read_array(Bin0, fun(X) -> decode_UserPlayerData( X ) end),
	{ #pk_GS2U_UserPlayerList {
		info = V_info
		},
	Bin1 };

%GENERATED from file:login.h => U2GS_ChangeMap
decode(?U2GS_ChangeMap,Bin0) ->
	{ V_map_id, Bin1 } = read_uint16( Bin0 ),
	{ V_x, Bin2 } = read_float( Bin1 ),
	{ V_y, Bin3 } = read_float( Bin2 ),
	{ #pk_U2GS_ChangeMap {
		map_id = V_map_id,
		x = V_x,
		y = V_y
		},
	Bin3 };

%GENERATED from file:login.h => U2GS_GetPlayerInitData
decode(?U2GS_GetPlayerInitData,Bin0) ->
	{ #pk_U2GS_GetPlayerInitData {

		},
	Bin0 };

%GENERATED from file:login.h => U2GS_GetRemotePlayer
decode(?U2GS_GetRemotePlayer,Bin0) ->
	{ V_uids, Bin1 } = read_array(Bin0, fun(X) -> read_uint64( X ) end),
	{ #pk_U2GS_GetRemotePlayer {
		uids = V_uids
		},
	Bin1 };

%GENERATED from file:login.h => U2GS_Login_Normal
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

%GENERATED from file:login.h => U2GS_PlayerStopWalk
decode(?U2GS_PlayerStopWalk,Bin0) ->
	{ V_cur_x, Bin1 } = read_float( Bin0 ),
	{ V_cur_y, Bin2 } = read_float( Bin1 ),
	{ #pk_U2GS_PlayerStopWalk {
		cur_x = V_cur_x,
		cur_y = V_cur_y
		},
	Bin2 };

%GENERATED from file:login.h => U2GS_PlayerWalk
decode(?U2GS_PlayerWalk,Bin0) ->
	{ V_src_x, Bin1 } = read_float( Bin0 ),
	{ V_src_y, Bin2 } = read_float( Bin1 ),
	{ V_dst_x, Bin3 } = read_float( Bin2 ),
	{ V_dst_y, Bin4 } = read_float( Bin3 ),
	{ #pk_U2GS_PlayerWalk {
		src_x = V_src_x,
		src_y = V_src_y,
		dst_x = V_dst_x,
		dst_y = V_dst_y
		},
	Bin4 };

%GENERATED from file:login.h => U2GS_RequestCreatePlayer
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

%GENERATED from file:login.h => U2GS_RequestDeletePlayer
decode(?U2GS_RequestDeletePlayer,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ #pk_U2GS_RequestDeletePlayer {
		uid = V_uid
		},
	Bin1 };

%GENERATED from file:login.h => U2GS_SelPlayerEnterGame
decode(?U2GS_SelPlayerEnterGame,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ #pk_U2GS_SelPlayerEnterGame {
		uid = V_uid
		},
	Bin1 }.

%GENERATED from file:login.h => LookInfoMonster
-spec decode_LookInfoMonster(Bin0) -> { #pk_LookInfoMonster{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_LookInfoMonster(Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_did, Bin2 } = read_uint32( Bin1 ),
	{ V_x, Bin3 } = read_float( Bin2 ),
	{ V_y, Bin4 } = read_float( Bin3 ),
	{ V_rotW, Bin5 } = read_float( Bin4 ),
	{ V_targetX, Bin6 } = read_float( Bin5 ),
	{ V_targetY, Bin7 } = read_float( Bin6 ),
	{ V_move_speed, Bin8 } = read_float( Bin7 ),
	{ V_hp_per, Bin9 } = read_uint8( Bin8 ),
	{ V_camp, Bin10 } = read_int8( Bin9 ),
	{ V_owner, Bin11 } = read_uint64( Bin10 ),
	{ V_groupID, Bin12 } = read_uint64( Bin11 ),
	{ V_guildID, Bin13 } = read_uint64( Bin12 ),
	{ V_name, Bin14 } = read_string( Bin13 ),
	{ V_level, Bin15 } = read_uint16( Bin14 ),
	{ #pk_LookInfoMonster {
		uid = V_uid,
		did = V_did,
		x = V_x,
		y = V_y,
		rotW = V_rotW,
		targetX = V_targetX,
		targetY = V_targetY,
		move_speed = V_move_speed,
		hp_per = V_hp_per,
		camp = V_camp,
		owner = V_owner,
		groupID = V_groupID,
		guildID = V_guildID,
		name = V_name,
		level = V_level
		},
	Bin15 }.

%GENERATED from file:login.h => LookInfoPlayer
-spec decode_LookInfoPlayer(Bin0) -> { #pk_LookInfoPlayer{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_LookInfoPlayer(Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_name, Bin2 } = read_string( Bin1 ),
	{ V_x, Bin3 } = read_float( Bin2 ),
	{ V_y, Bin4 } = read_float( Bin3 ),
	{ V_race, Bin5 } = read_int8( Bin4 ),
	{ V_career, Bin6 } = read_uint32( Bin5 ),
	{ V_sex, Bin7 } = read_int8( Bin6 ),
	{ V_camp, Bin8 } = read_int8( Bin7 ),
	{ V_head, Bin9 } = read_int32( Bin8 ),
	{ V_move_speed, Bin10 } = read_float( Bin9 ),
	{ V_level, Bin11 } = read_int16( Bin10 ),
	{ V_hp_per, Bin12 } = read_uint8( Bin11 ),
	{ #pk_LookInfoPlayer {
		uid = V_uid,
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
		hp_per = V_hp_per
		},
	Bin12 }.

%GENERATED from file:login.h => UserPlayerData
-spec decode_UserPlayerData(Bin0) -> { #pk_UserPlayerData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_UserPlayerData(Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
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
		uid = V_uid,
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

%GENERATED from file:login.h => GS2U_CreatePlayerResult
encode(#pk_GS2U_CreatePlayerResult{} = P) ->
	Bin_errorCode = write_int32( P#pk_GS2U_CreatePlayerResult.errorCode ),
	Bin_uid = write_uint64( P#pk_GS2U_CreatePlayerResult.uid ),
	[
		<<?GS2U_CreatePlayerResult:?U16>>,
		Bin_errorCode,
		Bin_uid
	];

%GENERATED from file:login.h => GS2U_DeletePlayerResult
encode(#pk_GS2U_DeletePlayerResult{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_DeletePlayerResult.uid ),
	Bin_errorCode = write_int32( P#pk_GS2U_DeletePlayerResult.errorCode ),
	[
		<<?GS2U_DeletePlayerResult:?U16>>,
		Bin_uid,
		Bin_errorCode
	];

%GENERATED from file:login.h => GS2U_GetPlayerInitDataEnd
encode(#pk_GS2U_GetPlayerInitDataEnd{}) ->
	[
		<<?GS2U_GetPlayerInitDataEnd:?U16>>

	];

%GENERATED from file:login.h => GS2U_GotoNewMap
encode(#pk_GS2U_GotoNewMap{} = P) ->
	Bin_map_id = write_uint16( P#pk_GS2U_GotoNewMap.map_id ),
	Bin_x = write_float( P#pk_GS2U_GotoNewMap.x ),
	Bin_y = write_float( P#pk_GS2U_GotoNewMap.y ),
	[
		<<?GS2U_GotoNewMap:?U16>>,
		Bin_map_id,
		Bin_x,
		Bin_y
	];

%GENERATED from file:login.h => GS2U_LoginResult
encode(#pk_GS2U_LoginResult{} = P) ->
	Bin_result = write_int8( P#pk_GS2U_LoginResult.result ),
	Bin_aid = write_uint64( P#pk_GS2U_LoginResult.aid ),
	Bin_identity = write_string( P#pk_GS2U_LoginResult.identity ),
	Bin_msg = write_string( P#pk_GS2U_LoginResult.msg ),
	[
		<<?GS2U_LoginResult:?U16>>,
		Bin_result,
		Bin_aid,
		Bin_identity,
		Bin_msg
	];

%GENERATED from file:login.h => GS2U_LookInfoPlayer
encode(#pk_GS2U_LookInfoPlayer{} = P) ->
	Bin_player_list = write_array(P#pk_GS2U_LookInfoPlayer.player_list, fun(X) -> encode_LookInfoPlayer( X ) end),
	[
		<<?GS2U_LookInfoPlayer:?U16>>,
		Bin_player_list
	];

%GENERATED from file:login.h => GS2U_MonsterList
encode(#pk_GS2U_MonsterList{} = P) ->
	Bin_monster_list = write_array(P#pk_GS2U_MonsterList.monster_list, fun(X) -> encode_LookInfoMonster( X ) end),
	[
		<<?GS2U_MonsterList:?U16>>,
		Bin_monster_list
	];

%GENERATED from file:login.h => GS2U_PlayerInitBase
encode(#pk_GS2U_PlayerInitBase{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_PlayerInitBase.uid ),
	Bin_name = write_string( P#pk_GS2U_PlayerInitBase.name ),
	Bin_level = write_int32( P#pk_GS2U_PlayerInitBase.level ),
	Bin_camp = write_int8( P#pk_GS2U_PlayerInitBase.camp ),
	Bin_race = write_int8( P#pk_GS2U_PlayerInitBase.race ),
	Bin_career = write_uint32( P#pk_GS2U_PlayerInitBase.career ),
	Bin_sex = write_int8( P#pk_GS2U_PlayerInitBase.sex ),
	Bin_head = write_int32( P#pk_GS2U_PlayerInitBase.head ),
	Bin_mapID = write_uint16( P#pk_GS2U_PlayerInitBase.mapID ),
	[
		<<?GS2U_PlayerInitBase:?U16>>,
		Bin_uid,
		Bin_name,
		Bin_level,
		Bin_camp,
		Bin_race,
		Bin_career,
		Bin_sex,
		Bin_head,
		Bin_mapID
	];

%GENERATED from file:login.h => GS2U_RemoteMonster
encode(#pk_GS2U_RemoteMonster{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_RemoteMonster.uid ),
	Bin_did = write_uint32( P#pk_GS2U_RemoteMonster.did ),
	Bin_level = write_int32( P#pk_GS2U_RemoteMonster.level ),
	Bin_cur_x = write_float( P#pk_GS2U_RemoteMonster.cur_x ),
	Bin_cur_y = write_float( P#pk_GS2U_RemoteMonster.cur_y ),
	[
		<<?GS2U_RemoteMonster:?U16>>,
		Bin_uid,
		Bin_did,
		Bin_level,
		Bin_cur_x,
		Bin_cur_y
	];

%GENERATED from file:login.h => GS2U_RemotePet
encode(#pk_GS2U_RemotePet{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_RemotePet.uid ),
	Bin_owner = write_uint64( P#pk_GS2U_RemotePet.owner ),
	Bin_did = write_uint32( P#pk_GS2U_RemotePet.did ),
	Bin_level = write_int32( P#pk_GS2U_RemotePet.level ),
	Bin_cur_x = write_float( P#pk_GS2U_RemotePet.cur_x ),
	Bin_cur_y = write_float( P#pk_GS2U_RemotePet.cur_y ),
	[
		<<?GS2U_RemotePet:?U16>>,
		Bin_uid,
		Bin_owner,
		Bin_did,
		Bin_level,
		Bin_cur_x,
		Bin_cur_y
	];

%GENERATED from file:login.h => GS2U_RemotePlayer
encode(#pk_GS2U_RemotePlayer{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_RemotePlayer.uid ),
	Bin_level = write_int32( P#pk_GS2U_RemotePlayer.level ),
	Bin_cur_x = write_float( P#pk_GS2U_RemotePlayer.cur_x ),
	Bin_cur_y = write_float( P#pk_GS2U_RemotePlayer.cur_y ),
	[
		<<?GS2U_RemotePlayer:?U16>>,
		Bin_uid,
		Bin_level,
		Bin_cur_x,
		Bin_cur_y
	];

%GENERATED from file:login.h => GS2U_RemoveRemote
encode(#pk_GS2U_RemoveRemote{} = P) ->
	Bin_uid_list = write_array(P#pk_GS2U_RemoveRemote.uid_list, fun(X) -> write_uint64( X ) end),
	[
		<<?GS2U_RemoveRemote:?U16>>,
		Bin_uid_list
	];

%GENERATED from file:login.h => GS2U_SelPlayerResult
encode(#pk_GS2U_SelPlayerResult{} = P) ->
	Bin_result = write_int32( P#pk_GS2U_SelPlayerResult.result ),
	[
		<<?GS2U_SelPlayerResult:?U16>>,
		Bin_result
	];

%GENERATED from file:login.h => GS2U_SyncStand
encode(#pk_GS2U_SyncStand{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_SyncStand.uid ),
	Bin_cur_x = write_float( P#pk_GS2U_SyncStand.cur_x ),
	Bin_cur_y = write_float( P#pk_GS2U_SyncStand.cur_y ),
	[
		<<?GS2U_SyncStand:?U16>>,
		Bin_uid,
		Bin_cur_x,
		Bin_cur_y
	];

%GENERATED from file:login.h => GS2U_SyncWalk
encode(#pk_GS2U_SyncWalk{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_SyncWalk.uid ),
	Bin_src_x = write_float( P#pk_GS2U_SyncWalk.src_x ),
	Bin_src_y = write_float( P#pk_GS2U_SyncWalk.src_y ),
	Bin_dst_x = write_float( P#pk_GS2U_SyncWalk.dst_x ),
	Bin_dst_y = write_float( P#pk_GS2U_SyncWalk.dst_y ),
	Bin_move_time = write_int32( P#pk_GS2U_SyncWalk.move_time ),
	Bin_speed = write_float( P#pk_GS2U_SyncWalk.speed ),
	[
		<<?GS2U_SyncWalk:?U16>>,
		Bin_uid,
		Bin_src_x,
		Bin_src_y,
		Bin_dst_x,
		Bin_dst_y,
		Bin_move_time,
		Bin_speed
	];

%GENERATED from file:login.h => GS2U_UserPlayerList
encode(#pk_GS2U_UserPlayerList{} = P) ->
	Bin_info = write_array(P#pk_GS2U_UserPlayerList.info, fun(X) -> encode_UserPlayerData( X ) end),
	[
		<<?GS2U_UserPlayerList:?U16>>,
		Bin_info
	];

%GENERATED from file:login.h => U2GS_ChangeMap
encode(#pk_U2GS_ChangeMap{} = P) ->
	Bin_map_id = write_uint16( P#pk_U2GS_ChangeMap.map_id ),
	Bin_x = write_float( P#pk_U2GS_ChangeMap.x ),
	Bin_y = write_float( P#pk_U2GS_ChangeMap.y ),
	[
		<<?U2GS_ChangeMap:?U16>>,
		Bin_map_id,
		Bin_x,
		Bin_y
	];

%GENERATED from file:login.h => U2GS_GetPlayerInitData
encode(#pk_U2GS_GetPlayerInitData{}) ->
	[
		<<?U2GS_GetPlayerInitData:?U16>>

	];

%GENERATED from file:login.h => U2GS_GetRemotePlayer
encode(#pk_U2GS_GetRemotePlayer{} = P) ->
	Bin_uids = write_array(P#pk_U2GS_GetRemotePlayer.uids, fun(X) -> write_uint64( X ) end),
	[
		<<?U2GS_GetRemotePlayer:?U16>>,
		Bin_uids
	];

%GENERATED from file:login.h => U2GS_Login_Normal
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

%GENERATED from file:login.h => U2GS_PlayerStopWalk
encode(#pk_U2GS_PlayerStopWalk{} = P) ->
	Bin_cur_x = write_float( P#pk_U2GS_PlayerStopWalk.cur_x ),
	Bin_cur_y = write_float( P#pk_U2GS_PlayerStopWalk.cur_y ),
	[
		<<?U2GS_PlayerStopWalk:?U16>>,
		Bin_cur_x,
		Bin_cur_y
	];

%GENERATED from file:login.h => U2GS_PlayerWalk
encode(#pk_U2GS_PlayerWalk{} = P) ->
	Bin_src_x = write_float( P#pk_U2GS_PlayerWalk.src_x ),
	Bin_src_y = write_float( P#pk_U2GS_PlayerWalk.src_y ),
	Bin_dst_x = write_float( P#pk_U2GS_PlayerWalk.dst_x ),
	Bin_dst_y = write_float( P#pk_U2GS_PlayerWalk.dst_y ),
	[
		<<?U2GS_PlayerWalk:?U16>>,
		Bin_src_x,
		Bin_src_y,
		Bin_dst_x,
		Bin_dst_y
	];

%GENERATED from file:login.h => U2GS_RequestCreatePlayer
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

%GENERATED from file:login.h => U2GS_RequestDeletePlayer
encode(#pk_U2GS_RequestDeletePlayer{} = P) ->
	Bin_uid = write_uint64( P#pk_U2GS_RequestDeletePlayer.uid ),
	[
		<<?U2GS_RequestDeletePlayer:?U16>>,
		Bin_uid
	];

%GENERATED from file:login.h => U2GS_SelPlayerEnterGame
encode(#pk_U2GS_SelPlayerEnterGame{} = P) ->
	Bin_uid = write_uint64( P#pk_U2GS_SelPlayerEnterGame.uid ),
	[
		<<?U2GS_SelPlayerEnterGame:?U16>>,
		Bin_uid
	];

encode(_) -> noMatch.

%GENERATED from file:login.h => LookInfoMonster
encode_LookInfoMonster( #pk_LookInfoMonster{} = P ) ->
	Bin_uid = write_uint64( P#pk_LookInfoMonster.uid ),
	Bin_did = write_uint32( P#pk_LookInfoMonster.did ),
	Bin_x = write_float( P#pk_LookInfoMonster.x ),
	Bin_y = write_float( P#pk_LookInfoMonster.y ),
	Bin_rotW = write_float( P#pk_LookInfoMonster.rotW ),
	Bin_targetX = write_float( P#pk_LookInfoMonster.targetX ),
	Bin_targetY = write_float( P#pk_LookInfoMonster.targetY ),
	Bin_move_speed = write_float( P#pk_LookInfoMonster.move_speed ),
	Bin_hp_per = write_uint8( P#pk_LookInfoMonster.hp_per ),
	Bin_camp = write_int8( P#pk_LookInfoMonster.camp ),
	Bin_owner = write_uint64( P#pk_LookInfoMonster.owner ),
	Bin_groupID = write_uint64( P#pk_LookInfoMonster.groupID ),
	Bin_guildID = write_uint64( P#pk_LookInfoMonster.guildID ),
	Bin_name = write_string( P#pk_LookInfoMonster.name ),
	Bin_level = write_uint16( P#pk_LookInfoMonster.level ),
	[
		Bin_uid,
		Bin_did,
		Bin_x,
		Bin_y,
		Bin_rotW,
		Bin_targetX,
		Bin_targetY,
		Bin_move_speed,
		Bin_hp_per,
		Bin_camp,
		Bin_owner,
		Bin_groupID,
		Bin_guildID,
		Bin_name,
		Bin_level	].

%GENERATED from file:login.h => LookInfoPlayer
encode_LookInfoPlayer( #pk_LookInfoPlayer{} = P ) ->
	Bin_uid = write_uint64( P#pk_LookInfoPlayer.uid ),
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
	[
		Bin_uid,
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
		Bin_hp_per	].

%GENERATED from file:login.h => UserPlayerData
encode_UserPlayerData( #pk_UserPlayerData{} = P ) ->
	Bin_uid = write_uint64( P#pk_UserPlayerData.uid ),
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
		Bin_uid,
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
name(?GS2U_GetPlayerInitDataEnd) -> "GS2U_GetPlayerInitDataEnd";
name(?GS2U_GotoNewMap) -> "GS2U_GotoNewMap";
name(?GS2U_LoginResult) -> "GS2U_LoginResult";
name(?GS2U_LookInfoPlayer) -> "GS2U_LookInfoPlayer";
name(?GS2U_MonsterList) -> "GS2U_MonsterList";
name(?GS2U_PlayerInitBase) -> "GS2U_PlayerInitBase";
name(?GS2U_RemoteMonster) -> "GS2U_RemoteMonster";
name(?GS2U_RemotePet) -> "GS2U_RemotePet";
name(?GS2U_RemotePlayer) -> "GS2U_RemotePlayer";
name(?GS2U_RemoveRemote) -> "GS2U_RemoveRemote";
name(?GS2U_SelPlayerResult) -> "GS2U_SelPlayerResult";
name(?GS2U_SyncStand) -> "GS2U_SyncStand";
name(?GS2U_SyncWalk) -> "GS2U_SyncWalk";
name(?GS2U_UserPlayerList) -> "GS2U_UserPlayerList";
name(?U2GS_ChangeMap) -> "U2GS_ChangeMap";
name(?U2GS_GetPlayerInitData) -> "U2GS_GetPlayerInitData";
name(?U2GS_GetRemotePlayer) -> "U2GS_GetRemotePlayer";
name(?U2GS_Login_Normal) -> "U2GS_Login_Normal";
name(?U2GS_PlayerStopWalk) -> "U2GS_PlayerStopWalk";
name(?U2GS_PlayerWalk) -> "U2GS_PlayerWalk";
name(?U2GS_RequestCreatePlayer) -> "U2GS_RequestCreatePlayer";
name(?U2GS_RequestDeletePlayer) -> "U2GS_RequestDeletePlayer";
name(?U2GS_SelPlayerEnterGame) -> "U2GS_SelPlayerEnterGame";
name(MsgID) -> "ErrorNetMsg_" ++ erlang:integer_to_list(MsgID).

