// -> client to server
// <- server to client
// <-> client & server
// 不推荐使用 <->

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// _Request 表示客户端向服务端进行请求
// _Ack      表示服务端对客户端请求的反馈
// _Ask      表示服务端向客户端询问
// _Reply    表示客户端对服务端询问的反馈
// _Sync    表示即便客户端没有向服务端进行请求，服务端也可能主动发送该消息以同步信息

/////////////////////////////////////////////////////////////////////////////////////
// 新版好友系统协议 20161110 begin

// 最精简的好友相关角色信息
struct Friend2InfoSimple
{
  uint64            id;                   // 角色ID
  string            name;                 // 姓名
  uint16            level;                // 等级
  uint32            career;               // 职业
  uint8             race;                 // 种族
  uint8             sex;                  // 性别
  int32             head;                 // 头
  uint16            frameID;              // 头像框
};

// 好友系统基础信息
// 可用于临时好友、黑名单、申请者
struct Friend2InfoBase
{
  Friend2InfoSimple simple;
  uint64            code;                 // 对象唯一码，不在线时为0
  vector<uint8>     face;                 // 自定义头像MD5(16byte)
  uint8             vipLv;                // VIP等级
  string            familyName;            // 家族名
  uint64            force;                // 战力值
  uint32            timeRelation;          // 达成指定关系的时间
  uint32            timeLastOnline;        // 最后一次在线的时间
  uint32            timeLastInteractive;  // 最后一次交互的时间
  uint32            like;                 // 赞
  uint32            charm;                 // 魅力
  bool              isGiveLike;           // 当日是否向该好友点赞
  bool              isBeGiveLike;         // 当日该好友是否给我点赞
  bool              isMarried;            // 是否已婚
  float             distance;             // 距离
};

// 正式的好友信息
struct Friend2InfoFormal
{
  Friend2InfoBase   base;                 // 基础信息
  uint32            closeness;            // 亲密度（友好度）
  bool              isGiveAP;             // 当日是否向该好友赠送了行动点（体力值）
  bool              isGainAP;             // 当日是否从该好友接受了行动点（体力值）
  bool              isBeGiveAP;           // 当日该好友是否赠送给我了行动点（体力值）
  bool              isBeGainAP;           // 当日该好友是否接受了我的行动点（体力值）
};

/////////////////////////////////////////////////////////////////////////////////////

// 请求精简的角色信息列表
struct U2GS_Friend2SimpleList_Requets ->
{
  uint8   type; // 0正式好友1临时好友2黑名单3申请列表
};

// 反馈精简的角色信息列表
struct GS2U_Friend2SimpleList_Ack <-
{
  uint8                     type;     // 0正式好友1临时好友2黑名单3申请列表
  uint16                    count;    // 信息总量
  uint16                    index;    // 当前消息包索引号
  vector<Friend2InfoSimple> listInfo; // 信息
};

/////////////////////////////////////////////////////////////////////////////////////

// 搜索好友请求
struct U2GS_Friend2Search_Request ->
{
  string  name; // 姓名
};

// 反馈搜索好友
struct GS2U_Friend2Search_Ack <-
{
  vector<Friend2InfoBase> listInfo; // 搜索结果
};

// 带有限制的搜索好友请求
struct U2GS_Friend2LimitSearch_Request ->
{
  string  name; // 姓名
};

/////////////////////////////////////////////////////////////////////////////////////

// 推荐好友请求
struct U2GS_Friend2Recommend_Request ->
{
  uint8   sex;    // 指定具体性别
  bool    isNear; // 是否按照就近距离进行排序
  bool    isPush; // 是否是定时推送推荐好友，是否的区别在于反馈的数量不同
};

// 反馈推荐好友
struct GS2U_Friend2Recommend_Ack <-
{
  vector<Friend2InfoBase> listInfo; // 推荐名单
  bool    isPush; // 是否是定时推送推荐好友
};

/////////////////////////////////////////////////////////////////////////////////////

// 添加好友请求
struct U2GS_Friend2Add_Request ->
{
  uint64  id; // 角色ID
};

