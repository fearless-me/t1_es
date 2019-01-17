// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 请求创建家园，创建成功，返回GS2U_HomeInfo
struct U2GS_CreateHome ->
{
	uint adminAreaID;	// 玩家选择的区域ID，home.xlsx中的id
	string homeName;	// 创建家园时，名字
};

// 请求进入家园
struct U2GS_EnterHome ->
{
	uint64 roleID;	// 进入家园
	uint8 flag;		// 进入标志，1进入居所，2进入庭院
};

// 请求家园信息
struct U2GS_RequestHomeInfo ->
{
	uint64 roleID;	// 主人ID
	bool   isShowErrCode; //是否给出错误提示
};

struct HomeArea
{
	uint64 homeID;
	uint areaID;	// 房屋区域ID，1居所，2庭院，3饲养区，4种植区A，5温泉，6篝火区，7许愿池，8种植区B，9种植区C
	uint areaLvl;	// 区域等级
};

// 当前所处家园的归属
struct GS2U_EnterHome <-
{
	uint64 homeID;	// 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
	uint64 ownerID;	// 家园拥有者ID
	uint16 mapID;	// 当前地图ID
};

// 家园信息
struct GS2U_HomeInfo <-
{
	uint64 homeID;	// 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
	string homeName;	// 为空则表示默认名字，由客户端自行拼接
	string serverName;	// 服务器名字
	uint64 ownerID;	// 家园拥有者ID
	string ownerName;	// 名字
	uint64 mateID;	// 同居者，配偶ID
	string mateName;	// 配偶名字
	uint stylish;	// 华丽度
	uint comfort;	// 舒适度
	uint homeLvl;	// 家园等级
	uint popularity;	// 人气值
	uint64 leftID;	// 左邻ID
	string leftName;	// 名字
	uint64 rightID;	// 右舍ID
	string rightName;	// 名字
	vector<HomeArea> areas;	// 开放的区域
	uint64 homeUpCd;    //家园升级到期时间
};

// 单独刷新家园易变信息
struct GS2U_FreshHomeInfo <-
{
	uint64 homeID;
	string homeName;
	uint stylish;	// 华丽度
	uint comfort;	// 舒适度
	uint homeLvl;	// 家园等级
	uint popularity;	// 人气值
	uint64  upgredeHomeCd; //家园升级到期时间
};

// 单独刷新区域信息
struct GS2U_FreshHomeAreaInfo <-
{
	uint64 homeID;
	vector<HomeArea> areas;	// 开放的区域
};


// 
struct UpgradeHomeData
{
	uint16 itemID;//
	uint16  num;
};

// 升级家园
struct U2GS_UpgradeHome ->
{
	vector<UpgradeHomeData> upgredeDataList;
};

// 修改家园名字
struct U2GS_ChangeHomeName ->
{
	uint64 homeID;
	string homeName;
};

// 升级房屋
struct U2GS_UpgradeHomeArea ->
{
	uint64 homeID;
	uint8 areaID;	// 房屋区域ID，1居所，2庭院，3饲养区，4种植区A，5温泉，6篝火区，7许愿池，8种植区B，9种植区C
};

// 请求家园可拜访列表
struct U2GS_HomeVisit ->
{
	uint8 paga;		// 请求好友的页数，为0表示请求邻居
};

struct HomeVisit
{
	uint64 roleID;
	string roleName;
	uint level;	// 玩家等级
	uint32	career;				// 职业
	int8	race;				// 种族
	int8	sex;				// 性别
	int32	head;				// 头
	uint16	frameID;				// 头像框
	uint64 homeID;
	int closeness;	// 亲密度，非好友为-1
	vector<uint8> face;  // 自定义头像MD5(16byte)
	int32 stylish; //华丽度
	bool isCanPick; //是否可以摘菜
	bool isdecorate; //是否装修模式,true 是 else 不是
};

// 返回家园可拜访列表
struct GS2U_HomeVisitList <-
{
	uint16 allnumber;	// 总条数
	uint8 paga;	// 当前页数
	vector<HomeVisit> visits;	//列表
};

// 请求拜访记录
struct U2GS_RequestVisitRecord ->
{
	uint64 roleID;
};

// 拜访记录
struct VisitRecord
{
	uint64 roleID;
	string roleName;
	uint8 relationType;	// 关系类型：1好友，2伴侣男，3伴侣女，4陌生人
	uint8 opType;	// 操作记录：1拜访，2收菜，3菜熟了，4菜长虫了，5健康低于20，6 宠物经验休息满了，7宠物可以喂养了，7家园可以升级了
	uint32 opParam1;
	uint32 opParam2;
	uint32 opParam3; //产物ID 
	uint64 timestamp;	// 时间戳
};

// 返回拜访记录
struct GS2U_VisitRecord <-
{
	vector<VisitRecord> lists;	// 拜访记录
};

// 种植区作物状态推送
// 进入庭院时推送
struct Plant
{
	uint64	homeID;
	uint8		areaType;				// 4种植区A，8种植区B，9种植区C

