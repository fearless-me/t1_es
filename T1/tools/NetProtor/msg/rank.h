// -> client to server
// <- server to client
// <-> client & server

//目前支持以下几种数据类型：
// bool,vector,string,float double
// int8,int16,int32,int,int64,
// uint8,uint16,uint32,uint,uint64

// 排行榜中的称号
struct TitleData
{
	uint title1;
	uint title2;
	uint title3;
	uint color;
	uint background;
	string customTitle;		    //自定义title的内容
};

// 排行榜每行数据
struct RankInfo
{
	uint8			rankSort;	// 排行榜名次
	int8			rankSortC;	// 排行榜名次变化，正数为上升，负数为下降
	uint64			roleID;		// 角色ID
	string			name;		// 角色名
	int32			wingLevel;	// 翅膀等级
	int64			rankValue1;	// 排行榜数值1
	int64			rankValue2;	// 排行榜数值2(如果排行榜类型为5(宠物榜)，则此项保存的是上榜的宠物ID，右侧显示对应的宠物)
	int64			rankValue3;	// 排行榜数值3
	TitleData		title;		// 排行榜中玩家的称号
    uint16          frameID;    // 排行榜中玩家头像框
	uint32		career;			// 职业
	int8			race;				// 种族
	int8			sex;				// 性别
	int32			head;				// 系统头像（自定义头像使用其它接口获取）
	int32			level;			// 角色等级
};

// 返回该类型的排行榜数据
struct GS2U_SendRank <-
{
	uint8 type; // 排行榜类型
	vector<RankInfo> datas;
};

// 请求该类型的排行榜数据
struct U2GS_RequestRank ->
{
	uint8 type; // 排行榜类型
};

// 请求该类型排行榜上这个玩家的roleinfo
struct U2GS_RequestPropList ->
{
	uint8	type;		// 排行榜类型
	uint64	roleID;		// 角色ID
};

// 排行榜上玩家穿戴的装备列表
struct PlayerEquip
{
	uint equipID;	// 装备ID
	uint8 quality;	// 品质
};

//玩家装备部位等级
struct PlayerEquipLevel
{
	uint8 type;
	uint8 level;
};

// 返回该类型排行榜上这个玩家的roleinfo
struct GS2U_SendPropList <-
{
	uint64		roleID;			// 角色ID
	uint64		playerCode;     // 玩家流水号
	uint32		career;			// 职业
	int8		race;			// 种族
	int8		sex;			// 性别
	int32		head;
	int32		wingLevel;		// 翅膀等级
	vector<int32> fashionIDs;	// 时装ID列表
	vector<PlayerEquip>	equipIDList;	// 装备ID列表
	vector<PlayerEquipLevel> equipLevelList; //装备等级列表
}

// 到点刷新，通知所有在线玩家
struct GS2U_RefreshRank <-
{
	uint8 type;		// 排行榜类型
}

// 按排行榜名次领奖(每次重新发榜均可再次领奖)
struct U2GS_RequestRankAward ->
{
	uint8	type;		// 排行榜类型
}

//请求活动地图中的榜单
struct U2GS_RequestActivityMapRank ->
{
	uint8	type;		// 排行榜类型
}

struct ActivityMapRankData
{
	string			name;		// 角色名
	uint64			value;//值
}
// 到点刷新，通知所有在线玩家
struct GS2U_ActivityMapRankData <-
{
	uint8	type;		// 排行榜类型
	vector<ActivityMapRankData> data;//数据列表
}
//扩展数据
struct GS2U_MyRankingAndDamage <-
{
	uint8	type;		// 排行榜类型
	uint16			ranking;		//我的名次（进攻方）
	uint64			damage;//伤害值
}
struct GS2U_MyKillNumber <-
{
	uint8	type;		// 排行榜类型
	uint16			killNumber;		//我杀的人数（防守方）
}




struct GS2U_SendCharmRankFirstData <-
{
	uint64		roleID;			// 角色ID
	int8        sb_type;    // 排名展示的类型
	string		name;		// 角色名
	uint64      playerForce      //战力
	int32       level            //等级
	uint32      charm;           //魅力
	string      sign;            //签名
	string      guildName;        //家族名字
}


//展示雕像模型数据，需要名字
struct RankModelData
{
	uint64		roleID;			// 角色ID
	int8        sb_type;    // 排名展示的类型
	string		name;		// 角色名
	uint32		career;			// 职业
	int8		race;			// 种族
	int8		sex;			// 性别
	int32		head;
	int32		wingLevel;		// 翅膀等级
	vector<int32> fashionIDs;	// 时装ID列表
	vector<PlayerEquip>	equipIDList;	// 装备ID列表
}
//排名靠前的一些玩家 需要展示 雕像
struct GS2U_SendRankModelData <-
{
	
	vector<RankModelData>	playerRankMoldelList;	// 策划指定的一些特定排名展示模型列表
	
}