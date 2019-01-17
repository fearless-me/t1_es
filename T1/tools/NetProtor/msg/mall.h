// -> client to server
// <- server to client
// <-> client & server

struct MallInfo
{
	uint db_id;	//商品唯一标识码 itemid+type+submenu
	uint itemid;	
	uint16 buyNumDefalut;//默认购买数量
	int8 mainmenu;	//主菜单 物品类型	优惠:1|成长:2|时装:3|积分:4
	int8 submenu;	//子菜单，每个type下面的分类选项
	int gold,		//非绑定钻石售价  非绑定钻石:3
	int bind_gold,	//绑定钻石	 	绑定钻石:6
	int use_integral, //积分购买
	int get_integral,	//可以获得的积分
	int  lefttime;	//购买结束倒计时	单位:s
	int  leftcount;	//限购剩余数
	int  leftcountMax;	//限购数
	int  sortNumber;//排序号
	int8 rebate;	//打折				default:100
	int8 showtype;	//显示状态
	int8 limitType; //限制类型 0为不限购 1为玩家角色限购 2全服务器限购 3为玩家角色每日限购
	uint8 present;	//是否可以赠送，0不可以赠送
};
//商城优惠列表
struct GS2U_MallPriceList<-
{
	vector<MallInfo>	mallinfolist;
};
//商城列表
struct GS2U_MallInfoList<-
{
	int seed;
	vector<MallInfo>	mallinfolist;
};

//打开请求
struct U2GS_MallInfo->
{
	int seed;	//第一次请求上传0
};

//购买请求   同一页面不能有同一种ID的道具
struct U2GS_ItemBuyRequest->
{
	uint db_id; 
	uint itemid;
	int  itemnum;
	int8 moneytype;		//金钱类型，
	uint64	tarRoleID; //0,给自己， 否则给其他人买
};

//商城购买返回结果
struct GS2U_MallBuyResult<-
{
	uint db_id;
	uint buyCount;		//0购买失败
};

//杨传龙不同意修改消息，此处作冗余处理
//商城优惠列表
struct GS2U_MallPriceList2<-
{
	vector<MallInfo>	mallinfolist;
};
//商城列表
struct GS2U_MallInfoList2<-
{
	int seed;
	vector<MallInfo>	mallinfolist;
};

//打开请求
struct U2GS_MallInfo2->
{
	int seed;	//第一次请求上传0
};

//购买请求   同一页面不能有同一种ID的道具
struct U2GS_ItemBuyRequest2->
{
	uint db_id; 
	uint itemid;
	int  itemnum;
	int8 moneytype;		//金钱类型，
};

//商城购买返回结果
struct GS2U_MallBuyResult2<-
{
	uint db_id;
	uint buyCount;		//0购买失败
};

//////////////////////////////////////////////////////////////
//////////////////%韩国naver论坛奖励需求消息开始/////////////////
/////////////////////////////////////////////////////////////

// 活动信息(单个)
struct KoreaNaverConfigInfo
{
    int id;             //活动ID(只有1/2/3 三种)
	string name; 	    //活动名
	int beginTime;	    //活动开始时间
	int endTime;	    //活动结束时间
	int itemID; 		//奖励道具ID
	int itemCount;	    //奖励道具数量
	string param; 	    //活动参数(只有OnJoined/OnPostedArticle/OnPostedComment三种)
	int ver; 	        //版本号(仅当活动领取记录重置时改变(+1))
	int id_num;			//活动序号(修改活动内容之后原活动不会删除, 只会新增一个活动需要+1的活动, 客户端不需要关注此参数, 每次只会把最新的活动内容发给客户端)
    int menuID;			//论坛板块ID(当论坛调用OnPostedArticleListener接口时需要判断是否符合, 用来过滤多余请求)
    int articleID;		//留言板ID(当论坛调用OnPostedCommentListener接口时需要判断是否符合, 用来过滤多余请求)
}

// 玩家领奖记录(活动ID和活动版本)
struct KoreaNaverIdAndVer
{
    int id;    //活动ID
    int ver;   //活动版本号
}

// 1.当玩家上线时/2.当活动配置该改变时(版本号不变)/3.当活动领取记录重置时(版本号改变) 推送的活动信息和玩家已领取奖励信息
// state=1 需要关注所有参数
// state=2 需要关注configInfoList
struct GS2U_KoreaNaverConfigInfo <-
{
    // 时机
 	int  state;  //1.当玩家上线时/2.当活动配置该改变时
    vector<KoreaNaverConfigInfo>  configInfoList;     //活动信息列表(有且只有3个)
    vector<KoreaNaverIdAndVer>  rewardGetList;   //玩家已领取奖励(含版本号)
}

// 客户端请求领奖
struct U2GS_KoreaNaverRewardGetRequest ->
{
	int id;    //对应活动ID
	int ver;   //活动版本号
	string naverAccountID; // 论坛账号 新增,用于记录日志
	int menuID;		//论坛板块ID
    int articleID;	//留言板ID
};

// 客户端请求领奖后反馈
struct GS2U_KoreaNaverRewardGetAck <-
{
	// 领奖结果
    int getCode;   //0兑奖失败 1成功 其他待定
    int id;        //发起领奖请求时对应活动ID
    int ver;       //发起领奖请求时活动版本号
    vector<KoreaNaverIdAndVer>  rewardGetList;   //玩家已领取奖励(含版本号)
};


//////////////////////////////////////////////////////////////
///////////////////////团购活动消息开始///////////////////////
//////////////////////////////////////////////////////////////