	uint64		itemUid;						// 种植在家具上的ITEMUID点（）
	uint16	id;							// 作物ID，对应配置表plant.id
	uint32	time;						// 种植时间

	uint8		health;					// 健康值
	uint8		wateringCount;	// 当日浇水次数
	uint32	wateringTime;		// 最后浇水时间
	uint8		compostCount;		// 当日施肥次数
	uint8		compostTime;		// 最后施肥时间
	bool		isPestis;				// 是否处于虫害状态
};
struct GS2U_HomePlant_Sync <-
{
	vector<Plant>	listPlant;
};

// 种植区_各种操作
// 操作类型：
// 1.种植，需要消耗道具；
// 2.清除；
// 3.收获；
// 4.浇水；
// 5.施肥，需要消耗道具；
// 6.除虫
struct U2GS_HomePlantOperate_Request ->
{
	uint64	homeID;
	uint8		areaType;				// 4种植区A，8种植区B，9种植区C
	uint64		itemUid;						// 种植在家具上的UID
	uint8		operateType;		// 操作类型
	uint16	itemID;					// 可能消耗的道具ID
};
struct GS2U_HomePlantOperate_Ack <-
{
	uint64	roleID;					// 操作者角色ID
	uint8		operateType;		// 操作类型
	uint32	reason;					// 操作成功时为0，否则是ErrorCode
	Plant		plant;					// 刷新作物属性
};

// 饲养区-----------------------------


struct FarmingPet
{
	uint64      itemUid          // 饲养在家具上的UID
	uint16      petID
	uint16		deltaTime;		// 累计时间  分
	uint64	    time;		    //当前服务器时间 1970 年 秒
	uint16	    lastdeltaTime;		//最后一次放入时长
	uint16      addTime;         //喂养后增加的时间
};
// 饲养区宠物ID
struct GS2U_HomeFarming_Sync <-
{
	vector<FarmingPet>	petList;
};
// 放置宠物进饲养区
struct U2GS_PutPetInFarming ->
{
	uint64	homeID;
	uint16	petID;
	uint8	areaType;				// 3饲养区
	uint64  itemUid        // 要饲养哪个家具上
};

// 饲养区放置宠物的结果
struct GS2U_PutPetInFarmingResults_Sync <-
{
	uint8		result;		// 1，成功，2超过当前最大放置数量
	FarmingPet  petFarming ;
};

// 取出宠物
struct U2GS_PutOutPetFarming ->
{
	uint64  itemUid        // 要取哪个家具上
	uint64	homeID;
	uint16	petID;		
	uint8	areaType;				// 3饲养区	
};

// 取出结果
struct GS2U_PutOutPetFarmingResults_Sync <-
{
	uint64  itemUid        // 要取哪个家具上
	uint8		result;		// 1，成功，2失败
	uint16	    petID;
	uint16	    exp;    //获得经验
	uint16       minutes  //放置了的时间，分钟为单位
};

// 进食！
struct U2GS_GetPetFood ->
{
	uint64  itemUid        // 要喂在哪个家具上
	uint64	homeID;
	uint16	petID;	
	uint16	itemID;					// 可能消耗的道具ID
	uint8	areaType;				// 3饲养区	
};

// 进食结果
struct GS2U_GetPetFoodResults_Sync <-
{
	uint64     itemUid        // 要喂在哪个家具上
	uint8		result;		// 1，成功，2次数已满，3资源数量不足
	uint16	    petID;
	uint16      addTime;   //增加的时间
};




// 家园小屋------------------------

//每个家具的展示的DATA
struct HomeLayoutInfo
{
	uint64 uid;   //家具唯一ID
	uint64 roleID;//拥有者ID
	uint16 itemID; 
	int    gridID;   //格子ID
	int    rotationY;  //旋转
	uint8   type; //家具类型:1为普通家具，2可多人交互，3为精灵球可养殖，4位种植，5，家具仓库
}

//玩家在可交互家具上的信息
struct FurniTruePlayerInfo
{
	uint64 roleID;
	uint8 seatID; //位置
}


//交互家具的数据结构
struct FurniInteractTrueData
{
	uint64 itemUID; // 道具UID
	vector<FurniTruePlayerInfo> playerList;	// 乘坐玩家
	uint64 roleID ;	// 拥有者
}

//进入家园 初始化 所有家具数据
struct GS2U_SendAllFurniInfo_Sync <-
{
	string    greetings; //问候语
	uint8     furniTrueLevel; //小屋等级
	uint8     extendLevel; //小屋面积扩展等级
	uint16    wallID; //墙的道具ID
	uint16    floorID; //地板的道具ID
	bool      isdecorate; //装修模式
	vector<HomeLayoutInfo>  betweenExampleData; //家园
	vector<FurniInteractTrueData> interactList;//家具交互数据
};

//扩展面积高度
struct U2GS_ExtendArea ->
{
	uint64	homeID;
	uint8	areaType;	// 家具区域1
};

