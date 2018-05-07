--BEGIN refrence file declear
local MSG_LS2User = require "Net.MSG_LS2User"
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
	__VERSION__ = 613,
--BEGIN message id define


--Begin LS2User...
	MSG_GS2U_ChangeLineResponse = 15641,
	MSG_LS2U_GameLineServerList = 17992,
	MSG_LS2U_LoginQue = 25241,
	MSG_LS2U_LoginResult = 4461,
	MSG_LS2Web_CryptoAck = 1690,
	MSG_LS2Web_NormalAck = 1056,
	MSG_U2LS_Login_Normal = 41532,
	MSG_U2LS_RequestGSLine = 39508,
	MSG_Web2LS_Crypto = 1767,
	MSG_Web2LS_Normal = 889,
--EndLS2User--END message id define



	--Begin LS2User...
	[15641] = MSG_LS2User.GS2U_ChangeLineResponse,
	[17992] = MSG_LS2User.LS2U_GameLineServerList,
	[25241] = MSG_LS2User.LS2U_LoginQue,
	[4461] = MSG_LS2User.LS2U_LoginResult,
	[1690] = MSG_LS2User.LS2Web_CryptoAck,
	[1056] = MSG_LS2User.LS2Web_NormalAck,
	[41532] = MSG_LS2User.U2LS_Login_Normal,
	[39508] = MSG_LS2User.U2LS_RequestGSLine,
	[1767] = MSG_LS2User.Web2LS_Crypto,
	[889] = MSG_LS2User.Web2LS_Normal,
	--EndLS2User
}
 --END table for msgs description

