%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 七月 2018 10:56
%%%-------------------------------------------------------------------
-module(lib_skill).
-author("mawenhong").

%% API
-export([test/0]).

test() ->
    {ok, ViewerPid} = et_viewer:start([{title,"Coffee Order"}]),
    CollectorPid = et_viewer:get_collector_pid(ViewerPid),
    et_collector:report_event(CollectorPid,85,from,to,message,extra_stuff),
    et_collector:report_event(CollectorPid,85,from,to,kill,extra_stuff),
    et_collector:report_event(CollectorPid,85,from,to,fuck,extra_stuff),
    ok.
