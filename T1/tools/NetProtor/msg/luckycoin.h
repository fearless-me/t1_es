// -> client to server
// <- server to client
// <-> client & server
//
struct GainLuckyCoinInfo
{
	uint time;			  //赠送的时间多少分钟
	uint64 friendID;      //赠送者
};
//赠送幸运币
struct U2GS_GiveLuckyCoin ->
{
	uint64 friendID;      //赠予的朋友的id
};
//赠送幸运币结果
struct GS2U_GiveLuckyCoinResult <-
{
	uint64 friendID;	  //赠予的朋友的id
	uint8  result;		  //0：赠送失败1：赠送成功2：对方今日幸运币满了
};
//受赠获得幸运币
struct GS2U_GainLuckyCoin <-
{
	GainLuckyCoinInfo gainLuckyCoinInfo; //获得幸运币的信息
	int    count;						 //目前幸运币数量
	uint64 time;
};
//进游戏时初始化受赠信息
struct GS2U_InitGainLuckyCoinInfo <-
{
	vector<GainLuckyCoinInfo> gainLuckyCoinInfoList;//
	int    count;		  //目前幸运币数量
	uint64 time;
};
//抽奖
struct U2GS_LuckyDraw ->
{    
};
//抽奖结果
struct GS2U_LuckyDrawResult <-
{
	int  itemID;    //物品ID（道具ID是0默认失败，非0则是成功的）
	int  count;		//目前幸运币数量
	uint64 time;    
};
//抽奖动画完
struct U2GS_LuckyDrawEnd ->
{
};
//一键赠送所有在线好友幸运币
struct U2GS_OneKeyGiveLucky ->
{
};