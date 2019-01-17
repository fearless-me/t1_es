// -> client to server
// <- server to client
// <-> client & server
// 不推荐使用 <->

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// _Request 表示客户端向服务端进行请求
// _Ack			表示服务端对客户端请求的反馈
// _Ask			表示服务端向客户端询问
// _Reply		表示客户端对服务端询问的反馈
// _Sync		表示即便客户端没有向服务端进行请求，服务端也可能主动发送该消息以同步信息

/////////////////////////////////////////////////////////////////////////////////////

// 同步姻缘基本信息（上线后会同步，后面会在变化时同步）
struct GS2U_MarriageBaseInfo_Sync <-
{
  uint64  id;           // 配偶角色ID（无配偶时为0）
  string  name;         // 配偶角色姓名
  uint8   sex;          // 配偶性别
  uint32  weddingDay;   // 结婚时间（服务器同步时间，自1970-01-01至今的秒数）
  uint32  closeness;    // 亲密度
};

/////////////////////////////////////////////////////////////////////////////////////

// 求婚请求
struct U2GS_MarriagePropose_Request ->
{
  uint64  id;         // 对方角色ID
  uint32  item;       // 求婚者使用道具ID
  string  manifesto;  // 求婚宣言
};

// 成功发送求婚请求的反馈，用于客户端刷新界面
struct GS2U_MarriageProposeRefresh_Ack <-
{
};

// 询问目标是否接受求婚请求
struct GS2U_MarriagePropose_Ask <-
{
  uint64  id;         // 求婚者角色ID
  string  name;       // 求婚者角色姓名
  uint32  item;       // 求婚者使用道具ID
  string  manifesto;  // 求婚宣言
};

// 目标反馈是否接受求婚请求
struct U2GS_MarriagePropose_Reply ->
{
  uint64  id;         // 求婚者角色ID
  bool    isAgreed;   // 是否同意
};

// 反馈求婚结果（成功时反馈双方，失败时仅反馈求婚者）
struct GS2U_MarriagePropose_Ack <-
{
  uint64  id;         // 求婚者（或被求婚者）角色ID
  string  name;       // 求婚者（或被求婚者）角色姓名
  uint32  item;       // 求婚者使用道具ID
  bool    isS;        // 是否成功
};

/////////////////////////////////////////////////////////////////////////////////////

// 申请（或确认）离婚请求
struct U2GS_MarriageBreak_Request ->
{
  bool  isTeam;  // 是否为协议离婚
};

// 申请（或确认）离婚反馈
struct GS2U_MarriageBreak_Ack <-
{
  uint64  id;     // 对方角色ID
  string  name;   // 对方角色姓名
};

/////////////////////////////////////////////////////////////////////////////////////

// 夫妻技能升级请求
struct U2GS_MarriageSkillUp_Request ->
{
  uint32  cost;   // 消耗亲密度
  uint32  id;     // 升级的目标技能槽位
};

// 夫妻技能升级反馈
struct SkillInfoForMarraige
{
  uint32  id;   // 技能槽位ID
  uint32  exp;  // 技能槽位经验
};
struct GS2U_MarriageSkillUp_Ack <-
{
  SkillInfoForMarraige skill;
  uint32  lvOld;  // 旧有等级
  uint32  lvNew;  // 新的等级
  uint32  expOld; // 旧有经验
};

// 同步夫妻技能信息
struct GS2U_MarriageSkill_Sync <-
{
  vector<SkillInfoForMarraige> listSkill;
};

/////////////////////////////////////////////////////////////////////////////////////

// 婚戒升级及突破请求
struct U2GS_MarriageRingUp_Request ->
{
  uint32  cost;   // 消耗亲密度（为0时突破）
};

// 婚戒升级及突破同步（上线后会同步，后面会在变化时同步）
struct GS2U_MarriageRingUp_Sync <-
{
  uint32  topOld;  // 旧有突破次数
  uint32  expOld;  // 旧有婚戒经验
  uint32  lvOld;   // 旧有婚戒等级
  uint32  topNew;  // 新的突破次数
  uint32  expNew;  // 新的婚戒经验
  uint32  lvNew;   // 新的婚戒等级
};

// 伴侣的婚戒升级及突破同步（上线后会同步，后面会在变化时同步）
// 为避免显示混乱，不在客户端显示伴侣婚戒加成的具体属性
// 该协议已废弃
struct GS2U_MarriageRingUpPartner_Sync <-
{
  uint32  topOld;  // 旧有突破次数
  uint32  expOld;  // 旧有婚戒经验
  uint32  lvOld;   // 旧有婚戒等级
  uint32  topNew;  // 新的突破次数
  uint32  expNew;  // 新的婚戒经验
  uint32  lvNew;   // 新的婚戒等级
};