// 需要添加的好友在黑名单中
// 服务端询问客户端是否要将该角色从黑名单移除
struct GS2U_Friend2AddFromBlack_Ask <-
{
  uint64  id;   // 角色ID
  string  name; // 姓名
};

// 反馈是否将黑名单中的角色移除并添加好友
struct U2GS_Friend2AddFromBlack_Reply ->
{
  uint64  id;         // 角色ID
  bool    isAgreed;   // 是否同意
};

/////////////////////////////////////////////////////////////////////////////////////

// 查询好友申请列表请求
struct U2GS_Friend2Applicant_Request ->
{
  uint8   page;  // 页码
};

// 同步好友申请列表_重置
struct GS2U_Friend2ApplicantReset_Sync <-
{
  uint16                    count;    // 申请者总量
  uint8                     page;     // 当前信息页码
  vector<Friend2InfoBase>   listInfo; // 当前页信息列表
};

/////////////////////////////////////////////////////////////////////////////////////

// 处理好友申请请求
struct U2GS_Friend2ApplicantUse_Request ->
{
  uint64  id;         // 角色ID
  bool    isAgreed;   // 是否同意
};

// 一键处理好友申请请求
struct U2GS_Friend2ApplicantUseOneKey_Request ->
{
  bool    isAgreed;   // 是否同意
};

/////////////////////////////////////////////////////////////////////////////////////

// 删除好友请求
struct U2GS_Friend2Del_Request ->
{
  uint64  id; // 角色ID
};

/////////////////////////////////////////////////////////////////////////////////////

// 查询好友列表请求
struct U2GS_Friend2Formal_Request ->
{
  uint8   page;  // 页码
};

// 同步好友列表_重置
struct GS2U_Friend2FormalReset_Sync <-
{
  uint16                      count;    // 好友总量
  bool                        hasAP;    // 是否有未领取的行动点（体力值）
  uint8                       page;     // 当前信息页码
  vector<Friend2InfoFormal>   listInfo; // 当前页信息列表
};

/////////////////////////////////////////////////////////////////////////////////////

// 查询临时好友列表请求
struct U2GS_Friend2Temp_Request ->
{
  uint8   page;  // 页码
};

// 同步临时好友列表_重置
struct GS2U_Friend2TempReset_Sync <-
{
  uint16                    count;    // 临时好友总量
  uint8                     page;     // 当前信息页码
  vector<Friend2InfoBase>   listInfo; // 当前页信息列表
};

/////////////////////////////////////////////////////////////////////////////////////

// 查询黑名单列表请求
struct U2GS_Friend2Black_Request ->
{
  uint8   page;  // 页码
};

// 同步黑名单列表_重置
struct GS2U_Friend2BlackReset_Sync <-
{
  uint16                    count;    // 黑名单总量
  uint8                     page;     // 当前信息页码
  vector<Friend2InfoBase>   listInfo; // 当前页信息列表
};

/////////////////////////////////////////////////////////////////////////////////////

// 加入黑名单请求
struct U2GS_Friend2Ban_Request ->
{
  uint64  id;   // 角色ID
};

// 黑名单已达上限
// 服务端询问客户端是否要将最早的黑名单移除
struct GS2U_Friend2BanWithUnban_Ask <-
{
  uint64  id;   // 角色ID
  string  name; // 姓名
};

// 反馈是否将最早的黑名单移除并继续拉黑指定角色
struct U2GS_Friend2BanWithUnban_Reply ->
{
  uint64  idUnban;    // 需要移除黑名单的角色ID
  uint64  idBan;      // 需要加入黑名单的角色ID
  bool    isAgreed;   // 是否同意
};

// 将要加入黑名单的人是好友
// 服务端询问客户端是否要将与该好友解除关系
struct GS2U_Friend2BanFromFormal_Ask <-
{
  uint64  id;   // 角色ID
  string  name; // 姓名
};

// 反馈是否将指定角色从好友移除并加入到黑名单
struct U2GS_Friend2BanWithDel_Reply ->
{
  uint64  id;         // 角色ID
  bool    isAgreed;   // 是否同意
};

