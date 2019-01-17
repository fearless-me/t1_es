// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 请求创建灵魂队伍
struct U2GS_CreateCompanion ->
{
};

// 请求灵魂团队信息
struct U2GS_RequestCompanion ->
{
};

// 灵魂成员信息
struct CompanionMember
{
	uint64 roleid;	// 角色唯一ID
	string name;	// 姓名
	uint16 lvl;		// 等级
	uint8 relation;	// 关系，0目标，1自己，9队长
	uint cur_lively;// 今日当前活跃
	uint max_lively;// 今日最大活跃
	uint all_lively;// 本周累计活跃
	uint64 offlinetime;	// 离线时间（秒），为0表示在线
	bool	onlineTimeEnough;//是否达到在线时长
	uint8	styleID;//姿势
	uint16	mapID;//所在地图id
	uint32	career;//职业
	uint8	race;//种族
	uint8	sex;//性别
	uint32 head;
};

// 返回灵魂成员信息
struct GS2U_RequestCompanion <-
{
	vector<CompanionMember> members;	// 成员列表（为空则表示该玩家还没有灵魂伙伴团队）
	uint16 max_member;	// 最大成员数量
	uint16	profileLevel;//增益效果等级
};

// 邀请在线好友进入我的灵魂团队（邀请成功，会重新发一遍所有灵魂成员信息给你）
struct U2GS_InviteFriend ->
{
	uint64 target_roleid;	// 邀请目标的roleid
};

// 接收到某灵魂队长的邀请
struct GS2U_RecvInviteFriend <-
{
	string name;		// 邀请者的姓名
	uint64 companionID;	// 邀请者的灵魂团队唯一ID
};

// 处理被邀请的消息
struct U2GS_AgreeInvite ->
{
	uint64 companionID;	// 邀请者的灵魂团队唯一ID
	bool isAgree;		// 是否同意，true同意，false拒绝
};

// 驱逐伙伴（驱逐成功，会重新发一遍所有灵魂成员信息给你）
struct U2GS_KickCompanion ->
{
	uint64 target_roleid;	// 角色唯一ID
};

// 退出或解散灵魂伙伴（成员为退出，队长为解散）
struct U2GS_ExitCompanion ->
{
	
};

// 请求传到角色身边
struct U2GS_ToTargetFriend ->
{
	uint64 target_roleid;	// 传送到目标的roleid
};

// 请求传到角色身边
struct GS2U_ToTargetFriendAck <-
{
	uint32 mapID;
	float x;
	float y;
};

//邀请灵魂到我身边
struct U2GS_InviteToMe ->
{
};

// 邀请灵魂到这身边（我广播给我的伙伴）
struct GS2U_InviteFriendToMe <-
{
	uint64 inviteRoleID;	// 传送到目标的roleid
	string inviteName;//邀请者name
	uint32 mapID;
	float x;
	float y;
};

// 伙伴对我的邀请结果
struct U2GS_ToTargetFriendResult ->
{
	uint64 inviteRoleID;	// 传送到目标的roleid
	bool	comming;//是否赶来
};


// 切换姿势
struct U2GS_ChangePoseID ->
{
	uint16	poseID;//姿势id
};
