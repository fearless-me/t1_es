// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

//道具结构定义
struct NormalItemInfo
{
	uint itemID;		//物品ID
	uint64 itemUID;		//物品UID
	uint16 itemSum;     //物品数量
	bool isBind;        //是否绑定
	bool isLocked;		//是否锁定
	uint32	expiredTime;//过期时间
};

//装备属性值列表
struct EquipPropInfo
{
	uint8  propType;     //装备属性类型  1:基础属性, 2:附加属性(未重铸)  3:附加属性(不可重铸) 4.附加属性(已重铸) 
	uint8  propKey;      //属性标识主键  对应propType 如propType = 1时，propKey为属性ID
	uint16 propAffix;    //属性词缀
	bool   calcType;     //属性计算类型  false加法  true乘法
	float  propValue;	 //属性值
};

//装备结构定义
struct EquipItemInfo
{
	uint itemID;         //物品ID
	uint64 itemUID;      //物品UID
	uint16 recastNum;    //重铸次数
	uint8 quality;       //品质  0 白色装备 1绿色装备 2蓝色装备 3紫色装备 4橙色装备 5红色装备
	bool isBind;         //是否绑定
	bool isLocked;		 //是否锁定
	uint32	expiredTime; //过期时间

	vector<EquipPropInfo> equipProps;   //装备属性列表
};

struct U2GS_WashEquip ->
{
	uint16 equipPos; 	//  
	uint16 propID;		// 洗的属性
	float  propValue;	 //属性值
	uint16  index;
};

struct GS2U_WashEquip <-
{
	uint16 equipPos; 	// 
	uint16 index;	
	EquipPropInfo propInfo
};

//增加道具
struct GS2U_AddNormalItemToBag <-
{
	uint8 type;      				//背包类型
	uint64  code;                     //怪物Code
	uint  addNum;					//实际增加数量
	vector<NormalItemInfo> items;   //增加道具的具体信息
};

//增加装备
struct GS2U_AddEquipItemToBag <-
{
	uint8 type;   				   //背包类型
	uint64  code;                    //怪物Code
	vector<EquipItemInfo> items;   //增加装备的具体信息
};

//移动物品
struct MoveGoods <->
{
	uint64 itemUID;
	uint8 source;
	uint8 target;       //source target 取值 0:普通背包 1:普通仓库  2： 装备背包  3：装备仓库  4：回收站 5:玩家身上的装备背包 6:宝石背包 7：宝石仓库 8：镶嵌宝石背包
						//移动物品只能在相应的背包和仓库之间移动，0<=>1, 2<=>3, 0<=>4, 2<=>4, 2<=5
};

//整理物品
struct U2GS_SortItem ->
{
	uint8 type;                 //背包类型
};

//更新普通道具
struct GS2U_UpdateNormalItem <-
{
	uint8 type;                  //背包类型
	vector<NormalItemInfo> items; //整理后的物品信息
};

//更新装备
struct GS2U_UpdateEquipItem <-
{
	uint8 type;                  //背包类型
	uint8 operate;               //1:强化2:重铸3:附魔
	vector<EquipItemInfo> items; //整理后的物品信息
};

// 删除物品
struct GS2U_DeleteGoods <-
{
	uint8 type;                  //背包类型
	vector<uint64> goodsUIDs;	//物品UID列表
};

//初始化普通道具
struct GS2U_InitItem <-
{ 
	uint8 type;                  //背包类型
	vector<NormalItemInfo> items; //整理后的道具信息
};

//初始化装备
struct GS2U_InitEquip <-
{ 
	uint8 type;                  //背包类型
	vector<EquipItemInfo> items; //整理后的装备信息
};

struct RecycleItem
{
	uint8			slot;
	NormalItemInfo	item;
};

struct RecycleEquip
{
	uint8			slot;
	EquipItemInfo	equip;
};

struct GS2U_InitRecycle <-
{
	vector<RecycleItem> items;
	vector<RecycleEquip> equips;
};

