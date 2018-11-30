%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-ifndef(netmsg).
-define(netmsg,1).

-define(ProtoVersion,656).

-record(pk_BattleProp,{
	%% UInt32 属性ID
	propID = 0,
	%% Single 加算值
	addValue = 0.0
}).

-record(pk_BattlePropEx,{
	%% UInt32 属性ID
	propID = 0,
	%% Single 加算值
	addValue = 0.0,
	%% Single 乘算值
	mulValue = 0.0
}).

-record(pk_BuffInfo,{
	%% UInt32
	buff_id = 0,
	%% UInt32
	lifetime = 0,
	%% UInt32
	level = 0,
	%% UInt32
	layer = 0
}).

%% 
%% // 添加buff
-define(GS2U_AddBuff,1356).
-record(pk_GS2U_AddBuff,{
	%% UInt64 角色ID
	uid = 0,
	%% BuffInfo buff	
	buff
}).

%% 
%% // 同步战斗属性
-define(GS2U_BattleProps,25624).
-record(pk_GS2U_BattleProps,{
	%% UInt64 对象ID
	uid = 0,
	%% UInt32 职业ID，计算战斗属性时会使用到
	career = 0,
	%% BattlePropEx 1类属性
	listBP1 = [],
	%% BattlePropEx 2类属性
	listBP2 = [],
	%% BattlePropEx 3类属性
	listBP3 = [],
	%% BattlePropEx 4类属性
	listBP4 = [],
	%% BattleProp 最终属性
	listBPFinal = []
}).

%% 
%% // 删除buff
-define(GS2U_DeleteBuff,52430).
-record(pk_GS2U_DeleteBuff,{
	%% UInt64 角色ID
	uid = 0,
	%% UInt32 buff id
	buff_id = 0
}).

%% 
-define(GS2U_DeleteBuffList,29368).
-record(pk_GS2U_DeleteBuffList,{
	%% UInt64 角色ID
	uid = 0,
	%% UInt32 buff id list
	buff_id_list = []
}).

%% 
%% // 血量变化
-define(GS2U_HPChange,51252).
-record(pk_GS2U_HPChange,{
	%% UInt64角色ID
	uid = 0,
	%% UInt32HP变化原因 1 技能 2 buff 等等
	cause = 0,
	%% UInt321闪避 2 暴击 3 格挡等等 
	result = 0,
	%% Int32HP变化值
	hp_change = 0,
	%% UInt64发起者ID
	src_uid = 0,
	%% UInt32根据原因来定义
	misc1 = 0,
	%% UInt32根据原因来定义
	misc2 = 0,
	%% UInt32根据原因来定义，如果是技能，由为技能消息序列号；其它原因填0
	serial = 0
}).

%% 
%% // 命中目标
-define(GS2U_HitTarget,35916).
-record(pk_GS2U_HitTarget,{
	%% UInt64 ID
	tar_uids = [],
	%% UInt64发起者ID
	src_uid = 0,
	%% UInt32原因 1 :使用技能
	cause = 0,
	%% UInt32如果是技能，则为技能ID
	misc = 0,
	%% UInt32如果是技能，则为技能消息序列号
	serial = 0
}).

%% 
%% // 技能打断
-define(GS2U_SkillInterrupt,59398).
-record(pk_GS2U_SkillInterrupt,{
	%% UInt64 角色ID
	uid = 0,
	%% UInt32 技能id
	skill_id = 0
}).