//团购商品信息
struct GroupBuyGoodsInfo
{
	int id;	//商品id
	int collect_num; //限购数
	string product_name; //商品的名称
	string product_icon; //配置ICON路径
	int product_quality; //品质框
	uint64 price; //原价,仅显示
	uint64 true_price; //实际默认价格
	uint64 rebate1_num; //打折需要数量1
	uint64 rebate1_price; //第1次折扣
	uint64 rebate2_num; //打折需要数量2
	uint64 rebate2_price; //第2次折扣	
	uint64 rebate3_num; //打折需要数量3	
	uint64 rebate3_price; //第3次折扣	
	uint64 rebate4_num; //打折需要数量4	
	uint64 rebate4_price; //第4次折扣	
	uint64 rebate5_num; //打折需要数量5
	uint64 rebate5_price; //第5次折扣
	uint16 item1_id; //道具1的id	
	uint16 item1_num; //道具1数量	
	uint16 item2_id; //道具2的id	
	uint16 item2_num; //道具2数量	
	uint16 item3_id; //道具3的id	
	uint16 item3_num; //道具3数量	
	uint16 item4_id; //道具4的id	
	uint16 item4_num; //道具4数量	
	uint16 item5_id; //道具5的id	
	uint16 item5_num; //道具5数量	
	uint64 score; //购买商品可累计的积分
	uint64 buy_count;	// 购买总量（能量值）
};

//积分奖励商品信息
struct GroupBuyRewardInfo
{
	int id; //奖励id
	uint64 score; //积分对应
	uint16 reward1_id; //奖励道具1id
	uint16 reward1_num; //道具1的数量
	uint16 reward2_id; //奖励道具2id
	uint16 reward2_num; //道具2的数量
	uint16 reward3_id; //奖励道具3id
	uint16 reward3_num; //道具3的数量
	uint16 reward4_id; //奖励道具4id
	uint16 reward4_num; //道具4的数量
	uint16 reward5_id; //奖励道具5id
	uint16 reward5_num; //道具5的数量
};

// id对应数量的组合
struct idAndCount
{
	int id;
	int count;
};

// 打开团购页面
struct U2GS_GroupBuyWhenOpen ->
{
};
struct GS2U_GroupBuyWhenOpen <-
{
	// 时机
	uint8  state;  //0上线推送；1后台配置改变时推送；2请求打开面板时反馈
	// 活动状态
	uint32  open_time;	//活动开始时间 格式如同协议GS2U_SyncServerTime UTC时间（相对于1970年第0秒），单位秒
	uint16  limit_time; //持续时间(小时)
	uint16  score_add_time; //积分领取延后时间(小时)
	string  image;  // 活动背景图
	// 活动内容
	vector<GroupBuyGoodsInfo>  goodsListInfo; //团购商品列表
	vector<GroupBuyRewardInfo> rewardListInfo; //积分奖励列表
	// 个人数据
	uint64  personalScore; //个人积分
	vector<int>  rewardPersonalListInfo; // 个人积分奖励已领取
	vector<idAndCount>  goodsPersonalListInfo; // 个人商品对应购买数量（限购）
};

//团购活动购买
struct U2GS_GroupBuyGoodsBuyRequest ->
{
	int id;	//商品id
	uint16 goodsNum; //购买数量
};
//团购积分奖励领取返回结果
//红点：
// 根据积分新值与GS2U_GroupBuyWhenOpen.rewardListInfo、GS2U_GroupBuyWhenOpen.rewardListInfo进行判定
struct GS2U_GroupBuyGoodsBuyAck <-
{
	// 购买结果
	int buyCode; //0购买失败 1成功 其他待定
	// 如果需要面板展示购买内容，所需数据如下
	int id;	//商品id
	uint16 goodsNum; //购买数量
	uint64 scoreAdd;		// 积分变化
	uint64 scoreNew;		// 积分新值
	uint64 lockDiamond;	// 冻结的钻石数量
	// 可能因其他玩家操作而导致的数据刷新
	vector<idAndCount>  goodsBuyCountListInfo; // 全体商品对应购买数量（能量值）
};

//积分领取奖励
struct U2GS_GroupBuyRewardBuyRequest ->
{
	int id; //奖励id
};
//存在可领取奖励(积分变化达到兑换要求后主动推送)
struct GS2U_GroupBuyRewardBuyAck <-
{
	// 兑奖结果
	int buyCode; //0兑奖失败 1成功 其他待定
	int id;  //奖励id
	// 可能因其他玩家操作而导致的数据刷新
	vector<idAndCount>  goodsBuyCountListInfo; // 全体商品对应购买数量（能量值）
};
///////////////////////时装活动消息开始///////////////////////

// fashionID对应组合
struct fashionIDCob
{
	int sex;
	int fashionID;
};

// itemID对应组合
struct itemIDCob
{
	int itemID;
	int count;
};

// 时装活动信息(单个)
struct FashionConfigInfo
{
    int id;             //活动ID
    int batch;          //批次号
	vector<fashionIDCob> fashionID; 	//时装ID(区分男女,1男,0女)
	vector<itemIDCob> itemID; 	    //道具盒ID(区分男女)
	float discount;	    //折扣率
	int cointype;	    //货币类型
	uint64 original_price; 		//原价
	uint64 price;	    //现价
	uint64 start_time; 	    //开启时间时间戳
	uint64 time; 	        //持续时间(小时))
	string resources_bg;			//原画资源
    int fashion_show;			//时装可见性,1可见,0不可见
}
struct GS2U_FashionConfigInfo <-
{
    // 时机
 	int  state;  //1.当玩家上线时/2.当活动配置该改变时
    vector<FashionConfigInfo>  configInfoList;     //活动信息列表(目前只需要一个)
}



