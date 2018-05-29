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

-export([action_/2]).
-export([action_/3]).

%% API
action_(MsgId, Msg) ->
    ps:send_with_from(mod_db, transfer_to_db, {MsgId, Msg}).

action_(MsgId, Msg, FromPid) ->
    ps:send_with_from(mod_db, transfer_to_db, {MsgId, Msg}, FromPid).