/////////////////////////////////////////////////////////////////////////////////////

// 接受情缘任务（任务ID由系统自动分配）
struct U2GS_MarriageAcceptTask_Request ->
{
};

// 提交情缘任务（任务ID由系统自己找）
struct U2GS_MarriageSubmitTask_Request ->
{
};

/////////////////////////////////////////////////////////////////////////////////////
// 交接情缘任务时，可能需要提示队长是否要拉队员到附近
// 发动条件：其余条件皆满足，同地图ID但不同线路

// 询问队长是否要召唤队员
struct GS2U_MarriageTask_Together_Ask1 <-
{
	uint64	roleID;		// 伴侣ID
	string	roleName;	// 伴侣名
};
// 队长回复是否同意（可能失败，对队长有CD的ErrorCode）
struct U2GS_MarriageTask_Together_Reply1 ->
{
	bool	isAgreed;	// 是否同意
};
// 队长如果同意就要去问队员是否同意
struct GS2U_MarriageTask_Together_Ask2 <-
{
	uint64	roleID;		// 伴侣ID
	string	roleName;	// 伴侣名
};
// 队员回复是否同意（可能失败，对队员有超时的ErrorCode）
struct U2GS_MarriageTask_Together_Reply2 ->
{
	bool	isAgreed;	// 是否同意
};


//婚礼~~~~~~~~~~~~~~~~~~~~~~~~~~~

//请帖 婚书
struct KetubbaData
{
	 uint64            roleId;                   //婚礼预约人
	 uint64            partnerRoleId;            //伴侣
	 uint64            startTime;   //相对于1970年的绝对时间哈
	 uint64            itemUID;     //对应背包里面 请帖UID
	 uint8             type;        // type =1 客人，type =2婚礼主人
	 string            name;
	 string            partnerName;
	 uint8             weddingState; //婚礼状态,1预约，2进行中，3已结束
}
//邀请人数据
struct InvitedPlayerData
{
	 uint64            roleId;                   // 角色ID
	 string            name;                 // 姓名
	 uint16            level;                // 等级
	 uint32            career;               // 职业
	 uint8             race;                 // 种族
	 uint8             sex;                  // 性别
	 int32             head;                 // 头
	 uint32            giveGiftsID;//彩礼ID
}
// 预约婚礼
struct U2GS_appointmentWedding ->
{
	uint64 startTime;   //相对于1970年的绝对时间哈
	uint8  level;      //预约档次
}

struct GS2U_AppointmentWeddingResult <-
{
	bool	result;	// 是否成功
};

// 邀请
struct U2GS_InvitedPerson ->
{
	uint64 invitedPerson;   //邀请人ID
}

struct GS2U_InvitedPersonResult <-
{
	bool	result;	// 是否成功
	InvitedPlayerData data;
};
//上线登录发所有请帖
struct GS2U_LoginInitWeddingKetubba <-
{
	vector<KetubbaData>  ketubbaList;  //登录时候发送婚书请帖对应道具数据

};
//在线同步收到的请帖
struct GS2U_receivedInvitationCard <-
{
	KetubbaData  ketubba;  //登录时候发送婚书请帖对应道具数据

};
// 打开婚书或者请帖
struct U2GS_Openketubba ->
{
	 uint64            itemUID; // 目标ID
	 uint8             type;  //1客人，2主人{包括对象也算}
}
//在线同步收到的请帖
struct GS2U_OpenketubbaResult <-
{
	uint64                     roleId;                   // 目标ID
	uint8                      type;  //1客人，2主人{包括对象也算}
	uint32                     givegifts;   //非绑
	uint32                     bindGivegifts;   //绑钻
	vector<InvitedPlayerData>  givegiftsList;  //彩礼信息，主人才有，客人发[]空
	bool                       isGivegifs;  //0 没送 1送了
	uint8                      level;  //婚礼档次

};
// 送彩礼
struct U2GS_Givegifs ->
{
	 uint64             roleId; // 目标ID
	 uint16             gifts;  //彩礼
}
//在线同步收到的请帖
struct GS2U_GivegifsResult <-
{
	
  uint64                 sendRoleID;  //赠送ID	
  bool	            	 result;	// 是否成功
  uint32                     givegifts;   //非绑
  uint32                     bindGivegifts;   //绑钻
  uint32            	 giveGiftsID;//彩礼ID
  InvitedPlayerData      givegiftsData;  // 主人才有，客人为空
};

