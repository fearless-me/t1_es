# toto list

* ~~cache 需要换掉~~
* ~~节点互联，换成gen_rpc方式,尽量支持一机多服，不需要改配置~~
* ~~mnesia的使用尽量放在中心服或者提供一种机制各个服务器可以自动生成~~
* ~~重新构建dbs的设计，针对上层提供接口，隐藏底层实现~~
* 登录系统提供排队，放到最后来做
* ~~如果决定采用任意服务器可登录的机制，需要实现管控机制~~
* 预警策略
* 优化地图玩家、怪物、宠物等储存，遍历等等
* 玩家、宠物战斗相关的数据划分
* ~~mod_??全部转化成纯模块， 将otp剥离转入serv_?~~
* 防加速
* 是否可以将地图上所有的对象(Monster, NPC, Pet, Player) 按分类放入同一个ETS? 
* 玩家帧率控制 消息大小或者*消息量*
* 太过于频繁变化的list操作比如属性计算会导致内存持续升高。GC可以解决这个问题，但是要想个方法避免这种情况
* **PRODUCT** 环境中去掉test目录下的模块
* 针对客户端的断线重连，*客户端* 要有一定的退避(back-off)算法(比如重试时间用斐波拉契数列、指数式退避、随机退避)，防范累加效应
* 针对于跨服实现方式是遵循原来的还是地图跨服化需要整理
* 针对于公共功能都全服化，需要设计一种分摊中心服压力的方式
* gen_rpc一机多服的支持要优化端口分布
* 针对很多逻辑进程要通过窗口进程发送消息，转成直接向目标进程发送
* 尽量使用进程名，而不是进程ID来发送消息，因为ID会被重用

# 代码说明