// 服务端询问客户端是否将最早的黑名单移除，并与指定角色解除好友关系再将其拉黑
// 黑名单满的情况下拉黑好友
struct GS2U_Friend2BanWithUnbanAndDel_Ask <-
{
  uint64  idUnban;   // 角色ID 需要移除黑名单
  string  nameUnban; // 姓名   需要移除黑名单
  uint64  idDel;     // 角色ID 需要删除并拉黑的好友
  string  nameDel;   // 姓名   需要删除并拉黑的好友
};

// 反馈是否将最早的黑名单移除，并与指定角色解除好友关系再将其拉黑
// 黑名单满的情况下拉黑好友
struct U2GS_Friend2BanWithUnbanAndDel_Reply ->
{
  uint64  idUnban;   // 角色ID 需要移除黑名单
  uint64  idDel;     // 角色ID 需要删除并拉黑的好友
  bool    isAgreed;  // 是否同意
};


/////////////////////////////////////////////////////////////////////////////////////

// 移除黑名单请求
struct U2GS_Friend2Unban_Request ->
{
  uint64  id;   // 角色ID
};

/////////////////////////////////////////////////////////////////////////////////////

// 好友周边功能
// 点赞0;赠送AP1;接受AP2;传送3
struct U2GS_Friend2FormalOP_Request ->
{
  uint64   id;      // 角色ID
  uint8    opType;  // 操作类型
};

// 点赞成功回执
struct GS2u_Friend2Like_Ack <-
{
  uint64    id;     // 角色ID
  string    name;   // 角色名
  uint32    like;   // 当前赞值
};

// 友好度变动提示
struct GS2U_Friend2ClosenessChange_Sync <-
{
  uint64    id;         // 角色ID
  uint32    closeness;  // 当前友好度
};

// 双方结为好友的专用协议
struct GS2U_Friend2MakeFormal_Sync <-
{
  uint64    id;         // 角色ID
};

/////////////////////////////////////////////////////////////////////////////////////

// 好友消息（C2S）
struct U2GS_Friend2FormalChat_Request ->
{
  uint64    receiverID; // 接受者角色ID
  string    content;    // 内容
  uint32    time;       // 时间戳
};

// 好友消息反馈（S2C） <-
struct GS2U_Friend2FormalChat_Ack <-
{
  uint64    senderID;   // 发送者角色ID
  uint64    receiverID; // 接受者角色ID
  uint32    time;       // 时间戳
  string    content;    // 内容
  uint8     relation;   // 双方关系
};

/////////////////////////////////////////////////////////////////////////////////////

// 好友语音（C2S）
struct U2GS_Friend2FormalChatVoice_Request ->
{
  uint64            receiverID;   // 接受者角色ID
  uint32            time;         // 时间戳
  float             duration;     // 音频总时长
  uint8             count;        // 消息段数
  uint8             index;        // 分段索引
  vector<uint8>     data;         // 音频数据
};

// 好友语音反馈给发送方（S2C）
struct GS2U_Friend2FormalChatVoice_AckS <-
{
  uint64    senderID;   // 发送者角色ID
  uint64    receiverID; // 接受者角色ID
  uint32    time;       // 时间戳
};

// 好友语音反馈给接收方（S2C）
struct GS2U_Friend2FormalChatVoice_AckR <-
{
  uint64            senderID;     // 发送者角色ID
  uint64            receiverID;   // 接受者角色ID
  uint32            time;         // 时间戳
  float             duration;     // 音频总时长
  uint8             count;        // 消息段数
  uint8             index;        // 分段索引
  vector<uint8>     data;         // 音频数据
  uint8             relation;     // 双方关系
};

/////////////////////////////////////////////////////////////////////////////////////

// 查看信息面板辅助信息请求
struct U2GS_Friend2ForLook_Request ->
{
  uint64  id;   // 角色ID
};

