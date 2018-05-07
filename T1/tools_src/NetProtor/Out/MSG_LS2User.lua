return {
	GS2U_ChangeLineResponse = 
	{
		fields = "$gameServers,identity,1z",
		[1] = {
			fields = "lineid,name,ip,port,state,szzsb",
		},
	},

	LS2U_GameLineServerList = 
	{
		fields = "$gameServers,1",
		[1] = {
			fields = "lineid,name,ip,port,state,szzsb",
		},
	},

	LS2U_LoginQue = 
	{
		fields = "currentNumber,L",
	},

	LS2U_LoginResult = 
	{
		fields = "result,accountID,identity,msg,bLzz",
	},

	LS2Web_CryptoAck = 
	{
		fields = "bodyJsonStr,z",
	},

	LS2Web_NormalAck = 
	{
		fields = "bodyJsonStr,z",
	},

	U2LS_Login_Normal = 
	{
		fields = "platformAccount,platformName,platformNickName,time,sign,deviceId,imei,idfa,mac,extParam,versionRes,versionExe,versionGame,versionPro,zzzlzzzzzziiii",
	},

	U2LS_RequestGSLine = 
	{
	},

	Web2LS_Crypto = 
	{
		fields = "bodyJsonStr,z",
	},

	Web2LS_Normal = 
	{
		fields = "bodyJsonStr,z",
	},

}
