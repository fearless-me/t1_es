%% @author zhongyuanwei
%% @doc @todo Add description to dbSendMsg.
-module(dbSendMsg).

-include("dbsInc.hrl").
-include("gsDef.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	sendMsg2DBPID/2
]).

-spec sendMsg2DBPID(MsgID,Msg) -> ok when
		  MsgID :: atom(), Msg :: tuple().
sendMsg2DBPID(MsgID,Msg) when erlang:is_atom(MsgID) ->
	%%?INFO("dbs send msg to db"),
	psMgr:sendMsg2PS(?PsNameDB,toDBOtp,{MsgID,Msg}),
	ok;
sendMsg2DBPID(MsgID,Msg) ->
	?ERROR("Error sendMsg2DBPID[~p,~p]",[MsgID,Msg]),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================