// 查看信息面板辅助信息反馈
struct GS2U_Friend2ForLook_Ack <-
{
  uint64  id;           // 角色ID
  string  name;         // 角色名
  uint8   relation;     // 0正式好友1临时好友2黑名单3申请列表4陌生人5跨服好友
  uint32  like;         // 收到的赞
  bool    isGiveLike;   // 是否已点赞
  uint16  level;        // 等级
  uint32  charm;        // 魅力值
};

/////////////////////////////////////////////////////////////////////////////////////

// 希望向某人发起好友聊天
struct U2GS_Friend2WantChat_Request ->
{
  uint64  id;           // 角色ID
};

// 反馈希望聊天
struct GS2U_Friend2WantChat_Ack <-
{
  // 反馈数据1，目标角色信息
  uint64          id;    // 角色ID
  Friend2InfoBase info;  // 仅当目标角色为陌生人时有效
  
  // 反馈数据2，当前角色与目标角色的关系
  uint8   relation;     // 0正式好友1临时好友2黑名单4陌生人5跨服好友
  
  // 反馈数据3，对应反馈数据2的好友相关信息列表（若为正式好友、临时好友、黑名单这3种，非空时必然包含目标用户）（如果relation是4，则该列表为临时好友）
  uint16                      count;    // 总量，相关列表总长度
  bool                        hasAP;    // 是否有未领取的行动点（体力值），仅对正式好友列表有效，默认false
  uint8                       page;     // 当前信息页码
  vector<Friend2InfoFormal>   listInfo; // 当前页信息列表

  // 反馈数据4，若relation=5，客户端本地必然有缓存的跨服好友数据，不需要额外的数据发放
};

/////////////////////////////////////////////////////////////////////////////////////


// 查询好友列表请求（求婚界面）
struct U2GS_Friend2FormalForMarriage_Request ->
{
  uint8   page;  // 页码
};

// 同步好友列表（按求婚界面要求排序）
struct GS2U_Friend2FormalForMarriage_Sync <-
{
  uint16                      count;    // 好友总量
  bool                        hasAP;    // 是否有未领取的行动点（体力值）
  uint8                       page;     // 当前信息页码
  vector<Friend2InfoFormal>   listInfo; // 当前页信息列表
};

/////////////////////////////////////////////////////////////////////////////////////


// 废弃，使用player.h中的U2GS_LBS_Request
//// 更新自己的经纬度
//// 弧度值
//struct U2GS_Friend2LBS_Request ->
//{
//  float     longitude;  // 经度
//  float     latitude;   // 纬度
//};

// 新版好友系统协议 20161110 end
/////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////////////
// 跨服好友协议 20170808 begin


/////////////////////////////////////////////////////////////////////////////////////

// 跨服好友个人信息
struct Friend2InfoCross
{
  uint64            id;                   // 角色ID
  string            name;                 // 姓名
  string            server;               // 所在服名
  uint16            level;                // 等级
  uint32            career;               // 职业
  uint8             race;                 // 种族
  uint8             sex;                  // 性别
  int32             head;                 // 头
  uint16            frameID;              // 头像框
  vector<uint8>     face;                 // 自定义头像MD5(16byte)
  uint32            timeRelation;         // 达成指定关系的时间
  uint32            timeLastOnline;       // 最后一次在线的时间
  uint32            timeLastInteractive;  // 最后一次交互的时间
  uint8             whereis;              // 0不在线 1在普通服 2在跨服
};

// 上线（登录跨服或登录普通服）时同步跨服好友列表与跨服申请者列表
struct GS2U_Friend2CrossInit_Sync <-
{
  vector<Friend2InfoCross>  listCross;    // 跨服好友列表
  vector<Friend2InfoCross>  listApply;    // 跨服申请者列表
};

// 请求完整的列表
struct U2GS_Friend2CrossAll_Request ->
{
  uint8   type;   // 0跨服好友列表 1跨服申请者列表
};

// 反馈完整的列表
struct GS2U_Friend2CrossAll_Sync <-
{
  uint8                     type;       // 0跨服好友列表 1跨服申请者列表
  vector<Friend2InfoCross>  listAll;    // 全列表
};

/////////////////////////////////////////////////////////////////////////////////////
// 添加好友

