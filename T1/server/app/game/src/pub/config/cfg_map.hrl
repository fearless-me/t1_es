%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("tiancheng").

-ifndef(cfg_map).
-define(cfg_map, 1).

%% 地图配置表
-record(mapCfg, {
    %% 行描述
    desc__,
    
    %% 地图ID
    id,
    
    %% 地图类型
    %% 0：普通地图
    %% 1：副本地图
    %% 2：分组地图
    %% 3：活动地图
    type,
    
    %% 地图子类型
    subtype,
    
    %% 是否跨服地图
    %% 0:本服
    %% 1:跨服
    is_cross,
    
    %% 地图名
    name,
    
    %% 资源1
    res1,
    
    %% 资源2
    res2
}).

-endif.
