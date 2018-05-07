
-module(tcp_client).
-author("Administrator").
-include("netmsg.hrl").
-include("netconf.hrl").
-include("logger.hrl").

%% API
-export([connect/1]).

connect(Port)->
	tcp_codec:init(#net_conf{}),
	{ok,Socket} = inet_tcp:connect({127,0,0,1}, Port, [{active, false}]),
	Msg1 = #pk_LS2U_LoginQue{currentNumber = 999},
	Msg2 = #pk_LS2U_LoginResult{result = 0,  accountID = 99999999999, identity = "is null", msg = "hello"},
	{_Bytes1, IoList1} = tcp_codec:encode(Msg1),
	{_Bytes2, IoList2} = tcp_codec:encode(Msg2),
	tcp_codec:decode(fun(X)-> io:format("~p~n",[X]) end,Socket, iolist_to_binary(IoList2 ++ IoList1)),
%%	?DEBUG("~p bytes,iolist:~p",[Bytes, IoList]),
	ranch_tcp:send(Socket, IoList2 ++ IoList2 ++ IoList2 ++ IoList2 ++ IoList2 ++ IoList2 ++ IoList1),
	ok.
