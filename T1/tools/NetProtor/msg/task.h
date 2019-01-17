// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

//任务信息
struct taskInfo
{
	int taskID;
	int target；
	int curNumber;
	int maxNumber;
};

//请求接取任务(废弃)
struct U2GS_RequestAcceptTask ->
{
	int taskID;      //任务ID
	uint64 code;        //NPC编码
};

// 上交物品任务，请求上交物品
struct U2GS_RequestHandIn ->
{
	uint16	taskID;			// 任务ID
	uint16	itemID;			// 道具ID
	uint32	itemCount;	// 道具数量
	uint64	npcCode;		// NpcCode
};

// 同步家族/环任务状态
// 会优先刷新每日计数再同步该消息
// 每日计数类型29，ID0保持原有定义为轮数
// ID1为当前轮进度，ID2为免费刷新次数，ID3为付费刷新次数
struct LoopTaskState
{
	uint16		taskID;	// 任务ID
	uint8			state;	// 任务状态 0进行中 1已完成 2已放弃
	taskInfo	task;		// 任务数据（由于客户端没有区分任务类型来解析任务数据，故统一由服务端指定）
};
struct GS2U_SyncStateLoopTask <-
{
	vector<LoopTaskState>	list;		// 当前轮任务状态 时间降序
	uint8									state;	// 同步时机 0上线同步 1每日重置（可能是GM） 2领取任务 3完成任务 4放弃任务 5免费刷新 6付费刷新 7单次五星 8一键五星 9完成当前轮，并完成所有环任务（有奖） 10完成当前轮，但仅有部分环任务（没奖）
	uint8									allFive;// 当前轮是否是一键五星状态
};

// 请求接取家族/环任务
struct U2GS_RequestAcceptLoopTask ->
{
};

// 操作当前正在进行的家族/环任务
struct U2GS_RequestOperateLoopTask ->
{
	uint16	taskID;	// 任务ID
	uint8		opType;	// 操作码 0放弃 1免费刷新 2付费刷新 3单次五星 4一键五星 
};

// 请求一键完成家族/环任务
struct U2GS_RequestOneKeyLoopTask ->
{
  uint32  count;  // 想要一键完成多少个？0表示有多少完成多少
};

//子任务信息(废弃)
struct acceptedAimTask
{
	int aimType;     //子任务类型，如杀怪，采集等等
	int aimIndex;    //具体子任务类型下的数据，如：杀怪子任务为怪物ID，采集子任务为采集物ID
	int aimCurCount; //数量，如：杀怪子任务为杀怪数量，采集子任务为采集数量
};

//任务基础信息(废弃)
struct acceptedBaseTask
{
	int taskID;
	vector<acceptedAimTask> taskProcess;
};

//增加新接受任务(废弃)
struct GS2U_AddNewAcceptTask <-
{
	int taskID;
	int result;
};

//更新已接受任务信息(废弃)
struct GS2U_UpdateAcceptTask <-
{
	int result;
	acceptedBaseTask acceptTaskInfo;
};


//通知客户端校增加新完成任务(废弃)
struct GS2U_AddNewCompleteTask <-
{
	int result;
	int taskID;
};

//接受任务列表(废弃)
struct GS2U_AcceptTaskList <-
{
	vector<acceptedBaseTask> list;
};

//NPC对话任务请求
struct U2GS_TalkToNpc ->
{
	uint64 code;
};

//NPC对话任务结果
struct GS2U_TalkToNpcResult <-
{
	int result;
	uint64 code;
};

//采集对象请求
struct U2GS_CollectObj ->
{
	uint64 code;  //采集对象code
};

// 采集对象失败（客户端需要重置采集物状态以避免死锁）
struct GS2U_CollectObj_Failed <-
{
	uint64 code;	//采集对象code
};

//使用物品请求
struct U2GS_UseItemObj ->
{
	uint64 code;  //使用物品code
};

//任务重置
struct U2GS_ResetTask ->
{
	int taskID;
};

// 任务列表
struct GS2U_TaskList <-
{
	vector<taskInfo> list;
};

//接取任务
struct U2GS_AcceptTask ->
{
	int taskID;      //任务ID
	uint64 npcCode;  //NPC编码
};

//增加任务
struct GS2U_AcceptTask <-
{
	taskInfo info;
};

//更新任务信息
struct GS2U_UpdateTask <-
{
	taskInfo info;
};


//归还任务
struct U2GS_SumbitTask ->
{
	int taskID;
	uint64 code;
};

//放弃任务
struct U2GS_DropTask ->
{
	int taskID;
};

//触发任务buff
struct U2GS_TriggerTaskBuff ->
{
	int taskID;
};

//删除任务
struct GS2U_DeleteAcceptTask <-
{
	int taskID;
	int result;
};


//提交任务的信息
struct SubmittedTaskInfo
{
	uint16 slot;
	uint64 value;
};

//提交的任务占位列表，每一个uint64表示64个任务ID（按位表示），
//具体是多少依据占列表中的索引号来计算
struct GS2U_CompleteTaskList <-
{
	vector<SubmittedTaskInfo> list;
};