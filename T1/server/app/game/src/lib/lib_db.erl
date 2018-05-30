%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 五月 2018 14:22
%%%-------------------------------------------------------------------
-module(lib_db).
-author("mawenhong").

-export([action_/3]).
-export([action_/4]).

%% API
action_(HashKey, MsgId, Msg) ->
    Mgr = db_proxy:checkout_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, self()}).

action_(HashKey, MsgId, Msg, FromPid) ->
    Mgr = db_proxy:checkout_(HashKey),
    db_mgr:scheduler_(Mgr, HashKey, {MsgId, Msg, FromPid}).

