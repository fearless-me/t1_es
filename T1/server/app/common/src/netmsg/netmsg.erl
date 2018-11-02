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

-export([decode/2, encode/1, name/1, cmd_list/0]).

%GENERATED from file:combat.h => GS2U_AddBuff
decode(?GS2U_AddBuff,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_buff, Bin2 } = decode_BuffInfo( Bin1 ),
	{ #pk_GS2U_AddBuff {
		uid = V_uid,
		buff = V_buff
		},
	Bin2 };

%GENERATED from file:combat.h => GS2U_DeleteBuff
decode(?GS2U_DeleteBuff,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_buff_id, Bin2 } = read_uint32( Bin1 ),
	{ #pk_GS2U_DeleteBuff {
		uid = V_uid,
		buff_id = V_buff_id
		},
	Bin2 };

%GENERATED from file:combat.h => GS2U_DeleteBuffList
decode(?GS2U_DeleteBuffList,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_buff_id_list, Bin2 } = read_array(Bin1, fun(X) -> read_uint32( X ) end),
	{ #pk_GS2U_DeleteBuffList {
		uid = V_uid,
		buff_id_list = V_buff_id_list
		},
	Bin2 };

%GENERATED from file:combat.h => GS2U_HPChange
decode(?GS2U_HPChange,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_cause, Bin2 } = read_uint32( Bin1 ),
	{ V_result, Bin3 } = read_uint32( Bin2 ),
	{ V_hp_change, Bin4 } = read_int32( Bin3 ),
	{ V_src_uid, Bin5 } = read_uint64( Bin4 ),
	{ V_misc1, Bin6 } = read_uint32( Bin5 ),
	{ V_misc2, Bin7 } = read_uint32( Bin6 ),
	{ V_serial, Bin8 } = read_uint32( Bin7 ),
	{ #pk_GS2U_HPChange {
		uid = V_uid,
		cause = V_cause,
		result = V_result,
		hp_change = V_hp_change,
		src_uid = V_src_uid,
		misc1 = V_misc1,
		misc2 = V_misc2,
		serial = V_serial
		},
	Bin8 };

%GENERATED from file:combat.h => GS2U_HitTarget
decode(?GS2U_HitTarget,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_src_uid, Bin2 } = read_uint64( Bin1 ),
	{ V_cause, Bin3 } = read_uint32( Bin2 ),
	{ V_misc, Bin4 } = read_uint32( Bin3 ),
	{ V_serial, Bin5 } = read_uint32( Bin4 ),
	{ #pk_GS2U_HitTarget {
		uid = V_uid,
		src_uid = V_src_uid,
		cause = V_cause,
		misc = V_misc,
		serial = V_serial
		},
	Bin5 };

%GENERATED from file:combat.h => GS2U_SkillInterrupt
decode(?GS2U_SkillInterrupt,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_skill_id, Bin2 } = read_uint32( Bin1 ),
	{ #pk_GS2U_SkillInterrupt {
		uid = V_uid,
		skill_id = V_skill_id
		},
	Bin2 };

%GENERATED from file:combat.h => GS2U_SpecialMove
decode(?GS2U_SpecialMove,Bin0) ->
	{ V_type, Bin1 } = read_uint32( Bin0 ),
	{ V_uid, Bin2 } = read_uint64( Bin1 ),
	{ V_x, Bin3 } = read_float( Bin2 ),
	{ V_y, Bin4 } = read_float( Bin3 ),
	{ #pk_GS2U_SpecialMove {
		type = V_type,
		uid = V_uid,
		x = V_x,
		y = V_y
		},
	Bin4 };

%GENERATED from file:combat.h => GS2U_UpdateBuff
decode(?GS2U_UpdateBuff,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_buff, Bin2 } = decode_BuffInfo( Bin1 ),
	{ #pk_GS2U_UpdateBuff {
		uid = V_uid,
		buff = V_buff
		},
	Bin2 };

%GENERATED from file:combat.h => GS2U_UpdateBuffList
decode(?GS2U_UpdateBuffList,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_buff_list, Bin2 } = read_array(Bin1, fun(X) -> decode_BuffInfo( X ) end),
	{ #pk_GS2U_UpdateBuffList {
		uid = V_uid,
		buff_list = V_buff_list
		},
	Bin2 };

%GENERATED from file:combat.h => GS2U_UseSkill
decode(?GS2U_UseSkill,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_tar_uid, Bin2 } = read_uint64( Bin1 ),
	{ V_skill_id, Bin3 } = read_uint32( Bin2 ),
	{ V_serial, Bin4 } = read_uint32( Bin3 ),
	{ V_spell_time, Bin5 } = read_uint32( Bin4 ),
	{ V_error_code, Bin6 } = read_uint32( Bin5 ),
	{ #pk_GS2U_UseSkill {
		uid = V_uid,
		tar_uid = V_tar_uid,
		skill_id = V_skill_id,
		serial = V_serial,
		spell_time = V_spell_time,
		error_code = V_error_code
		},
	Bin6 };

%GENERATED from file:combat.h => U2GS_DeleteBuff
decode(?U2GS_DeleteBuff,Bin0) ->
	{ V_buff_id, Bin1 } = read_uint32( Bin0 ),
	{ #pk_U2GS_DeleteBuff {
		buff_id = V_buff_id
		},
	Bin1 };

%GENERATED from file:combat.h => U2GS_SkillInterrupt
decode(?U2GS_SkillInterrupt,Bin0) ->
	{ V_skill_id, Bin1 } = read_uint32( Bin0 ),
	{ #pk_U2GS_SkillInterrupt {
		skill_id = V_skill_id
		},
	Bin1 };

