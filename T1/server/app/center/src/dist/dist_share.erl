%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 八月 2018 8:42
%%%-------------------------------------------------------------------
-module(dist_share).
-author("mawenhong").

%% API
-export([start/0, restart/0]).


start() ->
    true = mne_ex:start(),
    ok.

restart() ->
    mne_ex:stop(),
    true = mne_ex:start(),
    ok.