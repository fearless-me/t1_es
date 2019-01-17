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



// 0.多玩法公共协议
////////////////////////////////////////////////////////////////////

// 进入约会地下城
struct U2GS_DateEnter_Request ->
{
  uint8 id; // 玩法ID：1夺秒消除
};



// 1.夺秒消除玩法特有协议
////////////////////////////////////////////////////////////////////


// 角色在任意时间进入地图时收到的初始化消息
struct GS2U_DateLink_Welcome_Sync <-
{
  uint16          timeForBegin;   // 游戏前等待时间
  uint16          timeForEnd;     // 游戏中进行时间
  uint8           timePower;      // 多倍BUFF的持续时间（秒）
  vector<uint16>  listGem;        // 宝石的NpcID列表
  uint16          score;          // 当前游戏积分
  uint8           indexA;         // 当前玩家A选中的宝石序号
  uint8           indexB;         // 当前玩家B选中的宝石序号
  uint8           power;          // 当前获得积分的倍率
  uint8           resetCount;     // 手动重置宝石阵剩余次数
  vector<uint8>   listGemMatrix;  // 宝石阵（固定36长度，0表示没有，1表示有
  uint8           resetCD;        // 手动重置宝石阵的剩余时间
};

// 游戏结束后同步的结算消息
struct GS2U_DateLink_GameEnd_Sync <-
{
  uint8   reason; // 0分值达到上限；1时间结束；2玩家主动放弃
  uint8   time;   // 该时间（秒）后销毁地图
  uint16  score;  // 最终得分
  uint8   id; // 玩法ID
  bool    isAssist;			// 是否助战
};


// 重置宝石阵的同步消息（会重置玩家坐标到初始点）
//     该消息可能在游戏正式开始时创建宝石阵时收到
//         也可能在所有宝石被消除后创建新的宝石阵时收到
//         也可能在手动重置宝石阵成功时收到
struct GS2U_DateLink_ResetGem_Sync <-
{
  vector<uint16>  listGem;        // 宝石的NpcID列表
  uint8           resetCount;     // 手动重置宝石阵剩余次数
  uint8           resetCD;        // 手动重置宝石阵的剩余时间
  vector<uint8>   listGemMatrix;  // 宝石阵（固定36长度，0表示没有，1表示有
};

// 手动重置宝石阵请求
// 使用消息GS2U_DateLink_ResetGem_Sync进行反馈
struct U2GS_DateLink_ResetGem_Request ->
{
};


// 宝石的选中与取消请求
struct U2GS_DateLink_Select_Request ->
{
  float x;        // 客户端获取的角色坐标X
  float y;        // 客户端获取的角色坐标Y
  uint8 index;     // 目标宝石序号，从1开始到36
  bool  isSelect; // 选中还是取消
};

// 宝石的选中与取消反馈
struct GS2U_DateLink_Select_Ack <-
{
  uint64  roleID;   // 操作者角色ID
  uint8   index;    // 目标宝石序号，从1开始到36
  float   x;        // 目标宝石中心坐标X
  float   y;        // 目标宝石中心坐标Y
  bool    isSelect; // 选中还是取消
  vector<uint8>   listGemMatrix;  // 宝石阵（固定36长度，0表示没有，1表示有
};


// 发生连接的同步消息
struct GS2U_DateLink_Link_Sync <-
{
  uint8   indexA;   // 目标宝石A的序号
  float   xA;      // 目标宝石A的坐标X
  float   yA;      // 目标宝石A的坐标Y
  uint8   indexB;   // 目标宝石B的序号
  float   xB;      // 目标宝石B的坐标X
  float   yB;      // 目标宝石B的坐标Y
  uint8   combo;    // 当前连击计数（如果为0表示当前连接错误，大于0则为正确）
  uint8   comboMax; // 最大连击计数
  uint16  score;    // 本次连接产生的分值
  uint16  scoreAll; // 本次连接后积分总值
  vector<uint8>   listGemMatrix;  // 宝石阵（固定36长度，0表示没有，1表示有
};

// 积累连击产生的正面效果 之 立即增加分值
struct GS2U_DateLink_BuffAddScore_Sync <-
{
  uint16  score;    // 立即获得的分值
  uint16  scoreAll; // 获得分值后积分总值
};

// 积累连击产生的正面效果 之 持续时间内连接获得分值多倍
struct GS2U_DateLink_BuffPower_Sync <-
{
  uint8   time;     // 持续时间（秒）
  uint8   power;    // 倍率
};

// 积累连击产生的正面效果 之 增加移动速度等直接附加到角色身上的BUFF
struct GS2U_DateLink_BuffBuff_Sync <-
{
  uint16  buffID;   // 这是直接附加到角色身上的buffid
};