%GENERATED from file:combat.h => U2GS_UseSkill
decode(?U2GS_UseSkill,Bin0) ->
	{ V_x, Bin1 } = read_float( Bin0 ),
	{ V_y, Bin2 } = read_float( Bin1 ),
	{ V_tar_uid, Bin3 } = read_uint64( Bin2 ),
	{ V_skill_id, Bin4 } = read_uint32( Bin3 ),
	{ V_serial, Bin5 } = read_uint32( Bin4 ),
	{ #pk_U2GS_UseSkill {
		x = V_x,
		y = V_y,
		tar_uid = V_tar_uid,
		skill_id = V_skill_id,
		serial = V_serial
		},
	Bin5 };

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

%GENERATED from file:login.h => GS2U_LoginResult
decode(?GS2U_LoginResult,Bin0) ->
	{ V_result, Bin1 } = read_int32( Bin0 ),
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

%GENERATED from file:login.h => GS2U_SelPlayerResult
decode(?GS2U_SelPlayerResult,Bin0) ->
	{ V_result, Bin1 } = read_int32( Bin0 ),
	{ #pk_GS2U_SelPlayerResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:login.h => GS2U_UserPlayerList
decode(?GS2U_UserPlayerList,Bin0) ->
	{ V_info, Bin1 } = read_array(Bin0, fun(X) -> decode_UserPlayerData( X ) end),
	{ #pk_GS2U_UserPlayerList {
		info = V_info
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

%GENERATED from file:login.h => U2GS_RequestCreatePlayer
decode(?U2GS_RequestCreatePlayer,Bin0) ->
	{ V_name, Bin1 } = read_string( Bin0 ),
	{ V_camp, Bin2 } = read_int32( Bin1 ),
	{ V_career, Bin3 } = read_uint32( Bin2 ),
	{ V_race, Bin4 } = read_int32( Bin3 ),
	{ V_sex, Bin5 } = read_int32( Bin4 ),
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
	Bin1 };

%GENERATED from file:player.h => GS2U_Chat
decode(?GS2U_Chat,Bin0) ->
	{ V_channel, Bin1 } = read_int32( Bin0 ),
	{ V_uid, Bin2 } = read_uint64( Bin1 ),
	{ V_content, Bin3 } = read_string( Bin2 ),
	{ #pk_GS2U_Chat {
		channel = V_channel,
		uid = V_uid,
		content = V_content
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_GetPlayerInitDataEnd
decode(?GS2U_GetPlayerInitDataEnd,Bin0) ->
	{ #pk_GS2U_GetPlayerInitDataEnd {

		},
	Bin0 };

%GENERATED from file:player.h => GS2U_GotoNewMap
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

%GENERATED from file:player.h => GS2U_HearBeat
decode(?GS2U_HearBeat,Bin0) ->
	{ V_now, Bin1 } = read_uint32( Bin0 ),
	{ #pk_GS2U_HearBeat {
		now = V_now
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_KickByServer
decode(?GS2U_KickByServer,Bin0) ->
	{ V_reason, Bin1 } = read_string( Bin0 ),
	{ #pk_GS2U_KickByServer {
		reason = V_reason
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_LookInfoPlayer
decode(?GS2U_LookInfoPlayer,Bin0) ->
	{ V_player_list, Bin1 } = read_array(Bin0, fun(X) -> decode_LookInfoPlayer( X ) end),
	{ #pk_GS2U_LookInfoPlayer {
		player_list = V_player_list
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MonsterList
decode(?GS2U_MonsterList,Bin0) ->
	{ V_monster_list, Bin1 } = read_array(Bin0, fun(X) -> decode_LookInfoMonster( X ) end),
	{ #pk_GS2U_MonsterList {
		monster_list = V_monster_list
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_PlayerInitBase
decode(?GS2U_PlayerInitBase,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_name, Bin2 } = read_string( Bin1 ),
	{ V_level, Bin3 } = read_int32( Bin2 ),
	{ V_camp, Bin4 } = read_int32( Bin3 ),
	{ V_race, Bin5 } = read_int32( Bin4 ),
	{ V_career, Bin6 } = read_uint32( Bin5 ),
	{ V_sex, Bin7 } = read_int32( Bin6 ),
	{ V_head, Bin8 } = read_int32( Bin7 ),
	{ V_mapID, Bin9 } = read_uint32( Bin8 ),
	{ V_combat_props, Bin10 } = read_array(Bin9, fun(X) -> read_int32( X ) end),
	{ V_buff_list, Bin11 } = read_array(Bin10, fun(X) -> decode_BuffInfo( X ) end),
	{ V_skill_list, Bin12 } = read_array(Bin11, fun(X) -> decode_SkillInfo( X ) end),
	{ #pk_GS2U_PlayerInitBase {
		uid = V_uid,
		name = V_name,
		level = V_level,
		camp = V_camp,
		race = V_race,
		career = V_career,
		sex = V_sex,
		head = V_head,
		mapID = V_mapID,
		combat_props = V_combat_props,
		buff_list = V_buff_list,
		skill_list = V_skill_list
		},
	Bin12 };

%GENERATED from file:player.h => GS2U_RemoteMonster
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

%GENERATED from file:player.h => GS2U_RemotePet
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

%GENERATED from file:player.h => GS2U_RemotePlayer
decode(?GS2U_RemotePlayer,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_level, Bin2 } = read_int32( Bin1 ),
	{ V_name, Bin3 } = read_string( Bin2 ),
	{ V_career, Bin4 } = read_int32( Bin3 ),
	{ V_race, Bin5 } = read_int32( Bin4 ),
	{ V_cur_x, Bin6 } = read_float( Bin5 ),
	{ V_cur_y, Bin7 } = read_float( Bin6 ),
	{ #pk_GS2U_RemotePlayer {
		uid = V_uid,
		level = V_level,
		name = V_name,
		career = V_career,
		race = V_race,
		cur_x = V_cur_x,
		cur_y = V_cur_y
		},
	Bin7 };

%GENERATED from file:player.h => GS2U_RemoveRemote
decode(?GS2U_RemoveRemote,Bin0) ->
	{ V_uid_list, Bin1 } = read_array(Bin0, fun(X) -> read_uint64( X ) end),
	{ #pk_GS2U_RemoveRemote {
		uid_list = V_uid_list
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_SyncStand
decode(?GS2U_SyncStand,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_type, Bin2 } = read_uint32( Bin1 ),
	{ V_cur_x, Bin3 } = read_float( Bin2 ),
	{ V_cur_y, Bin4 } = read_float( Bin3 ),
	{ #pk_GS2U_SyncStand {
		uid = V_uid,
		type = V_type,
		cur_x = V_cur_x,
		cur_y = V_cur_y
		},
	Bin4 };

%GENERATED from file:player.h => GS2U_SyncWalk
decode(?GS2U_SyncWalk,Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_type, Bin2 } = read_uint32( Bin1 ),
	{ V_src_x, Bin3 } = read_float( Bin2 ),
	{ V_src_y, Bin4 } = read_float( Bin3 ),
	{ V_dst_x, Bin5 } = read_float( Bin4 ),
	{ V_dst_y, Bin6 } = read_float( Bin5 ),
	{ V_move_time, Bin7 } = read_int32( Bin6 ),
	{ V_speed, Bin8 } = read_float( Bin7 ),
	{ #pk_GS2U_SyncWalk {
		uid = V_uid,
		type = V_type,
		src_x = V_src_x,
		src_y = V_src_y,
		dst_x = V_dst_x,
		dst_y = V_dst_y,
		move_time = V_move_time,
		speed = V_speed
		},
	Bin8 };

%GENERATED from file:player.h => U2GS_ChangeMap
decode(?U2GS_ChangeMap,Bin0) ->
	{ V_map_id, Bin1 } = read_uint32( Bin0 ),
	{ V_x, Bin2 } = read_float( Bin1 ),
	{ V_y, Bin3 } = read_float( Bin2 ),
	{ #pk_U2GS_ChangeMap {
		map_id = V_map_id,
		x = V_x,
		y = V_y
		},
	Bin3 };

%GENERATED from file:player.h => U2GS_Chat
decode(?U2GS_Chat,Bin0) ->
	{ V_channel, Bin1 } = read_int32( Bin0 ),
	{ V_receiver, Bin2 } = read_uint64( Bin1 ),
	{ V_content, Bin3 } = read_string( Bin2 ),
	{ #pk_U2GS_Chat {
		channel = V_channel,
		receiver = V_receiver,
		content = V_content
		},
	Bin3 };

