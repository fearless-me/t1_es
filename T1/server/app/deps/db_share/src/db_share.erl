%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 八月 2018 10:39
%%%-------------------------------------------------------------------
-module(db_share).
-author("mawenhong").
-include("logger.hrl").

%% API
-define(DYNAMIC_MOD, share_name_mod).
-export([
    start/0, 
    add_share/1, add_frag_share/2,
    get_share_table/2
]).


%%-------------------------------------------------------------------
start() ->
    true = misc:start_all_app(mnesia),
    true = misc:start_app(db_share).

%%-------------------------------------------------------------------
-spec add_share(Tabs :: [{Name::atom(), [mnesia:create_option()]}])  -> ok.
add_share(Tabs) ->
    ?INFO("share table ..."),
    lists:foreach(fun(Table)-> add_one_share(Table) end, Tabs),
    ?INFO("share table done #"),
    ok.

%%-------------------------------------------------------------------
-spec add_frag_share(Tabs :: [{Name::atom(), [mnesia:create_option()]}], Sid :: integer())  -> ok.
add_frag_share(Tabs, Sid) ->
    ?INFO("frag share table ..."),
    lists:foreach(fun(Table)-> add_one_frag_share(Table, Sid) end, Tabs),
    ?INFO("frag share table done #"),
    ok.

%%-------------------------------------------------------------------
-spec get_share_table(Tab :: atom(), Sid :: integer()) -> atom() | undefined.
get_share_table(Tab, Sid) ->
    db_share_srv:get_tab(Sid, Tab).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
add_one_share({Tab, Arg}) ->
    ?INFO("\tadd share table [~p] ...", [Tab]),
    db_share_srv:add_tab(0, Tab, Tab),
    true = mne_ex:create_table(Tab, Arg),
    ?INFO("\tadd share table [~p] done #", [Tab]),
    ok.

add_one_frag_share({Tab, Arg}, Sid) ->
    TableName = misc:create_atom(Tab, [Sid]),
    ?INFO("\tadd frag share table [~p] ...", [TableName]),
    db_share_srv:add_tab(Sid, Tab, TableName),
    true = mne_ex:create_table(TableName, Arg),
    ?INFO("\tadd frag share table [~p] done #", [TableName]),
    ok.
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------





%%dynamic_mod(Tabs, Sid) ->
%%    ok.
