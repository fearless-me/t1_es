%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 八月 2018 11:47
%%%-------------------------------------------------------------------
-module(lib_cs_share).
-author("mawenhong").

%% API
-export([start/0]).

-record(s_info,{id,name,node}).
-record(f_info,{id,name,node}).
-define(STORE_ARG, {storage_properties, [{ets, [ {read_concurrency, true},{write_concurrency, true}]}]} ).


frag_share_tables() ->
    Node = node(),
    [
        {f_info,    [{ram_copies, [Node]}, {attributes, record_info(fields, f_info)}, ?STORE_ARG]}
    ].

share_tables() ->
    Node = node(),
    [
        {s_info,    [{ram_copies, [Node]}, {attributes, record_info(fields, s_info)}, ?STORE_ARG]}
    ].

start() ->
    db_share:start(),
    db_share:add_share(share_tables()),
    db_share:add_frag_share(frag_share_tables(), 1),
    ok.