//背包格子信息
struct BagSlot 
{
   uint8 max;  //最大格子数
   uint8 used; //已开启格子数
};

//初始化背包和仓库的格子
struct GS2U_InitSlot <-
{
	vector<BagSlot> slots;   //列表的顺序:普通背包、普通仓库 、装备背包、装备仓库、回收站、玩家身上的装备背包、宝石背包、宝石仓库、镶嵌宝石背包
};

//使用物品
struct U2GS_UseItem ->
{
	uint64 itemUID;    //物品UID
	uint16 useNum;    //本次使用个数
};

//使用增加婚姻title的道具
struct U2GS_UseMarriageTitleItem -> 
{
	uint64 itemUID;    //物品UID
	uint16 useNum;    //本次使用个数
	string text;	  //附带参数
};

//使用烟花道具后广播使用者给其他人
struct GS2U_UseItemFireWorksNotice <- 
{
	uint64 roleID;				//使用者ID
};

//开启空格子
struct OpenNewBagSlot <->		
{
	uint8 bagType;			// 背包类型
	uint8 openNum;			// 开启数量
};

struct GS2U_UpdateFurnitureStorageSlot <- //刷新客户端仓库背包格子数，仓库背包特殊处理，最大值和当前值相同，都是动态值
{
	uint8 slotNum;
};

//强化基础属性
struct EquipEnhancedProp
{
	uint8 propKey;      //属性标识主键  对应propType 如propType = 1时，propKey为属性ID
	float propValue;	//属性值  对应propKey 有符号整数 可以为正负数
};

//强化计算
struct GS2U_EquipEnhancedProp <-
{
	uint64 equipUID;   //装备UID
	vector<EquipEnhancedProp> enProps; //强化后基础属性
	uint  price;       //强化费用
};

//装备强化
struct U2GS_EquipEnhanced ->
{
	uint8 type;         //1：强化计算(属性值,以及费用) 2：确认强化
	uint64 equipUID;    //装备UID
};

// 重铸属性
struct RecastPropInfo
{
	uint16 pos;			//第几条属性
	uint32 propIndex;	//属性id
	float propValue;   //属性值
	float propValMax;  //最大值（可以忽略）
}

// 一个装备位的重铸属性
struct RecastPosInfo
{
	uint16 equipPos; 	// 重铸部位
	uint32 recastVal;	// 精炼值
	vector<RecastPropInfo> recastInfo;			// 属性重铸
	vector<RecastPropInfo> recastInfo_ext;		// 符石重铸
}

// 重铸初始化,上线时初始化,升级时的变化
struct GS2U_EquipRecastInfoInit <-
{
	vector<RecastPosInfo> recastInfoList;
};

//装备重铸
struct U2GS_EquipRecast ->
{
	uint16 equipPos; 	// 重铸部位
};

//符石重铸
struct U2GS_EquipRecastAdvance ->
{
	uint16 equipPos; 	// 重铸部位
	uint16 pos;			// 第几条属性
};

// 更新一个装备位的重铸属性
struct GS2U_EquipRecastInfo <-
{
	uint16 recastType;	// 1.属性重铸 2.符石重铸
	uint16 score;		// 本次重铸评分
	RecastPosInfo recastInfo;
};

struct EquipRefineLevel
{
	uint8 type;   //装备部位
	uint16 bless; //部位精炼祝福值
	uint8 level; //精炼等级
};

struct EquipStarLevel
{
	uint8 type;   //装备部位
	uint8 level; //升星等级
};

//装备部位精炼等级
struct GS2U_EquipRefineLevel <-
{
	vector<EquipRefineLevel> equipRefines;  
};

//装备精炼
struct U2GS_EquipRefine ->
{
	uint8  type;          //装备部位类型
	uint16 goodluckCharmId; //幸运符ID
};

//装备一键精炼
struct U2GS_EquipRefineOneKey ->
{
};

//装备精炼
struct GS2U_EquipRefineResult <-
{
	uint64  code;
	uint8 type;   //装备部位
	uint16 bless; //部位精炼祝福值
	uint8 level; //精炼等级
};