## 代码风格
 [中文](https://github.com/feng19/erlang_guidelines)  
 [英文](https://github.com/inaka/erlang_guidelines) 
   
## 原则
* 所有模块要很容被替换掉
* 进程所需要的数据全部放进程内，比如玩家数据放在玩家进程，战斗数据放在地图进程，  
  所需要交换的数据放在ETS里。所以ETS数据的实时性将由各个逻辑层决定
* 所有进程需要的数据定义尽量不要带出本模块

## 一些对erlang的错误认识
[关于erlang很慢的错误认识](http://jlouisramblings.blogspot.com/2013/07/problematic-traits-in-erlang.html)


## record
* m_xxx  内存中(ETS,进程字典)
* r_xxx  进程交互
* p_xxx  数据库


## 函数
* 所有提函数如果是**异步（不会阻塞调用进程）**访问的 都是 xxx_() 否則是 xxx()

 
## 其他的设计
### 战斗
#### 技能 学习、使用、升级  
* 学习和升级在玩家进程来做 
* 被动技能等改变了属性计算，发给地图做
* 使用技能在玩家进程做判断，地图进程计算


#### buff 添加、删除、驱散  
* 全部放在地图进程

#### 装备、宝石等等
* 玩家进程操作， 地图进程计算

#### 战斗计算
* 地图进程来做
    
#### 怪物、宠物AI 、移动、寻路、战斗
#### 副本、活动
* 写一个默认的通用流程; 特殊的自己写
#### 背包  
* 增、删、改、合并、*整理*
* 
#### 其他系统不考虑
          
  
#### 技能
  * 技能类型 角色技能、怪物技能、生活技能、 宠物技能
  * 作用目标类型 buff/触发器/技能、生物 （*天赋技能*）
  * 作用目标关系 敌方、友方、中立
  * 单体、AOE
  * 主动、被动
  * 远程、近身
  *
  * **作用类** 
  * 目标选择方式 （矩形、圆形， 环形，扇形）
  * 作用距离、作用半径
  *
  * 多段伤害
  * 间隔时间、最大次数
  * 伤害数值
  *
  * 技能所带的buff、触发器
  *
  * 技能使用消耗/限制、技能升级、技能学习 、技能点升级、技能书升级、使用技能升级
  * 以及其他的配置，比如天赋技能
  * cd ，技能cd组
    

## 代码目录结构

 ```                                                                                
|   GS_启动.bat                                                                   
|   GS_编译.bat                                                                  
|   readme_todo.md                                                               
|   发布版本.bat                                                                 
|   导出数据库结构.bat                                                           
|   清除日志.bat                                                                                                                                                
|                                                                                
+---center                                                                                                                                                    
+---dbs                                                                                                                                                         
+---deps                                                                         
|   +---cache   内存数据库（废弃）                                                                                                                                         
|   +---dynamic_compile 动态编译                                                                                                                                   
|   +---econfig    ini配置读取                                                                                                                                        
|   +---eep                                                                                                                                                 
|   +---fastlog   日志                                                                                                                                          
|   +---fly     自动编译                                                                                                                                            
|   +---mysql-otp    mysql                                                                                                                                       
|   +---mysql-otp-poolboy                                                                                                                                    
|   +---poolboy     worker pool                                                                                                                                         
|   +---pubs         公共依赖                                                            
|   |   |   rebar.config                                                                                                                               
|   |   +---include                                                              
|   |   |       local_lang.hrl     多语言版本控制                                              
|   |   |       logger.hrl         日志                                              
|   |   |       netconf.hrl        网络配置                                              
|   |   |       pack.hrl                                                         
|   |   |       pub_common.hrl    一些通用的定义                                                
|   |   |       type.hrl          基本类型定义                                               
|   |   |       vector3.hrl       三维坐标                                                                                                                      
|   |   \---src                                                                  
|   |       |   pubs.app.src                                                     
|   |       |   pubs_app.erl                                                     
|   |       |   pubs_sup.erl                                                                                                                       
|   |       +---lib                                                              
|   |       |       background_gc.erl        gc                                    
|   |       |       code_gen.erl                                                 
|   |       |       color.erl                                                    
|   |       |       common_error_logger.erl     error_log                                 
|   |       |       common_error_logger_h.erl      error_log                              
|   |       |       file_ex.erl              file api                                    
|   |       |       gen_server2.erl                                              
|   |       |       gen_serverw.erl        对gen_server/gen_server2的包装                                      
|   |       |       getCfg.erl                                                   
|   |       |       grpc.erl              对rpc的包装                                       
|   |       |       llist.erl                                                    
|   |       |       lqueue.erl                                                   
|   |       |       misc.erl            一些有用的方法集合                                         
|   |       |       pack_byte.erl                                                
|   |       |       pg_local.erl         本地进程组                                        
|   |       |       priority_queue.erl                                           
|   |       |       ps.erl              进程之间发消息的封装                                        
|   |       |       r2_rw_code.erl      用于自动生成 *_rw.erl                                         
|   |       |       ral.erl                                                      
|   |       |       rand_tool.erl      伪随机，种子确定，随机数序列不变                                          
|   |       |       task.erl                                                     
|   |       |       time.erl           时间的封装                                           
|   |       |       uid_gen.erl         uid                                         
|   |       |       vector3.erl       三维坐标操作方法                                           
|   |       |       vm_memory_monitor.erl      内存监控                                                                                                     
|   |       +---log                                                              
|   |       |       loggerS.erl          日志封装，避免和erlang底层自带冲突                                       
|   |       |       log_test.erl                                                                                                                    
|   |       +---net                                                              
|   |       |       behaviour_example.erl                                        
|   |       |       binary_lib.erl       基本类型binary操作                                        
|   |       |       netmsg.erl           网络消息解码、编码、名字、id                                        
|   |       |       netmsg.hrl                                                   
|   |       |       tcp_behaviour.erl   tcp逻辑模块的实例模块                                          
|   |       |       tcp_client.erl                                               
|   |       |       tcp_codec.erl      解码器                                          
|   |       |       tcp_handler.erl    tcp 处理                                           
|   |       |       tcp_listener.erl    listener                                                                                                           
|   |       +---persistent                                                       
|   |       |       db.erl            对数据库操作的封装                                           
|   |       |       db_pool.erl         数据库连接池                                         
|   |       |       mnesia_dynamic.erl                                           
|   |       |       mnesia_starter.erl                                           
|   |       |       mnesia_utils.erl                                             
|   |       |       mysql_pool_test.erl                                                                                                            
|   |       +---resource                                                         
|   |       |   +---config                                                       
|   |       |   +---pack                                                         
|   |       |   |       pack_data.erl                                            
|   |       |   |       player.hrl                                                                                                             
|   |       |   \---protocol                                                     
|   |       \---version                                                          
|   |               version.erl       发布外网版本的版本号管理                                                                                                             
|   +---ranch                                                                                                                                             
|   \---recon                                                                    
|                                                                                
+---game                                                                         
|   |   Emakefile                                                                
|   |   Makefile                  make                                               
|   |   rebar.config              rebar                                                                                                                        
|   +---data                                                                                                                                           
|   |   +---elog               elog  out dir                                                                                                                    
|   |   \---log                log  out dir                                                                                                                         
|   +---ebin                                                                                                                                              
|   +---include                                                                  
|   |       ai_def.hrl           ai定义                                                 
|   |       common_record.hrl    通用record                                                
|   |       db_record.hrl         数据库record                                               
|   |       gdef.hrl              游戏服定义                                               
|   |       map.hrl                地图定义                                              
|   |       mapCfgPrivate.hrl                                                    
|   |       map_unit.hrl          地图上对象的定义                                               
|   |       mem_record.hrl        内存数据库定义                                               
|   |       movement.hrl           移动定义                                              
|   |       player_status.hrl       玩家逻辑状态                                             
|   |       rw_record.hrl          定义自动生成代码的record                                                                                                                 
|   +---scripts                                                                  
|   |       cc_fast.ers      编译脚本                                                    
|   |       cc_game.bat                                                          
|   |       mm.config                                                            
|   |       reload.bat                                                           
|   |       reload.erl                                                           
|   |       sasl.bat                                                             
|   |       saslrb.erl                                                           
|   |       start.bat                                                            
|   |       start.sh                                                             
|   |       stop.bat                                                             
|   |       stop.sh                                                              
|   |       version.ers                                                                                                                                    
|   \---src                                                                      
|       |   game.app.src                                                         
|       |   game.erl                                                             
|       |   game_sup.erl                                                                                                                                
|       +---bak   废弃                                                               
|       |       gs_db_manager.erl                                                
|       |       gs_db_supervisor.erl                                             
|       |       gs_db_worker.erl                                                                                                                       
|       +---config  配置表代码目录                                                                                                                                                                          
|       +---base.core  核心代码                                                               
|       |       gconf.erl    server配置的读写                                                    
|       |       gcore.erl    一些基础功能比如发网络消息、广播、踢人、注册玩家进程等、关闭虚拟机等等                                                     
|       |       mapReader.erl                                                    
|       |       map_root_supervisor.erl    地图所有进程挂到这下面                                      
|       |       serv_alarm.erl            全局数据报警                                       
|       |       serv_alarm_logic.erl      ,,,                                       
|       |       serv_broadcast.erl        全局广播进程                                       
|       |       serv_cache.erl        全局内存缓存                                           
|       |       serv_cache_logic.erl                                             
|       |       serv_loader.erl       全局数据加载器                                           
|       |       serv_loader_logic.erl                                            
|       |       watchdog.erl         看门狗                                                                                                                 
|       +---db                                                                   
|       |       db_handler.erl     数据库逻辑代码   (db otp)                                           
|       |       db_mgr.erl       一个mysql连接池一个mgr                                                
|       |       db_mgr_sup.erl      ,,,                                             
|       |       db_proxy.erl        ,,,                                             
|       |       db_son.erl       数据库工作进程                                                
|       |       db_sql.erl      sql语句集中营                                                 
|       |       db_sup.erl    ,,,                                                                                                                         
|       +---base.core                                                                  
|       |       gen_mod_login.erl   全局登录otp                                             
|       |       gen_mod_map.erl     地图otp (map otp)                                            
|       |       gen_mod_map_creator.erl    地图数据初始化otp                                      
|       |       gen_mod_map_mgr.erl     一个地图对应一个mgr                                         
|       |       map_creator_pub.erl    全局地图数据接口   （任意otp）                                       
|       |       map_mgr_pub.erl       某个地图管理器接口    （玩家otp）                                       
|       |       map_mgr_supervisor.erl  ,,,                                         
|       |       map_pub.erl    地图接口       （ _结束的方法玩家otp; _call 地图otp）                                             
|       |       map_supervisor.erl  ,,,                                             
|       |       mod_login.erl    login逻辑代码   （logint otp）                                             
|       |       mod_player.erl     玩家进程                                              
|       |       player_supervisor.erl                                                                                                                  
|       +---logic.hook                                                                 
|       |       hook_copy.erl       副本事件拦截器     (地图otp)                                       
|       |       hook_map.erl       地图事拦截器     (地图otp)                                           
|       |       hook_player.erl   玩家事件拦截器      (玩家otp)                                                                                                                
|       +---lib                                                                  
|       |   |   lib_cache.erl    所有内存数据接口     （任意otp）                                           
|       |   |   lib_db.erl        db接口          （任意otp）                                     
|       |   |   lib_login.erl      登录接口        （任意otp）                                                                                                                                                               
|       |   +---ai 怪物AI （地图otp）                                                             
|       |   |       ai_state.erl         ai 状态分发器                                        
|       |   |       ai_state_attck.erl     攻击                                      
|       |   |       ai_state_flee.erl       逃跑                                   
|       |   |       ai_state_idle.erl       发呆                                     
|       |   |       ai_state_pursue.erl     追击                                     
|       |   |       ai_transition.erl     ai状态转换分发器                                       
|       |   |       ai_transition_active.erl       主动                              
|       |   |       ai_transition_barbett.erl    炮台                                
|       |   |       ai_transition_lamster.erl    逃跑                                
|       |   |       ai_transition_passive.erl     被动                               
|       |   |       ai_trigger.erl                                                                                                                  
|       |   +---map   （地图otp）                                                           
|       |   |       lib_ai.erl          ai接口                                         
|       |   |       lib_ai_rw.erl      ai私有数据操作（自动生成）                                          
|       |   |       lib_attr_calc.erl     属性计算                                      
|       |   |       lib_battle.erl       战斗                                       
|       |   |       lib_buff.erl        buff                                         
|       |   |       lib_copy.erl         副本                                        
|       |   |       lib_map.erl       地图otp的消息处理                                           
|       |   |       lib_map_priv.erl   地图底层操作                                          
|       |   |       lib_map_rw.erl   地图私有数据操作                                            
|       |   |       lib_map_view.erl  视野管理                                           
|       |   |       lib_move.erl    移动管理                                             
|       |   |       lib_move_rw.erl  移动私有数据操作 （自动生成）                                           
|       |   |       lib_pet.erl   宠物                                               
|       |   |       lib_unit.erl  地图上对象接口                                               
|       |   |       lib_unit_rw.erl 地图上对象私有数据操作类（自动生成）                                                                                                                     
|       |   \---player （玩家otp）                                                           
|       |           lib_player.erl      角色otp的消息处理                                           
|       |           lib_player_alarm.erl   角色数据报警逻辑                                      
|       |           lib_player_bag.erl      背包                                     
|       |           lib_player_base.erl    基础逻辑 （初始化、移动....）                                    
|       |           lib_player_battle.erl  战斗                                      
|       |           lib_player_map_priv.erl  玩家地图基础逻辑（上线、下线、切地图、瞬移、返回之前的地图）                                    
|       |           lib_player_netmsg.erl   网络消息处理                                     
|       |           lib_player_priv.erl     玩家私有逻辑（初始化，登录，加载角色列表，创角，选角，删角，下线）                                     
|       |           lib_player_pub.erl      玩家进程其他逻辑模块可调用的接口                                   
|       |           lib_player_rw.erl      玩家私有数据操作类（自动生成）                                         
|       |           lib_player_save.erl    持久化                                  
|       |           lib_player_skill.erl   技能                                      
|       |           lib_player_sub.erl   周期性触发逻辑（tick, 每秒，每分钟，每小时，每个整点）                                                                                                         
|       +---logic.mapcfgs                                                                                                                                                                                   
|       \---test                                                                                                                                                                                      
+---scripts                                                                                                                                                     
\---sql                                                                          
                                                     
                                                                                 
```        
 

  
  
  
  