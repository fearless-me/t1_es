%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%      对recon的封装，方便线上调用
%%% @end
%%% Created : 03. 七月 2018 16:31
%%%-------------------------------------------------------------------
-module(dtool).
-author("mawenhong").

%% API
-export([]).

%% ## cprof 模块调用次数统计
%% ## cover 代码覆盖测试
%% ## xref 交叉引用检查，发现缺失函数
%% ## 代码测试 https://github.com/proper-testing/proper
%% ## dialyzer  静态分析
%%      https://blog.csdn.net/wu545134650/article/details/53005093
%%      https://blog.csdn.net/jq0123/article/details/49795911
%%      https://blog.csdn.net/chen190735341/article/details/38260429

%% dialyzer --build_plt --apps erts kernel stdlib mnesia
%% dialyzer -r ./app/game/ebin -o dialyzer-game.out   --fullpath --dump_callgraph callg.raw  --gui

%% ## Erlang Event Tracer 图形化展示
%% http://www.erlang.org/doc/apps/et/et_intro.html
%% eg.
%% test() ->
%%    {ok, ViewerPid} = et_viewer:start([{title,"Coffee Order"}]),
%%    CollectorPid = et_viewer:get_collector_pid(ViewerPid),
%%    et_collector:report_event(CollectorPid,85,from,to,message,extra_stuff),
%%    et_collector:report_event(CollectorPid,85,from,to,kill,extra_stuff),
%%    et_collector:report_event(CollectorPid,85,from,to,fuck,extra_stuff),
%%    ok.

%% ## dtrace 或者 systemtap




