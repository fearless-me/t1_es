%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-ifndef(netmsg).
-define(netmsg,1).

-define(ProtoVersion,648).

-record(pk_BuffInfo,{
	buff_id = 0	,%% UInt32
	lifetime = 0	,%% UInt32
	level = 0	,%% UInt32
	wrap = 0	%% UInt32
}).

%% %% // 添加buff-define(GS2U_AddBuff,1356).
-record(pk_GS2U_AddBuff,{
	uid = 0	,%% UInt64 角色ID
	buff	%% BuffInfo buff	
}).

%% %% // 删除buff-define(GS2U_DeleteBuff,52430).
-record(pk_GS2U_DeleteBuff,{
	uid = 0	,%% UInt64 角色ID
	buff_id = 0	%% UInt32 buff id
}).

%% %% // 血量变化-define(GS2U_HPChange,51252).
-record(pk_GS2U_HPChange,{
	uid = 0	,%% UInt64角色ID
	cause = 0	,%% UInt32HP变化原因 1 技能 2 buff 等等
	result = 0	,%% UInt321闪避 2 暴击 3 格挡等等 
	hp_change = 0	,%% Int32HP变化值
	src_uid = 0	,%% UInt64发起者ID
	misc1 = 0	,%% UInt32根据原因来定义
	misc2 = 0	,%% UInt32根据原因来定义
	serial = 0	%% UInt32根据原因来定义，如果是技能，由为技能消息序列号；其它原因填0
}).

%% %% // 命中目标-define(GS2U_HitTarget,35916).
-record(pk_GS2U_HitTarget,{
	uid = 0	,%% UInt64角色ID
	src_uid = 0	,%% UInt64发起者ID
	cause = 0	,%% UInt32原因 1 :使用技能
	misc = 0	,%% UInt32如果是技能，则为技能ID
	serial = 0	%% UInt32如果是技能，则为技能消息序列号
}).

%% %% // 技能打断-define(GS2U_SkillInterrupt,59398).
-record(pk_GS2U_SkillInterrupt,{
	uid = 0	,%% UInt64 角色ID
	skill_id = 0	%% UInt32 技能id
}).

%% %% // 特殊移动 比如 冲锋、抓取、瞬移、拖拽等等-define(GS2U_SpecialMove,37134).
-record(pk_GS2U_SpecialMove,{
	type = 0	,%% UInt32 移动类型
	uid = 0	,%% UInt64 角色ID
	x = 0.0	,%% Single 目标点
	y = 0.0	%% Single
}).

%% %% // 更新buff-define(GS2U_UpdateBuff,37208).
-record(pk_GS2U_UpdateBuff,{
	uid = 0	,%% UInt64 角色ID
	buff	%% BuffInfo buff	
}).

%% %% // 使用技能-define(GS2U_UseSkill,61150).
-record(pk_GS2U_UseSkill,{
	uid = 0	,%% UInt64 角色ID
	tar_uid = 0	,%% UInt64 ID
	skill_id = 0	,%% UInt32 技能id
	serial = 0	,%% UInt32 序列号
	spell_time = 0	,%% UInt32吟唱时间(毫秒)
	error_code = 0	%% UInt32 错误码
}).

%% %% // 删除buff-define(U2GS_DeleteBuff,19504).
-record(pk_U2GS_DeleteBuff,{
	buff_id = 0	%% UInt32 buff id
}).

%% %% // 技能打断-define(U2GS_SkillInterrupt,38536).
-record(pk_U2GS_SkillInterrupt,{
	skill_id = 0	%% UInt32 技能id
}).

%% %% //////////////////////////////////////////////////////////////////////////%% //<-发出去     ;      ->收消息%% //不用使用int uint long %% // 支持使用 string float int32 uint32 int64 uint64%% /////////////////////////////////////////////////////////////////////////%% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% // 技能攻击-define(U2GS_UseSkill,2416).
-record(pk_U2GS_UseSkill,{
	x = 0.0	,%% Single 施法者坐标
	y = 0.0	,%% Single 
	tar_uid = 0	,%% UInt64 ID
	skill_id = 0	,%% UInt32 技能id
	serial = 0	%% UInt32 序列号
}).

%% -define(GS2U_CreatePlayerResult,45054).
-record(pk_GS2U_CreatePlayerResult,{
	errorCode = 0	,%% Int32
	uid = 0	%% UInt64
}).

%% -define(GS2U_DeletePlayerResult,39385).
-record(pk_GS2U_DeletePlayerResult,{
	uid = 0	,%% UInt64
	errorCode = 0	%% Int32
}).

%% -define(GS2U_LoginResult,22162).
-record(pk_GS2U_LoginResult,{
	result = 0	,%% Int32 0为登录成功，非0为登录失败原因
	aid = 0	,%% UInt64
	identity = ""	,%% String
	msg = ""	%% String不为空，手机必须展示
}).

%% -define(GS2U_SelPlayerResult,42464).
-record(pk_GS2U_SelPlayerResult,{
	result = 0	%% Int32
}).