struct GS2U_ExtendAreaResult_Sync <-
{
	bool   isSuccuss;  //扩展是否成功
	uint8  extendLevel;  //扩展等级	
};

//主人问候
struct U2GS_SetGreetings ->
{
	uint64	homeID;
	uint8	areaType;	// 家具区域1
	string   greetings; //主人写的问候语
}

struct GS2U_SetGreetingsResult_Sync <-
{
	bool   isSuccuss;  //是否成功
	string   greetings; //主人写的问候语
};


//删除场景里面的家具
struct U2GS_DelSenceTheFurniTrue ->
{
	uint64	homeID;
	uint8	areaType;	// 家具区域1	
	uint64  uid;   //家具唯一ID
}

//返回删除结果
struct GS2U_DelSenceTheFurniTrueResult <-
{
	bool isSucc; //是否成功
	uint64  uid
}

//保存设计的小屋方案
struct U2GS_SaveFurniTrueScheme ->
{
	uint64	homeID;
	uint8	areaType;	// 家具区域1	
	uint16    change_wallID; //墙的道具ID,没有改变发0过来
	uint16    chang_floorID; //地板的道具ID，没有改变发0过来
	vector<HomeLayoutInfo>  add_furnitrueData; //添加的家具
	vector<HomeLayoutInfo>  change_furnitrueData; //修改的家具
}

//返回保存结果
struct GS2U_SaveFurniTrueResult_Sync <-
{
	bool isSucc; //是否成功
	uint16    change_wallID; //墙的道具ID
	uint16    chang_floorID; //地板的道具ID
	vector<HomeLayoutInfo>  add_furnitrueData; //添加的家具
	vector<HomeLayoutInfo>  change_furnitrueData; //修改的家具
}

//加载小屋数据
struct U2GS_LoadFurniTrueScheme ->
{
	uint64	homeID;
	uint8	areaType;	// 家具区域1	
}

//加载小屋数据结果
struct GS2U_LoadFurniTrueResult_Sync <-
{
	bool isSucc; //是否成功
}

struct GivingFurniTrue
{
	
	uint16 itemID;
	uint16 num;
}

//赠送家具给伴侣
struct U2GS_GivingFurniTrueForPartner ->
{
	uint64  partherRoleID;  //伴侣的RoleID
	uint64	homeID;
	uint8	areaType;	// 家具区域1	
	uint16  itemID;      //赠送的家具ID
	uint16  num;
}

//赠送家具给伴侣的返回结果
struct GS2U_GivingFurniTrueForPartnerResult <-
{
	bool    isSucc; //是否成功
	uint16  itemID;      //赠送的家具ID
	uint16  num;
}

//切换 装修模式
struct U2GS_ChangedecorateModel ->
{
	uint64	homeID;
	uint8	areaType;	// 家具区域1	
	bool    isDecorate;  //是否装修，选择装修 传TRUE,装修完了，取消装修，退出，下线，发FLASE
}

//切换 装修模式 结果
struct GS2U_ChangedecorateModelResult <-
{
	bool    isSucc; //是否成功
}




//使用家具，比如睡觉，坐沙发
struct U2GS_UseFurnitrue ->
{
	uint64	homeID;
	uint8	areaType;	// 家具区域1	
	uint64  itemUID;   //家具唯一ID
	bool    isUp;  // 坐上 true,下来 FALSE
}

//使用结果
struct GS2U_UseFurnitrueResult <-
{
	bool    isUp; //是否上下
	uint64  roleID;//操作人
	uint64  itemUID;   //家具唯一ID
	uint8	seatID;	// 位置	
	bool    isdoubleSleep;//是否双人睡觉、true开始 计算经验，false停止，如果没有的则不管
	
}

//邀请好友上床
struct U2GS_Invitefriendstobed ->
{
	uint64  roleID;// 邀请目标的ID
	uint64	homeID; //邀请好友要进的家园ID
	uint8	areaType;	// 家具区域1	
	uint64  itemUID;   //家具唯一ID
}
//好友收到邀请
struct GS2U_Invitefriendstobed <-
{
	uint64  roleID;// 邀请人的ID
	uint64	homeID; //邀请好友要进的家园ID
	uint8	areaType;	// 家具区域1	
	uint64  itemUID;   //家具唯一ID
}

// 家园小屋------------------------


//家园BOSS  start
//预告函结构
struct HomeLetter
{
	uint64  itemUID;   //唯一ID
	uint64  overTime;   //结束时间
}

//发送预告函  登录有就发，没有就不发  在线时间到会发
struct GS2U_SendHomeLetter <-
{
	HomeLetter letter;//背包里面的预告函对应的数据
}

//请求进入家园位面
struct U2GS_EnterBitHome ->
{
	uint64  itemUID;   //唯一ID
}

//家园位面 结算
struct GS2U_HomeBitResult <-
{
	uint64  homeID;   //主人的家园ID
	uint8   level;  //家园等级
	uint8   phase;  //家园进度
}
//------家园BOSS ---------