struct GS2U_EquipRefineResultOneKey <-
{
  uint64  code;
  uint8   levelOld;
  uint8   levelNew;
  vector<uint8> typeList;
};

struct EquipUpStarInfo
{
	uint8  pos;   //装备部位
	uint8  level; //星星等级
	uint8  prog;  //部位冲星进度
	uint16 bless; //部位冲星祝福值
};

//初始化装备星级列表
struct GS2U_EquipUpStarInfoList <-
{
	vector<EquipUpStarInfo> equipUpStars;
};

//装备冲星
struct U2GS_EquipUpStar ->
{
	uint8 pos;  //装备部位
	uint8 type; //0:单次冲星 1:一键冲星
};

//装备全部位升星
struct U2GS_EquipUpStarOneKey ->
{
};
struct starCostItem
{
	uint16			itemID; //冲星消耗材料ID
	uint16			itemNum;//冲星消耗材料数量	
};



//装备冲星结果
struct GS2U_EquipUpStarRes <-
{
	EquipUpStarInfo equipUpStarInfo;
	uint8			type;	//冲星类型0:单次冲星 1:一键冲星
	uint16			index;	//冲星次数
	vector<starCostItem> costList; 
	uint32			coin;	//冲星消耗金币
	uint8			res;	//冲星结果(0:材料不够,失败1:金币不够,失败2:冲星当前进度成功3:冲星等级成功4:冲星失败)
};

//成长装备(荣誉等级)
struct U2GS_HonorLevel ->
{
};

//宝石数据
struct GemEmbedInfo
{
	uint64 gemID;    //宝石ID
	uint8 slot;       //宝石镶嵌部位编号
};

struct EquipGemInfo
{
	uint16 equipPos; // 装备部位
	vector<GemEmbedInfo> gemList;
};

//宝石数据初始化
struct GS2U_EquipGemInfos <-
{
	vector<EquipGemInfo> equipGemInfos;
};

struct GS2U_EquipGemInfoUpdate <-
{
	EquipGemInfo equipGemInfo;
};

//宝石拆卸
struct U2GS_GemOperate ->
{
	uint16 opType; 		// 1 : 宝石升级 ； 2： 宝石镶嵌 ； 3：宝石卸载
	uint16 equipPos; 	// 装备部位
	uint8  gemPos;		// 宝石孔位
	uint64 params;		// 参数 目前就opType = 2 使用，镶嵌宝石的GUID
};


//宝石拆卸
struct U2GS_GemEmbedOff ->
{
	vector<uint64> gemUIDs;     //宝石UID
};

//宝石镶嵌
struct U2GS_GemEmbedOn ->
{
	vector<GemEmbedInfo> gemEmbedInfoList;   //要镶嵌的宝石数据
};

//宝石增加
struct GS2U_GemEmbedAdd <-
{
	GemEmbedInfo gemEmbedInfo;   //宝石信息
};

//宝石卸载结果
struct GS2U_GemEmbedDelete <-
{
	vector<uint64> gemUIDs;     //宝石UID
};

//宝石镶嵌背包初始
struct GS2U_GemEmbedInit <-
{
	vector<GemEmbedInfo> gemEmbedInfos;   //宝石镶嵌数据全量初始化
};

//宝石合成
struct U2GS_GemEmbedMake ->
{
	uint32 id;		// 宝石ID
	uint32 count;	// 合成个数
	uint8  flag;	// 是否只消耗非绑定钻石来合成非绑定宝石
};

//宝石合成
struct U2GS_GemEmbedMakeOnce ->
{
	uint32 id;		// 宝石ID
	uint32 bindCount;	// 绑定宝石个数
	uint32 unBindCount;	// 非绑定宝石个数
};

//宝石合成结果
struct GS2U_GemEmbedMakeResult <-
{
	uint64 gemUID;    //宝石UID
};

//插入共享装备,支持批量
struct U2GS_SharedEquip ->
{
	vector<uint64> equipUIDs;  //装备UID
};

