# toto list

* cache 需要换掉
* 节点互联，换成gen_rpc方式,尽量支持一机多服，不需要改配置
* mnesia的使用尽量放在中心服或者提供一种机制各个服务器可以自动生成
* ~~重新构建dbs的设计，针对上层提供接口，隐藏底层实现~~
* 登录系统提供排队，放到最后来做
* 如果决定采用任意服务器可登录的机制，需要实现管控机制
* 预警策略
* 优化地图玩家、怪物、宠物等储存，遍历等等
* 玩家、宠物战斗相关的数据划分
* ~~mod_??全部转化成纯模块， 将otp剥离转入serv_?~~
* 防加速
* 是否可以将地图上所有的对象(Monster, NPC, Pet, Player) 按分类放入同一个ETS? 
* 玩家帧率控制 消息大小或者*消息量*

# 代码说明

## 代码风格
 [中文](https://github.com/feng19/erlang_guidelines)  
 [英文](https://github.com/inaka/erlang_guidelines) 
   
## 原则
* 所有模块要很容被替换掉
* 进程所需要的数据全部放进程内，比如玩家数据放在玩家进程，战斗数据放在地图进程，  
  所需要交换的数据放在ETS里。所以ETS数据的实时性将由各个逻辑层决定
* 所有进程需要的数据定义尽量不要带出本模块


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
  * 技能使用消耗/限制、技能升级、技能学习
  * 以及其他的配置，比如天赋技能
    

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
|   +---cache                                                                                                                                             
|   +---dynamic_compile                                                                                                                                    
|   +---econfig                                                                                                                                            
|   +---eep                                                                                                                                                 
|   +---fastlog                                                                                                                                             
|   +---fly                                                                                                                                                 
|   +---mysql-otp                                                                                                                                           
|   +---mysql-otp-poolboy                                                                                                                                    
|   +---poolboy                                                                                                                                              
|   +---pubs                                                                     
|   |   |   rebar.config                                                                                                                               
|   |   +---include                                                              
|   |   |       local_lang.hrl                                                   
|   |   |       logger.hrl                                                       
|   |   |       netconf.hrl                                                      
|   |   |       pack.hrl                                                         
|   |   |       pub_common.hrl                                                   
|   |   |       type.hrl                                                         
|   |   |       vector3.hrl                                                                                                                             
|   |   \---src                                                                  
|   |       |   pubs.app.src                                                     
|   |       |   pubs_app.erl                                                     
|   |       |   pubs_sup.erl                                                                                                                       
|   |       +---lib                                                              
|   |       |       background_gc.erl                                            
|   |       |       code_gen.erl                                                 
|   |       |       color.erl                                                    
|   |       |       common_error_logger.erl                                      
|   |       |       common_error_logger_h.erl                                    
|   |       |       file_ex.erl                                                  
|   |       |       gen_server2.erl                                              
|   |       |       gen_serverw.erl                                              
|   |       |       getCfg.erl                                                   
|   |       |       grpc.erl                                                     
|   |       |       llist.erl                                                    
|   |       |       lqueue.erl                                                   
|   |       |       misc.erl                                                     
|   |       |       pack_byte.erl                                                
|   |       |       pg_local.erl                                                 
|   |       |       priority_queue.erl                                           
|   |       |       ps.erl                                                       
|   |       |       r2_rw_code.erl                                               
|   |       |       ral.erl                                                      
|   |       |       rand_tool.erl                                                
|   |       |       task.erl                                                     
|   |       |       time.erl                                                     
|   |       |       uid_gen.erl                                                  
|   |       |       vector3.erl                                                  
|   |       |       vm_memory_monitor.erl                                                                                                           
|   |       +---log                                                              
|   |       |       loggerS.erl                                                  
|   |       |       log_test.erl                                                                                                                    
|   |       +---net                                                              
|   |       |       behaviour_example.erl                                        
|   |       |       binary_lib.erl                                               
|   |       |       netmsg.erl                                                   
|   |       |       netmsg.hrl                                                   
|   |       |       tcp_behaviour.erl                                            
|   |       |       tcp_client.erl                                               
|   |       |       tcp_codec.erl                                                
|   |       |       tcp_handler.erl                                              
|   |       |       tcp_listener.erl                                                                                                               
|   |       +---persistent                                                       
|   |       |       db.erl                                                       
|   |       |       db_pool.erl                                                  
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
|   |               version.erl                                                                                                                    
|   +---ranch                                                                                                                                             
|   \---recon                                                                    
|                                                                                
+---game                                                                         
|   |   Emakefile                                                                
|   |   Makefile                                                                 
|   |   rebar.config                                                                                                                                      
|   +---data                                                                                                                                           
|   |   +---elog                                                                                                                                       
|   |   \---log                                                                                                                                            
|   +---ebin                                                                                                                                              
|   +---include                                                                  
|   |       ai_def.hrl                                                           
|   |       common_record.hrl                                                    
|   |       db_record.hrl                                                        
|   |       gdef.hrl                                                             
|   |       map.hrl                                                              
|   |       mapCfgPrivate.hrl                                                    
|   |       map_unit.hrl                                                         
|   |       mem_record.hrl                                                       
|   |       movement.hrl                                                         
|   |       player_status.hrl                                                    
|   |       rw_record.hrl                                                                                                                                  
|   +---scripts                                                                  
|   |       cc_fast.ers                                                          
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
|       +---bak                                                                  
|       |       gs_db_manager.erl                                                
|       |       gs_db_supervisor.erl                                             
|       |       gs_db_worker.erl                                                                                                                       
|       +---config                                                               
|       |   |   cfg_mapsetting.hrl                                               
|       |   |   cfg_monster.hrl                                                                                                                 
|       |   +---cfg                                                              
|       |   |       cfg.erl                                                      
|       |   |       cfg_chs.erl                                                  
|       |   |       cfg_cht.erl                                                                                                                   
|       |   \---cht                                                              
|       |           cfg_mapsetting_cht.erl                                       
|       |           cfg_monster_cht.erl                                                                                                                
|       +---core                                                                 
|       |       gconf.erl                                                        
|       |       gcore.erl                                                        
|       |       mapReader.erl                                                    
|       |       map_root_supervisor.erl                                          
|       |       serv_alarm.erl                                                   
|       |       serv_alarm_logic.erl                                             
|       |       serv_broadcast.erl                                               
|       |       serv_cache.erl                                                   
|       |       serv_cache_logic.erl                                             
|       |       serv_loader.erl                                                  
|       |       serv_loader_logic.erl                                            
|       |       watchdog.erl                                                                                                                          
|       +---db                                                                   
|       |       db_handler.erl                                                   
|       |       db_mgr.erl                                                       
|       |       db_mgr_sup.erl                                                   
|       |       db_proxy.erl                                                     
|       |       db_son.erl                                                       
|       |       db_sql.erl                                                       
|       |       db_sup.erl                                                                                                                              
|       +---gen                                                                  
|       |       gen_mod_login.erl                                                
|       |       gen_mod_map.erl                                                  
|       |       gen_mod_map_creator.erl                                          
|       |       gen_mod_map_mgr.erl                                              
|       |       map_creator_pub.erl                                              
|       |       map_mgr_pub.erl                                                  
|       |       map_mgr_supervisor.erl                                           
|       |       map_pub.erl                                                      
|       |       map_supervisor.erl                                               
|       |       mod_login.erl                                                    
|       |       mod_player.erl                                                   
|       |       player_supervisor.erl                                                                                                                  
|       +---hook                                                                 
|       |       hook_copy.erl                                                    
|       |       hook_map.erl                                                     
|       |       hook_player.erl                                                                                                                       
|       +---lib                                                                  
|       |   |   lib_cache.erl                                                    
|       |   |   lib_db.erl                                                       
|       |   |   lib_login.erl                                                                                                                                                                             
|       |   +---ai                                                               
|       |   |       ai_state.erl                                                 
|       |   |       ai_state_attck.erl                                           
|       |   |       ai_state_flee.erl                                            
|       |   |       ai_state_idle.erl                                            
|       |   |       ai_state_pursue.erl                                          
|       |   |       ai_transition.erl                                            
|       |   |       ai_transition_active.erl                                     
|       |   |       ai_transition_barbett.erl                                    
|       |   |       ai_transition_lamster.erl                                    
|       |   |       ai_transition_passive.erl                                    
|       |   |       ai_trigger.erl                                                                                                                  
|       |   +---map                                                              
|       |   |       lib_ai.erl                                                   
|       |   |       lib_ai_rw.erl                                                
|       |   |       lib_attr_calc.erl                                            
|       |   |       lib_battle.erl                                               
|       |   |       lib_buff.erl                                                 
|       |   |       lib_copy.erl                                                 
|       |   |       lib_map.erl                                                  
|       |   |       lib_map_priv.erl                                             
|       |   |       lib_map_rw.erl                                               
|       |   |       lib_map_view.erl                                             
|       |   |       lib_move.erl                                                 
|       |   |       lib_move_rw.erl                                              
|       |   |       lib_pet.erl                                                  
|       |   |       lib_unit.erl                                                 
|       |   |       lib_unit_rw.erl                                                                                                                
|       |   \---player                                                           
|       |           lib_player.erl                                               
|       |           lib_player_alarm.erl                                         
|       |           lib_player_bag.erl                                           
|       |           lib_player_base.erl                                          
|       |           lib_player_battle.erl                                        
|       |           lib_player_map_priv.erl                                      
|       |           lib_player_netmsg.erl                                        
|       |           lib_player_priv.erl                                          
|       |           lib_player_pub.erl                                           
|       |           lib_player_rw.erl                                            
|       |           lib_player_save.erl                                          
|       |           lib_player_skill.erl                                         
|       |           lib_player_sub.erl                                                                                                            
|       +---mapcfgs                                                                                                                                                                                   
|       \---test                                                                                                                                                                                      
+---scripts                                                                                                                                                     
\---sql                                                                          
                                                     
                                                                                 
```        
 

  
  
  
  