// A向B请求添加好友
struct U2GS_Friend2CrossAdd_Request ->
{
  uint64  id;   // 角色ID
};

// ErrorCode反馈A申请成功

// 向B推送跨服申请者列表变化
struct GS2U_Friend2CrossAdd_Sync <-
{
  Friend2InfoCross  info;        // 新的申请者信息
  vector<uint64>    listDel;     // 因为列表长度限制需要删除的申请者ID
};

// B同意或拒绝跨服好友申请
// 另：若此时B使用U2GS_Friend2CrossAdd_Request请求添加A为好友，则等价于同意
struct U2GS_Friend2CrossAdd2_Request ->
{
  uint64  id;         // 角色ID，该值为0表示一键拒绝所有
  bool    isAgreed;   // 是否同意
};

// 拒绝跨服好友申请，或同意跨服好友申请却失败时，仅向B反馈跨服申请者列表变化
struct GS2U_Friend2CrossAdd2Failed_Ack <-
{
  uint32            reason;   // 6130拒绝成功 6127已经是好友 6131好友列表满 6132对方好友列表满 6133同步数据校正
  vector<uint64>    listDel;
};

// 同意跨服好友申请并成功时，向双方反馈跨服好友列表变化（B需要自行处理跨服申请者列表变化）
struct GS2U_Friend2CrossAdd2_Ack <-
{
  Friend2InfoCross  info;        // A会收到B的信息，B会收到A的信息
};

/////////////////////////////////////////////////////////////////////////////////////
// 删除好友

// A请求删除好友B
// 等价于A删除角色
struct U2GS_Friend2CrossDel_Request ->
{
  uint64  id;   // 角色ID
};

// 反馈删除成功
struct GS2U_Friend2CrossDel_Ack <-
{
  uint64  id;     // 角色ID
  bool    isFix;  // 是否是数据同步校正（非用户主动操作）
};

跨服好友找回
//////////////////////////////////////////////////////////////////////////////////////
// 找回的跨服好友个人信息
struct Friend2GetBackInfo
{
  uint64            id;                   // 角色ID
  string            name;                 // 姓名
  uint16            level;                // 等级
  uint32            career;               // 职业
  uint8             race;                 // 种族
  uint8             sex;                  // 性别
  int32             head;                 // 头
  uint64            force;                // 战力值
  vector<uint8>     face;                 // 自定义头像MD5(16byte)
};

// 进游戏的时候会发 U2GS_Friend2GetBack_OneKeyToAdd后也会发
struct GS2U_Friend2GetBack_SyncInfo <-
{
  vector<Friend2GetBackInfo> getBackList;
};

// 忽略该好友 
struct U2GS_Friend2GetBack_Ignore ->
{
  uint64  id; // 角色ID
};

// 忽略该好友返回
struct GS2U_Friend2GetBack_IgnoreRet <-
{
  uint64  id; // 角色ID
};

// 添加一个好友
struct U2GS_Friend2GetBack_Add ->
{
  uint64  id; // 角色ID
};

// 添加一个好友返回
struct GS2U_Friend2GetBack_AddRet <-
{
  uint64  id; // 角色ID
};

// 这个消息 处理后 服务器下发:GS2U_Friend2GetBack_SyncInfo
// 一键添加
struct U2GS_Friend2GetBack_OneKeyToAdd ->
{
};

/////////////////////////////////////////////////////////////////////////////////////
// 跨服好友聊天

// 参考好友聊天的以下协议
// U2GS_Friend2FormalChat_Request
// GS2U_Friend2FormalChat_Ack
// U2GS_Friend2FormalChatVoice_Request
// GS2U_Friend2FormalChatVoice_AckS
// GS2U_Friend2FormalChatVoice_AckR
// 注意以下协议用于点开目标面板时，根据与目标的不同关系显示不同按钮，新增relation=5表示跨服好友
// U2GS_Friend2WantChat_Request
// GS2U_Friend2WantChat_Ack
// U2GS_Friend2ForLook_Request
// GS2U_Friend2ForLook_Ack

// 跨服好友协议 20170808 end
/////////////////////////////////////////////////////////////////////////////////////