//查看装备信息
struct U2GS_QueryEquipByUID ->
{
	uint64 roleID;		// 来源UID
	uint64 equipUID;	// 装备UID
};

//查看装备的结果
struct GS2U_QueryEquipResult <-
{
	EquipItemInfo equipInfo;  //装备详细信息
};

//查看普通道具的结果
struct GS2U_QueryItemResult <-
{
	NormalItemInfo itemInfo;  //道具详细信息
};

//装备分解
struct U2GS_EquipResolve ->
{
	vector<uint64> equipUIDs;      //要分解装备的UID
};

//资源兑换，只限于装备分解得到的精华值来兑换物品
struct U2GS_ResourceExchange ->
{
	uint32 id;         //ID(兑换列表中的Id编号）
	uint16 itemCount;      //兑换物品数量
	uint16 opType;	//0为原来的，找回1
};

//兑换成功时发送，失败时发错误码
struct GS2U_ExchangeResult <-
{
	uint32 id;         //ID(兑换列表中的Id编号）
	uint16 itemCount;      //兑换物品剩下数量
};

//支付物品
struct PayItemOfExchange
{
	int32	item;//-1:使用紫色精华;-2:使用金色精华,正数为item表中的物品id
	uint16	number;//数量
}

//兑换资源信息
struct ExchangeResource
{
	uint32 id;	//兑换列表ID
	uint8 groupID;  //组ID
	uint  itemID;   //道具ID
	vector<PayItemOfExchange>	payItem;//支付物品
	uint8 playerLevel; //需要玩家级别
	uint16 limit;    //兑换上限
};

//初始化资源兑换列表
struct GS2U_ResourceExchangeList <-
{
	vector<ExchangeResource> resources;   //资源列表
};

//玩家第一次请求可以兑换的资源，只请求一次，客户端缓存
struct U2GS_RequestExchangeResource ->
{
};

//请求资源交换中，玩家已经兑换过的终身限兑的配置id
struct U2GS_RequestExchangeResourceForeverLimitID ->
{
};
struct GS2U_RequestExchangeResourceForeverLimitIDAck <-
{
	vector<uint16> iDList;   //资源配置id列表
};

//请求限制标志的配置id
struct U2GS_RequesForeverLimitID ->
{
	uint8	type;
};
struct GS2U_RequestForeverLimitIDAck <-
{
	uint8	type;
	vector<uint16> iDList;   //资源配置id列表
};

//购买某个配置id中的物品
struct U2GS_RequesBuyID ->
{
	uint8	type;
	uint32	id;
};
struct GS2U_RequesBuyIDAck <-
{
	uint8	type;
	uint32	id;
	bool	succ;//是否成功
};

//远程玩家信息查看请求
struct U2GS_LookRPInfo_Request ->
{
	uint64 roleID; //角色ID
	uint8 view_type; //查看远程类型:1角色，2时装，3宠物，4婚姻，5身份证;查看身份证返回GS2U_Identity_Ack
};

//女神觉醒信息
struct LookWakeInfo
{
	uint8   cardID;			//女神卡片ID
	uint8	level;			//觉醒等级
};

//宝石信息
struct LookGemInfo
{
	uint16	gemID;		//宝石ID
	uint8	slot;		//宝石孔位
};

// 宠物装备信息
struct LookPetEquipInfo
{
	uint8 equipID;				//宠物装备ID
	uint8 equipLv;				//宠物装备等级
};

struct LookPetSkill
{
	uint16 petSkillId;			//宠物技能ID
	uint8  petSkillLv;			//宠物技能等级
	uint8  petSkillType;		//宠物技能Type 0:天赋技能 1:通用技能 2:基础技能
};

//宠物信息
struct LookPetInfo
{
	uint16 	petID;				//宠物ID
	uint8	petStar;			//宠物星阶
	string  petname;    		//宠物名字
	uint32	petForce;			//宠物战斗力
	uint16	petColNum;			//宠物收集数
	uint8   petRaw;				//宠物转生
	vector<LookPetSkill> petSkill//宠物技能
	vector<LookPetEquipInfo> equalInfo	//宠物装备
	vector<float> petPropValues;//宠物战斗属性
};

