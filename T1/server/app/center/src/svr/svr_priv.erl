%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 十月 2017 10:12
%%%-------------------------------------------------------------------
-module(svr_priv).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_priv.hrl").

%% API
-export([
    nodedown/2, sync/0
]).

-export([get_sid/0, get_from_pid/0, set_id_pid/2]).


%%-------------------------------------------------------------------
get_sid()-> case get(serverID) of undefined -> 0; V -> V end.
get_from_pid()-> case get(serverPid) of undefined -> 0; V -> V end.
set_id_pid(Sid, FromPid)->
    put(serverPid, FromPid),
    put(serverID, Sid).
%%-------------------------------------------------------------------


sync() ->
    Sid = get_sid(),
    Node = erlang:node(get_from_pid()),
    ?WARN("server[~p]sync start...", [Node]),
    cs_cache:add_to_check(Sid),
    cs_interface:send_msg_2_server_with_sid(Sid, {syncAllData, self()}),
    ps:send_with_from(get_from_pid(), syncAllData),
    cs_share:sync(Node),
    sync_over(Node, Sid),
    ok.



sync_over(GSNode, Sid) ->
    [Info] = mne_ex:dirty_read(m_server_info, Sid),
    mne_ex:dirty_write(Info#m_server_info{status = ?SEVER_STATUS_DONE}),
    ?WARN("server[~p] sync done #", [GSNode]),
    ps:send_with_from(?CS_SVR_MGR_OTP, allReadyNow, {Sid}),
    catch all_ready(Sid),
    erlang:garbage_collect(self()),
    ok.

all_ready(_ServerID) ->
    ps:send_with_from(get_from_pid(), startNow),
    Node = erlang:node(get_from_pid()),
    ?WARN("####[~p][~p][ok]####", [Node, misc:registered_name()]),
    ok.


%%-------------------------------------------------------------------
nodedown(GSNode, OtpName) ->
    ps:send(?CS_SVR_MGR_OTP, nodedown, {GSNode, svr_priv:get_sid()}),
    ?WARN("server[~p], stop worker[~p][~p] now", [GSNode, self(), OtpName]),
    ok.

