return {
	GS2U_CreatePlayerResult = 
	{
		fields = "errorCode,uid,iL",
	},

	GS2U_DeletePlayerResult = 
	{
		fields = "uid,errorCode,Li",
	},

	GS2U_GetPlayerInitDataEnd = 
	{
	},

	GS2U_GotoNewMap = 
	{
		fields = "map_id,x,y,Sff",
	},

	GS2U_LoginResult = 
	{
		fields = "result,aid,identity,msg,bLzz",
	},

	GS2U_LookInfoPlayer = 
	{
		fields = "$player_list,1",
		[1] = {
			fields = "uid,name,x,y,race,career,sex,camp,head,move_speed,level,hp_per,LzffbIbbifsB",
		},
	},

	GS2U_MonsterList = 
	{
		fields = "$monster_list,1",
		[1] = {
			fields = "uid,did,x,y,rotW,targetX,targetY,move_speed,hp_per,camp,owner,groupID,guildID,name,level,LIffffffBbLLLzS",
		},
	},

	GS2U_PlayerInitBase = 
	{
		fields = "uid,name,level,camp,race,career,sex,head,mapID,LzibbIbiS",
	},

	GS2U_RemoteMonster = 
	{
		fields = "uid,did,level,cur_x,cur_y,LIiff",
	},

	GS2U_RemotePet = 
	{
		fields = "uid,owner,did,level,cur_x,cur_y,LLIiff",
	},

	GS2U_RemotePlayer = 
	{
		fields = "uid,level,cur_x,cur_y,Liff",
	},

	GS2U_RemoveRemote = 
	{
		fields = "$uid_list,1",
	},

	GS2U_SelPlayerResult = 
	{
		fields = "result,i",
	},

	GS2U_SyncStand = 
	{
		fields = "uid,cur_x,cur_y,Lff",
	},

	GS2U_SyncWalk = 
	{
		fields = "uid,src_x,src_y,dst_x,dst_y,move_time,speed,Lffffif",
	},

	GS2U_UserPlayerList = 
	{
		fields = "$info,1",
		[1] = {
			fields = "uid,name,level,wingLevel,camp,race,career,sex,head,mapID,oldMapID,LziibbIbiSS",
		},
	},

	U2GS_ChangeMap = 
	{
		fields = "map_id,x,y,Sff",
	},

	U2GS_GetPlayerInitData = 
	{
	},

	U2GS_GetRemotePlayer = 
	{
		fields = "$uids,1",
	},

	U2GS_Login_Normal = 
	{
		fields = "platformAccount,platformName,platformNickName,time,sign,deviceId,imei,idfa,mac,extParam,versionRes,versionExe,versionGame,versionPro,zzzlzzzzzziiii",
	},

	U2GS_PlayerStopWalk = 
	{
		fields = "cur_x,cur_y,ff",
	},

	U2GS_PlayerWalk = 
	{
		fields = "src_x,src_y,dst_x,dst_y,ffff",
	},

	U2GS_RequestCreatePlayer = 
	{
		fields = "name,camp,career,race,sex,head,zbIbbi",
	},

	U2GS_RequestDeletePlayer = 
	{
		fields = "uid,L",
	},

	U2GS_SelPlayerEnterGame = 
	{
		fields = "uid,L",
	},

}