//神器信息
struct LookGodWeaponInfo
{
	uint8 weaponID;				//神器ID
	uint16 weaponLevel;			//神器等级
	uint16 skillLevel;			//神器技能等级
};

//远程玩家信息查看结果，角色
struct GS2U_LookRPInfo_Result <-
{
	uint64 roleID;					//角色ID
	string roleName;				//角色名
	uint32 career;                  //角色职业
	int8	race;					//种族
	int8	sex;					//性别
	uint32 head;
	uint16 frameID;                 //头像框
	uint8 level;					//玩家等级
	uint32 roleForce;				//玩家战斗力
	uint8 equipHonorLevel;			//荣誉装备等级
	//uint8 activePart;  				//1:觉醒  2:宝石  3:坐骑
	string guildName;				//家族名
	//uint8 guileLevel				//玩家公会职位
	//int16 vipLevel					//爵位等级
	int32 playerKillValue;			//玩家杀戮值	
	int32 wingLevel;				//翅膀等级
	//int32 arenaVal;					//跨服竞技场积分
	//vector<uint32> titleList;		//玩家称号列表
	vector<float> propValues;		//战斗属性列表
	vector<EquipItemInfo> equips;   //装备信息
	vector<uint32> fashionList;		//穿在身上的时装
	//vector<LookWakeInfo> wakeInfo;			//觉醒信息
	//vector<LookGodWeaponInfo> weaponInfo; 	//神器信息
	//LookPetInfo petInfo;					//查看宠物信息
	vector<EquipRefineLevel> equipRefines; 	//玩家部位强化等级
	vector<EquipStarLevel> equipStar;		//玩家装备升星等级
	//PlayerPersonalityInfo personalityInfo;	//玩家个性信息
	vector<EquipGemInfo> equipGemInfos;//玩家镶嵌信息
	vector<RecastPosInfo> recastInfoList;//玩家附魔属性
};

// 时装信息 NOTE: 未获取不发
struct RPView_FashionInfo
{
	uint32			fashionID;	// 时装ID
	uint32			time;		// 剩余时间 小于等于0：过期 大于0：对应的秒数
};

//远程玩家信息查看结果，时装
struct GS2U_LookRPInfo_Fashion <-
{
	uint64 roleID;					//角色ID
	vector<RPView_FashionInfo> datas;	// 返回时装列表
	vector<uint32>	activeFashionSuitList;	// 已经激活的套装列表
};

struct RPView_AddProp
{
	uint8 prop;
	float value;
};

// 宠物信息
struct RPView_PetBaseInfo
{
	uint16  petID;				//宠物ID
	uint8	petStar;			//宠物星阶
	uint8	status;				//宠物是否出战 0:休息(非助战) 1:休息(助战)2:出战（非召唤）3:出战（召唤）
	string  petName;			//宠物名字
	uint8   petRaw;				//宠物转生
	vector<RPView_AddProp> petProps;	//宠物属性
	uint64  petForce;			//宠物战斗力
	uint32	upCount;			//宠物提升次数
	uint petLevel;				//宠物等级
	uint petExp;				//宠物经验
};

// 助战信息
struct RPView_AssistBattleInfo
{
	uint16 petID; //宠物ID
	uint8  slot;  //位置
};

// 头像框信息
struct PortraitFrame
{
    uint16      id;                 //头像框ID
    uint32      endTime;            //结束时间  到期时间 UTC秒 0表示永久
};

// 已获取头像框
struct GS2u_OwnPortraitFrame <-
{
    uint8                   state;              //状态 1.所有已获取的头像框列表 2.新获取的头像框列表
    vector<PortraitFrame>   portraitFrameList;  //头像框列表
};

// 获取所有头像框
struct U2GS_GetPortraitFrameList ->
{
};