%GENERATED from file:player.h => U2GS_ExitGame
decode(?U2GS_ExitGame,Bin0) ->
	{ #pk_U2GS_ExitGame {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_GetPlayerInitData
decode(?U2GS_GetPlayerInitData,Bin0) ->
	{ #pk_U2GS_GetPlayerInitData {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_GetRemoteObjInfo
decode(?U2GS_GetRemoteObjInfo,Bin0) ->
	{ V_uids, Bin1 } = read_array(Bin0, fun(X) -> read_uint64( X ) end),
	{ #pk_U2GS_GetRemoteObjInfo {
		uids = V_uids
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_HearBeat
decode(?U2GS_HearBeat,Bin0) ->
	{ #pk_U2GS_HearBeat {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_PlayerStopWalk
decode(?U2GS_PlayerStopWalk,Bin0) ->
	{ V_cur_x, Bin1 } = read_float( Bin0 ),
	{ V_cur_y, Bin2 } = read_float( Bin1 ),
	{ #pk_U2GS_PlayerStopWalk {
		cur_x = V_cur_x,
		cur_y = V_cur_y
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_PlayerWalk
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
	Bin4 }.

%GENERATED from file:combat.h => BuffInfo
-spec decode_BuffInfo(Bin0) -> { #pk_BuffInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_BuffInfo(Bin0) ->
	{ V_buff_id, Bin1 } = read_uint32( Bin0 ),
	{ V_lifetime, Bin2 } = read_uint32( Bin1 ),
	{ V_level, Bin3 } = read_uint32( Bin2 ),
	{ V_wrap, Bin4 } = read_uint32( Bin3 ),
	{ #pk_BuffInfo {
		buff_id = V_buff_id,
		lifetime = V_lifetime,
		level = V_level,
		wrap = V_wrap
		},
	Bin4 }.

%GENERATED from file:combat.h => SkillInfo
-spec decode_SkillInfo(Bin0) -> { #pk_SkillInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_SkillInfo(Bin0) ->
	{ V_skill_id, Bin1 } = read_uint32( Bin0 ),
	{ V_level, Bin2 } = read_uint32( Bin1 ),
	{ V_cd_time, Bin3 } = read_uint32( Bin2 ),
	{ V_slot_index, Bin4 } = read_uint32( Bin3 ),
	{ #pk_SkillInfo {
		skill_id = V_skill_id,
		level = V_level,
		cd_time = V_cd_time,
		slot_index = V_slot_index
		},
	Bin4 }.

%GENERATED from file:login.h => UserPlayerData
-spec decode_UserPlayerData(Bin0) -> { #pk_UserPlayerData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_UserPlayerData(Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_name, Bin2 } = read_string( Bin1 ),
	{ V_level, Bin3 } = read_int32( Bin2 ),
	{ V_wingLevel, Bin4 } = read_int32( Bin3 ),
	{ V_camp, Bin5 } = read_int32( Bin4 ),
	{ V_race, Bin6 } = read_int32( Bin5 ),
	{ V_career, Bin7 } = read_uint32( Bin6 ),
	{ V_sex, Bin8 } = read_int32( Bin7 ),
	{ V_head, Bin9 } = read_int32( Bin8 ),
	{ V_mapID, Bin10 } = read_uint32( Bin9 ),
	{ V_oldMapID, Bin11 } = read_uint32( Bin10 ),
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

%GENERATED from file:player.h => LookInfoMonster
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
	{ V_hp_per, Bin9 } = read_uint32( Bin8 ),
	{ V_camp, Bin10 } = read_int32( Bin9 ),
	{ V_owner, Bin11 } = read_uint64( Bin10 ),
	{ V_groupID, Bin12 } = read_uint64( Bin11 ),
	{ V_guildID, Bin13 } = read_uint64( Bin12 ),
	{ V_name, Bin14 } = read_string( Bin13 ),
	{ V_level, Bin15 } = read_uint32( Bin14 ),
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

%GENERATED from file:player.h => LookInfoPlayer
-spec decode_LookInfoPlayer(Bin0) -> { #pk_LookInfoPlayer{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
decode_LookInfoPlayer(Bin0) ->
	{ V_uid, Bin1 } = read_uint64( Bin0 ),
	{ V_name, Bin2 } = read_string( Bin1 ),
	{ V_x, Bin3 } = read_float( Bin2 ),
	{ V_y, Bin4 } = read_float( Bin3 ),
	{ V_race, Bin5 } = read_int32( Bin4 ),
	{ V_career, Bin6 } = read_uint32( Bin5 ),
	{ V_sex, Bin7 } = read_int32( Bin6 ),
	{ V_camp, Bin8 } = read_int32( Bin7 ),
	{ V_head, Bin9 } = read_int32( Bin8 ),
	{ V_move_speed, Bin10 } = read_float( Bin9 ),
	{ V_level, Bin11 } = read_int32( Bin10 ),
	{ V_hp_per, Bin12 } = read_uint32( Bin11 ),
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

%GENERATED from file:combat.h => GS2U_AddBuff
encode(#pk_GS2U_AddBuff{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_AddBuff.uid ),
	Bin_buff = encode_BuffInfo( P#pk_GS2U_AddBuff.buff ),
	[
		<<?GS2U_AddBuff:?U16>>,
		Bin_uid,
		Bin_buff
	];

%GENERATED from file:combat.h => GS2U_DeleteBuff
encode(#pk_GS2U_DeleteBuff{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_DeleteBuff.uid ),
	Bin_buff_id = write_uint32( P#pk_GS2U_DeleteBuff.buff_id ),
	[
		<<?GS2U_DeleteBuff:?U16>>,
		Bin_uid,
		Bin_buff_id
	];

%GENERATED from file:combat.h => GS2U_DeleteBuffList
encode(#pk_GS2U_DeleteBuffList{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_DeleteBuffList.uid ),
	Bin_buff_id_list = write_array(P#pk_GS2U_DeleteBuffList.buff_id_list, fun(X) -> write_uint32( X ) end),
	[
		<<?GS2U_DeleteBuffList:?U16>>,
		Bin_uid,
		Bin_buff_id_list
	];

%GENERATED from file:combat.h => GS2U_HPChange
encode(#pk_GS2U_HPChange{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_HPChange.uid ),
	Bin_cause = write_uint32( P#pk_GS2U_HPChange.cause ),
	Bin_result = write_uint32( P#pk_GS2U_HPChange.result ),
	Bin_hp_change = write_int32( P#pk_GS2U_HPChange.hp_change ),
	Bin_src_uid = write_uint64( P#pk_GS2U_HPChange.src_uid ),
	Bin_misc1 = write_uint32( P#pk_GS2U_HPChange.misc1 ),
	Bin_misc2 = write_uint32( P#pk_GS2U_HPChange.misc2 ),
	Bin_serial = write_uint32( P#pk_GS2U_HPChange.serial ),
	[
		<<?GS2U_HPChange:?U16>>,
		Bin_uid,
		Bin_cause,
		Bin_result,
		Bin_hp_change,
		Bin_src_uid,
		Bin_misc1,
		Bin_misc2,
		Bin_serial
	];

%GENERATED from file:combat.h => GS2U_HitTarget
encode(#pk_GS2U_HitTarget{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_HitTarget.uid ),
	Bin_src_uid = write_uint64( P#pk_GS2U_HitTarget.src_uid ),
	Bin_cause = write_uint32( P#pk_GS2U_HitTarget.cause ),
	Bin_misc = write_uint32( P#pk_GS2U_HitTarget.misc ),
	Bin_serial = write_uint32( P#pk_GS2U_HitTarget.serial ),
	[
		<<?GS2U_HitTarget:?U16>>,
		Bin_uid,
		Bin_src_uid,
		Bin_cause,
		Bin_misc,
		Bin_serial
	];

%GENERATED from file:combat.h => GS2U_SkillInterrupt
encode(#pk_GS2U_SkillInterrupt{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_SkillInterrupt.uid ),
	Bin_skill_id = write_uint32( P#pk_GS2U_SkillInterrupt.skill_id ),
	[
		<<?GS2U_SkillInterrupt:?U16>>,
		Bin_uid,
		Bin_skill_id
	];

%GENERATED from file:combat.h => GS2U_SpecialMove
encode(#pk_GS2U_SpecialMove{} = P) ->
	Bin_type = write_uint32( P#pk_GS2U_SpecialMove.type ),
	Bin_uid = write_uint64( P#pk_GS2U_SpecialMove.uid ),
	Bin_x = write_float( P#pk_GS2U_SpecialMove.x ),
	Bin_y = write_float( P#pk_GS2U_SpecialMove.y ),
	[
		<<?GS2U_SpecialMove:?U16>>,
		Bin_type,
		Bin_uid,
		Bin_x,
		Bin_y
	];

%GENERATED from file:combat.h => GS2U_UpdateBuff
encode(#pk_GS2U_UpdateBuff{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_UpdateBuff.uid ),
	Bin_buff = encode_BuffInfo( P#pk_GS2U_UpdateBuff.buff ),
	[
		<<?GS2U_UpdateBuff:?U16>>,
		Bin_uid,
		Bin_buff
	];

%GENERATED from file:combat.h => GS2U_UpdateBuffList
encode(#pk_GS2U_UpdateBuffList{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_UpdateBuffList.uid ),
	Bin_buff_list = write_array(P#pk_GS2U_UpdateBuffList.buff_list, fun(X) -> encode_BuffInfo( X ) end),
	[
		<<?GS2U_UpdateBuffList:?U16>>,
		Bin_uid,
		Bin_buff_list
	];

%GENERATED from file:combat.h => GS2U_UseSkill
encode(#pk_GS2U_UseSkill{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_UseSkill.uid ),
	Bin_tar_uid = write_uint64( P#pk_GS2U_UseSkill.tar_uid ),
	Bin_skill_id = write_uint32( P#pk_GS2U_UseSkill.skill_id ),
	Bin_serial = write_uint32( P#pk_GS2U_UseSkill.serial ),
	Bin_spell_time = write_uint32( P#pk_GS2U_UseSkill.spell_time ),
	Bin_error_code = write_uint32( P#pk_GS2U_UseSkill.error_code ),
	[
		<<?GS2U_UseSkill:?U16>>,
		Bin_uid,
		Bin_tar_uid,
		Bin_skill_id,
		Bin_serial,
		Bin_spell_time,
		Bin_error_code
	];

%GENERATED from file:combat.h => U2GS_DeleteBuff
encode(#pk_U2GS_DeleteBuff{} = P) ->
	Bin_buff_id = write_uint32( P#pk_U2GS_DeleteBuff.buff_id ),
	[
		<<?U2GS_DeleteBuff:?U16>>,
		Bin_buff_id
	];

%GENERATED from file:combat.h => U2GS_SkillInterrupt
encode(#pk_U2GS_SkillInterrupt{} = P) ->
	Bin_skill_id = write_uint32( P#pk_U2GS_SkillInterrupt.skill_id ),
	[
		<<?U2GS_SkillInterrupt:?U16>>,
		Bin_skill_id
	];

%GENERATED from file:combat.h => U2GS_UseSkill
encode(#pk_U2GS_UseSkill{} = P) ->
	Bin_x = write_float( P#pk_U2GS_UseSkill.x ),
	Bin_y = write_float( P#pk_U2GS_UseSkill.y ),
	Bin_tar_uid = write_uint64( P#pk_U2GS_UseSkill.tar_uid ),
	Bin_skill_id = write_uint32( P#pk_U2GS_UseSkill.skill_id ),
	Bin_serial = write_uint32( P#pk_U2GS_UseSkill.serial ),
	[
		<<?U2GS_UseSkill:?U16>>,
		Bin_x,
		Bin_y,
		Bin_tar_uid,
		Bin_skill_id,
		Bin_serial
	];

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

%GENERATED from file:login.h => GS2U_LoginResult
encode(#pk_GS2U_LoginResult{} = P) ->
	Bin_result = write_int32( P#pk_GS2U_LoginResult.result ),
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

%GENERATED from file:login.h => GS2U_SelPlayerResult
encode(#pk_GS2U_SelPlayerResult{} = P) ->
	Bin_result = write_int32( P#pk_GS2U_SelPlayerResult.result ),
	[
		<<?GS2U_SelPlayerResult:?U16>>,
		Bin_result
	];

%GENERATED from file:login.h => GS2U_UserPlayerList
encode(#pk_GS2U_UserPlayerList{} = P) ->
	Bin_info = write_array(P#pk_GS2U_UserPlayerList.info, fun(X) -> encode_UserPlayerData( X ) end),
	[
		<<?GS2U_UserPlayerList:?U16>>,
		Bin_info
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

%GENERATED from file:login.h => U2GS_RequestCreatePlayer
encode(#pk_U2GS_RequestCreatePlayer{} = P) ->
	Bin_name = write_string( P#pk_U2GS_RequestCreatePlayer.name ),
	Bin_camp = write_int32( P#pk_U2GS_RequestCreatePlayer.camp ),
	Bin_career = write_uint32( P#pk_U2GS_RequestCreatePlayer.career ),
	Bin_race = write_int32( P#pk_U2GS_RequestCreatePlayer.race ),
	Bin_sex = write_int32( P#pk_U2GS_RequestCreatePlayer.sex ),
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

%GENERATED from file:player.h => GS2U_Chat
encode(#pk_GS2U_Chat{} = P) ->
	Bin_channel = write_int32( P#pk_GS2U_Chat.channel ),
	Bin_uid = write_uint64( P#pk_GS2U_Chat.uid ),
	Bin_content = write_string( P#pk_GS2U_Chat.content ),
	[
		<<?GS2U_Chat:?U16>>,
		Bin_channel,
		Bin_uid,
		Bin_content
	];

%GENERATED from file:player.h => GS2U_GetPlayerInitDataEnd
encode(#pk_GS2U_GetPlayerInitDataEnd{}) ->
	[
		<<?GS2U_GetPlayerInitDataEnd:?U16>>

	];

%GENERATED from file:player.h => GS2U_GotoNewMap
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

%GENERATED from file:player.h => GS2U_HearBeat
encode(#pk_GS2U_HearBeat{} = P) ->
	Bin_now = write_uint32( P#pk_GS2U_HearBeat.now ),
	[
		<<?GS2U_HearBeat:?U16>>,
		Bin_now
	];

%GENERATED from file:player.h => GS2U_KickByServer
encode(#pk_GS2U_KickByServer{} = P) ->
	Bin_reason = write_string( P#pk_GS2U_KickByServer.reason ),
	[
		<<?GS2U_KickByServer:?U16>>,
		Bin_reason
	];

%GENERATED from file:player.h => GS2U_LookInfoPlayer
encode(#pk_GS2U_LookInfoPlayer{} = P) ->
	Bin_player_list = write_array(P#pk_GS2U_LookInfoPlayer.player_list, fun(X) -> encode_LookInfoPlayer( X ) end),
	[
		<<?GS2U_LookInfoPlayer:?U16>>,
		Bin_player_list
	];

%GENERATED from file:player.h => GS2U_MonsterList
encode(#pk_GS2U_MonsterList{} = P) ->
	Bin_monster_list = write_array(P#pk_GS2U_MonsterList.monster_list, fun(X) -> encode_LookInfoMonster( X ) end),
	[
		<<?GS2U_MonsterList:?U16>>,
		Bin_monster_list
	];

%GENERATED from file:player.h => GS2U_PlayerInitBase
encode(#pk_GS2U_PlayerInitBase{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_PlayerInitBase.uid ),
	Bin_name = write_string( P#pk_GS2U_PlayerInitBase.name ),
	Bin_level = write_int32( P#pk_GS2U_PlayerInitBase.level ),
	Bin_camp = write_int32( P#pk_GS2U_PlayerInitBase.camp ),
	Bin_race = write_int32( P#pk_GS2U_PlayerInitBase.race ),
	Bin_career = write_uint32( P#pk_GS2U_PlayerInitBase.career ),
	Bin_sex = write_int32( P#pk_GS2U_PlayerInitBase.sex ),
	Bin_head = write_int32( P#pk_GS2U_PlayerInitBase.head ),
	Bin_mapID = write_uint32( P#pk_GS2U_PlayerInitBase.mapID ),
	Bin_combat_props = write_array(P#pk_GS2U_PlayerInitBase.combat_props, fun(X) -> write_int32( X ) end),
	Bin_buff_list = write_array(P#pk_GS2U_PlayerInitBase.buff_list, fun(X) -> encode_BuffInfo( X ) end),
	Bin_skill_list = write_array(P#pk_GS2U_PlayerInitBase.skill_list, fun(X) -> encode_SkillInfo( X ) end),
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
		Bin_mapID,
		Bin_combat_props,
		Bin_buff_list,
		Bin_skill_list
	];

%GENERATED from file:player.h => GS2U_RemoteMonster
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

%GENERATED from file:player.h => GS2U_RemotePet
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

%GENERATED from file:player.h => GS2U_RemotePlayer
encode(#pk_GS2U_RemotePlayer{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_RemotePlayer.uid ),
	Bin_level = write_int32( P#pk_GS2U_RemotePlayer.level ),
	Bin_name = write_string( P#pk_GS2U_RemotePlayer.name ),
	Bin_career = write_int32( P#pk_GS2U_RemotePlayer.career ),
	Bin_race = write_int32( P#pk_GS2U_RemotePlayer.race ),
	Bin_cur_x = write_float( P#pk_GS2U_RemotePlayer.cur_x ),
	Bin_cur_y = write_float( P#pk_GS2U_RemotePlayer.cur_y ),
	[
		<<?GS2U_RemotePlayer:?U16>>,
		Bin_uid,
		Bin_level,
		Bin_name,
		Bin_career,
		Bin_race,
		Bin_cur_x,
		Bin_cur_y
	];

%GENERATED from file:player.h => GS2U_RemoveRemote
encode(#pk_GS2U_RemoveRemote{} = P) ->
	Bin_uid_list = write_array(P#pk_GS2U_RemoveRemote.uid_list, fun(X) -> write_uint64( X ) end),
	[
		<<?GS2U_RemoveRemote:?U16>>,
		Bin_uid_list
	];

%GENERATED from file:player.h => GS2U_SyncStand
encode(#pk_GS2U_SyncStand{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_SyncStand.uid ),
	Bin_type = write_uint32( P#pk_GS2U_SyncStand.type ),
	Bin_cur_x = write_float( P#pk_GS2U_SyncStand.cur_x ),
	Bin_cur_y = write_float( P#pk_GS2U_SyncStand.cur_y ),
	[
		<<?GS2U_SyncStand:?U16>>,
		Bin_uid,
		Bin_type,
		Bin_cur_x,
		Bin_cur_y
	];

%GENERATED from file:player.h => GS2U_SyncWalk
encode(#pk_GS2U_SyncWalk{} = P) ->
	Bin_uid = write_uint64( P#pk_GS2U_SyncWalk.uid ),
	Bin_type = write_uint32( P#pk_GS2U_SyncWalk.type ),
	Bin_src_x = write_float( P#pk_GS2U_SyncWalk.src_x ),
	Bin_src_y = write_float( P#pk_GS2U_SyncWalk.src_y ),
	Bin_dst_x = write_float( P#pk_GS2U_SyncWalk.dst_x ),
	Bin_dst_y = write_float( P#pk_GS2U_SyncWalk.dst_y ),
	Bin_move_time = write_int32( P#pk_GS2U_SyncWalk.move_time ),
	Bin_speed = write_float( P#pk_GS2U_SyncWalk.speed ),
	[
		<<?GS2U_SyncWalk:?U16>>,
		Bin_uid,
		Bin_type,
		Bin_src_x,
		Bin_src_y,
		Bin_dst_x,
		Bin_dst_y,
		Bin_move_time,
		Bin_speed
	];

%GENERATED from file:player.h => U2GS_ChangeMap
encode(#pk_U2GS_ChangeMap{} = P) ->
	Bin_map_id = write_uint32( P#pk_U2GS_ChangeMap.map_id ),
	Bin_x = write_float( P#pk_U2GS_ChangeMap.x ),
	Bin_y = write_float( P#pk_U2GS_ChangeMap.y ),
	[
		<<?U2GS_ChangeMap:?U16>>,
		Bin_map_id,
		Bin_x,
		Bin_y
	];

%GENERATED from file:player.h => U2GS_Chat
encode(#pk_U2GS_Chat{} = P) ->
	Bin_channel = write_int32( P#pk_U2GS_Chat.channel ),
	Bin_receiver = write_uint64( P#pk_U2GS_Chat.receiver ),
	Bin_content = write_string( P#pk_U2GS_Chat.content ),
	[
		<<?U2GS_Chat:?U16>>,
		Bin_channel,
		Bin_receiver,
		Bin_content
	];

%GENERATED from file:player.h => U2GS_ExitGame
encode(#pk_U2GS_ExitGame{}) ->
	[
		<<?U2GS_ExitGame:?U16>>

	];

%GENERATED from file:player.h => U2GS_GetPlayerInitData
encode(#pk_U2GS_GetPlayerInitData{}) ->
	[
		<<?U2GS_GetPlayerInitData:?U16>>

	];

%GENERATED from file:player.h => U2GS_GetRemoteObjInfo
encode(#pk_U2GS_GetRemoteObjInfo{} = P) ->
	Bin_uids = write_array(P#pk_U2GS_GetRemoteObjInfo.uids, fun(X) -> write_uint64( X ) end),
	[
		<<?U2GS_GetRemoteObjInfo:?U16>>,
		Bin_uids
	];

%GENERATED from file:player.h => U2GS_HearBeat
encode(#pk_U2GS_HearBeat{}) ->
	[
		<<?U2GS_HearBeat:?U16>>

	];

%GENERATED from file:player.h => U2GS_PlayerStopWalk
encode(#pk_U2GS_PlayerStopWalk{} = P) ->
	Bin_cur_x = write_float( P#pk_U2GS_PlayerStopWalk.cur_x ),
	Bin_cur_y = write_float( P#pk_U2GS_PlayerStopWalk.cur_y ),
	[
		<<?U2GS_PlayerStopWalk:?U16>>,
		Bin_cur_x,
		Bin_cur_y
	];

%GENERATED from file:player.h => U2GS_PlayerWalk
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

encode(_) -> noMatch.

%GENERATED from file:combat.h => BuffInfo
encode_BuffInfo( #pk_BuffInfo{} = P ) ->
	Bin_buff_id = write_uint32( P#pk_BuffInfo.buff_id ),
	Bin_lifetime = write_uint32( P#pk_BuffInfo.lifetime ),
	Bin_level = write_uint32( P#pk_BuffInfo.level ),
	Bin_wrap = write_uint32( P#pk_BuffInfo.wrap ),
	[
		Bin_buff_id,
		Bin_lifetime,
		Bin_level,
		Bin_wrap	
].

%GENERATED from file:combat.h => SkillInfo
encode_SkillInfo( #pk_SkillInfo{} = P ) ->
	Bin_skill_id = write_uint32( P#pk_SkillInfo.skill_id ),
	Bin_level = write_uint32( P#pk_SkillInfo.level ),
	Bin_cd_time = write_uint32( P#pk_SkillInfo.cd_time ),
	Bin_slot_index = write_uint32( P#pk_SkillInfo.slot_index ),
	[
		Bin_skill_id,
		Bin_level,
		Bin_cd_time,
		Bin_slot_index	
].

%GENERATED from file:login.h => UserPlayerData
encode_UserPlayerData( #pk_UserPlayerData{} = P ) ->
	Bin_uid = write_uint64( P#pk_UserPlayerData.uid ),
	Bin_name = write_string( P#pk_UserPlayerData.name ),
	Bin_level = write_int32( P#pk_UserPlayerData.level ),
	Bin_wingLevel = write_int32( P#pk_UserPlayerData.wingLevel ),
	Bin_camp = write_int32( P#pk_UserPlayerData.camp ),
	Bin_race = write_int32( P#pk_UserPlayerData.race ),
	Bin_career = write_uint32( P#pk_UserPlayerData.career ),
	Bin_sex = write_int32( P#pk_UserPlayerData.sex ),
	Bin_head = write_int32( P#pk_UserPlayerData.head ),
	Bin_mapID = write_uint32( P#pk_UserPlayerData.mapID ),
	Bin_oldMapID = write_uint32( P#pk_UserPlayerData.oldMapID ),
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
		Bin_oldMapID	
].

%GENERATED from file:player.h => LookInfoMonster
encode_LookInfoMonster( #pk_LookInfoMonster{} = P ) ->
	Bin_uid = write_uint64( P#pk_LookInfoMonster.uid ),
	Bin_did = write_uint32( P#pk_LookInfoMonster.did ),
	Bin_x = write_float( P#pk_LookInfoMonster.x ),
	Bin_y = write_float( P#pk_LookInfoMonster.y ),
	Bin_rotW = write_float( P#pk_LookInfoMonster.rotW ),
	Bin_targetX = write_float( P#pk_LookInfoMonster.targetX ),
	Bin_targetY = write_float( P#pk_LookInfoMonster.targetY ),
	Bin_move_speed = write_float( P#pk_LookInfoMonster.move_speed ),
	Bin_hp_per = write_uint32( P#pk_LookInfoMonster.hp_per ),
	Bin_camp = write_int32( P#pk_LookInfoMonster.camp ),
	Bin_owner = write_uint64( P#pk_LookInfoMonster.owner ),
	Bin_groupID = write_uint64( P#pk_LookInfoMonster.groupID ),
	Bin_guildID = write_uint64( P#pk_LookInfoMonster.guildID ),
	Bin_name = write_string( P#pk_LookInfoMonster.name ),
	Bin_level = write_uint32( P#pk_LookInfoMonster.level ),
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
		Bin_level	
].

%GENERATED from file:player.h => LookInfoPlayer
encode_LookInfoPlayer( #pk_LookInfoPlayer{} = P ) ->
	Bin_uid = write_uint64( P#pk_LookInfoPlayer.uid ),
	Bin_name = write_string( P#pk_LookInfoPlayer.name ),
	Bin_x = write_float( P#pk_LookInfoPlayer.x ),
	Bin_y = write_float( P#pk_LookInfoPlayer.y ),
	Bin_race = write_int32( P#pk_LookInfoPlayer.race ),
	Bin_career = write_uint32( P#pk_LookInfoPlayer.career ),
	Bin_sex = write_int32( P#pk_LookInfoPlayer.sex ),
	Bin_camp = write_int32( P#pk_LookInfoPlayer.camp ),
	Bin_head = write_int32( P#pk_LookInfoPlayer.head ),
	Bin_move_speed = write_float( P#pk_LookInfoPlayer.move_speed ),
	Bin_level = write_int32( P#pk_LookInfoPlayer.level ),
	Bin_hp_per = write_uint32( P#pk_LookInfoPlayer.hp_per ),
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
		Bin_hp_per	
].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
name(?GS2U_AddBuff) -> "GS2U_AddBuff";
name(?GS2U_DeleteBuff) -> "GS2U_DeleteBuff";
name(?GS2U_DeleteBuffList) -> "GS2U_DeleteBuffList";
name(?GS2U_HPChange) -> "GS2U_HPChange";
name(?GS2U_HitTarget) -> "GS2U_HitTarget";
name(?GS2U_SkillInterrupt) -> "GS2U_SkillInterrupt";
name(?GS2U_SpecialMove) -> "GS2U_SpecialMove";
name(?GS2U_UpdateBuff) -> "GS2U_UpdateBuff";
name(?GS2U_UpdateBuffList) -> "GS2U_UpdateBuffList";
name(?GS2U_UseSkill) -> "GS2U_UseSkill";
name(?U2GS_DeleteBuff) -> "U2GS_DeleteBuff";
name(?U2GS_SkillInterrupt) -> "U2GS_SkillInterrupt";
name(?U2GS_UseSkill) -> "U2GS_UseSkill";
name(?GS2U_CreatePlayerResult) -> "GS2U_CreatePlayerResult";
name(?GS2U_DeletePlayerResult) -> "GS2U_DeletePlayerResult";
name(?GS2U_LoginResult) -> "GS2U_LoginResult";
name(?GS2U_SelPlayerResult) -> "GS2U_SelPlayerResult";
name(?GS2U_UserPlayerList) -> "GS2U_UserPlayerList";
name(?U2GS_Login_Normal) -> "U2GS_Login_Normal";
name(?U2GS_RequestCreatePlayer) -> "U2GS_RequestCreatePlayer";
name(?U2GS_RequestDeletePlayer) -> "U2GS_RequestDeletePlayer";
name(?U2GS_SelPlayerEnterGame) -> "U2GS_SelPlayerEnterGame";
name(?GS2U_Chat) -> "GS2U_Chat";
name(?GS2U_GetPlayerInitDataEnd) -> "GS2U_GetPlayerInitDataEnd";
name(?GS2U_GotoNewMap) -> "GS2U_GotoNewMap";
name(?GS2U_HearBeat) -> "GS2U_HearBeat";
name(?GS2U_KickByServer) -> "GS2U_KickByServer";
name(?GS2U_LookInfoPlayer) -> "GS2U_LookInfoPlayer";
name(?GS2U_MonsterList) -> "GS2U_MonsterList";
name(?GS2U_PlayerInitBase) -> "GS2U_PlayerInitBase";
name(?GS2U_RemoteMonster) -> "GS2U_RemoteMonster";
name(?GS2U_RemotePet) -> "GS2U_RemotePet";
name(?GS2U_RemotePlayer) -> "GS2U_RemotePlayer";
name(?GS2U_RemoveRemote) -> "GS2U_RemoveRemote";
name(?GS2U_SyncStand) -> "GS2U_SyncStand";
name(?GS2U_SyncWalk) -> "GS2U_SyncWalk";
name(?U2GS_ChangeMap) -> "U2GS_ChangeMap";
name(?U2GS_Chat) -> "U2GS_Chat";
name(?U2GS_ExitGame) -> "U2GS_ExitGame";
name(?U2GS_GetPlayerInitData) -> "U2GS_GetPlayerInitData";
name(?U2GS_GetRemoteObjInfo) -> "U2GS_GetRemoteObjInfo";
name(?U2GS_HearBeat) -> "U2GS_HearBeat";
name(?U2GS_PlayerStopWalk) -> "U2GS_PlayerStopWalk";
name(?U2GS_PlayerWalk) -> "U2GS_PlayerWalk";
name(MsgID) -> "ErrorNetMsg_" ++ erlang:integer_to_list(MsgID).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmd_list()->
	[
		?GS2U_AddBuff
		,?GS2U_DeleteBuff
		,?GS2U_DeleteBuffList
		,?GS2U_HPChange
		,?GS2U_HitTarget
		,?GS2U_SkillInterrupt
		,?GS2U_SpecialMove
		,?GS2U_UpdateBuff
		,?GS2U_UpdateBuffList
		,?GS2U_UseSkill
		,?U2GS_DeleteBuff
		,?U2GS_SkillInterrupt
		,?U2GS_UseSkill
		,?GS2U_CreatePlayerResult
		,?GS2U_DeletePlayerResult
		,?GS2U_LoginResult
		,?GS2U_SelPlayerResult
		,?GS2U_UserPlayerList
		,?U2GS_Login_Normal
		,?U2GS_RequestCreatePlayer
		,?U2GS_RequestDeletePlayer
		,?U2GS_SelPlayerEnterGame
		,?GS2U_Chat
		,?GS2U_GetPlayerInitDataEnd
		,?GS2U_GotoNewMap
		,?GS2U_HearBeat
		,?GS2U_KickByServer
		,?GS2U_LookInfoPlayer
		,?GS2U_MonsterList
		,?GS2U_PlayerInitBase
		,?GS2U_RemoteMonster
		,?GS2U_RemotePet
		,?GS2U_RemotePlayer
		,?GS2U_RemoveRemote
		,?GS2U_SyncStand
		,?GS2U_SyncWalk
		,?U2GS_ChangeMap
		,?U2GS_Chat
		,?U2GS_ExitGame
		,?U2GS_GetPlayerInitData
		,?U2GS_GetRemoteObjInfo
		,?U2GS_HearBeat
		,?U2GS_PlayerStopWalk
		,?U2GS_PlayerWalk

	].