%% -define(GS2U_UserPlayerList,18582).
-record(pk_GS2U_UserPlayerList,{
	info = []	%% UserPlayerData
}).

%% %% //////////////////////////////////////////////////////////////////////////%% //<-发出去     ;      ->收消息%% // 不用使用int uint long %% // 支持使用 string float int32 uint32 int64 uint64%% /////////////////////////////////////////////////////////////////////////%% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long -define(U2GS_Login_Normal,58883).
-record(pk_U2GS_Login_Normal,{
	platformAccount = ""	,%% String 平台帐号（游戏内帐号用平台id来绑定创建）
	platformName = ""	,%% String 平台名
	platformNickName = ""	,%% String 平台昵称，没有就填空串
	time = 0	,%% Int64
	sign = ""	,%% String
	deviceId = ""	,%% String 程序生成，每个设备不能重复
	imei = ""	,%% String 手机串号
	idfa = ""	,%% String 苹果推号
	mac = ""	,%% String 网卡号
	extParam = ""	,%% String 扩展参数串
	versionRes = 0	,%% Int32 资源版本
	versionExe = 0	,%% Int32 执行程序版本
	versionGame = 0	,%% Int32 游戏版本？？
	versionPro = 0	%% Int32 协议版本
}).

%% -define(U2GS_RequestCreatePlayer,4022).
-record(pk_U2GS_RequestCreatePlayer,{
	name = ""	,%% String 名字
	camp = 0	,%% Int32 阵营
	career = 0	,%% UInt32 职业
	race = 0	,%% Int32 种族
	sex = 0	,%% Int32 性别
	head = 0	%% Int32 头
}).

%% -define(U2GS_RequestDeletePlayer,23657).
-record(pk_U2GS_RequestDeletePlayer,{
	uid = 0	%% UInt64
}).

%% -define(U2GS_SelPlayerEnterGame,56497).
-record(pk_U2GS_SelPlayerEnterGame,{
	uid = 0	%% UInt64
}).

-record(pk_UserPlayerData,{
	uid = 0	,%% UInt64 角色ID
	name = ""	,%% String 角色名
	level = 0	,%% Int32 等级
	wingLevel = 0	,%% Int32 翅膀等级
	camp = 0	,%% Int32 阵营
	race = 0	,%% Int32 种族
	career = 0	,%% UInt32 职业
	sex = 0	,%% Int32 性别
	head = 0	,%% Int32 头
	mapID = 0	,%% UInt32 角色所在当前地图ID
	oldMapID = 0	%% UInt32 角色之前所在地图ID
}).

%% %% // 聊天消息(服务端发送)-define(GS2U_Chat,14728).
-record(pk_GS2U_Chat,{
	channel = 0	,%% Int32频道
	uid = 0	,%% UInt64发送者ID
	content = ""	%% String内容
}).

%% %% // 初始化数据发送完毕-define(GS2U_GetPlayerInitDataEnd,11674).
-record(pk_GS2U_GetPlayerInitDataEnd,{
}).

%% %% // 进入地图信息-define(GS2U_GotoNewMap,47351).
-record(pk_GS2U_GotoNewMap,{
	map_id = 0	,%% UInt16 角色所在当前地图ID
	x = 0.0	,%% Single坐标X
	y = 0.0	%% Single坐标Y
}).

%% -define(GS2U_HearBeat,444).
-record(pk_GS2U_HearBeat,{
	now = 0	%% UInt32
}).

%% -define(GS2U_KickByServer,17208).
-record(pk_GS2U_KickByServer,{
	reason = ""	%% String 1 心跳超时 (后面换成ErrorCode)
}).

%% %% // 玩家外观信息-define(GS2U_LookInfoPlayer,18166).
-record(pk_GS2U_LookInfoPlayer,{
	player_list = []	%% LookInfoPlayer
}).

%% -define(GS2U_MonsterList,32656).
-record(pk_GS2U_MonsterList,{
	monster_list = []	%% LookInfoMonster 视野范围内怪物列表
}).

%% %% // 测试用-define(GS2U_PlayerInitBase,32262).
-record(pk_GS2U_PlayerInitBase,{
	uid = 0	,%% UInt64 角色ID
	name = ""	,%% String 角色名
	level = 0	,%% Int32 等级
	camp = 0	,%% Int32 阵营
	race = 0	,%% Int32 种族
	career = 0	,%% UInt32 职业
	sex = 0	,%% Int32 性别
	head = 0	,%% Int32 头
	mapID = 0	,%% UInt32 角色所在当前地图ID
	combat_props = []	,%% Int32
	buff_list = []	%% BuffInfo
}).

%% -define(GS2U_RemoteMonster,57060).
-record(pk_GS2U_RemoteMonster,{
	uid = 0	,%% UInt64唯一ID
	did = 0	,%% UInt32配置表ID
	level = 0	,%% Int32等级	
	cur_x = 0.0	,%% Single坐标X
	cur_y = 0.0	%% Single坐标Y
}).

