# toto list
1. cache 需要换掉
2. 节点互联，换成gen_rpc方式,尽量支持一机多服，不需要改配置
3. mnesia的使用尽量放在中心服或者提供一种机制各个服务器可以自动生成
4. 重新构建dbs的设计，针对上层提供接口，隐藏底层实现 (done!)
5. 登录系统提供排队，放到最后来做
6. 如果决定采用任意服务器可登录的机制，需要实现管控机制
7. 预警策略
8. 优化地图玩家、怪物、宠物等储存，遍历等等

# 代码说明

## 代码风格
 [中文](https://github.com/feng19/erlang_guidelines)  
 [英文](https://github.com/inaka/erlang_guidelines) 
   
## 原则
* 所有模块要很容被替换掉

## record
* m_xxx  内存中(ETS,进程字典)
* r_xxx  进程交互
* p_xxx  数据库

## 函数
* 所有提函数如果是**异步**访问的 都是 xxx_() 否則是 xxx()

