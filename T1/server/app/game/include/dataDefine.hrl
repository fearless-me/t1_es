%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 数据管理定义
%%% @end
%%% Created : 22. 九月 2016 14:02
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(DATA_DEFINE_hrl).
-define(DATA_DEFINE_hrl,1).

-include("gamedata.hrl").

%% 在线玩家，下线即删除
-record(rec_OnlinePlayer, {
    roleID = 0,
    code = 0,
    accountID = 0,
    pid = undefined,
    netPid = undefined,
    playerSaveTime = 0, %% 最后一次定时保存时间
    loginTime = 0,   %% 上线时间

    % 挂载到角色的LBS数据
    % 角色的在线信息中将包含该部分信息，包含普通服/跨服的#rec_OnlinePlayer{}和中心服的#recPlayerInfo{}
    % 1.由各普通服/跨服维护自己的#rec_OnlinePlayer{}，同步相关数据到中心服的#recPlayerInfo{}
    % 2.中心服角色上线、下线、经纬度发生变化时，通知?PsNameLBS刷新经纬盘
    % 3.?PsNameLBS收到消息后并不立即计算，而是存入计算缓存，等待心跳进行计算
    % 4.因为时间差，可能在一次心跳间隔中，同一角色有多次计算请求。以最后一次计算请求为准
    lat	= 999.0	:: float(),		%% 经度[-180.0,180.0] 单位为角度，负表示西经，正表示东经，初始化为无效值表示不需要计算
    lng	= 999.0	:: float()		%% 纬度[-90.0,90.0] 单位为纬度，负表示南纬，正表示北纬，初始化为无效值表示不需要计算
}).

%% 玩家数据，这段名为对应的表名，值为对应的list
-record(rec_playerdata, {
    roleID = 0,                                                 %% 角色ID
    rec_player_prop = [] :: [#rec_player_prop{}, ...],          %% 玩家属性
    rec_task_accepted = [] :: [#rec_task{}, ...],      %% 接受任务列表
    rec_task_submitted = [] :: [#rec_task_submitted{}, ...],    %% 完成任务列表
	activeCode4Many = [] ::[integer(),...],	%% 角色已经领取了的万用礼包keys
	rec_player_monster_book = [] :: [#rec_player_monster_book{}, ...],	%% 怪物图鉴数据
    thisIsEndFlag = undefined
}).

%% 本数据库所有角色加名字列表
-record(rec_RoleName, {
    roleID = 0,             %% 角色ID
    roleName = ""           %% 角色名
}).


-record(rec_OnlineAccount,{
    accountID = 0,
    pid = undefined,
    netPid = undefined
}).
-endif.