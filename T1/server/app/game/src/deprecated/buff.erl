%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 十一月 2018 16:47
%%%-------------------------------------------------------------------
-module(buff).
-author("Administrator").
-include("pub_def.hrl").
-include("gs_cache.hrl").
-include("netmsg.hrl").
-include("combat.hrl").
-include("combat_buff.hrl").
-include("cfg_buff.hrl").

%% API
-export([
    new/6,
    marshal/1,
    get_cfg/1
]).

new(_Uid, BuffId, Level, SrcUid, Layer, LifeTime) ->
    Now = misc_time:milli_seconds(),
    #buffCfg{lifeTime = CfgLifeTime} = buff:get_cfg(BuffId),
    RealLifeTime = ?if_else(LifeTime == 0, CfgLifeTime, LifeTime),
    #m_buff{buff_id = BuffId, lifetime = Now + RealLifeTime, level = Level, source = SrcUid, layer = Layer, latest = Now}.


marshal(#m_buff{
    buff_id = BuffId,
    lifetime = Lifetime,
    level = Level,
    layer = Layer
}) ->
    #pk_BuffInfo{buff_id = BuffId, lifetime = Lifetime, level = Level, layer = Layer}.

get_cfg(BuffId) ->
    case getCfg:getCfgByArgs(cfg_buff, BuffId) of
        #buffCfg{} = Cfg -> Cfg;
        _Any -> undefined
    end.