// 操作某个头像
struct U2GS_OperatePortraitFrame ->
{
    uint8       state; //状态 3.装配 4.取下
    uint16      id;    //头像框ID
};

//远程玩家信息查看结果，宠物
struct GS2U_LookRPInfo_Pet <-
{
	uint64 roleID;					//角色ID
	vector<RPView_PetBaseInfo> petInfoList;	// 助战及上的所有宠物
	vector<RPView_AssistBattleInfo> infoList;  // 助战信息
};

//远程玩家信息查看结果，婚姻
struct GS2U_LookRPInfo_Marriage <-
{
	uint64  roleID;		// 角色ID
	uint64  id;         // 配偶角色ID（无配偶时为0）
	string  name;       // 配偶角色姓名
	uint8   sex;        // 配偶性别
	uint32  weddingDay; // 结婚时间（服务器同步时间，自1970-01-01至今的秒数）
	uint32  closeness;  // 亲密度
};

//远程玩家信息查看结果，身份证
//返回GS2U_Identity_Ack

struct washReturnItemInfo
{
	uint16 	itemID;		//商品ID
	uint16	itemNum;	
};

//分解装备返回得到的精华总数
struct GS2U_GetEssenceNum <-
{
	uint purpleEssence;
	uint goldenEssence;
	vector<washReturnItemInfo> itemList;
};

//一键出售装备
struct U2GS_SellAllEquip ->
{

};

//锁定物品
struct U2GS_LockGoods ->
{
	uint64	goodsUID;
	uint8	bagType;	// 背包类型
};

// 锁定物品的返回消息
struct GS2U_LockGoods <-
{
	uint64  goodsUID;
	uint8	bagType;	// 背包类型
	bool	isLocked;	// true为锁定，false为非锁定
};

// U2GS上传玩家照片,GS2U初始化玩家照片（约定最大是1w个byte，每个消息里m_data最大是3500个byte)
struct UpLoadingPhoto <->
{
	uint8  type;			//类型
	uint64 roleID;			//发给的玩家ID
	uint8 sectionNum;		//总段数
	uint8 sectionIndex;		//段的编号
	vector<uint8> data; 	//照片数据
}
// 上传照片结果
struct GS2U_UpLoadingPhotoResult <-
{
	bool result;
}
// 加标签
struct U2GS_AddTag ->
{
	string tag;			//标签
}
// 加标签结果
struct GS2U_AddTagResult <-
{
	bool result;
}
// 删除标签
struct DelTag <->
{
	uint8 index;
}

// 给其他玩家添加印象
struct U2GS_AddImpression ->
{
	uint64 roleID;		//角色ID
	string impression; 	//添加印象
}
// 给其他玩家添加印象结果
struct GS2U_AddImpressionResult <-
{
	bool result;
}
// 自己删除别人印象
struct DelImpression <->
{
	uint16 uid;
}

// 点赞其他玩家
struct U2GS_AddPraise ->
{
	uint64 roleID;			//角色ID
}
// 点赞其他玩家成功
struct GS2U_AddPraise <-
{

}
// 玩家获得点赞
struct GS2U_GainPraise <-
{

}
// 举报其他玩家
struct U2GS_Report ->
{
	uint64 roleID;			//角色ID
}
// 举报其他玩家成功
struct GS2U_Report <-
{

}
// 举报次数到上限
struct GS2U_Report_Max <-
{

}

//玩家扩展信息
struct U2GS_PlayerExtenInfo ->
{
	uint8 type;			//信息类型1:生日;2:地址;3:星座;4:签名
	string info;		//信息
}
// 保存玩家扩展信息成功
struct GS2U_PlayerExtenInfo <-
{
	uint8 type;			//信息类型1:生日;2:地址;3:星座;4:签名
}
// 玩家被禁止传照片
struct GS2U_Forbidden_Load_Photo <-
{
	uint64 forbiddenTime;			//
}

//装备合成ACK
struct GS2U_EqupmentCombinAck <-
{
	uint32 combinID;
	bool	success;
	vector<EquipItemInfo> items;   //增加装备的具体信息
};