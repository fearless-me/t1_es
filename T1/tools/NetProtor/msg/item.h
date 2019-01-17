// -> client to server
// <- server to client
// <-> client & server

//	商品协议
//	有关 NPC商店 和 商城 的商品

struct LookInfoItem				
{
	uint16 	itemid;		//商品ID
	uint 	sortid;		//排序编号
	uint8 	type;		//货币类型
	uint32 	value;		//价格
	uint8 	quality;	//品质
	uint16 	useLevel;	//使用等级
	int32 quotaNumber;	// 本商品当日剩余可购次数
};

struct U2GS_LookInfoItemListAtNpcStore ->	//查看Npc商店商品列表 请求
{
	uint64 npccode;		//Npc流水号
};

struct GS2U_LookInfoItemListAtNpcStore <-	//Npc商店 商品列表
{
	uint16 	storeType;		//商店类型
	vector<LookInfoItem> item_list;			
};

struct U2GS_BuyItemAtNpcStoreRequest ->
{
	uint64 npccode;		//Npc流水号
	uint16 itemid;		//商品ID
	uint16 number;		//购买数量
};

// 购买军团商品
struct U2GS_BuyItemAtGuildShopRequest ->
{
	uint16 itemid;		//商品ID
	uint16 number;		//购买数量
};

// 购买商品成功后返回当日剩余可购次数
struct GS2U_BuyItemQuotaNumber <-
{
	uint16 itemid;		// 商品ID
	int32 quotaNumber;	// 本商品当日剩余可购次数
};

struct GiftItemInfo 
{
	uint16 itemid;
	uint16 number;
};

struct LookInfoItemAtMall				
{
	uint16 itemid;			//商品ID
	uint8 sortid;			//排序编号
	uint8 type;				//货币类型
	uint32 value;			//价格
	uint16 stockCount;		//余量
	uint16 stockGiftCount;	//前多少销量送礼
	vector<GiftItemInfo> gifts;		//礼品列表
	uint32 saleStartTime;	//开始时间
	uint32 saleEndTime;		//结束时间
	uint8 quotaNum;			//限购个数
};

struct U2GS_LookInfoItemListAtMall ->		//查看商城 商品列表	请求
{
};

struct GS2U_LookInfoItemListAtMall <-
{
	vector<LookInfoItemAtMall> item_list;
};

struct U2GS_BuyItemAtMallRequest ->
{
	uint16 itemid;		//商品ID
	uint16 number;		//购买数量
};

struct UseItemCD
{
	uint16	itemGroupID;		// 道具组ID
	uint	remainCDTime;		// 道具组剩余CD时间，单位：毫秒
};


//使用物品
struct U2GS_UseStarMoonBox ->
{
	uint64 itemUID;    //物品UID
	uint16 useNum;    //本次使用个数
	
};


struct GS2U_SingleUseItem <-
{
	uint16	itemID;				// 道具ID
};

struct GS2U_UseItem <-
{
	vector<UseItemCD> vctUseItem;		// 道具的CD信息
};

struct GS2U_UseItemResult <-					
{
	uint16 itemID;				// 道具ID
	uint16 itemNum;				// 道具数量
	int    result;
};

struct UseItemGainGoodsTips
{
	uint32	itemID;				//道具或者装备的ID
	uint16	itemNum;			//道具或者装备的数量
	uint8	quality;			//道具或者装备的品质
	uint8	isBind;				//是否绑定
};

// 使用道具获得的货币数量
struct UseItemGainCoinTips
{
	uint8 coinType;			// 货币类型
	uint32 value;			// 货币值
};

struct GS2U_UseItemGainGoodsTips <-
{
	vector<UseItemGainGoodsTips> listTips;
	vector<UseItemGainCoinTips> coinTips;
};

struct GS2U_UseItemExpInDanResult <-
{
	uint   expInDanType;		// 经验丹类型
	uint   remainTime;			// 经验丹剩余时间
};

// 请求神秘商店商品列表
struct U2GS_RequestMysteriousShop ->
{
};

struct MysteriousShopItem				
{
	uint only_id;		//商品唯一ID标示
	uint16 itemid;		//商品ID
	uint8 money_type;	//货币类型
	uint32 money;		//单价
	int number;			//允许购买个数，0不允许购买，-1无限购买，>0可购买指定个数
};

// 返回神秘商店物品列表
struct GS2U_MysteriousShop <-
{
	uint   lvlPhase;	// 等级阶段
	uint32 residueTime;	// 下次刷新剩余秒数
	vector<MysteriousShopItem> items;	// 物品列表
	int    freshMSShopDaimond;	// 刷新神秘商店需要消耗的非绑定钻石，0不消耗，-1不能刷新，>0需要消耗多少非绑定钻石
};

// 请求手动立即刷新神秘商店
struct U2GS_FreshMSShop ->
{
	
};

// 请求购买神秘商店商品
struct U2GS_BuyMysteriousShopItem ->
{
	uint   	lvlPhase;	// 等级阶段
	uint	buynumber;	// 购买个数
	uint	only_id;	// 商品唯一ID标示
	uint16 	itemid;		// 商品ID
};

struct U2GS_ConvenientBuyItem ->
{
	uint itemid;		// 物品ID
	uint buynumber;		// 购买个数
};

struct RefindResInfo				
{
	uint id;			// 
	int number;			// 未完成次数
};

// 请求和返回资源找回列表， 请求时参数传NULL
struct RefindResList<->
{
	vector<RefindResInfo> resList;
};

// 找回单个资源
struct U2GS_RefindResOne ->
{
	uint	id;
	uint8	type;  // 0: 免费找回 1：钻石找回
};

// 一键找回资源
struct U2GS_RefindResAll ->
{
	uint8	type;  // 0: 免费找回 1：钻石找回
};

// 某商店并入玩家背包，故基于协议U2GS_LookInfoItemListAtNpcStore修改
struct U2GS_LookInfoItemListAtShopID ->	//查看指定商店商品列表 请求
{
	uint64 shopID;		// 商店ID
};
// 某商店并入玩家背包，故基于协议U2GS_BuyItemAtNpcStoreRequest


struct U2GS_BuyItemAtShopIDRequest ->
{
	uint64 shopID;		// 商店ID
	uint16 itemid;		//商品ID
	uint16 number;		//购买数量
};

//获得的物品 装备 或者符文信息
struct OneGoodsInfo
{
	uint32	itemID;				//道具,装备,符文的ID
	uint16	itemNum;			//道具,装备,符文的数量
	uint8	quality;			//道具,装备,符文的品质 理论上是从配置表获取显示 
	uint8	isBind;				//是否绑定
};

// 获得的货币信息
struct OneCoinInfo
{
	uint8 coinType;			// 货币类型
	uint32 value;			// 货币值
};

//通用展示某功能获得的物品金币消息
struct GS2U_ShowGainGoodsOrCoinsInfo <-
{
	string gainReason;					//获得的途径或者来源 可以有可以没有
	vector<OneGoodsInfo> listGoods;		//得到的物品列表
	vector<OneCoinInfo>  listcoins;		//得到的金币列表
};