%% 
%% // 特殊移动 比如 冲锋、抓取、瞬移、拖拽等等
-define(GS2U_SpecialMove,37134).
-record(pk_GS2U_SpecialMove,{
	%% UInt32 移动类型
	type = 0,
	%% UInt64 角色ID
	uid = 0,
	%% Single 目标点
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
%% // 更新buff
-define(GS2U_UpdateBuff,37208).
-record(pk_GS2U_UpdateBuff,{
	%% UInt64 角色ID
	uid = 0,
	%% BuffInfo buff	
	buff
}).

%% 
-define(GS2U_UpdateBuffList,60642).
-record(pk_GS2U_UpdateBuffList,{
	%% UInt64 角色ID
	uid = 0,
	%% BuffInfo buff	
	buff_list = []
}).

%% 
%% // 使用技能
-define(GS2U_UseSkill,61150).
-record(pk_GS2U_UseSkill,{
	%% UInt64 角色ID
	uid = 0,
	%% UInt64 ID
	tar_uids = [],
	%% UInt32 技能id
	skill_id = 0,
	%% UInt32 序列号
	serial = 0,
	%% UInt32吟唱时间(毫秒)
	spell_time = 0,
	%% UInt32 错误码
	error_code = 0
}).

-record(pk_SkillInfo,{
	%% UInt32
	skill_id = 0,
	%% UInt32
	level = 0,
	%% UInt32
	cd_time = 0,
	%% UInt32技能盘孔位
	slot_index = 0
}).

%% 
%% // 删除buff
-define(U2GS_DeleteBuff,19504).
-record(pk_U2GS_DeleteBuff,{
	%% UInt32 buff id
	buff_id = 0
}).

%% 
%% // 技能打断
-define(U2GS_SkillInterrupt,38536).
-record(pk_U2GS_SkillInterrupt,{
	%% UInt32 技能id
	skill_id = 0
}).

%% 
%% // 技能攻击
-define(U2GS_UseSkill,2416).
-record(pk_U2GS_UseSkill,{
	%% Single 施法者坐标
	x = 0.0,
	%% Single 
	y = 0.0,
	%% UInt64 ID
	tar_uids = [],
	%% UInt32 技能id
	skill_id = 0,
	%% UInt32 序列号
	serial = 0
}).

%% 
-define(GS2U_CreatePlayerResult,45054).
-record(pk_GS2U_CreatePlayerResult,{
	%% Int32
	errorCode = 0,
	%% UInt64
	uid = 0
}).

%% 
-define(GS2U_DeletePlayerResult,39385).
-record(pk_GS2U_DeletePlayerResult,{
	%% UInt64
	uid = 0,
	%% Int32
	errorCode = 0
}).

%% 
-define(GS2U_LoginResult,22162).
-record(pk_GS2U_LoginResult,{
	%% Int32 0为登录成功，非0为登录失败原因
	result = 0,
	%% UInt64
	aid = 0,
	%% String
	identity = "",
	%% String不为空，手机必须展示
	msg = ""
}).

%% 
-define(GS2U_SelPlayerResult,42464).
-record(pk_GS2U_SelPlayerResult,{
	%% Int32
	result = 0
}).

%% 
-define(GS2U_UserPlayerList,18582).
-record(pk_GS2U_UserPlayerList,{
	%% UserPlayerData
	info = []
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% //<-发出去     ;      ->收消息
%% // 不用使用int uint long 
%% // 支持使用 string float int32 uint32 int64 uint64
%% /////////////////////////////////////////////////////////////////////////
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
-define(U2GS_Login_Normal,58883).
-record(pk_U2GS_Login_Normal,{
	%% String 平台帐号（游戏内帐号用平台id来绑定创建）
	platformAccount = "",
	%% String 平台名
	platformName = "",
	%% String 平台昵称，没有就填空串
	platformNickName = "",
	%% Int64
	time = 0,
	%% String
	sign = "",
	%% String 程序生成，每个设备不能重复
	deviceId = "",
	%% String 手机串号
	imei = "",
	%% String 苹果推号
	idfa = "",
	%% String 网卡号
	mac = "",
	%% String 扩展参数串
	extParam = "",
	%% Int32 资源版本
	versionRes = 0,
	%% Int32 执行程序版本
	versionExe = 0,
	%% Int32 游戏版本？？
	versionGame = 0,
	%% Int32 协议版本
	versionPro = 0
}).

%% 
-define(U2GS_RequestCreatePlayer,4022).
-record(pk_U2GS_RequestCreatePlayer,{
	%% String 名字
	name = "",
	%% Int32 阵营
	camp = 0,
	%% UInt32 职业
	career = 0,
	%% Int32 种族
	race = 0,
	%% Int32 性别
	sex = 0,
	%% Int32 头
	head = 0
}).

%% 
-define(U2GS_RequestDeletePlayer,23657).
-record(pk_U2GS_RequestDeletePlayer,{
	%% UInt64
	uid = 0
}).

%% 
-define(U2GS_SelPlayerEnterGame,56497).
-record(pk_U2GS_SelPlayerEnterGame,{
	%% UInt64
	uid = 0
}).

-record(pk_UserPlayerData,{
	%% UInt64 角色ID
	uid = 0,
	%% String 角色名
	name = "",
	%% Int32 等级
	level = 0,
	%% Int32 翅膀等级
	wingLevel = 0,
	%% Int32 阵营
	camp = 0,
	%% Int32 种族
	race = 0,
	%% UInt32 职业
	career = 0,
	%% Int32 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt32 角色所在当前地图ID
	mapID = 0,
	%% UInt32 角色之前所在地图ID
	oldMapID = 0
}).

%% 
%% // 聊天消息(服务端发送)
-define(GS2U_Chat,14728).
-record(pk_GS2U_Chat,{
	%% Int32频道
	channel = 0,
	%% UInt64发送者ID
	uid = 0,
	%% String内容
	content = ""
}).

%% 
%% // 初始化数据发送完毕
-define(GS2U_GetPlayerInitDataEnd,11674).
-record(pk_GS2U_GetPlayerInitDataEnd,{
}).

%% 
%% // 进入地图信息
-define(GS2U_GotoNewMap,47351).
-record(pk_GS2U_GotoNewMap,{
	%% UInt16 角色所在当前地图ID
	map_id = 0,
	%% Single坐标X
	x = 0.0,
	%% Single坐标Y
	y = 0.0
}).

%% 
-define(GS2U_HearBeat,444).
-record(pk_GS2U_HearBeat,{
	%% UInt32
	now = 0
}).

%% 
-define(GS2U_KickByServer,17208).
-record(pk_GS2U_KickByServer,{
	%% String 1 心跳超时 (后面换成ErrorCode)
	reason = ""
}).

%% 
%% // 玩家外观信息
-define(GS2U_LookInfoPlayer,18166).
-record(pk_GS2U_LookInfoPlayer,{
	%% LookInfoPlayer
	player_list = []
}).

%% 
-define(GS2U_MonsterList,32656).
-record(pk_GS2U_MonsterList,{
	%% LookInfoMonster 视野范围内怪物列表
	monster_list = []
}).

%% 
%% // 测试用
-define(GS2U_PlayerInitBase,32262).
-record(pk_GS2U_PlayerInitBase,{
	%% UInt64 角色ID
	uid = 0,
	%% String 角色名
	name = "",
	%% Int32 等级
	level = 0,
	%% Int32 阵营
	camp = 0,
	%% Int32 种族
	race = 0,
	%% UInt32 职业
	career = 0,
	%% Int32 性别
	sex = 0,
	%% Int32 头
	head = 0,
	%% UInt32 角色所在当前地图ID
	mapID = 0,
	%% Int32
	combat_props = [],
	%% BuffInfo
	buff_list = [],
	%% SkillInfo
	skill_list = []
}).

%% 
-define(GS2U_RemoteMonster,57060).
-record(pk_GS2U_RemoteMonster,{
	%% UInt64唯一ID
	uid = 0,
	%% UInt32配置表ID
	did = 0,
	%% Int32等级	
	level = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
-define(GS2U_RemotePet,31693).
-record(pk_GS2U_RemotePet,{
	%% UInt64唯一ID
	uid = 0,
	%% UInt64主人
	owner = 0,
	%% UInt32配置表ID
	did = 0,
	%% Int32等级
	level = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
-define(GS2U_RemotePlayer,15687).
-record(pk_GS2U_RemotePlayer,{
	%% UInt64唯一ID
	uid = 0,
	%% Int32等级
	level = 0,
	%% String名字
	name = "",
	%% Int32职业
	career = 0,
	%% Int32种族
	race = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
%% //
-define(GS2U_RemoveRemote,31994).
-record(pk_GS2U_RemoveRemote,{
	%% UInt64
	uid_list = []
}).

%% 
%% // 移动
-define(GS2U_SyncStand,30047).
-record(pk_GS2U_SyncStand,{
	%% UInt64唯一ID
	uid = 0,
	%% UInt321 怪物；2 NPC 3 宠物 4 玩家
	type = 0,
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
%% // 移动
-define(GS2U_SyncWalk,3436).
-record(pk_GS2U_SyncWalk,{
	%% UInt64 唯一ID
	uid = 0,
	%% UInt321 怪物；2 NPC 3 宠物 4 玩家
	type = 0,
	%% Single坐标X
	src_x = 0.0,
	%% Single坐标Y
	src_y = 0.0,
	%% Single坐标X
	dst_x = 0.0,
	%% Single坐标Y
	dst_y = 0.0,
	%% Int32移动时间（毫秒）  
	move_time = 0,
	%% Single移动速度
	speed = 0.0
}).

-record(pk_LookInfoMonster,{
	%% UInt64
	uid = 0,
	%% UInt32 怪物 ID	
	did = 0,
	%% Single 怪物坐标
	x = 0.0,
	%% Single
	y = 0.0,
	%% Single旋转坐标W
	rotW = 0.0,
	%% Single 怪物移动的目标点X
	targetX = 0.0,
	%% Single 怪物移动的目标点Y
	targetY = 0.0,
	%% Single 怪物移动速度
	move_speed = 0.0,
	%% UInt32 当前血量百分比
	hp_per = 0,
	%% Int32 阵营
	camp = 0,
	%% UInt64 归属
	owner = 0,
	%% UInt64 怪物所属分组ID
	groupID = 0,
	%% UInt64 怪物所属军团ID
	guildID = 0,
	%% String 名字
	name = "",
	%% UInt32怪物等级
	level = 0
}).

-record(pk_LookInfoPlayer,{
	%% UInt64角色ID
	uid = 0,
	%% String名字
	name = "",
	%% Single坐标X
	x = 0.0,
	%% Single坐标Y
	y = 0.0,
	%% Int32 种族
	race = 0,
	%% UInt32职业
	career = 0,
	%% Int32 性别
	sex = 0,
	%% Int32阵营
	camp = 0,
	%% Int32头
	head = 0,
	%% Single移动速度
	move_speed = 0.0,
	%% Int32当前等级	
	level = 0,
	%% UInt32当前血量百分比
	hp_per = 0
}).

%% 
%% // 切地图
-define(U2GS_ChangeMap,4914).
-record(pk_U2GS_ChangeMap,{
	%% UInt32
	map_id = 0,
	%% Single
	x = 0.0,
	%% Single
	y = 0.0
}).

%% 
%% // 聊天消息(客户端发送)
-define(U2GS_Chat,11258).
-record(pk_U2GS_Chat,{
	%% Int32频道
	channel = 0,
	%% UInt64接收者ID
	receiver = 0,
	%% String内容
	content = ""
}).

%% 
-define(U2GS_ExitGame,62410).
-record(pk_U2GS_ExitGame,{
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% //<-发出去     ;      ->收消息
%% //不用使用int uint long 
%% // 支持使用 string float int32 uint32 int64 uint64
%% /////////////////////////////////////////////////////////////////////////
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long 
%% //不用使用int uint long
%% // 请求发送初始化数据
-define(U2GS_GetPlayerInitData,5543).
-record(pk_U2GS_GetPlayerInitData,{
}).

%% 
%% //
-define(U2GS_GetRemoteObjInfo,16443).
-record(pk_U2GS_GetRemoteObjInfo,{
	%% UInt64 唯一ID列表
	uids = []
}).

%% 
-define(U2GS_HearBeat,7246).
-record(pk_U2GS_HearBeat,{
}).

%% 
-define(U2GS_PlayerStopWalk,29978).
-record(pk_U2GS_PlayerStopWalk,{
	%% Single坐标X
	cur_x = 0.0,
	%% Single坐标Y
	cur_y = 0.0
}).

%% 
-define(U2GS_PlayerWalk,56544).
-record(pk_U2GS_PlayerWalk,{
	%% Single坐标X
	src_x = 0.0,
	%% Single坐标Y
	src_y = 0.0,
	%% Single坐标X
	dst_x = 0.0,
	%% Single坐标Y
	dst_y = 0.0
}).

-endif. %%NetmsgRecords
