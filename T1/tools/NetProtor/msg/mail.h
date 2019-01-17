// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

struct MailInfo
{
	uint64				mailID;					// 邮件ID
	string				mailTitle;				// 邮件标题
	uint64				mailReadTime;			// 阅读时间
	uint64				mailSendTime;			// 发送时间
	bool				ishaveAttach;			// true 有附件，false无附件
	string				senderName;				// 发送者名字，如果是系统邮件则为空
};

// 服务器发送给客户端的邮件信息列表
struct GS2U_MailInfo <-
{
	vector<MailInfo>	mailInfoList;
};


// 客户端发送新邮件
struct U2GS_SendMail ->
{
	string				toRoleName;				// 收信人名字
	string				mailTitle;				// 邮件标题
	string				mailContent;			// 邮件内容
};

// 客户端发送或者回复邮件，服务器的反馈信息
struct GS2U_SendMailAck <- 
{
	string				toRoleName;				//发送时的目标名字
	bool				isOK;					//成功为1，失败为0
};




// 客户端阅读邮件
struct U2GS_ReadMail ->
{
	uint64	mailID;				// 邮件ID
};

struct MailItem
{
	uint64	itemUID;		//物品uid
	uint32  itemID;			//道具编号ID
	uint32	itemNumber;		//堆叠个数
	uint8 	quality;		//品质
	bool isBind;			// 是否绑定
};

struct MailItemAll
{
	uint32  itemID;			//道具编号ID
	uint32	itemNumber;		//堆叠个数
};

struct MailCoin
{
	uint8	coinType;		// 货币类型：1.金币，2.绑定金币，3.钻石，4.声望，5.荣誉，6.点券，7.紫色精华，8.金色精华
	uint	coinNum;		// 货币数量
};

struct MailDetail
{
	uint64				mailID;					// 邮件ID
	uint64				sendRoleID;				// 发送人的ID，系统邮件为0
	bool				isLocked;				// 是否锁定
	uint8				remainDay;				// 邮件还可以保留的天数
	string				sendPlayerName;			// 发送人的名字，系统邮件为空
	string				mailTitle;				// 邮件标题
	string				mailContent;			// 邮件内容
	vector<MailItem>	itemList;				// 邮件的道具附件
	vector<MailCoin>	coinList;				// 邮件的货币附件
};

//邮件详细信息
struct GS2U_Mail <-
{
	MailDetail detail;
};



// 客户端获取邮件附件
struct U2GS_GetMailItem ->
{
	uint64	mailID;				// 邮件ID
	uint64 itemUID;				// 附件中的道具UID
};

// 服务器反馈获取邮件附件
struct GS2U_DelMailItem <-
{
	uint64	mailID;				// 邮件ID
	uint64 itemUID;				// 附件中的道具UID
};



// 客户端获取邮件货币
struct U2GS_GetMailCoin ->
{
	uint64	mailID;				// 邮件ID
};

// 服务器反馈获取邮件货币
struct GS2U_DelMailCoin <-
{
	uint64	mailID;				// 邮件ID
};




// 邮件操作结果
struct retMailOpt
{
	uint64	mailID;				// 邮件ID
	bool	result;				// 是否成功
};

// 客户端锁定邮件
struct U2GS_LockMail ->
{
	uint64	mailID;				// 邮件ID
};

// 服务器回复锁定邮件
struct GS2U_LockMail <-
{
	retMailOpt ret;
};

// 客户端解除锁定邮件
struct U2GS_UnlockMail ->
{
	uint64	mailID;				// 邮件ID
};

// 服务器回复解除锁定邮件
struct GS2U_UnlockMail <-
{
	retMailOpt ret;
};



// 客户端删除邮件
struct U2GS_DeleteMail ->
{
	uint64	mailID;				// 邮件ID
};

// 客户端删除所有已读且无附件的邮件
struct U2GS_DeleteAllReadMail ->
{
};

// 服务回复删除邮件的ID
struct GS2U_DeleteMail <-
{
	uint64	mailID;
};

// 一健提取
struct U2GS_GetMailItemAll ->
{
	
};

// 一健提取返回结果
struct GS2U_GetMailItemAll <-
{
	vector<uint64> mailIDs;
	uint16 number;	// 成功一次性提取的邮件封数
	vector<MailItemAll> items;
	vector<MailCoin> coins;
};

// 获取客户端传过来的需要删除的邮件列表
struct U2GS_GetDeleteMails ->
{
	vector<uint64> mailIDs;// 邮件ID列表
};