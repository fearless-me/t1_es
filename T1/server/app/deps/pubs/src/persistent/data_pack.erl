%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 十一月 2018 14:00
%%%-------------------------------------------------------------------
-module(data_pack).
-author("Administrator").
-include("logger.hrl").

-record(buff,{id,time,layer,source,lifetime}).
-record(task,{id,type,sub_type,p1,p2,p3,p4}).
-record(skill, {id,level,cd,p1,p2,p3}).
-record(full_data,{buff, task, skill}).

%% API
-export([marshal/1, unmarshal/1]).

%%
marshal(Data) -> erlang:term_to_binary(Data).
unmarshal(Bin) -> erlang:binary_to_term(Bin).

test()->
    version:getVersion(),
    ok.