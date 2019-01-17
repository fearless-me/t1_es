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
// 

/////////////////////////////////////////////////////////////////////////////////////

// MD5码
struct MD5
{
  vector<uint8> md5;
};

// 查询身份证信息
struct U2GS_Identity_Request ->
{
	uint64					id;				      // 角色ID
};

// 反馈身份证信息
struct GS2U_Identity_Ack <-
{
  uint64          id;             // 角色ID
  uint64          code;           // 对象唯一码，不在线时为0
  string          name;           // 姓名
  uint16          level;          // 等级
  uint32          career;         // 职业
  uint8           race;           // 种族
  uint8           sex;            // 性别
  uint8           vipLv;          // VIP等级
  uint32          like;           // 赞
  uint32          charm;          // 魅力值
  bool            isGiveLike;     // 当日是否向该角色点赞
  string          familyName;     // 家族名
  uint8           idi_age;        // 年龄，默认值255表示未设置。取值参考globalsetup.identity_age_limit
  uint8           idi_birthmonth; // 出生月，默认值0表示未设置
  uint8           idi_birthday;   // 出生日，默认值0表示未设置
  uint8           idi_zodiac;     // 星座，默认值0表示未设置。
                                  // 从1到12依次为：白羊金牛双子巨蟹狮子处女天秤天蝎射手摩羯水瓶双鱼
  uint8           idi_bloodType;  // 血型，默认值0表示未设置。
                                  // 从1到4依次为：A、B、AB、O
  uint8           idi_hometown1;  // 故乡信息1，默认值0表示未设置。取值参考identity_area.id1
  uint8           idi_hometown2;  // 故乡信息2，默认值0表示未设置。取值参考identity_area.id2
  uint8           idi_location1;  // 所在地信息1，默认值0表示未设置。取值参考identity_area.id1
  uint8           idi_location2;  // 所在地信息2，默认值0表示未设置。取值参考identity_area.id2
  string          idi_sign;       // 自定义签名，长度参考globalsetup.identity_sign_count
  vector<uint8>   idi_face;       // 自定义头像MD5(16byte)
  vector<uint8>   idi_listTag;    // 标签信息集，其元素值参考identity_tag.id
  vector<MD5>     idi_listPic;    // 相册信息集，其元素为多个MD5(16byte)
};

/////////////////////////////////////////////////////////////////////////////////////

// 编辑身份证信息_年龄
struct U2GS2U_IdentityEditAge <->
{
  uint8           idi_age;        // 年龄，默认值255表示未设置。取值参考globalsetup.identity_age_limit
};

// 编辑身份证信息_生日
struct U2GS2U_IdentityEditBirth <->
{
  uint8           idi_birthmonth; // 出生月，默认值0表示未设置
  uint8           idi_birthday;   // 出生日，默认值0表示未设置
};

// 编辑身份证信息_星座
struct U2GS2U_IdentityEditZodiac <->
{
  uint8           idi_zodiac;     // 星座，默认值0表示未设置。
                                  // 从1到12依次为：白羊金牛双子巨蟹狮子处女天秤天蝎射手摩羯水瓶双鱼
};

// 编辑身份证信息_血型
struct U2GS2U_IdentityEditBloodType <->
{
  uint8           idi_bloodType;  // 血型，默认值0表示未设置。
                                  // 从1到4依次为：A、B、AB、O
};

// 编辑身份证信息_故乡
struct U2GS2U_IdentityEditHometown <->
{
  uint8           idi_hometown1;  // 故乡信息1，默认值0表示未设置。取值参考identity_area.id1
  uint8           idi_hometown2;  // 故乡信息2，默认值0表示未设置。取值参考identity_area.id2
};

// 编辑身份证信息_所在地
struct U2GS2U_IdentityEditLocation <->
{
  uint8           idi_location1;  // 所在地信息1，默认值0表示未设置。取值参考identity_area.id1
  uint8           idi_location2;  // 所在地信息2，默认值0表示未设置。取值参考identity_area.id2
};

// 编辑头像信息
struct U2GS2U_IdentityEditFace <->
{
  vector<uint8>   idi_face;       // 自定义头像MD5(16byte)
};

// 编辑签名信息
struct U2GS2U_IdentityEditSign <->
{
  string          idi_sign;       // 自定义签名，长度参考globalsetup.identity_sign_count
};

// 添加标签
struct U2GS_IdentityEditTagAdd_Request ->
{
  vector<uint8>   idi_listTag;    // 新增的标签信息集，其元素值参考identity_tag.id
};

// 删除标签
struct U2GS_IdentityEditTagDel_Request ->
{
  uint8           idi_tag;        // 标签信息，取值参考identity_tag.id
};

// 反馈编辑标签结果
struct GS2U_IdentityEditTag_Ack <-
{
  vector<uint8>   idi_listTag;    // 标签信息集，其元素值参考identity_tag.id
};

// 反馈编辑相册信息
struct GS2U_IdentityEditPic_Ack <-
{
  vector<MD5>     idi_listPic;    // 相册信息集，其元素为多个MD5(16byte)
};

