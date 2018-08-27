%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 八月 2018 11:47
%%%-------------------------------------------------------------------
-module(cs_share).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_priv.hrl").
-include("team.hrl").

%% API
-export([start/0, sync/1]).
-export([test/1]).


start() ->
    db_share:start(),
    db_share:add_share(cs_share_pub:share_tables()),
    db_share:add_frag_share(cs_share_pub:frag_share_tables(), 1),
    ok.

sync(Node) ->
    ?INFO("sync mnesia to ~p ... ", [Node]),
    true = mne_ex:sync(Node),
    lists:foreach(
        fun({Tab, _Arg}) ->
            ?INFO("\tadd table copy ~-20w to ~p ...", [Tab, Node]),
            mne_ex:add_table_copy(Tab, Node, ram_copies)
        end, cs_share_pub:share_tables()),
    mne_ex:wait_for_tables(),
    ?INFO("sync mnesia to ~p done #", [Node]),
    ok.


test(N) ->
    ?WARN("insert ~p m_team_info ...",[N]) ,
     do_create_n(N),
    ?WARN("insert ~p m_team_info done #",[N]) ,
    ok.

do_create_n(N) when N =< 0 ->
    ok;
do_create_n(N) ->
    write_one_team(),
    do_create_n(N - 1).

write_one_team() ->
    Info = #m_team_info{ teamID = uid_gen:tmp_uid(), leaderID = uid_gen:player_uid()},
    mne_ex:dirty_write(Info),
    ok.