%% -define(GS2U_RemotePet,31693).
-record(pk_GS2U_RemotePet,{
	uid = 0	,%% UInt64唯一ID
	owner = 0	,%% UInt64主人
	did = 0	,%% UInt32配置表ID
	level = 0	,%% Int32等级
	cur_x = 0.0	,%% Single坐标X
	cur_y = 0.0	%% Single坐标Y
}).

%% -define(GS2U_RemotePlayer,15687).
-record(pk_GS2U_RemotePlayer,{
	uid = 0	,%% UInt64唯一ID
	level = 0	,%% Int32等级
	name = ""	,%% String名字
	career = 0	,%% Int32职业
	race = 0	,%% Int32种族
	cur_x = 0.0	,%% Single坐标X
	cur_y = 0.0	%% Single坐标Y
}).

%% %% //-define(GS2U_RemoveRemote,31994).
-record(pk_GS2U_RemoveRemote,{
	uid_list = []	%% UInt64
}).

%% %% // 移动-define(GS2U_SyncStand,30047).
-record(pk_GS2U_SyncStand,{
	uid = 0	,%% UInt64唯一ID
	type = 0	,%% UInt321 怪物；2 NPC 3 宠物 4 玩家
	cur_x = 0.0	,%% Single坐标X
	cur_y = 0.0	%% Single坐标Y
}).

%% %% // 移动-define(GS2U_SyncWalk,3436).
-record(pk_GS2U_SyncWalk,{
	uid = 0	,%% UInt64 唯一ID
	type = 0	,%% UInt321 怪物；2 NPC 3 宠物 4 玩家
	src_x = 0.0	,%% Single坐标X
	src_y = 0.0	,%% Single坐标Y
	dst_x = 0.0	,%% Single坐标X
	dst_y = 0.0	,%% Single坐标Y
	move_time = 0	,%% Int32移动时间（毫秒）  
	speed = 0.0	%% Single移动速度
}).

-record(pk_LookInfoMonster,{
	uid = 0	,%% UInt64
	did = 0	,%% UInt32 怪物 ID	
	x = 0.0	,%% Single 怪物坐标
	y = 0.0	,%% Single
	rotW = 0.0	,%% Single旋转坐标W
	targetX = 0.0	,%% Single 怪物移动的目标点X
	targetY = 0.0	,%% Single 怪物移动的目标点Y
	move_speed = 0.0	,%% Single 怪物移动速度
	hp_per = 0	,%% UInt32 当前血量百分比
	camp = 0	,%% Int32 阵营
	owner = 0	,%% UInt64 归属
	groupID = 0	,%% UInt64 怪物所属分组ID
	guildID = 0	,%% UInt64 怪物所属军团ID
	name = ""	,%% String 名字
	level = 0	%% UInt32怪物等级
}).

-record(pk_LookInfoPlayer,{
	uid = 0	,%% UInt64角色ID
	name = ""	,%% String名字
	x = 0.0	,%% Single坐标X
	y = 0.0	,%% Single坐标Y
	race = 0	,%% Int32 种族
	career = 0	,%% UInt32职业
	sex = 0	,%% Int32 性别
	camp = 0	,%% Int32阵营
	head = 0	,%% Int32头
	move_speed = 0.0	,%% Single移动速度
	level = 0	,%% Int32当前等级	
	hp_per = 0	%% UInt32当前血量百分比
}).

%% %% // 切地图-define(U2GS_ChangeMap,4914).
-record(pk_U2GS_ChangeMap,{
	map_id = 0	,%% UInt32
	x = 0.0	,%% Single
	y = 0.0	%% Single
}).

%% %% // 聊天消息(客户端发送)-define(U2GS_Chat,11258).
-record(pk_U2GS_Chat,{
	channel = 0	,%% Int32频道
	receiver = 0	,%% UInt64接收者ID
	content = ""	%% String内容
}).

%% -define(U2GS_ExitGame,62410).
-record(pk_U2GS_ExitGame,{
}).

%% %% //////////////////////////////////////////////////////////////////////////%% //<-发出去     ;      ->收消息%% //不用使用int uint long %% // 支持使用 string float int32 uint32 int64 uint64%% /////////////////////////////////////////////////////////////////////////%% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long %% //不用使用int uint long%% // 请求发送初始化数据-define(U2GS_GetPlayerInitData,5543).
-record(pk_U2GS_GetPlayerInitData,{
}).

%% %% //-define(U2GS_GetRemoteObjInfo,16443).
-record(pk_U2GS_GetRemoteObjInfo,{
	uids = []	%% UInt64 唯一ID列表
}).

%% -define(U2GS_HearBeat,7246).
-record(pk_U2GS_HearBeat,{
}).

%% -define(U2GS_PlayerStopWalk,29978).
-record(pk_U2GS_PlayerStopWalk,{
	cur_x = 0.0	,%% Single坐标X
	cur_y = 0.0	%% Single坐标Y
}).

%% -define(U2GS_PlayerWalk,56544).
-record(pk_U2GS_PlayerWalk,{
	src_x = 0.0	,%% Single坐标X
	src_y = 0.0	,%% Single坐标Y
	dst_x = 0.0	,%% Single坐标X
	dst_y = 0.0	%% Single坐标Y
}).

-endif. %%NetmsgRecords