// 打开邀请面板
struct U2GS_OpenInvitePanel ->
{
	 
}

//打开返回
struct GS2U_OpenInvitePanelResult <-
{
	vector<InvitedPlayerData>  invitedPlayerList;  //已经邀请的数据

};


//婚礼时间到邀请所有人进入场景
struct GS2U_WeddingStartInviteAll <-
{
	 uint64            targetRoleID; //目标ID
	 string            name;
	 string            partnerName;

};

// 进入婚礼地图
struct U2GS_EnterWeddingMap ->
{
	 uint64  targetRoleID; //目标ID
}

//婚礼进行中地图的阶段
struct GS2U_WeddingMapPhase <-
{
	 uint8         phase; //阶段1自由活动，阶段2婚礼仪式，不准骚操作，阶段3自由活动，阶段4婚礼结束倒计时提前20秒给客服端发消息弹结束界面，5销毁地图
	 uint32        phase1Time;   //每个阶段时间
	 uint8         sex_1; //性别
	 uint8         sex_2; //性别
	 uint8         weddingLevel; //婚礼档次
	 string        name_1;
	 string        name_2;
};




//交互的NPC数据
struct SitNpcData
{
	 uint64 npcCode; //交互的CODE
	 uint64 sitRoleID;  //坐上的玩家  >0 有人，否则 没人
	 float npcX;
	 float npcY;
	 
}

//使用NPC交互
struct U2GS_UseNpcInteractive ->
{
	 bool isUp;  //true坐上，false下车
	 uint64 npcCode; //交互的CODE
	
	
}

//婚礼进行中地图的阶段
struct GS2U_UseNpcInteractiveReuslt <-
{
	 bool isUp;  //true坐上，false下车
	 SitNpcData npcSitData;//交互
	
};

//玩家进入场景
struct GS2U_PlayerEnterMapSucc <-
{
	vector<SitNpcData> sitNpcDataList; //进入场景发送交互的数据
	uint64             weddingRoleID; //新人ID
	uint32             lastTime;     //婚礼剩余时间，秒为单位
};


//婚礼新人删除角色，切婚礼正在进行中
struct GS2U_PlayerDeletRoleInWedding <-
{
	
};

//购买福袋
struct U2GS_BuyLuckyBag ->
{
	 uint64  roleID; //新人ID
	 uint8   level;  //档次
}

//购买福袋返回
struct GS2U_BuyLuckyBagResult <-
{
	 uint8                      level;  //档次
	 uint32                     givegifts;   //非绑
	 uint32                     bindGivegifts;   //绑钻
	 string                     roleName; 
	 uint32                     rewardItemID;//奖励ID
	 uint16                     num;
};

//婚礼抽奖
struct U2GS_WeddingLottery ->
{
	 uint64  roleID; //新人ID
	 uint8   level;  //消耗类型,1,和2
}

//抽奖返回 
struct GS2U_WeddingLotteryResult <-
{
	 uint8                      lotteryIndex;  //抽中的下标索引
	 uint8                      costType;//消费类型
	 uint32                     givegifts;   //非绑
	 uint32                     bindGivegifts;   //绑钻
	 string                     roleName; 
	 uint32                     rewardItemID;//奖励ID
	 uint16                     num;
};


//----婚礼红包

struct RobRedData
{
	 uint64            roleId;                   // 角色ID
	 string            name;                 // 姓名
	 uint16            level;                // 等级
	 uint32            career;               // 职业
	 uint8             race;                 // 种族
	 uint8             sex;                  // 性别
	 int32             head;                 // 头
	 uint16            robNum;               //抢了好多钱 新月币
	 uint16            useTime;                // 抢红包的时间，最短最快
}

//婚礼红包状态
struct GS2U_WeddingRedState <-
{
	bool isCanRobRed;  //收到true 可以抢红包，把红包按钮显示出来，false结束或者没开始隐藏按钮
	uint64  roleID; //新人ID
};
//抢红包
struct U2GS_RobWeddingRed ->
{
	 uint64  roleID; //新人ID
}
//抢红包返回
struct GS2U_RobWeddingRedResult <-
{
	uint   result;//1抢成功,2已经抢过了,3已经抢完了
	uint64  roleID; //新人ID
	uint16            robNum;               //自己抢了好多钱新月币
	vector<RobRedData> listRobRedData;    //抢了红包的所有数据
};
//----婚礼红包 OVER




