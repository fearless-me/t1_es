--BEGIN refrence file declear
local MSG_login = require "Net.MSG_login"
--END refrence file declear


--BEGIN type define

--n = EFDT_unknown
--t = EFDT_bool
--b = EFDT_int8
--B = EFDT_uint8
--s = EFDT_int16
--S = EFDT_uint16
--i = EFDT_int32
--I = EFDT_uint32
--l = EFDT_int64
--L = EFDT_uint64
--f = EFDT_float
--d = EFDT_double
--z = EFDT_string
--u = EFDT_custom

--END type define

--BEGIN table for msgs description
return
{
	__VERSION__ = 630,
--BEGIN message id define


--Begin login...
	MSG_GS2U_CreatePlayerResult = 45054,
	MSG_GS2U_DeletePlayerResult = 39385,
	MSG_GS2U_GetPlayerInitDataEnd = 11674,
	MSG_GS2U_GotoNewMap = 47351,
	MSG_GS2U_LoginResult = 22162,
	MSG_GS2U_LookInfoPlayer = 18166,
	MSG_GS2U_MonsterList = 32656,
	MSG_GS2U_PlayerInitBase = 32262,
	MSG_GS2U_RemoveRemote = 31994,
	MSG_GS2U_SelPlayerResult = 42464,
	MSG_GS2U_SyncWalk = 3436,
	MSG_GS2U_SyncWalkMany = 27691,
	MSG_GS2U_UserPlayerList = 18582,
	MSG_U2GS_ChangeMap = 4914,
	MSG_U2GS_GetPlayerInitData = 5543,
	MSG_U2GS_Login_Normal = 58883,
	MSG_U2GS_RequestCreatePlayer = 4022,
	MSG_U2GS_RequestDeletePlayer = 23657,
	MSG_U2GS_SelPlayerEnterGame = 56497,
--Endlogin--END message id define



	--Begin login...
	[45054] = MSG_login.GS2U_CreatePlayerResult,
	[39385] = MSG_login.GS2U_DeletePlayerResult,
	[11674] = MSG_login.GS2U_GetPlayerInitDataEnd,
	[47351] = MSG_login.GS2U_GotoNewMap,
	[22162] = MSG_login.GS2U_LoginResult,
	[18166] = MSG_login.GS2U_LookInfoPlayer,
	[32656] = MSG_login.GS2U_MonsterList,
	[32262] = MSG_login.GS2U_PlayerInitBase,
	[31994] = MSG_login.GS2U_RemoveRemote,
	[42464] = MSG_login.GS2U_SelPlayerResult,
	[3436] = MSG_login.GS2U_SyncWalk,
	[27691] = MSG_login.GS2U_SyncWalkMany,
	[18582] = MSG_login.GS2U_UserPlayerList,
	[4914] = MSG_login.U2GS_ChangeMap,
	[5543] = MSG_login.U2GS_GetPlayerInitData,
	[58883] = MSG_login.U2GS_Login_Normal,
	[4022] = MSG_login.U2GS_RequestCreatePlayer,
	[23657] = MSG_login.U2GS_RequestDeletePlayer,
	[56497] = MSG_login.U2GS_SelPlayerEnterGame,
	--Endlogin
}
 --END table for msgs description