// 同步点赞值变化
struct GS2U_IdentityLike_Sync <-
{
  uint64  roleID;       // 操作者
  uint64  tarRoleID;    // 被操作者
  uint32  valueUpdate;  // 变化值
  uint32  valueNew;     // 新值
};

// 同步魅力值变化
struct GS2U_IdentityCharm_Sync <-
{
  uint64  roleID;       // 操作者
  uint64  tarRoleID;    // 被操作者
  uint32  valueUpdate;  // 变化值
  uint32  valueNew;     // 新值
};

/////////////////////////////////////////////////////////////////////////////////////

// 上传图片请求_开始
struct U2GS_IdentityPicUploadBegin_Request ->
{
  vector<uint8>   md5;            // 图片MD5(16byte)
  uint32          size;           // 数据尺寸（单位字节）
  bool            opType;         // 0删除；1新增
  uint8           pos;            // 在相册中的位置，从0开始，目前最大为2
};

// 上传图片请求_数据
struct U2GS_IdentityPicUploadData_Request ->
{
  vector<uint8>   md5;            // 图片MD5(16byte)
  uint16          count;          // 数据划分段数
  uint16          index;          // 数据段索引
  vector<uint8>   data;           // 数据
};

// 反馈上传图片请求
struct GS2U_IdentityPicUpload_Ack <-
{
  vector<uint8>   md5;            // 图片MD5(16byte)
  bool            isComplete;     // true上传完毕或已经存在；false需要继续上传
};

/////////////////////////////////////////////////////////////////////////////////////

// 下载图片请求_开始
struct U2GS_IdentityPicDownloadBegin_Request ->
{
  vector<uint8>   md5;            // 图片MD5(16byte)
  uint64          id;             // 如果目标图片是跨服数据，则需要传递目标图片相关的角色ID，否则置为0
};

// 反馈下载图片请求
struct GS2U_IdentityPicDownloadError_Ack <-
{
  vector<uint8>   md5;            // 图片MD5(16byte)
  uint8           error;          // 无法下载的错误类型（0照片不存在1等待过审）
};

// 反馈下载图片请求_数据
struct GS2U_IdentityPicDownloadData_Ack <-
{
  vector<uint8>   md5;            // 图片MD5(16byte)
  uint32          size;           // 数据尺寸（单位字节）
  uint16          count;          // 数据划分段数
  uint16          index;          // 数据段索引
  vector<uint8>   data;           // 数据
};

// 下载图片请求_继续
struct U2GS_IdentityPicDownloadContinue_Request ->
{
  vector<uint8>   md5;            // 图片MD5(16byte)
};

// 推送图片数据
struct GS2U_IdentityPicDownloadData_Sync <-
{
  vector<uint8>   md5;            // 图片MD5(16byte)
  uint32          size;           // 数据尺寸（单位字节）
  uint16          count;          // 数据划分段数
  uint16          index;          // 数据段索引
  vector<uint8>   data;           // 数据
};

// 角色头像
struct RoleHeadPic
{
	uint64 roleID;
	vector<uint8>   md5;            // 图片MD5(16byte)
};

// 请求角色的头像数据
struct U2GS2U_RequestRoleHeadPic <->
{
	vector<RoleHeadPic> heads;
};

/////////////////////////////////////////////////////////////////////////////////////

// 赠礼
struct U2GS_Gift_Request ->
{
  uint64  tarRoleID;  // 赠送目标角色ID
  uint16  itemID;     // 赠送道具ID
  uint16  itemCount;  // 赠送道具数量
  string  content;    // 祝福语（为空时使用默认祝福语）（赠送数量不足的话是无法发送走马灯的）
};

// 反馈赠礼（用于客户端刷新赠礼记录）
struct GiftHistory
{
  uint64  index;      // 内部算法使用序号，为了使用统一的数据结构就放在这里，客户端可使用该序号作为排序
  uint32  time;       // 时间戳
  uint64  roleID;     // 赠送者角色ID
  uint64  tarRoleID;  // 赠送目标角色ID
  uint16  itemID;     // 赠送道具ID
  uint16  itemCount;  // 赠送道具数量
  uint32  charmUpdate;// 魅力值变化量
};
struct NameTable
{
  uint64  id;         // 角色ID
  string  name;       // 角色名
};
struct GS2U_Gift_Ack <-
{
  GiftHistory         history;     // 单条记录
  vector<NameTable>   nameTables;  // 名称表
};

// 上线同步最近的赠礼记录
struct GS2U_GiftHistory_Sync <-
{
  vector<GiftHistory> listHistory;    // 多条记录
  vector<NameTable>   nameTables;     // 名称表
  vector<uint16>      listItemID;     // 已收到的道具ID组
  vector<uint16>      listItemCount;  // 道具ID组对应的道具数量
};

/////////////////////////////////////////////////////////////////////////////////////

//举报
struct U2GS_Report_Request ->
{
  uint64  tarRoleID;  // 举报目标角色ID
};

struct GS2U_Report_Ack <-
{
  uint64  tarRoleID;  // 举报目标角色ID
};
