// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

//签到奖励道具
struct SignItem
{
	uint16  itemID;			//道具编号ID
	uint16	itemNumber;		//堆叠个数
};
//签到初始信息
struct SignInInfo
{
	uint8   signType;			//签到类型，0：每日签到，1:七日签到
	vector<SignItem> itemList;	//签到奖励道具列表
	uint8   signState;			//签到状态，0：未签，1：已签，2:不能签
};
//签到初始信息
struct GS2U_SignIn <-
{
	vector<SignInInfo> info_list;
	uint64 time;				//UTC时间（相对于1970年第0秒），单位秒
};
//每日签到
struct EveryDaySignIn <->
{
};

//七日签到
struct SevenDaySignIn <->
{
	uint8 dayCount;        //签到的天数
};
struct U2GS_BindPhone ->
{
	string funcellCilentID;
	string accessToken;   //
	uint64 phoneNum;      //手机号码
	string verifyid;	  //验证流水号
	string content;		  //玩家填的验证码
};
struct GS2U_BindPhoneResult <-
	bool isSuccess;       
};
//领取绑定手机奖励
struct BindPhoneAwardGet <->
{
};

//新版本  

//每日签到
struct U2GS_SignIn ->
{
};

//累计奖励
struct U2GS_AccuReward ->
{
	uint8 id;
};