// 积累连击产生的正面效果 之 增加游戏时间
struct GS2U_DateLink_BuffAddTime_Sync <-
{
  uint16  timeAdd;        // 增加的时间（秒）
  uint16  timeRemainder;  // 剩余的游戏时间（秒）
};

// 错误连接产生的负面效果 之 减少移动就那个速度等直接附加到角色身上的BUFF
struct GS2U_DateLink_DeduffBuff_Sync <-
{
  uint16  buffID;   // 这是直接附加到角色身上的buffid
};


// 玩家主动放弃游戏
//     放弃成功时直接进入结算阶段
struct U2GS_DateLink_Giveup_Requset ->
{
};


// 同步主游戏阶段剩余时间，以修正因各种原因导致的界面倒计时与实际不符的情况
struct GS2U_DateLink_MainTime_Sync <-
{
  uint16  timeRemainder;  // 剩余的游戏时间（秒）
};


//------------推箱子协议-----------------------
// 与箱子发生碰撞协议
struct U2GS_DatePushBox_Request ->
{
  uint64  code;   // 箱子 CODE
  float   x;      // 箱子移动X
  float   z;      // 箱子移动Z
  bool  isDelete; //箱子是否移动到指定目标 后被删除
};

// 移动箱子是否成功的返回消息
struct GS2U_DatePushBox_Succeed_Sync <-
{
  bool  isSucceed;  // 是否移动成功
  bool  isDelete; //箱子是否移动到指定目标 后被删除
  uint64  code;   // 箱子 CODE
  float   x;      // 箱子移动X
  float   z;      // 箱子移动Z
  uint16  score;    // 立即获得的分值
};

// 角色在任意时间进入地图时收到的初始化消息
struct GS2U_DatePushBox_Welcome_Sync <-
{
  uint16          timeForBegin;   // 游戏前等待时间
  uint16          timeForEnd;     // 游戏中进行时间
  uint16          score;          // 当前游戏积分
  vector<uint8>   listGemMatrix;  // 宝石阵（固定36长度，0表示没有，1表示有

};

// 角色在任意时间进入地图时收到的初始化消息
struct GS2U_DatePushBox_GreateNPC_Sync <-
{
  uint64  code;   // 箱子 CODE
  float   x;      // 箱子移动X
  float   z;      // 箱子移动Z
  
};


// 重置箱子阵的同步消息（会重置玩家坐标到初始点）
//     该消息可能在游戏正式开始时创建宝石阵时收到
//         也可能在所有宝石被消除后创建新的宝石阵时收到
//         也可能在手动重置宝石阵成功时收到
struct GS2U_Date_ResetBox_Sync <-
{
  uint32 refreshNum;  //重置箱子的次数
};


//------------泳池派对协议-----------------------


// 角色在任意时间进入地图时收到的初始化消息
 struct GS2U_DatePoolShooting_Welcome_Sync <-
{
  uint16          timeForBegin;   // 游戏前等待时间
  uint16          timeForEnd;     // 游戏中进行时间
  uint16          score;          // 当前游戏积分
};

 struct GS2U_Date_ResetPoolShooting_Sync <-
{
   vector<uint8>   listPoolShootingPosIndex;  // 刷新水枪的 索引列表
};

 struct GS2U_Date_RefreshSocre_Sync <-
{
   uint16  score;    // 立即获得的分值
   bool  hitA;    // 玩家A是否被击中  0，未被击中>0击中
   bool  hitB;    // 玩家A是否被击中  0，未被击中>0击中
};


//     向服务器发送射击完的消息
struct U2GS_DateShooting_Over ->
{
	
};
//------------x寻找宝箱-----------------------

// 角色在任意时间进入地图时收到的初始化消息
 struct GS2U_DateFindTreasure_Welcome_Sync <-
{
  uint16          timeForBegin;   // 游戏前等待时间
  uint16          timeForEnd;     // 游戏中进行时间
  uint16          score;          // 当前游戏积分
};
// 刷新monster
 struct GS2U_Date_ResetFindTreasure_Sync <-
{
 
};

 struct GS2U_Date_FindTreasure_Sync <-
{
   uint16  score;    // 立即获得的分值
};

 // 播放动作
struct GS2U_Date_PlayerAnimation_Sync <-
{
};


struct DateMonsterPos
{
	 uint64  code;   //  CODE
	 float   x;      // 移动X
     float   z;      // 移动Z
}
 // Monster瞬移
struct GS2U_MonsterMoveSync <-
{
	 vector<DateMonsterPos>   monsterPosList;  // 所有MONSTER坐标
};

